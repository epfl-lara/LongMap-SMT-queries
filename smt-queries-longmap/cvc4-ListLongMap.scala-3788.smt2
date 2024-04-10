; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51906 () Bool)

(assert start!51906)

(declare-fun res!357977 () Bool)

(declare-fun e!326498 () Bool)

(assert (=> start!51906 (=> (not res!357977) (not e!326498))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51906 (= res!357977 (validMask!0 mask!3119))))

(assert (=> start!51906 e!326498))

(assert (=> start!51906 true))

(declare-datatypes ((array!35600 0))(
  ( (array!35601 (arr!17096 (Array (_ BitVec 32) (_ BitVec 64))) (size!17460 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35600)

(declare-fun array_inv!12892 (array!35600) Bool)

(assert (=> start!51906 (array_inv!12892 a!3118)))

(declare-fun b!567383 () Bool)

(declare-fun res!357974 () Bool)

(assert (=> b!567383 (=> (not res!357974) (not e!326498))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35600 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!567383 (= res!357974 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!567384 () Bool)

(declare-fun res!357968 () Bool)

(declare-fun e!326499 () Bool)

(assert (=> b!567384 (=> (not res!357968) (not e!326499))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35600 (_ BitVec 32)) Bool)

(assert (=> b!567384 (= res!357968 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!567385 () Bool)

(assert (=> b!567385 (= e!326499 (not true))))

(declare-fun e!326496 () Bool)

(assert (=> b!567385 e!326496))

(declare-fun res!357975 () Bool)

(assert (=> b!567385 (=> (not res!357975) (not e!326496))))

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!567385 (= res!357975 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17792 0))(
  ( (Unit!17793) )
))
(declare-fun lt!258505 () Unit!17792)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35600 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17792)

(assert (=> b!567385 (= lt!258505 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!567386 () Bool)

(declare-fun res!357969 () Bool)

(assert (=> b!567386 (=> (not res!357969) (not e!326498))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!567386 (= res!357969 (and (= (size!17460 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17460 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17460 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!567387 () Bool)

(declare-fun res!357976 () Bool)

(assert (=> b!567387 (=> (not res!357976) (not e!326498))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!567387 (= res!357976 (validKeyInArray!0 k!1914))))

(declare-fun b!567388 () Bool)

(assert (=> b!567388 (= e!326498 e!326499)))

(declare-fun res!357972 () Bool)

(assert (=> b!567388 (=> (not res!357972) (not e!326499))))

(declare-datatypes ((SeekEntryResult!5545 0))(
  ( (MissingZero!5545 (index!24407 (_ BitVec 32))) (Found!5545 (index!24408 (_ BitVec 32))) (Intermediate!5545 (undefined!6357 Bool) (index!24409 (_ BitVec 32)) (x!53274 (_ BitVec 32))) (Undefined!5545) (MissingVacant!5545 (index!24410 (_ BitVec 32))) )
))
(declare-fun lt!258504 () SeekEntryResult!5545)

(assert (=> b!567388 (= res!357972 (or (= lt!258504 (MissingZero!5545 i!1132)) (= lt!258504 (MissingVacant!5545 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35600 (_ BitVec 32)) SeekEntryResult!5545)

(assert (=> b!567388 (= lt!258504 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!567389 () Bool)

(assert (=> b!567389 (= e!326496 (= (seekEntryOrOpen!0 (select (arr!17096 a!3118) j!142) a!3118 mask!3119) (Found!5545 j!142)))))

(declare-fun b!567390 () Bool)

(declare-fun res!357971 () Bool)

(assert (=> b!567390 (=> (not res!357971) (not e!326499))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35600 (_ BitVec 32)) SeekEntryResult!5545)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!567390 (= res!357971 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17096 a!3118) j!142) mask!3119) (select (arr!17096 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!17096 a!3118) i!1132 k!1914) j!142) mask!3119) (select (store (arr!17096 a!3118) i!1132 k!1914) j!142) (array!35601 (store (arr!17096 a!3118) i!1132 k!1914) (size!17460 a!3118)) mask!3119)))))

(declare-fun b!567391 () Bool)

(declare-fun res!357970 () Bool)

(assert (=> b!567391 (=> (not res!357970) (not e!326499))))

(declare-datatypes ((List!11176 0))(
  ( (Nil!11173) (Cons!11172 (h!12184 (_ BitVec 64)) (t!17404 List!11176)) )
))
(declare-fun arrayNoDuplicates!0 (array!35600 (_ BitVec 32) List!11176) Bool)

(assert (=> b!567391 (= res!357970 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11173))))

(declare-fun b!567392 () Bool)

(declare-fun res!357973 () Bool)

(assert (=> b!567392 (=> (not res!357973) (not e!326498))))

(assert (=> b!567392 (= res!357973 (validKeyInArray!0 (select (arr!17096 a!3118) j!142)))))

(assert (= (and start!51906 res!357977) b!567386))

(assert (= (and b!567386 res!357969) b!567392))

(assert (= (and b!567392 res!357973) b!567387))

(assert (= (and b!567387 res!357976) b!567383))

(assert (= (and b!567383 res!357974) b!567388))

(assert (= (and b!567388 res!357972) b!567384))

(assert (= (and b!567384 res!357968) b!567391))

(assert (= (and b!567391 res!357970) b!567390))

(assert (= (and b!567390 res!357971) b!567385))

(assert (= (and b!567385 res!357975) b!567389))

(declare-fun m!545961 () Bool)

(assert (=> b!567390 m!545961))

(declare-fun m!545963 () Bool)

(assert (=> b!567390 m!545963))

(assert (=> b!567390 m!545961))

(declare-fun m!545965 () Bool)

(assert (=> b!567390 m!545965))

(declare-fun m!545967 () Bool)

(assert (=> b!567390 m!545967))

(assert (=> b!567390 m!545965))

(declare-fun m!545969 () Bool)

(assert (=> b!567390 m!545969))

(assert (=> b!567390 m!545963))

(assert (=> b!567390 m!545961))

(declare-fun m!545971 () Bool)

(assert (=> b!567390 m!545971))

(declare-fun m!545973 () Bool)

(assert (=> b!567390 m!545973))

(assert (=> b!567390 m!545965))

(assert (=> b!567390 m!545967))

(declare-fun m!545975 () Bool)

(assert (=> b!567384 m!545975))

(declare-fun m!545977 () Bool)

(assert (=> b!567391 m!545977))

(declare-fun m!545979 () Bool)

(assert (=> b!567385 m!545979))

(declare-fun m!545981 () Bool)

(assert (=> b!567385 m!545981))

(declare-fun m!545983 () Bool)

(assert (=> start!51906 m!545983))

(declare-fun m!545985 () Bool)

(assert (=> start!51906 m!545985))

(declare-fun m!545987 () Bool)

(assert (=> b!567388 m!545987))

(assert (=> b!567389 m!545961))

(assert (=> b!567389 m!545961))

(declare-fun m!545989 () Bool)

(assert (=> b!567389 m!545989))

(assert (=> b!567392 m!545961))

(assert (=> b!567392 m!545961))

(declare-fun m!545991 () Bool)

(assert (=> b!567392 m!545991))

(declare-fun m!545993 () Bool)

(assert (=> b!567387 m!545993))

(declare-fun m!545995 () Bool)

(assert (=> b!567383 m!545995))

(push 1)

