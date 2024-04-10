; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56212 () Bool)

(assert start!56212)

(declare-fun b!623146 () Bool)

(declare-fun res!401614 () Bool)

(declare-fun e!357428 () Bool)

(assert (=> b!623146 (=> (not res!401614) (not e!357428))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37682 0))(
  ( (array!37683 (arr!18087 (Array (_ BitVec 32) (_ BitVec 64))) (size!18451 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37682)

(assert (=> b!623146 (= res!401614 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18087 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!623147 () Bool)

(declare-datatypes ((Unit!20998 0))(
  ( (Unit!20999) )
))
(declare-fun e!357436 () Unit!20998)

(declare-fun Unit!21000 () Unit!20998)

(assert (=> b!623147 (= e!357436 Unit!21000)))

(declare-fun b!623148 () Bool)

(declare-fun res!401613 () Bool)

(declare-fun e!357437 () Bool)

(assert (=> b!623148 (=> (not res!401613) (not e!357437))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!623148 (= res!401613 (validKeyInArray!0 (select (arr!18087 a!2986) j!136)))))

(declare-fun b!623149 () Bool)

(declare-fun e!357438 () Unit!20998)

(declare-fun Unit!21001 () Unit!20998)

(assert (=> b!623149 (= e!357438 Unit!21001)))

(declare-fun b!623150 () Bool)

(declare-fun e!357435 () Bool)

(declare-fun e!357432 () Bool)

(assert (=> b!623150 (= e!357435 e!357432)))

(declare-fun res!401606 () Bool)

(assert (=> b!623150 (=> (not res!401606) (not e!357432))))

(declare-datatypes ((SeekEntryResult!6527 0))(
  ( (MissingZero!6527 (index!28392 (_ BitVec 32))) (Found!6527 (index!28393 (_ BitVec 32))) (Intermediate!6527 (undefined!7339 Bool) (index!28394 (_ BitVec 32)) (x!57159 (_ BitVec 32))) (Undefined!6527) (MissingVacant!6527 (index!28395 (_ BitVec 32))) )
))
(declare-fun lt!288987 () SeekEntryResult!6527)

(assert (=> b!623150 (= res!401606 (and (= lt!288987 (Found!6527 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18087 a!2986) index!984) (select (arr!18087 a!2986) j!136))) (not (= (select (arr!18087 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37682 (_ BitVec 32)) SeekEntryResult!6527)

(assert (=> b!623150 (= lt!288987 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18087 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!623151 () Bool)

(declare-fun res!401603 () Bool)

(assert (=> b!623151 (=> (not res!401603) (not e!357428))))

(declare-datatypes ((List!12128 0))(
  ( (Nil!12125) (Cons!12124 (h!13169 (_ BitVec 64)) (t!18356 List!12128)) )
))
(declare-fun arrayNoDuplicates!0 (array!37682 (_ BitVec 32) List!12128) Bool)

(assert (=> b!623151 (= res!401603 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12125))))

(declare-fun b!623152 () Bool)

(declare-fun e!357429 () Unit!20998)

(declare-fun Unit!21002 () Unit!20998)

(assert (=> b!623152 (= e!357429 Unit!21002)))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun res!401604 () Bool)

(assert (=> b!623152 (= res!401604 (= (select (store (arr!18087 a!2986) i!1108 k!1786) index!984) (select (arr!18087 a!2986) j!136)))))

(declare-fun e!357433 () Bool)

(assert (=> b!623152 (=> (not res!401604) (not e!357433))))

(assert (=> b!623152 e!357433))

(declare-fun c!71138 () Bool)

(assert (=> b!623152 (= c!71138 (bvslt j!136 index!984))))

(declare-fun lt!288981 () Unit!20998)

(assert (=> b!623152 (= lt!288981 e!357438)))

(declare-fun c!71139 () Bool)

(assert (=> b!623152 (= c!71139 (bvslt index!984 j!136))))

(declare-fun lt!288990 () Unit!20998)

(declare-fun e!357434 () Unit!20998)

(assert (=> b!623152 (= lt!288990 e!357434)))

(assert (=> b!623152 false))

(declare-fun b!623153 () Bool)

(declare-fun Unit!21003 () Unit!20998)

(assert (=> b!623153 (= e!357429 Unit!21003)))

(declare-fun b!623154 () Bool)

(assert (=> b!623154 false))

(declare-fun lt!288997 () Unit!20998)

(declare-fun lt!288992 () array!37682)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37682 (_ BitVec 64) (_ BitVec 32) List!12128) Unit!20998)

(assert (=> b!623154 (= lt!288997 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!288992 (select (arr!18087 a!2986) j!136) index!984 Nil!12125))))

(assert (=> b!623154 (arrayNoDuplicates!0 lt!288992 index!984 Nil!12125)))

(declare-fun lt!288996 () Unit!20998)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37682 (_ BitVec 32) (_ BitVec 32)) Unit!20998)

(assert (=> b!623154 (= lt!288996 (lemmaNoDuplicateFromThenFromBigger!0 lt!288992 #b00000000000000000000000000000000 index!984))))

(assert (=> b!623154 (arrayNoDuplicates!0 lt!288992 #b00000000000000000000000000000000 Nil!12125)))

(declare-fun lt!288986 () Unit!20998)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37682 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12128) Unit!20998)

(assert (=> b!623154 (= lt!288986 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12125))))

(declare-fun arrayContainsKey!0 (array!37682 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!623154 (arrayContainsKey!0 lt!288992 (select (arr!18087 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!288994 () Unit!20998)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37682 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20998)

(assert (=> b!623154 (= lt!288994 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!288992 (select (arr!18087 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!357426 () Bool)

(assert (=> b!623154 e!357426))

(declare-fun res!401609 () Bool)

(assert (=> b!623154 (=> (not res!401609) (not e!357426))))

(assert (=> b!623154 (= res!401609 (arrayContainsKey!0 lt!288992 (select (arr!18087 a!2986) j!136) j!136))))

(declare-fun Unit!21004 () Unit!20998)

(assert (=> b!623154 (= e!357434 Unit!21004)))

(declare-fun b!623155 () Bool)

(assert (=> b!623155 false))

(declare-fun lt!288988 () Unit!20998)

(assert (=> b!623155 (= lt!288988 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!288992 (select (arr!18087 a!2986) j!136) j!136 Nil!12125))))

(assert (=> b!623155 (arrayNoDuplicates!0 lt!288992 j!136 Nil!12125)))

(declare-fun lt!288983 () Unit!20998)

(assert (=> b!623155 (= lt!288983 (lemmaNoDuplicateFromThenFromBigger!0 lt!288992 #b00000000000000000000000000000000 j!136))))

(assert (=> b!623155 (arrayNoDuplicates!0 lt!288992 #b00000000000000000000000000000000 Nil!12125)))

(declare-fun lt!288995 () Unit!20998)

(assert (=> b!623155 (= lt!288995 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12125))))

(assert (=> b!623155 (arrayContainsKey!0 lt!288992 (select (arr!18087 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!288985 () Unit!20998)

(assert (=> b!623155 (= lt!288985 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!288992 (select (arr!18087 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!21005 () Unit!20998)

(assert (=> b!623155 (= e!357438 Unit!21005)))

(declare-fun b!623156 () Bool)

(declare-fun res!401617 () Bool)

(assert (=> b!623156 (= res!401617 (bvsge j!136 index!984))))

(declare-fun e!357431 () Bool)

(assert (=> b!623156 (=> res!401617 e!357431)))

(assert (=> b!623156 (= e!357433 e!357431)))

(declare-fun b!623157 () Bool)

(declare-fun e!357427 () Bool)

(declare-fun lt!288993 () SeekEntryResult!6527)

(assert (=> b!623157 (= e!357427 (= lt!288987 lt!288993))))

(declare-fun b!623145 () Bool)

(assert (=> b!623145 (= e!357437 e!357428)))

(declare-fun res!401605 () Bool)

(assert (=> b!623145 (=> (not res!401605) (not e!357428))))

(declare-fun lt!288980 () SeekEntryResult!6527)

(assert (=> b!623145 (= res!401605 (or (= lt!288980 (MissingZero!6527 i!1108)) (= lt!288980 (MissingVacant!6527 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37682 (_ BitVec 32)) SeekEntryResult!6527)

(assert (=> b!623145 (= lt!288980 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun res!401607 () Bool)

(assert (=> start!56212 (=> (not res!401607) (not e!357437))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56212 (= res!401607 (validMask!0 mask!3053))))

(assert (=> start!56212 e!357437))

(assert (=> start!56212 true))

(declare-fun array_inv!13883 (array!37682) Bool)

(assert (=> start!56212 (array_inv!13883 a!2986)))

(declare-fun b!623158 () Bool)

(declare-fun res!401615 () Bool)

(assert (=> b!623158 (=> (not res!401615) (not e!357437))))

(assert (=> b!623158 (= res!401615 (and (= (size!18451 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18451 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18451 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!623159 () Bool)

(assert (=> b!623159 (= e!357432 (not true))))

(declare-fun lt!288991 () Unit!20998)

(assert (=> b!623159 (= lt!288991 e!357429)))

(declare-fun c!71140 () Bool)

(declare-fun lt!288989 () SeekEntryResult!6527)

(assert (=> b!623159 (= c!71140 (= lt!288989 (Found!6527 index!984)))))

(declare-fun lt!288979 () Unit!20998)

(assert (=> b!623159 (= lt!288979 e!357436)))

(declare-fun c!71141 () Bool)

(assert (=> b!623159 (= c!71141 (= lt!288989 Undefined!6527))))

(declare-fun lt!288982 () (_ BitVec 64))

(assert (=> b!623159 (= lt!288989 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!288982 lt!288992 mask!3053))))

(assert (=> b!623159 e!357427))

(declare-fun res!401616 () Bool)

(assert (=> b!623159 (=> (not res!401616) (not e!357427))))

(declare-fun lt!288984 () (_ BitVec 32))

(assert (=> b!623159 (= res!401616 (= lt!288993 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!288984 vacantSpotIndex!68 lt!288982 lt!288992 mask!3053)))))

(assert (=> b!623159 (= lt!288993 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!288984 vacantSpotIndex!68 (select (arr!18087 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!623159 (= lt!288982 (select (store (arr!18087 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!288978 () Unit!20998)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37682 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20998)

(assert (=> b!623159 (= lt!288978 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!288984 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!623159 (= lt!288984 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!623160 () Bool)

(assert (=> b!623160 (= e!357428 e!357435)))

(declare-fun res!401610 () Bool)

(assert (=> b!623160 (=> (not res!401610) (not e!357435))))

(assert (=> b!623160 (= res!401610 (= (select (store (arr!18087 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!623160 (= lt!288992 (array!37683 (store (arr!18087 a!2986) i!1108 k!1786) (size!18451 a!2986)))))

(declare-fun e!357425 () Bool)

(declare-fun b!623161 () Bool)

(assert (=> b!623161 (= e!357425 (arrayContainsKey!0 lt!288992 (select (arr!18087 a!2986) j!136) index!984))))

(declare-fun b!623162 () Bool)

(declare-fun res!401618 () Bool)

(assert (=> b!623162 (=> (not res!401618) (not e!357437))))

(assert (=> b!623162 (= res!401618 (validKeyInArray!0 k!1786))))

(declare-fun b!623163 () Bool)

(declare-fun Unit!21006 () Unit!20998)

(assert (=> b!623163 (= e!357434 Unit!21006)))

(declare-fun b!623164 () Bool)

(assert (=> b!623164 (= e!357426 (arrayContainsKey!0 lt!288992 (select (arr!18087 a!2986) j!136) index!984))))

(declare-fun b!623165 () Bool)

(declare-fun res!401612 () Bool)

(assert (=> b!623165 (=> (not res!401612) (not e!357428))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37682 (_ BitVec 32)) Bool)

(assert (=> b!623165 (= res!401612 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!623166 () Bool)

(declare-fun res!401608 () Bool)

(assert (=> b!623166 (= res!401608 (arrayContainsKey!0 lt!288992 (select (arr!18087 a!2986) j!136) j!136))))

(assert (=> b!623166 (=> (not res!401608) (not e!357425))))

(assert (=> b!623166 (= e!357431 e!357425)))

(declare-fun b!623167 () Bool)

(declare-fun Unit!21007 () Unit!20998)

(assert (=> b!623167 (= e!357436 Unit!21007)))

(assert (=> b!623167 false))

(declare-fun b!623168 () Bool)

(declare-fun res!401611 () Bool)

(assert (=> b!623168 (=> (not res!401611) (not e!357437))))

(assert (=> b!623168 (= res!401611 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(assert (= (and start!56212 res!401607) b!623158))

(assert (= (and b!623158 res!401615) b!623148))

(assert (= (and b!623148 res!401613) b!623162))

(assert (= (and b!623162 res!401618) b!623168))

(assert (= (and b!623168 res!401611) b!623145))

(assert (= (and b!623145 res!401605) b!623165))

(assert (= (and b!623165 res!401612) b!623151))

(assert (= (and b!623151 res!401603) b!623146))

(assert (= (and b!623146 res!401614) b!623160))

(assert (= (and b!623160 res!401610) b!623150))

(assert (= (and b!623150 res!401606) b!623159))

(assert (= (and b!623159 res!401616) b!623157))

(assert (= (and b!623159 c!71141) b!623167))

(assert (= (and b!623159 (not c!71141)) b!623147))

(assert (= (and b!623159 c!71140) b!623152))

(assert (= (and b!623159 (not c!71140)) b!623153))

(assert (= (and b!623152 res!401604) b!623156))

(assert (= (and b!623156 (not res!401617)) b!623166))

(assert (= (and b!623166 res!401608) b!623161))

(assert (= (and b!623152 c!71138) b!623155))

(assert (= (and b!623152 (not c!71138)) b!623149))

(assert (= (and b!623152 c!71139) b!623154))

(assert (= (and b!623152 (not c!71139)) b!623163))

(assert (= (and b!623154 res!401609) b!623164))

(declare-fun m!598991 () Bool)

(assert (=> b!623154 m!598991))

(declare-fun m!598993 () Bool)

(assert (=> b!623154 m!598993))

(assert (=> b!623154 m!598991))

(declare-fun m!598995 () Bool)

(assert (=> b!623154 m!598995))

(assert (=> b!623154 m!598991))

(declare-fun m!598997 () Bool)

(assert (=> b!623154 m!598997))

(assert (=> b!623154 m!598991))

(declare-fun m!598999 () Bool)

(assert (=> b!623154 m!598999))

(declare-fun m!599001 () Bool)

(assert (=> b!623154 m!599001))

(declare-fun m!599003 () Bool)

(assert (=> b!623154 m!599003))

(assert (=> b!623154 m!598991))

(declare-fun m!599005 () Bool)

(assert (=> b!623154 m!599005))

(declare-fun m!599007 () Bool)

(assert (=> b!623154 m!599007))

(assert (=> b!623166 m!598991))

(assert (=> b!623166 m!598991))

(assert (=> b!623166 m!599005))

(declare-fun m!599009 () Bool)

(assert (=> b!623150 m!599009))

(assert (=> b!623150 m!598991))

(assert (=> b!623150 m!598991))

(declare-fun m!599011 () Bool)

(assert (=> b!623150 m!599011))

(assert (=> b!623161 m!598991))

(assert (=> b!623161 m!598991))

(declare-fun m!599013 () Bool)

(assert (=> b!623161 m!599013))

(assert (=> b!623148 m!598991))

(assert (=> b!623148 m!598991))

(declare-fun m!599015 () Bool)

(assert (=> b!623148 m!599015))

(declare-fun m!599017 () Bool)

(assert (=> b!623152 m!599017))

(declare-fun m!599019 () Bool)

(assert (=> b!623152 m!599019))

(assert (=> b!623152 m!598991))

(declare-fun m!599021 () Bool)

(assert (=> b!623168 m!599021))

(declare-fun m!599023 () Bool)

(assert (=> b!623165 m!599023))

(assert (=> b!623160 m!599017))

(declare-fun m!599025 () Bool)

(assert (=> b!623160 m!599025))

(declare-fun m!599027 () Bool)

(assert (=> start!56212 m!599027))

(declare-fun m!599029 () Bool)

(assert (=> start!56212 m!599029))

(declare-fun m!599031 () Bool)

(assert (=> b!623145 m!599031))

(assert (=> b!623164 m!598991))

(assert (=> b!623164 m!598991))

(assert (=> b!623164 m!599013))

(declare-fun m!599033 () Bool)

(assert (=> b!623159 m!599033))

(declare-fun m!599035 () Bool)

(assert (=> b!623159 m!599035))

(assert (=> b!623159 m!598991))

(assert (=> b!623159 m!599017))

(declare-fun m!599037 () Bool)

(assert (=> b!623159 m!599037))

(declare-fun m!599039 () Bool)

(assert (=> b!623159 m!599039))

(assert (=> b!623159 m!598991))

(declare-fun m!599041 () Bool)

(assert (=> b!623159 m!599041))

(declare-fun m!599043 () Bool)

(assert (=> b!623159 m!599043))

(declare-fun m!599045 () Bool)

(assert (=> b!623146 m!599045))

(declare-fun m!599047 () Bool)

(assert (=> b!623151 m!599047))

(declare-fun m!599049 () Bool)

(assert (=> b!623162 m!599049))

(declare-fun m!599051 () Bool)

(assert (=> b!623155 m!599051))

(assert (=> b!623155 m!598991))

(assert (=> b!623155 m!598991))

(declare-fun m!599053 () Bool)

(assert (=> b!623155 m!599053))

(assert (=> b!623155 m!599003))

(assert (=> b!623155 m!598991))

(declare-fun m!599055 () Bool)

(assert (=> b!623155 m!599055))

(declare-fun m!599057 () Bool)

(assert (=> b!623155 m!599057))

(assert (=> b!623155 m!598991))

(declare-fun m!599059 () Bool)

(assert (=> b!623155 m!599059))

(assert (=> b!623155 m!599007))

(push 1)

