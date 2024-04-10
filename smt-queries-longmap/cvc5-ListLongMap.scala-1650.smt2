; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30680 () Bool)

(assert start!30680)

(declare-fun b!308042 () Bool)

(declare-fun e!192692 () Bool)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun lt!151226 () (_ BitVec 32))

(assert (=> b!308042 (= e!192692 (and (bvsge mask!3709 #b00000000000000000000000000000000) (or (bvslt lt!151226 #b00000000000000000000000000000000) (bvsge lt!151226 (bvadd #b00000000000000000000000000000001 mask!3709)))))))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!308042 (= lt!151226 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!308043 () Bool)

(declare-fun res!164801 () Bool)

(declare-fun e!192693 () Bool)

(assert (=> b!308043 (=> (not res!164801) (not e!192693))))

(declare-datatypes ((array!15684 0))(
  ( (array!15685 (arr!7427 (Array (_ BitVec 32) (_ BitVec 64))) (size!7779 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15684)

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun i!1240 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2567 0))(
  ( (MissingZero!2567 (index!12444 (_ BitVec 32))) (Found!2567 (index!12445 (_ BitVec 32))) (Intermediate!2567 (undefined!3379 Bool) (index!12446 (_ BitVec 32)) (x!30682 (_ BitVec 32))) (Undefined!2567) (MissingVacant!2567 (index!12447 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15684 (_ BitVec 32)) SeekEntryResult!2567)

(assert (=> b!308043 (= res!164801 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2567 i!1240)))))

(declare-fun b!308044 () Bool)

(declare-fun res!164797 () Bool)

(assert (=> b!308044 (=> (not res!164797) (not e!192693))))

(declare-fun arrayContainsKey!0 (array!15684 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!308044 (= res!164797 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun res!164802 () Bool)

(assert (=> start!30680 (=> (not res!164802) (not e!192693))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30680 (= res!164802 (validMask!0 mask!3709))))

(assert (=> start!30680 e!192693))

(declare-fun array_inv!5390 (array!15684) Bool)

(assert (=> start!30680 (array_inv!5390 a!3293)))

(assert (=> start!30680 true))

(declare-fun b!308045 () Bool)

(declare-fun res!164800 () Bool)

(assert (=> b!308045 (=> (not res!164800) (not e!192692))))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!308045 (= res!164800 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7427 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52))))))

(declare-fun b!308046 () Bool)

(declare-fun res!164803 () Bool)

(assert (=> b!308046 (=> (not res!164803) (not e!192693))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!308046 (= res!164803 (validKeyInArray!0 k!2441))))

(declare-fun b!308047 () Bool)

(declare-fun res!164804 () Bool)

(assert (=> b!308047 (=> (not res!164804) (not e!192692))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!308047 (= res!164804 (and (= (select (arr!7427 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7779 a!3293))))))

(declare-fun b!308048 () Bool)

(assert (=> b!308048 (= e!192693 e!192692)))

(declare-fun res!164799 () Bool)

(assert (=> b!308048 (=> (not res!164799) (not e!192692))))

(declare-fun lt!151227 () SeekEntryResult!2567)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15684 (_ BitVec 32)) SeekEntryResult!2567)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!308048 (= res!164799 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!151227))))

(assert (=> b!308048 (= lt!151227 (Intermediate!2567 false resIndex!52 resX!52))))

(declare-fun b!308049 () Bool)

(declare-fun res!164796 () Bool)

(assert (=> b!308049 (=> (not res!164796) (not e!192693))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15684 (_ BitVec 32)) Bool)

(assert (=> b!308049 (= res!164796 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!308050 () Bool)

(declare-fun res!164798 () Bool)

(assert (=> b!308050 (=> (not res!164798) (not e!192693))))

(assert (=> b!308050 (= res!164798 (and (= (size!7779 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7779 a!3293))))))

(declare-fun b!308051 () Bool)

(declare-fun res!164805 () Bool)

(assert (=> b!308051 (=> (not res!164805) (not e!192692))))

(assert (=> b!308051 (= res!164805 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709) lt!151227))))

(assert (= (and start!30680 res!164802) b!308050))

(assert (= (and b!308050 res!164798) b!308046))

(assert (= (and b!308046 res!164803) b!308044))

(assert (= (and b!308044 res!164797) b!308043))

(assert (= (and b!308043 res!164801) b!308049))

(assert (= (and b!308049 res!164796) b!308048))

(assert (= (and b!308048 res!164799) b!308047))

(assert (= (and b!308047 res!164804) b!308051))

(assert (= (and b!308051 res!164805) b!308045))

(assert (= (and b!308045 res!164800) b!308042))

(declare-fun m!318233 () Bool)

(assert (=> start!30680 m!318233))

(declare-fun m!318235 () Bool)

(assert (=> start!30680 m!318235))

(declare-fun m!318237 () Bool)

(assert (=> b!308046 m!318237))

(declare-fun m!318239 () Bool)

(assert (=> b!308045 m!318239))

(declare-fun m!318241 () Bool)

(assert (=> b!308047 m!318241))

(declare-fun m!318243 () Bool)

(assert (=> b!308051 m!318243))

(declare-fun m!318245 () Bool)

(assert (=> b!308043 m!318245))

(declare-fun m!318247 () Bool)

(assert (=> b!308044 m!318247))

(declare-fun m!318249 () Bool)

(assert (=> b!308042 m!318249))

(declare-fun m!318251 () Bool)

(assert (=> b!308049 m!318251))

(declare-fun m!318253 () Bool)

(assert (=> b!308048 m!318253))

(assert (=> b!308048 m!318253))

(declare-fun m!318255 () Bool)

(assert (=> b!308048 m!318255))

(push 1)

(assert (not b!308046))

(assert (not b!308048))

(assert (not b!308051))

(assert (not start!30680))

(assert (not b!308044))

(assert (not b!308043))

(assert (not b!308042))

(assert (not b!308049))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!308148 () Bool)

(declare-fun e!192736 () SeekEntryResult!2567)

(assert (=> b!308148 (= e!192736 (Intermediate!2567 true (toIndex!0 k!2441 mask!3709) #b00000000000000000000000000000000))))

(declare-fun b!308149 () Bool)

(declare-fun e!192734 () Bool)

(declare-fun e!192733 () Bool)

(assert (=> b!308149 (= e!192734 e!192733)))

(declare-fun res!164873 () Bool)

(declare-fun lt!151253 () SeekEntryResult!2567)

(assert (=> b!308149 (= res!164873 (and (is-Intermediate!2567 lt!151253) (not (undefined!3379 lt!151253)) (bvslt (x!30682 lt!151253) #b01111111111111111111111111111110) (bvsge (x!30682 lt!151253) #b00000000000000000000000000000000) (bvsge (x!30682 lt!151253) #b00000000000000000000000000000000)))))

(assert (=> b!308149 (=> (not res!164873) (not e!192733))))

(declare-fun b!308150 () Bool)

(assert (=> b!308150 (and (bvsge (index!12446 lt!151253) #b00000000000000000000000000000000) (bvslt (index!12446 lt!151253) (size!7779 a!3293)))))

(declare-fun e!192735 () Bool)

(assert (=> b!308150 (= e!192735 (= (select (arr!7427 a!3293) (index!12446 lt!151253)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!308151 () Bool)

(declare-fun e!192732 () SeekEntryResult!2567)

(assert (=> b!308151 (= e!192736 e!192732)))

(declare-fun c!49242 () Bool)

(declare-fun lt!151254 () (_ BitVec 64))

(assert (=> b!308151 (= c!49242 (or (= lt!151254 k!2441) (= (bvadd lt!151254 lt!151254) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!68255 () Bool)

(assert (=> d!68255 e!192734))

(declare-fun c!49241 () Bool)

(assert (=> d!68255 (= c!49241 (and (is-Intermediate!2567 lt!151253) (undefined!3379 lt!151253)))))

(assert (=> d!68255 (= lt!151253 e!192736)))

(declare-fun c!49240 () Bool)

(assert (=> d!68255 (= c!49240 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!68255 (= lt!151254 (select (arr!7427 a!3293) (toIndex!0 k!2441 mask!3709)))))

(assert (=> d!68255 (validMask!0 mask!3709)))

(assert (=> d!68255 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!151253)))

(declare-fun b!308152 () Bool)

(assert (=> b!308152 (= e!192732 (Intermediate!2567 false (toIndex!0 k!2441 mask!3709) #b00000000000000000000000000000000))))

(declare-fun b!308153 () Bool)

(assert (=> b!308153 (and (bvsge (index!12446 lt!151253) #b00000000000000000000000000000000) (bvslt (index!12446 lt!151253) (size!7779 a!3293)))))

(declare-fun res!164874 () Bool)

(assert (=> b!308153 (= res!164874 (= (select (arr!7427 a!3293) (index!12446 lt!151253)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!308153 (=> res!164874 e!192735)))

(declare-fun b!308154 () Bool)

(assert (=> b!308154 (= e!192734 (bvsge (x!30682 lt!151253) #b01111111111111111111111111111110))))

(declare-fun b!308155 () Bool)

(assert (=> b!308155 (and (bvsge (index!12446 lt!151253) #b00000000000000000000000000000000) (bvslt (index!12446 lt!151253) (size!7779 a!3293)))))

(declare-fun res!164872 () Bool)

(assert (=> b!308155 (= res!164872 (= (select (arr!7427 a!3293) (index!12446 lt!151253)) k!2441))))

(assert (=> b!308155 (=> res!164872 e!192735)))

(assert (=> b!308155 (= e!192733 e!192735)))

(declare-fun b!308156 () Bool)

(assert (=> b!308156 (= e!192732 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k!2441 mask!3709) #b00000000000000000000000000000000 mask!3709) k!2441 a!3293 mask!3709))))

(assert (= (and d!68255 c!49240) b!308148))

(assert (= (and d!68255 (not c!49240)) b!308151))

(assert (= (and b!308151 c!49242) b!308152))

(assert (= (and b!308151 (not c!49242)) b!308156))

(assert (= (and d!68255 c!49241) b!308154))

(assert (= (and d!68255 (not c!49241)) b!308149))

(assert (= (and b!308149 res!164873) b!308155))

(assert (= (and b!308155 (not res!164872)) b!308153))

(assert (= (and b!308153 (not res!164874)) b!308150))

(declare-fun m!318315 () Bool)

(assert (=> b!308150 m!318315))

(assert (=> b!308156 m!318253))

(declare-fun m!318317 () Bool)

(assert (=> b!308156 m!318317))

(assert (=> b!308156 m!318317))

(declare-fun m!318319 () Bool)

(assert (=> b!308156 m!318319))

(assert (=> b!308155 m!318315))

(assert (=> b!308153 m!318315))

(assert (=> d!68255 m!318253))

(declare-fun m!318321 () Bool)

(assert (=> d!68255 m!318321))

(assert (=> d!68255 m!318233))

(assert (=> b!308048 d!68255))

(declare-fun d!68259 () Bool)

(declare-fun lt!151264 () (_ BitVec 32))

(declare-fun lt!151263 () (_ BitVec 32))

(assert (=> d!68259 (= lt!151264 (bvmul (bvxor lt!151263 (bvlshr lt!151263 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!68259 (= lt!151263 ((_ extract 31 0) (bvand (bvxor k!2441 (bvlshr k!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!68259 (and (bvsge mask!3709 #b00000000000000000000000000000000) (let ((res!164875 (let ((h!5340 ((_ extract 31 0) (bvand (bvxor k!2441 (bvlshr k!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!30686 (bvmul (bvxor h!5340 (bvlshr h!5340 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!30686 (bvlshr x!30686 #b00000000000000000000000000001101)) mask!3709))))) (and (bvslt res!164875 (bvadd mask!3709 #b00000000000000000000000000000001)) (bvsge res!164875 #b00000000000000000000000000000000))))))

(assert (=> d!68259 (= (toIndex!0 k!2441 mask!3709) (bvand (bvxor lt!151264 (bvlshr lt!151264 #b00000000000000000000000000001101)) mask!3709))))

(assert (=> b!308048 d!68259))

(declare-fun d!68261 () Bool)

(declare-fun lt!151267 () (_ BitVec 32))

(assert (=> d!68261 (and (bvsge lt!151267 #b00000000000000000000000000000000) (bvslt lt!151267 (bvadd mask!3709 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!68261 (= lt!151267 (choose!52 index!1781 x!1427 mask!3709))))

(assert (=> d!68261 (validMask!0 mask!3709)))

(assert (=> d!68261 (= (nextIndex!0 index!1781 x!1427 mask!3709) lt!151267)))

(declare-fun bs!10829 () Bool)

(assert (= bs!10829 d!68261))

(declare-fun m!318323 () Bool)

(assert (=> bs!10829 m!318323))

(assert (=> bs!10829 m!318233))

(assert (=> b!308042 d!68261))

(declare-fun d!68263 () Bool)

(assert (=> d!68263 (= (validKeyInArray!0 k!2441) (and (not (= k!2441 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2441 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!308046 d!68263))

(declare-fun b!308175 () Bool)

(declare-fun e!192751 () SeekEntryResult!2567)

(assert (=> b!308175 (= e!192751 (Intermediate!2567 true index!1781 x!1427))))

(declare-fun b!308176 () Bool)

(declare-fun e!192749 () Bool)

(declare-fun e!192748 () Bool)

(assert (=> b!308176 (= e!192749 e!192748)))

(declare-fun res!164883 () Bool)

(declare-fun lt!151268 () SeekEntryResult!2567)

(assert (=> b!308176 (= res!164883 (and (is-Intermediate!2567 lt!151268) (not (undefined!3379 lt!151268)) (bvslt (x!30682 lt!151268) #b01111111111111111111111111111110) (bvsge (x!30682 lt!151268) #b00000000000000000000000000000000) (bvsge (x!30682 lt!151268) x!1427)))))

(assert (=> b!308176 (=> (not res!164883) (not e!192748))))

(declare-fun b!308177 () Bool)

(assert (=> b!308177 (and (bvsge (index!12446 lt!151268) #b00000000000000000000000000000000) (bvslt (index!12446 lt!151268) (size!7779 a!3293)))))

(declare-fun e!192750 () Bool)

(assert (=> b!308177 (= e!192750 (= (select (arr!7427 a!3293) (index!12446 lt!151268)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!308178 () Bool)

(declare-fun e!192747 () SeekEntryResult!2567)

(assert (=> b!308178 (= e!192751 e!192747)))

(declare-fun c!49251 () Bool)

(declare-fun lt!151269 () (_ BitVec 64))

(assert (=> b!308178 (= c!49251 (or (= lt!151269 k!2441) (= (bvadd lt!151269 lt!151269) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!68265 () Bool)

(assert (=> d!68265 e!192749))

(declare-fun c!49250 () Bool)

(assert (=> d!68265 (= c!49250 (and (is-Intermediate!2567 lt!151268) (undefined!3379 lt!151268)))))

(assert (=> d!68265 (= lt!151268 e!192751)))

(declare-fun c!49249 () Bool)

(assert (=> d!68265 (= c!49249 (bvsge x!1427 #b01111111111111111111111111111110))))

(assert (=> d!68265 (= lt!151269 (select (arr!7427 a!3293) index!1781))))

(assert (=> d!68265 (validMask!0 mask!3709)))

(assert (=> d!68265 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709) lt!151268)))

(declare-fun b!308179 () Bool)

(assert (=> b!308179 (= e!192747 (Intermediate!2567 false index!1781 x!1427))))

(declare-fun b!308180 () Bool)

(assert (=> b!308180 (and (bvsge (index!12446 lt!151268) #b00000000000000000000000000000000) (bvslt (index!12446 lt!151268) (size!7779 a!3293)))))

(declare-fun res!164884 () Bool)

(assert (=> b!308180 (= res!164884 (= (select (arr!7427 a!3293) (index!12446 lt!151268)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!308180 (=> res!164884 e!192750)))

(declare-fun b!308181 () Bool)

(assert (=> b!308181 (= e!192749 (bvsge (x!30682 lt!151268) #b01111111111111111111111111111110))))

(declare-fun b!308182 () Bool)

(assert (=> b!308182 (and (bvsge (index!12446 lt!151268) #b00000000000000000000000000000000) (bvslt (index!12446 lt!151268) (size!7779 a!3293)))))

(declare-fun res!164882 () Bool)

(assert (=> b!308182 (= res!164882 (= (select (arr!7427 a!3293) (index!12446 lt!151268)) k!2441))))

(assert (=> b!308182 (=> res!164882 e!192750)))

(assert (=> b!308182 (= e!192748 e!192750)))

(declare-fun b!308183 () Bool)

(assert (=> b!308183 (= e!192747 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1427 #b00000000000000000000000000000001) (nextIndex!0 index!1781 x!1427 mask!3709) k!2441 a!3293 mask!3709))))

(assert (= (and d!68265 c!49249) b!308175))

(assert (= (and d!68265 (not c!49249)) b!308178))

(assert (= (and b!308178 c!49251) b!308179))

(assert (= (and b!308178 (not c!49251)) b!308183))

(assert (= (and d!68265 c!49250) b!308181))

(assert (= (and d!68265 (not c!49250)) b!308176))

(assert (= (and b!308176 res!164883) b!308182))

(assert (= (and b!308182 (not res!164882)) b!308180))

(assert (= (and b!308180 (not res!164884)) b!308177))

(declare-fun m!318325 () Bool)

(assert (=> b!308177 m!318325))

(assert (=> b!308183 m!318249))

(assert (=> b!308183 m!318249))

(declare-fun m!318327 () Bool)

(assert (=> b!308183 m!318327))

(assert (=> b!308182 m!318325))

(assert (=> b!308180 m!318325))

(assert (=> d!68265 m!318239))

(assert (=> d!68265 m!318233))

(assert (=> b!308051 d!68265))

(declare-fun d!68267 () Bool)

(assert (=> d!68267 (= (validMask!0 mask!3709) (and (or (= mask!3709 #b00000000000000000000000000000111) (= mask!3709 #b00000000000000000000000000001111) (= mask!3709 #b00000000000000000000000000011111) (= mask!3709 #b00000000000000000000000000111111) (= mask!3709 #b00000000000000000000000001111111) (= mask!3709 #b00000000000000000000000011111111) (= mask!3709 #b00000000000000000000000111111111) (= mask!3709 #b00000000000000000000001111111111) (= mask!3709 #b00000000000000000000011111111111) (= mask!3709 #b00000000000000000000111111111111) (= mask!3709 #b00000000000000000001111111111111) (= mask!3709 #b00000000000000000011111111111111) (= mask!3709 #b00000000000000000111111111111111) (= mask!3709 #b00000000000000001111111111111111) (= mask!3709 #b00000000000000011111111111111111) (= mask!3709 #b00000000000000111111111111111111) (= mask!3709 #b00000000000001111111111111111111) (= mask!3709 #b00000000000011111111111111111111) (= mask!3709 #b00000000000111111111111111111111) (= mask!3709 #b00000000001111111111111111111111) (= mask!3709 #b00000000011111111111111111111111) (= mask!3709 #b00000000111111111111111111111111) (= mask!3709 #b00000001111111111111111111111111) (= mask!3709 #b00000011111111111111111111111111) (= mask!3709 #b00000111111111111111111111111111) (= mask!3709 #b00001111111111111111111111111111) (= mask!3709 #b00011111111111111111111111111111) (= mask!3709 #b00111111111111111111111111111111)) (bvsle mask!3709 #b00111111111111111111111111111111)))))

(assert (=> start!30680 d!68267))

(declare-fun d!68275 () Bool)

(assert (=> d!68275 (= (array_inv!5390 a!3293) (bvsge (size!7779 a!3293) #b00000000000000000000000000000000))))

(assert (=> start!30680 d!68275))

(declare-fun d!68279 () Bool)

(declare-fun res!164897 () Bool)

(declare-fun e!192765 () Bool)

(assert (=> d!68279 (=> res!164897 e!192765)))

(assert (=> d!68279 (= res!164897 (= (select (arr!7427 a!3293) #b00000000000000000000000000000000) k!2441))))

(assert (=> d!68279 (= (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000) e!192765)))

(declare-fun b!308201 () Bool)

(declare-fun e!192766 () Bool)

(assert (=> b!308201 (= e!192765 e!192766)))

(declare-fun res!164898 () Bool)

(assert (=> b!308201 (=> (not res!164898) (not e!192766))))

(assert (=> b!308201 (= res!164898 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7779 a!3293)))))

(declare-fun b!308202 () Bool)

(assert (=> b!308202 (= e!192766 (arrayContainsKey!0 a!3293 k!2441 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!68279 (not res!164897)) b!308201))

(assert (= (and b!308201 res!164898) b!308202))

(declare-fun m!318339 () Bool)

(assert (=> d!68279 m!318339))

(declare-fun m!318341 () Bool)

(assert (=> b!308202 m!318341))

(assert (=> b!308044 d!68279))

(declare-fun b!308213 () Bool)

(declare-fun e!192775 () Bool)

(declare-fun e!192777 () Bool)

(assert (=> b!308213 (= e!192775 e!192777)))

(declare-fun c!49257 () Bool)

(assert (=> b!308213 (= c!49257 (validKeyInArray!0 (select (arr!7427 a!3293) #b00000000000000000000000000000000)))))

(declare-fun b!308214 () Bool)

(declare-fun e!192776 () Bool)

(declare-fun call!25912 () Bool)

(assert (=> b!308214 (= e!192776 call!25912)))

(declare-fun b!308215 () Bool)

(assert (=> b!308215 (= e!192777 e!192776)))

(declare-fun lt!151289 () (_ BitVec 64))

(assert (=> b!308215 (= lt!151289 (select (arr!7427 a!3293) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9581 0))(
  ( (Unit!9582) )
))
(declare-fun lt!151287 () Unit!9581)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!15684 (_ BitVec 64) (_ BitVec 32)) Unit!9581)

(assert (=> b!308215 (= lt!151287 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3293 lt!151289 #b00000000000000000000000000000000))))

(assert (=> b!308215 (arrayContainsKey!0 a!3293 lt!151289 #b00000000000000000000000000000000)))

(declare-fun lt!151288 () Unit!9581)

(assert (=> b!308215 (= lt!151288 lt!151287)))

(declare-fun res!164906 () Bool)

(assert (=> b!308215 (= res!164906 (= (seekEntryOrOpen!0 (select (arr!7427 a!3293) #b00000000000000000000000000000000) a!3293 mask!3709) (Found!2567 #b00000000000000000000000000000000)))))

(assert (=> b!308215 (=> (not res!164906) (not e!192776))))

(declare-fun bm!25909 () Bool)

(assert (=> bm!25909 (= call!25912 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3293 mask!3709))))

(declare-fun b!308216 () Bool)

(assert (=> b!308216 (= e!192777 call!25912)))

(declare-fun d!68281 () Bool)

(declare-fun res!164905 () Bool)

(assert (=> d!68281 (=> res!164905 e!192775)))

(assert (=> d!68281 (= res!164905 (bvsge #b00000000000000000000000000000000 (size!7779 a!3293)))))

(assert (=> d!68281 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709) e!192775)))

(assert (= (and d!68281 (not res!164905)) b!308213))

(assert (= (and b!308213 c!49257) b!308215))

(assert (= (and b!308213 (not c!49257)) b!308216))

(assert (= (and b!308215 res!164906) b!308214))

(assert (= (or b!308214 b!308216) bm!25909))

(assert (=> b!308213 m!318339))

(assert (=> b!308213 m!318339))

(declare-fun m!318347 () Bool)

(assert (=> b!308213 m!318347))

(assert (=> b!308215 m!318339))

(declare-fun m!318349 () Bool)

(assert (=> b!308215 m!318349))

(declare-fun m!318351 () Bool)

(assert (=> b!308215 m!318351))

(assert (=> b!308215 m!318339))

(declare-fun m!318353 () Bool)

(assert (=> b!308215 m!318353))

(declare-fun m!318355 () Bool)

(assert (=> bm!25909 m!318355))

(assert (=> b!308049 d!68281))

(declare-fun b!308229 () Bool)

(declare-fun e!192786 () SeekEntryResult!2567)

(declare-fun lt!151301 () SeekEntryResult!2567)

(assert (=> b!308229 (= e!192786 (Found!2567 (index!12446 lt!151301)))))

(declare-fun e!192785 () SeekEntryResult!2567)

(declare-fun b!308230 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15684 (_ BitVec 32)) SeekEntryResult!2567)

(assert (=> b!308230 (= e!192785 (seekKeyOrZeroReturnVacant!0 (x!30682 lt!151301) (index!12446 lt!151301) (index!12446 lt!151301) k!2441 a!3293 mask!3709))))

(declare-fun b!308231 () Bool)

(assert (=> b!308231 (= e!192785 (MissingZero!2567 (index!12446 lt!151301)))))

(declare-fun b!308232 () Bool)

(declare-fun c!49265 () Bool)

(declare-fun lt!151300 () (_ BitVec 64))

(assert (=> b!308232 (= c!49265 (= lt!151300 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!308232 (= e!192786 e!192785)))

(declare-fun b!308233 () Bool)

(declare-fun e!192784 () SeekEntryResult!2567)

(assert (=> b!308233 (= e!192784 Undefined!2567)))

(declare-fun d!68289 () Bool)

(declare-fun lt!151299 () SeekEntryResult!2567)

(assert (=> d!68289 (and (or (is-Undefined!2567 lt!151299) (not (is-Found!2567 lt!151299)) (and (bvsge (index!12445 lt!151299) #b00000000000000000000000000000000) (bvslt (index!12445 lt!151299) (size!7779 a!3293)))) (or (is-Undefined!2567 lt!151299) (is-Found!2567 lt!151299) (not (is-MissingZero!2567 lt!151299)) (and (bvsge (index!12444 lt!151299) #b00000000000000000000000000000000) (bvslt (index!12444 lt!151299) (size!7779 a!3293)))) (or (is-Undefined!2567 lt!151299) (is-Found!2567 lt!151299) (is-MissingZero!2567 lt!151299) (not (is-MissingVacant!2567 lt!151299)) (and (bvsge (index!12447 lt!151299) #b00000000000000000000000000000000) (bvslt (index!12447 lt!151299) (size!7779 a!3293)))) (or (is-Undefined!2567 lt!151299) (ite (is-Found!2567 lt!151299) (= (select (arr!7427 a!3293) (index!12445 lt!151299)) k!2441) (ite (is-MissingZero!2567 lt!151299) (= (select (arr!7427 a!3293) (index!12444 lt!151299)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!2567 lt!151299) (= (select (arr!7427 a!3293) (index!12447 lt!151299)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!68289 (= lt!151299 e!192784)))

(declare-fun c!49264 () Bool)

(assert (=> d!68289 (= c!49264 (and (is-Intermediate!2567 lt!151301) (undefined!3379 lt!151301)))))

(assert (=> d!68289 (= lt!151301 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709))))

(assert (=> d!68289 (validMask!0 mask!3709)))

(assert (=> d!68289 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) lt!151299)))

(declare-fun b!308234 () Bool)

(assert (=> b!308234 (= e!192784 e!192786)))

(assert (=> b!308234 (= lt!151300 (select (arr!7427 a!3293) (index!12446 lt!151301)))))

(declare-fun c!49266 () Bool)

(assert (=> b!308234 (= c!49266 (= lt!151300 k!2441))))

(assert (= (and d!68289 c!49264) b!308233))

(assert (= (and d!68289 (not c!49264)) b!308234))

(assert (= (and b!308234 c!49266) b!308229))

(assert (= (and b!308234 (not c!49266)) b!308232))

(assert (= (and b!308232 c!49265) b!308231))

(assert (= (and b!308232 (not c!49265)) b!308230))

(declare-fun m!318359 () Bool)

(assert (=> b!308230 m!318359))

(assert (=> d!68289 m!318253))

(assert (=> d!68289 m!318233))

(assert (=> d!68289 m!318253))

(assert (=> d!68289 m!318255))

(declare-fun m!318361 () Bool)

(assert (=> d!68289 m!318361))

(declare-fun m!318363 () Bool)

(assert (=> d!68289 m!318363))

(declare-fun m!318365 () Bool)

(assert (=> d!68289 m!318365))

(declare-fun m!318367 () Bool)

(assert (=> b!308234 m!318367))

(assert (=> b!308043 d!68289))

(push 1)

(assert (not b!308230))

(assert (not bm!25909))

(assert (not b!308213))

(assert (not d!68255))

(assert (not d!68265))

(assert (not b!308215))

(assert (not b!308183))

(assert (not b!308202))

(assert (not d!68289))

(assert (not d!68261))

(assert (not b!308156))

(check-sat)

(pop 1)

(push 1)

(check-sat)

