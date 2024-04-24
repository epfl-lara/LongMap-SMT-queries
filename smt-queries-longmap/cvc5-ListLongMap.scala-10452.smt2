; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!123120 () Bool)

(assert start!123120)

(declare-fun res!961222 () Bool)

(declare-fun e!806233 () Bool)

(assert (=> start!123120 (=> (not res!961222) (not e!806233))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123120 (= res!961222 (validMask!0 mask!2608))))

(assert (=> start!123120 e!806233))

(assert (=> start!123120 true))

(declare-datatypes ((array!97356 0))(
  ( (array!97357 (arr!46992 (Array (_ BitVec 32) (_ BitVec 64))) (size!47543 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97356)

(declare-fun array_inv!36273 (array!97356) Bool)

(assert (=> start!123120 (array_inv!36273 a!2831)))

(declare-fun b!1426673 () Bool)

(declare-fun res!961223 () Bool)

(assert (=> b!1426673 (=> (not res!961223) (not e!806233))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1426673 (= res!961223 (validKeyInArray!0 (select (arr!46992 a!2831) j!81)))))

(declare-fun b!1426674 () Bool)

(declare-fun res!961228 () Bool)

(assert (=> b!1426674 (=> (not res!961228) (not e!806233))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1426674 (= res!961228 (and (= (size!47543 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47543 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47543 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1426675 () Bool)

(declare-fun res!961221 () Bool)

(assert (=> b!1426675 (=> (not res!961221) (not e!806233))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11173 0))(
  ( (MissingZero!11173 (index!47084 (_ BitVec 32))) (Found!11173 (index!47085 (_ BitVec 32))) (Intermediate!11173 (undefined!11985 Bool) (index!47086 (_ BitVec 32)) (x!128880 (_ BitVec 32))) (Undefined!11173) (MissingVacant!11173 (index!47087 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97356 (_ BitVec 32)) SeekEntryResult!11173)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1426675 (= res!961221 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46992 a!2831) j!81) mask!2608) (select (arr!46992 a!2831) j!81) a!2831 mask!2608) (Intermediate!11173 false intermediateBeforeIndex!13 intermediateBeforeX!13)))))

(declare-fun b!1426676 () Bool)

(declare-fun res!961227 () Bool)

(assert (=> b!1426676 (=> (not res!961227) (not e!806233))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97356 (_ BitVec 32)) Bool)

(assert (=> b!1426676 (= res!961227 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1426677 () Bool)

(declare-fun res!961224 () Bool)

(assert (=> b!1426677 (=> (not res!961224) (not e!806233))))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1426677 (= res!961224 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47543 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47543 a!2831))))))

(declare-fun b!1426678 () Bool)

(declare-fun res!961225 () Bool)

(assert (=> b!1426678 (=> (not res!961225) (not e!806233))))

(declare-datatypes ((List!33489 0))(
  ( (Nil!33486) (Cons!33485 (h!34798 (_ BitVec 64)) (t!48175 List!33489)) )
))
(declare-fun arrayNoDuplicates!0 (array!97356 (_ BitVec 32) List!33489) Bool)

(assert (=> b!1426678 (= res!961225 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33486))))

(declare-fun b!1426679 () Bool)

(declare-fun res!961226 () Bool)

(assert (=> b!1426679 (=> (not res!961226) (not e!806233))))

(assert (=> b!1426679 (= res!961226 (validKeyInArray!0 (select (arr!46992 a!2831) i!982)))))

(declare-fun b!1426680 () Bool)

(assert (=> b!1426680 (= e!806233 false)))

(declare-fun lt!628319 () (_ BitVec 32))

(assert (=> b!1426680 (= lt!628319 (toIndex!0 (select (store (arr!46992 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) mask!2608))))

(assert (= (and start!123120 res!961222) b!1426674))

(assert (= (and b!1426674 res!961228) b!1426679))

(assert (= (and b!1426679 res!961226) b!1426673))

(assert (= (and b!1426673 res!961223) b!1426676))

(assert (= (and b!1426676 res!961227) b!1426678))

(assert (= (and b!1426678 res!961225) b!1426677))

(assert (= (and b!1426677 res!961224) b!1426675))

(assert (= (and b!1426675 res!961221) b!1426680))

(declare-fun m!1317343 () Bool)

(assert (=> b!1426678 m!1317343))

(declare-fun m!1317345 () Bool)

(assert (=> b!1426675 m!1317345))

(assert (=> b!1426675 m!1317345))

(declare-fun m!1317347 () Bool)

(assert (=> b!1426675 m!1317347))

(assert (=> b!1426675 m!1317347))

(assert (=> b!1426675 m!1317345))

(declare-fun m!1317349 () Bool)

(assert (=> b!1426675 m!1317349))

(declare-fun m!1317351 () Bool)

(assert (=> b!1426679 m!1317351))

(assert (=> b!1426679 m!1317351))

(declare-fun m!1317353 () Bool)

(assert (=> b!1426679 m!1317353))

(declare-fun m!1317355 () Bool)

(assert (=> b!1426676 m!1317355))

(declare-fun m!1317357 () Bool)

(assert (=> b!1426680 m!1317357))

(declare-fun m!1317359 () Bool)

(assert (=> b!1426680 m!1317359))

(assert (=> b!1426680 m!1317359))

(declare-fun m!1317361 () Bool)

(assert (=> b!1426680 m!1317361))

(declare-fun m!1317363 () Bool)

(assert (=> start!123120 m!1317363))

(declare-fun m!1317365 () Bool)

(assert (=> start!123120 m!1317365))

(assert (=> b!1426673 m!1317345))

(assert (=> b!1426673 m!1317345))

(declare-fun m!1317367 () Bool)

(assert (=> b!1426673 m!1317367))

(push 1)

(assert (not b!1426673))

(assert (not b!1426678))

(assert (not b!1426680))

(assert (not b!1426675))

(assert (not start!123120))

(assert (not b!1426679))

(assert (not b!1426676))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

