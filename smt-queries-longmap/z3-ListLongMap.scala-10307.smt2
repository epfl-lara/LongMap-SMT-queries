; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121166 () Bool)

(assert start!121166)

(declare-fun b!1408838 () Bool)

(declare-fun e!797295 () Bool)

(assert (=> b!1408838 (= e!797295 true)))

(declare-datatypes ((array!96320 0))(
  ( (array!96321 (arr!46503 (Array (_ BitVec 32) (_ BitVec 64))) (size!47053 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96320)

(declare-datatypes ((SeekEntryResult!10814 0))(
  ( (MissingZero!10814 (index!45633 (_ BitVec 32))) (Found!10814 (index!45634 (_ BitVec 32))) (Intermediate!10814 (undefined!11626 Bool) (index!45635 (_ BitVec 32)) (x!127231 (_ BitVec 32))) (Undefined!10814) (MissingVacant!10814 (index!45636 (_ BitVec 32))) )
))
(declare-fun lt!620498 () SeekEntryResult!10814)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96320 (_ BitVec 32)) SeekEntryResult!10814)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1408838 (= lt!620498 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46503 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46503 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96321 (store (arr!46503 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47053 a!2901)) mask!2840))))

(declare-fun b!1408839 () Bool)

(declare-fun res!946563 () Bool)

(declare-fun e!797294 () Bool)

(assert (=> b!1408839 (=> (not res!946563) (not e!797294))))

(declare-datatypes ((List!33022 0))(
  ( (Nil!33019) (Cons!33018 (h!34281 (_ BitVec 64)) (t!47716 List!33022)) )
))
(declare-fun arrayNoDuplicates!0 (array!96320 (_ BitVec 32) List!33022) Bool)

(assert (=> b!1408839 (= res!946563 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33019))))

(declare-fun b!1408840 () Bool)

(declare-fun res!946567 () Bool)

(assert (=> b!1408840 (=> (not res!946567) (not e!797294))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96320 (_ BitVec 32)) Bool)

(assert (=> b!1408840 (= res!946567 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1408841 () Bool)

(declare-fun e!797296 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96320 (_ BitVec 32)) SeekEntryResult!10814)

(assert (=> b!1408841 (= e!797296 (= (seekEntryOrOpen!0 (select (arr!46503 a!2901) j!112) a!2901 mask!2840) (Found!10814 j!112)))))

(declare-fun b!1408842 () Bool)

(declare-fun res!946564 () Bool)

(assert (=> b!1408842 (=> (not res!946564) (not e!797294))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1408842 (= res!946564 (validKeyInArray!0 (select (arr!46503 a!2901) j!112)))))

(declare-fun b!1408843 () Bool)

(declare-fun res!946565 () Bool)

(assert (=> b!1408843 (=> (not res!946565) (not e!797294))))

(assert (=> b!1408843 (= res!946565 (validKeyInArray!0 (select (arr!46503 a!2901) i!1037)))))

(declare-fun b!1408844 () Bool)

(assert (=> b!1408844 (= e!797294 (not e!797295))))

(declare-fun res!946560 () Bool)

(assert (=> b!1408844 (=> res!946560 e!797295)))

(declare-fun lt!620499 () SeekEntryResult!10814)

(get-info :version)

(assert (=> b!1408844 (= res!946560 (or (not ((_ is Intermediate!10814) lt!620499)) (undefined!11626 lt!620499)))))

(assert (=> b!1408844 e!797296))

(declare-fun res!946562 () Bool)

(assert (=> b!1408844 (=> (not res!946562) (not e!797296))))

(assert (=> b!1408844 (= res!946562 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47602 0))(
  ( (Unit!47603) )
))
(declare-fun lt!620497 () Unit!47602)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96320 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47602)

(assert (=> b!1408844 (= lt!620497 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1408844 (= lt!620499 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46503 a!2901) j!112) mask!2840) (select (arr!46503 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1408845 () Bool)

(declare-fun res!946566 () Bool)

(assert (=> b!1408845 (=> (not res!946566) (not e!797294))))

(assert (=> b!1408845 (= res!946566 (and (= (size!47053 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47053 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47053 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!946561 () Bool)

(assert (=> start!121166 (=> (not res!946561) (not e!797294))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121166 (= res!946561 (validMask!0 mask!2840))))

(assert (=> start!121166 e!797294))

(assert (=> start!121166 true))

(declare-fun array_inv!35531 (array!96320) Bool)

(assert (=> start!121166 (array_inv!35531 a!2901)))

(assert (= (and start!121166 res!946561) b!1408845))

(assert (= (and b!1408845 res!946566) b!1408843))

(assert (= (and b!1408843 res!946565) b!1408842))

(assert (= (and b!1408842 res!946564) b!1408840))

(assert (= (and b!1408840 res!946567) b!1408839))

(assert (= (and b!1408839 res!946563) b!1408844))

(assert (= (and b!1408844 res!946562) b!1408841))

(assert (= (and b!1408844 (not res!946560)) b!1408838))

(declare-fun m!1298305 () Bool)

(assert (=> b!1408842 m!1298305))

(assert (=> b!1408842 m!1298305))

(declare-fun m!1298307 () Bool)

(assert (=> b!1408842 m!1298307))

(declare-fun m!1298309 () Bool)

(assert (=> start!121166 m!1298309))

(declare-fun m!1298311 () Bool)

(assert (=> start!121166 m!1298311))

(assert (=> b!1408844 m!1298305))

(declare-fun m!1298313 () Bool)

(assert (=> b!1408844 m!1298313))

(assert (=> b!1408844 m!1298305))

(declare-fun m!1298315 () Bool)

(assert (=> b!1408844 m!1298315))

(assert (=> b!1408844 m!1298313))

(assert (=> b!1408844 m!1298305))

(declare-fun m!1298317 () Bool)

(assert (=> b!1408844 m!1298317))

(declare-fun m!1298319 () Bool)

(assert (=> b!1408844 m!1298319))

(declare-fun m!1298321 () Bool)

(assert (=> b!1408838 m!1298321))

(declare-fun m!1298323 () Bool)

(assert (=> b!1408838 m!1298323))

(assert (=> b!1408838 m!1298323))

(declare-fun m!1298325 () Bool)

(assert (=> b!1408838 m!1298325))

(assert (=> b!1408838 m!1298325))

(assert (=> b!1408838 m!1298323))

(declare-fun m!1298327 () Bool)

(assert (=> b!1408838 m!1298327))

(declare-fun m!1298329 () Bool)

(assert (=> b!1408840 m!1298329))

(declare-fun m!1298331 () Bool)

(assert (=> b!1408843 m!1298331))

(assert (=> b!1408843 m!1298331))

(declare-fun m!1298333 () Bool)

(assert (=> b!1408843 m!1298333))

(assert (=> b!1408841 m!1298305))

(assert (=> b!1408841 m!1298305))

(declare-fun m!1298335 () Bool)

(assert (=> b!1408841 m!1298335))

(declare-fun m!1298337 () Bool)

(assert (=> b!1408839 m!1298337))

(check-sat (not start!121166) (not b!1408843) (not b!1408841) (not b!1408842) (not b!1408839) (not b!1408844) (not b!1408838) (not b!1408840))
