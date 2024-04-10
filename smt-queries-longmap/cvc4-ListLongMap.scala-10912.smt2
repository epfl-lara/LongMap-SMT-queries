; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127738 () Bool)

(assert start!127738)

(declare-fun b!1501039 () Bool)

(declare-fun res!1022125 () Bool)

(declare-fun e!839781 () Bool)

(assert (=> b!1501039 (=> (not res!1022125) (not e!839781))))

(declare-datatypes ((array!100119 0))(
  ( (array!100120 (arr!48319 (Array (_ BitVec 32) (_ BitVec 64))) (size!48869 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100119)

(declare-fun j!87 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1501039 (= res!1022125 (validKeyInArray!0 (select (arr!48319 a!2850) j!87)))))

(declare-fun b!1501040 () Bool)

(declare-fun res!1022116 () Bool)

(declare-fun e!839780 () Bool)

(assert (=> b!1501040 (=> (not res!1022116) (not e!839780))))

(declare-fun index!625 () (_ BitVec 32))

(assert (=> b!1501040 (= res!1022116 (not (= (select (arr!48319 a!2850) index!625) (select (arr!48319 a!2850) j!87))))))

(declare-fun b!1501042 () Bool)

(declare-fun e!839782 () Bool)

(assert (=> b!1501042 (= e!839782 (not true))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun lt!653064 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12529 0))(
  ( (MissingZero!12529 (index!52508 (_ BitVec 32))) (Found!12529 (index!52509 (_ BitVec 32))) (Intermediate!12529 (undefined!13341 Bool) (index!52510 (_ BitVec 32)) (x!134171 (_ BitVec 32))) (Undefined!12529) (MissingVacant!12529 (index!52511 (_ BitVec 32))) )
))
(declare-fun lt!653063 () SeekEntryResult!12529)

(declare-fun i!996 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100119 (_ BitVec 32)) SeekEntryResult!12529)

(assert (=> b!1501042 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!653064 vacantAfter!10 (select (store (arr!48319 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) j!87) (array!100120 (store (arr!48319 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48869 a!2850)) mask!2661) lt!653063)))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-datatypes ((Unit!50212 0))(
  ( (Unit!50213) )
))
(declare-fun lt!653065 () Unit!50212)

(declare-fun lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 (array!100119 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50212)

(assert (=> b!1501042 (= lt!653065 (lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 a!2850 i!996 j!87 (bvadd #b00000000000000000000000000000001 x!647) lt!653064 vacantBefore!10 vacantAfter!10 mask!2661))))

(declare-fun b!1501043 () Bool)

(declare-fun res!1022115 () Bool)

(assert (=> b!1501043 (=> (not res!1022115) (not e!839781))))

(assert (=> b!1501043 (= res!1022115 (and (= (size!48869 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48869 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48869 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1501044 () Bool)

(assert (=> b!1501044 (= e!839781 e!839780)))

(declare-fun res!1022119 () Bool)

(assert (=> b!1501044 (=> (not res!1022119) (not e!839780))))

(assert (=> b!1501044 (= res!1022119 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48319 a!2850) j!87) a!2850 mask!2661) lt!653063))))

(assert (=> b!1501044 (= lt!653063 (Found!12529 j!87))))

(declare-fun b!1501045 () Bool)

(assert (=> b!1501045 (= e!839780 e!839782)))

(declare-fun res!1022121 () Bool)

(assert (=> b!1501045 (=> (not res!1022121) (not e!839782))))

(assert (=> b!1501045 (= res!1022121 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!653064 #b00000000000000000000000000000000) (bvslt lt!653064 (size!48869 a!2850))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1501045 (= lt!653064 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1501041 () Bool)

(declare-fun res!1022120 () Bool)

(assert (=> b!1501041 (=> (not res!1022120) (not e!839781))))

(assert (=> b!1501041 (= res!1022120 (validKeyInArray!0 (select (arr!48319 a!2850) i!996)))))

(declare-fun res!1022124 () Bool)

(assert (=> start!127738 (=> (not res!1022124) (not e!839781))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127738 (= res!1022124 (validMask!0 mask!2661))))

(assert (=> start!127738 e!839781))

(assert (=> start!127738 true))

(declare-fun array_inv!37347 (array!100119) Bool)

(assert (=> start!127738 (array_inv!37347 a!2850)))

(declare-fun b!1501046 () Bool)

(declare-fun res!1022123 () Bool)

(assert (=> b!1501046 (=> (not res!1022123) (not e!839781))))

(declare-datatypes ((List!34811 0))(
  ( (Nil!34808) (Cons!34807 (h!36204 (_ BitVec 64)) (t!49505 List!34811)) )
))
(declare-fun arrayNoDuplicates!0 (array!100119 (_ BitVec 32) List!34811) Bool)

(assert (=> b!1501046 (= res!1022123 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34808))))

(declare-fun b!1501047 () Bool)

(declare-fun res!1022117 () Bool)

(assert (=> b!1501047 (=> (not res!1022117) (not e!839781))))

(assert (=> b!1501047 (= res!1022117 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48869 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48869 a!2850)) (= (select (arr!48319 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48319 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48869 a!2850))))))

(declare-fun b!1501048 () Bool)

(declare-fun res!1022122 () Bool)

(assert (=> b!1501048 (=> (not res!1022122) (not e!839782))))

(assert (=> b!1501048 (= res!1022122 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!653064 vacantBefore!10 (select (arr!48319 a!2850) j!87) a!2850 mask!2661) lt!653063))))

(declare-fun b!1501049 () Bool)

(declare-fun res!1022118 () Bool)

(assert (=> b!1501049 (=> (not res!1022118) (not e!839781))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100119 (_ BitVec 32)) Bool)

(assert (=> b!1501049 (= res!1022118 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(assert (= (and start!127738 res!1022124) b!1501043))

(assert (= (and b!1501043 res!1022115) b!1501041))

(assert (= (and b!1501041 res!1022120) b!1501039))

(assert (= (and b!1501039 res!1022125) b!1501049))

(assert (= (and b!1501049 res!1022118) b!1501046))

(assert (= (and b!1501046 res!1022123) b!1501047))

(assert (= (and b!1501047 res!1022117) b!1501044))

(assert (= (and b!1501044 res!1022119) b!1501040))

(assert (= (and b!1501040 res!1022116) b!1501045))

(assert (= (and b!1501045 res!1022121) b!1501048))

(assert (= (and b!1501048 res!1022122) b!1501042))

(declare-fun m!1384237 () Bool)

(assert (=> b!1501042 m!1384237))

(declare-fun m!1384239 () Bool)

(assert (=> b!1501042 m!1384239))

(assert (=> b!1501042 m!1384239))

(declare-fun m!1384241 () Bool)

(assert (=> b!1501042 m!1384241))

(declare-fun m!1384243 () Bool)

(assert (=> b!1501042 m!1384243))

(declare-fun m!1384245 () Bool)

(assert (=> start!127738 m!1384245))

(declare-fun m!1384247 () Bool)

(assert (=> start!127738 m!1384247))

(declare-fun m!1384249 () Bool)

(assert (=> b!1501040 m!1384249))

(declare-fun m!1384251 () Bool)

(assert (=> b!1501040 m!1384251))

(declare-fun m!1384253 () Bool)

(assert (=> b!1501049 m!1384253))

(declare-fun m!1384255 () Bool)

(assert (=> b!1501045 m!1384255))

(assert (=> b!1501048 m!1384251))

(assert (=> b!1501048 m!1384251))

(declare-fun m!1384257 () Bool)

(assert (=> b!1501048 m!1384257))

(assert (=> b!1501039 m!1384251))

(assert (=> b!1501039 m!1384251))

(declare-fun m!1384259 () Bool)

(assert (=> b!1501039 m!1384259))

(declare-fun m!1384261 () Bool)

(assert (=> b!1501041 m!1384261))

(assert (=> b!1501041 m!1384261))

(declare-fun m!1384263 () Bool)

(assert (=> b!1501041 m!1384263))

(declare-fun m!1384265 () Bool)

(assert (=> b!1501046 m!1384265))

(assert (=> b!1501044 m!1384251))

(assert (=> b!1501044 m!1384251))

(declare-fun m!1384267 () Bool)

(assert (=> b!1501044 m!1384267))

(declare-fun m!1384269 () Bool)

(assert (=> b!1501047 m!1384269))

(assert (=> b!1501047 m!1384237))

(declare-fun m!1384271 () Bool)

(assert (=> b!1501047 m!1384271))

(push 1)

(assert (not b!1501048))

(assert (not b!1501041))

(assert (not b!1501045))

(assert (not b!1501049))

(assert (not b!1501046))

