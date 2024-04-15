; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121604 () Bool)

(assert start!121604)

(declare-fun b!1412655 () Bool)

(declare-fun e!799442 () Bool)

(declare-fun e!799444 () Bool)

(assert (=> b!1412655 (= e!799442 e!799444)))

(declare-fun res!949699 () Bool)

(assert (=> b!1412655 (=> res!949699 e!799444)))

(declare-datatypes ((SeekEntryResult!10922 0))(
  ( (MissingZero!10922 (index!46068 (_ BitVec 32))) (Found!10922 (index!46069 (_ BitVec 32))) (Intermediate!10922 (undefined!11734 Bool) (index!46070 (_ BitVec 32)) (x!127654 (_ BitVec 32))) (Undefined!10922) (MissingVacant!10922 (index!46071 (_ BitVec 32))) )
))
(declare-fun lt!622352 () SeekEntryResult!10922)

(declare-fun lt!622353 () SeekEntryResult!10922)

(get-info :version)

(assert (=> b!1412655 (= res!949699 (or (= lt!622352 lt!622353) (not ((_ is Intermediate!10922) lt!622353))))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96495 0))(
  ( (array!96496 (arr!46585 (Array (_ BitVec 32) (_ BitVec 64))) (size!47137 (_ BitVec 32))) )
))
(declare-fun lt!622358 () array!96495)

(declare-fun lt!622355 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96495 (_ BitVec 32)) SeekEntryResult!10922)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1412655 (= lt!622353 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!622355 mask!2840) lt!622355 lt!622358 mask!2840))))

(declare-fun a!2901 () array!96495)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1412655 (= lt!622355 (select (store (arr!46585 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1412655 (= lt!622358 (array!96496 (store (arr!46585 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47137 a!2901)))))

(declare-fun b!1412656 () Bool)

(declare-fun res!949704 () Bool)

(declare-fun e!799443 () Bool)

(assert (=> b!1412656 (=> (not res!949704) (not e!799443))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96495 (_ BitVec 32)) Bool)

(assert (=> b!1412656 (= res!949704 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1412657 () Bool)

(declare-fun res!949696 () Bool)

(assert (=> b!1412657 (=> (not res!949696) (not e!799443))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1412657 (= res!949696 (validKeyInArray!0 (select (arr!46585 a!2901) j!112)))))

(declare-fun b!1412658 () Bool)

(declare-fun res!949697 () Bool)

(assert (=> b!1412658 (=> (not res!949697) (not e!799443))))

(assert (=> b!1412658 (= res!949697 (validKeyInArray!0 (select (arr!46585 a!2901) i!1037)))))

(declare-fun res!949702 () Bool)

(assert (=> start!121604 (=> (not res!949702) (not e!799443))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121604 (= res!949702 (validMask!0 mask!2840))))

(assert (=> start!121604 e!799443))

(assert (=> start!121604 true))

(declare-fun array_inv!35818 (array!96495) Bool)

(assert (=> start!121604 (array_inv!35818 a!2901)))

(declare-fun b!1412659 () Bool)

(declare-fun res!949698 () Bool)

(assert (=> b!1412659 (=> (not res!949698) (not e!799443))))

(declare-datatypes ((List!33182 0))(
  ( (Nil!33179) (Cons!33178 (h!34453 (_ BitVec 64)) (t!47868 List!33182)) )
))
(declare-fun arrayNoDuplicates!0 (array!96495 (_ BitVec 32) List!33182) Bool)

(assert (=> b!1412659 (= res!949698 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33179))))

(declare-fun b!1412660 () Bool)

(assert (=> b!1412660 (= e!799443 (not e!799442))))

(declare-fun res!949700 () Bool)

(assert (=> b!1412660 (=> res!949700 e!799442)))

(assert (=> b!1412660 (= res!949700 (or (not ((_ is Intermediate!10922) lt!622352)) (undefined!11734 lt!622352)))))

(declare-fun e!799445 () Bool)

(assert (=> b!1412660 e!799445))

(declare-fun res!949705 () Bool)

(assert (=> b!1412660 (=> (not res!949705) (not e!799445))))

(assert (=> b!1412660 (= res!949705 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47661 0))(
  ( (Unit!47662) )
))
(declare-fun lt!622354 () Unit!47661)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96495 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47661)

(assert (=> b!1412660 (= lt!622354 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!622356 () (_ BitVec 32))

(assert (=> b!1412660 (= lt!622352 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!622356 (select (arr!46585 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1412660 (= lt!622356 (toIndex!0 (select (arr!46585 a!2901) j!112) mask!2840))))

(declare-fun b!1412661 () Bool)

(assert (=> b!1412661 (= e!799444 true)))

(declare-fun e!799441 () Bool)

(assert (=> b!1412661 e!799441))

(declare-fun res!949701 () Bool)

(assert (=> b!1412661 (=> (not res!949701) (not e!799441))))

(assert (=> b!1412661 (= res!949701 (and (not (undefined!11734 lt!622353)) (= (index!46070 lt!622353) i!1037) (bvslt (x!127654 lt!622353) (x!127654 lt!622352)) (= (select (store (arr!46585 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!46070 lt!622353)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!622357 () Unit!47661)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96495 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47661)

(assert (=> b!1412661 (= lt!622357 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!622356 (x!127654 lt!622352) (index!46070 lt!622352) (x!127654 lt!622353) (index!46070 lt!622353) (undefined!11734 lt!622353) mask!2840))))

(declare-fun b!1412662 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96495 (_ BitVec 32)) SeekEntryResult!10922)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96495 (_ BitVec 32)) SeekEntryResult!10922)

(assert (=> b!1412662 (= e!799441 (= (seekEntryOrOpen!0 lt!622355 lt!622358 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!127654 lt!622353) (index!46070 lt!622353) (index!46070 lt!622353) (select (arr!46585 a!2901) j!112) lt!622358 mask!2840)))))

(declare-fun b!1412663 () Bool)

(assert (=> b!1412663 (= e!799445 (= (seekEntryOrOpen!0 (select (arr!46585 a!2901) j!112) a!2901 mask!2840) (Found!10922 j!112)))))

(declare-fun b!1412664 () Bool)

(declare-fun res!949703 () Bool)

(assert (=> b!1412664 (=> (not res!949703) (not e!799443))))

(assert (=> b!1412664 (= res!949703 (and (= (size!47137 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47137 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47137 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!121604 res!949702) b!1412664))

(assert (= (and b!1412664 res!949703) b!1412658))

(assert (= (and b!1412658 res!949697) b!1412657))

(assert (= (and b!1412657 res!949696) b!1412656))

(assert (= (and b!1412656 res!949704) b!1412659))

(assert (= (and b!1412659 res!949698) b!1412660))

(assert (= (and b!1412660 res!949705) b!1412663))

(assert (= (and b!1412660 (not res!949700)) b!1412655))

(assert (= (and b!1412655 (not res!949699)) b!1412661))

(assert (= (and b!1412661 res!949701) b!1412662))

(declare-fun m!1302343 () Bool)

(assert (=> b!1412663 m!1302343))

(assert (=> b!1412663 m!1302343))

(declare-fun m!1302345 () Bool)

(assert (=> b!1412663 m!1302345))

(assert (=> b!1412657 m!1302343))

(assert (=> b!1412657 m!1302343))

(declare-fun m!1302347 () Bool)

(assert (=> b!1412657 m!1302347))

(declare-fun m!1302349 () Bool)

(assert (=> b!1412658 m!1302349))

(assert (=> b!1412658 m!1302349))

(declare-fun m!1302351 () Bool)

(assert (=> b!1412658 m!1302351))

(declare-fun m!1302353 () Bool)

(assert (=> b!1412659 m!1302353))

(declare-fun m!1302355 () Bool)

(assert (=> b!1412655 m!1302355))

(assert (=> b!1412655 m!1302355))

(declare-fun m!1302357 () Bool)

(assert (=> b!1412655 m!1302357))

(declare-fun m!1302359 () Bool)

(assert (=> b!1412655 m!1302359))

(declare-fun m!1302361 () Bool)

(assert (=> b!1412655 m!1302361))

(assert (=> b!1412661 m!1302359))

(declare-fun m!1302363 () Bool)

(assert (=> b!1412661 m!1302363))

(declare-fun m!1302365 () Bool)

(assert (=> b!1412661 m!1302365))

(declare-fun m!1302367 () Bool)

(assert (=> b!1412656 m!1302367))

(declare-fun m!1302369 () Bool)

(assert (=> b!1412662 m!1302369))

(assert (=> b!1412662 m!1302343))

(assert (=> b!1412662 m!1302343))

(declare-fun m!1302371 () Bool)

(assert (=> b!1412662 m!1302371))

(declare-fun m!1302373 () Bool)

(assert (=> start!121604 m!1302373))

(declare-fun m!1302375 () Bool)

(assert (=> start!121604 m!1302375))

(assert (=> b!1412660 m!1302343))

(declare-fun m!1302377 () Bool)

(assert (=> b!1412660 m!1302377))

(assert (=> b!1412660 m!1302343))

(declare-fun m!1302379 () Bool)

(assert (=> b!1412660 m!1302379))

(declare-fun m!1302381 () Bool)

(assert (=> b!1412660 m!1302381))

(assert (=> b!1412660 m!1302343))

(declare-fun m!1302383 () Bool)

(assert (=> b!1412660 m!1302383))

(check-sat (not b!1412662) (not b!1412659) (not b!1412658) (not b!1412657) (not b!1412660) (not b!1412661) (not start!121604) (not b!1412663) (not b!1412656) (not b!1412655))
(check-sat)
