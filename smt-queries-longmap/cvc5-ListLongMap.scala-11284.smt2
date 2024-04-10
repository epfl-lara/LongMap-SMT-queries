; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131546 () Bool)

(assert start!131546)

(declare-fun res!1057870 () Bool)

(declare-fun e!857256 () Bool)

(assert (=> start!131546 (=> (not res!1057870) (not e!857256))))

(declare-fun mask!4052 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131546 (= res!1057870 (validMask!0 mask!4052))))

(assert (=> start!131546 e!857256))

(assert (=> start!131546 true))

(declare-datatypes ((array!102449 0))(
  ( (array!102450 (arr!49433 (Array (_ BitVec 32) (_ BitVec 64))) (size!49983 (_ BitVec 32))) )
))
(declare-fun a!3920 () array!102449)

(declare-fun array_inv!38461 (array!102449) Bool)

(assert (=> start!131546 (array_inv!38461 a!3920)))

(declare-fun b!1541321 () Bool)

(declare-fun res!1057869 () Bool)

(assert (=> b!1541321 (=> (not res!1057869) (not e!857256))))

(declare-fun newFrom!293 () (_ BitVec 32))

(declare-fun from!3298 () (_ BitVec 32))

(assert (=> b!1541321 (= res!1057869 (and (= (size!49983 a!3920) (bvadd #b00000000000000000000000000000001 mask!4052)) (bvsge from!3298 #b00000000000000000000000000000000) (bvsle from!3298 (size!49983 a!3920)) (bvsge newFrom!293 from!3298) (bvsle newFrom!293 (size!49983 a!3920))))))

(declare-fun b!1541324 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102449 (_ BitVec 32)) Bool)

(assert (=> b!1541324 (= e!857256 (not (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 from!3298) a!3920 mask!4052)))))

(declare-fun b!1541323 () Bool)

(declare-fun res!1057867 () Bool)

(assert (=> b!1541323 (=> (not res!1057867) (not e!857256))))

(assert (=> b!1541323 (= res!1057867 (and (bvslt from!3298 newFrom!293) (bvsge (bvadd #b00000000000000000000000000000001 from!3298) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!3298) (size!49983 a!3920))))))

(declare-fun b!1541322 () Bool)

(declare-fun res!1057868 () Bool)

(assert (=> b!1541322 (=> (not res!1057868) (not e!857256))))

(assert (=> b!1541322 (= res!1057868 (arrayForallSeekEntryOrOpenFound!0 from!3298 a!3920 mask!4052))))

(assert (= (and start!131546 res!1057870) b!1541321))

(assert (= (and b!1541321 res!1057869) b!1541322))

(assert (= (and b!1541322 res!1057868) b!1541323))

(assert (= (and b!1541323 res!1057867) b!1541324))

(declare-fun m!1423317 () Bool)

(assert (=> start!131546 m!1423317))

(declare-fun m!1423319 () Bool)

(assert (=> start!131546 m!1423319))

(declare-fun m!1423321 () Bool)

(assert (=> b!1541324 m!1423321))

(declare-fun m!1423323 () Bool)

(assert (=> b!1541322 m!1423323))

(push 1)

(assert (not b!1541322))

(assert (not start!131546))

(assert (not b!1541324))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1541357 () Bool)

(declare-fun e!857278 () Bool)

(declare-fun e!857277 () Bool)

(assert (=> b!1541357 (= e!857278 e!857277)))

(declare-fun lt!665658 () (_ BitVec 64))

(assert (=> b!1541357 (= lt!665658 (select (arr!49433 a!3920) from!3298))))

(declare-datatypes ((Unit!51476 0))(
  ( (Unit!51477) )
))
(declare-fun lt!665657 () Unit!51476)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!102449 (_ BitVec 64) (_ BitVec 32)) Unit!51476)

(assert (=> b!1541357 (= lt!665657 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3920 lt!665658 from!3298))))

(declare-fun arrayContainsKey!0 (array!102449 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1541357 (arrayContainsKey!0 a!3920 lt!665658 #b00000000000000000000000000000000)))

(declare-fun lt!665659 () Unit!51476)

(assert (=> b!1541357 (= lt!665659 lt!665657)))

(declare-fun res!1057900 () Bool)

(declare-datatypes ((SeekEntryResult!13506 0))(
  ( (MissingZero!13506 (index!56422 (_ BitVec 32))) (Found!13506 (index!56423 (_ BitVec 32))) (Intermediate!13506 (undefined!14318 Bool) (index!56424 (_ BitVec 32)) (x!138306 (_ BitVec 32))) (Undefined!13506) (MissingVacant!13506 (index!56425 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!102449 (_ BitVec 32)) SeekEntryResult!13506)

(assert (=> b!1541357 (= res!1057900 (= (seekEntryOrOpen!0 (select (arr!49433 a!3920) from!3298) a!3920 mask!4052) (Found!13506 from!3298)))))

(assert (=> b!1541357 (=> (not res!1057900) (not e!857277))))

(declare-fun b!1541358 () Bool)

(declare-fun call!68673 () Bool)

(assert (=> b!1541358 (= e!857278 call!68673)))

(declare-fun b!1541359 () Bool)

(declare-fun e!857276 () Bool)

(assert (=> b!1541359 (= e!857276 e!857278)))

(declare-fun c!141287 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1541359 (= c!141287 (validKeyInArray!0 (select (arr!49433 a!3920) from!3298)))))

(declare-fun d!160655 () Bool)

(declare-fun res!1057899 () Bool)

(assert (=> d!160655 (=> res!1057899 e!857276)))

(assert (=> d!160655 (= res!1057899 (bvsge from!3298 (size!49983 a!3920)))))

(assert (=> d!160655 (= (arrayForallSeekEntryOrOpenFound!0 from!3298 a!3920 mask!4052) e!857276)))

(declare-fun b!1541360 () Bool)

(assert (=> b!1541360 (= e!857277 call!68673)))

(declare-fun bm!68670 () Bool)

(assert (=> bm!68670 (= call!68673 (arrayForallSeekEntryOrOpenFound!0 (bvadd from!3298 #b00000000000000000000000000000001) a!3920 mask!4052))))

(assert (= (and d!160655 (not res!1057899)) b!1541359))

(assert (= (and b!1541359 c!141287) b!1541357))

(assert (= (and b!1541359 (not c!141287)) b!1541358))

(assert (= (and b!1541357 res!1057900) b!1541360))

(assert (= (or b!1541360 b!1541358) bm!68670))

(declare-fun m!1423341 () Bool)

(assert (=> b!1541357 m!1423341))

(declare-fun m!1423343 () Bool)

(assert (=> b!1541357 m!1423343))

(declare-fun m!1423345 () Bool)

(assert (=> b!1541357 m!1423345))

(assert (=> b!1541357 m!1423341))

(declare-fun m!1423347 () Bool)

(assert (=> b!1541357 m!1423347))

(assert (=> b!1541359 m!1423341))

(assert (=> b!1541359 m!1423341))

(declare-fun m!1423349 () Bool)

(assert (=> b!1541359 m!1423349))

(declare-fun m!1423351 () Bool)

(assert (=> bm!68670 m!1423351))

(assert (=> b!1541322 d!160655))

(declare-fun d!160663 () Bool)

(assert (=> d!160663 (= (validMask!0 mask!4052) (and (or (= mask!4052 #b00000000000000000000000000000111) (= mask!4052 #b00000000000000000000000000001111) (= mask!4052 #b00000000000000000000000000011111) (= mask!4052 #b00000000000000000000000000111111) (= mask!4052 #b00000000000000000000000001111111) (= mask!4052 #b00000000000000000000000011111111) (= mask!4052 #b00000000000000000000000111111111) (= mask!4052 #b00000000000000000000001111111111) (= mask!4052 #b00000000000000000000011111111111) (= mask!4052 #b00000000000000000000111111111111) (= mask!4052 #b00000000000000000001111111111111) (= mask!4052 #b00000000000000000011111111111111) (= mask!4052 #b00000000000000000111111111111111) (= mask!4052 #b00000000000000001111111111111111) (= mask!4052 #b00000000000000011111111111111111) (= mask!4052 #b00000000000000111111111111111111) (= mask!4052 #b00000000000001111111111111111111) (= mask!4052 #b00000000000011111111111111111111) (= mask!4052 #b00000000000111111111111111111111) (= mask!4052 #b00000000001111111111111111111111) (= mask!4052 #b00000000011111111111111111111111) (= mask!4052 #b00000000111111111111111111111111) (= mask!4052 #b00000001111111111111111111111111) (= mask!4052 #b00000011111111111111111111111111) (= mask!4052 #b00000111111111111111111111111111) (= mask!4052 #b00001111111111111111111111111111) (= mask!4052 #b00011111111111111111111111111111) (= mask!4052 #b00111111111111111111111111111111)) (bvsle mask!4052 #b00111111111111111111111111111111)))))

(assert (=> start!131546 d!160663))

(declare-fun d!160669 () Bool)

(assert (=> d!160669 (= (array_inv!38461 a!3920) (bvsge (size!49983 a!3920) #b00000000000000000000000000000000))))

(assert (=> start!131546 d!160669))

(declare-fun b!1541389 () Bool)

(declare-fun e!857302 () Bool)

(declare-fun e!857301 () Bool)

(assert (=> b!1541389 (= e!857302 e!857301)))

(declare-fun lt!665682 () (_ BitVec 64))

(assert (=> b!1541389 (= lt!665682 (select (arr!49433 a!3920) (bvadd #b00000000000000000000000000000001 from!3298)))))

(declare-fun lt!665681 () Unit!51476)

(assert (=> b!1541389 (= lt!665681 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3920 lt!665682 (bvadd #b00000000000000000000000000000001 from!3298)))))

(assert (=> b!1541389 (arrayContainsKey!0 a!3920 lt!665682 #b00000000000000000000000000000000)))

(declare-fun lt!665683 () Unit!51476)

(assert (=> b!1541389 (= lt!665683 lt!665681)))

(declare-fun res!1057916 () Bool)

(assert (=> b!1541389 (= res!1057916 (= (seekEntryOrOpen!0 (select (arr!49433 a!3920) (bvadd #b00000000000000000000000000000001 from!3298)) a!3920 mask!4052) (Found!13506 (bvadd #b00000000000000000000000000000001 from!3298))))))

(assert (=> b!1541389 (=> (not res!1057916) (not e!857301))))

(declare-fun b!1541390 () Bool)

(declare-fun call!68681 () Bool)

(assert (=> b!1541390 (= e!857302 call!68681)))

(declare-fun b!1541391 () Bool)

(declare-fun e!857300 () Bool)

(assert (=> b!1541391 (= e!857300 e!857302)))

(declare-fun c!141295 () Bool)

(assert (=> b!1541391 (= c!141295 (validKeyInArray!0 (select (arr!49433 a!3920) (bvadd #b00000000000000000000000000000001 from!3298))))))

(declare-fun d!160671 () Bool)

(declare-fun res!1057915 () Bool)

(assert (=> d!160671 (=> res!1057915 e!857300)))

(assert (=> d!160671 (= res!1057915 (bvsge (bvadd #b00000000000000000000000000000001 from!3298) (size!49983 a!3920)))))

(assert (=> d!160671 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 from!3298) a!3920 mask!4052) e!857300)))

(declare-fun b!1541392 () Bool)

(assert (=> b!1541392 (= e!857301 call!68681)))

(declare-fun bm!68678 () Bool)

(assert (=> bm!68678 (= call!68681 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 from!3298 #b00000000000000000000000000000001) a!3920 mask!4052))))

(assert (= (and d!160671 (not res!1057915)) b!1541391))

(assert (= (and b!1541391 c!141295) b!1541389))

(assert (= (and b!1541391 (not c!141295)) b!1541390))

(assert (= (and b!1541389 res!1057916) b!1541392))

(assert (= (or b!1541392 b!1541390) bm!68678))

(declare-fun m!1423389 () Bool)

(assert (=> b!1541389 m!1423389))

(declare-fun m!1423391 () Bool)

(assert (=> b!1541389 m!1423391))

(declare-fun m!1423393 () Bool)

(assert (=> b!1541389 m!1423393))

(assert (=> b!1541389 m!1423389))

(declare-fun m!1423395 () Bool)

(assert (=> b!1541389 m!1423395))

(assert (=> b!1541391 m!1423389))

(assert (=> b!1541391 m!1423389))

(declare-fun m!1423397 () Bool)

(assert (=> b!1541391 m!1423397))

(declare-fun m!1423399 () Bool)

(assert (=> bm!68678 m!1423399))

(assert (=> b!1541324 d!160671))

(push 1)

(assert (not b!1541389))

(assert (not b!1541357))

(assert (not bm!68678))

(assert (not b!1541359))

(assert (not bm!68670))

(assert (not b!1541391))

(check-sat)

(pop 1)

(push 1)

(check-sat)

