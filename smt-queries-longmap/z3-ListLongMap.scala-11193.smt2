; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130740 () Bool)

(assert start!130740)

(declare-fun b!1533573 () Bool)

(declare-fun res!1050847 () Bool)

(declare-fun e!854151 () Bool)

(assert (=> b!1533573 (=> (not res!1050847) (not e!854151))))

(declare-datatypes ((array!101836 0))(
  ( (array!101837 (arr!49135 (Array (_ BitVec 32) (_ BitVec 64))) (size!49687 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101836)

(declare-fun i!951 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1533573 (= res!1050847 (validKeyInArray!0 (select (arr!49135 a!2792) i!951)))))

(declare-fun b!1533574 () Bool)

(declare-fun res!1050848 () Bool)

(assert (=> b!1533574 (=> (not res!1050848) (not e!854151))))

(declare-datatypes ((List!35687 0))(
  ( (Nil!35684) (Cons!35683 (h!37129 (_ BitVec 64)) (t!50373 List!35687)) )
))
(declare-fun arrayNoDuplicates!0 (array!101836 (_ BitVec 32) List!35687) Bool)

(assert (=> b!1533574 (= res!1050848 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35684))))

(declare-fun b!1533575 () Bool)

(declare-fun res!1050850 () Bool)

(assert (=> b!1533575 (=> (not res!1050850) (not e!854151))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1533575 (= res!1050850 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49687 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49687 a!2792)) (= (select (arr!49135 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!1050843 () Bool)

(assert (=> start!130740 (=> (not res!1050843) (not e!854151))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130740 (= res!1050843 (validMask!0 mask!2480))))

(assert (=> start!130740 e!854151))

(assert (=> start!130740 true))

(declare-fun array_inv!38368 (array!101836) Bool)

(assert (=> start!130740 (array_inv!38368 a!2792)))

(declare-fun b!1533576 () Bool)

(declare-fun res!1050844 () Bool)

(assert (=> b!1533576 (=> (not res!1050844) (not e!854151))))

(declare-fun j!64 () (_ BitVec 32))

(assert (=> b!1533576 (= res!1050844 (and (= (size!49687 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49687 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49687 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1533577 () Bool)

(declare-fun res!1050849 () Bool)

(assert (=> b!1533577 (=> (not res!1050849) (not e!854151))))

(declare-datatypes ((SeekEntryResult!13292 0))(
  ( (MissingZero!13292 (index!55563 (_ BitVec 32))) (Found!13292 (index!55564 (_ BitVec 32))) (Intermediate!13292 (undefined!14104 Bool) (index!55565 (_ BitVec 32)) (x!137329 (_ BitVec 32))) (Undefined!13292) (MissingVacant!13292 (index!55566 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101836 (_ BitVec 32)) SeekEntryResult!13292)

(assert (=> b!1533577 (= res!1050849 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49135 a!2792) j!64) a!2792 mask!2480) (Found!13292 j!64)))))

(declare-fun b!1533578 () Bool)

(declare-fun res!1050846 () Bool)

(assert (=> b!1533578 (=> (not res!1050846) (not e!854151))))

(assert (=> b!1533578 (= res!1050846 (validKeyInArray!0 (select (arr!49135 a!2792) j!64)))))

(declare-fun b!1533579 () Bool)

(assert (=> b!1533579 (= e!854151 (and (= (select (arr!49135 a!2792) index!463) (select (arr!49135 a!2792) j!64)) (bvsge mask!2480 #b00000000000000000000000000000000) (bvsge index!463 (bvadd #b00000000000000000000000000000001 mask!2480))))))

(declare-fun b!1533580 () Bool)

(declare-fun res!1050845 () Bool)

(assert (=> b!1533580 (=> (not res!1050845) (not e!854151))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101836 (_ BitVec 32)) Bool)

(assert (=> b!1533580 (= res!1050845 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(assert (= (and start!130740 res!1050843) b!1533576))

(assert (= (and b!1533576 res!1050844) b!1533573))

(assert (= (and b!1533573 res!1050847) b!1533578))

(assert (= (and b!1533578 res!1050846) b!1533580))

(assert (= (and b!1533580 res!1050845) b!1533574))

(assert (= (and b!1533574 res!1050848) b!1533575))

(assert (= (and b!1533575 res!1050850) b!1533577))

(assert (= (and b!1533577 res!1050849) b!1533579))

(declare-fun m!1415681 () Bool)

(assert (=> b!1533575 m!1415681))

(declare-fun m!1415683 () Bool)

(assert (=> b!1533580 m!1415683))

(declare-fun m!1415685 () Bool)

(assert (=> b!1533579 m!1415685))

(declare-fun m!1415687 () Bool)

(assert (=> b!1533579 m!1415687))

(assert (=> b!1533578 m!1415687))

(assert (=> b!1533578 m!1415687))

(declare-fun m!1415689 () Bool)

(assert (=> b!1533578 m!1415689))

(declare-fun m!1415691 () Bool)

(assert (=> b!1533573 m!1415691))

(assert (=> b!1533573 m!1415691))

(declare-fun m!1415693 () Bool)

(assert (=> b!1533573 m!1415693))

(declare-fun m!1415695 () Bool)

(assert (=> start!130740 m!1415695))

(declare-fun m!1415697 () Bool)

(assert (=> start!130740 m!1415697))

(declare-fun m!1415699 () Bool)

(assert (=> b!1533574 m!1415699))

(assert (=> b!1533577 m!1415687))

(assert (=> b!1533577 m!1415687))

(declare-fun m!1415701 () Bool)

(assert (=> b!1533577 m!1415701))

(check-sat (not b!1533574) (not b!1533580) (not b!1533578) (not b!1533573) (not b!1533577) (not start!130740))
(check-sat)
