; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127770 () Bool)

(assert start!127770)

(declare-fun b!1501567 () Bool)

(declare-fun e!839973 () Bool)

(declare-fun e!839971 () Bool)

(assert (=> b!1501567 (= e!839973 e!839971)))

(declare-fun res!1022650 () Bool)

(assert (=> b!1501567 (=> (not res!1022650) (not e!839971))))

(declare-datatypes ((SeekEntryResult!12545 0))(
  ( (MissingZero!12545 (index!52572 (_ BitVec 32))) (Found!12545 (index!52573 (_ BitVec 32))) (Intermediate!12545 (undefined!13357 Bool) (index!52574 (_ BitVec 32)) (x!134235 (_ BitVec 32))) (Undefined!12545) (MissingVacant!12545 (index!52575 (_ BitVec 32))) )
))
(declare-fun lt!653208 () SeekEntryResult!12545)

(declare-fun mask!2661 () (_ BitVec 32))

(declare-datatypes ((array!100151 0))(
  ( (array!100152 (arr!48335 (Array (_ BitVec 32) (_ BitVec 64))) (size!48885 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100151)

(declare-fun index!625 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100151 (_ BitVec 32)) SeekEntryResult!12545)

(assert (=> b!1501567 (= res!1022650 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48335 a!2850) j!87) a!2850 mask!2661) lt!653208))))

(assert (=> b!1501567 (= lt!653208 (Found!12545 j!87))))

(declare-fun b!1501568 () Bool)

(declare-fun res!1022643 () Bool)

(declare-fun e!839972 () Bool)

(assert (=> b!1501568 (=> (not res!1022643) (not e!839972))))

(declare-fun lt!653207 () (_ BitVec 32))

(assert (=> b!1501568 (= res!1022643 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!653207 vacantBefore!10 (select (arr!48335 a!2850) j!87) a!2850 mask!2661) lt!653208))))

(declare-fun b!1501569 () Bool)

(declare-fun res!1022644 () Bool)

(assert (=> b!1501569 (=> (not res!1022644) (not e!839973))))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1501569 (= res!1022644 (validKeyInArray!0 (select (arr!48335 a!2850) i!996)))))

(declare-fun b!1501570 () Bool)

(declare-fun res!1022653 () Bool)

(assert (=> b!1501570 (=> (not res!1022653) (not e!839973))))

(assert (=> b!1501570 (= res!1022653 (validKeyInArray!0 (select (arr!48335 a!2850) j!87)))))

(declare-fun b!1501571 () Bool)

(declare-fun res!1022651 () Bool)

(assert (=> b!1501571 (=> (not res!1022651) (not e!839973))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100151 (_ BitVec 32)) Bool)

(assert (=> b!1501571 (= res!1022651 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun res!1022649 () Bool)

(assert (=> start!127770 (=> (not res!1022649) (not e!839973))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127770 (= res!1022649 (validMask!0 mask!2661))))

(assert (=> start!127770 e!839973))

(assert (=> start!127770 true))

(declare-fun array_inv!37363 (array!100151) Bool)

(assert (=> start!127770 (array_inv!37363 a!2850)))

(declare-fun b!1501572 () Bool)

(declare-fun res!1022645 () Bool)

(assert (=> b!1501572 (=> (not res!1022645) (not e!839973))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1501572 (= res!1022645 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48885 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48885 a!2850)) (= (select (arr!48335 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48335 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48885 a!2850))))))

(declare-fun b!1501573 () Bool)

(declare-fun res!1022647 () Bool)

(assert (=> b!1501573 (=> (not res!1022647) (not e!839973))))

(declare-datatypes ((List!34827 0))(
  ( (Nil!34824) (Cons!34823 (h!36220 (_ BitVec 64)) (t!49521 List!34827)) )
))
(declare-fun arrayNoDuplicates!0 (array!100151 (_ BitVec 32) List!34827) Bool)

(assert (=> b!1501573 (= res!1022647 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34824))))

(declare-fun b!1501574 () Bool)

(declare-fun res!1022652 () Bool)

(assert (=> b!1501574 (=> (not res!1022652) (not e!839973))))

(assert (=> b!1501574 (= res!1022652 (and (= (size!48885 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48885 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48885 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1501575 () Bool)

(declare-fun res!1022646 () Bool)

(assert (=> b!1501575 (=> (not res!1022646) (not e!839971))))

(assert (=> b!1501575 (= res!1022646 (not (= (select (arr!48335 a!2850) index!625) (select (arr!48335 a!2850) j!87))))))

(declare-fun b!1501576 () Bool)

(assert (=> b!1501576 (= e!839972 (not true))))

(assert (=> b!1501576 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!653207 vacantAfter!10 (select (store (arr!48335 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) j!87) (array!100152 (store (arr!48335 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48885 a!2850)) mask!2661) lt!653208)))

(declare-datatypes ((Unit!50244 0))(
  ( (Unit!50245) )
))
(declare-fun lt!653209 () Unit!50244)

(declare-fun lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 (array!100151 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50244)

(assert (=> b!1501576 (= lt!653209 (lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 a!2850 i!996 j!87 (bvadd #b00000000000000000000000000000001 x!647) lt!653207 vacantBefore!10 vacantAfter!10 mask!2661))))

(declare-fun b!1501577 () Bool)

(assert (=> b!1501577 (= e!839971 e!839972)))

(declare-fun res!1022648 () Bool)

(assert (=> b!1501577 (=> (not res!1022648) (not e!839972))))

(assert (=> b!1501577 (= res!1022648 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!653207 #b00000000000000000000000000000000) (bvslt lt!653207 (size!48885 a!2850))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1501577 (= lt!653207 (nextIndex!0 index!625 x!647 mask!2661))))

(assert (= (and start!127770 res!1022649) b!1501574))

(assert (= (and b!1501574 res!1022652) b!1501569))

(assert (= (and b!1501569 res!1022644) b!1501570))

(assert (= (and b!1501570 res!1022653) b!1501571))

(assert (= (and b!1501571 res!1022651) b!1501573))

(assert (= (and b!1501573 res!1022647) b!1501572))

(assert (= (and b!1501572 res!1022645) b!1501567))

(assert (= (and b!1501567 res!1022650) b!1501575))

(assert (= (and b!1501575 res!1022646) b!1501577))

(assert (= (and b!1501577 res!1022648) b!1501568))

(assert (= (and b!1501568 res!1022643) b!1501576))

(declare-fun m!1384813 () Bool)

(assert (=> b!1501569 m!1384813))

(assert (=> b!1501569 m!1384813))

(declare-fun m!1384815 () Bool)

(assert (=> b!1501569 m!1384815))

(declare-fun m!1384817 () Bool)

(assert (=> b!1501571 m!1384817))

(declare-fun m!1384819 () Bool)

(assert (=> b!1501576 m!1384819))

(declare-fun m!1384821 () Bool)

(assert (=> b!1501576 m!1384821))

(assert (=> b!1501576 m!1384821))

(declare-fun m!1384823 () Bool)

(assert (=> b!1501576 m!1384823))

(declare-fun m!1384825 () Bool)

(assert (=> b!1501576 m!1384825))

(declare-fun m!1384827 () Bool)

(assert (=> b!1501573 m!1384827))

(declare-fun m!1384829 () Bool)

(assert (=> b!1501575 m!1384829))

(declare-fun m!1384831 () Bool)

(assert (=> b!1501575 m!1384831))

(assert (=> b!1501570 m!1384831))

(assert (=> b!1501570 m!1384831))

(declare-fun m!1384833 () Bool)

(assert (=> b!1501570 m!1384833))

(declare-fun m!1384835 () Bool)

(assert (=> start!127770 m!1384835))

(declare-fun m!1384837 () Bool)

(assert (=> start!127770 m!1384837))

(assert (=> b!1501568 m!1384831))

(assert (=> b!1501568 m!1384831))

(declare-fun m!1384839 () Bool)

(assert (=> b!1501568 m!1384839))

(assert (=> b!1501567 m!1384831))

(assert (=> b!1501567 m!1384831))

(declare-fun m!1384841 () Bool)

(assert (=> b!1501567 m!1384841))

(declare-fun m!1384843 () Bool)

(assert (=> b!1501577 m!1384843))

(declare-fun m!1384845 () Bool)

(assert (=> b!1501572 m!1384845))

(assert (=> b!1501572 m!1384819))

(declare-fun m!1384847 () Bool)

(assert (=> b!1501572 m!1384847))

(push 1)

