; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!119708 () Bool)

(assert start!119708)

(declare-fun b!1393705 () Bool)

(declare-fun e!789292 () Bool)

(declare-fun e!789293 () Bool)

(assert (=> b!1393705 (= e!789292 (not e!789293))))

(declare-fun res!932597 () Bool)

(assert (=> b!1393705 (=> res!932597 e!789293)))

(declare-datatypes ((SeekEntryResult!10259 0))(
  ( (MissingZero!10259 (index!43407 (_ BitVec 32))) (Found!10259 (index!43408 (_ BitVec 32))) (Intermediate!10259 (undefined!11071 Bool) (index!43409 (_ BitVec 32)) (x!125244 (_ BitVec 32))) (Undefined!10259) (MissingVacant!10259 (index!43410 (_ BitVec 32))) )
))
(declare-fun lt!612046 () SeekEntryResult!10259)

(get-info :version)

(assert (=> b!1393705 (= res!932597 (or (not ((_ is Intermediate!10259) lt!612046)) (undefined!11071 lt!612046)))))

(declare-fun e!789290 () Bool)

(assert (=> b!1393705 e!789290))

(declare-fun res!932596 () Bool)

(assert (=> b!1393705 (=> (not res!932596) (not e!789290))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95363 0))(
  ( (array!95364 (arr!46039 (Array (_ BitVec 32) (_ BitVec 64))) (size!46590 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95363)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95363 (_ BitVec 32)) Bool)

(assert (=> b!1393705 (= res!932596 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46549 0))(
  ( (Unit!46550) )
))
(declare-fun lt!612047 () Unit!46549)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95363 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46549)

(assert (=> b!1393705 (= lt!612047 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95363 (_ BitVec 32)) SeekEntryResult!10259)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1393705 (= lt!612046 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46039 a!2901) j!112) mask!2840) (select (arr!46039 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1393706 () Bool)

(declare-fun res!932602 () Bool)

(assert (=> b!1393706 (=> (not res!932602) (not e!789292))))

(assert (=> b!1393706 (= res!932602 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1393707 () Bool)

(assert (=> b!1393707 (= e!789293 (or (bvslt mask!2840 #b00000000000000000000000000000000) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(declare-fun b!1393708 () Bool)

(declare-fun res!932594 () Bool)

(assert (=> b!1393708 (=> (not res!932594) (not e!789292))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1393708 (= res!932594 (validKeyInArray!0 (select (arr!46039 a!2901) j!112)))))

(declare-fun b!1393709 () Bool)

(declare-fun res!932598 () Bool)

(assert (=> b!1393709 (=> (not res!932598) (not e!789292))))

(declare-datatypes ((List!32545 0))(
  ( (Nil!32542) (Cons!32541 (h!33779 (_ BitVec 64)) (t!47231 List!32545)) )
))
(declare-fun arrayNoDuplicates!0 (array!95363 (_ BitVec 32) List!32545) Bool)

(assert (=> b!1393709 (= res!932598 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32542))))

(declare-fun b!1393710 () Bool)

(declare-fun res!932595 () Bool)

(assert (=> b!1393710 (=> (not res!932595) (not e!789292))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1393710 (= res!932595 (and (= (size!46590 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46590 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46590 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1393711 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95363 (_ BitVec 32)) SeekEntryResult!10259)

(assert (=> b!1393711 (= e!789290 (= (seekEntryOrOpen!0 (select (arr!46039 a!2901) j!112) a!2901 mask!2840) (Found!10259 j!112)))))

(declare-fun res!932599 () Bool)

(assert (=> start!119708 (=> (not res!932599) (not e!789292))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119708 (= res!932599 (validMask!0 mask!2840))))

(assert (=> start!119708 e!789292))

(assert (=> start!119708 true))

(declare-fun array_inv!35320 (array!95363) Bool)

(assert (=> start!119708 (array_inv!35320 a!2901)))

(declare-fun b!1393712 () Bool)

(declare-fun res!932600 () Bool)

(assert (=> b!1393712 (=> (not res!932600) (not e!789292))))

(assert (=> b!1393712 (= res!932600 (validKeyInArray!0 (select (arr!46039 a!2901) i!1037)))))

(declare-fun b!1393713 () Bool)

(declare-fun res!932601 () Bool)

(assert (=> b!1393713 (=> res!932601 e!789293)))

(assert (=> b!1393713 (= res!932601 (not (= lt!612046 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46039 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46039 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95364 (store (arr!46039 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46590 a!2901)) mask!2840))))))

(assert (= (and start!119708 res!932599) b!1393710))

(assert (= (and b!1393710 res!932595) b!1393712))

(assert (= (and b!1393712 res!932600) b!1393708))

(assert (= (and b!1393708 res!932594) b!1393706))

(assert (= (and b!1393706 res!932602) b!1393709))

(assert (= (and b!1393709 res!932598) b!1393705))

(assert (= (and b!1393705 res!932596) b!1393711))

(assert (= (and b!1393705 (not res!932597)) b!1393713))

(assert (= (and b!1393713 (not res!932601)) b!1393707))

(declare-fun m!1279705 () Bool)

(assert (=> b!1393705 m!1279705))

(declare-fun m!1279707 () Bool)

(assert (=> b!1393705 m!1279707))

(assert (=> b!1393705 m!1279705))

(declare-fun m!1279709 () Bool)

(assert (=> b!1393705 m!1279709))

(assert (=> b!1393705 m!1279707))

(assert (=> b!1393705 m!1279705))

(declare-fun m!1279711 () Bool)

(assert (=> b!1393705 m!1279711))

(declare-fun m!1279713 () Bool)

(assert (=> b!1393705 m!1279713))

(declare-fun m!1279715 () Bool)

(assert (=> b!1393713 m!1279715))

(declare-fun m!1279717 () Bool)

(assert (=> b!1393713 m!1279717))

(assert (=> b!1393713 m!1279717))

(declare-fun m!1279719 () Bool)

(assert (=> b!1393713 m!1279719))

(assert (=> b!1393713 m!1279719))

(assert (=> b!1393713 m!1279717))

(declare-fun m!1279721 () Bool)

(assert (=> b!1393713 m!1279721))

(assert (=> b!1393708 m!1279705))

(assert (=> b!1393708 m!1279705))

(declare-fun m!1279723 () Bool)

(assert (=> b!1393708 m!1279723))

(declare-fun m!1279725 () Bool)

(assert (=> b!1393709 m!1279725))

(declare-fun m!1279727 () Bool)

(assert (=> b!1393712 m!1279727))

(assert (=> b!1393712 m!1279727))

(declare-fun m!1279729 () Bool)

(assert (=> b!1393712 m!1279729))

(assert (=> b!1393711 m!1279705))

(assert (=> b!1393711 m!1279705))

(declare-fun m!1279731 () Bool)

(assert (=> b!1393711 m!1279731))

(declare-fun m!1279733 () Bool)

(assert (=> start!119708 m!1279733))

(declare-fun m!1279735 () Bool)

(assert (=> start!119708 m!1279735))

(declare-fun m!1279737 () Bool)

(assert (=> b!1393706 m!1279737))

(check-sat (not b!1393713) (not b!1393711) (not b!1393708) (not b!1393705) (not b!1393709) (not b!1393712) (not b!1393706) (not start!119708))
(check-sat)
(get-model)

(declare-fun b!1393786 () Bool)

(declare-fun lt!612064 () SeekEntryResult!10259)

(assert (=> b!1393786 (and (bvsge (index!43409 lt!612064) #b00000000000000000000000000000000) (bvslt (index!43409 lt!612064) (size!46590 (array!95364 (store (arr!46039 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46590 a!2901)))))))

(declare-fun res!932663 () Bool)

(assert (=> b!1393786 (= res!932663 (= (select (arr!46039 (array!95364 (store (arr!46039 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46590 a!2901))) (index!43409 lt!612064)) (select (store (arr!46039 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112)))))

(declare-fun e!789328 () Bool)

(assert (=> b!1393786 (=> res!932663 e!789328)))

(declare-fun e!789332 () Bool)

(assert (=> b!1393786 (= e!789332 e!789328)))

(declare-fun b!1393787 () Bool)

(assert (=> b!1393787 (and (bvsge (index!43409 lt!612064) #b00000000000000000000000000000000) (bvslt (index!43409 lt!612064) (size!46590 (array!95364 (store (arr!46039 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46590 a!2901)))))))

(declare-fun res!932664 () Bool)

(assert (=> b!1393787 (= res!932664 (= (select (arr!46039 (array!95364 (store (arr!46039 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46590 a!2901))) (index!43409 lt!612064)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1393787 (=> res!932664 e!789328)))

(declare-fun b!1393788 () Bool)

(declare-fun e!789330 () SeekEntryResult!10259)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1393788 (= e!789330 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (store (arr!46039 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2840) (select (store (arr!46039 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95364 (store (arr!46039 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46590 a!2901)) mask!2840))))

(declare-fun b!1393789 () Bool)

(assert (=> b!1393789 (= e!789330 (Intermediate!10259 false (toIndex!0 (select (store (arr!46039 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1393790 () Bool)

(declare-fun e!789331 () Bool)

(assert (=> b!1393790 (= e!789331 (bvsge (x!125244 lt!612064) #b01111111111111111111111111111110))))

(declare-fun d!150845 () Bool)

(assert (=> d!150845 e!789331))

(declare-fun c!130021 () Bool)

(assert (=> d!150845 (= c!130021 (and ((_ is Intermediate!10259) lt!612064) (undefined!11071 lt!612064)))))

(declare-fun e!789329 () SeekEntryResult!10259)

(assert (=> d!150845 (= lt!612064 e!789329)))

(declare-fun c!130020 () Bool)

(assert (=> d!150845 (= c!130020 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!612065 () (_ BitVec 64))

(assert (=> d!150845 (= lt!612065 (select (arr!46039 (array!95364 (store (arr!46039 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46590 a!2901))) (toIndex!0 (select (store (arr!46039 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840)))))

(assert (=> d!150845 (validMask!0 mask!2840)))

(assert (=> d!150845 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46039 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46039 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95364 (store (arr!46039 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46590 a!2901)) mask!2840) lt!612064)))

(declare-fun b!1393791 () Bool)

(assert (=> b!1393791 (= e!789329 (Intermediate!10259 true (toIndex!0 (select (store (arr!46039 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1393792 () Bool)

(assert (=> b!1393792 (and (bvsge (index!43409 lt!612064) #b00000000000000000000000000000000) (bvslt (index!43409 lt!612064) (size!46590 (array!95364 (store (arr!46039 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46590 a!2901)))))))

(assert (=> b!1393792 (= e!789328 (= (select (arr!46039 (array!95364 (store (arr!46039 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46590 a!2901))) (index!43409 lt!612064)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1393793 () Bool)

(assert (=> b!1393793 (= e!789329 e!789330)))

(declare-fun c!130019 () Bool)

(assert (=> b!1393793 (= c!130019 (or (= lt!612065 (select (store (arr!46039 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112)) (= (bvadd lt!612065 lt!612065) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1393794 () Bool)

(assert (=> b!1393794 (= e!789331 e!789332)))

(declare-fun res!932665 () Bool)

(assert (=> b!1393794 (= res!932665 (and ((_ is Intermediate!10259) lt!612064) (not (undefined!11071 lt!612064)) (bvslt (x!125244 lt!612064) #b01111111111111111111111111111110) (bvsge (x!125244 lt!612064) #b00000000000000000000000000000000) (bvsge (x!125244 lt!612064) #b00000000000000000000000000000000)))))

(assert (=> b!1393794 (=> (not res!932665) (not e!789332))))

(assert (= (and d!150845 c!130020) b!1393791))

(assert (= (and d!150845 (not c!130020)) b!1393793))

(assert (= (and b!1393793 c!130019) b!1393789))

(assert (= (and b!1393793 (not c!130019)) b!1393788))

(assert (= (and d!150845 c!130021) b!1393790))

(assert (= (and d!150845 (not c!130021)) b!1393794))

(assert (= (and b!1393794 res!932665) b!1393786))

(assert (= (and b!1393786 (not res!932663)) b!1393787))

(assert (= (and b!1393787 (not res!932664)) b!1393792))

(assert (=> d!150845 m!1279719))

(declare-fun m!1279807 () Bool)

(assert (=> d!150845 m!1279807))

(assert (=> d!150845 m!1279733))

(declare-fun m!1279809 () Bool)

(assert (=> b!1393787 m!1279809))

(assert (=> b!1393786 m!1279809))

(assert (=> b!1393788 m!1279719))

(declare-fun m!1279811 () Bool)

(assert (=> b!1393788 m!1279811))

(assert (=> b!1393788 m!1279811))

(assert (=> b!1393788 m!1279717))

(declare-fun m!1279813 () Bool)

(assert (=> b!1393788 m!1279813))

(assert (=> b!1393792 m!1279809))

(assert (=> b!1393713 d!150845))

(declare-fun d!150855 () Bool)

(declare-fun lt!612077 () (_ BitVec 32))

(declare-fun lt!612076 () (_ BitVec 32))

(assert (=> d!150855 (= lt!612077 (bvmul (bvxor lt!612076 (bvlshr lt!612076 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!150855 (= lt!612076 ((_ extract 31 0) (bvand (bvxor (select (store (arr!46039 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (bvlshr (select (store (arr!46039 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!150855 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!932666 (let ((h!33782 ((_ extract 31 0) (bvand (bvxor (select (store (arr!46039 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (bvlshr (select (store (arr!46039 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!125248 (bvmul (bvxor h!33782 (bvlshr h!33782 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!125248 (bvlshr x!125248 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!932666 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!932666 #b00000000000000000000000000000000))))))

(assert (=> d!150855 (= (toIndex!0 (select (store (arr!46039 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (bvand (bvxor lt!612077 (bvlshr lt!612077 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1393713 d!150855))

(declare-fun d!150857 () Bool)

(assert (=> d!150857 (= (validKeyInArray!0 (select (arr!46039 a!2901) j!112)) (and (not (= (select (arr!46039 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46039 a!2901) j!112) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1393708 d!150857))

(declare-fun d!150859 () Bool)

(declare-fun res!932679 () Bool)

(declare-fun e!789358 () Bool)

(assert (=> d!150859 (=> res!932679 e!789358)))

(assert (=> d!150859 (= res!932679 (bvsge #b00000000000000000000000000000000 (size!46590 a!2901)))))

(assert (=> d!150859 (= (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32542) e!789358)))

(declare-fun b!1393829 () Bool)

(declare-fun e!789357 () Bool)

(declare-fun contains!9813 (List!32545 (_ BitVec 64)) Bool)

(assert (=> b!1393829 (= e!789357 (contains!9813 Nil!32542 (select (arr!46039 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1393830 () Bool)

(declare-fun e!789359 () Bool)

(declare-fun call!66846 () Bool)

(assert (=> b!1393830 (= e!789359 call!66846)))

(declare-fun b!1393831 () Bool)

(assert (=> b!1393831 (= e!789359 call!66846)))

(declare-fun bm!66843 () Bool)

(declare-fun c!130033 () Bool)

(assert (=> bm!66843 (= call!66846 (arrayNoDuplicates!0 a!2901 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!130033 (Cons!32541 (select (arr!46039 a!2901) #b00000000000000000000000000000000) Nil!32542) Nil!32542)))))

(declare-fun b!1393832 () Bool)

(declare-fun e!789356 () Bool)

(assert (=> b!1393832 (= e!789356 e!789359)))

(assert (=> b!1393832 (= c!130033 (validKeyInArray!0 (select (arr!46039 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1393833 () Bool)

(assert (=> b!1393833 (= e!789358 e!789356)))

(declare-fun res!932680 () Bool)

(assert (=> b!1393833 (=> (not res!932680) (not e!789356))))

(assert (=> b!1393833 (= res!932680 (not e!789357))))

(declare-fun res!932681 () Bool)

(assert (=> b!1393833 (=> (not res!932681) (not e!789357))))

(assert (=> b!1393833 (= res!932681 (validKeyInArray!0 (select (arr!46039 a!2901) #b00000000000000000000000000000000)))))

(assert (= (and d!150859 (not res!932679)) b!1393833))

(assert (= (and b!1393833 res!932681) b!1393829))

(assert (= (and b!1393833 res!932680) b!1393832))

(assert (= (and b!1393832 c!130033) b!1393830))

(assert (= (and b!1393832 (not c!130033)) b!1393831))

(assert (= (or b!1393830 b!1393831) bm!66843))

(declare-fun m!1279827 () Bool)

(assert (=> b!1393829 m!1279827))

(assert (=> b!1393829 m!1279827))

(declare-fun m!1279829 () Bool)

(assert (=> b!1393829 m!1279829))

(assert (=> bm!66843 m!1279827))

(declare-fun m!1279831 () Bool)

(assert (=> bm!66843 m!1279831))

(assert (=> b!1393832 m!1279827))

(assert (=> b!1393832 m!1279827))

(declare-fun m!1279833 () Bool)

(assert (=> b!1393832 m!1279833))

(assert (=> b!1393833 m!1279827))

(assert (=> b!1393833 m!1279827))

(assert (=> b!1393833 m!1279833))

(assert (=> b!1393709 d!150859))

(declare-fun bm!66846 () Bool)

(declare-fun call!66849 () Bool)

(assert (=> bm!66846 (= call!66849 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!112 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1393848 () Bool)

(declare-fun e!789371 () Bool)

(declare-fun e!789369 () Bool)

(assert (=> b!1393848 (= e!789371 e!789369)))

(declare-fun lt!612098 () (_ BitVec 64))

(assert (=> b!1393848 (= lt!612098 (select (arr!46039 a!2901) j!112))))

(declare-fun lt!612097 () Unit!46549)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!95363 (_ BitVec 64) (_ BitVec 32)) Unit!46549)

(assert (=> b!1393848 (= lt!612097 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!612098 j!112))))

(declare-fun arrayContainsKey!0 (array!95363 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1393848 (arrayContainsKey!0 a!2901 lt!612098 #b00000000000000000000000000000000)))

(declare-fun lt!612096 () Unit!46549)

(assert (=> b!1393848 (= lt!612096 lt!612097)))

(declare-fun res!932687 () Bool)

(assert (=> b!1393848 (= res!932687 (= (seekEntryOrOpen!0 (select (arr!46039 a!2901) j!112) a!2901 mask!2840) (Found!10259 j!112)))))

(assert (=> b!1393848 (=> (not res!932687) (not e!789369))))

(declare-fun b!1393849 () Bool)

(declare-fun e!789370 () Bool)

(assert (=> b!1393849 (= e!789370 e!789371)))

(declare-fun c!130039 () Bool)

(assert (=> b!1393849 (= c!130039 (validKeyInArray!0 (select (arr!46039 a!2901) j!112)))))

(declare-fun b!1393850 () Bool)

(assert (=> b!1393850 (= e!789369 call!66849)))

(declare-fun b!1393851 () Bool)

(assert (=> b!1393851 (= e!789371 call!66849)))

(declare-fun d!150863 () Bool)

(declare-fun res!932686 () Bool)

(assert (=> d!150863 (=> res!932686 e!789370)))

(assert (=> d!150863 (= res!932686 (bvsge j!112 (size!46590 a!2901)))))

(assert (=> d!150863 (= (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840) e!789370)))

(assert (= (and d!150863 (not res!932686)) b!1393849))

(assert (= (and b!1393849 c!130039) b!1393848))

(assert (= (and b!1393849 (not c!130039)) b!1393851))

(assert (= (and b!1393848 res!932687) b!1393850))

(assert (= (or b!1393850 b!1393851) bm!66846))

(declare-fun m!1279845 () Bool)

(assert (=> bm!66846 m!1279845))

(assert (=> b!1393848 m!1279705))

(declare-fun m!1279847 () Bool)

(assert (=> b!1393848 m!1279847))

(declare-fun m!1279849 () Bool)

(assert (=> b!1393848 m!1279849))

(assert (=> b!1393848 m!1279705))

(assert (=> b!1393848 m!1279731))

(assert (=> b!1393849 m!1279705))

(assert (=> b!1393849 m!1279705))

(assert (=> b!1393849 m!1279723))

(assert (=> b!1393705 d!150863))

(declare-fun d!150869 () Bool)

(assert (=> d!150869 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!612107 () Unit!46549)

(declare-fun choose!38 (array!95363 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46549)

(assert (=> d!150869 (= lt!612107 (choose!38 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> d!150869 (validMask!0 mask!2840)))

(assert (=> d!150869 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112) lt!612107)))

(declare-fun bs!40519 () Bool)

(assert (= bs!40519 d!150869))

(assert (=> bs!40519 m!1279713))

(declare-fun m!1279851 () Bool)

(assert (=> bs!40519 m!1279851))

(assert (=> bs!40519 m!1279733))

(assert (=> b!1393705 d!150869))

(declare-fun b!1393870 () Bool)

(declare-fun lt!612111 () SeekEntryResult!10259)

(assert (=> b!1393870 (and (bvsge (index!43409 lt!612111) #b00000000000000000000000000000000) (bvslt (index!43409 lt!612111) (size!46590 a!2901)))))

(declare-fun res!932688 () Bool)

(assert (=> b!1393870 (= res!932688 (= (select (arr!46039 a!2901) (index!43409 lt!612111)) (select (arr!46039 a!2901) j!112)))))

(declare-fun e!789381 () Bool)

(assert (=> b!1393870 (=> res!932688 e!789381)))

(declare-fun e!789385 () Bool)

(assert (=> b!1393870 (= e!789385 e!789381)))

(declare-fun b!1393871 () Bool)

(assert (=> b!1393871 (and (bvsge (index!43409 lt!612111) #b00000000000000000000000000000000) (bvslt (index!43409 lt!612111) (size!46590 a!2901)))))

(declare-fun res!932689 () Bool)

(assert (=> b!1393871 (= res!932689 (= (select (arr!46039 a!2901) (index!43409 lt!612111)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1393871 (=> res!932689 e!789381)))

(declare-fun b!1393872 () Bool)

(declare-fun e!789383 () SeekEntryResult!10259)

(assert (=> b!1393872 (= e!789383 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!46039 a!2901) j!112) mask!2840) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2840) (select (arr!46039 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1393873 () Bool)

(assert (=> b!1393873 (= e!789383 (Intermediate!10259 false (toIndex!0 (select (arr!46039 a!2901) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1393874 () Bool)

(declare-fun e!789384 () Bool)

(assert (=> b!1393874 (= e!789384 (bvsge (x!125244 lt!612111) #b01111111111111111111111111111110))))

(declare-fun d!150875 () Bool)

(assert (=> d!150875 e!789384))

(declare-fun c!130051 () Bool)

(assert (=> d!150875 (= c!130051 (and ((_ is Intermediate!10259) lt!612111) (undefined!11071 lt!612111)))))

(declare-fun e!789382 () SeekEntryResult!10259)

(assert (=> d!150875 (= lt!612111 e!789382)))

(declare-fun c!130050 () Bool)

(assert (=> d!150875 (= c!130050 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!612112 () (_ BitVec 64))

(assert (=> d!150875 (= lt!612112 (select (arr!46039 a!2901) (toIndex!0 (select (arr!46039 a!2901) j!112) mask!2840)))))

(assert (=> d!150875 (validMask!0 mask!2840)))

(assert (=> d!150875 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46039 a!2901) j!112) mask!2840) (select (arr!46039 a!2901) j!112) a!2901 mask!2840) lt!612111)))

(declare-fun b!1393875 () Bool)

(assert (=> b!1393875 (= e!789382 (Intermediate!10259 true (toIndex!0 (select (arr!46039 a!2901) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1393876 () Bool)

(assert (=> b!1393876 (and (bvsge (index!43409 lt!612111) #b00000000000000000000000000000000) (bvslt (index!43409 lt!612111) (size!46590 a!2901)))))

(assert (=> b!1393876 (= e!789381 (= (select (arr!46039 a!2901) (index!43409 lt!612111)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1393877 () Bool)

(assert (=> b!1393877 (= e!789382 e!789383)))

(declare-fun c!130049 () Bool)

(assert (=> b!1393877 (= c!130049 (or (= lt!612112 (select (arr!46039 a!2901) j!112)) (= (bvadd lt!612112 lt!612112) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1393878 () Bool)

(assert (=> b!1393878 (= e!789384 e!789385)))

(declare-fun res!932690 () Bool)

(assert (=> b!1393878 (= res!932690 (and ((_ is Intermediate!10259) lt!612111) (not (undefined!11071 lt!612111)) (bvslt (x!125244 lt!612111) #b01111111111111111111111111111110) (bvsge (x!125244 lt!612111) #b00000000000000000000000000000000) (bvsge (x!125244 lt!612111) #b00000000000000000000000000000000)))))

(assert (=> b!1393878 (=> (not res!932690) (not e!789385))))

(assert (= (and d!150875 c!130050) b!1393875))

(assert (= (and d!150875 (not c!130050)) b!1393877))

(assert (= (and b!1393877 c!130049) b!1393873))

(assert (= (and b!1393877 (not c!130049)) b!1393872))

(assert (= (and d!150875 c!130051) b!1393874))

(assert (= (and d!150875 (not c!130051)) b!1393878))

(assert (= (and b!1393878 res!932690) b!1393870))

(assert (= (and b!1393870 (not res!932688)) b!1393871))

(assert (= (and b!1393871 (not res!932689)) b!1393876))

(assert (=> d!150875 m!1279707))

(declare-fun m!1279857 () Bool)

(assert (=> d!150875 m!1279857))

(assert (=> d!150875 m!1279733))

(declare-fun m!1279863 () Bool)

(assert (=> b!1393871 m!1279863))

(assert (=> b!1393870 m!1279863))

(assert (=> b!1393872 m!1279707))

(declare-fun m!1279867 () Bool)

(assert (=> b!1393872 m!1279867))

(assert (=> b!1393872 m!1279867))

(assert (=> b!1393872 m!1279705))

(declare-fun m!1279869 () Bool)

(assert (=> b!1393872 m!1279869))

(assert (=> b!1393876 m!1279863))

(assert (=> b!1393705 d!150875))

(declare-fun d!150879 () Bool)

(declare-fun lt!612114 () (_ BitVec 32))

(declare-fun lt!612113 () (_ BitVec 32))

(assert (=> d!150879 (= lt!612114 (bvmul (bvxor lt!612113 (bvlshr lt!612113 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!150879 (= lt!612113 ((_ extract 31 0) (bvand (bvxor (select (arr!46039 a!2901) j!112) (bvlshr (select (arr!46039 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!150879 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!932666 (let ((h!33782 ((_ extract 31 0) (bvand (bvxor (select (arr!46039 a!2901) j!112) (bvlshr (select (arr!46039 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!125248 (bvmul (bvxor h!33782 (bvlshr h!33782 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!125248 (bvlshr x!125248 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!932666 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!932666 #b00000000000000000000000000000000))))))

(assert (=> d!150879 (= (toIndex!0 (select (arr!46039 a!2901) j!112) mask!2840) (bvand (bvxor lt!612114 (bvlshr lt!612114 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1393705 d!150879))

(declare-fun d!150881 () Bool)

(assert (=> d!150881 (= (validMask!0 mask!2840) (and (or (= mask!2840 #b00000000000000000000000000000111) (= mask!2840 #b00000000000000000000000000001111) (= mask!2840 #b00000000000000000000000000011111) (= mask!2840 #b00000000000000000000000000111111) (= mask!2840 #b00000000000000000000000001111111) (= mask!2840 #b00000000000000000000000011111111) (= mask!2840 #b00000000000000000000000111111111) (= mask!2840 #b00000000000000000000001111111111) (= mask!2840 #b00000000000000000000011111111111) (= mask!2840 #b00000000000000000000111111111111) (= mask!2840 #b00000000000000000001111111111111) (= mask!2840 #b00000000000000000011111111111111) (= mask!2840 #b00000000000000000111111111111111) (= mask!2840 #b00000000000000001111111111111111) (= mask!2840 #b00000000000000011111111111111111) (= mask!2840 #b00000000000000111111111111111111) (= mask!2840 #b00000000000001111111111111111111) (= mask!2840 #b00000000000011111111111111111111) (= mask!2840 #b00000000000111111111111111111111) (= mask!2840 #b00000000001111111111111111111111) (= mask!2840 #b00000000011111111111111111111111) (= mask!2840 #b00000000111111111111111111111111) (= mask!2840 #b00000001111111111111111111111111) (= mask!2840 #b00000011111111111111111111111111) (= mask!2840 #b00000111111111111111111111111111) (= mask!2840 #b00001111111111111111111111111111) (= mask!2840 #b00011111111111111111111111111111) (= mask!2840 #b00111111111111111111111111111111)) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(assert (=> start!119708 d!150881))

(declare-fun d!150891 () Bool)

(assert (=> d!150891 (= (array_inv!35320 a!2901) (bvsge (size!46590 a!2901) #b00000000000000000000000000000000))))

(assert (=> start!119708 d!150891))

(declare-fun d!150893 () Bool)

(assert (=> d!150893 (= (validKeyInArray!0 (select (arr!46039 a!2901) i!1037)) (and (not (= (select (arr!46039 a!2901) i!1037) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46039 a!2901) i!1037) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1393712 d!150893))

(declare-fun lt!612137 () SeekEntryResult!10259)

(declare-fun e!789447 () SeekEntryResult!10259)

(declare-fun b!1393975 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95363 (_ BitVec 32)) SeekEntryResult!10259)

(assert (=> b!1393975 (= e!789447 (seekKeyOrZeroReturnVacant!0 (x!125244 lt!612137) (index!43409 lt!612137) (index!43409 lt!612137) (select (arr!46039 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1393976 () Bool)

(declare-fun c!130084 () Bool)

(declare-fun lt!612138 () (_ BitVec 64))

(assert (=> b!1393976 (= c!130084 (= lt!612138 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!789448 () SeekEntryResult!10259)

(assert (=> b!1393976 (= e!789448 e!789447)))

(declare-fun b!1393977 () Bool)

(assert (=> b!1393977 (= e!789448 (Found!10259 (index!43409 lt!612137)))))

(declare-fun b!1393979 () Bool)

(assert (=> b!1393979 (= e!789447 (MissingZero!10259 (index!43409 lt!612137)))))

(declare-fun b!1393980 () Bool)

(declare-fun e!789446 () SeekEntryResult!10259)

(assert (=> b!1393980 (= e!789446 Undefined!10259)))

(declare-fun b!1393978 () Bool)

(assert (=> b!1393978 (= e!789446 e!789448)))

(assert (=> b!1393978 (= lt!612138 (select (arr!46039 a!2901) (index!43409 lt!612137)))))

(declare-fun c!130082 () Bool)

(assert (=> b!1393978 (= c!130082 (= lt!612138 (select (arr!46039 a!2901) j!112)))))

(declare-fun d!150895 () Bool)

(declare-fun lt!612139 () SeekEntryResult!10259)

(assert (=> d!150895 (and (or ((_ is Undefined!10259) lt!612139) (not ((_ is Found!10259) lt!612139)) (and (bvsge (index!43408 lt!612139) #b00000000000000000000000000000000) (bvslt (index!43408 lt!612139) (size!46590 a!2901)))) (or ((_ is Undefined!10259) lt!612139) ((_ is Found!10259) lt!612139) (not ((_ is MissingZero!10259) lt!612139)) (and (bvsge (index!43407 lt!612139) #b00000000000000000000000000000000) (bvslt (index!43407 lt!612139) (size!46590 a!2901)))) (or ((_ is Undefined!10259) lt!612139) ((_ is Found!10259) lt!612139) ((_ is MissingZero!10259) lt!612139) (not ((_ is MissingVacant!10259) lt!612139)) (and (bvsge (index!43410 lt!612139) #b00000000000000000000000000000000) (bvslt (index!43410 lt!612139) (size!46590 a!2901)))) (or ((_ is Undefined!10259) lt!612139) (ite ((_ is Found!10259) lt!612139) (= (select (arr!46039 a!2901) (index!43408 lt!612139)) (select (arr!46039 a!2901) j!112)) (ite ((_ is MissingZero!10259) lt!612139) (= (select (arr!46039 a!2901) (index!43407 lt!612139)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!10259) lt!612139) (= (select (arr!46039 a!2901) (index!43410 lt!612139)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!150895 (= lt!612139 e!789446)))

(declare-fun c!130083 () Bool)

(assert (=> d!150895 (= c!130083 (and ((_ is Intermediate!10259) lt!612137) (undefined!11071 lt!612137)))))

(assert (=> d!150895 (= lt!612137 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46039 a!2901) j!112) mask!2840) (select (arr!46039 a!2901) j!112) a!2901 mask!2840))))

(assert (=> d!150895 (validMask!0 mask!2840)))

(assert (=> d!150895 (= (seekEntryOrOpen!0 (select (arr!46039 a!2901) j!112) a!2901 mask!2840) lt!612139)))

(assert (= (and d!150895 c!130083) b!1393980))

(assert (= (and d!150895 (not c!130083)) b!1393978))

(assert (= (and b!1393978 c!130082) b!1393977))

(assert (= (and b!1393978 (not c!130082)) b!1393976))

(assert (= (and b!1393976 c!130084) b!1393979))

(assert (= (and b!1393976 (not c!130084)) b!1393975))

(assert (=> b!1393975 m!1279705))

(declare-fun m!1279899 () Bool)

(assert (=> b!1393975 m!1279899))

(declare-fun m!1279901 () Bool)

(assert (=> b!1393978 m!1279901))

(assert (=> d!150895 m!1279705))

(assert (=> d!150895 m!1279707))

(declare-fun m!1279903 () Bool)

(assert (=> d!150895 m!1279903))

(declare-fun m!1279905 () Bool)

(assert (=> d!150895 m!1279905))

(assert (=> d!150895 m!1279707))

(assert (=> d!150895 m!1279705))

(assert (=> d!150895 m!1279711))

(declare-fun m!1279907 () Bool)

(assert (=> d!150895 m!1279907))

(assert (=> d!150895 m!1279733))

(assert (=> b!1393711 d!150895))

(declare-fun bm!66853 () Bool)

(declare-fun call!66856 () Bool)

(assert (=> bm!66853 (= call!66856 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1393981 () Bool)

(declare-fun e!789451 () Bool)

(declare-fun e!789449 () Bool)

(assert (=> b!1393981 (= e!789451 e!789449)))

(declare-fun lt!612144 () (_ BitVec 64))

(assert (=> b!1393981 (= lt!612144 (select (arr!46039 a!2901) #b00000000000000000000000000000000))))

(declare-fun lt!612143 () Unit!46549)

(assert (=> b!1393981 (= lt!612143 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!612144 #b00000000000000000000000000000000))))

(assert (=> b!1393981 (arrayContainsKey!0 a!2901 lt!612144 #b00000000000000000000000000000000)))

(declare-fun lt!612142 () Unit!46549)

(assert (=> b!1393981 (= lt!612142 lt!612143)))

(declare-fun res!932730 () Bool)

(assert (=> b!1393981 (= res!932730 (= (seekEntryOrOpen!0 (select (arr!46039 a!2901) #b00000000000000000000000000000000) a!2901 mask!2840) (Found!10259 #b00000000000000000000000000000000)))))

(assert (=> b!1393981 (=> (not res!932730) (not e!789449))))

(declare-fun b!1393982 () Bool)

(declare-fun e!789450 () Bool)

(assert (=> b!1393982 (= e!789450 e!789451)))

(declare-fun c!130085 () Bool)

(assert (=> b!1393982 (= c!130085 (validKeyInArray!0 (select (arr!46039 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1393983 () Bool)

(assert (=> b!1393983 (= e!789449 call!66856)))

(declare-fun b!1393984 () Bool)

(assert (=> b!1393984 (= e!789451 call!66856)))

(declare-fun d!150905 () Bool)

(declare-fun res!932729 () Bool)

(assert (=> d!150905 (=> res!932729 e!789450)))

(assert (=> d!150905 (= res!932729 (bvsge #b00000000000000000000000000000000 (size!46590 a!2901)))))

(assert (=> d!150905 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840) e!789450)))

(assert (= (and d!150905 (not res!932729)) b!1393982))

(assert (= (and b!1393982 c!130085) b!1393981))

(assert (= (and b!1393982 (not c!130085)) b!1393984))

(assert (= (and b!1393981 res!932730) b!1393983))

(assert (= (or b!1393983 b!1393984) bm!66853))

(declare-fun m!1279909 () Bool)

(assert (=> bm!66853 m!1279909))

(assert (=> b!1393981 m!1279827))

(declare-fun m!1279911 () Bool)

(assert (=> b!1393981 m!1279911))

(declare-fun m!1279913 () Bool)

(assert (=> b!1393981 m!1279913))

(assert (=> b!1393981 m!1279827))

(declare-fun m!1279915 () Bool)

(assert (=> b!1393981 m!1279915))

(assert (=> b!1393982 m!1279827))

(assert (=> b!1393982 m!1279827))

(assert (=> b!1393982 m!1279833))

(assert (=> b!1393706 d!150905))

(check-sat (not d!150895) (not b!1393849) (not b!1393832) (not b!1393982) (not d!150875) (not b!1393872) (not b!1393975) (not b!1393981) (not d!150869) (not bm!66853) (not b!1393829) (not b!1393848) (not bm!66843) (not b!1393788) (not d!150845) (not bm!66846) (not b!1393833))
(check-sat)
