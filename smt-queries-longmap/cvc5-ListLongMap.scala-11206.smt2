; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130868 () Bool)

(assert start!130868)

(declare-fun b!1534853 () Bool)

(declare-fun res!1051948 () Bool)

(declare-fun e!854623 () Bool)

(assert (=> b!1534853 (=> (not res!1051948) (not e!854623))))

(declare-fun x!510 () (_ BitVec 32))

(declare-datatypes ((array!101966 0))(
  ( (array!101967 (arr!49199 (Array (_ BitVec 32) (_ BitVec 64))) (size!49749 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101966)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13331 0))(
  ( (MissingZero!13331 (index!55719 (_ BitVec 32))) (Found!13331 (index!55720 (_ BitVec 32))) (Intermediate!13331 (undefined!14143 Bool) (index!55721 (_ BitVec 32)) (x!137477 (_ BitVec 32))) (Undefined!13331) (MissingVacant!13331 (index!55722 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101966 (_ BitVec 32)) SeekEntryResult!13331)

(assert (=> b!1534853 (= res!1051948 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49199 a!2792) j!64) a!2792 mask!2480) (Found!13331 j!64)))))

(declare-fun b!1534854 () Bool)

(declare-fun res!1051946 () Bool)

(assert (=> b!1534854 (=> (not res!1051946) (not e!854623))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1534854 (= res!1051946 (and (= (size!49749 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49749 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49749 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1534855 () Bool)

(declare-fun res!1051941 () Bool)

(assert (=> b!1534855 (=> (not res!1051941) (not e!854623))))

(assert (=> b!1534855 (= res!1051941 (not (= (select (arr!49199 a!2792) index!463) (select (arr!49199 a!2792) j!64))))))

(declare-fun b!1534856 () Bool)

(declare-fun res!1051944 () Bool)

(assert (=> b!1534856 (=> (not res!1051944) (not e!854623))))

(declare-datatypes ((List!35673 0))(
  ( (Nil!35670) (Cons!35669 (h!37114 (_ BitVec 64)) (t!50367 List!35673)) )
))
(declare-fun arrayNoDuplicates!0 (array!101966 (_ BitVec 32) List!35673) Bool)

(assert (=> b!1534856 (= res!1051944 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35670))))

(declare-fun b!1534857 () Bool)

(declare-fun res!1051947 () Bool)

(assert (=> b!1534857 (=> (not res!1051947) (not e!854623))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101966 (_ BitVec 32)) Bool)

(assert (=> b!1534857 (= res!1051947 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun res!1051943 () Bool)

(assert (=> start!130868 (=> (not res!1051943) (not e!854623))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130868 (= res!1051943 (validMask!0 mask!2480))))

(assert (=> start!130868 e!854623))

(assert (=> start!130868 true))

(declare-fun array_inv!38227 (array!101966) Bool)

(assert (=> start!130868 (array_inv!38227 a!2792)))

(declare-fun b!1534858 () Bool)

(declare-fun e!854622 () Bool)

(assert (=> b!1534858 (= e!854623 e!854622)))

(declare-fun res!1051940 () Bool)

(assert (=> b!1534858 (=> (not res!1051940) (not e!854622))))

(declare-fun lt!663943 () (_ BitVec 32))

(assert (=> b!1534858 (= res!1051940 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!663943 #b00000000000000000000000000000000) (bvslt lt!663943 (size!49749 a!2792))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1534858 (= lt!663943 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1534859 () Bool)

(declare-fun res!1051939 () Bool)

(assert (=> b!1534859 (=> (not res!1051939) (not e!854623))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1534859 (= res!1051939 (validKeyInArray!0 (select (arr!49199 a!2792) j!64)))))

(declare-fun b!1534860 () Bool)

(assert (=> b!1534860 (= e!854622 false)))

(declare-fun lt!663942 () SeekEntryResult!13331)

(assert (=> b!1534860 (= lt!663942 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!663943 vacantIndex!5 (select (arr!49199 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1534861 () Bool)

(declare-fun res!1051942 () Bool)

(assert (=> b!1534861 (=> (not res!1051942) (not e!854623))))

(assert (=> b!1534861 (= res!1051942 (validKeyInArray!0 (select (arr!49199 a!2792) i!951)))))

(declare-fun b!1534862 () Bool)

(declare-fun res!1051945 () Bool)

(assert (=> b!1534862 (=> (not res!1051945) (not e!854623))))

(assert (=> b!1534862 (= res!1051945 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49749 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49749 a!2792)) (= (select (arr!49199 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!130868 res!1051943) b!1534854))

(assert (= (and b!1534854 res!1051946) b!1534861))

(assert (= (and b!1534861 res!1051942) b!1534859))

(assert (= (and b!1534859 res!1051939) b!1534857))

(assert (= (and b!1534857 res!1051947) b!1534856))

(assert (= (and b!1534856 res!1051944) b!1534862))

(assert (= (and b!1534862 res!1051945) b!1534853))

(assert (= (and b!1534853 res!1051948) b!1534855))

(assert (= (and b!1534855 res!1051941) b!1534858))

(assert (= (and b!1534858 res!1051940) b!1534860))

(declare-fun m!1417449 () Bool)

(assert (=> start!130868 m!1417449))

(declare-fun m!1417451 () Bool)

(assert (=> start!130868 m!1417451))

(declare-fun m!1417453 () Bool)

(assert (=> b!1534859 m!1417453))

(assert (=> b!1534859 m!1417453))

(declare-fun m!1417455 () Bool)

(assert (=> b!1534859 m!1417455))

(declare-fun m!1417457 () Bool)

(assert (=> b!1534855 m!1417457))

(assert (=> b!1534855 m!1417453))

(declare-fun m!1417459 () Bool)

(assert (=> b!1534856 m!1417459))

(assert (=> b!1534853 m!1417453))

(assert (=> b!1534853 m!1417453))

(declare-fun m!1417461 () Bool)

(assert (=> b!1534853 m!1417461))

(declare-fun m!1417463 () Bool)

(assert (=> b!1534862 m!1417463))

(declare-fun m!1417465 () Bool)

(assert (=> b!1534857 m!1417465))

(assert (=> b!1534860 m!1417453))

(assert (=> b!1534860 m!1417453))

(declare-fun m!1417467 () Bool)

(assert (=> b!1534860 m!1417467))

(declare-fun m!1417469 () Bool)

(assert (=> b!1534858 m!1417469))

(declare-fun m!1417471 () Bool)

(assert (=> b!1534861 m!1417471))

(assert (=> b!1534861 m!1417471))

(declare-fun m!1417473 () Bool)

(assert (=> b!1534861 m!1417473))

(push 1)

