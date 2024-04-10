; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130864 () Bool)

(assert start!130864)

(declare-fun b!1534793 () Bool)

(declare-fun res!1051880 () Bool)

(declare-fun e!854605 () Bool)

(assert (=> b!1534793 (=> (not res!1051880) (not e!854605))))

(declare-datatypes ((array!101962 0))(
  ( (array!101963 (arr!49197 (Array (_ BitVec 32) (_ BitVec 64))) (size!49747 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101962)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1534793 (= res!1051880 (not (= (select (arr!49197 a!2792) index!463) (select (arr!49197 a!2792) j!64))))))

(declare-fun res!1051879 () Bool)

(assert (=> start!130864 (=> (not res!1051879) (not e!854605))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130864 (= res!1051879 (validMask!0 mask!2480))))

(assert (=> start!130864 e!854605))

(assert (=> start!130864 true))

(declare-fun array_inv!38225 (array!101962) Bool)

(assert (=> start!130864 (array_inv!38225 a!2792)))

(declare-fun b!1534794 () Bool)

(declare-fun res!1051884 () Bool)

(assert (=> b!1534794 (=> (not res!1051884) (not e!854605))))

(declare-fun i!951 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1534794 (= res!1051884 (validKeyInArray!0 (select (arr!49197 a!2792) i!951)))))

(declare-fun b!1534795 () Bool)

(declare-fun res!1051885 () Bool)

(assert (=> b!1534795 (=> (not res!1051885) (not e!854605))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101962 (_ BitVec 32)) Bool)

(assert (=> b!1534795 (= res!1051885 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1534796 () Bool)

(declare-fun res!1051888 () Bool)

(assert (=> b!1534796 (=> (not res!1051888) (not e!854605))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(assert (=> b!1534796 (= res!1051888 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49747 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49747 a!2792)) (= (select (arr!49197 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1534797 () Bool)

(declare-fun res!1051887 () Bool)

(assert (=> b!1534797 (=> (not res!1051887) (not e!854605))))

(declare-datatypes ((SeekEntryResult!13329 0))(
  ( (MissingZero!13329 (index!55711 (_ BitVec 32))) (Found!13329 (index!55712 (_ BitVec 32))) (Intermediate!13329 (undefined!14141 Bool) (index!55713 (_ BitVec 32)) (x!137467 (_ BitVec 32))) (Undefined!13329) (MissingVacant!13329 (index!55714 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101962 (_ BitVec 32)) SeekEntryResult!13329)

(assert (=> b!1534797 (= res!1051887 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49197 a!2792) j!64) a!2792 mask!2480) (Found!13329 j!64)))))

(declare-fun b!1534798 () Bool)

(declare-fun e!854603 () Bool)

(assert (=> b!1534798 (= e!854603 false)))

(declare-fun lt!663930 () (_ BitVec 32))

(declare-fun lt!663931 () SeekEntryResult!13329)

(assert (=> b!1534798 (= lt!663931 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!663930 vacantIndex!5 (select (arr!49197 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1534799 () Bool)

(declare-fun res!1051882 () Bool)

(assert (=> b!1534799 (=> (not res!1051882) (not e!854605))))

(assert (=> b!1534799 (= res!1051882 (and (= (size!49747 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49747 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49747 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1534800 () Bool)

(declare-fun res!1051881 () Bool)

(assert (=> b!1534800 (=> (not res!1051881) (not e!854605))))

(declare-datatypes ((List!35671 0))(
  ( (Nil!35668) (Cons!35667 (h!37112 (_ BitVec 64)) (t!50365 List!35671)) )
))
(declare-fun arrayNoDuplicates!0 (array!101962 (_ BitVec 32) List!35671) Bool)

(assert (=> b!1534800 (= res!1051881 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35668))))

(declare-fun b!1534801 () Bool)

(declare-fun res!1051886 () Bool)

(assert (=> b!1534801 (=> (not res!1051886) (not e!854605))))

(assert (=> b!1534801 (= res!1051886 (validKeyInArray!0 (select (arr!49197 a!2792) j!64)))))

(declare-fun b!1534802 () Bool)

(assert (=> b!1534802 (= e!854605 e!854603)))

(declare-fun res!1051883 () Bool)

(assert (=> b!1534802 (=> (not res!1051883) (not e!854603))))

(assert (=> b!1534802 (= res!1051883 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!663930 #b00000000000000000000000000000000) (bvslt lt!663930 (size!49747 a!2792))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1534802 (= lt!663930 (nextIndex!0 index!463 x!510 mask!2480))))

(assert (= (and start!130864 res!1051879) b!1534799))

(assert (= (and b!1534799 res!1051882) b!1534794))

(assert (= (and b!1534794 res!1051884) b!1534801))

(assert (= (and b!1534801 res!1051886) b!1534795))

(assert (= (and b!1534795 res!1051885) b!1534800))

(assert (= (and b!1534800 res!1051881) b!1534796))

(assert (= (and b!1534796 res!1051888) b!1534797))

(assert (= (and b!1534797 res!1051887) b!1534793))

(assert (= (and b!1534793 res!1051880) b!1534802))

(assert (= (and b!1534802 res!1051883) b!1534798))

(declare-fun m!1417397 () Bool)

(assert (=> b!1534795 m!1417397))

(declare-fun m!1417399 () Bool)

(assert (=> b!1534793 m!1417399))

(declare-fun m!1417401 () Bool)

(assert (=> b!1534793 m!1417401))

(declare-fun m!1417403 () Bool)

(assert (=> b!1534796 m!1417403))

(declare-fun m!1417405 () Bool)

(assert (=> b!1534802 m!1417405))

(declare-fun m!1417407 () Bool)

(assert (=> start!130864 m!1417407))

(declare-fun m!1417409 () Bool)

(assert (=> start!130864 m!1417409))

(assert (=> b!1534798 m!1417401))

(assert (=> b!1534798 m!1417401))

(declare-fun m!1417411 () Bool)

(assert (=> b!1534798 m!1417411))

(declare-fun m!1417413 () Bool)

(assert (=> b!1534794 m!1417413))

(assert (=> b!1534794 m!1417413))

(declare-fun m!1417415 () Bool)

(assert (=> b!1534794 m!1417415))

(assert (=> b!1534801 m!1417401))

(assert (=> b!1534801 m!1417401))

(declare-fun m!1417417 () Bool)

(assert (=> b!1534801 m!1417417))

(declare-fun m!1417419 () Bool)

(assert (=> b!1534800 m!1417419))

(assert (=> b!1534797 m!1417401))

(assert (=> b!1534797 m!1417401))

(declare-fun m!1417421 () Bool)

(assert (=> b!1534797 m!1417421))

(check-sat (not b!1534798) (not b!1534794) (not start!130864) (not b!1534800) (not b!1534797) (not b!1534801) (not b!1534795) (not b!1534802))
(check-sat)
