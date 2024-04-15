; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131014 () Bool)

(assert start!131014)

(declare-fun b!1537465 () Bool)

(declare-fun e!855559 () Bool)

(assert (=> b!1537465 (= e!855559 false)))

(declare-fun x!510 () (_ BitVec 32))

(declare-datatypes ((array!102110 0))(
  ( (array!102111 (arr!49272 (Array (_ BitVec 32) (_ BitVec 64))) (size!49824 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102110)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13423 0))(
  ( (MissingZero!13423 (index!56087 (_ BitVec 32))) (Found!13423 (index!56088 (_ BitVec 32))) (Intermediate!13423 (undefined!14235 Bool) (index!56089 (_ BitVec 32)) (x!137820 (_ BitVec 32))) (Undefined!13423) (MissingVacant!13423 (index!56090 (_ BitVec 32))) )
))
(declare-fun lt!664497 () SeekEntryResult!13423)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102110 (_ BitVec 32)) SeekEntryResult!13423)

(assert (=> b!1537465 (= lt!664497 (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49272 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1537466 () Bool)

(declare-fun res!1054736 () Bool)

(assert (=> b!1537466 (=> (not res!1054736) (not e!855559))))

(declare-fun i!951 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1537466 (= res!1054736 (validKeyInArray!0 (select (arr!49272 a!2792) i!951)))))

(declare-fun b!1537467 () Bool)

(declare-fun res!1054737 () Bool)

(assert (=> b!1537467 (=> (not res!1054737) (not e!855559))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102110 (_ BitVec 32)) Bool)

(assert (=> b!1537467 (= res!1054737 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1537468 () Bool)

(declare-fun res!1054738 () Bool)

(assert (=> b!1537468 (=> (not res!1054738) (not e!855559))))

(declare-datatypes ((List!35824 0))(
  ( (Nil!35821) (Cons!35820 (h!37266 (_ BitVec 64)) (t!50510 List!35824)) )
))
(declare-fun arrayNoDuplicates!0 (array!102110 (_ BitVec 32) List!35824) Bool)

(assert (=> b!1537468 (= res!1054738 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35821))))

(declare-fun b!1537469 () Bool)

(declare-fun res!1054741 () Bool)

(assert (=> b!1537469 (=> (not res!1054741) (not e!855559))))

(assert (=> b!1537469 (= res!1054741 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49824 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49824 a!2792)) (= (select (arr!49272 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1537470 () Bool)

(declare-fun res!1054739 () Bool)

(assert (=> b!1537470 (=> (not res!1054739) (not e!855559))))

(assert (=> b!1537470 (= res!1054739 (validKeyInArray!0 (select (arr!49272 a!2792) j!64)))))

(declare-fun b!1537471 () Bool)

(declare-fun res!1054735 () Bool)

(assert (=> b!1537471 (=> (not res!1054735) (not e!855559))))

(assert (=> b!1537471 (= res!1054735 (and (= (size!49824 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49824 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49824 a!2792)) (not (= i!951 j!64))))))

(declare-fun res!1054740 () Bool)

(assert (=> start!131014 (=> (not res!1054740) (not e!855559))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131014 (= res!1054740 (validMask!0 mask!2480))))

(assert (=> start!131014 e!855559))

(assert (=> start!131014 true))

(declare-fun array_inv!38505 (array!102110) Bool)

(assert (=> start!131014 (array_inv!38505 a!2792)))

(assert (= (and start!131014 res!1054740) b!1537471))

(assert (= (and b!1537471 res!1054735) b!1537466))

(assert (= (and b!1537466 res!1054736) b!1537470))

(assert (= (and b!1537470 res!1054739) b!1537467))

(assert (= (and b!1537467 res!1054737) b!1537468))

(assert (= (and b!1537468 res!1054738) b!1537469))

(assert (= (and b!1537469 res!1054741) b!1537465))

(declare-fun m!1419399 () Bool)

(assert (=> start!131014 m!1419399))

(declare-fun m!1419401 () Bool)

(assert (=> start!131014 m!1419401))

(declare-fun m!1419403 () Bool)

(assert (=> b!1537466 m!1419403))

(assert (=> b!1537466 m!1419403))

(declare-fun m!1419405 () Bool)

(assert (=> b!1537466 m!1419405))

(declare-fun m!1419407 () Bool)

(assert (=> b!1537467 m!1419407))

(declare-fun m!1419409 () Bool)

(assert (=> b!1537469 m!1419409))

(declare-fun m!1419411 () Bool)

(assert (=> b!1537468 m!1419411))

(declare-fun m!1419413 () Bool)

(assert (=> b!1537470 m!1419413))

(assert (=> b!1537470 m!1419413))

(declare-fun m!1419415 () Bool)

(assert (=> b!1537470 m!1419415))

(assert (=> b!1537465 m!1419413))

(assert (=> b!1537465 m!1419413))

(declare-fun m!1419417 () Bool)

(assert (=> b!1537465 m!1419417))

(push 1)

(assert (not b!1537465))

(assert (not b!1537467))

(assert (not start!131014))

(assert (not b!1537470))

(assert (not b!1537468))

(assert (not b!1537466))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

