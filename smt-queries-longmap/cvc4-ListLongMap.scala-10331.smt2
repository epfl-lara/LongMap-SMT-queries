; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121474 () Bool)

(assert start!121474)

(declare-datatypes ((array!96475 0))(
  ( (array!96476 (arr!46576 (Array (_ BitVec 32) (_ BitVec 64))) (size!47126 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96475)

(declare-datatypes ((SeekEntryResult!10887 0))(
  ( (MissingZero!10887 (index!45925 (_ BitVec 32))) (Found!10887 (index!45926 (_ BitVec 32))) (Intermediate!10887 (undefined!11699 Bool) (index!45927 (_ BitVec 32)) (x!127514 (_ BitVec 32))) (Undefined!10887) (MissingVacant!10887 (index!45928 (_ BitVec 32))) )
))
(declare-fun lt!621721 () SeekEntryResult!10887)

(declare-fun e!798728 () Bool)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun b!1411444 () Bool)

(assert (=> b!1411444 (= e!798728 (= (select (store (arr!46576 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!45927 lt!621721)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!621722 () SeekEntryResult!10887)

(assert (=> b!1411444 (and (not (undefined!11699 lt!621721)) (= (index!45927 lt!621721) i!1037) (bvslt (x!127514 lt!621721) (x!127514 lt!621722)))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun lt!621718 () (_ BitVec 32))

(declare-datatypes ((Unit!47748 0))(
  ( (Unit!47749) )
))
(declare-fun lt!621719 () Unit!47748)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96475 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47748)

(assert (=> b!1411444 (= lt!621719 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!621718 (x!127514 lt!621722) (index!45927 lt!621722) (x!127514 lt!621721) (index!45927 lt!621721) (undefined!11699 lt!621721) mask!2840))))

(declare-fun res!948673 () Bool)

(declare-fun e!798727 () Bool)

(assert (=> start!121474 (=> (not res!948673) (not e!798727))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121474 (= res!948673 (validMask!0 mask!2840))))

(assert (=> start!121474 e!798727))

(assert (=> start!121474 true))

(declare-fun array_inv!35604 (array!96475) Bool)

(assert (=> start!121474 (array_inv!35604 a!2901)))

(declare-fun b!1411445 () Bool)

(declare-fun res!948677 () Bool)

(assert (=> b!1411445 (=> (not res!948677) (not e!798727))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1411445 (= res!948677 (validKeyInArray!0 (select (arr!46576 a!2901) i!1037)))))

(declare-fun e!798729 () Bool)

(declare-fun b!1411446 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96475 (_ BitVec 32)) SeekEntryResult!10887)

(assert (=> b!1411446 (= e!798729 (= (seekEntryOrOpen!0 (select (arr!46576 a!2901) j!112) a!2901 mask!2840) (Found!10887 j!112)))))

(declare-fun b!1411447 () Bool)

(declare-fun res!948679 () Bool)

(assert (=> b!1411447 (=> (not res!948679) (not e!798727))))

(declare-datatypes ((List!33095 0))(
  ( (Nil!33092) (Cons!33091 (h!34363 (_ BitVec 64)) (t!47789 List!33095)) )
))
(declare-fun arrayNoDuplicates!0 (array!96475 (_ BitVec 32) List!33095) Bool)

(assert (=> b!1411447 (= res!948679 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33092))))

(declare-fun b!1411448 () Bool)

(declare-fun e!798731 () Bool)

(assert (=> b!1411448 (= e!798731 e!798728)))

(declare-fun res!948672 () Bool)

(assert (=> b!1411448 (=> res!948672 e!798728)))

(assert (=> b!1411448 (= res!948672 (or (= lt!621722 lt!621721) (not (is-Intermediate!10887 lt!621721))))))

(declare-fun lt!621720 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96475 (_ BitVec 32)) SeekEntryResult!10887)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1411448 (= lt!621721 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!621720 mask!2840) lt!621720 (array!96476 (store (arr!46576 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47126 a!2901)) mask!2840))))

(assert (=> b!1411448 (= lt!621720 (select (store (arr!46576 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(declare-fun b!1411449 () Bool)

(declare-fun res!948675 () Bool)

(assert (=> b!1411449 (=> (not res!948675) (not e!798727))))

(assert (=> b!1411449 (= res!948675 (and (= (size!47126 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47126 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47126 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1411450 () Bool)

(assert (=> b!1411450 (= e!798727 (not e!798731))))

(declare-fun res!948671 () Bool)

(assert (=> b!1411450 (=> res!948671 e!798731)))

(assert (=> b!1411450 (= res!948671 (or (not (is-Intermediate!10887 lt!621722)) (undefined!11699 lt!621722)))))

(assert (=> b!1411450 e!798729))

(declare-fun res!948674 () Bool)

(assert (=> b!1411450 (=> (not res!948674) (not e!798729))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96475 (_ BitVec 32)) Bool)

(assert (=> b!1411450 (= res!948674 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!621723 () Unit!47748)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96475 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47748)

(assert (=> b!1411450 (= lt!621723 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1411450 (= lt!621722 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!621718 (select (arr!46576 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1411450 (= lt!621718 (toIndex!0 (select (arr!46576 a!2901) j!112) mask!2840))))

(declare-fun b!1411451 () Bool)

(declare-fun res!948676 () Bool)

(assert (=> b!1411451 (=> (not res!948676) (not e!798727))))

(assert (=> b!1411451 (= res!948676 (validKeyInArray!0 (select (arr!46576 a!2901) j!112)))))

(declare-fun b!1411452 () Bool)

(declare-fun res!948678 () Bool)

(assert (=> b!1411452 (=> (not res!948678) (not e!798727))))

(assert (=> b!1411452 (= res!948678 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(assert (= (and start!121474 res!948673) b!1411449))

(assert (= (and b!1411449 res!948675) b!1411445))

(assert (= (and b!1411445 res!948677) b!1411451))

(assert (= (and b!1411451 res!948676) b!1411452))

(assert (= (and b!1411452 res!948678) b!1411447))

(assert (= (and b!1411447 res!948679) b!1411450))

(assert (= (and b!1411450 res!948674) b!1411446))

(assert (= (and b!1411450 (not res!948671)) b!1411448))

(assert (= (and b!1411448 (not res!948672)) b!1411444))

(declare-fun m!1301293 () Bool)

(assert (=> b!1411450 m!1301293))

(declare-fun m!1301295 () Bool)

(assert (=> b!1411450 m!1301295))

(assert (=> b!1411450 m!1301293))

(declare-fun m!1301297 () Bool)

(assert (=> b!1411450 m!1301297))

(declare-fun m!1301299 () Bool)

(assert (=> b!1411450 m!1301299))

(assert (=> b!1411450 m!1301293))

(declare-fun m!1301301 () Bool)

(assert (=> b!1411450 m!1301301))

(assert (=> b!1411446 m!1301293))

(assert (=> b!1411446 m!1301293))

(declare-fun m!1301303 () Bool)

(assert (=> b!1411446 m!1301303))

(declare-fun m!1301305 () Bool)

(assert (=> b!1411448 m!1301305))

(declare-fun m!1301307 () Bool)

(assert (=> b!1411448 m!1301307))

(assert (=> b!1411448 m!1301305))

(declare-fun m!1301309 () Bool)

(assert (=> b!1411448 m!1301309))

(declare-fun m!1301311 () Bool)

(assert (=> b!1411448 m!1301311))

(declare-fun m!1301313 () Bool)

(assert (=> start!121474 m!1301313))

(declare-fun m!1301315 () Bool)

(assert (=> start!121474 m!1301315))

(assert (=> b!1411451 m!1301293))

(assert (=> b!1411451 m!1301293))

(declare-fun m!1301317 () Bool)

(assert (=> b!1411451 m!1301317))

(assert (=> b!1411444 m!1301307))

(declare-fun m!1301319 () Bool)

(assert (=> b!1411444 m!1301319))

(declare-fun m!1301321 () Bool)

(assert (=> b!1411444 m!1301321))

(declare-fun m!1301323 () Bool)

(assert (=> b!1411445 m!1301323))

(assert (=> b!1411445 m!1301323))

(declare-fun m!1301325 () Bool)

(assert (=> b!1411445 m!1301325))

(declare-fun m!1301327 () Bool)

(assert (=> b!1411452 m!1301327))

(declare-fun m!1301329 () Bool)

(assert (=> b!1411447 m!1301329))

(push 1)

