; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120006 () Bool)

(assert start!120006)

(declare-fun b!1396610 () Bool)

(declare-fun res!935171 () Bool)

(declare-fun e!790759 () Bool)

(assert (=> b!1396610 (=> (not res!935171) (not e!790759))))

(declare-datatypes ((array!95559 0))(
  ( (array!95560 (arr!46134 (Array (_ BitVec 32) (_ BitVec 64))) (size!46685 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95559)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95559 (_ BitVec 32)) Bool)

(assert (=> b!1396610 (= res!935171 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1396612 () Bool)

(declare-fun e!790760 () Bool)

(assert (=> b!1396612 (= e!790760 true)))

(declare-fun i!1037 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10354 0))(
  ( (MissingZero!10354 (index!43787 (_ BitVec 32))) (Found!10354 (index!43788 (_ BitVec 32))) (Intermediate!10354 (undefined!11166 Bool) (index!43789 (_ BitVec 32)) (x!125599 (_ BitVec 32))) (Undefined!10354) (MissingVacant!10354 (index!43790 (_ BitVec 32))) )
))
(declare-fun lt!613397 () SeekEntryResult!10354)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95559 (_ BitVec 32)) SeekEntryResult!10354)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1396612 (= lt!613397 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46134 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46134 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95560 (store (arr!46134 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46685 a!2901)) mask!2840))))

(declare-fun b!1396613 () Bool)

(assert (=> b!1396613 (= e!790759 (not e!790760))))

(declare-fun res!935174 () Bool)

(assert (=> b!1396613 (=> res!935174 e!790760)))

(declare-fun lt!613396 () SeekEntryResult!10354)

(assert (=> b!1396613 (= res!935174 (or (not (is-Intermediate!10354 lt!613396)) (undefined!11166 lt!613396)))))

(declare-fun e!790758 () Bool)

(assert (=> b!1396613 e!790758))

(declare-fun res!935175 () Bool)

(assert (=> b!1396613 (=> (not res!935175) (not e!790758))))

(assert (=> b!1396613 (= res!935175 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46739 0))(
  ( (Unit!46740) )
))
(declare-fun lt!613395 () Unit!46739)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95559 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46739)

(assert (=> b!1396613 (= lt!613395 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1396613 (= lt!613396 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46134 a!2901) j!112) mask!2840) (select (arr!46134 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1396614 () Bool)

(declare-fun res!935176 () Bool)

(assert (=> b!1396614 (=> (not res!935176) (not e!790759))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1396614 (= res!935176 (validKeyInArray!0 (select (arr!46134 a!2901) i!1037)))))

(declare-fun b!1396615 () Bool)

(declare-fun res!935173 () Bool)

(assert (=> b!1396615 (=> (not res!935173) (not e!790759))))

(assert (=> b!1396615 (= res!935173 (and (= (size!46685 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46685 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46685 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1396616 () Bool)

(declare-fun res!935169 () Bool)

(assert (=> b!1396616 (=> (not res!935169) (not e!790759))))

(assert (=> b!1396616 (= res!935169 (validKeyInArray!0 (select (arr!46134 a!2901) j!112)))))

(declare-fun b!1396617 () Bool)

(declare-fun res!935172 () Bool)

(assert (=> b!1396617 (=> (not res!935172) (not e!790759))))

(declare-datatypes ((List!32640 0))(
  ( (Nil!32637) (Cons!32636 (h!33880 (_ BitVec 64)) (t!47326 List!32640)) )
))
(declare-fun arrayNoDuplicates!0 (array!95559 (_ BitVec 32) List!32640) Bool)

(assert (=> b!1396617 (= res!935172 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32637))))

(declare-fun b!1396611 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95559 (_ BitVec 32)) SeekEntryResult!10354)

(assert (=> b!1396611 (= e!790758 (= (seekEntryOrOpen!0 (select (arr!46134 a!2901) j!112) a!2901 mask!2840) (Found!10354 j!112)))))

(declare-fun res!935170 () Bool)

(assert (=> start!120006 (=> (not res!935170) (not e!790759))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120006 (= res!935170 (validMask!0 mask!2840))))

(assert (=> start!120006 e!790759))

(assert (=> start!120006 true))

(declare-fun array_inv!35415 (array!95559) Bool)

(assert (=> start!120006 (array_inv!35415 a!2901)))

(assert (= (and start!120006 res!935170) b!1396615))

(assert (= (and b!1396615 res!935173) b!1396614))

(assert (= (and b!1396614 res!935176) b!1396616))

(assert (= (and b!1396616 res!935169) b!1396610))

(assert (= (and b!1396610 res!935171) b!1396617))

(assert (= (and b!1396617 res!935172) b!1396613))

(assert (= (and b!1396613 res!935175) b!1396611))

(assert (= (and b!1396613 (not res!935174)) b!1396612))

(declare-fun m!1283337 () Bool)

(assert (=> b!1396617 m!1283337))

(declare-fun m!1283339 () Bool)

(assert (=> b!1396614 m!1283339))

(assert (=> b!1396614 m!1283339))

(declare-fun m!1283341 () Bool)

(assert (=> b!1396614 m!1283341))

(declare-fun m!1283343 () Bool)

(assert (=> b!1396610 m!1283343))

(declare-fun m!1283345 () Bool)

(assert (=> b!1396613 m!1283345))

(declare-fun m!1283347 () Bool)

(assert (=> b!1396613 m!1283347))

(assert (=> b!1396613 m!1283345))

(declare-fun m!1283349 () Bool)

(assert (=> b!1396613 m!1283349))

(assert (=> b!1396613 m!1283347))

(assert (=> b!1396613 m!1283345))

(declare-fun m!1283351 () Bool)

(assert (=> b!1396613 m!1283351))

(declare-fun m!1283353 () Bool)

(assert (=> b!1396613 m!1283353))

(assert (=> b!1396616 m!1283345))

(assert (=> b!1396616 m!1283345))

(declare-fun m!1283355 () Bool)

(assert (=> b!1396616 m!1283355))

(declare-fun m!1283357 () Bool)

(assert (=> start!120006 m!1283357))

(declare-fun m!1283359 () Bool)

(assert (=> start!120006 m!1283359))

(assert (=> b!1396611 m!1283345))

(assert (=> b!1396611 m!1283345))

(declare-fun m!1283361 () Bool)

(assert (=> b!1396611 m!1283361))

(declare-fun m!1283363 () Bool)

(assert (=> b!1396612 m!1283363))

(declare-fun m!1283365 () Bool)

(assert (=> b!1396612 m!1283365))

(assert (=> b!1396612 m!1283365))

(declare-fun m!1283367 () Bool)

(assert (=> b!1396612 m!1283367))

(assert (=> b!1396612 m!1283367))

(assert (=> b!1396612 m!1283365))

(declare-fun m!1283369 () Bool)

(assert (=> b!1396612 m!1283369))

(push 1)

(assert (not start!120006))

(assert (not b!1396614))

(assert (not b!1396617))

(assert (not b!1396612))

(assert (not b!1396613))

(assert (not b!1396611))

(assert (not b!1396610))

(assert (not b!1396616))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

