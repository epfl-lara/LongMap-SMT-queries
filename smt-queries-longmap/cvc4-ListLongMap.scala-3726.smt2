; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51354 () Bool)

(assert start!51354)

(declare-fun b!560594 () Bool)

(declare-fun e!323005 () Bool)

(declare-fun e!323002 () Bool)

(assert (=> b!560594 (= e!323005 e!323002)))

(declare-fun res!351751 () Bool)

(assert (=> b!560594 (=> (not res!351751) (not e!323002))))

(declare-datatypes ((array!35219 0))(
  ( (array!35220 (arr!16910 (Array (_ BitVec 32) (_ BitVec 64))) (size!17274 (_ BitVec 32))) )
))
(declare-fun lt!254924 () array!35219)

(declare-datatypes ((SeekEntryResult!5359 0))(
  ( (MissingZero!5359 (index!23663 (_ BitVec 32))) (Found!5359 (index!23664 (_ BitVec 32))) (Intermediate!5359 (undefined!6171 Bool) (index!23665 (_ BitVec 32)) (x!52574 (_ BitVec 32))) (Undefined!5359) (MissingVacant!5359 (index!23666 (_ BitVec 32))) )
))
(declare-fun lt!254926 () SeekEntryResult!5359)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun lt!254929 () (_ BitVec 64))

(declare-fun lt!254931 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35219 (_ BitVec 32)) SeekEntryResult!5359)

(assert (=> b!560594 (= res!351751 (= lt!254926 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!254931 lt!254929 lt!254924 mask!3119)))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun lt!254930 () (_ BitVec 32))

(declare-fun a!3118 () array!35219)

(assert (=> b!560594 (= lt!254926 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!254930 (select (arr!16910 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!560594 (= lt!254931 (toIndex!0 lt!254929 mask!3119))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!560594 (= lt!254929 (select (store (arr!16910 a!3118) i!1132 k!1914) j!142))))

(assert (=> b!560594 (= lt!254930 (toIndex!0 (select (arr!16910 a!3118) j!142) mask!3119))))

(assert (=> b!560594 (= lt!254924 (array!35220 (store (arr!16910 a!3118) i!1132 k!1914) (size!17274 a!3118)))))

(declare-fun b!560595 () Bool)

(declare-fun e!323006 () Bool)

(declare-fun e!323000 () Bool)

(assert (=> b!560595 (= e!323006 e!323000)))

(declare-fun res!351752 () Bool)

(assert (=> b!560595 (=> (not res!351752) (not e!323000))))

(declare-fun lt!254932 () SeekEntryResult!5359)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35219 (_ BitVec 32)) SeekEntryResult!5359)

(assert (=> b!560595 (= res!351752 (= lt!254932 (seekKeyOrZeroReturnVacant!0 (x!52574 lt!254926) (index!23665 lt!254926) (index!23665 lt!254926) (select (arr!16910 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun res!351749 () Bool)

(declare-fun e!323007 () Bool)

(assert (=> start!51354 (=> (not res!351749) (not e!323007))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51354 (= res!351749 (validMask!0 mask!3119))))

(assert (=> start!51354 e!323007))

(assert (=> start!51354 true))

(declare-fun array_inv!12706 (array!35219) Bool)

(assert (=> start!51354 (array_inv!12706 a!3118)))

(declare-fun b!560596 () Bool)

(declare-fun res!351753 () Bool)

(assert (=> b!560596 (=> (not res!351753) (not e!323005))))

(declare-datatypes ((List!10990 0))(
  ( (Nil!10987) (Cons!10986 (h!11989 (_ BitVec 64)) (t!17218 List!10990)) )
))
(declare-fun arrayNoDuplicates!0 (array!35219 (_ BitVec 32) List!10990) Bool)

(assert (=> b!560596 (= res!351753 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10987))))

(declare-fun b!560597 () Bool)

(declare-fun res!351757 () Bool)

(assert (=> b!560597 (=> (not res!351757) (not e!323007))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!560597 (= res!351757 (validKeyInArray!0 (select (arr!16910 a!3118) j!142)))))

(declare-fun b!560598 () Bool)

(declare-fun res!351754 () Bool)

(assert (=> b!560598 (=> (not res!351754) (not e!323007))))

(assert (=> b!560598 (= res!351754 (and (= (size!17274 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17274 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17274 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!560599 () Bool)

(declare-fun e!323004 () Bool)

(assert (=> b!560599 (= e!323004 e!323006)))

(declare-fun res!351747 () Bool)

(assert (=> b!560599 (=> res!351747 e!323006)))

(declare-fun lt!254928 () (_ BitVec 64))

(assert (=> b!560599 (= res!351747 (or (= lt!254928 (select (arr!16910 a!3118) j!142)) (= lt!254928 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!560599 (= lt!254928 (select (arr!16910 a!3118) (index!23665 lt!254926)))))

(declare-fun b!560600 () Bool)

(assert (=> b!560600 (= e!323007 e!323005)))

(declare-fun res!351756 () Bool)

(assert (=> b!560600 (=> (not res!351756) (not e!323005))))

(declare-fun lt!254925 () SeekEntryResult!5359)

(assert (=> b!560600 (= res!351756 (or (= lt!254925 (MissingZero!5359 i!1132)) (= lt!254925 (MissingVacant!5359 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35219 (_ BitVec 32)) SeekEntryResult!5359)

(assert (=> b!560600 (= lt!254925 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!560601 () Bool)

(declare-fun res!351755 () Bool)

(assert (=> b!560601 (=> (not res!351755) (not e!323007))))

(assert (=> b!560601 (= res!351755 (validKeyInArray!0 k!1914))))

(declare-fun b!560602 () Bool)

(assert (=> b!560602 (= e!323002 (not true))))

(declare-fun e!323001 () Bool)

(assert (=> b!560602 e!323001))

(declare-fun res!351748 () Bool)

(assert (=> b!560602 (=> (not res!351748) (not e!323001))))

(assert (=> b!560602 (= res!351748 (= lt!254932 (Found!5359 j!142)))))

(assert (=> b!560602 (= lt!254932 (seekEntryOrOpen!0 (select (arr!16910 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35219 (_ BitVec 32)) Bool)

(assert (=> b!560602 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17492 0))(
  ( (Unit!17493) )
))
(declare-fun lt!254927 () Unit!17492)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35219 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17492)

(assert (=> b!560602 (= lt!254927 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!560603 () Bool)

(declare-fun res!351750 () Bool)

(assert (=> b!560603 (=> (not res!351750) (not e!323005))))

(assert (=> b!560603 (= res!351750 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!560604 () Bool)

(assert (=> b!560604 (= e!323001 e!323004)))

(declare-fun res!351746 () Bool)

(assert (=> b!560604 (=> res!351746 e!323004)))

(assert (=> b!560604 (= res!351746 (or (undefined!6171 lt!254926) (not (is-Intermediate!5359 lt!254926))))))

(declare-fun b!560605 () Bool)

(assert (=> b!560605 (= e!323000 (= (seekEntryOrOpen!0 lt!254929 lt!254924 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!52574 lt!254926) (index!23665 lt!254926) (index!23665 lt!254926) lt!254929 lt!254924 mask!3119)))))

(declare-fun b!560606 () Bool)

(declare-fun res!351758 () Bool)

(assert (=> b!560606 (=> (not res!351758) (not e!323007))))

(declare-fun arrayContainsKey!0 (array!35219 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!560606 (= res!351758 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(assert (= (and start!51354 res!351749) b!560598))

(assert (= (and b!560598 res!351754) b!560597))

(assert (= (and b!560597 res!351757) b!560601))

(assert (= (and b!560601 res!351755) b!560606))

(assert (= (and b!560606 res!351758) b!560600))

(assert (= (and b!560600 res!351756) b!560603))

(assert (= (and b!560603 res!351750) b!560596))

(assert (= (and b!560596 res!351753) b!560594))

(assert (= (and b!560594 res!351751) b!560602))

(assert (= (and b!560602 res!351748) b!560604))

(assert (= (and b!560604 (not res!351746)) b!560599))

(assert (= (and b!560599 (not res!351747)) b!560595))

(assert (= (and b!560595 res!351752) b!560605))

(declare-fun m!538381 () Bool)

(assert (=> b!560605 m!538381))

(declare-fun m!538383 () Bool)

(assert (=> b!560605 m!538383))

(declare-fun m!538385 () Bool)

(assert (=> b!560597 m!538385))

(assert (=> b!560597 m!538385))

(declare-fun m!538387 () Bool)

(assert (=> b!560597 m!538387))

(assert (=> b!560602 m!538385))

(assert (=> b!560602 m!538385))

(declare-fun m!538389 () Bool)

(assert (=> b!560602 m!538389))

(declare-fun m!538391 () Bool)

(assert (=> b!560602 m!538391))

(declare-fun m!538393 () Bool)

(assert (=> b!560602 m!538393))

(declare-fun m!538395 () Bool)

(assert (=> b!560601 m!538395))

(assert (=> b!560595 m!538385))

(assert (=> b!560595 m!538385))

(declare-fun m!538397 () Bool)

(assert (=> b!560595 m!538397))

(declare-fun m!538399 () Bool)

(assert (=> b!560606 m!538399))

(declare-fun m!538401 () Bool)

(assert (=> start!51354 m!538401))

(declare-fun m!538403 () Bool)

(assert (=> start!51354 m!538403))

(declare-fun m!538405 () Bool)

(assert (=> b!560603 m!538405))

(declare-fun m!538407 () Bool)

(assert (=> b!560596 m!538407))

(assert (=> b!560599 m!538385))

(declare-fun m!538409 () Bool)

(assert (=> b!560599 m!538409))

(assert (=> b!560594 m!538385))

(declare-fun m!538411 () Bool)

(assert (=> b!560594 m!538411))

(declare-fun m!538413 () Bool)

(assert (=> b!560594 m!538413))

(assert (=> b!560594 m!538385))

(declare-fun m!538415 () Bool)

(assert (=> b!560594 m!538415))

(assert (=> b!560594 m!538385))

(declare-fun m!538417 () Bool)

(assert (=> b!560594 m!538417))

(declare-fun m!538419 () Bool)

(assert (=> b!560594 m!538419))

(declare-fun m!538421 () Bool)

(assert (=> b!560594 m!538421))

(declare-fun m!538423 () Bool)

(assert (=> b!560600 m!538423))

(push 1)

