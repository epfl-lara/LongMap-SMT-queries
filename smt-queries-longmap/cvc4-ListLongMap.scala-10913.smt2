; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127744 () Bool)

(assert start!127744)

(declare-fun res!1022220 () Bool)

(declare-fun e!839817 () Bool)

(assert (=> start!127744 (=> (not res!1022220) (not e!839817))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127744 (= res!1022220 (validMask!0 mask!2661))))

(assert (=> start!127744 e!839817))

(assert (=> start!127744 true))

(declare-datatypes ((array!100125 0))(
  ( (array!100126 (arr!48322 (Array (_ BitVec 32) (_ BitVec 64))) (size!48872 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100125)

(declare-fun array_inv!37350 (array!100125) Bool)

(assert (=> start!127744 (array_inv!37350 a!2850)))

(declare-fun b!1501138 () Bool)

(declare-fun res!1022214 () Bool)

(assert (=> b!1501138 (=> (not res!1022214) (not e!839817))))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1501138 (= res!1022214 (and (= (size!48872 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48872 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48872 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1501139 () Bool)

(declare-fun res!1022217 () Bool)

(assert (=> b!1501139 (=> (not res!1022217) (not e!839817))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100125 (_ BitVec 32)) Bool)

(assert (=> b!1501139 (= res!1022217 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1501140 () Bool)

(declare-fun res!1022224 () Bool)

(assert (=> b!1501140 (=> (not res!1022224) (not e!839817))))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(declare-fun index!625 () (_ BitVec 32))

(assert (=> b!1501140 (= res!1022224 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48872 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48872 a!2850)) (= (select (arr!48322 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48322 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48872 a!2850))))))

(declare-fun b!1501141 () Bool)

(declare-fun res!1022215 () Bool)

(declare-fun e!839815 () Bool)

(assert (=> b!1501141 (=> (not res!1022215) (not e!839815))))

(assert (=> b!1501141 (= res!1022215 (not (= (select (arr!48322 a!2850) index!625) (select (arr!48322 a!2850) j!87))))))

(declare-fun b!1501142 () Bool)

(declare-fun res!1022223 () Bool)

(assert (=> b!1501142 (=> (not res!1022223) (not e!839817))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1501142 (= res!1022223 (validKeyInArray!0 (select (arr!48322 a!2850) j!87)))))

(declare-fun b!1501143 () Bool)

(declare-fun res!1022218 () Bool)

(assert (=> b!1501143 (=> (not res!1022218) (not e!839817))))

(assert (=> b!1501143 (= res!1022218 (validKeyInArray!0 (select (arr!48322 a!2850) i!996)))))

(declare-fun b!1501144 () Bool)

(declare-fun e!839816 () Bool)

(assert (=> b!1501144 (= e!839815 e!839816)))

(declare-fun res!1022216 () Bool)

(assert (=> b!1501144 (=> (not res!1022216) (not e!839816))))

(declare-fun lt!653092 () (_ BitVec 32))

(assert (=> b!1501144 (= res!1022216 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!653092 #b00000000000000000000000000000000) (bvslt lt!653092 (size!48872 a!2850))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1501144 (= lt!653092 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1501145 () Bool)

(declare-fun res!1022219 () Bool)

(assert (=> b!1501145 (=> (not res!1022219) (not e!839817))))

(declare-datatypes ((List!34814 0))(
  ( (Nil!34811) (Cons!34810 (h!36207 (_ BitVec 64)) (t!49508 List!34814)) )
))
(declare-fun arrayNoDuplicates!0 (array!100125 (_ BitVec 32) List!34814) Bool)

(assert (=> b!1501145 (= res!1022219 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34811))))

(declare-fun b!1501146 () Bool)

(declare-fun res!1022222 () Bool)

(assert (=> b!1501146 (=> (not res!1022222) (not e!839816))))

(declare-datatypes ((SeekEntryResult!12532 0))(
  ( (MissingZero!12532 (index!52520 (_ BitVec 32))) (Found!12532 (index!52521 (_ BitVec 32))) (Intermediate!12532 (undefined!13344 Bool) (index!52522 (_ BitVec 32)) (x!134182 (_ BitVec 32))) (Undefined!12532) (MissingVacant!12532 (index!52523 (_ BitVec 32))) )
))
(declare-fun lt!653090 () SeekEntryResult!12532)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100125 (_ BitVec 32)) SeekEntryResult!12532)

(assert (=> b!1501146 (= res!1022222 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!653092 vacantBefore!10 (select (arr!48322 a!2850) j!87) a!2850 mask!2661) lt!653090))))

(declare-fun b!1501147 () Bool)

(assert (=> b!1501147 (= e!839816 (not (bvsge mask!2661 #b00000000000000000000000000000000)))))

(assert (=> b!1501147 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!653092 vacantAfter!10 (select (store (arr!48322 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) j!87) (array!100126 (store (arr!48322 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48872 a!2850)) mask!2661) lt!653090)))

(declare-datatypes ((Unit!50218 0))(
  ( (Unit!50219) )
))
(declare-fun lt!653091 () Unit!50218)

(declare-fun lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 (array!100125 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50218)

(assert (=> b!1501147 (= lt!653091 (lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 a!2850 i!996 j!87 (bvadd #b00000000000000000000000000000001 x!647) lt!653092 vacantBefore!10 vacantAfter!10 mask!2661))))

(declare-fun b!1501148 () Bool)

(assert (=> b!1501148 (= e!839817 e!839815)))

(declare-fun res!1022221 () Bool)

(assert (=> b!1501148 (=> (not res!1022221) (not e!839815))))

(assert (=> b!1501148 (= res!1022221 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48322 a!2850) j!87) a!2850 mask!2661) lt!653090))))

(assert (=> b!1501148 (= lt!653090 (Found!12532 j!87))))

(assert (= (and start!127744 res!1022220) b!1501138))

(assert (= (and b!1501138 res!1022214) b!1501143))

(assert (= (and b!1501143 res!1022218) b!1501142))

(assert (= (and b!1501142 res!1022223) b!1501139))

(assert (= (and b!1501139 res!1022217) b!1501145))

(assert (= (and b!1501145 res!1022219) b!1501140))

(assert (= (and b!1501140 res!1022224) b!1501148))

(assert (= (and b!1501148 res!1022221) b!1501141))

(assert (= (and b!1501141 res!1022215) b!1501144))

(assert (= (and b!1501144 res!1022216) b!1501146))

(assert (= (and b!1501146 res!1022222) b!1501147))

(declare-fun m!1384345 () Bool)

(assert (=> b!1501142 m!1384345))

(assert (=> b!1501142 m!1384345))

(declare-fun m!1384347 () Bool)

(assert (=> b!1501142 m!1384347))

(assert (=> b!1501148 m!1384345))

(assert (=> b!1501148 m!1384345))

(declare-fun m!1384349 () Bool)

(assert (=> b!1501148 m!1384349))

(declare-fun m!1384351 () Bool)

(assert (=> b!1501143 m!1384351))

(assert (=> b!1501143 m!1384351))

(declare-fun m!1384353 () Bool)

(assert (=> b!1501143 m!1384353))

(declare-fun m!1384355 () Bool)

(assert (=> b!1501144 m!1384355))

(declare-fun m!1384357 () Bool)

(assert (=> b!1501145 m!1384357))

(assert (=> b!1501146 m!1384345))

(assert (=> b!1501146 m!1384345))

(declare-fun m!1384359 () Bool)

(assert (=> b!1501146 m!1384359))

(declare-fun m!1384361 () Bool)

(assert (=> start!127744 m!1384361))

(declare-fun m!1384363 () Bool)

(assert (=> start!127744 m!1384363))

(declare-fun m!1384365 () Bool)

(assert (=> b!1501139 m!1384365))

(declare-fun m!1384367 () Bool)

(assert (=> b!1501141 m!1384367))

(assert (=> b!1501141 m!1384345))

(declare-fun m!1384369 () Bool)

(assert (=> b!1501140 m!1384369))

(declare-fun m!1384371 () Bool)

(assert (=> b!1501140 m!1384371))

(declare-fun m!1384373 () Bool)

(assert (=> b!1501140 m!1384373))

(assert (=> b!1501147 m!1384371))

(declare-fun m!1384375 () Bool)

(assert (=> b!1501147 m!1384375))

(assert (=> b!1501147 m!1384375))

(declare-fun m!1384377 () Bool)

(assert (=> b!1501147 m!1384377))

(declare-fun m!1384379 () Bool)

(assert (=> b!1501147 m!1384379))

(push 1)

(assert (not b!1501143))

(assert (not b!1501145))

(assert (not start!127744))

(assert (not b!1501146))

(assert (not b!1501148))

(assert (not b!1501139))

(assert (not b!1501142))

(assert (not b!1501144))

(assert (not b!1501147))

(check-sat)

