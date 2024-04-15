; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121610 () Bool)

(assert start!121610)

(declare-fun b!1412745 () Bool)

(declare-fun e!799495 () Bool)

(assert (=> b!1412745 (= e!799495 true)))

(declare-fun e!799499 () Bool)

(assert (=> b!1412745 e!799499))

(declare-fun res!949790 () Bool)

(assert (=> b!1412745 (=> (not res!949790) (not e!799499))))

(declare-datatypes ((array!96501 0))(
  ( (array!96502 (arr!46588 (Array (_ BitVec 32) (_ BitVec 64))) (size!47140 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96501)

(declare-fun i!1037 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10925 0))(
  ( (MissingZero!10925 (index!46080 (_ BitVec 32))) (Found!10925 (index!46081 (_ BitVec 32))) (Intermediate!10925 (undefined!11737 Bool) (index!46082 (_ BitVec 32)) (x!127665 (_ BitVec 32))) (Undefined!10925) (MissingVacant!10925 (index!46083 (_ BitVec 32))) )
))
(declare-fun lt!622420 () SeekEntryResult!10925)

(declare-fun lt!622416 () SeekEntryResult!10925)

(assert (=> b!1412745 (= res!949790 (and (not (undefined!11737 lt!622416)) (= (index!46082 lt!622416) i!1037) (bvslt (x!127665 lt!622416) (x!127665 lt!622420)) (= (select (store (arr!46588 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!46082 lt!622416)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((Unit!47667 0))(
  ( (Unit!47668) )
))
(declare-fun lt!622415 () Unit!47667)

(declare-fun lt!622419 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96501 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47667)

(assert (=> b!1412745 (= lt!622415 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!622419 (x!127665 lt!622420) (index!46082 lt!622420) (x!127665 lt!622416) (index!46082 lt!622416) (undefined!11737 lt!622416) mask!2840))))

(declare-fun b!1412746 () Bool)

(declare-fun e!799498 () Bool)

(assert (=> b!1412746 (= e!799498 e!799495)))

(declare-fun res!949795 () Bool)

(assert (=> b!1412746 (=> res!949795 e!799495)))

(get-info :version)

(assert (=> b!1412746 (= res!949795 (or (= lt!622420 lt!622416) (not ((_ is Intermediate!10925) lt!622416))))))

(declare-fun lt!622421 () (_ BitVec 64))

(declare-fun lt!622418 () array!96501)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96501 (_ BitVec 32)) SeekEntryResult!10925)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1412746 (= lt!622416 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!622421 mask!2840) lt!622421 lt!622418 mask!2840))))

(assert (=> b!1412746 (= lt!622421 (select (store (arr!46588 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1412746 (= lt!622418 (array!96502 (store (arr!46588 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47140 a!2901)))))

(declare-fun b!1412747 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96501 (_ BitVec 32)) SeekEntryResult!10925)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96501 (_ BitVec 32)) SeekEntryResult!10925)

(assert (=> b!1412747 (= e!799499 (= (seekEntryOrOpen!0 lt!622421 lt!622418 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!127665 lt!622416) (index!46082 lt!622416) (index!46082 lt!622416) (select (arr!46588 a!2901) j!112) lt!622418 mask!2840)))))

(declare-fun res!949789 () Bool)

(declare-fun e!799494 () Bool)

(assert (=> start!121610 (=> (not res!949789) (not e!799494))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121610 (= res!949789 (validMask!0 mask!2840))))

(assert (=> start!121610 e!799494))

(assert (=> start!121610 true))

(declare-fun array_inv!35821 (array!96501) Bool)

(assert (=> start!121610 (array_inv!35821 a!2901)))

(declare-fun b!1412748 () Bool)

(assert (=> b!1412748 (= e!799494 (not e!799498))))

(declare-fun res!949791 () Bool)

(assert (=> b!1412748 (=> res!949791 e!799498)))

(assert (=> b!1412748 (= res!949791 (or (not ((_ is Intermediate!10925) lt!622420)) (undefined!11737 lt!622420)))))

(declare-fun e!799497 () Bool)

(assert (=> b!1412748 e!799497))

(declare-fun res!949792 () Bool)

(assert (=> b!1412748 (=> (not res!949792) (not e!799497))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96501 (_ BitVec 32)) Bool)

(assert (=> b!1412748 (= res!949792 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!622417 () Unit!47667)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96501 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47667)

(assert (=> b!1412748 (= lt!622417 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1412748 (= lt!622420 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!622419 (select (arr!46588 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1412748 (= lt!622419 (toIndex!0 (select (arr!46588 a!2901) j!112) mask!2840))))

(declare-fun b!1412749 () Bool)

(declare-fun res!949793 () Bool)

(assert (=> b!1412749 (=> (not res!949793) (not e!799494))))

(assert (=> b!1412749 (= res!949793 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1412750 () Bool)

(declare-fun res!949786 () Bool)

(assert (=> b!1412750 (=> (not res!949786) (not e!799494))))

(declare-datatypes ((List!33185 0))(
  ( (Nil!33182) (Cons!33181 (h!34456 (_ BitVec 64)) (t!47871 List!33185)) )
))
(declare-fun arrayNoDuplicates!0 (array!96501 (_ BitVec 32) List!33185) Bool)

(assert (=> b!1412750 (= res!949786 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33182))))

(declare-fun b!1412751 () Bool)

(declare-fun res!949788 () Bool)

(assert (=> b!1412751 (=> (not res!949788) (not e!799494))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1412751 (= res!949788 (validKeyInArray!0 (select (arr!46588 a!2901) i!1037)))))

(declare-fun b!1412752 () Bool)

(declare-fun res!949787 () Bool)

(assert (=> b!1412752 (=> (not res!949787) (not e!799494))))

(assert (=> b!1412752 (= res!949787 (and (= (size!47140 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47140 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47140 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1412753 () Bool)

(assert (=> b!1412753 (= e!799497 (= (seekEntryOrOpen!0 (select (arr!46588 a!2901) j!112) a!2901 mask!2840) (Found!10925 j!112)))))

(declare-fun b!1412754 () Bool)

(declare-fun res!949794 () Bool)

(assert (=> b!1412754 (=> (not res!949794) (not e!799494))))

(assert (=> b!1412754 (= res!949794 (validKeyInArray!0 (select (arr!46588 a!2901) j!112)))))

(assert (= (and start!121610 res!949789) b!1412752))

(assert (= (and b!1412752 res!949787) b!1412751))

(assert (= (and b!1412751 res!949788) b!1412754))

(assert (= (and b!1412754 res!949794) b!1412749))

(assert (= (and b!1412749 res!949793) b!1412750))

(assert (= (and b!1412750 res!949786) b!1412748))

(assert (= (and b!1412748 res!949792) b!1412753))

(assert (= (and b!1412748 (not res!949791)) b!1412746))

(assert (= (and b!1412746 (not res!949795)) b!1412745))

(assert (= (and b!1412745 res!949790) b!1412747))

(declare-fun m!1302469 () Bool)

(assert (=> b!1412748 m!1302469))

(declare-fun m!1302471 () Bool)

(assert (=> b!1412748 m!1302471))

(assert (=> b!1412748 m!1302469))

(assert (=> b!1412748 m!1302469))

(declare-fun m!1302473 () Bool)

(assert (=> b!1412748 m!1302473))

(declare-fun m!1302475 () Bool)

(assert (=> b!1412748 m!1302475))

(declare-fun m!1302477 () Bool)

(assert (=> b!1412748 m!1302477))

(declare-fun m!1302479 () Bool)

(assert (=> b!1412747 m!1302479))

(assert (=> b!1412747 m!1302469))

(assert (=> b!1412747 m!1302469))

(declare-fun m!1302481 () Bool)

(assert (=> b!1412747 m!1302481))

(assert (=> b!1412754 m!1302469))

(assert (=> b!1412754 m!1302469))

(declare-fun m!1302483 () Bool)

(assert (=> b!1412754 m!1302483))

(declare-fun m!1302485 () Bool)

(assert (=> b!1412751 m!1302485))

(assert (=> b!1412751 m!1302485))

(declare-fun m!1302487 () Bool)

(assert (=> b!1412751 m!1302487))

(declare-fun m!1302489 () Bool)

(assert (=> b!1412745 m!1302489))

(declare-fun m!1302491 () Bool)

(assert (=> b!1412745 m!1302491))

(declare-fun m!1302493 () Bool)

(assert (=> b!1412745 m!1302493))

(declare-fun m!1302495 () Bool)

(assert (=> b!1412746 m!1302495))

(assert (=> b!1412746 m!1302495))

(declare-fun m!1302497 () Bool)

(assert (=> b!1412746 m!1302497))

(assert (=> b!1412746 m!1302489))

(declare-fun m!1302499 () Bool)

(assert (=> b!1412746 m!1302499))

(declare-fun m!1302501 () Bool)

(assert (=> b!1412750 m!1302501))

(declare-fun m!1302503 () Bool)

(assert (=> b!1412749 m!1302503))

(assert (=> b!1412753 m!1302469))

(assert (=> b!1412753 m!1302469))

(declare-fun m!1302505 () Bool)

(assert (=> b!1412753 m!1302505))

(declare-fun m!1302507 () Bool)

(assert (=> start!121610 m!1302507))

(declare-fun m!1302509 () Bool)

(assert (=> start!121610 m!1302509))

(check-sat (not b!1412748) (not b!1412750) (not b!1412753) (not b!1412749) (not b!1412745) (not b!1412754) (not b!1412751) (not b!1412746) (not start!121610) (not b!1412747))
(check-sat)
