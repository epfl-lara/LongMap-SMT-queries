; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130776 () Bool)

(assert start!130776)

(declare-fun b!1533728 () Bool)

(declare-fun res!1050815 () Bool)

(declare-fun e!854308 () Bool)

(assert (=> b!1533728 (=> (not res!1050815) (not e!854308))))

(declare-datatypes ((array!101874 0))(
  ( (array!101875 (arr!49153 (Array (_ BitVec 32) (_ BitVec 64))) (size!49703 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101874)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1533728 (= res!1050815 (and (= (size!49703 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49703 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49703 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1533729 () Bool)

(declare-fun res!1050814 () Bool)

(assert (=> b!1533729 (=> (not res!1050814) (not e!854308))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1533729 (= res!1050814 (validKeyInArray!0 (select (arr!49153 a!2792) j!64)))))

(declare-fun res!1050819 () Bool)

(assert (=> start!130776 (=> (not res!1050819) (not e!854308))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130776 (= res!1050819 (validMask!0 mask!2480))))

(assert (=> start!130776 e!854308))

(assert (=> start!130776 true))

(declare-fun array_inv!38181 (array!101874) Bool)

(assert (=> start!130776 (array_inv!38181 a!2792)))

(declare-fun b!1533730 () Bool)

(declare-fun res!1050817 () Bool)

(assert (=> b!1533730 (=> (not res!1050817) (not e!854308))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101874 (_ BitVec 32)) Bool)

(assert (=> b!1533730 (= res!1050817 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1533731 () Bool)

(declare-fun res!1050818 () Bool)

(assert (=> b!1533731 (=> (not res!1050818) (not e!854308))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1533731 (= res!1050818 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49703 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49703 a!2792)) (= (select (arr!49153 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1533732 () Bool)

(assert (=> b!1533732 (= e!854308 false)))

(declare-datatypes ((SeekEntryResult!13285 0))(
  ( (MissingZero!13285 (index!55535 (_ BitVec 32))) (Found!13285 (index!55536 (_ BitVec 32))) (Intermediate!13285 (undefined!14097 Bool) (index!55537 (_ BitVec 32)) (x!137303 (_ BitVec 32))) (Undefined!13285) (MissingVacant!13285 (index!55538 (_ BitVec 32))) )
))
(declare-fun lt!663811 () SeekEntryResult!13285)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101874 (_ BitVec 32)) SeekEntryResult!13285)

(assert (=> b!1533732 (= lt!663811 (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49153 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1533733 () Bool)

(declare-fun res!1050820 () Bool)

(assert (=> b!1533733 (=> (not res!1050820) (not e!854308))))

(declare-datatypes ((List!35627 0))(
  ( (Nil!35624) (Cons!35623 (h!37068 (_ BitVec 64)) (t!50321 List!35627)) )
))
(declare-fun arrayNoDuplicates!0 (array!101874 (_ BitVec 32) List!35627) Bool)

(assert (=> b!1533733 (= res!1050820 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35624))))

(declare-fun b!1533734 () Bool)

(declare-fun res!1050816 () Bool)

(assert (=> b!1533734 (=> (not res!1050816) (not e!854308))))

(assert (=> b!1533734 (= res!1050816 (validKeyInArray!0 (select (arr!49153 a!2792) i!951)))))

(assert (= (and start!130776 res!1050819) b!1533728))

(assert (= (and b!1533728 res!1050815) b!1533734))

(assert (= (and b!1533734 res!1050816) b!1533729))

(assert (= (and b!1533729 res!1050814) b!1533730))

(assert (= (and b!1533730 res!1050817) b!1533733))

(assert (= (and b!1533733 res!1050820) b!1533731))

(assert (= (and b!1533731 res!1050818) b!1533732))

(declare-fun m!1416427 () Bool)

(assert (=> b!1533733 m!1416427))

(declare-fun m!1416429 () Bool)

(assert (=> b!1533730 m!1416429))

(declare-fun m!1416431 () Bool)

(assert (=> b!1533729 m!1416431))

(assert (=> b!1533729 m!1416431))

(declare-fun m!1416433 () Bool)

(assert (=> b!1533729 m!1416433))

(declare-fun m!1416435 () Bool)

(assert (=> start!130776 m!1416435))

(declare-fun m!1416437 () Bool)

(assert (=> start!130776 m!1416437))

(assert (=> b!1533732 m!1416431))

(assert (=> b!1533732 m!1416431))

(declare-fun m!1416439 () Bool)

(assert (=> b!1533732 m!1416439))

(declare-fun m!1416441 () Bool)

(assert (=> b!1533734 m!1416441))

(assert (=> b!1533734 m!1416441))

(declare-fun m!1416443 () Bool)

(assert (=> b!1533734 m!1416443))

(declare-fun m!1416445 () Bool)

(assert (=> b!1533731 m!1416445))

(push 1)

(assert (not b!1533730))

(assert (not start!130776))

(assert (not b!1533732))

(assert (not b!1533729))

(assert (not b!1533733))

(assert (not b!1533734))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

