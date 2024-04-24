; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56118 () Bool)

(assert start!56118)

(declare-fun b!618082 () Bool)

(declare-fun res!398166 () Bool)

(declare-fun e!354451 () Bool)

(assert (=> b!618082 (=> (not res!398166) (not e!354451))))

(declare-datatypes ((array!37533 0))(
  ( (array!37534 (arr!18010 (Array (_ BitVec 32) (_ BitVec 64))) (size!18374 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37533)

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!37533 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!618082 (= res!398166 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!618083 () Bool)

(declare-datatypes ((Unit!20257 0))(
  ( (Unit!20258) )
))
(declare-fun e!354443 () Unit!20257)

(declare-fun Unit!20259 () Unit!20257)

(assert (=> b!618083 (= e!354443 Unit!20259)))

(declare-fun b!618084 () Bool)

(declare-fun res!398172 () Bool)

(assert (=> b!618084 (=> (not res!398172) (not e!354451))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!618084 (= res!398172 (and (= (size!18374 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18374 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18374 a!2986)) (not (= i!1108 j!136))))))

(declare-fun lt!284774 () array!37533)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun b!618085 () Bool)

(declare-fun e!354455 () Bool)

(assert (=> b!618085 (= e!354455 (arrayContainsKey!0 lt!284774 (select (arr!18010 a!2986) j!136) index!984))))

(declare-fun res!398167 () Bool)

(declare-fun b!618086 () Bool)

(assert (=> b!618086 (= res!398167 (arrayContainsKey!0 lt!284774 (select (arr!18010 a!2986) j!136) j!136))))

(assert (=> b!618086 (=> (not res!398167) (not e!354455))))

(declare-fun e!354449 () Bool)

(assert (=> b!618086 (= e!354449 e!354455)))

(declare-fun b!618087 () Bool)

(declare-fun e!354450 () Bool)

(declare-fun e!354445 () Bool)

(assert (=> b!618087 (= e!354450 (not e!354445))))

(declare-fun res!398171 () Bool)

(assert (=> b!618087 (=> res!398171 e!354445)))

(declare-datatypes ((SeekEntryResult!6406 0))(
  ( (MissingZero!6406 (index!27908 (_ BitVec 32))) (Found!6406 (index!27909 (_ BitVec 32))) (Intermediate!6406 (undefined!7218 Bool) (index!27910 (_ BitVec 32)) (x!56849 (_ BitVec 32))) (Undefined!6406) (MissingVacant!6406 (index!27911 (_ BitVec 32))) )
))
(declare-fun lt!284764 () SeekEntryResult!6406)

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!618087 (= res!398171 (not (= lt!284764 (MissingVacant!6406 vacantSpotIndex!68))))))

(declare-fun lt!284776 () Unit!20257)

(declare-fun e!354446 () Unit!20257)

(assert (=> b!618087 (= lt!284776 e!354446)))

(declare-fun c!70328 () Bool)

(assert (=> b!618087 (= c!70328 (= lt!284764 (Found!6406 index!984)))))

(declare-fun lt!284768 () Unit!20257)

(assert (=> b!618087 (= lt!284768 e!354443)))

(declare-fun c!70329 () Bool)

(assert (=> b!618087 (= c!70329 (= lt!284764 Undefined!6406))))

(declare-fun lt!284779 () (_ BitVec 64))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37533 (_ BitVec 32)) SeekEntryResult!6406)

(assert (=> b!618087 (= lt!284764 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!284779 lt!284774 mask!3053))))

(declare-fun e!354456 () Bool)

(assert (=> b!618087 e!354456))

(declare-fun res!398178 () Bool)

(assert (=> b!618087 (=> (not res!398178) (not e!354456))))

(declare-fun lt!284775 () (_ BitVec 32))

(declare-fun lt!284777 () SeekEntryResult!6406)

(assert (=> b!618087 (= res!398178 (= lt!284777 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!284775 vacantSpotIndex!68 lt!284779 lt!284774 mask!3053)))))

(assert (=> b!618087 (= lt!284777 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!284775 vacantSpotIndex!68 (select (arr!18010 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!618087 (= lt!284779 (select (store (arr!18010 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!284762 () Unit!20257)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37533 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20257)

(assert (=> b!618087 (= lt!284762 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!284775 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!618087 (= lt!284775 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!618089 () Bool)

(declare-fun lt!284763 () SeekEntryResult!6406)

(assert (=> b!618089 (= e!354456 (= lt!284763 lt!284777))))

(declare-fun b!618090 () Bool)

(declare-fun Unit!20260 () Unit!20257)

(assert (=> b!618090 (= e!354446 Unit!20260)))

(declare-fun b!618091 () Bool)

(declare-fun e!354442 () Bool)

(assert (=> b!618091 (= e!354442 (arrayContainsKey!0 lt!284774 (select (arr!18010 a!2986) j!136) index!984))))

(declare-fun b!618092 () Bool)

(declare-fun res!398164 () Bool)

(assert (=> b!618092 (=> (not res!398164) (not e!354451))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!618092 (= res!398164 (validKeyInArray!0 (select (arr!18010 a!2986) j!136)))))

(declare-fun b!618093 () Bool)

(declare-fun e!354452 () Unit!20257)

(declare-fun Unit!20261 () Unit!20257)

(assert (=> b!618093 (= e!354452 Unit!20261)))

(declare-fun b!618094 () Bool)

(assert (=> b!618094 false))

(declare-fun lt!284766 () Unit!20257)

(declare-datatypes ((List!11958 0))(
  ( (Nil!11955) (Cons!11954 (h!13002 (_ BitVec 64)) (t!18178 List!11958)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37533 (_ BitVec 64) (_ BitVec 32) List!11958) Unit!20257)

(assert (=> b!618094 (= lt!284766 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!284774 (select (arr!18010 a!2986) j!136) j!136 Nil!11955))))

(declare-fun arrayNoDuplicates!0 (array!37533 (_ BitVec 32) List!11958) Bool)

(assert (=> b!618094 (arrayNoDuplicates!0 lt!284774 j!136 Nil!11955)))

(declare-fun lt!284772 () Unit!20257)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37533 (_ BitVec 32) (_ BitVec 32)) Unit!20257)

(assert (=> b!618094 (= lt!284772 (lemmaNoDuplicateFromThenFromBigger!0 lt!284774 #b00000000000000000000000000000000 j!136))))

(assert (=> b!618094 (arrayNoDuplicates!0 lt!284774 #b00000000000000000000000000000000 Nil!11955)))

(declare-fun lt!284760 () Unit!20257)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37533 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11958) Unit!20257)

(assert (=> b!618094 (= lt!284760 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11955))))

(assert (=> b!618094 (arrayContainsKey!0 lt!284774 (select (arr!18010 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!284773 () Unit!20257)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37533 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20257)

(assert (=> b!618094 (= lt!284773 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!284774 (select (arr!18010 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!20262 () Unit!20257)

(assert (=> b!618094 (= e!354452 Unit!20262)))

(declare-fun b!618095 () Bool)

(declare-fun e!354444 () Bool)

(assert (=> b!618095 (= e!354451 e!354444)))

(declare-fun res!398174 () Bool)

(assert (=> b!618095 (=> (not res!398174) (not e!354444))))

(declare-fun lt!284765 () SeekEntryResult!6406)

(assert (=> b!618095 (= res!398174 (or (= lt!284765 (MissingZero!6406 i!1108)) (= lt!284765 (MissingVacant!6406 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37533 (_ BitVec 32)) SeekEntryResult!6406)

(assert (=> b!618095 (= lt!284765 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!618096 () Bool)

(declare-fun e!354454 () Unit!20257)

(declare-fun Unit!20263 () Unit!20257)

(assert (=> b!618096 (= e!354454 Unit!20263)))

(declare-fun b!618097 () Bool)

(declare-fun res!398170 () Bool)

(assert (=> b!618097 (=> (not res!398170) (not e!354444))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37533 (_ BitVec 32)) Bool)

(assert (=> b!618097 (= res!398170 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!618098 () Bool)

(declare-fun e!354447 () Bool)

(assert (=> b!618098 (= e!354444 e!354447)))

(declare-fun res!398176 () Bool)

(assert (=> b!618098 (=> (not res!398176) (not e!354447))))

(assert (=> b!618098 (= res!398176 (= (select (store (arr!18010 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!618098 (= lt!284774 (array!37534 (store (arr!18010 a!2986) i!1108 k0!1786) (size!18374 a!2986)))))

(declare-fun b!618099 () Bool)

(declare-fun Unit!20264 () Unit!20257)

(assert (=> b!618099 (= e!354446 Unit!20264)))

(declare-fun res!398177 () Bool)

(assert (=> b!618099 (= res!398177 (= (select (store (arr!18010 a!2986) i!1108 k0!1786) index!984) (select (arr!18010 a!2986) j!136)))))

(declare-fun e!354453 () Bool)

(assert (=> b!618099 (=> (not res!398177) (not e!354453))))

(assert (=> b!618099 e!354453))

(declare-fun c!70330 () Bool)

(assert (=> b!618099 (= c!70330 (bvslt j!136 index!984))))

(declare-fun lt!284770 () Unit!20257)

(assert (=> b!618099 (= lt!284770 e!354452)))

(declare-fun c!70331 () Bool)

(assert (=> b!618099 (= c!70331 (bvslt index!984 j!136))))

(declare-fun lt!284778 () Unit!20257)

(assert (=> b!618099 (= lt!284778 e!354454)))

(assert (=> b!618099 false))

(declare-fun b!618100 () Bool)

(declare-fun Unit!20265 () Unit!20257)

(assert (=> b!618100 (= e!354443 Unit!20265)))

(assert (=> b!618100 false))

(declare-fun b!618101 () Bool)

(declare-fun res!398175 () Bool)

(assert (=> b!618101 (=> (not res!398175) (not e!354444))))

(assert (=> b!618101 (= res!398175 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11955))))

(declare-fun b!618102 () Bool)

(declare-fun res!398165 () Bool)

(assert (=> b!618102 (=> (not res!398165) (not e!354451))))

(assert (=> b!618102 (= res!398165 (validKeyInArray!0 k0!1786))))

(declare-fun b!618103 () Bool)

(assert (=> b!618103 false))

(declare-fun lt!284771 () Unit!20257)

(assert (=> b!618103 (= lt!284771 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!284774 (select (arr!18010 a!2986) j!136) index!984 Nil!11955))))

(assert (=> b!618103 (arrayNoDuplicates!0 lt!284774 index!984 Nil!11955)))

(declare-fun lt!284761 () Unit!20257)

(assert (=> b!618103 (= lt!284761 (lemmaNoDuplicateFromThenFromBigger!0 lt!284774 #b00000000000000000000000000000000 index!984))))

(assert (=> b!618103 (arrayNoDuplicates!0 lt!284774 #b00000000000000000000000000000000 Nil!11955)))

(declare-fun lt!284767 () Unit!20257)

(assert (=> b!618103 (= lt!284767 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11955))))

(assert (=> b!618103 (arrayContainsKey!0 lt!284774 (select (arr!18010 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!284769 () Unit!20257)

(assert (=> b!618103 (= lt!284769 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!284774 (select (arr!18010 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!618103 e!354442))

(declare-fun res!398173 () Bool)

(assert (=> b!618103 (=> (not res!398173) (not e!354442))))

(assert (=> b!618103 (= res!398173 (arrayContainsKey!0 lt!284774 (select (arr!18010 a!2986) j!136) j!136))))

(declare-fun Unit!20266 () Unit!20257)

(assert (=> b!618103 (= e!354454 Unit!20266)))

(declare-fun b!618104 () Bool)

(declare-fun res!398179 () Bool)

(assert (=> b!618104 (= res!398179 (bvsge j!136 index!984))))

(assert (=> b!618104 (=> res!398179 e!354449)))

(assert (=> b!618104 (= e!354453 e!354449)))

(declare-fun b!618105 () Bool)

(assert (=> b!618105 (= e!354445 true)))

(assert (=> b!618105 (= (select (store (arr!18010 a!2986) i!1108 k0!1786) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!618106 () Bool)

(declare-fun res!398169 () Bool)

(assert (=> b!618106 (=> (not res!398169) (not e!354444))))

(assert (=> b!618106 (= res!398169 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18010 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!618088 () Bool)

(assert (=> b!618088 (= e!354447 e!354450)))

(declare-fun res!398168 () Bool)

(assert (=> b!618088 (=> (not res!398168) (not e!354450))))

(assert (=> b!618088 (= res!398168 (and (= lt!284763 (Found!6406 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18010 a!2986) index!984) (select (arr!18010 a!2986) j!136))) (not (= (select (arr!18010 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!618088 (= lt!284763 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18010 a!2986) j!136) a!2986 mask!3053))))

(declare-fun res!398163 () Bool)

(assert (=> start!56118 (=> (not res!398163) (not e!354451))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56118 (= res!398163 (validMask!0 mask!3053))))

(assert (=> start!56118 e!354451))

(assert (=> start!56118 true))

(declare-fun array_inv!13869 (array!37533) Bool)

(assert (=> start!56118 (array_inv!13869 a!2986)))

(assert (= (and start!56118 res!398163) b!618084))

(assert (= (and b!618084 res!398172) b!618092))

(assert (= (and b!618092 res!398164) b!618102))

(assert (= (and b!618102 res!398165) b!618082))

(assert (= (and b!618082 res!398166) b!618095))

(assert (= (and b!618095 res!398174) b!618097))

(assert (= (and b!618097 res!398170) b!618101))

(assert (= (and b!618101 res!398175) b!618106))

(assert (= (and b!618106 res!398169) b!618098))

(assert (= (and b!618098 res!398176) b!618088))

(assert (= (and b!618088 res!398168) b!618087))

(assert (= (and b!618087 res!398178) b!618089))

(assert (= (and b!618087 c!70329) b!618100))

(assert (= (and b!618087 (not c!70329)) b!618083))

(assert (= (and b!618087 c!70328) b!618099))

(assert (= (and b!618087 (not c!70328)) b!618090))

(assert (= (and b!618099 res!398177) b!618104))

(assert (= (and b!618104 (not res!398179)) b!618086))

(assert (= (and b!618086 res!398167) b!618085))

(assert (= (and b!618099 c!70330) b!618094))

(assert (= (and b!618099 (not c!70330)) b!618093))

(assert (= (and b!618099 c!70331) b!618103))

(assert (= (and b!618099 (not c!70331)) b!618096))

(assert (= (and b!618103 res!398173) b!618091))

(assert (= (and b!618087 (not res!398171)) b!618105))

(declare-fun m!594437 () Bool)

(assert (=> b!618085 m!594437))

(assert (=> b!618085 m!594437))

(declare-fun m!594439 () Bool)

(assert (=> b!618085 m!594439))

(assert (=> b!618091 m!594437))

(assert (=> b!618091 m!594437))

(assert (=> b!618091 m!594439))

(declare-fun m!594441 () Bool)

(assert (=> start!56118 m!594441))

(declare-fun m!594443 () Bool)

(assert (=> start!56118 m!594443))

(declare-fun m!594445 () Bool)

(assert (=> b!618101 m!594445))

(declare-fun m!594447 () Bool)

(assert (=> b!618106 m!594447))

(assert (=> b!618086 m!594437))

(assert (=> b!618086 m!594437))

(declare-fun m!594449 () Bool)

(assert (=> b!618086 m!594449))

(declare-fun m!594451 () Bool)

(assert (=> b!618097 m!594451))

(declare-fun m!594453 () Bool)

(assert (=> b!618102 m!594453))

(declare-fun m!594455 () Bool)

(assert (=> b!618094 m!594455))

(assert (=> b!618094 m!594437))

(declare-fun m!594457 () Bool)

(assert (=> b!618094 m!594457))

(assert (=> b!618094 m!594437))

(assert (=> b!618094 m!594437))

(declare-fun m!594459 () Bool)

(assert (=> b!618094 m!594459))

(assert (=> b!618094 m!594437))

(declare-fun m!594461 () Bool)

(assert (=> b!618094 m!594461))

(declare-fun m!594463 () Bool)

(assert (=> b!618094 m!594463))

(declare-fun m!594465 () Bool)

(assert (=> b!618094 m!594465))

(declare-fun m!594467 () Bool)

(assert (=> b!618094 m!594467))

(declare-fun m!594469 () Bool)

(assert (=> b!618099 m!594469))

(declare-fun m!594471 () Bool)

(assert (=> b!618099 m!594471))

(assert (=> b!618099 m!594437))

(declare-fun m!594473 () Bool)

(assert (=> b!618087 m!594473))

(assert (=> b!618087 m!594437))

(assert (=> b!618087 m!594469))

(assert (=> b!618087 m!594437))

(declare-fun m!594475 () Bool)

(assert (=> b!618087 m!594475))

(declare-fun m!594477 () Bool)

(assert (=> b!618087 m!594477))

(declare-fun m!594479 () Bool)

(assert (=> b!618087 m!594479))

(declare-fun m!594481 () Bool)

(assert (=> b!618087 m!594481))

(declare-fun m!594483 () Bool)

(assert (=> b!618087 m!594483))

(assert (=> b!618098 m!594469))

(declare-fun m!594485 () Bool)

(assert (=> b!618098 m!594485))

(declare-fun m!594487 () Bool)

(assert (=> b!618082 m!594487))

(declare-fun m!594489 () Bool)

(assert (=> b!618088 m!594489))

(assert (=> b!618088 m!594437))

(assert (=> b!618088 m!594437))

(declare-fun m!594491 () Bool)

(assert (=> b!618088 m!594491))

(assert (=> b!618092 m!594437))

(assert (=> b!618092 m!594437))

(declare-fun m!594493 () Bool)

(assert (=> b!618092 m!594493))

(declare-fun m!594495 () Bool)

(assert (=> b!618095 m!594495))

(assert (=> b!618103 m!594437))

(assert (=> b!618103 m!594449))

(assert (=> b!618103 m!594437))

(declare-fun m!594497 () Bool)

(assert (=> b!618103 m!594497))

(assert (=> b!618103 m!594437))

(declare-fun m!594499 () Bool)

(assert (=> b!618103 m!594499))

(assert (=> b!618103 m!594437))

(declare-fun m!594501 () Bool)

(assert (=> b!618103 m!594501))

(assert (=> b!618103 m!594467))

(assert (=> b!618103 m!594463))

(declare-fun m!594503 () Bool)

(assert (=> b!618103 m!594503))

(assert (=> b!618103 m!594437))

(declare-fun m!594505 () Bool)

(assert (=> b!618103 m!594505))

(assert (=> b!618105 m!594469))

(assert (=> b!618105 m!594471))

(check-sat (not b!618094) (not start!56118) (not b!618091) (not b!618092) (not b!618095) (not b!618085) (not b!618082) (not b!618097) (not b!618088) (not b!618101) (not b!618086) (not b!618103) (not b!618102) (not b!618087))
(check-sat)
