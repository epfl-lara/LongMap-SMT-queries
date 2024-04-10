; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131550 () Bool)

(assert start!131550)

(declare-fun res!1057893 () Bool)

(declare-fun e!857269 () Bool)

(assert (=> start!131550 (=> (not res!1057893) (not e!857269))))

(declare-fun mask!4052 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131550 (= res!1057893 (validMask!0 mask!4052))))

(assert (=> start!131550 e!857269))

(assert (=> start!131550 true))

(declare-datatypes ((array!102453 0))(
  ( (array!102454 (arr!49435 (Array (_ BitVec 32) (_ BitVec 64))) (size!49985 (_ BitVec 32))) )
))
(declare-fun a!3920 () array!102453)

(declare-fun array_inv!38463 (array!102453) Bool)

(assert (=> start!131550 (array_inv!38463 a!3920)))

(declare-fun b!1541345 () Bool)

(declare-fun res!1057891 () Bool)

(assert (=> b!1541345 (=> (not res!1057891) (not e!857269))))

(declare-fun newFrom!293 () (_ BitVec 32))

(declare-fun from!3298 () (_ BitVec 32))

(assert (=> b!1541345 (= res!1057891 (and (= (size!49985 a!3920) (bvadd #b00000000000000000000000000000001 mask!4052)) (bvsge from!3298 #b00000000000000000000000000000000) (bvsle from!3298 (size!49985 a!3920)) (bvsge newFrom!293 from!3298) (bvsle newFrom!293 (size!49985 a!3920))))))

(declare-fun b!1541348 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102453 (_ BitVec 32)) Bool)

(assert (=> b!1541348 (= e!857269 (not (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 from!3298) a!3920 mask!4052)))))

(declare-fun b!1541347 () Bool)

(declare-fun res!1057894 () Bool)

(assert (=> b!1541347 (=> (not res!1057894) (not e!857269))))

(assert (=> b!1541347 (= res!1057894 (and (bvslt from!3298 newFrom!293) (bvsge (bvadd #b00000000000000000000000000000001 from!3298) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!3298) (size!49985 a!3920))))))

(declare-fun b!1541346 () Bool)

(declare-fun res!1057892 () Bool)

(assert (=> b!1541346 (=> (not res!1057892) (not e!857269))))

(assert (=> b!1541346 (= res!1057892 (arrayForallSeekEntryOrOpenFound!0 from!3298 a!3920 mask!4052))))

(assert (= (and start!131550 res!1057893) b!1541345))

(assert (= (and b!1541345 res!1057891) b!1541346))

(assert (= (and b!1541346 res!1057892) b!1541347))

(assert (= (and b!1541347 res!1057894) b!1541348))

(declare-fun m!1423333 () Bool)

(assert (=> start!131550 m!1423333))

(declare-fun m!1423335 () Bool)

(assert (=> start!131550 m!1423335))

(declare-fun m!1423337 () Bool)

(assert (=> b!1541348 m!1423337))

(declare-fun m!1423339 () Bool)

(assert (=> b!1541346 m!1423339))

(push 1)

(assert (not b!1541346))

(assert (not start!131550))

(assert (not b!1541348))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1541377 () Bool)

(declare-fun e!857292 () Bool)

(declare-fun e!857293 () Bool)

(assert (=> b!1541377 (= e!857292 e!857293)))

(declare-fun c!141292 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1541377 (= c!141292 (validKeyInArray!0 (select (arr!49435 a!3920) from!3298)))))

(declare-fun b!1541378 () Bool)

(declare-fun e!857291 () Bool)

(assert (=> b!1541378 (= e!857293 e!857291)))

(declare-fun lt!665673 () (_ BitVec 64))

(assert (=> b!1541378 (= lt!665673 (select (arr!49435 a!3920) from!3298))))

(declare-datatypes ((Unit!51478 0))(
  ( (Unit!51479) )
))
(declare-fun lt!665674 () Unit!51478)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!102453 (_ BitVec 64) (_ BitVec 32)) Unit!51478)

(assert (=> b!1541378 (= lt!665674 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3920 lt!665673 from!3298))))

(declare-fun arrayContainsKey!0 (array!102453 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1541378 (arrayContainsKey!0 a!3920 lt!665673 #b00000000000000000000000000000000)))

(declare-fun lt!665672 () Unit!51478)

(assert (=> b!1541378 (= lt!665672 lt!665674)))

(declare-fun res!1057910 () Bool)

(declare-datatypes ((SeekEntryResult!13507 0))(
  ( (MissingZero!13507 (index!56426 (_ BitVec 32))) (Found!13507 (index!56427 (_ BitVec 32))) (Intermediate!13507 (undefined!14319 Bool) (index!56428 (_ BitVec 32)) (x!138307 (_ BitVec 32))) (Undefined!13507) (MissingVacant!13507 (index!56429 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!102453 (_ BitVec 32)) SeekEntryResult!13507)

(assert (=> b!1541378 (= res!1057910 (= (seekEntryOrOpen!0 (select (arr!49435 a!3920) from!3298) a!3920 mask!4052) (Found!13507 from!3298)))))

(assert (=> b!1541378 (=> (not res!1057910) (not e!857291))))

(declare-fun d!160659 () Bool)

(declare-fun res!1057909 () Bool)

(assert (=> d!160659 (=> res!1057909 e!857292)))

(assert (=> d!160659 (= res!1057909 (bvsge from!3298 (size!49985 a!3920)))))

(assert (=> d!160659 (= (arrayForallSeekEntryOrOpenFound!0 from!3298 a!3920 mask!4052) e!857292)))

(declare-fun b!1541379 () Bool)

(declare-fun call!68678 () Bool)

(assert (=> b!1541379 (= e!857291 call!68678)))

(declare-fun b!1541380 () Bool)

(assert (=> b!1541380 (= e!857293 call!68678)))

(declare-fun bm!68675 () Bool)

(assert (=> bm!68675 (= call!68678 (arrayForallSeekEntryOrOpenFound!0 (bvadd from!3298 #b00000000000000000000000000000001) a!3920 mask!4052))))

(assert (= (and d!160659 (not res!1057909)) b!1541377))

(assert (= (and b!1541377 c!141292) b!1541378))

(assert (= (and b!1541377 (not c!141292)) b!1541380))

(assert (= (and b!1541378 res!1057910) b!1541379))

(assert (= (or b!1541379 b!1541380) bm!68675))

(declare-fun m!1423353 () Bool)

(assert (=> b!1541377 m!1423353))

(assert (=> b!1541377 m!1423353))

(declare-fun m!1423355 () Bool)

(assert (=> b!1541377 m!1423355))

(assert (=> b!1541378 m!1423353))

(declare-fun m!1423357 () Bool)

(assert (=> b!1541378 m!1423357))

(declare-fun m!1423359 () Bool)

(assert (=> b!1541378 m!1423359))

(assert (=> b!1541378 m!1423353))

(declare-fun m!1423363 () Bool)

(assert (=> b!1541378 m!1423363))

(declare-fun m!1423365 () Bool)

(assert (=> bm!68675 m!1423365))

(assert (=> b!1541346 d!160659))

(declare-fun d!160665 () Bool)

(assert (=> d!160665 (= (validMask!0 mask!4052) (and (or (= mask!4052 #b00000000000000000000000000000111) (= mask!4052 #b00000000000000000000000000001111) (= mask!4052 #b00000000000000000000000000011111) (= mask!4052 #b00000000000000000000000000111111) (= mask!4052 #b00000000000000000000000001111111) (= mask!4052 #b00000000000000000000000011111111) (= mask!4052 #b00000000000000000000000111111111) (= mask!4052 #b00000000000000000000001111111111) (= mask!4052 #b00000000000000000000011111111111) (= mask!4052 #b00000000000000000000111111111111) (= mask!4052 #b00000000000000000001111111111111) (= mask!4052 #b00000000000000000011111111111111) (= mask!4052 #b00000000000000000111111111111111) (= mask!4052 #b00000000000000001111111111111111) (= mask!4052 #b00000000000000011111111111111111) (= mask!4052 #b00000000000000111111111111111111) (= mask!4052 #b00000000000001111111111111111111) (= mask!4052 #b00000000000011111111111111111111) (= mask!4052 #b00000000000111111111111111111111) (= mask!4052 #b00000000001111111111111111111111) (= mask!4052 #b00000000011111111111111111111111) (= mask!4052 #b00000000111111111111111111111111) (= mask!4052 #b00000001111111111111111111111111) (= mask!4052 #b00000011111111111111111111111111) (= mask!4052 #b00000111111111111111111111111111) (= mask!4052 #b00001111111111111111111111111111) (= mask!4052 #b00011111111111111111111111111111) (= mask!4052 #b00111111111111111111111111111111)) (bvsle mask!4052 #b00111111111111111111111111111111)))))

(assert (=> start!131550 d!160665))

(declare-fun d!160673 () Bool)

(assert (=> d!160673 (= (array_inv!38463 a!3920) (bvsge (size!49985 a!3920) #b00000000000000000000000000000000))))

(assert (=> start!131550 d!160673))

(declare-fun b!1541393 () Bool)

(declare-fun e!857304 () Bool)

(declare-fun e!857305 () Bool)

(assert (=> b!1541393 (= e!857304 e!857305)))

(declare-fun c!141296 () Bool)

(assert (=> b!1541393 (= c!141296 (validKeyInArray!0 (select (arr!49435 a!3920) (bvadd #b00000000000000000000000000000001 from!3298))))))

(declare-fun b!1541394 () Bool)

(declare-fun e!857303 () Bool)

(assert (=> b!1541394 (= e!857305 e!857303)))

(declare-fun lt!665685 () (_ BitVec 64))

(assert (=> b!1541394 (= lt!665685 (select (arr!49435 a!3920) (bvadd #b00000000000000000000000000000001 from!3298)))))

(declare-fun lt!665686 () Unit!51478)

(assert (=> b!1541394 (= lt!665686 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3920 lt!665685 (bvadd #b00000000000000000000000000000001 from!3298)))))

(assert (=> b!1541394 (arrayContainsKey!0 a!3920 lt!665685 #b00000000000000000000000000000000)))

(declare-fun lt!665684 () Unit!51478)

(assert (=> b!1541394 (= lt!665684 lt!665686)))

(declare-fun res!1057918 () Bool)

(assert (=> b!1541394 (= res!1057918 (= (seekEntryOrOpen!0 (select (arr!49435 a!3920) (bvadd #b00000000000000000000000000000001 from!3298)) a!3920 mask!4052) (Found!13507 (bvadd #b00000000000000000000000000000001 from!3298))))))

(assert (=> b!1541394 (=> (not res!1057918) (not e!857303))))

(declare-fun d!160675 () Bool)

(declare-fun res!1057917 () Bool)

(assert (=> d!160675 (=> res!1057917 e!857304)))

(assert (=> d!160675 (= res!1057917 (bvsge (bvadd #b00000000000000000000000000000001 from!3298) (size!49985 a!3920)))))

(assert (=> d!160675 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 from!3298) a!3920 mask!4052) e!857304)))

(declare-fun b!1541395 () Bool)

(declare-fun call!68682 () Bool)

(assert (=> b!1541395 (= e!857303 call!68682)))

(declare-fun b!1541396 () Bool)

(assert (=> b!1541396 (= e!857305 call!68682)))

(declare-fun bm!68679 () Bool)

(assert (=> bm!68679 (= call!68682 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 from!3298 #b00000000000000000000000000000001) a!3920 mask!4052))))

(assert (= (and d!160675 (not res!1057917)) b!1541393))

(assert (= (and b!1541393 c!141296) b!1541394))

(assert (= (and b!1541393 (not c!141296)) b!1541396))

(assert (= (and b!1541394 res!1057918) b!1541395))

(assert (= (or b!1541395 b!1541396) bm!68679))

(declare-fun m!1423401 () Bool)

(assert (=> b!1541393 m!1423401))

(assert (=> b!1541393 m!1423401))

(declare-fun m!1423403 () Bool)

(assert (=> b!1541393 m!1423403))

(assert (=> b!1541394 m!1423401))

(declare-fun m!1423405 () Bool)

(assert (=> b!1541394 m!1423405))

(declare-fun m!1423407 () Bool)

(assert (=> b!1541394 m!1423407))

(assert (=> b!1541394 m!1423401))

(declare-fun m!1423409 () Bool)

(assert (=> b!1541394 m!1423409))

(declare-fun m!1423411 () Bool)

(assert (=> bm!68679 m!1423411))

(assert (=> b!1541348 d!160675))

(push 1)

(assert (not b!1541378))

(assert (not bm!68679))

(assert (not b!1541393))

(assert (not b!1541394))

(assert (not bm!68675))

(assert (not b!1541377))

(check-sat)

(pop 1)

(push 1)

(check-sat)

