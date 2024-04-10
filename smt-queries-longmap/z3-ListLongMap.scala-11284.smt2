; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131548 () Bool)

(assert start!131548)

(declare-datatypes ((array!102451 0))(
  ( (array!102452 (arr!49434 (Array (_ BitVec 32) (_ BitVec 64))) (size!49984 (_ BitVec 32))) )
))
(declare-fun a!3920 () array!102451)

(declare-fun from!3298 () (_ BitVec 32))

(declare-fun b!1541336 () Bool)

(declare-fun e!857262 () Bool)

(declare-fun mask!4052 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102451 (_ BitVec 32)) Bool)

(assert (=> b!1541336 (= e!857262 (not (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 from!3298) a!3920 mask!4052)))))

(declare-fun b!1541334 () Bool)

(declare-fun res!1057881 () Bool)

(assert (=> b!1541334 (=> (not res!1057881) (not e!857262))))

(assert (=> b!1541334 (= res!1057881 (arrayForallSeekEntryOrOpenFound!0 from!3298 a!3920 mask!4052))))

(declare-fun b!1541335 () Bool)

(declare-fun res!1057880 () Bool)

(assert (=> b!1541335 (=> (not res!1057880) (not e!857262))))

(declare-fun newFrom!293 () (_ BitVec 32))

(assert (=> b!1541335 (= res!1057880 (and (bvslt from!3298 newFrom!293) (bvsge (bvadd #b00000000000000000000000000000001 from!3298) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!3298) (size!49984 a!3920))))))

(declare-fun res!1057879 () Bool)

(assert (=> start!131548 (=> (not res!1057879) (not e!857262))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131548 (= res!1057879 (validMask!0 mask!4052))))

(assert (=> start!131548 e!857262))

(assert (=> start!131548 true))

(declare-fun array_inv!38462 (array!102451) Bool)

(assert (=> start!131548 (array_inv!38462 a!3920)))

(declare-fun b!1541333 () Bool)

(declare-fun res!1057882 () Bool)

(assert (=> b!1541333 (=> (not res!1057882) (not e!857262))))

(assert (=> b!1541333 (= res!1057882 (and (= (size!49984 a!3920) (bvadd #b00000000000000000000000000000001 mask!4052)) (bvsge from!3298 #b00000000000000000000000000000000) (bvsle from!3298 (size!49984 a!3920)) (bvsge newFrom!293 from!3298) (bvsle newFrom!293 (size!49984 a!3920))))))

(assert (= (and start!131548 res!1057879) b!1541333))

(assert (= (and b!1541333 res!1057882) b!1541334))

(assert (= (and b!1541334 res!1057881) b!1541335))

(assert (= (and b!1541335 res!1057880) b!1541336))

(declare-fun m!1423325 () Bool)

(assert (=> b!1541336 m!1423325))

(declare-fun m!1423327 () Bool)

(assert (=> b!1541334 m!1423327))

(declare-fun m!1423329 () Bool)

(assert (=> start!131548 m!1423329))

(declare-fun m!1423331 () Bool)

(assert (=> start!131548 m!1423331))

(check-sat (not start!131548) (not b!1541336) (not b!1541334))
(check-sat)
(get-model)

(declare-fun d!160653 () Bool)

(assert (=> d!160653 (= (validMask!0 mask!4052) (and (or (= mask!4052 #b00000000000000000000000000000111) (= mask!4052 #b00000000000000000000000000001111) (= mask!4052 #b00000000000000000000000000011111) (= mask!4052 #b00000000000000000000000000111111) (= mask!4052 #b00000000000000000000000001111111) (= mask!4052 #b00000000000000000000000011111111) (= mask!4052 #b00000000000000000000000111111111) (= mask!4052 #b00000000000000000000001111111111) (= mask!4052 #b00000000000000000000011111111111) (= mask!4052 #b00000000000000000000111111111111) (= mask!4052 #b00000000000000000001111111111111) (= mask!4052 #b00000000000000000011111111111111) (= mask!4052 #b00000000000000000111111111111111) (= mask!4052 #b00000000000000001111111111111111) (= mask!4052 #b00000000000000011111111111111111) (= mask!4052 #b00000000000000111111111111111111) (= mask!4052 #b00000000000001111111111111111111) (= mask!4052 #b00000000000011111111111111111111) (= mask!4052 #b00000000000111111111111111111111) (= mask!4052 #b00000000001111111111111111111111) (= mask!4052 #b00000000011111111111111111111111) (= mask!4052 #b00000000111111111111111111111111) (= mask!4052 #b00000001111111111111111111111111) (= mask!4052 #b00000011111111111111111111111111) (= mask!4052 #b00000111111111111111111111111111) (= mask!4052 #b00001111111111111111111111111111) (= mask!4052 #b00011111111111111111111111111111) (= mask!4052 #b00111111111111111111111111111111)) (bvsle mask!4052 #b00111111111111111111111111111111)))))

(assert (=> start!131548 d!160653))

(declare-fun d!160657 () Bool)

(assert (=> d!160657 (= (array_inv!38462 a!3920) (bvsge (size!49984 a!3920) #b00000000000000000000000000000000))))

(assert (=> start!131548 d!160657))

(declare-fun b!1541381 () Bool)

(declare-fun e!857294 () Bool)

(declare-fun call!68679 () Bool)

(assert (=> b!1541381 (= e!857294 call!68679)))

(declare-fun b!1541383 () Bool)

(declare-fun e!857295 () Bool)

(declare-fun e!857296 () Bool)

(assert (=> b!1541383 (= e!857295 e!857296)))

(declare-fun c!141293 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1541383 (= c!141293 (validKeyInArray!0 (select (arr!49434 a!3920) (bvadd #b00000000000000000000000000000001 from!3298))))))

(declare-fun bm!68676 () Bool)

(assert (=> bm!68676 (= call!68679 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 from!3298 #b00000000000000000000000000000001) a!3920 mask!4052))))

(declare-fun b!1541384 () Bool)

(assert (=> b!1541384 (= e!857296 call!68679)))

(declare-fun d!160661 () Bool)

(declare-fun res!1057911 () Bool)

(assert (=> d!160661 (=> res!1057911 e!857295)))

(assert (=> d!160661 (= res!1057911 (bvsge (bvadd #b00000000000000000000000000000001 from!3298) (size!49984 a!3920)))))

(assert (=> d!160661 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 from!3298) a!3920 mask!4052) e!857295)))

(declare-fun b!1541382 () Bool)

(assert (=> b!1541382 (= e!857296 e!857294)))

(declare-fun lt!665675 () (_ BitVec 64))

(assert (=> b!1541382 (= lt!665675 (select (arr!49434 a!3920) (bvadd #b00000000000000000000000000000001 from!3298)))))

(declare-datatypes ((Unit!51474 0))(
  ( (Unit!51475) )
))
(declare-fun lt!665676 () Unit!51474)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!102451 (_ BitVec 64) (_ BitVec 32)) Unit!51474)

(assert (=> b!1541382 (= lt!665676 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3920 lt!665675 (bvadd #b00000000000000000000000000000001 from!3298)))))

(declare-fun arrayContainsKey!0 (array!102451 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1541382 (arrayContainsKey!0 a!3920 lt!665675 #b00000000000000000000000000000000)))

(declare-fun lt!665677 () Unit!51474)

(assert (=> b!1541382 (= lt!665677 lt!665676)))

(declare-fun res!1057912 () Bool)

(declare-datatypes ((SeekEntryResult!13505 0))(
  ( (MissingZero!13505 (index!56418 (_ BitVec 32))) (Found!13505 (index!56419 (_ BitVec 32))) (Intermediate!13505 (undefined!14317 Bool) (index!56420 (_ BitVec 32)) (x!138305 (_ BitVec 32))) (Undefined!13505) (MissingVacant!13505 (index!56421 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!102451 (_ BitVec 32)) SeekEntryResult!13505)

(assert (=> b!1541382 (= res!1057912 (= (seekEntryOrOpen!0 (select (arr!49434 a!3920) (bvadd #b00000000000000000000000000000001 from!3298)) a!3920 mask!4052) (Found!13505 (bvadd #b00000000000000000000000000000001 from!3298))))))

(assert (=> b!1541382 (=> (not res!1057912) (not e!857294))))

(assert (= (and d!160661 (not res!1057911)) b!1541383))

(assert (= (and b!1541383 c!141293) b!1541382))

(assert (= (and b!1541383 (not c!141293)) b!1541384))

(assert (= (and b!1541382 res!1057912) b!1541381))

(assert (= (or b!1541381 b!1541384) bm!68676))

(declare-fun m!1423361 () Bool)

(assert (=> b!1541383 m!1423361))

(assert (=> b!1541383 m!1423361))

(declare-fun m!1423367 () Bool)

(assert (=> b!1541383 m!1423367))

(declare-fun m!1423369 () Bool)

(assert (=> bm!68676 m!1423369))

(assert (=> b!1541382 m!1423361))

(declare-fun m!1423371 () Bool)

(assert (=> b!1541382 m!1423371))

(declare-fun m!1423373 () Bool)

(assert (=> b!1541382 m!1423373))

(assert (=> b!1541382 m!1423361))

(declare-fun m!1423375 () Bool)

(assert (=> b!1541382 m!1423375))

(assert (=> b!1541336 d!160661))

(declare-fun b!1541385 () Bool)

(declare-fun e!857297 () Bool)

(declare-fun call!68680 () Bool)

(assert (=> b!1541385 (= e!857297 call!68680)))

(declare-fun b!1541387 () Bool)

(declare-fun e!857298 () Bool)

(declare-fun e!857299 () Bool)

(assert (=> b!1541387 (= e!857298 e!857299)))

(declare-fun c!141294 () Bool)

(assert (=> b!1541387 (= c!141294 (validKeyInArray!0 (select (arr!49434 a!3920) from!3298)))))

(declare-fun bm!68677 () Bool)

(assert (=> bm!68677 (= call!68680 (arrayForallSeekEntryOrOpenFound!0 (bvadd from!3298 #b00000000000000000000000000000001) a!3920 mask!4052))))

(declare-fun b!1541388 () Bool)

(assert (=> b!1541388 (= e!857299 call!68680)))

(declare-fun d!160667 () Bool)

(declare-fun res!1057913 () Bool)

(assert (=> d!160667 (=> res!1057913 e!857298)))

(assert (=> d!160667 (= res!1057913 (bvsge from!3298 (size!49984 a!3920)))))

(assert (=> d!160667 (= (arrayForallSeekEntryOrOpenFound!0 from!3298 a!3920 mask!4052) e!857298)))

(declare-fun b!1541386 () Bool)

(assert (=> b!1541386 (= e!857299 e!857297)))

(declare-fun lt!665678 () (_ BitVec 64))

(assert (=> b!1541386 (= lt!665678 (select (arr!49434 a!3920) from!3298))))

(declare-fun lt!665679 () Unit!51474)

(assert (=> b!1541386 (= lt!665679 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3920 lt!665678 from!3298))))

(assert (=> b!1541386 (arrayContainsKey!0 a!3920 lt!665678 #b00000000000000000000000000000000)))

(declare-fun lt!665680 () Unit!51474)

(assert (=> b!1541386 (= lt!665680 lt!665679)))

(declare-fun res!1057914 () Bool)

(assert (=> b!1541386 (= res!1057914 (= (seekEntryOrOpen!0 (select (arr!49434 a!3920) from!3298) a!3920 mask!4052) (Found!13505 from!3298)))))

(assert (=> b!1541386 (=> (not res!1057914) (not e!857297))))

(assert (= (and d!160667 (not res!1057913)) b!1541387))

(assert (= (and b!1541387 c!141294) b!1541386))

(assert (= (and b!1541387 (not c!141294)) b!1541388))

(assert (= (and b!1541386 res!1057914) b!1541385))

(assert (= (or b!1541385 b!1541388) bm!68677))

(declare-fun m!1423377 () Bool)

(assert (=> b!1541387 m!1423377))

(assert (=> b!1541387 m!1423377))

(declare-fun m!1423379 () Bool)

(assert (=> b!1541387 m!1423379))

(declare-fun m!1423381 () Bool)

(assert (=> bm!68677 m!1423381))

(assert (=> b!1541386 m!1423377))

(declare-fun m!1423383 () Bool)

(assert (=> b!1541386 m!1423383))

(declare-fun m!1423385 () Bool)

(assert (=> b!1541386 m!1423385))

(assert (=> b!1541386 m!1423377))

(declare-fun m!1423387 () Bool)

(assert (=> b!1541386 m!1423387))

(assert (=> b!1541334 d!160667))

(check-sat (not bm!68676) (not b!1541382) (not b!1541387) (not bm!68677) (not b!1541383) (not b!1541386))
(check-sat)
