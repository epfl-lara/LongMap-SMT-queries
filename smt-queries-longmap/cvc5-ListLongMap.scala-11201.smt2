; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130838 () Bool)

(assert start!130838)

(declare-fun b!1534424 () Bool)

(declare-fun res!1051512 () Bool)

(declare-fun e!854494 () Bool)

(assert (=> b!1534424 (=> (not res!1051512) (not e!854494))))

(declare-datatypes ((array!101936 0))(
  ( (array!101937 (arr!49184 (Array (_ BitVec 32) (_ BitVec 64))) (size!49734 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101936)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1534424 (= res!1051512 (and (= (size!49734 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49734 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49734 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1534425 () Bool)

(declare-fun res!1051514 () Bool)

(assert (=> b!1534425 (=> (not res!1051514) (not e!854494))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1534425 (= res!1051514 (validKeyInArray!0 (select (arr!49184 a!2792) j!64)))))

(declare-fun b!1534426 () Bool)

(declare-fun res!1051516 () Bool)

(assert (=> b!1534426 (=> (not res!1051516) (not e!854494))))

(assert (=> b!1534426 (= res!1051516 (validKeyInArray!0 (select (arr!49184 a!2792) i!951)))))

(declare-fun res!1051510 () Bool)

(assert (=> start!130838 (=> (not res!1051510) (not e!854494))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130838 (= res!1051510 (validMask!0 mask!2480))))

(assert (=> start!130838 e!854494))

(assert (=> start!130838 true))

(declare-fun array_inv!38212 (array!101936) Bool)

(assert (=> start!130838 (array_inv!38212 a!2792)))

(declare-fun b!1534427 () Bool)

(assert (=> b!1534427 (= e!854494 false)))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13316 0))(
  ( (MissingZero!13316 (index!55659 (_ BitVec 32))) (Found!13316 (index!55660 (_ BitVec 32))) (Intermediate!13316 (undefined!14128 Bool) (index!55661 (_ BitVec 32)) (x!137422 (_ BitVec 32))) (Undefined!13316) (MissingVacant!13316 (index!55662 (_ BitVec 32))) )
))
(declare-fun lt!663859 () SeekEntryResult!13316)

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101936 (_ BitVec 32)) SeekEntryResult!13316)

(assert (=> b!1534427 (= lt!663859 (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49184 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1534428 () Bool)

(declare-fun res!1051513 () Bool)

(assert (=> b!1534428 (=> (not res!1051513) (not e!854494))))

(assert (=> b!1534428 (= res!1051513 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49734 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49734 a!2792)) (= (select (arr!49184 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1534429 () Bool)

(declare-fun res!1051511 () Bool)

(assert (=> b!1534429 (=> (not res!1051511) (not e!854494))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101936 (_ BitVec 32)) Bool)

(assert (=> b!1534429 (= res!1051511 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1534430 () Bool)

(declare-fun res!1051515 () Bool)

(assert (=> b!1534430 (=> (not res!1051515) (not e!854494))))

(declare-datatypes ((List!35658 0))(
  ( (Nil!35655) (Cons!35654 (h!37099 (_ BitVec 64)) (t!50352 List!35658)) )
))
(declare-fun arrayNoDuplicates!0 (array!101936 (_ BitVec 32) List!35658) Bool)

(assert (=> b!1534430 (= res!1051515 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35655))))

(assert (= (and start!130838 res!1051510) b!1534424))

(assert (= (and b!1534424 res!1051512) b!1534426))

(assert (= (and b!1534426 res!1051516) b!1534425))

(assert (= (and b!1534425 res!1051514) b!1534429))

(assert (= (and b!1534429 res!1051511) b!1534430))

(assert (= (and b!1534430 res!1051515) b!1534428))

(assert (= (and b!1534428 res!1051513) b!1534427))

(declare-fun m!1417077 () Bool)

(assert (=> b!1534430 m!1417077))

(declare-fun m!1417079 () Bool)

(assert (=> b!1534425 m!1417079))

(assert (=> b!1534425 m!1417079))

(declare-fun m!1417081 () Bool)

(assert (=> b!1534425 m!1417081))

(declare-fun m!1417083 () Bool)

(assert (=> b!1534428 m!1417083))

(declare-fun m!1417085 () Bool)

(assert (=> b!1534429 m!1417085))

(assert (=> b!1534427 m!1417079))

(assert (=> b!1534427 m!1417079))

(declare-fun m!1417087 () Bool)

(assert (=> b!1534427 m!1417087))

(declare-fun m!1417089 () Bool)

(assert (=> start!130838 m!1417089))

(declare-fun m!1417091 () Bool)

(assert (=> start!130838 m!1417091))

(declare-fun m!1417093 () Bool)

(assert (=> b!1534426 m!1417093))

(assert (=> b!1534426 m!1417093))

(declare-fun m!1417095 () Bool)

(assert (=> b!1534426 m!1417095))

(push 1)

(assert (not b!1534427))

(assert (not b!1534426))

(assert (not b!1534429))

(assert (not b!1534430))

(assert (not b!1534425))

(assert (not start!130838))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

