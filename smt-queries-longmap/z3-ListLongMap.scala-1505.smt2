; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28504 () Bool)

(assert start!28504)

(declare-datatypes ((SeekEntryResult!2105 0))(
  ( (MissingZero!2105 (index!10590 (_ BitVec 32))) (Found!2105 (index!10591 (_ BitVec 32))) (Intermediate!2105 (undefined!2917 Bool) (index!10592 (_ BitVec 32)) (x!28890 (_ BitVec 32))) (Undefined!2105) (MissingVacant!2105 (index!10593 (_ BitVec 32))) )
))
(declare-fun lt!144416 () SeekEntryResult!2105)

(declare-datatypes ((array!14733 0))(
  ( (array!14734 (arr!6991 (Array (_ BitVec 32) (_ BitVec 64))) (size!7343 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14733)

(declare-fun b!291793 () Bool)

(declare-fun lt!144419 () (_ BitVec 32))

(declare-fun e!184626 () Bool)

(assert (=> b!291793 (= e!184626 (not (or (not (= lt!144416 (Intermediate!2105 false (index!10592 lt!144416) (x!28890 lt!144416)))) (bvsgt #b00000000000000000000000000000000 (x!28890 lt!144416)) (and (bvsge lt!144419 #b00000000000000000000000000000000) (bvslt lt!144419 (size!7343 a!3312))))))))

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!291793 (= (index!10592 lt!144416) i!1256)))

(declare-fun b!291794 () Bool)

(declare-fun res!152968 () Bool)

(declare-fun e!184627 () Bool)

(assert (=> b!291794 (=> (not res!152968) (not e!184627))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14733 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!291794 (= res!152968 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!291795 () Bool)

(declare-fun res!152969 () Bool)

(declare-fun e!184628 () Bool)

(assert (=> b!291795 (=> (not res!152969) (not e!184628))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14733 (_ BitVec 32)) Bool)

(assert (=> b!291795 (= res!152969 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!291796 () Bool)

(declare-fun res!152966 () Bool)

(assert (=> b!291796 (=> (not res!152966) (not e!184627))))

(assert (=> b!291796 (= res!152966 (and (= (size!7343 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7343 a!3312))))))

(declare-fun b!291797 () Bool)

(declare-fun e!184625 () Bool)

(assert (=> b!291797 (= e!184625 e!184626)))

(declare-fun res!152964 () Bool)

(assert (=> b!291797 (=> (not res!152964) (not e!184626))))

(declare-fun lt!144417 () Bool)

(assert (=> b!291797 (= res!152964 (and (or lt!144417 (not (undefined!2917 lt!144416))) (not lt!144417) (= (select (arr!6991 a!3312) (index!10592 lt!144416)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(get-info :version)

(assert (=> b!291797 (= lt!144417 (not ((_ is Intermediate!2105) lt!144416)))))

(declare-fun res!152967 () Bool)

(assert (=> start!28504 (=> (not res!152967) (not e!184627))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28504 (= res!152967 (validMask!0 mask!3809))))

(assert (=> start!28504 e!184627))

(assert (=> start!28504 true))

(declare-fun array_inv!4941 (array!14733) Bool)

(assert (=> start!28504 (array_inv!4941 a!3312)))

(declare-fun b!291792 () Bool)

(declare-fun res!152970 () Bool)

(assert (=> b!291792 (=> (not res!152970) (not e!184627))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!291792 (= res!152970 (validKeyInArray!0 k0!2524))))

(declare-fun b!291798 () Bool)

(assert (=> b!291798 (= e!184628 e!184625)))

(declare-fun res!152963 () Bool)

(assert (=> b!291798 (=> (not res!152963) (not e!184625))))

(declare-fun lt!144415 () SeekEntryResult!2105)

(declare-fun lt!144418 () Bool)

(assert (=> b!291798 (= res!152963 (and (not lt!144418) (= lt!144415 (MissingVacant!2105 i!1256))))))

(declare-fun lt!144420 () SeekEntryResult!2105)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14733 (_ BitVec 32)) SeekEntryResult!2105)

(assert (=> b!291798 (= lt!144420 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144419 k0!2524 (array!14734 (store (arr!6991 a!3312) i!1256 k0!2524) (size!7343 a!3312)) mask!3809))))

(assert (=> b!291798 (= lt!144416 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144419 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!291798 (= lt!144419 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!291799 () Bool)

(assert (=> b!291799 (= e!184627 e!184628)))

(declare-fun res!152965 () Bool)

(assert (=> b!291799 (=> (not res!152965) (not e!184628))))

(assert (=> b!291799 (= res!152965 (or lt!144418 (= lt!144415 (MissingVacant!2105 i!1256))))))

(assert (=> b!291799 (= lt!144418 (= lt!144415 (MissingZero!2105 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14733 (_ BitVec 32)) SeekEntryResult!2105)

(assert (=> b!291799 (= lt!144415 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(assert (= (and start!28504 res!152967) b!291796))

(assert (= (and b!291796 res!152966) b!291792))

(assert (= (and b!291792 res!152970) b!291794))

(assert (= (and b!291794 res!152968) b!291799))

(assert (= (and b!291799 res!152965) b!291795))

(assert (= (and b!291795 res!152969) b!291798))

(assert (= (and b!291798 res!152963) b!291797))

(assert (= (and b!291797 res!152964) b!291793))

(declare-fun m!305783 () Bool)

(assert (=> b!291797 m!305783))

(declare-fun m!305785 () Bool)

(assert (=> b!291798 m!305785))

(declare-fun m!305787 () Bool)

(assert (=> b!291798 m!305787))

(declare-fun m!305789 () Bool)

(assert (=> b!291798 m!305789))

(declare-fun m!305791 () Bool)

(assert (=> b!291798 m!305791))

(declare-fun m!305793 () Bool)

(assert (=> b!291799 m!305793))

(declare-fun m!305795 () Bool)

(assert (=> start!28504 m!305795))

(declare-fun m!305797 () Bool)

(assert (=> start!28504 m!305797))

(declare-fun m!305799 () Bool)

(assert (=> b!291795 m!305799))

(declare-fun m!305801 () Bool)

(assert (=> b!291794 m!305801))

(declare-fun m!305803 () Bool)

(assert (=> b!291792 m!305803))

(check-sat (not start!28504) (not b!291795) (not b!291799) (not b!291794) (not b!291792) (not b!291798))
(check-sat)
(get-model)

(declare-fun d!66479 () Bool)

(declare-fun e!184673 () Bool)

(assert (=> d!66479 e!184673))

(declare-fun c!46987 () Bool)

(declare-fun lt!144462 () SeekEntryResult!2105)

(assert (=> d!66479 (= c!46987 (and ((_ is Intermediate!2105) lt!144462) (undefined!2917 lt!144462)))))

(declare-fun e!184670 () SeekEntryResult!2105)

(assert (=> d!66479 (= lt!144462 e!184670)))

(declare-fun c!46985 () Bool)

(assert (=> d!66479 (= c!46985 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!144461 () (_ BitVec 64))

(assert (=> d!66479 (= lt!144461 (select (arr!6991 (array!14734 (store (arr!6991 a!3312) i!1256 k0!2524) (size!7343 a!3312))) lt!144419))))

(assert (=> d!66479 (validMask!0 mask!3809)))

(assert (=> d!66479 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144419 k0!2524 (array!14734 (store (arr!6991 a!3312) i!1256 k0!2524) (size!7343 a!3312)) mask!3809) lt!144462)))

(declare-fun b!291866 () Bool)

(declare-fun e!184671 () Bool)

(assert (=> b!291866 (= e!184673 e!184671)))

(declare-fun res!153026 () Bool)

(assert (=> b!291866 (= res!153026 (and ((_ is Intermediate!2105) lt!144462) (not (undefined!2917 lt!144462)) (bvslt (x!28890 lt!144462) #b01111111111111111111111111111110) (bvsge (x!28890 lt!144462) #b00000000000000000000000000000000) (bvsge (x!28890 lt!144462) #b00000000000000000000000000000000)))))

(assert (=> b!291866 (=> (not res!153026) (not e!184671))))

(declare-fun b!291867 () Bool)

(assert (=> b!291867 (and (bvsge (index!10592 lt!144462) #b00000000000000000000000000000000) (bvslt (index!10592 lt!144462) (size!7343 (array!14734 (store (arr!6991 a!3312) i!1256 k0!2524) (size!7343 a!3312)))))))

(declare-fun e!184672 () Bool)

(assert (=> b!291867 (= e!184672 (= (select (arr!6991 (array!14734 (store (arr!6991 a!3312) i!1256 k0!2524) (size!7343 a!3312))) (index!10592 lt!144462)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!184669 () SeekEntryResult!2105)

(declare-fun b!291868 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!291868 (= e!184669 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!144419 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3809) k0!2524 (array!14734 (store (arr!6991 a!3312) i!1256 k0!2524) (size!7343 a!3312)) mask!3809))))

(declare-fun b!291869 () Bool)

(assert (=> b!291869 (and (bvsge (index!10592 lt!144462) #b00000000000000000000000000000000) (bvslt (index!10592 lt!144462) (size!7343 (array!14734 (store (arr!6991 a!3312) i!1256 k0!2524) (size!7343 a!3312)))))))

(declare-fun res!153025 () Bool)

(assert (=> b!291869 (= res!153025 (= (select (arr!6991 (array!14734 (store (arr!6991 a!3312) i!1256 k0!2524) (size!7343 a!3312))) (index!10592 lt!144462)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!291869 (=> res!153025 e!184672)))

(declare-fun b!291870 () Bool)

(assert (=> b!291870 (and (bvsge (index!10592 lt!144462) #b00000000000000000000000000000000) (bvslt (index!10592 lt!144462) (size!7343 (array!14734 (store (arr!6991 a!3312) i!1256 k0!2524) (size!7343 a!3312)))))))

(declare-fun res!153027 () Bool)

(assert (=> b!291870 (= res!153027 (= (select (arr!6991 (array!14734 (store (arr!6991 a!3312) i!1256 k0!2524) (size!7343 a!3312))) (index!10592 lt!144462)) k0!2524))))

(assert (=> b!291870 (=> res!153027 e!184672)))

(assert (=> b!291870 (= e!184671 e!184672)))

(declare-fun b!291871 () Bool)

(assert (=> b!291871 (= e!184670 e!184669)))

(declare-fun c!46986 () Bool)

(assert (=> b!291871 (= c!46986 (or (= lt!144461 k0!2524) (= (bvadd lt!144461 lt!144461) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!291872 () Bool)

(assert (=> b!291872 (= e!184673 (bvsge (x!28890 lt!144462) #b01111111111111111111111111111110))))

(declare-fun b!291873 () Bool)

(assert (=> b!291873 (= e!184669 (Intermediate!2105 false lt!144419 #b00000000000000000000000000000000))))

(declare-fun b!291874 () Bool)

(assert (=> b!291874 (= e!184670 (Intermediate!2105 true lt!144419 #b00000000000000000000000000000000))))

(assert (= (and d!66479 c!46985) b!291874))

(assert (= (and d!66479 (not c!46985)) b!291871))

(assert (= (and b!291871 c!46986) b!291873))

(assert (= (and b!291871 (not c!46986)) b!291868))

(assert (= (and d!66479 c!46987) b!291872))

(assert (= (and d!66479 (not c!46987)) b!291866))

(assert (= (and b!291866 res!153026) b!291870))

(assert (= (and b!291870 (not res!153027)) b!291869))

(assert (= (and b!291869 (not res!153025)) b!291867))

(declare-fun m!305849 () Bool)

(assert (=> b!291870 m!305849))

(declare-fun m!305851 () Bool)

(assert (=> d!66479 m!305851))

(assert (=> d!66479 m!305795))

(assert (=> b!291869 m!305849))

(assert (=> b!291867 m!305849))

(declare-fun m!305853 () Bool)

(assert (=> b!291868 m!305853))

(assert (=> b!291868 m!305853))

(declare-fun m!305855 () Bool)

(assert (=> b!291868 m!305855))

(assert (=> b!291798 d!66479))

(declare-fun d!66481 () Bool)

(declare-fun e!184678 () Bool)

(assert (=> d!66481 e!184678))

(declare-fun c!46990 () Bool)

(declare-fun lt!144464 () SeekEntryResult!2105)

(assert (=> d!66481 (= c!46990 (and ((_ is Intermediate!2105) lt!144464) (undefined!2917 lt!144464)))))

(declare-fun e!184675 () SeekEntryResult!2105)

(assert (=> d!66481 (= lt!144464 e!184675)))

(declare-fun c!46988 () Bool)

(assert (=> d!66481 (= c!46988 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!144463 () (_ BitVec 64))

(assert (=> d!66481 (= lt!144463 (select (arr!6991 a!3312) lt!144419))))

(assert (=> d!66481 (validMask!0 mask!3809)))

(assert (=> d!66481 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144419 k0!2524 a!3312 mask!3809) lt!144464)))

(declare-fun b!291875 () Bool)

(declare-fun e!184676 () Bool)

(assert (=> b!291875 (= e!184678 e!184676)))

(declare-fun res!153029 () Bool)

(assert (=> b!291875 (= res!153029 (and ((_ is Intermediate!2105) lt!144464) (not (undefined!2917 lt!144464)) (bvslt (x!28890 lt!144464) #b01111111111111111111111111111110) (bvsge (x!28890 lt!144464) #b00000000000000000000000000000000) (bvsge (x!28890 lt!144464) #b00000000000000000000000000000000)))))

(assert (=> b!291875 (=> (not res!153029) (not e!184676))))

(declare-fun b!291876 () Bool)

(assert (=> b!291876 (and (bvsge (index!10592 lt!144464) #b00000000000000000000000000000000) (bvslt (index!10592 lt!144464) (size!7343 a!3312)))))

(declare-fun e!184677 () Bool)

(assert (=> b!291876 (= e!184677 (= (select (arr!6991 a!3312) (index!10592 lt!144464)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!184674 () SeekEntryResult!2105)

(declare-fun b!291877 () Bool)

(assert (=> b!291877 (= e!184674 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!144419 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3809) k0!2524 a!3312 mask!3809))))

(declare-fun b!291878 () Bool)

(assert (=> b!291878 (and (bvsge (index!10592 lt!144464) #b00000000000000000000000000000000) (bvslt (index!10592 lt!144464) (size!7343 a!3312)))))

(declare-fun res!153028 () Bool)

(assert (=> b!291878 (= res!153028 (= (select (arr!6991 a!3312) (index!10592 lt!144464)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!291878 (=> res!153028 e!184677)))

(declare-fun b!291879 () Bool)

(assert (=> b!291879 (and (bvsge (index!10592 lt!144464) #b00000000000000000000000000000000) (bvslt (index!10592 lt!144464) (size!7343 a!3312)))))

(declare-fun res!153030 () Bool)

(assert (=> b!291879 (= res!153030 (= (select (arr!6991 a!3312) (index!10592 lt!144464)) k0!2524))))

(assert (=> b!291879 (=> res!153030 e!184677)))

(assert (=> b!291879 (= e!184676 e!184677)))

(declare-fun b!291880 () Bool)

(assert (=> b!291880 (= e!184675 e!184674)))

(declare-fun c!46989 () Bool)

(assert (=> b!291880 (= c!46989 (or (= lt!144463 k0!2524) (= (bvadd lt!144463 lt!144463) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!291881 () Bool)

(assert (=> b!291881 (= e!184678 (bvsge (x!28890 lt!144464) #b01111111111111111111111111111110))))

(declare-fun b!291882 () Bool)

(assert (=> b!291882 (= e!184674 (Intermediate!2105 false lt!144419 #b00000000000000000000000000000000))))

(declare-fun b!291883 () Bool)

(assert (=> b!291883 (= e!184675 (Intermediate!2105 true lt!144419 #b00000000000000000000000000000000))))

(assert (= (and d!66481 c!46988) b!291883))

(assert (= (and d!66481 (not c!46988)) b!291880))

(assert (= (and b!291880 c!46989) b!291882))

(assert (= (and b!291880 (not c!46989)) b!291877))

(assert (= (and d!66481 c!46990) b!291881))

(assert (= (and d!66481 (not c!46990)) b!291875))

(assert (= (and b!291875 res!153029) b!291879))

(assert (= (and b!291879 (not res!153030)) b!291878))

(assert (= (and b!291878 (not res!153028)) b!291876))

(declare-fun m!305857 () Bool)

(assert (=> b!291879 m!305857))

(declare-fun m!305859 () Bool)

(assert (=> d!66481 m!305859))

(assert (=> d!66481 m!305795))

(assert (=> b!291878 m!305857))

(assert (=> b!291876 m!305857))

(assert (=> b!291877 m!305853))

(assert (=> b!291877 m!305853))

(declare-fun m!305861 () Bool)

(assert (=> b!291877 m!305861))

(assert (=> b!291798 d!66481))

(declare-fun d!66483 () Bool)

(declare-fun lt!144470 () (_ BitVec 32))

(declare-fun lt!144469 () (_ BitVec 32))

(assert (=> d!66483 (= lt!144470 (bvmul (bvxor lt!144469 (bvlshr lt!144469 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!66483 (= lt!144469 ((_ extract 31 0) (bvand (bvxor k0!2524 (bvlshr k0!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!66483 (and (bvsge mask!3809 #b00000000000000000000000000000000) (let ((res!153031 (let ((h!5177 ((_ extract 31 0) (bvand (bvxor k0!2524 (bvlshr k0!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!28894 (bvmul (bvxor h!5177 (bvlshr h!5177 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!28894 (bvlshr x!28894 #b00000000000000000000000000001101)) mask!3809))))) (and (bvslt res!153031 (bvadd mask!3809 #b00000000000000000000000000000001)) (bvsge res!153031 #b00000000000000000000000000000000))))))

(assert (=> d!66483 (= (toIndex!0 k0!2524 mask!3809) (bvand (bvxor lt!144470 (bvlshr lt!144470 #b00000000000000000000000000001101)) mask!3809))))

(assert (=> b!291798 d!66483))

(declare-fun d!66487 () Bool)

(assert (=> d!66487 (= (validMask!0 mask!3809) (and (or (= mask!3809 #b00000000000000000000000000000111) (= mask!3809 #b00000000000000000000000000001111) (= mask!3809 #b00000000000000000000000000011111) (= mask!3809 #b00000000000000000000000000111111) (= mask!3809 #b00000000000000000000000001111111) (= mask!3809 #b00000000000000000000000011111111) (= mask!3809 #b00000000000000000000000111111111) (= mask!3809 #b00000000000000000000001111111111) (= mask!3809 #b00000000000000000000011111111111) (= mask!3809 #b00000000000000000000111111111111) (= mask!3809 #b00000000000000000001111111111111) (= mask!3809 #b00000000000000000011111111111111) (= mask!3809 #b00000000000000000111111111111111) (= mask!3809 #b00000000000000001111111111111111) (= mask!3809 #b00000000000000011111111111111111) (= mask!3809 #b00000000000000111111111111111111) (= mask!3809 #b00000000000001111111111111111111) (= mask!3809 #b00000000000011111111111111111111) (= mask!3809 #b00000000000111111111111111111111) (= mask!3809 #b00000000001111111111111111111111) (= mask!3809 #b00000000011111111111111111111111) (= mask!3809 #b00000000111111111111111111111111) (= mask!3809 #b00000001111111111111111111111111) (= mask!3809 #b00000011111111111111111111111111) (= mask!3809 #b00000111111111111111111111111111) (= mask!3809 #b00001111111111111111111111111111) (= mask!3809 #b00011111111111111111111111111111) (= mask!3809 #b00111111111111111111111111111111)) (bvsle mask!3809 #b00111111111111111111111111111111)))))

(assert (=> start!28504 d!66487))

(declare-fun d!66495 () Bool)

(assert (=> d!66495 (= (array_inv!4941 a!3312) (bvsge (size!7343 a!3312) #b00000000000000000000000000000000))))

(assert (=> start!28504 d!66495))

(declare-fun d!66497 () Bool)

(assert (=> d!66497 (= (validKeyInArray!0 k0!2524) (and (not (= k0!2524 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2524 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!291792 d!66497))

(declare-fun b!291910 () Bool)

(declare-fun e!184700 () Bool)

(declare-fun e!184702 () Bool)

(assert (=> b!291910 (= e!184700 e!184702)))

(declare-fun c!46996 () Bool)

(assert (=> b!291910 (= c!46996 (validKeyInArray!0 (select (arr!6991 a!3312) #b00000000000000000000000000000000)))))

(declare-fun bm!25642 () Bool)

(declare-fun call!25645 () Bool)

(assert (=> bm!25642 (= call!25645 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3312 mask!3809))))

(declare-fun d!66499 () Bool)

(declare-fun res!153049 () Bool)

(assert (=> d!66499 (=> res!153049 e!184700)))

(assert (=> d!66499 (= res!153049 (bvsge #b00000000000000000000000000000000 (size!7343 a!3312)))))

(assert (=> d!66499 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809) e!184700)))

(declare-fun b!291911 () Bool)

(declare-fun e!184701 () Bool)

(assert (=> b!291911 (= e!184702 e!184701)))

(declare-fun lt!144487 () (_ BitVec 64))

(assert (=> b!291911 (= lt!144487 (select (arr!6991 a!3312) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9118 0))(
  ( (Unit!9119) )
))
(declare-fun lt!144486 () Unit!9118)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!14733 (_ BitVec 64) (_ BitVec 32)) Unit!9118)

(assert (=> b!291911 (= lt!144486 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3312 lt!144487 #b00000000000000000000000000000000))))

(assert (=> b!291911 (arrayContainsKey!0 a!3312 lt!144487 #b00000000000000000000000000000000)))

(declare-fun lt!144488 () Unit!9118)

(assert (=> b!291911 (= lt!144488 lt!144486)))

(declare-fun res!153048 () Bool)

(assert (=> b!291911 (= res!153048 (= (seekEntryOrOpen!0 (select (arr!6991 a!3312) #b00000000000000000000000000000000) a!3312 mask!3809) (Found!2105 #b00000000000000000000000000000000)))))

(assert (=> b!291911 (=> (not res!153048) (not e!184701))))

(declare-fun b!291912 () Bool)

(assert (=> b!291912 (= e!184701 call!25645)))

(declare-fun b!291913 () Bool)

(assert (=> b!291913 (= e!184702 call!25645)))

(assert (= (and d!66499 (not res!153049)) b!291910))

(assert (= (and b!291910 c!46996) b!291911))

(assert (= (and b!291910 (not c!46996)) b!291913))

(assert (= (and b!291911 res!153048) b!291912))

(assert (= (or b!291912 b!291913) bm!25642))

(declare-fun m!305879 () Bool)

(assert (=> b!291910 m!305879))

(assert (=> b!291910 m!305879))

(declare-fun m!305881 () Bool)

(assert (=> b!291910 m!305881))

(declare-fun m!305883 () Bool)

(assert (=> bm!25642 m!305883))

(assert (=> b!291911 m!305879))

(declare-fun m!305885 () Bool)

(assert (=> b!291911 m!305885))

(declare-fun m!305887 () Bool)

(assert (=> b!291911 m!305887))

(assert (=> b!291911 m!305879))

(declare-fun m!305889 () Bool)

(assert (=> b!291911 m!305889))

(assert (=> b!291795 d!66499))

(declare-fun d!66505 () Bool)

(declare-fun res!153060 () Bool)

(declare-fun e!184713 () Bool)

(assert (=> d!66505 (=> res!153060 e!184713)))

(assert (=> d!66505 (= res!153060 (= (select (arr!6991 a!3312) #b00000000000000000000000000000000) k0!2524))))

(assert (=> d!66505 (= (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000) e!184713)))

(declare-fun b!291924 () Bool)

(declare-fun e!184714 () Bool)

(assert (=> b!291924 (= e!184713 e!184714)))

(declare-fun res!153061 () Bool)

(assert (=> b!291924 (=> (not res!153061) (not e!184714))))

(assert (=> b!291924 (= res!153061 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7343 a!3312)))))

(declare-fun b!291925 () Bool)

(assert (=> b!291925 (= e!184714 (arrayContainsKey!0 a!3312 k0!2524 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!66505 (not res!153060)) b!291924))

(assert (= (and b!291924 res!153061) b!291925))

(assert (=> d!66505 m!305879))

(declare-fun m!305893 () Bool)

(assert (=> b!291925 m!305893))

(assert (=> b!291794 d!66505))

(declare-fun b!291956 () Bool)

(declare-fun e!184733 () SeekEntryResult!2105)

(declare-fun lt!144500 () SeekEntryResult!2105)

(assert (=> b!291956 (= e!184733 (MissingZero!2105 (index!10592 lt!144500)))))

(declare-fun b!291957 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14733 (_ BitVec 32)) SeekEntryResult!2105)

(assert (=> b!291957 (= e!184733 (seekKeyOrZeroReturnVacant!0 (x!28890 lt!144500) (index!10592 lt!144500) (index!10592 lt!144500) k0!2524 a!3312 mask!3809))))

(declare-fun b!291958 () Bool)

(declare-fun c!47010 () Bool)

(declare-fun lt!144499 () (_ BitVec 64))

(assert (=> b!291958 (= c!47010 (= lt!144499 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!184731 () SeekEntryResult!2105)

(assert (=> b!291958 (= e!184731 e!184733)))

(declare-fun b!291959 () Bool)

(declare-fun e!184732 () SeekEntryResult!2105)

(assert (=> b!291959 (= e!184732 Undefined!2105)))

(declare-fun b!291960 () Bool)

(assert (=> b!291960 (= e!184731 (Found!2105 (index!10592 lt!144500)))))

(declare-fun d!66509 () Bool)

(declare-fun lt!144501 () SeekEntryResult!2105)

(assert (=> d!66509 (and (or ((_ is Undefined!2105) lt!144501) (not ((_ is Found!2105) lt!144501)) (and (bvsge (index!10591 lt!144501) #b00000000000000000000000000000000) (bvslt (index!10591 lt!144501) (size!7343 a!3312)))) (or ((_ is Undefined!2105) lt!144501) ((_ is Found!2105) lt!144501) (not ((_ is MissingZero!2105) lt!144501)) (and (bvsge (index!10590 lt!144501) #b00000000000000000000000000000000) (bvslt (index!10590 lt!144501) (size!7343 a!3312)))) (or ((_ is Undefined!2105) lt!144501) ((_ is Found!2105) lt!144501) ((_ is MissingZero!2105) lt!144501) (not ((_ is MissingVacant!2105) lt!144501)) (and (bvsge (index!10593 lt!144501) #b00000000000000000000000000000000) (bvslt (index!10593 lt!144501) (size!7343 a!3312)))) (or ((_ is Undefined!2105) lt!144501) (ite ((_ is Found!2105) lt!144501) (= (select (arr!6991 a!3312) (index!10591 lt!144501)) k0!2524) (ite ((_ is MissingZero!2105) lt!144501) (= (select (arr!6991 a!3312) (index!10590 lt!144501)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!2105) lt!144501) (= (select (arr!6991 a!3312) (index!10593 lt!144501)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!66509 (= lt!144501 e!184732)))

(declare-fun c!47009 () Bool)

(assert (=> d!66509 (= c!47009 (and ((_ is Intermediate!2105) lt!144500) (undefined!2917 lt!144500)))))

(assert (=> d!66509 (= lt!144500 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2524 mask!3809) k0!2524 a!3312 mask!3809))))

(assert (=> d!66509 (validMask!0 mask!3809)))

(assert (=> d!66509 (= (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809) lt!144501)))

(declare-fun b!291961 () Bool)

(assert (=> b!291961 (= e!184732 e!184731)))

(assert (=> b!291961 (= lt!144499 (select (arr!6991 a!3312) (index!10592 lt!144500)))))

(declare-fun c!47011 () Bool)

(assert (=> b!291961 (= c!47011 (= lt!144499 k0!2524))))

(assert (= (and d!66509 c!47009) b!291959))

(assert (= (and d!66509 (not c!47009)) b!291961))

(assert (= (and b!291961 c!47011) b!291960))

(assert (= (and b!291961 (not c!47011)) b!291958))

(assert (= (and b!291958 c!47010) b!291956))

(assert (= (and b!291958 (not c!47010)) b!291957))

(declare-fun m!305895 () Bool)

(assert (=> b!291957 m!305895))

(declare-fun m!305897 () Bool)

(assert (=> d!66509 m!305897))

(assert (=> d!66509 m!305795))

(declare-fun m!305899 () Bool)

(assert (=> d!66509 m!305899))

(assert (=> d!66509 m!305791))

(declare-fun m!305901 () Bool)

(assert (=> d!66509 m!305901))

(assert (=> d!66509 m!305791))

(declare-fun m!305903 () Bool)

(assert (=> d!66509 m!305903))

(declare-fun m!305905 () Bool)

(assert (=> b!291961 m!305905))

(assert (=> b!291799 d!66509))

(check-sat (not b!291957) (not b!291910) (not bm!25642) (not d!66479) (not b!291868) (not b!291925) (not b!291911) (not b!291877) (not d!66481) (not d!66509))
(check-sat)
