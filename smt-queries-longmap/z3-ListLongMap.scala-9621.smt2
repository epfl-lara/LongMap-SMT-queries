; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113828 () Bool)

(assert start!113828)

(declare-fun b!1350197 () Bool)

(declare-fun res!895699 () Bool)

(declare-fun e!768094 () Bool)

(assert (=> b!1350197 (=> (not res!895699) (not e!768094))))

(declare-datatypes ((List!31565 0))(
  ( (Nil!31562) (Cons!31561 (h!32770 (_ BitVec 64)) (t!46215 List!31565)) )
))
(declare-fun acc!759 () List!31565)

(declare-fun noDuplicate!2100 (List!31565) Bool)

(assert (=> b!1350197 (= res!895699 (noDuplicate!2100 acc!759))))

(declare-fun b!1350198 () Bool)

(declare-fun res!895700 () Bool)

(assert (=> b!1350198 (=> (not res!895700) (not e!768094))))

(declare-fun contains!9185 (List!31565 (_ BitVec 64)) Bool)

(assert (=> b!1350198 (= res!895700 (not (contains!9185 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1350200 () Bool)

(declare-fun res!895696 () Bool)

(assert (=> b!1350200 (=> (not res!895696) (not e!768094))))

(assert (=> b!1350200 (= res!895696 (not (contains!9185 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1350201 () Bool)

(assert (=> b!1350201 (= e!768094 (not (noDuplicate!2100 Nil!31562)))))

(declare-fun res!895698 () Bool)

(assert (=> start!113828 (=> (not res!895698) (not e!768094))))

(declare-datatypes ((array!91989 0))(
  ( (array!91990 (arr!44446 (Array (_ BitVec 32) (_ BitVec 64))) (size!44998 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!91989)

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> start!113828 (= res!895698 (and (bvslt (size!44998 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!44998 a!3742))))))

(assert (=> start!113828 e!768094))

(declare-fun array_inv!33679 (array!91989) Bool)

(assert (=> start!113828 (array_inv!33679 a!3742)))

(assert (=> start!113828 true))

(declare-fun b!1350199 () Bool)

(declare-fun res!895697 () Bool)

(assert (=> b!1350199 (=> (not res!895697) (not e!768094))))

(assert (=> b!1350199 (= res!895697 (bvsle #b00000000000000000000000000000000 (size!44998 a!3742)))))

(assert (= (and start!113828 res!895698) b!1350197))

(assert (= (and b!1350197 res!895699) b!1350200))

(assert (= (and b!1350200 res!895696) b!1350198))

(assert (= (and b!1350198 res!895700) b!1350199))

(assert (= (and b!1350199 res!895697) b!1350201))

(declare-fun m!1236991 () Bool)

(assert (=> b!1350198 m!1236991))

(declare-fun m!1236993 () Bool)

(assert (=> b!1350201 m!1236993))

(declare-fun m!1236995 () Bool)

(assert (=> b!1350200 m!1236995))

(declare-fun m!1236997 () Bool)

(assert (=> start!113828 m!1236997))

(declare-fun m!1236999 () Bool)

(assert (=> b!1350197 m!1236999))

(check-sat (not b!1350200) (not b!1350201) (not b!1350197) (not b!1350198) (not start!113828))
(check-sat)
(get-model)

(declare-fun d!144773 () Bool)

(declare-fun res!895735 () Bool)

(declare-fun e!768111 () Bool)

(assert (=> d!144773 (=> res!895735 e!768111)))

(get-info :version)

(assert (=> d!144773 (= res!895735 ((_ is Nil!31562) Nil!31562))))

(assert (=> d!144773 (= (noDuplicate!2100 Nil!31562) e!768111)))

(declare-fun b!1350236 () Bool)

(declare-fun e!768112 () Bool)

(assert (=> b!1350236 (= e!768111 e!768112)))

(declare-fun res!895736 () Bool)

(assert (=> b!1350236 (=> (not res!895736) (not e!768112))))

(assert (=> b!1350236 (= res!895736 (not (contains!9185 (t!46215 Nil!31562) (h!32770 Nil!31562))))))

(declare-fun b!1350237 () Bool)

(assert (=> b!1350237 (= e!768112 (noDuplicate!2100 (t!46215 Nil!31562)))))

(assert (= (and d!144773 (not res!895735)) b!1350236))

(assert (= (and b!1350236 res!895736) b!1350237))

(declare-fun m!1237021 () Bool)

(assert (=> b!1350236 m!1237021))

(declare-fun m!1237023 () Bool)

(assert (=> b!1350237 m!1237023))

(assert (=> b!1350201 d!144773))

(declare-fun d!144775 () Bool)

(assert (=> d!144775 (= (array_inv!33679 a!3742) (bvsge (size!44998 a!3742) #b00000000000000000000000000000000))))

(assert (=> start!113828 d!144775))

(declare-fun d!144777 () Bool)

(declare-fun res!895737 () Bool)

(declare-fun e!768113 () Bool)

(assert (=> d!144777 (=> res!895737 e!768113)))

(assert (=> d!144777 (= res!895737 ((_ is Nil!31562) acc!759))))

(assert (=> d!144777 (= (noDuplicate!2100 acc!759) e!768113)))

(declare-fun b!1350238 () Bool)

(declare-fun e!768114 () Bool)

(assert (=> b!1350238 (= e!768113 e!768114)))

(declare-fun res!895738 () Bool)

(assert (=> b!1350238 (=> (not res!895738) (not e!768114))))

(assert (=> b!1350238 (= res!895738 (not (contains!9185 (t!46215 acc!759) (h!32770 acc!759))))))

(declare-fun b!1350239 () Bool)

(assert (=> b!1350239 (= e!768114 (noDuplicate!2100 (t!46215 acc!759)))))

(assert (= (and d!144777 (not res!895737)) b!1350238))

(assert (= (and b!1350238 res!895738) b!1350239))

(declare-fun m!1237025 () Bool)

(assert (=> b!1350238 m!1237025))

(declare-fun m!1237027 () Bool)

(assert (=> b!1350239 m!1237027))

(assert (=> b!1350197 d!144777))

(declare-fun d!144781 () Bool)

(declare-fun lt!596774 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!668 (List!31565) (InoxSet (_ BitVec 64)))

(assert (=> d!144781 (= lt!596774 (select (content!668 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!768130 () Bool)

(assert (=> d!144781 (= lt!596774 e!768130)))

(declare-fun res!895753 () Bool)

(assert (=> d!144781 (=> (not res!895753) (not e!768130))))

(assert (=> d!144781 (= res!895753 ((_ is Cons!31561) acc!759))))

(assert (=> d!144781 (= (contains!9185 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000) lt!596774)))

(declare-fun b!1350252 () Bool)

(declare-fun e!768128 () Bool)

(assert (=> b!1350252 (= e!768130 e!768128)))

(declare-fun res!895751 () Bool)

(assert (=> b!1350252 (=> res!895751 e!768128)))

(assert (=> b!1350252 (= res!895751 (= (h!32770 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1350253 () Bool)

(assert (=> b!1350253 (= e!768128 (contains!9185 (t!46215 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!144781 res!895753) b!1350252))

(assert (= (and b!1350252 (not res!895751)) b!1350253))

(declare-fun m!1237029 () Bool)

(assert (=> d!144781 m!1237029))

(declare-fun m!1237033 () Bool)

(assert (=> d!144781 m!1237033))

(declare-fun m!1237037 () Bool)

(assert (=> b!1350253 m!1237037))

(assert (=> b!1350198 d!144781))

(declare-fun d!144785 () Bool)

(declare-fun lt!596777 () Bool)

(assert (=> d!144785 (= lt!596777 (select (content!668 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!768134 () Bool)

(assert (=> d!144785 (= lt!596777 e!768134)))

(declare-fun res!895758 () Bool)

(assert (=> d!144785 (=> (not res!895758) (not e!768134))))

(assert (=> d!144785 (= res!895758 ((_ is Cons!31561) acc!759))))

(assert (=> d!144785 (= (contains!9185 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000) lt!596777)))

(declare-fun b!1350258 () Bool)

(declare-fun e!768133 () Bool)

(assert (=> b!1350258 (= e!768134 e!768133)))

(declare-fun res!895757 () Bool)

(assert (=> b!1350258 (=> res!895757 e!768133)))

(assert (=> b!1350258 (= res!895757 (= (h!32770 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1350259 () Bool)

(assert (=> b!1350259 (= e!768133 (contains!9185 (t!46215 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!144785 res!895758) b!1350258))

(assert (= (and b!1350258 (not res!895757)) b!1350259))

(assert (=> d!144785 m!1237029))

(declare-fun m!1237047 () Bool)

(assert (=> d!144785 m!1237047))

(declare-fun m!1237051 () Bool)

(assert (=> b!1350259 m!1237051))

(assert (=> b!1350200 d!144785))

(check-sat (not b!1350237) (not d!144785) (not b!1350253) (not b!1350239) (not b!1350259) (not d!144781) (not b!1350238) (not b!1350236))
(check-sat)
