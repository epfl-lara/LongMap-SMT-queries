; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57002 () Bool)

(assert start!57002)

(declare-fun b!630991 () Bool)

(declare-fun res!407959 () Bool)

(declare-fun e!360788 () Bool)

(assert (=> b!630991 (=> (not res!407959) (not e!360788))))

(declare-datatypes ((array!38078 0))(
  ( (array!38079 (arr!18273 (Array (_ BitVec 32) (_ BitVec 64))) (size!18637 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38078)

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!38078 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!630991 (= res!407959 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!630992 () Bool)

(declare-fun e!360789 () Bool)

(declare-fun e!360790 () Bool)

(assert (=> b!630992 (= e!360789 e!360790)))

(declare-fun res!407953 () Bool)

(assert (=> b!630992 (=> (not res!407953) (not e!360790))))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6713 0))(
  ( (MissingZero!6713 (index!29142 (_ BitVec 32))) (Found!6713 (index!29143 (_ BitVec 32))) (Intermediate!6713 (undefined!7525 Bool) (index!29144 (_ BitVec 32)) (x!57883 (_ BitVec 32))) (Undefined!6713) (MissingVacant!6713 (index!29145 (_ BitVec 32))) )
))
(declare-fun lt!291476 () SeekEntryResult!6713)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!630992 (= res!407953 (and (= lt!291476 (Found!6713 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18273 a!2986) index!984) (select (arr!18273 a!2986) j!136))) (not (= (select (arr!18273 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38078 (_ BitVec 32)) SeekEntryResult!6713)

(assert (=> b!630992 (= lt!291476 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18273 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!630993 () Bool)

(declare-fun e!360786 () Bool)

(assert (=> b!630993 (= e!360788 e!360786)))

(declare-fun res!407950 () Bool)

(assert (=> b!630993 (=> (not res!407950) (not e!360786))))

(declare-fun lt!291474 () SeekEntryResult!6713)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!630993 (= res!407950 (or (= lt!291474 (MissingZero!6713 i!1108)) (= lt!291474 (MissingVacant!6713 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38078 (_ BitVec 32)) SeekEntryResult!6713)

(assert (=> b!630993 (= lt!291474 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun res!407951 () Bool)

(assert (=> start!57002 (=> (not res!407951) (not e!360788))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57002 (= res!407951 (validMask!0 mask!3053))))

(assert (=> start!57002 e!360788))

(assert (=> start!57002 true))

(declare-fun array_inv!14069 (array!38078) Bool)

(assert (=> start!57002 (array_inv!14069 a!2986)))

(declare-fun b!630994 () Bool)

(declare-fun res!407957 () Bool)

(assert (=> b!630994 (=> (not res!407957) (not e!360786))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38078 (_ BitVec 32)) Bool)

(assert (=> b!630994 (= res!407957 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!630995 () Bool)

(declare-fun e!360792 () Bool)

(declare-fun lt!291475 () SeekEntryResult!6713)

(assert (=> b!630995 (= e!360792 (= lt!291476 lt!291475))))

(declare-fun b!630996 () Bool)

(declare-fun res!407955 () Bool)

(assert (=> b!630996 (=> (not res!407955) (not e!360788))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!630996 (= res!407955 (validKeyInArray!0 (select (arr!18273 a!2986) j!136)))))

(declare-fun b!630997 () Bool)

(declare-fun res!407956 () Bool)

(assert (=> b!630997 (=> (not res!407956) (not e!360786))))

(assert (=> b!630997 (= res!407956 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18273 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!630998 () Bool)

(assert (=> b!630998 (= e!360786 e!360789)))

(declare-fun res!407960 () Bool)

(assert (=> b!630998 (=> (not res!407960) (not e!360789))))

(assert (=> b!630998 (= res!407960 (= (select (store (arr!18273 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!291472 () array!38078)

(assert (=> b!630998 (= lt!291472 (array!38079 (store (arr!18273 a!2986) i!1108 k!1786) (size!18637 a!2986)))))

(declare-fun b!630999 () Bool)

(declare-datatypes ((Unit!21186 0))(
  ( (Unit!21187) )
))
(declare-fun e!360791 () Unit!21186)

(declare-fun Unit!21188 () Unit!21186)

(assert (=> b!630999 (= e!360791 Unit!21188)))

(declare-fun b!631000 () Bool)

(declare-fun res!407954 () Bool)

(assert (=> b!631000 (=> (not res!407954) (not e!360788))))

(assert (=> b!631000 (= res!407954 (validKeyInArray!0 k!1786))))

(declare-fun b!631001 () Bool)

(declare-fun res!407958 () Bool)

(assert (=> b!631001 (=> (not res!407958) (not e!360786))))

(declare-datatypes ((List!12314 0))(
  ( (Nil!12311) (Cons!12310 (h!13355 (_ BitVec 64)) (t!18542 List!12314)) )
))
(declare-fun arrayNoDuplicates!0 (array!38078 (_ BitVec 32) List!12314) Bool)

(assert (=> b!631001 (= res!407958 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12311))))

(declare-fun b!631002 () Bool)

(declare-fun res!407949 () Bool)

(assert (=> b!631002 (=> (not res!407949) (not e!360788))))

(assert (=> b!631002 (= res!407949 (and (= (size!18637 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18637 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18637 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!631003 () Bool)

(assert (=> b!631003 (= e!360790 (not true))))

(declare-fun lt!291478 () Unit!21186)

(assert (=> b!631003 (= lt!291478 e!360791)))

(declare-fun lt!291473 () (_ BitVec 64))

(declare-fun c!71888 () Bool)

(assert (=> b!631003 (= c!71888 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!291473 lt!291472 mask!3053) Undefined!6713))))

(assert (=> b!631003 e!360792))

(declare-fun res!407952 () Bool)

(assert (=> b!631003 (=> (not res!407952) (not e!360792))))

(declare-fun lt!291471 () (_ BitVec 32))

(assert (=> b!631003 (= res!407952 (= lt!291475 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!291471 vacantSpotIndex!68 lt!291473 lt!291472 mask!3053)))))

(assert (=> b!631003 (= lt!291475 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!291471 vacantSpotIndex!68 (select (arr!18273 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!631003 (= lt!291473 (select (store (arr!18273 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!291477 () Unit!21186)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38078 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21186)

(assert (=> b!631003 (= lt!291477 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!291471 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!631003 (= lt!291471 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!631004 () Bool)

(declare-fun Unit!21189 () Unit!21186)

(assert (=> b!631004 (= e!360791 Unit!21189)))

(assert (=> b!631004 false))

(assert (= (and start!57002 res!407951) b!631002))

(assert (= (and b!631002 res!407949) b!630996))

(assert (= (and b!630996 res!407955) b!631000))

(assert (= (and b!631000 res!407954) b!630991))

(assert (= (and b!630991 res!407959) b!630993))

(assert (= (and b!630993 res!407950) b!630994))

(assert (= (and b!630994 res!407957) b!631001))

(assert (= (and b!631001 res!407958) b!630997))

(assert (= (and b!630997 res!407956) b!630998))

(assert (= (and b!630998 res!407960) b!630992))

(assert (= (and b!630992 res!407953) b!631003))

(assert (= (and b!631003 res!407952) b!630995))

(assert (= (and b!631003 c!71888) b!631004))

(assert (= (and b!631003 (not c!71888)) b!630999))

(declare-fun m!605943 () Bool)

(assert (=> b!630998 m!605943))

(declare-fun m!605945 () Bool)

(assert (=> b!630998 m!605945))

(declare-fun m!605947 () Bool)

(assert (=> b!630992 m!605947))

(declare-fun m!605949 () Bool)

(assert (=> b!630992 m!605949))

(assert (=> b!630992 m!605949))

(declare-fun m!605951 () Bool)

(assert (=> b!630992 m!605951))

(declare-fun m!605953 () Bool)

(assert (=> start!57002 m!605953))

(declare-fun m!605955 () Bool)

(assert (=> start!57002 m!605955))

(declare-fun m!605957 () Bool)

(assert (=> b!630994 m!605957))

(assert (=> b!630996 m!605949))

(assert (=> b!630996 m!605949))

(declare-fun m!605959 () Bool)

(assert (=> b!630996 m!605959))

(declare-fun m!605961 () Bool)

(assert (=> b!631003 m!605961))

(declare-fun m!605963 () Bool)

(assert (=> b!631003 m!605963))

(declare-fun m!605965 () Bool)

(assert (=> b!631003 m!605965))

(assert (=> b!631003 m!605949))

(declare-fun m!605967 () Bool)

(assert (=> b!631003 m!605967))

(assert (=> b!631003 m!605943))

(declare-fun m!605969 () Bool)

(assert (=> b!631003 m!605969))

(assert (=> b!631003 m!605949))

(declare-fun m!605971 () Bool)

(assert (=> b!631003 m!605971))

(declare-fun m!605973 () Bool)

(assert (=> b!631000 m!605973))

(declare-fun m!605975 () Bool)

(assert (=> b!631001 m!605975))

(declare-fun m!605977 () Bool)

(assert (=> b!630991 m!605977))

(declare-fun m!605979 () Bool)

(assert (=> b!630993 m!605979))

(declare-fun m!605981 () Bool)

(assert (=> b!630997 m!605981))

(push 1)

