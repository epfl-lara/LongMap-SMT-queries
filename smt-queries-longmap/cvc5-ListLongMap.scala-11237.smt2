; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131008 () Bool)

(assert start!131008)

(declare-fun b!1537402 () Bool)

(declare-fun res!1054674 () Bool)

(declare-fun e!855541 () Bool)

(assert (=> b!1537402 (=> (not res!1054674) (not e!855541))))

(declare-fun x!510 () (_ BitVec 32))

(declare-datatypes ((array!102104 0))(
  ( (array!102105 (arr!49269 (Array (_ BitVec 32) (_ BitVec 64))) (size!49821 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102104)

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1537402 (= res!1054674 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49821 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49821 a!2792)) (= (select (arr!49269 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1537403 () Bool)

(declare-fun res!1054676 () Bool)

(assert (=> b!1537403 (=> (not res!1054676) (not e!855541))))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1537403 (= res!1054676 (and (= (size!49821 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49821 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49821 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1537404 () Bool)

(declare-fun res!1054675 () Bool)

(assert (=> b!1537404 (=> (not res!1054675) (not e!855541))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102104 (_ BitVec 32)) Bool)

(assert (=> b!1537404 (= res!1054675 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun res!1054678 () Bool)

(assert (=> start!131008 (=> (not res!1054678) (not e!855541))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131008 (= res!1054678 (validMask!0 mask!2480))))

(assert (=> start!131008 e!855541))

(assert (=> start!131008 true))

(declare-fun array_inv!38502 (array!102104) Bool)

(assert (=> start!131008 (array_inv!38502 a!2792)))

(declare-fun b!1537405 () Bool)

(declare-fun res!1054672 () Bool)

(assert (=> b!1537405 (=> (not res!1054672) (not e!855541))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1537405 (= res!1054672 (validKeyInArray!0 (select (arr!49269 a!2792) i!951)))))

(declare-fun b!1537406 () Bool)

(declare-fun res!1054677 () Bool)

(assert (=> b!1537406 (=> (not res!1054677) (not e!855541))))

(declare-datatypes ((List!35821 0))(
  ( (Nil!35818) (Cons!35817 (h!37263 (_ BitVec 64)) (t!50507 List!35821)) )
))
(declare-fun arrayNoDuplicates!0 (array!102104 (_ BitVec 32) List!35821) Bool)

(assert (=> b!1537406 (= res!1054677 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35818))))

(declare-fun b!1537407 () Bool)

(assert (=> b!1537407 (= e!855541 false)))

(declare-datatypes ((SeekEntryResult!13420 0))(
  ( (MissingZero!13420 (index!56075 (_ BitVec 32))) (Found!13420 (index!56076 (_ BitVec 32))) (Intermediate!13420 (undefined!14232 Bool) (index!56077 (_ BitVec 32)) (x!137809 (_ BitVec 32))) (Undefined!13420) (MissingVacant!13420 (index!56078 (_ BitVec 32))) )
))
(declare-fun lt!664488 () SeekEntryResult!13420)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102104 (_ BitVec 32)) SeekEntryResult!13420)

(assert (=> b!1537407 (= lt!664488 (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49269 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1537408 () Bool)

(declare-fun res!1054673 () Bool)

(assert (=> b!1537408 (=> (not res!1054673) (not e!855541))))

(assert (=> b!1537408 (= res!1054673 (validKeyInArray!0 (select (arr!49269 a!2792) j!64)))))

(assert (= (and start!131008 res!1054678) b!1537403))

(assert (= (and b!1537403 res!1054676) b!1537405))

(assert (= (and b!1537405 res!1054672) b!1537408))

(assert (= (and b!1537408 res!1054673) b!1537404))

(assert (= (and b!1537404 res!1054675) b!1537406))

(assert (= (and b!1537406 res!1054677) b!1537402))

(assert (= (and b!1537402 res!1054674) b!1537407))

(declare-fun m!1419339 () Bool)

(assert (=> start!131008 m!1419339))

(declare-fun m!1419341 () Bool)

(assert (=> start!131008 m!1419341))

(declare-fun m!1419343 () Bool)

(assert (=> b!1537404 m!1419343))

(declare-fun m!1419345 () Bool)

(assert (=> b!1537406 m!1419345))

(declare-fun m!1419347 () Bool)

(assert (=> b!1537402 m!1419347))

(declare-fun m!1419349 () Bool)

(assert (=> b!1537407 m!1419349))

(assert (=> b!1537407 m!1419349))

(declare-fun m!1419351 () Bool)

(assert (=> b!1537407 m!1419351))

(declare-fun m!1419353 () Bool)

(assert (=> b!1537405 m!1419353))

(assert (=> b!1537405 m!1419353))

(declare-fun m!1419355 () Bool)

(assert (=> b!1537405 m!1419355))

(assert (=> b!1537408 m!1419349))

(assert (=> b!1537408 m!1419349))

(declare-fun m!1419357 () Bool)

(assert (=> b!1537408 m!1419357))

(push 1)

(assert (not b!1537406))

(assert (not start!131008))

(assert (not b!1537407))

(assert (not b!1537408))

(assert (not b!1537405))

(assert (not b!1537404))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

