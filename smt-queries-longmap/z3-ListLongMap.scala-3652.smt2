; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50410 () Bool)

(assert start!50410)

(declare-fun b!551273 () Bool)

(declare-fun res!344060 () Bool)

(declare-fun e!318192 () Bool)

(assert (=> b!551273 (=> (not res!344060) (not e!318192))))

(declare-datatypes ((array!34749 0))(
  ( (array!34750 (arr!16687 (Array (_ BitVec 32) (_ BitVec 64))) (size!17051 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34749)

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34749 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!551273 (= res!344060 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!551274 () Bool)

(declare-fun res!344059 () Bool)

(declare-fun e!318193 () Bool)

(assert (=> b!551274 (=> (not res!344059) (not e!318193))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5136 0))(
  ( (MissingZero!5136 (index!22771 (_ BitVec 32))) (Found!5136 (index!22772 (_ BitVec 32))) (Intermediate!5136 (undefined!5948 Bool) (index!22773 (_ BitVec 32)) (x!51702 (_ BitVec 32))) (Undefined!5136) (MissingVacant!5136 (index!22774 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34749 (_ BitVec 32)) SeekEntryResult!5136)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!551274 (= res!344059 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16687 a!3118) j!142) mask!3119) (select (arr!16687 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16687 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!16687 a!3118) i!1132 k0!1914) j!142) (array!34750 (store (arr!16687 a!3118) i!1132 k0!1914) (size!17051 a!3118)) mask!3119)))))

(declare-fun b!551276 () Bool)

(declare-fun res!344057 () Bool)

(assert (=> b!551276 (=> (not res!344057) (not e!318192))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!551276 (= res!344057 (validKeyInArray!0 (select (arr!16687 a!3118) j!142)))))

(declare-fun e!318195 () Bool)

(declare-fun b!551277 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34749 (_ BitVec 32)) SeekEntryResult!5136)

(assert (=> b!551277 (= e!318195 (= (seekEntryOrOpen!0 (select (arr!16687 a!3118) j!142) a!3118 mask!3119) (Found!5136 j!142)))))

(declare-fun b!551278 () Bool)

(declare-fun res!344058 () Bool)

(assert (=> b!551278 (=> (not res!344058) (not e!318193))))

(declare-datatypes ((List!10767 0))(
  ( (Nil!10764) (Cons!10763 (h!11742 (_ BitVec 64)) (t!16995 List!10767)) )
))
(declare-fun arrayNoDuplicates!0 (array!34749 (_ BitVec 32) List!10767) Bool)

(assert (=> b!551278 (= res!344058 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10764))))

(declare-fun b!551279 () Bool)

(declare-fun res!344056 () Bool)

(assert (=> b!551279 (=> (not res!344056) (not e!318192))))

(assert (=> b!551279 (= res!344056 (validKeyInArray!0 k0!1914))))

(declare-fun b!551280 () Bool)

(assert (=> b!551280 (= e!318192 e!318193)))

(declare-fun res!344054 () Bool)

(assert (=> b!551280 (=> (not res!344054) (not e!318193))))

(declare-fun lt!250797 () SeekEntryResult!5136)

(assert (=> b!551280 (= res!344054 (or (= lt!250797 (MissingZero!5136 i!1132)) (= lt!250797 (MissingVacant!5136 i!1132))))))

(assert (=> b!551280 (= lt!250797 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!551281 () Bool)

(declare-fun res!344053 () Bool)

(assert (=> b!551281 (=> (not res!344053) (not e!318193))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34749 (_ BitVec 32)) Bool)

(assert (=> b!551281 (= res!344053 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!551282 () Bool)

(declare-fun res!344055 () Bool)

(assert (=> b!551282 (=> (not res!344055) (not e!318192))))

(assert (=> b!551282 (= res!344055 (and (= (size!17051 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17051 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17051 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!551275 () Bool)

(assert (=> b!551275 (= e!318193 (not true))))

(assert (=> b!551275 e!318195))

(declare-fun res!344051 () Bool)

(assert (=> b!551275 (=> (not res!344051) (not e!318195))))

(assert (=> b!551275 (= res!344051 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17046 0))(
  ( (Unit!17047) )
))
(declare-fun lt!250798 () Unit!17046)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34749 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17046)

(assert (=> b!551275 (= lt!250798 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun res!344052 () Bool)

(assert (=> start!50410 (=> (not res!344052) (not e!318192))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50410 (= res!344052 (validMask!0 mask!3119))))

(assert (=> start!50410 e!318192))

(assert (=> start!50410 true))

(declare-fun array_inv!12483 (array!34749) Bool)

(assert (=> start!50410 (array_inv!12483 a!3118)))

(assert (= (and start!50410 res!344052) b!551282))

(assert (= (and b!551282 res!344055) b!551276))

(assert (= (and b!551276 res!344057) b!551279))

(assert (= (and b!551279 res!344056) b!551273))

(assert (= (and b!551273 res!344060) b!551280))

(assert (= (and b!551280 res!344054) b!551281))

(assert (= (and b!551281 res!344053) b!551278))

(assert (= (and b!551278 res!344058) b!551274))

(assert (= (and b!551274 res!344059) b!551275))

(assert (= (and b!551275 res!344051) b!551277))

(declare-fun m!528225 () Bool)

(assert (=> b!551273 m!528225))

(declare-fun m!528227 () Bool)

(assert (=> b!551280 m!528227))

(declare-fun m!528229 () Bool)

(assert (=> start!50410 m!528229))

(declare-fun m!528231 () Bool)

(assert (=> start!50410 m!528231))

(declare-fun m!528233 () Bool)

(assert (=> b!551275 m!528233))

(declare-fun m!528235 () Bool)

(assert (=> b!551275 m!528235))

(declare-fun m!528237 () Bool)

(assert (=> b!551278 m!528237))

(declare-fun m!528239 () Bool)

(assert (=> b!551281 m!528239))

(declare-fun m!528241 () Bool)

(assert (=> b!551276 m!528241))

(assert (=> b!551276 m!528241))

(declare-fun m!528243 () Bool)

(assert (=> b!551276 m!528243))

(assert (=> b!551274 m!528241))

(declare-fun m!528245 () Bool)

(assert (=> b!551274 m!528245))

(assert (=> b!551274 m!528241))

(declare-fun m!528247 () Bool)

(assert (=> b!551274 m!528247))

(declare-fun m!528249 () Bool)

(assert (=> b!551274 m!528249))

(assert (=> b!551274 m!528247))

(declare-fun m!528251 () Bool)

(assert (=> b!551274 m!528251))

(assert (=> b!551274 m!528245))

(assert (=> b!551274 m!528241))

(declare-fun m!528253 () Bool)

(assert (=> b!551274 m!528253))

(declare-fun m!528255 () Bool)

(assert (=> b!551274 m!528255))

(assert (=> b!551274 m!528247))

(assert (=> b!551274 m!528249))

(assert (=> b!551277 m!528241))

(assert (=> b!551277 m!528241))

(declare-fun m!528257 () Bool)

(assert (=> b!551277 m!528257))

(declare-fun m!528259 () Bool)

(assert (=> b!551279 m!528259))

(check-sat (not b!551278) (not b!551276) (not b!551277) (not b!551275) (not b!551280) (not start!50410) (not b!551279) (not b!551274) (not b!551273) (not b!551281))
(check-sat)
