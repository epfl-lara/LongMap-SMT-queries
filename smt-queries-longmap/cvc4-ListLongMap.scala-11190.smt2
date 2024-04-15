; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130724 () Bool)

(assert start!130724)

(declare-fun b!1533394 () Bool)

(declare-fun res!1050668 () Bool)

(declare-fun e!854103 () Bool)

(assert (=> b!1533394 (=> (not res!1050668) (not e!854103))))

(declare-datatypes ((array!101820 0))(
  ( (array!101821 (arr!49127 (Array (_ BitVec 32) (_ BitVec 64))) (size!49679 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101820)

(declare-fun i!951 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1533394 (= res!1050668 (validKeyInArray!0 (select (arr!49127 a!2792) i!951)))))

(declare-fun res!1050664 () Bool)

(assert (=> start!130724 (=> (not res!1050664) (not e!854103))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130724 (= res!1050664 (validMask!0 mask!2480))))

(assert (=> start!130724 e!854103))

(assert (=> start!130724 true))

(declare-fun array_inv!38360 (array!101820) Bool)

(assert (=> start!130724 (array_inv!38360 a!2792)))

(declare-fun b!1533395 () Bool)

(declare-fun res!1050667 () Bool)

(assert (=> b!1533395 (=> (not res!1050667) (not e!854103))))

(declare-fun j!64 () (_ BitVec 32))

(assert (=> b!1533395 (= res!1050667 (validKeyInArray!0 (select (arr!49127 a!2792) j!64)))))

(declare-fun b!1533396 () Bool)

(declare-fun res!1050669 () Bool)

(assert (=> b!1533396 (=> (not res!1050669) (not e!854103))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1533396 (= res!1050669 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49679 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49679 a!2792)) (= (select (arr!49127 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1533397 () Bool)

(declare-fun res!1050665 () Bool)

(assert (=> b!1533397 (=> (not res!1050665) (not e!854103))))

(assert (=> b!1533397 (= res!1050665 (and (= (size!49679 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49679 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49679 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1533398 () Bool)

(declare-fun res!1050670 () Bool)

(assert (=> b!1533398 (=> (not res!1050670) (not e!854103))))

(declare-datatypes ((List!35679 0))(
  ( (Nil!35676) (Cons!35675 (h!37121 (_ BitVec 64)) (t!50365 List!35679)) )
))
(declare-fun arrayNoDuplicates!0 (array!101820 (_ BitVec 32) List!35679) Bool)

(assert (=> b!1533398 (= res!1050670 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35676))))

(declare-fun b!1533399 () Bool)

(assert (=> b!1533399 (= e!854103 false)))

(declare-datatypes ((SeekEntryResult!13284 0))(
  ( (MissingZero!13284 (index!55531 (_ BitVec 32))) (Found!13284 (index!55532 (_ BitVec 32))) (Intermediate!13284 (undefined!14096 Bool) (index!55533 (_ BitVec 32)) (x!137297 (_ BitVec 32))) (Undefined!13284) (MissingVacant!13284 (index!55534 (_ BitVec 32))) )
))
(declare-fun lt!663522 () SeekEntryResult!13284)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101820 (_ BitVec 32)) SeekEntryResult!13284)

(assert (=> b!1533399 (= lt!663522 (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49127 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1533400 () Bool)

(declare-fun res!1050666 () Bool)

(assert (=> b!1533400 (=> (not res!1050666) (not e!854103))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101820 (_ BitVec 32)) Bool)

(assert (=> b!1533400 (= res!1050666 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(assert (= (and start!130724 res!1050664) b!1533397))

(assert (= (and b!1533397 res!1050665) b!1533394))

(assert (= (and b!1533394 res!1050668) b!1533395))

(assert (= (and b!1533395 res!1050667) b!1533400))

(assert (= (and b!1533400 res!1050666) b!1533398))

(assert (= (and b!1533398 res!1050670) b!1533396))

(assert (= (and b!1533396 res!1050669) b!1533399))

(declare-fun m!1415515 () Bool)

(assert (=> b!1533399 m!1415515))

(assert (=> b!1533399 m!1415515))

(declare-fun m!1415517 () Bool)

(assert (=> b!1533399 m!1415517))

(declare-fun m!1415519 () Bool)

(assert (=> b!1533398 m!1415519))

(declare-fun m!1415521 () Bool)

(assert (=> b!1533400 m!1415521))

(declare-fun m!1415523 () Bool)

(assert (=> start!130724 m!1415523))

(declare-fun m!1415525 () Bool)

(assert (=> start!130724 m!1415525))

(declare-fun m!1415527 () Bool)

(assert (=> b!1533396 m!1415527))

(declare-fun m!1415529 () Bool)

(assert (=> b!1533394 m!1415529))

(assert (=> b!1533394 m!1415529))

(declare-fun m!1415531 () Bool)

(assert (=> b!1533394 m!1415531))

(assert (=> b!1533395 m!1415515))

(assert (=> b!1533395 m!1415515))

(declare-fun m!1415533 () Bool)

(assert (=> b!1533395 m!1415533))

(push 1)

(assert (not b!1533395))

(assert (not b!1533399))

(assert (not start!130724))

(assert (not b!1533400))

(assert (not b!1533394))

(assert (not b!1533398))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

