; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128784 () Bool)

(assert start!128784)

(declare-fun b!1508380 () Bool)

(declare-fun res!1027532 () Bool)

(declare-fun e!843074 () Bool)

(assert (=> b!1508380 (=> (not res!1027532) (not e!843074))))

(declare-datatypes ((array!100610 0))(
  ( (array!100611 (arr!48543 (Array (_ BitVec 32) (_ BitVec 64))) (size!49094 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100610)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1508380 (= res!1027532 (validKeyInArray!0 (select (arr!48543 a!2804) j!70)))))

(declare-fun b!1508381 () Bool)

(declare-fun res!1027531 () Bool)

(assert (=> b!1508381 (=> (not res!1027531) (not e!843074))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1508381 (= res!1027531 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49094 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49094 a!2804))))))

(declare-fun b!1508382 () Bool)

(assert (=> b!1508382 (= e!843074 false)))

(declare-datatypes ((SeekEntryResult!12607 0))(
  ( (MissingZero!12607 (index!52823 (_ BitVec 32))) (Found!12607 (index!52824 (_ BitVec 32))) (Intermediate!12607 (undefined!13419 Bool) (index!52825 (_ BitVec 32)) (x!134778 (_ BitVec 32))) (Undefined!12607) (MissingVacant!12607 (index!52826 (_ BitVec 32))) )
))
(declare-fun lt!654913 () SeekEntryResult!12607)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100610 (_ BitVec 32)) SeekEntryResult!12607)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1508382 (= lt!654913 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48543 a!2804) j!70) mask!2512) (select (arr!48543 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1508383 () Bool)

(declare-fun res!1027529 () Bool)

(assert (=> b!1508383 (=> (not res!1027529) (not e!843074))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1508383 (= res!1027529 (and (= (size!49094 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49094 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49094 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1508384 () Bool)

(declare-fun res!1027530 () Bool)

(assert (=> b!1508384 (=> (not res!1027530) (not e!843074))))

(declare-datatypes ((List!35013 0))(
  ( (Nil!35010) (Cons!35009 (h!36424 (_ BitVec 64)) (t!49699 List!35013)) )
))
(declare-fun arrayNoDuplicates!0 (array!100610 (_ BitVec 32) List!35013) Bool)

(assert (=> b!1508384 (= res!1027530 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35010))))

(declare-fun b!1508385 () Bool)

(declare-fun res!1027527 () Bool)

(assert (=> b!1508385 (=> (not res!1027527) (not e!843074))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100610 (_ BitVec 32)) Bool)

(assert (=> b!1508385 (= res!1027527 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1508386 () Bool)

(declare-fun res!1027528 () Bool)

(assert (=> b!1508386 (=> (not res!1027528) (not e!843074))))

(assert (=> b!1508386 (= res!1027528 (validKeyInArray!0 (select (arr!48543 a!2804) i!961)))))

(declare-fun res!1027526 () Bool)

(assert (=> start!128784 (=> (not res!1027526) (not e!843074))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128784 (= res!1027526 (validMask!0 mask!2512))))

(assert (=> start!128784 e!843074))

(assert (=> start!128784 true))

(declare-fun array_inv!37824 (array!100610) Bool)

(assert (=> start!128784 (array_inv!37824 a!2804)))

(assert (= (and start!128784 res!1027526) b!1508383))

(assert (= (and b!1508383 res!1027529) b!1508386))

(assert (= (and b!1508386 res!1027528) b!1508380))

(assert (= (and b!1508380 res!1027532) b!1508385))

(assert (= (and b!1508385 res!1027527) b!1508384))

(assert (= (and b!1508384 res!1027530) b!1508381))

(assert (= (and b!1508381 res!1027531) b!1508382))

(declare-fun m!1391275 () Bool)

(assert (=> b!1508385 m!1391275))

(declare-fun m!1391277 () Bool)

(assert (=> b!1508382 m!1391277))

(assert (=> b!1508382 m!1391277))

(declare-fun m!1391279 () Bool)

(assert (=> b!1508382 m!1391279))

(assert (=> b!1508382 m!1391279))

(assert (=> b!1508382 m!1391277))

(declare-fun m!1391281 () Bool)

(assert (=> b!1508382 m!1391281))

(assert (=> b!1508380 m!1391277))

(assert (=> b!1508380 m!1391277))

(declare-fun m!1391283 () Bool)

(assert (=> b!1508380 m!1391283))

(declare-fun m!1391285 () Bool)

(assert (=> b!1508386 m!1391285))

(assert (=> b!1508386 m!1391285))

(declare-fun m!1391287 () Bool)

(assert (=> b!1508386 m!1391287))

(declare-fun m!1391289 () Bool)

(assert (=> b!1508384 m!1391289))

(declare-fun m!1391291 () Bool)

(assert (=> start!128784 m!1391291))

(declare-fun m!1391293 () Bool)

(assert (=> start!128784 m!1391293))

(push 1)

(assert (not b!1508382))

(assert (not b!1508385))

(assert (not b!1508384))

(assert (not b!1508380))

(assert (not b!1508386))

(assert (not start!128784))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

