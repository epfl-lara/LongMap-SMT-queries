; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52612 () Bool)

(assert start!52612)

(declare-fun b!574085 () Bool)

(declare-fun res!363049 () Bool)

(declare-fun e!330281 () Bool)

(assert (=> b!574085 (=> (not res!363049) (not e!330281))))

(declare-datatypes ((array!35883 0))(
  ( (array!35884 (arr!17227 (Array (_ BitVec 32) (_ BitVec 64))) (size!17591 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35883)

(declare-datatypes ((List!11307 0))(
  ( (Nil!11304) (Cons!11303 (h!12336 (_ BitVec 64)) (t!17535 List!11307)) )
))
(declare-fun arrayNoDuplicates!0 (array!35883 (_ BitVec 32) List!11307) Bool)

(assert (=> b!574085 (= res!363049 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11304))))

(declare-fun b!574086 () Bool)

(declare-fun e!330284 () Bool)

(declare-fun e!330282 () Bool)

(assert (=> b!574086 (= e!330284 e!330282)))

(declare-fun res!363058 () Bool)

(assert (=> b!574086 (=> res!363058 e!330282)))

(declare-datatypes ((SeekEntryResult!5676 0))(
  ( (MissingZero!5676 (index!24931 (_ BitVec 32))) (Found!5676 (index!24932 (_ BitVec 32))) (Intermediate!5676 (undefined!6488 Bool) (index!24933 (_ BitVec 32)) (x!53811 (_ BitVec 32))) (Undefined!5676) (MissingVacant!5676 (index!24934 (_ BitVec 32))) )
))
(declare-fun lt!262174 () SeekEntryResult!5676)

(get-info :version)

(assert (=> b!574086 (= res!363058 (or (undefined!6488 lt!262174) (not ((_ is Intermediate!5676) lt!262174))))))

(declare-fun b!574087 () Bool)

(declare-fun e!330283 () Bool)

(assert (=> b!574087 (= e!330281 e!330283)))

(declare-fun res!363052 () Bool)

(assert (=> b!574087 (=> (not res!363052) (not e!330283))))

(declare-fun lt!262178 () (_ BitVec 64))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun lt!262180 () array!35883)

(declare-fun lt!262172 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35883 (_ BitVec 32)) SeekEntryResult!5676)

(assert (=> b!574087 (= res!363052 (= lt!262174 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!262172 lt!262178 lt!262180 mask!3119)))))

(declare-fun lt!262179 () (_ BitVec 32))

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!574087 (= lt!262174 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!262179 (select (arr!17227 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!574087 (= lt!262172 (toIndex!0 lt!262178 mask!3119))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!574087 (= lt!262178 (select (store (arr!17227 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!574087 (= lt!262179 (toIndex!0 (select (arr!17227 a!3118) j!142) mask!3119))))

(assert (=> b!574087 (= lt!262180 (array!35884 (store (arr!17227 a!3118) i!1132 k0!1914) (size!17591 a!3118)))))

(declare-fun b!574089 () Bool)

(declare-fun res!363047 () Bool)

(declare-fun e!330287 () Bool)

(assert (=> b!574089 (=> (not res!363047) (not e!330287))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!574089 (= res!363047 (validKeyInArray!0 k0!1914))))

(declare-fun b!574090 () Bool)

(declare-fun res!363053 () Bool)

(assert (=> b!574090 (=> (not res!363053) (not e!330287))))

(assert (=> b!574090 (= res!363053 (and (= (size!17591 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17591 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17591 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!574091 () Bool)

(declare-fun res!363057 () Bool)

(assert (=> b!574091 (=> (not res!363057) (not e!330287))))

(declare-fun arrayContainsKey!0 (array!35883 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!574091 (= res!363057 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!574092 () Bool)

(declare-fun res!363055 () Bool)

(assert (=> b!574092 (=> (not res!363055) (not e!330281))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35883 (_ BitVec 32)) Bool)

(assert (=> b!574092 (= res!363055 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!574093 () Bool)

(assert (=> b!574093 (= e!330287 e!330281)))

(declare-fun res!363048 () Bool)

(assert (=> b!574093 (=> (not res!363048) (not e!330281))))

(declare-fun lt!262177 () SeekEntryResult!5676)

(assert (=> b!574093 (= res!363048 (or (= lt!262177 (MissingZero!5676 i!1132)) (= lt!262177 (MissingVacant!5676 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35883 (_ BitVec 32)) SeekEntryResult!5676)

(assert (=> b!574093 (= lt!262177 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun res!363059 () Bool)

(assert (=> start!52612 (=> (not res!363059) (not e!330287))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52612 (= res!363059 (validMask!0 mask!3119))))

(assert (=> start!52612 e!330287))

(assert (=> start!52612 true))

(declare-fun array_inv!13023 (array!35883) Bool)

(assert (=> start!52612 (array_inv!13023 a!3118)))

(declare-fun b!574088 () Bool)

(declare-fun res!363056 () Bool)

(assert (=> b!574088 (=> (not res!363056) (not e!330287))))

(assert (=> b!574088 (= res!363056 (validKeyInArray!0 (select (arr!17227 a!3118) j!142)))))

(declare-fun b!574094 () Bool)

(declare-fun e!330285 () Bool)

(declare-fun e!330288 () Bool)

(assert (=> b!574094 (= e!330285 e!330288)))

(declare-fun res!363050 () Bool)

(assert (=> b!574094 (=> (not res!363050) (not e!330288))))

(declare-fun lt!262175 () SeekEntryResult!5676)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35883 (_ BitVec 32)) SeekEntryResult!5676)

(assert (=> b!574094 (= res!363050 (= lt!262175 (seekKeyOrZeroReturnVacant!0 (x!53811 lt!262174) (index!24933 lt!262174) (index!24933 lt!262174) (select (arr!17227 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!574095 () Bool)

(assert (=> b!574095 (= e!330283 (not true))))

(assert (=> b!574095 e!330284))

(declare-fun res!363051 () Bool)

(assert (=> b!574095 (=> (not res!363051) (not e!330284))))

(assert (=> b!574095 (= res!363051 (= lt!262175 (Found!5676 j!142)))))

(assert (=> b!574095 (= lt!262175 (seekEntryOrOpen!0 (select (arr!17227 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!574095 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!18054 0))(
  ( (Unit!18055) )
))
(declare-fun lt!262176 () Unit!18054)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35883 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18054)

(assert (=> b!574095 (= lt!262176 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!574096 () Bool)

(assert (=> b!574096 (= e!330282 e!330285)))

(declare-fun res!363054 () Bool)

(assert (=> b!574096 (=> res!363054 e!330285)))

(declare-fun lt!262173 () (_ BitVec 64))

(assert (=> b!574096 (= res!363054 (or (= lt!262173 (select (arr!17227 a!3118) j!142)) (= lt!262173 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!574096 (= lt!262173 (select (arr!17227 a!3118) (index!24933 lt!262174)))))

(declare-fun b!574097 () Bool)

(assert (=> b!574097 (= e!330288 (= (seekEntryOrOpen!0 lt!262178 lt!262180 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!53811 lt!262174) (index!24933 lt!262174) (index!24933 lt!262174) lt!262178 lt!262180 mask!3119)))))

(assert (= (and start!52612 res!363059) b!574090))

(assert (= (and b!574090 res!363053) b!574088))

(assert (= (and b!574088 res!363056) b!574089))

(assert (= (and b!574089 res!363047) b!574091))

(assert (= (and b!574091 res!363057) b!574093))

(assert (= (and b!574093 res!363048) b!574092))

(assert (= (and b!574092 res!363055) b!574085))

(assert (= (and b!574085 res!363049) b!574087))

(assert (= (and b!574087 res!363052) b!574095))

(assert (= (and b!574095 res!363051) b!574086))

(assert (= (and b!574086 (not res!363058)) b!574096))

(assert (= (and b!574096 (not res!363054)) b!574094))

(assert (= (and b!574094 res!363050) b!574097))

(declare-fun m!552989 () Bool)

(assert (=> b!574097 m!552989))

(declare-fun m!552991 () Bool)

(assert (=> b!574097 m!552991))

(declare-fun m!552993 () Bool)

(assert (=> start!52612 m!552993))

(declare-fun m!552995 () Bool)

(assert (=> start!52612 m!552995))

(declare-fun m!552997 () Bool)

(assert (=> b!574088 m!552997))

(assert (=> b!574088 m!552997))

(declare-fun m!552999 () Bool)

(assert (=> b!574088 m!552999))

(declare-fun m!553001 () Bool)

(assert (=> b!574089 m!553001))

(declare-fun m!553003 () Bool)

(assert (=> b!574093 m!553003))

(assert (=> b!574087 m!552997))

(declare-fun m!553005 () Bool)

(assert (=> b!574087 m!553005))

(assert (=> b!574087 m!552997))

(declare-fun m!553007 () Bool)

(assert (=> b!574087 m!553007))

(declare-fun m!553009 () Bool)

(assert (=> b!574087 m!553009))

(assert (=> b!574087 m!552997))

(declare-fun m!553011 () Bool)

(assert (=> b!574087 m!553011))

(declare-fun m!553013 () Bool)

(assert (=> b!574087 m!553013))

(declare-fun m!553015 () Bool)

(assert (=> b!574087 m!553015))

(assert (=> b!574094 m!552997))

(assert (=> b!574094 m!552997))

(declare-fun m!553017 () Bool)

(assert (=> b!574094 m!553017))

(declare-fun m!553019 () Bool)

(assert (=> b!574092 m!553019))

(assert (=> b!574095 m!552997))

(assert (=> b!574095 m!552997))

(declare-fun m!553021 () Bool)

(assert (=> b!574095 m!553021))

(declare-fun m!553023 () Bool)

(assert (=> b!574095 m!553023))

(declare-fun m!553025 () Bool)

(assert (=> b!574095 m!553025))

(declare-fun m!553027 () Bool)

(assert (=> b!574091 m!553027))

(assert (=> b!574096 m!552997))

(declare-fun m!553029 () Bool)

(assert (=> b!574096 m!553029))

(declare-fun m!553031 () Bool)

(assert (=> b!574085 m!553031))

(check-sat (not b!574088) (not b!574097) (not b!574089) (not b!574093) (not b!574092) (not b!574091) (not b!574085) (not b!574095) (not start!52612) (not b!574087) (not b!574094))
(check-sat)
