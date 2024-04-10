; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131300 () Bool)

(assert start!131300)

(declare-fun b!1539684 () Bool)

(declare-fun res!1056483 () Bool)

(declare-fun e!856393 () Bool)

(assert (=> b!1539684 (=> (not res!1056483) (not e!856393))))

(declare-datatypes ((array!102287 0))(
  ( (array!102288 (arr!49355 (Array (_ BitVec 32) (_ BitVec 64))) (size!49905 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102287)

(declare-fun i!951 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1539684 (= res!1056483 (validKeyInArray!0 (select (arr!49355 a!2792) i!951)))))

(declare-fun b!1539685 () Bool)

(declare-fun res!1056485 () Bool)

(assert (=> b!1539685 (=> (not res!1056485) (not e!856393))))

(declare-datatypes ((List!35829 0))(
  ( (Nil!35826) (Cons!35825 (h!37270 (_ BitVec 64)) (t!50523 List!35829)) )
))
(declare-fun arrayNoDuplicates!0 (array!102287 (_ BitVec 32) List!35829) Bool)

(assert (=> b!1539685 (= res!1056485 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35826))))

(declare-fun b!1539686 () Bool)

(declare-fun res!1056488 () Bool)

(assert (=> b!1539686 (=> (not res!1056488) (not e!856393))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102287 (_ BitVec 32)) Bool)

(assert (=> b!1539686 (= res!1056488 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1539687 () Bool)

(declare-fun res!1056487 () Bool)

(assert (=> b!1539687 (=> (not res!1056487) (not e!856393))))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1539687 (= res!1056487 (not (= (select (arr!49355 a!2792) index!463) (select (arr!49355 a!2792) j!64))))))

(declare-fun b!1539688 () Bool)

(declare-fun res!1056489 () Bool)

(assert (=> b!1539688 (=> (not res!1056489) (not e!856393))))

(assert (=> b!1539688 (= res!1056489 (validKeyInArray!0 (select (arr!49355 a!2792) j!64)))))

(declare-fun b!1539689 () Bool)

(declare-fun res!1056486 () Bool)

(assert (=> b!1539689 (=> (not res!1056486) (not e!856393))))

(assert (=> b!1539689 (= res!1056486 (and (= (size!49905 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49905 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49905 a!2792)) (not (= i!951 j!64))))))

(declare-fun res!1056490 () Bool)

(assert (=> start!131300 (=> (not res!1056490) (not e!856393))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131300 (= res!1056490 (validMask!0 mask!2480))))

(assert (=> start!131300 e!856393))

(assert (=> start!131300 true))

(declare-fun array_inv!38383 (array!102287) Bool)

(assert (=> start!131300 (array_inv!38383 a!2792)))

(declare-fun b!1539690 () Bool)

(assert (=> b!1539690 (= e!856393 false)))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun lt!665116 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1539690 (= lt!665116 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1539691 () Bool)

(declare-fun res!1056482 () Bool)

(assert (=> b!1539691 (=> (not res!1056482) (not e!856393))))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(assert (=> b!1539691 (= res!1056482 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49905 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49905 a!2792)) (= (select (arr!49355 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1539692 () Bool)

(declare-fun res!1056484 () Bool)

(assert (=> b!1539692 (=> (not res!1056484) (not e!856393))))

(declare-datatypes ((SeekEntryResult!13481 0))(
  ( (MissingZero!13481 (index!56319 (_ BitVec 32))) (Found!13481 (index!56320 (_ BitVec 32))) (Intermediate!13481 (undefined!14293 Bool) (index!56321 (_ BitVec 32)) (x!138058 (_ BitVec 32))) (Undefined!13481) (MissingVacant!13481 (index!56322 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102287 (_ BitVec 32)) SeekEntryResult!13481)

(assert (=> b!1539692 (= res!1056484 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49355 a!2792) j!64) a!2792 mask!2480) (Found!13481 j!64)))))

(assert (= (and start!131300 res!1056490) b!1539689))

(assert (= (and b!1539689 res!1056486) b!1539684))

(assert (= (and b!1539684 res!1056483) b!1539688))

(assert (= (and b!1539688 res!1056489) b!1539686))

(assert (= (and b!1539686 res!1056488) b!1539685))

(assert (= (and b!1539685 res!1056485) b!1539691))

(assert (= (and b!1539691 res!1056482) b!1539692))

(assert (= (and b!1539692 res!1056484) b!1539687))

(assert (= (and b!1539687 res!1056487) b!1539690))

(declare-fun m!1421883 () Bool)

(assert (=> b!1539687 m!1421883))

(declare-fun m!1421885 () Bool)

(assert (=> b!1539687 m!1421885))

(assert (=> b!1539688 m!1421885))

(assert (=> b!1539688 m!1421885))

(declare-fun m!1421887 () Bool)

(assert (=> b!1539688 m!1421887))

(declare-fun m!1421889 () Bool)

(assert (=> b!1539686 m!1421889))

(declare-fun m!1421891 () Bool)

(assert (=> b!1539684 m!1421891))

(assert (=> b!1539684 m!1421891))

(declare-fun m!1421893 () Bool)

(assert (=> b!1539684 m!1421893))

(assert (=> b!1539692 m!1421885))

(assert (=> b!1539692 m!1421885))

(declare-fun m!1421895 () Bool)

(assert (=> b!1539692 m!1421895))

(declare-fun m!1421897 () Bool)

(assert (=> b!1539690 m!1421897))

(declare-fun m!1421899 () Bool)

(assert (=> start!131300 m!1421899))

(declare-fun m!1421901 () Bool)

(assert (=> start!131300 m!1421901))

(declare-fun m!1421903 () Bool)

(assert (=> b!1539685 m!1421903))

(declare-fun m!1421905 () Bool)

(assert (=> b!1539691 m!1421905))

(push 1)

(assert (not start!131300))

(assert (not b!1539685))

(assert (not b!1539690))

(assert (not b!1539684))

(assert (not b!1539692))

(assert (not b!1539688))

(assert (not b!1539686))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

