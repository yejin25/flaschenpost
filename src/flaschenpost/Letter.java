package flaschenpost;

public class Letter {
    private String letterNumber;
    private String context;
    private String font;
    private String color;
    private String group;

    public Letter() {

    }

    public Letter(String context, String font, String color, String group) {
        this.context = context;
        this.font = font;
        this.color = color;
        this.group = group;
    }

    public String getLetterNumber() {
        return letterNumber;
    }

    public void setLetterNumber(String letterNumber) {
        this.letterNumber = letterNumber;
    }

    public String getContext() {
        return context;
    }

    public void setContext(String context) {
        this.context = context;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getFont() {
        return font;
    }

    public void setFont(String font) {
        this.font = font;
    }

    public String getGroup() {
        return group;
    }

    public void setGroup(String group) {
        this.group = group;
    }
}