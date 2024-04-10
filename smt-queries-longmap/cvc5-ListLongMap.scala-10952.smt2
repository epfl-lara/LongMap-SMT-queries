; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128172 () Bool)

(assert start!128172)

(declare-fun b!1504843 () Bool)

(declare-fun res!1025437 () Bool)

(declare-fun e!841141 () Bool)

(assert (=> b!1504843 (=> (not res!1025437) (not e!841141))))

(declare-datatypes ((array!100370 0))(
  ( (array!100371 (arr!48437 (Array (_ BitVec 32) (_ BitVec 64))) (size!48987 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100370)

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100370 (_ BitVec 32)) Bool)

(assert (=> b!1504843 (= res!1025437 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1504844 () Bool)

(declare-fun res!1025434 () Bool)

(assert (=> b!1504844 (=> (not res!1025434) (not e!841141))))

(declare-fun j!87 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1504844 (= res!1025434 (validKeyInArray!0 (select (arr!48437 a!2850) j!87)))))

(declare-fun b!1504845 () Bool)

(declare-fun res!1025439 () Bool)

(assert (=> b!1504845 (=> (not res!1025439) (not e!841141))))

(declare-fun i!996 () (_ BitVec 32))

(assert (=> b!1504845 (= res!1025439 (and (= (size!48987 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48987 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48987 a!2850)) (not (= i!996 j!87))))))

(declare-fun res!1025442 () Bool)

(assert (=> start!128172 (=> (not res!1025442) (not e!841141))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128172 (= res!1025442 (validMask!0 mask!2661))))

(assert (=> start!128172 e!841141))

(assert (=> start!128172 true))

(declare-fun array_inv!37465 (array!100370) Bool)

(assert (=> start!128172 (array_inv!37465 a!2850)))

(declare-fun b!1504846 () Bool)

(declare-fun res!1025438 () Bool)

(declare-fun e!841144 () Bool)

(assert (=> b!1504846 (=> (not res!1025438) (not e!841144))))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun lt!653822 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12635 0))(
  ( (MissingZero!12635 (index!52932 (_ BitVec 32))) (Found!12635 (index!52933 (_ BitVec 32))) (Intermediate!12635 (undefined!13447 Bool) (index!52934 (_ BitVec 32)) (x!134621 (_ BitVec 32))) (Undefined!12635) (MissingVacant!12635 (index!52935 (_ BitVec 32))) )
))
(declare-fun lt!653823 () SeekEntryResult!12635)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100370 (_ BitVec 32)) SeekEntryResult!12635)

(assert (=> b!1504846 (= res!1025438 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!653822 vacantBefore!10 (select (arr!48437 a!2850) j!87) a!2850 mask!2661) lt!653823))))

(declare-fun b!1504847 () Bool)

(declare-fun res!1025440 () Bool)

(assert (=> b!1504847 (=> (not res!1025440) (not e!841141))))

(declare-datatypes ((List!34929 0))(
  ( (Nil!34926) (Cons!34925 (h!36322 (_ BitVec 64)) (t!49623 List!34929)) )
))
(declare-fun arrayNoDuplicates!0 (array!100370 (_ BitVec 32) List!34929) Bool)

(assert (=> b!1504847 (= res!1025440 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34926))))

(declare-fun b!1504848 () Bool)

(declare-fun res!1025443 () Bool)

(assert (=> b!1504848 (=> (not res!1025443) (not e!841141))))

(assert (=> b!1504848 (= res!1025443 (validKeyInArray!0 (select (arr!48437 a!2850) i!996)))))

(declare-fun b!1504849 () Bool)

(declare-fun e!841142 () Bool)

(assert (=> b!1504849 (= e!841142 e!841144)))

(declare-fun res!1025435 () Bool)

(assert (=> b!1504849 (=> (not res!1025435) (not e!841144))))

(assert (=> b!1504849 (= res!1025435 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!653822 #b00000000000000000000000000000000) (bvslt lt!653822 (size!48987 a!2850))))))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1504849 (= lt!653822 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1504850 () Bool)

(declare-fun res!1025433 () Bool)

(assert (=> b!1504850 (=> (not res!1025433) (not e!841142))))

(assert (=> b!1504850 (= res!1025433 (not (= (select (arr!48437 a!2850) index!625) (select (arr!48437 a!2850) j!87))))))

(declare-fun b!1504851 () Bool)

(assert (=> b!1504851 (= e!841141 e!841142)))

(declare-fun res!1025436 () Bool)

(assert (=> b!1504851 (=> (not res!1025436) (not e!841142))))

(assert (=> b!1504851 (= res!1025436 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48437 a!2850) j!87) a!2850 mask!2661) lt!653823))))

(assert (=> b!1504851 (= lt!653823 (Found!12635 j!87))))

(declare-fun b!1504852 () Bool)

(assert (=> b!1504852 (= e!841144 (not true))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1504852 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!653822 vacantAfter!10 (select (store (arr!48437 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) j!87) (array!100371 (store (arr!48437 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48987 a!2850)) mask!2661) lt!653823)))

(declare-datatypes ((Unit!50276 0))(
  ( (Unit!50277) )
))
(declare-fun lt!653824 () Unit!50276)

(declare-fun lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 (array!100370 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50276)

(assert (=> b!1504852 (= lt!653824 (lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 a!2850 i!996 j!87 (bvadd #b00000000000000000000000000000001 x!647) lt!653822 vacantBefore!10 vacantAfter!10 mask!2661))))

(declare-fun b!1504853 () Bool)

(declare-fun res!1025441 () Bool)

(assert (=> b!1504853 (=> (not res!1025441) (not e!841141))))

(assert (=> b!1504853 (= res!1025441 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48987 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48987 a!2850)) (= (select (arr!48437 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48437 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48987 a!2850))))))

(assert (= (and start!128172 res!1025442) b!1504845))

(assert (= (and b!1504845 res!1025439) b!1504848))

(assert (= (and b!1504848 res!1025443) b!1504844))

(assert (= (and b!1504844 res!1025434) b!1504843))

(assert (= (and b!1504843 res!1025437) b!1504847))

(assert (= (and b!1504847 res!1025440) b!1504853))

(assert (= (and b!1504853 res!1025441) b!1504851))

(assert (= (and b!1504851 res!1025436) b!1504850))

(assert (= (and b!1504850 res!1025433) b!1504849))

(assert (= (and b!1504849 res!1025435) b!1504846))

(assert (= (and b!1504846 res!1025438) b!1504852))

(declare-fun m!1387933 () Bool)

(assert (=> b!1504848 m!1387933))

(assert (=> b!1504848 m!1387933))

(declare-fun m!1387935 () Bool)

(assert (=> b!1504848 m!1387935))

(declare-fun m!1387937 () Bool)

(assert (=> start!128172 m!1387937))

(declare-fun m!1387939 () Bool)

(assert (=> start!128172 m!1387939))

(declare-fun m!1387941 () Bool)

(assert (=> b!1504847 m!1387941))

(declare-fun m!1387943 () Bool)

(assert (=> b!1504851 m!1387943))

(assert (=> b!1504851 m!1387943))

(declare-fun m!1387945 () Bool)

(assert (=> b!1504851 m!1387945))

(declare-fun m!1387947 () Bool)

(assert (=> b!1504849 m!1387947))

(declare-fun m!1387949 () Bool)

(assert (=> b!1504853 m!1387949))

(declare-fun m!1387951 () Bool)

(assert (=> b!1504853 m!1387951))

(declare-fun m!1387953 () Bool)

(assert (=> b!1504853 m!1387953))

(declare-fun m!1387955 () Bool)

(assert (=> b!1504850 m!1387955))

(assert (=> b!1504850 m!1387943))

(declare-fun m!1387957 () Bool)

(assert (=> b!1504843 m!1387957))

(assert (=> b!1504852 m!1387951))

(declare-fun m!1387959 () Bool)

(assert (=> b!1504852 m!1387959))

(assert (=> b!1504852 m!1387959))

(declare-fun m!1387961 () Bool)

(assert (=> b!1504852 m!1387961))

(declare-fun m!1387963 () Bool)

(assert (=> b!1504852 m!1387963))

(assert (=> b!1504844 m!1387943))

(assert (=> b!1504844 m!1387943))

(declare-fun m!1387965 () Bool)

(assert (=> b!1504844 m!1387965))

(assert (=> b!1504846 m!1387943))

(assert (=> b!1504846 m!1387943))

(declare-fun m!1387967 () Bool)

(assert (=> b!1504846 m!1387967))

(push 1)

