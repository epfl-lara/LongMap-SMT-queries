; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51576 () Bool)

(assert start!51576)

(declare-fun res!355050 () Bool)

(declare-fun e!324972 () Bool)

(assert (=> start!51576 (=> (not res!355050) (not e!324972))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51576 (= res!355050 (validMask!0 mask!3119))))

(assert (=> start!51576 e!324972))

(assert (=> start!51576 true))

(declare-datatypes ((array!35388 0))(
  ( (array!35389 (arr!16993 (Array (_ BitVec 32) (_ BitVec 64))) (size!17357 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35388)

(declare-fun array_inv!12852 (array!35388) Bool)

(assert (=> start!51576 (array_inv!12852 a!3118)))

(declare-fun b!563995 () Bool)

(declare-fun res!355048 () Bool)

(assert (=> b!563995 (=> (not res!355048) (not e!324972))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!563995 (= res!355048 (validKeyInArray!0 (select (arr!16993 a!3118) j!142)))))

(declare-fun e!324975 () Bool)

(declare-fun b!563996 () Bool)

(declare-datatypes ((SeekEntryResult!5398 0))(
  ( (MissingZero!5398 (index!23819 (_ BitVec 32))) (Found!5398 (index!23820 (_ BitVec 32))) (Intermediate!5398 (undefined!6210 Bool) (index!23821 (_ BitVec 32)) (x!52856 (_ BitVec 32))) (Undefined!5398) (MissingVacant!5398 (index!23822 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35388 (_ BitVec 32)) SeekEntryResult!5398)

(assert (=> b!563996 (= e!324975 (= (seekEntryOrOpen!0 (select (arr!16993 a!3118) j!142) a!3118 mask!3119) (Found!5398 j!142)))))

(declare-fun b!563997 () Bool)

(declare-fun res!355042 () Bool)

(declare-fun e!324973 () Bool)

(assert (=> b!563997 (=> (not res!355042) (not e!324973))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35388 (_ BitVec 32)) SeekEntryResult!5398)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!563997 (= res!355042 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16993 a!3118) j!142) mask!3119) (select (arr!16993 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16993 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!16993 a!3118) i!1132 k0!1914) j!142) (array!35389 (store (arr!16993 a!3118) i!1132 k0!1914) (size!17357 a!3118)) mask!3119)))))

(declare-fun b!563998 () Bool)

(declare-fun res!355047 () Bool)

(assert (=> b!563998 (=> (not res!355047) (not e!324973))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35388 (_ BitVec 32)) Bool)

(assert (=> b!563998 (= res!355047 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!563999 () Bool)

(declare-fun res!355051 () Bool)

(assert (=> b!563999 (=> (not res!355051) (not e!324973))))

(declare-datatypes ((List!10980 0))(
  ( (Nil!10977) (Cons!10976 (h!11982 (_ BitVec 64)) (t!17200 List!10980)) )
))
(declare-fun arrayNoDuplicates!0 (array!35388 (_ BitVec 32) List!10980) Bool)

(assert (=> b!563999 (= res!355051 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10977))))

(declare-fun b!564000 () Bool)

(assert (=> b!564000 (= e!324973 (not true))))

(assert (=> b!564000 e!324975))

(declare-fun res!355043 () Bool)

(assert (=> b!564000 (=> (not res!355043) (not e!324975))))

(assert (=> b!564000 (= res!355043 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17641 0))(
  ( (Unit!17642) )
))
(declare-fun lt!257451 () Unit!17641)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35388 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17641)

(assert (=> b!564000 (= lt!257451 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!564001 () Bool)

(declare-fun res!355049 () Bool)

(assert (=> b!564001 (=> (not res!355049) (not e!324972))))

(assert (=> b!564001 (= res!355049 (validKeyInArray!0 k0!1914))))

(declare-fun b!564002 () Bool)

(declare-fun res!355046 () Bool)

(assert (=> b!564002 (=> (not res!355046) (not e!324972))))

(assert (=> b!564002 (= res!355046 (and (= (size!17357 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17357 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17357 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!564003 () Bool)

(declare-fun res!355044 () Bool)

(assert (=> b!564003 (=> (not res!355044) (not e!324972))))

(declare-fun arrayContainsKey!0 (array!35388 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!564003 (= res!355044 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!564004 () Bool)

(assert (=> b!564004 (= e!324972 e!324973)))

(declare-fun res!355045 () Bool)

(assert (=> b!564004 (=> (not res!355045) (not e!324973))))

(declare-fun lt!257452 () SeekEntryResult!5398)

(assert (=> b!564004 (= res!355045 (or (= lt!257452 (MissingZero!5398 i!1132)) (= lt!257452 (MissingVacant!5398 i!1132))))))

(assert (=> b!564004 (= lt!257452 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(assert (= (and start!51576 res!355050) b!564002))

(assert (= (and b!564002 res!355046) b!563995))

(assert (= (and b!563995 res!355048) b!564001))

(assert (= (and b!564001 res!355049) b!564003))

(assert (= (and b!564003 res!355044) b!564004))

(assert (= (and b!564004 res!355045) b!563998))

(assert (= (and b!563998 res!355047) b!563999))

(assert (= (and b!563999 res!355051) b!563997))

(assert (= (and b!563997 res!355042) b!564000))

(assert (= (and b!564000 res!355043) b!563996))

(declare-fun m!542549 () Bool)

(assert (=> b!563998 m!542549))

(declare-fun m!542551 () Bool)

(assert (=> b!563996 m!542551))

(assert (=> b!563996 m!542551))

(declare-fun m!542553 () Bool)

(assert (=> b!563996 m!542553))

(declare-fun m!542555 () Bool)

(assert (=> b!564000 m!542555))

(declare-fun m!542557 () Bool)

(assert (=> b!564000 m!542557))

(declare-fun m!542559 () Bool)

(assert (=> start!51576 m!542559))

(declare-fun m!542561 () Bool)

(assert (=> start!51576 m!542561))

(declare-fun m!542563 () Bool)

(assert (=> b!564003 m!542563))

(declare-fun m!542565 () Bool)

(assert (=> b!563999 m!542565))

(declare-fun m!542567 () Bool)

(assert (=> b!564004 m!542567))

(assert (=> b!563995 m!542551))

(assert (=> b!563995 m!542551))

(declare-fun m!542569 () Bool)

(assert (=> b!563995 m!542569))

(declare-fun m!542571 () Bool)

(assert (=> b!564001 m!542571))

(assert (=> b!563997 m!542551))

(declare-fun m!542573 () Bool)

(assert (=> b!563997 m!542573))

(assert (=> b!563997 m!542551))

(declare-fun m!542575 () Bool)

(assert (=> b!563997 m!542575))

(declare-fun m!542577 () Bool)

(assert (=> b!563997 m!542577))

(assert (=> b!563997 m!542575))

(declare-fun m!542579 () Bool)

(assert (=> b!563997 m!542579))

(assert (=> b!563997 m!542573))

(assert (=> b!563997 m!542551))

(declare-fun m!542581 () Bool)

(assert (=> b!563997 m!542581))

(declare-fun m!542583 () Bool)

(assert (=> b!563997 m!542583))

(assert (=> b!563997 m!542575))

(assert (=> b!563997 m!542577))

(check-sat (not b!564000) (not b!563997) (not b!564004) (not b!563995) (not b!564001) (not b!564003) (not start!51576) (not b!563998) (not b!563996) (not b!563999))
(check-sat)
