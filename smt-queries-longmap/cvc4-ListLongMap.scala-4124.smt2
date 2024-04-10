; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56294 () Bool)

(assert start!56294)

(declare-fun b!624180 () Bool)

(declare-datatypes ((Unit!21084 0))(
  ( (Unit!21085) )
))
(declare-fun e!357983 () Unit!21084)

(declare-fun Unit!21086 () Unit!21084)

(assert (=> b!624180 (= e!357983 Unit!21086)))

(declare-fun b!624181 () Bool)

(declare-fun e!357988 () Bool)

(declare-fun e!357989 () Bool)

(assert (=> b!624181 (= e!357988 e!357989)))

(declare-fun res!402341 () Bool)

(assert (=> b!624181 (=> (not res!402341) (not e!357989))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((array!37719 0))(
  ( (array!37720 (arr!18104 (Array (_ BitVec 32) (_ BitVec 64))) (size!18468 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37719)

(assert (=> b!624181 (= res!402341 (= (select (store (arr!18104 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!289541 () array!37719)

(assert (=> b!624181 (= lt!289541 (array!37720 (store (arr!18104 a!2986) i!1108 k!1786) (size!18468 a!2986)))))

(declare-fun b!624182 () Bool)

(declare-fun res!402344 () Bool)

(declare-fun e!357984 () Bool)

(assert (=> b!624182 (=> (not res!402344) (not e!357984))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!624182 (= res!402344 (validKeyInArray!0 k!1786))))

(declare-fun b!624183 () Bool)

(declare-fun res!402340 () Bool)

(assert (=> b!624183 (=> (not res!402340) (not e!357988))))

(declare-datatypes ((List!12145 0))(
  ( (Nil!12142) (Cons!12141 (h!13186 (_ BitVec 64)) (t!18373 List!12145)) )
))
(declare-fun arrayNoDuplicates!0 (array!37719 (_ BitVec 32) List!12145) Bool)

(assert (=> b!624183 (= res!402340 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12142))))

(declare-fun b!624184 () Bool)

(declare-fun res!402342 () Bool)

(assert (=> b!624184 (=> (not res!402342) (not e!357984))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!624184 (= res!402342 (validKeyInArray!0 (select (arr!18104 a!2986) j!136)))))

(declare-fun b!624185 () Bool)

(declare-fun res!402333 () Bool)

(assert (=> b!624185 (=> (not res!402333) (not e!357988))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!624185 (= res!402333 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18104 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!624187 () Bool)

(assert (=> b!624187 (= e!357984 e!357988)))

(declare-fun res!402334 () Bool)

(assert (=> b!624187 (=> (not res!402334) (not e!357988))))

(declare-datatypes ((SeekEntryResult!6544 0))(
  ( (MissingZero!6544 (index!28460 (_ BitVec 32))) (Found!6544 (index!28461 (_ BitVec 32))) (Intermediate!6544 (undefined!7356 Bool) (index!28462 (_ BitVec 32)) (x!57219 (_ BitVec 32))) (Undefined!6544) (MissingVacant!6544 (index!28463 (_ BitVec 32))) )
))
(declare-fun lt!289544 () SeekEntryResult!6544)

(assert (=> b!624187 (= res!402334 (or (= lt!289544 (MissingZero!6544 i!1108)) (= lt!289544 (MissingVacant!6544 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37719 (_ BitVec 32)) SeekEntryResult!6544)

(assert (=> b!624187 (= lt!289544 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!624188 () Bool)

(declare-fun e!357990 () Bool)

(assert (=> b!624188 (= e!357989 e!357990)))

(declare-fun res!402332 () Bool)

(assert (=> b!624188 (=> (not res!402332) (not e!357990))))

(declare-fun lt!289549 () SeekEntryResult!6544)

(assert (=> b!624188 (= res!402332 (and (= lt!289549 (Found!6544 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18104 a!2986) index!984) (select (arr!18104 a!2986) j!136))) (not (= (select (arr!18104 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37719 (_ BitVec 32)) SeekEntryResult!6544)

(assert (=> b!624188 (= lt!289549 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18104 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!624189 () Bool)

(declare-fun res!402339 () Bool)

(assert (=> b!624189 (=> (not res!402339) (not e!357984))))

(assert (=> b!624189 (= res!402339 (and (= (size!18468 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18468 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18468 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!624190 () Bool)

(declare-fun res!402335 () Bool)

(assert (=> b!624190 (=> (not res!402335) (not e!357984))))

(declare-fun arrayContainsKey!0 (array!37719 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!624190 (= res!402335 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!624191 () Bool)

(declare-fun res!402338 () Bool)

(assert (=> b!624191 (=> (not res!402338) (not e!357988))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37719 (_ BitVec 32)) Bool)

(assert (=> b!624191 (= res!402338 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!624192 () Bool)

(declare-fun e!357986 () Bool)

(declare-fun lt!289548 () SeekEntryResult!6544)

(assert (=> b!624192 (= e!357986 (= lt!289549 lt!289548))))

(declare-fun e!357985 () Bool)

(declare-fun lt!289542 () (_ BitVec 64))

(declare-fun b!624193 () Bool)

(assert (=> b!624193 (= e!357985 (or (not (= (select (arr!18104 a!2986) j!136) lt!289542)) (= (select (arr!18104 a!2986) j!136) (select (store (arr!18104 a!2986) i!1108 k!1786) index!984))))))

(assert (=> b!624193 (= (select (store (arr!18104 a!2986) i!1108 k!1786) index!984) (select (arr!18104 a!2986) j!136))))

(declare-fun b!624194 () Bool)

(assert (=> b!624194 (= e!357990 (not e!357985))))

(declare-fun res!402336 () Bool)

(assert (=> b!624194 (=> res!402336 e!357985)))

(declare-fun lt!289547 () SeekEntryResult!6544)

(assert (=> b!624194 (= res!402336 (not (= lt!289547 (Found!6544 index!984))))))

(declare-fun lt!289543 () Unit!21084)

(assert (=> b!624194 (= lt!289543 e!357983)))

(declare-fun c!71291 () Bool)

(assert (=> b!624194 (= c!71291 (= lt!289547 Undefined!6544))))

(assert (=> b!624194 (= lt!289547 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!289542 lt!289541 mask!3053))))

(assert (=> b!624194 e!357986))

(declare-fun res!402337 () Bool)

(assert (=> b!624194 (=> (not res!402337) (not e!357986))))

(declare-fun lt!289546 () (_ BitVec 32))

(assert (=> b!624194 (= res!402337 (= lt!289548 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!289546 vacantSpotIndex!68 lt!289542 lt!289541 mask!3053)))))

(assert (=> b!624194 (= lt!289548 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!289546 vacantSpotIndex!68 (select (arr!18104 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!624194 (= lt!289542 (select (store (arr!18104 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!289545 () Unit!21084)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37719 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21084)

(assert (=> b!624194 (= lt!289545 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!289546 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!624194 (= lt!289546 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!624186 () Bool)

(declare-fun Unit!21087 () Unit!21084)

(assert (=> b!624186 (= e!357983 Unit!21087)))

(assert (=> b!624186 false))

(declare-fun res!402343 () Bool)

(assert (=> start!56294 (=> (not res!402343) (not e!357984))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56294 (= res!402343 (validMask!0 mask!3053))))

(assert (=> start!56294 e!357984))

(assert (=> start!56294 true))

(declare-fun array_inv!13900 (array!37719) Bool)

(assert (=> start!56294 (array_inv!13900 a!2986)))

(assert (= (and start!56294 res!402343) b!624189))

(assert (= (and b!624189 res!402339) b!624184))

(assert (= (and b!624184 res!402342) b!624182))

(assert (= (and b!624182 res!402344) b!624190))

(assert (= (and b!624190 res!402335) b!624187))

(assert (= (and b!624187 res!402334) b!624191))

(assert (= (and b!624191 res!402338) b!624183))

(assert (= (and b!624183 res!402340) b!624185))

(assert (= (and b!624185 res!402333) b!624181))

(assert (= (and b!624181 res!402341) b!624188))

(assert (= (and b!624188 res!402332) b!624194))

(assert (= (and b!624194 res!402337) b!624192))

(assert (= (and b!624194 c!71291) b!624186))

(assert (= (and b!624194 (not c!71291)) b!624180))

(assert (= (and b!624194 (not res!402336)) b!624193))

(declare-fun m!599915 () Bool)

(assert (=> start!56294 m!599915))

(declare-fun m!599917 () Bool)

(assert (=> start!56294 m!599917))

(declare-fun m!599919 () Bool)

(assert (=> b!624184 m!599919))

(assert (=> b!624184 m!599919))

(declare-fun m!599921 () Bool)

(assert (=> b!624184 m!599921))

(declare-fun m!599923 () Bool)

(assert (=> b!624183 m!599923))

(declare-fun m!599925 () Bool)

(assert (=> b!624191 m!599925))

(declare-fun m!599927 () Bool)

(assert (=> b!624187 m!599927))

(declare-fun m!599929 () Bool)

(assert (=> b!624188 m!599929))

(assert (=> b!624188 m!599919))

(assert (=> b!624188 m!599919))

(declare-fun m!599931 () Bool)

(assert (=> b!624188 m!599931))

(assert (=> b!624193 m!599919))

(declare-fun m!599933 () Bool)

(assert (=> b!624193 m!599933))

(declare-fun m!599935 () Bool)

(assert (=> b!624193 m!599935))

(declare-fun m!599937 () Bool)

(assert (=> b!624185 m!599937))

(declare-fun m!599939 () Bool)

(assert (=> b!624194 m!599939))

(declare-fun m!599941 () Bool)

(assert (=> b!624194 m!599941))

(assert (=> b!624194 m!599919))

(assert (=> b!624194 m!599933))

(assert (=> b!624194 m!599919))

(declare-fun m!599943 () Bool)

(assert (=> b!624194 m!599943))

(declare-fun m!599945 () Bool)

(assert (=> b!624194 m!599945))

(declare-fun m!599947 () Bool)

(assert (=> b!624194 m!599947))

(declare-fun m!599949 () Bool)

(assert (=> b!624194 m!599949))

(declare-fun m!599951 () Bool)

(assert (=> b!624190 m!599951))

(assert (=> b!624181 m!599933))

(declare-fun m!599953 () Bool)

(assert (=> b!624181 m!599953))

(declare-fun m!599955 () Bool)

(assert (=> b!624182 m!599955))

(push 1)

