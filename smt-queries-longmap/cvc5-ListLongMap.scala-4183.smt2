; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57014 () Bool)

(assert start!57014)

(declare-fun b!631243 () Bool)

(declare-fun res!408168 () Bool)

(declare-fun e!360914 () Bool)

(assert (=> b!631243 (=> (not res!408168) (not e!360914))))

(declare-datatypes ((array!38090 0))(
  ( (array!38091 (arr!18279 (Array (_ BitVec 32) (_ BitVec 64))) (size!18643 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38090)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38090 (_ BitVec 32)) Bool)

(assert (=> b!631243 (= res!408168 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!631244 () Bool)

(declare-fun res!408171 () Bool)

(assert (=> b!631244 (=> (not res!408171) (not e!360914))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!631244 (= res!408171 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18279 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!631245 () Bool)

(declare-datatypes ((Unit!21210 0))(
  ( (Unit!21211) )
))
(declare-fun e!360916 () Unit!21210)

(declare-fun Unit!21212 () Unit!21210)

(assert (=> b!631245 (= e!360916 Unit!21212)))

(declare-fun b!631246 () Bool)

(declare-fun res!408170 () Bool)

(declare-fun e!360912 () Bool)

(assert (=> b!631246 (=> (not res!408170) (not e!360912))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!631246 (= res!408170 (and (= (size!18643 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18643 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18643 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!631247 () Bool)

(assert (=> b!631247 (= e!360912 e!360914)))

(declare-fun res!408174 () Bool)

(assert (=> b!631247 (=> (not res!408174) (not e!360914))))

(declare-datatypes ((SeekEntryResult!6719 0))(
  ( (MissingZero!6719 (index!29166 (_ BitVec 32))) (Found!6719 (index!29167 (_ BitVec 32))) (Intermediate!6719 (undefined!7531 Bool) (index!29168 (_ BitVec 32)) (x!57905 (_ BitVec 32))) (Undefined!6719) (MissingVacant!6719 (index!29169 (_ BitVec 32))) )
))
(declare-fun lt!291626 () SeekEntryResult!6719)

(assert (=> b!631247 (= res!408174 (or (= lt!291626 (MissingZero!6719 i!1108)) (= lt!291626 (MissingVacant!6719 i!1108))))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38090 (_ BitVec 32)) SeekEntryResult!6719)

(assert (=> b!631247 (= lt!291626 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun res!408166 () Bool)

(assert (=> start!57014 (=> (not res!408166) (not e!360912))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57014 (= res!408166 (validMask!0 mask!3053))))

(assert (=> start!57014 e!360912))

(assert (=> start!57014 true))

(declare-fun array_inv!14075 (array!38090) Bool)

(assert (=> start!57014 (array_inv!14075 a!2986)))

(declare-fun b!631248 () Bool)

(declare-fun e!360913 () Bool)

(declare-fun lt!291627 () SeekEntryResult!6719)

(declare-fun lt!291630 () SeekEntryResult!6719)

(assert (=> b!631248 (= e!360913 (= lt!291627 lt!291630))))

(declare-fun b!631249 () Bool)

(declare-fun e!360918 () Bool)

(assert (=> b!631249 (= e!360918 (not true))))

(declare-fun lt!291625 () Unit!21210)

(assert (=> b!631249 (= lt!291625 e!360916)))

(declare-fun c!71906 () Bool)

(declare-fun lt!291628 () array!38090)

(declare-fun lt!291624 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38090 (_ BitVec 32)) SeekEntryResult!6719)

(assert (=> b!631249 (= c!71906 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!291624 lt!291628 mask!3053) Undefined!6719))))

(assert (=> b!631249 e!360913))

(declare-fun res!408167 () Bool)

(assert (=> b!631249 (=> (not res!408167) (not e!360913))))

(declare-fun lt!291631 () (_ BitVec 32))

(assert (=> b!631249 (= res!408167 (= lt!291630 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!291631 vacantSpotIndex!68 lt!291624 lt!291628 mask!3053)))))

(assert (=> b!631249 (= lt!291630 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!291631 vacantSpotIndex!68 (select (arr!18279 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!631249 (= lt!291624 (select (store (arr!18279 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!291629 () Unit!21210)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38090 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21210)

(assert (=> b!631249 (= lt!291629 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!291631 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!631249 (= lt!291631 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!631250 () Bool)

(declare-fun res!408172 () Bool)

(assert (=> b!631250 (=> (not res!408172) (not e!360912))))

(declare-fun arrayContainsKey!0 (array!38090 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!631250 (= res!408172 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!631251 () Bool)

(declare-fun Unit!21213 () Unit!21210)

(assert (=> b!631251 (= e!360916 Unit!21213)))

(assert (=> b!631251 false))

(declare-fun b!631252 () Bool)

(declare-fun res!408175 () Bool)

(assert (=> b!631252 (=> (not res!408175) (not e!360912))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!631252 (= res!408175 (validKeyInArray!0 (select (arr!18279 a!2986) j!136)))))

(declare-fun b!631253 () Bool)

(declare-fun res!408176 () Bool)

(assert (=> b!631253 (=> (not res!408176) (not e!360914))))

(declare-datatypes ((List!12320 0))(
  ( (Nil!12317) (Cons!12316 (h!13361 (_ BitVec 64)) (t!18548 List!12320)) )
))
(declare-fun arrayNoDuplicates!0 (array!38090 (_ BitVec 32) List!12320) Bool)

(assert (=> b!631253 (= res!408176 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12317))))

(declare-fun b!631254 () Bool)

(declare-fun e!360915 () Bool)

(assert (=> b!631254 (= e!360915 e!360918)))

(declare-fun res!408165 () Bool)

(assert (=> b!631254 (=> (not res!408165) (not e!360918))))

(assert (=> b!631254 (= res!408165 (and (= lt!291627 (Found!6719 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18279 a!2986) index!984) (select (arr!18279 a!2986) j!136))) (not (= (select (arr!18279 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!631254 (= lt!291627 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18279 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!631255 () Bool)

(declare-fun res!408169 () Bool)

(assert (=> b!631255 (=> (not res!408169) (not e!360912))))

(assert (=> b!631255 (= res!408169 (validKeyInArray!0 k!1786))))

(declare-fun b!631256 () Bool)

(assert (=> b!631256 (= e!360914 e!360915)))

(declare-fun res!408173 () Bool)

(assert (=> b!631256 (=> (not res!408173) (not e!360915))))

(assert (=> b!631256 (= res!408173 (= (select (store (arr!18279 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!631256 (= lt!291628 (array!38091 (store (arr!18279 a!2986) i!1108 k!1786) (size!18643 a!2986)))))

(assert (= (and start!57014 res!408166) b!631246))

(assert (= (and b!631246 res!408170) b!631252))

(assert (= (and b!631252 res!408175) b!631255))

(assert (= (and b!631255 res!408169) b!631250))

(assert (= (and b!631250 res!408172) b!631247))

(assert (= (and b!631247 res!408174) b!631243))

(assert (= (and b!631243 res!408168) b!631253))

(assert (= (and b!631253 res!408176) b!631244))

(assert (= (and b!631244 res!408171) b!631256))

(assert (= (and b!631256 res!408173) b!631254))

(assert (= (and b!631254 res!408165) b!631249))

(assert (= (and b!631249 res!408167) b!631248))

(assert (= (and b!631249 c!71906) b!631251))

(assert (= (and b!631249 (not c!71906)) b!631245))

(declare-fun m!606183 () Bool)

(assert (=> b!631249 m!606183))

(declare-fun m!606185 () Bool)

(assert (=> b!631249 m!606185))

(declare-fun m!606187 () Bool)

(assert (=> b!631249 m!606187))

(declare-fun m!606189 () Bool)

(assert (=> b!631249 m!606189))

(declare-fun m!606191 () Bool)

(assert (=> b!631249 m!606191))

(declare-fun m!606193 () Bool)

(assert (=> b!631249 m!606193))

(assert (=> b!631249 m!606189))

(declare-fun m!606195 () Bool)

(assert (=> b!631249 m!606195))

(declare-fun m!606197 () Bool)

(assert (=> b!631249 m!606197))

(declare-fun m!606199 () Bool)

(assert (=> start!57014 m!606199))

(declare-fun m!606201 () Bool)

(assert (=> start!57014 m!606201))

(declare-fun m!606203 () Bool)

(assert (=> b!631253 m!606203))

(declare-fun m!606205 () Bool)

(assert (=> b!631244 m!606205))

(assert (=> b!631256 m!606193))

(declare-fun m!606207 () Bool)

(assert (=> b!631256 m!606207))

(declare-fun m!606209 () Bool)

(assert (=> b!631247 m!606209))

(assert (=> b!631252 m!606189))

(assert (=> b!631252 m!606189))

(declare-fun m!606211 () Bool)

(assert (=> b!631252 m!606211))

(declare-fun m!606213 () Bool)

(assert (=> b!631255 m!606213))

(declare-fun m!606215 () Bool)

(assert (=> b!631250 m!606215))

(declare-fun m!606217 () Bool)

(assert (=> b!631243 m!606217))

(declare-fun m!606219 () Bool)

(assert (=> b!631254 m!606219))

(assert (=> b!631254 m!606189))

(assert (=> b!631254 m!606189))

(declare-fun m!606221 () Bool)

(assert (=> b!631254 m!606221))

(push 1)

