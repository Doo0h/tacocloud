package tacos;

import lombok.Data;
import org.springframework.data.annotation.Id;
import org.springframework.data.annotation.PersistenceConstructor;
import org.springframework.data.mongodb.core.mapping.Document;

@Data
@Document(collection = "ingredients")
public class Ingredient {

  @Id
  private final String id;
  private final String name;
  private final Type type;

  @PersistenceConstructor
  public Ingredient(String id, String name, Type type) {
    this.id = id;
    this.name = name;
    this.type = type;
  }

  // 기본 생성자 제거

  public enum Type {
    WRAP, PROTEIN, VEGGIES, CHEESE, SAUCE
  }

}
