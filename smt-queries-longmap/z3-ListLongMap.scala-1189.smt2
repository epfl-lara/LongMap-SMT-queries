; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25556 () Bool)

(assert start!25556)

(declare-fun b!265236 () Bool)

(declare-fun e!171759 () Bool)

(declare-fun e!171756 () Bool)

(assert (=> b!265236 (= e!171759 e!171756)))

(declare-fun res!129663 () Bool)

(assert (=> b!265236 (=> res!129663 e!171756)))

(declare-datatypes ((List!3826 0))(
  ( (Nil!3823) (Cons!3822 (h!4489 (_ BitVec 64)) (t!8899 List!3826)) )
))
(declare-fun contains!1896 (List!3826 (_ BitVec 64)) Bool)

(assert (=> b!265236 (= res!129663 (contains!1896 Nil!3823 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!265237 () Bool)

(declare-fun e!171757 () Bool)

(assert (=> b!265237 (= e!171757 e!171759)))

(declare-fun res!129660 () Bool)

(assert (=> b!265237 (=> (not res!129660) (not e!171759))))

(declare-datatypes ((SeekEntryResult!1229 0))(
  ( (MissingZero!1229 (index!7086 (_ BitVec 32))) (Found!1229 (index!7087 (_ BitVec 32))) (Intermediate!1229 (undefined!2041 Bool) (index!7088 (_ BitVec 32)) (x!25425 (_ BitVec 32))) (Undefined!1229) (MissingVacant!1229 (index!7089 (_ BitVec 32))) )
))
(declare-fun lt!133905 () SeekEntryResult!1229)

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!265237 (= res!129660 (or (= lt!133905 (MissingZero!1229 i!1355)) (= lt!133905 (MissingVacant!1229 i!1355))))))

(declare-datatypes ((array!12768 0))(
  ( (array!12769 (arr!6039 (Array (_ BitVec 32) (_ BitVec 64))) (size!6392 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12768)

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun k0!2698 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12768 (_ BitVec 32)) SeekEntryResult!1229)

(assert (=> b!265237 (= lt!133905 (seekEntryOrOpen!0 k0!2698 a!3436 mask!4002))))

(declare-fun b!265238 () Bool)

(declare-fun res!129662 () Bool)

(assert (=> b!265238 (=> (not res!129662) (not e!171757))))

(assert (=> b!265238 (= res!129662 (and (= (size!6392 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6392 a!3436))))))

(declare-fun b!265239 () Bool)

(declare-fun res!129659 () Bool)

(assert (=> b!265239 (=> (not res!129659) (not e!171759))))

(declare-fun noDuplicate!109 (List!3826) Bool)

(assert (=> b!265239 (= res!129659 (noDuplicate!109 Nil!3823))))

(declare-fun b!265240 () Bool)

(declare-fun res!129656 () Bool)

(assert (=> b!265240 (=> (not res!129656) (not e!171759))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12768 (_ BitVec 32)) Bool)

(assert (=> b!265240 (= res!129656 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(declare-fun res!129657 () Bool)

(assert (=> start!25556 (=> (not res!129657) (not e!171757))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25556 (= res!129657 (validMask!0 mask!4002))))

(assert (=> start!25556 e!171757))

(assert (=> start!25556 true))

(declare-fun array_inv!4011 (array!12768) Bool)

(assert (=> start!25556 (array_inv!4011 a!3436)))

(declare-fun b!265241 () Bool)

(declare-fun res!129658 () Bool)

(assert (=> b!265241 (=> (not res!129658) (not e!171759))))

(assert (=> b!265241 (= res!129658 (and (bvsle #b00000000000000000000000000000000 (size!6392 a!3436)) (bvslt (size!6392 a!3436) #b01111111111111111111111111111111)))))

(declare-fun b!265242 () Bool)

(declare-fun res!129664 () Bool)

(assert (=> b!265242 (=> (not res!129664) (not e!171757))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!265242 (= res!129664 (validKeyInArray!0 k0!2698))))

(declare-fun b!265243 () Bool)

(assert (=> b!265243 (= e!171756 (contains!1896 Nil!3823 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!265244 () Bool)

(declare-fun res!129661 () Bool)

(assert (=> b!265244 (=> (not res!129661) (not e!171757))))

(declare-fun arrayContainsKey!0 (array!12768 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!265244 (= res!129661 (not (arrayContainsKey!0 a!3436 k0!2698 #b00000000000000000000000000000000)))))

(assert (= (and start!25556 res!129657) b!265238))

(assert (= (and b!265238 res!129662) b!265242))

(assert (= (and b!265242 res!129664) b!265244))

(assert (= (and b!265244 res!129661) b!265237))

(assert (= (and b!265237 res!129660) b!265240))

(assert (= (and b!265240 res!129656) b!265241))

(assert (= (and b!265241 res!129658) b!265239))

(assert (= (and b!265239 res!129659) b!265236))

(assert (= (and b!265236 (not res!129663)) b!265243))

(declare-fun m!281603 () Bool)

(assert (=> b!265243 m!281603))

(declare-fun m!281605 () Bool)

(assert (=> b!265244 m!281605))

(declare-fun m!281607 () Bool)

(assert (=> b!265239 m!281607))

(declare-fun m!281609 () Bool)

(assert (=> start!25556 m!281609))

(declare-fun m!281611 () Bool)

(assert (=> start!25556 m!281611))

(declare-fun m!281613 () Bool)

(assert (=> b!265242 m!281613))

(declare-fun m!281615 () Bool)

(assert (=> b!265237 m!281615))

(declare-fun m!281617 () Bool)

(assert (=> b!265236 m!281617))

(declare-fun m!281619 () Bool)

(assert (=> b!265240 m!281619))

(check-sat (not b!265240) (not b!265243) (not b!265242) (not start!25556) (not b!265237) (not b!265236) (not b!265239) (not b!265244))
(check-sat)
(get-model)

(declare-fun b!265311 () Bool)

(declare-fun e!171794 () Bool)

(declare-fun call!25309 () Bool)

(assert (=> b!265311 (= e!171794 call!25309)))

(declare-fun d!64039 () Bool)

(declare-fun res!129728 () Bool)

(declare-fun e!171796 () Bool)

(assert (=> d!64039 (=> res!129728 e!171796)))

(assert (=> d!64039 (= res!129728 (bvsge #b00000000000000000000000000000000 (size!6392 a!3436)))))

(assert (=> d!64039 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002) e!171796)))

(declare-fun b!265312 () Bool)

(declare-fun e!171795 () Bool)

(assert (=> b!265312 (= e!171794 e!171795)))

(declare-fun lt!133921 () (_ BitVec 64))

(assert (=> b!265312 (= lt!133921 (select (arr!6039 a!3436) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!8219 0))(
  ( (Unit!8220) )
))
(declare-fun lt!133920 () Unit!8219)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!12768 (_ BitVec 64) (_ BitVec 32)) Unit!8219)

(assert (=> b!265312 (= lt!133920 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3436 lt!133921 #b00000000000000000000000000000000))))

(assert (=> b!265312 (arrayContainsKey!0 a!3436 lt!133921 #b00000000000000000000000000000000)))

(declare-fun lt!133922 () Unit!8219)

(assert (=> b!265312 (= lt!133922 lt!133920)))

(declare-fun res!129727 () Bool)

(assert (=> b!265312 (= res!129727 (= (seekEntryOrOpen!0 (select (arr!6039 a!3436) #b00000000000000000000000000000000) a!3436 mask!4002) (Found!1229 #b00000000000000000000000000000000)))))

(assert (=> b!265312 (=> (not res!129727) (not e!171795))))

(declare-fun b!265313 () Bool)

(assert (=> b!265313 (= e!171796 e!171794)))

(declare-fun c!45343 () Bool)

(assert (=> b!265313 (= c!45343 (validKeyInArray!0 (select (arr!6039 a!3436) #b00000000000000000000000000000000)))))

(declare-fun bm!25306 () Bool)

(assert (=> bm!25306 (= call!25309 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3436 mask!4002))))

(declare-fun b!265314 () Bool)

(assert (=> b!265314 (= e!171795 call!25309)))

(assert (= (and d!64039 (not res!129728)) b!265313))

(assert (= (and b!265313 c!45343) b!265312))

(assert (= (and b!265313 (not c!45343)) b!265311))

(assert (= (and b!265312 res!129727) b!265314))

(assert (= (or b!265314 b!265311) bm!25306))

(declare-fun m!281657 () Bool)

(assert (=> b!265312 m!281657))

(declare-fun m!281659 () Bool)

(assert (=> b!265312 m!281659))

(declare-fun m!281661 () Bool)

(assert (=> b!265312 m!281661))

(assert (=> b!265312 m!281657))

(declare-fun m!281663 () Bool)

(assert (=> b!265312 m!281663))

(assert (=> b!265313 m!281657))

(assert (=> b!265313 m!281657))

(declare-fun m!281665 () Bool)

(assert (=> b!265313 m!281665))

(declare-fun m!281667 () Bool)

(assert (=> bm!25306 m!281667))

(assert (=> b!265240 d!64039))

(declare-fun d!64045 () Bool)

(declare-fun res!129735 () Bool)

(declare-fun e!171803 () Bool)

(assert (=> d!64045 (=> res!129735 e!171803)))

(assert (=> d!64045 (= res!129735 (= (select (arr!6039 a!3436) #b00000000000000000000000000000000) k0!2698))))

(assert (=> d!64045 (= (arrayContainsKey!0 a!3436 k0!2698 #b00000000000000000000000000000000) e!171803)))

(declare-fun b!265321 () Bool)

(declare-fun e!171804 () Bool)

(assert (=> b!265321 (= e!171803 e!171804)))

(declare-fun res!129736 () Bool)

(assert (=> b!265321 (=> (not res!129736) (not e!171804))))

(assert (=> b!265321 (= res!129736 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6392 a!3436)))))

(declare-fun b!265322 () Bool)

(assert (=> b!265322 (= e!171804 (arrayContainsKey!0 a!3436 k0!2698 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!64045 (not res!129735)) b!265321))

(assert (= (and b!265321 res!129736) b!265322))

(assert (=> d!64045 m!281657))

(declare-fun m!281675 () Bool)

(assert (=> b!265322 m!281675))

(assert (=> b!265244 d!64045))

(declare-fun d!64049 () Bool)

(assert (=> d!64049 (= (validMask!0 mask!4002) (and (or (= mask!4002 #b00000000000000000000000000000111) (= mask!4002 #b00000000000000000000000000001111) (= mask!4002 #b00000000000000000000000000011111) (= mask!4002 #b00000000000000000000000000111111) (= mask!4002 #b00000000000000000000000001111111) (= mask!4002 #b00000000000000000000000011111111) (= mask!4002 #b00000000000000000000000111111111) (= mask!4002 #b00000000000000000000001111111111) (= mask!4002 #b00000000000000000000011111111111) (= mask!4002 #b00000000000000000000111111111111) (= mask!4002 #b00000000000000000001111111111111) (= mask!4002 #b00000000000000000011111111111111) (= mask!4002 #b00000000000000000111111111111111) (= mask!4002 #b00000000000000001111111111111111) (= mask!4002 #b00000000000000011111111111111111) (= mask!4002 #b00000000000000111111111111111111) (= mask!4002 #b00000000000001111111111111111111) (= mask!4002 #b00000000000011111111111111111111) (= mask!4002 #b00000000000111111111111111111111) (= mask!4002 #b00000000001111111111111111111111) (= mask!4002 #b00000000011111111111111111111111) (= mask!4002 #b00000000111111111111111111111111) (= mask!4002 #b00000001111111111111111111111111) (= mask!4002 #b00000011111111111111111111111111) (= mask!4002 #b00000111111111111111111111111111) (= mask!4002 #b00001111111111111111111111111111) (= mask!4002 #b00011111111111111111111111111111) (= mask!4002 #b00111111111111111111111111111111)) (bvsle mask!4002 #b00111111111111111111111111111111)))))

(assert (=> start!25556 d!64049))

(declare-fun d!64057 () Bool)

(assert (=> d!64057 (= (array_inv!4011 a!3436) (bvsge (size!6392 a!3436) #b00000000000000000000000000000000))))

(assert (=> start!25556 d!64057))

(declare-fun d!64059 () Bool)

(declare-fun res!129747 () Bool)

(declare-fun e!171815 () Bool)

(assert (=> d!64059 (=> res!129747 e!171815)))

(get-info :version)

(assert (=> d!64059 (= res!129747 ((_ is Nil!3823) Nil!3823))))

(assert (=> d!64059 (= (noDuplicate!109 Nil!3823) e!171815)))

(declare-fun b!265333 () Bool)

(declare-fun e!171816 () Bool)

(assert (=> b!265333 (= e!171815 e!171816)))

(declare-fun res!129748 () Bool)

(assert (=> b!265333 (=> (not res!129748) (not e!171816))))

(assert (=> b!265333 (= res!129748 (not (contains!1896 (t!8899 Nil!3823) (h!4489 Nil!3823))))))

(declare-fun b!265334 () Bool)

(assert (=> b!265334 (= e!171816 (noDuplicate!109 (t!8899 Nil!3823)))))

(assert (= (and d!64059 (not res!129747)) b!265333))

(assert (= (and b!265333 res!129748) b!265334))

(declare-fun m!281683 () Bool)

(assert (=> b!265333 m!281683))

(declare-fun m!281685 () Bool)

(assert (=> b!265334 m!281685))

(assert (=> b!265239 d!64059))

(declare-fun b!265397 () Bool)

(declare-fun e!171857 () SeekEntryResult!1229)

(declare-fun lt!133953 () SeekEntryResult!1229)

(assert (=> b!265397 (= e!171857 (MissingZero!1229 (index!7088 lt!133953)))))

(declare-fun b!265398 () Bool)

(declare-fun e!171855 () SeekEntryResult!1229)

(assert (=> b!265398 (= e!171855 Undefined!1229)))

(declare-fun b!265400 () Bool)

(declare-fun e!171856 () SeekEntryResult!1229)

(assert (=> b!265400 (= e!171856 (Found!1229 (index!7088 lt!133953)))))

(declare-fun b!265401 () Bool)

(assert (=> b!265401 (= e!171855 e!171856)))

(declare-fun lt!133952 () (_ BitVec 64))

(assert (=> b!265401 (= lt!133952 (select (arr!6039 a!3436) (index!7088 lt!133953)))))

(declare-fun c!45369 () Bool)

(assert (=> b!265401 (= c!45369 (= lt!133952 k0!2698))))

(declare-fun b!265402 () Bool)

(declare-fun c!45368 () Bool)

(assert (=> b!265402 (= c!45368 (= lt!133952 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!265402 (= e!171856 e!171857)))

(declare-fun d!64063 () Bool)

(declare-fun lt!133954 () SeekEntryResult!1229)

(assert (=> d!64063 (and (or ((_ is Undefined!1229) lt!133954) (not ((_ is Found!1229) lt!133954)) (and (bvsge (index!7087 lt!133954) #b00000000000000000000000000000000) (bvslt (index!7087 lt!133954) (size!6392 a!3436)))) (or ((_ is Undefined!1229) lt!133954) ((_ is Found!1229) lt!133954) (not ((_ is MissingZero!1229) lt!133954)) (and (bvsge (index!7086 lt!133954) #b00000000000000000000000000000000) (bvslt (index!7086 lt!133954) (size!6392 a!3436)))) (or ((_ is Undefined!1229) lt!133954) ((_ is Found!1229) lt!133954) ((_ is MissingZero!1229) lt!133954) (not ((_ is MissingVacant!1229) lt!133954)) (and (bvsge (index!7089 lt!133954) #b00000000000000000000000000000000) (bvslt (index!7089 lt!133954) (size!6392 a!3436)))) (or ((_ is Undefined!1229) lt!133954) (ite ((_ is Found!1229) lt!133954) (= (select (arr!6039 a!3436) (index!7087 lt!133954)) k0!2698) (ite ((_ is MissingZero!1229) lt!133954) (= (select (arr!6039 a!3436) (index!7086 lt!133954)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1229) lt!133954) (= (select (arr!6039 a!3436) (index!7089 lt!133954)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!64063 (= lt!133954 e!171855)))

(declare-fun c!45370 () Bool)

(assert (=> d!64063 (= c!45370 (and ((_ is Intermediate!1229) lt!133953) (undefined!2041 lt!133953)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12768 (_ BitVec 32)) SeekEntryResult!1229)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!64063 (= lt!133953 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2698 mask!4002) k0!2698 a!3436 mask!4002))))

(assert (=> d!64063 (validMask!0 mask!4002)))

(assert (=> d!64063 (= (seekEntryOrOpen!0 k0!2698 a!3436 mask!4002) lt!133954)))

(declare-fun b!265399 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12768 (_ BitVec 32)) SeekEntryResult!1229)

(assert (=> b!265399 (= e!171857 (seekKeyOrZeroReturnVacant!0 (x!25425 lt!133953) (index!7088 lt!133953) (index!7088 lt!133953) k0!2698 a!3436 mask!4002))))

(assert (= (and d!64063 c!45370) b!265398))

(assert (= (and d!64063 (not c!45370)) b!265401))

(assert (= (and b!265401 c!45369) b!265400))

(assert (= (and b!265401 (not c!45369)) b!265402))

(assert (= (and b!265402 c!45368) b!265397))

(assert (= (and b!265402 (not c!45368)) b!265399))

(declare-fun m!281727 () Bool)

(assert (=> b!265401 m!281727))

(declare-fun m!281729 () Bool)

(assert (=> d!64063 m!281729))

(declare-fun m!281731 () Bool)

(assert (=> d!64063 m!281731))

(declare-fun m!281733 () Bool)

(assert (=> d!64063 m!281733))

(declare-fun m!281735 () Bool)

(assert (=> d!64063 m!281735))

(assert (=> d!64063 m!281609))

(assert (=> d!64063 m!281729))

(declare-fun m!281737 () Bool)

(assert (=> d!64063 m!281737))

(declare-fun m!281739 () Bool)

(assert (=> b!265399 m!281739))

(assert (=> b!265237 d!64063))

(declare-fun d!64077 () Bool)

(declare-fun lt!133958 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!180 (List!3826) (InoxSet (_ BitVec 64)))

(assert (=> d!64077 (= lt!133958 (select (content!180 Nil!3823) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!171871 () Bool)

(assert (=> d!64077 (= lt!133958 e!171871)))

(declare-fun res!129776 () Bool)

(assert (=> d!64077 (=> (not res!129776) (not e!171871))))

(assert (=> d!64077 (= res!129776 ((_ is Cons!3822) Nil!3823))))

(assert (=> d!64077 (= (contains!1896 Nil!3823 #b1000000000000000000000000000000000000000000000000000000000000000) lt!133958)))

(declare-fun b!265415 () Bool)

(declare-fun e!171870 () Bool)

(assert (=> b!265415 (= e!171871 e!171870)))

(declare-fun res!129775 () Bool)

(assert (=> b!265415 (=> res!129775 e!171870)))

(assert (=> b!265415 (= res!129775 (= (h!4489 Nil!3823) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!265416 () Bool)

(assert (=> b!265416 (= e!171870 (contains!1896 (t!8899 Nil!3823) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!64077 res!129776) b!265415))

(assert (= (and b!265415 (not res!129775)) b!265416))

(declare-fun m!281749 () Bool)

(assert (=> d!64077 m!281749))

(declare-fun m!281751 () Bool)

(assert (=> d!64077 m!281751))

(declare-fun m!281753 () Bool)

(assert (=> b!265416 m!281753))

(assert (=> b!265243 d!64077))

(declare-fun d!64087 () Bool)

(declare-fun lt!133959 () Bool)

(assert (=> d!64087 (= lt!133959 (select (content!180 Nil!3823) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!171873 () Bool)

(assert (=> d!64087 (= lt!133959 e!171873)))

(declare-fun res!129778 () Bool)

(assert (=> d!64087 (=> (not res!129778) (not e!171873))))

(assert (=> d!64087 (= res!129778 ((_ is Cons!3822) Nil!3823))))

(assert (=> d!64087 (= (contains!1896 Nil!3823 #b0000000000000000000000000000000000000000000000000000000000000000) lt!133959)))

(declare-fun b!265417 () Bool)

(declare-fun e!171872 () Bool)

(assert (=> b!265417 (= e!171873 e!171872)))

(declare-fun res!129777 () Bool)

(assert (=> b!265417 (=> res!129777 e!171872)))

(assert (=> b!265417 (= res!129777 (= (h!4489 Nil!3823) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!265418 () Bool)

(assert (=> b!265418 (= e!171872 (contains!1896 (t!8899 Nil!3823) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!64087 res!129778) b!265417))

(assert (= (and b!265417 (not res!129777)) b!265418))

(assert (=> d!64087 m!281749))

(declare-fun m!281755 () Bool)

(assert (=> d!64087 m!281755))

(declare-fun m!281757 () Bool)

(assert (=> b!265418 m!281757))

(assert (=> b!265236 d!64087))

(declare-fun d!64089 () Bool)

(assert (=> d!64089 (= (validKeyInArray!0 k0!2698) (and (not (= k0!2698 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2698 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!265242 d!64089))

(check-sat (not bm!25306) (not b!265313) (not b!265418) (not d!64087) (not d!64077) (not b!265399) (not b!265416) (not b!265312) (not b!265333) (not b!265322) (not d!64063) (not b!265334))
(check-sat)
