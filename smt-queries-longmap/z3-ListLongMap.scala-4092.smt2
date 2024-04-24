; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56100 () Bool)

(assert start!56100)

(declare-fun b!617407 () Bool)

(declare-fun e!354043 () Bool)

(declare-fun e!354041 () Bool)

(assert (=> b!617407 (= e!354043 e!354041)))

(declare-fun res!397707 () Bool)

(assert (=> b!617407 (=> (not res!397707) (not e!354041))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((array!37515 0))(
  ( (array!37516 (arr!18001 (Array (_ BitVec 32) (_ BitVec 64))) (size!18365 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37515)

(assert (=> b!617407 (= res!397707 (= (select (store (arr!18001 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!284237 () array!37515)

(assert (=> b!617407 (= lt!284237 (array!37516 (store (arr!18001 a!2986) i!1108 k0!1786) (size!18365 a!2986)))))

(declare-fun b!617408 () Bool)

(declare-fun e!354050 () Bool)

(declare-datatypes ((SeekEntryResult!6397 0))(
  ( (MissingZero!6397 (index!27872 (_ BitVec 32))) (Found!6397 (index!27873 (_ BitVec 32))) (Intermediate!6397 (undefined!7209 Bool) (index!27874 (_ BitVec 32)) (x!56816 (_ BitVec 32))) (Undefined!6397) (MissingVacant!6397 (index!27875 (_ BitVec 32))) )
))
(declare-fun lt!284221 () SeekEntryResult!6397)

(declare-fun lt!284232 () SeekEntryResult!6397)

(assert (=> b!617408 (= e!354050 (= lt!284221 lt!284232))))

(declare-fun b!617409 () Bool)

(declare-fun res!397706 () Bool)

(declare-fun e!354051 () Bool)

(assert (=> b!617409 (=> (not res!397706) (not e!354051))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!617409 (= res!397706 (validKeyInArray!0 (select (arr!18001 a!2986) j!136)))))

(declare-fun b!617410 () Bool)

(declare-fun e!354045 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!37515 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!617410 (= e!354045 (arrayContainsKey!0 lt!284237 (select (arr!18001 a!2986) j!136) index!984))))

(declare-fun b!617411 () Bool)

(declare-fun res!397720 () Bool)

(assert (=> b!617411 (=> (not res!397720) (not e!354043))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!617411 (= res!397720 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18001 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!617412 () Bool)

(declare-fun res!397715 () Bool)

(assert (=> b!617412 (= res!397715 (arrayContainsKey!0 lt!284237 (select (arr!18001 a!2986) j!136) j!136))))

(assert (=> b!617412 (=> (not res!397715) (not e!354045))))

(declare-fun e!354042 () Bool)

(assert (=> b!617412 (= e!354042 e!354045)))

(declare-fun b!617413 () Bool)

(declare-datatypes ((Unit!20167 0))(
  ( (Unit!20168) )
))
(declare-fun e!354039 () Unit!20167)

(declare-fun Unit!20169 () Unit!20167)

(assert (=> b!617413 (= e!354039 Unit!20169)))

(declare-fun b!617414 () Bool)

(declare-fun e!354046 () Bool)

(assert (=> b!617414 (= e!354046 true)))

(assert (=> b!617414 (= (select (store (arr!18001 a!2986) i!1108 k0!1786) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!617415 () Bool)

(declare-fun e!354049 () Unit!20167)

(declare-fun Unit!20170 () Unit!20167)

(assert (=> b!617415 (= e!354049 Unit!20170)))

(declare-fun b!617416 () Bool)

(declare-fun e!354037 () Bool)

(assert (=> b!617416 (= e!354041 e!354037)))

(declare-fun res!397716 () Bool)

(assert (=> b!617416 (=> (not res!397716) (not e!354037))))

(assert (=> b!617416 (= res!397716 (and (= lt!284221 (Found!6397 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18001 a!2986) index!984) (select (arr!18001 a!2986) j!136))) (not (= (select (arr!18001 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37515 (_ BitVec 32)) SeekEntryResult!6397)

(assert (=> b!617416 (= lt!284221 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18001 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!617417 () Bool)

(assert (=> b!617417 (= e!354051 e!354043)))

(declare-fun res!397711 () Bool)

(assert (=> b!617417 (=> (not res!397711) (not e!354043))))

(declare-fun lt!284222 () SeekEntryResult!6397)

(assert (=> b!617417 (= res!397711 (or (= lt!284222 (MissingZero!6397 i!1108)) (= lt!284222 (MissingVacant!6397 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37515 (_ BitVec 32)) SeekEntryResult!6397)

(assert (=> b!617417 (= lt!284222 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!617418 () Bool)

(declare-fun e!354038 () Bool)

(assert (=> b!617418 (= e!354038 (arrayContainsKey!0 lt!284237 (select (arr!18001 a!2986) j!136) index!984))))

(declare-fun b!617419 () Bool)

(declare-fun e!354044 () Unit!20167)

(declare-fun Unit!20171 () Unit!20167)

(assert (=> b!617419 (= e!354044 Unit!20171)))

(declare-fun b!617420 () Bool)

(declare-fun res!397719 () Bool)

(assert (=> b!617420 (=> (not res!397719) (not e!354051))))

(assert (=> b!617420 (= res!397719 (and (= (size!18365 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18365 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18365 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!617421 () Bool)

(assert (=> b!617421 false))

(declare-fun lt!284239 () Unit!20167)

(declare-datatypes ((List!11949 0))(
  ( (Nil!11946) (Cons!11945 (h!12993 (_ BitVec 64)) (t!18169 List!11949)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37515 (_ BitVec 64) (_ BitVec 32) List!11949) Unit!20167)

(assert (=> b!617421 (= lt!284239 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!284237 (select (arr!18001 a!2986) j!136) index!984 Nil!11946))))

(declare-fun arrayNoDuplicates!0 (array!37515 (_ BitVec 32) List!11949) Bool)

(assert (=> b!617421 (arrayNoDuplicates!0 lt!284237 index!984 Nil!11946)))

(declare-fun lt!284228 () Unit!20167)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37515 (_ BitVec 32) (_ BitVec 32)) Unit!20167)

(assert (=> b!617421 (= lt!284228 (lemmaNoDuplicateFromThenFromBigger!0 lt!284237 #b00000000000000000000000000000000 index!984))))

(assert (=> b!617421 (arrayNoDuplicates!0 lt!284237 #b00000000000000000000000000000000 Nil!11946)))

(declare-fun lt!284234 () Unit!20167)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37515 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11949) Unit!20167)

(assert (=> b!617421 (= lt!284234 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11946))))

(assert (=> b!617421 (arrayContainsKey!0 lt!284237 (select (arr!18001 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!284229 () Unit!20167)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37515 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20167)

(assert (=> b!617421 (= lt!284229 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!284237 (select (arr!18001 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!617421 e!354038))

(declare-fun res!397704 () Bool)

(assert (=> b!617421 (=> (not res!397704) (not e!354038))))

(assert (=> b!617421 (= res!397704 (arrayContainsKey!0 lt!284237 (select (arr!18001 a!2986) j!136) j!136))))

(declare-fun e!354048 () Unit!20167)

(declare-fun Unit!20172 () Unit!20167)

(assert (=> b!617421 (= e!354048 Unit!20172)))

(declare-fun b!617422 () Bool)

(declare-fun res!397712 () Bool)

(assert (=> b!617422 (= res!397712 (bvsge j!136 index!984))))

(assert (=> b!617422 (=> res!397712 e!354042)))

(declare-fun e!354040 () Bool)

(assert (=> b!617422 (= e!354040 e!354042)))

(declare-fun b!617423 () Bool)

(declare-fun res!397705 () Bool)

(assert (=> b!617423 (=> (not res!397705) (not e!354043))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37515 (_ BitVec 32)) Bool)

(assert (=> b!617423 (= res!397705 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!617424 () Bool)

(declare-fun Unit!20173 () Unit!20167)

(assert (=> b!617424 (= e!354048 Unit!20173)))

(declare-fun b!617425 () Bool)

(declare-fun res!397714 () Bool)

(assert (=> b!617425 (=> (not res!397714) (not e!354051))))

(assert (=> b!617425 (= res!397714 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!617426 () Bool)

(assert (=> b!617426 false))

(declare-fun lt!284226 () Unit!20167)

(assert (=> b!617426 (= lt!284226 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!284237 (select (arr!18001 a!2986) j!136) j!136 Nil!11946))))

(assert (=> b!617426 (arrayNoDuplicates!0 lt!284237 j!136 Nil!11946)))

(declare-fun lt!284220 () Unit!20167)

(assert (=> b!617426 (= lt!284220 (lemmaNoDuplicateFromThenFromBigger!0 lt!284237 #b00000000000000000000000000000000 j!136))))

(assert (=> b!617426 (arrayNoDuplicates!0 lt!284237 #b00000000000000000000000000000000 Nil!11946)))

(declare-fun lt!284227 () Unit!20167)

(assert (=> b!617426 (= lt!284227 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11946))))

(assert (=> b!617426 (arrayContainsKey!0 lt!284237 (select (arr!18001 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!284224 () Unit!20167)

(assert (=> b!617426 (= lt!284224 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!284237 (select (arr!18001 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!20174 () Unit!20167)

(assert (=> b!617426 (= e!354039 Unit!20174)))

(declare-fun b!617427 () Bool)

(assert (=> b!617427 (= e!354037 (not e!354046))))

(declare-fun res!397717 () Bool)

(assert (=> b!617427 (=> res!397717 e!354046)))

(declare-fun lt!284231 () SeekEntryResult!6397)

(assert (=> b!617427 (= res!397717 (not (= lt!284231 (MissingVacant!6397 vacantSpotIndex!68))))))

(declare-fun lt!284223 () Unit!20167)

(assert (=> b!617427 (= lt!284223 e!354044)))

(declare-fun c!70221 () Bool)

(assert (=> b!617427 (= c!70221 (= lt!284231 (Found!6397 index!984)))))

(declare-fun lt!284233 () Unit!20167)

(assert (=> b!617427 (= lt!284233 e!354049)))

(declare-fun c!70220 () Bool)

(assert (=> b!617427 (= c!70220 (= lt!284231 Undefined!6397))))

(declare-fun lt!284225 () (_ BitVec 64))

(assert (=> b!617427 (= lt!284231 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!284225 lt!284237 mask!3053))))

(assert (=> b!617427 e!354050))

(declare-fun res!397708 () Bool)

(assert (=> b!617427 (=> (not res!397708) (not e!354050))))

(declare-fun lt!284235 () (_ BitVec 32))

(assert (=> b!617427 (= res!397708 (= lt!284232 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!284235 vacantSpotIndex!68 lt!284225 lt!284237 mask!3053)))))

(assert (=> b!617427 (= lt!284232 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!284235 vacantSpotIndex!68 (select (arr!18001 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!617427 (= lt!284225 (select (store (arr!18001 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!284236 () Unit!20167)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37515 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20167)

(assert (=> b!617427 (= lt!284236 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!284235 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!617427 (= lt!284235 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!617428 () Bool)

(declare-fun Unit!20175 () Unit!20167)

(assert (=> b!617428 (= e!354049 Unit!20175)))

(assert (=> b!617428 false))

(declare-fun b!617429 () Bool)

(declare-fun res!397710 () Bool)

(assert (=> b!617429 (=> (not res!397710) (not e!354051))))

(assert (=> b!617429 (= res!397710 (validKeyInArray!0 k0!1786))))

(declare-fun b!617430 () Bool)

(declare-fun res!397709 () Bool)

(assert (=> b!617430 (=> (not res!397709) (not e!354043))))

(assert (=> b!617430 (= res!397709 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11946))))

(declare-fun b!617431 () Bool)

(declare-fun Unit!20176 () Unit!20167)

(assert (=> b!617431 (= e!354044 Unit!20176)))

(declare-fun res!397713 () Bool)

(assert (=> b!617431 (= res!397713 (= (select (store (arr!18001 a!2986) i!1108 k0!1786) index!984) (select (arr!18001 a!2986) j!136)))))

(assert (=> b!617431 (=> (not res!397713) (not e!354040))))

(assert (=> b!617431 e!354040))

(declare-fun c!70222 () Bool)

(assert (=> b!617431 (= c!70222 (bvslt j!136 index!984))))

(declare-fun lt!284230 () Unit!20167)

(assert (=> b!617431 (= lt!284230 e!354039)))

(declare-fun c!70223 () Bool)

(assert (=> b!617431 (= c!70223 (bvslt index!984 j!136))))

(declare-fun lt!284238 () Unit!20167)

(assert (=> b!617431 (= lt!284238 e!354048)))

(assert (=> b!617431 false))

(declare-fun res!397718 () Bool)

(assert (=> start!56100 (=> (not res!397718) (not e!354051))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56100 (= res!397718 (validMask!0 mask!3053))))

(assert (=> start!56100 e!354051))

(assert (=> start!56100 true))

(declare-fun array_inv!13860 (array!37515) Bool)

(assert (=> start!56100 (array_inv!13860 a!2986)))

(assert (= (and start!56100 res!397718) b!617420))

(assert (= (and b!617420 res!397719) b!617409))

(assert (= (and b!617409 res!397706) b!617429))

(assert (= (and b!617429 res!397710) b!617425))

(assert (= (and b!617425 res!397714) b!617417))

(assert (= (and b!617417 res!397711) b!617423))

(assert (= (and b!617423 res!397705) b!617430))

(assert (= (and b!617430 res!397709) b!617411))

(assert (= (and b!617411 res!397720) b!617407))

(assert (= (and b!617407 res!397707) b!617416))

(assert (= (and b!617416 res!397716) b!617427))

(assert (= (and b!617427 res!397708) b!617408))

(assert (= (and b!617427 c!70220) b!617428))

(assert (= (and b!617427 (not c!70220)) b!617415))

(assert (= (and b!617427 c!70221) b!617431))

(assert (= (and b!617427 (not c!70221)) b!617419))

(assert (= (and b!617431 res!397713) b!617422))

(assert (= (and b!617422 (not res!397712)) b!617412))

(assert (= (and b!617412 res!397715) b!617410))

(assert (= (and b!617431 c!70222) b!617426))

(assert (= (and b!617431 (not c!70222)) b!617413))

(assert (= (and b!617431 c!70223) b!617421))

(assert (= (and b!617431 (not c!70223)) b!617424))

(assert (= (and b!617421 res!397704) b!617418))

(assert (= (and b!617427 (not res!397717)) b!617414))

(declare-fun m!593807 () Bool)

(assert (=> b!617409 m!593807))

(assert (=> b!617409 m!593807))

(declare-fun m!593809 () Bool)

(assert (=> b!617409 m!593809))

(declare-fun m!593811 () Bool)

(assert (=> b!617427 m!593811))

(declare-fun m!593813 () Bool)

(assert (=> b!617427 m!593813))

(declare-fun m!593815 () Bool)

(assert (=> b!617427 m!593815))

(declare-fun m!593817 () Bool)

(assert (=> b!617427 m!593817))

(declare-fun m!593819 () Bool)

(assert (=> b!617427 m!593819))

(declare-fun m!593821 () Bool)

(assert (=> b!617427 m!593821))

(assert (=> b!617427 m!593807))

(declare-fun m!593823 () Bool)

(assert (=> b!617427 m!593823))

(assert (=> b!617427 m!593807))

(assert (=> b!617412 m!593807))

(assert (=> b!617412 m!593807))

(declare-fun m!593825 () Bool)

(assert (=> b!617412 m!593825))

(declare-fun m!593827 () Bool)

(assert (=> b!617425 m!593827))

(declare-fun m!593829 () Bool)

(assert (=> b!617430 m!593829))

(assert (=> b!617418 m!593807))

(assert (=> b!617418 m!593807))

(declare-fun m!593831 () Bool)

(assert (=> b!617418 m!593831))

(declare-fun m!593833 () Bool)

(assert (=> start!56100 m!593833))

(declare-fun m!593835 () Bool)

(assert (=> start!56100 m!593835))

(assert (=> b!617421 m!593807))

(assert (=> b!617421 m!593807))

(assert (=> b!617421 m!593825))

(declare-fun m!593837 () Bool)

(assert (=> b!617421 m!593837))

(assert (=> b!617421 m!593807))

(declare-fun m!593839 () Bool)

(assert (=> b!617421 m!593839))

(declare-fun m!593841 () Bool)

(assert (=> b!617421 m!593841))

(assert (=> b!617421 m!593807))

(declare-fun m!593843 () Bool)

(assert (=> b!617421 m!593843))

(declare-fun m!593845 () Bool)

(assert (=> b!617421 m!593845))

(assert (=> b!617421 m!593807))

(declare-fun m!593847 () Bool)

(assert (=> b!617421 m!593847))

(declare-fun m!593849 () Bool)

(assert (=> b!617421 m!593849))

(declare-fun m!593851 () Bool)

(assert (=> b!617423 m!593851))

(assert (=> b!617410 m!593807))

(assert (=> b!617410 m!593807))

(assert (=> b!617410 m!593831))

(assert (=> b!617407 m!593815))

(declare-fun m!593853 () Bool)

(assert (=> b!617407 m!593853))

(declare-fun m!593855 () Bool)

(assert (=> b!617416 m!593855))

(assert (=> b!617416 m!593807))

(assert (=> b!617416 m!593807))

(declare-fun m!593857 () Bool)

(assert (=> b!617416 m!593857))

(assert (=> b!617426 m!593807))

(declare-fun m!593859 () Bool)

(assert (=> b!617426 m!593859))

(assert (=> b!617426 m!593807))

(declare-fun m!593861 () Bool)

(assert (=> b!617426 m!593861))

(assert (=> b!617426 m!593807))

(declare-fun m!593863 () Bool)

(assert (=> b!617426 m!593863))

(assert (=> b!617426 m!593807))

(declare-fun m!593865 () Bool)

(assert (=> b!617426 m!593865))

(assert (=> b!617426 m!593845))

(assert (=> b!617426 m!593837))

(declare-fun m!593867 () Bool)

(assert (=> b!617426 m!593867))

(declare-fun m!593869 () Bool)

(assert (=> b!617429 m!593869))

(assert (=> b!617414 m!593815))

(declare-fun m!593871 () Bool)

(assert (=> b!617414 m!593871))

(assert (=> b!617431 m!593815))

(assert (=> b!617431 m!593871))

(assert (=> b!617431 m!593807))

(declare-fun m!593873 () Bool)

(assert (=> b!617417 m!593873))

(declare-fun m!593875 () Bool)

(assert (=> b!617411 m!593875))

(check-sat (not b!617427) (not b!617418) (not b!617412) (not b!617416) (not b!617410) (not b!617423) (not b!617429) (not b!617425) (not b!617417) (not b!617426) (not b!617430) (not b!617421) (not start!56100) (not b!617409))
(check-sat)
