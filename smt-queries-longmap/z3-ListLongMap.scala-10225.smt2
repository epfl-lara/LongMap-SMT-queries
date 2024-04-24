; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120590 () Bool)

(assert start!120590)

(declare-fun b!1402781 () Bool)

(declare-fun e!794404 () Bool)

(assert (=> b!1402781 (= e!794404 true)))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun lt!617476 () (_ BitVec 64))

(declare-datatypes ((array!95921 0))(
  ( (array!95922 (arr!46309 (Array (_ BitVec 32) (_ BitVec 64))) (size!46860 (_ BitVec 32))) )
))
(declare-fun lt!617480 () array!95921)

(declare-datatypes ((SeekEntryResult!10529 0))(
  ( (MissingZero!10529 (index!44493 (_ BitVec 32))) (Found!10529 (index!44494 (_ BitVec 32))) (Intermediate!10529 (undefined!11341 Bool) (index!44495 (_ BitVec 32)) (x!126279 (_ BitVec 32))) (Undefined!10529) (MissingVacant!10529 (index!44496 (_ BitVec 32))) )
))
(declare-fun lt!617482 () SeekEntryResult!10529)

(declare-fun lt!617483 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95921 (_ BitVec 32)) SeekEntryResult!10529)

(assert (=> b!1402781 (= lt!617482 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!617483 lt!617476 lt!617480 mask!2840))))

(declare-fun b!1402782 () Bool)

(declare-fun e!794405 () Bool)

(assert (=> b!1402782 (= e!794405 e!794404)))

(declare-fun res!940618 () Bool)

(assert (=> b!1402782 (=> res!940618 e!794404)))

(declare-fun lt!617478 () SeekEntryResult!10529)

(declare-fun a!2901 () array!95921)

(declare-fun lt!617477 () SeekEntryResult!10529)

(assert (=> b!1402782 (= res!940618 (or (bvslt (x!126279 lt!617477) #b00000000000000000000000000000000) (bvsgt (x!126279 lt!617477) #b01111111111111111111111111111110) (bvslt (x!126279 lt!617478) #b00000000000000000000000000000000) (bvsgt (x!126279 lt!617478) #b01111111111111111111111111111110) (bvslt lt!617483 #b00000000000000000000000000000000) (bvsge lt!617483 (size!46860 a!2901)) (bvslt (index!44495 lt!617477) #b00000000000000000000000000000000) (bvsge (index!44495 lt!617477) (size!46860 a!2901)) (bvslt (index!44495 lt!617478) #b00000000000000000000000000000000) (bvsge (index!44495 lt!617478) (size!46860 a!2901)) (not (= lt!617477 (Intermediate!10529 false (index!44495 lt!617477) (x!126279 lt!617477)))) (not (= lt!617478 (Intermediate!10529 false (index!44495 lt!617478) (x!126279 lt!617478))))))))

(declare-fun e!794403 () Bool)

(assert (=> b!1402782 e!794403))

(declare-fun res!940609 () Bool)

(assert (=> b!1402782 (=> (not res!940609) (not e!794403))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1402782 (= res!940609 (and (not (undefined!11341 lt!617478)) (= (index!44495 lt!617478) i!1037) (bvslt (x!126279 lt!617478) (x!126279 lt!617477)) (= (select (store (arr!46309 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44495 lt!617478)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((Unit!47089 0))(
  ( (Unit!47090) )
))
(declare-fun lt!617479 () Unit!47089)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95921 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47089)

(assert (=> b!1402782 (= lt!617479 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!617483 (x!126279 lt!617477) (index!44495 lt!617477) (x!126279 lt!617478) (index!44495 lt!617478) (undefined!11341 lt!617478) mask!2840))))

(declare-fun b!1402783 () Bool)

(declare-fun res!940613 () Bool)

(declare-fun e!794402 () Bool)

(assert (=> b!1402783 (=> (not res!940613) (not e!794402))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1402783 (= res!940613 (validKeyInArray!0 (select (arr!46309 a!2901) i!1037)))))

(declare-fun b!1402784 () Bool)

(declare-fun res!940611 () Bool)

(assert (=> b!1402784 (=> (not res!940611) (not e!794402))))

(assert (=> b!1402784 (= res!940611 (validKeyInArray!0 (select (arr!46309 a!2901) j!112)))))

(declare-fun b!1402785 () Bool)

(declare-fun res!940610 () Bool)

(assert (=> b!1402785 (=> (not res!940610) (not e!794402))))

(assert (=> b!1402785 (= res!940610 (and (= (size!46860 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46860 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46860 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1402786 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95921 (_ BitVec 32)) SeekEntryResult!10529)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95921 (_ BitVec 32)) SeekEntryResult!10529)

(assert (=> b!1402786 (= e!794403 (= (seekEntryOrOpen!0 lt!617476 lt!617480 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!126279 lt!617478) (index!44495 lt!617478) (index!44495 lt!617478) (select (arr!46309 a!2901) j!112) lt!617480 mask!2840)))))

(declare-fun res!940608 () Bool)

(assert (=> start!120590 (=> (not res!940608) (not e!794402))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120590 (= res!940608 (validMask!0 mask!2840))))

(assert (=> start!120590 e!794402))

(assert (=> start!120590 true))

(declare-fun array_inv!35590 (array!95921) Bool)

(assert (=> start!120590 (array_inv!35590 a!2901)))

(declare-fun b!1402787 () Bool)

(declare-fun e!794400 () Bool)

(assert (=> b!1402787 (= e!794400 (= (seekEntryOrOpen!0 (select (arr!46309 a!2901) j!112) a!2901 mask!2840) (Found!10529 j!112)))))

(declare-fun b!1402788 () Bool)

(declare-fun res!940614 () Bool)

(assert (=> b!1402788 (=> (not res!940614) (not e!794402))))

(declare-datatypes ((List!32815 0))(
  ( (Nil!32812) (Cons!32811 (h!34067 (_ BitVec 64)) (t!47501 List!32815)) )
))
(declare-fun arrayNoDuplicates!0 (array!95921 (_ BitVec 32) List!32815) Bool)

(assert (=> b!1402788 (= res!940614 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32812))))

(declare-fun b!1402789 () Bool)

(declare-fun e!794401 () Bool)

(assert (=> b!1402789 (= e!794401 e!794405)))

(declare-fun res!940615 () Bool)

(assert (=> b!1402789 (=> res!940615 e!794405)))

(get-info :version)

(assert (=> b!1402789 (= res!940615 (or (= lt!617477 lt!617478) (not ((_ is Intermediate!10529) lt!617478))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1402789 (= lt!617478 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!617476 mask!2840) lt!617476 lt!617480 mask!2840))))

(assert (=> b!1402789 (= lt!617476 (select (store (arr!46309 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1402789 (= lt!617480 (array!95922 (store (arr!46309 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46860 a!2901)))))

(declare-fun b!1402790 () Bool)

(assert (=> b!1402790 (= e!794402 (not e!794401))))

(declare-fun res!940616 () Bool)

(assert (=> b!1402790 (=> res!940616 e!794401)))

(assert (=> b!1402790 (= res!940616 (or (not ((_ is Intermediate!10529) lt!617477)) (undefined!11341 lt!617477)))))

(assert (=> b!1402790 e!794400))

(declare-fun res!940612 () Bool)

(assert (=> b!1402790 (=> (not res!940612) (not e!794400))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95921 (_ BitVec 32)) Bool)

(assert (=> b!1402790 (= res!940612 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!617481 () Unit!47089)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95921 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47089)

(assert (=> b!1402790 (= lt!617481 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1402790 (= lt!617477 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!617483 (select (arr!46309 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1402790 (= lt!617483 (toIndex!0 (select (arr!46309 a!2901) j!112) mask!2840))))

(declare-fun b!1402791 () Bool)

(declare-fun res!940617 () Bool)

(assert (=> b!1402791 (=> (not res!940617) (not e!794402))))

(assert (=> b!1402791 (= res!940617 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(assert (= (and start!120590 res!940608) b!1402785))

(assert (= (and b!1402785 res!940610) b!1402783))

(assert (= (and b!1402783 res!940613) b!1402784))

(assert (= (and b!1402784 res!940611) b!1402791))

(assert (= (and b!1402791 res!940617) b!1402788))

(assert (= (and b!1402788 res!940614) b!1402790))

(assert (= (and b!1402790 res!940612) b!1402787))

(assert (= (and b!1402790 (not res!940616)) b!1402789))

(assert (= (and b!1402789 (not res!940615)) b!1402782))

(assert (= (and b!1402782 res!940609) b!1402786))

(assert (= (and b!1402782 (not res!940618)) b!1402781))

(declare-fun m!1290865 () Bool)

(assert (=> b!1402786 m!1290865))

(declare-fun m!1290867 () Bool)

(assert (=> b!1402786 m!1290867))

(assert (=> b!1402786 m!1290867))

(declare-fun m!1290869 () Bool)

(assert (=> b!1402786 m!1290869))

(declare-fun m!1290871 () Bool)

(assert (=> b!1402781 m!1290871))

(declare-fun m!1290873 () Bool)

(assert (=> b!1402789 m!1290873))

(assert (=> b!1402789 m!1290873))

(declare-fun m!1290875 () Bool)

(assert (=> b!1402789 m!1290875))

(declare-fun m!1290877 () Bool)

(assert (=> b!1402789 m!1290877))

(declare-fun m!1290879 () Bool)

(assert (=> b!1402789 m!1290879))

(assert (=> b!1402784 m!1290867))

(assert (=> b!1402784 m!1290867))

(declare-fun m!1290881 () Bool)

(assert (=> b!1402784 m!1290881))

(declare-fun m!1290883 () Bool)

(assert (=> start!120590 m!1290883))

(declare-fun m!1290885 () Bool)

(assert (=> start!120590 m!1290885))

(declare-fun m!1290887 () Bool)

(assert (=> b!1402791 m!1290887))

(assert (=> b!1402787 m!1290867))

(assert (=> b!1402787 m!1290867))

(declare-fun m!1290889 () Bool)

(assert (=> b!1402787 m!1290889))

(declare-fun m!1290891 () Bool)

(assert (=> b!1402788 m!1290891))

(assert (=> b!1402790 m!1290867))

(declare-fun m!1290893 () Bool)

(assert (=> b!1402790 m!1290893))

(assert (=> b!1402790 m!1290867))

(declare-fun m!1290895 () Bool)

(assert (=> b!1402790 m!1290895))

(declare-fun m!1290897 () Bool)

(assert (=> b!1402790 m!1290897))

(assert (=> b!1402790 m!1290867))

(declare-fun m!1290899 () Bool)

(assert (=> b!1402790 m!1290899))

(assert (=> b!1402782 m!1290877))

(declare-fun m!1290901 () Bool)

(assert (=> b!1402782 m!1290901))

(declare-fun m!1290903 () Bool)

(assert (=> b!1402782 m!1290903))

(declare-fun m!1290905 () Bool)

(assert (=> b!1402783 m!1290905))

(assert (=> b!1402783 m!1290905))

(declare-fun m!1290907 () Bool)

(assert (=> b!1402783 m!1290907))

(check-sat (not b!1402789) (not start!120590) (not b!1402791) (not b!1402787) (not b!1402784) (not b!1402788) (not b!1402782) (not b!1402781) (not b!1402786) (not b!1402790) (not b!1402783))
(check-sat)
