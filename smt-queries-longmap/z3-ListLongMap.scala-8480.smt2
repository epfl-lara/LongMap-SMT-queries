; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103292 () Bool)

(assert start!103292)

(declare-fun res!827004 () Bool)

(declare-fun e!702466 () Bool)

(assert (=> start!103292 (=> (not res!827004) (not e!702466))))

(declare-datatypes ((array!79876 0))(
  ( (array!79877 (arr!38538 (Array (_ BitVec 32) (_ BitVec 64))) (size!39074 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79876)

(declare-fun from!3213 () (_ BitVec 32))

(assert (=> start!103292 (= res!827004 (and (bvslt (size!39074 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!39074 a!3835))))))

(assert (=> start!103292 e!702466))

(declare-fun array_inv!29386 (array!79876) Bool)

(assert (=> start!103292 (array_inv!29386 a!3835)))

(assert (=> start!103292 true))

(declare-fun b!1239589 () Bool)

(declare-datatypes ((Unit!41195 0))(
  ( (Unit!41196) )
))
(declare-fun e!702467 () Unit!41195)

(declare-fun lt!561786 () Unit!41195)

(assert (=> b!1239589 (= e!702467 lt!561786)))

(declare-datatypes ((List!27311 0))(
  ( (Nil!27308) (Cons!27307 (h!28516 (_ BitVec 64)) (t!40774 List!27311)) )
))
(declare-fun acc!846 () List!27311)

(declare-fun lt!561787 () List!27311)

(assert (=> b!1239589 (= lt!561787 (Cons!27307 (select (arr!38538 a!3835) from!3213) acc!846))))

(declare-fun lt!561783 () Unit!41195)

(declare-fun lemmaListSubSeqRefl!0 (List!27311) Unit!41195)

(assert (=> b!1239589 (= lt!561783 (lemmaListSubSeqRefl!0 lt!561787))))

(declare-fun subseq!627 (List!27311 List!27311) Bool)

(assert (=> b!1239589 (subseq!627 lt!561787 lt!561787)))

(declare-fun lt!561788 () Unit!41195)

(declare-fun subseqTail!114 (List!27311 List!27311) Unit!41195)

(assert (=> b!1239589 (= lt!561788 (subseqTail!114 lt!561787 lt!561787))))

(assert (=> b!1239589 (subseq!627 acc!846 lt!561787)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79876 List!27311 List!27311 (_ BitVec 32)) Unit!41195)

(assert (=> b!1239589 (= lt!561786 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3835 lt!561787 acc!846 (bvadd #b00000000000000000000000000000001 from!3213)))))

(declare-fun arrayNoDuplicates!0 (array!79876 (_ BitVec 32) List!27311) Bool)

(assert (=> b!1239589 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846)))

(declare-fun b!1239590 () Bool)

(declare-fun res!827008 () Bool)

(assert (=> b!1239590 (=> (not res!827008) (not e!702466))))

(declare-fun contains!7373 (List!27311 (_ BitVec 64)) Bool)

(assert (=> b!1239590 (= res!827008 (not (contains!7373 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1239591 () Bool)

(declare-fun res!827005 () Bool)

(assert (=> b!1239591 (=> (not res!827005) (not e!702466))))

(assert (=> b!1239591 (= res!827005 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1239592 () Bool)

(declare-fun res!827010 () Bool)

(assert (=> b!1239592 (=> (not res!827010) (not e!702466))))

(declare-fun k0!2925 () (_ BitVec 64))

(assert (=> b!1239592 (= res!827010 (contains!7373 acc!846 k0!2925))))

(declare-fun b!1239593 () Bool)

(declare-fun res!827006 () Bool)

(assert (=> b!1239593 (=> (not res!827006) (not e!702466))))

(assert (=> b!1239593 (= res!827006 (not (contains!7373 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1239594 () Bool)

(declare-fun res!827009 () Bool)

(assert (=> b!1239594 (=> (not res!827009) (not e!702466))))

(declare-fun noDuplicate!1970 (List!27311) Bool)

(assert (=> b!1239594 (= res!827009 (noDuplicate!1970 acc!846))))

(declare-fun b!1239595 () Bool)

(declare-fun e!702468 () Bool)

(assert (=> b!1239595 (= e!702466 e!702468)))

(declare-fun res!827003 () Bool)

(assert (=> b!1239595 (=> (not res!827003) (not e!702468))))

(assert (=> b!1239595 (= res!827003 (and (bvsge (bvadd #b00000000000000000000000000000001 from!3213) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3213) (size!39074 a!3835))))))

(declare-fun lt!561784 () Unit!41195)

(assert (=> b!1239595 (= lt!561784 e!702467)))

(declare-fun c!121153 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1239595 (= c!121153 (validKeyInArray!0 (select (arr!38538 a!3835) from!3213)))))

(declare-fun b!1239596 () Bool)

(declare-fun res!827007 () Bool)

(assert (=> b!1239596 (=> (not res!827007) (not e!702468))))

(assert (=> b!1239596 (= res!827007 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846))))

(declare-fun b!1239597 () Bool)

(declare-fun arrayContainsKey!0 (array!79876 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1239597 (= e!702468 (not (not (arrayContainsKey!0 a!3835 k0!2925 from!3213))))))

(assert (=> b!1239597 (not (arrayContainsKey!0 a!3835 k0!2925 (bvadd #b00000000000000000000000000000001 from!3213)))))

(declare-fun lt!561785 () Unit!41195)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!79876 (_ BitVec 32) (_ BitVec 64) List!27311) Unit!41195)

(assert (=> b!1239597 (= lt!561785 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) k0!2925 acc!846))))

(declare-fun b!1239598 () Bool)

(declare-fun res!827011 () Bool)

(assert (=> b!1239598 (=> (not res!827011) (not e!702466))))

(assert (=> b!1239598 (= res!827011 (not (= from!3213 (bvsub (size!39074 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1239599 () Bool)

(declare-fun Unit!41197 () Unit!41195)

(assert (=> b!1239599 (= e!702467 Unit!41197)))

(assert (= (and start!103292 res!827004) b!1239594))

(assert (= (and b!1239594 res!827009) b!1239590))

(assert (= (and b!1239590 res!827008) b!1239593))

(assert (= (and b!1239593 res!827006) b!1239591))

(assert (= (and b!1239591 res!827005) b!1239592))

(assert (= (and b!1239592 res!827010) b!1239598))

(assert (= (and b!1239598 res!827011) b!1239595))

(assert (= (and b!1239595 c!121153) b!1239589))

(assert (= (and b!1239595 (not c!121153)) b!1239599))

(assert (= (and b!1239595 res!827003) b!1239596))

(assert (= (and b!1239596 res!827007) b!1239597))

(declare-fun m!1143017 () Bool)

(assert (=> b!1239589 m!1143017))

(declare-fun m!1143019 () Bool)

(assert (=> b!1239589 m!1143019))

(declare-fun m!1143021 () Bool)

(assert (=> b!1239589 m!1143021))

(declare-fun m!1143023 () Bool)

(assert (=> b!1239589 m!1143023))

(declare-fun m!1143025 () Bool)

(assert (=> b!1239589 m!1143025))

(declare-fun m!1143027 () Bool)

(assert (=> b!1239589 m!1143027))

(declare-fun m!1143029 () Bool)

(assert (=> b!1239589 m!1143029))

(declare-fun m!1143031 () Bool)

(assert (=> b!1239597 m!1143031))

(declare-fun m!1143033 () Bool)

(assert (=> b!1239597 m!1143033))

(declare-fun m!1143035 () Bool)

(assert (=> b!1239597 m!1143035))

(declare-fun m!1143037 () Bool)

(assert (=> b!1239590 m!1143037))

(assert (=> b!1239595 m!1143023))

(assert (=> b!1239595 m!1143023))

(declare-fun m!1143039 () Bool)

(assert (=> b!1239595 m!1143039))

(declare-fun m!1143041 () Bool)

(assert (=> b!1239594 m!1143041))

(declare-fun m!1143043 () Bool)

(assert (=> b!1239592 m!1143043))

(declare-fun m!1143045 () Bool)

(assert (=> b!1239591 m!1143045))

(assert (=> b!1239596 m!1143029))

(declare-fun m!1143047 () Bool)

(assert (=> b!1239593 m!1143047))

(declare-fun m!1143049 () Bool)

(assert (=> start!103292 m!1143049))

(check-sat (not b!1239593) (not b!1239590) (not b!1239594) (not b!1239597) (not b!1239591) (not b!1239596) (not start!103292) (not b!1239595) (not b!1239592) (not b!1239589))
(check-sat)
(get-model)

(declare-fun d!136043 () Bool)

(declare-fun lt!561809 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!596 (List!27311) (InoxSet (_ BitVec 64)))

(assert (=> d!136043 (= lt!561809 (select (content!596 acc!846) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!702486 () Bool)

(assert (=> d!136043 (= lt!561809 e!702486)))

(declare-fun res!827044 () Bool)

(assert (=> d!136043 (=> (not res!827044) (not e!702486))))

(get-info :version)

(assert (=> d!136043 (= res!827044 ((_ is Cons!27307) acc!846))))

(assert (=> d!136043 (= (contains!7373 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000) lt!561809)))

(declare-fun b!1239637 () Bool)

(declare-fun e!702485 () Bool)

(assert (=> b!1239637 (= e!702486 e!702485)))

(declare-fun res!827043 () Bool)

(assert (=> b!1239637 (=> res!827043 e!702485)))

(assert (=> b!1239637 (= res!827043 (= (h!28516 acc!846) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1239638 () Bool)

(assert (=> b!1239638 (= e!702485 (contains!7373 (t!40774 acc!846) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!136043 res!827044) b!1239637))

(assert (= (and b!1239637 (not res!827043)) b!1239638))

(declare-fun m!1143085 () Bool)

(assert (=> d!136043 m!1143085))

(declare-fun m!1143087 () Bool)

(assert (=> d!136043 m!1143087))

(declare-fun m!1143089 () Bool)

(assert (=> b!1239638 m!1143089))

(assert (=> b!1239593 d!136043))

(declare-fun d!136045 () Bool)

(declare-fun lt!561810 () Bool)

(assert (=> d!136045 (= lt!561810 (select (content!596 acc!846) k0!2925))))

(declare-fun e!702488 () Bool)

(assert (=> d!136045 (= lt!561810 e!702488)))

(declare-fun res!827046 () Bool)

(assert (=> d!136045 (=> (not res!827046) (not e!702488))))

(assert (=> d!136045 (= res!827046 ((_ is Cons!27307) acc!846))))

(assert (=> d!136045 (= (contains!7373 acc!846 k0!2925) lt!561810)))

(declare-fun b!1239639 () Bool)

(declare-fun e!702487 () Bool)

(assert (=> b!1239639 (= e!702488 e!702487)))

(declare-fun res!827045 () Bool)

(assert (=> b!1239639 (=> res!827045 e!702487)))

(assert (=> b!1239639 (= res!827045 (= (h!28516 acc!846) k0!2925))))

(declare-fun b!1239640 () Bool)

(assert (=> b!1239640 (= e!702487 (contains!7373 (t!40774 acc!846) k0!2925))))

(assert (= (and d!136045 res!827046) b!1239639))

(assert (= (and b!1239639 (not res!827045)) b!1239640))

(assert (=> d!136045 m!1143085))

(declare-fun m!1143091 () Bool)

(assert (=> d!136045 m!1143091))

(declare-fun m!1143093 () Bool)

(assert (=> b!1239640 m!1143093))

(assert (=> b!1239592 d!136045))

(declare-fun d!136047 () Bool)

(declare-fun res!827051 () Bool)

(declare-fun e!702493 () Bool)

(assert (=> d!136047 (=> res!827051 e!702493)))

(assert (=> d!136047 (= res!827051 (= (select (arr!38538 a!3835) from!3213) k0!2925))))

(assert (=> d!136047 (= (arrayContainsKey!0 a!3835 k0!2925 from!3213) e!702493)))

(declare-fun b!1239645 () Bool)

(declare-fun e!702494 () Bool)

(assert (=> b!1239645 (= e!702493 e!702494)))

(declare-fun res!827052 () Bool)

(assert (=> b!1239645 (=> (not res!827052) (not e!702494))))

(assert (=> b!1239645 (= res!827052 (bvslt (bvadd from!3213 #b00000000000000000000000000000001) (size!39074 a!3835)))))

(declare-fun b!1239646 () Bool)

(assert (=> b!1239646 (= e!702494 (arrayContainsKey!0 a!3835 k0!2925 (bvadd from!3213 #b00000000000000000000000000000001)))))

(assert (= (and d!136047 (not res!827051)) b!1239645))

(assert (= (and b!1239645 res!827052) b!1239646))

(assert (=> d!136047 m!1143023))

(declare-fun m!1143095 () Bool)

(assert (=> b!1239646 m!1143095))

(assert (=> b!1239597 d!136047))

(declare-fun d!136049 () Bool)

(declare-fun res!827053 () Bool)

(declare-fun e!702495 () Bool)

(assert (=> d!136049 (=> res!827053 e!702495)))

(assert (=> d!136049 (= res!827053 (= (select (arr!38538 a!3835) (bvadd #b00000000000000000000000000000001 from!3213)) k0!2925))))

(assert (=> d!136049 (= (arrayContainsKey!0 a!3835 k0!2925 (bvadd #b00000000000000000000000000000001 from!3213)) e!702495)))

(declare-fun b!1239647 () Bool)

(declare-fun e!702496 () Bool)

(assert (=> b!1239647 (= e!702495 e!702496)))

(declare-fun res!827054 () Bool)

(assert (=> b!1239647 (=> (not res!827054) (not e!702496))))

(assert (=> b!1239647 (= res!827054 (bvslt (bvadd #b00000000000000000000000000000001 from!3213 #b00000000000000000000000000000001) (size!39074 a!3835)))))

(declare-fun b!1239648 () Bool)

(assert (=> b!1239648 (= e!702496 (arrayContainsKey!0 a!3835 k0!2925 (bvadd #b00000000000000000000000000000001 from!3213 #b00000000000000000000000000000001)))))

(assert (= (and d!136049 (not res!827053)) b!1239647))

(assert (= (and b!1239647 res!827054) b!1239648))

(declare-fun m!1143097 () Bool)

(assert (=> d!136049 m!1143097))

(declare-fun m!1143099 () Bool)

(assert (=> b!1239648 m!1143099))

(assert (=> b!1239597 d!136049))

(declare-fun d!136051 () Bool)

(assert (=> d!136051 (not (arrayContainsKey!0 a!3835 k0!2925 (bvadd #b00000000000000000000000000000001 from!3213)))))

(declare-fun lt!561813 () Unit!41195)

(declare-fun choose!68 (array!79876 (_ BitVec 32) (_ BitVec 64) List!27311) Unit!41195)

(assert (=> d!136051 (= lt!561813 (choose!68 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) k0!2925 acc!846))))

(assert (=> d!136051 (bvslt (size!39074 a!3835) #b01111111111111111111111111111111)))

(assert (=> d!136051 (= (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) k0!2925 acc!846) lt!561813)))

(declare-fun bs!34856 () Bool)

(assert (= bs!34856 d!136051))

(assert (=> bs!34856 m!1143033))

(declare-fun m!1143101 () Bool)

(assert (=> bs!34856 m!1143101))

(assert (=> b!1239597 d!136051))

(declare-fun d!136053 () Bool)

(assert (=> d!136053 (= (array_inv!29386 a!3835) (bvsge (size!39074 a!3835) #b00000000000000000000000000000000))))

(assert (=> start!103292 d!136053))

(declare-fun c!121159 () Bool)

(declare-fun call!61099 () Bool)

(declare-fun bm!61096 () Bool)

(assert (=> bm!61096 (= call!61099 (arrayNoDuplicates!0 a!3835 (bvadd from!3213 #b00000000000000000000000000000001) (ite c!121159 (Cons!27307 (select (arr!38538 a!3835) from!3213) acc!846) acc!846)))))

(declare-fun d!136055 () Bool)

(declare-fun res!827077 () Bool)

(declare-fun e!702521 () Bool)

(assert (=> d!136055 (=> res!827077 e!702521)))

(assert (=> d!136055 (= res!827077 (bvsge from!3213 (size!39074 a!3835)))))

(assert (=> d!136055 (= (arrayNoDuplicates!0 a!3835 from!3213 acc!846) e!702521)))

(declare-fun b!1239675 () Bool)

(declare-fun e!702524 () Bool)

(assert (=> b!1239675 (= e!702524 call!61099)))

(declare-fun b!1239676 () Bool)

(assert (=> b!1239676 (= e!702524 call!61099)))

(declare-fun e!702523 () Bool)

(declare-fun b!1239677 () Bool)

(assert (=> b!1239677 (= e!702523 (contains!7373 acc!846 (select (arr!38538 a!3835) from!3213)))))

(declare-fun b!1239678 () Bool)

(declare-fun e!702522 () Bool)

(assert (=> b!1239678 (= e!702521 e!702522)))

(declare-fun res!827079 () Bool)

(assert (=> b!1239678 (=> (not res!827079) (not e!702522))))

(assert (=> b!1239678 (= res!827079 (not e!702523))))

(declare-fun res!827078 () Bool)

(assert (=> b!1239678 (=> (not res!827078) (not e!702523))))

(assert (=> b!1239678 (= res!827078 (validKeyInArray!0 (select (arr!38538 a!3835) from!3213)))))

(declare-fun b!1239679 () Bool)

(assert (=> b!1239679 (= e!702522 e!702524)))

(assert (=> b!1239679 (= c!121159 (validKeyInArray!0 (select (arr!38538 a!3835) from!3213)))))

(assert (= (and d!136055 (not res!827077)) b!1239678))

(assert (= (and b!1239678 res!827078) b!1239677))

(assert (= (and b!1239678 res!827079) b!1239679))

(assert (= (and b!1239679 c!121159) b!1239676))

(assert (= (and b!1239679 (not c!121159)) b!1239675))

(assert (= (or b!1239676 b!1239675) bm!61096))

(assert (=> bm!61096 m!1143023))

(declare-fun m!1143121 () Bool)

(assert (=> bm!61096 m!1143121))

(assert (=> b!1239677 m!1143023))

(assert (=> b!1239677 m!1143023))

(declare-fun m!1143123 () Bool)

(assert (=> b!1239677 m!1143123))

(assert (=> b!1239678 m!1143023))

(assert (=> b!1239678 m!1143023))

(assert (=> b!1239678 m!1143039))

(assert (=> b!1239679 m!1143023))

(assert (=> b!1239679 m!1143023))

(assert (=> b!1239679 m!1143039))

(assert (=> b!1239591 d!136055))

(declare-fun bm!61097 () Bool)

(declare-fun c!121160 () Bool)

(declare-fun call!61100 () Bool)

(assert (=> bm!61097 (= call!61100 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213 #b00000000000000000000000000000001) (ite c!121160 (Cons!27307 (select (arr!38538 a!3835) (bvadd #b00000000000000000000000000000001 from!3213)) acc!846) acc!846)))))

(declare-fun d!136071 () Bool)

(declare-fun res!827080 () Bool)

(declare-fun e!702525 () Bool)

(assert (=> d!136071 (=> res!827080 e!702525)))

(assert (=> d!136071 (= res!827080 (bvsge (bvadd #b00000000000000000000000000000001 from!3213) (size!39074 a!3835)))))

(assert (=> d!136071 (= (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846) e!702525)))

(declare-fun b!1239680 () Bool)

(declare-fun e!702528 () Bool)

(assert (=> b!1239680 (= e!702528 call!61100)))

(declare-fun b!1239681 () Bool)

(assert (=> b!1239681 (= e!702528 call!61100)))

(declare-fun b!1239682 () Bool)

(declare-fun e!702527 () Bool)

(assert (=> b!1239682 (= e!702527 (contains!7373 acc!846 (select (arr!38538 a!3835) (bvadd #b00000000000000000000000000000001 from!3213))))))

(declare-fun b!1239683 () Bool)

(declare-fun e!702526 () Bool)

(assert (=> b!1239683 (= e!702525 e!702526)))

(declare-fun res!827082 () Bool)

(assert (=> b!1239683 (=> (not res!827082) (not e!702526))))

(assert (=> b!1239683 (= res!827082 (not e!702527))))

(declare-fun res!827081 () Bool)

(assert (=> b!1239683 (=> (not res!827081) (not e!702527))))

(assert (=> b!1239683 (= res!827081 (validKeyInArray!0 (select (arr!38538 a!3835) (bvadd #b00000000000000000000000000000001 from!3213))))))

(declare-fun b!1239684 () Bool)

(assert (=> b!1239684 (= e!702526 e!702528)))

(assert (=> b!1239684 (= c!121160 (validKeyInArray!0 (select (arr!38538 a!3835) (bvadd #b00000000000000000000000000000001 from!3213))))))

(assert (= (and d!136071 (not res!827080)) b!1239683))

(assert (= (and b!1239683 res!827081) b!1239682))

(assert (= (and b!1239683 res!827082) b!1239684))

(assert (= (and b!1239684 c!121160) b!1239681))

(assert (= (and b!1239684 (not c!121160)) b!1239680))

(assert (= (or b!1239681 b!1239680) bm!61097))

(assert (=> bm!61097 m!1143097))

(declare-fun m!1143125 () Bool)

(assert (=> bm!61097 m!1143125))

(assert (=> b!1239682 m!1143097))

(assert (=> b!1239682 m!1143097))

(declare-fun m!1143127 () Bool)

(assert (=> b!1239682 m!1143127))

(assert (=> b!1239683 m!1143097))

(assert (=> b!1239683 m!1143097))

(declare-fun m!1143129 () Bool)

(assert (=> b!1239683 m!1143129))

(assert (=> b!1239684 m!1143097))

(assert (=> b!1239684 m!1143097))

(assert (=> b!1239684 m!1143129))

(assert (=> b!1239596 d!136071))

(declare-fun d!136073 () Bool)

(declare-fun lt!561821 () Bool)

(assert (=> d!136073 (= lt!561821 (select (content!596 acc!846) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!702534 () Bool)

(assert (=> d!136073 (= lt!561821 e!702534)))

(declare-fun res!827088 () Bool)

(assert (=> d!136073 (=> (not res!827088) (not e!702534))))

(assert (=> d!136073 (= res!827088 ((_ is Cons!27307) acc!846))))

(assert (=> d!136073 (= (contains!7373 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000) lt!561821)))

(declare-fun b!1239689 () Bool)

(declare-fun e!702533 () Bool)

(assert (=> b!1239689 (= e!702534 e!702533)))

(declare-fun res!827087 () Bool)

(assert (=> b!1239689 (=> res!827087 e!702533)))

(assert (=> b!1239689 (= res!827087 (= (h!28516 acc!846) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1239690 () Bool)

(assert (=> b!1239690 (= e!702533 (contains!7373 (t!40774 acc!846) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!136073 res!827088) b!1239689))

(assert (= (and b!1239689 (not res!827087)) b!1239690))

(assert (=> d!136073 m!1143085))

(declare-fun m!1143131 () Bool)

(assert (=> d!136073 m!1143131))

(declare-fun m!1143133 () Bool)

(assert (=> b!1239690 m!1143133))

(assert (=> b!1239590 d!136073))

(declare-fun d!136075 () Bool)

(assert (=> d!136075 (= (validKeyInArray!0 (select (arr!38538 a!3835) from!3213)) (and (not (= (select (arr!38538 a!3835) from!3213) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!38538 a!3835) from!3213) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1239595 d!136075))

(assert (=> b!1239589 d!136071))

(declare-fun d!136079 () Bool)

(assert (=> d!136079 (subseq!627 lt!561787 lt!561787)))

(declare-fun lt!561826 () Unit!41195)

(declare-fun choose!36 (List!27311) Unit!41195)

(assert (=> d!136079 (= lt!561826 (choose!36 lt!561787))))

(assert (=> d!136079 (= (lemmaListSubSeqRefl!0 lt!561787) lt!561826)))

(declare-fun bs!34858 () Bool)

(assert (= bs!34858 d!136079))

(assert (=> bs!34858 m!1143027))

(declare-fun m!1143141 () Bool)

(assert (=> bs!34858 m!1143141))

(assert (=> b!1239589 d!136079))

(declare-fun b!1239762 () Bool)

(declare-fun e!702585 () Unit!41195)

(declare-fun call!61112 () Unit!41195)

(assert (=> b!1239762 (= e!702585 call!61112)))

(declare-fun bm!61109 () Bool)

(declare-fun c!121184 () Bool)

(assert (=> bm!61109 (= call!61112 (subseqTail!114 (ite c!121184 lt!561787 (t!40774 lt!561787)) (t!40774 lt!561787)))))

(declare-fun b!1239763 () Bool)

(declare-fun c!121182 () Bool)

(declare-fun isEmpty!1019 (List!27311) Bool)

(assert (=> b!1239763 (= c!121182 (not (isEmpty!1019 (t!40774 lt!561787))))))

(declare-fun e!702586 () Unit!41195)

(assert (=> b!1239763 (= e!702585 e!702586)))

(declare-fun b!1239764 () Bool)

(assert (=> b!1239764 (= e!702586 call!61112)))

(declare-fun b!1239765 () Bool)

(declare-fun e!702588 () Unit!41195)

(declare-fun Unit!41203 () Unit!41195)

(assert (=> b!1239765 (= e!702588 Unit!41203)))

(declare-fun d!136083 () Bool)

(declare-fun tail!171 (List!27311) List!27311)

(assert (=> d!136083 (subseq!627 (tail!171 lt!561787) lt!561787)))

(declare-fun lt!561839 () Unit!41195)

(assert (=> d!136083 (= lt!561839 e!702588)))

(declare-fun c!121183 () Bool)

(assert (=> d!136083 (= c!121183 (and ((_ is Cons!27307) lt!561787) ((_ is Cons!27307) lt!561787)))))

(declare-fun e!702587 () Bool)

(assert (=> d!136083 e!702587))

(declare-fun res!827118 () Bool)

(assert (=> d!136083 (=> (not res!827118) (not e!702587))))

(assert (=> d!136083 (= res!827118 (not (isEmpty!1019 lt!561787)))))

(assert (=> d!136083 (= (subseqTail!114 lt!561787 lt!561787) lt!561839)))

(declare-fun b!1239766 () Bool)

(assert (=> b!1239766 (= e!702587 (subseq!627 lt!561787 lt!561787))))

(declare-fun b!1239767 () Bool)

(assert (=> b!1239767 (= e!702588 e!702585)))

(assert (=> b!1239767 (= c!121184 (subseq!627 lt!561787 (t!40774 lt!561787)))))

(declare-fun b!1239768 () Bool)

(declare-fun Unit!41204 () Unit!41195)

(assert (=> b!1239768 (= e!702586 Unit!41204)))

(assert (= (and d!136083 res!827118) b!1239766))

(assert (= (and d!136083 c!121183) b!1239767))

(assert (= (and d!136083 (not c!121183)) b!1239765))

(assert (= (and b!1239767 c!121184) b!1239762))

(assert (= (and b!1239767 (not c!121184)) b!1239763))

(assert (= (and b!1239763 c!121182) b!1239764))

(assert (= (and b!1239763 (not c!121182)) b!1239768))

(assert (= (or b!1239762 b!1239764) bm!61109))

(declare-fun m!1143177 () Bool)

(assert (=> b!1239767 m!1143177))

(assert (=> b!1239766 m!1143027))

(declare-fun m!1143179 () Bool)

(assert (=> bm!61109 m!1143179))

(declare-fun m!1143181 () Bool)

(assert (=> d!136083 m!1143181))

(assert (=> d!136083 m!1143181))

(declare-fun m!1143183 () Bool)

(assert (=> d!136083 m!1143183))

(declare-fun m!1143185 () Bool)

(assert (=> d!136083 m!1143185))

(declare-fun m!1143187 () Bool)

(assert (=> b!1239763 m!1143187))

(assert (=> b!1239589 d!136083))

(declare-fun d!136099 () Bool)

(assert (=> d!136099 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846)))

(declare-fun lt!561846 () Unit!41195)

(declare-fun choose!80 (array!79876 List!27311 List!27311 (_ BitVec 32)) Unit!41195)

(assert (=> d!136099 (= lt!561846 (choose!80 a!3835 lt!561787 acc!846 (bvadd #b00000000000000000000000000000001 from!3213)))))

(assert (=> d!136099 (bvslt (size!39074 a!3835) #b01111111111111111111111111111111)))

(assert (=> d!136099 (= (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3835 lt!561787 acc!846 (bvadd #b00000000000000000000000000000001 from!3213)) lt!561846)))

(declare-fun bs!34863 () Bool)

(assert (= bs!34863 d!136099))

(assert (=> bs!34863 m!1143029))

(declare-fun m!1143197 () Bool)

(assert (=> bs!34863 m!1143197))

(assert (=> b!1239589 d!136099))

(declare-fun d!136107 () Bool)

(declare-fun res!827162 () Bool)

(declare-fun e!702632 () Bool)

(assert (=> d!136107 (=> res!827162 e!702632)))

(assert (=> d!136107 (= res!827162 ((_ is Nil!27308) lt!561787))))

(assert (=> d!136107 (= (subseq!627 lt!561787 lt!561787) e!702632)))

(declare-fun b!1239812 () Bool)

(declare-fun e!702630 () Bool)

(assert (=> b!1239812 (= e!702630 (subseq!627 lt!561787 (t!40774 lt!561787)))))

(declare-fun b!1239810 () Bool)

(declare-fun e!702631 () Bool)

(assert (=> b!1239810 (= e!702631 e!702630)))

(declare-fun res!827160 () Bool)

(assert (=> b!1239810 (=> res!827160 e!702630)))

(declare-fun e!702629 () Bool)

(assert (=> b!1239810 (= res!827160 e!702629)))

(declare-fun res!827161 () Bool)

(assert (=> b!1239810 (=> (not res!827161) (not e!702629))))

(assert (=> b!1239810 (= res!827161 (= (h!28516 lt!561787) (h!28516 lt!561787)))))

(declare-fun b!1239809 () Bool)

(assert (=> b!1239809 (= e!702632 e!702631)))

(declare-fun res!827159 () Bool)

(assert (=> b!1239809 (=> (not res!827159) (not e!702631))))

(assert (=> b!1239809 (= res!827159 ((_ is Cons!27307) lt!561787))))

(declare-fun b!1239811 () Bool)

(assert (=> b!1239811 (= e!702629 (subseq!627 (t!40774 lt!561787) (t!40774 lt!561787)))))

(assert (= (and d!136107 (not res!827162)) b!1239809))

(assert (= (and b!1239809 res!827159) b!1239810))

(assert (= (and b!1239810 res!827161) b!1239811))

(assert (= (and b!1239810 (not res!827160)) b!1239812))

(assert (=> b!1239812 m!1143177))

(declare-fun m!1143217 () Bool)

(assert (=> b!1239811 m!1143217))

(assert (=> b!1239589 d!136107))

(declare-fun d!136117 () Bool)

(declare-fun res!827168 () Bool)

(declare-fun e!702644 () Bool)

(assert (=> d!136117 (=> res!827168 e!702644)))

(assert (=> d!136117 (= res!827168 ((_ is Nil!27308) acc!846))))

(assert (=> d!136117 (= (subseq!627 acc!846 lt!561787) e!702644)))

(declare-fun b!1239830 () Bool)

(declare-fun e!702642 () Bool)

(assert (=> b!1239830 (= e!702642 (subseq!627 acc!846 (t!40774 lt!561787)))))

(declare-fun b!1239828 () Bool)

(declare-fun e!702643 () Bool)

(assert (=> b!1239828 (= e!702643 e!702642)))

(declare-fun res!827166 () Bool)

(assert (=> b!1239828 (=> res!827166 e!702642)))

(declare-fun e!702641 () Bool)

(assert (=> b!1239828 (= res!827166 e!702641)))

(declare-fun res!827167 () Bool)

(assert (=> b!1239828 (=> (not res!827167) (not e!702641))))

(assert (=> b!1239828 (= res!827167 (= (h!28516 acc!846) (h!28516 lt!561787)))))

(declare-fun b!1239827 () Bool)

(assert (=> b!1239827 (= e!702644 e!702643)))

(declare-fun res!827165 () Bool)

(assert (=> b!1239827 (=> (not res!827165) (not e!702643))))

(assert (=> b!1239827 (= res!827165 ((_ is Cons!27307) lt!561787))))

(declare-fun b!1239829 () Bool)

(assert (=> b!1239829 (= e!702641 (subseq!627 (t!40774 acc!846) (t!40774 lt!561787)))))

(assert (= (and d!136117 (not res!827168)) b!1239827))

(assert (= (and b!1239827 res!827165) b!1239828))

(assert (= (and b!1239828 res!827167) b!1239829))

(assert (= (and b!1239828 (not res!827166)) b!1239830))

(declare-fun m!1143219 () Bool)

(assert (=> b!1239830 m!1143219))

(declare-fun m!1143221 () Bool)

(assert (=> b!1239829 m!1143221))

(assert (=> b!1239589 d!136117))

(declare-fun d!136119 () Bool)

(declare-fun res!827176 () Bool)

(declare-fun e!702653 () Bool)

(assert (=> d!136119 (=> res!827176 e!702653)))

(assert (=> d!136119 (= res!827176 ((_ is Nil!27308) acc!846))))

(assert (=> d!136119 (= (noDuplicate!1970 acc!846) e!702653)))

(declare-fun b!1239840 () Bool)

(declare-fun e!702654 () Bool)

(assert (=> b!1239840 (= e!702653 e!702654)))

(declare-fun res!827177 () Bool)

(assert (=> b!1239840 (=> (not res!827177) (not e!702654))))

(assert (=> b!1239840 (= res!827177 (not (contains!7373 (t!40774 acc!846) (h!28516 acc!846))))))

(declare-fun b!1239841 () Bool)

(assert (=> b!1239841 (= e!702654 (noDuplicate!1970 (t!40774 acc!846)))))

(assert (= (and d!136119 (not res!827176)) b!1239840))

(assert (= (and b!1239840 res!827177) b!1239841))

(declare-fun m!1143227 () Bool)

(assert (=> b!1239840 m!1143227))

(declare-fun m!1143229 () Bool)

(assert (=> b!1239841 m!1143229))

(assert (=> b!1239594 d!136119))

(check-sat (not d!136073) (not bm!61109) (not b!1239679) (not b!1239640) (not d!136083) (not b!1239830) (not b!1239638) (not d!136045) (not b!1239684) (not b!1239811) (not b!1239646) (not b!1239683) (not d!136051) (not b!1239763) (not bm!61096) (not b!1239841) (not b!1239767) (not d!136099) (not b!1239829) (not b!1239766) (not b!1239677) (not bm!61097) (not b!1239840) (not d!136043) (not b!1239812) (not d!136079) (not b!1239690) (not b!1239682) (not b!1239648) (not b!1239678))
(check-sat)
