; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121444 () Bool)

(assert start!121444)

(declare-fun b!1411037 () Bool)

(declare-fun res!948267 () Bool)

(declare-fun e!798503 () Bool)

(assert (=> b!1411037 (=> (not res!948267) (not e!798503))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96445 0))(
  ( (array!96446 (arr!46561 (Array (_ BitVec 32) (_ BitVec 64))) (size!47111 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96445)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1411037 (= res!948267 (and (= (size!47111 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47111 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47111 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1411038 () Bool)

(declare-fun e!798501 () Bool)

(declare-datatypes ((SeekEntryResult!10872 0))(
  ( (MissingZero!10872 (index!45865 (_ BitVec 32))) (Found!10872 (index!45866 (_ BitVec 32))) (Intermediate!10872 (undefined!11684 Bool) (index!45867 (_ BitVec 32)) (x!127459 (_ BitVec 32))) (Undefined!10872) (MissingVacant!10872 (index!45868 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96445 (_ BitVec 32)) SeekEntryResult!10872)

(assert (=> b!1411038 (= e!798501 (= (seekEntryOrOpen!0 (select (arr!46561 a!2901) j!112) a!2901 mask!2840) (Found!10872 j!112)))))

(declare-fun b!1411039 () Bool)

(declare-fun e!798504 () Bool)

(assert (=> b!1411039 (= e!798503 (not e!798504))))

(declare-fun res!948268 () Bool)

(assert (=> b!1411039 (=> res!948268 e!798504)))

(declare-fun lt!621489 () SeekEntryResult!10872)

(assert (=> b!1411039 (= res!948268 (or (not (is-Intermediate!10872 lt!621489)) (undefined!11684 lt!621489)))))

(assert (=> b!1411039 e!798501))

(declare-fun res!948264 () Bool)

(assert (=> b!1411039 (=> (not res!948264) (not e!798501))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96445 (_ BitVec 32)) Bool)

(assert (=> b!1411039 (= res!948264 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47718 0))(
  ( (Unit!47719) )
))
(declare-fun lt!621485 () Unit!47718)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96445 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47718)

(assert (=> b!1411039 (= lt!621485 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!621488 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96445 (_ BitVec 32)) SeekEntryResult!10872)

(assert (=> b!1411039 (= lt!621489 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!621488 (select (arr!46561 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1411039 (= lt!621488 (toIndex!0 (select (arr!46561 a!2901) j!112) mask!2840))))

(declare-fun b!1411040 () Bool)

(declare-fun res!948273 () Bool)

(assert (=> b!1411040 (=> (not res!948273) (not e!798503))))

(declare-datatypes ((List!33080 0))(
  ( (Nil!33077) (Cons!33076 (h!34348 (_ BitVec 64)) (t!47774 List!33080)) )
))
(declare-fun arrayNoDuplicates!0 (array!96445 (_ BitVec 32) List!33080) Bool)

(assert (=> b!1411040 (= res!948273 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33077))))

(declare-fun b!1411041 () Bool)

(declare-fun res!948271 () Bool)

(assert (=> b!1411041 (=> (not res!948271) (not e!798503))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1411041 (= res!948271 (validKeyInArray!0 (select (arr!46561 a!2901) i!1037)))))

(declare-fun b!1411042 () Bool)

(declare-fun e!798502 () Bool)

(declare-fun e!798506 () Bool)

(assert (=> b!1411042 (= e!798502 e!798506)))

(declare-fun res!948265 () Bool)

(assert (=> b!1411042 (=> res!948265 e!798506)))

(declare-fun lt!621486 () SeekEntryResult!10872)

(declare-fun lt!621483 () SeekEntryResult!10872)

(assert (=> b!1411042 (= res!948265 (not (= lt!621486 lt!621483)))))

(assert (=> b!1411042 (= lt!621483 (Intermediate!10872 (undefined!11684 lt!621486) (index!45867 lt!621486) (x!127459 lt!621486)))))

(declare-fun b!1411043 () Bool)

(assert (=> b!1411043 (= e!798504 e!798502)))

(declare-fun res!948272 () Bool)

(assert (=> b!1411043 (=> res!948272 e!798502)))

(assert (=> b!1411043 (= res!948272 (or (= lt!621489 lt!621486) (not (is-Intermediate!10872 lt!621486)) (bvslt (x!127459 lt!621489) #b00000000000000000000000000000000) (bvsgt (x!127459 lt!621489) #b01111111111111111111111111111110) (bvslt lt!621488 #b00000000000000000000000000000000) (bvsge lt!621488 (size!47111 a!2901)) (bvslt (index!45867 lt!621489) #b00000000000000000000000000000000) (bvsge (index!45867 lt!621489) (size!47111 a!2901)) (not (= lt!621489 (Intermediate!10872 false (index!45867 lt!621489) (x!127459 lt!621489))))))))

(declare-fun lt!621487 () (_ BitVec 64))

(declare-fun lt!621484 () array!96445)

(assert (=> b!1411043 (= lt!621486 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!621487 mask!2840) lt!621487 lt!621484 mask!2840))))

(assert (=> b!1411043 (= lt!621487 (select (store (arr!46561 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1411043 (= lt!621484 (array!96446 (store (arr!46561 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47111 a!2901)))))

(declare-fun b!1411044 () Bool)

(declare-fun res!948270 () Bool)

(assert (=> b!1411044 (=> (not res!948270) (not e!798503))))

(assert (=> b!1411044 (= res!948270 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1411046 () Bool)

(declare-fun res!948274 () Bool)

(assert (=> b!1411046 (=> res!948274 e!798506)))

(assert (=> b!1411046 (= res!948274 (not (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!621488 lt!621487 lt!621484 mask!2840) lt!621483)))))

(declare-fun b!1411047 () Bool)

(declare-fun res!948266 () Bool)

(assert (=> b!1411047 (=> (not res!948266) (not e!798503))))

(assert (=> b!1411047 (= res!948266 (validKeyInArray!0 (select (arr!46561 a!2901) j!112)))))

(declare-fun res!948269 () Bool)

(assert (=> start!121444 (=> (not res!948269) (not e!798503))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121444 (= res!948269 (validMask!0 mask!2840))))

(assert (=> start!121444 e!798503))

(assert (=> start!121444 true))

(declare-fun array_inv!35589 (array!96445) Bool)

(assert (=> start!121444 (array_inv!35589 a!2901)))

(declare-fun b!1411045 () Bool)

(assert (=> b!1411045 (= e!798506 (or (undefined!11684 lt!621486) (not (= (index!45867 lt!621489) (index!45867 lt!621486))) (not (= (x!127459 lt!621489) (x!127459 lt!621486)))))))

(assert (= (and start!121444 res!948269) b!1411037))

(assert (= (and b!1411037 res!948267) b!1411041))

(assert (= (and b!1411041 res!948271) b!1411047))

(assert (= (and b!1411047 res!948266) b!1411044))

(assert (= (and b!1411044 res!948270) b!1411040))

(assert (= (and b!1411040 res!948273) b!1411039))

(assert (= (and b!1411039 res!948264) b!1411038))

(assert (= (and b!1411039 (not res!948268)) b!1411043))

(assert (= (and b!1411043 (not res!948272)) b!1411042))

(assert (= (and b!1411042 (not res!948265)) b!1411046))

(assert (= (and b!1411046 (not res!948274)) b!1411045))

(declare-fun m!1300749 () Bool)

(assert (=> start!121444 m!1300749))

(declare-fun m!1300751 () Bool)

(assert (=> start!121444 m!1300751))

(declare-fun m!1300753 () Bool)

(assert (=> b!1411046 m!1300753))

(declare-fun m!1300755 () Bool)

(assert (=> b!1411041 m!1300755))

(assert (=> b!1411041 m!1300755))

(declare-fun m!1300757 () Bool)

(assert (=> b!1411041 m!1300757))

(declare-fun m!1300759 () Bool)

(assert (=> b!1411038 m!1300759))

(assert (=> b!1411038 m!1300759))

(declare-fun m!1300761 () Bool)

(assert (=> b!1411038 m!1300761))

(assert (=> b!1411039 m!1300759))

(declare-fun m!1300763 () Bool)

(assert (=> b!1411039 m!1300763))

(assert (=> b!1411039 m!1300759))

(declare-fun m!1300765 () Bool)

(assert (=> b!1411039 m!1300765))

(assert (=> b!1411039 m!1300759))

(declare-fun m!1300767 () Bool)

(assert (=> b!1411039 m!1300767))

(declare-fun m!1300769 () Bool)

(assert (=> b!1411039 m!1300769))

(declare-fun m!1300771 () Bool)

(assert (=> b!1411044 m!1300771))

(declare-fun m!1300773 () Bool)

(assert (=> b!1411043 m!1300773))

(assert (=> b!1411043 m!1300773))

(declare-fun m!1300775 () Bool)

(assert (=> b!1411043 m!1300775))

(declare-fun m!1300777 () Bool)

(assert (=> b!1411043 m!1300777))

(declare-fun m!1300779 () Bool)

(assert (=> b!1411043 m!1300779))

(assert (=> b!1411047 m!1300759))

(assert (=> b!1411047 m!1300759))

(declare-fun m!1300781 () Bool)

(assert (=> b!1411047 m!1300781))

(declare-fun m!1300783 () Bool)

(assert (=> b!1411040 m!1300783))

(push 1)

