; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7004 () Bool)

(assert start!7004)

(declare-fun res!26540 () Bool)

(declare-fun e!28727 () Bool)

(assert (=> start!7004 (=> (not res!26540) (not e!28727))))

(declare-datatypes ((array!2997 0))(
  ( (array!2998 (arr!1442 (Array (_ BitVec 32) (_ BitVec 64))) (size!1660 (_ BitVec 32))) )
))
(declare-fun a!4412 () array!2997)

(declare-fun size!30 () (_ BitVec 32))

(declare-fun i!1489 () (_ BitVec 32))

(assert (=> start!7004 (= res!26540 (and (bvslt (size!1660 a!4412) #b01111111111111111111111111111111) (bvsge i!1489 #b00000000000000000000000000000000) (bvsle i!1489 (size!1660 a!4412)) (= (size!1660 a!4412) size!30) (= a!4412 (array!2998 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!30)) (not (= i!1489 size!30)) (= (select (arr!1442 a!4412) i!1489) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 i!1489) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1489) (size!1660 a!4412))))))

(assert (=> start!7004 e!28727))

(declare-fun array_inv!845 (array!2997) Bool)

(assert (=> start!7004 (array_inv!845 a!4412)))

(assert (=> start!7004 true))

(declare-fun b!45217 () Bool)

(declare-fun arrayCountValidKeys!0 (array!2997 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!45217 (= e!28727 (not (= (arrayCountValidKeys!0 a!4412 i!1489 size!30) #b00000000000000000000000000000000)))))

(assert (=> b!45217 (= (arrayCountValidKeys!0 a!4412 (bvadd #b00000000000000000000000000000001 i!1489) size!30) #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!1278 0))(
  ( (Unit!1279) )
))
(declare-fun lt!20044 () Unit!1278)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2997 (_ BitVec 32) (_ BitVec 32)) Unit!1278)

(assert (=> b!45217 (= lt!20044 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 a!4412 (bvadd #b00000000000000000000000000000001 i!1489) size!30))))

(assert (= (and start!7004 res!26540) b!45217))

(declare-fun m!39667 () Bool)

(assert (=> start!7004 m!39667))

(declare-fun m!39669 () Bool)

(assert (=> start!7004 m!39669))

(declare-fun m!39671 () Bool)

(assert (=> b!45217 m!39671))

(declare-fun m!39673 () Bool)

(assert (=> b!45217 m!39673))

(declare-fun m!39675 () Bool)

(assert (=> b!45217 m!39675))

(check-sat (not b!45217) (not start!7004))
(check-sat)
(get-model)

(declare-fun b!45232 () Bool)

(declare-fun e!28746 () (_ BitVec 32))

(declare-fun e!28745 () (_ BitVec 32))

(assert (=> b!45232 (= e!28746 e!28745)))

(declare-fun c!6063 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!45232 (= c!6063 (validKeyInArray!0 (select (arr!1442 a!4412) i!1489)))))

(declare-fun d!8783 () Bool)

(declare-fun lt!20053 () (_ BitVec 32))

(assert (=> d!8783 (and (bvsge lt!20053 #b00000000000000000000000000000000) (bvsle lt!20053 (bvsub (size!1660 a!4412) i!1489)))))

(assert (=> d!8783 (= lt!20053 e!28746)))

(declare-fun c!6064 () Bool)

(assert (=> d!8783 (= c!6064 (bvsge i!1489 size!30))))

(assert (=> d!8783 (and (bvsle i!1489 size!30) (bvsge i!1489 #b00000000000000000000000000000000) (bvsle size!30 (size!1660 a!4412)))))

(assert (=> d!8783 (= (arrayCountValidKeys!0 a!4412 i!1489 size!30) lt!20053)))

(declare-fun b!45233 () Bool)

(assert (=> b!45233 (= e!28746 #b00000000000000000000000000000000)))

(declare-fun call!3675 () (_ BitVec 32))

(declare-fun bm!3672 () Bool)

(assert (=> bm!3672 (= call!3675 (arrayCountValidKeys!0 a!4412 (bvadd i!1489 #b00000000000000000000000000000001) size!30))))

(declare-fun b!45234 () Bool)

(assert (=> b!45234 (= e!28745 (bvadd #b00000000000000000000000000000001 call!3675))))

(declare-fun b!45235 () Bool)

(assert (=> b!45235 (= e!28745 call!3675)))

(assert (= (and d!8783 c!6064) b!45233))

(assert (= (and d!8783 (not c!6064)) b!45232))

(assert (= (and b!45232 c!6063) b!45234))

(assert (= (and b!45232 (not c!6063)) b!45235))

(assert (= (or b!45234 b!45235) bm!3672))

(assert (=> b!45232 m!39667))

(assert (=> b!45232 m!39667))

(declare-fun m!39697 () Bool)

(assert (=> b!45232 m!39697))

(declare-fun m!39699 () Bool)

(assert (=> bm!3672 m!39699))

(assert (=> b!45217 d!8783))

(declare-fun b!45236 () Bool)

(declare-fun e!28748 () (_ BitVec 32))

(declare-fun e!28747 () (_ BitVec 32))

(assert (=> b!45236 (= e!28748 e!28747)))

(declare-fun c!6065 () Bool)

(assert (=> b!45236 (= c!6065 (validKeyInArray!0 (select (arr!1442 a!4412) (bvadd #b00000000000000000000000000000001 i!1489))))))

(declare-fun d!8785 () Bool)

(declare-fun lt!20054 () (_ BitVec 32))

(assert (=> d!8785 (and (bvsge lt!20054 #b00000000000000000000000000000000) (bvsle lt!20054 (bvsub (size!1660 a!4412) (bvadd #b00000000000000000000000000000001 i!1489))))))

(assert (=> d!8785 (= lt!20054 e!28748)))

(declare-fun c!6066 () Bool)

(assert (=> d!8785 (= c!6066 (bvsge (bvadd #b00000000000000000000000000000001 i!1489) size!30))))

(assert (=> d!8785 (and (bvsle (bvadd #b00000000000000000000000000000001 i!1489) size!30) (bvsge (bvadd #b00000000000000000000000000000001 i!1489) #b00000000000000000000000000000000) (bvsle size!30 (size!1660 a!4412)))))

(assert (=> d!8785 (= (arrayCountValidKeys!0 a!4412 (bvadd #b00000000000000000000000000000001 i!1489) size!30) lt!20054)))

(declare-fun b!45237 () Bool)

(assert (=> b!45237 (= e!28748 #b00000000000000000000000000000000)))

(declare-fun call!3676 () (_ BitVec 32))

(declare-fun bm!3673 () Bool)

(assert (=> bm!3673 (= call!3676 (arrayCountValidKeys!0 a!4412 (bvadd #b00000000000000000000000000000001 i!1489 #b00000000000000000000000000000001) size!30))))

(declare-fun b!45238 () Bool)

(assert (=> b!45238 (= e!28747 (bvadd #b00000000000000000000000000000001 call!3676))))

(declare-fun b!45239 () Bool)

(assert (=> b!45239 (= e!28747 call!3676)))

(assert (= (and d!8785 c!6066) b!45237))

(assert (= (and d!8785 (not c!6066)) b!45236))

(assert (= (and b!45236 c!6065) b!45238))

(assert (= (and b!45236 (not c!6065)) b!45239))

(assert (= (or b!45238 b!45239) bm!3673))

(declare-fun m!39701 () Bool)

(assert (=> b!45236 m!39701))

(assert (=> b!45236 m!39701))

(declare-fun m!39703 () Bool)

(assert (=> b!45236 m!39703))

(declare-fun m!39705 () Bool)

(assert (=> bm!3673 m!39705))

(assert (=> b!45217 d!8785))

(declare-fun d!8787 () Bool)

(assert (=> d!8787 (= (arrayCountValidKeys!0 a!4412 (bvadd #b00000000000000000000000000000001 i!1489) size!30) #b00000000000000000000000000000000)))

(declare-fun lt!20057 () Unit!1278)

(declare-fun choose!59 (array!2997 (_ BitVec 32) (_ BitVec 32)) Unit!1278)

(assert (=> d!8787 (= lt!20057 (choose!59 a!4412 (bvadd #b00000000000000000000000000000001 i!1489) size!30))))

(assert (=> d!8787 (bvslt (size!1660 a!4412) #b01111111111111111111111111111111)))

(assert (=> d!8787 (= (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 a!4412 (bvadd #b00000000000000000000000000000001 i!1489) size!30) lt!20057)))

(declare-fun bs!2112 () Bool)

(assert (= bs!2112 d!8787))

(assert (=> bs!2112 m!39673))

(declare-fun m!39707 () Bool)

(assert (=> bs!2112 m!39707))

(assert (=> b!45217 d!8787))

(declare-fun d!8791 () Bool)

(assert (=> d!8791 (= (array_inv!845 a!4412) (bvsge (size!1660 a!4412) #b00000000000000000000000000000000))))

(assert (=> start!7004 d!8791))

(check-sat (not bm!3673) (not d!8787) (not b!45236) (not b!45232) (not bm!3672))
(check-sat)
(get-model)

(declare-fun d!8807 () Bool)

(assert (=> d!8807 (= (validKeyInArray!0 (select (arr!1442 a!4412) (bvadd #b00000000000000000000000000000001 i!1489))) (and (not (= (select (arr!1442 a!4412) (bvadd #b00000000000000000000000000000001 i!1489)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1442 a!4412) (bvadd #b00000000000000000000000000000001 i!1489)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!45236 d!8807))

(declare-fun b!45272 () Bool)

(declare-fun e!28766 () (_ BitVec 32))

(declare-fun e!28765 () (_ BitVec 32))

(assert (=> b!45272 (= e!28766 e!28765)))

(declare-fun c!6083 () Bool)

(assert (=> b!45272 (= c!6083 (validKeyInArray!0 (select (arr!1442 a!4412) (bvadd #b00000000000000000000000000000001 i!1489 #b00000000000000000000000000000001))))))

(declare-fun d!8809 () Bool)

(declare-fun lt!20072 () (_ BitVec 32))

(assert (=> d!8809 (and (bvsge lt!20072 #b00000000000000000000000000000000) (bvsle lt!20072 (bvsub (size!1660 a!4412) (bvadd #b00000000000000000000000000000001 i!1489 #b00000000000000000000000000000001))))))

(assert (=> d!8809 (= lt!20072 e!28766)))

(declare-fun c!6084 () Bool)

(assert (=> d!8809 (= c!6084 (bvsge (bvadd #b00000000000000000000000000000001 i!1489 #b00000000000000000000000000000001) size!30))))

(assert (=> d!8809 (and (bvsle (bvadd #b00000000000000000000000000000001 i!1489 #b00000000000000000000000000000001) size!30) (bvsge (bvadd #b00000000000000000000000000000001 i!1489 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle size!30 (size!1660 a!4412)))))

(assert (=> d!8809 (= (arrayCountValidKeys!0 a!4412 (bvadd #b00000000000000000000000000000001 i!1489 #b00000000000000000000000000000001) size!30) lt!20072)))

(declare-fun b!45273 () Bool)

(assert (=> b!45273 (= e!28766 #b00000000000000000000000000000000)))

(declare-fun bm!3682 () Bool)

(declare-fun call!3685 () (_ BitVec 32))

(assert (=> bm!3682 (= call!3685 (arrayCountValidKeys!0 a!4412 (bvadd #b00000000000000000000000000000001 i!1489 #b00000000000000000000000000000001 #b00000000000000000000000000000001) size!30))))

(declare-fun b!45274 () Bool)

(assert (=> b!45274 (= e!28765 (bvadd #b00000000000000000000000000000001 call!3685))))

(declare-fun b!45275 () Bool)

(assert (=> b!45275 (= e!28765 call!3685)))

(assert (= (and d!8809 c!6084) b!45273))

(assert (= (and d!8809 (not c!6084)) b!45272))

(assert (= (and b!45272 c!6083) b!45274))

(assert (= (and b!45272 (not c!6083)) b!45275))

(assert (= (or b!45274 b!45275) bm!3682))

(declare-fun m!39733 () Bool)

(assert (=> b!45272 m!39733))

(assert (=> b!45272 m!39733))

(declare-fun m!39735 () Bool)

(assert (=> b!45272 m!39735))

(declare-fun m!39737 () Bool)

(assert (=> bm!3682 m!39737))

(assert (=> bm!3673 d!8809))

(declare-fun b!45276 () Bool)

(declare-fun e!28768 () (_ BitVec 32))

(declare-fun e!28767 () (_ BitVec 32))

(assert (=> b!45276 (= e!28768 e!28767)))

(declare-fun c!6085 () Bool)

(assert (=> b!45276 (= c!6085 (validKeyInArray!0 (select (arr!1442 a!4412) (bvadd i!1489 #b00000000000000000000000000000001))))))

(declare-fun d!8811 () Bool)

(declare-fun lt!20073 () (_ BitVec 32))

(assert (=> d!8811 (and (bvsge lt!20073 #b00000000000000000000000000000000) (bvsle lt!20073 (bvsub (size!1660 a!4412) (bvadd i!1489 #b00000000000000000000000000000001))))))

(assert (=> d!8811 (= lt!20073 e!28768)))

(declare-fun c!6086 () Bool)

(assert (=> d!8811 (= c!6086 (bvsge (bvadd i!1489 #b00000000000000000000000000000001) size!30))))

(assert (=> d!8811 (and (bvsle (bvadd i!1489 #b00000000000000000000000000000001) size!30) (bvsge (bvadd i!1489 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle size!30 (size!1660 a!4412)))))

(assert (=> d!8811 (= (arrayCountValidKeys!0 a!4412 (bvadd i!1489 #b00000000000000000000000000000001) size!30) lt!20073)))

(declare-fun b!45277 () Bool)

(assert (=> b!45277 (= e!28768 #b00000000000000000000000000000000)))

(declare-fun call!3686 () (_ BitVec 32))

(declare-fun bm!3683 () Bool)

(assert (=> bm!3683 (= call!3686 (arrayCountValidKeys!0 a!4412 (bvadd i!1489 #b00000000000000000000000000000001 #b00000000000000000000000000000001) size!30))))

(declare-fun b!45278 () Bool)

(assert (=> b!45278 (= e!28767 (bvadd #b00000000000000000000000000000001 call!3686))))

(declare-fun b!45279 () Bool)

(assert (=> b!45279 (= e!28767 call!3686)))

(assert (= (and d!8811 c!6086) b!45277))

(assert (= (and d!8811 (not c!6086)) b!45276))

(assert (= (and b!45276 c!6085) b!45278))

(assert (= (and b!45276 (not c!6085)) b!45279))

(assert (= (or b!45278 b!45279) bm!3683))

(declare-fun m!39739 () Bool)

(assert (=> b!45276 m!39739))

(assert (=> b!45276 m!39739))

(declare-fun m!39741 () Bool)

(assert (=> b!45276 m!39741))

(declare-fun m!39743 () Bool)

(assert (=> bm!3683 m!39743))

(assert (=> bm!3672 d!8811))

(assert (=> d!8787 d!8785))

(declare-fun d!8813 () Bool)

(assert (=> d!8813 (= (arrayCountValidKeys!0 a!4412 (bvadd #b00000000000000000000000000000001 i!1489) size!30) #b00000000000000000000000000000000)))

(assert (=> d!8813 true))

(declare-fun _$88!64 () Unit!1278)

(assert (=> d!8813 (= (choose!59 a!4412 (bvadd #b00000000000000000000000000000001 i!1489) size!30) _$88!64)))

(declare-fun bs!2115 () Bool)

(assert (= bs!2115 d!8813))

(assert (=> bs!2115 m!39673))

(assert (=> d!8787 d!8813))

(declare-fun d!8815 () Bool)

(assert (=> d!8815 (= (validKeyInArray!0 (select (arr!1442 a!4412) i!1489)) (and (not (= (select (arr!1442 a!4412) i!1489) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1442 a!4412) i!1489) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!45232 d!8815))

(check-sat (not bm!3683) (not d!8813) (not b!45276) (not b!45272) (not bm!3682))
(check-sat)
