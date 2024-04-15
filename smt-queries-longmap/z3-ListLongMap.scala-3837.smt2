; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52760 () Bool)

(assert start!52760)

(declare-fun b!575102 () Bool)

(declare-fun e!330891 () Bool)

(assert (=> b!575102 (= e!330891 true)))

(declare-datatypes ((SeekEntryResult!5686 0))(
  ( (MissingZero!5686 (index!24971 (_ BitVec 32))) (Found!5686 (index!24972 (_ BitVec 32))) (Intermediate!5686 (undefined!6498 Bool) (index!24973 (_ BitVec 32)) (x!53874 (_ BitVec 32))) (Undefined!5686) (MissingVacant!5686 (index!24974 (_ BitVec 32))) )
))
(declare-fun lt!262717 () SeekEntryResult!5686)

(declare-fun lt!262726 () SeekEntryResult!5686)

(assert (=> b!575102 (= lt!262717 lt!262726)))

(declare-fun lt!262724 () SeekEntryResult!5686)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!35914 0))(
  ( (array!35915 (arr!17240 (Array (_ BitVec 32) (_ BitVec 64))) (size!17605 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35914)

(declare-datatypes ((Unit!18060 0))(
  ( (Unit!18061) )
))
(declare-fun lt!262713 () Unit!18060)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!35914 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18060)

(assert (=> b!575102 (= lt!262713 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!3118 i!1132 k0!1914 j!142 (x!53874 lt!262724) (index!24973 lt!262724) (index!24973 lt!262724) mask!3119))))

(declare-fun b!575103 () Bool)

(declare-fun e!330888 () Bool)

(declare-fun e!330890 () Bool)

(assert (=> b!575103 (= e!330888 e!330890)))

(declare-fun res!363665 () Bool)

(assert (=> b!575103 (=> (not res!363665) (not e!330890))))

(declare-fun lt!262716 () array!35914)

(declare-fun lt!262719 () (_ BitVec 32))

(declare-fun lt!262725 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35914 (_ BitVec 32)) SeekEntryResult!5686)

(assert (=> b!575103 (= res!363665 (= lt!262724 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!262719 lt!262725 lt!262716 mask!3119)))))

(declare-fun lt!262722 () (_ BitVec 32))

(assert (=> b!575103 (= lt!262724 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!262722 (select (arr!17240 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!575103 (= lt!262719 (toIndex!0 lt!262725 mask!3119))))

(assert (=> b!575103 (= lt!262725 (select (store (arr!17240 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!575103 (= lt!262722 (toIndex!0 (select (arr!17240 a!3118) j!142) mask!3119))))

(assert (=> b!575103 (= lt!262716 (array!35915 (store (arr!17240 a!3118) i!1132 k0!1914) (size!17605 a!3118)))))

(declare-fun b!575104 () Bool)

(declare-fun res!363663 () Bool)

(assert (=> b!575104 (=> (not res!363663) (not e!330888))))

(declare-datatypes ((List!11359 0))(
  ( (Nil!11356) (Cons!11355 (h!12394 (_ BitVec 64)) (t!17578 List!11359)) )
))
(declare-fun arrayNoDuplicates!0 (array!35914 (_ BitVec 32) List!11359) Bool)

(assert (=> b!575104 (= res!363663 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11356))))

(declare-fun b!575105 () Bool)

(declare-fun res!363666 () Bool)

(declare-fun e!330889 () Bool)

(assert (=> b!575105 (=> (not res!363666) (not e!330889))))

(assert (=> b!575105 (= res!363666 (and (= (size!17605 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17605 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17605 a!3118)) (not (= i!1132 j!142))))))

(declare-fun res!363668 () Bool)

(assert (=> start!52760 (=> (not res!363668) (not e!330889))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52760 (= res!363668 (validMask!0 mask!3119))))

(assert (=> start!52760 e!330889))

(assert (=> start!52760 true))

(declare-fun array_inv!13123 (array!35914) Bool)

(assert (=> start!52760 (array_inv!13123 a!3118)))

(declare-fun b!575106 () Bool)

(declare-fun e!330887 () Bool)

(declare-fun e!330885 () Bool)

(assert (=> b!575106 (= e!330887 e!330885)))

(declare-fun res!363669 () Bool)

(assert (=> b!575106 (=> res!363669 e!330885)))

(declare-fun lt!262720 () (_ BitVec 64))

(assert (=> b!575106 (= res!363669 (or (= lt!262720 (select (arr!17240 a!3118) j!142)) (= lt!262720 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!575106 (= lt!262720 (select (arr!17240 a!3118) (index!24973 lt!262724)))))

(declare-fun b!575107 () Bool)

(declare-fun res!363661 () Bool)

(assert (=> b!575107 (=> (not res!363661) (not e!330888))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35914 (_ BitVec 32)) Bool)

(assert (=> b!575107 (= res!363661 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!575108 () Bool)

(declare-fun res!363660 () Bool)

(assert (=> b!575108 (=> (not res!363660) (not e!330889))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!575108 (= res!363660 (validKeyInArray!0 (select (arr!17240 a!3118) j!142)))))

(declare-fun b!575109 () Bool)

(declare-fun res!363667 () Bool)

(assert (=> b!575109 (=> (not res!363667) (not e!330889))))

(declare-fun arrayContainsKey!0 (array!35914 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!575109 (= res!363667 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!575110 () Bool)

(assert (=> b!575110 (= e!330885 e!330891)))

(declare-fun res!363662 () Bool)

(assert (=> b!575110 (=> res!363662 e!330891)))

(declare-fun lt!262715 () SeekEntryResult!5686)

(assert (=> b!575110 (= res!363662 (or (bvslt (index!24973 lt!262724) #b00000000000000000000000000000000) (bvsge (index!24973 lt!262724) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsgt (x!53874 lt!262724) #b01111111111111111111111111111110) (bvslt (x!53874 lt!262724) #b00000000000000000000000000000000) (not (= lt!262720 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (store (arr!17240 a!3118) i!1132 k0!1914) (index!24973 lt!262724)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!262717 lt!262715))))))

(declare-fun lt!262721 () SeekEntryResult!5686)

(assert (=> b!575110 (= lt!262721 lt!262726)))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35914 (_ BitVec 32)) SeekEntryResult!5686)

(assert (=> b!575110 (= lt!262726 (seekKeyOrZeroReturnVacant!0 (x!53874 lt!262724) (index!24973 lt!262724) (index!24973 lt!262724) lt!262725 lt!262716 mask!3119))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35914 (_ BitVec 32)) SeekEntryResult!5686)

(assert (=> b!575110 (= lt!262721 (seekEntryOrOpen!0 lt!262725 lt!262716 mask!3119))))

(declare-fun lt!262718 () SeekEntryResult!5686)

(assert (=> b!575110 (= lt!262718 lt!262717)))

(assert (=> b!575110 (= lt!262717 (seekKeyOrZeroReturnVacant!0 (x!53874 lt!262724) (index!24973 lt!262724) (index!24973 lt!262724) (select (arr!17240 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!575111 () Bool)

(assert (=> b!575111 (= e!330890 (not e!330887))))

(declare-fun res!363664 () Bool)

(assert (=> b!575111 (=> res!363664 e!330887)))

(get-info :version)

(assert (=> b!575111 (= res!363664 (or (undefined!6498 lt!262724) (not ((_ is Intermediate!5686) lt!262724))))))

(assert (=> b!575111 (= lt!262718 lt!262715)))

(assert (=> b!575111 (= lt!262715 (Found!5686 j!142))))

(assert (=> b!575111 (= lt!262718 (seekEntryOrOpen!0 (select (arr!17240 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!575111 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-fun lt!262723 () Unit!18060)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35914 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18060)

(assert (=> b!575111 (= lt!262723 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!575112 () Bool)

(assert (=> b!575112 (= e!330889 e!330888)))

(declare-fun res!363671 () Bool)

(assert (=> b!575112 (=> (not res!363671) (not e!330888))))

(declare-fun lt!262714 () SeekEntryResult!5686)

(assert (=> b!575112 (= res!363671 (or (= lt!262714 (MissingZero!5686 i!1132)) (= lt!262714 (MissingVacant!5686 i!1132))))))

(assert (=> b!575112 (= lt!262714 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!575113 () Bool)

(declare-fun res!363670 () Bool)

(assert (=> b!575113 (=> (not res!363670) (not e!330889))))

(assert (=> b!575113 (= res!363670 (validKeyInArray!0 k0!1914))))

(assert (= (and start!52760 res!363668) b!575105))

(assert (= (and b!575105 res!363666) b!575108))

(assert (= (and b!575108 res!363660) b!575113))

(assert (= (and b!575113 res!363670) b!575109))

(assert (= (and b!575109 res!363667) b!575112))

(assert (= (and b!575112 res!363671) b!575107))

(assert (= (and b!575107 res!363661) b!575104))

(assert (= (and b!575104 res!363663) b!575103))

(assert (= (and b!575103 res!363665) b!575111))

(assert (= (and b!575111 (not res!363664)) b!575106))

(assert (= (and b!575106 (not res!363669)) b!575110))

(assert (= (and b!575110 (not res!363662)) b!575102))

(declare-fun m!553433 () Bool)

(assert (=> b!575104 m!553433))

(declare-fun m!553435 () Bool)

(assert (=> b!575108 m!553435))

(assert (=> b!575108 m!553435))

(declare-fun m!553437 () Bool)

(assert (=> b!575108 m!553437))

(declare-fun m!553439 () Bool)

(assert (=> b!575113 m!553439))

(declare-fun m!553441 () Bool)

(assert (=> b!575102 m!553441))

(declare-fun m!553443 () Bool)

(assert (=> b!575112 m!553443))

(declare-fun m!553445 () Bool)

(assert (=> start!52760 m!553445))

(declare-fun m!553447 () Bool)

(assert (=> start!52760 m!553447))

(assert (=> b!575106 m!553435))

(declare-fun m!553449 () Bool)

(assert (=> b!575106 m!553449))

(declare-fun m!553451 () Bool)

(assert (=> b!575110 m!553451))

(assert (=> b!575110 m!553435))

(declare-fun m!553453 () Bool)

(assert (=> b!575110 m!553453))

(declare-fun m!553455 () Bool)

(assert (=> b!575110 m!553455))

(declare-fun m!553457 () Bool)

(assert (=> b!575110 m!553457))

(assert (=> b!575110 m!553435))

(declare-fun m!553459 () Bool)

(assert (=> b!575110 m!553459))

(assert (=> b!575103 m!553435))

(declare-fun m!553461 () Bool)

(assert (=> b!575103 m!553461))

(assert (=> b!575103 m!553435))

(assert (=> b!575103 m!553435))

(declare-fun m!553463 () Bool)

(assert (=> b!575103 m!553463))

(declare-fun m!553465 () Bool)

(assert (=> b!575103 m!553465))

(declare-fun m!553467 () Bool)

(assert (=> b!575103 m!553467))

(assert (=> b!575103 m!553457))

(declare-fun m!553469 () Bool)

(assert (=> b!575103 m!553469))

(assert (=> b!575111 m!553435))

(assert (=> b!575111 m!553435))

(declare-fun m!553471 () Bool)

(assert (=> b!575111 m!553471))

(declare-fun m!553473 () Bool)

(assert (=> b!575111 m!553473))

(declare-fun m!553475 () Bool)

(assert (=> b!575111 m!553475))

(declare-fun m!553477 () Bool)

(assert (=> b!575107 m!553477))

(declare-fun m!553479 () Bool)

(assert (=> b!575109 m!553479))

(check-sat (not b!575109) (not b!575113) (not b!575108) (not b!575110) (not b!575102) (not b!575112) (not b!575111) (not b!575104) (not start!52760) (not b!575107) (not b!575103))
(check-sat)
