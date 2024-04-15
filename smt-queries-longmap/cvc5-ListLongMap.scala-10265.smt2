; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120750 () Bool)

(assert start!120750)

(declare-fun b!1404993 () Bool)

(declare-fun res!943267 () Bool)

(declare-fun e!795361 () Bool)

(assert (=> b!1404993 (=> (not res!943267) (not e!795361))))

(declare-datatypes ((array!96010 0))(
  ( (array!96011 (arr!46353 (Array (_ BitVec 32) (_ BitVec 64))) (size!46905 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96010)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1404993 (= res!943267 (validKeyInArray!0 (select (arr!46353 a!2901) i!1037)))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun e!795362 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun b!1404994 () Bool)

(declare-datatypes ((SeekEntryResult!10690 0))(
  ( (MissingZero!10690 (index!45137 (_ BitVec 32))) (Found!10690 (index!45138 (_ BitVec 32))) (Intermediate!10690 (undefined!11502 Bool) (index!45139 (_ BitVec 32)) (x!126750 (_ BitVec 32))) (Undefined!10690) (MissingVacant!10690 (index!45140 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96010 (_ BitVec 32)) SeekEntryResult!10690)

(assert (=> b!1404994 (= e!795362 (= (seekEntryOrOpen!0 (select (arr!46353 a!2901) j!112) a!2901 mask!2840) (Found!10690 j!112)))))

(declare-fun b!1404995 () Bool)

(declare-fun res!943266 () Bool)

(assert (=> b!1404995 (=> (not res!943266) (not e!795361))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96010 (_ BitVec 32)) Bool)

(assert (=> b!1404995 (= res!943266 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1404996 () Bool)

(assert (=> b!1404996 (= e!795361 (not true))))

(assert (=> b!1404996 e!795362))

(declare-fun res!943265 () Bool)

(assert (=> b!1404996 (=> (not res!943265) (not e!795362))))

(assert (=> b!1404996 (= res!943265 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47197 0))(
  ( (Unit!47198) )
))
(declare-fun lt!618734 () Unit!47197)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96010 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47197)

(assert (=> b!1404996 (= lt!618734 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!618733 () SeekEntryResult!10690)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96010 (_ BitVec 32)) SeekEntryResult!10690)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1404996 (= lt!618733 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46353 a!2901) j!112) mask!2840) (select (arr!46353 a!2901) j!112) a!2901 mask!2840))))

(declare-fun res!943263 () Bool)

(assert (=> start!120750 (=> (not res!943263) (not e!795361))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120750 (= res!943263 (validMask!0 mask!2840))))

(assert (=> start!120750 e!795361))

(assert (=> start!120750 true))

(declare-fun array_inv!35586 (array!96010) Bool)

(assert (=> start!120750 (array_inv!35586 a!2901)))

(declare-fun b!1404997 () Bool)

(declare-fun res!943261 () Bool)

(assert (=> b!1404997 (=> (not res!943261) (not e!795361))))

(assert (=> b!1404997 (= res!943261 (and (= (size!46905 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46905 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46905 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1404998 () Bool)

(declare-fun res!943264 () Bool)

(assert (=> b!1404998 (=> (not res!943264) (not e!795361))))

(assert (=> b!1404998 (= res!943264 (validKeyInArray!0 (select (arr!46353 a!2901) j!112)))))

(declare-fun b!1404999 () Bool)

(declare-fun res!943262 () Bool)

(assert (=> b!1404999 (=> (not res!943262) (not e!795361))))

(declare-datatypes ((List!32950 0))(
  ( (Nil!32947) (Cons!32946 (h!34200 (_ BitVec 64)) (t!47636 List!32950)) )
))
(declare-fun arrayNoDuplicates!0 (array!96010 (_ BitVec 32) List!32950) Bool)

(assert (=> b!1404999 (= res!943262 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32947))))

(assert (= (and start!120750 res!943263) b!1404997))

(assert (= (and b!1404997 res!943261) b!1404993))

(assert (= (and b!1404993 res!943267) b!1404998))

(assert (= (and b!1404998 res!943264) b!1404995))

(assert (= (and b!1404995 res!943266) b!1404999))

(assert (= (and b!1404999 res!943262) b!1404996))

(assert (= (and b!1404996 res!943265) b!1404994))

(declare-fun m!1293233 () Bool)

(assert (=> b!1404995 m!1293233))

(declare-fun m!1293235 () Bool)

(assert (=> start!120750 m!1293235))

(declare-fun m!1293237 () Bool)

(assert (=> start!120750 m!1293237))

(declare-fun m!1293239 () Bool)

(assert (=> b!1404998 m!1293239))

(assert (=> b!1404998 m!1293239))

(declare-fun m!1293241 () Bool)

(assert (=> b!1404998 m!1293241))

(assert (=> b!1404994 m!1293239))

(assert (=> b!1404994 m!1293239))

(declare-fun m!1293243 () Bool)

(assert (=> b!1404994 m!1293243))

(declare-fun m!1293245 () Bool)

(assert (=> b!1404999 m!1293245))

(assert (=> b!1404996 m!1293239))

(declare-fun m!1293247 () Bool)

(assert (=> b!1404996 m!1293247))

(assert (=> b!1404996 m!1293239))

(declare-fun m!1293249 () Bool)

(assert (=> b!1404996 m!1293249))

(assert (=> b!1404996 m!1293247))

(assert (=> b!1404996 m!1293239))

(declare-fun m!1293251 () Bool)

(assert (=> b!1404996 m!1293251))

(declare-fun m!1293253 () Bool)

(assert (=> b!1404996 m!1293253))

(declare-fun m!1293255 () Bool)

(assert (=> b!1404993 m!1293255))

(assert (=> b!1404993 m!1293255))

(declare-fun m!1293257 () Bool)

(assert (=> b!1404993 m!1293257))

(push 1)

(assert (not b!1404998))

(assert (not start!120750))

(assert (not b!1404993))

(assert (not b!1404996))

(assert (not b!1404999))

(assert (not b!1404995))

(assert (not b!1404994))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

