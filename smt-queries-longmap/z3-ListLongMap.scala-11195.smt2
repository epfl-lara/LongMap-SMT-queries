; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130804 () Bool)

(assert start!130804)

(declare-fun b!1534045 () Bool)

(declare-fun res!1051137 () Bool)

(declare-fun e!854392 () Bool)

(assert (=> b!1534045 (=> (not res!1051137) (not e!854392))))

(declare-datatypes ((array!101902 0))(
  ( (array!101903 (arr!49167 (Array (_ BitVec 32) (_ BitVec 64))) (size!49717 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101902)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1534045 (= res!1051137 (and (= (size!49717 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49717 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49717 a!2792)) (not (= i!951 j!64))))))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun b!1534046 () Bool)

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1534046 (= e!854392 (and (= (select (arr!49167 a!2792) index!463) (select (arr!49167 a!2792) j!64)) (bvsge mask!2480 #b00000000000000000000000000000000) (bvslt index!463 (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge vacantIndex!5 (bvadd #b00000000000000000000000000000001 mask!2480))))))

(declare-fun b!1534047 () Bool)

(declare-fun res!1051135 () Bool)

(assert (=> b!1534047 (=> (not res!1051135) (not e!854392))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1534047 (= res!1051135 (validKeyInArray!0 (select (arr!49167 a!2792) i!951)))))

(declare-fun b!1534048 () Bool)

(declare-fun res!1051133 () Bool)

(assert (=> b!1534048 (=> (not res!1051133) (not e!854392))))

(assert (=> b!1534048 (= res!1051133 (validKeyInArray!0 (select (arr!49167 a!2792) j!64)))))

(declare-fun b!1534049 () Bool)

(declare-fun res!1051131 () Bool)

(assert (=> b!1534049 (=> (not res!1051131) (not e!854392))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101902 (_ BitVec 32)) Bool)

(assert (=> b!1534049 (= res!1051131 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1534050 () Bool)

(declare-fun res!1051132 () Bool)

(assert (=> b!1534050 (=> (not res!1051132) (not e!854392))))

(declare-fun x!510 () (_ BitVec 32))

(assert (=> b!1534050 (= res!1051132 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49717 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49717 a!2792)) (= (select (arr!49167 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1534051 () Bool)

(declare-fun res!1051134 () Bool)

(assert (=> b!1534051 (=> (not res!1051134) (not e!854392))))

(declare-datatypes ((SeekEntryResult!13299 0))(
  ( (MissingZero!13299 (index!55591 (_ BitVec 32))) (Found!13299 (index!55592 (_ BitVec 32))) (Intermediate!13299 (undefined!14111 Bool) (index!55593 (_ BitVec 32)) (x!137357 (_ BitVec 32))) (Undefined!13299) (MissingVacant!13299 (index!55594 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101902 (_ BitVec 32)) SeekEntryResult!13299)

(assert (=> b!1534051 (= res!1051134 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49167 a!2792) j!64) a!2792 mask!2480) (Found!13299 j!64)))))

(declare-fun res!1051136 () Bool)

(assert (=> start!130804 (=> (not res!1051136) (not e!854392))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130804 (= res!1051136 (validMask!0 mask!2480))))

(assert (=> start!130804 e!854392))

(assert (=> start!130804 true))

(declare-fun array_inv!38195 (array!101902) Bool)

(assert (=> start!130804 (array_inv!38195 a!2792)))

(declare-fun b!1534052 () Bool)

(declare-fun res!1051138 () Bool)

(assert (=> b!1534052 (=> (not res!1051138) (not e!854392))))

(declare-datatypes ((List!35641 0))(
  ( (Nil!35638) (Cons!35637 (h!37082 (_ BitVec 64)) (t!50335 List!35641)) )
))
(declare-fun arrayNoDuplicates!0 (array!101902 (_ BitVec 32) List!35641) Bool)

(assert (=> b!1534052 (= res!1051138 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35638))))

(assert (= (and start!130804 res!1051136) b!1534045))

(assert (= (and b!1534045 res!1051137) b!1534047))

(assert (= (and b!1534047 res!1051135) b!1534048))

(assert (= (and b!1534048 res!1051133) b!1534049))

(assert (= (and b!1534049 res!1051131) b!1534052))

(assert (= (and b!1534052 res!1051138) b!1534050))

(assert (= (and b!1534050 res!1051132) b!1534051))

(assert (= (and b!1534051 res!1051134) b!1534046))

(declare-fun m!1416721 () Bool)

(assert (=> b!1534047 m!1416721))

(assert (=> b!1534047 m!1416721))

(declare-fun m!1416723 () Bool)

(assert (=> b!1534047 m!1416723))

(declare-fun m!1416725 () Bool)

(assert (=> b!1534048 m!1416725))

(assert (=> b!1534048 m!1416725))

(declare-fun m!1416727 () Bool)

(assert (=> b!1534048 m!1416727))

(assert (=> b!1534051 m!1416725))

(assert (=> b!1534051 m!1416725))

(declare-fun m!1416729 () Bool)

(assert (=> b!1534051 m!1416729))

(declare-fun m!1416731 () Bool)

(assert (=> b!1534046 m!1416731))

(assert (=> b!1534046 m!1416725))

(declare-fun m!1416733 () Bool)

(assert (=> b!1534052 m!1416733))

(declare-fun m!1416735 () Bool)

(assert (=> b!1534050 m!1416735))

(declare-fun m!1416737 () Bool)

(assert (=> start!130804 m!1416737))

(declare-fun m!1416739 () Bool)

(assert (=> start!130804 m!1416739))

(declare-fun m!1416741 () Bool)

(assert (=> b!1534049 m!1416741))

(check-sat (not b!1534047) (not b!1534049) (not b!1534052) (not b!1534048) (not start!130804) (not b!1534051))
(check-sat)
