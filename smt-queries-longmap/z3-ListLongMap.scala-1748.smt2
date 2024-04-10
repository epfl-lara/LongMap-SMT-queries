; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32010 () Bool)

(assert start!32010)

(declare-fun b!319626 () Bool)

(declare-fun res!174015 () Bool)

(declare-fun e!198478 () Bool)

(assert (=> b!319626 (=> (not res!174015) (not e!198478))))

(declare-datatypes ((array!16317 0))(
  ( (array!16318 (arr!7722 (Array (_ BitVec 32) (_ BitVec 64))) (size!8074 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16317)

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16317 (_ BitVec 32)) Bool)

(assert (=> b!319626 (= res!174015 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!319627 () Bool)

(declare-fun res!174013 () Bool)

(assert (=> b!319627 (=> (not res!174013) (not e!198478))))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!319627 (= res!174013 (and (= (size!8074 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8074 a!3305))))))

(declare-fun res!174010 () Bool)

(assert (=> start!32010 (=> (not res!174010) (not e!198478))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32010 (= res!174010 (validMask!0 mask!3777))))

(assert (=> start!32010 e!198478))

(assert (=> start!32010 true))

(declare-fun array_inv!5685 (array!16317) Bool)

(assert (=> start!32010 (array_inv!5685 a!3305)))

(declare-fun b!319628 () Bool)

(assert (=> b!319628 (= e!198478 (and (bvsge mask!3777 #b00000000000000000000000000000000) (bvsgt mask!3777 #b00111111111111111111111111111111)))))

(declare-fun b!319629 () Bool)

(declare-fun res!174011 () Bool)

(assert (=> b!319629 (=> (not res!174011) (not e!198478))))

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!319629 (= res!174011 (validKeyInArray!0 k0!2497))))

(declare-fun b!319630 () Bool)

(declare-fun res!174014 () Bool)

(assert (=> b!319630 (=> (not res!174014) (not e!198478))))

(declare-fun arrayContainsKey!0 (array!16317 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!319630 (= res!174014 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!319631 () Bool)

(declare-fun res!174012 () Bool)

(assert (=> b!319631 (=> (not res!174012) (not e!198478))))

(declare-datatypes ((SeekEntryResult!2853 0))(
  ( (MissingZero!2853 (index!13588 (_ BitVec 32))) (Found!2853 (index!13589 (_ BitVec 32))) (Intermediate!2853 (undefined!3665 Bool) (index!13590 (_ BitVec 32)) (x!31863 (_ BitVec 32))) (Undefined!2853) (MissingVacant!2853 (index!13591 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16317 (_ BitVec 32)) SeekEntryResult!2853)

(assert (=> b!319631 (= res!174012 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!2853 i!1250)))))

(assert (= (and start!32010 res!174010) b!319627))

(assert (= (and b!319627 res!174013) b!319629))

(assert (= (and b!319629 res!174011) b!319630))

(assert (= (and b!319630 res!174014) b!319631))

(assert (= (and b!319631 res!174012) b!319626))

(assert (= (and b!319626 res!174015) b!319628))

(declare-fun m!328175 () Bool)

(assert (=> start!32010 m!328175))

(declare-fun m!328177 () Bool)

(assert (=> start!32010 m!328177))

(declare-fun m!328179 () Bool)

(assert (=> b!319630 m!328179))

(declare-fun m!328181 () Bool)

(assert (=> b!319629 m!328181))

(declare-fun m!328183 () Bool)

(assert (=> b!319631 m!328183))

(declare-fun m!328185 () Bool)

(assert (=> b!319626 m!328185))

(check-sat (not start!32010) (not b!319626) (not b!319631) (not b!319629) (not b!319630))
(check-sat)
(get-model)

(declare-fun b!319680 () Bool)

(declare-fun e!198503 () SeekEntryResult!2853)

(declare-fun lt!155838 () SeekEntryResult!2853)

(assert (=> b!319680 (= e!198503 (MissingZero!2853 (index!13590 lt!155838)))))

(declare-fun b!319681 () Bool)

(declare-fun e!198502 () SeekEntryResult!2853)

(assert (=> b!319681 (= e!198502 Undefined!2853)))

(declare-fun d!69345 () Bool)

(declare-fun lt!155837 () SeekEntryResult!2853)

(get-info :version)

(assert (=> d!69345 (and (or ((_ is Undefined!2853) lt!155837) (not ((_ is Found!2853) lt!155837)) (and (bvsge (index!13589 lt!155837) #b00000000000000000000000000000000) (bvslt (index!13589 lt!155837) (size!8074 a!3305)))) (or ((_ is Undefined!2853) lt!155837) ((_ is Found!2853) lt!155837) (not ((_ is MissingZero!2853) lt!155837)) (and (bvsge (index!13588 lt!155837) #b00000000000000000000000000000000) (bvslt (index!13588 lt!155837) (size!8074 a!3305)))) (or ((_ is Undefined!2853) lt!155837) ((_ is Found!2853) lt!155837) ((_ is MissingZero!2853) lt!155837) (not ((_ is MissingVacant!2853) lt!155837)) (and (bvsge (index!13591 lt!155837) #b00000000000000000000000000000000) (bvslt (index!13591 lt!155837) (size!8074 a!3305)))) (or ((_ is Undefined!2853) lt!155837) (ite ((_ is Found!2853) lt!155837) (= (select (arr!7722 a!3305) (index!13589 lt!155837)) k0!2497) (ite ((_ is MissingZero!2853) lt!155837) (= (select (arr!7722 a!3305) (index!13588 lt!155837)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!2853) lt!155837) (= (select (arr!7722 a!3305) (index!13591 lt!155837)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!69345 (= lt!155837 e!198502)))

(declare-fun c!50443 () Bool)

(assert (=> d!69345 (= c!50443 (and ((_ is Intermediate!2853) lt!155838) (undefined!3665 lt!155838)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16317 (_ BitVec 32)) SeekEntryResult!2853)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!69345 (= lt!155838 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777))))

(assert (=> d!69345 (validMask!0 mask!3777)))

(assert (=> d!69345 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) lt!155837)))

(declare-fun b!319683 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16317 (_ BitVec 32)) SeekEntryResult!2853)

(assert (=> b!319683 (= e!198503 (seekKeyOrZeroReturnVacant!0 (x!31863 lt!155838) (index!13590 lt!155838) (index!13590 lt!155838) k0!2497 a!3305 mask!3777))))

(declare-fun b!319685 () Bool)

(declare-fun e!198504 () SeekEntryResult!2853)

(assert (=> b!319685 (= e!198504 (Found!2853 (index!13590 lt!155838)))))

(declare-fun b!319686 () Bool)

(declare-fun c!50442 () Bool)

(declare-fun lt!155836 () (_ BitVec 64))

(assert (=> b!319686 (= c!50442 (= lt!155836 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!319686 (= e!198504 e!198503)))

(declare-fun b!319687 () Bool)

(assert (=> b!319687 (= e!198502 e!198504)))

(assert (=> b!319687 (= lt!155836 (select (arr!7722 a!3305) (index!13590 lt!155838)))))

(declare-fun c!50444 () Bool)

(assert (=> b!319687 (= c!50444 (= lt!155836 k0!2497))))

(assert (= (and d!69345 c!50443) b!319681))

(assert (= (and d!69345 (not c!50443)) b!319687))

(assert (= (and b!319687 c!50444) b!319685))

(assert (= (and b!319687 (not c!50444)) b!319686))

(assert (= (and b!319686 c!50442) b!319680))

(assert (= (and b!319686 (not c!50442)) b!319683))

(assert (=> d!69345 m!328175))

(declare-fun m!328211 () Bool)

(assert (=> d!69345 m!328211))

(declare-fun m!328213 () Bool)

(assert (=> d!69345 m!328213))

(declare-fun m!328215 () Bool)

(assert (=> d!69345 m!328215))

(assert (=> d!69345 m!328213))

(declare-fun m!328217 () Bool)

(assert (=> d!69345 m!328217))

(declare-fun m!328219 () Bool)

(assert (=> d!69345 m!328219))

(declare-fun m!328221 () Bool)

(assert (=> b!319683 m!328221))

(declare-fun m!328223 () Bool)

(assert (=> b!319687 m!328223))

(assert (=> b!319631 d!69345))

(declare-fun d!69353 () Bool)

(declare-fun res!174044 () Bool)

(declare-fun e!198513 () Bool)

(assert (=> d!69353 (=> res!174044 e!198513)))

(assert (=> d!69353 (= res!174044 (= (select (arr!7722 a!3305) #b00000000000000000000000000000000) k0!2497))))

(assert (=> d!69353 (= (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000) e!198513)))

(declare-fun b!319696 () Bool)

(declare-fun e!198514 () Bool)

(assert (=> b!319696 (= e!198513 e!198514)))

(declare-fun res!174045 () Bool)

(assert (=> b!319696 (=> (not res!174045) (not e!198514))))

(assert (=> b!319696 (= res!174045 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!8074 a!3305)))))

(declare-fun b!319697 () Bool)

(assert (=> b!319697 (= e!198514 (arrayContainsKey!0 a!3305 k0!2497 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!69353 (not res!174044)) b!319696))

(assert (= (and b!319696 res!174045) b!319697))

(declare-fun m!328225 () Bool)

(assert (=> d!69353 m!328225))

(declare-fun m!328227 () Bool)

(assert (=> b!319697 m!328227))

(assert (=> b!319630 d!69353))

(declare-fun d!69355 () Bool)

(assert (=> d!69355 (= (validMask!0 mask!3777) (and (or (= mask!3777 #b00000000000000000000000000000111) (= mask!3777 #b00000000000000000000000000001111) (= mask!3777 #b00000000000000000000000000011111) (= mask!3777 #b00000000000000000000000000111111) (= mask!3777 #b00000000000000000000000001111111) (= mask!3777 #b00000000000000000000000011111111) (= mask!3777 #b00000000000000000000000111111111) (= mask!3777 #b00000000000000000000001111111111) (= mask!3777 #b00000000000000000000011111111111) (= mask!3777 #b00000000000000000000111111111111) (= mask!3777 #b00000000000000000001111111111111) (= mask!3777 #b00000000000000000011111111111111) (= mask!3777 #b00000000000000000111111111111111) (= mask!3777 #b00000000000000001111111111111111) (= mask!3777 #b00000000000000011111111111111111) (= mask!3777 #b00000000000000111111111111111111) (= mask!3777 #b00000000000001111111111111111111) (= mask!3777 #b00000000000011111111111111111111) (= mask!3777 #b00000000000111111111111111111111) (= mask!3777 #b00000000001111111111111111111111) (= mask!3777 #b00000000011111111111111111111111) (= mask!3777 #b00000000111111111111111111111111) (= mask!3777 #b00000001111111111111111111111111) (= mask!3777 #b00000011111111111111111111111111) (= mask!3777 #b00000111111111111111111111111111) (= mask!3777 #b00001111111111111111111111111111) (= mask!3777 #b00011111111111111111111111111111) (= mask!3777 #b00111111111111111111111111111111)) (bvsle mask!3777 #b00111111111111111111111111111111)))))

(assert (=> start!32010 d!69355))

(declare-fun d!69369 () Bool)

(assert (=> d!69369 (= (array_inv!5685 a!3305) (bvsge (size!8074 a!3305) #b00000000000000000000000000000000))))

(assert (=> start!32010 d!69369))

(declare-fun b!319718 () Bool)

(declare-fun e!198530 () Bool)

(declare-fun call!26041 () Bool)

(assert (=> b!319718 (= e!198530 call!26041)))

(declare-fun b!319719 () Bool)

(declare-fun e!198531 () Bool)

(assert (=> b!319719 (= e!198530 e!198531)))

(declare-fun lt!155850 () (_ BitVec 64))

(assert (=> b!319719 (= lt!155850 (select (arr!7722 a!3305) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9814 0))(
  ( (Unit!9815) )
))
(declare-fun lt!155848 () Unit!9814)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!16317 (_ BitVec 64) (_ BitVec 32)) Unit!9814)

(assert (=> b!319719 (= lt!155848 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3305 lt!155850 #b00000000000000000000000000000000))))

(assert (=> b!319719 (arrayContainsKey!0 a!3305 lt!155850 #b00000000000000000000000000000000)))

(declare-fun lt!155849 () Unit!9814)

(assert (=> b!319719 (= lt!155849 lt!155848)))

(declare-fun res!174057 () Bool)

(assert (=> b!319719 (= res!174057 (= (seekEntryOrOpen!0 (select (arr!7722 a!3305) #b00000000000000000000000000000000) a!3305 mask!3777) (Found!2853 #b00000000000000000000000000000000)))))

(assert (=> b!319719 (=> (not res!174057) (not e!198531))))

(declare-fun b!319720 () Bool)

(assert (=> b!319720 (= e!198531 call!26041)))

(declare-fun b!319721 () Bool)

(declare-fun e!198532 () Bool)

(assert (=> b!319721 (= e!198532 e!198530)))

(declare-fun c!50454 () Bool)

(assert (=> b!319721 (= c!50454 (validKeyInArray!0 (select (arr!7722 a!3305) #b00000000000000000000000000000000)))))

(declare-fun d!69371 () Bool)

(declare-fun res!174056 () Bool)

(assert (=> d!69371 (=> res!174056 e!198532)))

(assert (=> d!69371 (= res!174056 (bvsge #b00000000000000000000000000000000 (size!8074 a!3305)))))

(assert (=> d!69371 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777) e!198532)))

(declare-fun bm!26038 () Bool)

(assert (=> bm!26038 (= call!26041 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3305 mask!3777))))

(assert (= (and d!69371 (not res!174056)) b!319721))

(assert (= (and b!319721 c!50454) b!319719))

(assert (= (and b!319721 (not c!50454)) b!319718))

(assert (= (and b!319719 res!174057) b!319720))

(assert (= (or b!319720 b!319718) bm!26038))

(assert (=> b!319719 m!328225))

(declare-fun m!328245 () Bool)

(assert (=> b!319719 m!328245))

(declare-fun m!328247 () Bool)

(assert (=> b!319719 m!328247))

(assert (=> b!319719 m!328225))

(declare-fun m!328249 () Bool)

(assert (=> b!319719 m!328249))

(assert (=> b!319721 m!328225))

(assert (=> b!319721 m!328225))

(declare-fun m!328251 () Bool)

(assert (=> b!319721 m!328251))

(declare-fun m!328253 () Bool)

(assert (=> bm!26038 m!328253))

(assert (=> b!319626 d!69371))

(declare-fun d!69377 () Bool)

(assert (=> d!69377 (= (validKeyInArray!0 k0!2497) (and (not (= k0!2497 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2497 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!319629 d!69377))

(check-sat (not b!319721) (not b!319719) (not bm!26038) (not b!319683) (not b!319697) (not d!69345))
(check-sat)
