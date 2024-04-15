; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121592 () Bool)

(assert start!121592)

(declare-fun b!1412475 () Bool)

(declare-fun e!799332 () Bool)

(assert (=> b!1412475 (= e!799332 true)))

(declare-fun e!799333 () Bool)

(assert (=> b!1412475 e!799333))

(declare-fun res!949523 () Bool)

(assert (=> b!1412475 (=> (not res!949523) (not e!799333))))

(declare-datatypes ((array!96483 0))(
  ( (array!96484 (arr!46579 (Array (_ BitVec 32) (_ BitVec 64))) (size!47131 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96483)

(declare-datatypes ((SeekEntryResult!10916 0))(
  ( (MissingZero!10916 (index!46044 (_ BitVec 32))) (Found!10916 (index!46045 (_ BitVec 32))) (Intermediate!10916 (undefined!11728 Bool) (index!46046 (_ BitVec 32)) (x!127632 (_ BitVec 32))) (Undefined!10916) (MissingVacant!10916 (index!46047 (_ BitVec 32))) )
))
(declare-fun lt!622228 () SeekEntryResult!10916)

(declare-fun lt!622232 () SeekEntryResult!10916)

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1412475 (= res!949523 (and (not (undefined!11728 lt!622228)) (= (index!46046 lt!622228) i!1037) (bvslt (x!127632 lt!622228) (x!127632 lt!622232)) (= (select (store (arr!46579 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!46046 lt!622228)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun lt!622231 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((Unit!47649 0))(
  ( (Unit!47650) )
))
(declare-fun lt!622230 () Unit!47649)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96483 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47649)

(assert (=> b!1412475 (= lt!622230 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!622231 (x!127632 lt!622232) (index!46046 lt!622232) (x!127632 lt!622228) (index!46046 lt!622228) (undefined!11728 lt!622228) mask!2840))))

(declare-fun lt!622226 () (_ BitVec 64))

(declare-fun lt!622229 () array!96483)

(declare-fun b!1412476 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96483 (_ BitVec 32)) SeekEntryResult!10916)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96483 (_ BitVec 32)) SeekEntryResult!10916)

(assert (=> b!1412476 (= e!799333 (= (seekEntryOrOpen!0 lt!622226 lt!622229 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!127632 lt!622228) (index!46046 lt!622228) (index!46046 lt!622228) (select (arr!46579 a!2901) j!112) lt!622229 mask!2840)))))

(declare-fun e!799334 () Bool)

(declare-fun b!1412477 () Bool)

(assert (=> b!1412477 (= e!799334 (= (seekEntryOrOpen!0 (select (arr!46579 a!2901) j!112) a!2901 mask!2840) (Found!10916 j!112)))))

(declare-fun b!1412478 () Bool)

(declare-fun res!949519 () Bool)

(declare-fun e!799336 () Bool)

(assert (=> b!1412478 (=> (not res!949519) (not e!799336))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1412478 (= res!949519 (validKeyInArray!0 (select (arr!46579 a!2901) i!1037)))))

(declare-fun b!1412479 () Bool)

(declare-fun res!949522 () Bool)

(assert (=> b!1412479 (=> (not res!949522) (not e!799336))))

(declare-datatypes ((List!33176 0))(
  ( (Nil!33173) (Cons!33172 (h!34447 (_ BitVec 64)) (t!47862 List!33176)) )
))
(declare-fun arrayNoDuplicates!0 (array!96483 (_ BitVec 32) List!33176) Bool)

(assert (=> b!1412479 (= res!949522 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33173))))

(declare-fun b!1412480 () Bool)

(declare-fun res!949521 () Bool)

(assert (=> b!1412480 (=> (not res!949521) (not e!799336))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96483 (_ BitVec 32)) Bool)

(assert (=> b!1412480 (= res!949521 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1412481 () Bool)

(declare-fun res!949516 () Bool)

(assert (=> b!1412481 (=> (not res!949516) (not e!799336))))

(assert (=> b!1412481 (= res!949516 (validKeyInArray!0 (select (arr!46579 a!2901) j!112)))))

(declare-fun b!1412482 () Bool)

(declare-fun e!799337 () Bool)

(assert (=> b!1412482 (= e!799337 e!799332)))

(declare-fun res!949524 () Bool)

(assert (=> b!1412482 (=> res!949524 e!799332)))

(get-info :version)

(assert (=> b!1412482 (= res!949524 (or (= lt!622232 lt!622228) (not ((_ is Intermediate!10916) lt!622228))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96483 (_ BitVec 32)) SeekEntryResult!10916)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1412482 (= lt!622228 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!622226 mask!2840) lt!622226 lt!622229 mask!2840))))

(assert (=> b!1412482 (= lt!622226 (select (store (arr!46579 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1412482 (= lt!622229 (array!96484 (store (arr!46579 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47131 a!2901)))))

(declare-fun res!949525 () Bool)

(assert (=> start!121592 (=> (not res!949525) (not e!799336))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121592 (= res!949525 (validMask!0 mask!2840))))

(assert (=> start!121592 e!799336))

(assert (=> start!121592 true))

(declare-fun array_inv!35812 (array!96483) Bool)

(assert (=> start!121592 (array_inv!35812 a!2901)))

(declare-fun b!1412483 () Bool)

(assert (=> b!1412483 (= e!799336 (not e!799337))))

(declare-fun res!949517 () Bool)

(assert (=> b!1412483 (=> res!949517 e!799337)))

(assert (=> b!1412483 (= res!949517 (or (not ((_ is Intermediate!10916) lt!622232)) (undefined!11728 lt!622232)))))

(assert (=> b!1412483 e!799334))

(declare-fun res!949520 () Bool)

(assert (=> b!1412483 (=> (not res!949520) (not e!799334))))

(assert (=> b!1412483 (= res!949520 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!622227 () Unit!47649)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96483 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47649)

(assert (=> b!1412483 (= lt!622227 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1412483 (= lt!622232 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!622231 (select (arr!46579 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1412483 (= lt!622231 (toIndex!0 (select (arr!46579 a!2901) j!112) mask!2840))))

(declare-fun b!1412484 () Bool)

(declare-fun res!949518 () Bool)

(assert (=> b!1412484 (=> (not res!949518) (not e!799336))))

(assert (=> b!1412484 (= res!949518 (and (= (size!47131 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47131 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47131 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!121592 res!949525) b!1412484))

(assert (= (and b!1412484 res!949518) b!1412478))

(assert (= (and b!1412478 res!949519) b!1412481))

(assert (= (and b!1412481 res!949516) b!1412480))

(assert (= (and b!1412480 res!949521) b!1412479))

(assert (= (and b!1412479 res!949522) b!1412483))

(assert (= (and b!1412483 res!949520) b!1412477))

(assert (= (and b!1412483 (not res!949517)) b!1412482))

(assert (= (and b!1412482 (not res!949524)) b!1412475))

(assert (= (and b!1412475 res!949523) b!1412476))

(declare-fun m!1302091 () Bool)

(assert (=> b!1412483 m!1302091))

(declare-fun m!1302093 () Bool)

(assert (=> b!1412483 m!1302093))

(assert (=> b!1412483 m!1302091))

(assert (=> b!1412483 m!1302091))

(declare-fun m!1302095 () Bool)

(assert (=> b!1412483 m!1302095))

(declare-fun m!1302097 () Bool)

(assert (=> b!1412483 m!1302097))

(declare-fun m!1302099 () Bool)

(assert (=> b!1412483 m!1302099))

(declare-fun m!1302101 () Bool)

(assert (=> b!1412482 m!1302101))

(assert (=> b!1412482 m!1302101))

(declare-fun m!1302103 () Bool)

(assert (=> b!1412482 m!1302103))

(declare-fun m!1302105 () Bool)

(assert (=> b!1412482 m!1302105))

(declare-fun m!1302107 () Bool)

(assert (=> b!1412482 m!1302107))

(assert (=> b!1412477 m!1302091))

(assert (=> b!1412477 m!1302091))

(declare-fun m!1302109 () Bool)

(assert (=> b!1412477 m!1302109))

(declare-fun m!1302111 () Bool)

(assert (=> b!1412479 m!1302111))

(assert (=> b!1412475 m!1302105))

(declare-fun m!1302113 () Bool)

(assert (=> b!1412475 m!1302113))

(declare-fun m!1302115 () Bool)

(assert (=> b!1412475 m!1302115))

(declare-fun m!1302117 () Bool)

(assert (=> b!1412478 m!1302117))

(assert (=> b!1412478 m!1302117))

(declare-fun m!1302119 () Bool)

(assert (=> b!1412478 m!1302119))

(declare-fun m!1302121 () Bool)

(assert (=> b!1412480 m!1302121))

(declare-fun m!1302123 () Bool)

(assert (=> start!121592 m!1302123))

(declare-fun m!1302125 () Bool)

(assert (=> start!121592 m!1302125))

(assert (=> b!1412481 m!1302091))

(assert (=> b!1412481 m!1302091))

(declare-fun m!1302127 () Bool)

(assert (=> b!1412481 m!1302127))

(declare-fun m!1302129 () Bool)

(assert (=> b!1412476 m!1302129))

(assert (=> b!1412476 m!1302091))

(assert (=> b!1412476 m!1302091))

(declare-fun m!1302131 () Bool)

(assert (=> b!1412476 m!1302131))

(check-sat (not b!1412483) (not b!1412481) (not b!1412475) (not start!121592) (not b!1412477) (not b!1412482) (not b!1412478) (not b!1412479) (not b!1412476) (not b!1412480))
(check-sat)
