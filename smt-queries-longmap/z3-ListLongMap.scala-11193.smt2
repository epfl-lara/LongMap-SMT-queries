; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130792 () Bool)

(assert start!130792)

(declare-fun b!1533910 () Bool)

(declare-fun res!1051002 () Bool)

(declare-fun e!854355 () Bool)

(assert (=> b!1533910 (=> (not res!1051002) (not e!854355))))

(declare-datatypes ((array!101890 0))(
  ( (array!101891 (arr!49161 (Array (_ BitVec 32) (_ BitVec 64))) (size!49711 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101890)

(declare-fun i!951 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1533910 (= res!1051002 (validKeyInArray!0 (select (arr!49161 a!2792) i!951)))))

(declare-fun b!1533911 () Bool)

(declare-fun res!1050996 () Bool)

(assert (=> b!1533911 (=> (not res!1050996) (not e!854355))))

(declare-fun j!64 () (_ BitVec 32))

(assert (=> b!1533911 (= res!1050996 (validKeyInArray!0 (select (arr!49161 a!2792) j!64)))))

(declare-fun res!1050997 () Bool)

(assert (=> start!130792 (=> (not res!1050997) (not e!854355))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130792 (= res!1050997 (validMask!0 mask!2480))))

(assert (=> start!130792 e!854355))

(assert (=> start!130792 true))

(declare-fun array_inv!38189 (array!101890) Bool)

(assert (=> start!130792 (array_inv!38189 a!2792)))

(declare-fun b!1533912 () Bool)

(declare-fun res!1051000 () Bool)

(assert (=> b!1533912 (=> (not res!1051000) (not e!854355))))

(declare-datatypes ((List!35635 0))(
  ( (Nil!35632) (Cons!35631 (h!37076 (_ BitVec 64)) (t!50329 List!35635)) )
))
(declare-fun arrayNoDuplicates!0 (array!101890 (_ BitVec 32) List!35635) Bool)

(assert (=> b!1533912 (= res!1051000 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35632))))

(declare-fun b!1533913 () Bool)

(declare-fun res!1051003 () Bool)

(assert (=> b!1533913 (=> (not res!1051003) (not e!854355))))

(assert (=> b!1533913 (= res!1051003 (and (= (size!49711 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49711 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49711 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1533914 () Bool)

(declare-fun res!1050998 () Bool)

(assert (=> b!1533914 (=> (not res!1050998) (not e!854355))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13293 0))(
  ( (MissingZero!13293 (index!55567 (_ BitVec 32))) (Found!13293 (index!55568 (_ BitVec 32))) (Intermediate!13293 (undefined!14105 Bool) (index!55569 (_ BitVec 32)) (x!137335 (_ BitVec 32))) (Undefined!13293) (MissingVacant!13293 (index!55570 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101890 (_ BitVec 32)) SeekEntryResult!13293)

(assert (=> b!1533914 (= res!1050998 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49161 a!2792) j!64) a!2792 mask!2480) (Found!13293 j!64)))))

(declare-fun b!1533915 () Bool)

(declare-fun res!1050999 () Bool)

(assert (=> b!1533915 (=> (not res!1050999) (not e!854355))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101890 (_ BitVec 32)) Bool)

(assert (=> b!1533915 (= res!1050999 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1533916 () Bool)

(declare-fun res!1051001 () Bool)

(assert (=> b!1533916 (=> (not res!1051001) (not e!854355))))

(assert (=> b!1533916 (= res!1051001 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49711 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49711 a!2792)) (= (select (arr!49161 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1533917 () Bool)

(assert (=> b!1533917 (= e!854355 (and (= (select (arr!49161 a!2792) index!463) (select (arr!49161 a!2792) j!64)) (bvsge mask!2480 #b00000000000000000000000000000000) (bvsge index!463 (bvadd #b00000000000000000000000000000001 mask!2480))))))

(assert (= (and start!130792 res!1050997) b!1533913))

(assert (= (and b!1533913 res!1051003) b!1533910))

(assert (= (and b!1533910 res!1051002) b!1533911))

(assert (= (and b!1533911 res!1050996) b!1533915))

(assert (= (and b!1533915 res!1050999) b!1533912))

(assert (= (and b!1533912 res!1051000) b!1533916))

(assert (= (and b!1533916 res!1051001) b!1533914))

(assert (= (and b!1533914 res!1050998) b!1533917))

(declare-fun m!1416595 () Bool)

(assert (=> b!1533916 m!1416595))

(declare-fun m!1416597 () Bool)

(assert (=> start!130792 m!1416597))

(declare-fun m!1416599 () Bool)

(assert (=> start!130792 m!1416599))

(declare-fun m!1416601 () Bool)

(assert (=> b!1533910 m!1416601))

(assert (=> b!1533910 m!1416601))

(declare-fun m!1416603 () Bool)

(assert (=> b!1533910 m!1416603))

(declare-fun m!1416605 () Bool)

(assert (=> b!1533912 m!1416605))

(declare-fun m!1416607 () Bool)

(assert (=> b!1533911 m!1416607))

(assert (=> b!1533911 m!1416607))

(declare-fun m!1416609 () Bool)

(assert (=> b!1533911 m!1416609))

(declare-fun m!1416611 () Bool)

(assert (=> b!1533915 m!1416611))

(assert (=> b!1533914 m!1416607))

(assert (=> b!1533914 m!1416607))

(declare-fun m!1416613 () Bool)

(assert (=> b!1533914 m!1416613))

(declare-fun m!1416615 () Bool)

(assert (=> b!1533917 m!1416615))

(assert (=> b!1533917 m!1416607))

(check-sat (not b!1533915) (not start!130792) (not b!1533912) (not b!1533914) (not b!1533911) (not b!1533910))
(check-sat)
