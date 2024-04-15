; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120122 () Bool)

(assert start!120122)

(declare-fun b!1398589 () Bool)

(declare-fun e!791781 () Bool)

(declare-fun e!791780 () Bool)

(assert (=> b!1398589 (= e!791781 (not e!791780))))

(declare-fun res!937553 () Bool)

(assert (=> b!1398589 (=> res!937553 e!791780)))

(declare-datatypes ((SeekEntryResult!10499 0))(
  ( (MissingZero!10499 (index!44367 (_ BitVec 32))) (Found!10499 (index!44368 (_ BitVec 32))) (Intermediate!10499 (undefined!11311 Bool) (index!44369 (_ BitVec 32)) (x!126006 (_ BitVec 32))) (Undefined!10499) (MissingVacant!10499 (index!44370 (_ BitVec 32))) )
))
(declare-fun lt!614890 () SeekEntryResult!10499)

(get-info :version)

(assert (=> b!1398589 (= res!937553 (or (not ((_ is Intermediate!10499) lt!614890)) (undefined!11311 lt!614890)))))

(declare-fun e!791779 () Bool)

(assert (=> b!1398589 e!791779))

(declare-fun res!937558 () Bool)

(assert (=> b!1398589 (=> (not res!937558) (not e!791779))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95604 0))(
  ( (array!95605 (arr!46156 (Array (_ BitVec 32) (_ BitVec 64))) (size!46708 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95604)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95604 (_ BitVec 32)) Bool)

(assert (=> b!1398589 (= res!937558 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46845 0))(
  ( (Unit!46846) )
))
(declare-fun lt!614894 () Unit!46845)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95604 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46845)

(assert (=> b!1398589 (= lt!614894 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!614893 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95604 (_ BitVec 32)) SeekEntryResult!10499)

(assert (=> b!1398589 (= lt!614890 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!614893 (select (arr!46156 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1398589 (= lt!614893 (toIndex!0 (select (arr!46156 a!2901) j!112) mask!2840))))

(declare-fun b!1398590 () Bool)

(declare-fun res!937561 () Bool)

(assert (=> b!1398590 (=> (not res!937561) (not e!791781))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1398590 (= res!937561 (validKeyInArray!0 (select (arr!46156 a!2901) i!1037)))))

(declare-fun b!1398591 () Bool)

(declare-fun res!937560 () Bool)

(assert (=> b!1398591 (=> (not res!937560) (not e!791781))))

(declare-datatypes ((List!32753 0))(
  ( (Nil!32750) (Cons!32749 (h!33991 (_ BitVec 64)) (t!47439 List!32753)) )
))
(declare-fun arrayNoDuplicates!0 (array!95604 (_ BitVec 32) List!32753) Bool)

(assert (=> b!1398591 (= res!937560 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32750))))

(declare-fun b!1398592 () Bool)

(declare-fun e!791782 () Bool)

(assert (=> b!1398592 (= e!791780 e!791782)))

(declare-fun res!937559 () Bool)

(assert (=> b!1398592 (=> res!937559 e!791782)))

(declare-fun lt!614889 () SeekEntryResult!10499)

(assert (=> b!1398592 (= res!937559 (or (= lt!614890 lt!614889) (not ((_ is Intermediate!10499) lt!614889))))))

(declare-fun lt!614892 () (_ BitVec 64))

(assert (=> b!1398592 (= lt!614889 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!614892 mask!2840) lt!614892 (array!95605 (store (arr!46156 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46708 a!2901)) mask!2840))))

(assert (=> b!1398592 (= lt!614892 (select (store (arr!46156 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(declare-fun b!1398593 () Bool)

(declare-fun res!937557 () Bool)

(assert (=> b!1398593 (=> (not res!937557) (not e!791781))))

(assert (=> b!1398593 (= res!937557 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1398594 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95604 (_ BitVec 32)) SeekEntryResult!10499)

(assert (=> b!1398594 (= e!791779 (= (seekEntryOrOpen!0 (select (arr!46156 a!2901) j!112) a!2901 mask!2840) (Found!10499 j!112)))))

(declare-fun res!937556 () Bool)

(assert (=> start!120122 (=> (not res!937556) (not e!791781))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120122 (= res!937556 (validMask!0 mask!2840))))

(assert (=> start!120122 e!791781))

(assert (=> start!120122 true))

(declare-fun array_inv!35389 (array!95604) Bool)

(assert (=> start!120122 (array_inv!35389 a!2901)))

(declare-fun b!1398595 () Bool)

(assert (=> b!1398595 (= e!791782 (or (bvslt mask!2840 #b00000000000000000000000000000000) (bvslt (index!44369 lt!614889) #b00000000000000000000000000000000) (bvsge (index!44369 lt!614889) (bvadd #b00000000000000000000000000000001 mask!2840)) (and (bvsle (x!126006 lt!614889) #b01111111111111111111111111111110) (bvsge (x!126006 lt!614889) #b00000000000000000000000000000000))))))

(assert (=> b!1398595 (and (not (undefined!11311 lt!614889)) (= (index!44369 lt!614889) i!1037) (bvslt (x!126006 lt!614889) (x!126006 lt!614890)) (= (select (store (arr!46156 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44369 lt!614889)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!614891 () Unit!46845)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95604 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!46845)

(assert (=> b!1398595 (= lt!614891 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!614893 (x!126006 lt!614890) (index!44369 lt!614890) (x!126006 lt!614889) (index!44369 lt!614889) (undefined!11311 lt!614889) mask!2840))))

(declare-fun b!1398596 () Bool)

(declare-fun res!937554 () Bool)

(assert (=> b!1398596 (=> (not res!937554) (not e!791781))))

(assert (=> b!1398596 (= res!937554 (and (= (size!46708 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46708 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46708 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1398597 () Bool)

(declare-fun res!937555 () Bool)

(assert (=> b!1398597 (=> (not res!937555) (not e!791781))))

(assert (=> b!1398597 (= res!937555 (validKeyInArray!0 (select (arr!46156 a!2901) j!112)))))

(assert (= (and start!120122 res!937556) b!1398596))

(assert (= (and b!1398596 res!937554) b!1398590))

(assert (= (and b!1398590 res!937561) b!1398597))

(assert (= (and b!1398597 res!937555) b!1398593))

(assert (= (and b!1398593 res!937557) b!1398591))

(assert (= (and b!1398591 res!937560) b!1398589))

(assert (= (and b!1398589 res!937558) b!1398594))

(assert (= (and b!1398589 (not res!937553)) b!1398592))

(assert (= (and b!1398592 (not res!937559)) b!1398595))

(declare-fun m!1285357 () Bool)

(assert (=> b!1398592 m!1285357))

(declare-fun m!1285359 () Bool)

(assert (=> b!1398592 m!1285359))

(assert (=> b!1398592 m!1285357))

(declare-fun m!1285361 () Bool)

(assert (=> b!1398592 m!1285361))

(declare-fun m!1285363 () Bool)

(assert (=> b!1398592 m!1285363))

(declare-fun m!1285365 () Bool)

(assert (=> b!1398594 m!1285365))

(assert (=> b!1398594 m!1285365))

(declare-fun m!1285367 () Bool)

(assert (=> b!1398594 m!1285367))

(assert (=> b!1398595 m!1285359))

(declare-fun m!1285369 () Bool)

(assert (=> b!1398595 m!1285369))

(declare-fun m!1285371 () Bool)

(assert (=> b!1398595 m!1285371))

(assert (=> b!1398597 m!1285365))

(assert (=> b!1398597 m!1285365))

(declare-fun m!1285373 () Bool)

(assert (=> b!1398597 m!1285373))

(declare-fun m!1285375 () Bool)

(assert (=> b!1398591 m!1285375))

(assert (=> b!1398589 m!1285365))

(declare-fun m!1285377 () Bool)

(assert (=> b!1398589 m!1285377))

(assert (=> b!1398589 m!1285365))

(declare-fun m!1285379 () Bool)

(assert (=> b!1398589 m!1285379))

(assert (=> b!1398589 m!1285365))

(declare-fun m!1285381 () Bool)

(assert (=> b!1398589 m!1285381))

(declare-fun m!1285383 () Bool)

(assert (=> b!1398589 m!1285383))

(declare-fun m!1285385 () Bool)

(assert (=> b!1398593 m!1285385))

(declare-fun m!1285387 () Bool)

(assert (=> start!120122 m!1285387))

(declare-fun m!1285389 () Bool)

(assert (=> start!120122 m!1285389))

(declare-fun m!1285391 () Bool)

(assert (=> b!1398590 m!1285391))

(assert (=> b!1398590 m!1285391))

(declare-fun m!1285393 () Bool)

(assert (=> b!1398590 m!1285393))

(check-sat (not b!1398595) (not b!1398590) (not b!1398593) (not b!1398592) (not start!120122) (not b!1398591) (not b!1398589) (not b!1398594) (not b!1398597))
(check-sat)
(get-model)

(declare-fun d!150817 () Bool)

(assert (=> d!150817 (= (validKeyInArray!0 (select (arr!46156 a!2901) j!112)) (and (not (= (select (arr!46156 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46156 a!2901) j!112) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1398597 d!150817))

(declare-fun b!1398670 () Bool)

(declare-fun lt!614938 () SeekEntryResult!10499)

(assert (=> b!1398670 (and (bvsge (index!44369 lt!614938) #b00000000000000000000000000000000) (bvslt (index!44369 lt!614938) (size!46708 (array!95605 (store (arr!46156 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46708 a!2901)))))))

(declare-fun e!791828 () Bool)

(assert (=> b!1398670 (= e!791828 (= (select (arr!46156 (array!95605 (store (arr!46156 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46708 a!2901))) (index!44369 lt!614938)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1398671 () Bool)

(declare-fun e!791827 () Bool)

(assert (=> b!1398671 (= e!791827 (bvsge (x!126006 lt!614938) #b01111111111111111111111111111110))))

(declare-fun b!1398672 () Bool)

(assert (=> b!1398672 (and (bvsge (index!44369 lt!614938) #b00000000000000000000000000000000) (bvslt (index!44369 lt!614938) (size!46708 (array!95605 (store (arr!46156 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46708 a!2901)))))))

(declare-fun res!937622 () Bool)

(assert (=> b!1398672 (= res!937622 (= (select (arr!46156 (array!95605 (store (arr!46156 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46708 a!2901))) (index!44369 lt!614938)) lt!614892))))

(assert (=> b!1398672 (=> res!937622 e!791828)))

(declare-fun e!791824 () Bool)

(assert (=> b!1398672 (= e!791824 e!791828)))

(declare-fun b!1398673 () Bool)

(declare-fun e!791826 () SeekEntryResult!10499)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1398673 (= e!791826 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!614892 mask!2840) #b00000000000000000000000000000000 mask!2840) lt!614892 (array!95605 (store (arr!46156 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46708 a!2901)) mask!2840))))

(declare-fun b!1398674 () Bool)

(declare-fun e!791825 () SeekEntryResult!10499)

(assert (=> b!1398674 (= e!791825 (Intermediate!10499 true (toIndex!0 lt!614892 mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1398675 () Bool)

(assert (=> b!1398675 (= e!791827 e!791824)))

(declare-fun res!937623 () Bool)

(assert (=> b!1398675 (= res!937623 (and ((_ is Intermediate!10499) lt!614938) (not (undefined!11311 lt!614938)) (bvslt (x!126006 lt!614938) #b01111111111111111111111111111110) (bvsge (x!126006 lt!614938) #b00000000000000000000000000000000) (bvsge (x!126006 lt!614938) #b00000000000000000000000000000000)))))

(assert (=> b!1398675 (=> (not res!937623) (not e!791824))))

(declare-fun b!1398676 () Bool)

(assert (=> b!1398676 (= e!791826 (Intermediate!10499 false (toIndex!0 lt!614892 mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1398677 () Bool)

(assert (=> b!1398677 (and (bvsge (index!44369 lt!614938) #b00000000000000000000000000000000) (bvslt (index!44369 lt!614938) (size!46708 (array!95605 (store (arr!46156 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46708 a!2901)))))))

(declare-fun res!937624 () Bool)

(assert (=> b!1398677 (= res!937624 (= (select (arr!46156 (array!95605 (store (arr!46156 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46708 a!2901))) (index!44369 lt!614938)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1398677 (=> res!937624 e!791828)))

(declare-fun d!150819 () Bool)

(assert (=> d!150819 e!791827))

(declare-fun c!129984 () Bool)

(assert (=> d!150819 (= c!129984 (and ((_ is Intermediate!10499) lt!614938) (undefined!11311 lt!614938)))))

(assert (=> d!150819 (= lt!614938 e!791825)))

(declare-fun c!129983 () Bool)

(assert (=> d!150819 (= c!129983 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!614939 () (_ BitVec 64))

(assert (=> d!150819 (= lt!614939 (select (arr!46156 (array!95605 (store (arr!46156 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46708 a!2901))) (toIndex!0 lt!614892 mask!2840)))))

(assert (=> d!150819 (validMask!0 mask!2840)))

(assert (=> d!150819 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!614892 mask!2840) lt!614892 (array!95605 (store (arr!46156 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46708 a!2901)) mask!2840) lt!614938)))

(declare-fun b!1398678 () Bool)

(assert (=> b!1398678 (= e!791825 e!791826)))

(declare-fun c!129985 () Bool)

(assert (=> b!1398678 (= c!129985 (or (= lt!614939 lt!614892) (= (bvadd lt!614939 lt!614939) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!150819 c!129983) b!1398674))

(assert (= (and d!150819 (not c!129983)) b!1398678))

(assert (= (and b!1398678 c!129985) b!1398676))

(assert (= (and b!1398678 (not c!129985)) b!1398673))

(assert (= (and d!150819 c!129984) b!1398671))

(assert (= (and d!150819 (not c!129984)) b!1398675))

(assert (= (and b!1398675 res!937623) b!1398672))

(assert (= (and b!1398672 (not res!937622)) b!1398677))

(assert (= (and b!1398677 (not res!937624)) b!1398670))

(assert (=> d!150819 m!1285357))

(declare-fun m!1285473 () Bool)

(assert (=> d!150819 m!1285473))

(assert (=> d!150819 m!1285387))

(declare-fun m!1285475 () Bool)

(assert (=> b!1398677 m!1285475))

(assert (=> b!1398673 m!1285357))

(declare-fun m!1285477 () Bool)

(assert (=> b!1398673 m!1285477))

(assert (=> b!1398673 m!1285477))

(declare-fun m!1285479 () Bool)

(assert (=> b!1398673 m!1285479))

(assert (=> b!1398670 m!1285475))

(assert (=> b!1398672 m!1285475))

(assert (=> b!1398592 d!150819))

(declare-fun d!150827 () Bool)

(declare-fun lt!614945 () (_ BitVec 32))

(declare-fun lt!614944 () (_ BitVec 32))

(assert (=> d!150827 (= lt!614945 (bvmul (bvxor lt!614944 (bvlshr lt!614944 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!150827 (= lt!614944 ((_ extract 31 0) (bvand (bvxor lt!614892 (bvlshr lt!614892 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!150827 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!937625 (let ((h!33994 ((_ extract 31 0) (bvand (bvxor lt!614892 (bvlshr lt!614892 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!126011 (bvmul (bvxor h!33994 (bvlshr h!33994 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!126011 (bvlshr x!126011 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!937625 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!937625 #b00000000000000000000000000000000))))))

(assert (=> d!150827 (= (toIndex!0 lt!614892 mask!2840) (bvand (bvxor lt!614945 (bvlshr lt!614945 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1398592 d!150827))

(declare-fun b!1398697 () Bool)

(declare-fun e!791841 () Bool)

(declare-fun e!791843 () Bool)

(assert (=> b!1398697 (= e!791841 e!791843)))

(declare-fun res!937632 () Bool)

(assert (=> b!1398697 (=> (not res!937632) (not e!791843))))

(declare-fun e!791842 () Bool)

(assert (=> b!1398697 (= res!937632 (not e!791842))))

(declare-fun res!937633 () Bool)

(assert (=> b!1398697 (=> (not res!937633) (not e!791842))))

(assert (=> b!1398697 (= res!937633 (validKeyInArray!0 (select (arr!46156 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1398698 () Bool)

(declare-fun e!791844 () Bool)

(declare-fun call!66848 () Bool)

(assert (=> b!1398698 (= e!791844 call!66848)))

(declare-fun b!1398699 () Bool)

(assert (=> b!1398699 (= e!791843 e!791844)))

(declare-fun c!129992 () Bool)

(assert (=> b!1398699 (= c!129992 (validKeyInArray!0 (select (arr!46156 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1398700 () Bool)

(declare-fun contains!9745 (List!32753 (_ BitVec 64)) Bool)

(assert (=> b!1398700 (= e!791842 (contains!9745 Nil!32750 (select (arr!46156 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1398701 () Bool)

(assert (=> b!1398701 (= e!791844 call!66848)))

(declare-fun bm!66845 () Bool)

(assert (=> bm!66845 (= call!66848 (arrayNoDuplicates!0 a!2901 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!129992 (Cons!32749 (select (arr!46156 a!2901) #b00000000000000000000000000000000) Nil!32750) Nil!32750)))))

(declare-fun d!150829 () Bool)

(declare-fun res!937634 () Bool)

(assert (=> d!150829 (=> res!937634 e!791841)))

(assert (=> d!150829 (= res!937634 (bvsge #b00000000000000000000000000000000 (size!46708 a!2901)))))

(assert (=> d!150829 (= (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32750) e!791841)))

(assert (= (and d!150829 (not res!937634)) b!1398697))

(assert (= (and b!1398697 res!937633) b!1398700))

(assert (= (and b!1398697 res!937632) b!1398699))

(assert (= (and b!1398699 c!129992) b!1398701))

(assert (= (and b!1398699 (not c!129992)) b!1398698))

(assert (= (or b!1398701 b!1398698) bm!66845))

(declare-fun m!1285481 () Bool)

(assert (=> b!1398697 m!1285481))

(assert (=> b!1398697 m!1285481))

(declare-fun m!1285483 () Bool)

(assert (=> b!1398697 m!1285483))

(assert (=> b!1398699 m!1285481))

(assert (=> b!1398699 m!1285481))

(assert (=> b!1398699 m!1285483))

(assert (=> b!1398700 m!1285481))

(assert (=> b!1398700 m!1285481))

(declare-fun m!1285485 () Bool)

(assert (=> b!1398700 m!1285485))

(assert (=> bm!66845 m!1285481))

(declare-fun m!1285487 () Bool)

(assert (=> bm!66845 m!1285487))

(assert (=> b!1398591 d!150829))

(declare-fun b!1398739 () Bool)

(declare-fun e!791871 () Bool)

(declare-fun e!791872 () Bool)

(assert (=> b!1398739 (= e!791871 e!791872)))

(declare-fun c!130002 () Bool)

(assert (=> b!1398739 (= c!130002 (validKeyInArray!0 (select (arr!46156 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1398740 () Bool)

(declare-fun call!66851 () Bool)

(assert (=> b!1398740 (= e!791872 call!66851)))

(declare-fun d!150833 () Bool)

(declare-fun res!937656 () Bool)

(assert (=> d!150833 (=> res!937656 e!791871)))

(assert (=> d!150833 (= res!937656 (bvsge #b00000000000000000000000000000000 (size!46708 a!2901)))))

(assert (=> d!150833 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840) e!791871)))

(declare-fun b!1398741 () Bool)

(declare-fun e!791870 () Bool)

(assert (=> b!1398741 (= e!791872 e!791870)))

(declare-fun lt!614959 () (_ BitVec 64))

(assert (=> b!1398741 (= lt!614959 (select (arr!46156 a!2901) #b00000000000000000000000000000000))))

(declare-fun lt!614960 () Unit!46845)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!95604 (_ BitVec 64) (_ BitVec 32)) Unit!46845)

(assert (=> b!1398741 (= lt!614960 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!614959 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!95604 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1398741 (arrayContainsKey!0 a!2901 lt!614959 #b00000000000000000000000000000000)))

(declare-fun lt!614958 () Unit!46845)

(assert (=> b!1398741 (= lt!614958 lt!614960)))

(declare-fun res!937655 () Bool)

(assert (=> b!1398741 (= res!937655 (= (seekEntryOrOpen!0 (select (arr!46156 a!2901) #b00000000000000000000000000000000) a!2901 mask!2840) (Found!10499 #b00000000000000000000000000000000)))))

(assert (=> b!1398741 (=> (not res!937655) (not e!791870))))

(declare-fun bm!66848 () Bool)

(assert (=> bm!66848 (= call!66851 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1398742 () Bool)

(assert (=> b!1398742 (= e!791870 call!66851)))

(assert (= (and d!150833 (not res!937656)) b!1398739))

(assert (= (and b!1398739 c!130002) b!1398741))

(assert (= (and b!1398739 (not c!130002)) b!1398740))

(assert (= (and b!1398741 res!937655) b!1398742))

(assert (= (or b!1398742 b!1398740) bm!66848))

(assert (=> b!1398739 m!1285481))

(assert (=> b!1398739 m!1285481))

(assert (=> b!1398739 m!1285483))

(assert (=> b!1398741 m!1285481))

(declare-fun m!1285497 () Bool)

(assert (=> b!1398741 m!1285497))

(declare-fun m!1285499 () Bool)

(assert (=> b!1398741 m!1285499))

(assert (=> b!1398741 m!1285481))

(declare-fun m!1285501 () Bool)

(assert (=> b!1398741 m!1285501))

(declare-fun m!1285503 () Bool)

(assert (=> bm!66848 m!1285503))

(assert (=> b!1398593 d!150833))

(declare-fun b!1398743 () Bool)

(declare-fun e!791874 () Bool)

(declare-fun e!791875 () Bool)

(assert (=> b!1398743 (= e!791874 e!791875)))

(declare-fun c!130003 () Bool)

(assert (=> b!1398743 (= c!130003 (validKeyInArray!0 (select (arr!46156 a!2901) j!112)))))

(declare-fun b!1398744 () Bool)

(declare-fun call!66854 () Bool)

(assert (=> b!1398744 (= e!791875 call!66854)))

(declare-fun d!150843 () Bool)

(declare-fun res!937658 () Bool)

(assert (=> d!150843 (=> res!937658 e!791874)))

(assert (=> d!150843 (= res!937658 (bvsge j!112 (size!46708 a!2901)))))

(assert (=> d!150843 (= (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840) e!791874)))

(declare-fun b!1398745 () Bool)

(declare-fun e!791873 () Bool)

(assert (=> b!1398745 (= e!791875 e!791873)))

(declare-fun lt!614966 () (_ BitVec 64))

(assert (=> b!1398745 (= lt!614966 (select (arr!46156 a!2901) j!112))))

(declare-fun lt!614967 () Unit!46845)

(assert (=> b!1398745 (= lt!614967 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!614966 j!112))))

(assert (=> b!1398745 (arrayContainsKey!0 a!2901 lt!614966 #b00000000000000000000000000000000)))

(declare-fun lt!614965 () Unit!46845)

(assert (=> b!1398745 (= lt!614965 lt!614967)))

(declare-fun res!937657 () Bool)

(assert (=> b!1398745 (= res!937657 (= (seekEntryOrOpen!0 (select (arr!46156 a!2901) j!112) a!2901 mask!2840) (Found!10499 j!112)))))

(assert (=> b!1398745 (=> (not res!937657) (not e!791873))))

(declare-fun bm!66851 () Bool)

(assert (=> bm!66851 (= call!66854 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!112 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1398746 () Bool)

(assert (=> b!1398746 (= e!791873 call!66854)))

(assert (= (and d!150843 (not res!937658)) b!1398743))

(assert (= (and b!1398743 c!130003) b!1398745))

(assert (= (and b!1398743 (not c!130003)) b!1398744))

(assert (= (and b!1398745 res!937657) b!1398746))

(assert (= (or b!1398746 b!1398744) bm!66851))

(assert (=> b!1398743 m!1285365))

(assert (=> b!1398743 m!1285365))

(assert (=> b!1398743 m!1285373))

(assert (=> b!1398745 m!1285365))

(declare-fun m!1285505 () Bool)

(assert (=> b!1398745 m!1285505))

(declare-fun m!1285507 () Bool)

(assert (=> b!1398745 m!1285507))

(assert (=> b!1398745 m!1285365))

(assert (=> b!1398745 m!1285367))

(declare-fun m!1285509 () Bool)

(assert (=> bm!66851 m!1285509))

(assert (=> b!1398589 d!150843))

(declare-fun d!150847 () Bool)

(assert (=> d!150847 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!614972 () Unit!46845)

(declare-fun choose!38 (array!95604 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46845)

(assert (=> d!150847 (= lt!614972 (choose!38 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> d!150847 (validMask!0 mask!2840)))

(assert (=> d!150847 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112) lt!614972)))

(declare-fun bs!40694 () Bool)

(assert (= bs!40694 d!150847))

(assert (=> bs!40694 m!1285383))

(declare-fun m!1285519 () Bool)

(assert (=> bs!40694 m!1285519))

(assert (=> bs!40694 m!1285387))

(assert (=> b!1398589 d!150847))

(declare-fun b!1398752 () Bool)

(declare-fun lt!614973 () SeekEntryResult!10499)

(assert (=> b!1398752 (and (bvsge (index!44369 lt!614973) #b00000000000000000000000000000000) (bvslt (index!44369 lt!614973) (size!46708 a!2901)))))

(declare-fun e!791884 () Bool)

(assert (=> b!1398752 (= e!791884 (= (select (arr!46156 a!2901) (index!44369 lt!614973)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1398753 () Bool)

(declare-fun e!791883 () Bool)

(assert (=> b!1398753 (= e!791883 (bvsge (x!126006 lt!614973) #b01111111111111111111111111111110))))

(declare-fun b!1398754 () Bool)

(assert (=> b!1398754 (and (bvsge (index!44369 lt!614973) #b00000000000000000000000000000000) (bvslt (index!44369 lt!614973) (size!46708 a!2901)))))

(declare-fun res!937662 () Bool)

(assert (=> b!1398754 (= res!937662 (= (select (arr!46156 a!2901) (index!44369 lt!614973)) (select (arr!46156 a!2901) j!112)))))

(assert (=> b!1398754 (=> res!937662 e!791884)))

(declare-fun e!791880 () Bool)

(assert (=> b!1398754 (= e!791880 e!791884)))

(declare-fun e!791882 () SeekEntryResult!10499)

(declare-fun b!1398755 () Bool)

(assert (=> b!1398755 (= e!791882 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!614893 #b00000000000000000000000000000000 mask!2840) (select (arr!46156 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1398756 () Bool)

(declare-fun e!791881 () SeekEntryResult!10499)

(assert (=> b!1398756 (= e!791881 (Intermediate!10499 true lt!614893 #b00000000000000000000000000000000))))

(declare-fun b!1398757 () Bool)

(assert (=> b!1398757 (= e!791883 e!791880)))

(declare-fun res!937663 () Bool)

(assert (=> b!1398757 (= res!937663 (and ((_ is Intermediate!10499) lt!614973) (not (undefined!11311 lt!614973)) (bvslt (x!126006 lt!614973) #b01111111111111111111111111111110) (bvsge (x!126006 lt!614973) #b00000000000000000000000000000000) (bvsge (x!126006 lt!614973) #b00000000000000000000000000000000)))))

(assert (=> b!1398757 (=> (not res!937663) (not e!791880))))

(declare-fun b!1398758 () Bool)

(assert (=> b!1398758 (= e!791882 (Intermediate!10499 false lt!614893 #b00000000000000000000000000000000))))

(declare-fun b!1398759 () Bool)

(assert (=> b!1398759 (and (bvsge (index!44369 lt!614973) #b00000000000000000000000000000000) (bvslt (index!44369 lt!614973) (size!46708 a!2901)))))

(declare-fun res!937664 () Bool)

(assert (=> b!1398759 (= res!937664 (= (select (arr!46156 a!2901) (index!44369 lt!614973)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1398759 (=> res!937664 e!791884)))

(declare-fun d!150851 () Bool)

(assert (=> d!150851 e!791883))

(declare-fun c!130006 () Bool)

(assert (=> d!150851 (= c!130006 (and ((_ is Intermediate!10499) lt!614973) (undefined!11311 lt!614973)))))

(assert (=> d!150851 (= lt!614973 e!791881)))

(declare-fun c!130005 () Bool)

(assert (=> d!150851 (= c!130005 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!614974 () (_ BitVec 64))

(assert (=> d!150851 (= lt!614974 (select (arr!46156 a!2901) lt!614893))))

(assert (=> d!150851 (validMask!0 mask!2840)))

(assert (=> d!150851 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!614893 (select (arr!46156 a!2901) j!112) a!2901 mask!2840) lt!614973)))

(declare-fun b!1398760 () Bool)

(assert (=> b!1398760 (= e!791881 e!791882)))

(declare-fun c!130007 () Bool)

(assert (=> b!1398760 (= c!130007 (or (= lt!614974 (select (arr!46156 a!2901) j!112)) (= (bvadd lt!614974 lt!614974) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!150851 c!130005) b!1398756))

(assert (= (and d!150851 (not c!130005)) b!1398760))

(assert (= (and b!1398760 c!130007) b!1398758))

(assert (= (and b!1398760 (not c!130007)) b!1398755))

(assert (= (and d!150851 c!130006) b!1398753))

(assert (= (and d!150851 (not c!130006)) b!1398757))

(assert (= (and b!1398757 res!937663) b!1398754))

(assert (= (and b!1398754 (not res!937662)) b!1398759))

(assert (= (and b!1398759 (not res!937664)) b!1398752))

(declare-fun m!1285521 () Bool)

(assert (=> d!150851 m!1285521))

(assert (=> d!150851 m!1285387))

(declare-fun m!1285523 () Bool)

(assert (=> b!1398759 m!1285523))

(declare-fun m!1285525 () Bool)

(assert (=> b!1398755 m!1285525))

(assert (=> b!1398755 m!1285525))

(assert (=> b!1398755 m!1285365))

(declare-fun m!1285527 () Bool)

(assert (=> b!1398755 m!1285527))

(assert (=> b!1398752 m!1285523))

(assert (=> b!1398754 m!1285523))

(assert (=> b!1398589 d!150851))

(declare-fun d!150853 () Bool)

(declare-fun lt!614976 () (_ BitVec 32))

(declare-fun lt!614975 () (_ BitVec 32))

(assert (=> d!150853 (= lt!614976 (bvmul (bvxor lt!614975 (bvlshr lt!614975 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!150853 (= lt!614975 ((_ extract 31 0) (bvand (bvxor (select (arr!46156 a!2901) j!112) (bvlshr (select (arr!46156 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!150853 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!937625 (let ((h!33994 ((_ extract 31 0) (bvand (bvxor (select (arr!46156 a!2901) j!112) (bvlshr (select (arr!46156 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!126011 (bvmul (bvxor h!33994 (bvlshr h!33994 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!126011 (bvlshr x!126011 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!937625 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!937625 #b00000000000000000000000000000000))))))

(assert (=> d!150853 (= (toIndex!0 (select (arr!46156 a!2901) j!112) mask!2840) (bvand (bvxor lt!614976 (bvlshr lt!614976 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1398589 d!150853))

(declare-fun b!1398797 () Bool)

(declare-fun e!791907 () SeekEntryResult!10499)

(declare-fun e!791906 () SeekEntryResult!10499)

(assert (=> b!1398797 (= e!791907 e!791906)))

(declare-fun lt!615002 () (_ BitVec 64))

(declare-fun lt!615003 () SeekEntryResult!10499)

(assert (=> b!1398797 (= lt!615002 (select (arr!46156 a!2901) (index!44369 lt!615003)))))

(declare-fun c!130024 () Bool)

(assert (=> b!1398797 (= c!130024 (= lt!615002 (select (arr!46156 a!2901) j!112)))))

(declare-fun b!1398798 () Bool)

(assert (=> b!1398798 (= e!791906 (Found!10499 (index!44369 lt!615003)))))

(declare-fun b!1398799 () Bool)

(assert (=> b!1398799 (= e!791907 Undefined!10499)))

(declare-fun d!150855 () Bool)

(declare-fun lt!615001 () SeekEntryResult!10499)

(assert (=> d!150855 (and (or ((_ is Undefined!10499) lt!615001) (not ((_ is Found!10499) lt!615001)) (and (bvsge (index!44368 lt!615001) #b00000000000000000000000000000000) (bvslt (index!44368 lt!615001) (size!46708 a!2901)))) (or ((_ is Undefined!10499) lt!615001) ((_ is Found!10499) lt!615001) (not ((_ is MissingZero!10499) lt!615001)) (and (bvsge (index!44367 lt!615001) #b00000000000000000000000000000000) (bvslt (index!44367 lt!615001) (size!46708 a!2901)))) (or ((_ is Undefined!10499) lt!615001) ((_ is Found!10499) lt!615001) ((_ is MissingZero!10499) lt!615001) (not ((_ is MissingVacant!10499) lt!615001)) (and (bvsge (index!44370 lt!615001) #b00000000000000000000000000000000) (bvslt (index!44370 lt!615001) (size!46708 a!2901)))) (or ((_ is Undefined!10499) lt!615001) (ite ((_ is Found!10499) lt!615001) (= (select (arr!46156 a!2901) (index!44368 lt!615001)) (select (arr!46156 a!2901) j!112)) (ite ((_ is MissingZero!10499) lt!615001) (= (select (arr!46156 a!2901) (index!44367 lt!615001)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!10499) lt!615001) (= (select (arr!46156 a!2901) (index!44370 lt!615001)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!150855 (= lt!615001 e!791907)))

(declare-fun c!130025 () Bool)

(assert (=> d!150855 (= c!130025 (and ((_ is Intermediate!10499) lt!615003) (undefined!11311 lt!615003)))))

(assert (=> d!150855 (= lt!615003 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46156 a!2901) j!112) mask!2840) (select (arr!46156 a!2901) j!112) a!2901 mask!2840))))

(assert (=> d!150855 (validMask!0 mask!2840)))

(assert (=> d!150855 (= (seekEntryOrOpen!0 (select (arr!46156 a!2901) j!112) a!2901 mask!2840) lt!615001)))

(declare-fun b!1398800 () Bool)

(declare-fun e!791908 () SeekEntryResult!10499)

(assert (=> b!1398800 (= e!791908 (MissingZero!10499 (index!44369 lt!615003)))))

(declare-fun b!1398801 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95604 (_ BitVec 32)) SeekEntryResult!10499)

(assert (=> b!1398801 (= e!791908 (seekKeyOrZeroReturnVacant!0 (x!126006 lt!615003) (index!44369 lt!615003) (index!44369 lt!615003) (select (arr!46156 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1398802 () Bool)

(declare-fun c!130023 () Bool)

(assert (=> b!1398802 (= c!130023 (= lt!615002 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1398802 (= e!791906 e!791908)))

(assert (= (and d!150855 c!130025) b!1398799))

(assert (= (and d!150855 (not c!130025)) b!1398797))

(assert (= (and b!1398797 c!130024) b!1398798))

(assert (= (and b!1398797 (not c!130024)) b!1398802))

(assert (= (and b!1398802 c!130023) b!1398800))

(assert (= (and b!1398802 (not c!130023)) b!1398801))

(declare-fun m!1285539 () Bool)

(assert (=> b!1398797 m!1285539))

(declare-fun m!1285541 () Bool)

(assert (=> d!150855 m!1285541))

(assert (=> d!150855 m!1285379))

(assert (=> d!150855 m!1285365))

(declare-fun m!1285543 () Bool)

(assert (=> d!150855 m!1285543))

(assert (=> d!150855 m!1285387))

(declare-fun m!1285545 () Bool)

(assert (=> d!150855 m!1285545))

(declare-fun m!1285547 () Bool)

(assert (=> d!150855 m!1285547))

(assert (=> d!150855 m!1285365))

(assert (=> d!150855 m!1285379))

(assert (=> b!1398801 m!1285365))

(declare-fun m!1285549 () Bool)

(assert (=> b!1398801 m!1285549))

(assert (=> b!1398594 d!150855))

(declare-fun d!150865 () Bool)

(assert (=> d!150865 (and (not (undefined!11311 lt!614889)) (= (index!44369 lt!614889) i!1037) (bvslt (x!126006 lt!614889) (x!126006 lt!614890)))))

(declare-fun lt!615009 () Unit!46845)

(declare-fun choose!62 (array!95604 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!46845)

(assert (=> d!150865 (= lt!615009 (choose!62 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!614893 (x!126006 lt!614890) (index!44369 lt!614890) (x!126006 lt!614889) (index!44369 lt!614889) (undefined!11311 lt!614889) mask!2840))))

(assert (=> d!150865 (validMask!0 mask!2840)))

(assert (=> d!150865 (= (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!614893 (x!126006 lt!614890) (index!44369 lt!614890) (x!126006 lt!614889) (index!44369 lt!614889) (undefined!11311 lt!614889) mask!2840) lt!615009)))

(declare-fun bs!40696 () Bool)

(assert (= bs!40696 d!150865))

(declare-fun m!1285551 () Bool)

(assert (=> bs!40696 m!1285551))

(assert (=> bs!40696 m!1285387))

(assert (=> b!1398595 d!150865))

(declare-fun d!150867 () Bool)

(assert (=> d!150867 (= (validMask!0 mask!2840) (and (or (= mask!2840 #b00000000000000000000000000000111) (= mask!2840 #b00000000000000000000000000001111) (= mask!2840 #b00000000000000000000000000011111) (= mask!2840 #b00000000000000000000000000111111) (= mask!2840 #b00000000000000000000000001111111) (= mask!2840 #b00000000000000000000000011111111) (= mask!2840 #b00000000000000000000000111111111) (= mask!2840 #b00000000000000000000001111111111) (= mask!2840 #b00000000000000000000011111111111) (= mask!2840 #b00000000000000000000111111111111) (= mask!2840 #b00000000000000000001111111111111) (= mask!2840 #b00000000000000000011111111111111) (= mask!2840 #b00000000000000000111111111111111) (= mask!2840 #b00000000000000001111111111111111) (= mask!2840 #b00000000000000011111111111111111) (= mask!2840 #b00000000000000111111111111111111) (= mask!2840 #b00000000000001111111111111111111) (= mask!2840 #b00000000000011111111111111111111) (= mask!2840 #b00000000000111111111111111111111) (= mask!2840 #b00000000001111111111111111111111) (= mask!2840 #b00000000011111111111111111111111) (= mask!2840 #b00000000111111111111111111111111) (= mask!2840 #b00000001111111111111111111111111) (= mask!2840 #b00000011111111111111111111111111) (= mask!2840 #b00000111111111111111111111111111) (= mask!2840 #b00001111111111111111111111111111) (= mask!2840 #b00011111111111111111111111111111) (= mask!2840 #b00111111111111111111111111111111)) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(assert (=> start!120122 d!150867))

(declare-fun d!150881 () Bool)

(assert (=> d!150881 (= (array_inv!35389 a!2901) (bvsge (size!46708 a!2901) #b00000000000000000000000000000000))))

(assert (=> start!120122 d!150881))

(declare-fun d!150883 () Bool)

(assert (=> d!150883 (= (validKeyInArray!0 (select (arr!46156 a!2901) i!1037)) (and (not (= (select (arr!46156 a!2901) i!1037) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46156 a!2901) i!1037) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1398590 d!150883))

(check-sat (not b!1398697) (not b!1398699) (not d!150865) (not d!150851) (not d!150819) (not b!1398745) (not b!1398673) (not b!1398801) (not b!1398741) (not b!1398755) (not bm!66851) (not d!150855) (not b!1398700) (not d!150847) (not b!1398743) (not bm!66845) (not b!1398739) (not bm!66848))
(check-sat)
