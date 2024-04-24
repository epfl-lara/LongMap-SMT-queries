; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131352 () Bool)

(assert start!131352)

(declare-fun b!1538279 () Bool)

(declare-fun res!1053791 () Bool)

(declare-fun e!856428 () Bool)

(assert (=> b!1538279 (=> (not res!1053791) (not e!856428))))

(declare-datatypes ((array!102154 0))(
  ( (array!102155 (arr!49285 (Array (_ BitVec 32) (_ BitVec 64))) (size!49836 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102154)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1538279 (= res!1053791 (validKeyInArray!0 (select (arr!49285 a!2792) j!64)))))

(declare-fun b!1538280 () Bool)

(declare-fun res!1053789 () Bool)

(assert (=> b!1538280 (=> (not res!1053789) (not e!856428))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1538280 (= res!1053789 (validKeyInArray!0 (select (arr!49285 a!2792) i!951)))))

(declare-fun b!1538281 () Bool)

(declare-fun e!856427 () Bool)

(assert (=> b!1538281 (= e!856427 false)))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun lt!665051 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13312 0))(
  ( (MissingZero!13312 (index!55643 (_ BitVec 32))) (Found!13312 (index!55644 (_ BitVec 32))) (Intermediate!13312 (undefined!14124 Bool) (index!55645 (_ BitVec 32)) (x!137596 (_ BitVec 32))) (Undefined!13312) (MissingVacant!13312 (index!55646 (_ BitVec 32))) )
))
(declare-fun lt!665052 () SeekEntryResult!13312)

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102154 (_ BitVec 32)) SeekEntryResult!13312)

(assert (=> b!1538281 (= lt!665052 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!665051 vacantIndex!5 (select (arr!49285 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1538282 () Bool)

(assert (=> b!1538282 (= e!856428 e!856427)))

(declare-fun res!1053797 () Bool)

(assert (=> b!1538282 (=> (not res!1053797) (not e!856427))))

(assert (=> b!1538282 (= res!1053797 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!665051 #b00000000000000000000000000000000) (bvslt lt!665051 (size!49836 a!2792))))))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1538282 (= lt!665051 (nextIndex!0 index!463 (bvadd #b00000000000000000000000000000001 x!510) mask!2480))))

(declare-fun b!1538283 () Bool)

(declare-fun res!1053790 () Bool)

(assert (=> b!1538283 (=> (not res!1053790) (not e!856428))))

(assert (=> b!1538283 (= res!1053790 (and (= (size!49836 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49836 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49836 a!2792)) (not (= i!951 j!64))))))

(declare-fun res!1053796 () Bool)

(assert (=> start!131352 (=> (not res!1053796) (not e!856428))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131352 (= res!1053796 (validMask!0 mask!2480))))

(assert (=> start!131352 e!856428))

(assert (=> start!131352 true))

(declare-fun array_inv!38566 (array!102154) Bool)

(assert (=> start!131352 (array_inv!38566 a!2792)))

(declare-fun b!1538284 () Bool)

(declare-fun res!1053798 () Bool)

(assert (=> b!1538284 (=> (not res!1053798) (not e!856428))))

(assert (=> b!1538284 (= res!1053798 (not (= (select (arr!49285 a!2792) index!463) (select (arr!49285 a!2792) j!64))))))

(declare-fun b!1538285 () Bool)

(declare-fun res!1053795 () Bool)

(assert (=> b!1538285 (=> (not res!1053795) (not e!856428))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102154 (_ BitVec 32)) Bool)

(assert (=> b!1538285 (= res!1053795 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1538286 () Bool)

(declare-fun res!1053792 () Bool)

(assert (=> b!1538286 (=> (not res!1053792) (not e!856428))))

(declare-datatypes ((List!35746 0))(
  ( (Nil!35743) (Cons!35742 (h!37205 (_ BitVec 64)) (t!50432 List!35746)) )
))
(declare-fun arrayNoDuplicates!0 (array!102154 (_ BitVec 32) List!35746) Bool)

(assert (=> b!1538286 (= res!1053792 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35743))))

(declare-fun b!1538287 () Bool)

(declare-fun res!1053794 () Bool)

(assert (=> b!1538287 (=> (not res!1053794) (not e!856428))))

(assert (=> b!1538287 (= res!1053794 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49836 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49836 a!2792)) (= (select (arr!49285 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1538288 () Bool)

(declare-fun res!1053793 () Bool)

(assert (=> b!1538288 (=> (not res!1053793) (not e!856428))))

(assert (=> b!1538288 (= res!1053793 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49285 a!2792) j!64) a!2792 mask!2480) (Found!13312 j!64)))))

(assert (= (and start!131352 res!1053796) b!1538283))

(assert (= (and b!1538283 res!1053790) b!1538280))

(assert (= (and b!1538280 res!1053789) b!1538279))

(assert (= (and b!1538279 res!1053791) b!1538285))

(assert (= (and b!1538285 res!1053795) b!1538286))

(assert (= (and b!1538286 res!1053792) b!1538287))

(assert (= (and b!1538287 res!1053794) b!1538288))

(assert (= (and b!1538288 res!1053793) b!1538284))

(assert (= (and b!1538284 res!1053798) b!1538282))

(assert (= (and b!1538282 res!1053797) b!1538281))

(declare-fun m!1420543 () Bool)

(assert (=> b!1538288 m!1420543))

(assert (=> b!1538288 m!1420543))

(declare-fun m!1420545 () Bool)

(assert (=> b!1538288 m!1420545))

(assert (=> b!1538281 m!1420543))

(assert (=> b!1538281 m!1420543))

(declare-fun m!1420547 () Bool)

(assert (=> b!1538281 m!1420547))

(assert (=> b!1538279 m!1420543))

(assert (=> b!1538279 m!1420543))

(declare-fun m!1420549 () Bool)

(assert (=> b!1538279 m!1420549))

(declare-fun m!1420551 () Bool)

(assert (=> b!1538280 m!1420551))

(assert (=> b!1538280 m!1420551))

(declare-fun m!1420553 () Bool)

(assert (=> b!1538280 m!1420553))

(declare-fun m!1420555 () Bool)

(assert (=> b!1538285 m!1420555))

(declare-fun m!1420557 () Bool)

(assert (=> b!1538287 m!1420557))

(declare-fun m!1420559 () Bool)

(assert (=> b!1538286 m!1420559))

(declare-fun m!1420561 () Bool)

(assert (=> b!1538284 m!1420561))

(assert (=> b!1538284 m!1420543))

(declare-fun m!1420563 () Bool)

(assert (=> start!131352 m!1420563))

(declare-fun m!1420565 () Bool)

(assert (=> start!131352 m!1420565))

(declare-fun m!1420567 () Bool)

(assert (=> b!1538282 m!1420567))

(check-sat (not b!1538285) (not start!131352) (not b!1538280) (not b!1538288) (not b!1538282) (not b!1538279) (not b!1538281) (not b!1538286))
(check-sat)
