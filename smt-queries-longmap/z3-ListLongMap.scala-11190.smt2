; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130774 () Bool)

(assert start!130774)

(declare-fun b!1533707 () Bool)

(declare-fun res!1050794 () Bool)

(declare-fun e!854301 () Bool)

(assert (=> b!1533707 (=> (not res!1050794) (not e!854301))))

(declare-datatypes ((array!101872 0))(
  ( (array!101873 (arr!49152 (Array (_ BitVec 32) (_ BitVec 64))) (size!49702 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101872)

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101872 (_ BitVec 32)) Bool)

(assert (=> b!1533707 (= res!1050794 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1533708 () Bool)

(declare-fun res!1050796 () Bool)

(assert (=> b!1533708 (=> (not res!1050796) (not e!854301))))

(declare-fun i!951 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1533708 (= res!1050796 (validKeyInArray!0 (select (arr!49152 a!2792) i!951)))))

(declare-fun res!1050799 () Bool)

(assert (=> start!130774 (=> (not res!1050799) (not e!854301))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130774 (= res!1050799 (validMask!0 mask!2480))))

(assert (=> start!130774 e!854301))

(assert (=> start!130774 true))

(declare-fun array_inv!38180 (array!101872) Bool)

(assert (=> start!130774 (array_inv!38180 a!2792)))

(declare-fun b!1533709 () Bool)

(declare-fun res!1050798 () Bool)

(assert (=> b!1533709 (=> (not res!1050798) (not e!854301))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1533709 (= res!1050798 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49702 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49702 a!2792)) (= (select (arr!49152 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1533710 () Bool)

(declare-fun res!1050793 () Bool)

(assert (=> b!1533710 (=> (not res!1050793) (not e!854301))))

(declare-fun j!64 () (_ BitVec 32))

(assert (=> b!1533710 (= res!1050793 (and (= (size!49702 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49702 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49702 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1533711 () Bool)

(assert (=> b!1533711 (= e!854301 false)))

(declare-datatypes ((SeekEntryResult!13284 0))(
  ( (MissingZero!13284 (index!55531 (_ BitVec 32))) (Found!13284 (index!55532 (_ BitVec 32))) (Intermediate!13284 (undefined!14096 Bool) (index!55533 (_ BitVec 32)) (x!137302 (_ BitVec 32))) (Undefined!13284) (MissingVacant!13284 (index!55534 (_ BitVec 32))) )
))
(declare-fun lt!663808 () SeekEntryResult!13284)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101872 (_ BitVec 32)) SeekEntryResult!13284)

(assert (=> b!1533711 (= lt!663808 (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49152 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1533712 () Bool)

(declare-fun res!1050797 () Bool)

(assert (=> b!1533712 (=> (not res!1050797) (not e!854301))))

(declare-datatypes ((List!35626 0))(
  ( (Nil!35623) (Cons!35622 (h!37067 (_ BitVec 64)) (t!50320 List!35626)) )
))
(declare-fun arrayNoDuplicates!0 (array!101872 (_ BitVec 32) List!35626) Bool)

(assert (=> b!1533712 (= res!1050797 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35623))))

(declare-fun b!1533713 () Bool)

(declare-fun res!1050795 () Bool)

(assert (=> b!1533713 (=> (not res!1050795) (not e!854301))))

(assert (=> b!1533713 (= res!1050795 (validKeyInArray!0 (select (arr!49152 a!2792) j!64)))))

(assert (= (and start!130774 res!1050799) b!1533710))

(assert (= (and b!1533710 res!1050793) b!1533708))

(assert (= (and b!1533708 res!1050796) b!1533713))

(assert (= (and b!1533713 res!1050795) b!1533707))

(assert (= (and b!1533707 res!1050794) b!1533712))

(assert (= (and b!1533712 res!1050797) b!1533709))

(assert (= (and b!1533709 res!1050798) b!1533711))

(declare-fun m!1416407 () Bool)

(assert (=> b!1533708 m!1416407))

(assert (=> b!1533708 m!1416407))

(declare-fun m!1416409 () Bool)

(assert (=> b!1533708 m!1416409))

(declare-fun m!1416411 () Bool)

(assert (=> start!130774 m!1416411))

(declare-fun m!1416413 () Bool)

(assert (=> start!130774 m!1416413))

(declare-fun m!1416415 () Bool)

(assert (=> b!1533712 m!1416415))

(declare-fun m!1416417 () Bool)

(assert (=> b!1533709 m!1416417))

(declare-fun m!1416419 () Bool)

(assert (=> b!1533711 m!1416419))

(assert (=> b!1533711 m!1416419))

(declare-fun m!1416421 () Bool)

(assert (=> b!1533711 m!1416421))

(assert (=> b!1533713 m!1416419))

(assert (=> b!1533713 m!1416419))

(declare-fun m!1416423 () Bool)

(assert (=> b!1533713 m!1416423))

(declare-fun m!1416425 () Bool)

(assert (=> b!1533707 m!1416425))

(check-sat (not b!1533708) (not b!1533707) (not start!130774) (not b!1533713) (not b!1533711) (not b!1533712))
