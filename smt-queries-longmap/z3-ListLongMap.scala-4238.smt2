; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!58436 () Bool)

(assert start!58436)

(declare-fun b!645347 () Bool)

(declare-fun res!418231 () Bool)

(declare-fun e!369829 () Bool)

(assert (=> b!645347 (=> (not res!418231) (not e!369829))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!38463 0))(
  ( (array!38464 (arr!18443 (Array (_ BitVec 32) (_ BitVec 64))) (size!18808 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38463)

(assert (=> b!645347 (= res!418231 (and (= (size!18808 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18808 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18808 a!2986)) (not (= i!1108 j!136))))))

(declare-fun lt!299190 () array!38463)

(declare-fun e!369832 () Bool)

(declare-fun b!645348 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!38463 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!645348 (= e!369832 (arrayContainsKey!0 lt!299190 (select (arr!18443 a!2986) j!136) index!984))))

(declare-fun b!645349 () Bool)

(declare-fun res!418224 () Bool)

(declare-fun e!369835 () Bool)

(assert (=> b!645349 (=> (not res!418224) (not e!369835))))

(declare-datatypes ((List!12523 0))(
  ( (Nil!12520) (Cons!12519 (h!13564 (_ BitVec 64)) (t!18742 List!12523)) )
))
(declare-fun arrayNoDuplicates!0 (array!38463 (_ BitVec 32) List!12523) Bool)

(assert (=> b!645349 (= res!418224 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12520))))

(declare-fun b!645350 () Bool)

(declare-fun e!369831 () Bool)

(assert (=> b!645350 (= e!369831 (bvslt (size!18808 a!2986) #b01111111111111111111111111111111))))

(assert (=> b!645350 (arrayContainsKey!0 lt!299190 (select (arr!18443 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-datatypes ((Unit!21908 0))(
  ( (Unit!21909) )
))
(declare-fun lt!299195 () Unit!21908)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38463 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21908)

(assert (=> b!645350 (= lt!299195 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!299190 (select (arr!18443 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!645350 e!369832))

(declare-fun res!418213 () Bool)

(assert (=> b!645350 (=> (not res!418213) (not e!369832))))

(assert (=> b!645350 (= res!418213 (arrayContainsKey!0 lt!299190 (select (arr!18443 a!2986) j!136) j!136))))

(declare-fun b!645351 () Bool)

(declare-fun res!418215 () Bool)

(assert (=> b!645351 (=> (not res!418215) (not e!369835))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!645351 (= res!418215 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18443 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!645352 () Bool)

(declare-fun e!369842 () Bool)

(assert (=> b!645352 (= e!369842 e!369831)))

(declare-fun res!418226 () Bool)

(assert (=> b!645352 (=> res!418226 e!369831)))

(assert (=> b!645352 (= res!418226 (bvsge index!984 j!136))))

(declare-fun lt!299194 () Unit!21908)

(declare-fun e!369840 () Unit!21908)

(assert (=> b!645352 (= lt!299194 e!369840)))

(declare-fun c!73934 () Bool)

(assert (=> b!645352 (= c!73934 (bvslt j!136 index!984))))

(declare-fun b!645353 () Bool)

(declare-fun e!369837 () Bool)

(assert (=> b!645353 (= e!369837 (arrayContainsKey!0 lt!299190 (select (arr!18443 a!2986) j!136) index!984))))

(declare-fun b!645355 () Bool)

(declare-fun res!418223 () Bool)

(assert (=> b!645355 (=> (not res!418223) (not e!369829))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!645355 (= res!418223 (validKeyInArray!0 k0!1786))))

(declare-fun b!645356 () Bool)

(declare-fun e!369841 () Bool)

(assert (=> b!645356 (= e!369835 e!369841)))

(declare-fun res!418218 () Bool)

(assert (=> b!645356 (=> (not res!418218) (not e!369841))))

(assert (=> b!645356 (= res!418218 (= (select (store (arr!18443 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!645356 (= lt!299190 (array!38464 (store (arr!18443 a!2986) i!1108 k0!1786) (size!18808 a!2986)))))

(declare-fun b!645357 () Bool)

(declare-fun e!369828 () Bool)

(assert (=> b!645357 (= e!369828 e!369837)))

(declare-fun res!418230 () Bool)

(assert (=> b!645357 (=> (not res!418230) (not e!369837))))

(assert (=> b!645357 (= res!418230 (arrayContainsKey!0 lt!299190 (select (arr!18443 a!2986) j!136) j!136))))

(declare-fun b!645358 () Bool)

(declare-fun res!418217 () Bool)

(assert (=> b!645358 (=> (not res!418217) (not e!369835))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38463 (_ BitVec 32)) Bool)

(assert (=> b!645358 (= res!418217 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!645359 () Bool)

(declare-fun Unit!21910 () Unit!21908)

(assert (=> b!645359 (= e!369840 Unit!21910)))

(declare-fun lt!299187 () Unit!21908)

(assert (=> b!645359 (= lt!299187 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!299190 (select (arr!18443 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!645359 (arrayContainsKey!0 lt!299190 (select (arr!18443 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!299182 () Unit!21908)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38463 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12523) Unit!21908)

(assert (=> b!645359 (= lt!299182 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12520))))

(assert (=> b!645359 (arrayNoDuplicates!0 lt!299190 #b00000000000000000000000000000000 Nil!12520)))

(declare-fun lt!299185 () Unit!21908)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38463 (_ BitVec 32) (_ BitVec 32)) Unit!21908)

(assert (=> b!645359 (= lt!299185 (lemmaNoDuplicateFromThenFromBigger!0 lt!299190 #b00000000000000000000000000000000 j!136))))

(assert (=> b!645359 (arrayNoDuplicates!0 lt!299190 j!136 Nil!12520)))

(declare-fun lt!299184 () Unit!21908)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38463 (_ BitVec 64) (_ BitVec 32) List!12523) Unit!21908)

(assert (=> b!645359 (= lt!299184 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!299190 (select (arr!18443 a!2986) j!136) j!136 Nil!12520))))

(assert (=> b!645359 false))

(declare-fun b!645360 () Bool)

(declare-fun e!369834 () Unit!21908)

(declare-fun Unit!21911 () Unit!21908)

(assert (=> b!645360 (= e!369834 Unit!21911)))

(assert (=> b!645360 false))

(declare-fun b!645361 () Bool)

(declare-fun e!369839 () Bool)

(assert (=> b!645361 (= e!369839 e!369842)))

(declare-fun res!418225 () Bool)

(assert (=> b!645361 (=> res!418225 e!369842)))

(declare-fun lt!299193 () (_ BitVec 64))

(declare-fun lt!299188 () (_ BitVec 64))

(assert (=> b!645361 (= res!418225 (or (not (= (select (arr!18443 a!2986) j!136) lt!299188)) (not (= (select (arr!18443 a!2986) j!136) lt!299193))))))

(declare-fun e!369838 () Bool)

(assert (=> b!645361 e!369838))

(declare-fun res!418228 () Bool)

(assert (=> b!645361 (=> (not res!418228) (not e!369838))))

(assert (=> b!645361 (= res!418228 (= lt!299193 (select (arr!18443 a!2986) j!136)))))

(assert (=> b!645361 (= lt!299193 (select (store (arr!18443 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!645362 () Bool)

(declare-fun res!418216 () Bool)

(assert (=> b!645362 (=> (not res!418216) (not e!369829))))

(assert (=> b!645362 (= res!418216 (validKeyInArray!0 (select (arr!18443 a!2986) j!136)))))

(declare-fun b!645363 () Bool)

(declare-fun e!369833 () Bool)

(assert (=> b!645363 (= e!369833 (not e!369839))))

(declare-fun res!418214 () Bool)

(assert (=> b!645363 (=> res!418214 e!369839)))

(declare-datatypes ((SeekEntryResult!6880 0))(
  ( (MissingZero!6880 (index!29855 (_ BitVec 32))) (Found!6880 (index!29856 (_ BitVec 32))) (Intermediate!6880 (undefined!7692 Bool) (index!29857 (_ BitVec 32)) (x!58636 (_ BitVec 32))) (Undefined!6880) (MissingVacant!6880 (index!29858 (_ BitVec 32))) )
))
(declare-fun lt!299186 () SeekEntryResult!6880)

(assert (=> b!645363 (= res!418214 (not (= lt!299186 (Found!6880 index!984))))))

(declare-fun lt!299181 () Unit!21908)

(assert (=> b!645363 (= lt!299181 e!369834)))

(declare-fun c!73935 () Bool)

(assert (=> b!645363 (= c!73935 (= lt!299186 Undefined!6880))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38463 (_ BitVec 32)) SeekEntryResult!6880)

(assert (=> b!645363 (= lt!299186 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!299188 lt!299190 mask!3053))))

(declare-fun e!369830 () Bool)

(assert (=> b!645363 e!369830))

(declare-fun res!418219 () Bool)

(assert (=> b!645363 (=> (not res!418219) (not e!369830))))

(declare-fun lt!299191 () SeekEntryResult!6880)

(declare-fun lt!299189 () (_ BitVec 32))

(assert (=> b!645363 (= res!418219 (= lt!299191 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!299189 vacantSpotIndex!68 lt!299188 lt!299190 mask!3053)))))

(assert (=> b!645363 (= lt!299191 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!299189 vacantSpotIndex!68 (select (arr!18443 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!645363 (= lt!299188 (select (store (arr!18443 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!299192 () Unit!21908)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38463 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21908)

(assert (=> b!645363 (= lt!299192 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!299189 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!645363 (= lt!299189 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!645354 () Bool)

(declare-fun lt!299196 () SeekEntryResult!6880)

(assert (=> b!645354 (= e!369830 (= lt!299196 lt!299191))))

(declare-fun res!418222 () Bool)

(assert (=> start!58436 (=> (not res!418222) (not e!369829))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!58436 (= res!418222 (validMask!0 mask!3053))))

(assert (=> start!58436 e!369829))

(assert (=> start!58436 true))

(declare-fun array_inv!14326 (array!38463) Bool)

(assert (=> start!58436 (array_inv!14326 a!2986)))

(declare-fun b!645364 () Bool)

(declare-fun Unit!21912 () Unit!21908)

(assert (=> b!645364 (= e!369834 Unit!21912)))

(declare-fun b!645365 () Bool)

(assert (=> b!645365 (= e!369838 e!369828)))

(declare-fun res!418220 () Bool)

(assert (=> b!645365 (=> res!418220 e!369828)))

(assert (=> b!645365 (= res!418220 (or (not (= (select (arr!18443 a!2986) j!136) lt!299188)) (not (= (select (arr!18443 a!2986) j!136) lt!299193)) (bvsge j!136 index!984)))))

(declare-fun b!645366 () Bool)

(assert (=> b!645366 (= e!369841 e!369833)))

(declare-fun res!418229 () Bool)

(assert (=> b!645366 (=> (not res!418229) (not e!369833))))

(assert (=> b!645366 (= res!418229 (and (= lt!299196 (Found!6880 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18443 a!2986) index!984) (select (arr!18443 a!2986) j!136))) (not (= (select (arr!18443 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!645366 (= lt!299196 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18443 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!645367 () Bool)

(declare-fun Unit!21913 () Unit!21908)

(assert (=> b!645367 (= e!369840 Unit!21913)))

(declare-fun b!645368 () Bool)

(assert (=> b!645368 (= e!369829 e!369835)))

(declare-fun res!418227 () Bool)

(assert (=> b!645368 (=> (not res!418227) (not e!369835))))

(declare-fun lt!299183 () SeekEntryResult!6880)

(assert (=> b!645368 (= res!418227 (or (= lt!299183 (MissingZero!6880 i!1108)) (= lt!299183 (MissingVacant!6880 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38463 (_ BitVec 32)) SeekEntryResult!6880)

(assert (=> b!645368 (= lt!299183 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!645369 () Bool)

(declare-fun res!418221 () Bool)

(assert (=> b!645369 (=> (not res!418221) (not e!369829))))

(assert (=> b!645369 (= res!418221 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(assert (= (and start!58436 res!418222) b!645347))

(assert (= (and b!645347 res!418231) b!645362))

(assert (= (and b!645362 res!418216) b!645355))

(assert (= (and b!645355 res!418223) b!645369))

(assert (= (and b!645369 res!418221) b!645368))

(assert (= (and b!645368 res!418227) b!645358))

(assert (= (and b!645358 res!418217) b!645349))

(assert (= (and b!645349 res!418224) b!645351))

(assert (= (and b!645351 res!418215) b!645356))

(assert (= (and b!645356 res!418218) b!645366))

(assert (= (and b!645366 res!418229) b!645363))

(assert (= (and b!645363 res!418219) b!645354))

(assert (= (and b!645363 c!73935) b!645360))

(assert (= (and b!645363 (not c!73935)) b!645364))

(assert (= (and b!645363 (not res!418214)) b!645361))

(assert (= (and b!645361 res!418228) b!645365))

(assert (= (and b!645365 (not res!418220)) b!645357))

(assert (= (and b!645357 res!418230) b!645353))

(assert (= (and b!645361 (not res!418225)) b!645352))

(assert (= (and b!645352 c!73934) b!645359))

(assert (= (and b!645352 (not c!73934)) b!645367))

(assert (= (and b!645352 (not res!418226)) b!645350))

(assert (= (and b!645350 res!418213) b!645348))

(declare-fun m!618363 () Bool)

(assert (=> b!645369 m!618363))

(declare-fun m!618365 () Bool)

(assert (=> b!645368 m!618365))

(declare-fun m!618367 () Bool)

(assert (=> b!645365 m!618367))

(assert (=> b!645359 m!618367))

(declare-fun m!618369 () Bool)

(assert (=> b!645359 m!618369))

(declare-fun m!618371 () Bool)

(assert (=> b!645359 m!618371))

(declare-fun m!618373 () Bool)

(assert (=> b!645359 m!618373))

(assert (=> b!645359 m!618367))

(declare-fun m!618375 () Bool)

(assert (=> b!645359 m!618375))

(declare-fun m!618377 () Bool)

(assert (=> b!645359 m!618377))

(declare-fun m!618379 () Bool)

(assert (=> b!645359 m!618379))

(assert (=> b!645359 m!618367))

(declare-fun m!618381 () Bool)

(assert (=> b!645359 m!618381))

(assert (=> b!645359 m!618367))

(declare-fun m!618383 () Bool)

(assert (=> b!645358 m!618383))

(assert (=> b!645353 m!618367))

(assert (=> b!645353 m!618367))

(declare-fun m!618385 () Bool)

(assert (=> b!645353 m!618385))

(declare-fun m!618387 () Bool)

(assert (=> b!645355 m!618387))

(declare-fun m!618389 () Bool)

(assert (=> b!645366 m!618389))

(assert (=> b!645366 m!618367))

(assert (=> b!645366 m!618367))

(declare-fun m!618391 () Bool)

(assert (=> b!645366 m!618391))

(assert (=> b!645348 m!618367))

(assert (=> b!645348 m!618367))

(assert (=> b!645348 m!618385))

(declare-fun m!618393 () Bool)

(assert (=> b!645349 m!618393))

(assert (=> b!645357 m!618367))

(assert (=> b!645357 m!618367))

(declare-fun m!618395 () Bool)

(assert (=> b!645357 m!618395))

(declare-fun m!618397 () Bool)

(assert (=> b!645363 m!618397))

(declare-fun m!618399 () Bool)

(assert (=> b!645363 m!618399))

(assert (=> b!645363 m!618367))

(declare-fun m!618401 () Bool)

(assert (=> b!645363 m!618401))

(assert (=> b!645363 m!618367))

(declare-fun m!618403 () Bool)

(assert (=> b!645363 m!618403))

(declare-fun m!618405 () Bool)

(assert (=> b!645363 m!618405))

(declare-fun m!618407 () Bool)

(assert (=> b!645363 m!618407))

(declare-fun m!618409 () Bool)

(assert (=> b!645363 m!618409))

(assert (=> b!645356 m!618403))

(declare-fun m!618411 () Bool)

(assert (=> b!645356 m!618411))

(declare-fun m!618413 () Bool)

(assert (=> b!645351 m!618413))

(assert (=> b!645361 m!618367))

(assert (=> b!645361 m!618403))

(declare-fun m!618415 () Bool)

(assert (=> b!645361 m!618415))

(assert (=> b!645350 m!618367))

(assert (=> b!645350 m!618367))

(declare-fun m!618417 () Bool)

(assert (=> b!645350 m!618417))

(assert (=> b!645350 m!618367))

(declare-fun m!618419 () Bool)

(assert (=> b!645350 m!618419))

(assert (=> b!645350 m!618367))

(assert (=> b!645350 m!618395))

(declare-fun m!618421 () Bool)

(assert (=> start!58436 m!618421))

(declare-fun m!618423 () Bool)

(assert (=> start!58436 m!618423))

(assert (=> b!645362 m!618367))

(assert (=> b!645362 m!618367))

(declare-fun m!618425 () Bool)

(assert (=> b!645362 m!618425))

(check-sat (not b!645357) (not b!645368) (not b!645363) (not b!645355) (not b!645348) (not b!645362) (not start!58436) (not b!645358) (not b!645349) (not b!645350) (not b!645353) (not b!645366) (not b!645369) (not b!645359))
(check-sat)
(get-model)

(declare-fun b!645520 () Bool)

(declare-fun e!369941 () SeekEntryResult!6880)

(declare-fun e!369940 () SeekEntryResult!6880)

(assert (=> b!645520 (= e!369941 e!369940)))

(declare-fun lt!299299 () (_ BitVec 64))

(declare-fun lt!299301 () SeekEntryResult!6880)

(assert (=> b!645520 (= lt!299299 (select (arr!18443 a!2986) (index!29857 lt!299301)))))

(declare-fun c!73955 () Bool)

(assert (=> b!645520 (= c!73955 (= lt!299299 k0!1786))))

(declare-fun b!645521 () Bool)

(assert (=> b!645521 (= e!369941 Undefined!6880)))

(declare-fun b!645522 () Bool)

(declare-fun c!73956 () Bool)

(assert (=> b!645522 (= c!73956 (= lt!299299 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!369939 () SeekEntryResult!6880)

(assert (=> b!645522 (= e!369940 e!369939)))

(declare-fun b!645523 () Bool)

(assert (=> b!645523 (= e!369939 (seekKeyOrZeroReturnVacant!0 (x!58636 lt!299301) (index!29857 lt!299301) (index!29857 lt!299301) k0!1786 a!2986 mask!3053))))

(declare-fun b!645525 () Bool)

(assert (=> b!645525 (= e!369939 (MissingZero!6880 (index!29857 lt!299301)))))

(declare-fun d!91001 () Bool)

(declare-fun lt!299300 () SeekEntryResult!6880)

(get-info :version)

(assert (=> d!91001 (and (or ((_ is Undefined!6880) lt!299300) (not ((_ is Found!6880) lt!299300)) (and (bvsge (index!29856 lt!299300) #b00000000000000000000000000000000) (bvslt (index!29856 lt!299300) (size!18808 a!2986)))) (or ((_ is Undefined!6880) lt!299300) ((_ is Found!6880) lt!299300) (not ((_ is MissingZero!6880) lt!299300)) (and (bvsge (index!29855 lt!299300) #b00000000000000000000000000000000) (bvslt (index!29855 lt!299300) (size!18808 a!2986)))) (or ((_ is Undefined!6880) lt!299300) ((_ is Found!6880) lt!299300) ((_ is MissingZero!6880) lt!299300) (not ((_ is MissingVacant!6880) lt!299300)) (and (bvsge (index!29858 lt!299300) #b00000000000000000000000000000000) (bvslt (index!29858 lt!299300) (size!18808 a!2986)))) (or ((_ is Undefined!6880) lt!299300) (ite ((_ is Found!6880) lt!299300) (= (select (arr!18443 a!2986) (index!29856 lt!299300)) k0!1786) (ite ((_ is MissingZero!6880) lt!299300) (= (select (arr!18443 a!2986) (index!29855 lt!299300)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!6880) lt!299300) (= (select (arr!18443 a!2986) (index!29858 lt!299300)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!91001 (= lt!299300 e!369941)))

(declare-fun c!73954 () Bool)

(assert (=> d!91001 (= c!73954 (and ((_ is Intermediate!6880) lt!299301) (undefined!7692 lt!299301)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38463 (_ BitVec 32)) SeekEntryResult!6880)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!91001 (= lt!299301 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!91001 (validMask!0 mask!3053)))

(assert (=> d!91001 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!299300)))

(declare-fun b!645524 () Bool)

(assert (=> b!645524 (= e!369940 (Found!6880 (index!29857 lt!299301)))))

(assert (= (and d!91001 c!73954) b!645521))

(assert (= (and d!91001 (not c!73954)) b!645520))

(assert (= (and b!645520 c!73955) b!645524))

(assert (= (and b!645520 (not c!73955)) b!645522))

(assert (= (and b!645522 c!73956) b!645525))

(assert (= (and b!645522 (not c!73956)) b!645523))

(declare-fun m!618555 () Bool)

(assert (=> b!645520 m!618555))

(declare-fun m!618557 () Bool)

(assert (=> b!645523 m!618557))

(assert (=> d!91001 m!618421))

(declare-fun m!618559 () Bool)

(assert (=> d!91001 m!618559))

(declare-fun m!618561 () Bool)

(assert (=> d!91001 m!618561))

(declare-fun m!618563 () Bool)

(assert (=> d!91001 m!618563))

(assert (=> d!91001 m!618559))

(declare-fun m!618565 () Bool)

(assert (=> d!91001 m!618565))

(declare-fun m!618567 () Bool)

(assert (=> d!91001 m!618567))

(assert (=> b!645368 d!91001))

(declare-fun d!91003 () Bool)

(assert (=> d!91003 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!58436 d!91003))

(declare-fun d!91005 () Bool)

(assert (=> d!91005 (= (array_inv!14326 a!2986) (bvsge (size!18808 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!58436 d!91005))

(declare-fun d!91007 () Bool)

(declare-fun res!418350 () Bool)

(declare-fun e!369946 () Bool)

(assert (=> d!91007 (=> res!418350 e!369946)))

(assert (=> d!91007 (= res!418350 (= (select (arr!18443 lt!299190) j!136) (select (arr!18443 a!2986) j!136)))))

(assert (=> d!91007 (= (arrayContainsKey!0 lt!299190 (select (arr!18443 a!2986) j!136) j!136) e!369946)))

(declare-fun b!645530 () Bool)

(declare-fun e!369947 () Bool)

(assert (=> b!645530 (= e!369946 e!369947)))

(declare-fun res!418351 () Bool)

(assert (=> b!645530 (=> (not res!418351) (not e!369947))))

(assert (=> b!645530 (= res!418351 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18808 lt!299190)))))

(declare-fun b!645531 () Bool)

(assert (=> b!645531 (= e!369947 (arrayContainsKey!0 lt!299190 (select (arr!18443 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!91007 (not res!418350)) b!645530))

(assert (= (and b!645530 res!418351) b!645531))

(declare-fun m!618569 () Bool)

(assert (=> d!91007 m!618569))

(assert (=> b!645531 m!618367))

(declare-fun m!618571 () Bool)

(assert (=> b!645531 m!618571))

(assert (=> b!645357 d!91007))

(declare-fun b!645540 () Bool)

(declare-fun e!369954 () Bool)

(declare-fun call!33607 () Bool)

(assert (=> b!645540 (= e!369954 call!33607)))

(declare-fun bm!33604 () Bool)

(assert (=> bm!33604 (= call!33607 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!645541 () Bool)

(declare-fun e!369956 () Bool)

(assert (=> b!645541 (= e!369954 e!369956)))

(declare-fun lt!299308 () (_ BitVec 64))

(assert (=> b!645541 (= lt!299308 (select (arr!18443 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!299309 () Unit!21908)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38463 (_ BitVec 64) (_ BitVec 32)) Unit!21908)

(assert (=> b!645541 (= lt!299309 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!299308 #b00000000000000000000000000000000))))

(assert (=> b!645541 (arrayContainsKey!0 a!2986 lt!299308 #b00000000000000000000000000000000)))

(declare-fun lt!299310 () Unit!21908)

(assert (=> b!645541 (= lt!299310 lt!299309)))

(declare-fun res!418357 () Bool)

(assert (=> b!645541 (= res!418357 (= (seekEntryOrOpen!0 (select (arr!18443 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6880 #b00000000000000000000000000000000)))))

(assert (=> b!645541 (=> (not res!418357) (not e!369956))))

(declare-fun d!91009 () Bool)

(declare-fun res!418356 () Bool)

(declare-fun e!369955 () Bool)

(assert (=> d!91009 (=> res!418356 e!369955)))

(assert (=> d!91009 (= res!418356 (bvsge #b00000000000000000000000000000000 (size!18808 a!2986)))))

(assert (=> d!91009 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!369955)))

(declare-fun b!645542 () Bool)

(assert (=> b!645542 (= e!369955 e!369954)))

(declare-fun c!73959 () Bool)

(assert (=> b!645542 (= c!73959 (validKeyInArray!0 (select (arr!18443 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!645543 () Bool)

(assert (=> b!645543 (= e!369956 call!33607)))

(assert (= (and d!91009 (not res!418356)) b!645542))

(assert (= (and b!645542 c!73959) b!645541))

(assert (= (and b!645542 (not c!73959)) b!645540))

(assert (= (and b!645541 res!418357) b!645543))

(assert (= (or b!645543 b!645540) bm!33604))

(declare-fun m!618573 () Bool)

(assert (=> bm!33604 m!618573))

(declare-fun m!618575 () Bool)

(assert (=> b!645541 m!618575))

(declare-fun m!618577 () Bool)

(assert (=> b!645541 m!618577))

(declare-fun m!618579 () Bool)

(assert (=> b!645541 m!618579))

(assert (=> b!645541 m!618575))

(declare-fun m!618581 () Bool)

(assert (=> b!645541 m!618581))

(assert (=> b!645542 m!618575))

(assert (=> b!645542 m!618575))

(declare-fun m!618583 () Bool)

(assert (=> b!645542 m!618583))

(assert (=> b!645358 d!91009))

(declare-fun d!91011 () Bool)

(declare-fun res!418358 () Bool)

(declare-fun e!369957 () Bool)

(assert (=> d!91011 (=> res!418358 e!369957)))

(assert (=> d!91011 (= res!418358 (= (select (arr!18443 lt!299190) index!984) (select (arr!18443 a!2986) j!136)))))

(assert (=> d!91011 (= (arrayContainsKey!0 lt!299190 (select (arr!18443 a!2986) j!136) index!984) e!369957)))

(declare-fun b!645544 () Bool)

(declare-fun e!369958 () Bool)

(assert (=> b!645544 (= e!369957 e!369958)))

(declare-fun res!418359 () Bool)

(assert (=> b!645544 (=> (not res!418359) (not e!369958))))

(assert (=> b!645544 (= res!418359 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18808 lt!299190)))))

(declare-fun b!645545 () Bool)

(assert (=> b!645545 (= e!369958 (arrayContainsKey!0 lt!299190 (select (arr!18443 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!91011 (not res!418358)) b!645544))

(assert (= (and b!645544 res!418359) b!645545))

(declare-fun m!618585 () Bool)

(assert (=> d!91011 m!618585))

(assert (=> b!645545 m!618367))

(declare-fun m!618587 () Bool)

(assert (=> b!645545 m!618587))

(assert (=> b!645348 d!91011))

(declare-fun d!91013 () Bool)

(declare-fun res!418360 () Bool)

(declare-fun e!369959 () Bool)

(assert (=> d!91013 (=> res!418360 e!369959)))

(assert (=> d!91013 (= res!418360 (= (select (arr!18443 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!91013 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!369959)))

(declare-fun b!645546 () Bool)

(declare-fun e!369960 () Bool)

(assert (=> b!645546 (= e!369959 e!369960)))

(declare-fun res!418361 () Bool)

(assert (=> b!645546 (=> (not res!418361) (not e!369960))))

(assert (=> b!645546 (= res!418361 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18808 a!2986)))))

(declare-fun b!645547 () Bool)

(assert (=> b!645547 (= e!369960 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!91013 (not res!418360)) b!645546))

(assert (= (and b!645546 res!418361) b!645547))

(assert (=> d!91013 m!618575))

(declare-fun m!618589 () Bool)

(assert (=> b!645547 m!618589))

(assert (=> b!645369 d!91013))

(declare-fun d!91015 () Bool)

(assert (=> d!91015 (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18808 lt!299190)) (not (= (select (arr!18443 lt!299190) j!136) (select (arr!18443 a!2986) j!136))))))

(declare-fun lt!299313 () Unit!21908)

(declare-fun choose!21 (array!38463 (_ BitVec 64) (_ BitVec 32) List!12523) Unit!21908)

(assert (=> d!91015 (= lt!299313 (choose!21 lt!299190 (select (arr!18443 a!2986) j!136) j!136 Nil!12520))))

(assert (=> d!91015 (bvslt (size!18808 lt!299190) #b01111111111111111111111111111111)))

(assert (=> d!91015 (= (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!299190 (select (arr!18443 a!2986) j!136) j!136 Nil!12520) lt!299313)))

(declare-fun bs!19263 () Bool)

(assert (= bs!19263 d!91015))

(assert (=> bs!19263 m!618569))

(assert (=> bs!19263 m!618367))

(declare-fun m!618591 () Bool)

(assert (=> bs!19263 m!618591))

(assert (=> b!645359 d!91015))

(declare-fun d!91017 () Bool)

(assert (=> d!91017 (arrayContainsKey!0 lt!299190 (select (arr!18443 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!299316 () Unit!21908)

(declare-fun choose!114 (array!38463 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21908)

(assert (=> d!91017 (= lt!299316 (choose!114 lt!299190 (select (arr!18443 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> d!91017 (bvsge index!984 #b00000000000000000000000000000000)))

(assert (=> d!91017 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!299190 (select (arr!18443 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)) lt!299316)))

(declare-fun bs!19264 () Bool)

(assert (= bs!19264 d!91017))

(assert (=> bs!19264 m!618367))

(assert (=> bs!19264 m!618375))

(assert (=> bs!19264 m!618367))

(declare-fun m!618593 () Bool)

(assert (=> bs!19264 m!618593))

(assert (=> b!645359 d!91017))

(declare-fun d!91019 () Bool)

(declare-fun res!418362 () Bool)

(declare-fun e!369961 () Bool)

(assert (=> d!91019 (=> res!418362 e!369961)))

(assert (=> d!91019 (= res!418362 (= (select (arr!18443 lt!299190) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!18443 a!2986) j!136)))))

(assert (=> d!91019 (= (arrayContainsKey!0 lt!299190 (select (arr!18443 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!369961)))

(declare-fun b!645548 () Bool)

(declare-fun e!369962 () Bool)

(assert (=> b!645548 (= e!369961 e!369962)))

(declare-fun res!418363 () Bool)

(assert (=> b!645548 (=> (not res!418363) (not e!369962))))

(assert (=> b!645548 (= res!418363 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18808 lt!299190)))))

(declare-fun b!645549 () Bool)

(assert (=> b!645549 (= e!369962 (arrayContainsKey!0 lt!299190 (select (arr!18443 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!91019 (not res!418362)) b!645548))

(assert (= (and b!645548 res!418363) b!645549))

(declare-fun m!618595 () Bool)

(assert (=> d!91019 m!618595))

(assert (=> b!645549 m!618367))

(declare-fun m!618597 () Bool)

(assert (=> b!645549 m!618597))

(assert (=> b!645359 d!91019))

(declare-fun d!91021 () Bool)

(assert (=> d!91021 (arrayNoDuplicates!0 lt!299190 j!136 Nil!12520)))

(declare-fun lt!299319 () Unit!21908)

(declare-fun choose!39 (array!38463 (_ BitVec 32) (_ BitVec 32)) Unit!21908)

(assert (=> d!91021 (= lt!299319 (choose!39 lt!299190 #b00000000000000000000000000000000 j!136))))

(assert (=> d!91021 (bvslt (size!18808 lt!299190) #b01111111111111111111111111111111)))

(assert (=> d!91021 (= (lemmaNoDuplicateFromThenFromBigger!0 lt!299190 #b00000000000000000000000000000000 j!136) lt!299319)))

(declare-fun bs!19265 () Bool)

(assert (= bs!19265 d!91021))

(assert (=> bs!19265 m!618373))

(declare-fun m!618599 () Bool)

(assert (=> bs!19265 m!618599))

(assert (=> b!645359 d!91021))

(declare-fun b!645579 () Bool)

(declare-fun e!369987 () Bool)

(declare-fun contains!3130 (List!12523 (_ BitVec 64)) Bool)

(assert (=> b!645579 (= e!369987 (contains!3130 Nil!12520 (select (arr!18443 lt!299190) j!136)))))

(declare-fun b!645580 () Bool)

(declare-fun e!369988 () Bool)

(declare-fun call!33613 () Bool)

(assert (=> b!645580 (= e!369988 call!33613)))

(declare-fun b!645581 () Bool)

(declare-fun e!369989 () Bool)

(declare-fun e!369990 () Bool)

(assert (=> b!645581 (= e!369989 e!369990)))

(declare-fun res!418385 () Bool)

(assert (=> b!645581 (=> (not res!418385) (not e!369990))))

(assert (=> b!645581 (= res!418385 (not e!369987))))

(declare-fun res!418383 () Bool)

(assert (=> b!645581 (=> (not res!418383) (not e!369987))))

(assert (=> b!645581 (= res!418383 (validKeyInArray!0 (select (arr!18443 lt!299190) j!136)))))

(declare-fun c!73965 () Bool)

(declare-fun bm!33610 () Bool)

(assert (=> bm!33610 (= call!33613 (arrayNoDuplicates!0 lt!299190 (bvadd j!136 #b00000000000000000000000000000001) (ite c!73965 (Cons!12519 (select (arr!18443 lt!299190) j!136) Nil!12520) Nil!12520)))))

(declare-fun b!645583 () Bool)

(assert (=> b!645583 (= e!369988 call!33613)))

(declare-fun b!645582 () Bool)

(assert (=> b!645582 (= e!369990 e!369988)))

(assert (=> b!645582 (= c!73965 (validKeyInArray!0 (select (arr!18443 lt!299190) j!136)))))

(declare-fun d!91025 () Bool)

(declare-fun res!418384 () Bool)

(assert (=> d!91025 (=> res!418384 e!369989)))

(assert (=> d!91025 (= res!418384 (bvsge j!136 (size!18808 lt!299190)))))

(assert (=> d!91025 (= (arrayNoDuplicates!0 lt!299190 j!136 Nil!12520) e!369989)))

(assert (= (and d!91025 (not res!418384)) b!645581))

(assert (= (and b!645581 res!418383) b!645579))

(assert (= (and b!645581 res!418385) b!645582))

(assert (= (and b!645582 c!73965) b!645583))

(assert (= (and b!645582 (not c!73965)) b!645580))

(assert (= (or b!645583 b!645580) bm!33610))

(assert (=> b!645579 m!618569))

(assert (=> b!645579 m!618569))

(declare-fun m!618609 () Bool)

(assert (=> b!645579 m!618609))

(assert (=> b!645581 m!618569))

(assert (=> b!645581 m!618569))

(declare-fun m!618611 () Bool)

(assert (=> b!645581 m!618611))

(assert (=> bm!33610 m!618569))

(declare-fun m!618613 () Bool)

(assert (=> bm!33610 m!618613))

(assert (=> b!645582 m!618569))

(assert (=> b!645582 m!618569))

(assert (=> b!645582 m!618611))

(assert (=> b!645359 d!91025))

(declare-fun b!645584 () Bool)

(declare-fun e!369991 () Bool)

(assert (=> b!645584 (= e!369991 (contains!3130 Nil!12520 (select (arr!18443 lt!299190) #b00000000000000000000000000000000)))))

(declare-fun b!645585 () Bool)

(declare-fun e!369992 () Bool)

(declare-fun call!33614 () Bool)

(assert (=> b!645585 (= e!369992 call!33614)))

(declare-fun b!645586 () Bool)

(declare-fun e!369993 () Bool)

(declare-fun e!369994 () Bool)

(assert (=> b!645586 (= e!369993 e!369994)))

(declare-fun res!418388 () Bool)

(assert (=> b!645586 (=> (not res!418388) (not e!369994))))

(assert (=> b!645586 (= res!418388 (not e!369991))))

(declare-fun res!418386 () Bool)

(assert (=> b!645586 (=> (not res!418386) (not e!369991))))

(assert (=> b!645586 (= res!418386 (validKeyInArray!0 (select (arr!18443 lt!299190) #b00000000000000000000000000000000)))))

(declare-fun bm!33611 () Bool)

(declare-fun c!73966 () Bool)

(assert (=> bm!33611 (= call!33614 (arrayNoDuplicates!0 lt!299190 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!73966 (Cons!12519 (select (arr!18443 lt!299190) #b00000000000000000000000000000000) Nil!12520) Nil!12520)))))

(declare-fun b!645588 () Bool)

(assert (=> b!645588 (= e!369992 call!33614)))

(declare-fun b!645587 () Bool)

(assert (=> b!645587 (= e!369994 e!369992)))

(assert (=> b!645587 (= c!73966 (validKeyInArray!0 (select (arr!18443 lt!299190) #b00000000000000000000000000000000)))))

(declare-fun d!91031 () Bool)

(declare-fun res!418387 () Bool)

(assert (=> d!91031 (=> res!418387 e!369993)))

(assert (=> d!91031 (= res!418387 (bvsge #b00000000000000000000000000000000 (size!18808 lt!299190)))))

(assert (=> d!91031 (= (arrayNoDuplicates!0 lt!299190 #b00000000000000000000000000000000 Nil!12520) e!369993)))

(assert (= (and d!91031 (not res!418387)) b!645586))

(assert (= (and b!645586 res!418386) b!645584))

(assert (= (and b!645586 res!418388) b!645587))

(assert (= (and b!645587 c!73966) b!645588))

(assert (= (and b!645587 (not c!73966)) b!645585))

(assert (= (or b!645588 b!645585) bm!33611))

(declare-fun m!618615 () Bool)

(assert (=> b!645584 m!618615))

(assert (=> b!645584 m!618615))

(declare-fun m!618617 () Bool)

(assert (=> b!645584 m!618617))

(assert (=> b!645586 m!618615))

(assert (=> b!645586 m!618615))

(declare-fun m!618619 () Bool)

(assert (=> b!645586 m!618619))

(assert (=> bm!33611 m!618615))

(declare-fun m!618621 () Bool)

(assert (=> bm!33611 m!618621))

(assert (=> b!645587 m!618615))

(assert (=> b!645587 m!618615))

(assert (=> b!645587 m!618619))

(assert (=> b!645359 d!91031))

(declare-fun d!91033 () Bool)

(declare-fun e!370003 () Bool)

(assert (=> d!91033 e!370003))

(declare-fun res!418396 () Bool)

(assert (=> d!91033 (=> (not res!418396) (not e!370003))))

(assert (=> d!91033 (= res!418396 (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18808 a!2986))))))

(declare-fun lt!299330 () Unit!21908)

(declare-fun choose!41 (array!38463 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12523) Unit!21908)

(assert (=> d!91033 (= lt!299330 (choose!41 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12520))))

(assert (=> d!91033 (bvslt (size!18808 a!2986) #b01111111111111111111111111111111)))

(assert (=> d!91033 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12520) lt!299330)))

(declare-fun b!645598 () Bool)

(assert (=> b!645598 (= e!370003 (arrayNoDuplicates!0 (array!38464 (store (arr!18443 a!2986) i!1108 k0!1786) (size!18808 a!2986)) #b00000000000000000000000000000000 Nil!12520))))

(assert (= (and d!91033 res!418396) b!645598))

(declare-fun m!618639 () Bool)

(assert (=> d!91033 m!618639))

(assert (=> b!645598 m!618403))

(declare-fun m!618641 () Bool)

(assert (=> b!645598 m!618641))

(assert (=> b!645359 d!91033))

(declare-fun b!645599 () Bool)

(declare-fun e!370004 () Bool)

(assert (=> b!645599 (= e!370004 (contains!3130 Nil!12520 (select (arr!18443 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!645600 () Bool)

(declare-fun e!370005 () Bool)

(declare-fun call!33616 () Bool)

(assert (=> b!645600 (= e!370005 call!33616)))

(declare-fun b!645601 () Bool)

(declare-fun e!370006 () Bool)

(declare-fun e!370007 () Bool)

(assert (=> b!645601 (= e!370006 e!370007)))

(declare-fun res!418399 () Bool)

(assert (=> b!645601 (=> (not res!418399) (not e!370007))))

(assert (=> b!645601 (= res!418399 (not e!370004))))

(declare-fun res!418397 () Bool)

(assert (=> b!645601 (=> (not res!418397) (not e!370004))))

(assert (=> b!645601 (= res!418397 (validKeyInArray!0 (select (arr!18443 a!2986) #b00000000000000000000000000000000)))))

(declare-fun bm!33613 () Bool)

(declare-fun c!73968 () Bool)

(assert (=> bm!33613 (= call!33616 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!73968 (Cons!12519 (select (arr!18443 a!2986) #b00000000000000000000000000000000) Nil!12520) Nil!12520)))))

(declare-fun b!645603 () Bool)

(assert (=> b!645603 (= e!370005 call!33616)))

(declare-fun b!645602 () Bool)

(assert (=> b!645602 (= e!370007 e!370005)))

(assert (=> b!645602 (= c!73968 (validKeyInArray!0 (select (arr!18443 a!2986) #b00000000000000000000000000000000)))))

(declare-fun d!91043 () Bool)

(declare-fun res!418398 () Bool)

(assert (=> d!91043 (=> res!418398 e!370006)))

(assert (=> d!91043 (= res!418398 (bvsge #b00000000000000000000000000000000 (size!18808 a!2986)))))

(assert (=> d!91043 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12520) e!370006)))

(assert (= (and d!91043 (not res!418398)) b!645601))

(assert (= (and b!645601 res!418397) b!645599))

(assert (= (and b!645601 res!418399) b!645602))

(assert (= (and b!645602 c!73968) b!645603))

(assert (= (and b!645602 (not c!73968)) b!645600))

(assert (= (or b!645603 b!645600) bm!33613))

(assert (=> b!645599 m!618575))

(assert (=> b!645599 m!618575))

(declare-fun m!618643 () Bool)

(assert (=> b!645599 m!618643))

(assert (=> b!645601 m!618575))

(assert (=> b!645601 m!618575))

(assert (=> b!645601 m!618583))

(assert (=> bm!33613 m!618575))

(declare-fun m!618649 () Bool)

(assert (=> bm!33613 m!618649))

(assert (=> b!645602 m!618575))

(assert (=> b!645602 m!618575))

(assert (=> b!645602 m!618583))

(assert (=> b!645349 d!91043))

(declare-fun d!91047 () Bool)

(declare-fun res!418400 () Bool)

(declare-fun e!370008 () Bool)

(assert (=> d!91047 (=> res!418400 e!370008)))

(assert (=> d!91047 (= res!418400 (= (select (arr!18443 lt!299190) (bvadd #b00000000000000000000000000000001 index!984)) (select (arr!18443 a!2986) j!136)))))

(assert (=> d!91047 (= (arrayContainsKey!0 lt!299190 (select (arr!18443 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984)) e!370008)))

(declare-fun b!645604 () Bool)

(declare-fun e!370009 () Bool)

(assert (=> b!645604 (= e!370008 e!370009)))

(declare-fun res!418401 () Bool)

(assert (=> b!645604 (=> (not res!418401) (not e!370009))))

(assert (=> b!645604 (= res!418401 (bvslt (bvadd #b00000000000000000000000000000001 index!984 #b00000000000000000000000000000001) (size!18808 lt!299190)))))

(declare-fun b!645605 () Bool)

(assert (=> b!645605 (= e!370009 (arrayContainsKey!0 lt!299190 (select (arr!18443 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!91047 (not res!418400)) b!645604))

(assert (= (and b!645604 res!418401) b!645605))

(declare-fun m!618651 () Bool)

(assert (=> d!91047 m!618651))

(assert (=> b!645605 m!618367))

(declare-fun m!618653 () Bool)

(assert (=> b!645605 m!618653))

(assert (=> b!645350 d!91047))

(declare-fun d!91049 () Bool)

(assert (=> d!91049 (arrayContainsKey!0 lt!299190 (select (arr!18443 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!299334 () Unit!21908)

(assert (=> d!91049 (= lt!299334 (choose!114 lt!299190 (select (arr!18443 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> d!91049 (bvsge j!136 #b00000000000000000000000000000000)))

(assert (=> d!91049 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!299190 (select (arr!18443 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)) lt!299334)))

(declare-fun bs!19269 () Bool)

(assert (= bs!19269 d!91049))

(assert (=> bs!19269 m!618367))

(assert (=> bs!19269 m!618417))

(assert (=> bs!19269 m!618367))

(declare-fun m!618655 () Bool)

(assert (=> bs!19269 m!618655))

(assert (=> b!645350 d!91049))

(assert (=> b!645350 d!91007))

(declare-fun d!91051 () Bool)

(assert (=> d!91051 (= (validKeyInArray!0 (select (arr!18443 a!2986) j!136)) (and (not (= (select (arr!18443 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18443 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!645362 d!91051))

(declare-fun b!645650 () Bool)

(declare-fun e!370043 () SeekEntryResult!6880)

(assert (=> b!645650 (= e!370043 (MissingVacant!6880 vacantSpotIndex!68))))

(declare-fun b!645651 () Bool)

(declare-fun e!370044 () SeekEntryResult!6880)

(assert (=> b!645651 (= e!370044 Undefined!6880)))

(declare-fun b!645652 () Bool)

(declare-fun c!73981 () Bool)

(declare-fun lt!299355 () (_ BitVec 64))

(assert (=> b!645652 (= c!73981 (= lt!299355 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!370045 () SeekEntryResult!6880)

(assert (=> b!645652 (= e!370045 e!370043)))

(declare-fun b!645653 () Bool)

(assert (=> b!645653 (= e!370043 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 lt!299188 lt!299190 mask!3053))))

(declare-fun d!91055 () Bool)

(declare-fun lt!299356 () SeekEntryResult!6880)

(assert (=> d!91055 (and (or ((_ is Undefined!6880) lt!299356) (not ((_ is Found!6880) lt!299356)) (and (bvsge (index!29856 lt!299356) #b00000000000000000000000000000000) (bvslt (index!29856 lt!299356) (size!18808 lt!299190)))) (or ((_ is Undefined!6880) lt!299356) ((_ is Found!6880) lt!299356) (not ((_ is MissingVacant!6880) lt!299356)) (not (= (index!29858 lt!299356) vacantSpotIndex!68)) (and (bvsge (index!29858 lt!299356) #b00000000000000000000000000000000) (bvslt (index!29858 lt!299356) (size!18808 lt!299190)))) (or ((_ is Undefined!6880) lt!299356) (ite ((_ is Found!6880) lt!299356) (= (select (arr!18443 lt!299190) (index!29856 lt!299356)) lt!299188) (and ((_ is MissingVacant!6880) lt!299356) (= (index!29858 lt!299356) vacantSpotIndex!68) (= (select (arr!18443 lt!299190) (index!29858 lt!299356)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!91055 (= lt!299356 e!370044)))

(declare-fun c!73980 () Bool)

(assert (=> d!91055 (= c!73980 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!91055 (= lt!299355 (select (arr!18443 lt!299190) index!984))))

(assert (=> d!91055 (validMask!0 mask!3053)))

(assert (=> d!91055 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!299188 lt!299190 mask!3053) lt!299356)))

(declare-fun b!645654 () Bool)

(assert (=> b!645654 (= e!370045 (Found!6880 index!984))))

(declare-fun b!645655 () Bool)

(assert (=> b!645655 (= e!370044 e!370045)))

(declare-fun c!73982 () Bool)

(assert (=> b!645655 (= c!73982 (= lt!299355 lt!299188))))

(assert (= (and d!91055 c!73980) b!645651))

(assert (= (and d!91055 (not c!73980)) b!645655))

(assert (= (and b!645655 c!73982) b!645654))

(assert (= (and b!645655 (not c!73982)) b!645652))

(assert (= (and b!645652 c!73981) b!645650))

(assert (= (and b!645652 (not c!73981)) b!645653))

(assert (=> b!645653 m!618397))

(assert (=> b!645653 m!618397))

(declare-fun m!618679 () Bool)

(assert (=> b!645653 m!618679))

(declare-fun m!618681 () Bool)

(assert (=> d!91055 m!618681))

(declare-fun m!618683 () Bool)

(assert (=> d!91055 m!618683))

(assert (=> d!91055 m!618585))

(assert (=> d!91055 m!618421))

(assert (=> b!645363 d!91055))

(declare-fun b!645660 () Bool)

(declare-fun e!370049 () SeekEntryResult!6880)

(assert (=> b!645660 (= e!370049 (MissingVacant!6880 vacantSpotIndex!68))))

(declare-fun b!645661 () Bool)

(declare-fun e!370050 () SeekEntryResult!6880)

(assert (=> b!645661 (= e!370050 Undefined!6880)))

(declare-fun b!645662 () Bool)

(declare-fun c!73985 () Bool)

(declare-fun lt!299360 () (_ BitVec 64))

(assert (=> b!645662 (= c!73985 (= lt!299360 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!370051 () SeekEntryResult!6880)

(assert (=> b!645662 (= e!370051 e!370049)))

(declare-fun b!645663 () Bool)

(assert (=> b!645663 (= e!370049 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!299189 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 lt!299188 lt!299190 mask!3053))))

(declare-fun lt!299361 () SeekEntryResult!6880)

(declare-fun d!91067 () Bool)

(assert (=> d!91067 (and (or ((_ is Undefined!6880) lt!299361) (not ((_ is Found!6880) lt!299361)) (and (bvsge (index!29856 lt!299361) #b00000000000000000000000000000000) (bvslt (index!29856 lt!299361) (size!18808 lt!299190)))) (or ((_ is Undefined!6880) lt!299361) ((_ is Found!6880) lt!299361) (not ((_ is MissingVacant!6880) lt!299361)) (not (= (index!29858 lt!299361) vacantSpotIndex!68)) (and (bvsge (index!29858 lt!299361) #b00000000000000000000000000000000) (bvslt (index!29858 lt!299361) (size!18808 lt!299190)))) (or ((_ is Undefined!6880) lt!299361) (ite ((_ is Found!6880) lt!299361) (= (select (arr!18443 lt!299190) (index!29856 lt!299361)) lt!299188) (and ((_ is MissingVacant!6880) lt!299361) (= (index!29858 lt!299361) vacantSpotIndex!68) (= (select (arr!18443 lt!299190) (index!29858 lt!299361)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!91067 (= lt!299361 e!370050)))

(declare-fun c!73984 () Bool)

(assert (=> d!91067 (= c!73984 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!91067 (= lt!299360 (select (arr!18443 lt!299190) lt!299189))))

(assert (=> d!91067 (validMask!0 mask!3053)))

(assert (=> d!91067 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!299189 vacantSpotIndex!68 lt!299188 lt!299190 mask!3053) lt!299361)))

(declare-fun b!645664 () Bool)

(assert (=> b!645664 (= e!370051 (Found!6880 lt!299189))))

(declare-fun b!645665 () Bool)

(assert (=> b!645665 (= e!370050 e!370051)))

(declare-fun c!73986 () Bool)

(assert (=> b!645665 (= c!73986 (= lt!299360 lt!299188))))

(assert (= (and d!91067 c!73984) b!645661))

(assert (= (and d!91067 (not c!73984)) b!645665))

(assert (= (and b!645665 c!73986) b!645664))

(assert (= (and b!645665 (not c!73986)) b!645662))

(assert (= (and b!645662 c!73985) b!645660))

(assert (= (and b!645662 (not c!73985)) b!645663))

(declare-fun m!618697 () Bool)

(assert (=> b!645663 m!618697))

(assert (=> b!645663 m!618697))

(declare-fun m!618699 () Bool)

(assert (=> b!645663 m!618699))

(declare-fun m!618701 () Bool)

(assert (=> d!91067 m!618701))

(declare-fun m!618703 () Bool)

(assert (=> d!91067 m!618703))

(declare-fun m!618705 () Bool)

(assert (=> d!91067 m!618705))

(assert (=> d!91067 m!618421))

(assert (=> b!645363 d!91067))

(declare-fun d!91071 () Bool)

(declare-fun lt!299367 () (_ BitVec 32))

(assert (=> d!91071 (and (bvsge lt!299367 #b00000000000000000000000000000000) (bvslt lt!299367 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!91071 (= lt!299367 (choose!52 index!984 x!910 mask!3053))))

(assert (=> d!91071 (validMask!0 mask!3053)))

(assert (=> d!91071 (= (nextIndex!0 index!984 x!910 mask!3053) lt!299367)))

(declare-fun bs!19273 () Bool)

(assert (= bs!19273 d!91071))

(declare-fun m!618717 () Bool)

(assert (=> bs!19273 m!618717))

(assert (=> bs!19273 m!618421))

(assert (=> b!645363 d!91071))

(declare-fun d!91081 () Bool)

(declare-fun e!370068 () Bool)

(assert (=> d!91081 e!370068))

(declare-fun res!418441 () Bool)

(assert (=> d!91081 (=> (not res!418441) (not e!370068))))

(assert (=> d!91081 (= res!418441 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18808 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18808 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18808 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18808 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18808 a!2986))))))

(declare-fun lt!299373 () Unit!21908)

(declare-fun choose!9 (array!38463 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21908)

(assert (=> d!91081 (= lt!299373 (choose!9 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!299189 vacantSpotIndex!68 mask!3053))))

(assert (=> d!91081 (validMask!0 mask!3053)))

(assert (=> d!91081 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!299189 vacantSpotIndex!68 mask!3053) lt!299373)))

(declare-fun b!645683 () Bool)

(assert (=> b!645683 (= e!370068 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!299189 vacantSpotIndex!68 (select (arr!18443 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!299189 vacantSpotIndex!68 (select (store (arr!18443 a!2986) i!1108 k0!1786) j!136) (array!38464 (store (arr!18443 a!2986) i!1108 k0!1786) (size!18808 a!2986)) mask!3053)))))

(assert (= (and d!91081 res!418441) b!645683))

(declare-fun m!618729 () Bool)

(assert (=> d!91081 m!618729))

(assert (=> d!91081 m!618421))

(assert (=> b!645683 m!618367))

(assert (=> b!645683 m!618403))

(assert (=> b!645683 m!618399))

(declare-fun m!618731 () Bool)

(assert (=> b!645683 m!618731))

(assert (=> b!645683 m!618367))

(assert (=> b!645683 m!618401))

(assert (=> b!645683 m!618399))

(assert (=> b!645363 d!91081))

(declare-fun b!645684 () Bool)

(declare-fun e!370069 () SeekEntryResult!6880)

(assert (=> b!645684 (= e!370069 (MissingVacant!6880 vacantSpotIndex!68))))

(declare-fun b!645685 () Bool)

(declare-fun e!370070 () SeekEntryResult!6880)

(assert (=> b!645685 (= e!370070 Undefined!6880)))

(declare-fun b!645686 () Bool)

(declare-fun c!73989 () Bool)

(declare-fun lt!299374 () (_ BitVec 64))

(assert (=> b!645686 (= c!73989 (= lt!299374 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!370071 () SeekEntryResult!6880)

(assert (=> b!645686 (= e!370071 e!370069)))

(declare-fun b!645687 () Bool)

(assert (=> b!645687 (= e!370069 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!299189 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 (select (arr!18443 a!2986) j!136) a!2986 mask!3053))))

(declare-fun d!91091 () Bool)

(declare-fun lt!299375 () SeekEntryResult!6880)

(assert (=> d!91091 (and (or ((_ is Undefined!6880) lt!299375) (not ((_ is Found!6880) lt!299375)) (and (bvsge (index!29856 lt!299375) #b00000000000000000000000000000000) (bvslt (index!29856 lt!299375) (size!18808 a!2986)))) (or ((_ is Undefined!6880) lt!299375) ((_ is Found!6880) lt!299375) (not ((_ is MissingVacant!6880) lt!299375)) (not (= (index!29858 lt!299375) vacantSpotIndex!68)) (and (bvsge (index!29858 lt!299375) #b00000000000000000000000000000000) (bvslt (index!29858 lt!299375) (size!18808 a!2986)))) (or ((_ is Undefined!6880) lt!299375) (ite ((_ is Found!6880) lt!299375) (= (select (arr!18443 a!2986) (index!29856 lt!299375)) (select (arr!18443 a!2986) j!136)) (and ((_ is MissingVacant!6880) lt!299375) (= (index!29858 lt!299375) vacantSpotIndex!68) (= (select (arr!18443 a!2986) (index!29858 lt!299375)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!91091 (= lt!299375 e!370070)))

(declare-fun c!73988 () Bool)

(assert (=> d!91091 (= c!73988 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!91091 (= lt!299374 (select (arr!18443 a!2986) lt!299189))))

(assert (=> d!91091 (validMask!0 mask!3053)))

(assert (=> d!91091 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!299189 vacantSpotIndex!68 (select (arr!18443 a!2986) j!136) a!2986 mask!3053) lt!299375)))

(declare-fun b!645688 () Bool)

(assert (=> b!645688 (= e!370071 (Found!6880 lt!299189))))

(declare-fun b!645689 () Bool)

(assert (=> b!645689 (= e!370070 e!370071)))

(declare-fun c!73990 () Bool)

(assert (=> b!645689 (= c!73990 (= lt!299374 (select (arr!18443 a!2986) j!136)))))

(assert (= (and d!91091 c!73988) b!645685))

(assert (= (and d!91091 (not c!73988)) b!645689))

(assert (= (and b!645689 c!73990) b!645688))

(assert (= (and b!645689 (not c!73990)) b!645686))

(assert (= (and b!645686 c!73989) b!645684))

(assert (= (and b!645686 (not c!73989)) b!645687))

(assert (=> b!645687 m!618697))

(assert (=> b!645687 m!618697))

(assert (=> b!645687 m!618367))

(declare-fun m!618733 () Bool)

(assert (=> b!645687 m!618733))

(declare-fun m!618735 () Bool)

(assert (=> d!91091 m!618735))

(declare-fun m!618737 () Bool)

(assert (=> d!91091 m!618737))

(declare-fun m!618739 () Bool)

(assert (=> d!91091 m!618739))

(assert (=> d!91091 m!618421))

(assert (=> b!645363 d!91091))

(assert (=> b!645353 d!91011))

(declare-fun b!645692 () Bool)

(declare-fun e!370073 () SeekEntryResult!6880)

(assert (=> b!645692 (= e!370073 (MissingVacant!6880 vacantSpotIndex!68))))

(declare-fun b!645693 () Bool)

(declare-fun e!370075 () SeekEntryResult!6880)

(assert (=> b!645693 (= e!370075 Undefined!6880)))

(declare-fun b!645694 () Bool)

(declare-fun c!73992 () Bool)

(declare-fun lt!299379 () (_ BitVec 64))

(assert (=> b!645694 (= c!73992 (= lt!299379 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!370076 () SeekEntryResult!6880)

(assert (=> b!645694 (= e!370076 e!370073)))

(declare-fun b!645695 () Bool)

(assert (=> b!645695 (= e!370073 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!18443 a!2986) j!136) a!2986 mask!3053))))

(declare-fun lt!299380 () SeekEntryResult!6880)

(declare-fun d!91095 () Bool)

(assert (=> d!91095 (and (or ((_ is Undefined!6880) lt!299380) (not ((_ is Found!6880) lt!299380)) (and (bvsge (index!29856 lt!299380) #b00000000000000000000000000000000) (bvslt (index!29856 lt!299380) (size!18808 a!2986)))) (or ((_ is Undefined!6880) lt!299380) ((_ is Found!6880) lt!299380) (not ((_ is MissingVacant!6880) lt!299380)) (not (= (index!29858 lt!299380) vacantSpotIndex!68)) (and (bvsge (index!29858 lt!299380) #b00000000000000000000000000000000) (bvslt (index!29858 lt!299380) (size!18808 a!2986)))) (or ((_ is Undefined!6880) lt!299380) (ite ((_ is Found!6880) lt!299380) (= (select (arr!18443 a!2986) (index!29856 lt!299380)) (select (arr!18443 a!2986) j!136)) (and ((_ is MissingVacant!6880) lt!299380) (= (index!29858 lt!299380) vacantSpotIndex!68) (= (select (arr!18443 a!2986) (index!29858 lt!299380)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!91095 (= lt!299380 e!370075)))

(declare-fun c!73991 () Bool)

(assert (=> d!91095 (= c!73991 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!91095 (= lt!299379 (select (arr!18443 a!2986) index!984))))

(assert (=> d!91095 (validMask!0 mask!3053)))

(assert (=> d!91095 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18443 a!2986) j!136) a!2986 mask!3053) lt!299380)))

(declare-fun b!645696 () Bool)

(assert (=> b!645696 (= e!370076 (Found!6880 index!984))))

(declare-fun b!645697 () Bool)

(assert (=> b!645697 (= e!370075 e!370076)))

(declare-fun c!73993 () Bool)

(assert (=> b!645697 (= c!73993 (= lt!299379 (select (arr!18443 a!2986) j!136)))))

(assert (= (and d!91095 c!73991) b!645693))

(assert (= (and d!91095 (not c!73991)) b!645697))

(assert (= (and b!645697 c!73993) b!645696))

(assert (= (and b!645697 (not c!73993)) b!645694))

(assert (= (and b!645694 c!73992) b!645692))

(assert (= (and b!645694 (not c!73992)) b!645695))

(assert (=> b!645695 m!618397))

(assert (=> b!645695 m!618397))

(assert (=> b!645695 m!618367))

(declare-fun m!618747 () Bool)

(assert (=> b!645695 m!618747))

(declare-fun m!618749 () Bool)

(assert (=> d!91095 m!618749))

(declare-fun m!618751 () Bool)

(assert (=> d!91095 m!618751))

(assert (=> d!91095 m!618389))

(assert (=> d!91095 m!618421))

(assert (=> b!645366 d!91095))

(declare-fun d!91103 () Bool)

(assert (=> d!91103 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!645355 d!91103))

(check-sat (not d!91055) (not b!645602) (not d!91091) (not bm!33610) (not b!645587) (not b!645586) (not d!91021) (not b!645547) (not b!645549) (not b!645584) (not d!91049) (not d!91017) (not d!91015) (not d!91033) (not d!91001) (not b!645579) (not d!91071) (not b!645663) (not b!645683) (not b!645653) (not bm!33604) (not d!91067) (not b!645582) (not b!645599) (not b!645605) (not b!645695) (not b!645531) (not d!91095) (not bm!33613) (not b!645581) (not b!645687) (not b!645541) (not b!645523) (not d!91081) (not bm!33611) (not b!645545) (not b!645542) (not b!645601) (not b!645598))
(check-sat)
