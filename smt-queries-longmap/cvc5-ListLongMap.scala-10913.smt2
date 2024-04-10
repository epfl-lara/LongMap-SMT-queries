; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127740 () Bool)

(assert start!127740)

(declare-fun b!1501072 () Bool)

(declare-fun res!1022158 () Bool)

(declare-fun e!839791 () Bool)

(assert (=> b!1501072 (=> (not res!1022158) (not e!839791))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-datatypes ((array!100121 0))(
  ( (array!100122 (arr!48320 (Array (_ BitVec 32) (_ BitVec 64))) (size!48870 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100121)

(declare-fun i!996 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1501072 (= res!1022158 (and (= (size!48870 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48870 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48870 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1501073 () Bool)

(declare-fun res!1022151 () Bool)

(assert (=> b!1501073 (=> (not res!1022151) (not e!839791))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1501073 (= res!1022151 (validKeyInArray!0 (select (arr!48320 a!2850) j!87)))))

(declare-fun b!1501074 () Bool)

(declare-fun res!1022150 () Bool)

(assert (=> b!1501074 (=> (not res!1022150) (not e!839791))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100121 (_ BitVec 32)) Bool)

(assert (=> b!1501074 (= res!1022150 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1501075 () Bool)

(declare-fun res!1022148 () Bool)

(declare-fun e!839792 () Bool)

(assert (=> b!1501075 (=> (not res!1022148) (not e!839792))))

(declare-fun index!625 () (_ BitVec 32))

(assert (=> b!1501075 (= res!1022148 (not (= (select (arr!48320 a!2850) index!625) (select (arr!48320 a!2850) j!87))))))

(declare-fun res!1022156 () Bool)

(assert (=> start!127740 (=> (not res!1022156) (not e!839791))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127740 (= res!1022156 (validMask!0 mask!2661))))

(assert (=> start!127740 e!839791))

(assert (=> start!127740 true))

(declare-fun array_inv!37348 (array!100121) Bool)

(assert (=> start!127740 (array_inv!37348 a!2850)))

(declare-fun b!1501076 () Bool)

(declare-fun res!1022154 () Bool)

(assert (=> b!1501076 (=> (not res!1022154) (not e!839791))))

(declare-datatypes ((List!34812 0))(
  ( (Nil!34809) (Cons!34808 (h!36205 (_ BitVec 64)) (t!49506 List!34812)) )
))
(declare-fun arrayNoDuplicates!0 (array!100121 (_ BitVec 32) List!34812) Bool)

(assert (=> b!1501076 (= res!1022154 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34809))))

(declare-fun b!1501077 () Bool)

(declare-fun e!839794 () Bool)

(assert (=> b!1501077 (= e!839794 (not (bvsge mask!2661 #b00000000000000000000000000000000)))))

(declare-fun lt!653073 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12530 0))(
  ( (MissingZero!12530 (index!52512 (_ BitVec 32))) (Found!12530 (index!52513 (_ BitVec 32))) (Intermediate!12530 (undefined!13342 Bool) (index!52514 (_ BitVec 32)) (x!134180 (_ BitVec 32))) (Undefined!12530) (MissingVacant!12530 (index!52515 (_ BitVec 32))) )
))
(declare-fun lt!653074 () SeekEntryResult!12530)

(declare-fun x!647 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100121 (_ BitVec 32)) SeekEntryResult!12530)

(assert (=> b!1501077 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!653073 vacantAfter!10 (select (store (arr!48320 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) j!87) (array!100122 (store (arr!48320 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48870 a!2850)) mask!2661) lt!653074)))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-datatypes ((Unit!50214 0))(
  ( (Unit!50215) )
))
(declare-fun lt!653072 () Unit!50214)

(declare-fun lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 (array!100121 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50214)

(assert (=> b!1501077 (= lt!653072 (lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 a!2850 i!996 j!87 (bvadd #b00000000000000000000000000000001 x!647) lt!653073 vacantBefore!10 vacantAfter!10 mask!2661))))

(declare-fun b!1501078 () Bool)

(assert (=> b!1501078 (= e!839791 e!839792)))

(declare-fun res!1022149 () Bool)

(assert (=> b!1501078 (=> (not res!1022149) (not e!839792))))

(assert (=> b!1501078 (= res!1022149 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48320 a!2850) j!87) a!2850 mask!2661) lt!653074))))

(assert (=> b!1501078 (= lt!653074 (Found!12530 j!87))))

(declare-fun b!1501079 () Bool)

(declare-fun res!1022153 () Bool)

(assert (=> b!1501079 (=> (not res!1022153) (not e!839791))))

(assert (=> b!1501079 (= res!1022153 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48870 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48870 a!2850)) (= (select (arr!48320 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48320 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48870 a!2850))))))

(declare-fun b!1501080 () Bool)

(declare-fun res!1022157 () Bool)

(assert (=> b!1501080 (=> (not res!1022157) (not e!839794))))

(assert (=> b!1501080 (= res!1022157 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!653073 vacantBefore!10 (select (arr!48320 a!2850) j!87) a!2850 mask!2661) lt!653074))))

(declare-fun b!1501081 () Bool)

(declare-fun res!1022152 () Bool)

(assert (=> b!1501081 (=> (not res!1022152) (not e!839791))))

(assert (=> b!1501081 (= res!1022152 (validKeyInArray!0 (select (arr!48320 a!2850) i!996)))))

(declare-fun b!1501082 () Bool)

(assert (=> b!1501082 (= e!839792 e!839794)))

(declare-fun res!1022155 () Bool)

(assert (=> b!1501082 (=> (not res!1022155) (not e!839794))))

(assert (=> b!1501082 (= res!1022155 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!653073 #b00000000000000000000000000000000) (bvslt lt!653073 (size!48870 a!2850))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1501082 (= lt!653073 (nextIndex!0 index!625 x!647 mask!2661))))

(assert (= (and start!127740 res!1022156) b!1501072))

(assert (= (and b!1501072 res!1022158) b!1501081))

(assert (= (and b!1501081 res!1022152) b!1501073))

(assert (= (and b!1501073 res!1022151) b!1501074))

(assert (= (and b!1501074 res!1022150) b!1501076))

(assert (= (and b!1501076 res!1022154) b!1501079))

(assert (= (and b!1501079 res!1022153) b!1501078))

(assert (= (and b!1501078 res!1022149) b!1501075))

(assert (= (and b!1501075 res!1022148) b!1501082))

(assert (= (and b!1501082 res!1022155) b!1501080))

(assert (= (and b!1501080 res!1022157) b!1501077))

(declare-fun m!1384273 () Bool)

(assert (=> start!127740 m!1384273))

(declare-fun m!1384275 () Bool)

(assert (=> start!127740 m!1384275))

(declare-fun m!1384277 () Bool)

(assert (=> b!1501077 m!1384277))

(declare-fun m!1384279 () Bool)

(assert (=> b!1501077 m!1384279))

(assert (=> b!1501077 m!1384279))

(declare-fun m!1384281 () Bool)

(assert (=> b!1501077 m!1384281))

(declare-fun m!1384283 () Bool)

(assert (=> b!1501077 m!1384283))

(declare-fun m!1384285 () Bool)

(assert (=> b!1501080 m!1384285))

(assert (=> b!1501080 m!1384285))

(declare-fun m!1384287 () Bool)

(assert (=> b!1501080 m!1384287))

(assert (=> b!1501078 m!1384285))

(assert (=> b!1501078 m!1384285))

(declare-fun m!1384289 () Bool)

(assert (=> b!1501078 m!1384289))

(declare-fun m!1384291 () Bool)

(assert (=> b!1501079 m!1384291))

(assert (=> b!1501079 m!1384277))

(declare-fun m!1384293 () Bool)

(assert (=> b!1501079 m!1384293))

(declare-fun m!1384295 () Bool)

(assert (=> b!1501081 m!1384295))

(assert (=> b!1501081 m!1384295))

(declare-fun m!1384297 () Bool)

(assert (=> b!1501081 m!1384297))

(declare-fun m!1384299 () Bool)

(assert (=> b!1501075 m!1384299))

(assert (=> b!1501075 m!1384285))

(assert (=> b!1501073 m!1384285))

(assert (=> b!1501073 m!1384285))

(declare-fun m!1384301 () Bool)

(assert (=> b!1501073 m!1384301))

(declare-fun m!1384303 () Bool)

(assert (=> b!1501074 m!1384303))

(declare-fun m!1384305 () Bool)

(assert (=> b!1501082 m!1384305))

(declare-fun m!1384307 () Bool)

(assert (=> b!1501076 m!1384307))

(push 1)

