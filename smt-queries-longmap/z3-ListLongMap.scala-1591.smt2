; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30156 () Bool)

(assert start!30156)

(declare-fun b!301857 () Bool)

(declare-fun res!159613 () Bool)

(declare-fun e!190336 () Bool)

(assert (=> b!301857 (=> (not res!159613) (not e!190336))))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!301857 (= res!159613 (validKeyInArray!0 k0!2441))))

(declare-datatypes ((array!15311 0))(
  ( (array!15312 (arr!7245 (Array (_ BitVec 32) (_ BitVec 64))) (size!7598 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15311)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun b!301858 () Bool)

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!301858 (= e!190336 (and (= (select (arr!7245 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7598 a!3293)) (bvsge mask!3709 #b00000000000000000000000000000000) (bvslt index!1781 (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsgt x!1427 #b01111111111111111111111111111110)))))

(declare-fun b!301859 () Bool)

(declare-fun res!159618 () Bool)

(assert (=> b!301859 (=> (not res!159618) (not e!190336))))

(declare-datatypes ((SeekEntryResult!2384 0))(
  ( (MissingZero!2384 (index!11712 (_ BitVec 32))) (Found!2384 (index!11713 (_ BitVec 32))) (Intermediate!2384 (undefined!3196 Bool) (index!11714 (_ BitVec 32)) (x!29998 (_ BitVec 32))) (Undefined!2384) (MissingVacant!2384 (index!11715 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15311 (_ BitVec 32)) SeekEntryResult!2384)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!301859 (= res!159618 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) (Intermediate!2384 false resIndex!52 resX!52)))))

(declare-fun b!301860 () Bool)

(declare-fun res!159617 () Bool)

(assert (=> b!301860 (=> (not res!159617) (not e!190336))))

(assert (=> b!301860 (= res!159617 (and (= (size!7598 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7598 a!3293))))))

(declare-fun b!301861 () Bool)

(declare-fun res!159616 () Bool)

(assert (=> b!301861 (=> (not res!159616) (not e!190336))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15311 (_ BitVec 32)) Bool)

(assert (=> b!301861 (= res!159616 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!301862 () Bool)

(declare-fun res!159614 () Bool)

(assert (=> b!301862 (=> (not res!159614) (not e!190336))))

(declare-fun arrayContainsKey!0 (array!15311 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!301862 (= res!159614 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun res!159612 () Bool)

(assert (=> start!30156 (=> (not res!159612) (not e!190336))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30156 (= res!159612 (validMask!0 mask!3709))))

(assert (=> start!30156 e!190336))

(declare-fun array_inv!5217 (array!15311) Bool)

(assert (=> start!30156 (array_inv!5217 a!3293)))

(assert (=> start!30156 true))

(declare-fun b!301863 () Bool)

(declare-fun res!159615 () Bool)

(assert (=> b!301863 (=> (not res!159615) (not e!190336))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15311 (_ BitVec 32)) SeekEntryResult!2384)

(assert (=> b!301863 (= res!159615 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2384 i!1240)))))

(assert (= (and start!30156 res!159612) b!301860))

(assert (= (and b!301860 res!159617) b!301857))

(assert (= (and b!301857 res!159613) b!301862))

(assert (= (and b!301862 res!159614) b!301863))

(assert (= (and b!301863 res!159615) b!301861))

(assert (= (and b!301861 res!159616) b!301859))

(assert (= (and b!301859 res!159618) b!301858))

(declare-fun m!313039 () Bool)

(assert (=> b!301862 m!313039))

(declare-fun m!313041 () Bool)

(assert (=> b!301859 m!313041))

(assert (=> b!301859 m!313041))

(declare-fun m!313043 () Bool)

(assert (=> b!301859 m!313043))

(declare-fun m!313045 () Bool)

(assert (=> b!301863 m!313045))

(declare-fun m!313047 () Bool)

(assert (=> start!30156 m!313047))

(declare-fun m!313049 () Bool)

(assert (=> start!30156 m!313049))

(declare-fun m!313051 () Bool)

(assert (=> b!301861 m!313051))

(declare-fun m!313053 () Bool)

(assert (=> b!301858 m!313053))

(declare-fun m!313055 () Bool)

(assert (=> b!301857 m!313055))

(check-sat (not b!301859) (not b!301861) (not b!301863) (not start!30156) (not b!301857) (not b!301862))
(check-sat)
(get-model)

(declare-fun b!301936 () Bool)

(declare-fun e!190371 () Bool)

(declare-fun e!190372 () Bool)

(assert (=> b!301936 (= e!190371 e!190372)))

(declare-fun res!159673 () Bool)

(declare-fun lt!149767 () SeekEntryResult!2384)

(get-info :version)

(assert (=> b!301936 (= res!159673 (and ((_ is Intermediate!2384) lt!149767) (not (undefined!3196 lt!149767)) (bvslt (x!29998 lt!149767) #b01111111111111111111111111111110) (bvsge (x!29998 lt!149767) #b00000000000000000000000000000000) (bvsge (x!29998 lt!149767) #b00000000000000000000000000000000)))))

(assert (=> b!301936 (=> (not res!159673) (not e!190372))))

(declare-fun b!301937 () Bool)

(assert (=> b!301937 (and (bvsge (index!11714 lt!149767) #b00000000000000000000000000000000) (bvslt (index!11714 lt!149767) (size!7598 a!3293)))))

(declare-fun res!159675 () Bool)

(assert (=> b!301937 (= res!159675 (= (select (arr!7245 a!3293) (index!11714 lt!149767)) k0!2441))))

(declare-fun e!190370 () Bool)

(assert (=> b!301937 (=> res!159675 e!190370)))

(assert (=> b!301937 (= e!190372 e!190370)))

(declare-fun d!67755 () Bool)

(assert (=> d!67755 e!190371))

(declare-fun c!48730 () Bool)

(assert (=> d!67755 (= c!48730 (and ((_ is Intermediate!2384) lt!149767) (undefined!3196 lt!149767)))))

(declare-fun e!190369 () SeekEntryResult!2384)

(assert (=> d!67755 (= lt!149767 e!190369)))

(declare-fun c!48731 () Bool)

(assert (=> d!67755 (= c!48731 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!149768 () (_ BitVec 64))

(assert (=> d!67755 (= lt!149768 (select (arr!7245 a!3293) (toIndex!0 k0!2441 mask!3709)))))

(assert (=> d!67755 (validMask!0 mask!3709)))

(assert (=> d!67755 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!149767)))

(declare-fun b!301938 () Bool)

(assert (=> b!301938 (and (bvsge (index!11714 lt!149767) #b00000000000000000000000000000000) (bvslt (index!11714 lt!149767) (size!7598 a!3293)))))

(assert (=> b!301938 (= e!190370 (= (select (arr!7245 a!3293) (index!11714 lt!149767)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!301939 () Bool)

(assert (=> b!301939 (= e!190369 (Intermediate!2384 true (toIndex!0 k0!2441 mask!3709) #b00000000000000000000000000000000))))

(declare-fun b!301940 () Bool)

(declare-fun e!190373 () SeekEntryResult!2384)

(assert (=> b!301940 (= e!190373 (Intermediate!2384 false (toIndex!0 k0!2441 mask!3709) #b00000000000000000000000000000000))))

(declare-fun b!301941 () Bool)

(assert (=> b!301941 (and (bvsge (index!11714 lt!149767) #b00000000000000000000000000000000) (bvslt (index!11714 lt!149767) (size!7598 a!3293)))))

(declare-fun res!159674 () Bool)

(assert (=> b!301941 (= res!159674 (= (select (arr!7245 a!3293) (index!11714 lt!149767)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!301941 (=> res!159674 e!190370)))

(declare-fun b!301942 () Bool)

(assert (=> b!301942 (= e!190369 e!190373)))

(declare-fun c!48729 () Bool)

(assert (=> b!301942 (= c!48729 (or (= lt!149768 k0!2441) (= (bvadd lt!149768 lt!149768) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!301943 () Bool)

(assert (=> b!301943 (= e!190371 (bvsge (x!29998 lt!149767) #b01111111111111111111111111111110))))

(declare-fun b!301944 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!301944 (= e!190373 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!2441 mask!3709) #b00000000000000000000000000000000 mask!3709) k0!2441 a!3293 mask!3709))))

(assert (= (and d!67755 c!48731) b!301939))

(assert (= (and d!67755 (not c!48731)) b!301942))

(assert (= (and b!301942 c!48729) b!301940))

(assert (= (and b!301942 (not c!48729)) b!301944))

(assert (= (and d!67755 c!48730) b!301943))

(assert (= (and d!67755 (not c!48730)) b!301936))

(assert (= (and b!301936 res!159673) b!301937))

(assert (= (and b!301937 (not res!159675)) b!301941))

(assert (= (and b!301941 (not res!159674)) b!301938))

(declare-fun m!313105 () Bool)

(assert (=> b!301941 m!313105))

(assert (=> b!301944 m!313041))

(declare-fun m!313107 () Bool)

(assert (=> b!301944 m!313107))

(assert (=> b!301944 m!313107))

(declare-fun m!313109 () Bool)

(assert (=> b!301944 m!313109))

(assert (=> b!301938 m!313105))

(assert (=> d!67755 m!313041))

(declare-fun m!313111 () Bool)

(assert (=> d!67755 m!313111))

(assert (=> d!67755 m!313047))

(assert (=> b!301937 m!313105))

(assert (=> b!301859 d!67755))

(declare-fun d!67763 () Bool)

(declare-fun lt!149778 () (_ BitVec 32))

(declare-fun lt!149777 () (_ BitVec 32))

(assert (=> d!67763 (= lt!149778 (bvmul (bvxor lt!149777 (bvlshr lt!149777 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!67763 (= lt!149777 ((_ extract 31 0) (bvand (bvxor k0!2441 (bvlshr k0!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!67763 (and (bvsge mask!3709 #b00000000000000000000000000000000) (let ((res!159676 (let ((h!5299 ((_ extract 31 0) (bvand (bvxor k0!2441 (bvlshr k0!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!30002 (bvmul (bvxor h!5299 (bvlshr h!5299 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!30002 (bvlshr x!30002 #b00000000000000000000000000001101)) mask!3709))))) (and (bvslt res!159676 (bvadd mask!3709 #b00000000000000000000000000000001)) (bvsge res!159676 #b00000000000000000000000000000000))))))

(assert (=> d!67763 (= (toIndex!0 k0!2441 mask!3709) (bvand (bvxor lt!149778 (bvlshr lt!149778 #b00000000000000000000000000001101)) mask!3709))))

(assert (=> b!301859 d!67763))

(declare-fun b!301980 () Bool)

(declare-fun e!190396 () Bool)

(declare-fun e!190395 () Bool)

(assert (=> b!301980 (= e!190396 e!190395)))

(declare-fun c!48743 () Bool)

(assert (=> b!301980 (= c!48743 (validKeyInArray!0 (select (arr!7245 a!3293) #b00000000000000000000000000000000)))))

(declare-fun bm!25859 () Bool)

(declare-fun call!25862 () Bool)

(assert (=> bm!25859 (= call!25862 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3293 mask!3709))))

(declare-fun b!301981 () Bool)

(declare-fun e!190397 () Bool)

(assert (=> b!301981 (= e!190395 e!190397)))

(declare-fun lt!149797 () (_ BitVec 64))

(assert (=> b!301981 (= lt!149797 (select (arr!7245 a!3293) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9345 0))(
  ( (Unit!9346) )
))
(declare-fun lt!149799 () Unit!9345)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!15311 (_ BitVec 64) (_ BitVec 32)) Unit!9345)

(assert (=> b!301981 (= lt!149799 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3293 lt!149797 #b00000000000000000000000000000000))))

(assert (=> b!301981 (arrayContainsKey!0 a!3293 lt!149797 #b00000000000000000000000000000000)))

(declare-fun lt!149798 () Unit!9345)

(assert (=> b!301981 (= lt!149798 lt!149799)))

(declare-fun res!159691 () Bool)

(assert (=> b!301981 (= res!159691 (= (seekEntryOrOpen!0 (select (arr!7245 a!3293) #b00000000000000000000000000000000) a!3293 mask!3709) (Found!2384 #b00000000000000000000000000000000)))))

(assert (=> b!301981 (=> (not res!159691) (not e!190397))))

(declare-fun b!301982 () Bool)

(assert (=> b!301982 (= e!190397 call!25862)))

(declare-fun b!301983 () Bool)

(assert (=> b!301983 (= e!190395 call!25862)))

(declare-fun d!67765 () Bool)

(declare-fun res!159692 () Bool)

(assert (=> d!67765 (=> res!159692 e!190396)))

(assert (=> d!67765 (= res!159692 (bvsge #b00000000000000000000000000000000 (size!7598 a!3293)))))

(assert (=> d!67765 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709) e!190396)))

(assert (= (and d!67765 (not res!159692)) b!301980))

(assert (= (and b!301980 c!48743) b!301981))

(assert (= (and b!301980 (not c!48743)) b!301983))

(assert (= (and b!301981 res!159691) b!301982))

(assert (= (or b!301982 b!301983) bm!25859))

(declare-fun m!313121 () Bool)

(assert (=> b!301980 m!313121))

(assert (=> b!301980 m!313121))

(declare-fun m!313123 () Bool)

(assert (=> b!301980 m!313123))

(declare-fun m!313125 () Bool)

(assert (=> bm!25859 m!313125))

(assert (=> b!301981 m!313121))

(declare-fun m!313127 () Bool)

(assert (=> b!301981 m!313127))

(declare-fun m!313129 () Bool)

(assert (=> b!301981 m!313129))

(assert (=> b!301981 m!313121))

(declare-fun m!313131 () Bool)

(assert (=> b!301981 m!313131))

(assert (=> b!301861 d!67765))

(declare-fun d!67771 () Bool)

(declare-fun res!159703 () Bool)

(declare-fun e!190412 () Bool)

(assert (=> d!67771 (=> res!159703 e!190412)))

(assert (=> d!67771 (= res!159703 (= (select (arr!7245 a!3293) #b00000000000000000000000000000000) k0!2441))))

(assert (=> d!67771 (= (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000) e!190412)))

(declare-fun b!302006 () Bool)

(declare-fun e!190413 () Bool)

(assert (=> b!302006 (= e!190412 e!190413)))

(declare-fun res!159704 () Bool)

(assert (=> b!302006 (=> (not res!159704) (not e!190413))))

(assert (=> b!302006 (= res!159704 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7598 a!3293)))))

(declare-fun b!302007 () Bool)

(assert (=> b!302007 (= e!190413 (arrayContainsKey!0 a!3293 k0!2441 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!67771 (not res!159703)) b!302006))

(assert (= (and b!302006 res!159704) b!302007))

(assert (=> d!67771 m!313121))

(declare-fun m!313133 () Bool)

(assert (=> b!302007 m!313133))

(assert (=> b!301862 d!67771))

(declare-fun d!67773 () Bool)

(assert (=> d!67773 (= (validKeyInArray!0 k0!2441) (and (not (= k0!2441 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2441 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!301857 d!67773))

(declare-fun b!302041 () Bool)

(declare-fun e!190436 () SeekEntryResult!2384)

(declare-fun e!190435 () SeekEntryResult!2384)

(assert (=> b!302041 (= e!190436 e!190435)))

(declare-fun lt!149823 () (_ BitVec 64))

(declare-fun lt!149824 () SeekEntryResult!2384)

(assert (=> b!302041 (= lt!149823 (select (arr!7245 a!3293) (index!11714 lt!149824)))))

(declare-fun c!48764 () Bool)

(assert (=> b!302041 (= c!48764 (= lt!149823 k0!2441))))

(declare-fun b!302042 () Bool)

(declare-fun e!190434 () SeekEntryResult!2384)

(assert (=> b!302042 (= e!190434 (MissingZero!2384 (index!11714 lt!149824)))))

(declare-fun d!67775 () Bool)

(declare-fun lt!149825 () SeekEntryResult!2384)

(assert (=> d!67775 (and (or ((_ is Undefined!2384) lt!149825) (not ((_ is Found!2384) lt!149825)) (and (bvsge (index!11713 lt!149825) #b00000000000000000000000000000000) (bvslt (index!11713 lt!149825) (size!7598 a!3293)))) (or ((_ is Undefined!2384) lt!149825) ((_ is Found!2384) lt!149825) (not ((_ is MissingZero!2384) lt!149825)) (and (bvsge (index!11712 lt!149825) #b00000000000000000000000000000000) (bvslt (index!11712 lt!149825) (size!7598 a!3293)))) (or ((_ is Undefined!2384) lt!149825) ((_ is Found!2384) lt!149825) ((_ is MissingZero!2384) lt!149825) (not ((_ is MissingVacant!2384) lt!149825)) (and (bvsge (index!11715 lt!149825) #b00000000000000000000000000000000) (bvslt (index!11715 lt!149825) (size!7598 a!3293)))) (or ((_ is Undefined!2384) lt!149825) (ite ((_ is Found!2384) lt!149825) (= (select (arr!7245 a!3293) (index!11713 lt!149825)) k0!2441) (ite ((_ is MissingZero!2384) lt!149825) (= (select (arr!7245 a!3293) (index!11712 lt!149825)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!2384) lt!149825) (= (select (arr!7245 a!3293) (index!11715 lt!149825)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!67775 (= lt!149825 e!190436)))

(declare-fun c!48763 () Bool)

(assert (=> d!67775 (= c!48763 (and ((_ is Intermediate!2384) lt!149824) (undefined!3196 lt!149824)))))

(assert (=> d!67775 (= lt!149824 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709))))

(assert (=> d!67775 (validMask!0 mask!3709)))

(assert (=> d!67775 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) lt!149825)))

(declare-fun b!302043 () Bool)

(assert (=> b!302043 (= e!190436 Undefined!2384)))

(declare-fun b!302044 () Bool)

(declare-fun c!48762 () Bool)

(assert (=> b!302044 (= c!48762 (= lt!149823 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!302044 (= e!190435 e!190434)))

(declare-fun b!302045 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15311 (_ BitVec 32)) SeekEntryResult!2384)

(assert (=> b!302045 (= e!190434 (seekKeyOrZeroReturnVacant!0 (x!29998 lt!149824) (index!11714 lt!149824) (index!11714 lt!149824) k0!2441 a!3293 mask!3709))))

(declare-fun b!302046 () Bool)

(assert (=> b!302046 (= e!190435 (Found!2384 (index!11714 lt!149824)))))

(assert (= (and d!67775 c!48763) b!302043))

(assert (= (and d!67775 (not c!48763)) b!302041))

(assert (= (and b!302041 c!48764) b!302046))

(assert (= (and b!302041 (not c!48764)) b!302044))

(assert (= (and b!302044 c!48762) b!302042))

(assert (= (and b!302044 (not c!48762)) b!302045))

(declare-fun m!313155 () Bool)

(assert (=> b!302041 m!313155))

(assert (=> d!67775 m!313041))

(assert (=> d!67775 m!313043))

(declare-fun m!313157 () Bool)

(assert (=> d!67775 m!313157))

(declare-fun m!313159 () Bool)

(assert (=> d!67775 m!313159))

(assert (=> d!67775 m!313047))

(assert (=> d!67775 m!313041))

(declare-fun m!313161 () Bool)

(assert (=> d!67775 m!313161))

(declare-fun m!313163 () Bool)

(assert (=> b!302045 m!313163))

(assert (=> b!301863 d!67775))

(declare-fun d!67789 () Bool)

(assert (=> d!67789 (= (validMask!0 mask!3709) (and (or (= mask!3709 #b00000000000000000000000000000111) (= mask!3709 #b00000000000000000000000000001111) (= mask!3709 #b00000000000000000000000000011111) (= mask!3709 #b00000000000000000000000000111111) (= mask!3709 #b00000000000000000000000001111111) (= mask!3709 #b00000000000000000000000011111111) (= mask!3709 #b00000000000000000000000111111111) (= mask!3709 #b00000000000000000000001111111111) (= mask!3709 #b00000000000000000000011111111111) (= mask!3709 #b00000000000000000000111111111111) (= mask!3709 #b00000000000000000001111111111111) (= mask!3709 #b00000000000000000011111111111111) (= mask!3709 #b00000000000000000111111111111111) (= mask!3709 #b00000000000000001111111111111111) (= mask!3709 #b00000000000000011111111111111111) (= mask!3709 #b00000000000000111111111111111111) (= mask!3709 #b00000000000001111111111111111111) (= mask!3709 #b00000000000011111111111111111111) (= mask!3709 #b00000000000111111111111111111111) (= mask!3709 #b00000000001111111111111111111111) (= mask!3709 #b00000000011111111111111111111111) (= mask!3709 #b00000000111111111111111111111111) (= mask!3709 #b00000001111111111111111111111111) (= mask!3709 #b00000011111111111111111111111111) (= mask!3709 #b00000111111111111111111111111111) (= mask!3709 #b00001111111111111111111111111111) (= mask!3709 #b00011111111111111111111111111111) (= mask!3709 #b00111111111111111111111111111111)) (bvsle mask!3709 #b00111111111111111111111111111111)))))

(assert (=> start!30156 d!67789))

(declare-fun d!67795 () Bool)

(assert (=> d!67795 (= (array_inv!5217 a!3293) (bvsge (size!7598 a!3293) #b00000000000000000000000000000000))))

(assert (=> start!30156 d!67795))

(check-sat (not b!301980) (not b!301944) (not b!302007) (not bm!25859) (not b!302045) (not d!67775) (not d!67755) (not b!301981))
(check-sat)
