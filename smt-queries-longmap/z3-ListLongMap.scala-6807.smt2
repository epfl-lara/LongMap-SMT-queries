; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!85754 () Bool)

(assert start!85754)

(declare-fun b!994944 () Bool)

(declare-fun res!664949 () Bool)

(declare-fun e!561522 () Bool)

(assert (=> b!994944 (=> (not res!664949) (not e!561522))))

(declare-datatypes ((List!20978 0))(
  ( (Nil!20975) (Cons!20974 (h!22142 (_ BitVec 64)) (t!29971 List!20978)) )
))
(declare-fun acc!919 () List!20978)

(declare-fun contains!5872 (List!20978 (_ BitVec 64)) Bool)

(assert (=> b!994944 (= res!664949 (not (contains!5872 acc!919 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((array!62909 0))(
  ( (array!62910 (arr!30292 (Array (_ BitVec 32) (_ BitVec 64))) (size!30789 (_ BitVec 32))) )
))
(declare-fun a!4424 () array!62909)

(declare-fun from!3778 () (_ BitVec 32))

(declare-fun b!994945 () Bool)

(declare-fun arrayNoDuplicates!0 (array!62909 (_ BitVec 32) List!20978) Bool)

(assert (=> b!994945 (= e!561522 (not (arrayNoDuplicates!0 a!4424 from!3778 acc!919)))))

(assert (=> b!994945 (arrayNoDuplicates!0 a!4424 (bvadd #b00000000000000000000000000000001 from!3778) acc!919)))

(declare-datatypes ((Unit!32929 0))(
  ( (Unit!32930) )
))
(declare-fun lt!441026 () Unit!32929)

(declare-fun size!36 () (_ BitVec 32))

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!62909 (_ BitVec 32) (_ BitVec 32) List!20978) Unit!32929)

(assert (=> b!994945 (= lt!441026 (lemmaArrayNoDuplicatesInAll0Array!0 a!4424 (bvadd #b00000000000000000000000000000001 from!3778) size!36 acc!919))))

(declare-fun res!664950 () Bool)

(assert (=> start!85754 (=> (not res!664950) (not e!561522))))

(assert (=> start!85754 (= res!664950 (and (= (size!30789 a!4424) size!36) (bvslt size!36 #b01111111111111111111111111111111) (= a!4424 (array!62910 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!36)) (bvsge from!3778 #b00000000000000000000000000000000) (bvsle from!3778 (size!30789 a!4424))))))

(assert (=> start!85754 e!561522))

(declare-fun array_inv!23428 (array!62909) Bool)

(assert (=> start!85754 (array_inv!23428 a!4424)))

(assert (=> start!85754 true))

(declare-fun b!994946 () Bool)

(declare-fun res!664948 () Bool)

(assert (=> b!994946 (=> (not res!664948) (not e!561522))))

(declare-fun noDuplicate!1457 (List!20978) Bool)

(assert (=> b!994946 (= res!664948 (noDuplicate!1457 acc!919))))

(declare-fun b!994947 () Bool)

(declare-fun res!664952 () Bool)

(assert (=> b!994947 (=> (not res!664952) (not e!561522))))

(assert (=> b!994947 (= res!664952 (and (bvslt from!3778 size!36) (bvsge (bvadd #b00000000000000000000000000000001 from!3778) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!3778) (size!30789 a!4424))))))

(declare-fun b!994948 () Bool)

(declare-fun res!664951 () Bool)

(assert (=> b!994948 (=> (not res!664951) (not e!561522))))

(assert (=> b!994948 (= res!664951 (not (contains!5872 acc!919 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!85754 res!664950) b!994948))

(assert (= (and b!994948 res!664951) b!994944))

(assert (= (and b!994944 res!664949) b!994946))

(assert (= (and b!994946 res!664948) b!994947))

(assert (= (and b!994947 res!664952) b!994945))

(declare-fun m!922943 () Bool)

(assert (=> b!994948 m!922943))

(declare-fun m!922945 () Bool)

(assert (=> b!994944 m!922945))

(declare-fun m!922947 () Bool)

(assert (=> start!85754 m!922947))

(declare-fun m!922949 () Bool)

(assert (=> b!994946 m!922949))

(declare-fun m!922951 () Bool)

(assert (=> b!994945 m!922951))

(declare-fun m!922953 () Bool)

(assert (=> b!994945 m!922953))

(declare-fun m!922955 () Bool)

(assert (=> b!994945 m!922955))

(check-sat (not b!994948) (not b!994945) (not b!994946) (not b!994944) (not start!85754))
(check-sat)
(get-model)

(declare-fun d!118901 () Bool)

(declare-fun res!664987 () Bool)

(declare-fun e!561539 () Bool)

(assert (=> d!118901 (=> res!664987 e!561539)))

(get-info :version)

(assert (=> d!118901 (= res!664987 ((_ is Nil!20975) acc!919))))

(assert (=> d!118901 (= (noDuplicate!1457 acc!919) e!561539)))

(declare-fun b!994983 () Bool)

(declare-fun e!561540 () Bool)

(assert (=> b!994983 (= e!561539 e!561540)))

(declare-fun res!664988 () Bool)

(assert (=> b!994983 (=> (not res!664988) (not e!561540))))

(assert (=> b!994983 (= res!664988 (not (contains!5872 (t!29971 acc!919) (h!22142 acc!919))))))

(declare-fun b!994984 () Bool)

(assert (=> b!994984 (= e!561540 (noDuplicate!1457 (t!29971 acc!919)))))

(assert (= (and d!118901 (not res!664987)) b!994983))

(assert (= (and b!994983 res!664988) b!994984))

(declare-fun m!922985 () Bool)

(assert (=> b!994983 m!922985))

(declare-fun m!922987 () Bool)

(assert (=> b!994984 m!922987))

(assert (=> b!994946 d!118901))

(declare-fun b!995001 () Bool)

(declare-fun e!561555 () Bool)

(assert (=> b!995001 (= e!561555 (contains!5872 acc!919 (select (arr!30292 a!4424) from!3778)))))

(declare-fun d!118903 () Bool)

(declare-fun res!665001 () Bool)

(declare-fun e!561557 () Bool)

(assert (=> d!118903 (=> res!665001 e!561557)))

(assert (=> d!118903 (= res!665001 (bvsge from!3778 (size!30789 a!4424)))))

(assert (=> d!118903 (= (arrayNoDuplicates!0 a!4424 from!3778 acc!919) e!561557)))

(declare-fun b!995002 () Bool)

(declare-fun e!561558 () Bool)

(declare-fun e!561556 () Bool)

(assert (=> b!995002 (= e!561558 e!561556)))

(declare-fun c!101140 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!995002 (= c!101140 (validKeyInArray!0 (select (arr!30292 a!4424) from!3778)))))

(declare-fun b!995003 () Bool)

(declare-fun call!42199 () Bool)

(assert (=> b!995003 (= e!561556 call!42199)))

(declare-fun bm!42196 () Bool)

(assert (=> bm!42196 (= call!42199 (arrayNoDuplicates!0 a!4424 (bvadd from!3778 #b00000000000000000000000000000001) (ite c!101140 (Cons!20974 (select (arr!30292 a!4424) from!3778) acc!919) acc!919)))))

(declare-fun b!995004 () Bool)

(assert (=> b!995004 (= e!561557 e!561558)))

(declare-fun res!665003 () Bool)

(assert (=> b!995004 (=> (not res!665003) (not e!561558))))

(assert (=> b!995004 (= res!665003 (not e!561555))))

(declare-fun res!665002 () Bool)

(assert (=> b!995004 (=> (not res!665002) (not e!561555))))

(assert (=> b!995004 (= res!665002 (validKeyInArray!0 (select (arr!30292 a!4424) from!3778)))))

(declare-fun b!995005 () Bool)

(assert (=> b!995005 (= e!561556 call!42199)))

(assert (= (and d!118903 (not res!665001)) b!995004))

(assert (= (and b!995004 res!665002) b!995001))

(assert (= (and b!995004 res!665003) b!995002))

(assert (= (and b!995002 c!101140) b!995003))

(assert (= (and b!995002 (not c!101140)) b!995005))

(assert (= (or b!995003 b!995005) bm!42196))

(declare-fun m!922993 () Bool)

(assert (=> b!995001 m!922993))

(assert (=> b!995001 m!922993))

(declare-fun m!922995 () Bool)

(assert (=> b!995001 m!922995))

(assert (=> b!995002 m!922993))

(assert (=> b!995002 m!922993))

(declare-fun m!922997 () Bool)

(assert (=> b!995002 m!922997))

(assert (=> bm!42196 m!922993))

(declare-fun m!922999 () Bool)

(assert (=> bm!42196 m!922999))

(assert (=> b!995004 m!922993))

(assert (=> b!995004 m!922993))

(assert (=> b!995004 m!922997))

(assert (=> b!994945 d!118903))

(declare-fun e!561559 () Bool)

(declare-fun b!995006 () Bool)

(assert (=> b!995006 (= e!561559 (contains!5872 acc!919 (select (arr!30292 a!4424) (bvadd #b00000000000000000000000000000001 from!3778))))))

(declare-fun d!118915 () Bool)

(declare-fun res!665004 () Bool)

(declare-fun e!561561 () Bool)

(assert (=> d!118915 (=> res!665004 e!561561)))

(assert (=> d!118915 (= res!665004 (bvsge (bvadd #b00000000000000000000000000000001 from!3778) (size!30789 a!4424)))))

(assert (=> d!118915 (= (arrayNoDuplicates!0 a!4424 (bvadd #b00000000000000000000000000000001 from!3778) acc!919) e!561561)))

(declare-fun b!995007 () Bool)

(declare-fun e!561562 () Bool)

(declare-fun e!561560 () Bool)

(assert (=> b!995007 (= e!561562 e!561560)))

(declare-fun c!101141 () Bool)

(assert (=> b!995007 (= c!101141 (validKeyInArray!0 (select (arr!30292 a!4424) (bvadd #b00000000000000000000000000000001 from!3778))))))

(declare-fun b!995008 () Bool)

(declare-fun call!42200 () Bool)

(assert (=> b!995008 (= e!561560 call!42200)))

(declare-fun bm!42197 () Bool)

(assert (=> bm!42197 (= call!42200 (arrayNoDuplicates!0 a!4424 (bvadd #b00000000000000000000000000000001 from!3778 #b00000000000000000000000000000001) (ite c!101141 (Cons!20974 (select (arr!30292 a!4424) (bvadd #b00000000000000000000000000000001 from!3778)) acc!919) acc!919)))))

(declare-fun b!995009 () Bool)

(assert (=> b!995009 (= e!561561 e!561562)))

(declare-fun res!665006 () Bool)

(assert (=> b!995009 (=> (not res!665006) (not e!561562))))

(assert (=> b!995009 (= res!665006 (not e!561559))))

(declare-fun res!665005 () Bool)

(assert (=> b!995009 (=> (not res!665005) (not e!561559))))

(assert (=> b!995009 (= res!665005 (validKeyInArray!0 (select (arr!30292 a!4424) (bvadd #b00000000000000000000000000000001 from!3778))))))

(declare-fun b!995010 () Bool)

(assert (=> b!995010 (= e!561560 call!42200)))

(assert (= (and d!118915 (not res!665004)) b!995009))

(assert (= (and b!995009 res!665005) b!995006))

(assert (= (and b!995009 res!665006) b!995007))

(assert (= (and b!995007 c!101141) b!995008))

(assert (= (and b!995007 (not c!101141)) b!995010))

(assert (= (or b!995008 b!995010) bm!42197))

(declare-fun m!923001 () Bool)

(assert (=> b!995006 m!923001))

(assert (=> b!995006 m!923001))

(declare-fun m!923003 () Bool)

(assert (=> b!995006 m!923003))

(assert (=> b!995007 m!923001))

(assert (=> b!995007 m!923001))

(declare-fun m!923005 () Bool)

(assert (=> b!995007 m!923005))

(assert (=> bm!42197 m!923001))

(declare-fun m!923007 () Bool)

(assert (=> bm!42197 m!923007))

(assert (=> b!995009 m!923001))

(assert (=> b!995009 m!923001))

(assert (=> b!995009 m!923005))

(assert (=> b!994945 d!118915))

(declare-fun d!118917 () Bool)

(assert (=> d!118917 (arrayNoDuplicates!0 a!4424 (bvadd #b00000000000000000000000000000001 from!3778) acc!919)))

(declare-fun lt!441042 () Unit!32929)

(declare-fun choose!111 (array!62909 (_ BitVec 32) (_ BitVec 32) List!20978) Unit!32929)

(assert (=> d!118917 (= lt!441042 (choose!111 a!4424 (bvadd #b00000000000000000000000000000001 from!3778) size!36 acc!919))))

(assert (=> d!118917 (= (size!30789 a!4424) size!36)))

(assert (=> d!118917 (= (lemmaArrayNoDuplicatesInAll0Array!0 a!4424 (bvadd #b00000000000000000000000000000001 from!3778) size!36 acc!919) lt!441042)))

(declare-fun bs!28355 () Bool)

(assert (= bs!28355 d!118917))

(assert (=> bs!28355 m!922953))

(declare-fun m!923025 () Bool)

(assert (=> bs!28355 m!923025))

(assert (=> b!994945 d!118917))

(declare-fun d!118925 () Bool)

(assert (=> d!118925 (= (array_inv!23428 a!4424) (bvsge (size!30789 a!4424) #b00000000000000000000000000000000))))

(assert (=> start!85754 d!118925))

(declare-fun d!118927 () Bool)

(declare-fun lt!441045 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!477 (List!20978) (InoxSet (_ BitVec 64)))

(assert (=> d!118927 (= lt!441045 (select (content!477 acc!919) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!561597 () Bool)

(assert (=> d!118927 (= lt!441045 e!561597)))

(declare-fun res!665038 () Bool)

(assert (=> d!118927 (=> (not res!665038) (not e!561597))))

(assert (=> d!118927 (= res!665038 ((_ is Cons!20974) acc!919))))

(assert (=> d!118927 (= (contains!5872 acc!919 #b0000000000000000000000000000000000000000000000000000000000000000) lt!441045)))

(declare-fun b!995049 () Bool)

(declare-fun e!561598 () Bool)

(assert (=> b!995049 (= e!561597 e!561598)))

(declare-fun res!665037 () Bool)

(assert (=> b!995049 (=> res!665037 e!561598)))

(assert (=> b!995049 (= res!665037 (= (h!22142 acc!919) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!995050 () Bool)

(assert (=> b!995050 (= e!561598 (contains!5872 (t!29971 acc!919) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!118927 res!665038) b!995049))

(assert (= (and b!995049 (not res!665037)) b!995050))

(declare-fun m!923027 () Bool)

(assert (=> d!118927 m!923027))

(declare-fun m!923029 () Bool)

(assert (=> d!118927 m!923029))

(declare-fun m!923031 () Bool)

(assert (=> b!995050 m!923031))

(assert (=> b!994948 d!118927))

(declare-fun d!118929 () Bool)

(declare-fun lt!441046 () Bool)

(assert (=> d!118929 (= lt!441046 (select (content!477 acc!919) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!561599 () Bool)

(assert (=> d!118929 (= lt!441046 e!561599)))

(declare-fun res!665040 () Bool)

(assert (=> d!118929 (=> (not res!665040) (not e!561599))))

(assert (=> d!118929 (= res!665040 ((_ is Cons!20974) acc!919))))

(assert (=> d!118929 (= (contains!5872 acc!919 #b1000000000000000000000000000000000000000000000000000000000000000) lt!441046)))

(declare-fun b!995051 () Bool)

(declare-fun e!561600 () Bool)

(assert (=> b!995051 (= e!561599 e!561600)))

(declare-fun res!665039 () Bool)

(assert (=> b!995051 (=> res!665039 e!561600)))

(assert (=> b!995051 (= res!665039 (= (h!22142 acc!919) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!995052 () Bool)

(assert (=> b!995052 (= e!561600 (contains!5872 (t!29971 acc!919) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!118929 res!665040) b!995051))

(assert (= (and b!995051 (not res!665039)) b!995052))

(assert (=> d!118929 m!923027))

(declare-fun m!923033 () Bool)

(assert (=> d!118929 m!923033))

(declare-fun m!923035 () Bool)

(assert (=> b!995052 m!923035))

(assert (=> b!994944 d!118929))

(check-sat (not b!994983) (not b!995001) (not b!995006) (not d!118929) (not b!995050) (not d!118927) (not b!995002) (not b!995009) (not bm!42196) (not b!995004) (not b!994984) (not b!995052) (not d!118917) (not b!995007) (not bm!42197))
(check-sat)
(get-model)

(declare-fun d!118943 () Bool)

(assert (=> d!118943 (= (validKeyInArray!0 (select (arr!30292 a!4424) (bvadd #b00000000000000000000000000000001 from!3778))) (and (not (= (select (arr!30292 a!4424) (bvadd #b00000000000000000000000000000001 from!3778)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!30292 a!4424) (bvadd #b00000000000000000000000000000001 from!3778)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!995007 d!118943))

(declare-fun d!118945 () Bool)

(assert (=> d!118945 (= (validKeyInArray!0 (select (arr!30292 a!4424) from!3778)) (and (not (= (select (arr!30292 a!4424) from!3778) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!30292 a!4424) from!3778) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!995004 d!118945))

(declare-fun d!118947 () Bool)

(declare-fun res!665061 () Bool)

(declare-fun e!561625 () Bool)

(assert (=> d!118947 (=> res!665061 e!561625)))

(assert (=> d!118947 (= res!665061 ((_ is Nil!20975) (t!29971 acc!919)))))

(assert (=> d!118947 (= (noDuplicate!1457 (t!29971 acc!919)) e!561625)))

(declare-fun b!995081 () Bool)

(declare-fun e!561626 () Bool)

(assert (=> b!995081 (= e!561625 e!561626)))

(declare-fun res!665062 () Bool)

(assert (=> b!995081 (=> (not res!665062) (not e!561626))))

(assert (=> b!995081 (= res!665062 (not (contains!5872 (t!29971 (t!29971 acc!919)) (h!22142 (t!29971 acc!919)))))))

(declare-fun b!995082 () Bool)

(assert (=> b!995082 (= e!561626 (noDuplicate!1457 (t!29971 (t!29971 acc!919))))))

(assert (= (and d!118947 (not res!665061)) b!995081))

(assert (= (and b!995081 res!665062) b!995082))

(declare-fun m!923081 () Bool)

(assert (=> b!995081 m!923081))

(declare-fun m!923083 () Bool)

(assert (=> b!995082 m!923083))

(assert (=> b!994984 d!118947))

(declare-fun d!118949 () Bool)

(declare-fun c!101152 () Bool)

(assert (=> d!118949 (= c!101152 ((_ is Nil!20975) acc!919))))

(declare-fun e!561629 () (InoxSet (_ BitVec 64)))

(assert (=> d!118949 (= (content!477 acc!919) e!561629)))

(declare-fun b!995087 () Bool)

(assert (=> b!995087 (= e!561629 ((as const (Array (_ BitVec 64) Bool)) false))))

(declare-fun b!995088 () Bool)

(assert (=> b!995088 (= e!561629 ((_ map or) (store ((as const (Array (_ BitVec 64) Bool)) false) (h!22142 acc!919) true) (content!477 (t!29971 acc!919))))))

(assert (= (and d!118949 c!101152) b!995087))

(assert (= (and d!118949 (not c!101152)) b!995088))

(declare-fun m!923085 () Bool)

(assert (=> b!995088 m!923085))

(declare-fun m!923087 () Bool)

(assert (=> b!995088 m!923087))

(assert (=> d!118929 d!118949))

(assert (=> b!995009 d!118943))

(declare-fun e!561630 () Bool)

(declare-fun b!995089 () Bool)

(assert (=> b!995089 (= e!561630 (contains!5872 (ite c!101141 (Cons!20974 (select (arr!30292 a!4424) (bvadd #b00000000000000000000000000000001 from!3778)) acc!919) acc!919) (select (arr!30292 a!4424) (bvadd #b00000000000000000000000000000001 from!3778 #b00000000000000000000000000000001))))))

(declare-fun d!118951 () Bool)

(declare-fun res!665063 () Bool)

(declare-fun e!561632 () Bool)

(assert (=> d!118951 (=> res!665063 e!561632)))

(assert (=> d!118951 (= res!665063 (bvsge (bvadd #b00000000000000000000000000000001 from!3778 #b00000000000000000000000000000001) (size!30789 a!4424)))))

(assert (=> d!118951 (= (arrayNoDuplicates!0 a!4424 (bvadd #b00000000000000000000000000000001 from!3778 #b00000000000000000000000000000001) (ite c!101141 (Cons!20974 (select (arr!30292 a!4424) (bvadd #b00000000000000000000000000000001 from!3778)) acc!919) acc!919)) e!561632)))

(declare-fun b!995090 () Bool)

(declare-fun e!561633 () Bool)

(declare-fun e!561631 () Bool)

(assert (=> b!995090 (= e!561633 e!561631)))

(declare-fun c!101153 () Bool)

(assert (=> b!995090 (= c!101153 (validKeyInArray!0 (select (arr!30292 a!4424) (bvadd #b00000000000000000000000000000001 from!3778 #b00000000000000000000000000000001))))))

(declare-fun b!995091 () Bool)

(declare-fun call!42209 () Bool)

(assert (=> b!995091 (= e!561631 call!42209)))

(declare-fun bm!42206 () Bool)

(assert (=> bm!42206 (= call!42209 (arrayNoDuplicates!0 a!4424 (bvadd #b00000000000000000000000000000001 from!3778 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!101153 (Cons!20974 (select (arr!30292 a!4424) (bvadd #b00000000000000000000000000000001 from!3778 #b00000000000000000000000000000001)) (ite c!101141 (Cons!20974 (select (arr!30292 a!4424) (bvadd #b00000000000000000000000000000001 from!3778)) acc!919) acc!919)) (ite c!101141 (Cons!20974 (select (arr!30292 a!4424) (bvadd #b00000000000000000000000000000001 from!3778)) acc!919) acc!919))))))

(declare-fun b!995092 () Bool)

(assert (=> b!995092 (= e!561632 e!561633)))

(declare-fun res!665065 () Bool)

(assert (=> b!995092 (=> (not res!665065) (not e!561633))))

(assert (=> b!995092 (= res!665065 (not e!561630))))

(declare-fun res!665064 () Bool)

(assert (=> b!995092 (=> (not res!665064) (not e!561630))))

(assert (=> b!995092 (= res!665064 (validKeyInArray!0 (select (arr!30292 a!4424) (bvadd #b00000000000000000000000000000001 from!3778 #b00000000000000000000000000000001))))))

(declare-fun b!995093 () Bool)

(assert (=> b!995093 (= e!561631 call!42209)))

(assert (= (and d!118951 (not res!665063)) b!995092))

(assert (= (and b!995092 res!665064) b!995089))

(assert (= (and b!995092 res!665065) b!995090))

(assert (= (and b!995090 c!101153) b!995091))

(assert (= (and b!995090 (not c!101153)) b!995093))

(assert (= (or b!995091 b!995093) bm!42206))

(declare-fun m!923089 () Bool)

(assert (=> b!995089 m!923089))

(assert (=> b!995089 m!923089))

(declare-fun m!923091 () Bool)

(assert (=> b!995089 m!923091))

(assert (=> b!995090 m!923089))

(assert (=> b!995090 m!923089))

(declare-fun m!923093 () Bool)

(assert (=> b!995090 m!923093))

(assert (=> bm!42206 m!923089))

(declare-fun m!923095 () Bool)

(assert (=> bm!42206 m!923095))

(assert (=> b!995092 m!923089))

(assert (=> b!995092 m!923089))

(assert (=> b!995092 m!923093))

(assert (=> bm!42197 d!118951))

(declare-fun d!118953 () Bool)

(declare-fun lt!441054 () Bool)

(assert (=> d!118953 (= lt!441054 (select (content!477 (t!29971 acc!919)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!561634 () Bool)

(assert (=> d!118953 (= lt!441054 e!561634)))

(declare-fun res!665067 () Bool)

(assert (=> d!118953 (=> (not res!665067) (not e!561634))))

(assert (=> d!118953 (= res!665067 ((_ is Cons!20974) (t!29971 acc!919)))))

(assert (=> d!118953 (= (contains!5872 (t!29971 acc!919) #b0000000000000000000000000000000000000000000000000000000000000000) lt!441054)))

(declare-fun b!995094 () Bool)

(declare-fun e!561635 () Bool)

(assert (=> b!995094 (= e!561634 e!561635)))

(declare-fun res!665066 () Bool)

(assert (=> b!995094 (=> res!665066 e!561635)))

(assert (=> b!995094 (= res!665066 (= (h!22142 (t!29971 acc!919)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!995095 () Bool)

(assert (=> b!995095 (= e!561635 (contains!5872 (t!29971 (t!29971 acc!919)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!118953 res!665067) b!995094))

(assert (= (and b!995094 (not res!665066)) b!995095))

(assert (=> d!118953 m!923087))

(declare-fun m!923097 () Bool)

(assert (=> d!118953 m!923097))

(declare-fun m!923099 () Bool)

(assert (=> b!995095 m!923099))

(assert (=> b!995050 d!118953))

(assert (=> d!118927 d!118949))

(assert (=> b!995002 d!118945))

(declare-fun lt!441055 () Bool)

(declare-fun d!118955 () Bool)

(assert (=> d!118955 (= lt!441055 (select (content!477 acc!919) (select (arr!30292 a!4424) from!3778)))))

(declare-fun e!561636 () Bool)

(assert (=> d!118955 (= lt!441055 e!561636)))

(declare-fun res!665069 () Bool)

(assert (=> d!118955 (=> (not res!665069) (not e!561636))))

(assert (=> d!118955 (= res!665069 ((_ is Cons!20974) acc!919))))

(assert (=> d!118955 (= (contains!5872 acc!919 (select (arr!30292 a!4424) from!3778)) lt!441055)))

(declare-fun b!995096 () Bool)

(declare-fun e!561637 () Bool)

(assert (=> b!995096 (= e!561636 e!561637)))

(declare-fun res!665068 () Bool)

(assert (=> b!995096 (=> res!665068 e!561637)))

(assert (=> b!995096 (= res!665068 (= (h!22142 acc!919) (select (arr!30292 a!4424) from!3778)))))

(declare-fun b!995097 () Bool)

(assert (=> b!995097 (= e!561637 (contains!5872 (t!29971 acc!919) (select (arr!30292 a!4424) from!3778)))))

(assert (= (and d!118955 res!665069) b!995096))

(assert (= (and b!995096 (not res!665068)) b!995097))

(assert (=> d!118955 m!923027))

(assert (=> d!118955 m!922993))

(declare-fun m!923101 () Bool)

(assert (=> d!118955 m!923101))

(assert (=> b!995097 m!922993))

(declare-fun m!923103 () Bool)

(assert (=> b!995097 m!923103))

(assert (=> b!995001 d!118955))

(assert (=> d!118917 d!118915))

(declare-fun d!118957 () Bool)

(assert (=> d!118957 (arrayNoDuplicates!0 a!4424 (bvadd #b00000000000000000000000000000001 from!3778) acc!919)))

(assert (=> d!118957 true))

(declare-fun res!665072 () Unit!32929)

(assert (=> d!118957 (= (choose!111 a!4424 (bvadd #b00000000000000000000000000000001 from!3778) size!36 acc!919) res!665072)))

(declare-fun bs!28358 () Bool)

(assert (= bs!28358 d!118957))

(assert (=> bs!28358 m!922953))

(assert (=> d!118917 d!118957))

(declare-fun lt!441056 () Bool)

(declare-fun d!118959 () Bool)

(assert (=> d!118959 (= lt!441056 (select (content!477 acc!919) (select (arr!30292 a!4424) (bvadd #b00000000000000000000000000000001 from!3778))))))

(declare-fun e!561638 () Bool)

(assert (=> d!118959 (= lt!441056 e!561638)))

(declare-fun res!665074 () Bool)

(assert (=> d!118959 (=> (not res!665074) (not e!561638))))

(assert (=> d!118959 (= res!665074 ((_ is Cons!20974) acc!919))))

(assert (=> d!118959 (= (contains!5872 acc!919 (select (arr!30292 a!4424) (bvadd #b00000000000000000000000000000001 from!3778))) lt!441056)))

(declare-fun b!995098 () Bool)

(declare-fun e!561639 () Bool)

(assert (=> b!995098 (= e!561638 e!561639)))

(declare-fun res!665073 () Bool)

(assert (=> b!995098 (=> res!665073 e!561639)))

(assert (=> b!995098 (= res!665073 (= (h!22142 acc!919) (select (arr!30292 a!4424) (bvadd #b00000000000000000000000000000001 from!3778))))))

(declare-fun b!995099 () Bool)

(assert (=> b!995099 (= e!561639 (contains!5872 (t!29971 acc!919) (select (arr!30292 a!4424) (bvadd #b00000000000000000000000000000001 from!3778))))))

(assert (= (and d!118959 res!665074) b!995098))

(assert (= (and b!995098 (not res!665073)) b!995099))

(assert (=> d!118959 m!923027))

(assert (=> d!118959 m!923001))

(declare-fun m!923105 () Bool)

(assert (=> d!118959 m!923105))

(assert (=> b!995099 m!923001))

(declare-fun m!923107 () Bool)

(assert (=> b!995099 m!923107))

(assert (=> b!995006 d!118959))

(declare-fun d!118961 () Bool)

(declare-fun lt!441057 () Bool)

(assert (=> d!118961 (= lt!441057 (select (content!477 (t!29971 acc!919)) (h!22142 acc!919)))))

(declare-fun e!561640 () Bool)

(assert (=> d!118961 (= lt!441057 e!561640)))

(declare-fun res!665076 () Bool)

(assert (=> d!118961 (=> (not res!665076) (not e!561640))))

(assert (=> d!118961 (= res!665076 ((_ is Cons!20974) (t!29971 acc!919)))))

(assert (=> d!118961 (= (contains!5872 (t!29971 acc!919) (h!22142 acc!919)) lt!441057)))

(declare-fun b!995100 () Bool)

(declare-fun e!561641 () Bool)

(assert (=> b!995100 (= e!561640 e!561641)))

(declare-fun res!665075 () Bool)

(assert (=> b!995100 (=> res!665075 e!561641)))

(assert (=> b!995100 (= res!665075 (= (h!22142 (t!29971 acc!919)) (h!22142 acc!919)))))

(declare-fun b!995101 () Bool)

(assert (=> b!995101 (= e!561641 (contains!5872 (t!29971 (t!29971 acc!919)) (h!22142 acc!919)))))

(assert (= (and d!118961 res!665076) b!995100))

(assert (= (and b!995100 (not res!665075)) b!995101))

(assert (=> d!118961 m!923087))

(declare-fun m!923109 () Bool)

(assert (=> d!118961 m!923109))

(declare-fun m!923111 () Bool)

(assert (=> b!995101 m!923111))

(assert (=> b!994983 d!118961))

(declare-fun d!118963 () Bool)

(declare-fun lt!441058 () Bool)

(assert (=> d!118963 (= lt!441058 (select (content!477 (t!29971 acc!919)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!561642 () Bool)

(assert (=> d!118963 (= lt!441058 e!561642)))

(declare-fun res!665078 () Bool)

(assert (=> d!118963 (=> (not res!665078) (not e!561642))))

(assert (=> d!118963 (= res!665078 ((_ is Cons!20974) (t!29971 acc!919)))))

(assert (=> d!118963 (= (contains!5872 (t!29971 acc!919) #b1000000000000000000000000000000000000000000000000000000000000000) lt!441058)))

(declare-fun b!995102 () Bool)

(declare-fun e!561643 () Bool)

(assert (=> b!995102 (= e!561642 e!561643)))

(declare-fun res!665077 () Bool)

(assert (=> b!995102 (=> res!665077 e!561643)))

(assert (=> b!995102 (= res!665077 (= (h!22142 (t!29971 acc!919)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!995103 () Bool)

(assert (=> b!995103 (= e!561643 (contains!5872 (t!29971 (t!29971 acc!919)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!118963 res!665078) b!995102))

(assert (= (and b!995102 (not res!665077)) b!995103))

(assert (=> d!118963 m!923087))

(declare-fun m!923113 () Bool)

(assert (=> d!118963 m!923113))

(declare-fun m!923115 () Bool)

(assert (=> b!995103 m!923115))

(assert (=> b!995052 d!118963))

(declare-fun b!995104 () Bool)

(declare-fun e!561644 () Bool)

(assert (=> b!995104 (= e!561644 (contains!5872 (ite c!101140 (Cons!20974 (select (arr!30292 a!4424) from!3778) acc!919) acc!919) (select (arr!30292 a!4424) (bvadd from!3778 #b00000000000000000000000000000001))))))

(declare-fun d!118965 () Bool)

(declare-fun res!665079 () Bool)

(declare-fun e!561646 () Bool)

(assert (=> d!118965 (=> res!665079 e!561646)))

(assert (=> d!118965 (= res!665079 (bvsge (bvadd from!3778 #b00000000000000000000000000000001) (size!30789 a!4424)))))

(assert (=> d!118965 (= (arrayNoDuplicates!0 a!4424 (bvadd from!3778 #b00000000000000000000000000000001) (ite c!101140 (Cons!20974 (select (arr!30292 a!4424) from!3778) acc!919) acc!919)) e!561646)))

(declare-fun b!995105 () Bool)

(declare-fun e!561647 () Bool)

(declare-fun e!561645 () Bool)

(assert (=> b!995105 (= e!561647 e!561645)))

(declare-fun c!101154 () Bool)

(assert (=> b!995105 (= c!101154 (validKeyInArray!0 (select (arr!30292 a!4424) (bvadd from!3778 #b00000000000000000000000000000001))))))

(declare-fun b!995106 () Bool)

(declare-fun call!42210 () Bool)

(assert (=> b!995106 (= e!561645 call!42210)))

(declare-fun bm!42207 () Bool)

(assert (=> bm!42207 (= call!42210 (arrayNoDuplicates!0 a!4424 (bvadd from!3778 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!101154 (Cons!20974 (select (arr!30292 a!4424) (bvadd from!3778 #b00000000000000000000000000000001)) (ite c!101140 (Cons!20974 (select (arr!30292 a!4424) from!3778) acc!919) acc!919)) (ite c!101140 (Cons!20974 (select (arr!30292 a!4424) from!3778) acc!919) acc!919))))))

(declare-fun b!995107 () Bool)

(assert (=> b!995107 (= e!561646 e!561647)))

(declare-fun res!665081 () Bool)

(assert (=> b!995107 (=> (not res!665081) (not e!561647))))

(assert (=> b!995107 (= res!665081 (not e!561644))))

(declare-fun res!665080 () Bool)

(assert (=> b!995107 (=> (not res!665080) (not e!561644))))

(assert (=> b!995107 (= res!665080 (validKeyInArray!0 (select (arr!30292 a!4424) (bvadd from!3778 #b00000000000000000000000000000001))))))

(declare-fun b!995108 () Bool)

(assert (=> b!995108 (= e!561645 call!42210)))

(assert (= (and d!118965 (not res!665079)) b!995107))

(assert (= (and b!995107 res!665080) b!995104))

(assert (= (and b!995107 res!665081) b!995105))

(assert (= (and b!995105 c!101154) b!995106))

(assert (= (and b!995105 (not c!101154)) b!995108))

(assert (= (or b!995106 b!995108) bm!42207))

(declare-fun m!923117 () Bool)

(assert (=> b!995104 m!923117))

(assert (=> b!995104 m!923117))

(declare-fun m!923119 () Bool)

(assert (=> b!995104 m!923119))

(assert (=> b!995105 m!923117))

(assert (=> b!995105 m!923117))

(declare-fun m!923123 () Bool)

(assert (=> b!995105 m!923123))

(assert (=> bm!42207 m!923117))

(declare-fun m!923129 () Bool)

(assert (=> bm!42207 m!923129))

(assert (=> b!995107 m!923117))

(assert (=> b!995107 m!923117))

(assert (=> b!995107 m!923123))

(assert (=> bm!42196 d!118965))

(check-sat (not b!995088) (not d!118959) (not d!118955) (not b!995105) (not b!995090) (not b!995099) (not b!995103) (not b!995095) (not b!995104) (not d!118961) (not d!118963) (not b!995097) (not b!995081) (not b!995082) (not d!118953) (not bm!42206) (not b!995101) (not b!995107) (not b!995089) (not b!995092) (not d!118957) (not bm!42207))
(check-sat)
