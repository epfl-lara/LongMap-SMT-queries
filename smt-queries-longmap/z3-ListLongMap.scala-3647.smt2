; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50304 () Bool)

(assert start!50304)

(declare-fun b!550411 () Bool)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun e!317748 () Bool)

(declare-datatypes ((array!34704 0))(
  ( (array!34705 (arr!16666 (Array (_ BitVec 32) (_ BitVec 64))) (size!17030 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34704)

(declare-datatypes ((SeekEntryResult!5071 0))(
  ( (MissingZero!5071 (index!22511 (_ BitVec 32))) (Found!5071 (index!22512 (_ BitVec 32))) (Intermediate!5071 (undefined!5883 Bool) (index!22513 (_ BitVec 32)) (x!51588 (_ BitVec 32))) (Undefined!5071) (MissingVacant!5071 (index!22514 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34704 (_ BitVec 32)) SeekEntryResult!5071)

(assert (=> b!550411 (= e!317748 (= (seekEntryOrOpen!0 (select (arr!16666 a!3118) j!142) a!3118 mask!3119) (Found!5071 j!142)))))

(declare-fun b!550412 () Bool)

(declare-fun res!343458 () Bool)

(declare-fun e!317749 () Bool)

(assert (=> b!550412 (=> (not res!343458) (not e!317749))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34704 (_ BitVec 32)) SeekEntryResult!5071)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!550412 (= res!343458 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16666 a!3118) j!142) mask!3119) (select (arr!16666 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16666 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!16666 a!3118) i!1132 k0!1914) j!142) (array!34705 (store (arr!16666 a!3118) i!1132 k0!1914) (size!17030 a!3118)) mask!3119)))))

(declare-fun res!343454 () Bool)

(declare-fun e!317751 () Bool)

(assert (=> start!50304 (=> (not res!343454) (not e!317751))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50304 (= res!343454 (validMask!0 mask!3119))))

(assert (=> start!50304 e!317751))

(assert (=> start!50304 true))

(declare-fun array_inv!12525 (array!34704) Bool)

(assert (=> start!50304 (array_inv!12525 a!3118)))

(declare-fun b!550413 () Bool)

(declare-fun res!343452 () Bool)

(assert (=> b!550413 (=> (not res!343452) (not e!317751))))

(assert (=> b!550413 (= res!343452 (and (= (size!17030 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17030 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17030 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!550414 () Bool)

(assert (=> b!550414 (= e!317751 e!317749)))

(declare-fun res!343457 () Bool)

(assert (=> b!550414 (=> (not res!343457) (not e!317749))))

(declare-fun lt!250545 () SeekEntryResult!5071)

(assert (=> b!550414 (= res!343457 (or (= lt!250545 (MissingZero!5071 i!1132)) (= lt!250545 (MissingVacant!5071 i!1132))))))

(assert (=> b!550414 (= lt!250545 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!550415 () Bool)

(declare-fun res!343450 () Bool)

(assert (=> b!550415 (=> (not res!343450) (not e!317751))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!550415 (= res!343450 (validKeyInArray!0 (select (arr!16666 a!3118) j!142)))))

(declare-fun b!550416 () Bool)

(declare-fun res!343451 () Bool)

(assert (=> b!550416 (=> (not res!343451) (not e!317749))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34704 (_ BitVec 32)) Bool)

(assert (=> b!550416 (= res!343451 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!550417 () Bool)

(declare-fun res!343455 () Bool)

(assert (=> b!550417 (=> (not res!343455) (not e!317751))))

(declare-fun arrayContainsKey!0 (array!34704 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!550417 (= res!343455 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!550418 () Bool)

(declare-fun res!343456 () Bool)

(assert (=> b!550418 (=> (not res!343456) (not e!317749))))

(declare-datatypes ((List!10653 0))(
  ( (Nil!10650) (Cons!10649 (h!11625 (_ BitVec 64)) (t!16873 List!10653)) )
))
(declare-fun arrayNoDuplicates!0 (array!34704 (_ BitVec 32) List!10653) Bool)

(assert (=> b!550418 (= res!343456 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10650))))

(declare-fun b!550419 () Bool)

(declare-fun res!343453 () Bool)

(assert (=> b!550419 (=> (not res!343453) (not e!317751))))

(assert (=> b!550419 (= res!343453 (validKeyInArray!0 k0!1914))))

(declare-fun b!550420 () Bool)

(assert (=> b!550420 (= e!317749 (not (or (bvslt mask!3119 #b00000000000000000000000000000000) (bvsle mask!3119 #b00111111111111111111111111111111))))))

(assert (=> b!550420 e!317748))

(declare-fun res!343459 () Bool)

(assert (=> b!550420 (=> (not res!343459) (not e!317748))))

(assert (=> b!550420 (= res!343459 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!16987 0))(
  ( (Unit!16988) )
))
(declare-fun lt!250546 () Unit!16987)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34704 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16987)

(assert (=> b!550420 (= lt!250546 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (= (and start!50304 res!343454) b!550413))

(assert (= (and b!550413 res!343452) b!550415))

(assert (= (and b!550415 res!343450) b!550419))

(assert (= (and b!550419 res!343453) b!550417))

(assert (= (and b!550417 res!343455) b!550414))

(assert (= (and b!550414 res!343457) b!550416))

(assert (= (and b!550416 res!343451) b!550418))

(assert (= (and b!550418 res!343456) b!550412))

(assert (= (and b!550412 res!343458) b!550420))

(assert (= (and b!550420 res!343459) b!550411))

(declare-fun m!527585 () Bool)

(assert (=> b!550419 m!527585))

(declare-fun m!527587 () Bool)

(assert (=> b!550418 m!527587))

(declare-fun m!527589 () Bool)

(assert (=> start!50304 m!527589))

(declare-fun m!527591 () Bool)

(assert (=> start!50304 m!527591))

(declare-fun m!527593 () Bool)

(assert (=> b!550411 m!527593))

(assert (=> b!550411 m!527593))

(declare-fun m!527595 () Bool)

(assert (=> b!550411 m!527595))

(declare-fun m!527597 () Bool)

(assert (=> b!550417 m!527597))

(declare-fun m!527599 () Bool)

(assert (=> b!550420 m!527599))

(declare-fun m!527601 () Bool)

(assert (=> b!550420 m!527601))

(declare-fun m!527603 () Bool)

(assert (=> b!550414 m!527603))

(assert (=> b!550415 m!527593))

(assert (=> b!550415 m!527593))

(declare-fun m!527605 () Bool)

(assert (=> b!550415 m!527605))

(declare-fun m!527607 () Bool)

(assert (=> b!550416 m!527607))

(assert (=> b!550412 m!527593))

(declare-fun m!527609 () Bool)

(assert (=> b!550412 m!527609))

(assert (=> b!550412 m!527593))

(declare-fun m!527611 () Bool)

(assert (=> b!550412 m!527611))

(declare-fun m!527613 () Bool)

(assert (=> b!550412 m!527613))

(assert (=> b!550412 m!527611))

(declare-fun m!527615 () Bool)

(assert (=> b!550412 m!527615))

(assert (=> b!550412 m!527609))

(assert (=> b!550412 m!527593))

(declare-fun m!527617 () Bool)

(assert (=> b!550412 m!527617))

(declare-fun m!527619 () Bool)

(assert (=> b!550412 m!527619))

(assert (=> b!550412 m!527611))

(assert (=> b!550412 m!527613))

(check-sat (not b!550416) (not b!550418) (not b!550414) (not b!550412) (not b!550411) (not b!550415) (not b!550420) (not start!50304) (not b!550419) (not b!550417))
(check-sat)
(get-model)

(declare-fun bm!32250 () Bool)

(declare-fun call!32253 () Bool)

(declare-fun c!63815 () Bool)

(assert (=> bm!32250 (= call!32253 (arrayNoDuplicates!0 a!3118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!63815 (Cons!10649 (select (arr!16666 a!3118) #b00000000000000000000000000000000) Nil!10650) Nil!10650)))))

(declare-fun b!550491 () Bool)

(declare-fun e!317784 () Bool)

(assert (=> b!550491 (= e!317784 call!32253)))

(declare-fun b!550493 () Bool)

(declare-fun e!317786 () Bool)

(declare-fun e!317785 () Bool)

(assert (=> b!550493 (= e!317786 e!317785)))

(declare-fun res!343527 () Bool)

(assert (=> b!550493 (=> (not res!343527) (not e!317785))))

(declare-fun e!317787 () Bool)

(assert (=> b!550493 (= res!343527 (not e!317787))))

(declare-fun res!343526 () Bool)

(assert (=> b!550493 (=> (not res!343526) (not e!317787))))

(assert (=> b!550493 (= res!343526 (validKeyInArray!0 (select (arr!16666 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!550494 () Bool)

(assert (=> b!550494 (= e!317784 call!32253)))

(declare-fun b!550495 () Bool)

(declare-fun contains!2808 (List!10653 (_ BitVec 64)) Bool)

(assert (=> b!550495 (= e!317787 (contains!2808 Nil!10650 (select (arr!16666 a!3118) #b00000000000000000000000000000000)))))

(declare-fun d!82919 () Bool)

(declare-fun res!343528 () Bool)

(assert (=> d!82919 (=> res!343528 e!317786)))

(assert (=> d!82919 (= res!343528 (bvsge #b00000000000000000000000000000000 (size!17030 a!3118)))))

(assert (=> d!82919 (= (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10650) e!317786)))

(declare-fun b!550492 () Bool)

(assert (=> b!550492 (= e!317785 e!317784)))

(assert (=> b!550492 (= c!63815 (validKeyInArray!0 (select (arr!16666 a!3118) #b00000000000000000000000000000000)))))

(assert (= (and d!82919 (not res!343528)) b!550493))

(assert (= (and b!550493 res!343526) b!550495))

(assert (= (and b!550493 res!343527) b!550492))

(assert (= (and b!550492 c!63815) b!550491))

(assert (= (and b!550492 (not c!63815)) b!550494))

(assert (= (or b!550491 b!550494) bm!32250))

(declare-fun m!527693 () Bool)

(assert (=> bm!32250 m!527693))

(declare-fun m!527695 () Bool)

(assert (=> bm!32250 m!527695))

(assert (=> b!550493 m!527693))

(assert (=> b!550493 m!527693))

(declare-fun m!527697 () Bool)

(assert (=> b!550493 m!527697))

(assert (=> b!550495 m!527693))

(assert (=> b!550495 m!527693))

(declare-fun m!527699 () Bool)

(assert (=> b!550495 m!527699))

(assert (=> b!550492 m!527693))

(assert (=> b!550492 m!527693))

(assert (=> b!550492 m!527697))

(assert (=> b!550418 d!82919))

(declare-fun d!82921 () Bool)

(declare-fun res!343533 () Bool)

(declare-fun e!317792 () Bool)

(assert (=> d!82921 (=> res!343533 e!317792)))

(assert (=> d!82921 (= res!343533 (= (select (arr!16666 a!3118) #b00000000000000000000000000000000) k0!1914))))

(assert (=> d!82921 (= (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000) e!317792)))

(declare-fun b!550500 () Bool)

(declare-fun e!317793 () Bool)

(assert (=> b!550500 (= e!317792 e!317793)))

(declare-fun res!343534 () Bool)

(assert (=> b!550500 (=> (not res!343534) (not e!317793))))

(assert (=> b!550500 (= res!343534 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!17030 a!3118)))))

(declare-fun b!550501 () Bool)

(assert (=> b!550501 (= e!317793 (arrayContainsKey!0 a!3118 k0!1914 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!82921 (not res!343533)) b!550500))

(assert (= (and b!550500 res!343534) b!550501))

(assert (=> d!82921 m!527693))

(declare-fun m!527701 () Bool)

(assert (=> b!550501 m!527701))

(assert (=> b!550417 d!82921))

(declare-fun b!550557 () Bool)

(declare-fun lt!250580 () SeekEntryResult!5071)

(assert (=> b!550557 (and (bvsge (index!22513 lt!250580) #b00000000000000000000000000000000) (bvslt (index!22513 lt!250580) (size!17030 a!3118)))))

(declare-fun res!343559 () Bool)

(assert (=> b!550557 (= res!343559 (= (select (arr!16666 a!3118) (index!22513 lt!250580)) (select (arr!16666 a!3118) j!142)))))

(declare-fun e!317833 () Bool)

(assert (=> b!550557 (=> res!343559 e!317833)))

(declare-fun e!317832 () Bool)

(assert (=> b!550557 (= e!317832 e!317833)))

(declare-fun e!317829 () SeekEntryResult!5071)

(declare-fun b!550558 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!550558 (= e!317829 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!16666 a!3118) j!142) mask!3119) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3119) (select (arr!16666 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!550559 () Bool)

(declare-fun e!317830 () Bool)

(assert (=> b!550559 (= e!317830 e!317832)))

(declare-fun res!343560 () Bool)

(get-info :version)

(assert (=> b!550559 (= res!343560 (and ((_ is Intermediate!5071) lt!250580) (not (undefined!5883 lt!250580)) (bvslt (x!51588 lt!250580) #b01111111111111111111111111111110) (bvsge (x!51588 lt!250580) #b00000000000000000000000000000000) (bvsge (x!51588 lt!250580) #b00000000000000000000000000000000)))))

(assert (=> b!550559 (=> (not res!343560) (not e!317832))))

(declare-fun b!550560 () Bool)

(assert (=> b!550560 (= e!317829 (Intermediate!5071 false (toIndex!0 (select (arr!16666 a!3118) j!142) mask!3119) #b00000000000000000000000000000000))))

(declare-fun b!550561 () Bool)

(declare-fun e!317831 () SeekEntryResult!5071)

(assert (=> b!550561 (= e!317831 e!317829)))

(declare-fun c!63833 () Bool)

(declare-fun lt!250579 () (_ BitVec 64))

(assert (=> b!550561 (= c!63833 (or (= lt!250579 (select (arr!16666 a!3118) j!142)) (= (bvadd lt!250579 lt!250579) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!550562 () Bool)

(assert (=> b!550562 (and (bvsge (index!22513 lt!250580) #b00000000000000000000000000000000) (bvslt (index!22513 lt!250580) (size!17030 a!3118)))))

(declare-fun res!343561 () Bool)

(assert (=> b!550562 (= res!343561 (= (select (arr!16666 a!3118) (index!22513 lt!250580)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!550562 (=> res!343561 e!317833)))

(declare-fun b!550563 () Bool)

(assert (=> b!550563 (= e!317831 (Intermediate!5071 true (toIndex!0 (select (arr!16666 a!3118) j!142) mask!3119) #b00000000000000000000000000000000))))

(declare-fun b!550564 () Bool)

(assert (=> b!550564 (and (bvsge (index!22513 lt!250580) #b00000000000000000000000000000000) (bvslt (index!22513 lt!250580) (size!17030 a!3118)))))

(assert (=> b!550564 (= e!317833 (= (select (arr!16666 a!3118) (index!22513 lt!250580)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!550556 () Bool)

(assert (=> b!550556 (= e!317830 (bvsge (x!51588 lt!250580) #b01111111111111111111111111111110))))

(declare-fun d!82925 () Bool)

(assert (=> d!82925 e!317830))

(declare-fun c!63831 () Bool)

(assert (=> d!82925 (= c!63831 (and ((_ is Intermediate!5071) lt!250580) (undefined!5883 lt!250580)))))

(assert (=> d!82925 (= lt!250580 e!317831)))

(declare-fun c!63832 () Bool)

(assert (=> d!82925 (= c!63832 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!82925 (= lt!250579 (select (arr!16666 a!3118) (toIndex!0 (select (arr!16666 a!3118) j!142) mask!3119)))))

(assert (=> d!82925 (validMask!0 mask!3119)))

(assert (=> d!82925 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16666 a!3118) j!142) mask!3119) (select (arr!16666 a!3118) j!142) a!3118 mask!3119) lt!250580)))

(assert (= (and d!82925 c!63832) b!550563))

(assert (= (and d!82925 (not c!63832)) b!550561))

(assert (= (and b!550561 c!63833) b!550560))

(assert (= (and b!550561 (not c!63833)) b!550558))

(assert (= (and d!82925 c!63831) b!550556))

(assert (= (and d!82925 (not c!63831)) b!550559))

(assert (= (and b!550559 res!343560) b!550557))

(assert (= (and b!550557 (not res!343559)) b!550562))

(assert (= (and b!550562 (not res!343561)) b!550564))

(declare-fun m!527715 () Bool)

(assert (=> b!550564 m!527715))

(assert (=> b!550562 m!527715))

(assert (=> b!550558 m!527609))

(declare-fun m!527717 () Bool)

(assert (=> b!550558 m!527717))

(assert (=> b!550558 m!527717))

(assert (=> b!550558 m!527593))

(declare-fun m!527719 () Bool)

(assert (=> b!550558 m!527719))

(assert (=> d!82925 m!527609))

(declare-fun m!527721 () Bool)

(assert (=> d!82925 m!527721))

(assert (=> d!82925 m!527589))

(assert (=> b!550557 m!527715))

(assert (=> b!550412 d!82925))

(declare-fun d!82937 () Bool)

(declare-fun lt!250588 () (_ BitVec 32))

(declare-fun lt!250587 () (_ BitVec 32))

(assert (=> d!82937 (= lt!250588 (bvmul (bvxor lt!250587 (bvlshr lt!250587 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!82937 (= lt!250587 ((_ extract 31 0) (bvand (bvxor (select (arr!16666 a!3118) j!142) (bvlshr (select (arr!16666 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!82937 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!343562 (let ((h!11628 ((_ extract 31 0) (bvand (bvxor (select (arr!16666 a!3118) j!142) (bvlshr (select (arr!16666 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!51593 (bvmul (bvxor h!11628 (bvlshr h!11628 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!51593 (bvlshr x!51593 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!343562 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!343562 #b00000000000000000000000000000000))))))

(assert (=> d!82937 (= (toIndex!0 (select (arr!16666 a!3118) j!142) mask!3119) (bvand (bvxor lt!250588 (bvlshr lt!250588 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!550412 d!82937))

(declare-fun lt!250590 () SeekEntryResult!5071)

(declare-fun b!550575 () Bool)

(assert (=> b!550575 (and (bvsge (index!22513 lt!250590) #b00000000000000000000000000000000) (bvslt (index!22513 lt!250590) (size!17030 (array!34705 (store (arr!16666 a!3118) i!1132 k0!1914) (size!17030 a!3118)))))))

(declare-fun res!343567 () Bool)

(assert (=> b!550575 (= res!343567 (= (select (arr!16666 (array!34705 (store (arr!16666 a!3118) i!1132 k0!1914) (size!17030 a!3118))) (index!22513 lt!250590)) (select (store (arr!16666 a!3118) i!1132 k0!1914) j!142)))))

(declare-fun e!317843 () Bool)

(assert (=> b!550575 (=> res!343567 e!317843)))

(declare-fun e!317842 () Bool)

(assert (=> b!550575 (= e!317842 e!317843)))

(declare-fun e!317839 () SeekEntryResult!5071)

(declare-fun b!550576 () Bool)

(assert (=> b!550576 (= e!317839 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (store (arr!16666 a!3118) i!1132 k0!1914) j!142) mask!3119) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3119) (select (store (arr!16666 a!3118) i!1132 k0!1914) j!142) (array!34705 (store (arr!16666 a!3118) i!1132 k0!1914) (size!17030 a!3118)) mask!3119))))

(declare-fun b!550577 () Bool)

(declare-fun e!317840 () Bool)

(assert (=> b!550577 (= e!317840 e!317842)))

(declare-fun res!343568 () Bool)

(assert (=> b!550577 (= res!343568 (and ((_ is Intermediate!5071) lt!250590) (not (undefined!5883 lt!250590)) (bvslt (x!51588 lt!250590) #b01111111111111111111111111111110) (bvsge (x!51588 lt!250590) #b00000000000000000000000000000000) (bvsge (x!51588 lt!250590) #b00000000000000000000000000000000)))))

(assert (=> b!550577 (=> (not res!343568) (not e!317842))))

(declare-fun b!550578 () Bool)

(assert (=> b!550578 (= e!317839 (Intermediate!5071 false (toIndex!0 (select (store (arr!16666 a!3118) i!1132 k0!1914) j!142) mask!3119) #b00000000000000000000000000000000))))

(declare-fun b!550579 () Bool)

(declare-fun e!317841 () SeekEntryResult!5071)

(assert (=> b!550579 (= e!317841 e!317839)))

(declare-fun lt!250589 () (_ BitVec 64))

(declare-fun c!63839 () Bool)

(assert (=> b!550579 (= c!63839 (or (= lt!250589 (select (store (arr!16666 a!3118) i!1132 k0!1914) j!142)) (= (bvadd lt!250589 lt!250589) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!550580 () Bool)

(assert (=> b!550580 (and (bvsge (index!22513 lt!250590) #b00000000000000000000000000000000) (bvslt (index!22513 lt!250590) (size!17030 (array!34705 (store (arr!16666 a!3118) i!1132 k0!1914) (size!17030 a!3118)))))))

(declare-fun res!343569 () Bool)

(assert (=> b!550580 (= res!343569 (= (select (arr!16666 (array!34705 (store (arr!16666 a!3118) i!1132 k0!1914) (size!17030 a!3118))) (index!22513 lt!250590)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!550580 (=> res!343569 e!317843)))

(declare-fun b!550581 () Bool)

(assert (=> b!550581 (= e!317841 (Intermediate!5071 true (toIndex!0 (select (store (arr!16666 a!3118) i!1132 k0!1914) j!142) mask!3119) #b00000000000000000000000000000000))))

(declare-fun b!550582 () Bool)

(assert (=> b!550582 (and (bvsge (index!22513 lt!250590) #b00000000000000000000000000000000) (bvslt (index!22513 lt!250590) (size!17030 (array!34705 (store (arr!16666 a!3118) i!1132 k0!1914) (size!17030 a!3118)))))))

(assert (=> b!550582 (= e!317843 (= (select (arr!16666 (array!34705 (store (arr!16666 a!3118) i!1132 k0!1914) (size!17030 a!3118))) (index!22513 lt!250590)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!550574 () Bool)

(assert (=> b!550574 (= e!317840 (bvsge (x!51588 lt!250590) #b01111111111111111111111111111110))))

(declare-fun d!82941 () Bool)

(assert (=> d!82941 e!317840))

(declare-fun c!63837 () Bool)

(assert (=> d!82941 (= c!63837 (and ((_ is Intermediate!5071) lt!250590) (undefined!5883 lt!250590)))))

(assert (=> d!82941 (= lt!250590 e!317841)))

(declare-fun c!63838 () Bool)

(assert (=> d!82941 (= c!63838 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!82941 (= lt!250589 (select (arr!16666 (array!34705 (store (arr!16666 a!3118) i!1132 k0!1914) (size!17030 a!3118))) (toIndex!0 (select (store (arr!16666 a!3118) i!1132 k0!1914) j!142) mask!3119)))))

(assert (=> d!82941 (validMask!0 mask!3119)))

(assert (=> d!82941 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16666 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!16666 a!3118) i!1132 k0!1914) j!142) (array!34705 (store (arr!16666 a!3118) i!1132 k0!1914) (size!17030 a!3118)) mask!3119) lt!250590)))

(assert (= (and d!82941 c!63838) b!550581))

(assert (= (and d!82941 (not c!63838)) b!550579))

(assert (= (and b!550579 c!63839) b!550578))

(assert (= (and b!550579 (not c!63839)) b!550576))

(assert (= (and d!82941 c!63837) b!550574))

(assert (= (and d!82941 (not c!63837)) b!550577))

(assert (= (and b!550577 res!343568) b!550575))

(assert (= (and b!550575 (not res!343567)) b!550580))

(assert (= (and b!550580 (not res!343569)) b!550582))

(declare-fun m!527731 () Bool)

(assert (=> b!550582 m!527731))

(assert (=> b!550580 m!527731))

(assert (=> b!550576 m!527613))

(declare-fun m!527733 () Bool)

(assert (=> b!550576 m!527733))

(assert (=> b!550576 m!527733))

(assert (=> b!550576 m!527611))

(declare-fun m!527735 () Bool)

(assert (=> b!550576 m!527735))

(assert (=> d!82941 m!527613))

(declare-fun m!527737 () Bool)

(assert (=> d!82941 m!527737))

(assert (=> d!82941 m!527589))

(assert (=> b!550575 m!527731))

(assert (=> b!550412 d!82941))

(declare-fun d!82943 () Bool)

(declare-fun lt!250596 () (_ BitVec 32))

(declare-fun lt!250595 () (_ BitVec 32))

(assert (=> d!82943 (= lt!250596 (bvmul (bvxor lt!250595 (bvlshr lt!250595 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!82943 (= lt!250595 ((_ extract 31 0) (bvand (bvxor (select (store (arr!16666 a!3118) i!1132 k0!1914) j!142) (bvlshr (select (store (arr!16666 a!3118) i!1132 k0!1914) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!82943 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!343562 (let ((h!11628 ((_ extract 31 0) (bvand (bvxor (select (store (arr!16666 a!3118) i!1132 k0!1914) j!142) (bvlshr (select (store (arr!16666 a!3118) i!1132 k0!1914) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!51593 (bvmul (bvxor h!11628 (bvlshr h!11628 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!51593 (bvlshr x!51593 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!343562 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!343562 #b00000000000000000000000000000000))))))

(assert (=> d!82943 (= (toIndex!0 (select (store (arr!16666 a!3118) i!1132 k0!1914) j!142) mask!3119) (bvand (bvxor lt!250596 (bvlshr lt!250596 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!550412 d!82943))

(declare-fun d!82945 () Bool)

(declare-fun lt!250624 () SeekEntryResult!5071)

(assert (=> d!82945 (and (or ((_ is Undefined!5071) lt!250624) (not ((_ is Found!5071) lt!250624)) (and (bvsge (index!22512 lt!250624) #b00000000000000000000000000000000) (bvslt (index!22512 lt!250624) (size!17030 a!3118)))) (or ((_ is Undefined!5071) lt!250624) ((_ is Found!5071) lt!250624) (not ((_ is MissingZero!5071) lt!250624)) (and (bvsge (index!22511 lt!250624) #b00000000000000000000000000000000) (bvslt (index!22511 lt!250624) (size!17030 a!3118)))) (or ((_ is Undefined!5071) lt!250624) ((_ is Found!5071) lt!250624) ((_ is MissingZero!5071) lt!250624) (not ((_ is MissingVacant!5071) lt!250624)) (and (bvsge (index!22514 lt!250624) #b00000000000000000000000000000000) (bvslt (index!22514 lt!250624) (size!17030 a!3118)))) (or ((_ is Undefined!5071) lt!250624) (ite ((_ is Found!5071) lt!250624) (= (select (arr!16666 a!3118) (index!22512 lt!250624)) (select (arr!16666 a!3118) j!142)) (ite ((_ is MissingZero!5071) lt!250624) (= (select (arr!16666 a!3118) (index!22511 lt!250624)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5071) lt!250624) (= (select (arr!16666 a!3118) (index!22514 lt!250624)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!317872 () SeekEntryResult!5071)

(assert (=> d!82945 (= lt!250624 e!317872)))

(declare-fun c!63864 () Bool)

(declare-fun lt!250626 () SeekEntryResult!5071)

(assert (=> d!82945 (= c!63864 (and ((_ is Intermediate!5071) lt!250626) (undefined!5883 lt!250626)))))

(assert (=> d!82945 (= lt!250626 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16666 a!3118) j!142) mask!3119) (select (arr!16666 a!3118) j!142) a!3118 mask!3119))))

(assert (=> d!82945 (validMask!0 mask!3119)))

(assert (=> d!82945 (= (seekEntryOrOpen!0 (select (arr!16666 a!3118) j!142) a!3118 mask!3119) lt!250624)))

(declare-fun e!317871 () SeekEntryResult!5071)

(declare-fun b!550634 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34704 (_ BitVec 32)) SeekEntryResult!5071)

(assert (=> b!550634 (= e!317871 (seekKeyOrZeroReturnVacant!0 (x!51588 lt!250626) (index!22513 lt!250626) (index!22513 lt!250626) (select (arr!16666 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!550635 () Bool)

(declare-fun e!317870 () SeekEntryResult!5071)

(assert (=> b!550635 (= e!317870 (Found!5071 (index!22513 lt!250626)))))

(declare-fun b!550636 () Bool)

(declare-fun c!63866 () Bool)

(declare-fun lt!250625 () (_ BitVec 64))

(assert (=> b!550636 (= c!63866 (= lt!250625 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!550636 (= e!317870 e!317871)))

(declare-fun b!550637 () Bool)

(assert (=> b!550637 (= e!317871 (MissingZero!5071 (index!22513 lt!250626)))))

(declare-fun b!550638 () Bool)

(assert (=> b!550638 (= e!317872 e!317870)))

(assert (=> b!550638 (= lt!250625 (select (arr!16666 a!3118) (index!22513 lt!250626)))))

(declare-fun c!63865 () Bool)

(assert (=> b!550638 (= c!63865 (= lt!250625 (select (arr!16666 a!3118) j!142)))))

(declare-fun b!550639 () Bool)

(assert (=> b!550639 (= e!317872 Undefined!5071)))

(assert (= (and d!82945 c!63864) b!550639))

(assert (= (and d!82945 (not c!63864)) b!550638))

(assert (= (and b!550638 c!63865) b!550635))

(assert (= (and b!550638 (not c!63865)) b!550636))

(assert (= (and b!550636 c!63866) b!550637))

(assert (= (and b!550636 (not c!63866)) b!550634))

(declare-fun m!527757 () Bool)

(assert (=> d!82945 m!527757))

(assert (=> d!82945 m!527609))

(assert (=> d!82945 m!527593))

(assert (=> d!82945 m!527617))

(declare-fun m!527759 () Bool)

(assert (=> d!82945 m!527759))

(declare-fun m!527761 () Bool)

(assert (=> d!82945 m!527761))

(assert (=> d!82945 m!527589))

(assert (=> d!82945 m!527593))

(assert (=> d!82945 m!527609))

(assert (=> b!550634 m!527593))

(declare-fun m!527763 () Bool)

(assert (=> b!550634 m!527763))

(declare-fun m!527765 () Bool)

(assert (=> b!550638 m!527765))

(assert (=> b!550411 d!82945))

(declare-fun d!82959 () Bool)

(assert (=> d!82959 (= (validMask!0 mask!3119) (and (or (= mask!3119 #b00000000000000000000000000000111) (= mask!3119 #b00000000000000000000000000001111) (= mask!3119 #b00000000000000000000000000011111) (= mask!3119 #b00000000000000000000000000111111) (= mask!3119 #b00000000000000000000000001111111) (= mask!3119 #b00000000000000000000000011111111) (= mask!3119 #b00000000000000000000000111111111) (= mask!3119 #b00000000000000000000001111111111) (= mask!3119 #b00000000000000000000011111111111) (= mask!3119 #b00000000000000000000111111111111) (= mask!3119 #b00000000000000000001111111111111) (= mask!3119 #b00000000000000000011111111111111) (= mask!3119 #b00000000000000000111111111111111) (= mask!3119 #b00000000000000001111111111111111) (= mask!3119 #b00000000000000011111111111111111) (= mask!3119 #b00000000000000111111111111111111) (= mask!3119 #b00000000000001111111111111111111) (= mask!3119 #b00000000000011111111111111111111) (= mask!3119 #b00000000000111111111111111111111) (= mask!3119 #b00000000001111111111111111111111) (= mask!3119 #b00000000011111111111111111111111) (= mask!3119 #b00000000111111111111111111111111) (= mask!3119 #b00000001111111111111111111111111) (= mask!3119 #b00000011111111111111111111111111) (= mask!3119 #b00000111111111111111111111111111) (= mask!3119 #b00001111111111111111111111111111) (= mask!3119 #b00011111111111111111111111111111) (= mask!3119 #b00111111111111111111111111111111)) (bvsle mask!3119 #b00111111111111111111111111111111)))))

(assert (=> start!50304 d!82959))

(declare-fun d!82973 () Bool)

(assert (=> d!82973 (= (array_inv!12525 a!3118) (bvsge (size!17030 a!3118) #b00000000000000000000000000000000))))

(assert (=> start!50304 d!82973))

(declare-fun b!550695 () Bool)

(declare-fun e!317912 () Bool)

(declare-fun call!32267 () Bool)

(assert (=> b!550695 (= e!317912 call!32267)))

(declare-fun bm!32264 () Bool)

(assert (=> bm!32264 (= call!32267 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun d!82975 () Bool)

(declare-fun res!343596 () Bool)

(declare-fun e!317914 () Bool)

(assert (=> d!82975 (=> res!343596 e!317914)))

(assert (=> d!82975 (= res!343596 (bvsge #b00000000000000000000000000000000 (size!17030 a!3118)))))

(assert (=> d!82975 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119) e!317914)))

(declare-fun b!550696 () Bool)

(assert (=> b!550696 (= e!317914 e!317912)))

(declare-fun c!63883 () Bool)

(assert (=> b!550696 (= c!63883 (validKeyInArray!0 (select (arr!16666 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!550697 () Bool)

(declare-fun e!317913 () Bool)

(assert (=> b!550697 (= e!317913 call!32267)))

(declare-fun b!550698 () Bool)

(assert (=> b!550698 (= e!317912 e!317913)))

(declare-fun lt!250658 () (_ BitVec 64))

(assert (=> b!550698 (= lt!250658 (select (arr!16666 a!3118) #b00000000000000000000000000000000))))

(declare-fun lt!250659 () Unit!16987)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!34704 (_ BitVec 64) (_ BitVec 32)) Unit!16987)

(assert (=> b!550698 (= lt!250659 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!250658 #b00000000000000000000000000000000))))

(assert (=> b!550698 (arrayContainsKey!0 a!3118 lt!250658 #b00000000000000000000000000000000)))

(declare-fun lt!250657 () Unit!16987)

(assert (=> b!550698 (= lt!250657 lt!250659)))

(declare-fun res!343597 () Bool)

(assert (=> b!550698 (= res!343597 (= (seekEntryOrOpen!0 (select (arr!16666 a!3118) #b00000000000000000000000000000000) a!3118 mask!3119) (Found!5071 #b00000000000000000000000000000000)))))

(assert (=> b!550698 (=> (not res!343597) (not e!317913))))

(assert (= (and d!82975 (not res!343596)) b!550696))

(assert (= (and b!550696 c!63883) b!550698))

(assert (= (and b!550696 (not c!63883)) b!550695))

(assert (= (and b!550698 res!343597) b!550697))

(assert (= (or b!550697 b!550695) bm!32264))

(declare-fun m!527825 () Bool)

(assert (=> bm!32264 m!527825))

(assert (=> b!550696 m!527693))

(assert (=> b!550696 m!527693))

(assert (=> b!550696 m!527697))

(assert (=> b!550698 m!527693))

(declare-fun m!527827 () Bool)

(assert (=> b!550698 m!527827))

(declare-fun m!527829 () Bool)

(assert (=> b!550698 m!527829))

(assert (=> b!550698 m!527693))

(declare-fun m!527831 () Bool)

(assert (=> b!550698 m!527831))

(assert (=> b!550416 d!82975))

(declare-fun d!82983 () Bool)

(assert (=> d!82983 (= (validKeyInArray!0 (select (arr!16666 a!3118) j!142)) (and (not (= (select (arr!16666 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16666 a!3118) j!142) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!550415 d!82983))

(declare-fun b!550699 () Bool)

(declare-fun e!317915 () Bool)

(declare-fun call!32268 () Bool)

(assert (=> b!550699 (= e!317915 call!32268)))

(declare-fun bm!32265 () Bool)

(assert (=> bm!32265 (= call!32268 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!142 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun d!82985 () Bool)

(declare-fun res!343598 () Bool)

(declare-fun e!317917 () Bool)

(assert (=> d!82985 (=> res!343598 e!317917)))

(assert (=> d!82985 (= res!343598 (bvsge j!142 (size!17030 a!3118)))))

(assert (=> d!82985 (= (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119) e!317917)))

(declare-fun b!550700 () Bool)

(assert (=> b!550700 (= e!317917 e!317915)))

(declare-fun c!63884 () Bool)

(assert (=> b!550700 (= c!63884 (validKeyInArray!0 (select (arr!16666 a!3118) j!142)))))

(declare-fun b!550701 () Bool)

(declare-fun e!317916 () Bool)

(assert (=> b!550701 (= e!317916 call!32268)))

(declare-fun b!550702 () Bool)

(assert (=> b!550702 (= e!317915 e!317916)))

(declare-fun lt!250661 () (_ BitVec 64))

(assert (=> b!550702 (= lt!250661 (select (arr!16666 a!3118) j!142))))

(declare-fun lt!250662 () Unit!16987)

(assert (=> b!550702 (= lt!250662 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!250661 j!142))))

(assert (=> b!550702 (arrayContainsKey!0 a!3118 lt!250661 #b00000000000000000000000000000000)))

(declare-fun lt!250660 () Unit!16987)

(assert (=> b!550702 (= lt!250660 lt!250662)))

(declare-fun res!343599 () Bool)

(assert (=> b!550702 (= res!343599 (= (seekEntryOrOpen!0 (select (arr!16666 a!3118) j!142) a!3118 mask!3119) (Found!5071 j!142)))))

(assert (=> b!550702 (=> (not res!343599) (not e!317916))))

(assert (= (and d!82985 (not res!343598)) b!550700))

(assert (= (and b!550700 c!63884) b!550702))

(assert (= (and b!550700 (not c!63884)) b!550699))

(assert (= (and b!550702 res!343599) b!550701))

(assert (= (or b!550701 b!550699) bm!32265))

(declare-fun m!527833 () Bool)

(assert (=> bm!32265 m!527833))

(assert (=> b!550700 m!527593))

(assert (=> b!550700 m!527593))

(assert (=> b!550700 m!527605))

(assert (=> b!550702 m!527593))

(declare-fun m!527835 () Bool)

(assert (=> b!550702 m!527835))

(declare-fun m!527837 () Bool)

(assert (=> b!550702 m!527837))

(assert (=> b!550702 m!527593))

(assert (=> b!550702 m!527595))

(assert (=> b!550420 d!82985))

(declare-fun d!82987 () Bool)

(assert (=> d!82987 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-fun lt!250669 () Unit!16987)

(declare-fun choose!38 (array!34704 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16987)

(assert (=> d!82987 (= lt!250669 (choose!38 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (=> d!82987 (validMask!0 mask!3119)))

(assert (=> d!82987 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142) lt!250669)))

(declare-fun bs!17173 () Bool)

(assert (= bs!17173 d!82987))

(assert (=> bs!17173 m!527599))

(declare-fun m!527839 () Bool)

(assert (=> bs!17173 m!527839))

(assert (=> bs!17173 m!527589))

(assert (=> b!550420 d!82987))

(declare-fun d!82989 () Bool)

(assert (=> d!82989 (= (validKeyInArray!0 k0!1914) (and (not (= k0!1914 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1914 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!550419 d!82989))

(declare-fun d!82991 () Bool)

(declare-fun lt!250670 () SeekEntryResult!5071)

(assert (=> d!82991 (and (or ((_ is Undefined!5071) lt!250670) (not ((_ is Found!5071) lt!250670)) (and (bvsge (index!22512 lt!250670) #b00000000000000000000000000000000) (bvslt (index!22512 lt!250670) (size!17030 a!3118)))) (or ((_ is Undefined!5071) lt!250670) ((_ is Found!5071) lt!250670) (not ((_ is MissingZero!5071) lt!250670)) (and (bvsge (index!22511 lt!250670) #b00000000000000000000000000000000) (bvslt (index!22511 lt!250670) (size!17030 a!3118)))) (or ((_ is Undefined!5071) lt!250670) ((_ is Found!5071) lt!250670) ((_ is MissingZero!5071) lt!250670) (not ((_ is MissingVacant!5071) lt!250670)) (and (bvsge (index!22514 lt!250670) #b00000000000000000000000000000000) (bvslt (index!22514 lt!250670) (size!17030 a!3118)))) (or ((_ is Undefined!5071) lt!250670) (ite ((_ is Found!5071) lt!250670) (= (select (arr!16666 a!3118) (index!22512 lt!250670)) k0!1914) (ite ((_ is MissingZero!5071) lt!250670) (= (select (arr!16666 a!3118) (index!22511 lt!250670)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5071) lt!250670) (= (select (arr!16666 a!3118) (index!22514 lt!250670)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!317942 () SeekEntryResult!5071)

(assert (=> d!82991 (= lt!250670 e!317942)))

(declare-fun c!63894 () Bool)

(declare-fun lt!250672 () SeekEntryResult!5071)

(assert (=> d!82991 (= c!63894 (and ((_ is Intermediate!5071) lt!250672) (undefined!5883 lt!250672)))))

(assert (=> d!82991 (= lt!250672 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1914 mask!3119) k0!1914 a!3118 mask!3119))))

(assert (=> d!82991 (validMask!0 mask!3119)))

(assert (=> d!82991 (= (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119) lt!250670)))

(declare-fun b!550736 () Bool)

(declare-fun e!317941 () SeekEntryResult!5071)

(assert (=> b!550736 (= e!317941 (seekKeyOrZeroReturnVacant!0 (x!51588 lt!250672) (index!22513 lt!250672) (index!22513 lt!250672) k0!1914 a!3118 mask!3119))))

(declare-fun b!550737 () Bool)

(declare-fun e!317940 () SeekEntryResult!5071)

(assert (=> b!550737 (= e!317940 (Found!5071 (index!22513 lt!250672)))))

(declare-fun b!550738 () Bool)

(declare-fun c!63896 () Bool)

(declare-fun lt!250671 () (_ BitVec 64))

(assert (=> b!550738 (= c!63896 (= lt!250671 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!550738 (= e!317940 e!317941)))

(declare-fun b!550739 () Bool)

(assert (=> b!550739 (= e!317941 (MissingZero!5071 (index!22513 lt!250672)))))

(declare-fun b!550740 () Bool)

(assert (=> b!550740 (= e!317942 e!317940)))

(assert (=> b!550740 (= lt!250671 (select (arr!16666 a!3118) (index!22513 lt!250672)))))

(declare-fun c!63895 () Bool)

(assert (=> b!550740 (= c!63895 (= lt!250671 k0!1914))))

(declare-fun b!550741 () Bool)

(assert (=> b!550741 (= e!317942 Undefined!5071)))

(assert (= (and d!82991 c!63894) b!550741))

(assert (= (and d!82991 (not c!63894)) b!550740))

(assert (= (and b!550740 c!63895) b!550737))

(assert (= (and b!550740 (not c!63895)) b!550738))

(assert (= (and b!550738 c!63896) b!550739))

(assert (= (and b!550738 (not c!63896)) b!550736))

(declare-fun m!527845 () Bool)

(assert (=> d!82991 m!527845))

(declare-fun m!527847 () Bool)

(assert (=> d!82991 m!527847))

(declare-fun m!527849 () Bool)

(assert (=> d!82991 m!527849))

(declare-fun m!527851 () Bool)

(assert (=> d!82991 m!527851))

(declare-fun m!527853 () Bool)

(assert (=> d!82991 m!527853))

(assert (=> d!82991 m!527589))

(assert (=> d!82991 m!527847))

(declare-fun m!527855 () Bool)

(assert (=> b!550736 m!527855))

(declare-fun m!527857 () Bool)

(assert (=> b!550740 m!527857))

(assert (=> b!550414 d!82991))

(check-sat (not d!82945) (not bm!32250) (not b!550702) (not d!82941) (not bm!32264) (not d!82991) (not b!550558) (not b!550634) (not d!82987) (not b!550492) (not b!550576) (not d!82925) (not b!550501) (not b!550698) (not b!550696) (not bm!32265) (not b!550495) (not b!550493) (not b!550736) (not b!550700))
(check-sat)
