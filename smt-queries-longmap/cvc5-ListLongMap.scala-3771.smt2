; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51620 () Bool)

(assert start!51620)

(declare-fun b!564918 () Bool)

(declare-fun res!356070 () Bool)

(declare-fun e!325293 () Bool)

(assert (=> b!564918 (=> (not res!356070) (not e!325293))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!35485 0))(
  ( (array!35486 (arr!17043 (Array (_ BitVec 32) (_ BitVec 64))) (size!17407 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35485)

(declare-datatypes ((SeekEntryResult!5492 0))(
  ( (MissingZero!5492 (index!24195 (_ BitVec 32))) (Found!5492 (index!24196 (_ BitVec 32))) (Intermediate!5492 (undefined!6304 Bool) (index!24197 (_ BitVec 32)) (x!53067 (_ BitVec 32))) (Undefined!5492) (MissingVacant!5492 (index!24198 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35485 (_ BitVec 32)) SeekEntryResult!5492)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!564918 (= res!356070 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17043 a!3118) j!142) mask!3119) (select (arr!17043 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!17043 a!3118) i!1132 k!1914) j!142) mask!3119) (select (store (arr!17043 a!3118) i!1132 k!1914) j!142) (array!35486 (store (arr!17043 a!3118) i!1132 k!1914) (size!17407 a!3118)) mask!3119)))))

(declare-fun res!356078 () Bool)

(declare-fun e!325291 () Bool)

(assert (=> start!51620 (=> (not res!356078) (not e!325291))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51620 (= res!356078 (validMask!0 mask!3119))))

(assert (=> start!51620 e!325291))

(assert (=> start!51620 true))

(declare-fun array_inv!12839 (array!35485) Bool)

(assert (=> start!51620 (array_inv!12839 a!3118)))

(declare-fun b!564919 () Bool)

(declare-fun res!356074 () Bool)

(assert (=> b!564919 (=> (not res!356074) (not e!325293))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35485 (_ BitVec 32)) Bool)

(assert (=> b!564919 (= res!356074 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!564920 () Bool)

(declare-fun res!356073 () Bool)

(assert (=> b!564920 (=> (not res!356073) (not e!325293))))

(declare-datatypes ((List!11123 0))(
  ( (Nil!11120) (Cons!11119 (h!12122 (_ BitVec 64)) (t!17351 List!11123)) )
))
(declare-fun arrayNoDuplicates!0 (array!35485 (_ BitVec 32) List!11123) Bool)

(assert (=> b!564920 (= res!356073 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11120))))

(declare-fun b!564921 () Bool)

(assert (=> b!564921 (= e!325291 e!325293)))

(declare-fun res!356075 () Bool)

(assert (=> b!564921 (=> (not res!356075) (not e!325293))))

(declare-fun lt!257710 () SeekEntryResult!5492)

(assert (=> b!564921 (= res!356075 (or (= lt!257710 (MissingZero!5492 i!1132)) (= lt!257710 (MissingVacant!5492 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35485 (_ BitVec 32)) SeekEntryResult!5492)

(assert (=> b!564921 (= lt!257710 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!564922 () Bool)

(declare-fun res!356072 () Bool)

(assert (=> b!564922 (=> (not res!356072) (not e!325291))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!564922 (= res!356072 (validKeyInArray!0 k!1914))))

(declare-fun b!564923 () Bool)

(assert (=> b!564923 (= e!325293 (not true))))

(assert (=> b!564923 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17686 0))(
  ( (Unit!17687) )
))
(declare-fun lt!257709 () Unit!17686)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35485 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17686)

(assert (=> b!564923 (= lt!257709 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!564924 () Bool)

(declare-fun res!356071 () Bool)

(assert (=> b!564924 (=> (not res!356071) (not e!325291))))

(assert (=> b!564924 (= res!356071 (and (= (size!17407 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17407 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17407 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!564925 () Bool)

(declare-fun res!356077 () Bool)

(assert (=> b!564925 (=> (not res!356077) (not e!325291))))

(assert (=> b!564925 (= res!356077 (validKeyInArray!0 (select (arr!17043 a!3118) j!142)))))

(declare-fun b!564926 () Bool)

(declare-fun res!356076 () Bool)

(assert (=> b!564926 (=> (not res!356076) (not e!325291))))

(declare-fun arrayContainsKey!0 (array!35485 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!564926 (= res!356076 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(assert (= (and start!51620 res!356078) b!564924))

(assert (= (and b!564924 res!356071) b!564925))

(assert (= (and b!564925 res!356077) b!564922))

(assert (= (and b!564922 res!356072) b!564926))

(assert (= (and b!564926 res!356076) b!564921))

(assert (= (and b!564921 res!356075) b!564919))

(assert (= (and b!564919 res!356074) b!564920))

(assert (= (and b!564920 res!356073) b!564918))

(assert (= (and b!564918 res!356070) b!564923))

(declare-fun m!543411 () Bool)

(assert (=> start!51620 m!543411))

(declare-fun m!543413 () Bool)

(assert (=> start!51620 m!543413))

(declare-fun m!543415 () Bool)

(assert (=> b!564921 m!543415))

(declare-fun m!543417 () Bool)

(assert (=> b!564919 m!543417))

(declare-fun m!543419 () Bool)

(assert (=> b!564922 m!543419))

(declare-fun m!543421 () Bool)

(assert (=> b!564925 m!543421))

(assert (=> b!564925 m!543421))

(declare-fun m!543423 () Bool)

(assert (=> b!564925 m!543423))

(declare-fun m!543425 () Bool)

(assert (=> b!564926 m!543425))

(declare-fun m!543427 () Bool)

(assert (=> b!564920 m!543427))

(assert (=> b!564918 m!543421))

(declare-fun m!543429 () Bool)

(assert (=> b!564918 m!543429))

(assert (=> b!564918 m!543421))

(declare-fun m!543431 () Bool)

(assert (=> b!564918 m!543431))

(declare-fun m!543433 () Bool)

(assert (=> b!564918 m!543433))

(assert (=> b!564918 m!543431))

(declare-fun m!543435 () Bool)

(assert (=> b!564918 m!543435))

(assert (=> b!564918 m!543429))

(assert (=> b!564918 m!543421))

(declare-fun m!543437 () Bool)

(assert (=> b!564918 m!543437))

(declare-fun m!543439 () Bool)

(assert (=> b!564918 m!543439))

(assert (=> b!564918 m!543431))

(assert (=> b!564918 m!543433))

(declare-fun m!543441 () Bool)

(assert (=> b!564923 m!543441))

(declare-fun m!543443 () Bool)

(assert (=> b!564923 m!543443))

(push 1)

