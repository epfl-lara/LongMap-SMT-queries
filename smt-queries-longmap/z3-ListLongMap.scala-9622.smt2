; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113854 () Bool)

(assert start!113854)

(declare-fun b!1350385 () Bool)

(declare-fun res!895846 () Bool)

(declare-fun e!768204 () Bool)

(assert (=> b!1350385 (=> (not res!895846) (not e!768204))))

(declare-datatypes ((List!31516 0))(
  ( (Nil!31513) (Cons!31512 (h!32721 (_ BitVec 64)) (t!46174 List!31516)) )
))
(declare-fun acc!759 () List!31516)

(declare-fun noDuplicate!2082 (List!31516) Bool)

(assert (=> b!1350385 (= res!895846 (noDuplicate!2082 acc!759))))

(declare-fun b!1350386 () Bool)

(declare-fun e!768203 () Bool)

(declare-fun contains!9225 (List!31516 (_ BitVec 64)) Bool)

(assert (=> b!1350386 (= e!768203 (contains!9225 Nil!31513 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1350387 () Bool)

(declare-fun res!895848 () Bool)

(assert (=> b!1350387 (=> (not res!895848) (not e!768204))))

(assert (=> b!1350387 (= res!895848 (noDuplicate!2082 Nil!31513))))

(declare-fun b!1350388 () Bool)

(declare-fun res!895845 () Bool)

(assert (=> b!1350388 (=> (not res!895845) (not e!768204))))

(assert (=> b!1350388 (= res!895845 (not (contains!9225 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1350389 () Bool)

(declare-fun res!895844 () Bool)

(assert (=> b!1350389 (=> (not res!895844) (not e!768204))))

(assert (=> b!1350389 (= res!895844 (not (contains!9225 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1350390 () Bool)

(declare-fun res!895843 () Bool)

(assert (=> b!1350390 (=> (not res!895843) (not e!768204))))

(declare-datatypes ((array!92051 0))(
  ( (array!92052 (arr!44475 (Array (_ BitVec 32) (_ BitVec 64))) (size!45025 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92051)

(assert (=> b!1350390 (= res!895843 (bvsle #b00000000000000000000000000000000 (size!45025 a!3742)))))

(declare-fun res!895849 () Bool)

(assert (=> start!113854 (=> (not res!895849) (not e!768204))))

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> start!113854 (= res!895849 (and (bvslt (size!45025 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45025 a!3742))))))

(assert (=> start!113854 e!768204))

(declare-fun array_inv!33503 (array!92051) Bool)

(assert (=> start!113854 (array_inv!33503 a!3742)))

(assert (=> start!113854 true))

(declare-fun b!1350391 () Bool)

(assert (=> b!1350391 (= e!768204 e!768203)))

(declare-fun res!895847 () Bool)

(assert (=> b!1350391 (=> res!895847 e!768203)))

(assert (=> b!1350391 (= res!895847 (contains!9225 Nil!31513 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!113854 res!895849) b!1350385))

(assert (= (and b!1350385 res!895846) b!1350389))

(assert (= (and b!1350389 res!895844) b!1350388))

(assert (= (and b!1350388 res!895845) b!1350390))

(assert (= (and b!1350390 res!895843) b!1350387))

(assert (= (and b!1350387 res!895848) b!1350391))

(assert (= (and b!1350391 (not res!895847)) b!1350386))

(declare-fun m!1237605 () Bool)

(assert (=> b!1350389 m!1237605))

(declare-fun m!1237607 () Bool)

(assert (=> b!1350391 m!1237607))

(declare-fun m!1237609 () Bool)

(assert (=> b!1350388 m!1237609))

(declare-fun m!1237611 () Bool)

(assert (=> b!1350386 m!1237611))

(declare-fun m!1237613 () Bool)

(assert (=> b!1350387 m!1237613))

(declare-fun m!1237615 () Bool)

(assert (=> b!1350385 m!1237615))

(declare-fun m!1237617 () Bool)

(assert (=> start!113854 m!1237617))

(check-sat (not b!1350391) (not start!113854) (not b!1350388) (not b!1350387) (not b!1350389) (not b!1350385) (not b!1350386))
(check-sat)
(get-model)

(declare-fun d!144921 () Bool)

(declare-fun lt!596968 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!671 (List!31516) (InoxSet (_ BitVec 64)))

(assert (=> d!144921 (= lt!596968 (select (content!671 Nil!31513) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!768219 () Bool)

(assert (=> d!144921 (= lt!596968 e!768219)))

(declare-fun res!895875 () Bool)

(assert (=> d!144921 (=> (not res!895875) (not e!768219))))

(get-info :version)

(assert (=> d!144921 (= res!895875 ((_ is Cons!31512) Nil!31513))))

(assert (=> d!144921 (= (contains!9225 Nil!31513 #b1000000000000000000000000000000000000000000000000000000000000000) lt!596968)))

(declare-fun b!1350417 () Bool)

(declare-fun e!768220 () Bool)

(assert (=> b!1350417 (= e!768219 e!768220)))

(declare-fun res!895876 () Bool)

(assert (=> b!1350417 (=> res!895876 e!768220)))

(assert (=> b!1350417 (= res!895876 (= (h!32721 Nil!31513) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1350418 () Bool)

(assert (=> b!1350418 (= e!768220 (contains!9225 (t!46174 Nil!31513) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!144921 res!895875) b!1350417))

(assert (= (and b!1350417 (not res!895876)) b!1350418))

(declare-fun m!1237633 () Bool)

(assert (=> d!144921 m!1237633))

(declare-fun m!1237635 () Bool)

(assert (=> d!144921 m!1237635))

(declare-fun m!1237637 () Bool)

(assert (=> b!1350418 m!1237637))

(assert (=> b!1350386 d!144921))

(declare-fun d!144925 () Bool)

(declare-fun lt!596969 () Bool)

(assert (=> d!144925 (= lt!596969 (select (content!671 Nil!31513) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!768221 () Bool)

(assert (=> d!144925 (= lt!596969 e!768221)))

(declare-fun res!895877 () Bool)

(assert (=> d!144925 (=> (not res!895877) (not e!768221))))

(assert (=> d!144925 (= res!895877 ((_ is Cons!31512) Nil!31513))))

(assert (=> d!144925 (= (contains!9225 Nil!31513 #b0000000000000000000000000000000000000000000000000000000000000000) lt!596969)))

(declare-fun b!1350419 () Bool)

(declare-fun e!768222 () Bool)

(assert (=> b!1350419 (= e!768221 e!768222)))

(declare-fun res!895878 () Bool)

(assert (=> b!1350419 (=> res!895878 e!768222)))

(assert (=> b!1350419 (= res!895878 (= (h!32721 Nil!31513) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1350420 () Bool)

(assert (=> b!1350420 (= e!768222 (contains!9225 (t!46174 Nil!31513) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!144925 res!895877) b!1350419))

(assert (= (and b!1350419 (not res!895878)) b!1350420))

(assert (=> d!144925 m!1237633))

(declare-fun m!1237639 () Bool)

(assert (=> d!144925 m!1237639))

(declare-fun m!1237641 () Bool)

(assert (=> b!1350420 m!1237641))

(assert (=> b!1350391 d!144925))

(declare-fun d!144927 () Bool)

(declare-fun res!895889 () Bool)

(declare-fun e!768233 () Bool)

(assert (=> d!144927 (=> res!895889 e!768233)))

(assert (=> d!144927 (= res!895889 ((_ is Nil!31513) acc!759))))

(assert (=> d!144927 (= (noDuplicate!2082 acc!759) e!768233)))

(declare-fun b!1350431 () Bool)

(declare-fun e!768234 () Bool)

(assert (=> b!1350431 (= e!768233 e!768234)))

(declare-fun res!895890 () Bool)

(assert (=> b!1350431 (=> (not res!895890) (not e!768234))))

(assert (=> b!1350431 (= res!895890 (not (contains!9225 (t!46174 acc!759) (h!32721 acc!759))))))

(declare-fun b!1350432 () Bool)

(assert (=> b!1350432 (= e!768234 (noDuplicate!2082 (t!46174 acc!759)))))

(assert (= (and d!144927 (not res!895889)) b!1350431))

(assert (= (and b!1350431 res!895890) b!1350432))

(declare-fun m!1237649 () Bool)

(assert (=> b!1350431 m!1237649))

(declare-fun m!1237651 () Bool)

(assert (=> b!1350432 m!1237651))

(assert (=> b!1350385 d!144927))

(declare-fun d!144933 () Bool)

(declare-fun lt!596974 () Bool)

(assert (=> d!144933 (= lt!596974 (select (content!671 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!768237 () Bool)

(assert (=> d!144933 (= lt!596974 e!768237)))

(declare-fun res!895893 () Bool)

(assert (=> d!144933 (=> (not res!895893) (not e!768237))))

(assert (=> d!144933 (= res!895893 ((_ is Cons!31512) acc!759))))

(assert (=> d!144933 (= (contains!9225 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000) lt!596974)))

(declare-fun b!1350435 () Bool)

(declare-fun e!768238 () Bool)

(assert (=> b!1350435 (= e!768237 e!768238)))

(declare-fun res!895894 () Bool)

(assert (=> b!1350435 (=> res!895894 e!768238)))

(assert (=> b!1350435 (= res!895894 (= (h!32721 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1350436 () Bool)

(assert (=> b!1350436 (= e!768238 (contains!9225 (t!46174 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!144933 res!895893) b!1350435))

(assert (= (and b!1350435 (not res!895894)) b!1350436))

(declare-fun m!1237657 () Bool)

(assert (=> d!144933 m!1237657))

(declare-fun m!1237661 () Bool)

(assert (=> d!144933 m!1237661))

(declare-fun m!1237663 () Bool)

(assert (=> b!1350436 m!1237663))

(assert (=> b!1350389 d!144933))

(declare-fun d!144937 () Bool)

(assert (=> d!144937 (= (array_inv!33503 a!3742) (bvsge (size!45025 a!3742) #b00000000000000000000000000000000))))

(assert (=> start!113854 d!144937))

(declare-fun d!144941 () Bool)

(declare-fun lt!596976 () Bool)

(assert (=> d!144941 (= lt!596976 (select (content!671 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!768241 () Bool)

(assert (=> d!144941 (= lt!596976 e!768241)))

(declare-fun res!895897 () Bool)

(assert (=> d!144941 (=> (not res!895897) (not e!768241))))

(assert (=> d!144941 (= res!895897 ((_ is Cons!31512) acc!759))))

(assert (=> d!144941 (= (contains!9225 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000) lt!596976)))

(declare-fun b!1350439 () Bool)

(declare-fun e!768242 () Bool)

(assert (=> b!1350439 (= e!768241 e!768242)))

(declare-fun res!895898 () Bool)

(assert (=> b!1350439 (=> res!895898 e!768242)))

(assert (=> b!1350439 (= res!895898 (= (h!32721 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1350440 () Bool)

(assert (=> b!1350440 (= e!768242 (contains!9225 (t!46174 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!144941 res!895897) b!1350439))

(assert (= (and b!1350439 (not res!895898)) b!1350440))

(assert (=> d!144941 m!1237657))

(declare-fun m!1237669 () Bool)

(assert (=> d!144941 m!1237669))

(declare-fun m!1237671 () Bool)

(assert (=> b!1350440 m!1237671))

(assert (=> b!1350388 d!144941))

(declare-fun d!144943 () Bool)

(declare-fun res!895903 () Bool)

(declare-fun e!768247 () Bool)

(assert (=> d!144943 (=> res!895903 e!768247)))

(assert (=> d!144943 (= res!895903 ((_ is Nil!31513) Nil!31513))))

(assert (=> d!144943 (= (noDuplicate!2082 Nil!31513) e!768247)))

(declare-fun b!1350445 () Bool)

(declare-fun e!768248 () Bool)

(assert (=> b!1350445 (= e!768247 e!768248)))

(declare-fun res!895904 () Bool)

(assert (=> b!1350445 (=> (not res!895904) (not e!768248))))

(assert (=> b!1350445 (= res!895904 (not (contains!9225 (t!46174 Nil!31513) (h!32721 Nil!31513))))))

(declare-fun b!1350446 () Bool)

(assert (=> b!1350446 (= e!768248 (noDuplicate!2082 (t!46174 Nil!31513)))))

(assert (= (and d!144943 (not res!895903)) b!1350445))

(assert (= (and b!1350445 res!895904) b!1350446))

(declare-fun m!1237673 () Bool)

(assert (=> b!1350445 m!1237673))

(declare-fun m!1237675 () Bool)

(assert (=> b!1350446 m!1237675))

(assert (=> b!1350387 d!144943))

(check-sat (not b!1350420) (not d!144925) (not b!1350436) (not b!1350446) (not b!1350432) (not d!144921) (not b!1350418) (not b!1350431) (not d!144941) (not d!144933) (not b!1350440) (not b!1350445))
(check-sat)
