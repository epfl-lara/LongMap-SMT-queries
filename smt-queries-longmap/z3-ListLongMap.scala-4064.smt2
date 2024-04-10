; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55614 () Bool)

(assert start!55614)

(declare-fun b!609994 () Bool)

(declare-fun e!349384 () Bool)

(declare-fun e!349398 () Bool)

(assert (=> b!609994 (= e!349384 e!349398)))

(declare-fun res!392433 () Bool)

(assert (=> b!609994 (=> (not res!392433) (not e!349398))))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6363 0))(
  ( (MissingZero!6363 (index!27727 (_ BitVec 32))) (Found!6363 (index!27728 (_ BitVec 32))) (Intermediate!6363 (undefined!7175 Bool) (index!27729 (_ BitVec 32)) (x!56528 (_ BitVec 32))) (Undefined!6363) (MissingVacant!6363 (index!27730 (_ BitVec 32))) )
))
(declare-fun lt!278971 () SeekEntryResult!6363)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37345 0))(
  ( (array!37346 (arr!17923 (Array (_ BitVec 32) (_ BitVec 64))) (size!18287 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37345)

(assert (=> b!609994 (= res!392433 (and (= lt!278971 (Found!6363 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17923 a!2986) index!984) (select (arr!17923 a!2986) j!136))) (not (= (select (arr!17923 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37345 (_ BitVec 32)) SeekEntryResult!6363)

(assert (=> b!609994 (= lt!278971 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17923 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!609995 () Bool)

(declare-fun e!349396 () Bool)

(declare-fun lt!278975 () SeekEntryResult!6363)

(assert (=> b!609995 (= e!349396 (= lt!278971 lt!278975))))

(declare-fun b!609996 () Bool)

(declare-fun res!392440 () Bool)

(declare-fun e!349392 () Bool)

(assert (=> b!609996 (=> (not res!392440) (not e!349392))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!609996 (= res!392440 (validKeyInArray!0 k0!1786))))

(declare-fun b!609997 () Bool)

(declare-fun res!392443 () Bool)

(declare-fun e!349385 () Bool)

(assert (=> b!609997 (=> (not res!392443) (not e!349385))))

(assert (=> b!609997 (= res!392443 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17923 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!609998 () Bool)

(declare-fun res!392431 () Bool)

(assert (=> b!609998 (=> (not res!392431) (not e!349385))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37345 (_ BitVec 32)) Bool)

(assert (=> b!609998 (= res!392431 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!609999 () Bool)

(declare-fun res!392441 () Bool)

(assert (=> b!609999 (=> (not res!392441) (not e!349385))))

(declare-datatypes ((List!11964 0))(
  ( (Nil!11961) (Cons!11960 (h!13005 (_ BitVec 64)) (t!18192 List!11964)) )
))
(declare-fun arrayNoDuplicates!0 (array!37345 (_ BitVec 32) List!11964) Bool)

(assert (=> b!609999 (= res!392441 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11961))))

(declare-fun b!610000 () Bool)

(declare-fun e!349391 () Bool)

(declare-fun e!349390 () Bool)

(assert (=> b!610000 (= e!349391 e!349390)))

(declare-fun res!392438 () Bool)

(assert (=> b!610000 (=> res!392438 e!349390)))

(declare-fun lt!278967 () (_ BitVec 64))

(declare-fun lt!278981 () (_ BitVec 64))

(assert (=> b!610000 (= res!392438 (or (not (= (select (arr!17923 a!2986) j!136) lt!278967)) (not (= (select (arr!17923 a!2986) j!136) lt!278981)) (bvsge j!136 index!984)))))

(declare-fun res!392434 () Bool)

(assert (=> start!55614 (=> (not res!392434) (not e!349392))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55614 (= res!392434 (validMask!0 mask!3053))))

(assert (=> start!55614 e!349392))

(assert (=> start!55614 true))

(declare-fun array_inv!13719 (array!37345) Bool)

(assert (=> start!55614 (array_inv!13719 a!2986)))

(declare-fun b!610001 () Bool)

(declare-fun e!349393 () Bool)

(assert (=> b!610001 (= e!349390 e!349393)))

(declare-fun res!392432 () Bool)

(assert (=> b!610001 (=> (not res!392432) (not e!349393))))

(declare-fun lt!278968 () array!37345)

(declare-fun arrayContainsKey!0 (array!37345 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!610001 (= res!392432 (arrayContainsKey!0 lt!278968 (select (arr!17923 a!2986) j!136) j!136))))

(declare-fun b!610002 () Bool)

(declare-fun e!349387 () Bool)

(declare-fun e!349395 () Bool)

(assert (=> b!610002 (= e!349387 e!349395)))

(declare-fun res!392436 () Bool)

(assert (=> b!610002 (=> res!392436 e!349395)))

(assert (=> b!610002 (= res!392436 (bvsge index!984 j!136))))

(declare-datatypes ((Unit!19558 0))(
  ( (Unit!19559) )
))
(declare-fun lt!278974 () Unit!19558)

(declare-fun e!349389 () Unit!19558)

(assert (=> b!610002 (= lt!278974 e!349389)))

(declare-fun c!69151 () Bool)

(assert (=> b!610002 (= c!69151 (bvslt j!136 index!984))))

(declare-fun b!610003 () Bool)

(declare-fun e!349386 () Bool)

(assert (=> b!610003 (= e!349398 (not e!349386))))

(declare-fun res!392444 () Bool)

(assert (=> b!610003 (=> res!392444 e!349386)))

(declare-fun lt!278969 () SeekEntryResult!6363)

(assert (=> b!610003 (= res!392444 (not (= lt!278969 (Found!6363 index!984))))))

(declare-fun lt!278970 () Unit!19558)

(declare-fun e!349397 () Unit!19558)

(assert (=> b!610003 (= lt!278970 e!349397)))

(declare-fun c!69152 () Bool)

(assert (=> b!610003 (= c!69152 (= lt!278969 Undefined!6363))))

(assert (=> b!610003 (= lt!278969 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!278967 lt!278968 mask!3053))))

(assert (=> b!610003 e!349396))

(declare-fun res!392429 () Bool)

(assert (=> b!610003 (=> (not res!392429) (not e!349396))))

(declare-fun lt!278973 () (_ BitVec 32))

(assert (=> b!610003 (= res!392429 (= lt!278975 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!278973 vacantSpotIndex!68 lt!278967 lt!278968 mask!3053)))))

(assert (=> b!610003 (= lt!278975 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!278973 vacantSpotIndex!68 (select (arr!17923 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!610003 (= lt!278967 (select (store (arr!17923 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!278977 () Unit!19558)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37345 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19558)

(assert (=> b!610003 (= lt!278977 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!278973 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!610003 (= lt!278973 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!610004 () Bool)

(declare-fun Unit!19560 () Unit!19558)

(assert (=> b!610004 (= e!349389 Unit!19560)))

(declare-fun lt!278982 () Unit!19558)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37345 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19558)

(assert (=> b!610004 (= lt!278982 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!278968 (select (arr!17923 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!610004 (arrayContainsKey!0 lt!278968 (select (arr!17923 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!278972 () Unit!19558)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37345 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11964) Unit!19558)

(assert (=> b!610004 (= lt!278972 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11961))))

(assert (=> b!610004 (arrayNoDuplicates!0 lt!278968 #b00000000000000000000000000000000 Nil!11961)))

(declare-fun lt!278978 () Unit!19558)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37345 (_ BitVec 32) (_ BitVec 32)) Unit!19558)

(assert (=> b!610004 (= lt!278978 (lemmaNoDuplicateFromThenFromBigger!0 lt!278968 #b00000000000000000000000000000000 j!136))))

(assert (=> b!610004 (arrayNoDuplicates!0 lt!278968 j!136 Nil!11961)))

(declare-fun lt!278980 () Unit!19558)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37345 (_ BitVec 64) (_ BitVec 32) List!11964) Unit!19558)

(assert (=> b!610004 (= lt!278980 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!278968 (select (arr!17923 a!2986) j!136) j!136 Nil!11961))))

(assert (=> b!610004 false))

(declare-fun b!610005 () Bool)

(declare-fun res!392426 () Bool)

(assert (=> b!610005 (=> (not res!392426) (not e!349392))))

(assert (=> b!610005 (= res!392426 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!610006 () Bool)

(assert (=> b!610006 (= e!349393 (arrayContainsKey!0 lt!278968 (select (arr!17923 a!2986) j!136) index!984))))

(declare-fun b!610007 () Bool)

(declare-fun res!392439 () Bool)

(assert (=> b!610007 (=> (not res!392439) (not e!349392))))

(assert (=> b!610007 (= res!392439 (validKeyInArray!0 (select (arr!17923 a!2986) j!136)))))

(declare-fun b!610008 () Bool)

(declare-fun Unit!19561 () Unit!19558)

(assert (=> b!610008 (= e!349397 Unit!19561)))

(assert (=> b!610008 false))

(declare-fun b!610009 () Bool)

(assert (=> b!610009 (= e!349395 (or (bvsgt #b00000000000000000000000000000000 (size!18287 a!2986)) (bvslt (size!18287 a!2986) #b01111111111111111111111111111111)))))

(assert (=> b!610009 (arrayNoDuplicates!0 lt!278968 #b00000000000000000000000000000000 Nil!11961)))

(declare-fun lt!278983 () Unit!19558)

(assert (=> b!610009 (= lt!278983 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11961))))

(assert (=> b!610009 (arrayContainsKey!0 lt!278968 (select (arr!17923 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!278976 () Unit!19558)

(assert (=> b!610009 (= lt!278976 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!278968 (select (arr!17923 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!349388 () Bool)

(assert (=> b!610009 e!349388))

(declare-fun res!392427 () Bool)

(assert (=> b!610009 (=> (not res!392427) (not e!349388))))

(assert (=> b!610009 (= res!392427 (arrayContainsKey!0 lt!278968 (select (arr!17923 a!2986) j!136) j!136))))

(declare-fun b!610010 () Bool)

(declare-fun Unit!19562 () Unit!19558)

(assert (=> b!610010 (= e!349397 Unit!19562)))

(declare-fun b!610011 () Bool)

(declare-fun res!392430 () Bool)

(assert (=> b!610011 (=> (not res!392430) (not e!349392))))

(assert (=> b!610011 (= res!392430 (and (= (size!18287 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18287 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18287 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!610012 () Bool)

(assert (=> b!610012 (= e!349385 e!349384)))

(declare-fun res!392437 () Bool)

(assert (=> b!610012 (=> (not res!392437) (not e!349384))))

(assert (=> b!610012 (= res!392437 (= (select (store (arr!17923 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!610012 (= lt!278968 (array!37346 (store (arr!17923 a!2986) i!1108 k0!1786) (size!18287 a!2986)))))

(declare-fun b!610013 () Bool)

(assert (=> b!610013 (= e!349386 e!349387)))

(declare-fun res!392435 () Bool)

(assert (=> b!610013 (=> res!392435 e!349387)))

(assert (=> b!610013 (= res!392435 (or (not (= (select (arr!17923 a!2986) j!136) lt!278967)) (not (= (select (arr!17923 a!2986) j!136) lt!278981))))))

(assert (=> b!610013 e!349391))

(declare-fun res!392428 () Bool)

(assert (=> b!610013 (=> (not res!392428) (not e!349391))))

(assert (=> b!610013 (= res!392428 (= lt!278981 (select (arr!17923 a!2986) j!136)))))

(assert (=> b!610013 (= lt!278981 (select (store (arr!17923 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!610014 () Bool)

(assert (=> b!610014 (= e!349392 e!349385)))

(declare-fun res!392442 () Bool)

(assert (=> b!610014 (=> (not res!392442) (not e!349385))))

(declare-fun lt!278979 () SeekEntryResult!6363)

(assert (=> b!610014 (= res!392442 (or (= lt!278979 (MissingZero!6363 i!1108)) (= lt!278979 (MissingVacant!6363 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37345 (_ BitVec 32)) SeekEntryResult!6363)

(assert (=> b!610014 (= lt!278979 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!610015 () Bool)

(declare-fun Unit!19563 () Unit!19558)

(assert (=> b!610015 (= e!349389 Unit!19563)))

(declare-fun b!610016 () Bool)

(assert (=> b!610016 (= e!349388 (arrayContainsKey!0 lt!278968 (select (arr!17923 a!2986) j!136) index!984))))

(assert (= (and start!55614 res!392434) b!610011))

(assert (= (and b!610011 res!392430) b!610007))

(assert (= (and b!610007 res!392439) b!609996))

(assert (= (and b!609996 res!392440) b!610005))

(assert (= (and b!610005 res!392426) b!610014))

(assert (= (and b!610014 res!392442) b!609998))

(assert (= (and b!609998 res!392431) b!609999))

(assert (= (and b!609999 res!392441) b!609997))

(assert (= (and b!609997 res!392443) b!610012))

(assert (= (and b!610012 res!392437) b!609994))

(assert (= (and b!609994 res!392433) b!610003))

(assert (= (and b!610003 res!392429) b!609995))

(assert (= (and b!610003 c!69152) b!610008))

(assert (= (and b!610003 (not c!69152)) b!610010))

(assert (= (and b!610003 (not res!392444)) b!610013))

(assert (= (and b!610013 res!392428) b!610000))

(assert (= (and b!610000 (not res!392438)) b!610001))

(assert (= (and b!610001 res!392432) b!610006))

(assert (= (and b!610013 (not res!392435)) b!610002))

(assert (= (and b!610002 c!69151) b!610004))

(assert (= (and b!610002 (not c!69151)) b!610015))

(assert (= (and b!610002 (not res!392436)) b!610009))

(assert (= (and b!610009 res!392427) b!610016))

(declare-fun m!586467 () Bool)

(assert (=> b!610013 m!586467))

(declare-fun m!586469 () Bool)

(assert (=> b!610013 m!586469))

(declare-fun m!586471 () Bool)

(assert (=> b!610013 m!586471))

(declare-fun m!586473 () Bool)

(assert (=> b!610005 m!586473))

(declare-fun m!586475 () Bool)

(assert (=> b!609999 m!586475))

(declare-fun m!586477 () Bool)

(assert (=> b!610014 m!586477))

(declare-fun m!586479 () Bool)

(assert (=> start!55614 m!586479))

(declare-fun m!586481 () Bool)

(assert (=> start!55614 m!586481))

(assert (=> b!610016 m!586467))

(assert (=> b!610016 m!586467))

(declare-fun m!586483 () Bool)

(assert (=> b!610016 m!586483))

(assert (=> b!610000 m!586467))

(declare-fun m!586485 () Bool)

(assert (=> b!609994 m!586485))

(assert (=> b!609994 m!586467))

(assert (=> b!609994 m!586467))

(declare-fun m!586487 () Bool)

(assert (=> b!609994 m!586487))

(assert (=> b!610001 m!586467))

(assert (=> b!610001 m!586467))

(declare-fun m!586489 () Bool)

(assert (=> b!610001 m!586489))

(declare-fun m!586491 () Bool)

(assert (=> b!609998 m!586491))

(declare-fun m!586493 () Bool)

(assert (=> b!610003 m!586493))

(declare-fun m!586495 () Bool)

(assert (=> b!610003 m!586495))

(declare-fun m!586497 () Bool)

(assert (=> b!610003 m!586497))

(declare-fun m!586499 () Bool)

(assert (=> b!610003 m!586499))

(assert (=> b!610003 m!586467))

(assert (=> b!610003 m!586469))

(declare-fun m!586501 () Bool)

(assert (=> b!610003 m!586501))

(assert (=> b!610003 m!586467))

(declare-fun m!586503 () Bool)

(assert (=> b!610003 m!586503))

(assert (=> b!610009 m!586467))

(assert (=> b!610009 m!586467))

(assert (=> b!610009 m!586489))

(assert (=> b!610009 m!586467))

(declare-fun m!586505 () Bool)

(assert (=> b!610009 m!586505))

(declare-fun m!586507 () Bool)

(assert (=> b!610009 m!586507))

(declare-fun m!586509 () Bool)

(assert (=> b!610009 m!586509))

(assert (=> b!610009 m!586467))

(declare-fun m!586511 () Bool)

(assert (=> b!610009 m!586511))

(assert (=> b!610004 m!586509))

(assert (=> b!610004 m!586467))

(assert (=> b!610004 m!586467))

(declare-fun m!586513 () Bool)

(assert (=> b!610004 m!586513))

(assert (=> b!610004 m!586467))

(declare-fun m!586515 () Bool)

(assert (=> b!610004 m!586515))

(declare-fun m!586517 () Bool)

(assert (=> b!610004 m!586517))

(assert (=> b!610004 m!586507))

(assert (=> b!610004 m!586467))

(declare-fun m!586519 () Bool)

(assert (=> b!610004 m!586519))

(declare-fun m!586521 () Bool)

(assert (=> b!610004 m!586521))

(assert (=> b!610012 m!586469))

(declare-fun m!586523 () Bool)

(assert (=> b!610012 m!586523))

(assert (=> b!610007 m!586467))

(assert (=> b!610007 m!586467))

(declare-fun m!586525 () Bool)

(assert (=> b!610007 m!586525))

(declare-fun m!586527 () Bool)

(assert (=> b!609997 m!586527))

(assert (=> b!610006 m!586467))

(assert (=> b!610006 m!586467))

(assert (=> b!610006 m!586483))

(declare-fun m!586529 () Bool)

(assert (=> b!609996 m!586529))

(check-sat (not b!610006) (not b!610007) (not b!610016) (not b!610014) (not b!609999) (not b!609994) (not b!610004) (not b!610009) (not b!609996) (not b!609998) (not b!610005) (not b!610001) (not b!610003) (not start!55614))
(check-sat)
(get-model)

(declare-fun b!610098 () Bool)

(declare-fun e!349450 () SeekEntryResult!6363)

(assert (=> b!610098 (= e!349450 Undefined!6363)))

(declare-fun b!610099 () Bool)

(declare-fun e!349451 () SeekEntryResult!6363)

(assert (=> b!610099 (= e!349451 (Found!6363 index!984))))

(declare-fun b!610100 () Bool)

(declare-fun c!69165 () Bool)

(declare-fun lt!279039 () (_ BitVec 64))

(assert (=> b!610100 (= c!69165 (= lt!279039 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!349452 () SeekEntryResult!6363)

(assert (=> b!610100 (= e!349451 e!349452)))

(declare-fun b!610101 () Bool)

(assert (=> b!610101 (= e!349452 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!17923 a!2986) j!136) a!2986 mask!3053))))

(declare-fun d!88095 () Bool)

(declare-fun lt!279040 () SeekEntryResult!6363)

(get-info :version)

(assert (=> d!88095 (and (or ((_ is Undefined!6363) lt!279040) (not ((_ is Found!6363) lt!279040)) (and (bvsge (index!27728 lt!279040) #b00000000000000000000000000000000) (bvslt (index!27728 lt!279040) (size!18287 a!2986)))) (or ((_ is Undefined!6363) lt!279040) ((_ is Found!6363) lt!279040) (not ((_ is MissingVacant!6363) lt!279040)) (not (= (index!27730 lt!279040) vacantSpotIndex!68)) (and (bvsge (index!27730 lt!279040) #b00000000000000000000000000000000) (bvslt (index!27730 lt!279040) (size!18287 a!2986)))) (or ((_ is Undefined!6363) lt!279040) (ite ((_ is Found!6363) lt!279040) (= (select (arr!17923 a!2986) (index!27728 lt!279040)) (select (arr!17923 a!2986) j!136)) (and ((_ is MissingVacant!6363) lt!279040) (= (index!27730 lt!279040) vacantSpotIndex!68) (= (select (arr!17923 a!2986) (index!27730 lt!279040)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!88095 (= lt!279040 e!349450)))

(declare-fun c!69166 () Bool)

(assert (=> d!88095 (= c!69166 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!88095 (= lt!279039 (select (arr!17923 a!2986) index!984))))

(assert (=> d!88095 (validMask!0 mask!3053)))

(assert (=> d!88095 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17923 a!2986) j!136) a!2986 mask!3053) lt!279040)))

(declare-fun b!610102 () Bool)

(assert (=> b!610102 (= e!349450 e!349451)))

(declare-fun c!69167 () Bool)

(assert (=> b!610102 (= c!69167 (= lt!279039 (select (arr!17923 a!2986) j!136)))))

(declare-fun b!610103 () Bool)

(assert (=> b!610103 (= e!349452 (MissingVacant!6363 vacantSpotIndex!68))))

(assert (= (and d!88095 c!69166) b!610098))

(assert (= (and d!88095 (not c!69166)) b!610102))

(assert (= (and b!610102 c!69167) b!610099))

(assert (= (and b!610102 (not c!69167)) b!610100))

(assert (= (and b!610100 c!69165) b!610103))

(assert (= (and b!610100 (not c!69165)) b!610101))

(assert (=> b!610101 m!586493))

(assert (=> b!610101 m!586493))

(assert (=> b!610101 m!586467))

(declare-fun m!586595 () Bool)

(assert (=> b!610101 m!586595))

(declare-fun m!586597 () Bool)

(assert (=> d!88095 m!586597))

(declare-fun m!586599 () Bool)

(assert (=> d!88095 m!586599))

(assert (=> d!88095 m!586485))

(assert (=> d!88095 m!586479))

(assert (=> b!609994 d!88095))

(declare-fun d!88097 () Bool)

(declare-fun res!392506 () Bool)

(declare-fun e!349457 () Bool)

(assert (=> d!88097 (=> res!392506 e!349457)))

(assert (=> d!88097 (= res!392506 (= (select (arr!17923 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!88097 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!349457)))

(declare-fun b!610108 () Bool)

(declare-fun e!349458 () Bool)

(assert (=> b!610108 (= e!349457 e!349458)))

(declare-fun res!392507 () Bool)

(assert (=> b!610108 (=> (not res!392507) (not e!349458))))

(assert (=> b!610108 (= res!392507 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18287 a!2986)))))

(declare-fun b!610109 () Bool)

(assert (=> b!610109 (= e!349458 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!88097 (not res!392506)) b!610108))

(assert (= (and b!610108 res!392507) b!610109))

(declare-fun m!586601 () Bool)

(assert (=> d!88097 m!586601))

(declare-fun m!586603 () Bool)

(assert (=> b!610109 m!586603))

(assert (=> b!610005 d!88097))

(declare-fun d!88099 () Bool)

(declare-fun res!392508 () Bool)

(declare-fun e!349459 () Bool)

(assert (=> d!88099 (=> res!392508 e!349459)))

(assert (=> d!88099 (= res!392508 (= (select (arr!17923 lt!278968) index!984) (select (arr!17923 a!2986) j!136)))))

(assert (=> d!88099 (= (arrayContainsKey!0 lt!278968 (select (arr!17923 a!2986) j!136) index!984) e!349459)))

(declare-fun b!610110 () Bool)

(declare-fun e!349460 () Bool)

(assert (=> b!610110 (= e!349459 e!349460)))

(declare-fun res!392509 () Bool)

(assert (=> b!610110 (=> (not res!392509) (not e!349460))))

(assert (=> b!610110 (= res!392509 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18287 lt!278968)))))

(declare-fun b!610111 () Bool)

(assert (=> b!610111 (= e!349460 (arrayContainsKey!0 lt!278968 (select (arr!17923 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!88099 (not res!392508)) b!610110))

(assert (= (and b!610110 res!392509) b!610111))

(declare-fun m!586605 () Bool)

(assert (=> d!88099 m!586605))

(assert (=> b!610111 m!586467))

(declare-fun m!586607 () Bool)

(assert (=> b!610111 m!586607))

(assert (=> b!610016 d!88099))

(assert (=> b!610006 d!88099))

(declare-fun d!88101 () Bool)

(assert (=> d!88101 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!609996 d!88101))

(declare-fun d!88103 () Bool)

(assert (=> d!88103 (= (validKeyInArray!0 (select (arr!17923 a!2986) j!136)) (and (not (= (select (arr!17923 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!17923 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!610007 d!88103))

(declare-fun b!610121 () Bool)

(declare-fun e!349469 () Bool)

(declare-fun call!33113 () Bool)

(assert (=> b!610121 (= e!349469 call!33113)))

(declare-fun b!610122 () Bool)

(declare-fun e!349468 () Bool)

(declare-fun e!349467 () Bool)

(assert (=> b!610122 (= e!349468 e!349467)))

(declare-fun c!69170 () Bool)

(assert (=> b!610122 (= c!69170 (validKeyInArray!0 (select (arr!17923 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!610123 () Bool)

(assert (=> b!610123 (= e!349467 e!349469)))

(declare-fun lt!279047 () (_ BitVec 64))

(assert (=> b!610123 (= lt!279047 (select (arr!17923 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!279048 () Unit!19558)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!37345 (_ BitVec 64) (_ BitVec 32)) Unit!19558)

(assert (=> b!610123 (= lt!279048 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!279047 #b00000000000000000000000000000000))))

(assert (=> b!610123 (arrayContainsKey!0 a!2986 lt!279047 #b00000000000000000000000000000000)))

(declare-fun lt!279049 () Unit!19558)

(assert (=> b!610123 (= lt!279049 lt!279048)))

(declare-fun res!392514 () Bool)

(assert (=> b!610123 (= res!392514 (= (seekEntryOrOpen!0 (select (arr!17923 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6363 #b00000000000000000000000000000000)))))

(assert (=> b!610123 (=> (not res!392514) (not e!349469))))

(declare-fun bm!33110 () Bool)

(assert (=> bm!33110 (= call!33113 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!610120 () Bool)

(assert (=> b!610120 (= e!349467 call!33113)))

(declare-fun d!88105 () Bool)

(declare-fun res!392515 () Bool)

(assert (=> d!88105 (=> res!392515 e!349468)))

(assert (=> d!88105 (= res!392515 (bvsge #b00000000000000000000000000000000 (size!18287 a!2986)))))

(assert (=> d!88105 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!349468)))

(assert (= (and d!88105 (not res!392515)) b!610122))

(assert (= (and b!610122 c!69170) b!610123))

(assert (= (and b!610122 (not c!69170)) b!610120))

(assert (= (and b!610123 res!392514) b!610121))

(assert (= (or b!610121 b!610120) bm!33110))

(assert (=> b!610122 m!586601))

(assert (=> b!610122 m!586601))

(declare-fun m!586609 () Bool)

(assert (=> b!610122 m!586609))

(assert (=> b!610123 m!586601))

(declare-fun m!586611 () Bool)

(assert (=> b!610123 m!586611))

(declare-fun m!586613 () Bool)

(assert (=> b!610123 m!586613))

(assert (=> b!610123 m!586601))

(declare-fun m!586615 () Bool)

(assert (=> b!610123 m!586615))

(declare-fun m!586617 () Bool)

(assert (=> bm!33110 m!586617))

(assert (=> b!609998 d!88105))

(declare-fun bm!33113 () Bool)

(declare-fun call!33116 () Bool)

(declare-fun c!69173 () Bool)

(assert (=> bm!33113 (= call!33116 (arrayNoDuplicates!0 lt!278968 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!69173 (Cons!11960 (select (arr!17923 lt!278968) #b00000000000000000000000000000000) Nil!11961) Nil!11961)))))

(declare-fun b!610134 () Bool)

(declare-fun e!349478 () Bool)

(declare-fun contains!3036 (List!11964 (_ BitVec 64)) Bool)

(assert (=> b!610134 (= e!349478 (contains!3036 Nil!11961 (select (arr!17923 lt!278968) #b00000000000000000000000000000000)))))

(declare-fun b!610135 () Bool)

(declare-fun e!349480 () Bool)

(declare-fun e!349479 () Bool)

(assert (=> b!610135 (= e!349480 e!349479)))

(declare-fun res!392522 () Bool)

(assert (=> b!610135 (=> (not res!392522) (not e!349479))))

(assert (=> b!610135 (= res!392522 (not e!349478))))

(declare-fun res!392524 () Bool)

(assert (=> b!610135 (=> (not res!392524) (not e!349478))))

(assert (=> b!610135 (= res!392524 (validKeyInArray!0 (select (arr!17923 lt!278968) #b00000000000000000000000000000000)))))

(declare-fun b!610136 () Bool)

(declare-fun e!349481 () Bool)

(assert (=> b!610136 (= e!349479 e!349481)))

(assert (=> b!610136 (= c!69173 (validKeyInArray!0 (select (arr!17923 lt!278968) #b00000000000000000000000000000000)))))

(declare-fun b!610137 () Bool)

(assert (=> b!610137 (= e!349481 call!33116)))

(declare-fun d!88107 () Bool)

(declare-fun res!392523 () Bool)

(assert (=> d!88107 (=> res!392523 e!349480)))

(assert (=> d!88107 (= res!392523 (bvsge #b00000000000000000000000000000000 (size!18287 lt!278968)))))

(assert (=> d!88107 (= (arrayNoDuplicates!0 lt!278968 #b00000000000000000000000000000000 Nil!11961) e!349480)))

(declare-fun b!610138 () Bool)

(assert (=> b!610138 (= e!349481 call!33116)))

(assert (= (and d!88107 (not res!392523)) b!610135))

(assert (= (and b!610135 res!392524) b!610134))

(assert (= (and b!610135 res!392522) b!610136))

(assert (= (and b!610136 c!69173) b!610137))

(assert (= (and b!610136 (not c!69173)) b!610138))

(assert (= (or b!610137 b!610138) bm!33113))

(declare-fun m!586619 () Bool)

(assert (=> bm!33113 m!586619))

(declare-fun m!586621 () Bool)

(assert (=> bm!33113 m!586621))

(assert (=> b!610134 m!586619))

(assert (=> b!610134 m!586619))

(declare-fun m!586623 () Bool)

(assert (=> b!610134 m!586623))

(assert (=> b!610135 m!586619))

(assert (=> b!610135 m!586619))

(declare-fun m!586625 () Bool)

(assert (=> b!610135 m!586625))

(assert (=> b!610136 m!586619))

(assert (=> b!610136 m!586619))

(assert (=> b!610136 m!586625))

(assert (=> b!610009 d!88107))

(declare-fun d!88109 () Bool)

(declare-fun res!392525 () Bool)

(declare-fun e!349482 () Bool)

(assert (=> d!88109 (=> res!392525 e!349482)))

(assert (=> d!88109 (= res!392525 (= (select (arr!17923 lt!278968) j!136) (select (arr!17923 a!2986) j!136)))))

(assert (=> d!88109 (= (arrayContainsKey!0 lt!278968 (select (arr!17923 a!2986) j!136) j!136) e!349482)))

(declare-fun b!610139 () Bool)

(declare-fun e!349483 () Bool)

(assert (=> b!610139 (= e!349482 e!349483)))

(declare-fun res!392526 () Bool)

(assert (=> b!610139 (=> (not res!392526) (not e!349483))))

(assert (=> b!610139 (= res!392526 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18287 lt!278968)))))

(declare-fun b!610140 () Bool)

(assert (=> b!610140 (= e!349483 (arrayContainsKey!0 lt!278968 (select (arr!17923 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!88109 (not res!392525)) b!610139))

(assert (= (and b!610139 res!392526) b!610140))

(declare-fun m!586627 () Bool)

(assert (=> d!88109 m!586627))

(assert (=> b!610140 m!586467))

(declare-fun m!586629 () Bool)

(assert (=> b!610140 m!586629))

(assert (=> b!610009 d!88109))

(declare-fun d!88111 () Bool)

(assert (=> d!88111 (arrayContainsKey!0 lt!278968 (select (arr!17923 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!279052 () Unit!19558)

(declare-fun choose!114 (array!37345 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19558)

(assert (=> d!88111 (= lt!279052 (choose!114 lt!278968 (select (arr!17923 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> d!88111 (bvsge j!136 #b00000000000000000000000000000000)))

(assert (=> d!88111 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!278968 (select (arr!17923 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)) lt!279052)))

(declare-fun bs!18610 () Bool)

(assert (= bs!18610 d!88111))

(assert (=> bs!18610 m!586467))

(assert (=> bs!18610 m!586511))

(assert (=> bs!18610 m!586467))

(declare-fun m!586631 () Bool)

(assert (=> bs!18610 m!586631))

(assert (=> b!610009 d!88111))

(declare-fun d!88113 () Bool)

(declare-fun res!392527 () Bool)

(declare-fun e!349484 () Bool)

(assert (=> d!88113 (=> res!392527 e!349484)))

(assert (=> d!88113 (= res!392527 (= (select (arr!17923 lt!278968) (bvadd #b00000000000000000000000000000001 index!984)) (select (arr!17923 a!2986) j!136)))))

(assert (=> d!88113 (= (arrayContainsKey!0 lt!278968 (select (arr!17923 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984)) e!349484)))

(declare-fun b!610141 () Bool)

(declare-fun e!349485 () Bool)

(assert (=> b!610141 (= e!349484 e!349485)))

(declare-fun res!392528 () Bool)

(assert (=> b!610141 (=> (not res!392528) (not e!349485))))

(assert (=> b!610141 (= res!392528 (bvslt (bvadd #b00000000000000000000000000000001 index!984 #b00000000000000000000000000000001) (size!18287 lt!278968)))))

(declare-fun b!610142 () Bool)

(assert (=> b!610142 (= e!349485 (arrayContainsKey!0 lt!278968 (select (arr!17923 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!88113 (not res!392527)) b!610141))

(assert (= (and b!610141 res!392528) b!610142))

(declare-fun m!586633 () Bool)

(assert (=> d!88113 m!586633))

(assert (=> b!610142 m!586467))

(declare-fun m!586635 () Bool)

(assert (=> b!610142 m!586635))

(assert (=> b!610009 d!88113))

(declare-fun d!88115 () Bool)

(declare-fun e!349488 () Bool)

(assert (=> d!88115 e!349488))

(declare-fun res!392531 () Bool)

(assert (=> d!88115 (=> (not res!392531) (not e!349488))))

(assert (=> d!88115 (= res!392531 (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18287 a!2986))))))

(declare-fun lt!279055 () Unit!19558)

(declare-fun choose!41 (array!37345 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11964) Unit!19558)

(assert (=> d!88115 (= lt!279055 (choose!41 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11961))))

(assert (=> d!88115 (bvslt (size!18287 a!2986) #b01111111111111111111111111111111)))

(assert (=> d!88115 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11961) lt!279055)))

(declare-fun b!610145 () Bool)

(assert (=> b!610145 (= e!349488 (arrayNoDuplicates!0 (array!37346 (store (arr!17923 a!2986) i!1108 k0!1786) (size!18287 a!2986)) #b00000000000000000000000000000000 Nil!11961))))

(assert (= (and d!88115 res!392531) b!610145))

(declare-fun m!586637 () Bool)

(assert (=> d!88115 m!586637))

(assert (=> b!610145 m!586469))

(declare-fun m!586639 () Bool)

(assert (=> b!610145 m!586639))

(assert (=> b!610009 d!88115))

(declare-fun bm!33114 () Bool)

(declare-fun call!33117 () Bool)

(declare-fun c!69174 () Bool)

(assert (=> bm!33114 (= call!33117 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!69174 (Cons!11960 (select (arr!17923 a!2986) #b00000000000000000000000000000000) Nil!11961) Nil!11961)))))

(declare-fun b!610146 () Bool)

(declare-fun e!349489 () Bool)

(assert (=> b!610146 (= e!349489 (contains!3036 Nil!11961 (select (arr!17923 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!610147 () Bool)

(declare-fun e!349491 () Bool)

(declare-fun e!349490 () Bool)

(assert (=> b!610147 (= e!349491 e!349490)))

(declare-fun res!392532 () Bool)

(assert (=> b!610147 (=> (not res!392532) (not e!349490))))

(assert (=> b!610147 (= res!392532 (not e!349489))))

(declare-fun res!392534 () Bool)

(assert (=> b!610147 (=> (not res!392534) (not e!349489))))

(assert (=> b!610147 (= res!392534 (validKeyInArray!0 (select (arr!17923 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!610148 () Bool)

(declare-fun e!349492 () Bool)

(assert (=> b!610148 (= e!349490 e!349492)))

(assert (=> b!610148 (= c!69174 (validKeyInArray!0 (select (arr!17923 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!610149 () Bool)

(assert (=> b!610149 (= e!349492 call!33117)))

(declare-fun d!88117 () Bool)

(declare-fun res!392533 () Bool)

(assert (=> d!88117 (=> res!392533 e!349491)))

(assert (=> d!88117 (= res!392533 (bvsge #b00000000000000000000000000000000 (size!18287 a!2986)))))

(assert (=> d!88117 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11961) e!349491)))

(declare-fun b!610150 () Bool)

(assert (=> b!610150 (= e!349492 call!33117)))

(assert (= (and d!88117 (not res!392533)) b!610147))

(assert (= (and b!610147 res!392534) b!610146))

(assert (= (and b!610147 res!392532) b!610148))

(assert (= (and b!610148 c!69174) b!610149))

(assert (= (and b!610148 (not c!69174)) b!610150))

(assert (= (or b!610149 b!610150) bm!33114))

(assert (=> bm!33114 m!586601))

(declare-fun m!586641 () Bool)

(assert (=> bm!33114 m!586641))

(assert (=> b!610146 m!586601))

(assert (=> b!610146 m!586601))

(declare-fun m!586643 () Bool)

(assert (=> b!610146 m!586643))

(assert (=> b!610147 m!586601))

(assert (=> b!610147 m!586601))

(assert (=> b!610147 m!586609))

(assert (=> b!610148 m!586601))

(assert (=> b!610148 m!586601))

(assert (=> b!610148 m!586609))

(assert (=> b!609999 d!88117))

(assert (=> b!610001 d!88109))

(declare-fun d!88119 () Bool)

(assert (=> d!88119 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!55614 d!88119))

(declare-fun d!88125 () Bool)

(assert (=> d!88125 (= (array_inv!13719 a!2986) (bvsge (size!18287 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!55614 d!88125))

(declare-fun b!610157 () Bool)

(declare-fun e!349499 () SeekEntryResult!6363)

(assert (=> b!610157 (= e!349499 Undefined!6363)))

(declare-fun b!610158 () Bool)

(declare-fun e!349500 () SeekEntryResult!6363)

(assert (=> b!610158 (= e!349500 (Found!6363 lt!278973))))

(declare-fun b!610159 () Bool)

(declare-fun c!69175 () Bool)

(declare-fun lt!279056 () (_ BitVec 64))

(assert (=> b!610159 (= c!69175 (= lt!279056 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!349501 () SeekEntryResult!6363)

(assert (=> b!610159 (= e!349500 e!349501)))

(declare-fun b!610160 () Bool)

(assert (=> b!610160 (= e!349501 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!278973 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 lt!278967 lt!278968 mask!3053))))

(declare-fun lt!279057 () SeekEntryResult!6363)

(declare-fun d!88129 () Bool)

(assert (=> d!88129 (and (or ((_ is Undefined!6363) lt!279057) (not ((_ is Found!6363) lt!279057)) (and (bvsge (index!27728 lt!279057) #b00000000000000000000000000000000) (bvslt (index!27728 lt!279057) (size!18287 lt!278968)))) (or ((_ is Undefined!6363) lt!279057) ((_ is Found!6363) lt!279057) (not ((_ is MissingVacant!6363) lt!279057)) (not (= (index!27730 lt!279057) vacantSpotIndex!68)) (and (bvsge (index!27730 lt!279057) #b00000000000000000000000000000000) (bvslt (index!27730 lt!279057) (size!18287 lt!278968)))) (or ((_ is Undefined!6363) lt!279057) (ite ((_ is Found!6363) lt!279057) (= (select (arr!17923 lt!278968) (index!27728 lt!279057)) lt!278967) (and ((_ is MissingVacant!6363) lt!279057) (= (index!27730 lt!279057) vacantSpotIndex!68) (= (select (arr!17923 lt!278968) (index!27730 lt!279057)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!88129 (= lt!279057 e!349499)))

(declare-fun c!69176 () Bool)

(assert (=> d!88129 (= c!69176 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!88129 (= lt!279056 (select (arr!17923 lt!278968) lt!278973))))

(assert (=> d!88129 (validMask!0 mask!3053)))

(assert (=> d!88129 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!278973 vacantSpotIndex!68 lt!278967 lt!278968 mask!3053) lt!279057)))

(declare-fun b!610161 () Bool)

(assert (=> b!610161 (= e!349499 e!349500)))

(declare-fun c!69177 () Bool)

(assert (=> b!610161 (= c!69177 (= lt!279056 lt!278967))))

(declare-fun b!610162 () Bool)

(assert (=> b!610162 (= e!349501 (MissingVacant!6363 vacantSpotIndex!68))))

(assert (= (and d!88129 c!69176) b!610157))

(assert (= (and d!88129 (not c!69176)) b!610161))

(assert (= (and b!610161 c!69177) b!610158))

(assert (= (and b!610161 (not c!69177)) b!610159))

(assert (= (and b!610159 c!69175) b!610162))

(assert (= (and b!610159 (not c!69175)) b!610160))

(declare-fun m!586649 () Bool)

(assert (=> b!610160 m!586649))

(assert (=> b!610160 m!586649))

(declare-fun m!586651 () Bool)

(assert (=> b!610160 m!586651))

(declare-fun m!586653 () Bool)

(assert (=> d!88129 m!586653))

(declare-fun m!586655 () Bool)

(assert (=> d!88129 m!586655))

(declare-fun m!586657 () Bool)

(assert (=> d!88129 m!586657))

(assert (=> d!88129 m!586479))

(assert (=> b!610003 d!88129))

(declare-fun b!610163 () Bool)

(declare-fun e!349502 () SeekEntryResult!6363)

(assert (=> b!610163 (= e!349502 Undefined!6363)))

(declare-fun b!610164 () Bool)

(declare-fun e!349503 () SeekEntryResult!6363)

(assert (=> b!610164 (= e!349503 (Found!6363 index!984))))

(declare-fun b!610165 () Bool)

(declare-fun c!69178 () Bool)

(declare-fun lt!279058 () (_ BitVec 64))

(assert (=> b!610165 (= c!69178 (= lt!279058 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!349504 () SeekEntryResult!6363)

(assert (=> b!610165 (= e!349503 e!349504)))

(declare-fun b!610166 () Bool)

(assert (=> b!610166 (= e!349504 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 lt!278967 lt!278968 mask!3053))))

(declare-fun lt!279059 () SeekEntryResult!6363)

(declare-fun d!88131 () Bool)

(assert (=> d!88131 (and (or ((_ is Undefined!6363) lt!279059) (not ((_ is Found!6363) lt!279059)) (and (bvsge (index!27728 lt!279059) #b00000000000000000000000000000000) (bvslt (index!27728 lt!279059) (size!18287 lt!278968)))) (or ((_ is Undefined!6363) lt!279059) ((_ is Found!6363) lt!279059) (not ((_ is MissingVacant!6363) lt!279059)) (not (= (index!27730 lt!279059) vacantSpotIndex!68)) (and (bvsge (index!27730 lt!279059) #b00000000000000000000000000000000) (bvslt (index!27730 lt!279059) (size!18287 lt!278968)))) (or ((_ is Undefined!6363) lt!279059) (ite ((_ is Found!6363) lt!279059) (= (select (arr!17923 lt!278968) (index!27728 lt!279059)) lt!278967) (and ((_ is MissingVacant!6363) lt!279059) (= (index!27730 lt!279059) vacantSpotIndex!68) (= (select (arr!17923 lt!278968) (index!27730 lt!279059)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!88131 (= lt!279059 e!349502)))

(declare-fun c!69179 () Bool)

(assert (=> d!88131 (= c!69179 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!88131 (= lt!279058 (select (arr!17923 lt!278968) index!984))))

(assert (=> d!88131 (validMask!0 mask!3053)))

(assert (=> d!88131 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!278967 lt!278968 mask!3053) lt!279059)))

(declare-fun b!610167 () Bool)

(assert (=> b!610167 (= e!349502 e!349503)))

(declare-fun c!69180 () Bool)

(assert (=> b!610167 (= c!69180 (= lt!279058 lt!278967))))

(declare-fun b!610168 () Bool)

(assert (=> b!610168 (= e!349504 (MissingVacant!6363 vacantSpotIndex!68))))

(assert (= (and d!88131 c!69179) b!610163))

(assert (= (and d!88131 (not c!69179)) b!610167))

(assert (= (and b!610167 c!69180) b!610164))

(assert (= (and b!610167 (not c!69180)) b!610165))

(assert (= (and b!610165 c!69178) b!610168))

(assert (= (and b!610165 (not c!69178)) b!610166))

(assert (=> b!610166 m!586493))

(assert (=> b!610166 m!586493))

(declare-fun m!586659 () Bool)

(assert (=> b!610166 m!586659))

(declare-fun m!586661 () Bool)

(assert (=> d!88131 m!586661))

(declare-fun m!586663 () Bool)

(assert (=> d!88131 m!586663))

(assert (=> d!88131 m!586605))

(assert (=> d!88131 m!586479))

(assert (=> b!610003 d!88131))

(declare-fun d!88133 () Bool)

(declare-fun e!349524 () Bool)

(assert (=> d!88133 e!349524))

(declare-fun res!392551 () Bool)

(assert (=> d!88133 (=> (not res!392551) (not e!349524))))

(assert (=> d!88133 (= res!392551 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18287 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18287 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18287 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18287 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18287 a!2986))))))

(declare-fun lt!279075 () Unit!19558)

(declare-fun choose!9 (array!37345 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19558)

(assert (=> d!88133 (= lt!279075 (choose!9 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!278973 vacantSpotIndex!68 mask!3053))))

(assert (=> d!88133 (validMask!0 mask!3053)))

(assert (=> d!88133 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!278973 vacantSpotIndex!68 mask!3053) lt!279075)))

(declare-fun b!610197 () Bool)

(assert (=> b!610197 (= e!349524 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!278973 vacantSpotIndex!68 (select (arr!17923 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!278973 vacantSpotIndex!68 (select (store (arr!17923 a!2986) i!1108 k0!1786) j!136) (array!37346 (store (arr!17923 a!2986) i!1108 k0!1786) (size!18287 a!2986)) mask!3053)))))

(assert (= (and d!88133 res!392551) b!610197))

(declare-fun m!586681 () Bool)

(assert (=> d!88133 m!586681))

(assert (=> d!88133 m!586479))

(assert (=> b!610197 m!586495))

(assert (=> b!610197 m!586469))

(assert (=> b!610197 m!586467))

(assert (=> b!610197 m!586467))

(assert (=> b!610197 m!586503))

(assert (=> b!610197 m!586495))

(declare-fun m!586683 () Bool)

(assert (=> b!610197 m!586683))

(assert (=> b!610003 d!88133))

(declare-fun d!88141 () Bool)

(declare-fun lt!279083 () (_ BitVec 32))

(assert (=> d!88141 (and (bvsge lt!279083 #b00000000000000000000000000000000) (bvslt lt!279083 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!88141 (= lt!279083 (choose!52 index!984 x!910 mask!3053))))

(assert (=> d!88141 (validMask!0 mask!3053)))

(assert (=> d!88141 (= (nextIndex!0 index!984 x!910 mask!3053) lt!279083)))

(declare-fun bs!18612 () Bool)

(assert (= bs!18612 d!88141))

(declare-fun m!586687 () Bool)

(assert (=> bs!18612 m!586687))

(assert (=> bs!18612 m!586479))

(assert (=> b!610003 d!88141))

(declare-fun b!610204 () Bool)

(declare-fun e!349528 () SeekEntryResult!6363)

(assert (=> b!610204 (= e!349528 Undefined!6363)))

(declare-fun b!610205 () Bool)

(declare-fun e!349529 () SeekEntryResult!6363)

(assert (=> b!610205 (= e!349529 (Found!6363 lt!278973))))

(declare-fun b!610206 () Bool)

(declare-fun c!69193 () Bool)

(declare-fun lt!279084 () (_ BitVec 64))

(assert (=> b!610206 (= c!69193 (= lt!279084 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!349530 () SeekEntryResult!6363)

(assert (=> b!610206 (= e!349529 e!349530)))

(declare-fun b!610207 () Bool)

(assert (=> b!610207 (= e!349530 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!278973 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 (select (arr!17923 a!2986) j!136) a!2986 mask!3053))))

(declare-fun lt!279085 () SeekEntryResult!6363)

(declare-fun d!88145 () Bool)

(assert (=> d!88145 (and (or ((_ is Undefined!6363) lt!279085) (not ((_ is Found!6363) lt!279085)) (and (bvsge (index!27728 lt!279085) #b00000000000000000000000000000000) (bvslt (index!27728 lt!279085) (size!18287 a!2986)))) (or ((_ is Undefined!6363) lt!279085) ((_ is Found!6363) lt!279085) (not ((_ is MissingVacant!6363) lt!279085)) (not (= (index!27730 lt!279085) vacantSpotIndex!68)) (and (bvsge (index!27730 lt!279085) #b00000000000000000000000000000000) (bvslt (index!27730 lt!279085) (size!18287 a!2986)))) (or ((_ is Undefined!6363) lt!279085) (ite ((_ is Found!6363) lt!279085) (= (select (arr!17923 a!2986) (index!27728 lt!279085)) (select (arr!17923 a!2986) j!136)) (and ((_ is MissingVacant!6363) lt!279085) (= (index!27730 lt!279085) vacantSpotIndex!68) (= (select (arr!17923 a!2986) (index!27730 lt!279085)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!88145 (= lt!279085 e!349528)))

(declare-fun c!69194 () Bool)

(assert (=> d!88145 (= c!69194 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!88145 (= lt!279084 (select (arr!17923 a!2986) lt!278973))))

(assert (=> d!88145 (validMask!0 mask!3053)))

(assert (=> d!88145 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!278973 vacantSpotIndex!68 (select (arr!17923 a!2986) j!136) a!2986 mask!3053) lt!279085)))

(declare-fun b!610208 () Bool)

(assert (=> b!610208 (= e!349528 e!349529)))

(declare-fun c!69195 () Bool)

(assert (=> b!610208 (= c!69195 (= lt!279084 (select (arr!17923 a!2986) j!136)))))

(declare-fun b!610209 () Bool)

(assert (=> b!610209 (= e!349530 (MissingVacant!6363 vacantSpotIndex!68))))

(assert (= (and d!88145 c!69194) b!610204))

(assert (= (and d!88145 (not c!69194)) b!610208))

(assert (= (and b!610208 c!69195) b!610205))

(assert (= (and b!610208 (not c!69195)) b!610206))

(assert (= (and b!610206 c!69193) b!610209))

(assert (= (and b!610206 (not c!69193)) b!610207))

(assert (=> b!610207 m!586649))

(assert (=> b!610207 m!586649))

(assert (=> b!610207 m!586467))

(declare-fun m!586695 () Bool)

(assert (=> b!610207 m!586695))

(declare-fun m!586697 () Bool)

(assert (=> d!88145 m!586697))

(declare-fun m!586699 () Bool)

(assert (=> d!88145 m!586699))

(declare-fun m!586701 () Bool)

(assert (=> d!88145 m!586701))

(assert (=> d!88145 m!586479))

(assert (=> b!610003 d!88145))

(declare-fun b!610260 () Bool)

(declare-fun e!349568 () SeekEntryResult!6363)

(assert (=> b!610260 (= e!349568 Undefined!6363)))

(declare-fun d!88149 () Bool)

(declare-fun lt!279103 () SeekEntryResult!6363)

(assert (=> d!88149 (and (or ((_ is Undefined!6363) lt!279103) (not ((_ is Found!6363) lt!279103)) (and (bvsge (index!27728 lt!279103) #b00000000000000000000000000000000) (bvslt (index!27728 lt!279103) (size!18287 a!2986)))) (or ((_ is Undefined!6363) lt!279103) ((_ is Found!6363) lt!279103) (not ((_ is MissingZero!6363) lt!279103)) (and (bvsge (index!27727 lt!279103) #b00000000000000000000000000000000) (bvslt (index!27727 lt!279103) (size!18287 a!2986)))) (or ((_ is Undefined!6363) lt!279103) ((_ is Found!6363) lt!279103) ((_ is MissingZero!6363) lt!279103) (not ((_ is MissingVacant!6363) lt!279103)) (and (bvsge (index!27730 lt!279103) #b00000000000000000000000000000000) (bvslt (index!27730 lt!279103) (size!18287 a!2986)))) (or ((_ is Undefined!6363) lt!279103) (ite ((_ is Found!6363) lt!279103) (= (select (arr!17923 a!2986) (index!27728 lt!279103)) k0!1786) (ite ((_ is MissingZero!6363) lt!279103) (= (select (arr!17923 a!2986) (index!27727 lt!279103)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!6363) lt!279103) (= (select (arr!17923 a!2986) (index!27730 lt!279103)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!88149 (= lt!279103 e!349568)))

(declare-fun c!69212 () Bool)

(declare-fun lt!279102 () SeekEntryResult!6363)

(assert (=> d!88149 (= c!69212 (and ((_ is Intermediate!6363) lt!279102) (undefined!7175 lt!279102)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37345 (_ BitVec 32)) SeekEntryResult!6363)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!88149 (= lt!279102 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!88149 (validMask!0 mask!3053)))

(assert (=> d!88149 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!279103)))

(declare-fun b!610261 () Bool)

(declare-fun e!349567 () SeekEntryResult!6363)

(assert (=> b!610261 (= e!349567 (MissingZero!6363 (index!27729 lt!279102)))))

(declare-fun b!610262 () Bool)

(declare-fun e!349566 () SeekEntryResult!6363)

(assert (=> b!610262 (= e!349566 (Found!6363 (index!27729 lt!279102)))))

(declare-fun b!610263 () Bool)

(assert (=> b!610263 (= e!349567 (seekKeyOrZeroReturnVacant!0 (x!56528 lt!279102) (index!27729 lt!279102) (index!27729 lt!279102) k0!1786 a!2986 mask!3053))))

(declare-fun b!610264 () Bool)

(declare-fun c!69213 () Bool)

(declare-fun lt!279101 () (_ BitVec 64))

(assert (=> b!610264 (= c!69213 (= lt!279101 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!610264 (= e!349566 e!349567)))

(declare-fun b!610265 () Bool)

(assert (=> b!610265 (= e!349568 e!349566)))

(assert (=> b!610265 (= lt!279101 (select (arr!17923 a!2986) (index!27729 lt!279102)))))

(declare-fun c!69211 () Bool)

(assert (=> b!610265 (= c!69211 (= lt!279101 k0!1786))))

(assert (= (and d!88149 c!69212) b!610260))

(assert (= (and d!88149 (not c!69212)) b!610265))

(assert (= (and b!610265 c!69211) b!610262))

(assert (= (and b!610265 (not c!69211)) b!610264))

(assert (= (and b!610264 c!69213) b!610261))

(assert (= (and b!610264 (not c!69213)) b!610263))

(declare-fun m!586723 () Bool)

(assert (=> d!88149 m!586723))

(declare-fun m!586725 () Bool)

(assert (=> d!88149 m!586725))

(assert (=> d!88149 m!586723))

(declare-fun m!586727 () Bool)

(assert (=> d!88149 m!586727))

(declare-fun m!586729 () Bool)

(assert (=> d!88149 m!586729))

(assert (=> d!88149 m!586479))

(declare-fun m!586731 () Bool)

(assert (=> d!88149 m!586731))

(declare-fun m!586733 () Bool)

(assert (=> b!610263 m!586733))

(declare-fun m!586735 () Bool)

(assert (=> b!610265 m!586735))

(assert (=> b!610014 d!88149))

(declare-fun d!88161 () Bool)

(assert (=> d!88161 (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18287 lt!278968)) (not (= (select (arr!17923 lt!278968) j!136) (select (arr!17923 a!2986) j!136))))))

(declare-fun lt!279113 () Unit!19558)

(declare-fun choose!21 (array!37345 (_ BitVec 64) (_ BitVec 32) List!11964) Unit!19558)

(assert (=> d!88161 (= lt!279113 (choose!21 lt!278968 (select (arr!17923 a!2986) j!136) j!136 Nil!11961))))

(assert (=> d!88161 (bvslt (size!18287 lt!278968) #b01111111111111111111111111111111)))

(assert (=> d!88161 (= (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!278968 (select (arr!17923 a!2986) j!136) j!136 Nil!11961) lt!279113)))

(declare-fun bs!18613 () Bool)

(assert (= bs!18613 d!88161))

(assert (=> bs!18613 m!586627))

(assert (=> bs!18613 m!586467))

(declare-fun m!586755 () Bool)

(assert (=> bs!18613 m!586755))

(assert (=> b!610004 d!88161))

(assert (=> b!610004 d!88107))

(declare-fun d!88167 () Bool)

(assert (=> d!88167 (arrayNoDuplicates!0 lt!278968 j!136 Nil!11961)))

(declare-fun lt!279118 () Unit!19558)

(declare-fun choose!39 (array!37345 (_ BitVec 32) (_ BitVec 32)) Unit!19558)

(assert (=> d!88167 (= lt!279118 (choose!39 lt!278968 #b00000000000000000000000000000000 j!136))))

(assert (=> d!88167 (bvslt (size!18287 lt!278968) #b01111111111111111111111111111111)))

(assert (=> d!88167 (= (lemmaNoDuplicateFromThenFromBigger!0 lt!278968 #b00000000000000000000000000000000 j!136) lt!279118)))

(declare-fun bs!18614 () Bool)

(assert (= bs!18614 d!88167))

(assert (=> bs!18614 m!586517))

(declare-fun m!586763 () Bool)

(assert (=> bs!18614 m!586763))

(assert (=> b!610004 d!88167))

(declare-fun c!69226 () Bool)

(declare-fun call!33124 () Bool)

(declare-fun bm!33121 () Bool)

(assert (=> bm!33121 (= call!33124 (arrayNoDuplicates!0 lt!278968 (bvadd j!136 #b00000000000000000000000000000001) (ite c!69226 (Cons!11960 (select (arr!17923 lt!278968) j!136) Nil!11961) Nil!11961)))))

(declare-fun b!610292 () Bool)

(declare-fun e!349583 () Bool)

(assert (=> b!610292 (= e!349583 (contains!3036 Nil!11961 (select (arr!17923 lt!278968) j!136)))))

(declare-fun b!610293 () Bool)

(declare-fun e!349585 () Bool)

(declare-fun e!349584 () Bool)

(assert (=> b!610293 (= e!349585 e!349584)))

(declare-fun res!392574 () Bool)

(assert (=> b!610293 (=> (not res!392574) (not e!349584))))

(assert (=> b!610293 (= res!392574 (not e!349583))))

(declare-fun res!392576 () Bool)

(assert (=> b!610293 (=> (not res!392576) (not e!349583))))

(assert (=> b!610293 (= res!392576 (validKeyInArray!0 (select (arr!17923 lt!278968) j!136)))))

(declare-fun b!610294 () Bool)

(declare-fun e!349586 () Bool)

(assert (=> b!610294 (= e!349584 e!349586)))

(assert (=> b!610294 (= c!69226 (validKeyInArray!0 (select (arr!17923 lt!278968) j!136)))))

(declare-fun b!610295 () Bool)

(assert (=> b!610295 (= e!349586 call!33124)))

(declare-fun d!88171 () Bool)

(declare-fun res!392575 () Bool)

(assert (=> d!88171 (=> res!392575 e!349585)))

(assert (=> d!88171 (= res!392575 (bvsge j!136 (size!18287 lt!278968)))))

(assert (=> d!88171 (= (arrayNoDuplicates!0 lt!278968 j!136 Nil!11961) e!349585)))

(declare-fun b!610296 () Bool)

(assert (=> b!610296 (= e!349586 call!33124)))

(assert (= (and d!88171 (not res!392575)) b!610293))

(assert (= (and b!610293 res!392576) b!610292))

(assert (= (and b!610293 res!392574) b!610294))

(assert (= (and b!610294 c!69226) b!610295))

(assert (= (and b!610294 (not c!69226)) b!610296))

(assert (= (or b!610295 b!610296) bm!33121))

(assert (=> bm!33121 m!586627))

(declare-fun m!586765 () Bool)

(assert (=> bm!33121 m!586765))

(assert (=> b!610292 m!586627))

(assert (=> b!610292 m!586627))

(declare-fun m!586767 () Bool)

(assert (=> b!610292 m!586767))

(assert (=> b!610293 m!586627))

(assert (=> b!610293 m!586627))

(declare-fun m!586769 () Bool)

(assert (=> b!610293 m!586769))

(assert (=> b!610294 m!586627))

(assert (=> b!610294 m!586627))

(assert (=> b!610294 m!586769))

(assert (=> b!610004 d!88171))

(assert (=> b!610004 d!88115))

(declare-fun d!88173 () Bool)

(assert (=> d!88173 (arrayContainsKey!0 lt!278968 (select (arr!17923 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!279119 () Unit!19558)

(assert (=> d!88173 (= lt!279119 (choose!114 lt!278968 (select (arr!17923 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> d!88173 (bvsge index!984 #b00000000000000000000000000000000)))

(assert (=> d!88173 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!278968 (select (arr!17923 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)) lt!279119)))

(declare-fun bs!18615 () Bool)

(assert (= bs!18615 d!88173))

(assert (=> bs!18615 m!586467))

(assert (=> bs!18615 m!586519))

(assert (=> bs!18615 m!586467))

(declare-fun m!586771 () Bool)

(assert (=> bs!18615 m!586771))

(assert (=> b!610004 d!88173))

(declare-fun d!88175 () Bool)

(declare-fun res!392577 () Bool)

(declare-fun e!349587 () Bool)

(assert (=> d!88175 (=> res!392577 e!349587)))

(assert (=> d!88175 (= res!392577 (= (select (arr!17923 lt!278968) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!17923 a!2986) j!136)))))

(assert (=> d!88175 (= (arrayContainsKey!0 lt!278968 (select (arr!17923 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!349587)))

(declare-fun b!610297 () Bool)

(declare-fun e!349588 () Bool)

(assert (=> b!610297 (= e!349587 e!349588)))

(declare-fun res!392578 () Bool)

(assert (=> b!610297 (=> (not res!392578) (not e!349588))))

(assert (=> b!610297 (= res!392578 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18287 lt!278968)))))

(declare-fun b!610298 () Bool)

(assert (=> b!610298 (= e!349588 (arrayContainsKey!0 lt!278968 (select (arr!17923 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!88175 (not res!392577)) b!610297))

(assert (= (and b!610297 res!392578) b!610298))

(declare-fun m!586773 () Bool)

(assert (=> d!88175 m!586773))

(assert (=> b!610298 m!586467))

(declare-fun m!586775 () Bool)

(assert (=> b!610298 m!586775))

(assert (=> b!610004 d!88175))

(check-sat (not d!88115) (not b!610298) (not d!88173) (not d!88133) (not d!88111) (not b!610292) (not bm!33121) (not b!610148) (not b!610122) (not b!610101) (not d!88141) (not d!88129) (not bm!33113) (not bm!33110) (not b!610166) (not b!610140) (not d!88131) (not d!88145) (not b!610197) (not bm!33114) (not b!610136) (not d!88167) (not b!610294) (not b!610147) (not b!610160) (not b!610123) (not b!610293) (not b!610142) (not b!610135) (not d!88149) (not d!88095) (not b!610146) (not b!610145) (not b!610134) (not b!610109) (not d!88161) (not b!610207) (not b!610111) (not b!610263))
(check-sat)
