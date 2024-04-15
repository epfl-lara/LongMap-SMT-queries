; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56316 () Bool)

(assert start!56316)

(declare-fun b!624376 () Bool)

(declare-fun res!402674 () Bool)

(declare-fun e!357987 () Bool)

(assert (=> b!624376 (=> (not res!402674) (not e!357987))))

(declare-datatypes ((array!37755 0))(
  ( (array!37756 (arr!18122 (Array (_ BitVec 32) (_ BitVec 64))) (size!18487 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37755)

(declare-datatypes ((List!12202 0))(
  ( (Nil!12199) (Cons!12198 (h!13243 (_ BitVec 64)) (t!18421 List!12202)) )
))
(declare-fun arrayNoDuplicates!0 (array!37755 (_ BitVec 32) List!12202) Bool)

(assert (=> b!624376 (= res!402674 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12199))))

(declare-fun b!624377 () Bool)

(declare-fun res!402668 () Bool)

(assert (=> b!624377 (=> (not res!402668) (not e!357987))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37755 (_ BitVec 32)) Bool)

(assert (=> b!624377 (= res!402668 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!624378 () Bool)

(declare-fun res!402675 () Bool)

(declare-fun e!357986 () Bool)

(assert (=> b!624378 (=> (not res!402675) (not e!357986))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!624378 (= res!402675 (and (= (size!18487 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18487 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18487 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!624379 () Bool)

(declare-fun res!402670 () Bool)

(assert (=> b!624379 (=> (not res!402670) (not e!357986))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!624379 (= res!402670 (validKeyInArray!0 k0!1786))))

(declare-fun b!624380 () Bool)

(declare-fun res!402672 () Bool)

(assert (=> b!624380 (=> (not res!402672) (not e!357986))))

(declare-fun arrayContainsKey!0 (array!37755 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!624380 (= res!402672 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!624381 () Bool)

(declare-fun res!402677 () Bool)

(assert (=> b!624381 (=> (not res!402677) (not e!357987))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!624381 (= res!402677 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18122 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18122 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!624382 () Bool)

(assert (=> b!624382 (= e!357986 e!357987)))

(declare-fun res!402669 () Bool)

(assert (=> b!624382 (=> (not res!402669) (not e!357987))))

(declare-datatypes ((SeekEntryResult!6559 0))(
  ( (MissingZero!6559 (index!28520 (_ BitVec 32))) (Found!6559 (index!28521 (_ BitVec 32))) (Intermediate!6559 (undefined!7371 Bool) (index!28522 (_ BitVec 32)) (x!57285 (_ BitVec 32))) (Undefined!6559) (MissingVacant!6559 (index!28523 (_ BitVec 32))) )
))
(declare-fun lt!289408 () SeekEntryResult!6559)

(assert (=> b!624382 (= res!402669 (or (= lt!289408 (MissingZero!6559 i!1108)) (= lt!289408 (MissingVacant!6559 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37755 (_ BitVec 32)) SeekEntryResult!6559)

(assert (=> b!624382 (= lt!289408 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun res!402673 () Bool)

(assert (=> start!56316 (=> (not res!402673) (not e!357986))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56316 (= res!402673 (validMask!0 mask!3053))))

(assert (=> start!56316 e!357986))

(assert (=> start!56316 true))

(declare-fun array_inv!14005 (array!37755) Bool)

(assert (=> start!56316 (array_inv!14005 a!2986)))

(declare-fun b!624383 () Bool)

(declare-fun res!402676 () Bool)

(assert (=> b!624383 (=> (not res!402676) (not e!357986))))

(assert (=> b!624383 (= res!402676 (validKeyInArray!0 (select (arr!18122 a!2986) j!136)))))

(declare-fun b!624384 () Bool)

(assert (=> b!624384 (= e!357987 (bvsge x!910 #b01111111111111111111111111111110))))

(declare-fun b!624385 () Bool)

(declare-fun res!402671 () Bool)

(assert (=> b!624385 (=> (not res!402671) (not e!357987))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37755 (_ BitVec 32)) SeekEntryResult!6559)

(assert (=> b!624385 (= res!402671 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18122 a!2986) j!136) a!2986 mask!3053) (Found!6559 j!136)))))

(assert (= (and start!56316 res!402673) b!624378))

(assert (= (and b!624378 res!402675) b!624383))

(assert (= (and b!624383 res!402676) b!624379))

(assert (= (and b!624379 res!402670) b!624380))

(assert (= (and b!624380 res!402672) b!624382))

(assert (= (and b!624382 res!402669) b!624377))

(assert (= (and b!624377 res!402668) b!624376))

(assert (= (and b!624376 res!402674) b!624381))

(assert (= (and b!624381 res!402677) b!624385))

(assert (= (and b!624385 res!402671) b!624384))

(declare-fun m!599563 () Bool)

(assert (=> b!624379 m!599563))

(declare-fun m!599565 () Bool)

(assert (=> b!624383 m!599565))

(assert (=> b!624383 m!599565))

(declare-fun m!599567 () Bool)

(assert (=> b!624383 m!599567))

(declare-fun m!599569 () Bool)

(assert (=> b!624382 m!599569))

(declare-fun m!599571 () Bool)

(assert (=> b!624376 m!599571))

(declare-fun m!599573 () Bool)

(assert (=> start!56316 m!599573))

(declare-fun m!599575 () Bool)

(assert (=> start!56316 m!599575))

(assert (=> b!624385 m!599565))

(assert (=> b!624385 m!599565))

(declare-fun m!599577 () Bool)

(assert (=> b!624385 m!599577))

(declare-fun m!599579 () Bool)

(assert (=> b!624380 m!599579))

(declare-fun m!599581 () Bool)

(assert (=> b!624381 m!599581))

(declare-fun m!599583 () Bool)

(assert (=> b!624381 m!599583))

(declare-fun m!599585 () Bool)

(assert (=> b!624381 m!599585))

(declare-fun m!599587 () Bool)

(assert (=> b!624377 m!599587))

(check-sat (not b!624376) (not b!624383) (not start!56316) (not b!624385) (not b!624379) (not b!624382) (not b!624377) (not b!624380))
(check-sat)
(get-model)

(declare-fun b!624456 () Bool)

(declare-fun e!358014 () Bool)

(declare-fun e!358015 () Bool)

(assert (=> b!624456 (= e!358014 e!358015)))

(declare-fun res!402745 () Bool)

(assert (=> b!624456 (=> (not res!402745) (not e!358015))))

(declare-fun e!358016 () Bool)

(assert (=> b!624456 (= res!402745 (not e!358016))))

(declare-fun res!402746 () Bool)

(assert (=> b!624456 (=> (not res!402746) (not e!358016))))

(assert (=> b!624456 (= res!402746 (validKeyInArray!0 (select (arr!18122 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!624457 () Bool)

(declare-fun contains!3059 (List!12202 (_ BitVec 64)) Bool)

(assert (=> b!624457 (= e!358016 (contains!3059 Nil!12199 (select (arr!18122 a!2986) #b00000000000000000000000000000000)))))

(declare-fun d!88543 () Bool)

(declare-fun res!402744 () Bool)

(assert (=> d!88543 (=> res!402744 e!358014)))

(assert (=> d!88543 (= res!402744 (bvsge #b00000000000000000000000000000000 (size!18487 a!2986)))))

(assert (=> d!88543 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12199) e!358014)))

(declare-fun b!624458 () Bool)

(declare-fun e!358017 () Bool)

(assert (=> b!624458 (= e!358015 e!358017)))

(declare-fun c!71223 () Bool)

(assert (=> b!624458 (= c!71223 (validKeyInArray!0 (select (arr!18122 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!624459 () Bool)

(declare-fun call!33178 () Bool)

(assert (=> b!624459 (= e!358017 call!33178)))

(declare-fun b!624460 () Bool)

(assert (=> b!624460 (= e!358017 call!33178)))

(declare-fun bm!33175 () Bool)

(assert (=> bm!33175 (= call!33178 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!71223 (Cons!12198 (select (arr!18122 a!2986) #b00000000000000000000000000000000) Nil!12199) Nil!12199)))))

(assert (= (and d!88543 (not res!402744)) b!624456))

(assert (= (and b!624456 res!402746) b!624457))

(assert (= (and b!624456 res!402745) b!624458))

(assert (= (and b!624458 c!71223) b!624459))

(assert (= (and b!624458 (not c!71223)) b!624460))

(assert (= (or b!624459 b!624460) bm!33175))

(declare-fun m!599641 () Bool)

(assert (=> b!624456 m!599641))

(assert (=> b!624456 m!599641))

(declare-fun m!599643 () Bool)

(assert (=> b!624456 m!599643))

(assert (=> b!624457 m!599641))

(assert (=> b!624457 m!599641))

(declare-fun m!599645 () Bool)

(assert (=> b!624457 m!599645))

(assert (=> b!624458 m!599641))

(assert (=> b!624458 m!599641))

(assert (=> b!624458 m!599643))

(assert (=> bm!33175 m!599641))

(declare-fun m!599647 () Bool)

(assert (=> bm!33175 m!599647))

(assert (=> b!624376 d!88543))

(declare-fun b!624500 () Bool)

(declare-fun e!358045 () SeekEntryResult!6559)

(declare-fun e!358046 () SeekEntryResult!6559)

(assert (=> b!624500 (= e!358045 e!358046)))

(declare-fun lt!289431 () (_ BitVec 64))

(declare-fun lt!289430 () SeekEntryResult!6559)

(assert (=> b!624500 (= lt!289431 (select (arr!18122 a!2986) (index!28522 lt!289430)))))

(declare-fun c!71238 () Bool)

(assert (=> b!624500 (= c!71238 (= lt!289431 k0!1786))))

(declare-fun b!624501 () Bool)

(declare-fun e!358047 () SeekEntryResult!6559)

(assert (=> b!624501 (= e!358047 (MissingZero!6559 (index!28522 lt!289430)))))

(declare-fun d!88545 () Bool)

(declare-fun lt!289432 () SeekEntryResult!6559)

(get-info :version)

(assert (=> d!88545 (and (or ((_ is Undefined!6559) lt!289432) (not ((_ is Found!6559) lt!289432)) (and (bvsge (index!28521 lt!289432) #b00000000000000000000000000000000) (bvslt (index!28521 lt!289432) (size!18487 a!2986)))) (or ((_ is Undefined!6559) lt!289432) ((_ is Found!6559) lt!289432) (not ((_ is MissingZero!6559) lt!289432)) (and (bvsge (index!28520 lt!289432) #b00000000000000000000000000000000) (bvslt (index!28520 lt!289432) (size!18487 a!2986)))) (or ((_ is Undefined!6559) lt!289432) ((_ is Found!6559) lt!289432) ((_ is MissingZero!6559) lt!289432) (not ((_ is MissingVacant!6559) lt!289432)) (and (bvsge (index!28523 lt!289432) #b00000000000000000000000000000000) (bvslt (index!28523 lt!289432) (size!18487 a!2986)))) (or ((_ is Undefined!6559) lt!289432) (ite ((_ is Found!6559) lt!289432) (= (select (arr!18122 a!2986) (index!28521 lt!289432)) k0!1786) (ite ((_ is MissingZero!6559) lt!289432) (= (select (arr!18122 a!2986) (index!28520 lt!289432)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!6559) lt!289432) (= (select (arr!18122 a!2986) (index!28523 lt!289432)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!88545 (= lt!289432 e!358045)))

(declare-fun c!71236 () Bool)

(assert (=> d!88545 (= c!71236 (and ((_ is Intermediate!6559) lt!289430) (undefined!7371 lt!289430)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37755 (_ BitVec 32)) SeekEntryResult!6559)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!88545 (= lt!289430 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!88545 (validMask!0 mask!3053)))

(assert (=> d!88545 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!289432)))

(declare-fun b!624502 () Bool)

(assert (=> b!624502 (= e!358045 Undefined!6559)))

(declare-fun b!624503 () Bool)

(declare-fun c!71237 () Bool)

(assert (=> b!624503 (= c!71237 (= lt!289431 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!624503 (= e!358046 e!358047)))

(declare-fun b!624504 () Bool)

(assert (=> b!624504 (= e!358046 (Found!6559 (index!28522 lt!289430)))))

(declare-fun b!624505 () Bool)

(assert (=> b!624505 (= e!358047 (seekKeyOrZeroReturnVacant!0 (x!57285 lt!289430) (index!28522 lt!289430) (index!28522 lt!289430) k0!1786 a!2986 mask!3053))))

(assert (= (and d!88545 c!71236) b!624502))

(assert (= (and d!88545 (not c!71236)) b!624500))

(assert (= (and b!624500 c!71238) b!624504))

(assert (= (and b!624500 (not c!71238)) b!624503))

(assert (= (and b!624503 c!71237) b!624501))

(assert (= (and b!624503 (not c!71237)) b!624505))

(declare-fun m!599669 () Bool)

(assert (=> b!624500 m!599669))

(assert (=> d!88545 m!599573))

(declare-fun m!599671 () Bool)

(assert (=> d!88545 m!599671))

(declare-fun m!599673 () Bool)

(assert (=> d!88545 m!599673))

(declare-fun m!599675 () Bool)

(assert (=> d!88545 m!599675))

(declare-fun m!599677 () Bool)

(assert (=> d!88545 m!599677))

(assert (=> d!88545 m!599673))

(declare-fun m!599679 () Bool)

(assert (=> d!88545 m!599679))

(declare-fun m!599681 () Bool)

(assert (=> b!624505 m!599681))

(assert (=> b!624382 d!88545))

(declare-fun b!624526 () Bool)

(declare-fun e!358065 () Bool)

(declare-fun e!358063 () Bool)

(assert (=> b!624526 (= e!358065 e!358063)))

(declare-fun c!71244 () Bool)

(assert (=> b!624526 (= c!71244 (validKeyInArray!0 (select (arr!18122 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!624527 () Bool)

(declare-fun e!358064 () Bool)

(declare-fun call!33190 () Bool)

(assert (=> b!624527 (= e!358064 call!33190)))

(declare-fun d!88557 () Bool)

(declare-fun res!402773 () Bool)

(assert (=> d!88557 (=> res!402773 e!358065)))

(assert (=> d!88557 (= res!402773 (bvsge #b00000000000000000000000000000000 (size!18487 a!2986)))))

(assert (=> d!88557 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!358065)))

(declare-fun bm!33187 () Bool)

(assert (=> bm!33187 (= call!33190 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!624528 () Bool)

(assert (=> b!624528 (= e!358063 e!358064)))

(declare-fun lt!289448 () (_ BitVec 64))

(assert (=> b!624528 (= lt!289448 (select (arr!18122 a!2986) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!21068 0))(
  ( (Unit!21069) )
))
(declare-fun lt!289450 () Unit!21068)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!37755 (_ BitVec 64) (_ BitVec 32)) Unit!21068)

(assert (=> b!624528 (= lt!289450 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!289448 #b00000000000000000000000000000000))))

(assert (=> b!624528 (arrayContainsKey!0 a!2986 lt!289448 #b00000000000000000000000000000000)))

(declare-fun lt!289449 () Unit!21068)

(assert (=> b!624528 (= lt!289449 lt!289450)))

(declare-fun res!402772 () Bool)

(assert (=> b!624528 (= res!402772 (= (seekEntryOrOpen!0 (select (arr!18122 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6559 #b00000000000000000000000000000000)))))

(assert (=> b!624528 (=> (not res!402772) (not e!358064))))

(declare-fun b!624529 () Bool)

(assert (=> b!624529 (= e!358063 call!33190)))

(assert (= (and d!88557 (not res!402773)) b!624526))

(assert (= (and b!624526 c!71244) b!624528))

(assert (= (and b!624526 (not c!71244)) b!624529))

(assert (= (and b!624528 res!402772) b!624527))

(assert (= (or b!624527 b!624529) bm!33187))

(assert (=> b!624526 m!599641))

(assert (=> b!624526 m!599641))

(assert (=> b!624526 m!599643))

(declare-fun m!599691 () Bool)

(assert (=> bm!33187 m!599691))

(assert (=> b!624528 m!599641))

(declare-fun m!599693 () Bool)

(assert (=> b!624528 m!599693))

(declare-fun m!599695 () Bool)

(assert (=> b!624528 m!599695))

(assert (=> b!624528 m!599641))

(declare-fun m!599697 () Bool)

(assert (=> b!624528 m!599697))

(assert (=> b!624377 d!88557))

(declare-fun d!88575 () Bool)

(assert (=> d!88575 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!56316 d!88575))

(declare-fun d!88577 () Bool)

(assert (=> d!88577 (= (array_inv!14005 a!2986) (bvsge (size!18487 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!56316 d!88577))

(declare-fun d!88579 () Bool)

(assert (=> d!88579 (= (validKeyInArray!0 (select (arr!18122 a!2986) j!136)) (and (not (= (select (arr!18122 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18122 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!624383 d!88579))

(declare-fun d!88581 () Bool)

(assert (=> d!88581 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!624379 d!88581))

(declare-fun b!624605 () Bool)

(declare-fun e!358116 () SeekEntryResult!6559)

(declare-fun e!358115 () SeekEntryResult!6559)

(assert (=> b!624605 (= e!358116 e!358115)))

(declare-fun c!71274 () Bool)

(declare-fun lt!289470 () (_ BitVec 64))

(assert (=> b!624605 (= c!71274 (= lt!289470 (select (arr!18122 a!2986) j!136)))))

(declare-fun b!624606 () Bool)

(declare-fun e!358114 () SeekEntryResult!6559)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!624606 (= e!358114 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!18122 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!624607 () Bool)

(assert (=> b!624607 (= e!358115 (Found!6559 index!984))))

(declare-fun b!624608 () Bool)

(assert (=> b!624608 (= e!358114 (MissingVacant!6559 vacantSpotIndex!68))))

(declare-fun lt!289471 () SeekEntryResult!6559)

(declare-fun d!88583 () Bool)

(assert (=> d!88583 (and (or ((_ is Undefined!6559) lt!289471) (not ((_ is Found!6559) lt!289471)) (and (bvsge (index!28521 lt!289471) #b00000000000000000000000000000000) (bvslt (index!28521 lt!289471) (size!18487 a!2986)))) (or ((_ is Undefined!6559) lt!289471) ((_ is Found!6559) lt!289471) (not ((_ is MissingVacant!6559) lt!289471)) (not (= (index!28523 lt!289471) vacantSpotIndex!68)) (and (bvsge (index!28523 lt!289471) #b00000000000000000000000000000000) (bvslt (index!28523 lt!289471) (size!18487 a!2986)))) (or ((_ is Undefined!6559) lt!289471) (ite ((_ is Found!6559) lt!289471) (= (select (arr!18122 a!2986) (index!28521 lt!289471)) (select (arr!18122 a!2986) j!136)) (and ((_ is MissingVacant!6559) lt!289471) (= (index!28523 lt!289471) vacantSpotIndex!68) (= (select (arr!18122 a!2986) (index!28523 lt!289471)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!88583 (= lt!289471 e!358116)))

(declare-fun c!71272 () Bool)

(assert (=> d!88583 (= c!71272 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!88583 (= lt!289470 (select (arr!18122 a!2986) index!984))))

(assert (=> d!88583 (validMask!0 mask!3053)))

(assert (=> d!88583 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18122 a!2986) j!136) a!2986 mask!3053) lt!289471)))

(declare-fun b!624609 () Bool)

(declare-fun c!71273 () Bool)

(assert (=> b!624609 (= c!71273 (= lt!289470 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!624609 (= e!358115 e!358114)))

(declare-fun b!624610 () Bool)

(assert (=> b!624610 (= e!358116 Undefined!6559)))

(assert (= (and d!88583 c!71272) b!624610))

(assert (= (and d!88583 (not c!71272)) b!624605))

(assert (= (and b!624605 c!71274) b!624607))

(assert (= (and b!624605 (not c!71274)) b!624609))

(assert (= (and b!624609 c!71273) b!624608))

(assert (= (and b!624609 (not c!71273)) b!624606))

(declare-fun m!599731 () Bool)

(assert (=> b!624606 m!599731))

(assert (=> b!624606 m!599731))

(assert (=> b!624606 m!599565))

(declare-fun m!599733 () Bool)

(assert (=> b!624606 m!599733))

(declare-fun m!599735 () Bool)

(assert (=> d!88583 m!599735))

(declare-fun m!599737 () Bool)

(assert (=> d!88583 m!599737))

(declare-fun m!599739 () Bool)

(assert (=> d!88583 m!599739))

(assert (=> d!88583 m!599573))

(assert (=> b!624385 d!88583))

(declare-fun d!88595 () Bool)

(declare-fun res!402799 () Bool)

(declare-fun e!358127 () Bool)

(assert (=> d!88595 (=> res!402799 e!358127)))

(assert (=> d!88595 (= res!402799 (= (select (arr!18122 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!88595 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!358127)))

(declare-fun b!624627 () Bool)

(declare-fun e!358128 () Bool)

(assert (=> b!624627 (= e!358127 e!358128)))

(declare-fun res!402800 () Bool)

(assert (=> b!624627 (=> (not res!402800) (not e!358128))))

(assert (=> b!624627 (= res!402800 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18487 a!2986)))))

(declare-fun b!624628 () Bool)

(assert (=> b!624628 (= e!358128 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!88595 (not res!402799)) b!624627))

(assert (= (and b!624627 res!402800) b!624628))

(assert (=> d!88595 m!599641))

(declare-fun m!599741 () Bool)

(assert (=> b!624628 m!599741))

(assert (=> b!624380 d!88595))

(check-sat (not bm!33175) (not b!624606) (not b!624628) (not b!624458) (not d!88545) (not bm!33187) (not b!624526) (not b!624456) (not b!624457) (not b!624505) (not d!88583) (not b!624528))
(check-sat)
