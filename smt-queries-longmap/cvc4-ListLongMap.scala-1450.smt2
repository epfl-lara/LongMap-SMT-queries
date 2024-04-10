; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27946 () Bool)

(assert start!27946)

(declare-fun b!287025 () Bool)

(declare-fun res!149039 () Bool)

(declare-fun e!181816 () Bool)

(assert (=> b!287025 (=> (not res!149039) (not e!181816))))

(declare-datatypes ((array!14395 0))(
  ( (array!14396 (arr!6829 (Array (_ BitVec 32) (_ BitVec 64))) (size!7181 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14395)

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14395 (_ BitVec 32)) Bool)

(assert (=> b!287025 (= res!149039 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!287026 () Bool)

(assert (=> b!287026 (= e!181816 (and (bvsge mask!3809 #b00000000000000000000000000000000) (bvsgt mask!3809 #b00111111111111111111111111111111)))))

(declare-datatypes ((SeekEntryResult!1978 0))(
  ( (MissingZero!1978 (index!10082 (_ BitVec 32))) (Found!1978 (index!10083 (_ BitVec 32))) (Intermediate!1978 (undefined!2790 Bool) (index!10084 (_ BitVec 32)) (x!28293 (_ BitVec 32))) (Undefined!1978) (MissingVacant!1978 (index!10085 (_ BitVec 32))) )
))
(declare-fun lt!141336 () SeekEntryResult!1978)

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14395 (_ BitVec 32)) SeekEntryResult!1978)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!287026 (= lt!141336 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2524 mask!3809) k!2524 a!3312 mask!3809))))

(declare-fun b!287027 () Bool)

(declare-fun res!149037 () Bool)

(declare-fun e!181815 () Bool)

(assert (=> b!287027 (=> (not res!149037) (not e!181815))))

(declare-fun arrayContainsKey!0 (array!14395 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!287027 (= res!149037 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun res!149035 () Bool)

(assert (=> start!27946 (=> (not res!149035) (not e!181815))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27946 (= res!149035 (validMask!0 mask!3809))))

(assert (=> start!27946 e!181815))

(assert (=> start!27946 true))

(declare-fun array_inv!4792 (array!14395) Bool)

(assert (=> start!27946 (array_inv!4792 a!3312)))

(declare-fun b!287028 () Bool)

(declare-fun res!149038 () Bool)

(assert (=> b!287028 (=> (not res!149038) (not e!181815))))

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!287028 (= res!149038 (and (= (size!7181 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7181 a!3312))))))

(declare-fun b!287029 () Bool)

(assert (=> b!287029 (= e!181815 e!181816)))

(declare-fun res!149036 () Bool)

(assert (=> b!287029 (=> (not res!149036) (not e!181816))))

(declare-fun lt!141337 () SeekEntryResult!1978)

(assert (=> b!287029 (= res!149036 (or (= lt!141337 (MissingZero!1978 i!1256)) (= lt!141337 (MissingVacant!1978 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14395 (_ BitVec 32)) SeekEntryResult!1978)

(assert (=> b!287029 (= lt!141337 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!287030 () Bool)

(declare-fun res!149040 () Bool)

(assert (=> b!287030 (=> (not res!149040) (not e!181815))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!287030 (= res!149040 (validKeyInArray!0 k!2524))))

(assert (= (and start!27946 res!149035) b!287028))

(assert (= (and b!287028 res!149038) b!287030))

(assert (= (and b!287030 res!149040) b!287027))

(assert (= (and b!287027 res!149037) b!287029))

(assert (= (and b!287029 res!149036) b!287025))

(assert (= (and b!287025 res!149039) b!287026))

(declare-fun m!301571 () Bool)

(assert (=> b!287027 m!301571))

(declare-fun m!301573 () Bool)

(assert (=> b!287030 m!301573))

(declare-fun m!301575 () Bool)

(assert (=> b!287029 m!301575))

(declare-fun m!301577 () Bool)

(assert (=> start!27946 m!301577))

(declare-fun m!301579 () Bool)

(assert (=> start!27946 m!301579))

(declare-fun m!301581 () Bool)

(assert (=> b!287026 m!301581))

(assert (=> b!287026 m!301581))

(declare-fun m!301583 () Bool)

(assert (=> b!287026 m!301583))

(declare-fun m!301585 () Bool)

(assert (=> b!287025 m!301585))

(push 1)

(assert (not start!27946))

(assert (not b!287026))

(assert (not b!287027))

(assert (not b!287030))

(assert (not b!287029))

(assert (not b!287025))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!287094 () Bool)

(declare-fun e!181856 () Bool)

(declare-fun e!181852 () Bool)

(assert (=> b!287094 (= e!181856 e!181852)))

(declare-fun res!149058 () Bool)

(declare-fun lt!141363 () SeekEntryResult!1978)

(assert (=> b!287094 (= res!149058 (and (is-Intermediate!1978 lt!141363) (not (undefined!2790 lt!141363)) (bvslt (x!28293 lt!141363) #b01111111111111111111111111111110) (bvsge (x!28293 lt!141363) #b00000000000000000000000000000000) (bvsge (x!28293 lt!141363) #b00000000000000000000000000000000)))))

(assert (=> b!287094 (=> (not res!149058) (not e!181852))))

(declare-fun b!287095 () Bool)

(declare-fun e!181855 () SeekEntryResult!1978)

(declare-fun e!181853 () SeekEntryResult!1978)

(assert (=> b!287095 (= e!181855 e!181853)))

(declare-fun c!46577 () Bool)

(declare-fun lt!141364 () (_ BitVec 64))

(assert (=> b!287095 (= c!46577 (or (= lt!141364 k!2524) (= (bvadd lt!141364 lt!141364) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!287096 () Bool)

(assert (=> b!287096 (and (bvsge (index!10084 lt!141363) #b00000000000000000000000000000000) (bvslt (index!10084 lt!141363) (size!7181 a!3312)))))

(declare-fun e!181854 () Bool)

(assert (=> b!287096 (= e!181854 (= (select (arr!6829 a!3312) (index!10084 lt!141363)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!287097 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!287097 (= e!181853 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k!2524 mask!3809) #b00000000000000000000000000000000 mask!3809) k!2524 a!3312 mask!3809))))

(declare-fun d!66053 () Bool)

(assert (=> d!66053 e!181856))

(declare-fun c!46576 () Bool)

(assert (=> d!66053 (= c!46576 (and (is-Intermediate!1978 lt!141363) (undefined!2790 lt!141363)))))

(assert (=> d!66053 (= lt!141363 e!181855)))

(declare-fun c!46578 () Bool)

(assert (=> d!66053 (= c!46578 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!66053 (= lt!141364 (select (arr!6829 a!3312) (toIndex!0 k!2524 mask!3809)))))

(assert (=> d!66053 (validMask!0 mask!3809)))

(assert (=> d!66053 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2524 mask!3809) k!2524 a!3312 mask!3809) lt!141363)))

(declare-fun b!287098 () Bool)

(assert (=> b!287098 (and (bvsge (index!10084 lt!141363) #b00000000000000000000000000000000) (bvslt (index!10084 lt!141363) (size!7181 a!3312)))))

(declare-fun res!149057 () Bool)

(assert (=> b!287098 (= res!149057 (= (select (arr!6829 a!3312) (index!10084 lt!141363)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!287098 (=> res!149057 e!181854)))

(declare-fun b!287099 () Bool)

(assert (=> b!287099 (= e!181856 (bvsge (x!28293 lt!141363) #b01111111111111111111111111111110))))

(declare-fun b!287100 () Bool)

(assert (=> b!287100 (= e!181853 (Intermediate!1978 false (toIndex!0 k!2524 mask!3809) #b00000000000000000000000000000000))))

(declare-fun b!287101 () Bool)

(assert (=> b!287101 (= e!181855 (Intermediate!1978 true (toIndex!0 k!2524 mask!3809) #b00000000000000000000000000000000))))

(declare-fun b!287102 () Bool)

(assert (=> b!287102 (and (bvsge (index!10084 lt!141363) #b00000000000000000000000000000000) (bvslt (index!10084 lt!141363) (size!7181 a!3312)))))

(declare-fun res!149059 () Bool)

(assert (=> b!287102 (= res!149059 (= (select (arr!6829 a!3312) (index!10084 lt!141363)) k!2524))))

(assert (=> b!287102 (=> res!149059 e!181854)))

(assert (=> b!287102 (= e!181852 e!181854)))

(assert (= (and d!66053 c!46578) b!287101))

(assert (= (and d!66053 (not c!46578)) b!287095))

(assert (= (and b!287095 c!46577) b!287100))

(assert (= (and b!287095 (not c!46577)) b!287097))

(assert (= (and d!66053 c!46576) b!287099))

(assert (= (and d!66053 (not c!46576)) b!287094))

(assert (= (and b!287094 res!149058) b!287102))

(assert (= (and b!287102 (not res!149059)) b!287098))

(assert (= (and b!287098 (not res!149057)) b!287096))

(assert (=> b!287097 m!301581))

(declare-fun m!301605 () Bool)

(assert (=> b!287097 m!301605))

(assert (=> b!287097 m!301605))

(declare-fun m!301607 () Bool)

(assert (=> b!287097 m!301607))

(declare-fun m!301609 () Bool)

(assert (=> b!287098 m!301609))

(assert (=> b!287102 m!301609))

(assert (=> d!66053 m!301581))

(declare-fun m!301611 () Bool)

(assert (=> d!66053 m!301611))

(assert (=> d!66053 m!301577))

(assert (=> b!287096 m!301609))

(assert (=> b!287026 d!66053))

(declare-fun d!66061 () Bool)

(declare-fun lt!141370 () (_ BitVec 32))

(declare-fun lt!141369 () (_ BitVec 32))

(assert (=> d!66061 (= lt!141370 (bvmul (bvxor lt!141369 (bvlshr lt!141369 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!66061 (= lt!141369 ((_ extract 31 0) (bvand (bvxor k!2524 (bvlshr k!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!66061 (and (bvsge mask!3809 #b00000000000000000000000000000000) (let ((res!149060 (let ((h!5251 ((_ extract 31 0) (bvand (bvxor k!2524 (bvlshr k!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!28297 (bvmul (bvxor h!5251 (bvlshr h!5251 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!28297 (bvlshr x!28297 #b00000000000000000000000000001101)) mask!3809))))) (and (bvslt res!149060 (bvadd mask!3809 #b00000000000000000000000000000001)) (bvsge res!149060 #b00000000000000000000000000000000))))))

(assert (=> d!66061 (= (toIndex!0 k!2524 mask!3809) (bvand (bvxor lt!141370 (bvlshr lt!141370 #b00000000000000000000000000001101)) mask!3809))))

(assert (=> b!287026 d!66061))

(declare-fun d!66063 () Bool)

(assert (=> d!66063 (= (validMask!0 mask!3809) (and (or (= mask!3809 #b00000000000000000000000000000111) (= mask!3809 #b00000000000000000000000000001111) (= mask!3809 #b00000000000000000000000000011111) (= mask!3809 #b00000000000000000000000000111111) (= mask!3809 #b00000000000000000000000001111111) (= mask!3809 #b00000000000000000000000011111111) (= mask!3809 #b00000000000000000000000111111111) (= mask!3809 #b00000000000000000000001111111111) (= mask!3809 #b00000000000000000000011111111111) (= mask!3809 #b00000000000000000000111111111111) (= mask!3809 #b00000000000000000001111111111111) (= mask!3809 #b00000000000000000011111111111111) (= mask!3809 #b00000000000000000111111111111111) (= mask!3809 #b00000000000000001111111111111111) (= mask!3809 #b00000000000000011111111111111111) (= mask!3809 #b00000000000000111111111111111111) (= mask!3809 #b00000000000001111111111111111111) (= mask!3809 #b00000000000011111111111111111111) (= mask!3809 #b00000000000111111111111111111111) (= mask!3809 #b00000000001111111111111111111111) (= mask!3809 #b00000000011111111111111111111111) (= mask!3809 #b00000000111111111111111111111111) (= mask!3809 #b00000001111111111111111111111111) (= mask!3809 #b00000011111111111111111111111111) (= mask!3809 #b00000111111111111111111111111111) (= mask!3809 #b00001111111111111111111111111111) (= mask!3809 #b00011111111111111111111111111111) (= mask!3809 #b00111111111111111111111111111111)) (bvsle mask!3809 #b00111111111111111111111111111111)))))

(assert (=> start!27946 d!66063))

(declare-fun d!66071 () Bool)

(assert (=> d!66071 (= (array_inv!4792 a!3312) (bvsge (size!7181 a!3312) #b00000000000000000000000000000000))))

(assert (=> start!27946 d!66071))

(declare-fun d!66073 () Bool)

(declare-fun res!149071 () Bool)

(declare-fun e!181871 () Bool)

(assert (=> d!66073 (=> res!149071 e!181871)))

(assert (=> d!66073 (= res!149071 (= (select (arr!6829 a!3312) #b00000000000000000000000000000000) k!2524))))

(assert (=> d!66073 (= (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000) e!181871)))

(declare-fun b!287125 () Bool)

(declare-fun e!181872 () Bool)

(assert (=> b!287125 (= e!181871 e!181872)))

(declare-fun res!149072 () Bool)

(assert (=> b!287125 (=> (not res!149072) (not e!181872))))

(assert (=> b!287125 (= res!149072 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7181 a!3312)))))

(declare-fun b!287126 () Bool)

(assert (=> b!287126 (= e!181872 (arrayContainsKey!0 a!3312 k!2524 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!66073 (not res!149071)) b!287125))

(assert (= (and b!287125 res!149072) b!287126))

(declare-fun m!301613 () Bool)

(assert (=> d!66073 m!301613))

(declare-fun m!301615 () Bool)

(assert (=> b!287126 m!301615))

(assert (=> b!287027 d!66073))

(declare-fun b!287178 () Bool)

(declare-fun e!181906 () SeekEntryResult!1978)

(declare-fun lt!141399 () SeekEntryResult!1978)

(assert (=> b!287178 (= e!181906 (MissingZero!1978 (index!10084 lt!141399)))))

(declare-fun b!287179 () Bool)

(declare-fun e!181905 () SeekEntryResult!1978)

(assert (=> b!287179 (= e!181905 Undefined!1978)))

(declare-fun b!287180 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14395 (_ BitVec 32)) SeekEntryResult!1978)

(assert (=> b!287180 (= e!181906 (seekKeyOrZeroReturnVacant!0 (x!28293 lt!141399) (index!10084 lt!141399) (index!10084 lt!141399) k!2524 a!3312 mask!3809))))

(declare-fun d!66075 () Bool)

(declare-fun lt!141400 () SeekEntryResult!1978)

(assert (=> d!66075 (and (or (is-Undefined!1978 lt!141400) (not (is-Found!1978 lt!141400)) (and (bvsge (index!10083 lt!141400) #b00000000000000000000000000000000) (bvslt (index!10083 lt!141400) (size!7181 a!3312)))) (or (is-Undefined!1978 lt!141400) (is-Found!1978 lt!141400) (not (is-MissingZero!1978 lt!141400)) (and (bvsge (index!10082 lt!141400) #b00000000000000000000000000000000) (bvslt (index!10082 lt!141400) (size!7181 a!3312)))) (or (is-Undefined!1978 lt!141400) (is-Found!1978 lt!141400) (is-MissingZero!1978 lt!141400) (not (is-MissingVacant!1978 lt!141400)) (and (bvsge (index!10085 lt!141400) #b00000000000000000000000000000000) (bvslt (index!10085 lt!141400) (size!7181 a!3312)))) (or (is-Undefined!1978 lt!141400) (ite (is-Found!1978 lt!141400) (= (select (arr!6829 a!3312) (index!10083 lt!141400)) k!2524) (ite (is-MissingZero!1978 lt!141400) (= (select (arr!6829 a!3312) (index!10082 lt!141400)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!1978 lt!141400) (= (select (arr!6829 a!3312) (index!10085 lt!141400)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!66075 (= lt!141400 e!181905)))

(declare-fun c!46604 () Bool)

(assert (=> d!66075 (= c!46604 (and (is-Intermediate!1978 lt!141399) (undefined!2790 lt!141399)))))

(assert (=> d!66075 (= lt!141399 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2524 mask!3809) k!2524 a!3312 mask!3809))))

(assert (=> d!66075 (validMask!0 mask!3809)))

(assert (=> d!66075 (= (seekEntryOrOpen!0 k!2524 a!3312 mask!3809) lt!141400)))

(declare-fun b!287181 () Bool)

(declare-fun c!46605 () Bool)

(declare-fun lt!141398 () (_ BitVec 64))

(assert (=> b!287181 (= c!46605 (= lt!141398 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!181907 () SeekEntryResult!1978)

(assert (=> b!287181 (= e!181907 e!181906)))

(declare-fun b!287182 () Bool)

(assert (=> b!287182 (= e!181907 (Found!1978 (index!10084 lt!141399)))))

(declare-fun b!287183 () Bool)

(assert (=> b!287183 (= e!181905 e!181907)))

(assert (=> b!287183 (= lt!141398 (select (arr!6829 a!3312) (index!10084 lt!141399)))))

(declare-fun c!46603 () Bool)

(assert (=> b!287183 (= c!46603 (= lt!141398 k!2524))))

(assert (= (and d!66075 c!46604) b!287179))

(assert (= (and d!66075 (not c!46604)) b!287183))

(assert (= (and b!287183 c!46603) b!287182))

(assert (= (and b!287183 (not c!46603)) b!287181))

(assert (= (and b!287181 c!46605) b!287178))

(assert (= (and b!287181 (not c!46605)) b!287180))

(declare-fun m!301639 () Bool)

(assert (=> b!287180 m!301639))

(declare-fun m!301641 () Bool)

(assert (=> d!66075 m!301641))

(assert (=> d!66075 m!301581))

(assert (=> d!66075 m!301583))

(declare-fun m!301646 () Bool)

(assert (=> d!66075 m!301646))

(assert (=> d!66075 m!301577))

(assert (=> d!66075 m!301581))

(declare-fun m!301649 () Bool)

(assert (=> d!66075 m!301649))

(declare-fun m!301651 () Bool)

(assert (=> b!287183 m!301651))

(assert (=> b!287029 d!66075))

(declare-fun b!287212 () Bool)

(declare-fun e!181929 () Bool)

(declare-fun call!25614 () Bool)

(assert (=> b!287212 (= e!181929 call!25614)))

(declare-fun b!287213 () Bool)

(declare-fun e!181930 () Bool)

(assert (=> b!287213 (= e!181930 e!181929)))

(declare-fun c!46613 () Bool)

(assert (=> b!287213 (= c!46613 (validKeyInArray!0 (select (arr!6829 a!3312) #b00000000000000000000000000000000)))))

(declare-fun d!66093 () Bool)

(declare-fun res!149103 () Bool)

(assert (=> d!66093 (=> res!149103 e!181930)))

(assert (=> d!66093 (= res!149103 (bvsge #b00000000000000000000000000000000 (size!7181 a!3312)))))

(assert (=> d!66093 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809) e!181930)))

(declare-fun bm!25611 () Bool)

(assert (=> bm!25611 (= call!25614 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3312 mask!3809))))

(declare-fun b!287214 () Bool)

(declare-fun e!181931 () Bool)

(assert (=> b!287214 (= e!181931 call!25614)))

(declare-fun b!287215 () Bool)

(assert (=> b!287215 (= e!181929 e!181931)))

(declare-fun lt!141424 () (_ BitVec 64))

(assert (=> b!287215 (= lt!141424 (select (arr!6829 a!3312) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9066 0))(
  ( (Unit!9067) )
))
(declare-fun lt!141422 () Unit!9066)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!14395 (_ BitVec 64) (_ BitVec 32)) Unit!9066)

