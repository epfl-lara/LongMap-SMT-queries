; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121462 () Bool)

(assert start!121462)

(declare-fun b!1411282 () Bool)

(declare-fun res!948510 () Bool)

(declare-fun e!798639 () Bool)

(assert (=> b!1411282 (=> (not res!948510) (not e!798639))))

(declare-datatypes ((array!96463 0))(
  ( (array!96464 (arr!46570 (Array (_ BitVec 32) (_ BitVec 64))) (size!47120 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96463)

(declare-datatypes ((List!33089 0))(
  ( (Nil!33086) (Cons!33085 (h!34357 (_ BitVec 64)) (t!47783 List!33089)) )
))
(declare-fun arrayNoDuplicates!0 (array!96463 (_ BitVec 32) List!33089) Bool)

(assert (=> b!1411282 (= res!948510 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33086))))

(declare-fun b!1411283 () Bool)

(declare-fun e!798638 () Bool)

(assert (=> b!1411283 (= e!798638 true)))

(declare-datatypes ((SeekEntryResult!10881 0))(
  ( (MissingZero!10881 (index!45901 (_ BitVec 32))) (Found!10881 (index!45902 (_ BitVec 32))) (Intermediate!10881 (undefined!11693 Bool) (index!45903 (_ BitVec 32)) (x!127492 (_ BitVec 32))) (Undefined!10881) (MissingVacant!10881 (index!45904 (_ BitVec 32))) )
))
(declare-fun lt!621622 () SeekEntryResult!10881)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun lt!621624 () SeekEntryResult!10881)

(assert (=> b!1411283 (and (not (undefined!11693 lt!621622)) (= (index!45903 lt!621622) i!1037) (bvslt (x!127492 lt!621622) (x!127492 lt!621624)))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((Unit!47736 0))(
  ( (Unit!47737) )
))
(declare-fun lt!621621 () Unit!47736)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun lt!621623 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96463 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47736)

(assert (=> b!1411283 (= lt!621621 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!621623 (x!127492 lt!621624) (index!45903 lt!621624) (x!127492 lt!621622) (index!45903 lt!621622) (undefined!11693 lt!621622) mask!2840))))

(declare-fun res!948516 () Bool)

(assert (=> start!121462 (=> (not res!948516) (not e!798639))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121462 (= res!948516 (validMask!0 mask!2840))))

(assert (=> start!121462 e!798639))

(assert (=> start!121462 true))

(declare-fun array_inv!35598 (array!96463) Bool)

(assert (=> start!121462 (array_inv!35598 a!2901)))

(declare-fun b!1411284 () Bool)

(declare-fun res!948514 () Bool)

(assert (=> b!1411284 (=> (not res!948514) (not e!798639))))

(assert (=> b!1411284 (= res!948514 (and (= (size!47120 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47120 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47120 a!2901)) (not (= i!1037 j!112))))))

(declare-fun e!798637 () Bool)

(declare-fun b!1411285 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96463 (_ BitVec 32)) SeekEntryResult!10881)

(assert (=> b!1411285 (= e!798637 (= (seekEntryOrOpen!0 (select (arr!46570 a!2901) j!112) a!2901 mask!2840) (Found!10881 j!112)))))

(declare-fun b!1411286 () Bool)

(declare-fun res!948512 () Bool)

(assert (=> b!1411286 (=> (not res!948512) (not e!798639))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1411286 (= res!948512 (validKeyInArray!0 (select (arr!46570 a!2901) i!1037)))))

(declare-fun b!1411287 () Bool)

(declare-fun e!798641 () Bool)

(assert (=> b!1411287 (= e!798641 e!798638)))

(declare-fun res!948509 () Bool)

(assert (=> b!1411287 (=> res!948509 e!798638)))

(assert (=> b!1411287 (= res!948509 (or (= lt!621624 lt!621622) (not (is-Intermediate!10881 lt!621622))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96463 (_ BitVec 32)) SeekEntryResult!10881)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1411287 (= lt!621622 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46570 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46570 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96464 (store (arr!46570 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47120 a!2901)) mask!2840))))

(declare-fun b!1411288 () Bool)

(assert (=> b!1411288 (= e!798639 (not e!798641))))

(declare-fun res!948513 () Bool)

(assert (=> b!1411288 (=> res!948513 e!798641)))

(assert (=> b!1411288 (= res!948513 (or (not (is-Intermediate!10881 lt!621624)) (undefined!11693 lt!621624)))))

(assert (=> b!1411288 e!798637))

(declare-fun res!948517 () Bool)

(assert (=> b!1411288 (=> (not res!948517) (not e!798637))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96463 (_ BitVec 32)) Bool)

(assert (=> b!1411288 (= res!948517 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!621620 () Unit!47736)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96463 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47736)

(assert (=> b!1411288 (= lt!621620 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1411288 (= lt!621624 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!621623 (select (arr!46570 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1411288 (= lt!621623 (toIndex!0 (select (arr!46570 a!2901) j!112) mask!2840))))

(declare-fun b!1411289 () Bool)

(declare-fun res!948511 () Bool)

(assert (=> b!1411289 (=> (not res!948511) (not e!798639))))

(assert (=> b!1411289 (= res!948511 (validKeyInArray!0 (select (arr!46570 a!2901) j!112)))))

(declare-fun b!1411290 () Bool)

(declare-fun res!948515 () Bool)

(assert (=> b!1411290 (=> (not res!948515) (not e!798639))))

(assert (=> b!1411290 (= res!948515 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(assert (= (and start!121462 res!948516) b!1411284))

(assert (= (and b!1411284 res!948514) b!1411286))

(assert (= (and b!1411286 res!948512) b!1411289))

(assert (= (and b!1411289 res!948511) b!1411290))

(assert (= (and b!1411290 res!948515) b!1411282))

(assert (= (and b!1411282 res!948510) b!1411288))

(assert (= (and b!1411288 res!948517) b!1411285))

(assert (= (and b!1411288 (not res!948513)) b!1411287))

(assert (= (and b!1411287 (not res!948509)) b!1411283))

(declare-fun m!1301073 () Bool)

(assert (=> b!1411287 m!1301073))

(declare-fun m!1301075 () Bool)

(assert (=> b!1411287 m!1301075))

(assert (=> b!1411287 m!1301075))

(declare-fun m!1301077 () Bool)

(assert (=> b!1411287 m!1301077))

(assert (=> b!1411287 m!1301077))

(assert (=> b!1411287 m!1301075))

(declare-fun m!1301079 () Bool)

(assert (=> b!1411287 m!1301079))

(declare-fun m!1301081 () Bool)

(assert (=> b!1411282 m!1301081))

(declare-fun m!1301083 () Bool)

(assert (=> b!1411283 m!1301083))

(declare-fun m!1301085 () Bool)

(assert (=> b!1411286 m!1301085))

(assert (=> b!1411286 m!1301085))

(declare-fun m!1301087 () Bool)

(assert (=> b!1411286 m!1301087))

(declare-fun m!1301089 () Bool)

(assert (=> b!1411285 m!1301089))

(assert (=> b!1411285 m!1301089))

(declare-fun m!1301091 () Bool)

(assert (=> b!1411285 m!1301091))

(declare-fun m!1301093 () Bool)

(assert (=> b!1411290 m!1301093))

(assert (=> b!1411288 m!1301089))

(declare-fun m!1301095 () Bool)

(assert (=> b!1411288 m!1301095))

(assert (=> b!1411288 m!1301089))

(declare-fun m!1301097 () Bool)

(assert (=> b!1411288 m!1301097))

(assert (=> b!1411288 m!1301089))

(declare-fun m!1301099 () Bool)

(assert (=> b!1411288 m!1301099))

(declare-fun m!1301101 () Bool)

(assert (=> b!1411288 m!1301101))

(assert (=> b!1411289 m!1301089))

(assert (=> b!1411289 m!1301089))

(declare-fun m!1301103 () Bool)

(assert (=> b!1411289 m!1301103))

(declare-fun m!1301105 () Bool)

(assert (=> start!121462 m!1301105))

(declare-fun m!1301107 () Bool)

(assert (=> start!121462 m!1301107))

(push 1)

