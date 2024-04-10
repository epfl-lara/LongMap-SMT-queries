; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120534 () Bool)

(assert start!120534)

(declare-fun b!1403532 () Bool)

(declare-fun res!942047 () Bool)

(declare-fun e!794688 () Bool)

(assert (=> b!1403532 (=> (not res!942047) (not e!794688))))

(declare-datatypes ((array!95943 0))(
  ( (array!95944 (arr!46322 (Array (_ BitVec 32) (_ BitVec 64))) (size!46872 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95943)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1403532 (= res!942047 (validKeyInArray!0 (select (arr!46322 a!2901) i!1037)))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun e!794689 () Bool)

(declare-fun b!1403533 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10639 0))(
  ( (MissingZero!10639 (index!44933 (_ BitVec 32))) (Found!10639 (index!44934 (_ BitVec 32))) (Intermediate!10639 (undefined!11451 Bool) (index!44935 (_ BitVec 32)) (x!126546 (_ BitVec 32))) (Undefined!10639) (MissingVacant!10639 (index!44936 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95943 (_ BitVec 32)) SeekEntryResult!10639)

(assert (=> b!1403533 (= e!794689 (= (seekEntryOrOpen!0 (select (arr!46322 a!2901) j!112) a!2901 mask!2840) (Found!10639 j!112)))))

(declare-fun b!1403534 () Bool)

(declare-fun res!942044 () Bool)

(assert (=> b!1403534 (=> (not res!942044) (not e!794688))))

(assert (=> b!1403534 (= res!942044 (validKeyInArray!0 (select (arr!46322 a!2901) j!112)))))

(declare-fun res!942045 () Bool)

(assert (=> start!120534 (=> (not res!942045) (not e!794688))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120534 (= res!942045 (validMask!0 mask!2840))))

(assert (=> start!120534 e!794688))

(assert (=> start!120534 true))

(declare-fun array_inv!35350 (array!95943) Bool)

(assert (=> start!120534 (array_inv!35350 a!2901)))

(declare-fun b!1403535 () Bool)

(declare-fun res!942048 () Bool)

(assert (=> b!1403535 (=> (not res!942048) (not e!794688))))

(assert (=> b!1403535 (= res!942048 (and (= (size!46872 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46872 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46872 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1403536 () Bool)

(declare-fun res!942043 () Bool)

(assert (=> b!1403536 (=> (not res!942043) (not e!794688))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95943 (_ BitVec 32)) Bool)

(assert (=> b!1403536 (= res!942043 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1403537 () Bool)

(declare-fun res!942049 () Bool)

(assert (=> b!1403537 (=> (not res!942049) (not e!794688))))

(declare-datatypes ((List!32841 0))(
  ( (Nil!32838) (Cons!32837 (h!34085 (_ BitVec 64)) (t!47535 List!32841)) )
))
(declare-fun arrayNoDuplicates!0 (array!95943 (_ BitVec 32) List!32841) Bool)

(assert (=> b!1403537 (= res!942049 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32838))))

(declare-fun b!1403538 () Bool)

(assert (=> b!1403538 (= e!794688 (not true))))

(assert (=> b!1403538 e!794689))

(declare-fun res!942046 () Bool)

(assert (=> b!1403538 (=> (not res!942046) (not e!794689))))

(assert (=> b!1403538 (= res!942046 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47282 0))(
  ( (Unit!47283) )
))
(declare-fun lt!618435 () Unit!47282)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95943 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47282)

(assert (=> b!1403538 (= lt!618435 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!618434 () SeekEntryResult!10639)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95943 (_ BitVec 32)) SeekEntryResult!10639)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1403538 (= lt!618434 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46322 a!2901) j!112) mask!2840) (select (arr!46322 a!2901) j!112) a!2901 mask!2840))))

(assert (= (and start!120534 res!942045) b!1403535))

(assert (= (and b!1403535 res!942048) b!1403532))

(assert (= (and b!1403532 res!942047) b!1403534))

(assert (= (and b!1403534 res!942044) b!1403536))

(assert (= (and b!1403536 res!942043) b!1403537))

(assert (= (and b!1403537 res!942049) b!1403538))

(assert (= (and b!1403538 res!942046) b!1403533))

(declare-fun m!1292211 () Bool)

(assert (=> b!1403534 m!1292211))

(assert (=> b!1403534 m!1292211))

(declare-fun m!1292213 () Bool)

(assert (=> b!1403534 m!1292213))

(assert (=> b!1403533 m!1292211))

(assert (=> b!1403533 m!1292211))

(declare-fun m!1292215 () Bool)

(assert (=> b!1403533 m!1292215))

(assert (=> b!1403538 m!1292211))

(declare-fun m!1292217 () Bool)

(assert (=> b!1403538 m!1292217))

(assert (=> b!1403538 m!1292211))

(declare-fun m!1292219 () Bool)

(assert (=> b!1403538 m!1292219))

(assert (=> b!1403538 m!1292217))

(assert (=> b!1403538 m!1292211))

(declare-fun m!1292221 () Bool)

(assert (=> b!1403538 m!1292221))

(declare-fun m!1292223 () Bool)

(assert (=> b!1403538 m!1292223))

(declare-fun m!1292225 () Bool)

(assert (=> start!120534 m!1292225))

(declare-fun m!1292227 () Bool)

(assert (=> start!120534 m!1292227))

(declare-fun m!1292229 () Bool)

(assert (=> b!1403537 m!1292229))

(declare-fun m!1292231 () Bool)

(assert (=> b!1403532 m!1292231))

(assert (=> b!1403532 m!1292231))

(declare-fun m!1292233 () Bool)

(assert (=> b!1403532 m!1292233))

(declare-fun m!1292235 () Bool)

(assert (=> b!1403536 m!1292235))

(push 1)

(assert (not b!1403536))

(assert (not b!1403532))

(assert (not start!120534))

(assert (not b!1403538))

(assert (not b!1403533))

(assert (not b!1403534))

(assert (not b!1403537))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

