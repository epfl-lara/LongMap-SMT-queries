; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114508 () Bool)

(assert start!114508)

(declare-fun b!1359086 () Bool)

(declare-fun res!903631 () Bool)

(declare-fun e!771202 () Bool)

(assert (=> b!1359086 (=> (not res!903631) (not e!771202))))

(declare-fun from!3120 () (_ BitVec 32))

(declare-datatypes ((array!92504 0))(
  ( (array!92505 (arr!44694 (Array (_ BitVec 32) (_ BitVec 64))) (size!45244 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92504)

(assert (=> b!1359086 (= res!903631 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45244 a!3742)))))

(declare-fun b!1359087 () Bool)

(declare-fun res!903623 () Bool)

(assert (=> b!1359087 (=> (not res!903623) (not e!771202))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1359087 (= res!903623 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45244 a!3742))))))

(declare-fun b!1359088 () Bool)

(declare-datatypes ((Unit!44742 0))(
  ( (Unit!44743) )
))
(declare-fun e!771201 () Unit!44742)

(declare-fun Unit!44744 () Unit!44742)

(assert (=> b!1359088 (= e!771201 Unit!44744)))

(declare-fun b!1359089 () Bool)

(declare-fun res!903629 () Bool)

(assert (=> b!1359089 (=> (not res!903629) (not e!771202))))

(declare-datatypes ((List!31735 0))(
  ( (Nil!31732) (Cons!31731 (h!32940 (_ BitVec 64)) (t!46405 List!31735)) )
))
(declare-fun acc!759 () List!31735)

(declare-fun arrayNoDuplicates!0 (array!92504 (_ BitVec 32) List!31735) Bool)

(assert (=> b!1359089 (= res!903629 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1359090 () Bool)

(declare-fun e!771200 () Bool)

(assert (=> b!1359090 (= e!771202 e!771200)))

(declare-fun res!903630 () Bool)

(assert (=> b!1359090 (=> (not res!903630) (not e!771200))))

(assert (=> b!1359090 (= res!903630 (and (= from!3120 i!1404) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-fun lt!599515 () Unit!44742)

(assert (=> b!1359090 (= lt!599515 e!771201)))

(declare-fun c!127172 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1359090 (= c!127172 (validKeyInArray!0 (select (arr!44694 a!3742) from!3120)))))

(declare-fun res!903627 () Bool)

(assert (=> start!114508 (=> (not res!903627) (not e!771202))))

(assert (=> start!114508 (= res!903627 (and (bvslt (size!45244 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45244 a!3742))))))

(assert (=> start!114508 e!771202))

(assert (=> start!114508 true))

(declare-fun array_inv!33722 (array!92504) Bool)

(assert (=> start!114508 (array_inv!33722 a!3742)))

(declare-fun b!1359091 () Bool)

(declare-fun res!903622 () Bool)

(assert (=> b!1359091 (=> (not res!903622) (not e!771202))))

(declare-fun contains!9444 (List!31735 (_ BitVec 64)) Bool)

(assert (=> b!1359091 (= res!903622 (not (contains!9444 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1359092 () Bool)

(declare-fun res!903625 () Bool)

(assert (=> b!1359092 (=> (not res!903625) (not e!771202))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1359092 (= res!903625 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1359093 () Bool)

(declare-fun res!903628 () Bool)

(assert (=> b!1359093 (=> (not res!903628) (not e!771202))))

(assert (=> b!1359093 (= res!903628 (not (contains!9444 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1359094 () Bool)

(assert (=> b!1359094 (= e!771200 (not (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))))

(declare-fun b!1359095 () Bool)

(declare-fun res!903624 () Bool)

(assert (=> b!1359095 (=> (not res!903624) (not e!771202))))

(declare-fun noDuplicate!2301 (List!31735) Bool)

(assert (=> b!1359095 (= res!903624 (noDuplicate!2301 acc!759))))

(declare-fun b!1359096 () Bool)

(declare-fun res!903626 () Bool)

(assert (=> b!1359096 (=> (not res!903626) (not e!771202))))

(assert (=> b!1359096 (= res!903626 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31732))))

(declare-fun b!1359097 () Bool)

(declare-fun lt!599513 () Unit!44742)

(assert (=> b!1359097 (= e!771201 lt!599513)))

(declare-fun lt!599514 () Unit!44742)

(declare-fun lemmaListSubSeqRefl!0 (List!31735) Unit!44742)

(assert (=> b!1359097 (= lt!599514 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!846 (List!31735 List!31735) Bool)

(assert (=> b!1359097 (subseq!846 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92504 List!31735 List!31735 (_ BitVec 32)) Unit!44742)

(declare-fun $colon$colon!849 (List!31735 (_ BitVec 64)) List!31735)

(assert (=> b!1359097 (= lt!599513 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!849 acc!759 (select (arr!44694 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1359097 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(assert (= (and start!114508 res!903627) b!1359095))

(assert (= (and b!1359095 res!903624) b!1359091))

(assert (= (and b!1359091 res!903622) b!1359093))

(assert (= (and b!1359093 res!903628) b!1359096))

(assert (= (and b!1359096 res!903626) b!1359089))

(assert (= (and b!1359089 res!903629) b!1359087))

(assert (= (and b!1359087 res!903623) b!1359092))

(assert (= (and b!1359092 res!903625) b!1359086))

(assert (= (and b!1359086 res!903631) b!1359090))

(assert (= (and b!1359090 c!127172) b!1359097))

(assert (= (and b!1359090 (not c!127172)) b!1359088))

(assert (= (and b!1359090 res!903630) b!1359094))

(declare-fun m!1244567 () Bool)

(assert (=> b!1359091 m!1244567))

(declare-fun m!1244569 () Bool)

(assert (=> b!1359093 m!1244569))

(declare-fun m!1244571 () Bool)

(assert (=> b!1359097 m!1244571))

(declare-fun m!1244573 () Bool)

(assert (=> b!1359097 m!1244573))

(declare-fun m!1244575 () Bool)

(assert (=> b!1359097 m!1244575))

(declare-fun m!1244577 () Bool)

(assert (=> b!1359097 m!1244577))

(declare-fun m!1244579 () Bool)

(assert (=> b!1359097 m!1244579))

(assert (=> b!1359097 m!1244573))

(assert (=> b!1359097 m!1244575))

(declare-fun m!1244581 () Bool)

(assert (=> b!1359097 m!1244581))

(declare-fun m!1244583 () Bool)

(assert (=> b!1359095 m!1244583))

(declare-fun m!1244585 () Bool)

(assert (=> start!114508 m!1244585))

(assert (=> b!1359090 m!1244573))

(assert (=> b!1359090 m!1244573))

(declare-fun m!1244587 () Bool)

(assert (=> b!1359090 m!1244587))

(declare-fun m!1244589 () Bool)

(assert (=> b!1359089 m!1244589))

(assert (=> b!1359094 m!1244579))

(declare-fun m!1244591 () Bool)

(assert (=> b!1359092 m!1244591))

(declare-fun m!1244593 () Bool)

(assert (=> b!1359096 m!1244593))

(check-sat (not b!1359097) (not b!1359096) (not b!1359093) (not b!1359094) (not b!1359092) (not b!1359091) (not b!1359095) (not start!114508) (not b!1359089) (not b!1359090))
(check-sat)
(get-model)

(declare-fun b!1359144 () Bool)

(declare-fun e!771224 () Bool)

(declare-fun e!771223 () Bool)

(assert (=> b!1359144 (= e!771224 e!771223)))

(declare-fun res!903669 () Bool)

(assert (=> b!1359144 (=> (not res!903669) (not e!771223))))

(declare-fun e!771225 () Bool)

(assert (=> b!1359144 (= res!903669 (not e!771225))))

(declare-fun res!903668 () Bool)

(assert (=> b!1359144 (=> (not res!903668) (not e!771225))))

(assert (=> b!1359144 (= res!903668 (validKeyInArray!0 (select (arr!44694 a!3742) #b00000000000000000000000000000000)))))

(declare-fun b!1359145 () Bool)

(assert (=> b!1359145 (= e!771225 (contains!9444 Nil!31732 (select (arr!44694 a!3742) #b00000000000000000000000000000000)))))

(declare-fun b!1359146 () Bool)

(declare-fun e!771226 () Bool)

(declare-fun call!65294 () Bool)

(assert (=> b!1359146 (= e!771226 call!65294)))

(declare-fun b!1359147 () Bool)

(assert (=> b!1359147 (= e!771223 e!771226)))

(declare-fun c!127178 () Bool)

(assert (=> b!1359147 (= c!127178 (validKeyInArray!0 (select (arr!44694 a!3742) #b00000000000000000000000000000000)))))

(declare-fun b!1359148 () Bool)

(assert (=> b!1359148 (= e!771226 call!65294)))

(declare-fun bm!65291 () Bool)

(assert (=> bm!65291 (= call!65294 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!127178 (Cons!31731 (select (arr!44694 a!3742) #b00000000000000000000000000000000) Nil!31732) Nil!31732)))))

(declare-fun d!145457 () Bool)

(declare-fun res!903670 () Bool)

(assert (=> d!145457 (=> res!903670 e!771224)))

(assert (=> d!145457 (= res!903670 (bvsge #b00000000000000000000000000000000 (size!45244 a!3742)))))

(assert (=> d!145457 (= (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31732) e!771224)))

(assert (= (and d!145457 (not res!903670)) b!1359144))

(assert (= (and b!1359144 res!903668) b!1359145))

(assert (= (and b!1359144 res!903669) b!1359147))

(assert (= (and b!1359147 c!127178) b!1359146))

(assert (= (and b!1359147 (not c!127178)) b!1359148))

(assert (= (or b!1359146 b!1359148) bm!65291))

(declare-fun m!1244623 () Bool)

(assert (=> b!1359144 m!1244623))

(assert (=> b!1359144 m!1244623))

(declare-fun m!1244625 () Bool)

(assert (=> b!1359144 m!1244625))

(assert (=> b!1359145 m!1244623))

(assert (=> b!1359145 m!1244623))

(declare-fun m!1244627 () Bool)

(assert (=> b!1359145 m!1244627))

(assert (=> b!1359147 m!1244623))

(assert (=> b!1359147 m!1244623))

(assert (=> b!1359147 m!1244625))

(assert (=> bm!65291 m!1244623))

(declare-fun m!1244629 () Bool)

(assert (=> bm!65291 m!1244629))

(assert (=> b!1359096 d!145457))

(declare-fun d!145459 () Bool)

(declare-fun lt!599527 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!684 (List!31735) (InoxSet (_ BitVec 64)))

(assert (=> d!145459 (= lt!599527 (select (content!684 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!771232 () Bool)

(assert (=> d!145459 (= lt!599527 e!771232)))

(declare-fun res!903675 () Bool)

(assert (=> d!145459 (=> (not res!903675) (not e!771232))))

(get-info :version)

(assert (=> d!145459 (= res!903675 ((_ is Cons!31731) acc!759))))

(assert (=> d!145459 (= (contains!9444 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000) lt!599527)))

(declare-fun b!1359153 () Bool)

(declare-fun e!771231 () Bool)

(assert (=> b!1359153 (= e!771232 e!771231)))

(declare-fun res!903676 () Bool)

(assert (=> b!1359153 (=> res!903676 e!771231)))

(assert (=> b!1359153 (= res!903676 (= (h!32940 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1359154 () Bool)

(assert (=> b!1359154 (= e!771231 (contains!9444 (t!46405 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!145459 res!903675) b!1359153))

(assert (= (and b!1359153 (not res!903676)) b!1359154))

(declare-fun m!1244631 () Bool)

(assert (=> d!145459 m!1244631))

(declare-fun m!1244633 () Bool)

(assert (=> d!145459 m!1244633))

(declare-fun m!1244635 () Bool)

(assert (=> b!1359154 m!1244635))

(assert (=> b!1359091 d!145459))

(declare-fun d!145463 () Bool)

(assert (=> d!145463 (= (validKeyInArray!0 (select (arr!44694 a!3742) from!3120)) (and (not (= (select (arr!44694 a!3742) from!3120) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!44694 a!3742) from!3120) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1359090 d!145463))

(declare-fun d!145469 () Bool)

(declare-fun res!903685 () Bool)

(declare-fun e!771241 () Bool)

(assert (=> d!145469 (=> res!903685 e!771241)))

(assert (=> d!145469 (= res!903685 ((_ is Nil!31732) acc!759))))

(assert (=> d!145469 (= (noDuplicate!2301 acc!759) e!771241)))

(declare-fun b!1359163 () Bool)

(declare-fun e!771242 () Bool)

(assert (=> b!1359163 (= e!771241 e!771242)))

(declare-fun res!903686 () Bool)

(assert (=> b!1359163 (=> (not res!903686) (not e!771242))))

(assert (=> b!1359163 (= res!903686 (not (contains!9444 (t!46405 acc!759) (h!32940 acc!759))))))

(declare-fun b!1359164 () Bool)

(assert (=> b!1359164 (= e!771242 (noDuplicate!2301 (t!46405 acc!759)))))

(assert (= (and d!145469 (not res!903685)) b!1359163))

(assert (= (and b!1359163 res!903686) b!1359164))

(declare-fun m!1244637 () Bool)

(assert (=> b!1359163 m!1244637))

(declare-fun m!1244639 () Bool)

(assert (=> b!1359164 m!1244639))

(assert (=> b!1359095 d!145469))

(declare-fun b!1359165 () Bool)

(declare-fun e!771244 () Bool)

(declare-fun e!771243 () Bool)

(assert (=> b!1359165 (= e!771244 e!771243)))

(declare-fun res!903688 () Bool)

(assert (=> b!1359165 (=> (not res!903688) (not e!771243))))

(declare-fun e!771245 () Bool)

(assert (=> b!1359165 (= res!903688 (not e!771245))))

(declare-fun res!903687 () Bool)

(assert (=> b!1359165 (=> (not res!903687) (not e!771245))))

(assert (=> b!1359165 (= res!903687 (validKeyInArray!0 (select (arr!44694 a!3742) (bvadd #b00000000000000000000000000000001 from!3120))))))

(declare-fun b!1359166 () Bool)

(assert (=> b!1359166 (= e!771245 (contains!9444 acc!759 (select (arr!44694 a!3742) (bvadd #b00000000000000000000000000000001 from!3120))))))

(declare-fun b!1359167 () Bool)

(declare-fun e!771246 () Bool)

(declare-fun call!65295 () Bool)

(assert (=> b!1359167 (= e!771246 call!65295)))

(declare-fun b!1359168 () Bool)

(assert (=> b!1359168 (= e!771243 e!771246)))

(declare-fun c!127179 () Bool)

(assert (=> b!1359168 (= c!127179 (validKeyInArray!0 (select (arr!44694 a!3742) (bvadd #b00000000000000000000000000000001 from!3120))))))

(declare-fun b!1359169 () Bool)

(assert (=> b!1359169 (= e!771246 call!65295)))

(declare-fun bm!65292 () Bool)

(assert (=> bm!65292 (= call!65295 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120 #b00000000000000000000000000000001) (ite c!127179 (Cons!31731 (select (arr!44694 a!3742) (bvadd #b00000000000000000000000000000001 from!3120)) acc!759) acc!759)))))

(declare-fun d!145475 () Bool)

(declare-fun res!903689 () Bool)

(assert (=> d!145475 (=> res!903689 e!771244)))

(assert (=> d!145475 (= res!903689 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) (size!45244 a!3742)))))

(assert (=> d!145475 (= (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759) e!771244)))

(assert (= (and d!145475 (not res!903689)) b!1359165))

(assert (= (and b!1359165 res!903687) b!1359166))

(assert (= (and b!1359165 res!903688) b!1359168))

(assert (= (and b!1359168 c!127179) b!1359167))

(assert (= (and b!1359168 (not c!127179)) b!1359169))

(assert (= (or b!1359167 b!1359169) bm!65292))

(declare-fun m!1244641 () Bool)

(assert (=> b!1359165 m!1244641))

(assert (=> b!1359165 m!1244641))

(declare-fun m!1244643 () Bool)

(assert (=> b!1359165 m!1244643))

(assert (=> b!1359166 m!1244641))

(assert (=> b!1359166 m!1244641))

(declare-fun m!1244645 () Bool)

(assert (=> b!1359166 m!1244645))

(assert (=> b!1359168 m!1244641))

(assert (=> b!1359168 m!1244641))

(assert (=> b!1359168 m!1244643))

(assert (=> bm!65292 m!1244641))

(declare-fun m!1244649 () Bool)

(assert (=> bm!65292 m!1244649))

(assert (=> b!1359094 d!145475))

(declare-fun b!1359172 () Bool)

(declare-fun e!771250 () Bool)

(declare-fun e!771249 () Bool)

(assert (=> b!1359172 (= e!771250 e!771249)))

(declare-fun res!903693 () Bool)

(assert (=> b!1359172 (=> (not res!903693) (not e!771249))))

(declare-fun e!771251 () Bool)

(assert (=> b!1359172 (= res!903693 (not e!771251))))

(declare-fun res!903692 () Bool)

(assert (=> b!1359172 (=> (not res!903692) (not e!771251))))

(assert (=> b!1359172 (= res!903692 (validKeyInArray!0 (select (arr!44694 a!3742) from!3120)))))

(declare-fun b!1359173 () Bool)

(assert (=> b!1359173 (= e!771251 (contains!9444 acc!759 (select (arr!44694 a!3742) from!3120)))))

(declare-fun b!1359174 () Bool)

(declare-fun e!771252 () Bool)

(declare-fun call!65296 () Bool)

(assert (=> b!1359174 (= e!771252 call!65296)))

(declare-fun b!1359175 () Bool)

(assert (=> b!1359175 (= e!771249 e!771252)))

(declare-fun c!127180 () Bool)

(assert (=> b!1359175 (= c!127180 (validKeyInArray!0 (select (arr!44694 a!3742) from!3120)))))

(declare-fun b!1359176 () Bool)

(assert (=> b!1359176 (= e!771252 call!65296)))

(declare-fun bm!65293 () Bool)

(assert (=> bm!65293 (= call!65296 (arrayNoDuplicates!0 a!3742 (bvadd from!3120 #b00000000000000000000000000000001) (ite c!127180 (Cons!31731 (select (arr!44694 a!3742) from!3120) acc!759) acc!759)))))

(declare-fun d!145477 () Bool)

(declare-fun res!903694 () Bool)

(assert (=> d!145477 (=> res!903694 e!771250)))

(assert (=> d!145477 (= res!903694 (bvsge from!3120 (size!45244 a!3742)))))

(assert (=> d!145477 (= (arrayNoDuplicates!0 a!3742 from!3120 acc!759) e!771250)))

(assert (= (and d!145477 (not res!903694)) b!1359172))

(assert (= (and b!1359172 res!903692) b!1359173))

(assert (= (and b!1359172 res!903693) b!1359175))

(assert (= (and b!1359175 c!127180) b!1359174))

(assert (= (and b!1359175 (not c!127180)) b!1359176))

(assert (= (or b!1359174 b!1359176) bm!65293))

(assert (=> b!1359172 m!1244573))

(assert (=> b!1359172 m!1244573))

(assert (=> b!1359172 m!1244587))

(assert (=> b!1359173 m!1244573))

(assert (=> b!1359173 m!1244573))

(declare-fun m!1244655 () Bool)

(assert (=> b!1359173 m!1244655))

(assert (=> b!1359175 m!1244573))

(assert (=> b!1359175 m!1244573))

(assert (=> b!1359175 m!1244587))

(assert (=> bm!65293 m!1244573))

(declare-fun m!1244657 () Bool)

(assert (=> bm!65293 m!1244657))

(assert (=> b!1359089 d!145477))

(declare-fun d!145481 () Bool)

(declare-fun lt!599531 () Bool)

(assert (=> d!145481 (= lt!599531 (select (content!684 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!771260 () Bool)

(assert (=> d!145481 (= lt!599531 e!771260)))

(declare-fun res!903701 () Bool)

(assert (=> d!145481 (=> (not res!903701) (not e!771260))))

(assert (=> d!145481 (= res!903701 ((_ is Cons!31731) acc!759))))

(assert (=> d!145481 (= (contains!9444 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000) lt!599531)))

(declare-fun b!1359181 () Bool)

(declare-fun e!771259 () Bool)

(assert (=> b!1359181 (= e!771260 e!771259)))

(declare-fun res!903702 () Bool)

(assert (=> b!1359181 (=> res!903702 e!771259)))

(assert (=> b!1359181 (= res!903702 (= (h!32940 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1359182 () Bool)

(assert (=> b!1359182 (= e!771259 (contains!9444 (t!46405 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!145481 res!903701) b!1359181))

(assert (= (and b!1359181 (not res!903702)) b!1359182))

(assert (=> d!145481 m!1244631))

(declare-fun m!1244659 () Bool)

(assert (=> d!145481 m!1244659))

(declare-fun m!1244661 () Bool)

(assert (=> b!1359182 m!1244661))

(assert (=> b!1359093 d!145481))

(declare-fun d!145483 () Bool)

(assert (=> d!145483 (= (validKeyInArray!0 l!3587) (and (not (= l!3587 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= l!3587 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1359092 d!145483))

(declare-fun d!145485 () Bool)

(assert (=> d!145485 (= (array_inv!33722 a!3742) (bvsge (size!45244 a!3742) #b00000000000000000000000000000000))))

(assert (=> start!114508 d!145485))

(declare-fun d!145487 () Bool)

(assert (=> d!145487 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun lt!599537 () Unit!44742)

(declare-fun choose!80 (array!92504 List!31735 List!31735 (_ BitVec 32)) Unit!44742)

(assert (=> d!145487 (= lt!599537 (choose!80 a!3742 ($colon$colon!849 acc!759 (select (arr!44694 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> d!145487 (bvslt (size!45244 a!3742) #b01111111111111111111111111111111)))

(assert (=> d!145487 (= (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!849 acc!759 (select (arr!44694 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)) lt!599537)))

(declare-fun bs!38974 () Bool)

(assert (= bs!38974 d!145487))

(assert (=> bs!38974 m!1244579))

(assert (=> bs!38974 m!1244575))

(declare-fun m!1244671 () Bool)

(assert (=> bs!38974 m!1244671))

(assert (=> b!1359097 d!145487))

(declare-fun d!145491 () Bool)

(declare-fun res!903732 () Bool)

(declare-fun e!771295 () Bool)

(assert (=> d!145491 (=> res!903732 e!771295)))

(assert (=> d!145491 (= res!903732 ((_ is Nil!31732) acc!759))))

(assert (=> d!145491 (= (subseq!846 acc!759 acc!759) e!771295)))

(declare-fun b!1359221 () Bool)

(declare-fun e!771296 () Bool)

(declare-fun e!771293 () Bool)

(assert (=> b!1359221 (= e!771296 e!771293)))

(declare-fun res!903735 () Bool)

(assert (=> b!1359221 (=> res!903735 e!771293)))

(declare-fun e!771294 () Bool)

(assert (=> b!1359221 (= res!903735 e!771294)))

(declare-fun res!903734 () Bool)

(assert (=> b!1359221 (=> (not res!903734) (not e!771294))))

(assert (=> b!1359221 (= res!903734 (= (h!32940 acc!759) (h!32940 acc!759)))))

(declare-fun b!1359223 () Bool)

(assert (=> b!1359223 (= e!771293 (subseq!846 acc!759 (t!46405 acc!759)))))

(declare-fun b!1359220 () Bool)

(assert (=> b!1359220 (= e!771295 e!771296)))

(declare-fun res!903733 () Bool)

(assert (=> b!1359220 (=> (not res!903733) (not e!771296))))

(assert (=> b!1359220 (= res!903733 ((_ is Cons!31731) acc!759))))

(declare-fun b!1359222 () Bool)

(assert (=> b!1359222 (= e!771294 (subseq!846 (t!46405 acc!759) (t!46405 acc!759)))))

(assert (= (and d!145491 (not res!903732)) b!1359220))

(assert (= (and b!1359220 res!903733) b!1359221))

(assert (= (and b!1359221 res!903734) b!1359222))

(assert (= (and b!1359221 (not res!903735)) b!1359223))

(declare-fun m!1244683 () Bool)

(assert (=> b!1359223 m!1244683))

(declare-fun m!1244685 () Bool)

(assert (=> b!1359222 m!1244685))

(assert (=> b!1359097 d!145491))

(assert (=> b!1359097 d!145475))

(declare-fun d!145501 () Bool)

(assert (=> d!145501 (= ($colon$colon!849 acc!759 (select (arr!44694 a!3742) from!3120)) (Cons!31731 (select (arr!44694 a!3742) from!3120) acc!759))))

(assert (=> b!1359097 d!145501))

(declare-fun d!145503 () Bool)

(assert (=> d!145503 (subseq!846 acc!759 acc!759)))

(declare-fun lt!599542 () Unit!44742)

(declare-fun choose!36 (List!31735) Unit!44742)

(assert (=> d!145503 (= lt!599542 (choose!36 acc!759))))

(assert (=> d!145503 (= (lemmaListSubSeqRefl!0 acc!759) lt!599542)))

(declare-fun bs!38975 () Bool)

(assert (= bs!38975 d!145503))

(assert (=> bs!38975 m!1244581))

(declare-fun m!1244687 () Bool)

(assert (=> bs!38975 m!1244687))

(assert (=> b!1359097 d!145503))

(check-sat (not d!145503) (not b!1359154) (not bm!65291) (not b!1359165) (not b!1359175) (not bm!65293) (not bm!65292) (not b!1359164) (not b!1359168) (not b!1359145) (not b!1359166) (not b!1359182) (not b!1359223) (not b!1359172) (not d!145487) (not d!145481) (not b!1359222) (not b!1359144) (not b!1359163) (not b!1359173) (not b!1359147) (not d!145459))
(check-sat)
