; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127702 () Bool)

(assert start!127702)

(declare-fun b!1500889 () Bool)

(declare-fun res!1022162 () Bool)

(declare-fun e!839640 () Bool)

(assert (=> b!1500889 (=> (not res!1022162) (not e!839640))))

(declare-datatypes ((array!100077 0))(
  ( (array!100078 (arr!48299 (Array (_ BitVec 32) (_ BitVec 64))) (size!48851 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100077)

(declare-fun i!996 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1500889 (= res!1022162 (validKeyInArray!0 (select (arr!48299 a!2850) i!996)))))

(declare-fun b!1500890 () Bool)

(declare-fun e!839643 () Bool)

(declare-fun e!839641 () Bool)

(assert (=> b!1500890 (= e!839643 e!839641)))

(declare-fun res!1022154 () Bool)

(assert (=> b!1500890 (=> (not res!1022154) (not e!839641))))

(declare-fun lt!652830 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(assert (=> b!1500890 (= res!1022154 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!652830 #b00000000000000000000000000000000) (bvslt lt!652830 (size!48851 a!2850))))))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1500890 (= lt!652830 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1500891 () Bool)

(declare-fun res!1022153 () Bool)

(assert (=> b!1500891 (=> (not res!1022153) (not e!839643))))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1500891 (= res!1022153 (not (= (select (arr!48299 a!2850) index!625) (select (arr!48299 a!2850) j!87))))))

(declare-fun b!1500892 () Bool)

(declare-fun res!1022157 () Bool)

(assert (=> b!1500892 (=> (not res!1022157) (not e!839640))))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1500892 (= res!1022157 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48851 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48851 a!2850)) (= (select (arr!48299 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48299 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48851 a!2850))))))

(declare-fun b!1500893 () Bool)

(declare-fun res!1022161 () Bool)

(assert (=> b!1500893 (=> (not res!1022161) (not e!839640))))

(declare-datatypes ((List!34869 0))(
  ( (Nil!34866) (Cons!34865 (h!36263 (_ BitVec 64)) (t!49555 List!34869)) )
))
(declare-fun arrayNoDuplicates!0 (array!100077 (_ BitVec 32) List!34869) Bool)

(assert (=> b!1500893 (= res!1022161 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34866))))

(declare-fun b!1500894 () Bool)

(assert (=> b!1500894 (= e!839640 e!839643)))

(declare-fun res!1022155 () Bool)

(assert (=> b!1500894 (=> (not res!1022155) (not e!839643))))

(declare-datatypes ((SeekEntryResult!12530 0))(
  ( (MissingZero!12530 (index!52512 (_ BitVec 32))) (Found!12530 (index!52513 (_ BitVec 32))) (Intermediate!12530 (undefined!13342 Bool) (index!52514 (_ BitVec 32)) (x!134183 (_ BitVec 32))) (Undefined!12530) (MissingVacant!12530 (index!52515 (_ BitVec 32))) )
))
(declare-fun lt!652831 () SeekEntryResult!12530)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100077 (_ BitVec 32)) SeekEntryResult!12530)

(assert (=> b!1500894 (= res!1022155 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48299 a!2850) j!87) a!2850 mask!2661) lt!652831))))

(assert (=> b!1500894 (= lt!652831 (Found!12530 j!87))))

(declare-fun b!1500895 () Bool)

(assert (=> b!1500895 (= e!839641 (not true))))

(assert (=> b!1500895 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!652830 vacantAfter!10 (select (store (arr!48299 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) j!87) (array!100078 (store (arr!48299 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48851 a!2850)) mask!2661) lt!652831)))

(declare-datatypes ((Unit!50055 0))(
  ( (Unit!50056) )
))
(declare-fun lt!652829 () Unit!50055)

(declare-fun lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 (array!100077 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50055)

(assert (=> b!1500895 (= lt!652829 (lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 a!2850 i!996 j!87 (bvadd #b00000000000000000000000000000001 x!647) lt!652830 vacantBefore!10 vacantAfter!10 mask!2661))))

(declare-fun b!1500896 () Bool)

(declare-fun res!1022158 () Bool)

(assert (=> b!1500896 (=> (not res!1022158) (not e!839640))))

(assert (=> b!1500896 (= res!1022158 (validKeyInArray!0 (select (arr!48299 a!2850) j!87)))))

(declare-fun b!1500897 () Bool)

(declare-fun res!1022156 () Bool)

(assert (=> b!1500897 (=> (not res!1022156) (not e!839640))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100077 (_ BitVec 32)) Bool)

(assert (=> b!1500897 (= res!1022156 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1500898 () Bool)

(declare-fun res!1022160 () Bool)

(assert (=> b!1500898 (=> (not res!1022160) (not e!839641))))

(assert (=> b!1500898 (= res!1022160 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!652830 vacantBefore!10 (select (arr!48299 a!2850) j!87) a!2850 mask!2661) lt!652831))))

(declare-fun b!1500888 () Bool)

(declare-fun res!1022159 () Bool)

(assert (=> b!1500888 (=> (not res!1022159) (not e!839640))))

(assert (=> b!1500888 (= res!1022159 (and (= (size!48851 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48851 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48851 a!2850)) (not (= i!996 j!87))))))

(declare-fun res!1022152 () Bool)

(assert (=> start!127702 (=> (not res!1022152) (not e!839640))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127702 (= res!1022152 (validMask!0 mask!2661))))

(assert (=> start!127702 e!839640))

(assert (=> start!127702 true))

(declare-fun array_inv!37532 (array!100077) Bool)

(assert (=> start!127702 (array_inv!37532 a!2850)))

(assert (= (and start!127702 res!1022152) b!1500888))

(assert (= (and b!1500888 res!1022159) b!1500889))

(assert (= (and b!1500889 res!1022162) b!1500896))

(assert (= (and b!1500896 res!1022158) b!1500897))

(assert (= (and b!1500897 res!1022156) b!1500893))

(assert (= (and b!1500893 res!1022161) b!1500892))

(assert (= (and b!1500892 res!1022157) b!1500894))

(assert (= (and b!1500894 res!1022155) b!1500891))

(assert (= (and b!1500891 res!1022153) b!1500890))

(assert (= (and b!1500890 res!1022154) b!1500898))

(assert (= (and b!1500898 res!1022160) b!1500895))

(declare-fun m!1383547 () Bool)

(assert (=> b!1500893 m!1383547))

(declare-fun m!1383549 () Bool)

(assert (=> b!1500891 m!1383549))

(declare-fun m!1383551 () Bool)

(assert (=> b!1500891 m!1383551))

(declare-fun m!1383553 () Bool)

(assert (=> b!1500897 m!1383553))

(declare-fun m!1383555 () Bool)

(assert (=> b!1500895 m!1383555))

(declare-fun m!1383557 () Bool)

(assert (=> b!1500895 m!1383557))

(assert (=> b!1500895 m!1383557))

(declare-fun m!1383559 () Bool)

(assert (=> b!1500895 m!1383559))

(declare-fun m!1383561 () Bool)

(assert (=> b!1500895 m!1383561))

(declare-fun m!1383563 () Bool)

(assert (=> b!1500889 m!1383563))

(assert (=> b!1500889 m!1383563))

(declare-fun m!1383565 () Bool)

(assert (=> b!1500889 m!1383565))

(assert (=> b!1500894 m!1383551))

(assert (=> b!1500894 m!1383551))

(declare-fun m!1383567 () Bool)

(assert (=> b!1500894 m!1383567))

(assert (=> b!1500898 m!1383551))

(assert (=> b!1500898 m!1383551))

(declare-fun m!1383569 () Bool)

(assert (=> b!1500898 m!1383569))

(declare-fun m!1383571 () Bool)

(assert (=> b!1500892 m!1383571))

(assert (=> b!1500892 m!1383555))

(declare-fun m!1383573 () Bool)

(assert (=> b!1500892 m!1383573))

(assert (=> b!1500896 m!1383551))

(assert (=> b!1500896 m!1383551))

(declare-fun m!1383575 () Bool)

(assert (=> b!1500896 m!1383575))

(declare-fun m!1383577 () Bool)

(assert (=> start!127702 m!1383577))

(declare-fun m!1383579 () Bool)

(assert (=> start!127702 m!1383579))

(declare-fun m!1383581 () Bool)

(assert (=> b!1500890 m!1383581))

(push 1)

(assert (not b!1500889))

(assert (not b!1500894))

(assert (not b!1500893))

(assert (not b!1500895))

(assert (not start!127702))

(assert (not b!1500898))

(assert (not b!1500897))

(assert (not b!1500890))

(assert (not b!1500896))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

