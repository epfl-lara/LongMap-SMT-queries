; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52754 () Bool)

(assert start!52754)

(declare-fun b!574994 () Bool)

(declare-fun res!363558 () Bool)

(declare-fun e!330828 () Bool)

(assert (=> b!574994 (=> (not res!363558) (not e!330828))))

(declare-datatypes ((array!35908 0))(
  ( (array!35909 (arr!17237 (Array (_ BitVec 32) (_ BitVec 64))) (size!17602 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35908)

(declare-datatypes ((List!11356 0))(
  ( (Nil!11353) (Cons!11352 (h!12391 (_ BitVec 64)) (t!17575 List!11356)) )
))
(declare-fun arrayNoDuplicates!0 (array!35908 (_ BitVec 32) List!11356) Bool)

(assert (=> b!574994 (= res!363558 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11353))))

(declare-fun res!363559 () Bool)

(declare-fun e!330824 () Bool)

(assert (=> start!52754 (=> (not res!363559) (not e!330824))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52754 (= res!363559 (validMask!0 mask!3119))))

(assert (=> start!52754 e!330824))

(assert (=> start!52754 true))

(declare-fun array_inv!13120 (array!35908) Bool)

(assert (=> start!52754 (array_inv!13120 a!3118)))

(declare-fun b!574995 () Bool)

(declare-fun res!363552 () Bool)

(assert (=> b!574995 (=> (not res!363552) (not e!330828))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35908 (_ BitVec 32)) Bool)

(assert (=> b!574995 (= res!363552 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!574996 () Bool)

(assert (=> b!574996 (= e!330824 e!330828)))

(declare-fun res!363563 () Bool)

(assert (=> b!574996 (=> (not res!363563) (not e!330828))))

(declare-datatypes ((SeekEntryResult!5683 0))(
  ( (MissingZero!5683 (index!24959 (_ BitVec 32))) (Found!5683 (index!24960 (_ BitVec 32))) (Intermediate!5683 (undefined!6495 Bool) (index!24961 (_ BitVec 32)) (x!53863 (_ BitVec 32))) (Undefined!5683) (MissingVacant!5683 (index!24962 (_ BitVec 32))) )
))
(declare-fun lt!262600 () SeekEntryResult!5683)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!574996 (= res!363563 (or (= lt!262600 (MissingZero!5683 i!1132)) (= lt!262600 (MissingVacant!5683 i!1132))))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35908 (_ BitVec 32)) SeekEntryResult!5683)

(assert (=> b!574996 (= lt!262600 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!574997 () Bool)

(declare-fun e!330822 () Bool)

(assert (=> b!574997 (= e!330822 true)))

(declare-fun lt!262597 () SeekEntryResult!5683)

(declare-fun lt!262594 () SeekEntryResult!5683)

(assert (=> b!574997 (= lt!262597 lt!262594)))

(declare-datatypes ((Unit!18054 0))(
  ( (Unit!18055) )
))
(declare-fun lt!262588 () Unit!18054)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun lt!262593 () SeekEntryResult!5683)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!35908 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18054)

(assert (=> b!574997 (= lt!262588 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!3118 i!1132 k0!1914 j!142 (x!53863 lt!262593) (index!24961 lt!262593) (index!24961 lt!262593) mask!3119))))

(declare-fun b!574998 () Bool)

(declare-fun res!363562 () Bool)

(assert (=> b!574998 (=> (not res!363562) (not e!330824))))

(assert (=> b!574998 (= res!363562 (and (= (size!17602 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17602 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17602 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!574999 () Bool)

(declare-fun res!363561 () Bool)

(assert (=> b!574999 (=> (not res!363561) (not e!330824))))

(declare-fun arrayContainsKey!0 (array!35908 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!574999 (= res!363561 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!575000 () Bool)

(declare-fun e!330826 () Bool)

(assert (=> b!575000 (= e!330828 e!330826)))

(declare-fun res!363557 () Bool)

(assert (=> b!575000 (=> (not res!363557) (not e!330826))))

(declare-fun lt!262595 () (_ BitVec 32))

(declare-fun lt!262590 () array!35908)

(declare-fun lt!262589 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35908 (_ BitVec 32)) SeekEntryResult!5683)

(assert (=> b!575000 (= res!363557 (= lt!262593 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!262595 lt!262589 lt!262590 mask!3119)))))

(declare-fun lt!262591 () (_ BitVec 32))

(assert (=> b!575000 (= lt!262593 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!262591 (select (arr!17237 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!575000 (= lt!262595 (toIndex!0 lt!262589 mask!3119))))

(assert (=> b!575000 (= lt!262589 (select (store (arr!17237 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!575000 (= lt!262591 (toIndex!0 (select (arr!17237 a!3118) j!142) mask!3119))))

(assert (=> b!575000 (= lt!262590 (array!35909 (store (arr!17237 a!3118) i!1132 k0!1914) (size!17602 a!3118)))))

(declare-fun b!575001 () Bool)

(declare-fun res!363553 () Bool)

(assert (=> b!575001 (=> (not res!363553) (not e!330824))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!575001 (= res!363553 (validKeyInArray!0 (select (arr!17237 a!3118) j!142)))))

(declare-fun b!575002 () Bool)

(declare-fun e!330823 () Bool)

(assert (=> b!575002 (= e!330826 (not e!330823))))

(declare-fun res!363560 () Bool)

(assert (=> b!575002 (=> res!363560 e!330823)))

(get-info :version)

(assert (=> b!575002 (= res!363560 (or (undefined!6495 lt!262593) (not ((_ is Intermediate!5683) lt!262593))))))

(declare-fun lt!262587 () SeekEntryResult!5683)

(declare-fun lt!262596 () SeekEntryResult!5683)

(assert (=> b!575002 (= lt!262587 lt!262596)))

(assert (=> b!575002 (= lt!262596 (Found!5683 j!142))))

(assert (=> b!575002 (= lt!262587 (seekEntryOrOpen!0 (select (arr!17237 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!575002 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-fun lt!262598 () Unit!18054)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35908 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18054)

(assert (=> b!575002 (= lt!262598 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!575003 () Bool)

(declare-fun e!330827 () Bool)

(assert (=> b!575003 (= e!330827 e!330822)))

(declare-fun res!363556 () Bool)

(assert (=> b!575003 (=> res!363556 e!330822)))

(declare-fun lt!262599 () (_ BitVec 64))

(assert (=> b!575003 (= res!363556 (or (bvslt (index!24961 lt!262593) #b00000000000000000000000000000000) (bvsge (index!24961 lt!262593) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsgt (x!53863 lt!262593) #b01111111111111111111111111111110) (bvslt (x!53863 lt!262593) #b00000000000000000000000000000000) (not (= lt!262599 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (store (arr!17237 a!3118) i!1132 k0!1914) (index!24961 lt!262593)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!262597 lt!262596))))))

(declare-fun lt!262592 () SeekEntryResult!5683)

(assert (=> b!575003 (= lt!262592 lt!262594)))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35908 (_ BitVec 32)) SeekEntryResult!5683)

(assert (=> b!575003 (= lt!262594 (seekKeyOrZeroReturnVacant!0 (x!53863 lt!262593) (index!24961 lt!262593) (index!24961 lt!262593) lt!262589 lt!262590 mask!3119))))

(assert (=> b!575003 (= lt!262592 (seekEntryOrOpen!0 lt!262589 lt!262590 mask!3119))))

(assert (=> b!575003 (= lt!262587 lt!262597)))

(assert (=> b!575003 (= lt!262597 (seekKeyOrZeroReturnVacant!0 (x!53863 lt!262593) (index!24961 lt!262593) (index!24961 lt!262593) (select (arr!17237 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!575004 () Bool)

(declare-fun res!363555 () Bool)

(assert (=> b!575004 (=> (not res!363555) (not e!330824))))

(assert (=> b!575004 (= res!363555 (validKeyInArray!0 k0!1914))))

(declare-fun b!575005 () Bool)

(assert (=> b!575005 (= e!330823 e!330827)))

(declare-fun res!363554 () Bool)

(assert (=> b!575005 (=> res!363554 e!330827)))

(assert (=> b!575005 (= res!363554 (or (= lt!262599 (select (arr!17237 a!3118) j!142)) (= lt!262599 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!575005 (= lt!262599 (select (arr!17237 a!3118) (index!24961 lt!262593)))))

(assert (= (and start!52754 res!363559) b!574998))

(assert (= (and b!574998 res!363562) b!575001))

(assert (= (and b!575001 res!363553) b!575004))

(assert (= (and b!575004 res!363555) b!574999))

(assert (= (and b!574999 res!363561) b!574996))

(assert (= (and b!574996 res!363563) b!574995))

(assert (= (and b!574995 res!363552) b!574994))

(assert (= (and b!574994 res!363558) b!575000))

(assert (= (and b!575000 res!363557) b!575002))

(assert (= (and b!575002 (not res!363560)) b!575005))

(assert (= (and b!575005 (not res!363554)) b!575003))

(assert (= (and b!575003 (not res!363556)) b!574997))

(declare-fun m!553289 () Bool)

(assert (=> b!574995 m!553289))

(declare-fun m!553291 () Bool)

(assert (=> start!52754 m!553291))

(declare-fun m!553293 () Bool)

(assert (=> start!52754 m!553293))

(declare-fun m!553295 () Bool)

(assert (=> b!575000 m!553295))

(declare-fun m!553297 () Bool)

(assert (=> b!575000 m!553297))

(assert (=> b!575000 m!553295))

(declare-fun m!553299 () Bool)

(assert (=> b!575000 m!553299))

(declare-fun m!553301 () Bool)

(assert (=> b!575000 m!553301))

(declare-fun m!553303 () Bool)

(assert (=> b!575000 m!553303))

(assert (=> b!575000 m!553295))

(declare-fun m!553305 () Bool)

(assert (=> b!575000 m!553305))

(declare-fun m!553307 () Bool)

(assert (=> b!575000 m!553307))

(declare-fun m!553309 () Bool)

(assert (=> b!574999 m!553309))

(assert (=> b!575005 m!553295))

(declare-fun m!553311 () Bool)

(assert (=> b!575005 m!553311))

(assert (=> b!575002 m!553295))

(assert (=> b!575002 m!553295))

(declare-fun m!553313 () Bool)

(assert (=> b!575002 m!553313))

(declare-fun m!553315 () Bool)

(assert (=> b!575002 m!553315))

(declare-fun m!553317 () Bool)

(assert (=> b!575002 m!553317))

(assert (=> b!575001 m!553295))

(assert (=> b!575001 m!553295))

(declare-fun m!553319 () Bool)

(assert (=> b!575001 m!553319))

(declare-fun m!553321 () Bool)

(assert (=> b!574997 m!553321))

(declare-fun m!553323 () Bool)

(assert (=> b!574996 m!553323))

(declare-fun m!553325 () Bool)

(assert (=> b!574994 m!553325))

(declare-fun m!553327 () Bool)

(assert (=> b!575003 m!553327))

(assert (=> b!575003 m!553295))

(declare-fun m!553329 () Bool)

(assert (=> b!575003 m!553329))

(assert (=> b!575003 m!553295))

(assert (=> b!575003 m!553307))

(declare-fun m!553331 () Bool)

(assert (=> b!575003 m!553331))

(declare-fun m!553333 () Bool)

(assert (=> b!575003 m!553333))

(declare-fun m!553335 () Bool)

(assert (=> b!575004 m!553335))

(check-sat (not b!575003) (not b!575002) (not b!575000) (not b!574997) (not b!575001) (not b!574996) (not b!574999) (not b!574994) (not b!575004) (not start!52754) (not b!574995))
(check-sat)
