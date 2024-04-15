; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121454 () Bool)

(assert start!121454)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96408 0))(
  ( (array!96409 (arr!46543 (Array (_ BitVec 32) (_ BitVec 64))) (size!47095 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96408)

(declare-fun e!798571 () Bool)

(declare-fun b!1411147 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10880 0))(
  ( (MissingZero!10880 (index!45897 (_ BitVec 32))) (Found!10880 (index!45898 (_ BitVec 32))) (Intermediate!10880 (undefined!11692 Bool) (index!45899 (_ BitVec 32)) (x!127488 (_ BitVec 32))) (Undefined!10880) (MissingVacant!10880 (index!45900 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96408 (_ BitVec 32)) SeekEntryResult!10880)

(assert (=> b!1411147 (= e!798571 (= (seekEntryOrOpen!0 (select (arr!46543 a!2901) j!112) a!2901 mask!2840) (Found!10880 j!112)))))

(declare-fun b!1411148 () Bool)

(declare-fun res!948427 () Bool)

(declare-fun e!798572 () Bool)

(assert (=> b!1411148 (=> (not res!948427) (not e!798572))))

(declare-datatypes ((List!33140 0))(
  ( (Nil!33137) (Cons!33136 (h!34408 (_ BitVec 64)) (t!47826 List!33140)) )
))
(declare-fun arrayNoDuplicates!0 (array!96408 (_ BitVec 32) List!33140) Bool)

(assert (=> b!1411148 (= res!948427 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33137))))

(declare-fun res!948429 () Bool)

(assert (=> start!121454 (=> (not res!948429) (not e!798572))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121454 (= res!948429 (validMask!0 mask!2840))))

(assert (=> start!121454 e!798572))

(assert (=> start!121454 true))

(declare-fun array_inv!35776 (array!96408) Bool)

(assert (=> start!121454 (array_inv!35776 a!2901)))

(declare-fun b!1411149 () Bool)

(declare-fun e!798570 () Bool)

(assert (=> b!1411149 (= e!798570 true)))

(declare-fun lt!621401 () SeekEntryResult!10880)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun lt!621402 () SeekEntryResult!10880)

(assert (=> b!1411149 (and (not (undefined!11692 lt!621401)) (= (index!45899 lt!621401) i!1037) (bvslt (x!127488 lt!621401) (x!127488 lt!621402)))))

(declare-datatypes ((Unit!47577 0))(
  ( (Unit!47578) )
))
(declare-fun lt!621400 () Unit!47577)

(declare-fun lt!621403 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96408 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47577)

(assert (=> b!1411149 (= lt!621400 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!621403 (x!127488 lt!621402) (index!45899 lt!621402) (x!127488 lt!621401) (index!45899 lt!621401) (undefined!11692 lt!621401) mask!2840))))

(declare-fun b!1411150 () Bool)

(declare-fun e!798568 () Bool)

(assert (=> b!1411150 (= e!798572 (not e!798568))))

(declare-fun res!948426 () Bool)

(assert (=> b!1411150 (=> res!948426 e!798568)))

(get-info :version)

(assert (=> b!1411150 (= res!948426 (or (not ((_ is Intermediate!10880) lt!621402)) (undefined!11692 lt!621402)))))

(assert (=> b!1411150 e!798571))

(declare-fun res!948425 () Bool)

(assert (=> b!1411150 (=> (not res!948425) (not e!798571))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96408 (_ BitVec 32)) Bool)

(assert (=> b!1411150 (= res!948425 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!621404 () Unit!47577)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96408 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47577)

(assert (=> b!1411150 (= lt!621404 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96408 (_ BitVec 32)) SeekEntryResult!10880)

(assert (=> b!1411150 (= lt!621402 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!621403 (select (arr!46543 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1411150 (= lt!621403 (toIndex!0 (select (arr!46543 a!2901) j!112) mask!2840))))

(declare-fun b!1411151 () Bool)

(declare-fun res!948433 () Bool)

(assert (=> b!1411151 (=> (not res!948433) (not e!798572))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1411151 (= res!948433 (validKeyInArray!0 (select (arr!46543 a!2901) j!112)))))

(declare-fun b!1411152 () Bool)

(declare-fun res!948431 () Bool)

(assert (=> b!1411152 (=> (not res!948431) (not e!798572))))

(assert (=> b!1411152 (= res!948431 (validKeyInArray!0 (select (arr!46543 a!2901) i!1037)))))

(declare-fun b!1411153 () Bool)

(declare-fun res!948432 () Bool)

(assert (=> b!1411153 (=> (not res!948432) (not e!798572))))

(assert (=> b!1411153 (= res!948432 (and (= (size!47095 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47095 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47095 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1411154 () Bool)

(declare-fun res!948428 () Bool)

(assert (=> b!1411154 (=> (not res!948428) (not e!798572))))

(assert (=> b!1411154 (= res!948428 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1411155 () Bool)

(assert (=> b!1411155 (= e!798568 e!798570)))

(declare-fun res!948430 () Bool)

(assert (=> b!1411155 (=> res!948430 e!798570)))

(assert (=> b!1411155 (= res!948430 (or (= lt!621402 lt!621401) (not ((_ is Intermediate!10880) lt!621401))))))

(assert (=> b!1411155 (= lt!621401 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46543 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46543 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96409 (store (arr!46543 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47095 a!2901)) mask!2840))))

(assert (= (and start!121454 res!948429) b!1411153))

(assert (= (and b!1411153 res!948432) b!1411152))

(assert (= (and b!1411152 res!948431) b!1411151))

(assert (= (and b!1411151 res!948433) b!1411154))

(assert (= (and b!1411154 res!948428) b!1411148))

(assert (= (and b!1411148 res!948427) b!1411150))

(assert (= (and b!1411150 res!948425) b!1411147))

(assert (= (and b!1411150 (not res!948426)) b!1411155))

(assert (= (and b!1411155 (not res!948430)) b!1411149))

(declare-fun m!1300465 () Bool)

(assert (=> b!1411151 m!1300465))

(assert (=> b!1411151 m!1300465))

(declare-fun m!1300467 () Bool)

(assert (=> b!1411151 m!1300467))

(declare-fun m!1300469 () Bool)

(assert (=> b!1411155 m!1300469))

(declare-fun m!1300471 () Bool)

(assert (=> b!1411155 m!1300471))

(assert (=> b!1411155 m!1300471))

(declare-fun m!1300473 () Bool)

(assert (=> b!1411155 m!1300473))

(assert (=> b!1411155 m!1300473))

(assert (=> b!1411155 m!1300471))

(declare-fun m!1300475 () Bool)

(assert (=> b!1411155 m!1300475))

(declare-fun m!1300477 () Bool)

(assert (=> b!1411149 m!1300477))

(declare-fun m!1300479 () Bool)

(assert (=> start!121454 m!1300479))

(declare-fun m!1300481 () Bool)

(assert (=> start!121454 m!1300481))

(assert (=> b!1411147 m!1300465))

(assert (=> b!1411147 m!1300465))

(declare-fun m!1300483 () Bool)

(assert (=> b!1411147 m!1300483))

(declare-fun m!1300485 () Bool)

(assert (=> b!1411152 m!1300485))

(assert (=> b!1411152 m!1300485))

(declare-fun m!1300487 () Bool)

(assert (=> b!1411152 m!1300487))

(assert (=> b!1411150 m!1300465))

(declare-fun m!1300489 () Bool)

(assert (=> b!1411150 m!1300489))

(assert (=> b!1411150 m!1300465))

(declare-fun m!1300491 () Bool)

(assert (=> b!1411150 m!1300491))

(assert (=> b!1411150 m!1300465))

(declare-fun m!1300493 () Bool)

(assert (=> b!1411150 m!1300493))

(declare-fun m!1300495 () Bool)

(assert (=> b!1411150 m!1300495))

(declare-fun m!1300497 () Bool)

(assert (=> b!1411154 m!1300497))

(declare-fun m!1300499 () Bool)

(assert (=> b!1411148 m!1300499))

(check-sat (not b!1411150) (not b!1411155) (not b!1411147) (not start!121454) (not b!1411154) (not b!1411149) (not b!1411148) (not b!1411152) (not b!1411151))
(check-sat)
