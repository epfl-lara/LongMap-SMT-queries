; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51456 () Bool)

(assert start!51456)

(declare-fun b!562566 () Bool)

(declare-fun e!324211 () Bool)

(declare-fun mask!3119 () (_ BitVec 32))

(assert (=> b!562566 (= e!324211 (bvsge mask!3119 #b00000000000000000000000000000000))))

(declare-datatypes ((SeekEntryResult!5410 0))(
  ( (MissingZero!5410 (index!23867 (_ BitVec 32))) (Found!5410 (index!23868 (_ BitVec 32))) (Intermediate!5410 (undefined!6222 Bool) (index!23869 (_ BitVec 32)) (x!52761 (_ BitVec 32))) (Undefined!5410) (MissingVacant!5410 (index!23870 (_ BitVec 32))) )
))
(declare-fun lt!256391 () SeekEntryResult!5410)

(declare-fun lt!256398 () SeekEntryResult!5410)

(assert (=> b!562566 (= lt!256391 lt!256398)))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun lt!256397 () SeekEntryResult!5410)

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!35321 0))(
  ( (array!35322 (arr!16961 (Array (_ BitVec 32) (_ BitVec 64))) (size!17325 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35321)

(declare-datatypes ((Unit!17594 0))(
  ( (Unit!17595) )
))
(declare-fun lt!256387 () Unit!17594)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!35321 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17594)

(assert (=> b!562566 (= lt!256387 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!3118 i!1132 k!1914 j!142 (x!52761 lt!256397) (index!23869 lt!256397) (index!23869 lt!256397) mask!3119))))

(declare-fun b!562568 () Bool)

(declare-fun res!353720 () Bool)

(declare-fun e!324212 () Bool)

(assert (=> b!562568 (=> (not res!353720) (not e!324212))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!562568 (= res!353720 (validKeyInArray!0 (select (arr!16961 a!3118) j!142)))))

(declare-fun b!562569 () Bool)

(declare-fun e!324213 () Bool)

(assert (=> b!562569 (= e!324213 e!324211)))

(declare-fun res!353722 () Bool)

(assert (=> b!562569 (=> res!353722 e!324211)))

(declare-fun lt!256386 () SeekEntryResult!5410)

(declare-fun lt!256390 () (_ BitVec 64))

(assert (=> b!562569 (= res!353722 (or (bvslt (index!23869 lt!256397) #b00000000000000000000000000000000) (bvsge (index!23869 lt!256397) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsgt (x!52761 lt!256397) #b01111111111111111111111111111110) (bvslt (x!52761 lt!256397) #b00000000000000000000000000000000) (not (= lt!256390 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (store (arr!16961 a!3118) i!1132 k!1914) (index!23869 lt!256397)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!256391 lt!256386))))))

(declare-fun lt!256394 () SeekEntryResult!5410)

(assert (=> b!562569 (= lt!256394 lt!256398)))

(declare-fun lt!256399 () (_ BitVec 64))

(declare-fun lt!256396 () array!35321)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35321 (_ BitVec 32)) SeekEntryResult!5410)

(assert (=> b!562569 (= lt!256398 (seekKeyOrZeroReturnVacant!0 (x!52761 lt!256397) (index!23869 lt!256397) (index!23869 lt!256397) lt!256399 lt!256396 mask!3119))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35321 (_ BitVec 32)) SeekEntryResult!5410)

(assert (=> b!562569 (= lt!256394 (seekEntryOrOpen!0 lt!256399 lt!256396 mask!3119))))

(declare-fun lt!256389 () SeekEntryResult!5410)

(assert (=> b!562569 (= lt!256389 lt!256391)))

(assert (=> b!562569 (= lt!256391 (seekKeyOrZeroReturnVacant!0 (x!52761 lt!256397) (index!23869 lt!256397) (index!23869 lt!256397) (select (arr!16961 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!562570 () Bool)

(declare-fun e!324207 () Bool)

(declare-fun e!324209 () Bool)

(assert (=> b!562570 (= e!324207 (not e!324209))))

(declare-fun res!353719 () Bool)

(assert (=> b!562570 (=> res!353719 e!324209)))

(assert (=> b!562570 (= res!353719 (or (undefined!6222 lt!256397) (not (is-Intermediate!5410 lt!256397))))))

(assert (=> b!562570 (= lt!256389 lt!256386)))

(assert (=> b!562570 (= lt!256386 (Found!5410 j!142))))

(assert (=> b!562570 (= lt!256389 (seekEntryOrOpen!0 (select (arr!16961 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35321 (_ BitVec 32)) Bool)

(assert (=> b!562570 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-fun lt!256393 () Unit!17594)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35321 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17594)

(assert (=> b!562570 (= lt!256393 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!562571 () Bool)

(declare-fun e!324208 () Bool)

(assert (=> b!562571 (= e!324212 e!324208)))

(declare-fun res!353718 () Bool)

(assert (=> b!562571 (=> (not res!353718) (not e!324208))))

(declare-fun lt!256395 () SeekEntryResult!5410)

(assert (=> b!562571 (= res!353718 (or (= lt!256395 (MissingZero!5410 i!1132)) (= lt!256395 (MissingVacant!5410 i!1132))))))

(assert (=> b!562571 (= lt!256395 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!562572 () Bool)

(declare-fun res!353725 () Bool)

(assert (=> b!562572 (=> (not res!353725) (not e!324208))))

(declare-datatypes ((List!11041 0))(
  ( (Nil!11038) (Cons!11037 (h!12040 (_ BitVec 64)) (t!17269 List!11041)) )
))
(declare-fun arrayNoDuplicates!0 (array!35321 (_ BitVec 32) List!11041) Bool)

(assert (=> b!562572 (= res!353725 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11038))))

(declare-fun b!562573 () Bool)

(declare-fun res!353729 () Bool)

(assert (=> b!562573 (=> (not res!353729) (not e!324212))))

(declare-fun arrayContainsKey!0 (array!35321 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!562573 (= res!353729 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!562574 () Bool)

(assert (=> b!562574 (= e!324209 e!324213)))

(declare-fun res!353728 () Bool)

(assert (=> b!562574 (=> res!353728 e!324213)))

(assert (=> b!562574 (= res!353728 (or (= lt!256390 (select (arr!16961 a!3118) j!142)) (= lt!256390 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!562574 (= lt!256390 (select (arr!16961 a!3118) (index!23869 lt!256397)))))

(declare-fun b!562575 () Bool)

(declare-fun res!353721 () Bool)

(assert (=> b!562575 (=> (not res!353721) (not e!324212))))

(assert (=> b!562575 (= res!353721 (validKeyInArray!0 k!1914))))

(declare-fun b!562567 () Bool)

(assert (=> b!562567 (= e!324208 e!324207)))

(declare-fun res!353723 () Bool)

(assert (=> b!562567 (=> (not res!353723) (not e!324207))))

(declare-fun lt!256388 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35321 (_ BitVec 32)) SeekEntryResult!5410)

(assert (=> b!562567 (= res!353723 (= lt!256397 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!256388 lt!256399 lt!256396 mask!3119)))))

(declare-fun lt!256392 () (_ BitVec 32))

(assert (=> b!562567 (= lt!256397 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!256392 (select (arr!16961 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!562567 (= lt!256388 (toIndex!0 lt!256399 mask!3119))))

(assert (=> b!562567 (= lt!256399 (select (store (arr!16961 a!3118) i!1132 k!1914) j!142))))

(assert (=> b!562567 (= lt!256392 (toIndex!0 (select (arr!16961 a!3118) j!142) mask!3119))))

(assert (=> b!562567 (= lt!256396 (array!35322 (store (arr!16961 a!3118) i!1132 k!1914) (size!17325 a!3118)))))

(declare-fun res!353727 () Bool)

(assert (=> start!51456 (=> (not res!353727) (not e!324212))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51456 (= res!353727 (validMask!0 mask!3119))))

(assert (=> start!51456 e!324212))

(assert (=> start!51456 true))

(declare-fun array_inv!12757 (array!35321) Bool)

(assert (=> start!51456 (array_inv!12757 a!3118)))

(declare-fun b!562576 () Bool)

(declare-fun res!353726 () Bool)

(assert (=> b!562576 (=> (not res!353726) (not e!324212))))

(assert (=> b!562576 (= res!353726 (and (= (size!17325 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17325 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17325 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!562577 () Bool)

(declare-fun res!353724 () Bool)

(assert (=> b!562577 (=> (not res!353724) (not e!324208))))

(assert (=> b!562577 (= res!353724 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(assert (= (and start!51456 res!353727) b!562576))

(assert (= (and b!562576 res!353726) b!562568))

(assert (= (and b!562568 res!353720) b!562575))

(assert (= (and b!562575 res!353721) b!562573))

(assert (= (and b!562573 res!353729) b!562571))

(assert (= (and b!562571 res!353718) b!562577))

(assert (= (and b!562577 res!353724) b!562572))

(assert (= (and b!562572 res!353725) b!562567))

(assert (= (and b!562567 res!353723) b!562570))

(assert (= (and b!562570 (not res!353719)) b!562574))

(assert (= (and b!562574 (not res!353728)) b!562569))

(assert (= (and b!562569 (not res!353722)) b!562566))

(declare-fun m!540645 () Bool)

(assert (=> b!562568 m!540645))

(assert (=> b!562568 m!540645))

(declare-fun m!540647 () Bool)

(assert (=> b!562568 m!540647))

(declare-fun m!540649 () Bool)

(assert (=> b!562575 m!540649))

(assert (=> b!562570 m!540645))

(assert (=> b!562570 m!540645))

(declare-fun m!540651 () Bool)

(assert (=> b!562570 m!540651))

(declare-fun m!540653 () Bool)

(assert (=> b!562570 m!540653))

(declare-fun m!540655 () Bool)

(assert (=> b!562570 m!540655))

(assert (=> b!562567 m!540645))

(declare-fun m!540657 () Bool)

(assert (=> b!562567 m!540657))

(declare-fun m!540659 () Bool)

(assert (=> b!562567 m!540659))

(assert (=> b!562567 m!540645))

(declare-fun m!540661 () Bool)

(assert (=> b!562567 m!540661))

(assert (=> b!562567 m!540645))

(declare-fun m!540663 () Bool)

(assert (=> b!562567 m!540663))

(declare-fun m!540665 () Bool)

(assert (=> b!562567 m!540665))

(declare-fun m!540667 () Bool)

(assert (=> b!562567 m!540667))

(declare-fun m!540669 () Bool)

(assert (=> b!562572 m!540669))

(declare-fun m!540671 () Bool)

(assert (=> b!562569 m!540671))

(assert (=> b!562569 m!540645))

(declare-fun m!540673 () Bool)

(assert (=> b!562569 m!540673))

(declare-fun m!540675 () Bool)

(assert (=> b!562569 m!540675))

(assert (=> b!562569 m!540645))

(assert (=> b!562569 m!540667))

(declare-fun m!540677 () Bool)

(assert (=> b!562569 m!540677))

(assert (=> b!562574 m!540645))

(declare-fun m!540679 () Bool)

(assert (=> b!562574 m!540679))

(declare-fun m!540681 () Bool)

(assert (=> b!562566 m!540681))

(declare-fun m!540683 () Bool)

(assert (=> start!51456 m!540683))

(declare-fun m!540685 () Bool)

(assert (=> start!51456 m!540685))

(declare-fun m!540687 () Bool)

(assert (=> b!562577 m!540687))

(declare-fun m!540689 () Bool)

(assert (=> b!562573 m!540689))

(declare-fun m!540691 () Bool)

(assert (=> b!562571 m!540691))

(push 1)

