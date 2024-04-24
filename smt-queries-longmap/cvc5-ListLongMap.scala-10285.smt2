; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121062 () Bool)

(assert start!121062)

(declare-fun b!1407572 () Bool)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96291 0))(
  ( (array!96292 (arr!46491 (Array (_ BitVec 32) (_ BitVec 64))) (size!47042 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96291)

(declare-fun e!796777 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10705 0))(
  ( (MissingZero!10705 (index!45197 (_ BitVec 32))) (Found!10705 (index!45198 (_ BitVec 32))) (Intermediate!10705 (undefined!11517 Bool) (index!45199 (_ BitVec 32)) (x!126947 (_ BitVec 32))) (Undefined!10705) (MissingVacant!10705 (index!45200 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96291 (_ BitVec 32)) SeekEntryResult!10705)

(assert (=> b!1407572 (= e!796777 (= (seekEntryOrOpen!0 (select (arr!46491 a!2901) j!112) a!2901 mask!2840) (Found!10705 j!112)))))

(declare-fun b!1407573 () Bool)

(declare-fun res!945105 () Bool)

(declare-fun e!796776 () Bool)

(assert (=> b!1407573 (=> (not res!945105) (not e!796776))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1407573 (= res!945105 (and (= (size!47042 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47042 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47042 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1407574 () Bool)

(declare-fun res!945109 () Bool)

(assert (=> b!1407574 (=> (not res!945109) (not e!796776))))

(declare-datatypes ((List!32997 0))(
  ( (Nil!32994) (Cons!32993 (h!34255 (_ BitVec 64)) (t!47683 List!32997)) )
))
(declare-fun arrayNoDuplicates!0 (array!96291 (_ BitVec 32) List!32997) Bool)

(assert (=> b!1407574 (= res!945109 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32994))))

(declare-fun res!945106 () Bool)

(assert (=> start!121062 (=> (not res!945106) (not e!796776))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121062 (= res!945106 (validMask!0 mask!2840))))

(assert (=> start!121062 e!796776))

(assert (=> start!121062 true))

(declare-fun array_inv!35772 (array!96291) Bool)

(assert (=> start!121062 (array_inv!35772 a!2901)))

(declare-fun b!1407575 () Bool)

(declare-fun res!945112 () Bool)

(assert (=> b!1407575 (=> (not res!945112) (not e!796776))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1407575 (= res!945112 (validKeyInArray!0 (select (arr!46491 a!2901) i!1037)))))

(declare-fun b!1407576 () Bool)

(declare-fun res!945110 () Bool)

(assert (=> b!1407576 (=> (not res!945110) (not e!796776))))

(assert (=> b!1407576 (= res!945110 (validKeyInArray!0 (select (arr!46491 a!2901) j!112)))))

(declare-fun b!1407577 () Bool)

(declare-fun res!945111 () Bool)

(assert (=> b!1407577 (=> (not res!945111) (not e!796776))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96291 (_ BitVec 32)) Bool)

(assert (=> b!1407577 (= res!945111 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1407578 () Bool)

(declare-fun e!796778 () Bool)

(assert (=> b!1407578 (= e!796776 (not e!796778))))

(declare-fun res!945107 () Bool)

(assert (=> b!1407578 (=> res!945107 e!796778)))

(declare-fun lt!619779 () SeekEntryResult!10705)

(assert (=> b!1407578 (= res!945107 (or (not (is-Intermediate!10705 lt!619779)) (undefined!11517 lt!619779)))))

(assert (=> b!1407578 e!796777))

(declare-fun res!945108 () Bool)

(assert (=> b!1407578 (=> (not res!945108) (not e!796777))))

(assert (=> b!1407578 (= res!945108 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47411 0))(
  ( (Unit!47412) )
))
(declare-fun lt!619781 () Unit!47411)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96291 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47411)

(assert (=> b!1407578 (= lt!619781 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96291 (_ BitVec 32)) SeekEntryResult!10705)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1407578 (= lt!619779 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46491 a!2901) j!112) mask!2840) (select (arr!46491 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1407579 () Bool)

(assert (=> b!1407579 (= e!796778 true)))

(declare-fun lt!619780 () SeekEntryResult!10705)

(assert (=> b!1407579 (= lt!619780 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46491 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46491 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96292 (store (arr!46491 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47042 a!2901)) mask!2840))))

(assert (= (and start!121062 res!945106) b!1407573))

(assert (= (and b!1407573 res!945105) b!1407575))

(assert (= (and b!1407575 res!945112) b!1407576))

(assert (= (and b!1407576 res!945110) b!1407577))

(assert (= (and b!1407577 res!945111) b!1407574))

(assert (= (and b!1407574 res!945109) b!1407578))

(assert (= (and b!1407578 res!945108) b!1407572))

(assert (= (and b!1407578 (not res!945107)) b!1407579))

(declare-fun m!1296945 () Bool)

(assert (=> start!121062 m!1296945))

(declare-fun m!1296947 () Bool)

(assert (=> start!121062 m!1296947))

(declare-fun m!1296949 () Bool)

(assert (=> b!1407575 m!1296949))

(assert (=> b!1407575 m!1296949))

(declare-fun m!1296951 () Bool)

(assert (=> b!1407575 m!1296951))

(declare-fun m!1296953 () Bool)

(assert (=> b!1407578 m!1296953))

(declare-fun m!1296955 () Bool)

(assert (=> b!1407578 m!1296955))

(assert (=> b!1407578 m!1296953))

(declare-fun m!1296957 () Bool)

(assert (=> b!1407578 m!1296957))

(assert (=> b!1407578 m!1296955))

(assert (=> b!1407578 m!1296953))

(declare-fun m!1296959 () Bool)

(assert (=> b!1407578 m!1296959))

(declare-fun m!1296961 () Bool)

(assert (=> b!1407578 m!1296961))

(assert (=> b!1407576 m!1296953))

(assert (=> b!1407576 m!1296953))

(declare-fun m!1296963 () Bool)

(assert (=> b!1407576 m!1296963))

(declare-fun m!1296965 () Bool)

(assert (=> b!1407577 m!1296965))

(declare-fun m!1296967 () Bool)

(assert (=> b!1407579 m!1296967))

(declare-fun m!1296969 () Bool)

(assert (=> b!1407579 m!1296969))

(assert (=> b!1407579 m!1296969))

(declare-fun m!1296971 () Bool)

(assert (=> b!1407579 m!1296971))

(assert (=> b!1407579 m!1296971))

(assert (=> b!1407579 m!1296969))

(declare-fun m!1296973 () Bool)

(assert (=> b!1407579 m!1296973))

(declare-fun m!1296975 () Bool)

(assert (=> b!1407574 m!1296975))

(assert (=> b!1407572 m!1296953))

(assert (=> b!1407572 m!1296953))

(declare-fun m!1296977 () Bool)

(assert (=> b!1407572 m!1296977))

(push 1)

(assert (not b!1407574))

(assert (not b!1407578))

(assert (not b!1407575))

(assert (not b!1407572))

(assert (not b!1407577))

(assert (not b!1407579))

(assert (not start!121062))

(assert (not b!1407576))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

