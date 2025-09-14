package iuh.fit.phamngochung_tuan03.modal;

public enum Hobby {
    DRAWING("Drawing"),
    SINGING("Singing"),
    DANCING("Dancing"),
    SKETCHING("Sketching"),
    OTHERS("Others");

    private final String displayName;

    Hobby(String displayName) {
        this.displayName = displayName;
    }

    public String getDisplayName() {
        return displayName;
    }
}
