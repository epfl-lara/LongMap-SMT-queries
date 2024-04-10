; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103220 () Bool)

(assert start!103220)

(declare-fun b!1239086 () Bool)

(declare-fun res!826632 () Bool)

(declare-fun e!702178 () Bool)

(assert (=> b!1239086 (=> (not res!826632) (not e!702178))))

(declare-datatypes ((array!79855 0))(
  ( (array!79856 (arr!38529 (Array (_ BitVec 32) (_ BitVec 64))) (size!39065 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79855)

(declare-datatypes ((List!27302 0))(
  ( (Nil!27299) (Cons!27298 (h!28507 (_ BitVec 64)) (t!40765 List!27302)) )
))
(declare-fun acc!846 () List!27302)

(declare-fun from!3213 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!79855 (_ BitVec 32) List!27302) Bool)

(assert (=> b!1239086 (= res!826632 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1239087 () Bool)

(declare-fun res!826634 () Bool)

(assert (=> b!1239087 (=> (not res!826634) (not e!702178))))

(declare-fun contains!7364 (List!27302 (_ BitVec 64)) Bool)

(assert (=> b!1239087 (= res!826634 (not (contains!7364 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1239088 () Bool)

(declare-fun res!826635 () Bool)

(assert (=> b!1239088 (=> (not res!826635) (not e!702178))))

(assert (=> b!1239088 (= res!826635 (not (contains!7364 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1239089 () Bool)

(declare-datatypes ((Unit!41164 0))(
  ( (Unit!41165) )
))
(declare-fun e!702179 () Unit!41164)

(declare-fun Unit!41166 () Unit!41164)

(assert (=> b!1239089 (= e!702179 Unit!41166)))

(declare-fun res!826637 () Bool)

(assert (=> start!103220 (=> (not res!826637) (not e!702178))))

(assert (=> start!103220 (= res!826637 (and (bvslt (size!39065 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!39065 a!3835))))))

(assert (=> start!103220 e!702178))

(declare-fun array_inv!29377 (array!79855) Bool)

(assert (=> start!103220 (array_inv!29377 a!3835)))

(assert (=> start!103220 true))

(declare-fun b!1239090 () Bool)

(declare-fun e!702177 () Bool)

(assert (=> b!1239090 (= e!702177 (not (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846)))))

(declare-fun b!1239091 () Bool)

(declare-fun res!826636 () Bool)

(assert (=> b!1239091 (=> (not res!826636) (not e!702178))))

(assert (=> b!1239091 (= res!826636 (not (= from!3213 (bvsub (size!39065 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1239092 () Bool)

(declare-fun res!826639 () Bool)

(assert (=> b!1239092 (=> (not res!826639) (not e!702178))))

(declare-fun k0!2925 () (_ BitVec 64))

(assert (=> b!1239092 (= res!826639 (contains!7364 acc!846 k0!2925))))

(declare-fun b!1239093 () Bool)

(assert (=> b!1239093 (= e!702178 e!702177)))

(declare-fun res!826638 () Bool)

(assert (=> b!1239093 (=> (not res!826638) (not e!702177))))

(assert (=> b!1239093 (= res!826638 (and (bvsge (bvadd #b00000000000000000000000000000001 from!3213) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3213) (size!39065 a!3835))))))

(declare-fun lt!561594 () Unit!41164)

(assert (=> b!1239093 (= lt!561594 e!702179)))

(declare-fun c!121087 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1239093 (= c!121087 (validKeyInArray!0 (select (arr!38529 a!3835) from!3213)))))

(declare-fun b!1239094 () Bool)

(declare-fun lt!561592 () Unit!41164)

(assert (=> b!1239094 (= e!702179 lt!561592)))

(declare-fun lt!561595 () List!27302)

(assert (=> b!1239094 (= lt!561595 (Cons!27298 (select (arr!38529 a!3835) from!3213) acc!846))))

(declare-fun lt!561593 () Unit!41164)

(declare-fun lemmaListSubSeqRefl!0 (List!27302) Unit!41164)

(assert (=> b!1239094 (= lt!561593 (lemmaListSubSeqRefl!0 lt!561595))))

(declare-fun subseq!618 (List!27302 List!27302) Bool)

(assert (=> b!1239094 (subseq!618 lt!561595 lt!561595)))

(declare-fun lt!561596 () Unit!41164)

(declare-fun subseqTail!105 (List!27302 List!27302) Unit!41164)

(assert (=> b!1239094 (= lt!561596 (subseqTail!105 lt!561595 lt!561595))))

(assert (=> b!1239094 (subseq!618 acc!846 lt!561595)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79855 List!27302 List!27302 (_ BitVec 32)) Unit!41164)

(assert (=> b!1239094 (= lt!561592 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3835 lt!561595 acc!846 (bvadd #b00000000000000000000000000000001 from!3213)))))

(assert (=> b!1239094 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846)))

(declare-fun b!1239095 () Bool)

(declare-fun res!826633 () Bool)

(assert (=> b!1239095 (=> (not res!826633) (not e!702178))))

(declare-fun noDuplicate!1961 (List!27302) Bool)

(assert (=> b!1239095 (= res!826633 (noDuplicate!1961 acc!846))))

(assert (= (and start!103220 res!826637) b!1239095))

(assert (= (and b!1239095 res!826633) b!1239088))

(assert (= (and b!1239088 res!826635) b!1239087))

(assert (= (and b!1239087 res!826634) b!1239086))

(assert (= (and b!1239086 res!826632) b!1239092))

(assert (= (and b!1239092 res!826639) b!1239091))

(assert (= (and b!1239091 res!826636) b!1239093))

(assert (= (and b!1239093 c!121087) b!1239094))

(assert (= (and b!1239093 (not c!121087)) b!1239089))

(assert (= (and b!1239093 res!826638) b!1239090))

(declare-fun m!1142603 () Bool)

(assert (=> b!1239092 m!1142603))

(declare-fun m!1142605 () Bool)

(assert (=> b!1239086 m!1142605))

(declare-fun m!1142607 () Bool)

(assert (=> b!1239088 m!1142607))

(declare-fun m!1142609 () Bool)

(assert (=> b!1239093 m!1142609))

(assert (=> b!1239093 m!1142609))

(declare-fun m!1142611 () Bool)

(assert (=> b!1239093 m!1142611))

(declare-fun m!1142613 () Bool)

(assert (=> b!1239095 m!1142613))

(declare-fun m!1142615 () Bool)

(assert (=> b!1239094 m!1142615))

(declare-fun m!1142617 () Bool)

(assert (=> b!1239094 m!1142617))

(declare-fun m!1142619 () Bool)

(assert (=> b!1239094 m!1142619))

(declare-fun m!1142621 () Bool)

(assert (=> b!1239094 m!1142621))

(declare-fun m!1142623 () Bool)

(assert (=> b!1239094 m!1142623))

(assert (=> b!1239094 m!1142609))

(declare-fun m!1142625 () Bool)

(assert (=> b!1239094 m!1142625))

(assert (=> b!1239090 m!1142623))

(declare-fun m!1142627 () Bool)

(assert (=> start!103220 m!1142627))

(declare-fun m!1142629 () Bool)

(assert (=> b!1239087 m!1142629))

(check-sat (not b!1239094) (not b!1239095) (not b!1239086) (not b!1239090) (not b!1239093) (not start!103220) (not b!1239088) (not b!1239092) (not b!1239087))
(check-sat)
(get-model)

(declare-fun d!135959 () Bool)

(declare-fun lt!561614 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!593 (List!27302) (InoxSet (_ BitVec 64)))

(assert (=> d!135959 (= lt!561614 (select (content!593 acc!846) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!702197 () Bool)

(assert (=> d!135959 (= lt!561614 e!702197)))

(declare-fun res!826669 () Bool)

(assert (=> d!135959 (=> (not res!826669) (not e!702197))))

(get-info :version)

(assert (=> d!135959 (= res!826669 ((_ is Cons!27298) acc!846))))

(assert (=> d!135959 (= (contains!7364 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000) lt!561614)))

(declare-fun b!1239130 () Bool)

(declare-fun e!702198 () Bool)

(assert (=> b!1239130 (= e!702197 e!702198)))

(declare-fun res!826668 () Bool)

(assert (=> b!1239130 (=> res!826668 e!702198)))

(assert (=> b!1239130 (= res!826668 (= (h!28507 acc!846) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1239131 () Bool)

(assert (=> b!1239131 (= e!702198 (contains!7364 (t!40765 acc!846) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!135959 res!826669) b!1239130))

(assert (= (and b!1239130 (not res!826668)) b!1239131))

(declare-fun m!1142659 () Bool)

(assert (=> d!135959 m!1142659))

(declare-fun m!1142661 () Bool)

(assert (=> d!135959 m!1142661))

(declare-fun m!1142663 () Bool)

(assert (=> b!1239131 m!1142663))

(assert (=> b!1239087 d!135959))

(declare-fun d!135961 () Bool)

(declare-fun lt!561615 () Bool)

(assert (=> d!135961 (= lt!561615 (select (content!593 acc!846) k0!2925))))

(declare-fun e!702199 () Bool)

(assert (=> d!135961 (= lt!561615 e!702199)))

(declare-fun res!826671 () Bool)

(assert (=> d!135961 (=> (not res!826671) (not e!702199))))

(assert (=> d!135961 (= res!826671 ((_ is Cons!27298) acc!846))))

(assert (=> d!135961 (= (contains!7364 acc!846 k0!2925) lt!561615)))

(declare-fun b!1239132 () Bool)

(declare-fun e!702200 () Bool)

(assert (=> b!1239132 (= e!702199 e!702200)))

(declare-fun res!826670 () Bool)

(assert (=> b!1239132 (=> res!826670 e!702200)))

(assert (=> b!1239132 (= res!826670 (= (h!28507 acc!846) k0!2925))))

(declare-fun b!1239133 () Bool)

(assert (=> b!1239133 (= e!702200 (contains!7364 (t!40765 acc!846) k0!2925))))

(assert (= (and d!135961 res!826671) b!1239132))

(assert (= (and b!1239132 (not res!826670)) b!1239133))

(assert (=> d!135961 m!1142659))

(declare-fun m!1142665 () Bool)

(assert (=> d!135961 m!1142665))

(declare-fun m!1142667 () Bool)

(assert (=> b!1239133 m!1142667))

(assert (=> b!1239092 d!135961))

(declare-fun d!135963 () Bool)

(assert (=> d!135963 (= (validKeyInArray!0 (select (arr!38529 a!3835) from!3213)) (and (not (= (select (arr!38529 a!3835) from!3213) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!38529 a!3835) from!3213) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1239093 d!135963))

(declare-fun d!135965 () Bool)

(declare-fun lt!561616 () Bool)

(assert (=> d!135965 (= lt!561616 (select (content!593 acc!846) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!702201 () Bool)

(assert (=> d!135965 (= lt!561616 e!702201)))

(declare-fun res!826673 () Bool)

(assert (=> d!135965 (=> (not res!826673) (not e!702201))))

(assert (=> d!135965 (= res!826673 ((_ is Cons!27298) acc!846))))

(assert (=> d!135965 (= (contains!7364 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000) lt!561616)))

(declare-fun b!1239134 () Bool)

(declare-fun e!702202 () Bool)

(assert (=> b!1239134 (= e!702201 e!702202)))

(declare-fun res!826672 () Bool)

(assert (=> b!1239134 (=> res!826672 e!702202)))

(assert (=> b!1239134 (= res!826672 (= (h!28507 acc!846) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1239135 () Bool)

(assert (=> b!1239135 (= e!702202 (contains!7364 (t!40765 acc!846) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!135965 res!826673) b!1239134))

(assert (= (and b!1239134 (not res!826672)) b!1239135))

(assert (=> d!135965 m!1142659))

(declare-fun m!1142669 () Bool)

(assert (=> d!135965 m!1142669))

(declare-fun m!1142671 () Bool)

(assert (=> b!1239135 m!1142671))

(assert (=> b!1239088 d!135965))

(declare-fun b!1239147 () Bool)

(declare-fun e!702211 () Bool)

(assert (=> b!1239147 (= e!702211 (subseq!618 acc!846 (t!40765 lt!561595)))))

(declare-fun d!135967 () Bool)

(declare-fun res!826683 () Bool)

(declare-fun e!702212 () Bool)

(assert (=> d!135967 (=> res!826683 e!702212)))

(assert (=> d!135967 (= res!826683 ((_ is Nil!27299) acc!846))))

(assert (=> d!135967 (= (subseq!618 acc!846 lt!561595) e!702212)))

(declare-fun b!1239146 () Bool)

(declare-fun e!702213 () Bool)

(assert (=> b!1239146 (= e!702213 (subseq!618 (t!40765 acc!846) (t!40765 lt!561595)))))

(declare-fun b!1239144 () Bool)

(declare-fun e!702214 () Bool)

(assert (=> b!1239144 (= e!702212 e!702214)))

(declare-fun res!826682 () Bool)

(assert (=> b!1239144 (=> (not res!826682) (not e!702214))))

(assert (=> b!1239144 (= res!826682 ((_ is Cons!27298) lt!561595))))

(declare-fun b!1239145 () Bool)

(assert (=> b!1239145 (= e!702214 e!702211)))

(declare-fun res!826685 () Bool)

(assert (=> b!1239145 (=> res!826685 e!702211)))

(assert (=> b!1239145 (= res!826685 e!702213)))

(declare-fun res!826684 () Bool)

(assert (=> b!1239145 (=> (not res!826684) (not e!702213))))

(assert (=> b!1239145 (= res!826684 (= (h!28507 acc!846) (h!28507 lt!561595)))))

(assert (= (and d!135967 (not res!826683)) b!1239144))

(assert (= (and b!1239144 res!826682) b!1239145))

(assert (= (and b!1239145 res!826684) b!1239146))

(assert (= (and b!1239145 (not res!826685)) b!1239147))

(declare-fun m!1142673 () Bool)

(assert (=> b!1239147 m!1142673))

(declare-fun m!1142675 () Bool)

(assert (=> b!1239146 m!1142675))

(assert (=> b!1239094 d!135967))

(declare-fun b!1239195 () Bool)

(declare-fun c!121102 () Bool)

(declare-fun isEmpty!1016 (List!27302) Bool)

(assert (=> b!1239195 (= c!121102 (not (isEmpty!1016 (t!40765 lt!561595))))))

(declare-fun e!702252 () Unit!41164)

(declare-fun e!702251 () Unit!41164)

(assert (=> b!1239195 (= e!702252 e!702251)))

(declare-fun b!1239196 () Bool)

(declare-fun Unit!41170 () Unit!41164)

(assert (=> b!1239196 (= e!702251 Unit!41170)))

(declare-fun b!1239197 () Bool)

(declare-fun e!702253 () Bool)

(assert (=> b!1239197 (= e!702253 (subseq!618 lt!561595 lt!561595))))

(declare-fun b!1239198 () Bool)

(declare-fun e!702254 () Unit!41164)

(assert (=> b!1239198 (= e!702254 e!702252)))

(declare-fun c!121103 () Bool)

(assert (=> b!1239198 (= c!121103 (subseq!618 lt!561595 (t!40765 lt!561595)))))

(declare-fun b!1239199 () Bool)

(declare-fun call!61083 () Unit!41164)

(assert (=> b!1239199 (= e!702251 call!61083)))

(declare-fun b!1239200 () Bool)

(assert (=> b!1239200 (= e!702252 call!61083)))

(declare-fun b!1239201 () Bool)

(declare-fun Unit!41171 () Unit!41164)

(assert (=> b!1239201 (= e!702254 Unit!41171)))

(declare-fun d!135971 () Bool)

(declare-fun tail!168 (List!27302) List!27302)

(assert (=> d!135971 (subseq!618 (tail!168 lt!561595) lt!561595)))

(declare-fun lt!561623 () Unit!41164)

(assert (=> d!135971 (= lt!561623 e!702254)))

(declare-fun c!121104 () Bool)

(assert (=> d!135971 (= c!121104 (and ((_ is Cons!27298) lt!561595) ((_ is Cons!27298) lt!561595)))))

(assert (=> d!135971 e!702253))

(declare-fun res!826711 () Bool)

(assert (=> d!135971 (=> (not res!826711) (not e!702253))))

(assert (=> d!135971 (= res!826711 (not (isEmpty!1016 lt!561595)))))

(assert (=> d!135971 (= (subseqTail!105 lt!561595 lt!561595) lt!561623)))

(declare-fun bm!61080 () Bool)

(assert (=> bm!61080 (= call!61083 (subseqTail!105 (ite c!121103 lt!561595 (t!40765 lt!561595)) (t!40765 lt!561595)))))

(assert (= (and d!135971 res!826711) b!1239197))

(assert (= (and d!135971 c!121104) b!1239198))

(assert (= (and d!135971 (not c!121104)) b!1239201))

(assert (= (and b!1239198 c!121103) b!1239200))

(assert (= (and b!1239198 (not c!121103)) b!1239195))

(assert (= (and b!1239195 c!121102) b!1239199))

(assert (= (and b!1239195 (not c!121102)) b!1239196))

(assert (= (or b!1239200 b!1239199) bm!61080))

(declare-fun m!1142691 () Bool)

(assert (=> b!1239195 m!1142691))

(declare-fun m!1142693 () Bool)

(assert (=> d!135971 m!1142693))

(assert (=> d!135971 m!1142693))

(declare-fun m!1142695 () Bool)

(assert (=> d!135971 m!1142695))

(declare-fun m!1142697 () Bool)

(assert (=> d!135971 m!1142697))

(assert (=> b!1239197 m!1142617))

(declare-fun m!1142699 () Bool)

(assert (=> b!1239198 m!1142699))

(declare-fun m!1142701 () Bool)

(assert (=> bm!61080 m!1142701))

(assert (=> b!1239094 d!135971))

(declare-fun d!135981 () Bool)

(assert (=> d!135981 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846)))

(declare-fun lt!561629 () Unit!41164)

(declare-fun choose!80 (array!79855 List!27302 List!27302 (_ BitVec 32)) Unit!41164)

(assert (=> d!135981 (= lt!561629 (choose!80 a!3835 lt!561595 acc!846 (bvadd #b00000000000000000000000000000001 from!3213)))))

(assert (=> d!135981 (bvslt (size!39065 a!3835) #b01111111111111111111111111111111)))

(assert (=> d!135981 (= (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3835 lt!561595 acc!846 (bvadd #b00000000000000000000000000000001 from!3213)) lt!561629)))

(declare-fun bs!34841 () Bool)

(assert (= bs!34841 d!135981))

(assert (=> bs!34841 m!1142623))

(declare-fun m!1142717 () Bool)

(assert (=> bs!34841 m!1142717))

(assert (=> b!1239094 d!135981))

(declare-fun b!1239221 () Bool)

(declare-fun e!702269 () Bool)

(assert (=> b!1239221 (= e!702269 (subseq!618 lt!561595 (t!40765 lt!561595)))))

(declare-fun d!135989 () Bool)

(declare-fun res!826725 () Bool)

(declare-fun e!702270 () Bool)

(assert (=> d!135989 (=> res!826725 e!702270)))

(assert (=> d!135989 (= res!826725 ((_ is Nil!27299) lt!561595))))

(assert (=> d!135989 (= (subseq!618 lt!561595 lt!561595) e!702270)))

(declare-fun b!1239220 () Bool)

(declare-fun e!702271 () Bool)

(assert (=> b!1239220 (= e!702271 (subseq!618 (t!40765 lt!561595) (t!40765 lt!561595)))))

(declare-fun b!1239218 () Bool)

(declare-fun e!702272 () Bool)

(assert (=> b!1239218 (= e!702270 e!702272)))

(declare-fun res!826724 () Bool)

(assert (=> b!1239218 (=> (not res!826724) (not e!702272))))

(assert (=> b!1239218 (= res!826724 ((_ is Cons!27298) lt!561595))))

(declare-fun b!1239219 () Bool)

(assert (=> b!1239219 (= e!702272 e!702269)))

(declare-fun res!826727 () Bool)

(assert (=> b!1239219 (=> res!826727 e!702269)))

(assert (=> b!1239219 (= res!826727 e!702271)))

(declare-fun res!826726 () Bool)

(assert (=> b!1239219 (=> (not res!826726) (not e!702271))))

(assert (=> b!1239219 (= res!826726 (= (h!28507 lt!561595) (h!28507 lt!561595)))))

(assert (= (and d!135989 (not res!826725)) b!1239218))

(assert (= (and b!1239218 res!826724) b!1239219))

(assert (= (and b!1239219 res!826726) b!1239220))

(assert (= (and b!1239219 (not res!826727)) b!1239221))

(assert (=> b!1239221 m!1142699))

(declare-fun m!1142723 () Bool)

(assert (=> b!1239220 m!1142723))

(assert (=> b!1239094 d!135989))

(declare-fun d!135995 () Bool)

(assert (=> d!135995 (subseq!618 lt!561595 lt!561595)))

(declare-fun lt!561633 () Unit!41164)

(declare-fun choose!36 (List!27302) Unit!41164)

(assert (=> d!135995 (= lt!561633 (choose!36 lt!561595))))

(assert (=> d!135995 (= (lemmaListSubSeqRefl!0 lt!561595) lt!561633)))

(declare-fun bs!34842 () Bool)

(assert (= bs!34842 d!135995))

(assert (=> bs!34842 m!1142617))

(declare-fun m!1142729 () Bool)

(assert (=> bs!34842 m!1142729))

(assert (=> b!1239094 d!135995))

(declare-fun b!1239253 () Bool)

(declare-fun e!702297 () Bool)

(assert (=> b!1239253 (= e!702297 (contains!7364 acc!846 (select (arr!38529 a!3835) (bvadd #b00000000000000000000000000000001 from!3213))))))

(declare-fun b!1239254 () Bool)

(declare-fun e!702295 () Bool)

(declare-fun e!702298 () Bool)

(assert (=> b!1239254 (= e!702295 e!702298)))

(declare-fun res!826742 () Bool)

(assert (=> b!1239254 (=> (not res!826742) (not e!702298))))

(assert (=> b!1239254 (= res!826742 (not e!702297))))

(declare-fun res!826741 () Bool)

(assert (=> b!1239254 (=> (not res!826741) (not e!702297))))

(assert (=> b!1239254 (= res!826741 (validKeyInArray!0 (select (arr!38529 a!3835) (bvadd #b00000000000000000000000000000001 from!3213))))))

(declare-fun b!1239255 () Bool)

(declare-fun e!702296 () Bool)

(declare-fun call!61091 () Bool)

(assert (=> b!1239255 (= e!702296 call!61091)))

(declare-fun d!136001 () Bool)

(declare-fun res!826743 () Bool)

(assert (=> d!136001 (=> res!826743 e!702295)))

(assert (=> d!136001 (= res!826743 (bvsge (bvadd #b00000000000000000000000000000001 from!3213) (size!39065 a!3835)))))

(assert (=> d!136001 (= (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846) e!702295)))

(declare-fun bm!61088 () Bool)

(declare-fun c!121116 () Bool)

(assert (=> bm!61088 (= call!61091 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213 #b00000000000000000000000000000001) (ite c!121116 (Cons!27298 (select (arr!38529 a!3835) (bvadd #b00000000000000000000000000000001 from!3213)) acc!846) acc!846)))))

(declare-fun b!1239256 () Bool)

(assert (=> b!1239256 (= e!702296 call!61091)))

(declare-fun b!1239257 () Bool)

(assert (=> b!1239257 (= e!702298 e!702296)))

(assert (=> b!1239257 (= c!121116 (validKeyInArray!0 (select (arr!38529 a!3835) (bvadd #b00000000000000000000000000000001 from!3213))))))

(assert (= (and d!136001 (not res!826743)) b!1239254))

(assert (= (and b!1239254 res!826741) b!1239253))

(assert (= (and b!1239254 res!826742) b!1239257))

(assert (= (and b!1239257 c!121116) b!1239256))

(assert (= (and b!1239257 (not c!121116)) b!1239255))

(assert (= (or b!1239256 b!1239255) bm!61088))

(declare-fun m!1142743 () Bool)

(assert (=> b!1239253 m!1142743))

(assert (=> b!1239253 m!1142743))

(declare-fun m!1142745 () Bool)

(assert (=> b!1239253 m!1142745))

(assert (=> b!1239254 m!1142743))

(assert (=> b!1239254 m!1142743))

(declare-fun m!1142747 () Bool)

(assert (=> b!1239254 m!1142747))

(assert (=> bm!61088 m!1142743))

(declare-fun m!1142749 () Bool)

(assert (=> bm!61088 m!1142749))

(assert (=> b!1239257 m!1142743))

(assert (=> b!1239257 m!1142743))

(assert (=> b!1239257 m!1142747))

(assert (=> b!1239094 d!136001))

(declare-fun d!136009 () Bool)

(declare-fun res!826761 () Bool)

(declare-fun e!702319 () Bool)

(assert (=> d!136009 (=> res!826761 e!702319)))

(assert (=> d!136009 (= res!826761 ((_ is Nil!27299) acc!846))))

(assert (=> d!136009 (= (noDuplicate!1961 acc!846) e!702319)))

(declare-fun b!1239281 () Bool)

(declare-fun e!702320 () Bool)

(assert (=> b!1239281 (= e!702319 e!702320)))

(declare-fun res!826762 () Bool)

(assert (=> b!1239281 (=> (not res!826762) (not e!702320))))

(assert (=> b!1239281 (= res!826762 (not (contains!7364 (t!40765 acc!846) (h!28507 acc!846))))))

(declare-fun b!1239282 () Bool)

(assert (=> b!1239282 (= e!702320 (noDuplicate!1961 (t!40765 acc!846)))))

(assert (= (and d!136009 (not res!826761)) b!1239281))

(assert (= (and b!1239281 res!826762) b!1239282))

(declare-fun m!1142767 () Bool)

(assert (=> b!1239281 m!1142767))

(declare-fun m!1142769 () Bool)

(assert (=> b!1239282 m!1142769))

(assert (=> b!1239095 d!136009))

(assert (=> b!1239090 d!136001))

(declare-fun d!136015 () Bool)

(assert (=> d!136015 (= (array_inv!29377 a!3835) (bvsge (size!39065 a!3835) #b00000000000000000000000000000000))))

(assert (=> start!103220 d!136015))

(declare-fun b!1239283 () Bool)

(declare-fun e!702323 () Bool)

(assert (=> b!1239283 (= e!702323 (contains!7364 acc!846 (select (arr!38529 a!3835) from!3213)))))

(declare-fun b!1239284 () Bool)

(declare-fun e!702321 () Bool)

(declare-fun e!702324 () Bool)

(assert (=> b!1239284 (= e!702321 e!702324)))

(declare-fun res!826764 () Bool)

(assert (=> b!1239284 (=> (not res!826764) (not e!702324))))

(assert (=> b!1239284 (= res!826764 (not e!702323))))

(declare-fun res!826763 () Bool)

(assert (=> b!1239284 (=> (not res!826763) (not e!702323))))

(assert (=> b!1239284 (= res!826763 (validKeyInArray!0 (select (arr!38529 a!3835) from!3213)))))

(declare-fun b!1239285 () Bool)

(declare-fun e!702322 () Bool)

(declare-fun call!61093 () Bool)

(assert (=> b!1239285 (= e!702322 call!61093)))

(declare-fun d!136017 () Bool)

(declare-fun res!826765 () Bool)

(assert (=> d!136017 (=> res!826765 e!702321)))

(assert (=> d!136017 (= res!826765 (bvsge from!3213 (size!39065 a!3835)))))

(assert (=> d!136017 (= (arrayNoDuplicates!0 a!3835 from!3213 acc!846) e!702321)))

(declare-fun c!121120 () Bool)

(declare-fun bm!61090 () Bool)

(assert (=> bm!61090 (= call!61093 (arrayNoDuplicates!0 a!3835 (bvadd from!3213 #b00000000000000000000000000000001) (ite c!121120 (Cons!27298 (select (arr!38529 a!3835) from!3213) acc!846) acc!846)))))

(declare-fun b!1239286 () Bool)

(assert (=> b!1239286 (= e!702322 call!61093)))

(declare-fun b!1239287 () Bool)

(assert (=> b!1239287 (= e!702324 e!702322)))

(assert (=> b!1239287 (= c!121120 (validKeyInArray!0 (select (arr!38529 a!3835) from!3213)))))

(assert (= (and d!136017 (not res!826765)) b!1239284))

(assert (= (and b!1239284 res!826763) b!1239283))

(assert (= (and b!1239284 res!826764) b!1239287))

(assert (= (and b!1239287 c!121120) b!1239286))

(assert (= (and b!1239287 (not c!121120)) b!1239285))

(assert (= (or b!1239286 b!1239285) bm!61090))

(assert (=> b!1239283 m!1142609))

(assert (=> b!1239283 m!1142609))

(declare-fun m!1142773 () Bool)

(assert (=> b!1239283 m!1142773))

(assert (=> b!1239284 m!1142609))

(assert (=> b!1239284 m!1142609))

(assert (=> b!1239284 m!1142611))

(assert (=> bm!61090 m!1142609))

(declare-fun m!1142775 () Bool)

(assert (=> bm!61090 m!1142775))

(assert (=> b!1239287 m!1142609))

(assert (=> b!1239287 m!1142609))

(assert (=> b!1239287 m!1142611))

(assert (=> b!1239086 d!136017))

(check-sat (not b!1239254) (not b!1239253) (not bm!61088) (not b!1239131) (not b!1239146) (not b!1239284) (not d!135965) (not d!135995) (not b!1239281) (not b!1239135) (not b!1239282) (not d!135981) (not b!1239283) (not b!1239220) (not b!1239287) (not b!1239257) (not b!1239133) (not b!1239147) (not d!135959) (not b!1239198) (not b!1239195) (not b!1239221) (not d!135971) (not d!135961) (not b!1239197) (not bm!61080) (not bm!61090))
(check-sat)
