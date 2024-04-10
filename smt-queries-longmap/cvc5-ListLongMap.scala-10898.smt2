; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127650 () Bool)

(assert start!127650)

(declare-fun b!1499711 () Bool)

(declare-fun res!1020792 () Bool)

(declare-fun e!839377 () Bool)

(assert (=> b!1499711 (=> (not res!1020792) (not e!839377))))

(declare-datatypes ((array!100031 0))(
  ( (array!100032 (arr!48275 (Array (_ BitVec 32) (_ BitVec 64))) (size!48825 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100031)

(declare-datatypes ((List!34767 0))(
  ( (Nil!34764) (Cons!34763 (h!36160 (_ BitVec 64)) (t!49461 List!34767)) )
))
(declare-fun arrayNoDuplicates!0 (array!100031 (_ BitVec 32) List!34767) Bool)

(assert (=> b!1499711 (= res!1020792 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34764))))

(declare-fun b!1499712 () Bool)

(declare-fun res!1020788 () Bool)

(assert (=> b!1499712 (=> (not res!1020788) (not e!839377))))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1499712 (= res!1020788 (not (= (select (arr!48275 a!2850) index!625) (select (arr!48275 a!2850) j!87))))))

(declare-fun b!1499713 () Bool)

(declare-fun res!1020789 () Bool)

(assert (=> b!1499713 (=> (not res!1020789) (not e!839377))))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1499713 (= res!1020789 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48825 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48825 a!2850)) (= (select (arr!48275 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48275 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48825 a!2850))))))

(declare-fun b!1499715 () Bool)

(declare-fun res!1020787 () Bool)

(assert (=> b!1499715 (=> (not res!1020787) (not e!839377))))

(declare-fun mask!2661 () (_ BitVec 32))

(assert (=> b!1499715 (= res!1020787 (and (= (size!48825 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48825 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48825 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1499716 () Bool)

(declare-fun res!1020796 () Bool)

(assert (=> b!1499716 (=> (not res!1020796) (not e!839377))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100031 (_ BitVec 32)) Bool)

(assert (=> b!1499716 (= res!1020796 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1499717 () Bool)

(declare-fun e!839376 () Bool)

(assert (=> b!1499717 (= e!839376 false)))

(declare-datatypes ((SeekEntryResult!12485 0))(
  ( (MissingZero!12485 (index!52332 (_ BitVec 32))) (Found!12485 (index!52333 (_ BitVec 32))) (Intermediate!12485 (undefined!13297 Bool) (index!52334 (_ BitVec 32)) (x!134015 (_ BitVec 32))) (Undefined!12485) (MissingVacant!12485 (index!52335 (_ BitVec 32))) )
))
(declare-fun lt!652791 () SeekEntryResult!12485)

(declare-fun lt!652792 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100031 (_ BitVec 32)) SeekEntryResult!12485)

(assert (=> b!1499717 (= lt!652791 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!652792 vacantBefore!10 (select (arr!48275 a!2850) j!87) a!2850 mask!2661))))

(declare-fun b!1499718 () Bool)

(declare-fun res!1020793 () Bool)

(assert (=> b!1499718 (=> (not res!1020793) (not e!839377))))

(assert (=> b!1499718 (= res!1020793 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48275 a!2850) j!87) a!2850 mask!2661) (Found!12485 j!87)))))

(declare-fun res!1020790 () Bool)

(assert (=> start!127650 (=> (not res!1020790) (not e!839377))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127650 (= res!1020790 (validMask!0 mask!2661))))

(assert (=> start!127650 e!839377))

(assert (=> start!127650 true))

(declare-fun array_inv!37303 (array!100031) Bool)

(assert (=> start!127650 (array_inv!37303 a!2850)))

(declare-fun b!1499714 () Bool)

(declare-fun res!1020794 () Bool)

(assert (=> b!1499714 (=> (not res!1020794) (not e!839377))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1499714 (= res!1020794 (validKeyInArray!0 (select (arr!48275 a!2850) i!996)))))

(declare-fun b!1499719 () Bool)

(declare-fun res!1020791 () Bool)

(assert (=> b!1499719 (=> (not res!1020791) (not e!839377))))

(assert (=> b!1499719 (= res!1020791 (validKeyInArray!0 (select (arr!48275 a!2850) j!87)))))

(declare-fun b!1499720 () Bool)

(assert (=> b!1499720 (= e!839377 e!839376)))

(declare-fun res!1020795 () Bool)

(assert (=> b!1499720 (=> (not res!1020795) (not e!839376))))

(assert (=> b!1499720 (= res!1020795 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!652792 #b00000000000000000000000000000000) (bvslt lt!652792 (size!48825 a!2850))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1499720 (= lt!652792 (nextIndex!0 index!625 x!647 mask!2661))))

(assert (= (and start!127650 res!1020790) b!1499715))

(assert (= (and b!1499715 res!1020787) b!1499714))

(assert (= (and b!1499714 res!1020794) b!1499719))

(assert (= (and b!1499719 res!1020791) b!1499716))

(assert (= (and b!1499716 res!1020796) b!1499711))

(assert (= (and b!1499711 res!1020792) b!1499713))

(assert (= (and b!1499713 res!1020789) b!1499718))

(assert (= (and b!1499718 res!1020793) b!1499712))

(assert (= (and b!1499712 res!1020788) b!1499720))

(assert (= (and b!1499720 res!1020795) b!1499717))

(declare-fun m!1382905 () Bool)

(assert (=> b!1499718 m!1382905))

(assert (=> b!1499718 m!1382905))

(declare-fun m!1382907 () Bool)

(assert (=> b!1499718 m!1382907))

(declare-fun m!1382909 () Bool)

(assert (=> b!1499713 m!1382909))

(declare-fun m!1382911 () Bool)

(assert (=> b!1499713 m!1382911))

(declare-fun m!1382913 () Bool)

(assert (=> b!1499713 m!1382913))

(declare-fun m!1382915 () Bool)

(assert (=> b!1499712 m!1382915))

(assert (=> b!1499712 m!1382905))

(declare-fun m!1382917 () Bool)

(assert (=> b!1499711 m!1382917))

(declare-fun m!1382919 () Bool)

(assert (=> b!1499716 m!1382919))

(assert (=> b!1499719 m!1382905))

(assert (=> b!1499719 m!1382905))

(declare-fun m!1382921 () Bool)

(assert (=> b!1499719 m!1382921))

(declare-fun m!1382923 () Bool)

(assert (=> start!127650 m!1382923))

(declare-fun m!1382925 () Bool)

(assert (=> start!127650 m!1382925))

(declare-fun m!1382927 () Bool)

(assert (=> b!1499714 m!1382927))

(assert (=> b!1499714 m!1382927))

(declare-fun m!1382929 () Bool)

(assert (=> b!1499714 m!1382929))

(declare-fun m!1382931 () Bool)

(assert (=> b!1499720 m!1382931))

(assert (=> b!1499717 m!1382905))

(assert (=> b!1499717 m!1382905))

(declare-fun m!1382933 () Bool)

(assert (=> b!1499717 m!1382933))

(push 1)

