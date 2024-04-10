; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121160 () Bool)

(assert start!121160)

(declare-fun res!946493 () Bool)

(declare-fun e!797259 () Bool)

(assert (=> start!121160 (=> (not res!946493) (not e!797259))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121160 (= res!946493 (validMask!0 mask!2840))))

(assert (=> start!121160 e!797259))

(assert (=> start!121160 true))

(declare-datatypes ((array!96314 0))(
  ( (array!96315 (arr!46500 (Array (_ BitVec 32) (_ BitVec 64))) (size!47050 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96314)

(declare-fun array_inv!35528 (array!96314) Bool)

(assert (=> start!121160 (array_inv!35528 a!2901)))

(declare-fun b!1408766 () Bool)

(declare-fun res!946488 () Bool)

(assert (=> b!1408766 (=> (not res!946488) (not e!797259))))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1408766 (= res!946488 (validKeyInArray!0 (select (arr!46500 a!2901) j!112)))))

(declare-fun b!1408767 () Bool)

(declare-fun e!797261 () Bool)

(assert (=> b!1408767 (= e!797259 (not e!797261))))

(declare-fun res!946489 () Bool)

(assert (=> b!1408767 (=> res!946489 e!797261)))

(declare-datatypes ((SeekEntryResult!10811 0))(
  ( (MissingZero!10811 (index!45621 (_ BitVec 32))) (Found!10811 (index!45622 (_ BitVec 32))) (Intermediate!10811 (undefined!11623 Bool) (index!45623 (_ BitVec 32)) (x!127220 (_ BitVec 32))) (Undefined!10811) (MissingVacant!10811 (index!45624 (_ BitVec 32))) )
))
(declare-fun lt!620471 () SeekEntryResult!10811)

(get-info :version)

(assert (=> b!1408767 (= res!946489 (or (not ((_ is Intermediate!10811) lt!620471)) (undefined!11623 lt!620471)))))

(declare-fun e!797258 () Bool)

(assert (=> b!1408767 e!797258))

(declare-fun res!946494 () Bool)

(assert (=> b!1408767 (=> (not res!946494) (not e!797258))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96314 (_ BitVec 32)) Bool)

(assert (=> b!1408767 (= res!946494 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47596 0))(
  ( (Unit!47597) )
))
(declare-fun lt!620472 () Unit!47596)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96314 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47596)

(assert (=> b!1408767 (= lt!620472 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96314 (_ BitVec 32)) SeekEntryResult!10811)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1408767 (= lt!620471 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46500 a!2901) j!112) mask!2840) (select (arr!46500 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1408768 () Bool)

(assert (=> b!1408768 (= e!797261 true)))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun lt!620470 () SeekEntryResult!10811)

(assert (=> b!1408768 (= lt!620470 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46500 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46500 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96315 (store (arr!46500 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47050 a!2901)) mask!2840))))

(declare-fun b!1408769 () Bool)

(declare-fun res!946491 () Bool)

(assert (=> b!1408769 (=> (not res!946491) (not e!797259))))

(assert (=> b!1408769 (= res!946491 (validKeyInArray!0 (select (arr!46500 a!2901) i!1037)))))

(declare-fun b!1408770 () Bool)

(declare-fun res!946490 () Bool)

(assert (=> b!1408770 (=> (not res!946490) (not e!797259))))

(assert (=> b!1408770 (= res!946490 (and (= (size!47050 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47050 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47050 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1408771 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96314 (_ BitVec 32)) SeekEntryResult!10811)

(assert (=> b!1408771 (= e!797258 (= (seekEntryOrOpen!0 (select (arr!46500 a!2901) j!112) a!2901 mask!2840) (Found!10811 j!112)))))

(declare-fun b!1408772 () Bool)

(declare-fun res!946495 () Bool)

(assert (=> b!1408772 (=> (not res!946495) (not e!797259))))

(declare-datatypes ((List!33019 0))(
  ( (Nil!33016) (Cons!33015 (h!34278 (_ BitVec 64)) (t!47713 List!33019)) )
))
(declare-fun arrayNoDuplicates!0 (array!96314 (_ BitVec 32) List!33019) Bool)

(assert (=> b!1408772 (= res!946495 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33016))))

(declare-fun b!1408773 () Bool)

(declare-fun res!946492 () Bool)

(assert (=> b!1408773 (=> (not res!946492) (not e!797259))))

(assert (=> b!1408773 (= res!946492 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(assert (= (and start!121160 res!946493) b!1408770))

(assert (= (and b!1408770 res!946490) b!1408769))

(assert (= (and b!1408769 res!946491) b!1408766))

(assert (= (and b!1408766 res!946488) b!1408773))

(assert (= (and b!1408773 res!946492) b!1408772))

(assert (= (and b!1408772 res!946495) b!1408767))

(assert (= (and b!1408767 res!946494) b!1408771))

(assert (= (and b!1408767 (not res!946489)) b!1408768))

(declare-fun m!1298203 () Bool)

(assert (=> b!1408766 m!1298203))

(assert (=> b!1408766 m!1298203))

(declare-fun m!1298205 () Bool)

(assert (=> b!1408766 m!1298205))

(assert (=> b!1408771 m!1298203))

(assert (=> b!1408771 m!1298203))

(declare-fun m!1298207 () Bool)

(assert (=> b!1408771 m!1298207))

(assert (=> b!1408767 m!1298203))

(declare-fun m!1298209 () Bool)

(assert (=> b!1408767 m!1298209))

(assert (=> b!1408767 m!1298203))

(declare-fun m!1298211 () Bool)

(assert (=> b!1408767 m!1298211))

(assert (=> b!1408767 m!1298209))

(assert (=> b!1408767 m!1298203))

(declare-fun m!1298213 () Bool)

(assert (=> b!1408767 m!1298213))

(declare-fun m!1298215 () Bool)

(assert (=> b!1408767 m!1298215))

(declare-fun m!1298217 () Bool)

(assert (=> b!1408768 m!1298217))

(declare-fun m!1298219 () Bool)

(assert (=> b!1408768 m!1298219))

(assert (=> b!1408768 m!1298219))

(declare-fun m!1298221 () Bool)

(assert (=> b!1408768 m!1298221))

(assert (=> b!1408768 m!1298221))

(assert (=> b!1408768 m!1298219))

(declare-fun m!1298223 () Bool)

(assert (=> b!1408768 m!1298223))

(declare-fun m!1298225 () Bool)

(assert (=> start!121160 m!1298225))

(declare-fun m!1298227 () Bool)

(assert (=> start!121160 m!1298227))

(declare-fun m!1298229 () Bool)

(assert (=> b!1408772 m!1298229))

(declare-fun m!1298231 () Bool)

(assert (=> b!1408769 m!1298231))

(assert (=> b!1408769 m!1298231))

(declare-fun m!1298233 () Bool)

(assert (=> b!1408769 m!1298233))

(declare-fun m!1298235 () Bool)

(assert (=> b!1408773 m!1298235))

(check-sat (not b!1408767) (not b!1408766) (not b!1408772) (not start!121160) (not b!1408773) (not b!1408771) (not b!1408769) (not b!1408768))
