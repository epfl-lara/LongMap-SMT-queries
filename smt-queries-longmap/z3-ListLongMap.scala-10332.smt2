; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121472 () Bool)

(assert start!121472)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96426 0))(
  ( (array!96427 (arr!46552 (Array (_ BitVec 32) (_ BitVec 64))) (size!47104 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96426)

(declare-fun b!1411390 () Bool)

(declare-fun e!798706 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10889 0))(
  ( (MissingZero!10889 (index!45933 (_ BitVec 32))) (Found!10889 (index!45934 (_ BitVec 32))) (Intermediate!10889 (undefined!11701 Bool) (index!45935 (_ BitVec 32)) (x!127521 (_ BitVec 32))) (Undefined!10889) (MissingVacant!10889 (index!45936 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96426 (_ BitVec 32)) SeekEntryResult!10889)

(assert (=> b!1411390 (= e!798706 (= (seekEntryOrOpen!0 (select (arr!46552 a!2901) j!112) a!2901 mask!2840) (Found!10889 j!112)))))

(declare-fun b!1411391 () Bool)

(declare-fun res!948670 () Bool)

(declare-fun e!798703 () Bool)

(assert (=> b!1411391 (=> (not res!948670) (not e!798703))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1411391 (= res!948670 (validKeyInArray!0 (select (arr!46552 a!2901) i!1037)))))

(declare-fun b!1411392 () Bool)

(declare-fun e!798707 () Bool)

(declare-fun e!798704 () Bool)

(assert (=> b!1411392 (= e!798707 e!798704)))

(declare-fun res!948674 () Bool)

(assert (=> b!1411392 (=> res!948674 e!798704)))

(declare-fun lt!621546 () SeekEntryResult!10889)

(declare-fun lt!621551 () SeekEntryResult!10889)

(get-info :version)

(assert (=> b!1411392 (= res!948674 (or (= lt!621546 lt!621551) (not ((_ is Intermediate!10889) lt!621551))))))

(declare-fun lt!621548 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96426 (_ BitVec 32)) SeekEntryResult!10889)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1411392 (= lt!621551 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!621548 mask!2840) lt!621548 (array!96427 (store (arr!46552 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47104 a!2901)) mask!2840))))

(assert (=> b!1411392 (= lt!621548 (select (store (arr!46552 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(declare-fun b!1411393 () Bool)

(assert (=> b!1411393 (= e!798704 true)))

(assert (=> b!1411393 (and (not (undefined!11701 lt!621551)) (= (index!45935 lt!621551) i!1037) (bvslt (x!127521 lt!621551) (x!127521 lt!621546)) (= (select (store (arr!46552 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!45935 lt!621551)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!47595 0))(
  ( (Unit!47596) )
))
(declare-fun lt!621547 () Unit!47595)

(declare-fun lt!621550 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96426 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47595)

(assert (=> b!1411393 (= lt!621547 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!621550 (x!127521 lt!621546) (index!45935 lt!621546) (x!127521 lt!621551) (index!45935 lt!621551) (undefined!11701 lt!621551) mask!2840))))

(declare-fun res!948675 () Bool)

(assert (=> start!121472 (=> (not res!948675) (not e!798703))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121472 (= res!948675 (validMask!0 mask!2840))))

(assert (=> start!121472 e!798703))

(assert (=> start!121472 true))

(declare-fun array_inv!35785 (array!96426) Bool)

(assert (=> start!121472 (array_inv!35785 a!2901)))

(declare-fun b!1411394 () Bool)

(assert (=> b!1411394 (= e!798703 (not e!798707))))

(declare-fun res!948676 () Bool)

(assert (=> b!1411394 (=> res!948676 e!798707)))

(assert (=> b!1411394 (= res!948676 (or (not ((_ is Intermediate!10889) lt!621546)) (undefined!11701 lt!621546)))))

(assert (=> b!1411394 e!798706))

(declare-fun res!948668 () Bool)

(assert (=> b!1411394 (=> (not res!948668) (not e!798706))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96426 (_ BitVec 32)) Bool)

(assert (=> b!1411394 (= res!948668 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!621549 () Unit!47595)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96426 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47595)

(assert (=> b!1411394 (= lt!621549 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1411394 (= lt!621546 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!621550 (select (arr!46552 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1411394 (= lt!621550 (toIndex!0 (select (arr!46552 a!2901) j!112) mask!2840))))

(declare-fun b!1411395 () Bool)

(declare-fun res!948673 () Bool)

(assert (=> b!1411395 (=> (not res!948673) (not e!798703))))

(assert (=> b!1411395 (= res!948673 (validKeyInArray!0 (select (arr!46552 a!2901) j!112)))))

(declare-fun b!1411396 () Bool)

(declare-fun res!948671 () Bool)

(assert (=> b!1411396 (=> (not res!948671) (not e!798703))))

(assert (=> b!1411396 (= res!948671 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1411397 () Bool)

(declare-fun res!948669 () Bool)

(assert (=> b!1411397 (=> (not res!948669) (not e!798703))))

(declare-datatypes ((List!33149 0))(
  ( (Nil!33146) (Cons!33145 (h!34417 (_ BitVec 64)) (t!47835 List!33149)) )
))
(declare-fun arrayNoDuplicates!0 (array!96426 (_ BitVec 32) List!33149) Bool)

(assert (=> b!1411397 (= res!948669 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33146))))

(declare-fun b!1411398 () Bool)

(declare-fun res!948672 () Bool)

(assert (=> b!1411398 (=> (not res!948672) (not e!798703))))

(assert (=> b!1411398 (= res!948672 (and (= (size!47104 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47104 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47104 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!121472 res!948675) b!1411398))

(assert (= (and b!1411398 res!948672) b!1411391))

(assert (= (and b!1411391 res!948670) b!1411395))

(assert (= (and b!1411395 res!948673) b!1411396))

(assert (= (and b!1411396 res!948671) b!1411397))

(assert (= (and b!1411397 res!948669) b!1411394))

(assert (= (and b!1411394 res!948668) b!1411390))

(assert (= (and b!1411394 (not res!948676)) b!1411392))

(assert (= (and b!1411392 (not res!948674)) b!1411393))

(declare-fun m!1300795 () Bool)

(assert (=> b!1411393 m!1300795))

(declare-fun m!1300797 () Bool)

(assert (=> b!1411393 m!1300797))

(declare-fun m!1300799 () Bool)

(assert (=> b!1411393 m!1300799))

(declare-fun m!1300801 () Bool)

(assert (=> b!1411397 m!1300801))

(declare-fun m!1300803 () Bool)

(assert (=> b!1411391 m!1300803))

(assert (=> b!1411391 m!1300803))

(declare-fun m!1300805 () Bool)

(assert (=> b!1411391 m!1300805))

(declare-fun m!1300807 () Bool)

(assert (=> b!1411392 m!1300807))

(assert (=> b!1411392 m!1300795))

(assert (=> b!1411392 m!1300807))

(declare-fun m!1300809 () Bool)

(assert (=> b!1411392 m!1300809))

(declare-fun m!1300811 () Bool)

(assert (=> b!1411392 m!1300811))

(declare-fun m!1300813 () Bool)

(assert (=> b!1411395 m!1300813))

(assert (=> b!1411395 m!1300813))

(declare-fun m!1300815 () Bool)

(assert (=> b!1411395 m!1300815))

(assert (=> b!1411390 m!1300813))

(assert (=> b!1411390 m!1300813))

(declare-fun m!1300817 () Bool)

(assert (=> b!1411390 m!1300817))

(declare-fun m!1300819 () Bool)

(assert (=> start!121472 m!1300819))

(declare-fun m!1300821 () Bool)

(assert (=> start!121472 m!1300821))

(assert (=> b!1411394 m!1300813))

(declare-fun m!1300823 () Bool)

(assert (=> b!1411394 m!1300823))

(assert (=> b!1411394 m!1300813))

(assert (=> b!1411394 m!1300813))

(declare-fun m!1300825 () Bool)

(assert (=> b!1411394 m!1300825))

(declare-fun m!1300827 () Bool)

(assert (=> b!1411394 m!1300827))

(declare-fun m!1300829 () Bool)

(assert (=> b!1411394 m!1300829))

(declare-fun m!1300831 () Bool)

(assert (=> b!1411396 m!1300831))

(check-sat (not b!1411395) (not b!1411391) (not b!1411394) (not start!121472) (not b!1411397) (not b!1411393) (not b!1411390) (not b!1411396) (not b!1411392))
(check-sat)
