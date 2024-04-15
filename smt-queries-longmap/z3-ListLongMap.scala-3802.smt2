; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52154 () Bool)

(assert start!52154)

(declare-fun b!569129 () Bool)

(declare-fun res!359289 () Bool)

(declare-fun e!327387 () Bool)

(assert (=> b!569129 (=> (not res!359289) (not e!327387))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!569129 (= res!359289 (validKeyInArray!0 k0!1914))))

(declare-fun b!569130 () Bool)

(declare-fun e!327389 () Bool)

(declare-fun e!327390 () Bool)

(assert (=> b!569130 (= e!327389 e!327390)))

(declare-fun res!359292 () Bool)

(assert (=> b!569130 (=> (not res!359292) (not e!327390))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5581 0))(
  ( (MissingZero!5581 (index!24551 (_ BitVec 32))) (Found!5581 (index!24552 (_ BitVec 32))) (Intermediate!5581 (undefined!6393 Bool) (index!24553 (_ BitVec 32)) (x!53435 (_ BitVec 32))) (Undefined!5581) (MissingVacant!5581 (index!24554 (_ BitVec 32))) )
))
(declare-fun lt!259285 () SeekEntryResult!5581)

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun lt!259283 () (_ BitVec 32))

(declare-datatypes ((array!35686 0))(
  ( (array!35687 (arr!17135 (Array (_ BitVec 32) (_ BitVec 64))) (size!17500 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35686)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35686 (_ BitVec 32)) SeekEntryResult!5581)

(assert (=> b!569130 (= res!359292 (= lt!259285 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!259283 (select (store (arr!17135 a!3118) i!1132 k0!1914) j!142) (array!35687 (store (arr!17135 a!3118) i!1132 k0!1914) (size!17500 a!3118)) mask!3119)))))

(declare-fun lt!259284 () (_ BitVec 32))

(assert (=> b!569130 (= lt!259285 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!259284 (select (arr!17135 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!569130 (= lt!259283 (toIndex!0 (select (store (arr!17135 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!569130 (= lt!259284 (toIndex!0 (select (arr!17135 a!3118) j!142) mask!3119))))

(declare-fun b!569131 () Bool)

(declare-fun res!359297 () Bool)

(assert (=> b!569131 (=> (not res!359297) (not e!327387))))

(assert (=> b!569131 (= res!359297 (and (= (size!17500 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17500 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17500 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!569132 () Bool)

(declare-fun res!359290 () Bool)

(assert (=> b!569132 (=> (not res!359290) (not e!327389))))

(declare-datatypes ((List!11254 0))(
  ( (Nil!11251) (Cons!11250 (h!12271 (_ BitVec 64)) (t!17473 List!11254)) )
))
(declare-fun arrayNoDuplicates!0 (array!35686 (_ BitVec 32) List!11254) Bool)

(assert (=> b!569132 (= res!359290 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11251))))

(declare-fun b!569133 () Bool)

(declare-fun res!359294 () Bool)

(assert (=> b!569133 (=> (not res!359294) (not e!327389))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35686 (_ BitVec 32)) Bool)

(assert (=> b!569133 (= res!359294 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!569134 () Bool)

(assert (=> b!569134 (= e!327387 e!327389)))

(declare-fun res!359293 () Bool)

(assert (=> b!569134 (=> (not res!359293) (not e!327389))))

(declare-fun lt!259286 () SeekEntryResult!5581)

(assert (=> b!569134 (= res!359293 (or (= lt!259286 (MissingZero!5581 i!1132)) (= lt!259286 (MissingVacant!5581 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35686 (_ BitVec 32)) SeekEntryResult!5581)

(assert (=> b!569134 (= lt!259286 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!569135 () Bool)

(assert (=> b!569135 (= e!327390 (not true))))

(declare-fun lt!259287 () SeekEntryResult!5581)

(get-info :version)

(assert (=> b!569135 (and (= lt!259287 (Found!5581 j!142)) (or (undefined!6393 lt!259285) (not ((_ is Intermediate!5581) lt!259285)) (= (select (arr!17135 a!3118) (index!24553 lt!259285)) (select (arr!17135 a!3118) j!142)) (not (= (select (arr!17135 a!3118) (index!24553 lt!259285)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!259287 (MissingZero!5581 (index!24553 lt!259285)))))))

(assert (=> b!569135 (= lt!259287 (seekEntryOrOpen!0 (select (arr!17135 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!569135 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17850 0))(
  ( (Unit!17851) )
))
(declare-fun lt!259288 () Unit!17850)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35686 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17850)

(assert (=> b!569135 (= lt!259288 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun res!359295 () Bool)

(assert (=> start!52154 (=> (not res!359295) (not e!327387))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52154 (= res!359295 (validMask!0 mask!3119))))

(assert (=> start!52154 e!327387))

(assert (=> start!52154 true))

(declare-fun array_inv!13018 (array!35686) Bool)

(assert (=> start!52154 (array_inv!13018 a!3118)))

(declare-fun b!569136 () Bool)

(declare-fun res!359296 () Bool)

(assert (=> b!569136 (=> (not res!359296) (not e!327387))))

(assert (=> b!569136 (= res!359296 (validKeyInArray!0 (select (arr!17135 a!3118) j!142)))))

(declare-fun b!569137 () Bool)

(declare-fun res!359291 () Bool)

(assert (=> b!569137 (=> (not res!359291) (not e!327387))))

(declare-fun arrayContainsKey!0 (array!35686 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!569137 (= res!359291 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(assert (= (and start!52154 res!359295) b!569131))

(assert (= (and b!569131 res!359297) b!569136))

(assert (= (and b!569136 res!359296) b!569129))

(assert (= (and b!569129 res!359289) b!569137))

(assert (= (and b!569137 res!359291) b!569134))

(assert (= (and b!569134 res!359293) b!569133))

(assert (= (and b!569133 res!359294) b!569132))

(assert (= (and b!569132 res!359290) b!569130))

(assert (= (and b!569130 res!359292) b!569135))

(declare-fun m!547343 () Bool)

(assert (=> b!569129 m!547343))

(declare-fun m!547345 () Bool)

(assert (=> b!569137 m!547345))

(declare-fun m!547347 () Bool)

(assert (=> b!569136 m!547347))

(assert (=> b!569136 m!547347))

(declare-fun m!547349 () Bool)

(assert (=> b!569136 m!547349))

(declare-fun m!547351 () Bool)

(assert (=> start!52154 m!547351))

(declare-fun m!547353 () Bool)

(assert (=> start!52154 m!547353))

(declare-fun m!547355 () Bool)

(assert (=> b!569132 m!547355))

(declare-fun m!547357 () Bool)

(assert (=> b!569134 m!547357))

(assert (=> b!569130 m!547347))

(declare-fun m!547359 () Bool)

(assert (=> b!569130 m!547359))

(assert (=> b!569130 m!547347))

(declare-fun m!547361 () Bool)

(assert (=> b!569130 m!547361))

(declare-fun m!547363 () Bool)

(assert (=> b!569130 m!547363))

(declare-fun m!547365 () Bool)

(assert (=> b!569130 m!547365))

(assert (=> b!569130 m!547347))

(assert (=> b!569130 m!547363))

(declare-fun m!547367 () Bool)

(assert (=> b!569130 m!547367))

(assert (=> b!569130 m!547363))

(declare-fun m!547369 () Bool)

(assert (=> b!569130 m!547369))

(declare-fun m!547371 () Bool)

(assert (=> b!569133 m!547371))

(declare-fun m!547373 () Bool)

(assert (=> b!569135 m!547373))

(assert (=> b!569135 m!547347))

(declare-fun m!547375 () Bool)

(assert (=> b!569135 m!547375))

(declare-fun m!547377 () Bool)

(assert (=> b!569135 m!547377))

(assert (=> b!569135 m!547347))

(declare-fun m!547379 () Bool)

(assert (=> b!569135 m!547379))

(check-sat (not b!569135) (not b!569129) (not b!569137) (not b!569136) (not b!569130) (not b!569134) (not b!569132) (not b!569133) (not start!52154))
(check-sat)
