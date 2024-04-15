; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51578 () Bool)

(assert start!51578)

(declare-fun res!355564 () Bool)

(declare-fun e!324983 () Bool)

(assert (=> start!51578 (=> (not res!355564) (not e!324983))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51578 (= res!355564 (validMask!0 mask!3119))))

(assert (=> start!51578 e!324983))

(assert (=> start!51578 true))

(declare-datatypes ((array!35452 0))(
  ( (array!35453 (arr!17027 (Array (_ BitVec 32) (_ BitVec 64))) (size!17392 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35452)

(declare-fun array_inv!12910 (array!35452) Bool)

(assert (=> start!51578 (array_inv!12910 a!3118)))

(declare-fun b!564267 () Bool)

(declare-fun e!324984 () Bool)

(assert (=> b!564267 (= e!324984 false)))

(declare-fun j!142 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5473 0))(
  ( (MissingZero!5473 (index!24119 (_ BitVec 32))) (Found!5473 (index!24120 (_ BitVec 32))) (Intermediate!5473 (undefined!6285 Bool) (index!24121 (_ BitVec 32)) (x!53003 (_ BitVec 32))) (Undefined!5473) (MissingVacant!5473 (index!24122 (_ BitVec 32))) )
))
(declare-fun lt!257329 () SeekEntryResult!5473)

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun lt!257332 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35452 (_ BitVec 32)) SeekEntryResult!5473)

(assert (=> b!564267 (= lt!257329 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!257332 (select (store (arr!17027 a!3118) i!1132 k0!1914) j!142) (array!35453 (store (arr!17027 a!3118) i!1132 k0!1914) (size!17392 a!3118)) mask!3119))))

(declare-fun lt!257328 () (_ BitVec 32))

(declare-fun lt!257330 () SeekEntryResult!5473)

(assert (=> b!564267 (= lt!257330 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!257328 (select (arr!17027 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!564267 (= lt!257332 (toIndex!0 (select (store (arr!17027 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!564267 (= lt!257328 (toIndex!0 (select (arr!17027 a!3118) j!142) mask!3119))))

(declare-fun b!564268 () Bool)

(declare-fun res!355568 () Bool)

(assert (=> b!564268 (=> (not res!355568) (not e!324983))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!564268 (= res!355568 (validKeyInArray!0 k0!1914))))

(declare-fun b!564269 () Bool)

(declare-fun res!355563 () Bool)

(assert (=> b!564269 (=> (not res!355563) (not e!324984))))

(declare-datatypes ((List!11146 0))(
  ( (Nil!11143) (Cons!11142 (h!12145 (_ BitVec 64)) (t!17365 List!11146)) )
))
(declare-fun arrayNoDuplicates!0 (array!35452 (_ BitVec 32) List!11146) Bool)

(assert (=> b!564269 (= res!355563 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11143))))

(declare-fun b!564270 () Bool)

(assert (=> b!564270 (= e!324983 e!324984)))

(declare-fun res!355566 () Bool)

(assert (=> b!564270 (=> (not res!355566) (not e!324984))))

(declare-fun lt!257331 () SeekEntryResult!5473)

(assert (=> b!564270 (= res!355566 (or (= lt!257331 (MissingZero!5473 i!1132)) (= lt!257331 (MissingVacant!5473 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35452 (_ BitVec 32)) SeekEntryResult!5473)

(assert (=> b!564270 (= lt!257331 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!564271 () Bool)

(declare-fun res!355565 () Bool)

(assert (=> b!564271 (=> (not res!355565) (not e!324983))))

(declare-fun arrayContainsKey!0 (array!35452 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!564271 (= res!355565 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!564272 () Bool)

(declare-fun res!355562 () Bool)

(assert (=> b!564272 (=> (not res!355562) (not e!324984))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35452 (_ BitVec 32)) Bool)

(assert (=> b!564272 (= res!355562 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!564273 () Bool)

(declare-fun res!355567 () Bool)

(assert (=> b!564273 (=> (not res!355567) (not e!324983))))

(assert (=> b!564273 (= res!355567 (validKeyInArray!0 (select (arr!17027 a!3118) j!142)))))

(declare-fun b!564274 () Bool)

(declare-fun res!355561 () Bool)

(assert (=> b!564274 (=> (not res!355561) (not e!324983))))

(assert (=> b!564274 (= res!355561 (and (= (size!17392 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17392 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17392 a!3118)) (not (= i!1132 j!142))))))

(assert (= (and start!51578 res!355564) b!564274))

(assert (= (and b!564274 res!355561) b!564273))

(assert (= (and b!564273 res!355567) b!564268))

(assert (= (and b!564268 res!355568) b!564271))

(assert (= (and b!564271 res!355565) b!564270))

(assert (= (and b!564270 res!355566) b!564272))

(assert (= (and b!564272 res!355562) b!564269))

(assert (= (and b!564269 res!355563) b!564267))

(declare-fun m!542189 () Bool)

(assert (=> b!564269 m!542189))

(declare-fun m!542191 () Bool)

(assert (=> b!564271 m!542191))

(declare-fun m!542193 () Bool)

(assert (=> b!564267 m!542193))

(declare-fun m!542195 () Bool)

(assert (=> b!564267 m!542195))

(assert (=> b!564267 m!542193))

(declare-fun m!542197 () Bool)

(assert (=> b!564267 m!542197))

(assert (=> b!564267 m!542193))

(declare-fun m!542199 () Bool)

(assert (=> b!564267 m!542199))

(declare-fun m!542201 () Bool)

(assert (=> b!564267 m!542201))

(assert (=> b!564267 m!542199))

(declare-fun m!542203 () Bool)

(assert (=> b!564267 m!542203))

(assert (=> b!564267 m!542199))

(declare-fun m!542205 () Bool)

(assert (=> b!564267 m!542205))

(declare-fun m!542207 () Bool)

(assert (=> b!564272 m!542207))

(declare-fun m!542209 () Bool)

(assert (=> b!564270 m!542209))

(declare-fun m!542211 () Bool)

(assert (=> b!564268 m!542211))

(declare-fun m!542213 () Bool)

(assert (=> start!51578 m!542213))

(declare-fun m!542215 () Bool)

(assert (=> start!51578 m!542215))

(assert (=> b!564273 m!542193))

(assert (=> b!564273 m!542193))

(declare-fun m!542217 () Bool)

(assert (=> b!564273 m!542217))

(check-sat (not b!564268) (not b!564270) (not b!564271) (not b!564267) (not b!564273) (not b!564269) (not b!564272) (not start!51578))
(check-sat)
