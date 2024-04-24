; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!123114 () Bool)

(assert start!123114)

(declare-fun b!1426602 () Bool)

(declare-fun res!961155 () Bool)

(declare-fun e!806215 () Bool)

(assert (=> b!1426602 (=> (not res!961155) (not e!806215))))

(declare-datatypes ((array!97350 0))(
  ( (array!97351 (arr!46989 (Array (_ BitVec 32) (_ BitVec 64))) (size!47540 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97350)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97350 (_ BitVec 32)) Bool)

(assert (=> b!1426602 (= res!961155 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1426603 () Bool)

(declare-fun res!961151 () Bool)

(assert (=> b!1426603 (=> (not res!961151) (not e!806215))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1426603 (= res!961151 (and (= (size!47540 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47540 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47540 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1426604 () Bool)

(declare-fun res!961152 () Bool)

(assert (=> b!1426604 (=> (not res!961152) (not e!806215))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1426604 (= res!961152 (validKeyInArray!0 (select (arr!46989 a!2831) j!81)))))

(declare-fun res!961154 () Bool)

(assert (=> start!123114 (=> (not res!961154) (not e!806215))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123114 (= res!961154 (validMask!0 mask!2608))))

(assert (=> start!123114 e!806215))

(assert (=> start!123114 true))

(declare-fun array_inv!36270 (array!97350) Bool)

(assert (=> start!123114 (array_inv!36270 a!2831)))

(declare-fun b!1426605 () Bool)

(declare-fun res!961150 () Bool)

(assert (=> b!1426605 (=> (not res!961150) (not e!806215))))

(assert (=> b!1426605 (= res!961150 (validKeyInArray!0 (select (arr!46989 a!2831) i!982)))))

(declare-fun b!1426606 () Bool)

(declare-fun res!961153 () Bool)

(assert (=> b!1426606 (=> (not res!961153) (not e!806215))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1426606 (= res!961153 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47540 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47540 a!2831))))))

(declare-fun b!1426607 () Bool)

(assert (=> b!1426607 (= e!806215 false)))

(declare-datatypes ((SeekEntryResult!11170 0))(
  ( (MissingZero!11170 (index!47072 (_ BitVec 32))) (Found!11170 (index!47073 (_ BitVec 32))) (Intermediate!11170 (undefined!11982 Bool) (index!47074 (_ BitVec 32)) (x!128869 (_ BitVec 32))) (Undefined!11170) (MissingVacant!11170 (index!47075 (_ BitVec 32))) )
))
(declare-fun lt!628310 () SeekEntryResult!11170)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97350 (_ BitVec 32)) SeekEntryResult!11170)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1426607 (= lt!628310 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46989 a!2831) j!81) mask!2608) (select (arr!46989 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1426608 () Bool)

(declare-fun res!961156 () Bool)

(assert (=> b!1426608 (=> (not res!961156) (not e!806215))))

(declare-datatypes ((List!33486 0))(
  ( (Nil!33483) (Cons!33482 (h!34795 (_ BitVec 64)) (t!48172 List!33486)) )
))
(declare-fun arrayNoDuplicates!0 (array!97350 (_ BitVec 32) List!33486) Bool)

(assert (=> b!1426608 (= res!961156 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33483))))

(assert (= (and start!123114 res!961154) b!1426603))

(assert (= (and b!1426603 res!961151) b!1426605))

(assert (= (and b!1426605 res!961150) b!1426604))

(assert (= (and b!1426604 res!961152) b!1426602))

(assert (= (and b!1426602 res!961155) b!1426608))

(assert (= (and b!1426608 res!961156) b!1426606))

(assert (= (and b!1426606 res!961153) b!1426607))

(declare-fun m!1317271 () Bool)

(assert (=> start!123114 m!1317271))

(declare-fun m!1317273 () Bool)

(assert (=> start!123114 m!1317273))

(declare-fun m!1317275 () Bool)

(assert (=> b!1426604 m!1317275))

(assert (=> b!1426604 m!1317275))

(declare-fun m!1317277 () Bool)

(assert (=> b!1426604 m!1317277))

(declare-fun m!1317279 () Bool)

(assert (=> b!1426602 m!1317279))

(declare-fun m!1317281 () Bool)

(assert (=> b!1426608 m!1317281))

(declare-fun m!1317283 () Bool)

(assert (=> b!1426605 m!1317283))

(assert (=> b!1426605 m!1317283))

(declare-fun m!1317285 () Bool)

(assert (=> b!1426605 m!1317285))

(assert (=> b!1426607 m!1317275))

(assert (=> b!1426607 m!1317275))

(declare-fun m!1317287 () Bool)

(assert (=> b!1426607 m!1317287))

(assert (=> b!1426607 m!1317287))

(assert (=> b!1426607 m!1317275))

(declare-fun m!1317289 () Bool)

(assert (=> b!1426607 m!1317289))

(push 1)

(assert (not b!1426608))

(assert (not start!123114))

(assert (not b!1426605))

(assert (not b!1426604))

(assert (not b!1426607))

(assert (not b!1426602))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

