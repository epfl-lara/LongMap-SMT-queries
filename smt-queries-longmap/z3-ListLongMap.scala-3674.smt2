; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50648 () Bool)

(assert start!50648)

(declare-fun res!346115 () Bool)

(declare-fun e!319244 () Bool)

(assert (=> start!50648 (=> (not res!346115) (not e!319244))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50648 (= res!346115 (validMask!0 mask!3119))))

(assert (=> start!50648 e!319244))

(assert (=> start!50648 true))

(declare-datatypes ((array!34882 0))(
  ( (array!34883 (arr!16751 (Array (_ BitVec 32) (_ BitVec 64))) (size!17116 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34882)

(declare-fun array_inv!12634 (array!34882) Bool)

(assert (=> start!50648 (array_inv!12634 a!3118)))

(declare-fun b!553552 () Bool)

(declare-fun res!346111 () Bool)

(declare-fun e!319243 () Bool)

(assert (=> b!553552 (=> (not res!346111) (not e!319243))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34882 (_ BitVec 32)) Bool)

(assert (=> b!553552 (= res!346111 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!553553 () Bool)

(declare-fun res!346109 () Bool)

(assert (=> b!553553 (=> (not res!346109) (not e!319243))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5197 0))(
  ( (MissingZero!5197 (index!23015 (_ BitVec 32))) (Found!5197 (index!23016 (_ BitVec 32))) (Intermediate!5197 (undefined!6009 Bool) (index!23017 (_ BitVec 32)) (x!51946 (_ BitVec 32))) (Undefined!5197) (MissingVacant!5197 (index!23018 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34882 (_ BitVec 32)) SeekEntryResult!5197)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!553553 (= res!346109 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16751 a!3118) j!142) mask!3119) (select (arr!16751 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16751 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!16751 a!3118) i!1132 k0!1914) j!142) (array!34883 (store (arr!16751 a!3118) i!1132 k0!1914) (size!17116 a!3118)) mask!3119)))))

(declare-fun b!553554 () Bool)

(declare-fun res!346113 () Bool)

(assert (=> b!553554 (=> (not res!346113) (not e!319244))))

(declare-fun arrayContainsKey!0 (array!34882 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!553554 (= res!346113 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!553555 () Bool)

(declare-fun res!346107 () Bool)

(assert (=> b!553555 (=> (not res!346107) (not e!319243))))

(declare-datatypes ((List!10870 0))(
  ( (Nil!10867) (Cons!10866 (h!11851 (_ BitVec 64)) (t!17089 List!10870)) )
))
(declare-fun arrayNoDuplicates!0 (array!34882 (_ BitVec 32) List!10870) Bool)

(assert (=> b!553555 (= res!346107 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10867))))

(declare-fun b!553556 () Bool)

(declare-fun res!346110 () Bool)

(assert (=> b!553556 (=> (not res!346110) (not e!319244))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!553556 (= res!346110 (validKeyInArray!0 k0!1914))))

(declare-fun e!319245 () Bool)

(declare-fun b!553557 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34882 (_ BitVec 32)) SeekEntryResult!5197)

(assert (=> b!553557 (= e!319245 (= (seekEntryOrOpen!0 (select (arr!16751 a!3118) j!142) a!3118 mask!3119) (Found!5197 j!142)))))

(declare-fun b!553558 () Bool)

(declare-fun res!346112 () Bool)

(assert (=> b!553558 (=> (not res!346112) (not e!319244))))

(assert (=> b!553558 (= res!346112 (and (= (size!17116 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17116 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17116 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!553559 () Bool)

(assert (=> b!553559 (= e!319243 (not true))))

(assert (=> b!553559 e!319245))

(declare-fun res!346106 () Bool)

(assert (=> b!553559 (=> (not res!346106) (not e!319245))))

(assert (=> b!553559 (= res!346106 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17154 0))(
  ( (Unit!17155) )
))
(declare-fun lt!251355 () Unit!17154)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34882 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17154)

(assert (=> b!553559 (= lt!251355 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!553560 () Bool)

(assert (=> b!553560 (= e!319244 e!319243)))

(declare-fun res!346114 () Bool)

(assert (=> b!553560 (=> (not res!346114) (not e!319243))))

(declare-fun lt!251356 () SeekEntryResult!5197)

(assert (=> b!553560 (= res!346114 (or (= lt!251356 (MissingZero!5197 i!1132)) (= lt!251356 (MissingVacant!5197 i!1132))))))

(assert (=> b!553560 (= lt!251356 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!553561 () Bool)

(declare-fun res!346108 () Bool)

(assert (=> b!553561 (=> (not res!346108) (not e!319244))))

(assert (=> b!553561 (= res!346108 (validKeyInArray!0 (select (arr!16751 a!3118) j!142)))))

(assert (= (and start!50648 res!346115) b!553558))

(assert (= (and b!553558 res!346112) b!553561))

(assert (= (and b!553561 res!346108) b!553556))

(assert (= (and b!553556 res!346110) b!553554))

(assert (= (and b!553554 res!346113) b!553560))

(assert (= (and b!553560 res!346114) b!553552))

(assert (= (and b!553552 res!346111) b!553555))

(assert (= (and b!553555 res!346107) b!553553))

(assert (= (and b!553553 res!346109) b!553559))

(assert (= (and b!553559 res!346106) b!553557))

(declare-fun m!530213 () Bool)

(assert (=> b!553561 m!530213))

(assert (=> b!553561 m!530213))

(declare-fun m!530215 () Bool)

(assert (=> b!553561 m!530215))

(declare-fun m!530217 () Bool)

(assert (=> b!553554 m!530217))

(declare-fun m!530219 () Bool)

(assert (=> b!553560 m!530219))

(declare-fun m!530221 () Bool)

(assert (=> b!553552 m!530221))

(assert (=> b!553557 m!530213))

(assert (=> b!553557 m!530213))

(declare-fun m!530223 () Bool)

(assert (=> b!553557 m!530223))

(declare-fun m!530225 () Bool)

(assert (=> b!553559 m!530225))

(declare-fun m!530227 () Bool)

(assert (=> b!553559 m!530227))

(assert (=> b!553553 m!530213))

(declare-fun m!530229 () Bool)

(assert (=> b!553553 m!530229))

(assert (=> b!553553 m!530213))

(declare-fun m!530231 () Bool)

(assert (=> b!553553 m!530231))

(declare-fun m!530233 () Bool)

(assert (=> b!553553 m!530233))

(assert (=> b!553553 m!530231))

(declare-fun m!530235 () Bool)

(assert (=> b!553553 m!530235))

(assert (=> b!553553 m!530229))

(assert (=> b!553553 m!530213))

(declare-fun m!530237 () Bool)

(assert (=> b!553553 m!530237))

(declare-fun m!530239 () Bool)

(assert (=> b!553553 m!530239))

(assert (=> b!553553 m!530231))

(assert (=> b!553553 m!530233))

(declare-fun m!530241 () Bool)

(assert (=> start!50648 m!530241))

(declare-fun m!530243 () Bool)

(assert (=> start!50648 m!530243))

(declare-fun m!530245 () Bool)

(assert (=> b!553555 m!530245))

(declare-fun m!530247 () Bool)

(assert (=> b!553556 m!530247))

(check-sat (not b!553559) (not start!50648) (not b!553552) (not b!553556) (not b!553560) (not b!553557) (not b!553553) (not b!553561) (not b!553554) (not b!553555))
(check-sat)
