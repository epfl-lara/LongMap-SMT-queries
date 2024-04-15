; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!6994 () Bool)

(assert start!6994)

(declare-fun res!26539 () Bool)

(declare-fun e!28711 () Bool)

(assert (=> start!6994 (=> (not res!26539) (not e!28711))))

(declare-datatypes ((array!2985 0))(
  ( (array!2986 (arr!1436 (Array (_ BitVec 32) (_ BitVec 64))) (size!1654 (_ BitVec 32))) )
))
(declare-fun a!4412 () array!2985)

(declare-fun i!1489 () (_ BitVec 32))

(declare-fun size!30 () (_ BitVec 32))

(assert (=> start!6994 (= res!26539 (and (bvslt (size!1654 a!4412) #b01111111111111111111111111111111) (bvsge i!1489 #b00000000000000000000000000000000) (bvsle i!1489 (size!1654 a!4412)) (= (size!1654 a!4412) size!30) (= a!4412 (array!2986 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!30)) (not (= i!1489 size!30)) (= (select (arr!1436 a!4412) i!1489) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 i!1489) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1489) (size!1654 a!4412))))))

(assert (=> start!6994 e!28711))

(declare-fun array_inv!859 (array!2985) Bool)

(assert (=> start!6994 (array_inv!859 a!4412)))

(assert (=> start!6994 true))

(declare-fun b!45194 () Bool)

(declare-fun arrayCountValidKeys!0 (array!2985 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!45194 (= e!28711 (not (= (arrayCountValidKeys!0 a!4412 i!1489 size!30) #b00000000000000000000000000000000)))))

(assert (=> b!45194 (= (arrayCountValidKeys!0 a!4412 (bvadd #b00000000000000000000000000000001 i!1489) size!30) #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!1272 0))(
  ( (Unit!1273) )
))
(declare-fun lt!20069 () Unit!1272)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2985 (_ BitVec 32) (_ BitVec 32)) Unit!1272)

(assert (=> b!45194 (= lt!20069 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 a!4412 (bvadd #b00000000000000000000000000000001 i!1489) size!30))))

(assert (= (and start!6994 res!26539) b!45194))

(declare-fun m!39695 () Bool)

(assert (=> start!6994 m!39695))

(declare-fun m!39697 () Bool)

(assert (=> start!6994 m!39697))

(declare-fun m!39699 () Bool)

(assert (=> b!45194 m!39699))

(declare-fun m!39701 () Bool)

(assert (=> b!45194 m!39701))

(declare-fun m!39703 () Bool)

(assert (=> b!45194 m!39703))

(check-sat (not start!6994) (not b!45194))
(check-sat)
(get-model)

(declare-fun d!8757 () Bool)

(assert (=> d!8757 (= (array_inv!859 a!4412) (bvsge (size!1654 a!4412) #b00000000000000000000000000000000))))

(assert (=> start!6994 d!8757))

(declare-fun call!3686 () (_ BitVec 32))

(declare-fun bm!3683 () Bool)

(assert (=> bm!3683 (= call!3686 (arrayCountValidKeys!0 a!4412 (bvadd i!1489 #b00000000000000000000000000000001) size!30))))

(declare-fun d!8759 () Bool)

(declare-fun lt!20078 () (_ BitVec 32))

(assert (=> d!8759 (and (bvsge lt!20078 #b00000000000000000000000000000000) (bvsle lt!20078 (bvsub (size!1654 a!4412) i!1489)))))

(declare-fun e!28730 () (_ BitVec 32))

(assert (=> d!8759 (= lt!20078 e!28730)))

(declare-fun c!6052 () Bool)

(assert (=> d!8759 (= c!6052 (bvsge i!1489 size!30))))

(assert (=> d!8759 (and (bvsle i!1489 size!30) (bvsge i!1489 #b00000000000000000000000000000000) (bvsle size!30 (size!1654 a!4412)))))

(assert (=> d!8759 (= (arrayCountValidKeys!0 a!4412 i!1489 size!30) lt!20078)))

(declare-fun b!45209 () Bool)

(assert (=> b!45209 (= e!28730 #b00000000000000000000000000000000)))

(declare-fun b!45210 () Bool)

(declare-fun e!28729 () (_ BitVec 32))

(assert (=> b!45210 (= e!28729 call!3686)))

(declare-fun b!45211 () Bool)

(assert (=> b!45211 (= e!28729 (bvadd #b00000000000000000000000000000001 call!3686))))

(declare-fun b!45212 () Bool)

(assert (=> b!45212 (= e!28730 e!28729)))

(declare-fun c!6053 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!45212 (= c!6053 (validKeyInArray!0 (select (arr!1436 a!4412) i!1489)))))

(assert (= (and d!8759 c!6052) b!45209))

(assert (= (and d!8759 (not c!6052)) b!45212))

(assert (= (and b!45212 c!6053) b!45211))

(assert (= (and b!45212 (not c!6053)) b!45210))

(assert (= (or b!45211 b!45210) bm!3683))

(declare-fun m!39725 () Bool)

(assert (=> bm!3683 m!39725))

(assert (=> b!45212 m!39695))

(assert (=> b!45212 m!39695))

(declare-fun m!39727 () Bool)

(assert (=> b!45212 m!39727))

(assert (=> b!45194 d!8759))

(declare-fun bm!3684 () Bool)

(declare-fun call!3687 () (_ BitVec 32))

(assert (=> bm!3684 (= call!3687 (arrayCountValidKeys!0 a!4412 (bvadd #b00000000000000000000000000000001 i!1489 #b00000000000000000000000000000001) size!30))))

(declare-fun d!8765 () Bool)

(declare-fun lt!20079 () (_ BitVec 32))

(assert (=> d!8765 (and (bvsge lt!20079 #b00000000000000000000000000000000) (bvsle lt!20079 (bvsub (size!1654 a!4412) (bvadd #b00000000000000000000000000000001 i!1489))))))

(declare-fun e!28732 () (_ BitVec 32))

(assert (=> d!8765 (= lt!20079 e!28732)))

(declare-fun c!6054 () Bool)

(assert (=> d!8765 (= c!6054 (bvsge (bvadd #b00000000000000000000000000000001 i!1489) size!30))))

(assert (=> d!8765 (and (bvsle (bvadd #b00000000000000000000000000000001 i!1489) size!30) (bvsge (bvadd #b00000000000000000000000000000001 i!1489) #b00000000000000000000000000000000) (bvsle size!30 (size!1654 a!4412)))))

(assert (=> d!8765 (= (arrayCountValidKeys!0 a!4412 (bvadd #b00000000000000000000000000000001 i!1489) size!30) lt!20079)))

(declare-fun b!45213 () Bool)

(assert (=> b!45213 (= e!28732 #b00000000000000000000000000000000)))

(declare-fun b!45214 () Bool)

(declare-fun e!28731 () (_ BitVec 32))

(assert (=> b!45214 (= e!28731 call!3687)))

(declare-fun b!45215 () Bool)

(assert (=> b!45215 (= e!28731 (bvadd #b00000000000000000000000000000001 call!3687))))

(declare-fun b!45216 () Bool)

(assert (=> b!45216 (= e!28732 e!28731)))

(declare-fun c!6055 () Bool)

(assert (=> b!45216 (= c!6055 (validKeyInArray!0 (select (arr!1436 a!4412) (bvadd #b00000000000000000000000000000001 i!1489))))))

(assert (= (and d!8765 c!6054) b!45213))

(assert (= (and d!8765 (not c!6054)) b!45216))

(assert (= (and b!45216 c!6055) b!45215))

(assert (= (and b!45216 (not c!6055)) b!45214))

(assert (= (or b!45215 b!45214) bm!3684))

(declare-fun m!39729 () Bool)

(assert (=> bm!3684 m!39729))

(declare-fun m!39731 () Bool)

(assert (=> b!45216 m!39731))

(assert (=> b!45216 m!39731))

(declare-fun m!39733 () Bool)

(assert (=> b!45216 m!39733))

(assert (=> b!45194 d!8765))

(declare-fun d!8767 () Bool)

(assert (=> d!8767 (= (arrayCountValidKeys!0 a!4412 (bvadd #b00000000000000000000000000000001 i!1489) size!30) #b00000000000000000000000000000000)))

(declare-fun lt!20084 () Unit!1272)

(declare-fun choose!59 (array!2985 (_ BitVec 32) (_ BitVec 32)) Unit!1272)

(assert (=> d!8767 (= lt!20084 (choose!59 a!4412 (bvadd #b00000000000000000000000000000001 i!1489) size!30))))

(assert (=> d!8767 (bvslt (size!1654 a!4412) #b01111111111111111111111111111111)))

(assert (=> d!8767 (= (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 a!4412 (bvadd #b00000000000000000000000000000001 i!1489) size!30) lt!20084)))

(declare-fun bs!2110 () Bool)

(assert (= bs!2110 d!8767))

(assert (=> bs!2110 m!39701))

(declare-fun m!39735 () Bool)

(assert (=> bs!2110 m!39735))

(assert (=> b!45194 d!8767))

(check-sat (not bm!3683) (not d!8767) (not b!45212) (not bm!3684) (not b!45216))
(check-sat)
(get-model)

(declare-fun call!3696 () (_ BitVec 32))

(declare-fun bm!3693 () Bool)

(assert (=> bm!3693 (= call!3696 (arrayCountValidKeys!0 a!4412 (bvadd #b00000000000000000000000000000001 i!1489 #b00000000000000000000000000000001 #b00000000000000000000000000000001) size!30))))

(declare-fun d!8781 () Bool)

(declare-fun lt!20097 () (_ BitVec 32))

(assert (=> d!8781 (and (bvsge lt!20097 #b00000000000000000000000000000000) (bvsle lt!20097 (bvsub (size!1654 a!4412) (bvadd #b00000000000000000000000000000001 i!1489 #b00000000000000000000000000000001))))))

(declare-fun e!28750 () (_ BitVec 32))

(assert (=> d!8781 (= lt!20097 e!28750)))

(declare-fun c!6072 () Bool)

(assert (=> d!8781 (= c!6072 (bvsge (bvadd #b00000000000000000000000000000001 i!1489 #b00000000000000000000000000000001) size!30))))

(assert (=> d!8781 (and (bvsle (bvadd #b00000000000000000000000000000001 i!1489 #b00000000000000000000000000000001) size!30) (bvsge (bvadd #b00000000000000000000000000000001 i!1489 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle size!30 (size!1654 a!4412)))))

(assert (=> d!8781 (= (arrayCountValidKeys!0 a!4412 (bvadd #b00000000000000000000000000000001 i!1489 #b00000000000000000000000000000001) size!30) lt!20097)))

(declare-fun b!45249 () Bool)

(assert (=> b!45249 (= e!28750 #b00000000000000000000000000000000)))

(declare-fun b!45250 () Bool)

(declare-fun e!28749 () (_ BitVec 32))

(assert (=> b!45250 (= e!28749 call!3696)))

(declare-fun b!45251 () Bool)

(assert (=> b!45251 (= e!28749 (bvadd #b00000000000000000000000000000001 call!3696))))

(declare-fun b!45252 () Bool)

(assert (=> b!45252 (= e!28750 e!28749)))

(declare-fun c!6073 () Bool)

(assert (=> b!45252 (= c!6073 (validKeyInArray!0 (select (arr!1436 a!4412) (bvadd #b00000000000000000000000000000001 i!1489 #b00000000000000000000000000000001))))))

(assert (= (and d!8781 c!6072) b!45249))

(assert (= (and d!8781 (not c!6072)) b!45252))

(assert (= (and b!45252 c!6073) b!45251))

(assert (= (and b!45252 (not c!6073)) b!45250))

(assert (= (or b!45251 b!45250) bm!3693))

(declare-fun m!39761 () Bool)

(assert (=> bm!3693 m!39761))

(declare-fun m!39763 () Bool)

(assert (=> b!45252 m!39763))

(assert (=> b!45252 m!39763))

(declare-fun m!39765 () Bool)

(assert (=> b!45252 m!39765))

(assert (=> bm!3684 d!8781))

(assert (=> d!8767 d!8765))

(declare-fun d!8783 () Bool)

(assert (=> d!8783 (= (arrayCountValidKeys!0 a!4412 (bvadd #b00000000000000000000000000000001 i!1489) size!30) #b00000000000000000000000000000000)))

(assert (=> d!8783 true))

(declare-fun _$88!64 () Unit!1272)

(assert (=> d!8783 (= (choose!59 a!4412 (bvadd #b00000000000000000000000000000001 i!1489) size!30) _$88!64)))

(declare-fun bs!2113 () Bool)

(assert (= bs!2113 d!8783))

(assert (=> bs!2113 m!39701))

(assert (=> d!8767 d!8783))

(declare-fun d!8785 () Bool)

(assert (=> d!8785 (= (validKeyInArray!0 (select (arr!1436 a!4412) i!1489)) (and (not (= (select (arr!1436 a!4412) i!1489) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1436 a!4412) i!1489) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!45212 d!8785))

(declare-fun d!8787 () Bool)

(assert (=> d!8787 (= (validKeyInArray!0 (select (arr!1436 a!4412) (bvadd #b00000000000000000000000000000001 i!1489))) (and (not (= (select (arr!1436 a!4412) (bvadd #b00000000000000000000000000000001 i!1489)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1436 a!4412) (bvadd #b00000000000000000000000000000001 i!1489)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!45216 d!8787))

(declare-fun bm!3694 () Bool)

(declare-fun call!3697 () (_ BitVec 32))

(assert (=> bm!3694 (= call!3697 (arrayCountValidKeys!0 a!4412 (bvadd i!1489 #b00000000000000000000000000000001 #b00000000000000000000000000000001) size!30))))

(declare-fun d!8789 () Bool)

(declare-fun lt!20098 () (_ BitVec 32))

(assert (=> d!8789 (and (bvsge lt!20098 #b00000000000000000000000000000000) (bvsle lt!20098 (bvsub (size!1654 a!4412) (bvadd i!1489 #b00000000000000000000000000000001))))))

(declare-fun e!28752 () (_ BitVec 32))

(assert (=> d!8789 (= lt!20098 e!28752)))

(declare-fun c!6074 () Bool)

(assert (=> d!8789 (= c!6074 (bvsge (bvadd i!1489 #b00000000000000000000000000000001) size!30))))

(assert (=> d!8789 (and (bvsle (bvadd i!1489 #b00000000000000000000000000000001) size!30) (bvsge (bvadd i!1489 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle size!30 (size!1654 a!4412)))))

(assert (=> d!8789 (= (arrayCountValidKeys!0 a!4412 (bvadd i!1489 #b00000000000000000000000000000001) size!30) lt!20098)))

(declare-fun b!45253 () Bool)

(assert (=> b!45253 (= e!28752 #b00000000000000000000000000000000)))

(declare-fun b!45254 () Bool)

(declare-fun e!28751 () (_ BitVec 32))

(assert (=> b!45254 (= e!28751 call!3697)))

(declare-fun b!45255 () Bool)

(assert (=> b!45255 (= e!28751 (bvadd #b00000000000000000000000000000001 call!3697))))

(declare-fun b!45256 () Bool)

(assert (=> b!45256 (= e!28752 e!28751)))

(declare-fun c!6075 () Bool)

(assert (=> b!45256 (= c!6075 (validKeyInArray!0 (select (arr!1436 a!4412) (bvadd i!1489 #b00000000000000000000000000000001))))))

(assert (= (and d!8789 c!6074) b!45253))

(assert (= (and d!8789 (not c!6074)) b!45256))

(assert (= (and b!45256 c!6075) b!45255))

(assert (= (and b!45256 (not c!6075)) b!45254))

(assert (= (or b!45255 b!45254) bm!3694))

(declare-fun m!39767 () Bool)

(assert (=> bm!3694 m!39767))

(declare-fun m!39769 () Bool)

(assert (=> b!45256 m!39769))

(assert (=> b!45256 m!39769))

(declare-fun m!39771 () Bool)

(assert (=> b!45256 m!39771))

(assert (=> bm!3683 d!8789))

(check-sat (not b!45256) (not bm!3693) (not bm!3694) (not d!8783) (not b!45252))
(check-sat)
