; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131146 () Bool)

(assert start!131146)

(declare-fun b!1538831 () Bool)

(declare-fun res!1056001 () Bool)

(declare-fun e!855954 () Bool)

(assert (=> b!1538831 (=> (not res!1056001) (not e!855954))))

(declare-fun x!510 () (_ BitVec 32))

(declare-datatypes ((array!102209 0))(
  ( (array!102210 (arr!49320 (Array (_ BitVec 32) (_ BitVec 64))) (size!49872 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102209)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13471 0))(
  ( (MissingZero!13471 (index!56279 (_ BitVec 32))) (Found!13471 (index!56280 (_ BitVec 32))) (Intermediate!13471 (undefined!14283 Bool) (index!56281 (_ BitVec 32)) (x!137999 (_ BitVec 32))) (Undefined!13471) (MissingVacant!13471 (index!56282 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102209 (_ BitVec 32)) SeekEntryResult!13471)

(assert (=> b!1538831 (= res!1056001 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49320 a!2792) j!64) a!2792 mask!2480) (Found!13471 j!64)))))

(declare-fun b!1538832 () Bool)

(declare-fun res!1055998 () Bool)

(assert (=> b!1538832 (=> (not res!1055998) (not e!855954))))

(assert (=> b!1538832 (= res!1055998 (not (= (select (arr!49320 a!2792) index!463) (select (arr!49320 a!2792) j!64))))))

(declare-fun b!1538833 () Bool)

(declare-fun res!1056000 () Bool)

(assert (=> b!1538833 (=> (not res!1056000) (not e!855954))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1538833 (= res!1056000 (validKeyInArray!0 (select (arr!49320 a!2792) j!64)))))

(declare-fun b!1538834 () Bool)

(declare-fun res!1055994 () Bool)

(assert (=> b!1538834 (=> (not res!1055994) (not e!855954))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102209 (_ BitVec 32)) Bool)

(assert (=> b!1538834 (= res!1055994 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1538835 () Bool)

(declare-fun res!1055995 () Bool)

(assert (=> b!1538835 (=> (not res!1055995) (not e!855954))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1538835 (= res!1055995 (validKeyInArray!0 (select (arr!49320 a!2792) i!951)))))

(declare-fun b!1538836 () Bool)

(declare-fun res!1055993 () Bool)

(assert (=> b!1538836 (=> (not res!1055993) (not e!855954))))

(declare-datatypes ((List!35872 0))(
  ( (Nil!35869) (Cons!35868 (h!37314 (_ BitVec 64)) (t!50558 List!35872)) )
))
(declare-fun arrayNoDuplicates!0 (array!102209 (_ BitVec 32) List!35872) Bool)

(assert (=> b!1538836 (= res!1055993 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35869))))

(declare-fun b!1538837 () Bool)

(declare-fun res!1055999 () Bool)

(assert (=> b!1538837 (=> (not res!1055999) (not e!855954))))

(assert (=> b!1538837 (= res!1055999 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49872 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49872 a!2792)) (= (select (arr!49320 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!1055997 () Bool)

(assert (=> start!131146 (=> (not res!1055997) (not e!855954))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131146 (= res!1055997 (validMask!0 mask!2480))))

(assert (=> start!131146 e!855954))

(assert (=> start!131146 true))

(declare-fun array_inv!38553 (array!102209) Bool)

(assert (=> start!131146 (array_inv!38553 a!2792)))

(declare-fun b!1538838 () Bool)

(declare-fun res!1055996 () Bool)

(assert (=> b!1538838 (=> (not res!1055996) (not e!855954))))

(assert (=> b!1538838 (= res!1055996 (and (= (size!49872 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49872 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49872 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1538839 () Bool)

(assert (=> b!1538839 (= e!855954 false)))

(declare-fun lt!664692 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1538839 (= lt!664692 (nextIndex!0 index!463 x!510 mask!2480))))

(assert (= (and start!131146 res!1055997) b!1538838))

(assert (= (and b!1538838 res!1055996) b!1538835))

(assert (= (and b!1538835 res!1055995) b!1538833))

(assert (= (and b!1538833 res!1056000) b!1538834))

(assert (= (and b!1538834 res!1055994) b!1538836))

(assert (= (and b!1538836 res!1055993) b!1538837))

(assert (= (and b!1538837 res!1055999) b!1538831))

(assert (= (and b!1538831 res!1056001) b!1538832))

(assert (= (and b!1538832 res!1055998) b!1538839))

(declare-fun m!1420607 () Bool)

(assert (=> b!1538839 m!1420607))

(declare-fun m!1420609 () Bool)

(assert (=> start!131146 m!1420609))

(declare-fun m!1420611 () Bool)

(assert (=> start!131146 m!1420611))

(declare-fun m!1420613 () Bool)

(assert (=> b!1538835 m!1420613))

(assert (=> b!1538835 m!1420613))

(declare-fun m!1420615 () Bool)

(assert (=> b!1538835 m!1420615))

(declare-fun m!1420617 () Bool)

(assert (=> b!1538832 m!1420617))

(declare-fun m!1420619 () Bool)

(assert (=> b!1538832 m!1420619))

(declare-fun m!1420621 () Bool)

(assert (=> b!1538836 m!1420621))

(declare-fun m!1420623 () Bool)

(assert (=> b!1538834 m!1420623))

(declare-fun m!1420625 () Bool)

(assert (=> b!1538837 m!1420625))

(assert (=> b!1538833 m!1420619))

(assert (=> b!1538833 m!1420619))

(declare-fun m!1420627 () Bool)

(assert (=> b!1538833 m!1420627))

(assert (=> b!1538831 m!1420619))

(assert (=> b!1538831 m!1420619))

(declare-fun m!1420629 () Bool)

(assert (=> b!1538831 m!1420629))

(push 1)

(assert (not b!1538833))

(assert (not b!1538835))

(assert (not b!1538839))

(assert (not b!1538831))

(assert (not b!1538834))

(assert (not start!131146))

(assert (not b!1538836))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

