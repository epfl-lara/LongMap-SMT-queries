; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55686 () Bool)

(assert start!55686)

(declare-fun b!610196 () Bool)

(declare-fun e!349538 () Bool)

(declare-fun e!349540 () Bool)

(assert (=> b!610196 (= e!349538 e!349540)))

(declare-fun res!392544 () Bool)

(assert (=> b!610196 (=> res!392544 e!349540)))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!610196 (= res!392544 (bvsge index!984 j!136))))

(declare-datatypes ((Unit!19548 0))(
  ( (Unit!19549) )
))
(declare-fun lt!278996 () Unit!19548)

(declare-fun e!349533 () Unit!19548)

(assert (=> b!610196 (= lt!278996 e!349533)))

(declare-fun c!69198 () Bool)

(assert (=> b!610196 (= c!69198 (bvslt j!136 index!984))))

(declare-fun b!610197 () Bool)

(declare-fun res!392538 () Bool)

(declare-fun e!349532 () Bool)

(assert (=> b!610197 (=> (not res!392538) (not e!349532))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((array!37350 0))(
  ( (array!37351 (arr!17924 (Array (_ BitVec 32) (_ BitVec 64))) (size!18289 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37350)

(assert (=> b!610197 (= res!392538 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17924 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!610198 () Bool)

(declare-fun e!349534 () Bool)

(declare-fun e!349530 () Bool)

(assert (=> b!610198 (= e!349534 e!349530)))

(declare-fun res!392542 () Bool)

(assert (=> b!610198 (=> (not res!392542) (not e!349530))))

(declare-fun lt!278994 () array!37350)

(declare-fun arrayContainsKey!0 (array!37350 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!610198 (= res!392542 (arrayContainsKey!0 lt!278994 (select (arr!17924 a!2986) j!136) j!136))))

(declare-fun b!610199 () Bool)

(declare-fun res!392554 () Bool)

(assert (=> b!610199 (=> (not res!392554) (not e!349532))))

(declare-datatypes ((List!12004 0))(
  ( (Nil!12001) (Cons!12000 (h!13045 (_ BitVec 64)) (t!18223 List!12004)) )
))
(declare-fun arrayNoDuplicates!0 (array!37350 (_ BitVec 32) List!12004) Bool)

(assert (=> b!610199 (= res!392554 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12001))))

(declare-fun b!610200 () Bool)

(declare-fun res!392548 () Bool)

(declare-fun e!349541 () Bool)

(assert (=> b!610200 (=> (not res!392548) (not e!349541))))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!610200 (= res!392548 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!610201 () Bool)

(declare-fun e!349542 () Bool)

(assert (=> b!610201 (= e!349542 (arrayContainsKey!0 lt!278994 (select (arr!17924 a!2986) j!136) index!984))))

(declare-fun b!610202 () Bool)

(declare-fun e!349543 () Bool)

(assert (=> b!610202 (= e!349543 e!349538)))

(declare-fun res!392545 () Bool)

(assert (=> b!610202 (=> res!392545 e!349538)))

(declare-fun lt!278987 () (_ BitVec 64))

(declare-fun lt!278998 () (_ BitVec 64))

(assert (=> b!610202 (= res!392545 (or (not (= (select (arr!17924 a!2986) j!136) lt!278998)) (not (= (select (arr!17924 a!2986) j!136) lt!278987))))))

(declare-fun e!349544 () Bool)

(assert (=> b!610202 e!349544))

(declare-fun res!392552 () Bool)

(assert (=> b!610202 (=> (not res!392552) (not e!349544))))

(assert (=> b!610202 (= res!392552 (= lt!278987 (select (arr!17924 a!2986) j!136)))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!610202 (= lt!278987 (select (store (arr!17924 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!610203 () Bool)

(declare-fun Unit!19550 () Unit!19548)

(assert (=> b!610203 (= e!349533 Unit!19550)))

(declare-fun b!610204 () Bool)

(declare-fun e!349536 () Bool)

(declare-fun noDuplicate!347 (List!12004) Bool)

(assert (=> b!610204 (= e!349536 (noDuplicate!347 Nil!12001))))

(declare-fun b!610205 () Bool)

(declare-fun e!349545 () Bool)

(assert (=> b!610205 (= e!349545 (not e!349543))))

(declare-fun res!392536 () Bool)

(assert (=> b!610205 (=> res!392536 e!349543)))

(declare-datatypes ((SeekEntryResult!6361 0))(
  ( (MissingZero!6361 (index!27722 (_ BitVec 32))) (Found!6361 (index!27723 (_ BitVec 32))) (Intermediate!6361 (undefined!7173 Bool) (index!27724 (_ BitVec 32)) (x!56538 (_ BitVec 32))) (Undefined!6361) (MissingVacant!6361 (index!27725 (_ BitVec 32))) )
))
(declare-fun lt!278983 () SeekEntryResult!6361)

(assert (=> b!610205 (= res!392536 (not (= lt!278983 (Found!6361 index!984))))))

(declare-fun lt!278991 () Unit!19548)

(declare-fun e!349539 () Unit!19548)

(assert (=> b!610205 (= lt!278991 e!349539)))

(declare-fun c!69197 () Bool)

(assert (=> b!610205 (= c!69197 (= lt!278983 Undefined!6361))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37350 (_ BitVec 32)) SeekEntryResult!6361)

(assert (=> b!610205 (= lt!278983 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!278998 lt!278994 mask!3053))))

(declare-fun e!349535 () Bool)

(assert (=> b!610205 e!349535))

(declare-fun res!392550 () Bool)

(assert (=> b!610205 (=> (not res!392550) (not e!349535))))

(declare-fun lt!278988 () (_ BitVec 32))

(declare-fun lt!278984 () SeekEntryResult!6361)

(assert (=> b!610205 (= res!392550 (= lt!278984 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!278988 vacantSpotIndex!68 lt!278998 lt!278994 mask!3053)))))

(assert (=> b!610205 (= lt!278984 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!278988 vacantSpotIndex!68 (select (arr!17924 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!610205 (= lt!278998 (select (store (arr!17924 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!278997 () Unit!19548)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37350 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19548)

(assert (=> b!610205 (= lt!278997 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!278988 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!610205 (= lt!278988 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!610206 () Bool)

(declare-fun Unit!19551 () Unit!19548)

(assert (=> b!610206 (= e!349533 Unit!19551)))

(declare-fun lt!278982 () Unit!19548)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37350 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19548)

(assert (=> b!610206 (= lt!278982 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!278994 (select (arr!17924 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!610206 (arrayContainsKey!0 lt!278994 (select (arr!17924 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!278995 () Unit!19548)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37350 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12004) Unit!19548)

(assert (=> b!610206 (= lt!278995 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12001))))

(assert (=> b!610206 (arrayNoDuplicates!0 lt!278994 #b00000000000000000000000000000000 Nil!12001)))

(declare-fun lt!278989 () Unit!19548)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37350 (_ BitVec 32) (_ BitVec 32)) Unit!19548)

(assert (=> b!610206 (= lt!278989 (lemmaNoDuplicateFromThenFromBigger!0 lt!278994 #b00000000000000000000000000000000 j!136))))

(assert (=> b!610206 (arrayNoDuplicates!0 lt!278994 j!136 Nil!12001)))

(declare-fun lt!278993 () Unit!19548)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37350 (_ BitVec 64) (_ BitVec 32) List!12004) Unit!19548)

(assert (=> b!610206 (= lt!278993 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!278994 (select (arr!17924 a!2986) j!136) j!136 Nil!12001))))

(assert (=> b!610206 false))

(declare-fun b!610207 () Bool)

(assert (=> b!610207 (= e!349530 (arrayContainsKey!0 lt!278994 (select (arr!17924 a!2986) j!136) index!984))))

(declare-fun b!610209 () Bool)

(declare-fun e!349531 () Bool)

(assert (=> b!610209 (= e!349532 e!349531)))

(declare-fun res!392555 () Bool)

(assert (=> b!610209 (=> (not res!392555) (not e!349531))))

(assert (=> b!610209 (= res!392555 (= (select (store (arr!17924 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!610209 (= lt!278994 (array!37351 (store (arr!17924 a!2986) i!1108 k0!1786) (size!18289 a!2986)))))

(declare-fun b!610210 () Bool)

(declare-fun res!392543 () Bool)

(assert (=> b!610210 (=> (not res!392543) (not e!349541))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!610210 (= res!392543 (validKeyInArray!0 (select (arr!17924 a!2986) j!136)))))

(declare-fun b!610211 () Bool)

(declare-fun res!392537 () Bool)

(assert (=> b!610211 (=> (not res!392537) (not e!349541))))

(assert (=> b!610211 (= res!392537 (and (= (size!18289 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18289 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18289 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!610212 () Bool)

(assert (=> b!610212 (= e!349531 e!349545)))

(declare-fun res!392540 () Bool)

(assert (=> b!610212 (=> (not res!392540) (not e!349545))))

(declare-fun lt!278985 () SeekEntryResult!6361)

(assert (=> b!610212 (= res!392540 (and (= lt!278985 (Found!6361 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17924 a!2986) index!984) (select (arr!17924 a!2986) j!136))) (not (= (select (arr!17924 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!610212 (= lt!278985 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17924 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!610213 () Bool)

(assert (=> b!610213 (= e!349535 (= lt!278985 lt!278984))))

(declare-fun b!610214 () Bool)

(assert (=> b!610214 (= e!349544 e!349534)))

(declare-fun res!392539 () Bool)

(assert (=> b!610214 (=> res!392539 e!349534)))

(assert (=> b!610214 (= res!392539 (or (not (= (select (arr!17924 a!2986) j!136) lt!278998)) (not (= (select (arr!17924 a!2986) j!136) lt!278987)) (bvsge j!136 index!984)))))

(declare-fun b!610215 () Bool)

(declare-fun Unit!19552 () Unit!19548)

(assert (=> b!610215 (= e!349539 Unit!19552)))

(declare-fun b!610216 () Bool)

(assert (=> b!610216 (= e!349540 e!349536)))

(declare-fun res!392541 () Bool)

(assert (=> b!610216 (=> res!392541 e!349536)))

(assert (=> b!610216 (= res!392541 (or (bvsgt #b00000000000000000000000000000000 (size!18289 a!2986)) (bvsge (size!18289 a!2986) #b01111111111111111111111111111111)))))

(assert (=> b!610216 (arrayNoDuplicates!0 lt!278994 #b00000000000000000000000000000000 Nil!12001)))

(declare-fun lt!278986 () Unit!19548)

(assert (=> b!610216 (= lt!278986 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12001))))

(assert (=> b!610216 (arrayContainsKey!0 lt!278994 (select (arr!17924 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!278992 () Unit!19548)

(assert (=> b!610216 (= lt!278992 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!278994 (select (arr!17924 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!610216 e!349542))

(declare-fun res!392553 () Bool)

(assert (=> b!610216 (=> (not res!392553) (not e!349542))))

(assert (=> b!610216 (= res!392553 (arrayContainsKey!0 lt!278994 (select (arr!17924 a!2986) j!136) j!136))))

(declare-fun b!610217 () Bool)

(declare-fun Unit!19553 () Unit!19548)

(assert (=> b!610217 (= e!349539 Unit!19553)))

(assert (=> b!610217 false))

(declare-fun res!392551 () Bool)

(assert (=> start!55686 (=> (not res!392551) (not e!349541))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55686 (= res!392551 (validMask!0 mask!3053))))

(assert (=> start!55686 e!349541))

(assert (=> start!55686 true))

(declare-fun array_inv!13807 (array!37350) Bool)

(assert (=> start!55686 (array_inv!13807 a!2986)))

(declare-fun b!610208 () Bool)

(declare-fun res!392549 () Bool)

(assert (=> b!610208 (=> (not res!392549) (not e!349541))))

(assert (=> b!610208 (= res!392549 (validKeyInArray!0 k0!1786))))

(declare-fun b!610218 () Bool)

(assert (=> b!610218 (= e!349541 e!349532)))

(declare-fun res!392547 () Bool)

(assert (=> b!610218 (=> (not res!392547) (not e!349532))))

(declare-fun lt!278990 () SeekEntryResult!6361)

(assert (=> b!610218 (= res!392547 (or (= lt!278990 (MissingZero!6361 i!1108)) (= lt!278990 (MissingVacant!6361 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37350 (_ BitVec 32)) SeekEntryResult!6361)

(assert (=> b!610218 (= lt!278990 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!610219 () Bool)

(declare-fun res!392546 () Bool)

(assert (=> b!610219 (=> (not res!392546) (not e!349532))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37350 (_ BitVec 32)) Bool)

(assert (=> b!610219 (= res!392546 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(assert (= (and start!55686 res!392551) b!610211))

(assert (= (and b!610211 res!392537) b!610210))

(assert (= (and b!610210 res!392543) b!610208))

(assert (= (and b!610208 res!392549) b!610200))

(assert (= (and b!610200 res!392548) b!610218))

(assert (= (and b!610218 res!392547) b!610219))

(assert (= (and b!610219 res!392546) b!610199))

(assert (= (and b!610199 res!392554) b!610197))

(assert (= (and b!610197 res!392538) b!610209))

(assert (= (and b!610209 res!392555) b!610212))

(assert (= (and b!610212 res!392540) b!610205))

(assert (= (and b!610205 res!392550) b!610213))

(assert (= (and b!610205 c!69197) b!610217))

(assert (= (and b!610205 (not c!69197)) b!610215))

(assert (= (and b!610205 (not res!392536)) b!610202))

(assert (= (and b!610202 res!392552) b!610214))

(assert (= (and b!610214 (not res!392539)) b!610198))

(assert (= (and b!610198 res!392542) b!610207))

(assert (= (and b!610202 (not res!392545)) b!610196))

(assert (= (and b!610196 c!69198) b!610206))

(assert (= (and b!610196 (not c!69198)) b!610203))

(assert (= (and b!610196 (not res!392544)) b!610216))

(assert (= (and b!610216 res!392553) b!610201))

(assert (= (and b!610216 (not res!392541)) b!610204))

(declare-fun m!586153 () Bool)

(assert (=> b!610199 m!586153))

(declare-fun m!586155 () Bool)

(assert (=> b!610204 m!586155))

(declare-fun m!586157 () Bool)

(assert (=> b!610219 m!586157))

(declare-fun m!586159 () Bool)

(assert (=> b!610214 m!586159))

(declare-fun m!586161 () Bool)

(assert (=> b!610200 m!586161))

(declare-fun m!586163 () Bool)

(assert (=> b!610205 m!586163))

(declare-fun m!586165 () Bool)

(assert (=> b!610205 m!586165))

(assert (=> b!610205 m!586159))

(declare-fun m!586167 () Bool)

(assert (=> b!610205 m!586167))

(declare-fun m!586169 () Bool)

(assert (=> b!610205 m!586169))

(declare-fun m!586171 () Bool)

(assert (=> b!610205 m!586171))

(declare-fun m!586173 () Bool)

(assert (=> b!610205 m!586173))

(assert (=> b!610205 m!586159))

(declare-fun m!586175 () Bool)

(assert (=> b!610205 m!586175))

(assert (=> b!610210 m!586159))

(assert (=> b!610210 m!586159))

(declare-fun m!586177 () Bool)

(assert (=> b!610210 m!586177))

(assert (=> b!610201 m!586159))

(assert (=> b!610201 m!586159))

(declare-fun m!586179 () Bool)

(assert (=> b!610201 m!586179))

(declare-fun m!586181 () Bool)

(assert (=> b!610218 m!586181))

(declare-fun m!586183 () Bool)

(assert (=> b!610212 m!586183))

(assert (=> b!610212 m!586159))

(assert (=> b!610212 m!586159))

(declare-fun m!586185 () Bool)

(assert (=> b!610212 m!586185))

(declare-fun m!586187 () Bool)

(assert (=> b!610197 m!586187))

(assert (=> b!610198 m!586159))

(assert (=> b!610198 m!586159))

(declare-fun m!586189 () Bool)

(assert (=> b!610198 m!586189))

(assert (=> b!610207 m!586159))

(assert (=> b!610207 m!586159))

(assert (=> b!610207 m!586179))

(declare-fun m!586191 () Bool)

(assert (=> start!55686 m!586191))

(declare-fun m!586193 () Bool)

(assert (=> start!55686 m!586193))

(assert (=> b!610202 m!586159))

(assert (=> b!610202 m!586167))

(declare-fun m!586195 () Bool)

(assert (=> b!610202 m!586195))

(assert (=> b!610209 m!586167))

(declare-fun m!586197 () Bool)

(assert (=> b!610209 m!586197))

(assert (=> b!610216 m!586159))

(assert (=> b!610216 m!586159))

(declare-fun m!586199 () Bool)

(assert (=> b!610216 m!586199))

(declare-fun m!586201 () Bool)

(assert (=> b!610216 m!586201))

(assert (=> b!610216 m!586159))

(assert (=> b!610216 m!586189))

(assert (=> b!610216 m!586159))

(declare-fun m!586203 () Bool)

(assert (=> b!610216 m!586203))

(declare-fun m!586205 () Bool)

(assert (=> b!610216 m!586205))

(declare-fun m!586207 () Bool)

(assert (=> b!610206 m!586207))

(assert (=> b!610206 m!586159))

(declare-fun m!586209 () Bool)

(assert (=> b!610206 m!586209))

(assert (=> b!610206 m!586159))

(declare-fun m!586211 () Bool)

(assert (=> b!610206 m!586211))

(assert (=> b!610206 m!586201))

(assert (=> b!610206 m!586159))

(declare-fun m!586213 () Bool)

(assert (=> b!610206 m!586213))

(assert (=> b!610206 m!586159))

(declare-fun m!586215 () Bool)

(assert (=> b!610206 m!586215))

(assert (=> b!610206 m!586205))

(declare-fun m!586217 () Bool)

(assert (=> b!610208 m!586217))

(check-sat (not b!610199) (not start!55686) (not b!610206) (not b!610216) (not b!610204) (not b!610201) (not b!610198) (not b!610212) (not b!610210) (not b!610207) (not b!610205) (not b!610219) (not b!610218) (not b!610208) (not b!610200))
(check-sat)
(get-model)

(declare-fun d!88033 () Bool)

(declare-fun res!392680 () Bool)

(declare-fun e!349646 () Bool)

(assert (=> d!88033 (=> res!392680 e!349646)))

(assert (=> d!88033 (= res!392680 (= (select (arr!17924 lt!278994) j!136) (select (arr!17924 a!2986) j!136)))))

(assert (=> d!88033 (= (arrayContainsKey!0 lt!278994 (select (arr!17924 a!2986) j!136) j!136) e!349646)))

(declare-fun b!610368 () Bool)

(declare-fun e!349647 () Bool)

(assert (=> b!610368 (= e!349646 e!349647)))

(declare-fun res!392681 () Bool)

(assert (=> b!610368 (=> (not res!392681) (not e!349647))))

(assert (=> b!610368 (= res!392681 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18289 lt!278994)))))

(declare-fun b!610369 () Bool)

(assert (=> b!610369 (= e!349647 (arrayContainsKey!0 lt!278994 (select (arr!17924 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!88033 (not res!392680)) b!610368))

(assert (= (and b!610368 res!392681) b!610369))

(declare-fun m!586351 () Bool)

(assert (=> d!88033 m!586351))

(assert (=> b!610369 m!586159))

(declare-fun m!586353 () Bool)

(assert (=> b!610369 m!586353))

(assert (=> b!610198 d!88033))

(declare-fun b!610378 () Bool)

(declare-fun e!349655 () Bool)

(declare-fun call!33112 () Bool)

(assert (=> b!610378 (= e!349655 call!33112)))

(declare-fun bm!33109 () Bool)

(assert (=> bm!33109 (= call!33112 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!610379 () Bool)

(declare-fun e!349654 () Bool)

(assert (=> b!610379 (= e!349654 e!349655)))

(declare-fun lt!279107 () (_ BitVec 64))

(assert (=> b!610379 (= lt!279107 (select (arr!17924 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!279109 () Unit!19548)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!37350 (_ BitVec 64) (_ BitVec 32)) Unit!19548)

(assert (=> b!610379 (= lt!279109 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!279107 #b00000000000000000000000000000000))))

(assert (=> b!610379 (arrayContainsKey!0 a!2986 lt!279107 #b00000000000000000000000000000000)))

(declare-fun lt!279108 () Unit!19548)

(assert (=> b!610379 (= lt!279108 lt!279109)))

(declare-fun res!392686 () Bool)

(assert (=> b!610379 (= res!392686 (= (seekEntryOrOpen!0 (select (arr!17924 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6361 #b00000000000000000000000000000000)))))

(assert (=> b!610379 (=> (not res!392686) (not e!349655))))

(declare-fun d!88035 () Bool)

(declare-fun res!392687 () Bool)

(declare-fun e!349656 () Bool)

(assert (=> d!88035 (=> res!392687 e!349656)))

(assert (=> d!88035 (= res!392687 (bvsge #b00000000000000000000000000000000 (size!18289 a!2986)))))

(assert (=> d!88035 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!349656)))

(declare-fun b!610380 () Bool)

(assert (=> b!610380 (= e!349656 e!349654)))

(declare-fun c!69213 () Bool)

(assert (=> b!610380 (= c!69213 (validKeyInArray!0 (select (arr!17924 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!610381 () Bool)

(assert (=> b!610381 (= e!349654 call!33112)))

(assert (= (and d!88035 (not res!392687)) b!610380))

(assert (= (and b!610380 c!69213) b!610379))

(assert (= (and b!610380 (not c!69213)) b!610381))

(assert (= (and b!610379 res!392686) b!610378))

(assert (= (or b!610378 b!610381) bm!33109))

(declare-fun m!586355 () Bool)

(assert (=> bm!33109 m!586355))

(declare-fun m!586357 () Bool)

(assert (=> b!610379 m!586357))

(declare-fun m!586359 () Bool)

(assert (=> b!610379 m!586359))

(declare-fun m!586361 () Bool)

(assert (=> b!610379 m!586361))

(assert (=> b!610379 m!586357))

(declare-fun m!586363 () Bool)

(assert (=> b!610379 m!586363))

(assert (=> b!610380 m!586357))

(assert (=> b!610380 m!586357))

(declare-fun m!586365 () Bool)

(assert (=> b!610380 m!586365))

(assert (=> b!610219 d!88035))

(declare-fun d!88037 () Bool)

(assert (=> d!88037 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!610208 d!88037))

(declare-fun d!88039 () Bool)

(declare-fun lt!279116 () SeekEntryResult!6361)

(get-info :version)

(assert (=> d!88039 (and (or ((_ is Undefined!6361) lt!279116) (not ((_ is Found!6361) lt!279116)) (and (bvsge (index!27723 lt!279116) #b00000000000000000000000000000000) (bvslt (index!27723 lt!279116) (size!18289 a!2986)))) (or ((_ is Undefined!6361) lt!279116) ((_ is Found!6361) lt!279116) (not ((_ is MissingZero!6361) lt!279116)) (and (bvsge (index!27722 lt!279116) #b00000000000000000000000000000000) (bvslt (index!27722 lt!279116) (size!18289 a!2986)))) (or ((_ is Undefined!6361) lt!279116) ((_ is Found!6361) lt!279116) ((_ is MissingZero!6361) lt!279116) (not ((_ is MissingVacant!6361) lt!279116)) (and (bvsge (index!27725 lt!279116) #b00000000000000000000000000000000) (bvslt (index!27725 lt!279116) (size!18289 a!2986)))) (or ((_ is Undefined!6361) lt!279116) (ite ((_ is Found!6361) lt!279116) (= (select (arr!17924 a!2986) (index!27723 lt!279116)) k0!1786) (ite ((_ is MissingZero!6361) lt!279116) (= (select (arr!17924 a!2986) (index!27722 lt!279116)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!6361) lt!279116) (= (select (arr!17924 a!2986) (index!27725 lt!279116)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!349663 () SeekEntryResult!6361)

(assert (=> d!88039 (= lt!279116 e!349663)))

(declare-fun c!69221 () Bool)

(declare-fun lt!279117 () SeekEntryResult!6361)

(assert (=> d!88039 (= c!69221 (and ((_ is Intermediate!6361) lt!279117) (undefined!7173 lt!279117)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37350 (_ BitVec 32)) SeekEntryResult!6361)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!88039 (= lt!279117 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!88039 (validMask!0 mask!3053)))

(assert (=> d!88039 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!279116)))

(declare-fun b!610394 () Bool)

(declare-fun e!349664 () SeekEntryResult!6361)

(assert (=> b!610394 (= e!349664 (MissingZero!6361 (index!27724 lt!279117)))))

(declare-fun b!610395 () Bool)

(assert (=> b!610395 (= e!349663 Undefined!6361)))

(declare-fun b!610396 () Bool)

(declare-fun c!69220 () Bool)

(declare-fun lt!279118 () (_ BitVec 64))

(assert (=> b!610396 (= c!69220 (= lt!279118 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!349665 () SeekEntryResult!6361)

(assert (=> b!610396 (= e!349665 e!349664)))

(declare-fun b!610397 () Bool)

(assert (=> b!610397 (= e!349665 (Found!6361 (index!27724 lt!279117)))))

(declare-fun b!610398 () Bool)

(assert (=> b!610398 (= e!349664 (seekKeyOrZeroReturnVacant!0 (x!56538 lt!279117) (index!27724 lt!279117) (index!27724 lt!279117) k0!1786 a!2986 mask!3053))))

(declare-fun b!610399 () Bool)

(assert (=> b!610399 (= e!349663 e!349665)))

(assert (=> b!610399 (= lt!279118 (select (arr!17924 a!2986) (index!27724 lt!279117)))))

(declare-fun c!69222 () Bool)

(assert (=> b!610399 (= c!69222 (= lt!279118 k0!1786))))

(assert (= (and d!88039 c!69221) b!610395))

(assert (= (and d!88039 (not c!69221)) b!610399))

(assert (= (and b!610399 c!69222) b!610397))

(assert (= (and b!610399 (not c!69222)) b!610396))

(assert (= (and b!610396 c!69220) b!610394))

(assert (= (and b!610396 (not c!69220)) b!610398))

(declare-fun m!586367 () Bool)

(assert (=> d!88039 m!586367))

(declare-fun m!586369 () Bool)

(assert (=> d!88039 m!586369))

(assert (=> d!88039 m!586367))

(declare-fun m!586371 () Bool)

(assert (=> d!88039 m!586371))

(assert (=> d!88039 m!586191))

(declare-fun m!586373 () Bool)

(assert (=> d!88039 m!586373))

(declare-fun m!586375 () Bool)

(assert (=> d!88039 m!586375))

(declare-fun m!586377 () Bool)

(assert (=> b!610398 m!586377))

(declare-fun m!586379 () Bool)

(assert (=> b!610399 m!586379))

(assert (=> b!610218 d!88039))

(declare-fun d!88041 () Bool)

(declare-fun res!392688 () Bool)

(declare-fun e!349666 () Bool)

(assert (=> d!88041 (=> res!392688 e!349666)))

(assert (=> d!88041 (= res!392688 (= (select (arr!17924 lt!278994) index!984) (select (arr!17924 a!2986) j!136)))))

(assert (=> d!88041 (= (arrayContainsKey!0 lt!278994 (select (arr!17924 a!2986) j!136) index!984) e!349666)))

(declare-fun b!610400 () Bool)

(declare-fun e!349667 () Bool)

(assert (=> b!610400 (= e!349666 e!349667)))

(declare-fun res!392689 () Bool)

(assert (=> b!610400 (=> (not res!392689) (not e!349667))))

(assert (=> b!610400 (= res!392689 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18289 lt!278994)))))

(declare-fun b!610401 () Bool)

(assert (=> b!610401 (= e!349667 (arrayContainsKey!0 lt!278994 (select (arr!17924 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!88041 (not res!392688)) b!610400))

(assert (= (and b!610400 res!392689) b!610401))

(declare-fun m!586381 () Bool)

(assert (=> d!88041 m!586381))

(assert (=> b!610401 m!586159))

(declare-fun m!586383 () Bool)

(assert (=> b!610401 m!586383))

(assert (=> b!610207 d!88041))

(declare-fun d!88043 () Bool)

(assert (=> d!88043 (arrayContainsKey!0 lt!278994 (select (arr!17924 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!279121 () Unit!19548)

(declare-fun choose!114 (array!37350 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19548)

(assert (=> d!88043 (= lt!279121 (choose!114 lt!278994 (select (arr!17924 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> d!88043 (bvsge index!984 #b00000000000000000000000000000000)))

(assert (=> d!88043 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!278994 (select (arr!17924 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)) lt!279121)))

(declare-fun bs!18598 () Bool)

(assert (= bs!18598 d!88043))

(assert (=> bs!18598 m!586159))

(assert (=> bs!18598 m!586215))

(assert (=> bs!18598 m!586159))

(declare-fun m!586385 () Bool)

(assert (=> bs!18598 m!586385))

(assert (=> b!610206 d!88043))

(declare-fun d!88045 () Bool)

(declare-fun res!392690 () Bool)

(declare-fun e!349668 () Bool)

(assert (=> d!88045 (=> res!392690 e!349668)))

(assert (=> d!88045 (= res!392690 (= (select (arr!17924 lt!278994) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!17924 a!2986) j!136)))))

(assert (=> d!88045 (= (arrayContainsKey!0 lt!278994 (select (arr!17924 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!349668)))

(declare-fun b!610402 () Bool)

(declare-fun e!349669 () Bool)

(assert (=> b!610402 (= e!349668 e!349669)))

(declare-fun res!392691 () Bool)

(assert (=> b!610402 (=> (not res!392691) (not e!349669))))

(assert (=> b!610402 (= res!392691 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18289 lt!278994)))))

(declare-fun b!610403 () Bool)

(assert (=> b!610403 (= e!349669 (arrayContainsKey!0 lt!278994 (select (arr!17924 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!88045 (not res!392690)) b!610402))

(assert (= (and b!610402 res!392691) b!610403))

(declare-fun m!586387 () Bool)

(assert (=> d!88045 m!586387))

(assert (=> b!610403 m!586159))

(declare-fun m!586389 () Bool)

(assert (=> b!610403 m!586389))

(assert (=> b!610206 d!88045))

(declare-fun d!88047 () Bool)

(assert (=> d!88047 (arrayNoDuplicates!0 lt!278994 j!136 Nil!12001)))

(declare-fun lt!279124 () Unit!19548)

(declare-fun choose!39 (array!37350 (_ BitVec 32) (_ BitVec 32)) Unit!19548)

(assert (=> d!88047 (= lt!279124 (choose!39 lt!278994 #b00000000000000000000000000000000 j!136))))

(assert (=> d!88047 (bvslt (size!18289 lt!278994) #b01111111111111111111111111111111)))

(assert (=> d!88047 (= (lemmaNoDuplicateFromThenFromBigger!0 lt!278994 #b00000000000000000000000000000000 j!136) lt!279124)))

(declare-fun bs!18599 () Bool)

(assert (= bs!18599 d!88047))

(assert (=> bs!18599 m!586207))

(declare-fun m!586391 () Bool)

(assert (=> bs!18599 m!586391))

(assert (=> b!610206 d!88047))

(declare-fun b!610414 () Bool)

(declare-fun e!349678 () Bool)

(declare-fun call!33115 () Bool)

(assert (=> b!610414 (= e!349678 call!33115)))

(declare-fun b!610415 () Bool)

(declare-fun e!349681 () Bool)

(declare-fun contains!3023 (List!12004 (_ BitVec 64)) Bool)

(assert (=> b!610415 (= e!349681 (contains!3023 Nil!12001 (select (arr!17924 lt!278994) #b00000000000000000000000000000000)))))

(declare-fun b!610416 () Bool)

(declare-fun e!349679 () Bool)

(assert (=> b!610416 (= e!349679 e!349678)))

(declare-fun c!69225 () Bool)

(assert (=> b!610416 (= c!69225 (validKeyInArray!0 (select (arr!17924 lt!278994) #b00000000000000000000000000000000)))))

(declare-fun b!610417 () Bool)

(declare-fun e!349680 () Bool)

(assert (=> b!610417 (= e!349680 e!349679)))

(declare-fun res!392698 () Bool)

(assert (=> b!610417 (=> (not res!392698) (not e!349679))))

(assert (=> b!610417 (= res!392698 (not e!349681))))

(declare-fun res!392699 () Bool)

(assert (=> b!610417 (=> (not res!392699) (not e!349681))))

(assert (=> b!610417 (= res!392699 (validKeyInArray!0 (select (arr!17924 lt!278994) #b00000000000000000000000000000000)))))

(declare-fun b!610418 () Bool)

(assert (=> b!610418 (= e!349678 call!33115)))

(declare-fun d!88049 () Bool)

(declare-fun res!392700 () Bool)

(assert (=> d!88049 (=> res!392700 e!349680)))

(assert (=> d!88049 (= res!392700 (bvsge #b00000000000000000000000000000000 (size!18289 lt!278994)))))

(assert (=> d!88049 (= (arrayNoDuplicates!0 lt!278994 #b00000000000000000000000000000000 Nil!12001) e!349680)))

(declare-fun bm!33112 () Bool)

(assert (=> bm!33112 (= call!33115 (arrayNoDuplicates!0 lt!278994 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!69225 (Cons!12000 (select (arr!17924 lt!278994) #b00000000000000000000000000000000) Nil!12001) Nil!12001)))))

(assert (= (and d!88049 (not res!392700)) b!610417))

(assert (= (and b!610417 res!392699) b!610415))

(assert (= (and b!610417 res!392698) b!610416))

(assert (= (and b!610416 c!69225) b!610414))

(assert (= (and b!610416 (not c!69225)) b!610418))

(assert (= (or b!610414 b!610418) bm!33112))

(declare-fun m!586393 () Bool)

(assert (=> b!610415 m!586393))

(assert (=> b!610415 m!586393))

(declare-fun m!586395 () Bool)

(assert (=> b!610415 m!586395))

(assert (=> b!610416 m!586393))

(assert (=> b!610416 m!586393))

(declare-fun m!586397 () Bool)

(assert (=> b!610416 m!586397))

(assert (=> b!610417 m!586393))

(assert (=> b!610417 m!586393))

(assert (=> b!610417 m!586397))

(assert (=> bm!33112 m!586393))

(declare-fun m!586399 () Bool)

(assert (=> bm!33112 m!586399))

(assert (=> b!610206 d!88049))

(declare-fun d!88051 () Bool)

(declare-fun e!349684 () Bool)

(assert (=> d!88051 e!349684))

(declare-fun res!392703 () Bool)

(assert (=> d!88051 (=> (not res!392703) (not e!349684))))

(assert (=> d!88051 (= res!392703 (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18289 a!2986))))))

(declare-fun lt!279127 () Unit!19548)

(declare-fun choose!41 (array!37350 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12004) Unit!19548)

(assert (=> d!88051 (= lt!279127 (choose!41 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12001))))

(assert (=> d!88051 (bvslt (size!18289 a!2986) #b01111111111111111111111111111111)))

(assert (=> d!88051 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12001) lt!279127)))

(declare-fun b!610421 () Bool)

(assert (=> b!610421 (= e!349684 (arrayNoDuplicates!0 (array!37351 (store (arr!17924 a!2986) i!1108 k0!1786) (size!18289 a!2986)) #b00000000000000000000000000000000 Nil!12001))))

(assert (= (and d!88051 res!392703) b!610421))

(declare-fun m!586401 () Bool)

(assert (=> d!88051 m!586401))

(assert (=> b!610421 m!586167))

(declare-fun m!586403 () Bool)

(assert (=> b!610421 m!586403))

(assert (=> b!610206 d!88051))

(declare-fun d!88055 () Bool)

(assert (=> d!88055 (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18289 lt!278994)) (not (= (select (arr!17924 lt!278994) j!136) (select (arr!17924 a!2986) j!136))))))

(declare-fun lt!279130 () Unit!19548)

(declare-fun choose!21 (array!37350 (_ BitVec 64) (_ BitVec 32) List!12004) Unit!19548)

(assert (=> d!88055 (= lt!279130 (choose!21 lt!278994 (select (arr!17924 a!2986) j!136) j!136 Nil!12001))))

(assert (=> d!88055 (bvslt (size!18289 lt!278994) #b01111111111111111111111111111111)))

(assert (=> d!88055 (= (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!278994 (select (arr!17924 a!2986) j!136) j!136 Nil!12001) lt!279130)))

(declare-fun bs!18600 () Bool)

(assert (= bs!18600 d!88055))

(assert (=> bs!18600 m!586351))

(assert (=> bs!18600 m!586159))

(declare-fun m!586405 () Bool)

(assert (=> bs!18600 m!586405))

(assert (=> b!610206 d!88055))

(declare-fun b!610422 () Bool)

(declare-fun e!349685 () Bool)

(declare-fun call!33116 () Bool)

(assert (=> b!610422 (= e!349685 call!33116)))

(declare-fun b!610423 () Bool)

(declare-fun e!349688 () Bool)

(assert (=> b!610423 (= e!349688 (contains!3023 Nil!12001 (select (arr!17924 lt!278994) j!136)))))

(declare-fun b!610424 () Bool)

(declare-fun e!349686 () Bool)

(assert (=> b!610424 (= e!349686 e!349685)))

(declare-fun c!69226 () Bool)

(assert (=> b!610424 (= c!69226 (validKeyInArray!0 (select (arr!17924 lt!278994) j!136)))))

(declare-fun b!610425 () Bool)

(declare-fun e!349687 () Bool)

(assert (=> b!610425 (= e!349687 e!349686)))

(declare-fun res!392704 () Bool)

(assert (=> b!610425 (=> (not res!392704) (not e!349686))))

(assert (=> b!610425 (= res!392704 (not e!349688))))

(declare-fun res!392705 () Bool)

(assert (=> b!610425 (=> (not res!392705) (not e!349688))))

(assert (=> b!610425 (= res!392705 (validKeyInArray!0 (select (arr!17924 lt!278994) j!136)))))

(declare-fun b!610426 () Bool)

(assert (=> b!610426 (= e!349685 call!33116)))

(declare-fun d!88057 () Bool)

(declare-fun res!392706 () Bool)

(assert (=> d!88057 (=> res!392706 e!349687)))

(assert (=> d!88057 (= res!392706 (bvsge j!136 (size!18289 lt!278994)))))

(assert (=> d!88057 (= (arrayNoDuplicates!0 lt!278994 j!136 Nil!12001) e!349687)))

(declare-fun bm!33113 () Bool)

(assert (=> bm!33113 (= call!33116 (arrayNoDuplicates!0 lt!278994 (bvadd j!136 #b00000000000000000000000000000001) (ite c!69226 (Cons!12000 (select (arr!17924 lt!278994) j!136) Nil!12001) Nil!12001)))))

(assert (= (and d!88057 (not res!392706)) b!610425))

(assert (= (and b!610425 res!392705) b!610423))

(assert (= (and b!610425 res!392704) b!610424))

(assert (= (and b!610424 c!69226) b!610422))

(assert (= (and b!610424 (not c!69226)) b!610426))

(assert (= (or b!610422 b!610426) bm!33113))

(assert (=> b!610423 m!586351))

(assert (=> b!610423 m!586351))

(declare-fun m!586407 () Bool)

(assert (=> b!610423 m!586407))

(assert (=> b!610424 m!586351))

(assert (=> b!610424 m!586351))

(declare-fun m!586409 () Bool)

(assert (=> b!610424 m!586409))

(assert (=> b!610425 m!586351))

(assert (=> b!610425 m!586351))

(assert (=> b!610425 m!586409))

(assert (=> bm!33113 m!586351))

(declare-fun m!586411 () Bool)

(assert (=> bm!33113 m!586411))

(assert (=> b!610206 d!88057))

(declare-fun d!88061 () Bool)

(declare-fun res!392707 () Bool)

(declare-fun e!349689 () Bool)

(assert (=> d!88061 (=> res!392707 e!349689)))

(assert (=> d!88061 (= res!392707 (= (select (arr!17924 lt!278994) (bvadd #b00000000000000000000000000000001 index!984)) (select (arr!17924 a!2986) j!136)))))

(assert (=> d!88061 (= (arrayContainsKey!0 lt!278994 (select (arr!17924 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984)) e!349689)))

(declare-fun b!610427 () Bool)

(declare-fun e!349690 () Bool)

(assert (=> b!610427 (= e!349689 e!349690)))

(declare-fun res!392708 () Bool)

(assert (=> b!610427 (=> (not res!392708) (not e!349690))))

(assert (=> b!610427 (= res!392708 (bvslt (bvadd #b00000000000000000000000000000001 index!984 #b00000000000000000000000000000001) (size!18289 lt!278994)))))

(declare-fun b!610428 () Bool)

(assert (=> b!610428 (= e!349690 (arrayContainsKey!0 lt!278994 (select (arr!17924 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!88061 (not res!392707)) b!610427))

(assert (= (and b!610427 res!392708) b!610428))

(declare-fun m!586413 () Bool)

(assert (=> d!88061 m!586413))

(assert (=> b!610428 m!586159))

(declare-fun m!586415 () Bool)

(assert (=> b!610428 m!586415))

(assert (=> b!610216 d!88061))

(assert (=> b!610216 d!88033))

(declare-fun d!88063 () Bool)

(assert (=> d!88063 (arrayContainsKey!0 lt!278994 (select (arr!17924 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!279131 () Unit!19548)

(assert (=> d!88063 (= lt!279131 (choose!114 lt!278994 (select (arr!17924 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> d!88063 (bvsge j!136 #b00000000000000000000000000000000)))

(assert (=> d!88063 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!278994 (select (arr!17924 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)) lt!279131)))

(declare-fun bs!18601 () Bool)

(assert (= bs!18601 d!88063))

(assert (=> bs!18601 m!586159))

(assert (=> bs!18601 m!586199))

(assert (=> bs!18601 m!586159))

(declare-fun m!586417 () Bool)

(assert (=> bs!18601 m!586417))

(assert (=> b!610216 d!88063))

(assert (=> b!610216 d!88049))

(assert (=> b!610216 d!88051))

(declare-fun d!88067 () Bool)

(declare-fun lt!279143 () SeekEntryResult!6361)

(assert (=> d!88067 (and (or ((_ is Undefined!6361) lt!279143) (not ((_ is Found!6361) lt!279143)) (and (bvsge (index!27723 lt!279143) #b00000000000000000000000000000000) (bvslt (index!27723 lt!279143) (size!18289 a!2986)))) (or ((_ is Undefined!6361) lt!279143) ((_ is Found!6361) lt!279143) (not ((_ is MissingVacant!6361) lt!279143)) (not (= (index!27725 lt!279143) vacantSpotIndex!68)) (and (bvsge (index!27725 lt!279143) #b00000000000000000000000000000000) (bvslt (index!27725 lt!279143) (size!18289 a!2986)))) (or ((_ is Undefined!6361) lt!279143) (ite ((_ is Found!6361) lt!279143) (= (select (arr!17924 a!2986) (index!27723 lt!279143)) (select (arr!17924 a!2986) j!136)) (and ((_ is MissingVacant!6361) lt!279143) (= (index!27725 lt!279143) vacantSpotIndex!68) (= (select (arr!17924 a!2986) (index!27725 lt!279143)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!349719 () SeekEntryResult!6361)

(assert (=> d!88067 (= lt!279143 e!349719)))

(declare-fun c!69247 () Bool)

(assert (=> d!88067 (= c!69247 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(declare-fun lt!279142 () (_ BitVec 64))

(assert (=> d!88067 (= lt!279142 (select (arr!17924 a!2986) lt!278988))))

(assert (=> d!88067 (validMask!0 mask!3053)))

(assert (=> d!88067 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!278988 vacantSpotIndex!68 (select (arr!17924 a!2986) j!136) a!2986 mask!3053) lt!279143)))

(declare-fun b!610474 () Bool)

(declare-fun e!349718 () SeekEntryResult!6361)

(assert (=> b!610474 (= e!349719 e!349718)))

(declare-fun c!69246 () Bool)

(assert (=> b!610474 (= c!69246 (= lt!279142 (select (arr!17924 a!2986) j!136)))))

(declare-fun b!610475 () Bool)

(declare-fun e!349720 () SeekEntryResult!6361)

(assert (=> b!610475 (= e!349720 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!278988 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 (select (arr!17924 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!610476 () Bool)

(declare-fun c!69245 () Bool)

(assert (=> b!610476 (= c!69245 (= lt!279142 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!610476 (= e!349718 e!349720)))

(declare-fun b!610477 () Bool)

(assert (=> b!610477 (= e!349718 (Found!6361 lt!278988))))

(declare-fun b!610478 () Bool)

(assert (=> b!610478 (= e!349719 Undefined!6361)))

(declare-fun b!610479 () Bool)

(assert (=> b!610479 (= e!349720 (MissingVacant!6361 vacantSpotIndex!68))))

(assert (= (and d!88067 c!69247) b!610478))

(assert (= (and d!88067 (not c!69247)) b!610474))

(assert (= (and b!610474 c!69246) b!610477))

(assert (= (and b!610474 (not c!69246)) b!610476))

(assert (= (and b!610476 c!69245) b!610479))

(assert (= (and b!610476 (not c!69245)) b!610475))

(declare-fun m!586433 () Bool)

(assert (=> d!88067 m!586433))

(declare-fun m!586435 () Bool)

(assert (=> d!88067 m!586435))

(declare-fun m!586437 () Bool)

(assert (=> d!88067 m!586437))

(assert (=> d!88067 m!586191))

(declare-fun m!586439 () Bool)

(assert (=> b!610475 m!586439))

(assert (=> b!610475 m!586439))

(assert (=> b!610475 m!586159))

(declare-fun m!586441 () Bool)

(assert (=> b!610475 m!586441))

(assert (=> b!610205 d!88067))

(declare-fun d!88073 () Bool)

(declare-fun lt!279146 () (_ BitVec 32))

(assert (=> d!88073 (and (bvsge lt!279146 #b00000000000000000000000000000000) (bvslt lt!279146 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!88073 (= lt!279146 (choose!52 index!984 x!910 mask!3053))))

(assert (=> d!88073 (validMask!0 mask!3053)))

(assert (=> d!88073 (= (nextIndex!0 index!984 x!910 mask!3053) lt!279146)))

(declare-fun bs!18602 () Bool)

(assert (= bs!18602 d!88073))

(declare-fun m!586443 () Bool)

(assert (=> bs!18602 m!586443))

(assert (=> bs!18602 m!586191))

(assert (=> b!610205 d!88073))

(declare-fun lt!279148 () SeekEntryResult!6361)

(declare-fun d!88075 () Bool)

(assert (=> d!88075 (and (or ((_ is Undefined!6361) lt!279148) (not ((_ is Found!6361) lt!279148)) (and (bvsge (index!27723 lt!279148) #b00000000000000000000000000000000) (bvslt (index!27723 lt!279148) (size!18289 lt!278994)))) (or ((_ is Undefined!6361) lt!279148) ((_ is Found!6361) lt!279148) (not ((_ is MissingVacant!6361) lt!279148)) (not (= (index!27725 lt!279148) vacantSpotIndex!68)) (and (bvsge (index!27725 lt!279148) #b00000000000000000000000000000000) (bvslt (index!27725 lt!279148) (size!18289 lt!278994)))) (or ((_ is Undefined!6361) lt!279148) (ite ((_ is Found!6361) lt!279148) (= (select (arr!17924 lt!278994) (index!27723 lt!279148)) lt!278998) (and ((_ is MissingVacant!6361) lt!279148) (= (index!27725 lt!279148) vacantSpotIndex!68) (= (select (arr!17924 lt!278994) (index!27725 lt!279148)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!349722 () SeekEntryResult!6361)

(assert (=> d!88075 (= lt!279148 e!349722)))

(declare-fun c!69250 () Bool)

(assert (=> d!88075 (= c!69250 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(declare-fun lt!279147 () (_ BitVec 64))

(assert (=> d!88075 (= lt!279147 (select (arr!17924 lt!278994) lt!278988))))

(assert (=> d!88075 (validMask!0 mask!3053)))

(assert (=> d!88075 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!278988 vacantSpotIndex!68 lt!278998 lt!278994 mask!3053) lt!279148)))

(declare-fun b!610480 () Bool)

(declare-fun e!349721 () SeekEntryResult!6361)

(assert (=> b!610480 (= e!349722 e!349721)))

(declare-fun c!69249 () Bool)

(assert (=> b!610480 (= c!69249 (= lt!279147 lt!278998))))

(declare-fun e!349723 () SeekEntryResult!6361)

(declare-fun b!610481 () Bool)

(assert (=> b!610481 (= e!349723 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!278988 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 lt!278998 lt!278994 mask!3053))))

(declare-fun b!610482 () Bool)

(declare-fun c!69248 () Bool)

(assert (=> b!610482 (= c!69248 (= lt!279147 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!610482 (= e!349721 e!349723)))

(declare-fun b!610483 () Bool)

(assert (=> b!610483 (= e!349721 (Found!6361 lt!278988))))

(declare-fun b!610484 () Bool)

(assert (=> b!610484 (= e!349722 Undefined!6361)))

(declare-fun b!610485 () Bool)

(assert (=> b!610485 (= e!349723 (MissingVacant!6361 vacantSpotIndex!68))))

(assert (= (and d!88075 c!69250) b!610484))

(assert (= (and d!88075 (not c!69250)) b!610480))

(assert (= (and b!610480 c!69249) b!610483))

(assert (= (and b!610480 (not c!69249)) b!610482))

(assert (= (and b!610482 c!69248) b!610485))

(assert (= (and b!610482 (not c!69248)) b!610481))

(declare-fun m!586445 () Bool)

(assert (=> d!88075 m!586445))

(declare-fun m!586447 () Bool)

(assert (=> d!88075 m!586447))

(declare-fun m!586449 () Bool)

(assert (=> d!88075 m!586449))

(assert (=> d!88075 m!586191))

(assert (=> b!610481 m!586439))

(assert (=> b!610481 m!586439))

(declare-fun m!586451 () Bool)

(assert (=> b!610481 m!586451))

(assert (=> b!610205 d!88075))

(declare-fun d!88081 () Bool)

(declare-fun e!349750 () Bool)

(assert (=> d!88081 e!349750))

(declare-fun res!392732 () Bool)

(assert (=> d!88081 (=> (not res!392732) (not e!349750))))

(assert (=> d!88081 (= res!392732 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18289 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18289 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18289 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18289 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18289 a!2986))))))

(declare-fun lt!279169 () Unit!19548)

(declare-fun choose!9 (array!37350 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19548)

(assert (=> d!88081 (= lt!279169 (choose!9 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!278988 vacantSpotIndex!68 mask!3053))))

(assert (=> d!88081 (validMask!0 mask!3053)))

(assert (=> d!88081 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!278988 vacantSpotIndex!68 mask!3053) lt!279169)))

(declare-fun b!610524 () Bool)

(assert (=> b!610524 (= e!349750 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!278988 vacantSpotIndex!68 (select (arr!17924 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!278988 vacantSpotIndex!68 (select (store (arr!17924 a!2986) i!1108 k0!1786) j!136) (array!37351 (store (arr!17924 a!2986) i!1108 k0!1786) (size!18289 a!2986)) mask!3053)))))

(assert (= (and d!88081 res!392732) b!610524))

(declare-fun m!586481 () Bool)

(assert (=> d!88081 m!586481))

(assert (=> d!88081 m!586191))

(assert (=> b!610524 m!586159))

(assert (=> b!610524 m!586159))

(assert (=> b!610524 m!586175))

(assert (=> b!610524 m!586165))

(assert (=> b!610524 m!586167))

(assert (=> b!610524 m!586165))

(declare-fun m!586483 () Bool)

(assert (=> b!610524 m!586483))

(assert (=> b!610205 d!88081))

(declare-fun lt!279171 () SeekEntryResult!6361)

(declare-fun d!88089 () Bool)

(assert (=> d!88089 (and (or ((_ is Undefined!6361) lt!279171) (not ((_ is Found!6361) lt!279171)) (and (bvsge (index!27723 lt!279171) #b00000000000000000000000000000000) (bvslt (index!27723 lt!279171) (size!18289 lt!278994)))) (or ((_ is Undefined!6361) lt!279171) ((_ is Found!6361) lt!279171) (not ((_ is MissingVacant!6361) lt!279171)) (not (= (index!27725 lt!279171) vacantSpotIndex!68)) (and (bvsge (index!27725 lt!279171) #b00000000000000000000000000000000) (bvslt (index!27725 lt!279171) (size!18289 lt!278994)))) (or ((_ is Undefined!6361) lt!279171) (ite ((_ is Found!6361) lt!279171) (= (select (arr!17924 lt!278994) (index!27723 lt!279171)) lt!278998) (and ((_ is MissingVacant!6361) lt!279171) (= (index!27725 lt!279171) vacantSpotIndex!68) (= (select (arr!17924 lt!278994) (index!27725 lt!279171)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!349752 () SeekEntryResult!6361)

(assert (=> d!88089 (= lt!279171 e!349752)))

(declare-fun c!69265 () Bool)

(assert (=> d!88089 (= c!69265 (bvsge x!910 #b01111111111111111111111111111110))))

(declare-fun lt!279170 () (_ BitVec 64))

(assert (=> d!88089 (= lt!279170 (select (arr!17924 lt!278994) index!984))))

(assert (=> d!88089 (validMask!0 mask!3053)))

(assert (=> d!88089 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!278998 lt!278994 mask!3053) lt!279171)))

(declare-fun b!610525 () Bool)

(declare-fun e!349751 () SeekEntryResult!6361)

(assert (=> b!610525 (= e!349752 e!349751)))

(declare-fun c!69264 () Bool)

(assert (=> b!610525 (= c!69264 (= lt!279170 lt!278998))))

(declare-fun e!349753 () SeekEntryResult!6361)

(declare-fun b!610526 () Bool)

(assert (=> b!610526 (= e!349753 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 lt!278998 lt!278994 mask!3053))))

(declare-fun b!610527 () Bool)

(declare-fun c!69263 () Bool)

(assert (=> b!610527 (= c!69263 (= lt!279170 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!610527 (= e!349751 e!349753)))

(declare-fun b!610528 () Bool)

(assert (=> b!610528 (= e!349751 (Found!6361 index!984))))

(declare-fun b!610529 () Bool)

(assert (=> b!610529 (= e!349752 Undefined!6361)))

(declare-fun b!610530 () Bool)

(assert (=> b!610530 (= e!349753 (MissingVacant!6361 vacantSpotIndex!68))))

(assert (= (and d!88089 c!69265) b!610529))

(assert (= (and d!88089 (not c!69265)) b!610525))

(assert (= (and b!610525 c!69264) b!610528))

(assert (= (and b!610525 (not c!69264)) b!610527))

(assert (= (and b!610527 c!69263) b!610530))

(assert (= (and b!610527 (not c!69263)) b!610526))

(declare-fun m!586485 () Bool)

(assert (=> d!88089 m!586485))

(declare-fun m!586487 () Bool)

(assert (=> d!88089 m!586487))

(assert (=> d!88089 m!586381))

(assert (=> d!88089 m!586191))

(assert (=> b!610526 m!586163))

(assert (=> b!610526 m!586163))

(declare-fun m!586489 () Bool)

(assert (=> b!610526 m!586489))

(assert (=> b!610205 d!88089))

(declare-fun d!88091 () Bool)

(declare-fun res!392743 () Bool)

(declare-fun e!349766 () Bool)

(assert (=> d!88091 (=> res!392743 e!349766)))

(assert (=> d!88091 (= res!392743 ((_ is Nil!12001) Nil!12001))))

(assert (=> d!88091 (= (noDuplicate!347 Nil!12001) e!349766)))

(declare-fun b!610545 () Bool)

(declare-fun e!349767 () Bool)

(assert (=> b!610545 (= e!349766 e!349767)))

(declare-fun res!392744 () Bool)

(assert (=> b!610545 (=> (not res!392744) (not e!349767))))

(assert (=> b!610545 (= res!392744 (not (contains!3023 (t!18223 Nil!12001) (h!13045 Nil!12001))))))

(declare-fun b!610546 () Bool)

(assert (=> b!610546 (= e!349767 (noDuplicate!347 (t!18223 Nil!12001)))))

(assert (= (and d!88091 (not res!392743)) b!610545))

(assert (= (and b!610545 res!392744) b!610546))

(declare-fun m!586491 () Bool)

(assert (=> b!610545 m!586491))

(declare-fun m!586493 () Bool)

(assert (=> b!610546 m!586493))

(assert (=> b!610204 d!88091))

(declare-fun d!88093 () Bool)

(assert (=> d!88093 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!55686 d!88093))

(declare-fun d!88113 () Bool)

(assert (=> d!88113 (= (array_inv!13807 a!2986) (bvsge (size!18289 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!55686 d!88113))

(declare-fun lt!279182 () SeekEntryResult!6361)

(declare-fun d!88115 () Bool)

(assert (=> d!88115 (and (or ((_ is Undefined!6361) lt!279182) (not ((_ is Found!6361) lt!279182)) (and (bvsge (index!27723 lt!279182) #b00000000000000000000000000000000) (bvslt (index!27723 lt!279182) (size!18289 a!2986)))) (or ((_ is Undefined!6361) lt!279182) ((_ is Found!6361) lt!279182) (not ((_ is MissingVacant!6361) lt!279182)) (not (= (index!27725 lt!279182) vacantSpotIndex!68)) (and (bvsge (index!27725 lt!279182) #b00000000000000000000000000000000) (bvslt (index!27725 lt!279182) (size!18289 a!2986)))) (or ((_ is Undefined!6361) lt!279182) (ite ((_ is Found!6361) lt!279182) (= (select (arr!17924 a!2986) (index!27723 lt!279182)) (select (arr!17924 a!2986) j!136)) (and ((_ is MissingVacant!6361) lt!279182) (= (index!27725 lt!279182) vacantSpotIndex!68) (= (select (arr!17924 a!2986) (index!27725 lt!279182)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!349798 () SeekEntryResult!6361)

(assert (=> d!88115 (= lt!279182 e!349798)))

(declare-fun c!69281 () Bool)

(assert (=> d!88115 (= c!69281 (bvsge x!910 #b01111111111111111111111111111110))))

(declare-fun lt!279181 () (_ BitVec 64))

(assert (=> d!88115 (= lt!279181 (select (arr!17924 a!2986) index!984))))

(assert (=> d!88115 (validMask!0 mask!3053)))

(assert (=> d!88115 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17924 a!2986) j!136) a!2986 mask!3053) lt!279182)))

(declare-fun b!610587 () Bool)

(declare-fun e!349797 () SeekEntryResult!6361)

(assert (=> b!610587 (= e!349798 e!349797)))

(declare-fun c!69280 () Bool)

(assert (=> b!610587 (= c!69280 (= lt!279181 (select (arr!17924 a!2986) j!136)))))

(declare-fun b!610588 () Bool)

(declare-fun e!349799 () SeekEntryResult!6361)

(assert (=> b!610588 (= e!349799 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!17924 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!610589 () Bool)

(declare-fun c!69279 () Bool)

(assert (=> b!610589 (= c!69279 (= lt!279181 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!610589 (= e!349797 e!349799)))

(declare-fun b!610590 () Bool)

(assert (=> b!610590 (= e!349797 (Found!6361 index!984))))

(declare-fun b!610591 () Bool)

(assert (=> b!610591 (= e!349798 Undefined!6361)))

(declare-fun b!610592 () Bool)

(assert (=> b!610592 (= e!349799 (MissingVacant!6361 vacantSpotIndex!68))))

(assert (= (and d!88115 c!69281) b!610591))

(assert (= (and d!88115 (not c!69281)) b!610587))

(assert (= (and b!610587 c!69280) b!610590))

(assert (= (and b!610587 (not c!69280)) b!610589))

(assert (= (and b!610589 c!69279) b!610592))

(assert (= (and b!610589 (not c!69279)) b!610588))

(declare-fun m!586531 () Bool)

(assert (=> d!88115 m!586531))

(declare-fun m!586533 () Bool)

(assert (=> d!88115 m!586533))

(assert (=> d!88115 m!586183))

(assert (=> d!88115 m!586191))

(assert (=> b!610588 m!586163))

(assert (=> b!610588 m!586163))

(assert (=> b!610588 m!586159))

(declare-fun m!586535 () Bool)

(assert (=> b!610588 m!586535))

(assert (=> b!610212 d!88115))

(assert (=> b!610201 d!88041))

(declare-fun d!88117 () Bool)

(declare-fun res!392763 () Bool)

(declare-fun e!349800 () Bool)

(assert (=> d!88117 (=> res!392763 e!349800)))

(assert (=> d!88117 (= res!392763 (= (select (arr!17924 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!88117 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!349800)))

(declare-fun b!610593 () Bool)

(declare-fun e!349801 () Bool)

(assert (=> b!610593 (= e!349800 e!349801)))

(declare-fun res!392764 () Bool)

(assert (=> b!610593 (=> (not res!392764) (not e!349801))))

(assert (=> b!610593 (= res!392764 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18289 a!2986)))))

(declare-fun b!610594 () Bool)

(assert (=> b!610594 (= e!349801 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!88117 (not res!392763)) b!610593))

(assert (= (and b!610593 res!392764) b!610594))

(assert (=> d!88117 m!586357))

(declare-fun m!586539 () Bool)

(assert (=> b!610594 m!586539))

(assert (=> b!610200 d!88117))

(declare-fun d!88119 () Bool)

(assert (=> d!88119 (= (validKeyInArray!0 (select (arr!17924 a!2986) j!136)) (and (not (= (select (arr!17924 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!17924 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!610210 d!88119))

(declare-fun b!610595 () Bool)

(declare-fun e!349802 () Bool)

(declare-fun call!33127 () Bool)

(assert (=> b!610595 (= e!349802 call!33127)))

(declare-fun b!610596 () Bool)

(declare-fun e!349805 () Bool)

(assert (=> b!610596 (= e!349805 (contains!3023 Nil!12001 (select (arr!17924 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!610597 () Bool)

(declare-fun e!349803 () Bool)

(assert (=> b!610597 (= e!349803 e!349802)))

(declare-fun c!69282 () Bool)

(assert (=> b!610597 (= c!69282 (validKeyInArray!0 (select (arr!17924 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!610598 () Bool)

(declare-fun e!349804 () Bool)

(assert (=> b!610598 (= e!349804 e!349803)))

(declare-fun res!392765 () Bool)

(assert (=> b!610598 (=> (not res!392765) (not e!349803))))

(assert (=> b!610598 (= res!392765 (not e!349805))))

(declare-fun res!392766 () Bool)

(assert (=> b!610598 (=> (not res!392766) (not e!349805))))

(assert (=> b!610598 (= res!392766 (validKeyInArray!0 (select (arr!17924 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!610599 () Bool)

(assert (=> b!610599 (= e!349802 call!33127)))

(declare-fun d!88123 () Bool)

(declare-fun res!392767 () Bool)

(assert (=> d!88123 (=> res!392767 e!349804)))

(assert (=> d!88123 (= res!392767 (bvsge #b00000000000000000000000000000000 (size!18289 a!2986)))))

(assert (=> d!88123 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12001) e!349804)))

(declare-fun bm!33124 () Bool)

(assert (=> bm!33124 (= call!33127 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!69282 (Cons!12000 (select (arr!17924 a!2986) #b00000000000000000000000000000000) Nil!12001) Nil!12001)))))

(assert (= (and d!88123 (not res!392767)) b!610598))

(assert (= (and b!610598 res!392766) b!610596))

(assert (= (and b!610598 res!392765) b!610597))

(assert (= (and b!610597 c!69282) b!610595))

(assert (= (and b!610597 (not c!69282)) b!610599))

(assert (= (or b!610595 b!610599) bm!33124))

(assert (=> b!610596 m!586357))

(assert (=> b!610596 m!586357))

(declare-fun m!586543 () Bool)

(assert (=> b!610596 m!586543))

(assert (=> b!610597 m!586357))

(assert (=> b!610597 m!586357))

(assert (=> b!610597 m!586365))

(assert (=> b!610598 m!586357))

(assert (=> b!610598 m!586357))

(assert (=> b!610598 m!586365))

(assert (=> bm!33124 m!586357))

(declare-fun m!586545 () Bool)

(assert (=> bm!33124 m!586545))

(assert (=> b!610199 d!88123))

(check-sat (not d!88081) (not b!610545) (not b!610369) (not b!610425) (not b!610379) (not d!88075) (not b!610428) (not b!610588) (not d!88115) (not b!610401) (not b!610598) (not d!88051) (not b!610423) (not d!88073) (not b!610596) (not b!610380) (not b!610546) (not b!610524) (not b!610424) (not b!610416) (not d!88063) (not b!610398) (not b!610597) (not b!610417) (not b!610526) (not bm!33124) (not b!610475) (not d!88055) (not b!610403) (not b!610415) (not bm!33112) (not d!88047) (not b!610421) (not bm!33113) (not d!88067) (not b!610481) (not d!88089) (not d!88043) (not d!88039) (not bm!33109) (not b!610594))
(check-sat)
