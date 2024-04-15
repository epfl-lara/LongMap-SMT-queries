; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131128 () Bool)

(assert start!131128)

(declare-fun b!1538588 () Bool)

(declare-fun res!1055752 () Bool)

(declare-fun e!855901 () Bool)

(assert (=> b!1538588 (=> (not res!1055752) (not e!855901))))

(declare-datatypes ((array!102191 0))(
  ( (array!102192 (arr!49311 (Array (_ BitVec 32) (_ BitVec 64))) (size!49863 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102191)

(declare-fun i!951 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1538588 (= res!1055752 (validKeyInArray!0 (select (arr!49311 a!2792) i!951)))))

(declare-fun b!1538589 () Bool)

(declare-fun res!1055754 () Bool)

(assert (=> b!1538589 (=> (not res!1055754) (not e!855901))))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(assert (=> b!1538589 (= res!1055754 (and (= (size!49863 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49863 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49863 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1538590 () Bool)

(declare-fun res!1055756 () Bool)

(assert (=> b!1538590 (=> (not res!1055756) (not e!855901))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13462 0))(
  ( (MissingZero!13462 (index!56243 (_ BitVec 32))) (Found!13462 (index!56244 (_ BitVec 32))) (Intermediate!13462 (undefined!14274 Bool) (index!56245 (_ BitVec 32)) (x!137966 (_ BitVec 32))) (Undefined!13462) (MissingVacant!13462 (index!56246 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102191 (_ BitVec 32)) SeekEntryResult!13462)

(assert (=> b!1538590 (= res!1055756 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49311 a!2792) j!64) a!2792 mask!2480) (Found!13462 j!64)))))

(declare-fun b!1538591 () Bool)

(declare-fun res!1055757 () Bool)

(assert (=> b!1538591 (=> (not res!1055757) (not e!855901))))

(assert (=> b!1538591 (= res!1055757 (not (= (select (arr!49311 a!2792) index!463) (select (arr!49311 a!2792) j!64))))))

(declare-fun b!1538592 () Bool)

(declare-fun res!1055755 () Bool)

(assert (=> b!1538592 (=> (not res!1055755) (not e!855901))))

(assert (=> b!1538592 (= res!1055755 (validKeyInArray!0 (select (arr!49311 a!2792) j!64)))))

(declare-fun res!1055753 () Bool)

(assert (=> start!131128 (=> (not res!1055753) (not e!855901))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131128 (= res!1055753 (validMask!0 mask!2480))))

(assert (=> start!131128 e!855901))

(assert (=> start!131128 true))

(declare-fun array_inv!38544 (array!102191) Bool)

(assert (=> start!131128 (array_inv!38544 a!2792)))

(declare-fun b!1538593 () Bool)

(declare-fun res!1055750 () Bool)

(assert (=> b!1538593 (=> (not res!1055750) (not e!855901))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102191 (_ BitVec 32)) Bool)

(assert (=> b!1538593 (= res!1055750 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1538594 () Bool)

(declare-fun res!1055751 () Bool)

(assert (=> b!1538594 (=> (not res!1055751) (not e!855901))))

(declare-datatypes ((List!35863 0))(
  ( (Nil!35860) (Cons!35859 (h!37305 (_ BitVec 64)) (t!50549 List!35863)) )
))
(declare-fun arrayNoDuplicates!0 (array!102191 (_ BitVec 32) List!35863) Bool)

(assert (=> b!1538594 (= res!1055751 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35860))))

(declare-fun b!1538595 () Bool)

(assert (=> b!1538595 (= e!855901 false)))

(declare-fun lt!664665 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1538595 (= lt!664665 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1538596 () Bool)

(declare-fun res!1055758 () Bool)

(assert (=> b!1538596 (=> (not res!1055758) (not e!855901))))

(assert (=> b!1538596 (= res!1055758 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49863 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49863 a!2792)) (= (select (arr!49311 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!131128 res!1055753) b!1538589))

(assert (= (and b!1538589 res!1055754) b!1538588))

(assert (= (and b!1538588 res!1055752) b!1538592))

(assert (= (and b!1538592 res!1055755) b!1538593))

(assert (= (and b!1538593 res!1055750) b!1538594))

(assert (= (and b!1538594 res!1055751) b!1538596))

(assert (= (and b!1538596 res!1055758) b!1538590))

(assert (= (and b!1538590 res!1055756) b!1538591))

(assert (= (and b!1538591 res!1055757) b!1538595))

(declare-fun m!1420391 () Bool)

(assert (=> b!1538594 m!1420391))

(declare-fun m!1420393 () Bool)

(assert (=> b!1538593 m!1420393))

(declare-fun m!1420395 () Bool)

(assert (=> b!1538595 m!1420395))

(declare-fun m!1420397 () Bool)

(assert (=> b!1538588 m!1420397))

(assert (=> b!1538588 m!1420397))

(declare-fun m!1420399 () Bool)

(assert (=> b!1538588 m!1420399))

(declare-fun m!1420401 () Bool)

(assert (=> start!131128 m!1420401))

(declare-fun m!1420403 () Bool)

(assert (=> start!131128 m!1420403))

(declare-fun m!1420405 () Bool)

(assert (=> b!1538592 m!1420405))

(assert (=> b!1538592 m!1420405))

(declare-fun m!1420407 () Bool)

(assert (=> b!1538592 m!1420407))

(assert (=> b!1538590 m!1420405))

(assert (=> b!1538590 m!1420405))

(declare-fun m!1420409 () Bool)

(assert (=> b!1538590 m!1420409))

(declare-fun m!1420411 () Bool)

(assert (=> b!1538596 m!1420411))

(declare-fun m!1420413 () Bool)

(assert (=> b!1538591 m!1420413))

(assert (=> b!1538591 m!1420405))

(push 1)

(assert (not b!1538593))

(assert (not start!131128))

(assert (not b!1538592))

(assert (not b!1538590))

(assert (not b!1538594))

(assert (not b!1538595))

(assert (not b!1538588))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

