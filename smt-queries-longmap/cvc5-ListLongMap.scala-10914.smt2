; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127746 () Bool)

(assert start!127746)

(declare-fun b!1501171 () Bool)

(declare-fun e!839828 () Bool)

(declare-fun e!839827 () Bool)

(assert (=> b!1501171 (= e!839828 e!839827)))

(declare-fun res!1022253 () Bool)

(assert (=> b!1501171 (=> (not res!1022253) (not e!839827))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-datatypes ((array!100127 0))(
  ( (array!100128 (arr!48323 (Array (_ BitVec 32) (_ BitVec 64))) (size!48873 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100127)

(declare-fun index!625 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12533 0))(
  ( (MissingZero!12533 (index!52524 (_ BitVec 32))) (Found!12533 (index!52525 (_ BitVec 32))) (Intermediate!12533 (undefined!13345 Bool) (index!52526 (_ BitVec 32)) (x!134191 (_ BitVec 32))) (Undefined!12533) (MissingVacant!12533 (index!52527 (_ BitVec 32))) )
))
(declare-fun lt!653099 () SeekEntryResult!12533)

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100127 (_ BitVec 32)) SeekEntryResult!12533)

(assert (=> b!1501171 (= res!1022253 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48323 a!2850) j!87) a!2850 mask!2661) lt!653099))))

(assert (=> b!1501171 (= lt!653099 (Found!12533 j!87))))

(declare-fun b!1501172 () Bool)

(declare-fun res!1022252 () Bool)

(assert (=> b!1501172 (=> (not res!1022252) (not e!839828))))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1501172 (= res!1022252 (validKeyInArray!0 (select (arr!48323 a!2850) i!996)))))

(declare-fun b!1501173 () Bool)

(declare-fun res!1022250 () Bool)

(assert (=> b!1501173 (=> (not res!1022250) (not e!839828))))

(assert (=> b!1501173 (= res!1022250 (validKeyInArray!0 (select (arr!48323 a!2850) j!87)))))

(declare-fun b!1501174 () Bool)

(declare-fun res!1022249 () Bool)

(assert (=> b!1501174 (=> (not res!1022249) (not e!839827))))

(assert (=> b!1501174 (= res!1022249 (not (= (select (arr!48323 a!2850) index!625) (select (arr!48323 a!2850) j!87))))))

(declare-fun b!1501175 () Bool)

(declare-fun res!1022248 () Bool)

(assert (=> b!1501175 (=> (not res!1022248) (not e!839828))))

(declare-datatypes ((List!34815 0))(
  ( (Nil!34812) (Cons!34811 (h!36208 (_ BitVec 64)) (t!49509 List!34815)) )
))
(declare-fun arrayNoDuplicates!0 (array!100127 (_ BitVec 32) List!34815) Bool)

(assert (=> b!1501175 (= res!1022248 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34812))))

(declare-fun b!1501176 () Bool)

(declare-fun res!1022257 () Bool)

(assert (=> b!1501176 (=> (not res!1022257) (not e!839828))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1501176 (= res!1022257 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48873 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48873 a!2850)) (= (select (arr!48323 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48323 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48873 a!2850))))))

(declare-fun b!1501177 () Bool)

(declare-fun e!839829 () Bool)

(assert (=> b!1501177 (= e!839829 (not true))))

(declare-fun lt!653101 () (_ BitVec 32))

(assert (=> b!1501177 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!653101 vacantAfter!10 (select (store (arr!48323 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) j!87) (array!100128 (store (arr!48323 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48873 a!2850)) mask!2661) lt!653099)))

(declare-datatypes ((Unit!50220 0))(
  ( (Unit!50221) )
))
(declare-fun lt!653100 () Unit!50220)

(declare-fun lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 (array!100127 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50220)

(assert (=> b!1501177 (= lt!653100 (lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 a!2850 i!996 j!87 (bvadd #b00000000000000000000000000000001 x!647) lt!653101 vacantBefore!10 vacantAfter!10 mask!2661))))

(declare-fun b!1501178 () Bool)

(declare-fun res!1022255 () Bool)

(assert (=> b!1501178 (=> (not res!1022255) (not e!839828))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100127 (_ BitVec 32)) Bool)

(assert (=> b!1501178 (= res!1022255 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun res!1022254 () Bool)

(assert (=> start!127746 (=> (not res!1022254) (not e!839828))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127746 (= res!1022254 (validMask!0 mask!2661))))

(assert (=> start!127746 e!839828))

(assert (=> start!127746 true))

(declare-fun array_inv!37351 (array!100127) Bool)

(assert (=> start!127746 (array_inv!37351 a!2850)))

(declare-fun b!1501179 () Bool)

(declare-fun res!1022256 () Bool)

(assert (=> b!1501179 (=> (not res!1022256) (not e!839828))))

(assert (=> b!1501179 (= res!1022256 (and (= (size!48873 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48873 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48873 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1501180 () Bool)

(assert (=> b!1501180 (= e!839827 e!839829)))

(declare-fun res!1022251 () Bool)

(assert (=> b!1501180 (=> (not res!1022251) (not e!839829))))

(assert (=> b!1501180 (= res!1022251 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!653101 #b00000000000000000000000000000000) (bvslt lt!653101 (size!48873 a!2850))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1501180 (= lt!653101 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1501181 () Bool)

(declare-fun res!1022247 () Bool)

(assert (=> b!1501181 (=> (not res!1022247) (not e!839829))))

(assert (=> b!1501181 (= res!1022247 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!653101 vacantBefore!10 (select (arr!48323 a!2850) j!87) a!2850 mask!2661) lt!653099))))

(assert (= (and start!127746 res!1022254) b!1501179))

(assert (= (and b!1501179 res!1022256) b!1501172))

(assert (= (and b!1501172 res!1022252) b!1501173))

(assert (= (and b!1501173 res!1022250) b!1501178))

(assert (= (and b!1501178 res!1022255) b!1501175))

(assert (= (and b!1501175 res!1022248) b!1501176))

(assert (= (and b!1501176 res!1022257) b!1501171))

(assert (= (and b!1501171 res!1022253) b!1501174))

(assert (= (and b!1501174 res!1022249) b!1501180))

(assert (= (and b!1501180 res!1022251) b!1501181))

(assert (= (and b!1501181 res!1022247) b!1501177))

(declare-fun m!1384381 () Bool)

(assert (=> b!1501181 m!1384381))

(assert (=> b!1501181 m!1384381))

(declare-fun m!1384383 () Bool)

(assert (=> b!1501181 m!1384383))

(declare-fun m!1384385 () Bool)

(assert (=> b!1501176 m!1384385))

(declare-fun m!1384387 () Bool)

(assert (=> b!1501176 m!1384387))

(declare-fun m!1384389 () Bool)

(assert (=> b!1501176 m!1384389))

(declare-fun m!1384391 () Bool)

(assert (=> b!1501172 m!1384391))

(assert (=> b!1501172 m!1384391))

(declare-fun m!1384393 () Bool)

(assert (=> b!1501172 m!1384393))

(declare-fun m!1384395 () Bool)

(assert (=> b!1501174 m!1384395))

(assert (=> b!1501174 m!1384381))

(assert (=> b!1501171 m!1384381))

(assert (=> b!1501171 m!1384381))

(declare-fun m!1384397 () Bool)

(assert (=> b!1501171 m!1384397))

(assert (=> b!1501177 m!1384387))

(declare-fun m!1384399 () Bool)

(assert (=> b!1501177 m!1384399))

(assert (=> b!1501177 m!1384399))

(declare-fun m!1384401 () Bool)

(assert (=> b!1501177 m!1384401))

(declare-fun m!1384403 () Bool)

(assert (=> b!1501177 m!1384403))

(declare-fun m!1384405 () Bool)

(assert (=> b!1501180 m!1384405))

(assert (=> b!1501173 m!1384381))

(assert (=> b!1501173 m!1384381))

(declare-fun m!1384407 () Bool)

(assert (=> b!1501173 m!1384407))

(declare-fun m!1384409 () Bool)

(assert (=> b!1501175 m!1384409))

(declare-fun m!1384411 () Bool)

(assert (=> start!127746 m!1384411))

(declare-fun m!1384413 () Bool)

(assert (=> start!127746 m!1384413))

(declare-fun m!1384415 () Bool)

(assert (=> b!1501178 m!1384415))

(push 1)

