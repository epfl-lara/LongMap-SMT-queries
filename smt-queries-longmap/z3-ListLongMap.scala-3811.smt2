; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52274 () Bool)

(assert start!52274)

(declare-fun b!570252 () Bool)

(declare-fun e!327956 () Bool)

(declare-fun e!327955 () Bool)

(assert (=> b!570252 (= e!327956 e!327955)))

(declare-fun res!360178 () Bool)

(assert (=> b!570252 (=> (not res!360178) (not e!327955))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5608 0))(
  ( (MissingZero!5608 (index!24659 (_ BitVec 32))) (Found!5608 (index!24660 (_ BitVec 32))) (Intermediate!5608 (undefined!6420 Bool) (index!24661 (_ BitVec 32)) (x!53543 (_ BitVec 32))) (Undefined!5608) (MissingVacant!5608 (index!24662 (_ BitVec 32))) )
))
(declare-fun lt!259846 () SeekEntryResult!5608)

(declare-fun lt!259845 () (_ BitVec 32))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-datatypes ((array!35743 0))(
  ( (array!35744 (arr!17162 (Array (_ BitVec 32) (_ BitVec 64))) (size!17527 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35743)

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35743 (_ BitVec 32)) SeekEntryResult!5608)

(assert (=> b!570252 (= res!360178 (= lt!259846 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!259845 (select (store (arr!17162 a!3118) i!1132 k0!1914) j!142) (array!35744 (store (arr!17162 a!3118) i!1132 k0!1914) (size!17527 a!3118)) mask!3119)))))

(declare-fun lt!259844 () (_ BitVec 32))

(assert (=> b!570252 (= lt!259846 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!259844 (select (arr!17162 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!570252 (= lt!259845 (toIndex!0 (select (store (arr!17162 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!570252 (= lt!259844 (toIndex!0 (select (arr!17162 a!3118) j!142) mask!3119))))

(declare-fun b!570253 () Bool)

(declare-fun res!360181 () Bool)

(declare-fun e!327959 () Bool)

(assert (=> b!570253 (=> (not res!360181) (not e!327959))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!570253 (= res!360181 (validKeyInArray!0 k0!1914))))

(declare-fun b!570254 () Bool)

(assert (=> b!570254 (= e!327959 e!327956)))

(declare-fun res!360185 () Bool)

(assert (=> b!570254 (=> (not res!360185) (not e!327956))))

(declare-fun lt!259847 () SeekEntryResult!5608)

(assert (=> b!570254 (= res!360185 (or (= lt!259847 (MissingZero!5608 i!1132)) (= lt!259847 (MissingVacant!5608 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35743 (_ BitVec 32)) SeekEntryResult!5608)

(assert (=> b!570254 (= lt!259847 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!570255 () Bool)

(declare-fun res!360183 () Bool)

(assert (=> b!570255 (=> (not res!360183) (not e!327959))))

(declare-fun arrayContainsKey!0 (array!35743 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!570255 (= res!360183 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun res!360180 () Bool)

(assert (=> start!52274 (=> (not res!360180) (not e!327959))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52274 (= res!360180 (validMask!0 mask!3119))))

(assert (=> start!52274 e!327959))

(assert (=> start!52274 true))

(declare-fun array_inv!13045 (array!35743) Bool)

(assert (=> start!52274 (array_inv!13045 a!3118)))

(declare-fun b!570256 () Bool)

(assert (=> b!570256 (= e!327955 (not true))))

(declare-fun e!327957 () Bool)

(assert (=> b!570256 e!327957))

(declare-fun res!360179 () Bool)

(assert (=> b!570256 (=> (not res!360179) (not e!327957))))

(declare-fun lt!259849 () SeekEntryResult!5608)

(assert (=> b!570256 (= res!360179 (= lt!259849 (Found!5608 j!142)))))

(assert (=> b!570256 (= lt!259849 (seekEntryOrOpen!0 (select (arr!17162 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35743 (_ BitVec 32)) Bool)

(assert (=> b!570256 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17904 0))(
  ( (Unit!17905) )
))
(declare-fun lt!259848 () Unit!17904)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35743 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17904)

(assert (=> b!570256 (= lt!259848 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!570257 () Bool)

(declare-fun res!360176 () Bool)

(assert (=> b!570257 (=> (not res!360176) (not e!327956))))

(declare-datatypes ((List!11281 0))(
  ( (Nil!11278) (Cons!11277 (h!12301 (_ BitVec 64)) (t!17500 List!11281)) )
))
(declare-fun arrayNoDuplicates!0 (array!35743 (_ BitVec 32) List!11281) Bool)

(assert (=> b!570257 (= res!360176 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11278))))

(declare-fun e!327960 () Bool)

(declare-fun b!570258 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35743 (_ BitVec 32)) SeekEntryResult!5608)

(assert (=> b!570258 (= e!327960 (= lt!259849 (seekKeyOrZeroReturnVacant!0 (x!53543 lt!259846) (index!24661 lt!259846) (index!24661 lt!259846) (select (arr!17162 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!570259 () Bool)

(declare-fun res!360175 () Bool)

(assert (=> b!570259 (=> (not res!360175) (not e!327956))))

(assert (=> b!570259 (= res!360175 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!570260 () Bool)

(declare-fun res!360184 () Bool)

(assert (=> b!570260 (=> (not res!360184) (not e!327959))))

(assert (=> b!570260 (= res!360184 (and (= (size!17527 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17527 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17527 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!570261 () Bool)

(assert (=> b!570261 (= e!327957 e!327960)))

(declare-fun res!360177 () Bool)

(assert (=> b!570261 (=> res!360177 e!327960)))

(get-info :version)

(assert (=> b!570261 (= res!360177 (or (undefined!6420 lt!259846) (not ((_ is Intermediate!5608) lt!259846)) (= (select (arr!17162 a!3118) (index!24661 lt!259846)) (select (arr!17162 a!3118) j!142)) (= (select (arr!17162 a!3118) (index!24661 lt!259846)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!570262 () Bool)

(declare-fun res!360182 () Bool)

(assert (=> b!570262 (=> (not res!360182) (not e!327959))))

(assert (=> b!570262 (= res!360182 (validKeyInArray!0 (select (arr!17162 a!3118) j!142)))))

(assert (= (and start!52274 res!360180) b!570260))

(assert (= (and b!570260 res!360184) b!570262))

(assert (= (and b!570262 res!360182) b!570253))

(assert (= (and b!570253 res!360181) b!570255))

(assert (= (and b!570255 res!360183) b!570254))

(assert (= (and b!570254 res!360185) b!570259))

(assert (= (and b!570259 res!360175) b!570257))

(assert (= (and b!570257 res!360176) b!570252))

(assert (= (and b!570252 res!360178) b!570256))

(assert (= (and b!570256 res!360179) b!570261))

(assert (= (and b!570261 (not res!360177)) b!570258))

(declare-fun m!548597 () Bool)

(assert (=> b!570255 m!548597))

(declare-fun m!548599 () Bool)

(assert (=> b!570259 m!548599))

(declare-fun m!548601 () Bool)

(assert (=> b!570258 m!548601))

(assert (=> b!570258 m!548601))

(declare-fun m!548603 () Bool)

(assert (=> b!570258 m!548603))

(declare-fun m!548605 () Bool)

(assert (=> b!570261 m!548605))

(assert (=> b!570261 m!548601))

(assert (=> b!570252 m!548601))

(declare-fun m!548607 () Bool)

(assert (=> b!570252 m!548607))

(declare-fun m!548609 () Bool)

(assert (=> b!570252 m!548609))

(declare-fun m!548611 () Bool)

(assert (=> b!570252 m!548611))

(assert (=> b!570252 m!548601))

(assert (=> b!570252 m!548601))

(declare-fun m!548613 () Bool)

(assert (=> b!570252 m!548613))

(assert (=> b!570252 m!548609))

(declare-fun m!548615 () Bool)

(assert (=> b!570252 m!548615))

(assert (=> b!570252 m!548609))

(declare-fun m!548617 () Bool)

(assert (=> b!570252 m!548617))

(declare-fun m!548619 () Bool)

(assert (=> b!570257 m!548619))

(assert (=> b!570256 m!548601))

(assert (=> b!570256 m!548601))

(declare-fun m!548621 () Bool)

(assert (=> b!570256 m!548621))

(declare-fun m!548623 () Bool)

(assert (=> b!570256 m!548623))

(declare-fun m!548625 () Bool)

(assert (=> b!570256 m!548625))

(assert (=> b!570262 m!548601))

(assert (=> b!570262 m!548601))

(declare-fun m!548627 () Bool)

(assert (=> b!570262 m!548627))

(declare-fun m!548629 () Bool)

(assert (=> start!52274 m!548629))

(declare-fun m!548631 () Bool)

(assert (=> start!52274 m!548631))

(declare-fun m!548633 () Bool)

(assert (=> b!570254 m!548633))

(declare-fun m!548635 () Bool)

(assert (=> b!570253 m!548635))

(check-sat (not b!570258) (not start!52274) (not b!570254) (not b!570252) (not b!570257) (not b!570262) (not b!570256) (not b!570255) (not b!570253) (not b!570259))
(check-sat)
