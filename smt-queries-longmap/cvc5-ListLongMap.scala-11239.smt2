; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131020 () Bool)

(assert start!131020)

(declare-fun b!1537528 () Bool)

(declare-fun res!1054798 () Bool)

(declare-fun e!855576 () Bool)

(assert (=> b!1537528 (=> (not res!1054798) (not e!855576))))

(declare-datatypes ((array!102116 0))(
  ( (array!102117 (arr!49275 (Array (_ BitVec 32) (_ BitVec 64))) (size!49827 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102116)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1537528 (= res!1054798 (validKeyInArray!0 (select (arr!49275 a!2792) j!64)))))

(declare-fun b!1537529 () Bool)

(declare-fun res!1054800 () Bool)

(assert (=> b!1537529 (=> (not res!1054800) (not e!855576))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1537529 (= res!1054800 (and (= (size!49827 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49827 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49827 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1537530 () Bool)

(declare-fun res!1054803 () Bool)

(assert (=> b!1537530 (=> (not res!1054803) (not e!855576))))

(declare-datatypes ((List!35827 0))(
  ( (Nil!35824) (Cons!35823 (h!37269 (_ BitVec 64)) (t!50513 List!35827)) )
))
(declare-fun arrayNoDuplicates!0 (array!102116 (_ BitVec 32) List!35827) Bool)

(assert (=> b!1537530 (= res!1054803 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35824))))

(declare-fun b!1537531 () Bool)

(declare-fun res!1054804 () Bool)

(assert (=> b!1537531 (=> (not res!1054804) (not e!855576))))

(assert (=> b!1537531 (= res!1054804 (validKeyInArray!0 (select (arr!49275 a!2792) i!951)))))

(declare-fun b!1537532 () Bool)

(declare-fun res!1054799 () Bool)

(assert (=> b!1537532 (=> (not res!1054799) (not e!855576))))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun x!510 () (_ BitVec 32))

(assert (=> b!1537532 (= res!1054799 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49827 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49827 a!2792)) (= (select (arr!49275 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1537533 () Bool)

(declare-fun res!1054802 () Bool)

(assert (=> b!1537533 (=> (not res!1054802) (not e!855576))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102116 (_ BitVec 32)) Bool)

(assert (=> b!1537533 (= res!1054802 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1537534 () Bool)

(assert (=> b!1537534 (= e!855576 false)))

(declare-datatypes ((SeekEntryResult!13426 0))(
  ( (MissingZero!13426 (index!56099 (_ BitVec 32))) (Found!13426 (index!56100 (_ BitVec 32))) (Intermediate!13426 (undefined!14238 Bool) (index!56101 (_ BitVec 32)) (x!137831 (_ BitVec 32))) (Undefined!13426) (MissingVacant!13426 (index!56102 (_ BitVec 32))) )
))
(declare-fun lt!664506 () SeekEntryResult!13426)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102116 (_ BitVec 32)) SeekEntryResult!13426)

(assert (=> b!1537534 (= lt!664506 (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49275 a!2792) j!64) a!2792 mask!2480))))

(declare-fun res!1054801 () Bool)

(assert (=> start!131020 (=> (not res!1054801) (not e!855576))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131020 (= res!1054801 (validMask!0 mask!2480))))

(assert (=> start!131020 e!855576))

(assert (=> start!131020 true))

(declare-fun array_inv!38508 (array!102116) Bool)

(assert (=> start!131020 (array_inv!38508 a!2792)))

(assert (= (and start!131020 res!1054801) b!1537529))

(assert (= (and b!1537529 res!1054800) b!1537531))

(assert (= (and b!1537531 res!1054804) b!1537528))

(assert (= (and b!1537528 res!1054798) b!1537533))

(assert (= (and b!1537533 res!1054802) b!1537530))

(assert (= (and b!1537530 res!1054803) b!1537532))

(assert (= (and b!1537532 res!1054799) b!1537534))

(declare-fun m!1419459 () Bool)

(assert (=> b!1537530 m!1419459))

(declare-fun m!1419461 () Bool)

(assert (=> b!1537531 m!1419461))

(assert (=> b!1537531 m!1419461))

(declare-fun m!1419463 () Bool)

(assert (=> b!1537531 m!1419463))

(declare-fun m!1419465 () Bool)

(assert (=> b!1537532 m!1419465))

(declare-fun m!1419467 () Bool)

(assert (=> start!131020 m!1419467))

(declare-fun m!1419469 () Bool)

(assert (=> start!131020 m!1419469))

(declare-fun m!1419471 () Bool)

(assert (=> b!1537534 m!1419471))

(assert (=> b!1537534 m!1419471))

(declare-fun m!1419473 () Bool)

(assert (=> b!1537534 m!1419473))

(assert (=> b!1537528 m!1419471))

(assert (=> b!1537528 m!1419471))

(declare-fun m!1419475 () Bool)

(assert (=> b!1537528 m!1419475))

(declare-fun m!1419477 () Bool)

(assert (=> b!1537533 m!1419477))

(push 1)

(assert (not b!1537534))

(assert (not b!1537533))

(assert (not b!1537531))

(assert (not b!1537530))

(assert (not start!131020))

(assert (not b!1537528))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

