; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130870 () Bool)

(assert start!130870)

(declare-fun b!1534883 () Bool)

(declare-fun res!1051976 () Bool)

(declare-fun e!854632 () Bool)

(assert (=> b!1534883 (=> (not res!1051976) (not e!854632))))

(declare-datatypes ((array!101968 0))(
  ( (array!101969 (arr!49200 (Array (_ BitVec 32) (_ BitVec 64))) (size!49750 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101968)

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101968 (_ BitVec 32)) Bool)

(assert (=> b!1534883 (= res!1051976 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1534884 () Bool)

(declare-fun res!1051974 () Bool)

(assert (=> b!1534884 (=> (not res!1051974) (not e!854632))))

(declare-fun i!951 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1534884 (= res!1051974 (validKeyInArray!0 (select (arr!49200 a!2792) i!951)))))

(declare-fun b!1534885 () Bool)

(declare-fun res!1051975 () Bool)

(assert (=> b!1534885 (=> (not res!1051975) (not e!854632))))

(declare-fun j!64 () (_ BitVec 32))

(assert (=> b!1534885 (= res!1051975 (validKeyInArray!0 (select (arr!49200 a!2792) j!64)))))

(declare-fun b!1534886 () Bool)

(declare-fun res!1051972 () Bool)

(assert (=> b!1534886 (=> (not res!1051972) (not e!854632))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1534886 (= res!1051972 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49750 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49750 a!2792)) (= (select (arr!49200 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1534887 () Bool)

(declare-fun e!854630 () Bool)

(assert (=> b!1534887 (= e!854632 e!854630)))

(declare-fun res!1051970 () Bool)

(assert (=> b!1534887 (=> (not res!1051970) (not e!854630))))

(declare-fun lt!663949 () (_ BitVec 32))

(assert (=> b!1534887 (= res!1051970 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!663949 #b00000000000000000000000000000000) (bvslt lt!663949 (size!49750 a!2792))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1534887 (= lt!663949 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1534888 () Bool)

(declare-fun res!1051977 () Bool)

(assert (=> b!1534888 (=> (not res!1051977) (not e!854632))))

(assert (=> b!1534888 (= res!1051977 (not (= (select (arr!49200 a!2792) index!463) (select (arr!49200 a!2792) j!64))))))

(declare-fun b!1534889 () Bool)

(declare-fun res!1051969 () Bool)

(assert (=> b!1534889 (=> (not res!1051969) (not e!854632))))

(declare-datatypes ((SeekEntryResult!13332 0))(
  ( (MissingZero!13332 (index!55723 (_ BitVec 32))) (Found!13332 (index!55724 (_ BitVec 32))) (Intermediate!13332 (undefined!14144 Bool) (index!55725 (_ BitVec 32)) (x!137478 (_ BitVec 32))) (Undefined!13332) (MissingVacant!13332 (index!55726 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101968 (_ BitVec 32)) SeekEntryResult!13332)

(assert (=> b!1534889 (= res!1051969 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49200 a!2792) j!64) a!2792 mask!2480) (Found!13332 j!64)))))

(declare-fun b!1534890 () Bool)

(declare-fun res!1051978 () Bool)

(assert (=> b!1534890 (=> (not res!1051978) (not e!854632))))

(declare-datatypes ((List!35674 0))(
  ( (Nil!35671) (Cons!35670 (h!37115 (_ BitVec 64)) (t!50368 List!35674)) )
))
(declare-fun arrayNoDuplicates!0 (array!101968 (_ BitVec 32) List!35674) Bool)

(assert (=> b!1534890 (= res!1051978 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35671))))

(declare-fun b!1534891 () Bool)

(declare-fun res!1051973 () Bool)

(assert (=> b!1534891 (=> (not res!1051973) (not e!854632))))

(assert (=> b!1534891 (= res!1051973 (and (= (size!49750 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49750 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49750 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1534892 () Bool)

(assert (=> b!1534892 (= e!854630 false)))

(declare-fun lt!663948 () SeekEntryResult!13332)

(assert (=> b!1534892 (= lt!663948 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!663949 vacantIndex!5 (select (arr!49200 a!2792) j!64) a!2792 mask!2480))))

(declare-fun res!1051971 () Bool)

(assert (=> start!130870 (=> (not res!1051971) (not e!854632))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130870 (= res!1051971 (validMask!0 mask!2480))))

(assert (=> start!130870 e!854632))

(assert (=> start!130870 true))

(declare-fun array_inv!38228 (array!101968) Bool)

(assert (=> start!130870 (array_inv!38228 a!2792)))

(assert (= (and start!130870 res!1051971) b!1534891))

(assert (= (and b!1534891 res!1051973) b!1534884))

(assert (= (and b!1534884 res!1051974) b!1534885))

(assert (= (and b!1534885 res!1051975) b!1534883))

(assert (= (and b!1534883 res!1051976) b!1534890))

(assert (= (and b!1534890 res!1051978) b!1534886))

(assert (= (and b!1534886 res!1051972) b!1534889))

(assert (= (and b!1534889 res!1051969) b!1534888))

(assert (= (and b!1534888 res!1051977) b!1534887))

(assert (= (and b!1534887 res!1051970) b!1534892))

(declare-fun m!1417475 () Bool)

(assert (=> b!1534890 m!1417475))

(declare-fun m!1417477 () Bool)

(assert (=> b!1534888 m!1417477))

(declare-fun m!1417479 () Bool)

(assert (=> b!1534888 m!1417479))

(declare-fun m!1417481 () Bool)

(assert (=> start!130870 m!1417481))

(declare-fun m!1417483 () Bool)

(assert (=> start!130870 m!1417483))

(declare-fun m!1417485 () Bool)

(assert (=> b!1534887 m!1417485))

(assert (=> b!1534885 m!1417479))

(assert (=> b!1534885 m!1417479))

(declare-fun m!1417487 () Bool)

(assert (=> b!1534885 m!1417487))

(declare-fun m!1417489 () Bool)

(assert (=> b!1534886 m!1417489))

(assert (=> b!1534889 m!1417479))

(assert (=> b!1534889 m!1417479))

(declare-fun m!1417491 () Bool)

(assert (=> b!1534889 m!1417491))

(declare-fun m!1417493 () Bool)

(assert (=> b!1534884 m!1417493))

(assert (=> b!1534884 m!1417493))

(declare-fun m!1417495 () Bool)

(assert (=> b!1534884 m!1417495))

(assert (=> b!1534892 m!1417479))

(assert (=> b!1534892 m!1417479))

(declare-fun m!1417497 () Bool)

(assert (=> b!1534892 m!1417497))

(declare-fun m!1417499 () Bool)

(assert (=> b!1534883 m!1417499))

(check-sat (not b!1534884) (not start!130870) (not b!1534889) (not b!1534883) (not b!1534890) (not b!1534887) (not b!1534885) (not b!1534892))
(check-sat)
