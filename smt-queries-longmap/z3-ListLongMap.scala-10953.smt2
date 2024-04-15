; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128126 () Bool)

(assert start!128126)

(declare-fun b!1504602 () Bool)

(declare-fun res!1025404 () Bool)

(declare-fun e!840964 () Bool)

(assert (=> b!1504602 (=> (not res!1025404) (not e!840964))))

(declare-datatypes ((array!100324 0))(
  ( (array!100325 (arr!48415 (Array (_ BitVec 32) (_ BitVec 64))) (size!48967 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100324)

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100324 (_ BitVec 32)) Bool)

(assert (=> b!1504602 (= res!1025404 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1504603 () Bool)

(declare-fun res!1025398 () Bool)

(assert (=> b!1504603 (=> (not res!1025398) (not e!840964))))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(assert (=> b!1504603 (= res!1025398 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48967 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48967 a!2850)) (= (select (arr!48415 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48415 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48967 a!2850))))))

(declare-fun b!1504604 () Bool)

(declare-fun res!1025406 () Bool)

(declare-fun e!840965 () Bool)

(assert (=> b!1504604 (=> (not res!1025406) (not e!840965))))

(declare-fun lt!653554 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12634 0))(
  ( (MissingZero!12634 (index!52928 (_ BitVec 32))) (Found!12634 (index!52929 (_ BitVec 32))) (Intermediate!12634 (undefined!13446 Bool) (index!52930 (_ BitVec 32)) (x!134622 (_ BitVec 32))) (Undefined!12634) (MissingVacant!12634 (index!52931 (_ BitVec 32))) )
))
(declare-fun lt!653555 () SeekEntryResult!12634)

(declare-fun j!87 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100324 (_ BitVec 32)) SeekEntryResult!12634)

(assert (=> b!1504604 (= res!1025406 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!653554 vacantBefore!10 (select (arr!48415 a!2850) j!87) a!2850 mask!2661) lt!653555))))

(declare-fun b!1504605 () Bool)

(declare-fun res!1025401 () Bool)

(assert (=> b!1504605 (=> (not res!1025401) (not e!840964))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1504605 (= res!1025401 (validKeyInArray!0 (select (arr!48415 a!2850) j!87)))))

(declare-fun res!1025399 () Bool)

(assert (=> start!128126 (=> (not res!1025399) (not e!840964))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128126 (= res!1025399 (validMask!0 mask!2661))))

(assert (=> start!128126 e!840964))

(assert (=> start!128126 true))

(declare-fun array_inv!37648 (array!100324) Bool)

(assert (=> start!128126 (array_inv!37648 a!2850)))

(declare-fun b!1504606 () Bool)

(declare-fun res!1025405 () Bool)

(assert (=> b!1504606 (=> (not res!1025405) (not e!840964))))

(assert (=> b!1504606 (= res!1025405 (validKeyInArray!0 (select (arr!48415 a!2850) i!996)))))

(declare-fun b!1504607 () Bool)

(declare-fun e!840966 () Bool)

(assert (=> b!1504607 (= e!840964 e!840966)))

(declare-fun res!1025403 () Bool)

(assert (=> b!1504607 (=> (not res!1025403) (not e!840966))))

(assert (=> b!1504607 (= res!1025403 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48415 a!2850) j!87) a!2850 mask!2661) lt!653555))))

(assert (=> b!1504607 (= lt!653555 (Found!12634 j!87))))

(declare-fun b!1504608 () Bool)

(declare-fun res!1025407 () Bool)

(assert (=> b!1504608 (=> (not res!1025407) (not e!840966))))

(assert (=> b!1504608 (= res!1025407 (not (= (select (arr!48415 a!2850) index!625) (select (arr!48415 a!2850) j!87))))))

(declare-fun b!1504609 () Bool)

(declare-fun res!1025408 () Bool)

(assert (=> b!1504609 (=> (not res!1025408) (not e!840964))))

(declare-datatypes ((List!34985 0))(
  ( (Nil!34982) (Cons!34981 (h!36379 (_ BitVec 64)) (t!49671 List!34985)) )
))
(declare-fun arrayNoDuplicates!0 (array!100324 (_ BitVec 32) List!34985) Bool)

(assert (=> b!1504609 (= res!1025408 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34982))))

(declare-fun b!1504610 () Bool)

(assert (=> b!1504610 (= e!840965 (not true))))

(assert (=> b!1504610 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!653554 vacantAfter!10 (select (store (arr!48415 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) j!87) (array!100325 (store (arr!48415 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48967 a!2850)) mask!2661) lt!653555)))

(declare-datatypes ((Unit!50113 0))(
  ( (Unit!50114) )
))
(declare-fun lt!653556 () Unit!50113)

(declare-fun lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 (array!100324 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50113)

(assert (=> b!1504610 (= lt!653556 (lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 a!2850 i!996 j!87 (bvadd #b00000000000000000000000000000001 x!647) lt!653554 vacantBefore!10 vacantAfter!10 mask!2661))))

(declare-fun b!1504611 () Bool)

(declare-fun res!1025402 () Bool)

(assert (=> b!1504611 (=> (not res!1025402) (not e!840964))))

(assert (=> b!1504611 (= res!1025402 (and (= (size!48967 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48967 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48967 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1504612 () Bool)

(assert (=> b!1504612 (= e!840966 e!840965)))

(declare-fun res!1025400 () Bool)

(assert (=> b!1504612 (=> (not res!1025400) (not e!840965))))

(assert (=> b!1504612 (= res!1025400 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!653554 #b00000000000000000000000000000000) (bvslt lt!653554 (size!48967 a!2850))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1504612 (= lt!653554 (nextIndex!0 index!625 x!647 mask!2661))))

(assert (= (and start!128126 res!1025399) b!1504611))

(assert (= (and b!1504611 res!1025402) b!1504606))

(assert (= (and b!1504606 res!1025405) b!1504605))

(assert (= (and b!1504605 res!1025401) b!1504602))

(assert (= (and b!1504602 res!1025404) b!1504609))

(assert (= (and b!1504609 res!1025408) b!1504603))

(assert (= (and b!1504603 res!1025398) b!1504607))

(assert (= (and b!1504607 res!1025403) b!1504608))

(assert (= (and b!1504608 res!1025407) b!1504612))

(assert (= (and b!1504612 res!1025400) b!1504604))

(assert (= (and b!1504604 res!1025406) b!1504610))

(declare-fun m!1387133 () Bool)

(assert (=> b!1504606 m!1387133))

(assert (=> b!1504606 m!1387133))

(declare-fun m!1387135 () Bool)

(assert (=> b!1504606 m!1387135))

(declare-fun m!1387137 () Bool)

(assert (=> b!1504608 m!1387137))

(declare-fun m!1387139 () Bool)

(assert (=> b!1504608 m!1387139))

(declare-fun m!1387141 () Bool)

(assert (=> b!1504609 m!1387141))

(declare-fun m!1387143 () Bool)

(assert (=> b!1504612 m!1387143))

(declare-fun m!1387145 () Bool)

(assert (=> start!128126 m!1387145))

(declare-fun m!1387147 () Bool)

(assert (=> start!128126 m!1387147))

(assert (=> b!1504605 m!1387139))

(assert (=> b!1504605 m!1387139))

(declare-fun m!1387149 () Bool)

(assert (=> b!1504605 m!1387149))

(declare-fun m!1387151 () Bool)

(assert (=> b!1504610 m!1387151))

(declare-fun m!1387153 () Bool)

(assert (=> b!1504610 m!1387153))

(assert (=> b!1504610 m!1387153))

(declare-fun m!1387155 () Bool)

(assert (=> b!1504610 m!1387155))

(declare-fun m!1387157 () Bool)

(assert (=> b!1504610 m!1387157))

(assert (=> b!1504607 m!1387139))

(assert (=> b!1504607 m!1387139))

(declare-fun m!1387159 () Bool)

(assert (=> b!1504607 m!1387159))

(declare-fun m!1387161 () Bool)

(assert (=> b!1504603 m!1387161))

(assert (=> b!1504603 m!1387151))

(declare-fun m!1387163 () Bool)

(assert (=> b!1504603 m!1387163))

(declare-fun m!1387165 () Bool)

(assert (=> b!1504602 m!1387165))

(assert (=> b!1504604 m!1387139))

(assert (=> b!1504604 m!1387139))

(declare-fun m!1387167 () Bool)

(assert (=> b!1504604 m!1387167))

(check-sat (not start!128126) (not b!1504609) (not b!1504610) (not b!1504605) (not b!1504612) (not b!1504602) (not b!1504607) (not b!1504606) (not b!1504604))
(check-sat)
