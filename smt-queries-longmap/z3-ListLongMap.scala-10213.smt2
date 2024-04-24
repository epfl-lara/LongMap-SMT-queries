; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120518 () Bool)

(assert start!120518)

(declare-fun b!1401593 () Bool)

(declare-fun e!793646 () Bool)

(assert (=> b!1401593 (= e!793646 true)))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun lt!616619 () (_ BitVec 64))

(declare-fun lt!616616 () (_ BitVec 32))

(declare-datatypes ((array!95849 0))(
  ( (array!95850 (arr!46273 (Array (_ BitVec 32) (_ BitVec 64))) (size!46824 (_ BitVec 32))) )
))
(declare-fun lt!616618 () array!95849)

(declare-datatypes ((SeekEntryResult!10493 0))(
  ( (MissingZero!10493 (index!44349 (_ BitVec 32))) (Found!10493 (index!44350 (_ BitVec 32))) (Intermediate!10493 (undefined!11305 Bool) (index!44351 (_ BitVec 32)) (x!126147 (_ BitVec 32))) (Undefined!10493) (MissingVacant!10493 (index!44352 (_ BitVec 32))) )
))
(declare-fun lt!616617 () SeekEntryResult!10493)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95849 (_ BitVec 32)) SeekEntryResult!10493)

(assert (=> b!1401593 (= lt!616617 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!616616 lt!616619 lt!616618 mask!2840))))

(declare-fun b!1401594 () Bool)

(declare-fun e!793645 () Bool)

(declare-fun e!793649 () Bool)

(assert (=> b!1401594 (= e!793645 e!793649)))

(declare-fun res!939429 () Bool)

(assert (=> b!1401594 (=> res!939429 e!793649)))

(declare-fun lt!616613 () SeekEntryResult!10493)

(declare-fun lt!616615 () SeekEntryResult!10493)

(get-info :version)

(assert (=> b!1401594 (= res!939429 (or (= lt!616613 lt!616615) (not ((_ is Intermediate!10493) lt!616615))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1401594 (= lt!616615 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!616619 mask!2840) lt!616619 lt!616618 mask!2840))))

(declare-fun a!2901 () array!95849)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1401594 (= lt!616619 (select (store (arr!46273 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1401594 (= lt!616618 (array!95850 (store (arr!46273 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46824 a!2901)))))

(declare-fun b!1401595 () Bool)

(assert (=> b!1401595 (= e!793649 e!793646)))

(declare-fun res!939423 () Bool)

(assert (=> b!1401595 (=> res!939423 e!793646)))

(assert (=> b!1401595 (= res!939423 (or (bvslt (x!126147 lt!616613) #b00000000000000000000000000000000) (bvsgt (x!126147 lt!616613) #b01111111111111111111111111111110) (bvslt (x!126147 lt!616615) #b00000000000000000000000000000000) (bvsgt (x!126147 lt!616615) #b01111111111111111111111111111110) (bvslt lt!616616 #b00000000000000000000000000000000) (bvsge lt!616616 (size!46824 a!2901)) (bvslt (index!44351 lt!616613) #b00000000000000000000000000000000) (bvsge (index!44351 lt!616613) (size!46824 a!2901)) (bvslt (index!44351 lt!616615) #b00000000000000000000000000000000) (bvsge (index!44351 lt!616615) (size!46824 a!2901)) (not (= lt!616613 (Intermediate!10493 false (index!44351 lt!616613) (x!126147 lt!616613)))) (not (= lt!616615 (Intermediate!10493 false (index!44351 lt!616615) (x!126147 lt!616615))))))))

(declare-fun e!793643 () Bool)

(assert (=> b!1401595 e!793643))

(declare-fun res!939428 () Bool)

(assert (=> b!1401595 (=> (not res!939428) (not e!793643))))

(assert (=> b!1401595 (= res!939428 (and (not (undefined!11305 lt!616615)) (= (index!44351 lt!616615) i!1037) (bvslt (x!126147 lt!616615) (x!126147 lt!616613)) (= (select (store (arr!46273 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44351 lt!616615)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((Unit!47017 0))(
  ( (Unit!47018) )
))
(declare-fun lt!616612 () Unit!47017)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95849 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47017)

(assert (=> b!1401595 (= lt!616612 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!616616 (x!126147 lt!616613) (index!44351 lt!616613) (x!126147 lt!616615) (index!44351 lt!616615) (undefined!11305 lt!616615) mask!2840))))

(declare-fun b!1401596 () Bool)

(declare-fun res!939425 () Bool)

(declare-fun e!793648 () Bool)

(assert (=> b!1401596 (=> (not res!939425) (not e!793648))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1401596 (= res!939425 (validKeyInArray!0 (select (arr!46273 a!2901) i!1037)))))

(declare-fun b!1401597 () Bool)

(assert (=> b!1401597 (= e!793648 (not e!793645))))

(declare-fun res!939420 () Bool)

(assert (=> b!1401597 (=> res!939420 e!793645)))

(assert (=> b!1401597 (= res!939420 (or (not ((_ is Intermediate!10493) lt!616613)) (undefined!11305 lt!616613)))))

(declare-fun e!793644 () Bool)

(assert (=> b!1401597 e!793644))

(declare-fun res!939426 () Bool)

(assert (=> b!1401597 (=> (not res!939426) (not e!793644))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95849 (_ BitVec 32)) Bool)

(assert (=> b!1401597 (= res!939426 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!616614 () Unit!47017)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95849 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47017)

(assert (=> b!1401597 (= lt!616614 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1401597 (= lt!616613 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!616616 (select (arr!46273 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1401597 (= lt!616616 (toIndex!0 (select (arr!46273 a!2901) j!112) mask!2840))))

(declare-fun b!1401598 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95849 (_ BitVec 32)) SeekEntryResult!10493)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95849 (_ BitVec 32)) SeekEntryResult!10493)

(assert (=> b!1401598 (= e!793643 (= (seekEntryOrOpen!0 lt!616619 lt!616618 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!126147 lt!616615) (index!44351 lt!616615) (index!44351 lt!616615) (select (arr!46273 a!2901) j!112) lt!616618 mask!2840)))))

(declare-fun b!1401599 () Bool)

(declare-fun res!939427 () Bool)

(assert (=> b!1401599 (=> (not res!939427) (not e!793648))))

(assert (=> b!1401599 (= res!939427 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1401600 () Bool)

(assert (=> b!1401600 (= e!793644 (= (seekEntryOrOpen!0 (select (arr!46273 a!2901) j!112) a!2901 mask!2840) (Found!10493 j!112)))))

(declare-fun b!1401601 () Bool)

(declare-fun res!939422 () Bool)

(assert (=> b!1401601 (=> (not res!939422) (not e!793648))))

(assert (=> b!1401601 (= res!939422 (and (= (size!46824 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46824 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46824 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1401602 () Bool)

(declare-fun res!939430 () Bool)

(assert (=> b!1401602 (=> (not res!939430) (not e!793648))))

(assert (=> b!1401602 (= res!939430 (validKeyInArray!0 (select (arr!46273 a!2901) j!112)))))

(declare-fun b!1401603 () Bool)

(declare-fun res!939421 () Bool)

(assert (=> b!1401603 (=> (not res!939421) (not e!793648))))

(declare-datatypes ((List!32779 0))(
  ( (Nil!32776) (Cons!32775 (h!34031 (_ BitVec 64)) (t!47465 List!32779)) )
))
(declare-fun arrayNoDuplicates!0 (array!95849 (_ BitVec 32) List!32779) Bool)

(assert (=> b!1401603 (= res!939421 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32776))))

(declare-fun res!939424 () Bool)

(assert (=> start!120518 (=> (not res!939424) (not e!793648))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120518 (= res!939424 (validMask!0 mask!2840))))

(assert (=> start!120518 e!793648))

(assert (=> start!120518 true))

(declare-fun array_inv!35554 (array!95849) Bool)

(assert (=> start!120518 (array_inv!35554 a!2901)))

(assert (= (and start!120518 res!939424) b!1401601))

(assert (= (and b!1401601 res!939422) b!1401596))

(assert (= (and b!1401596 res!939425) b!1401602))

(assert (= (and b!1401602 res!939430) b!1401599))

(assert (= (and b!1401599 res!939427) b!1401603))

(assert (= (and b!1401603 res!939421) b!1401597))

(assert (= (and b!1401597 res!939426) b!1401600))

(assert (= (and b!1401597 (not res!939420)) b!1401594))

(assert (= (and b!1401594 (not res!939429)) b!1401595))

(assert (= (and b!1401595 res!939428) b!1401598))

(assert (= (and b!1401595 (not res!939423)) b!1401593))

(declare-fun m!1289281 () Bool)

(assert (=> b!1401595 m!1289281))

(declare-fun m!1289283 () Bool)

(assert (=> b!1401595 m!1289283))

(declare-fun m!1289285 () Bool)

(assert (=> b!1401595 m!1289285))

(declare-fun m!1289287 () Bool)

(assert (=> b!1401603 m!1289287))

(declare-fun m!1289289 () Bool)

(assert (=> b!1401593 m!1289289))

(declare-fun m!1289291 () Bool)

(assert (=> b!1401596 m!1289291))

(assert (=> b!1401596 m!1289291))

(declare-fun m!1289293 () Bool)

(assert (=> b!1401596 m!1289293))

(declare-fun m!1289295 () Bool)

(assert (=> b!1401597 m!1289295))

(declare-fun m!1289297 () Bool)

(assert (=> b!1401597 m!1289297))

(assert (=> b!1401597 m!1289295))

(declare-fun m!1289299 () Bool)

(assert (=> b!1401597 m!1289299))

(assert (=> b!1401597 m!1289295))

(declare-fun m!1289301 () Bool)

(assert (=> b!1401597 m!1289301))

(declare-fun m!1289303 () Bool)

(assert (=> b!1401597 m!1289303))

(declare-fun m!1289305 () Bool)

(assert (=> start!120518 m!1289305))

(declare-fun m!1289307 () Bool)

(assert (=> start!120518 m!1289307))

(declare-fun m!1289309 () Bool)

(assert (=> b!1401598 m!1289309))

(assert (=> b!1401598 m!1289295))

(assert (=> b!1401598 m!1289295))

(declare-fun m!1289311 () Bool)

(assert (=> b!1401598 m!1289311))

(assert (=> b!1401600 m!1289295))

(assert (=> b!1401600 m!1289295))

(declare-fun m!1289313 () Bool)

(assert (=> b!1401600 m!1289313))

(declare-fun m!1289315 () Bool)

(assert (=> b!1401599 m!1289315))

(declare-fun m!1289317 () Bool)

(assert (=> b!1401594 m!1289317))

(assert (=> b!1401594 m!1289317))

(declare-fun m!1289319 () Bool)

(assert (=> b!1401594 m!1289319))

(assert (=> b!1401594 m!1289281))

(declare-fun m!1289321 () Bool)

(assert (=> b!1401594 m!1289321))

(assert (=> b!1401602 m!1289295))

(assert (=> b!1401602 m!1289295))

(declare-fun m!1289323 () Bool)

(assert (=> b!1401602 m!1289323))

(check-sat (not b!1401595) (not b!1401593) (not b!1401596) (not start!120518) (not b!1401598) (not b!1401599) (not b!1401597) (not b!1401594) (not b!1401603) (not b!1401600) (not b!1401602))
(check-sat)
