; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56672 () Bool)

(assert start!56672)

(declare-fun b!628240 () Bool)

(declare-fun e!359473 () Bool)

(declare-fun lt!290424 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(assert (=> b!628240 (= e!359473 (or (bvslt lt!290424 #b00000000000000000000000000000000) (bvsge lt!290424 (bvadd mask!3053 #b00000000000000000000000000000001))))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!628240 (= lt!290424 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!628241 () Bool)

(declare-fun res!405947 () Bool)

(assert (=> b!628241 (=> (not res!405947) (not e!359473))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!37964 0))(
  ( (array!37965 (arr!18222 (Array (_ BitVec 32) (_ BitVec 64))) (size!18586 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37964)

(assert (=> b!628241 (= res!405947 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18222 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18222 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!628242 () Bool)

(declare-fun res!405946 () Bool)

(declare-fun e!359474 () Bool)

(assert (=> b!628242 (=> (not res!405946) (not e!359474))))

(declare-fun arrayContainsKey!0 (array!37964 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!628242 (= res!405946 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun res!405942 () Bool)

(assert (=> start!56672 (=> (not res!405942) (not e!359474))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56672 (= res!405942 (validMask!0 mask!3053))))

(assert (=> start!56672 e!359474))

(assert (=> start!56672 true))

(declare-fun array_inv!14018 (array!37964) Bool)

(assert (=> start!56672 (array_inv!14018 a!2986)))

(declare-fun b!628243 () Bool)

(declare-fun res!405944 () Bool)

(assert (=> b!628243 (=> (not res!405944) (not e!359474))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!628243 (= res!405944 (validKeyInArray!0 k!1786))))

(declare-fun b!628244 () Bool)

(declare-fun res!405950 () Bool)

(assert (=> b!628244 (=> (not res!405950) (not e!359473))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!628244 (= res!405950 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18222 a!2986) index!984) (select (arr!18222 a!2986) j!136))) (not (= (select (arr!18222 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!628245 () Bool)

(declare-fun res!405940 () Bool)

(assert (=> b!628245 (=> (not res!405940) (not e!359473))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37964 (_ BitVec 32)) Bool)

(assert (=> b!628245 (= res!405940 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!628246 () Bool)

(declare-fun res!405941 () Bool)

(assert (=> b!628246 (=> (not res!405941) (not e!359473))))

(declare-datatypes ((List!12263 0))(
  ( (Nil!12260) (Cons!12259 (h!13304 (_ BitVec 64)) (t!18491 List!12263)) )
))
(declare-fun arrayNoDuplicates!0 (array!37964 (_ BitVec 32) List!12263) Bool)

(assert (=> b!628246 (= res!405941 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12260))))

(declare-fun b!628247 () Bool)

(declare-fun res!405948 () Bool)

(assert (=> b!628247 (=> (not res!405948) (not e!359473))))

(declare-datatypes ((SeekEntryResult!6662 0))(
  ( (MissingZero!6662 (index!28932 (_ BitVec 32))) (Found!6662 (index!28933 (_ BitVec 32))) (Intermediate!6662 (undefined!7474 Bool) (index!28934 (_ BitVec 32)) (x!57666 (_ BitVec 32))) (Undefined!6662) (MissingVacant!6662 (index!28935 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37964 (_ BitVec 32)) SeekEntryResult!6662)

(assert (=> b!628247 (= res!405948 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18222 a!2986) j!136) a!2986 mask!3053) (Found!6662 j!136)))))

(declare-fun b!628248 () Bool)

(declare-fun res!405945 () Bool)

(assert (=> b!628248 (=> (not res!405945) (not e!359474))))

(assert (=> b!628248 (= res!405945 (validKeyInArray!0 (select (arr!18222 a!2986) j!136)))))

(declare-fun b!628249 () Bool)

(declare-fun res!405943 () Bool)

(assert (=> b!628249 (=> (not res!405943) (not e!359474))))

(assert (=> b!628249 (= res!405943 (and (= (size!18586 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18586 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18586 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!628250 () Bool)

(assert (=> b!628250 (= e!359474 e!359473)))

(declare-fun res!405949 () Bool)

(assert (=> b!628250 (=> (not res!405949) (not e!359473))))

(declare-fun lt!290425 () SeekEntryResult!6662)

(assert (=> b!628250 (= res!405949 (or (= lt!290425 (MissingZero!6662 i!1108)) (= lt!290425 (MissingVacant!6662 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37964 (_ BitVec 32)) SeekEntryResult!6662)

(assert (=> b!628250 (= lt!290425 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(assert (= (and start!56672 res!405942) b!628249))

(assert (= (and b!628249 res!405943) b!628248))

(assert (= (and b!628248 res!405945) b!628243))

(assert (= (and b!628243 res!405944) b!628242))

(assert (= (and b!628242 res!405946) b!628250))

(assert (= (and b!628250 res!405949) b!628245))

(assert (= (and b!628245 res!405940) b!628246))

(assert (= (and b!628246 res!405941) b!628241))

(assert (= (and b!628241 res!405947) b!628247))

(assert (= (and b!628247 res!405948) b!628244))

(assert (= (and b!628244 res!405950) b!628240))

(declare-fun m!603477 () Bool)

(assert (=> b!628244 m!603477))

(declare-fun m!603479 () Bool)

(assert (=> b!628244 m!603479))

(declare-fun m!603481 () Bool)

(assert (=> b!628250 m!603481))

(assert (=> b!628248 m!603479))

(assert (=> b!628248 m!603479))

(declare-fun m!603483 () Bool)

(assert (=> b!628248 m!603483))

(declare-fun m!603485 () Bool)

(assert (=> b!628241 m!603485))

(declare-fun m!603487 () Bool)

(assert (=> b!628241 m!603487))

(declare-fun m!603489 () Bool)

(assert (=> b!628241 m!603489))

(declare-fun m!603491 () Bool)

(assert (=> start!56672 m!603491))

(declare-fun m!603493 () Bool)

(assert (=> start!56672 m!603493))

(declare-fun m!603495 () Bool)

(assert (=> b!628242 m!603495))

(declare-fun m!603497 () Bool)

(assert (=> b!628246 m!603497))

(assert (=> b!628247 m!603479))

(assert (=> b!628247 m!603479))

(declare-fun m!603499 () Bool)

(assert (=> b!628247 m!603499))

(declare-fun m!603501 () Bool)

(assert (=> b!628245 m!603501))

(declare-fun m!603503 () Bool)

(assert (=> b!628243 m!603503))

(declare-fun m!603505 () Bool)

(assert (=> b!628240 m!603505))

(push 1)

(assert (not start!56672))

(assert (not b!628246))

(assert (not b!628248))

(assert (not b!628250))

(assert (not b!628247))

(assert (not b!628245))

(assert (not b!628240))

(assert (not b!628242))

(assert (not b!628243))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!88993 () Bool)

(declare-fun res!406027 () Bool)

(declare-fun e!359504 () Bool)

(assert (=> d!88993 (=> res!406027 e!359504)))

(assert (=> d!88993 (= res!406027 (= (select (arr!18222 a!2986) #b00000000000000000000000000000000) k!1786))))

(assert (=> d!88993 (= (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000) e!359504)))

(declare-fun b!628327 () Bool)

(declare-fun e!359505 () Bool)

(assert (=> b!628327 (= e!359504 e!359505)))

(declare-fun res!406028 () Bool)

(assert (=> b!628327 (=> (not res!406028) (not e!359505))))

(assert (=> b!628327 (= res!406028 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18586 a!2986)))))

(declare-fun b!628328 () Bool)

(assert (=> b!628328 (= e!359505 (arrayContainsKey!0 a!2986 k!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!88993 (not res!406027)) b!628327))

(assert (= (and b!628327 res!406028) b!628328))

(declare-fun m!603571 () Bool)

(assert (=> d!88993 m!603571))

(declare-fun m!603573 () Bool)

(assert (=> b!628328 m!603573))

(assert (=> b!628242 d!88993))

(declare-fun d!88995 () Bool)

(assert (=> d!88995 (= (validKeyInArray!0 (select (arr!18222 a!2986) j!136)) (and (not (= (select (arr!18222 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18222 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!628248 d!88995))

(declare-fun d!88997 () Bool)

(assert (=> d!88997 (= (validKeyInArray!0 k!1786) (and (not (= k!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!628243 d!88997))

(declare-fun b!628347 () Bool)

(declare-fun e!359521 () Bool)

(declare-fun e!359522 () Bool)

(assert (=> b!628347 (= e!359521 e!359522)))

(declare-fun c!71521 () Bool)

(assert (=> b!628347 (= c!71521 (validKeyInArray!0 (select (arr!18222 a!2986) #b00000000000000000000000000000000)))))

(declare-fun d!88999 () Bool)

(declare-fun res!406040 () Bool)

(declare-fun e!359520 () Bool)

(assert (=> d!88999 (=> res!406040 e!359520)))

(assert (=> d!88999 (= res!406040 (bvsge #b00000000000000000000000000000000 (size!18586 a!2986)))))

(assert (=> d!88999 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12260) e!359520)))

(declare-fun b!628348 () Bool)

(declare-fun e!359523 () Bool)

(declare-fun contains!3079 (List!12263 (_ BitVec 64)) Bool)

(assert (=> b!628348 (= e!359523 (contains!3079 Nil!12260 (select (arr!18222 a!2986) #b00000000000000000000000000000000)))))

(declare-fun bm!33256 () Bool)

(declare-fun call!33259 () Bool)

(assert (=> bm!33256 (= call!33259 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!71521 (Cons!12259 (select (arr!18222 a!2986) #b00000000000000000000000000000000) Nil!12260) Nil!12260)))))

(declare-fun b!628349 () Bool)

(assert (=> b!628349 (= e!359522 call!33259)))

(declare-fun b!628350 () Bool)

(assert (=> b!628350 (= e!359522 call!33259)))

(declare-fun b!628351 () Bool)

(assert (=> b!628351 (= e!359520 e!359521)))

(declare-fun res!406039 () Bool)

(assert (=> b!628351 (=> (not res!406039) (not e!359521))))

(assert (=> b!628351 (= res!406039 (not e!359523))))

(declare-fun res!406041 () Bool)

(assert (=> b!628351 (=> (not res!406041) (not e!359523))))

(assert (=> b!628351 (= res!406041 (validKeyInArray!0 (select (arr!18222 a!2986) #b00000000000000000000000000000000)))))

(assert (= (and d!88999 (not res!406040)) b!628351))

(assert (= (and b!628351 res!406041) b!628348))

(assert (= (and b!628351 res!406039) b!628347))

(assert (= (and b!628347 c!71521) b!628350))

(assert (= (and b!628347 (not c!71521)) b!628349))

(assert (= (or b!628350 b!628349) bm!33256))

(assert (=> b!628347 m!603571))

(assert (=> b!628347 m!603571))

(declare-fun m!603575 () Bool)

(assert (=> b!628347 m!603575))

(assert (=> b!628348 m!603571))

(assert (=> b!628348 m!603571))

(declare-fun m!603577 () Bool)

(assert (=> b!628348 m!603577))

(assert (=> bm!33256 m!603571))

(declare-fun m!603579 () Bool)

(assert (=> bm!33256 m!603579))

(assert (=> b!628351 m!603571))

(assert (=> b!628351 m!603571))

(assert (=> b!628351 m!603575))

(assert (=> b!628246 d!88999))

(declare-fun e!359547 () SeekEntryResult!6662)

(declare-fun b!628383 () Bool)

(assert (=> b!628383 (= e!359547 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!18222 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!628384 () Bool)

(declare-fun e!359546 () SeekEntryResult!6662)

(assert (=> b!628384 (= e!359546 Undefined!6662)))

(declare-fun lt!290451 () SeekEntryResult!6662)

(declare-fun d!89005 () Bool)

(assert (=> d!89005 (and (or (is-Undefined!6662 lt!290451) (not (is-Found!6662 lt!290451)) (and (bvsge (index!28933 lt!290451) #b00000000000000000000000000000000) (bvslt (index!28933 lt!290451) (size!18586 a!2986)))) (or (is-Undefined!6662 lt!290451) (is-Found!6662 lt!290451) (not (is-MissingVacant!6662 lt!290451)) (not (= (index!28935 lt!290451) vacantSpotIndex!68)) (and (bvsge (index!28935 lt!290451) #b00000000000000000000000000000000) (bvslt (index!28935 lt!290451) (size!18586 a!2986)))) (or (is-Undefined!6662 lt!290451) (ite (is-Found!6662 lt!290451) (= (select (arr!18222 a!2986) (index!28933 lt!290451)) (select (arr!18222 a!2986) j!136)) (and (is-MissingVacant!6662 lt!290451) (= (index!28935 lt!290451) vacantSpotIndex!68) (= (select (arr!18222 a!2986) (index!28935 lt!290451)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!89005 (= lt!290451 e!359546)))

(declare-fun c!71533 () Bool)

(assert (=> d!89005 (= c!71533 (bvsge x!910 #b01111111111111111111111111111110))))

(declare-fun lt!290452 () (_ BitVec 64))

(assert (=> d!89005 (= lt!290452 (select (arr!18222 a!2986) index!984))))

(assert (=> d!89005 (validMask!0 mask!3053)))

(assert (=> d!89005 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18222 a!2986) j!136) a!2986 mask!3053) lt!290451)))

(declare-fun b!628385 () Bool)

(declare-fun e!359545 () SeekEntryResult!6662)

(assert (=> b!628385 (= e!359545 (Found!6662 index!984))))

(declare-fun b!628386 () Bool)

(assert (=> b!628386 (= e!359547 (MissingVacant!6662 vacantSpotIndex!68))))

(declare-fun b!628387 () Bool)

(declare-fun c!71532 () Bool)

(assert (=> b!628387 (= c!71532 (= lt!290452 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!628387 (= e!359545 e!359547)))

(declare-fun b!628388 () Bool)

(assert (=> b!628388 (= e!359546 e!359545)))

(declare-fun c!71534 () Bool)

(assert (=> b!628388 (= c!71534 (= lt!290452 (select (arr!18222 a!2986) j!136)))))

(assert (= (and d!89005 c!71533) b!628384))

(assert (= (and d!89005 (not c!71533)) b!628388))

(assert (= (and b!628388 c!71534) b!628385))

(assert (= (and b!628388 (not c!71534)) b!628387))

(assert (= (and b!628387 c!71532) b!628386))

(assert (= (and b!628387 (not c!71532)) b!628383))

(assert (=> b!628383 m!603505))

(assert (=> b!628383 m!603505))

(assert (=> b!628383 m!603479))

(declare-fun m!603599 () Bool)

(assert (=> b!628383 m!603599))

(declare-fun m!603601 () Bool)

(assert (=> d!89005 m!603601))

(declare-fun m!603603 () Bool)

(assert (=> d!89005 m!603603))

(assert (=> d!89005 m!603477))

(assert (=> d!89005 m!603491))

(assert (=> b!628247 d!89005))

(declare-fun b!628437 () Bool)

(declare-fun e!359574 () SeekEntryResult!6662)

(declare-fun lt!290481 () SeekEntryResult!6662)

(assert (=> b!628437 (= e!359574 (Found!6662 (index!28934 lt!290481)))))

(declare-fun b!628438 () Bool)

(declare-fun e!359573 () SeekEntryResult!6662)

(assert (=> b!628438 (= e!359573 (MissingZero!6662 (index!28934 lt!290481)))))

(declare-fun b!628439 () Bool)

(declare-fun c!71561 () Bool)

(declare-fun lt!290480 () (_ BitVec 64))

(assert (=> b!628439 (= c!71561 (= lt!290480 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!628439 (= e!359574 e!359573)))

(declare-fun b!628440 () Bool)

(declare-fun e!359572 () SeekEntryResult!6662)

(assert (=> b!628440 (= e!359572 e!359574)))

(assert (=> b!628440 (= lt!290480 (select (arr!18222 a!2986) (index!28934 lt!290481)))))

(declare-fun c!71559 () Bool)

(assert (=> b!628440 (= c!71559 (= lt!290480 k!1786))))

(declare-fun d!89011 () Bool)

(declare-fun lt!290482 () SeekEntryResult!6662)

(assert (=> d!89011 (and (or (is-Undefined!6662 lt!290482) (not (is-Found!6662 lt!290482)) (and (bvsge (index!28933 lt!290482) #b00000000000000000000000000000000) (bvslt (index!28933 lt!290482) (size!18586 a!2986)))) (or (is-Undefined!6662 lt!290482) (is-Found!6662 lt!290482) (not (is-MissingZero!6662 lt!290482)) (and (bvsge (index!28932 lt!290482) #b00000000000000000000000000000000) (bvslt (index!28932 lt!290482) (size!18586 a!2986)))) (or (is-Undefined!6662 lt!290482) (is-Found!6662 lt!290482) (is-MissingZero!6662 lt!290482) (not (is-MissingVacant!6662 lt!290482)) (and (bvsge (index!28935 lt!290482) #b00000000000000000000000000000000) (bvslt (index!28935 lt!290482) (size!18586 a!2986)))) (or (is-Undefined!6662 lt!290482) (ite (is-Found!6662 lt!290482) (= (select (arr!18222 a!2986) (index!28933 lt!290482)) k!1786) (ite (is-MissingZero!6662 lt!290482) (= (select (arr!18222 a!2986) (index!28932 lt!290482)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!6662 lt!290482) (= (select (arr!18222 a!2986) (index!28935 lt!290482)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!89011 (= lt!290482 e!359572)))

(declare-fun c!71560 () Bool)

(assert (=> d!89011 (= c!71560 (and (is-Intermediate!6662 lt!290481) (undefined!7474 lt!290481)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37964 (_ BitVec 32)) SeekEntryResult!6662)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!89011 (= lt!290481 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!1786 mask!3053) k!1786 a!2986 mask!3053))))

(assert (=> d!89011 (validMask!0 mask!3053)))

(assert (=> d!89011 (= (seekEntryOrOpen!0 k!1786 a!2986 mask!3053) lt!290482)))

(declare-fun b!628441 () Bool)

(assert (=> b!628441 (= e!359573 (seekKeyOrZeroReturnVacant!0 (x!57666 lt!290481) (index!28934 lt!290481) (index!28934 lt!290481) k!1786 a!2986 mask!3053))))

(declare-fun b!628442 () Bool)

(assert (=> b!628442 (= e!359572 Undefined!6662)))

(assert (= (and d!89011 c!71560) b!628442))

(assert (= (and d!89011 (not c!71560)) b!628440))

(assert (= (and b!628440 c!71559) b!628437))

(assert (= (and b!628440 (not c!71559)) b!628439))

(assert (= (and b!628439 c!71561) b!628438))

(assert (= (and b!628439 (not c!71561)) b!628441))

(declare-fun m!603635 () Bool)

(assert (=> b!628440 m!603635))

(declare-fun m!603637 () Bool)

(assert (=> d!89011 m!603637))

(declare-fun m!603639 () Bool)

(assert (=> d!89011 m!603639))

(declare-fun m!603641 () Bool)

(assert (=> d!89011 m!603641))

(assert (=> d!89011 m!603639))

(declare-fun m!603643 () Bool)

(assert (=> d!89011 m!603643))

(assert (=> d!89011 m!603491))

(declare-fun m!603645 () Bool)

(assert (=> d!89011 m!603645))

(declare-fun m!603647 () Bool)

(assert (=> b!628441 m!603647))

(assert (=> b!628250 d!89011))

(declare-fun b!628487 () Bool)

(declare-fun e!359600 () Bool)

(declare-fun e!359599 () Bool)

(assert (=> b!628487 (= e!359600 e!359599)))

(declare-fun c!71582 () Bool)

(assert (=> b!628487 (= c!71582 (validKeyInArray!0 (select (arr!18222 a!2986) #b00000000000000000000000000000000)))))

(declare-fun d!89019 () Bool)

(declare-fun res!406058 () Bool)

(assert (=> d!89019 (=> res!406058 e!359600)))

(assert (=> d!89019 (= res!406058 (bvsge #b00000000000000000000000000000000 (size!18586 a!2986)))))

(assert (=> d!89019 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!359600)))

(declare-fun b!628488 () Bool)

(declare-fun e!359601 () Bool)

(declare-fun call!33266 () Bool)

(assert (=> b!628488 (= e!359601 call!33266)))

(declare-fun b!628489 () Bool)

(assert (=> b!628489 (= e!359599 e!359601)))

(declare-fun lt!290502 () (_ BitVec 64))

(assert (=> b!628489 (= lt!290502 (select (arr!18222 a!2986) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!21100 0))(
  ( (Unit!21101) )
))
(declare-fun lt!290501 () Unit!21100)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!37964 (_ BitVec 64) (_ BitVec 32)) Unit!21100)

(assert (=> b!628489 (= lt!290501 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!290502 #b00000000000000000000000000000000))))

(assert (=> b!628489 (arrayContainsKey!0 a!2986 lt!290502 #b00000000000000000000000000000000)))

(declare-fun lt!290503 () Unit!21100)

(assert (=> b!628489 (= lt!290503 lt!290501)))

(declare-fun res!406057 () Bool)

(assert (=> b!628489 (= res!406057 (= (seekEntryOrOpen!0 (select (arr!18222 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6662 #b00000000000000000000000000000000)))))

(assert (=> b!628489 (=> (not res!406057) (not e!359601))))

(declare-fun b!628490 () Bool)

(assert (=> b!628490 (= e!359599 call!33266)))

(declare-fun bm!33263 () Bool)

(assert (=> bm!33263 (= call!33266 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(assert (= (and d!89019 (not res!406058)) b!628487))

(assert (= (and b!628487 c!71582) b!628489))

(assert (= (and b!628487 (not c!71582)) b!628490))

(assert (= (and b!628489 res!406057) b!628488))

(assert (= (or b!628488 b!628490) bm!33263))

(assert (=> b!628487 m!603571))

(assert (=> b!628487 m!603571))

(assert (=> b!628487 m!603575))

(assert (=> b!628489 m!603571))

(declare-fun m!603661 () Bool)

(assert (=> b!628489 m!603661))

(declare-fun m!603663 () Bool)

(assert (=> b!628489 m!603663))

(assert (=> b!628489 m!603571))

(declare-fun m!603665 () Bool)

(assert (=> b!628489 m!603665))

(declare-fun m!603667 () Bool)

(assert (=> bm!33263 m!603667))

(assert (=> b!628245 d!89019))

(declare-fun d!89025 () Bool)

(declare-fun lt!290506 () (_ BitVec 32))

(assert (=> d!89025 (and (bvsge lt!290506 #b00000000000000000000000000000000) (bvslt lt!290506 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!89025 (= lt!290506 (choose!52 index!984 x!910 mask!3053))))

(assert (=> d!89025 (validMask!0 mask!3053)))

(assert (=> d!89025 (= (nextIndex!0 index!984 x!910 mask!3053) lt!290506)))

(declare-fun bs!18956 () Bool)

(assert (= bs!18956 d!89025))

(declare-fun m!603671 () Bool)

(assert (=> bs!18956 m!603671))

(assert (=> bs!18956 m!603491))

(assert (=> b!628240 d!89025))

(declare-fun d!89029 () Bool)

(assert (=> d!89029 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!56672 d!89029))

(declare-fun d!89043 () Bool)

(assert (=> d!89043 (= (array_inv!14018 a!2986) (bvsge (size!18586 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!56672 d!89043))

(push 1)

(assert (not d!89005))

(assert (not d!89025))

(assert (not b!628487))

(assert (not d!89011))

(assert (not b!628348))

(assert (not b!628489))

(assert (not bm!33263))

(assert (not b!628347))

(assert (not b!628383))

(assert (not b!628441))

(assert (not b!628328))

(assert (not bm!33256))

(assert (not b!628351))

(check-sat)

(pop 1)

(push 1)

(check-sat)

