; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121476 () Bool)

(assert start!121476)

(declare-fun res!948701 () Bool)

(declare-fun e!798745 () Bool)

(assert (=> start!121476 (=> (not res!948701) (not e!798745))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121476 (= res!948701 (validMask!0 mask!2840))))

(assert (=> start!121476 e!798745))

(assert (=> start!121476 true))

(declare-datatypes ((array!96477 0))(
  ( (array!96478 (arr!46577 (Array (_ BitVec 32) (_ BitVec 64))) (size!47127 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96477)

(declare-fun array_inv!35605 (array!96477) Bool)

(assert (=> start!121476 (array_inv!35605 a!2901)))

(declare-fun b!1411471 () Bool)

(declare-fun res!948702 () Bool)

(assert (=> b!1411471 (=> (not res!948702) (not e!798745))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1411471 (= res!948702 (and (= (size!47127 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47127 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47127 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1411472 () Bool)

(declare-fun e!798743 () Bool)

(assert (=> b!1411472 (= e!798743 true)))

(declare-datatypes ((SeekEntryResult!10888 0))(
  ( (MissingZero!10888 (index!45929 (_ BitVec 32))) (Found!10888 (index!45930 (_ BitVec 32))) (Intermediate!10888 (undefined!11700 Bool) (index!45931 (_ BitVec 32)) (x!127523 (_ BitVec 32))) (Undefined!10888) (MissingVacant!10888 (index!45932 (_ BitVec 32))) )
))
(declare-fun lt!621740 () SeekEntryResult!10888)

(declare-fun lt!621741 () SeekEntryResult!10888)

(assert (=> b!1411472 (and (not (undefined!11700 lt!621740)) (= (index!45931 lt!621740) i!1037) (bvslt (x!127523 lt!621740) (x!127523 lt!621741)) (= (select (store (arr!46577 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!45931 lt!621740)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!47750 0))(
  ( (Unit!47751) )
))
(declare-fun lt!621739 () Unit!47750)

(declare-fun lt!621737 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96477 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47750)

(assert (=> b!1411472 (= lt!621739 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!621737 (x!127523 lt!621741) (index!45931 lt!621741) (x!127523 lt!621740) (index!45931 lt!621740) (undefined!11700 lt!621740) mask!2840))))

(declare-fun b!1411473 () Bool)

(declare-fun e!798744 () Bool)

(assert (=> b!1411473 (= e!798745 (not e!798744))))

(declare-fun res!948705 () Bool)

(assert (=> b!1411473 (=> res!948705 e!798744)))

(assert (=> b!1411473 (= res!948705 (or (not (is-Intermediate!10888 lt!621741)) (undefined!11700 lt!621741)))))

(declare-fun e!798742 () Bool)

(assert (=> b!1411473 e!798742))

(declare-fun res!948699 () Bool)

(assert (=> b!1411473 (=> (not res!948699) (not e!798742))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96477 (_ BitVec 32)) Bool)

(assert (=> b!1411473 (= res!948699 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!621736 () Unit!47750)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96477 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47750)

(assert (=> b!1411473 (= lt!621736 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96477 (_ BitVec 32)) SeekEntryResult!10888)

(assert (=> b!1411473 (= lt!621741 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!621737 (select (arr!46577 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1411473 (= lt!621737 (toIndex!0 (select (arr!46577 a!2901) j!112) mask!2840))))

(declare-fun b!1411474 () Bool)

(declare-fun res!948698 () Bool)

(assert (=> b!1411474 (=> (not res!948698) (not e!798745))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1411474 (= res!948698 (validKeyInArray!0 (select (arr!46577 a!2901) j!112)))))

(declare-fun b!1411475 () Bool)

(declare-fun res!948706 () Bool)

(assert (=> b!1411475 (=> (not res!948706) (not e!798745))))

(assert (=> b!1411475 (= res!948706 (validKeyInArray!0 (select (arr!46577 a!2901) i!1037)))))

(declare-fun b!1411476 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96477 (_ BitVec 32)) SeekEntryResult!10888)

(assert (=> b!1411476 (= e!798742 (= (seekEntryOrOpen!0 (select (arr!46577 a!2901) j!112) a!2901 mask!2840) (Found!10888 j!112)))))

(declare-fun b!1411477 () Bool)

(assert (=> b!1411477 (= e!798744 e!798743)))

(declare-fun res!948703 () Bool)

(assert (=> b!1411477 (=> res!948703 e!798743)))

(assert (=> b!1411477 (= res!948703 (or (= lt!621741 lt!621740) (not (is-Intermediate!10888 lt!621740))))))

(declare-fun lt!621738 () (_ BitVec 64))

(assert (=> b!1411477 (= lt!621740 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!621738 mask!2840) lt!621738 (array!96478 (store (arr!46577 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47127 a!2901)) mask!2840))))

(assert (=> b!1411477 (= lt!621738 (select (store (arr!46577 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(declare-fun b!1411478 () Bool)

(declare-fun res!948704 () Bool)

(assert (=> b!1411478 (=> (not res!948704) (not e!798745))))

(assert (=> b!1411478 (= res!948704 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1411479 () Bool)

(declare-fun res!948700 () Bool)

(assert (=> b!1411479 (=> (not res!948700) (not e!798745))))

(declare-datatypes ((List!33096 0))(
  ( (Nil!33093) (Cons!33092 (h!34364 (_ BitVec 64)) (t!47790 List!33096)) )
))
(declare-fun arrayNoDuplicates!0 (array!96477 (_ BitVec 32) List!33096) Bool)

(assert (=> b!1411479 (= res!948700 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33093))))

(assert (= (and start!121476 res!948701) b!1411471))

(assert (= (and b!1411471 res!948702) b!1411475))

(assert (= (and b!1411475 res!948706) b!1411474))

(assert (= (and b!1411474 res!948698) b!1411478))

(assert (= (and b!1411478 res!948704) b!1411479))

(assert (= (and b!1411479 res!948700) b!1411473))

(assert (= (and b!1411473 res!948699) b!1411476))

(assert (= (and b!1411473 (not res!948705)) b!1411477))

(assert (= (and b!1411477 (not res!948703)) b!1411472))

(declare-fun m!1301331 () Bool)

(assert (=> b!1411478 m!1301331))

(declare-fun m!1301333 () Bool)

(assert (=> b!1411473 m!1301333))

(declare-fun m!1301335 () Bool)

(assert (=> b!1411473 m!1301335))

(assert (=> b!1411473 m!1301333))

(declare-fun m!1301337 () Bool)

(assert (=> b!1411473 m!1301337))

(assert (=> b!1411473 m!1301333))

(declare-fun m!1301339 () Bool)

(assert (=> b!1411473 m!1301339))

(declare-fun m!1301341 () Bool)

(assert (=> b!1411473 m!1301341))

(declare-fun m!1301343 () Bool)

(assert (=> b!1411472 m!1301343))

(declare-fun m!1301345 () Bool)

(assert (=> b!1411472 m!1301345))

(declare-fun m!1301347 () Bool)

(assert (=> b!1411472 m!1301347))

(assert (=> b!1411476 m!1301333))

(assert (=> b!1411476 m!1301333))

(declare-fun m!1301349 () Bool)

(assert (=> b!1411476 m!1301349))

(declare-fun m!1301351 () Bool)

(assert (=> start!121476 m!1301351))

(declare-fun m!1301353 () Bool)

(assert (=> start!121476 m!1301353))

(declare-fun m!1301355 () Bool)

(assert (=> b!1411477 m!1301355))

(assert (=> b!1411477 m!1301343))

(assert (=> b!1411477 m!1301355))

(declare-fun m!1301357 () Bool)

(assert (=> b!1411477 m!1301357))

(declare-fun m!1301359 () Bool)

(assert (=> b!1411477 m!1301359))

(declare-fun m!1301361 () Bool)

(assert (=> b!1411479 m!1301361))

(assert (=> b!1411474 m!1301333))

(assert (=> b!1411474 m!1301333))

(declare-fun m!1301363 () Bool)

(assert (=> b!1411474 m!1301363))

(declare-fun m!1301365 () Bool)

(assert (=> b!1411475 m!1301365))

(assert (=> b!1411475 m!1301365))

(declare-fun m!1301367 () Bool)

(assert (=> b!1411475 m!1301367))

(push 1)

