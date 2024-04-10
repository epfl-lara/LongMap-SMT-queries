; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51610 () Bool)

(assert start!51610)

(declare-fun b!564792 () Bool)

(declare-fun e!325248 () Bool)

(declare-datatypes ((array!35475 0))(
  ( (array!35476 (arr!17038 (Array (_ BitVec 32) (_ BitVec 64))) (size!17402 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35475)

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!564792 (= e!325248 (and (bvsle #b00000000000000000000000000000000 (size!17402 a!3118)) (bvsgt j!142 (size!17402 a!3118))))))

(declare-fun b!564793 () Bool)

(declare-fun res!355948 () Bool)

(assert (=> b!564793 (=> (not res!355948) (not e!325248))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35475 (_ BitVec 32)) Bool)

(assert (=> b!564793 (= res!355948 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!564794 () Bool)

(declare-fun res!355950 () Bool)

(assert (=> b!564794 (=> (not res!355950) (not e!325248))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5487 0))(
  ( (MissingZero!5487 (index!24175 (_ BitVec 32))) (Found!5487 (index!24176 (_ BitVec 32))) (Intermediate!5487 (undefined!6299 Bool) (index!24177 (_ BitVec 32)) (x!53046 (_ BitVec 32))) (Undefined!5487) (MissingVacant!5487 (index!24178 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35475 (_ BitVec 32)) SeekEntryResult!5487)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!564794 (= res!355950 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17038 a!3118) j!142) mask!3119) (select (arr!17038 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!17038 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!17038 a!3118) i!1132 k0!1914) j!142) (array!35476 (store (arr!17038 a!3118) i!1132 k0!1914) (size!17402 a!3118)) mask!3119)))))

(declare-fun b!564795 () Bool)

(declare-fun res!355945 () Bool)

(assert (=> b!564795 (=> (not res!355945) (not e!325248))))

(declare-datatypes ((List!11118 0))(
  ( (Nil!11115) (Cons!11114 (h!12117 (_ BitVec 64)) (t!17346 List!11118)) )
))
(declare-fun arrayNoDuplicates!0 (array!35475 (_ BitVec 32) List!11118) Bool)

(assert (=> b!564795 (= res!355945 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11115))))

(declare-fun b!564796 () Bool)

(declare-fun res!355944 () Bool)

(declare-fun e!325246 () Bool)

(assert (=> b!564796 (=> (not res!355944) (not e!325246))))

(declare-fun arrayContainsKey!0 (array!35475 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!564796 (= res!355944 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!564797 () Bool)

(declare-fun res!355947 () Bool)

(assert (=> b!564797 (=> (not res!355947) (not e!325246))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!564797 (= res!355947 (validKeyInArray!0 (select (arr!17038 a!3118) j!142)))))

(declare-fun b!564798 () Bool)

(declare-fun res!355951 () Bool)

(assert (=> b!564798 (=> (not res!355951) (not e!325246))))

(assert (=> b!564798 (= res!355951 (validKeyInArray!0 k0!1914))))

(declare-fun res!355946 () Bool)

(assert (=> start!51610 (=> (not res!355946) (not e!325246))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51610 (= res!355946 (validMask!0 mask!3119))))

(assert (=> start!51610 e!325246))

(assert (=> start!51610 true))

(declare-fun array_inv!12834 (array!35475) Bool)

(assert (=> start!51610 (array_inv!12834 a!3118)))

(declare-fun b!564799 () Bool)

(declare-fun res!355949 () Bool)

(assert (=> b!564799 (=> (not res!355949) (not e!325246))))

(assert (=> b!564799 (= res!355949 (and (= (size!17402 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17402 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17402 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!564800 () Bool)

(assert (=> b!564800 (= e!325246 e!325248)))

(declare-fun res!355952 () Bool)

(assert (=> b!564800 (=> (not res!355952) (not e!325248))))

(declare-fun lt!257656 () SeekEntryResult!5487)

(assert (=> b!564800 (= res!355952 (or (= lt!257656 (MissingZero!5487 i!1132)) (= lt!257656 (MissingVacant!5487 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35475 (_ BitVec 32)) SeekEntryResult!5487)

(assert (=> b!564800 (= lt!257656 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(assert (= (and start!51610 res!355946) b!564799))

(assert (= (and b!564799 res!355949) b!564797))

(assert (= (and b!564797 res!355947) b!564798))

(assert (= (and b!564798 res!355951) b!564796))

(assert (= (and b!564796 res!355944) b!564800))

(assert (= (and b!564800 res!355952) b!564793))

(assert (= (and b!564793 res!355948) b!564795))

(assert (= (and b!564795 res!355945) b!564794))

(assert (= (and b!564794 res!355950) b!564792))

(declare-fun m!543261 () Bool)

(assert (=> b!564793 m!543261))

(declare-fun m!543263 () Bool)

(assert (=> b!564796 m!543263))

(declare-fun m!543265 () Bool)

(assert (=> b!564795 m!543265))

(declare-fun m!543267 () Bool)

(assert (=> b!564797 m!543267))

(assert (=> b!564797 m!543267))

(declare-fun m!543269 () Bool)

(assert (=> b!564797 m!543269))

(declare-fun m!543271 () Bool)

(assert (=> b!564800 m!543271))

(declare-fun m!543273 () Bool)

(assert (=> b!564798 m!543273))

(declare-fun m!543275 () Bool)

(assert (=> start!51610 m!543275))

(declare-fun m!543277 () Bool)

(assert (=> start!51610 m!543277))

(assert (=> b!564794 m!543267))

(declare-fun m!543279 () Bool)

(assert (=> b!564794 m!543279))

(assert (=> b!564794 m!543267))

(declare-fun m!543281 () Bool)

(assert (=> b!564794 m!543281))

(declare-fun m!543283 () Bool)

(assert (=> b!564794 m!543283))

(assert (=> b!564794 m!543281))

(declare-fun m!543285 () Bool)

(assert (=> b!564794 m!543285))

(assert (=> b!564794 m!543279))

(assert (=> b!564794 m!543267))

(declare-fun m!543287 () Bool)

(assert (=> b!564794 m!543287))

(declare-fun m!543289 () Bool)

(assert (=> b!564794 m!543289))

(assert (=> b!564794 m!543281))

(assert (=> b!564794 m!543283))

(check-sat (not b!564797) (not b!564796) (not b!564798) (not b!564794) (not start!51610) (not b!564800) (not b!564795) (not b!564793))
(check-sat)
