; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121164 () Bool)

(assert start!121164)

(declare-fun b!1408814 () Bool)

(declare-fun res!946543 () Bool)

(declare-fun e!797283 () Bool)

(assert (=> b!1408814 (=> (not res!946543) (not e!797283))))

(declare-datatypes ((array!96318 0))(
  ( (array!96319 (arr!46502 (Array (_ BitVec 32) (_ BitVec 64))) (size!47052 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96318)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96318 (_ BitVec 32)) Bool)

(assert (=> b!1408814 (= res!946543 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1408815 () Bool)

(declare-fun e!797282 () Bool)

(assert (=> b!1408815 (= e!797282 true)))

(declare-datatypes ((SeekEntryResult!10813 0))(
  ( (MissingZero!10813 (index!45629 (_ BitVec 32))) (Found!10813 (index!45630 (_ BitVec 32))) (Intermediate!10813 (undefined!11625 Bool) (index!45631 (_ BitVec 32)) (x!127230 (_ BitVec 32))) (Undefined!10813) (MissingVacant!10813 (index!45632 (_ BitVec 32))) )
))
(declare-fun lt!620490 () SeekEntryResult!10813)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96318 (_ BitVec 32)) SeekEntryResult!10813)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1408815 (= lt!620490 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46502 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46502 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96319 (store (arr!46502 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47052 a!2901)) mask!2840))))

(declare-fun b!1408816 () Bool)

(assert (=> b!1408816 (= e!797283 (not e!797282))))

(declare-fun res!946541 () Bool)

(assert (=> b!1408816 (=> res!946541 e!797282)))

(declare-fun lt!620488 () SeekEntryResult!10813)

(assert (=> b!1408816 (= res!946541 (or (not (is-Intermediate!10813 lt!620488)) (undefined!11625 lt!620488)))))

(declare-fun e!797284 () Bool)

(assert (=> b!1408816 e!797284))

(declare-fun res!946540 () Bool)

(assert (=> b!1408816 (=> (not res!946540) (not e!797284))))

(assert (=> b!1408816 (= res!946540 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47600 0))(
  ( (Unit!47601) )
))
(declare-fun lt!620489 () Unit!47600)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96318 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47600)

(assert (=> b!1408816 (= lt!620489 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1408816 (= lt!620488 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46502 a!2901) j!112) mask!2840) (select (arr!46502 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1408817 () Bool)

(declare-fun res!946542 () Bool)

(assert (=> b!1408817 (=> (not res!946542) (not e!797283))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1408817 (= res!946542 (validKeyInArray!0 (select (arr!46502 a!2901) j!112)))))

(declare-fun b!1408819 () Bool)

(declare-fun res!946539 () Bool)

(assert (=> b!1408819 (=> (not res!946539) (not e!797283))))

(assert (=> b!1408819 (= res!946539 (and (= (size!47052 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47052 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47052 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1408820 () Bool)

(declare-fun res!946536 () Bool)

(assert (=> b!1408820 (=> (not res!946536) (not e!797283))))

(declare-datatypes ((List!33021 0))(
  ( (Nil!33018) (Cons!33017 (h!34280 (_ BitVec 64)) (t!47715 List!33021)) )
))
(declare-fun arrayNoDuplicates!0 (array!96318 (_ BitVec 32) List!33021) Bool)

(assert (=> b!1408820 (= res!946536 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33018))))

(declare-fun b!1408821 () Bool)

(declare-fun res!946537 () Bool)

(assert (=> b!1408821 (=> (not res!946537) (not e!797283))))

(assert (=> b!1408821 (= res!946537 (validKeyInArray!0 (select (arr!46502 a!2901) i!1037)))))

(declare-fun b!1408818 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96318 (_ BitVec 32)) SeekEntryResult!10813)

(assert (=> b!1408818 (= e!797284 (= (seekEntryOrOpen!0 (select (arr!46502 a!2901) j!112) a!2901 mask!2840) (Found!10813 j!112)))))

(declare-fun res!946538 () Bool)

(assert (=> start!121164 (=> (not res!946538) (not e!797283))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121164 (= res!946538 (validMask!0 mask!2840))))

(assert (=> start!121164 e!797283))

(assert (=> start!121164 true))

(declare-fun array_inv!35530 (array!96318) Bool)

(assert (=> start!121164 (array_inv!35530 a!2901)))

(assert (= (and start!121164 res!946538) b!1408819))

(assert (= (and b!1408819 res!946539) b!1408821))

(assert (= (and b!1408821 res!946537) b!1408817))

(assert (= (and b!1408817 res!946542) b!1408814))

(assert (= (and b!1408814 res!946543) b!1408820))

(assert (= (and b!1408820 res!946536) b!1408816))

(assert (= (and b!1408816 res!946540) b!1408818))

(assert (= (and b!1408816 (not res!946541)) b!1408815))

(declare-fun m!1298271 () Bool)

(assert (=> b!1408815 m!1298271))

(declare-fun m!1298273 () Bool)

(assert (=> b!1408815 m!1298273))

(assert (=> b!1408815 m!1298273))

(declare-fun m!1298275 () Bool)

(assert (=> b!1408815 m!1298275))

(assert (=> b!1408815 m!1298275))

(assert (=> b!1408815 m!1298273))

(declare-fun m!1298277 () Bool)

(assert (=> b!1408815 m!1298277))

(declare-fun m!1298279 () Bool)

(assert (=> start!121164 m!1298279))

(declare-fun m!1298281 () Bool)

(assert (=> start!121164 m!1298281))

(declare-fun m!1298283 () Bool)

(assert (=> b!1408821 m!1298283))

(assert (=> b!1408821 m!1298283))

(declare-fun m!1298285 () Bool)

(assert (=> b!1408821 m!1298285))

(declare-fun m!1298287 () Bool)

(assert (=> b!1408820 m!1298287))

(declare-fun m!1298289 () Bool)

(assert (=> b!1408816 m!1298289))

(declare-fun m!1298291 () Bool)

(assert (=> b!1408816 m!1298291))

(assert (=> b!1408816 m!1298289))

(declare-fun m!1298293 () Bool)

(assert (=> b!1408816 m!1298293))

(assert (=> b!1408816 m!1298291))

(assert (=> b!1408816 m!1298289))

(declare-fun m!1298295 () Bool)

(assert (=> b!1408816 m!1298295))

(declare-fun m!1298297 () Bool)

(assert (=> b!1408816 m!1298297))

(declare-fun m!1298299 () Bool)

(assert (=> b!1408814 m!1298299))

(assert (=> b!1408818 m!1298289))

(assert (=> b!1408818 m!1298289))

(declare-fun m!1298301 () Bool)

(assert (=> b!1408818 m!1298301))

(assert (=> b!1408817 m!1298289))

(assert (=> b!1408817 m!1298289))

(declare-fun m!1298303 () Bool)

(assert (=> b!1408817 m!1298303))

(push 1)

(assert (not b!1408818))

(assert (not b!1408815))

(assert (not start!121164))

(assert (not b!1408821))

(assert (not b!1408816))

(assert (not b!1408814))

(assert (not b!1408820))

(assert (not b!1408817))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

