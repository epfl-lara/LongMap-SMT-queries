; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25504 () Bool)

(assert start!25504)

(declare-fun b!265190 () Bool)

(declare-fun res!129636 () Bool)

(declare-fun e!171740 () Bool)

(assert (=> b!265190 (=> (not res!129636) (not e!171740))))

(declare-datatypes ((array!12767 0))(
  ( (array!12768 (arr!6041 (Array (_ BitVec 32) (_ BitVec 64))) (size!6393 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12767)

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!265190 (= res!129636 (and (= (size!6393 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6393 a!3436))))))

(declare-fun b!265191 () Bool)

(declare-fun res!129632 () Bool)

(assert (=> b!265191 (=> (not res!129632) (not e!171740))))

(declare-fun k!2698 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!12767 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!265191 (= res!129632 (not (arrayContainsKey!0 a!3436 k!2698 #b00000000000000000000000000000000)))))

(declare-fun b!265192 () Bool)

(declare-fun res!129633 () Bool)

(declare-fun e!171739 () Bool)

(assert (=> b!265192 (=> (not res!129633) (not e!171739))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12767 (_ BitVec 32)) Bool)

(assert (=> b!265192 (= res!129633 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(declare-fun b!265193 () Bool)

(declare-datatypes ((List!3855 0))(
  ( (Nil!3852) (Cons!3851 (h!4518 (_ BitVec 64)) (t!8937 List!3855)) )
))
(declare-fun noDuplicate!104 (List!3855) Bool)

(assert (=> b!265193 (= e!171739 (not (noDuplicate!104 Nil!3852)))))

(declare-fun b!265194 () Bool)

(declare-fun res!129634 () Bool)

(assert (=> b!265194 (=> (not res!129634) (not e!171740))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!265194 (= res!129634 (validKeyInArray!0 k!2698))))

(declare-fun b!265195 () Bool)

(assert (=> b!265195 (= e!171740 e!171739)))

(declare-fun res!129635 () Bool)

(assert (=> b!265195 (=> (not res!129635) (not e!171739))))

(declare-datatypes ((SeekEntryResult!1232 0))(
  ( (MissingZero!1232 (index!7098 (_ BitVec 32))) (Found!1232 (index!7099 (_ BitVec 32))) (Intermediate!1232 (undefined!2044 Bool) (index!7100 (_ BitVec 32)) (x!25421 (_ BitVec 32))) (Undefined!1232) (MissingVacant!1232 (index!7101 (_ BitVec 32))) )
))
(declare-fun lt!134023 () SeekEntryResult!1232)

(assert (=> b!265195 (= res!129635 (or (= lt!134023 (MissingZero!1232 i!1355)) (= lt!134023 (MissingVacant!1232 i!1355))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12767 (_ BitVec 32)) SeekEntryResult!1232)

(assert (=> b!265195 (= lt!134023 (seekEntryOrOpen!0 k!2698 a!3436 mask!4002))))

(declare-fun b!265196 () Bool)

(declare-fun res!129630 () Bool)

(assert (=> b!265196 (=> (not res!129630) (not e!171739))))

(assert (=> b!265196 (= res!129630 (and (bvsle #b00000000000000000000000000000000 (size!6393 a!3436)) (bvslt (size!6393 a!3436) #b01111111111111111111111111111111)))))

(declare-fun res!129631 () Bool)

(assert (=> start!25504 (=> (not res!129631) (not e!171740))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25504 (= res!129631 (validMask!0 mask!4002))))

(assert (=> start!25504 e!171740))

(assert (=> start!25504 true))

(declare-fun array_inv!4004 (array!12767) Bool)

(assert (=> start!25504 (array_inv!4004 a!3436)))

(assert (= (and start!25504 res!129631) b!265190))

(assert (= (and b!265190 res!129636) b!265194))

(assert (= (and b!265194 res!129634) b!265191))

(assert (= (and b!265191 res!129632) b!265195))

(assert (= (and b!265195 res!129635) b!265192))

(assert (= (and b!265192 res!129633) b!265196))

(assert (= (and b!265196 res!129630) b!265193))

(declare-fun m!282057 () Bool)

(assert (=> b!265193 m!282057))

(declare-fun m!282059 () Bool)

(assert (=> b!265195 m!282059))

(declare-fun m!282061 () Bool)

(assert (=> b!265192 m!282061))

(declare-fun m!282063 () Bool)

(assert (=> b!265191 m!282063))

(declare-fun m!282065 () Bool)

(assert (=> b!265194 m!282065))

(declare-fun m!282067 () Bool)

(assert (=> start!25504 m!282067))

(declare-fun m!282069 () Bool)

(assert (=> start!25504 m!282069))

(push 1)

(assert (not start!25504))

(assert (not b!265192))

(assert (not b!265195))

(assert (not b!265194))

(assert (not b!265191))

(assert (not b!265193))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!64147 () Bool)

(assert (=> d!64147 (= (validMask!0 mask!4002) (and (or (= mask!4002 #b00000000000000000000000000000111) (= mask!4002 #b00000000000000000000000000001111) (= mask!4002 #b00000000000000000000000000011111) (= mask!4002 #b00000000000000000000000000111111) (= mask!4002 #b00000000000000000000000001111111) (= mask!4002 #b00000000000000000000000011111111) (= mask!4002 #b00000000000000000000000111111111) (= mask!4002 #b00000000000000000000001111111111) (= mask!4002 #b00000000000000000000011111111111) (= mask!4002 #b00000000000000000000111111111111) (= mask!4002 #b00000000000000000001111111111111) (= mask!4002 #b00000000000000000011111111111111) (= mask!4002 #b00000000000000000111111111111111) (= mask!4002 #b00000000000000001111111111111111) (= mask!4002 #b00000000000000011111111111111111) (= mask!4002 #b00000000000000111111111111111111) (= mask!4002 #b00000000000001111111111111111111) (= mask!4002 #b00000000000011111111111111111111) (= mask!4002 #b00000000000111111111111111111111) (= mask!4002 #b00000000001111111111111111111111) (= mask!4002 #b00000000011111111111111111111111) (= mask!4002 #b00000000111111111111111111111111) (= mask!4002 #b00000001111111111111111111111111) (= mask!4002 #b00000011111111111111111111111111) (= mask!4002 #b00000111111111111111111111111111) (= mask!4002 #b00001111111111111111111111111111) (= mask!4002 #b00011111111111111111111111111111) (= mask!4002 #b00111111111111111111111111111111)) (bvsle mask!4002 #b00111111111111111111111111111111)))))

(assert (=> start!25504 d!64147))

(declare-fun d!64153 () Bool)

(assert (=> d!64153 (= (array_inv!4004 a!3436) (bvsge (size!6393 a!3436) #b00000000000000000000000000000000))))

(assert (=> start!25504 d!64153))

(declare-fun d!64155 () Bool)

(declare-fun res!129695 () Bool)

(declare-fun e!171775 () Bool)

(assert (=> d!64155 (=> res!129695 e!171775)))

(assert (=> d!64155 (= res!129695 (= (select (arr!6041 a!3436) #b00000000000000000000000000000000) k!2698))))

(assert (=> d!64155 (= (arrayContainsKey!0 a!3436 k!2698 #b00000000000000000000000000000000) e!171775)))

(declare-fun b!265255 () Bool)

(declare-fun e!171776 () Bool)

(assert (=> b!265255 (= e!171775 e!171776)))

(declare-fun res!129696 () Bool)

(assert (=> b!265255 (=> (not res!129696) (not e!171776))))

(assert (=> b!265255 (= res!129696 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6393 a!3436)))))

(declare-fun b!265256 () Bool)

(assert (=> b!265256 (= e!171776 (arrayContainsKey!0 a!3436 k!2698 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!64155 (not res!129695)) b!265255))

(assert (= (and b!265255 res!129696) b!265256))

(declare-fun m!282107 () Bool)

(assert (=> d!64155 m!282107))

(declare-fun m!282109 () Bool)

(assert (=> b!265256 m!282109))

(assert (=> b!265191 d!64155))

(declare-fun d!64157 () Bool)

(assert (=> d!64157 (= (validKeyInArray!0 k!2698) (and (not (= k!2698 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2698 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!265194 d!64157))

(declare-fun lt!134056 () SeekEntryResult!1232)

(declare-fun e!171802 () SeekEntryResult!1232)

(declare-fun b!265299 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12767 (_ BitVec 32)) SeekEntryResult!1232)

(assert (=> b!265299 (= e!171802 (seekKeyOrZeroReturnVacant!0 (x!25421 lt!134056) (index!7100 lt!134056) (index!7100 lt!134056) k!2698 a!3436 mask!4002))))

(declare-fun b!265300 () Bool)

(assert (=> b!265300 (= e!171802 (MissingZero!1232 (index!7100 lt!134056)))))

(declare-fun b!265301 () Bool)

(declare-fun e!171803 () SeekEntryResult!1232)

(assert (=> b!265301 (= e!171803 (Found!1232 (index!7100 lt!134056)))))

(declare-fun b!265302 () Bool)

(declare-fun c!45349 () Bool)

(declare-fun lt!134054 () (_ BitVec 64))

(assert (=> b!265302 (= c!45349 (= lt!134054 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!265302 (= e!171803 e!171802)))

(declare-fun b!265303 () Bool)

(declare-fun e!171801 () SeekEntryResult!1232)

(assert (=> b!265303 (= e!171801 e!171803)))

(assert (=> b!265303 (= lt!134054 (select (arr!6041 a!3436) (index!7100 lt!134056)))))

(declare-fun c!45351 () Bool)

(assert (=> b!265303 (= c!45351 (= lt!134054 k!2698))))

(declare-fun b!265304 () Bool)

(assert (=> b!265304 (= e!171801 Undefined!1232)))

(declare-fun d!64159 () Bool)

(declare-fun lt!134055 () SeekEntryResult!1232)

(assert (=> d!64159 (and (or (is-Undefined!1232 lt!134055) (not (is-Found!1232 lt!134055)) (and (bvsge (index!7099 lt!134055) #b00000000000000000000000000000000) (bvslt (index!7099 lt!134055) (size!6393 a!3436)))) (or (is-Undefined!1232 lt!134055) (is-Found!1232 lt!134055) (not (is-MissingZero!1232 lt!134055)) (and (bvsge (index!7098 lt!134055) #b00000000000000000000000000000000) (bvslt (index!7098 lt!134055) (size!6393 a!3436)))) (or (is-Undefined!1232 lt!134055) (is-Found!1232 lt!134055) (is-MissingZero!1232 lt!134055) (not (is-MissingVacant!1232 lt!134055)) (and (bvsge (index!7101 lt!134055) #b00000000000000000000000000000000) (bvslt (index!7101 lt!134055) (size!6393 a!3436)))) (or (is-Undefined!1232 lt!134055) (ite (is-Found!1232 lt!134055) (= (select (arr!6041 a!3436) (index!7099 lt!134055)) k!2698) (ite (is-MissingZero!1232 lt!134055) (= (select (arr!6041 a!3436) (index!7098 lt!134055)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!1232 lt!134055) (= (select (arr!6041 a!3436) (index!7101 lt!134055)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!64159 (= lt!134055 e!171801)))

(declare-fun c!45350 () Bool)

(assert (=> d!64159 (= c!45350 (and (is-Intermediate!1232 lt!134056) (undefined!2044 lt!134056)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12767 (_ BitVec 32)) SeekEntryResult!1232)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!64159 (= lt!134056 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2698 mask!4002) k!2698 a!3436 mask!4002))))

(assert (=> d!64159 (validMask!0 mask!4002)))

(assert (=> d!64159 (= (seekEntryOrOpen!0 k!2698 a!3436 mask!4002) lt!134055)))

(assert (= (and d!64159 c!45350) b!265304))

(assert (= (and d!64159 (not c!45350)) b!265303))

(assert (= (and b!265303 c!45351) b!265301))

(assert (= (and b!265303 (not c!45351)) b!265302))

(assert (= (and b!265302 c!45349) b!265300))

(assert (= (and b!265302 (not c!45349)) b!265299))

(declare-fun m!282137 () Bool)

(assert (=> b!265299 m!282137))

(declare-fun m!282139 () Bool)

(assert (=> b!265303 m!282139))

(declare-fun m!282141 () Bool)

(assert (=> d!64159 m!282141))

(declare-fun m!282143 () Bool)

(assert (=> d!64159 m!282143))

(assert (=> d!64159 m!282141))

(declare-fun m!282145 () Bool)

(assert (=> d!64159 m!282145))

(declare-fun m!282147 () Bool)

(assert (=> d!64159 m!282147))

(assert (=> d!64159 m!282067))

(declare-fun m!282149 () Bool)

(assert (=> d!64159 m!282149))

(assert (=> b!265195 d!64159))

(declare-fun d!64167 () Bool)

(declare-fun res!129707 () Bool)

(declare-fun e!171808 () Bool)

(assert (=> d!64167 (=> res!129707 e!171808)))

(assert (=> d!64167 (= res!129707 (is-Nil!3852 Nil!3852))))

(assert (=> d!64167 (= (noDuplicate!104 Nil!3852) e!171808)))

(declare-fun b!265309 () Bool)

(declare-fun e!171809 () Bool)

(assert (=> b!265309 (= e!171808 e!171809)))

(declare-fun res!129708 () Bool)

(assert (=> b!265309 (=> (not res!129708) (not e!171809))))

(declare-fun contains!1916 (List!3855 (_ BitVec 64)) Bool)

(assert (=> b!265309 (= res!129708 (not (contains!1916 (t!8937 Nil!3852) (h!4518 Nil!3852))))))

(declare-fun b!265310 () Bool)

(assert (=> b!265310 (= e!171809 (noDuplicate!104 (t!8937 Nil!3852)))))

(assert (= (and d!64167 (not res!129707)) b!265309))

(assert (= (and b!265309 res!129708) b!265310))

(declare-fun m!282151 () Bool)

(assert (=> b!265309 m!282151))

(declare-fun m!282153 () Bool)

(assert (=> b!265310 m!282153))

(assert (=> b!265193 d!64167))

(declare-fun bm!25327 () Bool)

(declare-fun call!25330 () Bool)

(assert (=> bm!25327 (= call!25330 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3436 mask!4002))))

(declare-fun b!265331 () Bool)

(declare-fun e!171826 () Bool)

(assert (=> b!265331 (= e!171826 call!25330)))

(declare-fun d!64171 () Bool)

(declare-fun res!129720 () Bool)

(declare-fun e!171827 () Bool)

(assert (=> d!64171 (=> res!129720 e!171827)))

(assert (=> d!64171 (= res!129720 (bvsge #b00000000000000000000000000000000 (size!6393 a!3436)))))

(assert (=> d!64171 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002) e!171827)))

(declare-fun b!265332 () Bool)

(assert (=> b!265332 (= e!171827 e!171826)))

(declare-fun c!45357 () Bool)

(assert (=> b!265332 (= c!45357 (validKeyInArray!0 (select (arr!6041 a!3436) #b00000000000000000000000000000000)))))

(declare-fun b!265333 () Bool)

(declare-fun e!171825 () Bool)

(assert (=> b!265333 (= e!171825 call!25330)))

(declare-fun b!265334 () Bool)

(assert (=> b!265334 (= e!171826 e!171825)))

(declare-fun lt!134073 () (_ BitVec 64))

(assert (=> b!265334 (= lt!134073 (select (arr!6041 a!3436) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!8257 0))(
  ( (Unit!8258) )
))
(declare-fun lt!134074 () Unit!8257)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!12767 (_ BitVec 64) (_ BitVec 32)) Unit!8257)

(assert (=> b!265334 (= lt!134074 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3436 lt!134073 #b00000000000000000000000000000000))))

(assert (=> b!265334 (arrayContainsKey!0 a!3436 lt!134073 #b00000000000000000000000000000000)))

(declare-fun lt!134072 () Unit!8257)

(assert (=> b!265334 (= lt!134072 lt!134074)))

(declare-fun res!129719 () Bool)

(assert (=> b!265334 (= res!129719 (= (seekEntryOrOpen!0 (select (arr!6041 a!3436) #b00000000000000000000000000000000) a!3436 mask!4002) (Found!1232 #b00000000000000000000000000000000)))))

(assert (=> b!265334 (=> (not res!129719) (not e!171825))))

(assert (= (and d!64171 (not res!129720)) b!265332))

(assert (= (and b!265332 c!45357) b!265334))

(assert (= (and b!265332 (not c!45357)) b!265331))

(assert (= (and b!265334 res!129719) b!265333))

(assert (= (or b!265333 b!265331) bm!25327))

(declare-fun m!282167 () Bool)

(assert (=> bm!25327 m!282167))

(assert (=> b!265332 m!282107))

(assert (=> b!265332 m!282107))

(declare-fun m!282169 () Bool)

(assert (=> b!265332 m!282169))

(assert (=> b!265334 m!282107))

(declare-fun m!282171 () Bool)

(assert (=> b!265334 m!282171))

(declare-fun m!282173 () Bool)

(assert (=> b!265334 m!282173))

(assert (=> b!265334 m!282107))

(declare-fun m!282175 () Bool)

(assert (=> b!265334 m!282175))

(assert (=> b!265192 d!64171))

(push 1)

(assert (not b!265334))

(assert (not b!265309))

(assert (not d!64159))

(assert (not b!265310))

(assert (not b!265256))

(assert (not b!265299))

(assert (not b!265332))

(assert (not bm!25327))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

