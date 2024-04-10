; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130636 () Bool)

(assert start!130636)

(declare-fun b!1532617 () Bool)

(declare-fun res!1049721 () Bool)

(declare-fun e!853923 () Bool)

(assert (=> b!1532617 (=> (not res!1049721) (not e!853923))))

(declare-datatypes ((array!101767 0))(
  ( (array!101768 (arr!49101 (Array (_ BitVec 32) (_ BitVec 64))) (size!49651 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101767)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1532617 (= res!1049721 (validKeyInArray!0 (select (arr!49101 a!2792) j!64)))))

(declare-fun b!1532618 () Bool)

(declare-fun res!1049725 () Bool)

(assert (=> b!1532618 (=> (not res!1049725) (not e!853923))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101767 (_ BitVec 32)) Bool)

(assert (=> b!1532618 (= res!1049725 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1532619 () Bool)

(declare-fun e!853922 () Bool)

(declare-datatypes ((List!35575 0))(
  ( (Nil!35572) (Cons!35571 (h!37016 (_ BitVec 64)) (t!50269 List!35575)) )
))
(declare-fun contains!10008 (List!35575 (_ BitVec 64)) Bool)

(assert (=> b!1532619 (= e!853922 (contains!10008 Nil!35572 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1532620 () Bool)

(declare-fun res!1049728 () Bool)

(assert (=> b!1532620 (=> (not res!1049728) (not e!853923))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1532620 (= res!1049728 (and (= (size!49651 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49651 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49651 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1532621 () Bool)

(declare-fun res!1049726 () Bool)

(assert (=> b!1532621 (=> (not res!1049726) (not e!853923))))

(assert (=> b!1532621 (= res!1049726 (and (bvsle #b00000000000000000000000000000000 (size!49651 a!2792)) (bvslt (size!49651 a!2792) #b01111111111111111111111111111111)))))

(declare-fun res!1049724 () Bool)

(assert (=> start!130636 (=> (not res!1049724) (not e!853923))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130636 (= res!1049724 (validMask!0 mask!2480))))

(assert (=> start!130636 e!853923))

(assert (=> start!130636 true))

(declare-fun array_inv!38129 (array!101767) Bool)

(assert (=> start!130636 (array_inv!38129 a!2792)))

(declare-fun b!1532622 () Bool)

(declare-fun res!1049723 () Bool)

(assert (=> b!1532622 (=> (not res!1049723) (not e!853923))))

(declare-fun noDuplicate!2634 (List!35575) Bool)

(assert (=> b!1532622 (= res!1049723 (noDuplicate!2634 Nil!35572))))

(declare-fun b!1532623 () Bool)

(declare-fun res!1049722 () Bool)

(assert (=> b!1532623 (=> (not res!1049722) (not e!853923))))

(assert (=> b!1532623 (= res!1049722 (validKeyInArray!0 (select (arr!49101 a!2792) i!951)))))

(declare-fun b!1532624 () Bool)

(assert (=> b!1532624 (= e!853923 e!853922)))

(declare-fun res!1049727 () Bool)

(assert (=> b!1532624 (=> res!1049727 e!853922)))

(assert (=> b!1532624 (= res!1049727 (contains!10008 Nil!35572 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!130636 res!1049724) b!1532620))

(assert (= (and b!1532620 res!1049728) b!1532623))

(assert (= (and b!1532623 res!1049722) b!1532617))

(assert (= (and b!1532617 res!1049721) b!1532618))

(assert (= (and b!1532618 res!1049725) b!1532621))

(assert (= (and b!1532621 res!1049726) b!1532622))

(assert (= (and b!1532622 res!1049723) b!1532624))

(assert (= (and b!1532624 (not res!1049727)) b!1532619))

(declare-fun m!1415321 () Bool)

(assert (=> b!1532622 m!1415321))

(declare-fun m!1415323 () Bool)

(assert (=> start!130636 m!1415323))

(declare-fun m!1415325 () Bool)

(assert (=> start!130636 m!1415325))

(declare-fun m!1415327 () Bool)

(assert (=> b!1532624 m!1415327))

(declare-fun m!1415329 () Bool)

(assert (=> b!1532623 m!1415329))

(assert (=> b!1532623 m!1415329))

(declare-fun m!1415331 () Bool)

(assert (=> b!1532623 m!1415331))

(declare-fun m!1415333 () Bool)

(assert (=> b!1532617 m!1415333))

(assert (=> b!1532617 m!1415333))

(declare-fun m!1415335 () Bool)

(assert (=> b!1532617 m!1415335))

(declare-fun m!1415337 () Bool)

(assert (=> b!1532618 m!1415337))

(declare-fun m!1415339 () Bool)

(assert (=> b!1532619 m!1415339))

(check-sat (not b!1532618) (not b!1532624) (not b!1532619) (not b!1532622) (not b!1532623) (not start!130636) (not b!1532617))
(check-sat)
(get-model)

(declare-fun d!160113 () Bool)

(assert (=> d!160113 (= (validMask!0 mask!2480) (and (or (= mask!2480 #b00000000000000000000000000000111) (= mask!2480 #b00000000000000000000000000001111) (= mask!2480 #b00000000000000000000000000011111) (= mask!2480 #b00000000000000000000000000111111) (= mask!2480 #b00000000000000000000000001111111) (= mask!2480 #b00000000000000000000000011111111) (= mask!2480 #b00000000000000000000000111111111) (= mask!2480 #b00000000000000000000001111111111) (= mask!2480 #b00000000000000000000011111111111) (= mask!2480 #b00000000000000000000111111111111) (= mask!2480 #b00000000000000000001111111111111) (= mask!2480 #b00000000000000000011111111111111) (= mask!2480 #b00000000000000000111111111111111) (= mask!2480 #b00000000000000001111111111111111) (= mask!2480 #b00000000000000011111111111111111) (= mask!2480 #b00000000000000111111111111111111) (= mask!2480 #b00000000000001111111111111111111) (= mask!2480 #b00000000000011111111111111111111) (= mask!2480 #b00000000000111111111111111111111) (= mask!2480 #b00000000001111111111111111111111) (= mask!2480 #b00000000011111111111111111111111) (= mask!2480 #b00000000111111111111111111111111) (= mask!2480 #b00000001111111111111111111111111) (= mask!2480 #b00000011111111111111111111111111) (= mask!2480 #b00000111111111111111111111111111) (= mask!2480 #b00001111111111111111111111111111) (= mask!2480 #b00011111111111111111111111111111) (= mask!2480 #b00111111111111111111111111111111)) (bvsle mask!2480 #b00111111111111111111111111111111)))))

(assert (=> start!130636 d!160113))

(declare-fun d!160119 () Bool)

(assert (=> d!160119 (= (array_inv!38129 a!2792) (bvsge (size!49651 a!2792) #b00000000000000000000000000000000))))

(assert (=> start!130636 d!160119))

(declare-fun d!160121 () Bool)

(declare-fun res!1049769 () Bool)

(declare-fun e!853950 () Bool)

(assert (=> d!160121 (=> res!1049769 e!853950)))

(get-info :version)

(assert (=> d!160121 (= res!1049769 ((_ is Nil!35572) Nil!35572))))

(assert (=> d!160121 (= (noDuplicate!2634 Nil!35572) e!853950)))

(declare-fun b!1532665 () Bool)

(declare-fun e!853951 () Bool)

(assert (=> b!1532665 (= e!853950 e!853951)))

(declare-fun res!1049770 () Bool)

(assert (=> b!1532665 (=> (not res!1049770) (not e!853951))))

(assert (=> b!1532665 (= res!1049770 (not (contains!10008 (t!50269 Nil!35572) (h!37016 Nil!35572))))))

(declare-fun b!1532666 () Bool)

(assert (=> b!1532666 (= e!853951 (noDuplicate!2634 (t!50269 Nil!35572)))))

(assert (= (and d!160121 (not res!1049769)) b!1532665))

(assert (= (and b!1532665 res!1049770) b!1532666))

(declare-fun m!1415367 () Bool)

(assert (=> b!1532665 m!1415367))

(declare-fun m!1415371 () Bool)

(assert (=> b!1532666 m!1415371))

(assert (=> b!1532622 d!160121))

(declare-fun d!160131 () Bool)

(assert (=> d!160131 (= (validKeyInArray!0 (select (arr!49101 a!2792) j!64)) (and (not (= (select (arr!49101 a!2792) j!64) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!49101 a!2792) j!64) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1532617 d!160131))

(declare-fun d!160133 () Bool)

(assert (=> d!160133 (= (validKeyInArray!0 (select (arr!49101 a!2792) i!951)) (and (not (= (select (arr!49101 a!2792) i!951) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!49101 a!2792) i!951) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1532623 d!160133))

(declare-fun b!1532681 () Bool)

(declare-fun e!853964 () Bool)

(declare-fun call!68574 () Bool)

(assert (=> b!1532681 (= e!853964 call!68574)))

(declare-fun bm!68571 () Bool)

(assert (=> bm!68571 (= call!68574 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2792 mask!2480))))

(declare-fun d!160135 () Bool)

(declare-fun res!1049782 () Bool)

(declare-fun e!853966 () Bool)

(assert (=> d!160135 (=> res!1049782 e!853966)))

(assert (=> d!160135 (= res!1049782 (bvsge #b00000000000000000000000000000000 (size!49651 a!2792)))))

(assert (=> d!160135 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480) e!853966)))

(declare-fun b!1532682 () Bool)

(declare-fun e!853965 () Bool)

(assert (=> b!1532682 (= e!853966 e!853965)))

(declare-fun c!141008 () Bool)

(assert (=> b!1532682 (= c!141008 (validKeyInArray!0 (select (arr!49101 a!2792) #b00000000000000000000000000000000)))))

(declare-fun b!1532683 () Bool)

(assert (=> b!1532683 (= e!853965 call!68574)))

(declare-fun b!1532684 () Bool)

(assert (=> b!1532684 (= e!853965 e!853964)))

(declare-fun lt!663706 () (_ BitVec 64))

(assert (=> b!1532684 (= lt!663706 (select (arr!49101 a!2792) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!51302 0))(
  ( (Unit!51303) )
))
(declare-fun lt!663704 () Unit!51302)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!101767 (_ BitVec 64) (_ BitVec 32)) Unit!51302)

(assert (=> b!1532684 (= lt!663704 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2792 lt!663706 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!101767 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1532684 (arrayContainsKey!0 a!2792 lt!663706 #b00000000000000000000000000000000)))

(declare-fun lt!663705 () Unit!51302)

(assert (=> b!1532684 (= lt!663705 lt!663704)))

(declare-fun res!1049781 () Bool)

(declare-datatypes ((SeekEntryResult!13257 0))(
  ( (MissingZero!13257 (index!55423 (_ BitVec 32))) (Found!13257 (index!55424 (_ BitVec 32))) (Intermediate!13257 (undefined!14069 Bool) (index!55425 (_ BitVec 32)) (x!137139 (_ BitVec 32))) (Undefined!13257) (MissingVacant!13257 (index!55426 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101767 (_ BitVec 32)) SeekEntryResult!13257)

(assert (=> b!1532684 (= res!1049781 (= (seekEntryOrOpen!0 (select (arr!49101 a!2792) #b00000000000000000000000000000000) a!2792 mask!2480) (Found!13257 #b00000000000000000000000000000000)))))

(assert (=> b!1532684 (=> (not res!1049781) (not e!853964))))

(assert (= (and d!160135 (not res!1049782)) b!1532682))

(assert (= (and b!1532682 c!141008) b!1532684))

(assert (= (and b!1532682 (not c!141008)) b!1532683))

(assert (= (and b!1532684 res!1049781) b!1532681))

(assert (= (or b!1532681 b!1532683) bm!68571))

(declare-fun m!1415381 () Bool)

(assert (=> bm!68571 m!1415381))

(declare-fun m!1415383 () Bool)

(assert (=> b!1532682 m!1415383))

(assert (=> b!1532682 m!1415383))

(declare-fun m!1415385 () Bool)

(assert (=> b!1532682 m!1415385))

(assert (=> b!1532684 m!1415383))

(declare-fun m!1415387 () Bool)

(assert (=> b!1532684 m!1415387))

(declare-fun m!1415389 () Bool)

(assert (=> b!1532684 m!1415389))

(assert (=> b!1532684 m!1415383))

(declare-fun m!1415391 () Bool)

(assert (=> b!1532684 m!1415391))

(assert (=> b!1532618 d!160135))

(declare-fun d!160143 () Bool)

(declare-fun lt!663719 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!792 (List!35575) (InoxSet (_ BitVec 64)))

(assert (=> d!160143 (= lt!663719 (select (content!792 Nil!35572) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!853983 () Bool)

(assert (=> d!160143 (= lt!663719 e!853983)))

(declare-fun res!1049796 () Bool)

(assert (=> d!160143 (=> (not res!1049796) (not e!853983))))

(assert (=> d!160143 (= res!1049796 ((_ is Cons!35571) Nil!35572))))

(assert (=> d!160143 (= (contains!10008 Nil!35572 #b0000000000000000000000000000000000000000000000000000000000000000) lt!663719)))

(declare-fun b!1532703 () Bool)

(declare-fun e!853982 () Bool)

(assert (=> b!1532703 (= e!853983 e!853982)))

(declare-fun res!1049795 () Bool)

(assert (=> b!1532703 (=> res!1049795 e!853982)))

(assert (=> b!1532703 (= res!1049795 (= (h!37016 Nil!35572) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1532704 () Bool)

(assert (=> b!1532704 (= e!853982 (contains!10008 (t!50269 Nil!35572) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!160143 res!1049796) b!1532703))

(assert (= (and b!1532703 (not res!1049795)) b!1532704))

(declare-fun m!1415407 () Bool)

(assert (=> d!160143 m!1415407))

(declare-fun m!1415411 () Bool)

(assert (=> d!160143 m!1415411))

(declare-fun m!1415413 () Bool)

(assert (=> b!1532704 m!1415413))

(assert (=> b!1532624 d!160143))

(declare-fun d!160157 () Bool)

(declare-fun lt!663721 () Bool)

(assert (=> d!160157 (= lt!663721 (select (content!792 Nil!35572) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!853991 () Bool)

(assert (=> d!160157 (= lt!663721 e!853991)))

(declare-fun res!1049804 () Bool)

(assert (=> d!160157 (=> (not res!1049804) (not e!853991))))

(assert (=> d!160157 (= res!1049804 ((_ is Cons!35571) Nil!35572))))

(assert (=> d!160157 (= (contains!10008 Nil!35572 #b1000000000000000000000000000000000000000000000000000000000000000) lt!663721)))

(declare-fun b!1532711 () Bool)

(declare-fun e!853990 () Bool)

(assert (=> b!1532711 (= e!853991 e!853990)))

(declare-fun res!1049803 () Bool)

(assert (=> b!1532711 (=> res!1049803 e!853990)))

(assert (=> b!1532711 (= res!1049803 (= (h!37016 Nil!35572) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1532712 () Bool)

(assert (=> b!1532712 (= e!853990 (contains!10008 (t!50269 Nil!35572) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!160157 res!1049804) b!1532711))

(assert (= (and b!1532711 (not res!1049803)) b!1532712))

(assert (=> d!160157 m!1415407))

(declare-fun m!1415419 () Bool)

(assert (=> d!160157 m!1415419))

(declare-fun m!1415421 () Bool)

(assert (=> b!1532712 m!1415421))

(assert (=> b!1532619 d!160157))

(check-sat (not b!1532712) (not b!1532704) (not d!160157) (not b!1532666) (not b!1532665) (not b!1532682) (not d!160143) (not b!1532684) (not bm!68571))
(check-sat)
