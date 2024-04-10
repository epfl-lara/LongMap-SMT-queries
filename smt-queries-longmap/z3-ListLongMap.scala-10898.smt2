; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127652 () Bool)

(assert start!127652)

(declare-fun b!1499741 () Bool)

(declare-fun res!1020824 () Bool)

(declare-fun e!839384 () Bool)

(assert (=> b!1499741 (=> (not res!1020824) (not e!839384))))

(declare-datatypes ((array!100033 0))(
  ( (array!100034 (arr!48276 (Array (_ BitVec 32) (_ BitVec 64))) (size!48826 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100033)

(declare-fun i!996 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1499741 (= res!1020824 (validKeyInArray!0 (select (arr!48276 a!2850) i!996)))))

(declare-fun b!1499742 () Bool)

(declare-fun e!839385 () Bool)

(assert (=> b!1499742 (= e!839384 e!839385)))

(declare-fun res!1020826 () Bool)

(assert (=> b!1499742 (=> (not res!1020826) (not e!839385))))

(declare-fun lt!652797 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(assert (=> b!1499742 (= res!1020826 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!652797 #b00000000000000000000000000000000) (bvslt lt!652797 (size!48826 a!2850))))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1499742 (= lt!652797 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1499743 () Bool)

(declare-fun res!1020819 () Bool)

(assert (=> b!1499743 (=> (not res!1020819) (not e!839384))))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1499743 (= res!1020819 (not (= (select (arr!48276 a!2850) index!625) (select (arr!48276 a!2850) j!87))))))

(declare-fun b!1499744 () Bool)

(declare-fun res!1020817 () Bool)

(assert (=> b!1499744 (=> (not res!1020817) (not e!839384))))

(declare-datatypes ((List!34768 0))(
  ( (Nil!34765) (Cons!34764 (h!36161 (_ BitVec 64)) (t!49462 List!34768)) )
))
(declare-fun arrayNoDuplicates!0 (array!100033 (_ BitVec 32) List!34768) Bool)

(assert (=> b!1499744 (= res!1020817 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34765))))

(declare-fun b!1499745 () Bool)

(declare-fun res!1020825 () Bool)

(assert (=> b!1499745 (=> (not res!1020825) (not e!839384))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100033 (_ BitVec 32)) Bool)

(assert (=> b!1499745 (= res!1020825 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1499747 () Bool)

(declare-fun res!1020823 () Bool)

(assert (=> b!1499747 (=> (not res!1020823) (not e!839384))))

(assert (=> b!1499747 (= res!1020823 (validKeyInArray!0 (select (arr!48276 a!2850) j!87)))))

(declare-fun b!1499748 () Bool)

(declare-fun res!1020821 () Bool)

(assert (=> b!1499748 (=> (not res!1020821) (not e!839384))))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12486 0))(
  ( (MissingZero!12486 (index!52336 (_ BitVec 32))) (Found!12486 (index!52337 (_ BitVec 32))) (Intermediate!12486 (undefined!13298 Bool) (index!52338 (_ BitVec 32)) (x!134016 (_ BitVec 32))) (Undefined!12486) (MissingVacant!12486 (index!52339 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100033 (_ BitVec 32)) SeekEntryResult!12486)

(assert (=> b!1499748 (= res!1020821 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48276 a!2850) j!87) a!2850 mask!2661) (Found!12486 j!87)))))

(declare-fun b!1499749 () Bool)

(declare-fun res!1020818 () Bool)

(assert (=> b!1499749 (=> (not res!1020818) (not e!839384))))

(assert (=> b!1499749 (= res!1020818 (and (= (size!48826 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48826 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48826 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1499750 () Bool)

(declare-fun res!1020822 () Bool)

(assert (=> b!1499750 (=> (not res!1020822) (not e!839384))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1499750 (= res!1020822 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48826 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48826 a!2850)) (= (select (arr!48276 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48276 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48826 a!2850))))))

(declare-fun res!1020820 () Bool)

(assert (=> start!127652 (=> (not res!1020820) (not e!839384))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127652 (= res!1020820 (validMask!0 mask!2661))))

(assert (=> start!127652 e!839384))

(assert (=> start!127652 true))

(declare-fun array_inv!37304 (array!100033) Bool)

(assert (=> start!127652 (array_inv!37304 a!2850)))

(declare-fun b!1499746 () Bool)

(assert (=> b!1499746 (= e!839385 false)))

(declare-fun lt!652798 () SeekEntryResult!12486)

(assert (=> b!1499746 (= lt!652798 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!652797 vacantBefore!10 (select (arr!48276 a!2850) j!87) a!2850 mask!2661))))

(assert (= (and start!127652 res!1020820) b!1499749))

(assert (= (and b!1499749 res!1020818) b!1499741))

(assert (= (and b!1499741 res!1020824) b!1499747))

(assert (= (and b!1499747 res!1020823) b!1499745))

(assert (= (and b!1499745 res!1020825) b!1499744))

(assert (= (and b!1499744 res!1020817) b!1499750))

(assert (= (and b!1499750 res!1020822) b!1499748))

(assert (= (and b!1499748 res!1020821) b!1499743))

(assert (= (and b!1499743 res!1020819) b!1499742))

(assert (= (and b!1499742 res!1020826) b!1499746))

(declare-fun m!1382935 () Bool)

(assert (=> b!1499746 m!1382935))

(assert (=> b!1499746 m!1382935))

(declare-fun m!1382937 () Bool)

(assert (=> b!1499746 m!1382937))

(assert (=> b!1499747 m!1382935))

(assert (=> b!1499747 m!1382935))

(declare-fun m!1382939 () Bool)

(assert (=> b!1499747 m!1382939))

(declare-fun m!1382941 () Bool)

(assert (=> b!1499743 m!1382941))

(assert (=> b!1499743 m!1382935))

(declare-fun m!1382943 () Bool)

(assert (=> b!1499741 m!1382943))

(assert (=> b!1499741 m!1382943))

(declare-fun m!1382945 () Bool)

(assert (=> b!1499741 m!1382945))

(assert (=> b!1499748 m!1382935))

(assert (=> b!1499748 m!1382935))

(declare-fun m!1382947 () Bool)

(assert (=> b!1499748 m!1382947))

(declare-fun m!1382949 () Bool)

(assert (=> b!1499744 m!1382949))

(declare-fun m!1382951 () Bool)

(assert (=> start!127652 m!1382951))

(declare-fun m!1382953 () Bool)

(assert (=> start!127652 m!1382953))

(declare-fun m!1382955 () Bool)

(assert (=> b!1499750 m!1382955))

(declare-fun m!1382957 () Bool)

(assert (=> b!1499750 m!1382957))

(declare-fun m!1382959 () Bool)

(assert (=> b!1499750 m!1382959))

(declare-fun m!1382961 () Bool)

(assert (=> b!1499742 m!1382961))

(declare-fun m!1382963 () Bool)

(assert (=> b!1499745 m!1382963))

(check-sat (not b!1499746) (not b!1499744) (not b!1499748) (not b!1499741) (not b!1499747) (not start!127652) (not b!1499745) (not b!1499742))
(check-sat)
