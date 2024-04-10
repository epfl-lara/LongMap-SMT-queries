; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51592 () Bool)

(assert start!51592)

(declare-fun b!564562 () Bool)

(declare-fun res!355714 () Bool)

(declare-fun e!325165 () Bool)

(assert (=> b!564562 (=> (not res!355714) (not e!325165))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!564562 (= res!355714 (validKeyInArray!0 k0!1914))))

(declare-fun b!564563 () Bool)

(declare-fun res!355715 () Bool)

(declare-fun e!325167 () Bool)

(assert (=> b!564563 (=> (not res!355715) (not e!325167))))

(declare-datatypes ((array!35457 0))(
  ( (array!35458 (arr!17029 (Array (_ BitVec 32) (_ BitVec 64))) (size!17393 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35457)

(declare-datatypes ((List!11109 0))(
  ( (Nil!11106) (Cons!11105 (h!12108 (_ BitVec 64)) (t!17337 List!11109)) )
))
(declare-fun arrayNoDuplicates!0 (array!35457 (_ BitVec 32) List!11109) Bool)

(assert (=> b!564563 (= res!355715 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11106))))

(declare-fun b!564564 () Bool)

(declare-fun res!355721 () Bool)

(assert (=> b!564564 (=> (not res!355721) (not e!325167))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35457 (_ BitVec 32)) Bool)

(assert (=> b!564564 (= res!355721 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun res!355717 () Bool)

(assert (=> start!51592 (=> (not res!355717) (not e!325165))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51592 (= res!355717 (validMask!0 mask!3119))))

(assert (=> start!51592 e!325165))

(assert (=> start!51592 true))

(declare-fun array_inv!12825 (array!35457) Bool)

(assert (=> start!51592 (array_inv!12825 a!3118)))

(declare-fun b!564565 () Bool)

(assert (=> b!564565 (= e!325167 false)))

(declare-fun lt!257579 () (_ BitVec 32))

(declare-fun j!142 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5478 0))(
  ( (MissingZero!5478 (index!24139 (_ BitVec 32))) (Found!5478 (index!24140 (_ BitVec 32))) (Intermediate!5478 (undefined!6290 Bool) (index!24141 (_ BitVec 32)) (x!53013 (_ BitVec 32))) (Undefined!5478) (MissingVacant!5478 (index!24142 (_ BitVec 32))) )
))
(declare-fun lt!257578 () SeekEntryResult!5478)

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35457 (_ BitVec 32)) SeekEntryResult!5478)

(assert (=> b!564565 (= lt!257578 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!257579 (select (store (arr!17029 a!3118) i!1132 k0!1914) j!142) (array!35458 (store (arr!17029 a!3118) i!1132 k0!1914) (size!17393 a!3118)) mask!3119))))

(declare-fun lt!257577 () SeekEntryResult!5478)

(declare-fun lt!257580 () (_ BitVec 32))

(assert (=> b!564565 (= lt!257577 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!257580 (select (arr!17029 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!564565 (= lt!257579 (toIndex!0 (select (store (arr!17029 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!564565 (= lt!257580 (toIndex!0 (select (arr!17029 a!3118) j!142) mask!3119))))

(declare-fun b!564566 () Bool)

(declare-fun res!355720 () Bool)

(assert (=> b!564566 (=> (not res!355720) (not e!325165))))

(assert (=> b!564566 (= res!355720 (validKeyInArray!0 (select (arr!17029 a!3118) j!142)))))

(declare-fun b!564567 () Bool)

(declare-fun res!355716 () Bool)

(assert (=> b!564567 (=> (not res!355716) (not e!325165))))

(declare-fun arrayContainsKey!0 (array!35457 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!564567 (= res!355716 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!564568 () Bool)

(declare-fun res!355718 () Bool)

(assert (=> b!564568 (=> (not res!355718) (not e!325165))))

(assert (=> b!564568 (= res!355718 (and (= (size!17393 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17393 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17393 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!564569 () Bool)

(assert (=> b!564569 (= e!325165 e!325167)))

(declare-fun res!355719 () Bool)

(assert (=> b!564569 (=> (not res!355719) (not e!325167))))

(declare-fun lt!257581 () SeekEntryResult!5478)

(assert (=> b!564569 (= res!355719 (or (= lt!257581 (MissingZero!5478 i!1132)) (= lt!257581 (MissingVacant!5478 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35457 (_ BitVec 32)) SeekEntryResult!5478)

(assert (=> b!564569 (= lt!257581 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(assert (= (and start!51592 res!355717) b!564568))

(assert (= (and b!564568 res!355718) b!564566))

(assert (= (and b!564566 res!355720) b!564562))

(assert (= (and b!564562 res!355714) b!564567))

(assert (= (and b!564567 res!355716) b!564569))

(assert (= (and b!564569 res!355719) b!564564))

(assert (= (and b!564564 res!355721) b!564563))

(assert (= (and b!564563 res!355715) b!564565))

(declare-fun m!542991 () Bool)

(assert (=> start!51592 m!542991))

(declare-fun m!542993 () Bool)

(assert (=> start!51592 m!542993))

(declare-fun m!542995 () Bool)

(assert (=> b!564569 m!542995))

(declare-fun m!542997 () Bool)

(assert (=> b!564563 m!542997))

(declare-fun m!542999 () Bool)

(assert (=> b!564567 m!542999))

(declare-fun m!543001 () Bool)

(assert (=> b!564565 m!543001))

(declare-fun m!543003 () Bool)

(assert (=> b!564565 m!543003))

(assert (=> b!564565 m!543001))

(declare-fun m!543005 () Bool)

(assert (=> b!564565 m!543005))

(declare-fun m!543007 () Bool)

(assert (=> b!564565 m!543007))

(declare-fun m!543009 () Bool)

(assert (=> b!564565 m!543009))

(assert (=> b!564565 m!543001))

(assert (=> b!564565 m!543007))

(declare-fun m!543011 () Bool)

(assert (=> b!564565 m!543011))

(assert (=> b!564565 m!543007))

(declare-fun m!543013 () Bool)

(assert (=> b!564565 m!543013))

(declare-fun m!543015 () Bool)

(assert (=> b!564562 m!543015))

(declare-fun m!543017 () Bool)

(assert (=> b!564564 m!543017))

(assert (=> b!564566 m!543001))

(assert (=> b!564566 m!543001))

(declare-fun m!543019 () Bool)

(assert (=> b!564566 m!543019))

(check-sat (not b!564569) (not b!564565) (not b!564563) (not start!51592) (not b!564562) (not b!564566) (not b!564564) (not b!564567))
(check-sat)
