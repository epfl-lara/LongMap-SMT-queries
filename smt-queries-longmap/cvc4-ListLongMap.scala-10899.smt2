; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127660 () Bool)

(assert start!127660)

(declare-fun b!1499861 () Bool)

(declare-fun res!1020946 () Bool)

(declare-fun e!839421 () Bool)

(assert (=> b!1499861 (=> (not res!1020946) (not e!839421))))

(declare-datatypes ((array!100041 0))(
  ( (array!100042 (arr!48280 (Array (_ BitVec 32) (_ BitVec 64))) (size!48830 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100041)

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100041 (_ BitVec 32)) Bool)

(assert (=> b!1499861 (= res!1020946 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1499862 () Bool)

(declare-fun res!1020944 () Bool)

(assert (=> b!1499862 (=> (not res!1020944) (not e!839421))))

(declare-fun j!87 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1499862 (= res!1020944 (validKeyInArray!0 (select (arr!48280 a!2850) j!87)))))

(declare-fun b!1499863 () Bool)

(declare-fun e!839420 () Bool)

(assert (=> b!1499863 (= e!839420 false)))

(declare-datatypes ((SeekEntryResult!12490 0))(
  ( (MissingZero!12490 (index!52352 (_ BitVec 32))) (Found!12490 (index!52353 (_ BitVec 32))) (Intermediate!12490 (undefined!13302 Bool) (index!52354 (_ BitVec 32)) (x!134028 (_ BitVec 32))) (Undefined!12490) (MissingVacant!12490 (index!52355 (_ BitVec 32))) )
))
(declare-fun lt!652822 () SeekEntryResult!12490)

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun lt!652821 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100041 (_ BitVec 32)) SeekEntryResult!12490)

(assert (=> b!1499863 (= lt!652822 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!652821 vacantBefore!10 (select (arr!48280 a!2850) j!87) a!2850 mask!2661))))

(declare-fun b!1499864 () Bool)

(declare-fun res!1020938 () Bool)

(assert (=> b!1499864 (=> (not res!1020938) (not e!839421))))

(declare-fun i!996 () (_ BitVec 32))

(assert (=> b!1499864 (= res!1020938 (validKeyInArray!0 (select (arr!48280 a!2850) i!996)))))

(declare-fun b!1499865 () Bool)

(declare-fun res!1020945 () Bool)

(assert (=> b!1499865 (=> (not res!1020945) (not e!839421))))

(declare-fun index!625 () (_ BitVec 32))

(assert (=> b!1499865 (= res!1020945 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48280 a!2850) j!87) a!2850 mask!2661) (Found!12490 j!87)))))

(declare-fun b!1499866 () Bool)

(declare-fun res!1020941 () Bool)

(assert (=> b!1499866 (=> (not res!1020941) (not e!839421))))

(assert (=> b!1499866 (= res!1020941 (not (= (select (arr!48280 a!2850) index!625) (select (arr!48280 a!2850) j!87))))))

(declare-fun b!1499867 () Bool)

(declare-fun res!1020939 () Bool)

(assert (=> b!1499867 (=> (not res!1020939) (not e!839421))))

(declare-datatypes ((List!34772 0))(
  ( (Nil!34769) (Cons!34768 (h!36165 (_ BitVec 64)) (t!49466 List!34772)) )
))
(declare-fun arrayNoDuplicates!0 (array!100041 (_ BitVec 32) List!34772) Bool)

(assert (=> b!1499867 (= res!1020939 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34769))))

(declare-fun b!1499868 () Bool)

(declare-fun res!1020940 () Bool)

(assert (=> b!1499868 (=> (not res!1020940) (not e!839421))))

(assert (=> b!1499868 (= res!1020940 (and (= (size!48830 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48830 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48830 a!2850)) (not (= i!996 j!87))))))

(declare-fun res!1020943 () Bool)

(assert (=> start!127660 (=> (not res!1020943) (not e!839421))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127660 (= res!1020943 (validMask!0 mask!2661))))

(assert (=> start!127660 e!839421))

(assert (=> start!127660 true))

(declare-fun array_inv!37308 (array!100041) Bool)

(assert (=> start!127660 (array_inv!37308 a!2850)))

(declare-fun b!1499869 () Bool)

(declare-fun res!1020942 () Bool)

(assert (=> b!1499869 (=> (not res!1020942) (not e!839421))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1499869 (= res!1020942 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48830 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48830 a!2850)) (= (select (arr!48280 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48280 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48830 a!2850))))))

(declare-fun b!1499870 () Bool)

(assert (=> b!1499870 (= e!839421 e!839420)))

(declare-fun res!1020937 () Bool)

(assert (=> b!1499870 (=> (not res!1020937) (not e!839420))))

(assert (=> b!1499870 (= res!1020937 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!652821 #b00000000000000000000000000000000) (bvslt lt!652821 (size!48830 a!2850))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1499870 (= lt!652821 (nextIndex!0 index!625 x!647 mask!2661))))

(assert (= (and start!127660 res!1020943) b!1499868))

(assert (= (and b!1499868 res!1020940) b!1499864))

(assert (= (and b!1499864 res!1020938) b!1499862))

(assert (= (and b!1499862 res!1020944) b!1499861))

(assert (= (and b!1499861 res!1020946) b!1499867))

(assert (= (and b!1499867 res!1020939) b!1499869))

(assert (= (and b!1499869 res!1020942) b!1499865))

(assert (= (and b!1499865 res!1020945) b!1499866))

(assert (= (and b!1499866 res!1020941) b!1499870))

(assert (= (and b!1499870 res!1020937) b!1499863))

(declare-fun m!1383055 () Bool)

(assert (=> b!1499869 m!1383055))

(declare-fun m!1383057 () Bool)

(assert (=> b!1499869 m!1383057))

(declare-fun m!1383059 () Bool)

(assert (=> b!1499869 m!1383059))

(declare-fun m!1383061 () Bool)

(assert (=> b!1499862 m!1383061))

(assert (=> b!1499862 m!1383061))

(declare-fun m!1383063 () Bool)

(assert (=> b!1499862 m!1383063))

(assert (=> b!1499865 m!1383061))

(assert (=> b!1499865 m!1383061))

(declare-fun m!1383065 () Bool)

(assert (=> b!1499865 m!1383065))

(declare-fun m!1383067 () Bool)

(assert (=> start!127660 m!1383067))

(declare-fun m!1383069 () Bool)

(assert (=> start!127660 m!1383069))

(declare-fun m!1383071 () Bool)

(assert (=> b!1499866 m!1383071))

(assert (=> b!1499866 m!1383061))

(declare-fun m!1383073 () Bool)

(assert (=> b!1499864 m!1383073))

(assert (=> b!1499864 m!1383073))

(declare-fun m!1383075 () Bool)

(assert (=> b!1499864 m!1383075))

(assert (=> b!1499863 m!1383061))

(assert (=> b!1499863 m!1383061))

(declare-fun m!1383077 () Bool)

(assert (=> b!1499863 m!1383077))

(declare-fun m!1383079 () Bool)

(assert (=> b!1499870 m!1383079))

(declare-fun m!1383081 () Bool)

(assert (=> b!1499867 m!1383081))

(declare-fun m!1383083 () Bool)

(assert (=> b!1499861 m!1383083))

(push 1)

(assert (not b!1499861))

(assert (not b!1499862))

(assert (not b!1499864))

(assert (not start!127660))

(assert (not b!1499865))

(assert (not b!1499863))

(assert (not b!1499867))

(assert (not b!1499870))

(check-sat)

(pop 1)

