; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121310 () Bool)

(assert start!121310)

(declare-fun b!1409443 () Bool)

(declare-fun e!797770 () Bool)

(declare-fun e!797768 () Bool)

(assert (=> b!1409443 (= e!797770 e!797768)))

(declare-fun res!946485 () Bool)

(assert (=> b!1409443 (=> res!946485 e!797768)))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun lt!620675 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!10748 0))(
  ( (MissingZero!10748 (index!45369 (_ BitVec 32))) (Found!10748 (index!45370 (_ BitVec 32))) (Intermediate!10748 (undefined!11560 Bool) (index!45371 (_ BitVec 32)) (x!127128 (_ BitVec 32))) (Undefined!10748) (MissingVacant!10748 (index!45372 (_ BitVec 32))) )
))
(declare-fun lt!620671 () SeekEntryResult!10748)

(declare-datatypes ((array!96386 0))(
  ( (array!96387 (arr!46534 (Array (_ BitVec 32) (_ BitVec 64))) (size!47085 (_ BitVec 32))) )
))
(declare-fun lt!620669 () array!96386)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96386 (_ BitVec 32)) SeekEntryResult!10748)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1409443 (= res!946485 (not (= lt!620671 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!620675 mask!2840) lt!620675 lt!620669 mask!2840))))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun a!2901 () array!96386)

(assert (=> b!1409443 (= lt!620675 (select (store (arr!46534 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1409443 (= lt!620669 (array!96387 (store (arr!46534 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47085 a!2901)))))

(declare-fun b!1409444 () Bool)

(declare-fun res!946483 () Bool)

(declare-fun e!797769 () Bool)

(assert (=> b!1409444 (=> (not res!946483) (not e!797769))))

(assert (=> b!1409444 (= res!946483 (and (= (size!47085 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47085 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47085 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1409445 () Bool)

(declare-fun res!946488 () Bool)

(assert (=> b!1409445 (=> (not res!946488) (not e!797769))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96386 (_ BitVec 32)) Bool)

(assert (=> b!1409445 (= res!946488 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1409446 () Bool)

(declare-fun res!946484 () Bool)

(assert (=> b!1409446 (=> res!946484 e!797768)))

(declare-fun lt!620673 () (_ BitVec 32))

(assert (=> b!1409446 (= res!946484 (or (bvslt (x!127128 lt!620671) #b00000000000000000000000000000000) (bvsgt (x!127128 lt!620671) #b01111111111111111111111111111110) (bvslt lt!620673 #b00000000000000000000000000000000) (bvsge lt!620673 (size!47085 a!2901)) (bvslt (index!45371 lt!620671) #b00000000000000000000000000000000) (bvsge (index!45371 lt!620671) (size!47085 a!2901)) (not (= lt!620671 (Intermediate!10748 false (index!45371 lt!620671) (x!127128 lt!620671))))))))

(declare-fun res!946489 () Bool)

(assert (=> start!121310 (=> (not res!946489) (not e!797769))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121310 (= res!946489 (validMask!0 mask!2840))))

(assert (=> start!121310 e!797769))

(assert (=> start!121310 true))

(declare-fun array_inv!35815 (array!96386) Bool)

(assert (=> start!121310 (array_inv!35815 a!2901)))

(declare-fun b!1409447 () Bool)

(assert (=> b!1409447 (= e!797769 (not e!797770))))

(declare-fun res!946481 () Bool)

(assert (=> b!1409447 (=> res!946481 e!797770)))

(get-info :version)

(assert (=> b!1409447 (= res!946481 (or (not ((_ is Intermediate!10748) lt!620671)) (undefined!11560 lt!620671)))))

(declare-fun lt!620670 () SeekEntryResult!10748)

(assert (=> b!1409447 (= lt!620670 (Found!10748 j!112))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96386 (_ BitVec 32)) SeekEntryResult!10748)

(assert (=> b!1409447 (= lt!620670 (seekEntryOrOpen!0 (select (arr!46534 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1409447 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-datatypes ((Unit!47497 0))(
  ( (Unit!47498) )
))
(declare-fun lt!620674 () Unit!47497)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96386 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47497)

(assert (=> b!1409447 (= lt!620674 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1409447 (= lt!620671 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!620673 (select (arr!46534 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1409447 (= lt!620673 (toIndex!0 (select (arr!46534 a!2901) j!112) mask!2840))))

(declare-fun b!1409448 () Bool)

(declare-fun res!946482 () Bool)

(assert (=> b!1409448 (=> (not res!946482) (not e!797769))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1409448 (= res!946482 (validKeyInArray!0 (select (arr!46534 a!2901) j!112)))))

(declare-fun b!1409449 () Bool)

(declare-fun res!946487 () Bool)

(assert (=> b!1409449 (=> (not res!946487) (not e!797769))))

(declare-datatypes ((List!33040 0))(
  ( (Nil!33037) (Cons!33036 (h!34307 (_ BitVec 64)) (t!47726 List!33040)) )
))
(declare-fun arrayNoDuplicates!0 (array!96386 (_ BitVec 32) List!33040) Bool)

(assert (=> b!1409449 (= res!946487 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33037))))

(declare-fun b!1409450 () Bool)

(declare-fun res!946486 () Bool)

(assert (=> b!1409450 (=> (not res!946486) (not e!797769))))

(assert (=> b!1409450 (= res!946486 (validKeyInArray!0 (select (arr!46534 a!2901) i!1037)))))

(declare-fun b!1409451 () Bool)

(assert (=> b!1409451 (= e!797768 true)))

(assert (=> b!1409451 (= lt!620670 (seekEntryOrOpen!0 lt!620675 lt!620669 mask!2840))))

(declare-fun lt!620672 () Unit!47497)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 (array!96386 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47497)

(assert (=> b!1409451 (= lt!620672 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!620673 (x!127128 lt!620671) (index!45371 lt!620671) mask!2840))))

(assert (= (and start!121310 res!946489) b!1409444))

(assert (= (and b!1409444 res!946483) b!1409450))

(assert (= (and b!1409450 res!946486) b!1409448))

(assert (= (and b!1409448 res!946482) b!1409445))

(assert (= (and b!1409445 res!946488) b!1409449))

(assert (= (and b!1409449 res!946487) b!1409447))

(assert (= (and b!1409447 (not res!946481)) b!1409443))

(assert (= (and b!1409443 (not res!946485)) b!1409446))

(assert (= (and b!1409446 (not res!946484)) b!1409451))

(declare-fun m!1298917 () Bool)

(assert (=> b!1409447 m!1298917))

(declare-fun m!1298919 () Bool)

(assert (=> b!1409447 m!1298919))

(assert (=> b!1409447 m!1298917))

(assert (=> b!1409447 m!1298917))

(declare-fun m!1298921 () Bool)

(assert (=> b!1409447 m!1298921))

(declare-fun m!1298923 () Bool)

(assert (=> b!1409447 m!1298923))

(assert (=> b!1409447 m!1298917))

(declare-fun m!1298925 () Bool)

(assert (=> b!1409447 m!1298925))

(declare-fun m!1298927 () Bool)

(assert (=> b!1409447 m!1298927))

(declare-fun m!1298929 () Bool)

(assert (=> b!1409445 m!1298929))

(declare-fun m!1298931 () Bool)

(assert (=> b!1409450 m!1298931))

(assert (=> b!1409450 m!1298931))

(declare-fun m!1298933 () Bool)

(assert (=> b!1409450 m!1298933))

(declare-fun m!1298935 () Bool)

(assert (=> b!1409443 m!1298935))

(assert (=> b!1409443 m!1298935))

(declare-fun m!1298937 () Bool)

(assert (=> b!1409443 m!1298937))

(declare-fun m!1298939 () Bool)

(assert (=> b!1409443 m!1298939))

(declare-fun m!1298941 () Bool)

(assert (=> b!1409443 m!1298941))

(declare-fun m!1298943 () Bool)

(assert (=> b!1409451 m!1298943))

(declare-fun m!1298945 () Bool)

(assert (=> b!1409451 m!1298945))

(declare-fun m!1298947 () Bool)

(assert (=> start!121310 m!1298947))

(declare-fun m!1298949 () Bool)

(assert (=> start!121310 m!1298949))

(declare-fun m!1298951 () Bool)

(assert (=> b!1409449 m!1298951))

(assert (=> b!1409448 m!1298917))

(assert (=> b!1409448 m!1298917))

(declare-fun m!1298953 () Bool)

(assert (=> b!1409448 m!1298953))

(check-sat (not start!121310) (not b!1409447) (not b!1409451) (not b!1409448) (not b!1409450) (not b!1409445) (not b!1409443) (not b!1409449))
(check-sat)
