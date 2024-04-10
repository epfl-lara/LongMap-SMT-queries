; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56904 () Bool)

(assert start!56904)

(declare-fun b!629998 () Bool)

(declare-fun e!360267 () Bool)

(declare-fun e!360263 () Bool)

(assert (=> b!629998 (= e!360267 e!360263)))

(declare-fun res!407218 () Bool)

(assert (=> b!629998 (=> (not res!407218) (not e!360263))))

(declare-datatypes ((SeekEntryResult!6694 0))(
  ( (MissingZero!6694 (index!29063 (_ BitVec 32))) (Found!6694 (index!29064 (_ BitVec 32))) (Intermediate!6694 (undefined!7506 Bool) (index!29065 (_ BitVec 32)) (x!57799 (_ BitVec 32))) (Undefined!6694) (MissingVacant!6694 (index!29066 (_ BitVec 32))) )
))
(declare-fun lt!290976 () SeekEntryResult!6694)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!629998 (= res!407218 (or (= lt!290976 (MissingZero!6694 i!1108)) (= lt!290976 (MissingVacant!6694 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-datatypes ((array!38037 0))(
  ( (array!38038 (arr!18254 (Array (_ BitVec 32) (_ BitVec 64))) (size!18618 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38037)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38037 (_ BitVec 32)) SeekEntryResult!6694)

(assert (=> b!629998 (= lt!290976 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!629999 () Bool)

(declare-fun res!407215 () Bool)

(assert (=> b!629999 (=> (not res!407215) (not e!360267))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!629999 (= res!407215 (and (= (size!18618 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18618 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18618 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!630001 () Bool)

(declare-fun res!407216 () Bool)

(assert (=> b!630001 (=> (not res!407216) (not e!360267))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!630001 (= res!407216 (validKeyInArray!0 k!1786))))

(declare-fun b!630002 () Bool)

(declare-fun res!407219 () Bool)

(assert (=> b!630002 (=> (not res!407219) (not e!360267))))

(declare-fun arrayContainsKey!0 (array!38037 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!630002 (= res!407219 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!630003 () Bool)

(declare-fun res!407213 () Bool)

(assert (=> b!630003 (=> (not res!407213) (not e!360263))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!630003 (= res!407213 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18254 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18254 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!630004 () Bool)

(declare-fun res!407220 () Bool)

(assert (=> b!630004 (=> (not res!407220) (not e!360267))))

(assert (=> b!630004 (= res!407220 (validKeyInArray!0 (select (arr!18254 a!2986) j!136)))))

(declare-fun res!407214 () Bool)

(assert (=> start!56904 (=> (not res!407214) (not e!360267))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56904 (= res!407214 (validMask!0 mask!3053))))

(assert (=> start!56904 e!360267))

(assert (=> start!56904 true))

(declare-fun array_inv!14050 (array!38037) Bool)

(assert (=> start!56904 (array_inv!14050 a!2986)))

(declare-fun b!630000 () Bool)

(declare-fun res!407222 () Bool)

(assert (=> b!630000 (=> (not res!407222) (not e!360263))))

(declare-datatypes ((List!12295 0))(
  ( (Nil!12292) (Cons!12291 (h!13336 (_ BitVec 64)) (t!18523 List!12295)) )
))
(declare-fun arrayNoDuplicates!0 (array!38037 (_ BitVec 32) List!12295) Bool)

(assert (=> b!630000 (= res!407222 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12292))))

(declare-fun b!630005 () Bool)

(declare-fun e!360266 () Bool)

(assert (=> b!630005 (= e!360263 e!360266)))

(declare-fun res!407221 () Bool)

(assert (=> b!630005 (=> (not res!407221) (not e!360266))))

(declare-fun lt!290975 () SeekEntryResult!6694)

(assert (=> b!630005 (= res!407221 (and (= lt!290975 (Found!6694 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18254 a!2986) index!984) (select (arr!18254 a!2986) j!136))) (not (= (select (arr!18254 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38037 (_ BitVec 32)) SeekEntryResult!6694)

(assert (=> b!630005 (= lt!290975 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18254 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!630006 () Bool)

(declare-fun e!360264 () Bool)

(declare-fun lt!290974 () SeekEntryResult!6694)

(assert (=> b!630006 (= e!360264 (= lt!290975 lt!290974))))

(declare-fun b!630007 () Bool)

(assert (=> b!630007 (= e!360266 (not true))))

(assert (=> b!630007 e!360264))

(declare-fun res!407217 () Bool)

(assert (=> b!630007 (=> (not res!407217) (not e!360264))))

(declare-fun lt!290977 () (_ BitVec 32))

(assert (=> b!630007 (= res!407217 (= lt!290974 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!290977 vacantSpotIndex!68 (select (store (arr!18254 a!2986) i!1108 k!1786) j!136) (array!38038 (store (arr!18254 a!2986) i!1108 k!1786) (size!18618 a!2986)) mask!3053)))))

(assert (=> b!630007 (= lt!290974 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!290977 vacantSpotIndex!68 (select (arr!18254 a!2986) j!136) a!2986 mask!3053))))

(declare-datatypes ((Unit!21130 0))(
  ( (Unit!21131) )
))
(declare-fun lt!290973 () Unit!21130)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38037 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21130)

(assert (=> b!630007 (= lt!290973 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!290977 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!630007 (= lt!290977 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!630008 () Bool)

(declare-fun res!407212 () Bool)

(assert (=> b!630008 (=> (not res!407212) (not e!360263))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38037 (_ BitVec 32)) Bool)

(assert (=> b!630008 (= res!407212 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(assert (= (and start!56904 res!407214) b!629999))

(assert (= (and b!629999 res!407215) b!630004))

(assert (= (and b!630004 res!407220) b!630001))

(assert (= (and b!630001 res!407216) b!630002))

(assert (= (and b!630002 res!407219) b!629998))

(assert (= (and b!629998 res!407218) b!630008))

(assert (= (and b!630008 res!407212) b!630000))

(assert (= (and b!630000 res!407222) b!630003))

(assert (= (and b!630003 res!407213) b!630005))

(assert (= (and b!630005 res!407221) b!630007))

(assert (= (and b!630007 res!407217) b!630006))

(declare-fun m!604987 () Bool)

(assert (=> b!630005 m!604987))

(declare-fun m!604989 () Bool)

(assert (=> b!630005 m!604989))

(assert (=> b!630005 m!604989))

(declare-fun m!604991 () Bool)

(assert (=> b!630005 m!604991))

(declare-fun m!604993 () Bool)

(assert (=> b!630007 m!604993))

(declare-fun m!604995 () Bool)

(assert (=> b!630007 m!604995))

(assert (=> b!630007 m!604989))

(declare-fun m!604997 () Bool)

(assert (=> b!630007 m!604997))

(assert (=> b!630007 m!604995))

(declare-fun m!604999 () Bool)

(assert (=> b!630007 m!604999))

(declare-fun m!605001 () Bool)

(assert (=> b!630007 m!605001))

(assert (=> b!630007 m!604989))

(declare-fun m!605003 () Bool)

(assert (=> b!630007 m!605003))

(declare-fun m!605005 () Bool)

(assert (=> b!630003 m!605005))

(assert (=> b!630003 m!604997))

(declare-fun m!605007 () Bool)

(assert (=> b!630003 m!605007))

(declare-fun m!605009 () Bool)

(assert (=> b!630008 m!605009))

(declare-fun m!605011 () Bool)

(assert (=> b!629998 m!605011))

(declare-fun m!605013 () Bool)

(assert (=> start!56904 m!605013))

(declare-fun m!605015 () Bool)

(assert (=> start!56904 m!605015))

(declare-fun m!605017 () Bool)

(assert (=> b!630002 m!605017))

(declare-fun m!605019 () Bool)

(assert (=> b!630000 m!605019))

(declare-fun m!605021 () Bool)

(assert (=> b!630001 m!605021))

(assert (=> b!630004 m!604989))

(assert (=> b!630004 m!604989))

(declare-fun m!605023 () Bool)

(assert (=> b!630004 m!605023))

(push 1)

(assert (not b!630004))

(assert (not b!630007))

(assert (not b!630008))

(assert (not b!629998))

(assert (not b!630001))

