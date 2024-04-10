; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121144 () Bool)

(assert start!121144)

(declare-fun b!1408574 () Bool)

(declare-fun res!946302 () Bool)

(declare-fun e!797162 () Bool)

(assert (=> b!1408574 (=> (not res!946302) (not e!797162))))

(declare-datatypes ((array!96298 0))(
  ( (array!96299 (arr!46492 (Array (_ BitVec 32) (_ BitVec 64))) (size!47042 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96298)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1408574 (= res!946302 (validKeyInArray!0 (select (arr!46492 a!2901) i!1037)))))

(declare-fun res!946299 () Bool)

(assert (=> start!121144 (=> (not res!946299) (not e!797162))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121144 (= res!946299 (validMask!0 mask!2840))))

(assert (=> start!121144 e!797162))

(assert (=> start!121144 true))

(declare-fun array_inv!35520 (array!96298) Bool)

(assert (=> start!121144 (array_inv!35520 a!2901)))

(declare-fun b!1408575 () Bool)

(declare-fun e!797165 () Bool)

(assert (=> b!1408575 (= e!797162 (not e!797165))))

(declare-fun res!946297 () Bool)

(assert (=> b!1408575 (=> res!946297 e!797165)))

(declare-datatypes ((SeekEntryResult!10803 0))(
  ( (MissingZero!10803 (index!45589 (_ BitVec 32))) (Found!10803 (index!45590 (_ BitVec 32))) (Intermediate!10803 (undefined!11615 Bool) (index!45591 (_ BitVec 32)) (x!127188 (_ BitVec 32))) (Undefined!10803) (MissingVacant!10803 (index!45592 (_ BitVec 32))) )
))
(declare-fun lt!620398 () SeekEntryResult!10803)

(assert (=> b!1408575 (= res!946297 (or (not (is-Intermediate!10803 lt!620398)) (undefined!11615 lt!620398)))))

(declare-fun e!797164 () Bool)

(assert (=> b!1408575 e!797164))

(declare-fun res!946301 () Bool)

(assert (=> b!1408575 (=> (not res!946301) (not e!797164))))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96298 (_ BitVec 32)) Bool)

(assert (=> b!1408575 (= res!946301 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47580 0))(
  ( (Unit!47581) )
))
(declare-fun lt!620399 () Unit!47580)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96298 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47580)

(assert (=> b!1408575 (= lt!620399 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96298 (_ BitVec 32)) SeekEntryResult!10803)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1408575 (= lt!620398 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46492 a!2901) j!112) mask!2840) (select (arr!46492 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1408576 () Bool)

(declare-fun res!946303 () Bool)

(assert (=> b!1408576 (=> (not res!946303) (not e!797162))))

(assert (=> b!1408576 (= res!946303 (validKeyInArray!0 (select (arr!46492 a!2901) j!112)))))

(declare-fun b!1408577 () Bool)

(declare-fun res!946298 () Bool)

(assert (=> b!1408577 (=> (not res!946298) (not e!797162))))

(declare-datatypes ((List!33011 0))(
  ( (Nil!33008) (Cons!33007 (h!34270 (_ BitVec 64)) (t!47705 List!33011)) )
))
(declare-fun arrayNoDuplicates!0 (array!96298 (_ BitVec 32) List!33011) Bool)

(assert (=> b!1408577 (= res!946298 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33008))))

(declare-fun b!1408578 () Bool)

(declare-fun res!946296 () Bool)

(assert (=> b!1408578 (=> (not res!946296) (not e!797162))))

(assert (=> b!1408578 (= res!946296 (and (= (size!47042 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47042 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47042 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1408579 () Bool)

(declare-fun res!946300 () Bool)

(assert (=> b!1408579 (=> (not res!946300) (not e!797162))))

(assert (=> b!1408579 (= res!946300 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1408580 () Bool)

(assert (=> b!1408580 (= e!797165 true)))

(declare-fun lt!620400 () SeekEntryResult!10803)

(assert (=> b!1408580 (= lt!620400 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46492 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46492 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96299 (store (arr!46492 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47042 a!2901)) mask!2840))))

(declare-fun b!1408581 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96298 (_ BitVec 32)) SeekEntryResult!10803)

(assert (=> b!1408581 (= e!797164 (= (seekEntryOrOpen!0 (select (arr!46492 a!2901) j!112) a!2901 mask!2840) (Found!10803 j!112)))))

(assert (= (and start!121144 res!946299) b!1408578))

(assert (= (and b!1408578 res!946296) b!1408574))

(assert (= (and b!1408574 res!946302) b!1408576))

(assert (= (and b!1408576 res!946303) b!1408579))

(assert (= (and b!1408579 res!946300) b!1408577))

(assert (= (and b!1408577 res!946298) b!1408575))

(assert (= (and b!1408575 res!946301) b!1408581))

(assert (= (and b!1408575 (not res!946297)) b!1408580))

(declare-fun m!1297931 () Bool)

(assert (=> b!1408579 m!1297931))

(declare-fun m!1297933 () Bool)

(assert (=> b!1408581 m!1297933))

(assert (=> b!1408581 m!1297933))

(declare-fun m!1297935 () Bool)

(assert (=> b!1408581 m!1297935))

(assert (=> b!1408576 m!1297933))

(assert (=> b!1408576 m!1297933))

(declare-fun m!1297937 () Bool)

(assert (=> b!1408576 m!1297937))

(declare-fun m!1297939 () Bool)

(assert (=> b!1408580 m!1297939))

(declare-fun m!1297941 () Bool)

(assert (=> b!1408580 m!1297941))

(assert (=> b!1408580 m!1297941))

(declare-fun m!1297943 () Bool)

(assert (=> b!1408580 m!1297943))

(assert (=> b!1408580 m!1297943))

(assert (=> b!1408580 m!1297941))

(declare-fun m!1297945 () Bool)

(assert (=> b!1408580 m!1297945))

(declare-fun m!1297947 () Bool)

(assert (=> b!1408577 m!1297947))

(declare-fun m!1297949 () Bool)

(assert (=> start!121144 m!1297949))

(declare-fun m!1297951 () Bool)

(assert (=> start!121144 m!1297951))

(declare-fun m!1297953 () Bool)

(assert (=> b!1408574 m!1297953))

(assert (=> b!1408574 m!1297953))

(declare-fun m!1297955 () Bool)

(assert (=> b!1408574 m!1297955))

(assert (=> b!1408575 m!1297933))

(declare-fun m!1297957 () Bool)

(assert (=> b!1408575 m!1297957))

(assert (=> b!1408575 m!1297933))

(declare-fun m!1297959 () Bool)

(assert (=> b!1408575 m!1297959))

(assert (=> b!1408575 m!1297957))

(assert (=> b!1408575 m!1297933))

(declare-fun m!1297961 () Bool)

(assert (=> b!1408575 m!1297961))

(declare-fun m!1297963 () Bool)

(assert (=> b!1408575 m!1297963))

(push 1)

(assert (not b!1408574))

(assert (not b!1408579))

(assert (not b!1408576))

(assert (not b!1408581))

(assert (not b!1408580))

(assert (not start!121144))

(assert (not b!1408577))

(assert (not b!1408575))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

