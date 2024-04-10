; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30346 () Bool)

(assert start!30346)

(declare-fun b!303978 () Bool)

(declare-fun res!161466 () Bool)

(declare-fun e!191126 () Bool)

(assert (=> b!303978 (=> (not res!161466) (not e!191126))))

(declare-datatypes ((array!15452 0))(
  ( (array!15453 (arr!7314 (Array (_ BitVec 32) (_ BitVec 64))) (size!7666 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15452)

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!303978 (= res!161466 (and (= (select (arr!7314 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7666 a!3293))))))

(declare-fun b!303979 () Bool)

(declare-fun res!161471 () Bool)

(declare-fun e!191128 () Bool)

(assert (=> b!303979 (=> (not res!161471) (not e!191128))))

(declare-fun mask!3709 () (_ BitVec 32))

(assert (=> b!303979 (= res!161471 (and (= (size!7666 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7666 a!3293))))))

(declare-fun b!303980 () Bool)

(declare-fun res!161465 () Bool)

(assert (=> b!303980 (=> (not res!161465) (not e!191128))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15452 (_ BitVec 32)) Bool)

(assert (=> b!303980 (= res!161465 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!303981 () Bool)

(declare-fun res!161468 () Bool)

(assert (=> b!303981 (=> (not res!161468) (not e!191126))))

(declare-fun k0!2441 () (_ BitVec 64))

(assert (=> b!303981 (= res!161468 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7314 a!3293) index!1781) k0!2441)) (= x!1427 resX!52) (not (= resIndex!52 index!1781)) (not (= (select (arr!7314 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7314 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!303982 () Bool)

(declare-fun res!161472 () Bool)

(assert (=> b!303982 (=> (not res!161472) (not e!191128))))

(declare-fun arrayContainsKey!0 (array!15452 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!303982 (= res!161472 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!303983 () Bool)

(declare-fun res!161464 () Bool)

(assert (=> b!303983 (=> (not res!161464) (not e!191126))))

(declare-datatypes ((SeekEntryResult!2454 0))(
  ( (MissingZero!2454 (index!11992 (_ BitVec 32))) (Found!2454 (index!11993 (_ BitVec 32))) (Intermediate!2454 (undefined!3266 Bool) (index!11994 (_ BitVec 32)) (x!30247 (_ BitVec 32))) (Undefined!2454) (MissingVacant!2454 (index!11995 (_ BitVec 32))) )
))
(declare-fun lt!150297 () SeekEntryResult!2454)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15452 (_ BitVec 32)) SeekEntryResult!2454)

(assert (=> b!303983 (= res!161464 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!150297))))

(declare-fun b!303984 () Bool)

(declare-fun lt!150296 () (_ BitVec 32))

(assert (=> b!303984 (= e!191126 (and (bvsge mask!3709 #b00000000000000000000000000000000) (or (bvslt lt!150296 #b00000000000000000000000000000000) (bvsge lt!150296 (bvadd #b00000000000000000000000000000001 mask!3709)))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!303984 (= lt!150296 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!303977 () Bool)

(declare-fun res!161470 () Bool)

(assert (=> b!303977 (=> (not res!161470) (not e!191128))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15452 (_ BitVec 32)) SeekEntryResult!2454)

(assert (=> b!303977 (= res!161470 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2454 i!1240)))))

(declare-fun res!161469 () Bool)

(assert (=> start!30346 (=> (not res!161469) (not e!191128))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30346 (= res!161469 (validMask!0 mask!3709))))

(assert (=> start!30346 e!191128))

(declare-fun array_inv!5277 (array!15452) Bool)

(assert (=> start!30346 (array_inv!5277 a!3293)))

(assert (=> start!30346 true))

(declare-fun b!303985 () Bool)

(assert (=> b!303985 (= e!191128 e!191126)))

(declare-fun res!161467 () Bool)

(assert (=> b!303985 (=> (not res!161467) (not e!191126))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!303985 (= res!161467 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!150297))))

(assert (=> b!303985 (= lt!150297 (Intermediate!2454 false resIndex!52 resX!52))))

(declare-fun b!303986 () Bool)

(declare-fun res!161463 () Bool)

(assert (=> b!303986 (=> (not res!161463) (not e!191128))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!303986 (= res!161463 (validKeyInArray!0 k0!2441))))

(assert (= (and start!30346 res!161469) b!303979))

(assert (= (and b!303979 res!161471) b!303986))

(assert (= (and b!303986 res!161463) b!303982))

(assert (= (and b!303982 res!161472) b!303977))

(assert (= (and b!303977 res!161470) b!303980))

(assert (= (and b!303980 res!161465) b!303985))

(assert (= (and b!303985 res!161467) b!303978))

(assert (= (and b!303978 res!161466) b!303983))

(assert (= (and b!303983 res!161464) b!303981))

(assert (= (and b!303981 res!161468) b!303984))

(declare-fun m!315221 () Bool)

(assert (=> b!303983 m!315221))

(declare-fun m!315223 () Bool)

(assert (=> b!303986 m!315223))

(declare-fun m!315225 () Bool)

(assert (=> b!303978 m!315225))

(declare-fun m!315227 () Bool)

(assert (=> b!303982 m!315227))

(declare-fun m!315229 () Bool)

(assert (=> b!303981 m!315229))

(declare-fun m!315231 () Bool)

(assert (=> b!303984 m!315231))

(declare-fun m!315233 () Bool)

(assert (=> start!30346 m!315233))

(declare-fun m!315235 () Bool)

(assert (=> start!30346 m!315235))

(declare-fun m!315237 () Bool)

(assert (=> b!303985 m!315237))

(assert (=> b!303985 m!315237))

(declare-fun m!315239 () Bool)

(assert (=> b!303985 m!315239))

(declare-fun m!315241 () Bool)

(assert (=> b!303977 m!315241))

(declare-fun m!315243 () Bool)

(assert (=> b!303980 m!315243))

(check-sat (not b!303986) (not b!303980) (not b!303982) (not b!303985) (not b!303984) (not b!303983) (not b!303977) (not start!30346))
(check-sat)
(get-model)

(declare-fun d!68051 () Bool)

(assert (=> d!68051 (= (validKeyInArray!0 k0!2441) (and (not (= k0!2441 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2441 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!303986 d!68051))

(declare-fun b!304041 () Bool)

(declare-fun lt!150311 () SeekEntryResult!2454)

(assert (=> b!304041 (and (bvsge (index!11994 lt!150311) #b00000000000000000000000000000000) (bvslt (index!11994 lt!150311) (size!7666 a!3293)))))

(declare-fun res!161516 () Bool)

(assert (=> b!304041 (= res!161516 (= (select (arr!7314 a!3293) (index!11994 lt!150311)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!191158 () Bool)

(assert (=> b!304041 (=> res!161516 e!191158)))

(declare-fun b!304042 () Bool)

(declare-fun e!191156 () SeekEntryResult!2454)

(assert (=> b!304042 (= e!191156 (Intermediate!2454 true (toIndex!0 k0!2441 mask!3709) #b00000000000000000000000000000000))))

(declare-fun b!304043 () Bool)

(declare-fun e!191155 () SeekEntryResult!2454)

(assert (=> b!304043 (= e!191155 (Intermediate!2454 false (toIndex!0 k0!2441 mask!3709) #b00000000000000000000000000000000))))

(declare-fun b!304044 () Bool)

(assert (=> b!304044 (= e!191155 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!2441 mask!3709) #b00000000000000000000000000000000 mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun d!68053 () Bool)

(declare-fun e!191157 () Bool)

(assert (=> d!68053 e!191157))

(declare-fun c!48862 () Bool)

(get-info :version)

(assert (=> d!68053 (= c!48862 (and ((_ is Intermediate!2454) lt!150311) (undefined!3266 lt!150311)))))

(assert (=> d!68053 (= lt!150311 e!191156)))

(declare-fun c!48863 () Bool)

(assert (=> d!68053 (= c!48863 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!150312 () (_ BitVec 64))

(assert (=> d!68053 (= lt!150312 (select (arr!7314 a!3293) (toIndex!0 k0!2441 mask!3709)))))

(assert (=> d!68053 (validMask!0 mask!3709)))

(assert (=> d!68053 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!150311)))

(declare-fun b!304045 () Bool)

(assert (=> b!304045 (= e!191156 e!191155)))

(declare-fun c!48864 () Bool)

(assert (=> b!304045 (= c!48864 (or (= lt!150312 k0!2441) (= (bvadd lt!150312 lt!150312) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!304046 () Bool)

(assert (=> b!304046 (= e!191157 (bvsge (x!30247 lt!150311) #b01111111111111111111111111111110))))

(declare-fun b!304047 () Bool)

(assert (=> b!304047 (and (bvsge (index!11994 lt!150311) #b00000000000000000000000000000000) (bvslt (index!11994 lt!150311) (size!7666 a!3293)))))

(declare-fun res!161515 () Bool)

(assert (=> b!304047 (= res!161515 (= (select (arr!7314 a!3293) (index!11994 lt!150311)) k0!2441))))

(assert (=> b!304047 (=> res!161515 e!191158)))

(declare-fun e!191154 () Bool)

(assert (=> b!304047 (= e!191154 e!191158)))

(declare-fun b!304048 () Bool)

(assert (=> b!304048 (= e!191157 e!191154)))

(declare-fun res!161517 () Bool)

(assert (=> b!304048 (= res!161517 (and ((_ is Intermediate!2454) lt!150311) (not (undefined!3266 lt!150311)) (bvslt (x!30247 lt!150311) #b01111111111111111111111111111110) (bvsge (x!30247 lt!150311) #b00000000000000000000000000000000) (bvsge (x!30247 lt!150311) #b00000000000000000000000000000000)))))

(assert (=> b!304048 (=> (not res!161517) (not e!191154))))

(declare-fun b!304049 () Bool)

(assert (=> b!304049 (and (bvsge (index!11994 lt!150311) #b00000000000000000000000000000000) (bvslt (index!11994 lt!150311) (size!7666 a!3293)))))

(assert (=> b!304049 (= e!191158 (= (select (arr!7314 a!3293) (index!11994 lt!150311)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!68053 c!48863) b!304042))

(assert (= (and d!68053 (not c!48863)) b!304045))

(assert (= (and b!304045 c!48864) b!304043))

(assert (= (and b!304045 (not c!48864)) b!304044))

(assert (= (and d!68053 c!48862) b!304046))

(assert (= (and d!68053 (not c!48862)) b!304048))

(assert (= (and b!304048 res!161517) b!304047))

(assert (= (and b!304047 (not res!161515)) b!304041))

(assert (= (and b!304041 (not res!161516)) b!304049))

(declare-fun m!315275 () Bool)

(assert (=> b!304049 m!315275))

(assert (=> b!304044 m!315237))

(declare-fun m!315277 () Bool)

(assert (=> b!304044 m!315277))

(assert (=> b!304044 m!315277))

(declare-fun m!315279 () Bool)

(assert (=> b!304044 m!315279))

(assert (=> b!304041 m!315275))

(assert (=> b!304047 m!315275))

(assert (=> d!68053 m!315237))

(declare-fun m!315281 () Bool)

(assert (=> d!68053 m!315281))

(assert (=> d!68053 m!315233))

(assert (=> b!303985 d!68053))

(declare-fun d!68065 () Bool)

(declare-fun lt!150324 () (_ BitVec 32))

(declare-fun lt!150323 () (_ BitVec 32))

(assert (=> d!68065 (= lt!150324 (bvmul (bvxor lt!150323 (bvlshr lt!150323 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!68065 (= lt!150323 ((_ extract 31 0) (bvand (bvxor k0!2441 (bvlshr k0!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!68065 (and (bvsge mask!3709 #b00000000000000000000000000000000) (let ((res!161518 (let ((h!5334 ((_ extract 31 0) (bvand (bvxor k0!2441 (bvlshr k0!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!30251 (bvmul (bvxor h!5334 (bvlshr h!5334 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!30251 (bvlshr x!30251 #b00000000000000000000000000001101)) mask!3709))))) (and (bvslt res!161518 (bvadd mask!3709 #b00000000000000000000000000000001)) (bvsge res!161518 #b00000000000000000000000000000000))))))

(assert (=> d!68065 (= (toIndex!0 k0!2441 mask!3709) (bvand (bvxor lt!150324 (bvlshr lt!150324 #b00000000000000000000000000001101)) mask!3709))))

(assert (=> b!303985 d!68065))

(declare-fun b!304070 () Bool)

(declare-fun e!191175 () Bool)

(declare-fun call!25897 () Bool)

(assert (=> b!304070 (= e!191175 call!25897)))

(declare-fun b!304071 () Bool)

(declare-fun e!191174 () Bool)

(assert (=> b!304071 (= e!191175 e!191174)))

(declare-fun lt!150334 () (_ BitVec 64))

(assert (=> b!304071 (= lt!150334 (select (arr!7314 a!3293) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9389 0))(
  ( (Unit!9390) )
))
(declare-fun lt!150335 () Unit!9389)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!15452 (_ BitVec 64) (_ BitVec 32)) Unit!9389)

(assert (=> b!304071 (= lt!150335 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3293 lt!150334 #b00000000000000000000000000000000))))

(assert (=> b!304071 (arrayContainsKey!0 a!3293 lt!150334 #b00000000000000000000000000000000)))

(declare-fun lt!150336 () Unit!9389)

(assert (=> b!304071 (= lt!150336 lt!150335)))

(declare-fun res!161530 () Bool)

(assert (=> b!304071 (= res!161530 (= (seekEntryOrOpen!0 (select (arr!7314 a!3293) #b00000000000000000000000000000000) a!3293 mask!3709) (Found!2454 #b00000000000000000000000000000000)))))

(assert (=> b!304071 (=> (not res!161530) (not e!191174))))

(declare-fun b!304072 () Bool)

(assert (=> b!304072 (= e!191174 call!25897)))

(declare-fun d!68067 () Bool)

(declare-fun res!161529 () Bool)

(declare-fun e!191176 () Bool)

(assert (=> d!68067 (=> res!161529 e!191176)))

(assert (=> d!68067 (= res!161529 (bvsge #b00000000000000000000000000000000 (size!7666 a!3293)))))

(assert (=> d!68067 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709) e!191176)))

(declare-fun b!304073 () Bool)

(assert (=> b!304073 (= e!191176 e!191175)))

(declare-fun c!48870 () Bool)

(assert (=> b!304073 (= c!48870 (validKeyInArray!0 (select (arr!7314 a!3293) #b00000000000000000000000000000000)))))

(declare-fun bm!25894 () Bool)

(assert (=> bm!25894 (= call!25897 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3293 mask!3709))))

(assert (= (and d!68067 (not res!161529)) b!304073))

(assert (= (and b!304073 c!48870) b!304071))

(assert (= (and b!304073 (not c!48870)) b!304070))

(assert (= (and b!304071 res!161530) b!304072))

(assert (= (or b!304072 b!304070) bm!25894))

(declare-fun m!315293 () Bool)

(assert (=> b!304071 m!315293))

(declare-fun m!315295 () Bool)

(assert (=> b!304071 m!315295))

(declare-fun m!315297 () Bool)

(assert (=> b!304071 m!315297))

(assert (=> b!304071 m!315293))

(declare-fun m!315299 () Bool)

(assert (=> b!304071 m!315299))

(assert (=> b!304073 m!315293))

(assert (=> b!304073 m!315293))

(declare-fun m!315301 () Bool)

(assert (=> b!304073 m!315301))

(declare-fun m!315303 () Bool)

(assert (=> bm!25894 m!315303))

(assert (=> b!303980 d!68067))

(declare-fun d!68071 () Bool)

(assert (=> d!68071 (= (validMask!0 mask!3709) (and (or (= mask!3709 #b00000000000000000000000000000111) (= mask!3709 #b00000000000000000000000000001111) (= mask!3709 #b00000000000000000000000000011111) (= mask!3709 #b00000000000000000000000000111111) (= mask!3709 #b00000000000000000000000001111111) (= mask!3709 #b00000000000000000000000011111111) (= mask!3709 #b00000000000000000000000111111111) (= mask!3709 #b00000000000000000000001111111111) (= mask!3709 #b00000000000000000000011111111111) (= mask!3709 #b00000000000000000000111111111111) (= mask!3709 #b00000000000000000001111111111111) (= mask!3709 #b00000000000000000011111111111111) (= mask!3709 #b00000000000000000111111111111111) (= mask!3709 #b00000000000000001111111111111111) (= mask!3709 #b00000000000000011111111111111111) (= mask!3709 #b00000000000000111111111111111111) (= mask!3709 #b00000000000001111111111111111111) (= mask!3709 #b00000000000011111111111111111111) (= mask!3709 #b00000000000111111111111111111111) (= mask!3709 #b00000000001111111111111111111111) (= mask!3709 #b00000000011111111111111111111111) (= mask!3709 #b00000000111111111111111111111111) (= mask!3709 #b00000001111111111111111111111111) (= mask!3709 #b00000011111111111111111111111111) (= mask!3709 #b00000111111111111111111111111111) (= mask!3709 #b00001111111111111111111111111111) (= mask!3709 #b00011111111111111111111111111111) (= mask!3709 #b00111111111111111111111111111111)) (bvsle mask!3709 #b00111111111111111111111111111111)))))

(assert (=> start!30346 d!68071))

(declare-fun d!68077 () Bool)

(assert (=> d!68077 (= (array_inv!5277 a!3293) (bvsge (size!7666 a!3293) #b00000000000000000000000000000000))))

(assert (=> start!30346 d!68077))

(declare-fun d!68079 () Bool)

(declare-fun lt!150339 () (_ BitVec 32))

(assert (=> d!68079 (and (bvsge lt!150339 #b00000000000000000000000000000000) (bvslt lt!150339 (bvadd mask!3709 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!68079 (= lt!150339 (choose!52 index!1781 x!1427 mask!3709))))

(assert (=> d!68079 (validMask!0 mask!3709)))

(assert (=> d!68079 (= (nextIndex!0 index!1781 x!1427 mask!3709) lt!150339)))

(declare-fun bs!10710 () Bool)

(assert (= bs!10710 d!68079))

(declare-fun m!315305 () Bool)

(assert (=> bs!10710 m!315305))

(assert (=> bs!10710 m!315233))

(assert (=> b!303984 d!68079))

(declare-fun d!68081 () Bool)

(declare-fun res!161535 () Bool)

(declare-fun e!191181 () Bool)

(assert (=> d!68081 (=> res!161535 e!191181)))

(assert (=> d!68081 (= res!161535 (= (select (arr!7314 a!3293) #b00000000000000000000000000000000) k0!2441))))

(assert (=> d!68081 (= (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000) e!191181)))

(declare-fun b!304078 () Bool)

(declare-fun e!191182 () Bool)

(assert (=> b!304078 (= e!191181 e!191182)))

(declare-fun res!161536 () Bool)

(assert (=> b!304078 (=> (not res!161536) (not e!191182))))

(assert (=> b!304078 (= res!161536 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7666 a!3293)))))

(declare-fun b!304079 () Bool)

(assert (=> b!304079 (= e!191182 (arrayContainsKey!0 a!3293 k0!2441 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!68081 (not res!161535)) b!304078))

(assert (= (and b!304078 res!161536) b!304079))

(assert (=> d!68081 m!315293))

(declare-fun m!315307 () Bool)

(assert (=> b!304079 m!315307))

(assert (=> b!303982 d!68081))

(declare-fun b!304146 () Bool)

(declare-fun e!191221 () SeekEntryResult!2454)

(declare-fun lt!150358 () SeekEntryResult!2454)

(assert (=> b!304146 (= e!191221 (MissingZero!2454 (index!11994 lt!150358)))))

(declare-fun b!304147 () Bool)

(declare-fun e!191219 () SeekEntryResult!2454)

(declare-fun e!191220 () SeekEntryResult!2454)

(assert (=> b!304147 (= e!191219 e!191220)))

(declare-fun lt!150359 () (_ BitVec 64))

(assert (=> b!304147 (= lt!150359 (select (arr!7314 a!3293) (index!11994 lt!150358)))))

(declare-fun c!48896 () Bool)

(assert (=> b!304147 (= c!48896 (= lt!150359 k0!2441))))

(declare-fun b!304148 () Bool)

(declare-fun c!48895 () Bool)

(assert (=> b!304148 (= c!48895 (= lt!150359 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!304148 (= e!191220 e!191221)))

(declare-fun b!304149 () Bool)

(assert (=> b!304149 (= e!191219 Undefined!2454)))

(declare-fun d!68083 () Bool)

(declare-fun lt!150360 () SeekEntryResult!2454)

(assert (=> d!68083 (and (or ((_ is Undefined!2454) lt!150360) (not ((_ is Found!2454) lt!150360)) (and (bvsge (index!11993 lt!150360) #b00000000000000000000000000000000) (bvslt (index!11993 lt!150360) (size!7666 a!3293)))) (or ((_ is Undefined!2454) lt!150360) ((_ is Found!2454) lt!150360) (not ((_ is MissingZero!2454) lt!150360)) (and (bvsge (index!11992 lt!150360) #b00000000000000000000000000000000) (bvslt (index!11992 lt!150360) (size!7666 a!3293)))) (or ((_ is Undefined!2454) lt!150360) ((_ is Found!2454) lt!150360) ((_ is MissingZero!2454) lt!150360) (not ((_ is MissingVacant!2454) lt!150360)) (and (bvsge (index!11995 lt!150360) #b00000000000000000000000000000000) (bvslt (index!11995 lt!150360) (size!7666 a!3293)))) (or ((_ is Undefined!2454) lt!150360) (ite ((_ is Found!2454) lt!150360) (= (select (arr!7314 a!3293) (index!11993 lt!150360)) k0!2441) (ite ((_ is MissingZero!2454) lt!150360) (= (select (arr!7314 a!3293) (index!11992 lt!150360)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!2454) lt!150360) (= (select (arr!7314 a!3293) (index!11995 lt!150360)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!68083 (= lt!150360 e!191219)))

(declare-fun c!48897 () Bool)

(assert (=> d!68083 (= c!48897 (and ((_ is Intermediate!2454) lt!150358) (undefined!3266 lt!150358)))))

(assert (=> d!68083 (= lt!150358 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709))))

(assert (=> d!68083 (validMask!0 mask!3709)))

(assert (=> d!68083 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) lt!150360)))

(declare-fun b!304150 () Bool)

(assert (=> b!304150 (= e!191220 (Found!2454 (index!11994 lt!150358)))))

(declare-fun b!304151 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15452 (_ BitVec 32)) SeekEntryResult!2454)

(assert (=> b!304151 (= e!191221 (seekKeyOrZeroReturnVacant!0 (x!30247 lt!150358) (index!11994 lt!150358) (index!11994 lt!150358) k0!2441 a!3293 mask!3709))))

(assert (= (and d!68083 c!48897) b!304149))

(assert (= (and d!68083 (not c!48897)) b!304147))

(assert (= (and b!304147 c!48896) b!304150))

(assert (= (and b!304147 (not c!48896)) b!304148))

(assert (= (and b!304148 c!48895) b!304146))

(assert (= (and b!304148 (not c!48895)) b!304151))

(declare-fun m!315325 () Bool)

(assert (=> b!304147 m!315325))

(declare-fun m!315327 () Bool)

(assert (=> d!68083 m!315327))

(assert (=> d!68083 m!315237))

(declare-fun m!315329 () Bool)

(assert (=> d!68083 m!315329))

(assert (=> d!68083 m!315233))

(assert (=> d!68083 m!315237))

(assert (=> d!68083 m!315239))

(declare-fun m!315331 () Bool)

(assert (=> d!68083 m!315331))

(declare-fun m!315333 () Bool)

(assert (=> b!304151 m!315333))

(assert (=> b!303977 d!68083))

(declare-fun b!304152 () Bool)

(declare-fun lt!150365 () SeekEntryResult!2454)

(assert (=> b!304152 (and (bvsge (index!11994 lt!150365) #b00000000000000000000000000000000) (bvslt (index!11994 lt!150365) (size!7666 a!3293)))))

(declare-fun res!161558 () Bool)

(assert (=> b!304152 (= res!161558 (= (select (arr!7314 a!3293) (index!11994 lt!150365)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!191226 () Bool)

(assert (=> b!304152 (=> res!161558 e!191226)))

(declare-fun b!304153 () Bool)

(declare-fun e!191224 () SeekEntryResult!2454)

(assert (=> b!304153 (= e!191224 (Intermediate!2454 true index!1781 x!1427))))

(declare-fun b!304154 () Bool)

(declare-fun e!191223 () SeekEntryResult!2454)

(assert (=> b!304154 (= e!191223 (Intermediate!2454 false index!1781 x!1427))))

(declare-fun b!304155 () Bool)

(assert (=> b!304155 (= e!191223 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1427 #b00000000000000000000000000000001) (nextIndex!0 index!1781 x!1427 mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun d!68089 () Bool)

(declare-fun e!191225 () Bool)

(assert (=> d!68089 e!191225))

(declare-fun c!48898 () Bool)

(assert (=> d!68089 (= c!48898 (and ((_ is Intermediate!2454) lt!150365) (undefined!3266 lt!150365)))))

(assert (=> d!68089 (= lt!150365 e!191224)))

(declare-fun c!48899 () Bool)

(assert (=> d!68089 (= c!48899 (bvsge x!1427 #b01111111111111111111111111111110))))

(declare-fun lt!150366 () (_ BitVec 64))

(assert (=> d!68089 (= lt!150366 (select (arr!7314 a!3293) index!1781))))

(assert (=> d!68089 (validMask!0 mask!3709)))

(assert (=> d!68089 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!150365)))

(declare-fun b!304156 () Bool)

(assert (=> b!304156 (= e!191224 e!191223)))

(declare-fun c!48900 () Bool)

(assert (=> b!304156 (= c!48900 (or (= lt!150366 k0!2441) (= (bvadd lt!150366 lt!150366) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!304157 () Bool)

(assert (=> b!304157 (= e!191225 (bvsge (x!30247 lt!150365) #b01111111111111111111111111111110))))

(declare-fun b!304158 () Bool)

(assert (=> b!304158 (and (bvsge (index!11994 lt!150365) #b00000000000000000000000000000000) (bvslt (index!11994 lt!150365) (size!7666 a!3293)))))

(declare-fun res!161557 () Bool)

(assert (=> b!304158 (= res!161557 (= (select (arr!7314 a!3293) (index!11994 lt!150365)) k0!2441))))

(assert (=> b!304158 (=> res!161557 e!191226)))

(declare-fun e!191222 () Bool)

(assert (=> b!304158 (= e!191222 e!191226)))

(declare-fun b!304159 () Bool)

(assert (=> b!304159 (= e!191225 e!191222)))

(declare-fun res!161559 () Bool)

(assert (=> b!304159 (= res!161559 (and ((_ is Intermediate!2454) lt!150365) (not (undefined!3266 lt!150365)) (bvslt (x!30247 lt!150365) #b01111111111111111111111111111110) (bvsge (x!30247 lt!150365) #b00000000000000000000000000000000) (bvsge (x!30247 lt!150365) x!1427)))))

(assert (=> b!304159 (=> (not res!161559) (not e!191222))))

(declare-fun b!304160 () Bool)

(assert (=> b!304160 (and (bvsge (index!11994 lt!150365) #b00000000000000000000000000000000) (bvslt (index!11994 lt!150365) (size!7666 a!3293)))))

(assert (=> b!304160 (= e!191226 (= (select (arr!7314 a!3293) (index!11994 lt!150365)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!68089 c!48899) b!304153))

(assert (= (and d!68089 (not c!48899)) b!304156))

(assert (= (and b!304156 c!48900) b!304154))

(assert (= (and b!304156 (not c!48900)) b!304155))

(assert (= (and d!68089 c!48898) b!304157))

(assert (= (and d!68089 (not c!48898)) b!304159))

(assert (= (and b!304159 res!161559) b!304158))

(assert (= (and b!304158 (not res!161557)) b!304152))

(assert (= (and b!304152 (not res!161558)) b!304160))

(declare-fun m!315335 () Bool)

(assert (=> b!304160 m!315335))

(assert (=> b!304155 m!315231))

(assert (=> b!304155 m!315231))

(declare-fun m!315337 () Bool)

(assert (=> b!304155 m!315337))

(assert (=> b!304152 m!315335))

(assert (=> b!304158 m!315335))

(assert (=> d!68089 m!315229))

(assert (=> d!68089 m!315233))

(assert (=> b!303983 d!68089))

(check-sat (not d!68079) (not d!68089) (not b!304073) (not b!304071) (not d!68083) (not b!304079) (not b!304151) (not b!304155) (not bm!25894) (not d!68053) (not b!304044))
(check-sat)
