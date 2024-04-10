; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56908 () Bool)

(assert start!56908)

(declare-fun b!630064 () Bool)

(declare-fun res!407285 () Bool)

(declare-fun e!360297 () Bool)

(assert (=> b!630064 (=> (not res!407285) (not e!360297))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!38041 0))(
  ( (array!38042 (arr!18256 (Array (_ BitVec 32) (_ BitVec 64))) (size!18620 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38041)

(assert (=> b!630064 (= res!407285 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18256 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18256 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!630065 () Bool)

(declare-fun res!407280 () Bool)

(assert (=> b!630065 (=> (not res!407280) (not e!360297))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38041 (_ BitVec 32)) Bool)

(assert (=> b!630065 (= res!407280 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!630066 () Bool)

(declare-fun res!407278 () Bool)

(declare-fun e!360293 () Bool)

(assert (=> b!630066 (=> (not res!407278) (not e!360293))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!630066 (= res!407278 (and (= (size!18620 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18620 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18620 a!2986)) (not (= i!1108 j!136))))))

(declare-fun res!407284 () Bool)

(assert (=> start!56908 (=> (not res!407284) (not e!360293))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56908 (= res!407284 (validMask!0 mask!3053))))

(assert (=> start!56908 e!360293))

(assert (=> start!56908 true))

(declare-fun array_inv!14052 (array!38041) Bool)

(assert (=> start!56908 (array_inv!14052 a!2986)))

(declare-fun b!630067 () Bool)

(declare-fun e!360294 () Bool)

(assert (=> b!630067 (= e!360294 (not true))))

(declare-fun e!360295 () Bool)

(assert (=> b!630067 e!360295))

(declare-fun res!407279 () Bool)

(assert (=> b!630067 (=> (not res!407279) (not e!360295))))

(declare-fun lt!291005 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6696 0))(
  ( (MissingZero!6696 (index!29071 (_ BitVec 32))) (Found!6696 (index!29072 (_ BitVec 32))) (Intermediate!6696 (undefined!7508 Bool) (index!29073 (_ BitVec 32)) (x!57809 (_ BitVec 32))) (Undefined!6696) (MissingVacant!6696 (index!29074 (_ BitVec 32))) )
))
(declare-fun lt!291003 () SeekEntryResult!6696)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38041 (_ BitVec 32)) SeekEntryResult!6696)

(assert (=> b!630067 (= res!407279 (= lt!291003 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!291005 vacantSpotIndex!68 (select (store (arr!18256 a!2986) i!1108 k0!1786) j!136) (array!38042 (store (arr!18256 a!2986) i!1108 k0!1786) (size!18620 a!2986)) mask!3053)))))

(assert (=> b!630067 (= lt!291003 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!291005 vacantSpotIndex!68 (select (arr!18256 a!2986) j!136) a!2986 mask!3053))))

(declare-datatypes ((Unit!21134 0))(
  ( (Unit!21135) )
))
(declare-fun lt!291007 () Unit!21134)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38041 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21134)

(assert (=> b!630067 (= lt!291007 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!291005 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!630067 (= lt!291005 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!630068 () Bool)

(declare-fun res!407282 () Bool)

(assert (=> b!630068 (=> (not res!407282) (not e!360297))))

(declare-datatypes ((List!12297 0))(
  ( (Nil!12294) (Cons!12293 (h!13338 (_ BitVec 64)) (t!18525 List!12297)) )
))
(declare-fun arrayNoDuplicates!0 (array!38041 (_ BitVec 32) List!12297) Bool)

(assert (=> b!630068 (= res!407282 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12294))))

(declare-fun b!630069 () Bool)

(declare-fun res!407283 () Bool)

(assert (=> b!630069 (=> (not res!407283) (not e!360293))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!630069 (= res!407283 (validKeyInArray!0 k0!1786))))

(declare-fun b!630070 () Bool)

(assert (=> b!630070 (= e!360297 e!360294)))

(declare-fun res!407287 () Bool)

(assert (=> b!630070 (=> (not res!407287) (not e!360294))))

(declare-fun lt!291004 () SeekEntryResult!6696)

(assert (=> b!630070 (= res!407287 (and (= lt!291004 (Found!6696 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18256 a!2986) index!984) (select (arr!18256 a!2986) j!136))) (not (= (select (arr!18256 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!630070 (= lt!291004 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18256 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!630071 () Bool)

(assert (=> b!630071 (= e!360295 (= lt!291004 lt!291003))))

(declare-fun b!630072 () Bool)

(assert (=> b!630072 (= e!360293 e!360297)))

(declare-fun res!407281 () Bool)

(assert (=> b!630072 (=> (not res!407281) (not e!360297))))

(declare-fun lt!291006 () SeekEntryResult!6696)

(assert (=> b!630072 (= res!407281 (or (= lt!291006 (MissingZero!6696 i!1108)) (= lt!291006 (MissingVacant!6696 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38041 (_ BitVec 32)) SeekEntryResult!6696)

(assert (=> b!630072 (= lt!291006 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!630073 () Bool)

(declare-fun res!407286 () Bool)

(assert (=> b!630073 (=> (not res!407286) (not e!360293))))

(declare-fun arrayContainsKey!0 (array!38041 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!630073 (= res!407286 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!630074 () Bool)

(declare-fun res!407288 () Bool)

(assert (=> b!630074 (=> (not res!407288) (not e!360293))))

(assert (=> b!630074 (= res!407288 (validKeyInArray!0 (select (arr!18256 a!2986) j!136)))))

(assert (= (and start!56908 res!407284) b!630066))

(assert (= (and b!630066 res!407278) b!630074))

(assert (= (and b!630074 res!407288) b!630069))

(assert (= (and b!630069 res!407283) b!630073))

(assert (= (and b!630073 res!407286) b!630072))

(assert (= (and b!630072 res!407281) b!630065))

(assert (= (and b!630065 res!407280) b!630068))

(assert (= (and b!630068 res!407282) b!630064))

(assert (= (and b!630064 res!407285) b!630070))

(assert (= (and b!630070 res!407287) b!630067))

(assert (= (and b!630067 res!407279) b!630071))

(declare-fun m!605063 () Bool)

(assert (=> start!56908 m!605063))

(declare-fun m!605065 () Bool)

(assert (=> start!56908 m!605065))

(declare-fun m!605067 () Bool)

(assert (=> b!630073 m!605067))

(declare-fun m!605069 () Bool)

(assert (=> b!630067 m!605069))

(declare-fun m!605071 () Bool)

(assert (=> b!630067 m!605071))

(declare-fun m!605073 () Bool)

(assert (=> b!630067 m!605073))

(declare-fun m!605075 () Bool)

(assert (=> b!630067 m!605075))

(assert (=> b!630067 m!605073))

(declare-fun m!605077 () Bool)

(assert (=> b!630067 m!605077))

(declare-fun m!605079 () Bool)

(assert (=> b!630067 m!605079))

(assert (=> b!630067 m!605071))

(declare-fun m!605081 () Bool)

(assert (=> b!630067 m!605081))

(declare-fun m!605083 () Bool)

(assert (=> b!630064 m!605083))

(assert (=> b!630064 m!605075))

(declare-fun m!605085 () Bool)

(assert (=> b!630064 m!605085))

(declare-fun m!605087 () Bool)

(assert (=> b!630068 m!605087))

(assert (=> b!630074 m!605073))

(assert (=> b!630074 m!605073))

(declare-fun m!605089 () Bool)

(assert (=> b!630074 m!605089))

(declare-fun m!605091 () Bool)

(assert (=> b!630069 m!605091))

(declare-fun m!605093 () Bool)

(assert (=> b!630065 m!605093))

(declare-fun m!605095 () Bool)

(assert (=> b!630072 m!605095))

(declare-fun m!605097 () Bool)

(assert (=> b!630070 m!605097))

(assert (=> b!630070 m!605073))

(assert (=> b!630070 m!605073))

(declare-fun m!605099 () Bool)

(assert (=> b!630070 m!605099))

(check-sat (not start!56908) (not b!630072) (not b!630069) (not b!630070) (not b!630074) (not b!630065) (not b!630067) (not b!630073) (not b!630068))
(check-sat)
