; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51908 () Bool)

(assert start!51908)

(declare-fun b!567413 () Bool)

(declare-fun res!357998 () Bool)

(declare-fun e!326511 () Bool)

(assert (=> b!567413 (=> (not res!357998) (not e!326511))))

(declare-datatypes ((array!35602 0))(
  ( (array!35603 (arr!17097 (Array (_ BitVec 32) (_ BitVec 64))) (size!17461 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35602)

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35602 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!567413 (= res!357998 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun b!567414 () Bool)

(declare-fun e!326510 () Bool)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5546 0))(
  ( (MissingZero!5546 (index!24411 (_ BitVec 32))) (Found!5546 (index!24412 (_ BitVec 32))) (Intermediate!5546 (undefined!6358 Bool) (index!24413 (_ BitVec 32)) (x!53283 (_ BitVec 32))) (Undefined!5546) (MissingVacant!5546 (index!24414 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35602 (_ BitVec 32)) SeekEntryResult!5546)

(assert (=> b!567414 (= e!326510 (= (seekEntryOrOpen!0 (select (arr!17097 a!3118) j!142) a!3118 mask!3119) (Found!5546 j!142)))))

(declare-fun res!358001 () Bool)

(assert (=> start!51908 (=> (not res!358001) (not e!326511))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51908 (= res!358001 (validMask!0 mask!3119))))

(assert (=> start!51908 e!326511))

(assert (=> start!51908 true))

(declare-fun array_inv!12893 (array!35602) Bool)

(assert (=> start!51908 (array_inv!12893 a!3118)))

(declare-fun b!567415 () Bool)

(declare-fun res!358003 () Bool)

(declare-fun e!326509 () Bool)

(assert (=> b!567415 (=> (not res!358003) (not e!326509))))

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35602 (_ BitVec 32)) SeekEntryResult!5546)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!567415 (= res!358003 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17097 a!3118) j!142) mask!3119) (select (arr!17097 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!17097 a!3118) i!1132 k!1914) j!142) mask!3119) (select (store (arr!17097 a!3118) i!1132 k!1914) j!142) (array!35603 (store (arr!17097 a!3118) i!1132 k!1914) (size!17461 a!3118)) mask!3119)))))

(declare-fun b!567416 () Bool)

(declare-fun res!358000 () Bool)

(assert (=> b!567416 (=> (not res!358000) (not e!326511))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!567416 (= res!358000 (validKeyInArray!0 k!1914))))

(declare-fun b!567417 () Bool)

(assert (=> b!567417 (= e!326509 (not true))))

(assert (=> b!567417 e!326510))

(declare-fun res!358006 () Bool)

(assert (=> b!567417 (=> (not res!358006) (not e!326510))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35602 (_ BitVec 32)) Bool)

(assert (=> b!567417 (= res!358006 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17794 0))(
  ( (Unit!17795) )
))
(declare-fun lt!258511 () Unit!17794)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35602 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17794)

(assert (=> b!567417 (= lt!258511 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!567418 () Bool)

(declare-fun res!358002 () Bool)

(assert (=> b!567418 (=> (not res!358002) (not e!326511))))

(assert (=> b!567418 (= res!358002 (validKeyInArray!0 (select (arr!17097 a!3118) j!142)))))

(declare-fun b!567419 () Bool)

(assert (=> b!567419 (= e!326511 e!326509)))

(declare-fun res!357999 () Bool)

(assert (=> b!567419 (=> (not res!357999) (not e!326509))))

(declare-fun lt!258510 () SeekEntryResult!5546)

(assert (=> b!567419 (= res!357999 (or (= lt!258510 (MissingZero!5546 i!1132)) (= lt!258510 (MissingVacant!5546 i!1132))))))

(assert (=> b!567419 (= lt!258510 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!567420 () Bool)

(declare-fun res!358005 () Bool)

(assert (=> b!567420 (=> (not res!358005) (not e!326509))))

(declare-datatypes ((List!11177 0))(
  ( (Nil!11174) (Cons!11173 (h!12185 (_ BitVec 64)) (t!17405 List!11177)) )
))
(declare-fun arrayNoDuplicates!0 (array!35602 (_ BitVec 32) List!11177) Bool)

(assert (=> b!567420 (= res!358005 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11174))))

(declare-fun b!567421 () Bool)

(declare-fun res!358007 () Bool)

(assert (=> b!567421 (=> (not res!358007) (not e!326509))))

(assert (=> b!567421 (= res!358007 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!567422 () Bool)

(declare-fun res!358004 () Bool)

(assert (=> b!567422 (=> (not res!358004) (not e!326511))))

(assert (=> b!567422 (= res!358004 (and (= (size!17461 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17461 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17461 a!3118)) (not (= i!1132 j!142))))))

(assert (= (and start!51908 res!358001) b!567422))

(assert (= (and b!567422 res!358004) b!567418))

(assert (= (and b!567418 res!358002) b!567416))

(assert (= (and b!567416 res!358000) b!567413))

(assert (= (and b!567413 res!357998) b!567419))

(assert (= (and b!567419 res!357999) b!567421))

(assert (= (and b!567421 res!358007) b!567420))

(assert (= (and b!567420 res!358005) b!567415))

(assert (= (and b!567415 res!358003) b!567417))

(assert (= (and b!567417 res!358006) b!567414))

(declare-fun m!545997 () Bool)

(assert (=> b!567420 m!545997))

(declare-fun m!545999 () Bool)

(assert (=> b!567414 m!545999))

(assert (=> b!567414 m!545999))

(declare-fun m!546001 () Bool)

(assert (=> b!567414 m!546001))

(assert (=> b!567415 m!545999))

(declare-fun m!546003 () Bool)

(assert (=> b!567415 m!546003))

(assert (=> b!567415 m!545999))

(declare-fun m!546005 () Bool)

(assert (=> b!567415 m!546005))

(declare-fun m!546007 () Bool)

(assert (=> b!567415 m!546007))

(assert (=> b!567415 m!546005))

(declare-fun m!546009 () Bool)

(assert (=> b!567415 m!546009))

(assert (=> b!567415 m!546003))

(assert (=> b!567415 m!545999))

(declare-fun m!546011 () Bool)

(assert (=> b!567415 m!546011))

(declare-fun m!546013 () Bool)

(assert (=> b!567415 m!546013))

(assert (=> b!567415 m!546005))

(assert (=> b!567415 m!546007))

(declare-fun m!546015 () Bool)

(assert (=> b!567413 m!546015))

(declare-fun m!546017 () Bool)

(assert (=> b!567419 m!546017))

(declare-fun m!546019 () Bool)

(assert (=> b!567417 m!546019))

(declare-fun m!546021 () Bool)

(assert (=> b!567417 m!546021))

(declare-fun m!546023 () Bool)

(assert (=> b!567416 m!546023))

(declare-fun m!546025 () Bool)

(assert (=> start!51908 m!546025))

(declare-fun m!546027 () Bool)

(assert (=> start!51908 m!546027))

(declare-fun m!546029 () Bool)

(assert (=> b!567421 m!546029))

(assert (=> b!567418 m!545999))

(assert (=> b!567418 m!545999))

(declare-fun m!546031 () Bool)

(assert (=> b!567418 m!546031))

(push 1)

