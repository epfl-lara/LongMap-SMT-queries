; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57010 () Bool)

(assert start!57010)

(declare-fun b!631159 () Bool)

(declare-fun res!408100 () Bool)

(declare-fun e!360874 () Bool)

(assert (=> b!631159 (=> (not res!408100) (not e!360874))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!38086 0))(
  ( (array!38087 (arr!18277 (Array (_ BitVec 32) (_ BitVec 64))) (size!18641 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38086)

(assert (=> b!631159 (= res!408100 (and (= (size!18641 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18641 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18641 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!631161 () Bool)

(declare-fun res!408093 () Bool)

(declare-fun e!360875 () Bool)

(assert (=> b!631161 (=> (not res!408093) (not e!360875))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38086 (_ BitVec 32)) Bool)

(assert (=> b!631161 (= res!408093 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!631162 () Bool)

(declare-datatypes ((Unit!21202 0))(
  ( (Unit!21203) )
))
(declare-fun e!360870 () Unit!21202)

(declare-fun Unit!21204 () Unit!21202)

(assert (=> b!631162 (= e!360870 Unit!21204)))

(declare-fun b!631163 () Bool)

(declare-fun res!408101 () Bool)

(assert (=> b!631163 (=> (not res!408101) (not e!360874))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!631163 (= res!408101 (validKeyInArray!0 (select (arr!18277 a!2986) j!136)))))

(declare-fun b!631164 () Bool)

(declare-fun res!408104 () Bool)

(assert (=> b!631164 (=> (not res!408104) (not e!360875))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!631164 (= res!408104 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18277 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!631165 () Bool)

(declare-fun res!408097 () Bool)

(assert (=> b!631165 (=> (not res!408097) (not e!360874))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!38086 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!631165 (= res!408097 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-datatypes ((SeekEntryResult!6717 0))(
  ( (MissingZero!6717 (index!29158 (_ BitVec 32))) (Found!6717 (index!29159 (_ BitVec 32))) (Intermediate!6717 (undefined!7529 Bool) (index!29160 (_ BitVec 32)) (x!57895 (_ BitVec 32))) (Undefined!6717) (MissingVacant!6717 (index!29161 (_ BitVec 32))) )
))
(declare-fun lt!291578 () SeekEntryResult!6717)

(declare-fun b!631166 () Bool)

(declare-fun e!360871 () Bool)

(assert (=> b!631166 (= e!360871 (not (or (not (= lt!291578 (Found!6717 index!984))) (bvslt index!984 (size!18641 a!2986)))))))

(declare-fun lt!291573 () Unit!21202)

(assert (=> b!631166 (= lt!291573 e!360870)))

(declare-fun c!71900 () Bool)

(assert (=> b!631166 (= c!71900 (= lt!291578 Undefined!6717))))

(declare-fun lt!291575 () (_ BitVec 64))

(declare-fun lt!291579 () array!38086)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38086 (_ BitVec 32)) SeekEntryResult!6717)

(assert (=> b!631166 (= lt!291578 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!291575 lt!291579 mask!3053))))

(declare-fun e!360873 () Bool)

(assert (=> b!631166 e!360873))

(declare-fun res!408098 () Bool)

(assert (=> b!631166 (=> (not res!408098) (not e!360873))))

(declare-fun lt!291572 () (_ BitVec 32))

(declare-fun lt!291580 () SeekEntryResult!6717)

(assert (=> b!631166 (= res!408098 (= lt!291580 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!291572 vacantSpotIndex!68 lt!291575 lt!291579 mask!3053)))))

(assert (=> b!631166 (= lt!291580 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!291572 vacantSpotIndex!68 (select (arr!18277 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!631166 (= lt!291575 (select (store (arr!18277 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!291576 () Unit!21202)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38086 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21202)

(assert (=> b!631166 (= lt!291576 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!291572 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!631166 (= lt!291572 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!631167 () Bool)

(declare-fun res!408099 () Bool)

(assert (=> b!631167 (=> (not res!408099) (not e!360874))))

(assert (=> b!631167 (= res!408099 (validKeyInArray!0 k0!1786))))

(declare-fun b!631168 () Bool)

(declare-fun e!360876 () Bool)

(assert (=> b!631168 (= e!360876 e!360871)))

(declare-fun res!408096 () Bool)

(assert (=> b!631168 (=> (not res!408096) (not e!360871))))

(declare-fun lt!291574 () SeekEntryResult!6717)

(assert (=> b!631168 (= res!408096 (and (= lt!291574 (Found!6717 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18277 a!2986) index!984) (select (arr!18277 a!2986) j!136))) (not (= (select (arr!18277 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!631168 (= lt!291574 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18277 a!2986) j!136) a!2986 mask!3053))))

(declare-fun res!408102 () Bool)

(assert (=> start!57010 (=> (not res!408102) (not e!360874))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57010 (= res!408102 (validMask!0 mask!3053))))

(assert (=> start!57010 e!360874))

(assert (=> start!57010 true))

(declare-fun array_inv!14073 (array!38086) Bool)

(assert (=> start!57010 (array_inv!14073 a!2986)))

(declare-fun b!631160 () Bool)

(declare-fun Unit!21205 () Unit!21202)

(assert (=> b!631160 (= e!360870 Unit!21205)))

(assert (=> b!631160 false))

(declare-fun b!631169 () Bool)

(declare-fun res!408103 () Bool)

(assert (=> b!631169 (=> (not res!408103) (not e!360875))))

(declare-datatypes ((List!12318 0))(
  ( (Nil!12315) (Cons!12314 (h!13359 (_ BitVec 64)) (t!18546 List!12318)) )
))
(declare-fun arrayNoDuplicates!0 (array!38086 (_ BitVec 32) List!12318) Bool)

(assert (=> b!631169 (= res!408103 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12315))))

(declare-fun b!631170 () Bool)

(assert (=> b!631170 (= e!360874 e!360875)))

(declare-fun res!408095 () Bool)

(assert (=> b!631170 (=> (not res!408095) (not e!360875))))

(declare-fun lt!291577 () SeekEntryResult!6717)

(assert (=> b!631170 (= res!408095 (or (= lt!291577 (MissingZero!6717 i!1108)) (= lt!291577 (MissingVacant!6717 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38086 (_ BitVec 32)) SeekEntryResult!6717)

(assert (=> b!631170 (= lt!291577 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!631171 () Bool)

(assert (=> b!631171 (= e!360875 e!360876)))

(declare-fun res!408094 () Bool)

(assert (=> b!631171 (=> (not res!408094) (not e!360876))))

(assert (=> b!631171 (= res!408094 (= (select (store (arr!18277 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!631171 (= lt!291579 (array!38087 (store (arr!18277 a!2986) i!1108 k0!1786) (size!18641 a!2986)))))

(declare-fun b!631172 () Bool)

(assert (=> b!631172 (= e!360873 (= lt!291574 lt!291580))))

(assert (= (and start!57010 res!408102) b!631159))

(assert (= (and b!631159 res!408100) b!631163))

(assert (= (and b!631163 res!408101) b!631167))

(assert (= (and b!631167 res!408099) b!631165))

(assert (= (and b!631165 res!408097) b!631170))

(assert (= (and b!631170 res!408095) b!631161))

(assert (= (and b!631161 res!408093) b!631169))

(assert (= (and b!631169 res!408103) b!631164))

(assert (= (and b!631164 res!408104) b!631171))

(assert (= (and b!631171 res!408094) b!631168))

(assert (= (and b!631168 res!408096) b!631166))

(assert (= (and b!631166 res!408098) b!631172))

(assert (= (and b!631166 c!71900) b!631160))

(assert (= (and b!631166 (not c!71900)) b!631162))

(declare-fun m!606103 () Bool)

(assert (=> b!631164 m!606103))

(declare-fun m!606105 () Bool)

(assert (=> b!631171 m!606105))

(declare-fun m!606107 () Bool)

(assert (=> b!631171 m!606107))

(declare-fun m!606109 () Bool)

(assert (=> b!631161 m!606109))

(declare-fun m!606111 () Bool)

(assert (=> b!631165 m!606111))

(declare-fun m!606113 () Bool)

(assert (=> b!631169 m!606113))

(declare-fun m!606115 () Bool)

(assert (=> b!631168 m!606115))

(declare-fun m!606117 () Bool)

(assert (=> b!631168 m!606117))

(assert (=> b!631168 m!606117))

(declare-fun m!606119 () Bool)

(assert (=> b!631168 m!606119))

(declare-fun m!606121 () Bool)

(assert (=> b!631167 m!606121))

(declare-fun m!606123 () Bool)

(assert (=> b!631170 m!606123))

(declare-fun m!606125 () Bool)

(assert (=> b!631166 m!606125))

(assert (=> b!631166 m!606117))

(declare-fun m!606127 () Bool)

(assert (=> b!631166 m!606127))

(assert (=> b!631166 m!606117))

(assert (=> b!631166 m!606105))

(declare-fun m!606129 () Bool)

(assert (=> b!631166 m!606129))

(declare-fun m!606131 () Bool)

(assert (=> b!631166 m!606131))

(declare-fun m!606133 () Bool)

(assert (=> b!631166 m!606133))

(declare-fun m!606135 () Bool)

(assert (=> b!631166 m!606135))

(declare-fun m!606137 () Bool)

(assert (=> start!57010 m!606137))

(declare-fun m!606139 () Bool)

(assert (=> start!57010 m!606139))

(assert (=> b!631163 m!606117))

(assert (=> b!631163 m!606117))

(declare-fun m!606141 () Bool)

(assert (=> b!631163 m!606141))

(check-sat (not start!57010) (not b!631161) (not b!631170) (not b!631168) (not b!631163) (not b!631167) (not b!631169) (not b!631166) (not b!631165))
(check-sat)
