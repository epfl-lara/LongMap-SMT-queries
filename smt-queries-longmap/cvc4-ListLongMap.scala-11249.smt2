; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131114 () Bool)

(assert start!131114)

(declare-fun b!1538399 () Bool)

(declare-fun res!1055566 () Bool)

(declare-fun e!855858 () Bool)

(assert (=> b!1538399 (=> (not res!1055566) (not e!855858))))

(declare-fun x!510 () (_ BitVec 32))

(declare-datatypes ((array!102177 0))(
  ( (array!102178 (arr!49304 (Array (_ BitVec 32) (_ BitVec 64))) (size!49856 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102177)

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1538399 (= res!1055566 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49856 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49856 a!2792)) (= (select (arr!49304 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1538400 () Bool)

(declare-fun res!1055568 () Bool)

(assert (=> b!1538400 (=> (not res!1055568) (not e!855858))))

(declare-fun i!951 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1538400 (= res!1055568 (validKeyInArray!0 (select (arr!49304 a!2792) i!951)))))

(declare-fun b!1538401 () Bool)

(declare-fun res!1055563 () Bool)

(assert (=> b!1538401 (=> (not res!1055563) (not e!855858))))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(assert (=> b!1538401 (= res!1055563 (and (= (size!49856 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49856 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49856 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1538402 () Bool)

(declare-fun res!1055562 () Bool)

(assert (=> b!1538402 (=> (not res!1055562) (not e!855858))))

(declare-datatypes ((SeekEntryResult!13455 0))(
  ( (MissingZero!13455 (index!56215 (_ BitVec 32))) (Found!13455 (index!56216 (_ BitVec 32))) (Intermediate!13455 (undefined!14267 Bool) (index!56217 (_ BitVec 32)) (x!137943 (_ BitVec 32))) (Undefined!13455) (MissingVacant!13455 (index!56218 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102177 (_ BitVec 32)) SeekEntryResult!13455)

(assert (=> b!1538402 (= res!1055562 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49304 a!2792) j!64) a!2792 mask!2480) (Found!13455 j!64)))))

(declare-fun res!1055564 () Bool)

(assert (=> start!131114 (=> (not res!1055564) (not e!855858))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131114 (= res!1055564 (validMask!0 mask!2480))))

(assert (=> start!131114 e!855858))

(assert (=> start!131114 true))

(declare-fun array_inv!38537 (array!102177) Bool)

(assert (=> start!131114 (array_inv!38537 a!2792)))

(declare-fun b!1538403 () Bool)

(declare-fun res!1055565 () Bool)

(assert (=> b!1538403 (=> (not res!1055565) (not e!855858))))

(assert (=> b!1538403 (= res!1055565 (not (= (select (arr!49304 a!2792) index!463) (select (arr!49304 a!2792) j!64))))))

(declare-fun b!1538404 () Bool)

(declare-fun res!1055569 () Bool)

(assert (=> b!1538404 (=> (not res!1055569) (not e!855858))))

(declare-datatypes ((List!35856 0))(
  ( (Nil!35853) (Cons!35852 (h!37298 (_ BitVec 64)) (t!50542 List!35856)) )
))
(declare-fun arrayNoDuplicates!0 (array!102177 (_ BitVec 32) List!35856) Bool)

(assert (=> b!1538404 (= res!1055569 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35853))))

(declare-fun b!1538405 () Bool)

(declare-fun res!1055567 () Bool)

(assert (=> b!1538405 (=> (not res!1055567) (not e!855858))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102177 (_ BitVec 32)) Bool)

(assert (=> b!1538405 (= res!1055567 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1538406 () Bool)

(assert (=> b!1538406 (= e!855858 false)))

(declare-fun lt!664644 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1538406 (= lt!664644 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1538407 () Bool)

(declare-fun res!1055561 () Bool)

(assert (=> b!1538407 (=> (not res!1055561) (not e!855858))))

(assert (=> b!1538407 (= res!1055561 (validKeyInArray!0 (select (arr!49304 a!2792) j!64)))))

(assert (= (and start!131114 res!1055564) b!1538401))

(assert (= (and b!1538401 res!1055563) b!1538400))

(assert (= (and b!1538400 res!1055568) b!1538407))

(assert (= (and b!1538407 res!1055561) b!1538405))

(assert (= (and b!1538405 res!1055567) b!1538404))

(assert (= (and b!1538404 res!1055569) b!1538399))

(assert (= (and b!1538399 res!1055566) b!1538402))

(assert (= (and b!1538402 res!1055562) b!1538403))

(assert (= (and b!1538403 res!1055565) b!1538406))

(declare-fun m!1420223 () Bool)

(assert (=> start!131114 m!1420223))

(declare-fun m!1420225 () Bool)

(assert (=> start!131114 m!1420225))

(declare-fun m!1420227 () Bool)

(assert (=> b!1538407 m!1420227))

(assert (=> b!1538407 m!1420227))

(declare-fun m!1420229 () Bool)

(assert (=> b!1538407 m!1420229))

(declare-fun m!1420231 () Bool)

(assert (=> b!1538406 m!1420231))

(declare-fun m!1420233 () Bool)

(assert (=> b!1538404 m!1420233))

(declare-fun m!1420235 () Bool)

(assert (=> b!1538399 m!1420235))

(declare-fun m!1420237 () Bool)

(assert (=> b!1538403 m!1420237))

(assert (=> b!1538403 m!1420227))

(assert (=> b!1538402 m!1420227))

(assert (=> b!1538402 m!1420227))

(declare-fun m!1420239 () Bool)

(assert (=> b!1538402 m!1420239))

(declare-fun m!1420241 () Bool)

(assert (=> b!1538400 m!1420241))

(assert (=> b!1538400 m!1420241))

(declare-fun m!1420243 () Bool)

(assert (=> b!1538400 m!1420243))

(declare-fun m!1420245 () Bool)

(assert (=> b!1538405 m!1420245))

(push 1)

(assert (not b!1538400))

(assert (not b!1538407))

(assert (not b!1538402))

(assert (not start!131114))

(assert (not b!1538404))

(assert (not b!1538405))

(assert (not b!1538406))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

