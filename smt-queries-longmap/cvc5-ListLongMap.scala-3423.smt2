; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47460 () Bool)

(assert start!47460)

(declare-fun b!522628 () Bool)

(declare-datatypes ((Unit!16316 0))(
  ( (Unit!16317) )
))
(declare-fun e!304815 () Unit!16316)

(declare-fun Unit!16318 () Unit!16316)

(assert (=> b!522628 (= e!304815 Unit!16318)))

(declare-fun lt!239731 () Unit!16316)

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4466 0))(
  ( (MissingZero!4466 (index!20067 (_ BitVec 32))) (Found!4466 (index!20068 (_ BitVec 32))) (Intermediate!4466 (undefined!5278 Bool) (index!20069 (_ BitVec 32)) (x!49044 (_ BitVec 32))) (Undefined!4466) (MissingVacant!4466 (index!20070 (_ BitVec 32))) )
))
(declare-fun lt!239729 () SeekEntryResult!4466)

(declare-datatypes ((array!33286 0))(
  ( (array!33287 (arr!15999 (Array (_ BitVec 32) (_ BitVec 64))) (size!16363 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33286)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!239728 () (_ BitVec 32))

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33286 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16316)

(assert (=> b!522628 (= lt!239731 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!239728 #b00000000000000000000000000000000 (index!20069 lt!239729) (x!49044 lt!239729) mask!3524))))

(declare-fun res!320257 () Bool)

(declare-fun lt!239723 () array!33286)

(declare-fun lt!239727 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33286 (_ BitVec 32)) SeekEntryResult!4466)

(assert (=> b!522628 (= res!320257 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239728 lt!239727 lt!239723 mask!3524) (Intermediate!4466 false (index!20069 lt!239729) (x!49044 lt!239729))))))

(declare-fun e!304813 () Bool)

(assert (=> b!522628 (=> (not res!320257) (not e!304813))))

(assert (=> b!522628 e!304813))

(declare-fun b!522629 () Bool)

(declare-fun e!304809 () Bool)

(declare-fun e!304814 () Bool)

(assert (=> b!522629 (= e!304809 (not e!304814))))

(declare-fun res!320267 () Bool)

(assert (=> b!522629 (=> res!320267 e!304814)))

(declare-fun lt!239730 () (_ BitVec 32))

(assert (=> b!522629 (= res!320267 (= lt!239729 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239730 lt!239727 lt!239723 mask!3524)))))

(assert (=> b!522629 (= lt!239729 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239728 (select (arr!15999 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!522629 (= lt!239730 (toIndex!0 lt!239727 mask!3524))))

(assert (=> b!522629 (= lt!239727 (select (store (arr!15999 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!522629 (= lt!239728 (toIndex!0 (select (arr!15999 a!3235) j!176) mask!3524))))

(assert (=> b!522629 (= lt!239723 (array!33287 (store (arr!15999 a!3235) i!1204 k!2280) (size!16363 a!3235)))))

(declare-fun e!304810 () Bool)

(assert (=> b!522629 e!304810))

(declare-fun res!320260 () Bool)

(assert (=> b!522629 (=> (not res!320260) (not e!304810))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33286 (_ BitVec 32)) Bool)

(assert (=> b!522629 (= res!320260 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!239725 () Unit!16316)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33286 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16316)

(assert (=> b!522629 (= lt!239725 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!522630 () Bool)

(declare-fun res!320258 () Bool)

(declare-fun e!304812 () Bool)

(assert (=> b!522630 (=> (not res!320258) (not e!304812))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!522630 (= res!320258 (validKeyInArray!0 (select (arr!15999 a!3235) j!176)))))

(declare-fun b!522631 () Bool)

(assert (=> b!522631 (= e!304812 e!304809)))

(declare-fun res!320263 () Bool)

(assert (=> b!522631 (=> (not res!320263) (not e!304809))))

(declare-fun lt!239724 () SeekEntryResult!4466)

(assert (=> b!522631 (= res!320263 (or (= lt!239724 (MissingZero!4466 i!1204)) (= lt!239724 (MissingVacant!4466 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33286 (_ BitVec 32)) SeekEntryResult!4466)

(assert (=> b!522631 (= lt!239724 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!522632 () Bool)

(declare-fun res!320265 () Bool)

(assert (=> b!522632 (=> (not res!320265) (not e!304812))))

(assert (=> b!522632 (= res!320265 (validKeyInArray!0 k!2280))))

(declare-fun b!522633 () Bool)

(assert (=> b!522633 (= e!304810 (= (seekEntryOrOpen!0 (select (arr!15999 a!3235) j!176) a!3235 mask!3524) (Found!4466 j!176)))))

(declare-fun b!522634 () Bool)

(declare-fun res!320256 () Bool)

(assert (=> b!522634 (=> (not res!320256) (not e!304809))))

(declare-datatypes ((List!10157 0))(
  ( (Nil!10154) (Cons!10153 (h!11075 (_ BitVec 64)) (t!16385 List!10157)) )
))
(declare-fun arrayNoDuplicates!0 (array!33286 (_ BitVec 32) List!10157) Bool)

(assert (=> b!522634 (= res!320256 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10154))))

(declare-fun b!522635 () Bool)

(assert (=> b!522635 (= e!304814 (bvsle #b00000000000000000000000000000000 (x!49044 lt!239729)))))

(assert (=> b!522635 (and (or (= (select (arr!15999 a!3235) (index!20069 lt!239729)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15999 a!3235) (index!20069 lt!239729)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15999 a!3235) (index!20069 lt!239729)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15999 a!3235) (index!20069 lt!239729)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!239726 () Unit!16316)

(assert (=> b!522635 (= lt!239726 e!304815)))

(declare-fun c!61487 () Bool)

(assert (=> b!522635 (= c!61487 (= (select (arr!15999 a!3235) (index!20069 lt!239729)) (select (arr!15999 a!3235) j!176)))))

(assert (=> b!522635 (and (bvslt (x!49044 lt!239729) #b01111111111111111111111111111110) (or (= (select (arr!15999 a!3235) (index!20069 lt!239729)) (select (arr!15999 a!3235) j!176)) (= (select (arr!15999 a!3235) (index!20069 lt!239729)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15999 a!3235) (index!20069 lt!239729)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!522636 () Bool)

(declare-fun res!320259 () Bool)

(assert (=> b!522636 (=> (not res!320259) (not e!304809))))

(assert (=> b!522636 (= res!320259 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!522637 () Bool)

(declare-fun res!320261 () Bool)

(assert (=> b!522637 (=> res!320261 e!304814)))

(assert (=> b!522637 (= res!320261 (or (undefined!5278 lt!239729) (not (is-Intermediate!4466 lt!239729))))))

(declare-fun b!522638 () Bool)

(declare-fun Unit!16319 () Unit!16316)

(assert (=> b!522638 (= e!304815 Unit!16319)))

(declare-fun res!320262 () Bool)

(assert (=> start!47460 (=> (not res!320262) (not e!304812))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47460 (= res!320262 (validMask!0 mask!3524))))

(assert (=> start!47460 e!304812))

(assert (=> start!47460 true))

(declare-fun array_inv!11795 (array!33286) Bool)

(assert (=> start!47460 (array_inv!11795 a!3235)))

(declare-fun b!522639 () Bool)

(declare-fun res!320264 () Bool)

(assert (=> b!522639 (=> (not res!320264) (not e!304812))))

(assert (=> b!522639 (= res!320264 (and (= (size!16363 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16363 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16363 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!522640 () Bool)

(assert (=> b!522640 (= e!304813 false)))

(declare-fun b!522641 () Bool)

(declare-fun res!320266 () Bool)

(assert (=> b!522641 (=> (not res!320266) (not e!304812))))

(declare-fun arrayContainsKey!0 (array!33286 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!522641 (= res!320266 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(assert (= (and start!47460 res!320262) b!522639))

(assert (= (and b!522639 res!320264) b!522630))

(assert (= (and b!522630 res!320258) b!522632))

(assert (= (and b!522632 res!320265) b!522641))

(assert (= (and b!522641 res!320266) b!522631))

(assert (= (and b!522631 res!320263) b!522636))

(assert (= (and b!522636 res!320259) b!522634))

(assert (= (and b!522634 res!320256) b!522629))

(assert (= (and b!522629 res!320260) b!522633))

(assert (= (and b!522629 (not res!320267)) b!522637))

(assert (= (and b!522637 (not res!320261)) b!522635))

(assert (= (and b!522635 c!61487) b!522628))

(assert (= (and b!522635 (not c!61487)) b!522638))

(assert (= (and b!522628 res!320257) b!522640))

(declare-fun m!503541 () Bool)

(assert (=> b!522635 m!503541))

(declare-fun m!503543 () Bool)

(assert (=> b!522635 m!503543))

(declare-fun m!503545 () Bool)

(assert (=> b!522631 m!503545))

(declare-fun m!503547 () Bool)

(assert (=> start!47460 m!503547))

(declare-fun m!503549 () Bool)

(assert (=> start!47460 m!503549))

(declare-fun m!503551 () Bool)

(assert (=> b!522641 m!503551))

(declare-fun m!503553 () Bool)

(assert (=> b!522629 m!503553))

(declare-fun m!503555 () Bool)

(assert (=> b!522629 m!503555))

(declare-fun m!503557 () Bool)

(assert (=> b!522629 m!503557))

(declare-fun m!503559 () Bool)

(assert (=> b!522629 m!503559))

(assert (=> b!522629 m!503543))

(declare-fun m!503561 () Bool)

(assert (=> b!522629 m!503561))

(assert (=> b!522629 m!503543))

(declare-fun m!503563 () Bool)

(assert (=> b!522629 m!503563))

(assert (=> b!522629 m!503543))

(declare-fun m!503565 () Bool)

(assert (=> b!522629 m!503565))

(declare-fun m!503567 () Bool)

(assert (=> b!522629 m!503567))

(assert (=> b!522633 m!503543))

(assert (=> b!522633 m!503543))

(declare-fun m!503569 () Bool)

(assert (=> b!522633 m!503569))

(declare-fun m!503571 () Bool)

(assert (=> b!522634 m!503571))

(declare-fun m!503573 () Bool)

(assert (=> b!522632 m!503573))

(declare-fun m!503575 () Bool)

(assert (=> b!522636 m!503575))

(declare-fun m!503577 () Bool)

(assert (=> b!522628 m!503577))

(declare-fun m!503579 () Bool)

(assert (=> b!522628 m!503579))

(assert (=> b!522630 m!503543))

(assert (=> b!522630 m!503543))

(declare-fun m!503581 () Bool)

(assert (=> b!522630 m!503581))

(push 1)

(assert (not b!522632))

(assert (not b!522634))

(assert (not b!522631))

(assert (not b!522628))

(assert (not b!522630))

(assert (not b!522636))

(assert (not b!522641))

(assert (not start!47460))

(assert (not b!522633))

(assert (not b!522629))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!80419 () Bool)

(assert (=> d!80419 (= (validKeyInArray!0 (select (arr!15999 a!3235) j!176)) (and (not (= (select (arr!15999 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15999 a!3235) j!176) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!522630 d!80419))

(declare-fun d!80421 () Bool)

(declare-fun lt!239803 () (_ BitVec 32))

(declare-fun lt!239802 () (_ BitVec 32))

(assert (=> d!80421 (= lt!239803 (bvmul (bvxor lt!239802 (bvlshr lt!239802 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!80421 (= lt!239802 ((_ extract 31 0) (bvand (bvxor (select (arr!15999 a!3235) j!176) (bvlshr (select (arr!15999 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!80421 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!320340 (let ((h!11078 ((_ extract 31 0) (bvand (bvxor (select (arr!15999 a!3235) j!176) (bvlshr (select (arr!15999 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!49047 (bvmul (bvxor h!11078 (bvlshr h!11078 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!49047 (bvlshr x!49047 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!320340 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!320340 #b00000000000000000000000000000000))))))

(assert (=> d!80421 (= (toIndex!0 (select (arr!15999 a!3235) j!176) mask!3524) (bvand (bvxor lt!239803 (bvlshr lt!239803 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!522629 d!80421))

(declare-fun call!31816 () Bool)

(declare-fun bm!31813 () Bool)

(assert (=> bm!31813 (= call!31816 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!176 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!522778 () Bool)

(declare-fun e!304893 () Bool)

(assert (=> b!522778 (= e!304893 call!31816)))

(declare-fun d!80427 () Bool)

(declare-fun res!320356 () Bool)

(declare-fun e!304891 () Bool)

(assert (=> d!80427 (=> res!320356 e!304891)))

(assert (=> d!80427 (= res!320356 (bvsge j!176 (size!16363 a!3235)))))

(assert (=> d!80427 (= (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524) e!304891)))

(declare-fun b!522779 () Bool)

(declare-fun e!304892 () Bool)

(assert (=> b!522779 (= e!304893 e!304892)))

(declare-fun lt!239832 () (_ BitVec 64))

(assert (=> b!522779 (= lt!239832 (select (arr!15999 a!3235) j!176))))

(declare-fun lt!239833 () Unit!16316)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!33286 (_ BitVec 64) (_ BitVec 32)) Unit!16316)

(assert (=> b!522779 (= lt!239833 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!239832 j!176))))

(assert (=> b!522779 (arrayContainsKey!0 a!3235 lt!239832 #b00000000000000000000000000000000)))

(declare-fun lt!239831 () Unit!16316)

(assert (=> b!522779 (= lt!239831 lt!239833)))

(declare-fun res!320357 () Bool)

(assert (=> b!522779 (= res!320357 (= (seekEntryOrOpen!0 (select (arr!15999 a!3235) j!176) a!3235 mask!3524) (Found!4466 j!176)))))

(assert (=> b!522779 (=> (not res!320357) (not e!304892))))

(declare-fun b!522780 () Bool)

(assert (=> b!522780 (= e!304892 call!31816)))

(declare-fun b!522781 () Bool)

(assert (=> b!522781 (= e!304891 e!304893)))

(declare-fun c!61513 () Bool)

(assert (=> b!522781 (= c!61513 (validKeyInArray!0 (select (arr!15999 a!3235) j!176)))))

(assert (= (and d!80427 (not res!320356)) b!522781))

(assert (= (and b!522781 c!61513) b!522779))

(assert (= (and b!522781 (not c!61513)) b!522778))

(assert (= (and b!522779 res!320357) b!522780))

(assert (= (or b!522780 b!522778) bm!31813))

(declare-fun m!503705 () Bool)

(assert (=> bm!31813 m!503705))

(assert (=> b!522779 m!503543))

(declare-fun m!503707 () Bool)

(assert (=> b!522779 m!503707))

(declare-fun m!503709 () Bool)

(assert (=> b!522779 m!503709))

(assert (=> b!522779 m!503543))

(assert (=> b!522779 m!503569))

(assert (=> b!522781 m!503543))

(assert (=> b!522781 m!503543))

(assert (=> b!522781 m!503581))

(assert (=> b!522629 d!80427))

(declare-fun b!522834 () Bool)

(declare-fun e!304929 () SeekEntryResult!4466)

(assert (=> b!522834 (= e!304929 (Intermediate!4466 true lt!239728 #b00000000000000000000000000000000))))

(declare-fun b!522835 () Bool)

(declare-fun e!304927 () Bool)

(declare-fun lt!239850 () SeekEntryResult!4466)

(assert (=> b!522835 (= e!304927 (bvsge (x!49044 lt!239850) #b01111111111111111111111111111110))))

(declare-fun b!522836 () Bool)

(declare-fun e!304928 () SeekEntryResult!4466)

(assert (=> b!522836 (= e!304928 (Intermediate!4466 false lt!239728 #b00000000000000000000000000000000))))

(declare-fun b!522837 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!522837 (= e!304928 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!239728 #b00000000000000000000000000000000 mask!3524) (select (arr!15999 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!522838 () Bool)

(assert (=> b!522838 (and (bvsge (index!20069 lt!239850) #b00000000000000000000000000000000) (bvslt (index!20069 lt!239850) (size!16363 a!3235)))))

(declare-fun res!320379 () Bool)

(assert (=> b!522838 (= res!320379 (= (select (arr!15999 a!3235) (index!20069 lt!239850)) (select (arr!15999 a!3235) j!176)))))

(declare-fun e!304926 () Bool)

(assert (=> b!522838 (=> res!320379 e!304926)))

(declare-fun e!304925 () Bool)

(assert (=> b!522838 (= e!304925 e!304926)))

(declare-fun b!522839 () Bool)

(assert (=> b!522839 (= e!304929 e!304928)))

(declare-fun c!61532 () Bool)

(declare-fun lt!239851 () (_ BitVec 64))

(assert (=> b!522839 (= c!61532 (or (= lt!239851 (select (arr!15999 a!3235) j!176)) (= (bvadd lt!239851 lt!239851) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!522840 () Bool)

(assert (=> b!522840 (and (bvsge (index!20069 lt!239850) #b00000000000000000000000000000000) (bvslt (index!20069 lt!239850) (size!16363 a!3235)))))

(assert (=> b!522840 (= e!304926 (= (select (arr!15999 a!3235) (index!20069 lt!239850)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!80437 () Bool)

(assert (=> d!80437 e!304927))

(declare-fun c!61530 () Bool)

(assert (=> d!80437 (= c!61530 (and (is-Intermediate!4466 lt!239850) (undefined!5278 lt!239850)))))

(assert (=> d!80437 (= lt!239850 e!304929)))

(declare-fun c!61531 () Bool)

(assert (=> d!80437 (= c!61531 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!80437 (= lt!239851 (select (arr!15999 a!3235) lt!239728))))

(assert (=> d!80437 (validMask!0 mask!3524)))

(assert (=> d!80437 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239728 (select (arr!15999 a!3235) j!176) a!3235 mask!3524) lt!239850)))

(declare-fun b!522841 () Bool)

(assert (=> b!522841 (and (bvsge (index!20069 lt!239850) #b00000000000000000000000000000000) (bvslt (index!20069 lt!239850) (size!16363 a!3235)))))

(declare-fun res!320380 () Bool)

(assert (=> b!522841 (= res!320380 (= (select (arr!15999 a!3235) (index!20069 lt!239850)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!522841 (=> res!320380 e!304926)))

(declare-fun b!522842 () Bool)

(assert (=> b!522842 (= e!304927 e!304925)))

(declare-fun res!320378 () Bool)

(assert (=> b!522842 (= res!320378 (and (is-Intermediate!4466 lt!239850) (not (undefined!5278 lt!239850)) (bvslt (x!49044 lt!239850) #b01111111111111111111111111111110) (bvsge (x!49044 lt!239850) #b00000000000000000000000000000000) (bvsge (x!49044 lt!239850) #b00000000000000000000000000000000)))))

(assert (=> b!522842 (=> (not res!320378) (not e!304925))))

(assert (= (and d!80437 c!61531) b!522834))

(assert (= (and d!80437 (not c!61531)) b!522839))

(assert (= (and b!522839 c!61532) b!522836))

(assert (= (and b!522839 (not c!61532)) b!522837))

(assert (= (and d!80437 c!61530) b!522835))

(assert (= (and d!80437 (not c!61530)) b!522842))

(assert (= (and b!522842 res!320378) b!522838))

(assert (= (and b!522838 (not res!320379)) b!522841))

(assert (= (and b!522841 (not res!320380)) b!522840))

(declare-fun m!503723 () Bool)

(assert (=> b!522837 m!503723))

(assert (=> b!522837 m!503723))

(assert (=> b!522837 m!503543))

(declare-fun m!503729 () Bool)

(assert (=> b!522837 m!503729))

(declare-fun m!503731 () Bool)

(assert (=> d!80437 m!503731))

(assert (=> d!80437 m!503547))

(declare-fun m!503735 () Bool)

(assert (=> b!522841 m!503735))

(assert (=> b!522838 m!503735))

(assert (=> b!522840 m!503735))

(assert (=> b!522629 d!80437))

(declare-fun b!522843 () Bool)

(declare-fun e!304934 () SeekEntryResult!4466)

(assert (=> b!522843 (= e!304934 (Intermediate!4466 true lt!239730 #b00000000000000000000000000000000))))

(declare-fun b!522844 () Bool)

(declare-fun e!304932 () Bool)

(declare-fun lt!239852 () SeekEntryResult!4466)

(assert (=> b!522844 (= e!304932 (bvsge (x!49044 lt!239852) #b01111111111111111111111111111110))))

(declare-fun b!522845 () Bool)

(declare-fun e!304933 () SeekEntryResult!4466)

(assert (=> b!522845 (= e!304933 (Intermediate!4466 false lt!239730 #b00000000000000000000000000000000))))

(declare-fun b!522846 () Bool)

(assert (=> b!522846 (= e!304933 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!239730 #b00000000000000000000000000000000 mask!3524) lt!239727 lt!239723 mask!3524))))

(declare-fun b!522847 () Bool)

(assert (=> b!522847 (and (bvsge (index!20069 lt!239852) #b00000000000000000000000000000000) (bvslt (index!20069 lt!239852) (size!16363 lt!239723)))))

(declare-fun res!320382 () Bool)

(assert (=> b!522847 (= res!320382 (= (select (arr!15999 lt!239723) (index!20069 lt!239852)) lt!239727))))

(declare-fun e!304931 () Bool)

(assert (=> b!522847 (=> res!320382 e!304931)))

(declare-fun e!304930 () Bool)

(assert (=> b!522847 (= e!304930 e!304931)))

(declare-fun b!522848 () Bool)

(assert (=> b!522848 (= e!304934 e!304933)))

(declare-fun c!61535 () Bool)

(declare-fun lt!239853 () (_ BitVec 64))

(assert (=> b!522848 (= c!61535 (or (= lt!239853 lt!239727) (= (bvadd lt!239853 lt!239853) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!522849 () Bool)

(assert (=> b!522849 (and (bvsge (index!20069 lt!239852) #b00000000000000000000000000000000) (bvslt (index!20069 lt!239852) (size!16363 lt!239723)))))

(assert (=> b!522849 (= e!304931 (= (select (arr!15999 lt!239723) (index!20069 lt!239852)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!80445 () Bool)

(assert (=> d!80445 e!304932))

(declare-fun c!61533 () Bool)

(assert (=> d!80445 (= c!61533 (and (is-Intermediate!4466 lt!239852) (undefined!5278 lt!239852)))))

(assert (=> d!80445 (= lt!239852 e!304934)))

(declare-fun c!61534 () Bool)

(assert (=> d!80445 (= c!61534 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!80445 (= lt!239853 (select (arr!15999 lt!239723) lt!239730))))

(assert (=> d!80445 (validMask!0 mask!3524)))

(assert (=> d!80445 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239730 lt!239727 lt!239723 mask!3524) lt!239852)))

(declare-fun b!522850 () Bool)

(assert (=> b!522850 (and (bvsge (index!20069 lt!239852) #b00000000000000000000000000000000) (bvslt (index!20069 lt!239852) (size!16363 lt!239723)))))

(declare-fun res!320383 () Bool)

(assert (=> b!522850 (= res!320383 (= (select (arr!15999 lt!239723) (index!20069 lt!239852)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!522850 (=> res!320383 e!304931)))

(declare-fun b!522851 () Bool)

(assert (=> b!522851 (= e!304932 e!304930)))

(declare-fun res!320381 () Bool)

(assert (=> b!522851 (= res!320381 (and (is-Intermediate!4466 lt!239852) (not (undefined!5278 lt!239852)) (bvslt (x!49044 lt!239852) #b01111111111111111111111111111110) (bvsge (x!49044 lt!239852) #b00000000000000000000000000000000) (bvsge (x!49044 lt!239852) #b00000000000000000000000000000000)))))

(assert (=> b!522851 (=> (not res!320381) (not e!304930))))

(assert (= (and d!80445 c!61534) b!522843))

(assert (= (and d!80445 (not c!61534)) b!522848))

(assert (= (and b!522848 c!61535) b!522845))

(assert (= (and b!522848 (not c!61535)) b!522846))

(assert (= (and d!80445 c!61533) b!522844))

(assert (= (and d!80445 (not c!61533)) b!522851))

(assert (= (and b!522851 res!320381) b!522847))

(assert (= (and b!522847 (not res!320382)) b!522850))

(assert (= (and b!522850 (not res!320383)) b!522849))

(declare-fun m!503737 () Bool)

(assert (=> b!522846 m!503737))

(assert (=> b!522846 m!503737))

(declare-fun m!503739 () Bool)

(assert (=> b!522846 m!503739))

(declare-fun m!503741 () Bool)

(assert (=> d!80445 m!503741))

(assert (=> d!80445 m!503547))

(declare-fun m!503743 () Bool)

(assert (=> b!522850 m!503743))

(assert (=> b!522847 m!503743))

(assert (=> b!522849 m!503743))

(assert (=> b!522629 d!80445))

(declare-fun d!80447 () Bool)

(assert (=> d!80447 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!239867 () Unit!16316)

(declare-fun choose!38 (array!33286 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16316)

(assert (=> d!80447 (= lt!239867 (choose!38 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (=> d!80447 (validMask!0 mask!3524)))

(assert (=> d!80447 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176) lt!239867)))

(declare-fun bs!16439 () Bool)

(assert (= bs!16439 d!80447))

(assert (=> bs!16439 m!503565))

(declare-fun m!503751 () Bool)

(assert (=> bs!16439 m!503751))

(assert (=> bs!16439 m!503547))

(assert (=> b!522629 d!80447))

(declare-fun d!80453 () Bool)

(declare-fun lt!239869 () (_ BitVec 32))

(declare-fun lt!239868 () (_ BitVec 32))

(assert (=> d!80453 (= lt!239869 (bvmul (bvxor lt!239868 (bvlshr lt!239868 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!80453 (= lt!239868 ((_ extract 31 0) (bvand (bvxor lt!239727 (bvlshr lt!239727 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!80453 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!320340 (let ((h!11078 ((_ extract 31 0) (bvand (bvxor lt!239727 (bvlshr lt!239727 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!49047 (bvmul (bvxor h!11078 (bvlshr h!11078 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!49047 (bvlshr x!49047 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!320340 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!320340 #b00000000000000000000000000000000))))))

(assert (=> d!80453 (= (toIndex!0 lt!239727 mask!3524) (bvand (bvxor lt!239869 (bvlshr lt!239869 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!522629 d!80453))

(declare-fun d!80457 () Bool)

(assert (=> d!80457 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!47460 d!80457))

(declare-fun d!80461 () Bool)

(assert (=> d!80461 (= (array_inv!11795 a!3235) (bvsge (size!16363 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!47460 d!80461))

(declare-fun b!522920 () Bool)

(declare-fun e!304982 () Bool)

(declare-fun call!31821 () Bool)

(assert (=> b!522920 (= e!304982 call!31821)))

(declare-fun b!522921 () Bool)

(declare-fun e!304983 () Bool)

(declare-fun e!304981 () Bool)

(assert (=> b!522921 (= e!304983 e!304981)))

(declare-fun res!320416 () Bool)

(assert (=> b!522921 (=> (not res!320416) (not e!304981))))

(declare-fun e!304980 () Bool)

(assert (=> b!522921 (= res!320416 (not e!304980))))

(declare-fun res!320417 () Bool)

(assert (=> b!522921 (=> (not res!320417) (not e!304980))))

(assert (=> b!522921 (= res!320417 (validKeyInArray!0 (select (arr!15999 a!3235) #b00000000000000000000000000000000)))))

(declare-fun d!80463 () Bool)

(declare-fun res!320418 () Bool)

(assert (=> d!80463 (=> res!320418 e!304983)))

(assert (=> d!80463 (= res!320418 (bvsge #b00000000000000000000000000000000 (size!16363 a!3235)))))

(assert (=> d!80463 (= (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10154) e!304983)))

(declare-fun b!522922 () Bool)

(assert (=> b!522922 (= e!304982 call!31821)))

(declare-fun bm!31818 () Bool)

(declare-fun c!61554 () Bool)

(assert (=> bm!31818 (= call!31821 (arrayNoDuplicates!0 a!3235 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!61554 (Cons!10153 (select (arr!15999 a!3235) #b00000000000000000000000000000000) Nil!10154) Nil!10154)))))

(declare-fun b!522923 () Bool)

(assert (=> b!522923 (= e!304981 e!304982)))

(assert (=> b!522923 (= c!61554 (validKeyInArray!0 (select (arr!15999 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!522924 () Bool)

(declare-fun contains!2764 (List!10157 (_ BitVec 64)) Bool)

(assert (=> b!522924 (= e!304980 (contains!2764 Nil!10154 (select (arr!15999 a!3235) #b00000000000000000000000000000000)))))

(assert (= (and d!80463 (not res!320418)) b!522921))

(assert (= (and b!522921 res!320417) b!522924))

(assert (= (and b!522921 res!320416) b!522923))

(assert (= (and b!522923 c!61554) b!522920))

(assert (= (and b!522923 (not c!61554)) b!522922))

(assert (= (or b!522920 b!522922) bm!31818))

(declare-fun m!503789 () Bool)

(assert (=> b!522921 m!503789))

(assert (=> b!522921 m!503789))

(declare-fun m!503791 () Bool)

(assert (=> b!522921 m!503791))

(assert (=> bm!31818 m!503789))

(declare-fun m!503793 () Bool)

(assert (=> bm!31818 m!503793))

(assert (=> b!522923 m!503789))

(assert (=> b!522923 m!503789))

(assert (=> b!522923 m!503791))

(assert (=> b!522924 m!503789))

(assert (=> b!522924 m!503789))

(declare-fun m!503795 () Bool)

(assert (=> b!522924 m!503795))

(assert (=> b!522634 d!80463))

(declare-fun b!522970 () Bool)

(declare-fun e!305012 () SeekEntryResult!4466)

(declare-fun lt!239897 () SeekEntryResult!4466)

(assert (=> b!522970 (= e!305012 (Found!4466 (index!20069 lt!239897)))))

(declare-fun b!522971 () Bool)

(declare-fun e!305011 () SeekEntryResult!4466)

(assert (=> b!522971 (= e!305011 e!305012)))

(declare-fun lt!239896 () (_ BitVec 64))

(assert (=> b!522971 (= lt!239896 (select (arr!15999 a!3235) (index!20069 lt!239897)))))

(declare-fun c!61574 () Bool)

(assert (=> b!522971 (= c!61574 (= lt!239896 (select (arr!15999 a!3235) j!176)))))

(declare-fun e!305013 () SeekEntryResult!4466)

(declare-fun b!522972 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33286 (_ BitVec 32)) SeekEntryResult!4466)

(assert (=> b!522972 (= e!305013 (seekKeyOrZeroReturnVacant!0 (x!49044 lt!239897) (index!20069 lt!239897) (index!20069 lt!239897) (select (arr!15999 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!522973 () Bool)

(declare-fun c!61575 () Bool)

(assert (=> b!522973 (= c!61575 (= lt!239896 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!522973 (= e!305012 e!305013)))

(declare-fun b!522975 () Bool)

(assert (=> b!522975 (= e!305011 Undefined!4466)))

(declare-fun d!80477 () Bool)

(declare-fun lt!239895 () SeekEntryResult!4466)

(assert (=> d!80477 (and (or (is-Undefined!4466 lt!239895) (not (is-Found!4466 lt!239895)) (and (bvsge (index!20068 lt!239895) #b00000000000000000000000000000000) (bvslt (index!20068 lt!239895) (size!16363 a!3235)))) (or (is-Undefined!4466 lt!239895) (is-Found!4466 lt!239895) (not (is-MissingZero!4466 lt!239895)) (and (bvsge (index!20067 lt!239895) #b00000000000000000000000000000000) (bvslt (index!20067 lt!239895) (size!16363 a!3235)))) (or (is-Undefined!4466 lt!239895) (is-Found!4466 lt!239895) (is-MissingZero!4466 lt!239895) (not (is-MissingVacant!4466 lt!239895)) (and (bvsge (index!20070 lt!239895) #b00000000000000000000000000000000) (bvslt (index!20070 lt!239895) (size!16363 a!3235)))) (or (is-Undefined!4466 lt!239895) (ite (is-Found!4466 lt!239895) (= (select (arr!15999 a!3235) (index!20068 lt!239895)) (select (arr!15999 a!3235) j!176)) (ite (is-MissingZero!4466 lt!239895) (= (select (arr!15999 a!3235) (index!20067 lt!239895)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!4466 lt!239895) (= (select (arr!15999 a!3235) (index!20070 lt!239895)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!80477 (= lt!239895 e!305011)))

(declare-fun c!61573 () Bool)

(assert (=> d!80477 (= c!61573 (and (is-Intermediate!4466 lt!239897) (undefined!5278 lt!239897)))))

(assert (=> d!80477 (= lt!239897 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15999 a!3235) j!176) mask!3524) (select (arr!15999 a!3235) j!176) a!3235 mask!3524))))

(assert (=> d!80477 (validMask!0 mask!3524)))

(assert (=> d!80477 (= (seekEntryOrOpen!0 (select (arr!15999 a!3235) j!176) a!3235 mask!3524) lt!239895)))

(declare-fun b!522974 () Bool)

(assert (=> b!522974 (= e!305013 (MissingZero!4466 (index!20069 lt!239897)))))

(assert (= (and d!80477 c!61573) b!522975))

(assert (= (and d!80477 (not c!61573)) b!522971))

(assert (= (and b!522971 c!61574) b!522970))

(assert (= (and b!522971 (not c!61574)) b!522973))

(assert (= (and b!522973 c!61575) b!522974))

(assert (= (and b!522973 (not c!61575)) b!522972))

(declare-fun m!503815 () Bool)

(assert (=> b!522971 m!503815))

(assert (=> b!522972 m!503543))

(declare-fun m!503817 () Bool)

(assert (=> b!522972 m!503817))

(assert (=> d!80477 m!503547))

(assert (=> d!80477 m!503543))

(assert (=> d!80477 m!503563))

(declare-fun m!503819 () Bool)

(assert (=> d!80477 m!503819))

(assert (=> d!80477 m!503563))

(assert (=> d!80477 m!503543))

(declare-fun m!503821 () Bool)

(assert (=> d!80477 m!503821))

(declare-fun m!503823 () Bool)

(assert (=> d!80477 m!503823))

(declare-fun m!503825 () Bool)

(assert (=> d!80477 m!503825))

(assert (=> b!522633 d!80477))

(declare-fun d!80485 () Bool)

(declare-fun e!305036 () Bool)

(assert (=> d!80485 e!305036))

(declare-fun res!320445 () Bool)

(assert (=> d!80485 (=> (not res!320445) (not e!305036))))

(assert (=> d!80485 (= res!320445 (and (or (bvslt i!1204 #b00000000000000000000000000000000) (bvsge i!1204 (size!16363 a!3235)) (and (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16363 a!3235)))) (or (bvslt i!1204 #b00000000000000000000000000000000) (bvsge i!1204 (size!16363 a!3235)) (and (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16363 a!3235)))) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16363 a!3235))))))

(declare-fun lt!239913 () Unit!16316)

(declare-fun choose!47 (array!33286 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16316)

(assert (=> d!80485 (= lt!239913 (choose!47 a!3235 i!1204 k!2280 j!176 lt!239728 #b00000000000000000000000000000000 (index!20069 lt!239729) (x!49044 lt!239729) mask!3524))))

(assert (=> d!80485 (validMask!0 mask!3524)))

(assert (=> d!80485 (= (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!239728 #b00000000000000000000000000000000 (index!20069 lt!239729) (x!49044 lt!239729) mask!3524) lt!239913)))

(declare-fun b!523006 () Bool)

(assert (=> b!523006 (= e!305036 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239728 (select (store (arr!15999 a!3235) i!1204 k!2280) j!176) (array!33287 (store (arr!15999 a!3235) i!1204 k!2280) (size!16363 a!3235)) mask!3524) (Intermediate!4466 false (index!20069 lt!239729) (x!49044 lt!239729))))))

(assert (= (and d!80485 res!320445) b!523006))

(declare-fun m!503843 () Bool)

(assert (=> d!80485 m!503843))

(assert (=> d!80485 m!503547))

(assert (=> b!523006 m!503555))

(assert (=> b!523006 m!503559))

(assert (=> b!523006 m!503559))

(declare-fun m!503845 () Bool)

(assert (=> b!523006 m!503845))

(assert (=> b!522628 d!80485))

(declare-fun b!523007 () Bool)

(declare-fun e!305041 () SeekEntryResult!4466)

(assert (=> b!523007 (= e!305041 (Intermediate!4466 true lt!239728 #b00000000000000000000000000000000))))

(declare-fun b!523008 () Bool)

(declare-fun e!305039 () Bool)

(declare-fun lt!239914 () SeekEntryResult!4466)

(assert (=> b!523008 (= e!305039 (bvsge (x!49044 lt!239914) #b01111111111111111111111111111110))))

(declare-fun b!523009 () Bool)

(declare-fun e!305040 () SeekEntryResult!4466)

(assert (=> b!523009 (= e!305040 (Intermediate!4466 false lt!239728 #b00000000000000000000000000000000))))

(declare-fun b!523010 () Bool)

(assert (=> b!523010 (= e!305040 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!239728 #b00000000000000000000000000000000 mask!3524) lt!239727 lt!239723 mask!3524))))

(declare-fun b!523011 () Bool)

(assert (=> b!523011 (and (bvsge (index!20069 lt!239914) #b00000000000000000000000000000000) (bvslt (index!20069 lt!239914) (size!16363 lt!239723)))))

(declare-fun res!320447 () Bool)

(assert (=> b!523011 (= res!320447 (= (select (arr!15999 lt!239723) (index!20069 lt!239914)) lt!239727))))

(declare-fun e!305038 () Bool)

(assert (=> b!523011 (=> res!320447 e!305038)))

(declare-fun e!305037 () Bool)

(assert (=> b!523011 (= e!305037 e!305038)))

(declare-fun b!523012 () Bool)

(assert (=> b!523012 (= e!305041 e!305040)))

(declare-fun c!61585 () Bool)

(declare-fun lt!239915 () (_ BitVec 64))

(assert (=> b!523012 (= c!61585 (or (= lt!239915 lt!239727) (= (bvadd lt!239915 lt!239915) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!523013 () Bool)

(assert (=> b!523013 (and (bvsge (index!20069 lt!239914) #b00000000000000000000000000000000) (bvslt (index!20069 lt!239914) (size!16363 lt!239723)))))

(assert (=> b!523013 (= e!305038 (= (select (arr!15999 lt!239723) (index!20069 lt!239914)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!80499 () Bool)

(assert (=> d!80499 e!305039))

(declare-fun c!61583 () Bool)

(assert (=> d!80499 (= c!61583 (and (is-Intermediate!4466 lt!239914) (undefined!5278 lt!239914)))))

(assert (=> d!80499 (= lt!239914 e!305041)))

(declare-fun c!61584 () Bool)

(assert (=> d!80499 (= c!61584 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!80499 (= lt!239915 (select (arr!15999 lt!239723) lt!239728))))

(assert (=> d!80499 (validMask!0 mask!3524)))

(assert (=> d!80499 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239728 lt!239727 lt!239723 mask!3524) lt!239914)))

(declare-fun b!523014 () Bool)

(assert (=> b!523014 (and (bvsge (index!20069 lt!239914) #b00000000000000000000000000000000) (bvslt (index!20069 lt!239914) (size!16363 lt!239723)))))

(declare-fun res!320448 () Bool)

(assert (=> b!523014 (= res!320448 (= (select (arr!15999 lt!239723) (index!20069 lt!239914)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!523014 (=> res!320448 e!305038)))

(declare-fun b!523015 () Bool)

(assert (=> b!523015 (= e!305039 e!305037)))

(declare-fun res!320446 () Bool)

(assert (=> b!523015 (= res!320446 (and (is-Intermediate!4466 lt!239914) (not (undefined!5278 lt!239914)) (bvslt (x!49044 lt!239914) #b01111111111111111111111111111110) (bvsge (x!49044 lt!239914) #b00000000000000000000000000000000) (bvsge (x!49044 lt!239914) #b00000000000000000000000000000000)))))

(assert (=> b!523015 (=> (not res!320446) (not e!305037))))

(assert (= (and d!80499 c!61584) b!523007))

(assert (= (and d!80499 (not c!61584)) b!523012))

(assert (= (and b!523012 c!61585) b!523009))

(assert (= (and b!523012 (not c!61585)) b!523010))

(assert (= (and d!80499 c!61583) b!523008))

(assert (= (and d!80499 (not c!61583)) b!523015))

(assert (= (and b!523015 res!320446) b!523011))

(assert (= (and b!523011 (not res!320447)) b!523014))

(assert (= (and b!523014 (not res!320448)) b!523013))

(assert (=> b!523010 m!503723))

(assert (=> b!523010 m!503723))

(declare-fun m!503847 () Bool)

(assert (=> b!523010 m!503847))

(declare-fun m!503849 () Bool)

(assert (=> d!80499 m!503849))

(assert (=> d!80499 m!503547))

(declare-fun m!503851 () Bool)

(assert (=> b!523014 m!503851))

(assert (=> b!523011 m!503851))

(assert (=> b!523013 m!503851))

(assert (=> b!522628 d!80499))

(declare-fun d!80501 () Bool)

(assert (=> d!80501 (= (validKeyInArray!0 k!2280) (and (not (= k!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!522632 d!80501))

(declare-fun b!523016 () Bool)

(declare-fun e!305043 () SeekEntryResult!4466)

(declare-fun lt!239918 () SeekEntryResult!4466)

(assert (=> b!523016 (= e!305043 (Found!4466 (index!20069 lt!239918)))))

(declare-fun b!523017 () Bool)

(declare-fun e!305042 () SeekEntryResult!4466)

(assert (=> b!523017 (= e!305042 e!305043)))

(declare-fun lt!239917 () (_ BitVec 64))

(assert (=> b!523017 (= lt!239917 (select (arr!15999 a!3235) (index!20069 lt!239918)))))

(declare-fun c!61587 () Bool)

(assert (=> b!523017 (= c!61587 (= lt!239917 k!2280))))

(declare-fun b!523018 () Bool)

(declare-fun e!305044 () SeekEntryResult!4466)

(assert (=> b!523018 (= e!305044 (seekKeyOrZeroReturnVacant!0 (x!49044 lt!239918) (index!20069 lt!239918) (index!20069 lt!239918) k!2280 a!3235 mask!3524))))

(declare-fun b!523019 () Bool)

(declare-fun c!61588 () Bool)

(assert (=> b!523019 (= c!61588 (= lt!239917 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!523019 (= e!305043 e!305044)))

(declare-fun b!523021 () Bool)

(assert (=> b!523021 (= e!305042 Undefined!4466)))

(declare-fun d!80503 () Bool)

(declare-fun lt!239916 () SeekEntryResult!4466)

(assert (=> d!80503 (and (or (is-Undefined!4466 lt!239916) (not (is-Found!4466 lt!239916)) (and (bvsge (index!20068 lt!239916) #b00000000000000000000000000000000) (bvslt (index!20068 lt!239916) (size!16363 a!3235)))) (or (is-Undefined!4466 lt!239916) (is-Found!4466 lt!239916) (not (is-MissingZero!4466 lt!239916)) (and (bvsge (index!20067 lt!239916) #b00000000000000000000000000000000) (bvslt (index!20067 lt!239916) (size!16363 a!3235)))) (or (is-Undefined!4466 lt!239916) (is-Found!4466 lt!239916) (is-MissingZero!4466 lt!239916) (not (is-MissingVacant!4466 lt!239916)) (and (bvsge (index!20070 lt!239916) #b00000000000000000000000000000000) (bvslt (index!20070 lt!239916) (size!16363 a!3235)))) (or (is-Undefined!4466 lt!239916) (ite (is-Found!4466 lt!239916) (= (select (arr!15999 a!3235) (index!20068 lt!239916)) k!2280) (ite (is-MissingZero!4466 lt!239916) (= (select (arr!15999 a!3235) (index!20067 lt!239916)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!4466 lt!239916) (= (select (arr!15999 a!3235) (index!20070 lt!239916)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!80503 (= lt!239916 e!305042)))

(declare-fun c!61586 () Bool)

(assert (=> d!80503 (= c!61586 (and (is-Intermediate!4466 lt!239918) (undefined!5278 lt!239918)))))

(assert (=> d!80503 (= lt!239918 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2280 mask!3524) k!2280 a!3235 mask!3524))))

(assert (=> d!80503 (validMask!0 mask!3524)))

(assert (=> d!80503 (= (seekEntryOrOpen!0 k!2280 a!3235 mask!3524) lt!239916)))

(declare-fun b!523020 () Bool)

(assert (=> b!523020 (= e!305044 (MissingZero!4466 (index!20069 lt!239918)))))

(assert (= (and d!80503 c!61586) b!523021))

(assert (= (and d!80503 (not c!61586)) b!523017))

(assert (= (and b!523017 c!61587) b!523016))

(assert (= (and b!523017 (not c!61587)) b!523019))

(assert (= (and b!523019 c!61588) b!523020))

(assert (= (and b!523019 (not c!61588)) b!523018))

(declare-fun m!503853 () Bool)

(assert (=> b!523017 m!503853))

(declare-fun m!503855 () Bool)

(assert (=> b!523018 m!503855))

(assert (=> d!80503 m!503547))

(declare-fun m!503857 () Bool)

(assert (=> d!80503 m!503857))

(declare-fun m!503859 () Bool)

(assert (=> d!80503 m!503859))

(assert (=> d!80503 m!503857))

(declare-fun m!503861 () Bool)

(assert (=> d!80503 m!503861))

(declare-fun m!503863 () Bool)

(assert (=> d!80503 m!503863))

(declare-fun m!503865 () Bool)

(assert (=> d!80503 m!503865))

(assert (=> b!522631 d!80503))

(declare-fun d!80505 () Bool)

(declare-fun res!320456 () Bool)

(declare-fun e!305057 () Bool)

(assert (=> d!80505 (=> res!320456 e!305057)))

(assert (=> d!80505 (= res!320456 (= (select (arr!15999 a!3235) #b00000000000000000000000000000000) k!2280))))

(assert (=> d!80505 (= (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000) e!305057)))

(declare-fun b!523041 () Bool)

(declare-fun e!305058 () Bool)

(assert (=> b!523041 (= e!305057 e!305058)))

(declare-fun res!320457 () Bool)

(assert (=> b!523041 (=> (not res!320457) (not e!305058))))

(assert (=> b!523041 (= res!320457 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16363 a!3235)))))

(declare-fun b!523042 () Bool)

(assert (=> b!523042 (= e!305058 (arrayContainsKey!0 a!3235 k!2280 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!80505 (not res!320456)) b!523041))

(assert (= (and b!523041 res!320457) b!523042))

(assert (=> d!80505 m!503789))

(declare-fun m!503889 () Bool)

(assert (=> b!523042 m!503889))

(assert (=> b!522641 d!80505))

(declare-fun bm!31826 () Bool)

(declare-fun call!31829 () Bool)

(assert (=> bm!31826 (= call!31829 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!523043 () Bool)

(declare-fun e!305061 () Bool)

(assert (=> b!523043 (= e!305061 call!31829)))

(declare-fun d!80513 () Bool)

(declare-fun res!320458 () Bool)

(declare-fun e!305059 () Bool)

(assert (=> d!80513 (=> res!320458 e!305059)))

(assert (=> d!80513 (= res!320458 (bvsge #b00000000000000000000000000000000 (size!16363 a!3235)))))

(assert (=> d!80513 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!305059)))

(declare-fun b!523044 () Bool)

(declare-fun e!305060 () Bool)

(assert (=> b!523044 (= e!305061 e!305060)))

(declare-fun lt!239928 () (_ BitVec 64))

(assert (=> b!523044 (= lt!239928 (select (arr!15999 a!3235) #b00000000000000000000000000000000))))

(declare-fun lt!239929 () Unit!16316)

(assert (=> b!523044 (= lt!239929 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!239928 #b00000000000000000000000000000000))))

(assert (=> b!523044 (arrayContainsKey!0 a!3235 lt!239928 #b00000000000000000000000000000000)))

(declare-fun lt!239927 () Unit!16316)

(assert (=> b!523044 (= lt!239927 lt!239929)))

(declare-fun res!320459 () Bool)

