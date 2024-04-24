; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131160 () Bool)

(assert start!131160)

(declare-fun b!1536043 () Bool)

(declare-fun res!1051646 () Bool)

(declare-fun e!855733 () Bool)

(assert (=> b!1536043 (=> (not res!1051646) (not e!855733))))

(declare-datatypes ((array!101995 0))(
  ( (array!101996 (arr!49207 (Array (_ BitVec 32) (_ BitVec 64))) (size!49758 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101995)

(declare-fun i!951 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1536043 (= res!1051646 (validKeyInArray!0 (select (arr!49207 a!2792) i!951)))))

(declare-fun b!1536044 () Bool)

(declare-fun res!1051643 () Bool)

(assert (=> b!1536044 (=> (not res!1051643) (not e!855733))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101995 (_ BitVec 32)) Bool)

(assert (=> b!1536044 (= res!1051643 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1536045 () Bool)

(declare-fun res!1051648 () Bool)

(assert (=> b!1536045 (=> (not res!1051648) (not e!855733))))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun x!510 () (_ BitVec 32))

(assert (=> b!1536045 (= res!1051648 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49758 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49758 a!2792)) (= (select (arr!49207 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!1051647 () Bool)

(assert (=> start!131160 (=> (not res!1051647) (not e!855733))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131160 (= res!1051647 (validMask!0 mask!2480))))

(assert (=> start!131160 e!855733))

(assert (=> start!131160 true))

(declare-fun array_inv!38488 (array!101995) Bool)

(assert (=> start!131160 (array_inv!38488 a!2792)))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun b!1536046 () Bool)

(assert (=> b!1536046 (= e!855733 (and (= (select (arr!49207 a!2792) index!463) (select (arr!49207 a!2792) j!64)) (bvslt mask!2480 #b00000000000000000000000000000000)))))

(declare-fun b!1536047 () Bool)

(declare-fun res!1051650 () Bool)

(assert (=> b!1536047 (=> (not res!1051650) (not e!855733))))

(declare-datatypes ((SeekEntryResult!13234 0))(
  ( (MissingZero!13234 (index!55331 (_ BitVec 32))) (Found!13234 (index!55332 (_ BitVec 32))) (Intermediate!13234 (undefined!14046 Bool) (index!55333 (_ BitVec 32)) (x!137307 (_ BitVec 32))) (Undefined!13234) (MissingVacant!13234 (index!55334 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101995 (_ BitVec 32)) SeekEntryResult!13234)

(assert (=> b!1536047 (= res!1051650 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49207 a!2792) j!64) a!2792 mask!2480) (Found!13234 j!64)))))

(declare-fun b!1536048 () Bool)

(declare-fun res!1051645 () Bool)

(assert (=> b!1536048 (=> (not res!1051645) (not e!855733))))

(assert (=> b!1536048 (= res!1051645 (validKeyInArray!0 (select (arr!49207 a!2792) j!64)))))

(declare-fun b!1536049 () Bool)

(declare-fun res!1051649 () Bool)

(assert (=> b!1536049 (=> (not res!1051649) (not e!855733))))

(declare-datatypes ((List!35668 0))(
  ( (Nil!35665) (Cons!35664 (h!37127 (_ BitVec 64)) (t!50354 List!35668)) )
))
(declare-fun arrayNoDuplicates!0 (array!101995 (_ BitVec 32) List!35668) Bool)

(assert (=> b!1536049 (= res!1051649 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35665))))

(declare-fun b!1536050 () Bool)

(declare-fun res!1051644 () Bool)

(assert (=> b!1536050 (=> (not res!1051644) (not e!855733))))

(assert (=> b!1536050 (= res!1051644 (and (= (size!49758 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49758 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49758 a!2792)) (not (= i!951 j!64))))))

(assert (= (and start!131160 res!1051647) b!1536050))

(assert (= (and b!1536050 res!1051644) b!1536043))

(assert (= (and b!1536043 res!1051646) b!1536048))

(assert (= (and b!1536048 res!1051645) b!1536044))

(assert (= (and b!1536044 res!1051643) b!1536049))

(assert (= (and b!1536049 res!1051649) b!1536045))

(assert (= (and b!1536045 res!1051648) b!1536047))

(assert (= (and b!1536047 res!1051650) b!1536046))

(declare-fun m!1418605 () Bool)

(assert (=> b!1536048 m!1418605))

(assert (=> b!1536048 m!1418605))

(declare-fun m!1418607 () Bool)

(assert (=> b!1536048 m!1418607))

(declare-fun m!1418609 () Bool)

(assert (=> b!1536049 m!1418609))

(assert (=> b!1536047 m!1418605))

(assert (=> b!1536047 m!1418605))

(declare-fun m!1418611 () Bool)

(assert (=> b!1536047 m!1418611))

(declare-fun m!1418613 () Bool)

(assert (=> b!1536045 m!1418613))

(declare-fun m!1418615 () Bool)

(assert (=> start!131160 m!1418615))

(declare-fun m!1418617 () Bool)

(assert (=> start!131160 m!1418617))

(declare-fun m!1418619 () Bool)

(assert (=> b!1536044 m!1418619))

(declare-fun m!1418621 () Bool)

(assert (=> b!1536046 m!1418621))

(assert (=> b!1536046 m!1418605))

(declare-fun m!1418623 () Bool)

(assert (=> b!1536043 m!1418623))

(assert (=> b!1536043 m!1418623))

(declare-fun m!1418625 () Bool)

(assert (=> b!1536043 m!1418625))

(check-sat (not start!131160) (not b!1536047) (not b!1536048) (not b!1536049) (not b!1536043) (not b!1536044))
(check-sat)
