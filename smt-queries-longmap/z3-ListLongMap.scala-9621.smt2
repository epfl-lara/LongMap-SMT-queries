; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113830 () Bool)

(assert start!113830)

(declare-fun b!1350282 () Bool)

(declare-fun res!895744 () Bool)

(declare-fun e!768133 () Bool)

(assert (=> b!1350282 (=> (not res!895744) (not e!768133))))

(declare-datatypes ((List!31513 0))(
  ( (Nil!31510) (Cons!31509 (h!32718 (_ BitVec 64)) (t!46171 List!31513)) )
))
(declare-fun acc!759 () List!31513)

(declare-fun contains!9222 (List!31513 (_ BitVec 64)) Bool)

(assert (=> b!1350282 (= res!895744 (not (contains!9222 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1350283 () Bool)

(declare-fun res!895741 () Bool)

(assert (=> b!1350283 (=> (not res!895741) (not e!768133))))

(assert (=> b!1350283 (= res!895741 (not (contains!9222 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!895743 () Bool)

(assert (=> start!113830 (=> (not res!895743) (not e!768133))))

(declare-datatypes ((array!92042 0))(
  ( (array!92043 (arr!44472 (Array (_ BitVec 32) (_ BitVec 64))) (size!45022 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92042)

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> start!113830 (= res!895743 (and (bvslt (size!45022 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45022 a!3742))))))

(assert (=> start!113830 e!768133))

(declare-fun array_inv!33500 (array!92042) Bool)

(assert (=> start!113830 (array_inv!33500 a!3742)))

(assert (=> start!113830 true))

(declare-fun b!1350284 () Bool)

(declare-fun noDuplicate!2079 (List!31513) Bool)

(assert (=> b!1350284 (= e!768133 (not (noDuplicate!2079 Nil!31510)))))

(declare-fun b!1350285 () Bool)

(declare-fun res!895742 () Bool)

(assert (=> b!1350285 (=> (not res!895742) (not e!768133))))

(assert (=> b!1350285 (= res!895742 (noDuplicate!2079 acc!759))))

(declare-fun b!1350286 () Bool)

(declare-fun res!895740 () Bool)

(assert (=> b!1350286 (=> (not res!895740) (not e!768133))))

(assert (=> b!1350286 (= res!895740 (bvsle #b00000000000000000000000000000000 (size!45022 a!3742)))))

(assert (= (and start!113830 res!895743) b!1350285))

(assert (= (and b!1350285 res!895742) b!1350282))

(assert (= (and b!1350282 res!895744) b!1350283))

(assert (= (and b!1350283 res!895741) b!1350286))

(assert (= (and b!1350286 res!895740) b!1350284))

(declare-fun m!1237517 () Bool)

(assert (=> b!1350282 m!1237517))

(declare-fun m!1237519 () Bool)

(assert (=> start!113830 m!1237519))

(declare-fun m!1237521 () Bool)

(assert (=> b!1350283 m!1237521))

(declare-fun m!1237523 () Bool)

(assert (=> b!1350284 m!1237523))

(declare-fun m!1237525 () Bool)

(assert (=> b!1350285 m!1237525))

(check-sat (not b!1350285) (not b!1350284) (not start!113830) (not b!1350282) (not b!1350283))
(check-sat)
(get-model)

(declare-fun d!144889 () Bool)

(declare-fun lt!596956 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!668 (List!31513) (InoxSet (_ BitVec 64)))

(assert (=> d!144889 (= lt!596956 (select (content!668 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!768144 () Bool)

(assert (=> d!144889 (= lt!596956 e!768144)))

(declare-fun res!895765 () Bool)

(assert (=> d!144889 (=> (not res!895765) (not e!768144))))

(get-info :version)

(assert (=> d!144889 (= res!895765 ((_ is Cons!31509) acc!759))))

(assert (=> d!144889 (= (contains!9222 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000) lt!596956)))

(declare-fun b!1350306 () Bool)

(declare-fun e!768145 () Bool)

(assert (=> b!1350306 (= e!768144 e!768145)))

(declare-fun res!895764 () Bool)

(assert (=> b!1350306 (=> res!895764 e!768145)))

(assert (=> b!1350306 (= res!895764 (= (h!32718 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1350307 () Bool)

(assert (=> b!1350307 (= e!768145 (contains!9222 (t!46171 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!144889 res!895765) b!1350306))

(assert (= (and b!1350306 (not res!895764)) b!1350307))

(declare-fun m!1237537 () Bool)

(assert (=> d!144889 m!1237537))

(declare-fun m!1237539 () Bool)

(assert (=> d!144889 m!1237539))

(declare-fun m!1237541 () Bool)

(assert (=> b!1350307 m!1237541))

(assert (=> b!1350283 d!144889))

(declare-fun d!144895 () Bool)

(declare-fun res!895778 () Bool)

(declare-fun e!768158 () Bool)

(assert (=> d!144895 (=> res!895778 e!768158)))

(assert (=> d!144895 (= res!895778 ((_ is Nil!31510) Nil!31510))))

(assert (=> d!144895 (= (noDuplicate!2079 Nil!31510) e!768158)))

(declare-fun b!1350320 () Bool)

(declare-fun e!768159 () Bool)

(assert (=> b!1350320 (= e!768158 e!768159)))

(declare-fun res!895779 () Bool)

(assert (=> b!1350320 (=> (not res!895779) (not e!768159))))

(assert (=> b!1350320 (= res!895779 (not (contains!9222 (t!46171 Nil!31510) (h!32718 Nil!31510))))))

(declare-fun b!1350321 () Bool)

(assert (=> b!1350321 (= e!768159 (noDuplicate!2079 (t!46171 Nil!31510)))))

(assert (= (and d!144895 (not res!895778)) b!1350320))

(assert (= (and b!1350320 res!895779) b!1350321))

(declare-fun m!1237547 () Bool)

(assert (=> b!1350320 m!1237547))

(declare-fun m!1237549 () Bool)

(assert (=> b!1350321 m!1237549))

(assert (=> b!1350284 d!144895))

(declare-fun d!144901 () Bool)

(declare-fun res!895782 () Bool)

(declare-fun e!768162 () Bool)

(assert (=> d!144901 (=> res!895782 e!768162)))

(assert (=> d!144901 (= res!895782 ((_ is Nil!31510) acc!759))))

(assert (=> d!144901 (= (noDuplicate!2079 acc!759) e!768162)))

(declare-fun b!1350324 () Bool)

(declare-fun e!768163 () Bool)

(assert (=> b!1350324 (= e!768162 e!768163)))

(declare-fun res!895783 () Bool)

(assert (=> b!1350324 (=> (not res!895783) (not e!768163))))

(assert (=> b!1350324 (= res!895783 (not (contains!9222 (t!46171 acc!759) (h!32718 acc!759))))))

(declare-fun b!1350325 () Bool)

(assert (=> b!1350325 (= e!768163 (noDuplicate!2079 (t!46171 acc!759)))))

(assert (= (and d!144901 (not res!895782)) b!1350324))

(assert (= (and b!1350324 res!895783) b!1350325))

(declare-fun m!1237551 () Bool)

(assert (=> b!1350324 m!1237551))

(declare-fun m!1237553 () Bool)

(assert (=> b!1350325 m!1237553))

(assert (=> b!1350285 d!144901))

(declare-fun d!144903 () Bool)

(assert (=> d!144903 (= (array_inv!33500 a!3742) (bvsge (size!45022 a!3742) #b00000000000000000000000000000000))))

(assert (=> start!113830 d!144903))

(declare-fun d!144905 () Bool)

(declare-fun lt!596960 () Bool)

(assert (=> d!144905 (= lt!596960 (select (content!668 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!768166 () Bool)

(assert (=> d!144905 (= lt!596960 e!768166)))

(declare-fun res!895787 () Bool)

(assert (=> d!144905 (=> (not res!895787) (not e!768166))))

(assert (=> d!144905 (= res!895787 ((_ is Cons!31509) acc!759))))

(assert (=> d!144905 (= (contains!9222 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000) lt!596960)))

(declare-fun b!1350328 () Bool)

(declare-fun e!768167 () Bool)

(assert (=> b!1350328 (= e!768166 e!768167)))

(declare-fun res!895786 () Bool)

(assert (=> b!1350328 (=> res!895786 e!768167)))

(assert (=> b!1350328 (= res!895786 (= (h!32718 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1350329 () Bool)

(assert (=> b!1350329 (= e!768167 (contains!9222 (t!46171 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!144905 res!895787) b!1350328))

(assert (= (and b!1350328 (not res!895786)) b!1350329))

(assert (=> d!144905 m!1237537))

(declare-fun m!1237561 () Bool)

(assert (=> d!144905 m!1237561))

(declare-fun m!1237563 () Bool)

(assert (=> b!1350329 m!1237563))

(assert (=> b!1350282 d!144905))

(check-sat (not b!1350329) (not b!1350324) (not d!144905) (not b!1350307) (not b!1350320) (not b!1350325) (not b!1350321) (not d!144889))
(check-sat)
