; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128170 () Bool)

(assert start!128170)

(declare-fun b!1504810 () Bool)

(declare-fun res!1025409 () Bool)

(declare-fun e!841129 () Bool)

(assert (=> b!1504810 (=> (not res!1025409) (not e!841129))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(declare-datatypes ((array!100368 0))(
  ( (array!100369 (arr!48436 (Array (_ BitVec 32) (_ BitVec 64))) (size!48986 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100368)

(assert (=> b!1504810 (= res!1025409 (and (= (size!48986 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48986 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48986 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1504811 () Bool)

(declare-fun res!1025408 () Bool)

(assert (=> b!1504811 (=> (not res!1025408) (not e!841129))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1504811 (= res!1025408 (validKeyInArray!0 (select (arr!48436 a!2850) i!996)))))

(declare-fun b!1504813 () Bool)

(declare-fun res!1025405 () Bool)

(declare-fun e!841132 () Bool)

(assert (=> b!1504813 (=> (not res!1025405) (not e!841132))))

(declare-fun index!625 () (_ BitVec 32))

(assert (=> b!1504813 (= res!1025405 (not (= (select (arr!48436 a!2850) index!625) (select (arr!48436 a!2850) j!87))))))

(declare-fun b!1504814 () Bool)

(declare-fun res!1025402 () Bool)

(assert (=> b!1504814 (=> (not res!1025402) (not e!841129))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100368 (_ BitVec 32)) Bool)

(assert (=> b!1504814 (= res!1025402 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1504815 () Bool)

(declare-fun res!1025406 () Bool)

(assert (=> b!1504815 (=> (not res!1025406) (not e!841129))))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1504815 (= res!1025406 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48986 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48986 a!2850)) (= (select (arr!48436 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48436 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48986 a!2850))))))

(declare-fun b!1504816 () Bool)

(declare-fun res!1025400 () Bool)

(declare-fun e!841131 () Bool)

(assert (=> b!1504816 (=> (not res!1025400) (not e!841131))))

(declare-datatypes ((SeekEntryResult!12634 0))(
  ( (MissingZero!12634 (index!52928 (_ BitVec 32))) (Found!12634 (index!52929 (_ BitVec 32))) (Intermediate!12634 (undefined!13446 Bool) (index!52930 (_ BitVec 32)) (x!134612 (_ BitVec 32))) (Undefined!12634) (MissingVacant!12634 (index!52931 (_ BitVec 32))) )
))
(declare-fun lt!653815 () SeekEntryResult!12634)

(declare-fun lt!653814 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100368 (_ BitVec 32)) SeekEntryResult!12634)

(assert (=> b!1504816 (= res!1025400 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!653814 vacantBefore!10 (select (arr!48436 a!2850) j!87) a!2850 mask!2661) lt!653815))))

(declare-fun b!1504817 () Bool)

(declare-fun res!1025403 () Bool)

(assert (=> b!1504817 (=> (not res!1025403) (not e!841129))))

(assert (=> b!1504817 (= res!1025403 (validKeyInArray!0 (select (arr!48436 a!2850) j!87)))))

(declare-fun b!1504818 () Bool)

(declare-fun res!1025404 () Bool)

(assert (=> b!1504818 (=> (not res!1025404) (not e!841129))))

(declare-datatypes ((List!34928 0))(
  ( (Nil!34925) (Cons!34924 (h!36321 (_ BitVec 64)) (t!49622 List!34928)) )
))
(declare-fun arrayNoDuplicates!0 (array!100368 (_ BitVec 32) List!34928) Bool)

(assert (=> b!1504818 (= res!1025404 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34925))))

(declare-fun b!1504819 () Bool)

(assert (=> b!1504819 (= e!841132 e!841131)))

(declare-fun res!1025410 () Bool)

(assert (=> b!1504819 (=> (not res!1025410) (not e!841131))))

(assert (=> b!1504819 (= res!1025410 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!653814 #b00000000000000000000000000000000) (bvslt lt!653814 (size!48986 a!2850))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1504819 (= lt!653814 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1504820 () Bool)

(assert (=> b!1504820 (= e!841129 e!841132)))

(declare-fun res!1025407 () Bool)

(assert (=> b!1504820 (=> (not res!1025407) (not e!841132))))

(assert (=> b!1504820 (= res!1025407 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48436 a!2850) j!87) a!2850 mask!2661) lt!653815))))

(assert (=> b!1504820 (= lt!653815 (Found!12634 j!87))))

(declare-fun b!1504812 () Bool)

(assert (=> b!1504812 (= e!841131 (bvsge (bvsub #b01111111111111111111111111111110 (bvadd #b00000000000000000000000000000001 x!647)) (bvsub #b01111111111111111111111111111110 x!647)))))

(declare-fun res!1025401 () Bool)

(assert (=> start!128170 (=> (not res!1025401) (not e!841129))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128170 (= res!1025401 (validMask!0 mask!2661))))

(assert (=> start!128170 e!841129))

(assert (=> start!128170 true))

(declare-fun array_inv!37464 (array!100368) Bool)

(assert (=> start!128170 (array_inv!37464 a!2850)))

(assert (= (and start!128170 res!1025401) b!1504810))

(assert (= (and b!1504810 res!1025409) b!1504811))

(assert (= (and b!1504811 res!1025408) b!1504817))

(assert (= (and b!1504817 res!1025403) b!1504814))

(assert (= (and b!1504814 res!1025402) b!1504818))

(assert (= (and b!1504818 res!1025404) b!1504815))

(assert (= (and b!1504815 res!1025406) b!1504820))

(assert (= (and b!1504820 res!1025407) b!1504813))

(assert (= (and b!1504813 res!1025405) b!1504819))

(assert (= (and b!1504819 res!1025410) b!1504816))

(assert (= (and b!1504816 res!1025400) b!1504812))

(declare-fun m!1387903 () Bool)

(assert (=> b!1504813 m!1387903))

(declare-fun m!1387905 () Bool)

(assert (=> b!1504813 m!1387905))

(declare-fun m!1387907 () Bool)

(assert (=> b!1504818 m!1387907))

(declare-fun m!1387909 () Bool)

(assert (=> b!1504819 m!1387909))

(declare-fun m!1387911 () Bool)

(assert (=> b!1504814 m!1387911))

(declare-fun m!1387913 () Bool)

(assert (=> start!128170 m!1387913))

(declare-fun m!1387915 () Bool)

(assert (=> start!128170 m!1387915))

(assert (=> b!1504820 m!1387905))

(assert (=> b!1504820 m!1387905))

(declare-fun m!1387917 () Bool)

(assert (=> b!1504820 m!1387917))

(assert (=> b!1504816 m!1387905))

(assert (=> b!1504816 m!1387905))

(declare-fun m!1387919 () Bool)

(assert (=> b!1504816 m!1387919))

(declare-fun m!1387921 () Bool)

(assert (=> b!1504815 m!1387921))

(declare-fun m!1387923 () Bool)

(assert (=> b!1504815 m!1387923))

(declare-fun m!1387925 () Bool)

(assert (=> b!1504815 m!1387925))

(declare-fun m!1387927 () Bool)

(assert (=> b!1504811 m!1387927))

(assert (=> b!1504811 m!1387927))

(declare-fun m!1387929 () Bool)

(assert (=> b!1504811 m!1387929))

(assert (=> b!1504817 m!1387905))

(assert (=> b!1504817 m!1387905))

(declare-fun m!1387931 () Bool)

(assert (=> b!1504817 m!1387931))

(push 1)

(assert (not b!1504811))

(assert (not b!1504817))

(assert (not b!1504819))

(assert (not b!1504814))

(assert (not b!1504818))

(assert (not b!1504820))

(assert (not start!128170))

(assert (not b!1504816))

(check-sat)

(pop 1)

(push 1)

(check-sat)

