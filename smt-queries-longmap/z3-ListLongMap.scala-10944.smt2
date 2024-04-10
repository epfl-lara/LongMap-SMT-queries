; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128042 () Bool)

(assert start!128042)

(declare-fun b!1503903 () Bool)

(declare-fun res!1024693 () Bool)

(declare-fun e!840774 () Bool)

(assert (=> b!1503903 (=> (not res!1024693) (not e!840774))))

(declare-datatypes ((array!100318 0))(
  ( (array!100319 (arr!48414 (Array (_ BitVec 32) (_ BitVec 64))) (size!48964 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100318)

(declare-fun j!87 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1503903 (= res!1024693 (validKeyInArray!0 (select (arr!48414 a!2850) j!87)))))

(declare-fun b!1503904 () Bool)

(declare-fun res!1024697 () Bool)

(assert (=> b!1503904 (=> (not res!1024697) (not e!840774))))

(declare-datatypes ((List!34906 0))(
  ( (Nil!34903) (Cons!34902 (h!36299 (_ BitVec 64)) (t!49600 List!34906)) )
))
(declare-fun arrayNoDuplicates!0 (array!100318 (_ BitVec 32) List!34906) Bool)

(assert (=> b!1503904 (= res!1024697 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34903))))

(declare-fun b!1503905 () Bool)

(declare-fun res!1024692 () Bool)

(assert (=> b!1503905 (=> (not res!1024692) (not e!840774))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100318 (_ BitVec 32)) Bool)

(assert (=> b!1503905 (= res!1024692 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1503906 () Bool)

(declare-fun res!1024698 () Bool)

(assert (=> b!1503906 (=> (not res!1024698) (not e!840774))))

(declare-fun i!996 () (_ BitVec 32))

(assert (=> b!1503906 (= res!1024698 (validKeyInArray!0 (select (arr!48414 a!2850) i!996)))))

(declare-fun res!1024696 () Bool)

(assert (=> start!128042 (=> (not res!1024696) (not e!840774))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128042 (= res!1024696 (validMask!0 mask!2661))))

(assert (=> start!128042 e!840774))

(assert (=> start!128042 true))

(declare-fun array_inv!37442 (array!100318) Bool)

(assert (=> start!128042 (array_inv!37442 a!2850)))

(declare-fun b!1503907 () Bool)

(declare-fun res!1024691 () Bool)

(assert (=> b!1503907 (=> (not res!1024691) (not e!840774))))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1503907 (= res!1024691 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48964 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48964 a!2850)) (= (select (arr!48414 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48414 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48964 a!2850))))))

(declare-fun b!1503908 () Bool)

(assert (=> b!1503908 (= e!840774 false)))

(declare-fun lt!653617 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1503908 (= lt!653617 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1503909 () Bool)

(declare-fun res!1024694 () Bool)

(assert (=> b!1503909 (=> (not res!1024694) (not e!840774))))

(assert (=> b!1503909 (= res!1024694 (and (= (size!48964 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48964 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48964 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1503910 () Bool)

(declare-fun res!1024699 () Bool)

(assert (=> b!1503910 (=> (not res!1024699) (not e!840774))))

(assert (=> b!1503910 (= res!1024699 (not (= (select (arr!48414 a!2850) index!625) (select (arr!48414 a!2850) j!87))))))

(declare-fun b!1503911 () Bool)

(declare-fun res!1024695 () Bool)

(assert (=> b!1503911 (=> (not res!1024695) (not e!840774))))

(declare-datatypes ((SeekEntryResult!12612 0))(
  ( (MissingZero!12612 (index!52840 (_ BitVec 32))) (Found!12612 (index!52841 (_ BitVec 32))) (Intermediate!12612 (undefined!13424 Bool) (index!52842 (_ BitVec 32)) (x!134522 (_ BitVec 32))) (Undefined!12612) (MissingVacant!12612 (index!52843 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100318 (_ BitVec 32)) SeekEntryResult!12612)

(assert (=> b!1503911 (= res!1024695 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48414 a!2850) j!87) a!2850 mask!2661) (Found!12612 j!87)))))

(assert (= (and start!128042 res!1024696) b!1503909))

(assert (= (and b!1503909 res!1024694) b!1503906))

(assert (= (and b!1503906 res!1024698) b!1503903))

(assert (= (and b!1503903 res!1024693) b!1503905))

(assert (= (and b!1503905 res!1024692) b!1503904))

(assert (= (and b!1503904 res!1024697) b!1503907))

(assert (= (and b!1503907 res!1024691) b!1503911))

(assert (= (and b!1503911 res!1024695) b!1503910))

(assert (= (and b!1503910 res!1024699) b!1503908))

(declare-fun m!1387103 () Bool)

(assert (=> b!1503910 m!1387103))

(declare-fun m!1387105 () Bool)

(assert (=> b!1503910 m!1387105))

(assert (=> b!1503911 m!1387105))

(assert (=> b!1503911 m!1387105))

(declare-fun m!1387107 () Bool)

(assert (=> b!1503911 m!1387107))

(declare-fun m!1387109 () Bool)

(assert (=> b!1503908 m!1387109))

(declare-fun m!1387111 () Bool)

(assert (=> b!1503904 m!1387111))

(assert (=> b!1503903 m!1387105))

(assert (=> b!1503903 m!1387105))

(declare-fun m!1387113 () Bool)

(assert (=> b!1503903 m!1387113))

(declare-fun m!1387115 () Bool)

(assert (=> start!128042 m!1387115))

(declare-fun m!1387117 () Bool)

(assert (=> start!128042 m!1387117))

(declare-fun m!1387119 () Bool)

(assert (=> b!1503906 m!1387119))

(assert (=> b!1503906 m!1387119))

(declare-fun m!1387121 () Bool)

(assert (=> b!1503906 m!1387121))

(declare-fun m!1387123 () Bool)

(assert (=> b!1503905 m!1387123))

(declare-fun m!1387125 () Bool)

(assert (=> b!1503907 m!1387125))

(declare-fun m!1387127 () Bool)

(assert (=> b!1503907 m!1387127))

(declare-fun m!1387129 () Bool)

(assert (=> b!1503907 m!1387129))

(check-sat (not b!1503904) (not b!1503903) (not b!1503911) (not b!1503905) (not b!1503906) (not start!128042) (not b!1503908))
