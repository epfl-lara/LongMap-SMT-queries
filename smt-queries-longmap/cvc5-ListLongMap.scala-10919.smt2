; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127776 () Bool)

(assert start!127776)

(declare-fun b!1501668 () Bool)

(declare-fun res!1022749 () Bool)

(declare-fun e!840012 () Bool)

(assert (=> b!1501668 (=> (not res!1022749) (not e!840012))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(declare-datatypes ((array!100157 0))(
  ( (array!100158 (arr!48338 (Array (_ BitVec 32) (_ BitVec 64))) (size!48888 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100157)

(assert (=> b!1501668 (= res!1022749 (and (= (size!48888 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48888 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48888 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1501669 () Bool)

(declare-fun e!840013 () Bool)

(declare-fun e!840011 () Bool)

(assert (=> b!1501669 (= e!840013 (not e!840011))))

(declare-fun res!1022755 () Bool)

(assert (=> b!1501669 (=> res!1022755 e!840011)))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1501669 (= res!1022755 (or (bvslt mask!2661 #b00000000000000000000000000000000) (bvsge index!625 (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge vacantAfter!10 (bvadd #b00000000000000000000000000000001 mask!2661))))))

(declare-datatypes ((SeekEntryResult!12548 0))(
  ( (MissingZero!12548 (index!52584 (_ BitVec 32))) (Found!12548 (index!52585 (_ BitVec 32))) (Intermediate!12548 (undefined!13360 Bool) (index!52586 (_ BitVec 32)) (x!134246 (_ BitVec 32))) (Undefined!12548) (MissingVacant!12548 (index!52587 (_ BitVec 32))) )
))
(declare-fun lt!653236 () SeekEntryResult!12548)

(declare-fun x!647 () (_ BitVec 32))

(declare-fun lt!653234 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100157 (_ BitVec 32)) SeekEntryResult!12548)

(assert (=> b!1501669 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!653234 vacantAfter!10 (select (store (arr!48338 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) j!87) (array!100158 (store (arr!48338 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48888 a!2850)) mask!2661) lt!653236)))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-datatypes ((Unit!50250 0))(
  ( (Unit!50251) )
))
(declare-fun lt!653235 () Unit!50250)

(declare-fun lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 (array!100157 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50250)

(assert (=> b!1501669 (= lt!653235 (lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 a!2850 i!996 j!87 (bvadd #b00000000000000000000000000000001 x!647) lt!653234 vacantBefore!10 vacantAfter!10 mask!2661))))

(declare-fun b!1501670 () Bool)

(declare-fun res!1022747 () Bool)

(assert (=> b!1501670 (=> (not res!1022747) (not e!840012))))

(assert (=> b!1501670 (= res!1022747 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48888 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48888 a!2850)) (= (select (arr!48338 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48338 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48888 a!2850))))))

(declare-fun b!1501671 () Bool)

(declare-fun e!840009 () Bool)

(assert (=> b!1501671 (= e!840009 e!840013)))

(declare-fun res!1022745 () Bool)

(assert (=> b!1501671 (=> (not res!1022745) (not e!840013))))

(assert (=> b!1501671 (= res!1022745 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!653234 #b00000000000000000000000000000000) (bvslt lt!653234 (size!48888 a!2850))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1501671 (= lt!653234 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1501672 () Bool)

(declare-fun res!1022754 () Bool)

(assert (=> b!1501672 (=> (not res!1022754) (not e!840013))))

(assert (=> b!1501672 (= res!1022754 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!653234 vacantBefore!10 (select (arr!48338 a!2850) j!87) a!2850 mask!2661) lt!653236))))

(declare-fun b!1501673 () Bool)

(declare-fun res!1022750 () Bool)

(assert (=> b!1501673 (=> (not res!1022750) (not e!840009))))

(assert (=> b!1501673 (= res!1022750 (not (= (select (arr!48338 a!2850) index!625) (select (arr!48338 a!2850) j!87))))))

(declare-fun b!1501674 () Bool)

(declare-fun res!1022752 () Bool)

(assert (=> b!1501674 (=> (not res!1022752) (not e!840012))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1501674 (= res!1022752 (validKeyInArray!0 (select (arr!48338 a!2850) j!87)))))

(declare-fun b!1501675 () Bool)

(declare-fun res!1022744 () Bool)

(assert (=> b!1501675 (=> (not res!1022744) (not e!840012))))

(assert (=> b!1501675 (= res!1022744 (validKeyInArray!0 (select (arr!48338 a!2850) i!996)))))

(declare-fun b!1501676 () Bool)

(declare-fun res!1022748 () Bool)

(assert (=> b!1501676 (=> (not res!1022748) (not e!840012))))

(declare-datatypes ((List!34830 0))(
  ( (Nil!34827) (Cons!34826 (h!36223 (_ BitVec 64)) (t!49524 List!34830)) )
))
(declare-fun arrayNoDuplicates!0 (array!100157 (_ BitVec 32) List!34830) Bool)

(assert (=> b!1501676 (= res!1022748 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34827))))

(declare-fun b!1501677 () Bool)

(declare-fun res!1022746 () Bool)

(assert (=> b!1501677 (=> (not res!1022746) (not e!840012))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100157 (_ BitVec 32)) Bool)

(assert (=> b!1501677 (= res!1022746 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1501678 () Bool)

(assert (=> b!1501678 (= e!840011 (validKeyInArray!0 (select (store (arr!48338 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) j!87)))))

(declare-fun b!1501679 () Bool)

(assert (=> b!1501679 (= e!840012 e!840009)))

(declare-fun res!1022753 () Bool)

(assert (=> b!1501679 (=> (not res!1022753) (not e!840009))))

(assert (=> b!1501679 (= res!1022753 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48338 a!2850) j!87) a!2850 mask!2661) lt!653236))))

(assert (=> b!1501679 (= lt!653236 (Found!12548 j!87))))

(declare-fun res!1022751 () Bool)

(assert (=> start!127776 (=> (not res!1022751) (not e!840012))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127776 (= res!1022751 (validMask!0 mask!2661))))

(assert (=> start!127776 e!840012))

(assert (=> start!127776 true))

(declare-fun array_inv!37366 (array!100157) Bool)

(assert (=> start!127776 (array_inv!37366 a!2850)))

(assert (= (and start!127776 res!1022751) b!1501668))

(assert (= (and b!1501668 res!1022749) b!1501675))

(assert (= (and b!1501675 res!1022744) b!1501674))

(assert (= (and b!1501674 res!1022752) b!1501677))

(assert (= (and b!1501677 res!1022746) b!1501676))

(assert (= (and b!1501676 res!1022748) b!1501670))

(assert (= (and b!1501670 res!1022747) b!1501679))

(assert (= (and b!1501679 res!1022753) b!1501673))

(assert (= (and b!1501673 res!1022750) b!1501671))

(assert (= (and b!1501671 res!1022745) b!1501672))

(assert (= (and b!1501672 res!1022754) b!1501669))

(assert (= (and b!1501669 (not res!1022755)) b!1501678))

(declare-fun m!1384921 () Bool)

(assert (=> b!1501673 m!1384921))

(declare-fun m!1384923 () Bool)

(assert (=> b!1501673 m!1384923))

(declare-fun m!1384925 () Bool)

(assert (=> b!1501670 m!1384925))

(declare-fun m!1384927 () Bool)

(assert (=> b!1501670 m!1384927))

(declare-fun m!1384929 () Bool)

(assert (=> b!1501670 m!1384929))

(declare-fun m!1384931 () Bool)

(assert (=> b!1501676 m!1384931))

(assert (=> b!1501669 m!1384927))

(declare-fun m!1384933 () Bool)

(assert (=> b!1501669 m!1384933))

(assert (=> b!1501669 m!1384933))

(declare-fun m!1384935 () Bool)

(assert (=> b!1501669 m!1384935))

(declare-fun m!1384937 () Bool)

(assert (=> b!1501669 m!1384937))

(assert (=> b!1501674 m!1384923))

(assert (=> b!1501674 m!1384923))

(declare-fun m!1384939 () Bool)

(assert (=> b!1501674 m!1384939))

(assert (=> b!1501678 m!1384927))

(assert (=> b!1501678 m!1384933))

(assert (=> b!1501678 m!1384933))

(declare-fun m!1384941 () Bool)

(assert (=> b!1501678 m!1384941))

(declare-fun m!1384943 () Bool)

(assert (=> b!1501671 m!1384943))

(assert (=> b!1501679 m!1384923))

(assert (=> b!1501679 m!1384923))

(declare-fun m!1384945 () Bool)

(assert (=> b!1501679 m!1384945))

(assert (=> b!1501672 m!1384923))

(assert (=> b!1501672 m!1384923))

(declare-fun m!1384947 () Bool)

(assert (=> b!1501672 m!1384947))

(declare-fun m!1384949 () Bool)

(assert (=> start!127776 m!1384949))

(declare-fun m!1384951 () Bool)

(assert (=> start!127776 m!1384951))

(declare-fun m!1384953 () Bool)

(assert (=> b!1501677 m!1384953))

(declare-fun m!1384955 () Bool)

(assert (=> b!1501675 m!1384955))

(assert (=> b!1501675 m!1384955))

(declare-fun m!1384957 () Bool)

(assert (=> b!1501675 m!1384957))

(push 1)

