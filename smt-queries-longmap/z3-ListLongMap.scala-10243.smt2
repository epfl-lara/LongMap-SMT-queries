; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120512 () Bool)

(assert start!120512)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95921 0))(
  ( (array!95922 (arr!46311 (Array (_ BitVec 32) (_ BitVec 64))) (size!46861 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95921)

(declare-fun b!1403270 () Bool)

(declare-fun e!794558 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10628 0))(
  ( (MissingZero!10628 (index!44889 (_ BitVec 32))) (Found!10628 (index!44890 (_ BitVec 32))) (Intermediate!10628 (undefined!11440 Bool) (index!44891 (_ BitVec 32)) (x!126503 (_ BitVec 32))) (Undefined!10628) (MissingVacant!10628 (index!44892 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95921 (_ BitVec 32)) SeekEntryResult!10628)

(assert (=> b!1403270 (= e!794558 (= (seekEntryOrOpen!0 (select (arr!46311 a!2901) j!112) a!2901 mask!2840) (Found!10628 j!112)))))

(declare-fun b!1403271 () Bool)

(declare-fun res!941786 () Bool)

(declare-fun e!794561 () Bool)

(assert (=> b!1403271 (=> (not res!941786) (not e!794561))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1403271 (= res!941786 (and (= (size!46861 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46861 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46861 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1403272 () Bool)

(declare-fun res!941783 () Bool)

(assert (=> b!1403272 (=> (not res!941783) (not e!794561))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1403272 (= res!941783 (validKeyInArray!0 (select (arr!46311 a!2901) j!112)))))

(declare-fun b!1403273 () Bool)

(declare-fun res!941787 () Bool)

(assert (=> b!1403273 (=> (not res!941787) (not e!794561))))

(declare-datatypes ((List!32830 0))(
  ( (Nil!32827) (Cons!32826 (h!34074 (_ BitVec 64)) (t!47524 List!32830)) )
))
(declare-fun arrayNoDuplicates!0 (array!95921 (_ BitVec 32) List!32830) Bool)

(assert (=> b!1403273 (= res!941787 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32827))))

(declare-fun b!1403274 () Bool)

(declare-fun e!794559 () Bool)

(assert (=> b!1403274 (= e!794559 true)))

(declare-fun lt!618338 () SeekEntryResult!10628)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95921 (_ BitVec 32)) SeekEntryResult!10628)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1403274 (= lt!618338 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46311 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46311 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95922 (store (arr!46311 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46861 a!2901)) mask!2840))))

(declare-fun b!1403275 () Bool)

(declare-fun res!941782 () Bool)

(assert (=> b!1403275 (=> (not res!941782) (not e!794561))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95921 (_ BitVec 32)) Bool)

(assert (=> b!1403275 (= res!941782 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1403276 () Bool)

(declare-fun res!941781 () Bool)

(assert (=> b!1403276 (=> (not res!941781) (not e!794561))))

(assert (=> b!1403276 (= res!941781 (validKeyInArray!0 (select (arr!46311 a!2901) i!1037)))))

(declare-fun b!1403277 () Bool)

(assert (=> b!1403277 (= e!794561 (not e!794559))))

(declare-fun res!941784 () Bool)

(assert (=> b!1403277 (=> res!941784 e!794559)))

(declare-fun lt!618337 () SeekEntryResult!10628)

(get-info :version)

(assert (=> b!1403277 (= res!941784 (or (not ((_ is Intermediate!10628) lt!618337)) (undefined!11440 lt!618337)))))

(assert (=> b!1403277 e!794558))

(declare-fun res!941788 () Bool)

(assert (=> b!1403277 (=> (not res!941788) (not e!794558))))

(assert (=> b!1403277 (= res!941788 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47260 0))(
  ( (Unit!47261) )
))
(declare-fun lt!618339 () Unit!47260)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95921 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47260)

(assert (=> b!1403277 (= lt!618339 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1403277 (= lt!618337 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46311 a!2901) j!112) mask!2840) (select (arr!46311 a!2901) j!112) a!2901 mask!2840))))

(declare-fun res!941785 () Bool)

(assert (=> start!120512 (=> (not res!941785) (not e!794561))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120512 (= res!941785 (validMask!0 mask!2840))))

(assert (=> start!120512 e!794561))

(assert (=> start!120512 true))

(declare-fun array_inv!35339 (array!95921) Bool)

(assert (=> start!120512 (array_inv!35339 a!2901)))

(assert (= (and start!120512 res!941785) b!1403271))

(assert (= (and b!1403271 res!941786) b!1403276))

(assert (= (and b!1403276 res!941781) b!1403272))

(assert (= (and b!1403272 res!941783) b!1403275))

(assert (= (and b!1403275 res!941782) b!1403273))

(assert (= (and b!1403273 res!941787) b!1403277))

(assert (= (and b!1403277 res!941788) b!1403270))

(assert (= (and b!1403277 (not res!941784)) b!1403274))

(declare-fun m!1291837 () Bool)

(assert (=> b!1403272 m!1291837))

(assert (=> b!1403272 m!1291837))

(declare-fun m!1291839 () Bool)

(assert (=> b!1403272 m!1291839))

(assert (=> b!1403270 m!1291837))

(assert (=> b!1403270 m!1291837))

(declare-fun m!1291841 () Bool)

(assert (=> b!1403270 m!1291841))

(declare-fun m!1291843 () Bool)

(assert (=> b!1403276 m!1291843))

(assert (=> b!1403276 m!1291843))

(declare-fun m!1291845 () Bool)

(assert (=> b!1403276 m!1291845))

(declare-fun m!1291847 () Bool)

(assert (=> b!1403275 m!1291847))

(declare-fun m!1291849 () Bool)

(assert (=> start!120512 m!1291849))

(declare-fun m!1291851 () Bool)

(assert (=> start!120512 m!1291851))

(declare-fun m!1291853 () Bool)

(assert (=> b!1403273 m!1291853))

(declare-fun m!1291855 () Bool)

(assert (=> b!1403274 m!1291855))

(declare-fun m!1291857 () Bool)

(assert (=> b!1403274 m!1291857))

(assert (=> b!1403274 m!1291857))

(declare-fun m!1291859 () Bool)

(assert (=> b!1403274 m!1291859))

(assert (=> b!1403274 m!1291859))

(assert (=> b!1403274 m!1291857))

(declare-fun m!1291861 () Bool)

(assert (=> b!1403274 m!1291861))

(assert (=> b!1403277 m!1291837))

(declare-fun m!1291863 () Bool)

(assert (=> b!1403277 m!1291863))

(assert (=> b!1403277 m!1291837))

(declare-fun m!1291865 () Bool)

(assert (=> b!1403277 m!1291865))

(assert (=> b!1403277 m!1291863))

(assert (=> b!1403277 m!1291837))

(declare-fun m!1291867 () Bool)

(assert (=> b!1403277 m!1291867))

(declare-fun m!1291869 () Bool)

(assert (=> b!1403277 m!1291869))

(check-sat (not b!1403276) (not b!1403273) (not b!1403270) (not b!1403272) (not b!1403275) (not b!1403277) (not b!1403274) (not start!120512))
