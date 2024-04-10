; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53728 () Bool)

(assert start!53728)

(declare-fun b!585976 () Bool)

(declare-fun res!373793 () Bool)

(declare-fun e!335139 () Bool)

(assert (=> b!585976 (=> (not res!373793) (not e!335139))))

(declare-datatypes ((array!36629 0))(
  ( (array!36630 (arr!17589 (Array (_ BitVec 32) (_ BitVec 64))) (size!17953 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36629)

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36629 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!585976 (= res!373793 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!585977 () Bool)

(declare-fun res!373802 () Bool)

(declare-fun e!335137 () Bool)

(assert (=> b!585977 (=> (not res!373802) (not e!335137))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!585977 (= res!373802 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17589 a!2986) index!984) (select (arr!17589 a!2986) j!136))) (not (= (select (arr!17589 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!585978 () Bool)

(declare-fun res!373796 () Bool)

(assert (=> b!585978 (=> (not res!373796) (not e!335139))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!585978 (= res!373796 (validKeyInArray!0 (select (arr!17589 a!2986) j!136)))))

(declare-fun b!585979 () Bool)

(declare-fun res!373800 () Bool)

(assert (=> b!585979 (=> (not res!373800) (not e!335139))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!585979 (= res!373800 (and (= (size!17953 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17953 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17953 a!2986)) (not (= i!1108 j!136))))))

(declare-fun res!373798 () Bool)

(assert (=> start!53728 (=> (not res!373798) (not e!335139))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53728 (= res!373798 (validMask!0 mask!3053))))

(assert (=> start!53728 e!335139))

(assert (=> start!53728 true))

(declare-fun array_inv!13385 (array!36629) Bool)

(assert (=> start!53728 (array_inv!13385 a!2986)))

(declare-fun b!585980 () Bool)

(declare-fun res!373797 () Bool)

(assert (=> b!585980 (=> (not res!373797) (not e!335137))))

(declare-datatypes ((List!11630 0))(
  ( (Nil!11627) (Cons!11626 (h!12671 (_ BitVec 64)) (t!17858 List!11630)) )
))
(declare-fun arrayNoDuplicates!0 (array!36629 (_ BitVec 32) List!11630) Bool)

(assert (=> b!585980 (= res!373797 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11627))))

(declare-fun b!585981 () Bool)

(assert (=> b!585981 (= e!335139 e!335137)))

(declare-fun res!373795 () Bool)

(assert (=> b!585981 (=> (not res!373795) (not e!335137))))

(declare-datatypes ((SeekEntryResult!6029 0))(
  ( (MissingZero!6029 (index!26343 (_ BitVec 32))) (Found!6029 (index!26344 (_ BitVec 32))) (Intermediate!6029 (undefined!6841 Bool) (index!26345 (_ BitVec 32)) (x!55162 (_ BitVec 32))) (Undefined!6029) (MissingVacant!6029 (index!26346 (_ BitVec 32))) )
))
(declare-fun lt!265968 () SeekEntryResult!6029)

(assert (=> b!585981 (= res!373795 (or (= lt!265968 (MissingZero!6029 i!1108)) (= lt!265968 (MissingVacant!6029 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36629 (_ BitVec 32)) SeekEntryResult!6029)

(assert (=> b!585981 (= lt!265968 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!585982 () Bool)

(declare-fun res!373799 () Bool)

(assert (=> b!585982 (=> (not res!373799) (not e!335137))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36629 (_ BitVec 32)) Bool)

(assert (=> b!585982 (= res!373799 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!585983 () Bool)

(declare-fun res!373792 () Bool)

(assert (=> b!585983 (=> (not res!373792) (not e!335137))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36629 (_ BitVec 32)) SeekEntryResult!6029)

(assert (=> b!585983 (= res!373792 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17589 a!2986) j!136) a!2986 mask!3053) (Found!6029 j!136)))))

(declare-fun b!585984 () Bool)

(assert (=> b!585984 (= e!335137 (not true))))

(declare-fun lt!265967 () (_ BitVec 32))

(assert (=> b!585984 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265967 vacantSpotIndex!68 (select (arr!17589 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265967 vacantSpotIndex!68 (select (store (arr!17589 a!2986) i!1108 k!1786) j!136) (array!36630 (store (arr!17589 a!2986) i!1108 k!1786) (size!17953 a!2986)) mask!3053))))

(declare-datatypes ((Unit!18178 0))(
  ( (Unit!18179) )
))
(declare-fun lt!265969 () Unit!18178)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36629 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18178)

(assert (=> b!585984 (= lt!265969 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!265967 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!585984 (= lt!265967 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!585985 () Bool)

(declare-fun res!373794 () Bool)

(assert (=> b!585985 (=> (not res!373794) (not e!335137))))

(assert (=> b!585985 (= res!373794 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17589 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17589 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!585986 () Bool)

(declare-fun res!373801 () Bool)

(assert (=> b!585986 (=> (not res!373801) (not e!335139))))

(assert (=> b!585986 (= res!373801 (validKeyInArray!0 k!1786))))

(assert (= (and start!53728 res!373798) b!585979))

(assert (= (and b!585979 res!373800) b!585978))

(assert (= (and b!585978 res!373796) b!585986))

(assert (= (and b!585986 res!373801) b!585976))

(assert (= (and b!585976 res!373793) b!585981))

(assert (= (and b!585981 res!373795) b!585982))

(assert (= (and b!585982 res!373799) b!585980))

(assert (= (and b!585980 res!373797) b!585985))

(assert (= (and b!585985 res!373794) b!585983))

(assert (= (and b!585983 res!373792) b!585977))

(assert (= (and b!585977 res!373802) b!585984))

(declare-fun m!564265 () Bool)

(assert (=> b!585976 m!564265))

(declare-fun m!564267 () Bool)

(assert (=> b!585982 m!564267))

(declare-fun m!564269 () Bool)

(assert (=> start!53728 m!564269))

(declare-fun m!564271 () Bool)

(assert (=> start!53728 m!564271))

(declare-fun m!564273 () Bool)

(assert (=> b!585980 m!564273))

(declare-fun m!564275 () Bool)

(assert (=> b!585984 m!564275))

(declare-fun m!564277 () Bool)

(assert (=> b!585984 m!564277))

(declare-fun m!564279 () Bool)

(assert (=> b!585984 m!564279))

(declare-fun m!564281 () Bool)

(assert (=> b!585984 m!564281))

(declare-fun m!564283 () Bool)

(assert (=> b!585984 m!564283))

(declare-fun m!564285 () Bool)

(assert (=> b!585984 m!564285))

(assert (=> b!585984 m!564281))

(assert (=> b!585984 m!564277))

(declare-fun m!564287 () Bool)

(assert (=> b!585984 m!564287))

(declare-fun m!564289 () Bool)

(assert (=> b!585985 m!564289))

(assert (=> b!585985 m!564279))

(declare-fun m!564291 () Bool)

(assert (=> b!585985 m!564291))

(declare-fun m!564293 () Bool)

(assert (=> b!585977 m!564293))

(assert (=> b!585977 m!564281))

(declare-fun m!564295 () Bool)

(assert (=> b!585981 m!564295))

(assert (=> b!585978 m!564281))

(assert (=> b!585978 m!564281))

(declare-fun m!564297 () Bool)

(assert (=> b!585978 m!564297))

(assert (=> b!585983 m!564281))

(assert (=> b!585983 m!564281))

(declare-fun m!564299 () Bool)

(assert (=> b!585983 m!564299))

(declare-fun m!564301 () Bool)

(assert (=> b!585986 m!564301))

(push 1)

(assert (not b!585983))

(assert (not b!585978))

(assert (not b!585986))

(assert (not b!585980))

(assert (not b!585982))

(assert (not start!53728))

(assert (not b!585976))

(assert (not b!585984))

(assert (not b!585981))

(check-sat)

