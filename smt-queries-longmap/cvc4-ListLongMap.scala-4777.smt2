; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65726 () Bool)

(assert start!65726)

(declare-fun b!754460 () Bool)

(declare-fun res!509807 () Bool)

(declare-fun e!420771 () Bool)

(assert (=> b!754460 (=> (not res!509807) (not e!420771))))

(declare-datatypes ((array!41899 0))(
  ( (array!41900 (arr!20063 (Array (_ BitVec 32) (_ BitVec 64))) (size!20484 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41899)

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41899 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!754460 (= res!509807 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!420764 () Bool)

(declare-fun b!754461 () Bool)

(declare-datatypes ((SeekEntryResult!7663 0))(
  ( (MissingZero!7663 (index!33020 (_ BitVec 32))) (Found!7663 (index!33021 (_ BitVec 32))) (Intermediate!7663 (undefined!8475 Bool) (index!33022 (_ BitVec 32)) (x!63925 (_ BitVec 32))) (Undefined!7663) (MissingVacant!7663 (index!33023 (_ BitVec 32))) )
))
(declare-fun lt!335756 () SeekEntryResult!7663)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41899 (_ BitVec 32)) SeekEntryResult!7663)

(assert (=> b!754461 (= e!420764 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20063 a!3186) j!159) a!3186 mask!3328) lt!335756))))

(declare-fun b!754462 () Bool)

(declare-fun e!420763 () Bool)

(declare-fun e!420769 () Bool)

(assert (=> b!754462 (= e!420763 (not e!420769))))

(declare-fun res!509824 () Bool)

(assert (=> b!754462 (=> res!509824 e!420769)))

(declare-fun lt!335761 () SeekEntryResult!7663)

(assert (=> b!754462 (= res!509824 (or (not (is-Intermediate!7663 lt!335761)) (bvslt x!1131 (x!63925 lt!335761)) (not (= x!1131 (x!63925 lt!335761))) (not (= index!1321 (index!33022 lt!335761)))))))

(declare-fun e!420770 () Bool)

(assert (=> b!754462 e!420770))

(declare-fun res!509814 () Bool)

(assert (=> b!754462 (=> (not res!509814) (not e!420770))))

(declare-fun lt!335765 () SeekEntryResult!7663)

(declare-fun lt!335764 () SeekEntryResult!7663)

(assert (=> b!754462 (= res!509814 (= lt!335765 lt!335764))))

(assert (=> b!754462 (= lt!335764 (Found!7663 j!159))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41899 (_ BitVec 32)) SeekEntryResult!7663)

(assert (=> b!754462 (= lt!335765 (seekEntryOrOpen!0 (select (arr!20063 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41899 (_ BitVec 32)) Bool)

(assert (=> b!754462 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!26032 0))(
  ( (Unit!26033) )
))
(declare-fun lt!335762 () Unit!26032)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41899 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26032)

(assert (=> b!754462 (= lt!335762 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!754463 () Bool)

(declare-fun res!509817 () Bool)

(declare-fun e!420768 () Bool)

(assert (=> b!754463 (=> (not res!509817) (not e!420768))))

(declare-datatypes ((List!14065 0))(
  ( (Nil!14062) (Cons!14061 (h!15133 (_ BitVec 64)) (t!20380 List!14065)) )
))
(declare-fun arrayNoDuplicates!0 (array!41899 (_ BitVec 32) List!14065) Bool)

(assert (=> b!754463 (= res!509817 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14062))))

(declare-fun b!754464 () Bool)

(declare-fun res!509810 () Bool)

(declare-fun e!420772 () Bool)

(assert (=> b!754464 (=> (not res!509810) (not e!420772))))

(assert (=> b!754464 (= res!509810 e!420764)))

(declare-fun c!82708 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!754464 (= c!82708 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!754465 () Bool)

(assert (=> b!754465 (= e!420771 e!420768)))

(declare-fun res!509823 () Bool)

(assert (=> b!754465 (=> (not res!509823) (not e!420768))))

(declare-fun lt!335763 () SeekEntryResult!7663)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!754465 (= res!509823 (or (= lt!335763 (MissingZero!7663 i!1173)) (= lt!335763 (MissingVacant!7663 i!1173))))))

(assert (=> b!754465 (= lt!335763 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!754466 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41899 (_ BitVec 32)) SeekEntryResult!7663)

(assert (=> b!754466 (= e!420770 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20063 a!3186) j!159) a!3186 mask!3328) lt!335764))))

(declare-fun b!754467 () Bool)

(declare-fun e!420762 () Bool)

(declare-fun lt!335760 () SeekEntryResult!7663)

(assert (=> b!754467 (= e!420762 (= lt!335765 lt!335760))))

(declare-fun b!754469 () Bool)

(declare-fun e!420765 () Bool)

(assert (=> b!754469 (= e!420765 true)))

(assert (=> b!754469 e!420762))

(declare-fun res!509820 () Bool)

(assert (=> b!754469 (=> (not res!509820) (not e!420762))))

(declare-fun lt!335754 () (_ BitVec 64))

(assert (=> b!754469 (= res!509820 (= lt!335754 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!335759 () Unit!26032)

(declare-fun e!420766 () Unit!26032)

(assert (=> b!754469 (= lt!335759 e!420766)))

(declare-fun c!82707 () Bool)

(assert (=> b!754469 (= c!82707 (= lt!335754 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!754470 () Bool)

(assert (=> b!754470 (= e!420768 e!420772)))

(declare-fun res!509818 () Bool)

(assert (=> b!754470 (=> (not res!509818) (not e!420772))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!754470 (= res!509818 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20063 a!3186) j!159) mask!3328) (select (arr!20063 a!3186) j!159) a!3186 mask!3328) lt!335756))))

(assert (=> b!754470 (= lt!335756 (Intermediate!7663 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!754471 () Bool)

(declare-fun res!509822 () Bool)

(assert (=> b!754471 (=> (not res!509822) (not e!420771))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!754471 (= res!509822 (validKeyInArray!0 k!2102))))

(declare-fun b!754472 () Bool)

(assert (=> b!754472 (= e!420764 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20063 a!3186) j!159) a!3186 mask!3328) (Found!7663 j!159)))))

(declare-fun b!754473 () Bool)

(declare-fun e!420767 () Bool)

(assert (=> b!754473 (= e!420767 e!420765)))

(declare-fun res!509821 () Bool)

(assert (=> b!754473 (=> res!509821 e!420765)))

(declare-fun lt!335755 () (_ BitVec 64))

(assert (=> b!754473 (= res!509821 (= lt!335754 lt!335755))))

(assert (=> b!754473 (= lt!335754 (select (store (arr!20063 a!3186) i!1173 k!2102) index!1321))))

(declare-fun b!754474 () Bool)

(declare-fun res!509815 () Bool)

(assert (=> b!754474 (=> (not res!509815) (not e!420762))))

(declare-fun lt!335757 () array!41899)

(assert (=> b!754474 (= res!509815 (= (seekEntryOrOpen!0 lt!335755 lt!335757 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!335755 lt!335757 mask!3328)))))

(declare-fun b!754475 () Bool)

(declare-fun Unit!26034 () Unit!26032)

(assert (=> b!754475 (= e!420766 Unit!26034)))

(declare-fun b!754476 () Bool)

(assert (=> b!754476 (= e!420772 e!420763)))

(declare-fun res!509819 () Bool)

(assert (=> b!754476 (=> (not res!509819) (not e!420763))))

(declare-fun lt!335758 () SeekEntryResult!7663)

(assert (=> b!754476 (= res!509819 (= lt!335758 lt!335761))))

(assert (=> b!754476 (= lt!335761 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!335755 lt!335757 mask!3328))))

(assert (=> b!754476 (= lt!335758 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!335755 mask!3328) lt!335755 lt!335757 mask!3328))))

(assert (=> b!754476 (= lt!335755 (select (store (arr!20063 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!754476 (= lt!335757 (array!41900 (store (arr!20063 a!3186) i!1173 k!2102) (size!20484 a!3186)))))

(declare-fun res!509812 () Bool)

(assert (=> start!65726 (=> (not res!509812) (not e!420771))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65726 (= res!509812 (validMask!0 mask!3328))))

(assert (=> start!65726 e!420771))

(assert (=> start!65726 true))

(declare-fun array_inv!15859 (array!41899) Bool)

(assert (=> start!65726 (array_inv!15859 a!3186)))

(declare-fun b!754468 () Bool)

(declare-fun res!509809 () Bool)

(assert (=> b!754468 (=> (not res!509809) (not e!420771))))

(assert (=> b!754468 (= res!509809 (and (= (size!20484 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20484 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20484 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!754477 () Bool)

(declare-fun res!509825 () Bool)

(assert (=> b!754477 (=> (not res!509825) (not e!420771))))

(assert (=> b!754477 (= res!509825 (validKeyInArray!0 (select (arr!20063 a!3186) j!159)))))

(declare-fun b!754478 () Bool)

(declare-fun Unit!26035 () Unit!26032)

(assert (=> b!754478 (= e!420766 Unit!26035)))

(assert (=> b!754478 false))

(declare-fun b!754479 () Bool)

(declare-fun res!509811 () Bool)

(assert (=> b!754479 (=> (not res!509811) (not e!420768))))

(assert (=> b!754479 (= res!509811 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20484 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20484 a!3186))))))

(declare-fun b!754480 () Bool)

(declare-fun res!509808 () Bool)

(assert (=> b!754480 (=> (not res!509808) (not e!420772))))

(assert (=> b!754480 (= res!509808 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20063 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!754481 () Bool)

(assert (=> b!754481 (= e!420769 e!420767)))

(declare-fun res!509813 () Bool)

(assert (=> b!754481 (=> res!509813 e!420767)))

(assert (=> b!754481 (= res!509813 (not (= lt!335760 lt!335764)))))

(assert (=> b!754481 (= lt!335760 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20063 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!754482 () Bool)

(declare-fun res!509816 () Bool)

(assert (=> b!754482 (=> (not res!509816) (not e!420768))))

(assert (=> b!754482 (= res!509816 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(assert (= (and start!65726 res!509812) b!754468))

(assert (= (and b!754468 res!509809) b!754477))

(assert (= (and b!754477 res!509825) b!754471))

(assert (= (and b!754471 res!509822) b!754460))

(assert (= (and b!754460 res!509807) b!754465))

(assert (= (and b!754465 res!509823) b!754482))

(assert (= (and b!754482 res!509816) b!754463))

(assert (= (and b!754463 res!509817) b!754479))

(assert (= (and b!754479 res!509811) b!754470))

(assert (= (and b!754470 res!509818) b!754480))

(assert (= (and b!754480 res!509808) b!754464))

(assert (= (and b!754464 c!82708) b!754461))

(assert (= (and b!754464 (not c!82708)) b!754472))

(assert (= (and b!754464 res!509810) b!754476))

(assert (= (and b!754476 res!509819) b!754462))

(assert (= (and b!754462 res!509814) b!754466))

(assert (= (and b!754462 (not res!509824)) b!754481))

(assert (= (and b!754481 (not res!509813)) b!754473))

(assert (= (and b!754473 (not res!509821)) b!754469))

(assert (= (and b!754469 c!82707) b!754478))

(assert (= (and b!754469 (not c!82707)) b!754475))

(assert (= (and b!754469 res!509820) b!754474))

(assert (= (and b!754474 res!509815) b!754467))

(declare-fun m!702903 () Bool)

(assert (=> b!754472 m!702903))

(assert (=> b!754472 m!702903))

(declare-fun m!702905 () Bool)

(assert (=> b!754472 m!702905))

(declare-fun m!702907 () Bool)

(assert (=> b!754476 m!702907))

(declare-fun m!702909 () Bool)

(assert (=> b!754476 m!702909))

(declare-fun m!702911 () Bool)

(assert (=> b!754476 m!702911))

(assert (=> b!754476 m!702907))

(declare-fun m!702913 () Bool)

(assert (=> b!754476 m!702913))

(declare-fun m!702915 () Bool)

(assert (=> b!754476 m!702915))

(declare-fun m!702917 () Bool)

(assert (=> b!754465 m!702917))

(assert (=> b!754462 m!702903))

(assert (=> b!754462 m!702903))

(declare-fun m!702919 () Bool)

(assert (=> b!754462 m!702919))

(declare-fun m!702921 () Bool)

(assert (=> b!754462 m!702921))

(declare-fun m!702923 () Bool)

(assert (=> b!754462 m!702923))

(assert (=> b!754461 m!702903))

(assert (=> b!754461 m!702903))

(declare-fun m!702925 () Bool)

(assert (=> b!754461 m!702925))

(assert (=> b!754470 m!702903))

(assert (=> b!754470 m!702903))

(declare-fun m!702927 () Bool)

(assert (=> b!754470 m!702927))

(assert (=> b!754470 m!702927))

(assert (=> b!754470 m!702903))

(declare-fun m!702929 () Bool)

(assert (=> b!754470 m!702929))

(declare-fun m!702931 () Bool)

(assert (=> start!65726 m!702931))

(declare-fun m!702933 () Bool)

(assert (=> start!65726 m!702933))

(declare-fun m!702935 () Bool)

(assert (=> b!754460 m!702935))

(assert (=> b!754466 m!702903))

(assert (=> b!754466 m!702903))

(declare-fun m!702937 () Bool)

(assert (=> b!754466 m!702937))

(declare-fun m!702939 () Bool)

(assert (=> b!754480 m!702939))

(assert (=> b!754477 m!702903))

(assert (=> b!754477 m!702903))

(declare-fun m!702941 () Bool)

(assert (=> b!754477 m!702941))

(assert (=> b!754473 m!702913))

(declare-fun m!702943 () Bool)

(assert (=> b!754473 m!702943))

(assert (=> b!754481 m!702903))

(assert (=> b!754481 m!702903))

(assert (=> b!754481 m!702905))

(declare-fun m!702945 () Bool)

(assert (=> b!754471 m!702945))

(declare-fun m!702947 () Bool)

(assert (=> b!754482 m!702947))

(declare-fun m!702949 () Bool)

(assert (=> b!754463 m!702949))

(declare-fun m!702951 () Bool)

(assert (=> b!754474 m!702951))

(declare-fun m!702953 () Bool)

(assert (=> b!754474 m!702953))

(push 1)

