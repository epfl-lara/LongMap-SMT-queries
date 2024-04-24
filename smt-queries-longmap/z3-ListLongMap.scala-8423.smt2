; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!102820 () Bool)

(assert start!102820)

(declare-fun b!1234697 () Bool)

(declare-fun res!822129 () Bool)

(declare-fun e!700511 () Bool)

(assert (=> b!1234697 (=> (not res!822129) (not e!700511))))

(declare-datatypes ((array!79547 0))(
  ( (array!79548 (arr!38378 (Array (_ BitVec 32) (_ BitVec 64))) (size!38915 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79547)

(declare-fun k0!2913 () (_ BitVec 64))

(declare-fun from!3184 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!79547 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1234697 (= res!822129 (arrayContainsKey!0 a!3806 k0!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1234698 () Bool)

(declare-fun res!822134 () Bool)

(assert (=> b!1234698 (=> (not res!822134) (not e!700511))))

(declare-datatypes ((List!27164 0))(
  ( (Nil!27161) (Cons!27160 (h!28378 (_ BitVec 64)) (t!40619 List!27164)) )
))
(declare-fun acc!823 () List!27164)

(declare-fun contains!7235 (List!27164 (_ BitVec 64)) Bool)

(assert (=> b!1234698 (= res!822134 (not (contains!7235 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1234699 () Bool)

(declare-fun e!700513 () Bool)

(assert (=> b!1234699 (= e!700511 (not e!700513))))

(declare-fun res!822122 () Bool)

(assert (=> b!1234699 (=> res!822122 e!700513)))

(assert (=> b!1234699 (= res!822122 (bvslt (bvadd #b00000000000000000000000000000001 from!3184) #b00000000000000000000000000000000))))

(declare-fun lt!560159 () List!27164)

(assert (=> b!1234699 (= lt!560159 (Cons!27160 (select (arr!38378 a!3806) from!3184) Nil!27161))))

(declare-fun e!700514 () Bool)

(assert (=> b!1234699 e!700514))

(declare-fun res!822123 () Bool)

(assert (=> b!1234699 (=> (not res!822123) (not e!700514))))

(declare-fun arrayNoDuplicates!0 (array!79547 (_ BitVec 32) List!27164) Bool)

(assert (=> b!1234699 (= res!822123 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27161))))

(declare-datatypes ((Unit!40811 0))(
  ( (Unit!40812) )
))
(declare-fun lt!560158 () Unit!40811)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79547 List!27164 List!27164 (_ BitVec 32)) Unit!40811)

(assert (=> b!1234699 (= lt!560158 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27161 from!3184))))

(assert (=> b!1234699 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27160 (select (arr!38378 a!3806) from!3184) acc!823))))

(declare-fun b!1234700 () Bool)

(declare-fun res!822132 () Bool)

(assert (=> b!1234700 (=> (not res!822132) (not e!700511))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1234700 (= res!822132 (validKeyInArray!0 (select (arr!38378 a!3806) from!3184)))))

(declare-fun b!1234701 () Bool)

(declare-fun res!822135 () Bool)

(assert (=> b!1234701 (=> res!822135 e!700513)))

(assert (=> b!1234701 (= res!822135 (contains!7235 lt!560159 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1234702 () Bool)

(assert (=> b!1234702 (= e!700513 (contains!7235 lt!560159 (select (arr!38378 a!3806) from!3184)))))

(declare-fun b!1234703 () Bool)

(declare-fun res!822126 () Bool)

(assert (=> b!1234703 (=> res!822126 e!700513)))

(declare-fun noDuplicate!1816 (List!27164) Bool)

(assert (=> b!1234703 (= res!822126 (not (noDuplicate!1816 lt!560159)))))

(declare-fun b!1234704 () Bool)

(declare-fun res!822133 () Bool)

(assert (=> b!1234704 (=> (not res!822133) (not e!700511))))

(assert (=> b!1234704 (= res!822133 (not (contains!7235 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1234705 () Bool)

(declare-fun res!822124 () Bool)

(assert (=> b!1234705 (=> (not res!822124) (not e!700511))))

(assert (=> b!1234705 (= res!822124 (validKeyInArray!0 k0!2913))))

(declare-fun b!1234707 () Bool)

(declare-fun res!822131 () Bool)

(assert (=> b!1234707 (=> (not res!822131) (not e!700511))))

(assert (=> b!1234707 (= res!822131 (noDuplicate!1816 acc!823))))

(declare-fun b!1234708 () Bool)

(assert (=> b!1234708 (= e!700514 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27160 (select (arr!38378 a!3806) from!3184) Nil!27161)))))

(declare-fun b!1234709 () Bool)

(declare-fun res!822128 () Bool)

(assert (=> b!1234709 (=> (not res!822128) (not e!700511))))

(assert (=> b!1234709 (= res!822128 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1234710 () Bool)

(declare-fun res!822125 () Bool)

(assert (=> b!1234710 (=> res!822125 e!700513)))

(assert (=> b!1234710 (= res!822125 (contains!7235 lt!560159 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!822130 () Bool)

(assert (=> start!102820 (=> (not res!822130) (not e!700511))))

(assert (=> start!102820 (= res!822130 (bvslt (size!38915 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102820 e!700511))

(declare-fun array_inv!29316 (array!79547) Bool)

(assert (=> start!102820 (array_inv!29316 a!3806)))

(assert (=> start!102820 true))

(declare-fun b!1234706 () Bool)

(declare-fun res!822127 () Bool)

(assert (=> b!1234706 (=> (not res!822127) (not e!700511))))

(assert (=> b!1234706 (= res!822127 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38915 a!3806)) (bvslt from!3184 (size!38915 a!3806))))))

(assert (= (and start!102820 res!822130) b!1234705))

(assert (= (and b!1234705 res!822124) b!1234706))

(assert (= (and b!1234706 res!822127) b!1234707))

(assert (= (and b!1234707 res!822131) b!1234698))

(assert (= (and b!1234698 res!822134) b!1234704))

(assert (= (and b!1234704 res!822133) b!1234697))

(assert (= (and b!1234697 res!822129) b!1234709))

(assert (= (and b!1234709 res!822128) b!1234700))

(assert (= (and b!1234700 res!822132) b!1234699))

(assert (= (and b!1234699 res!822123) b!1234708))

(assert (= (and b!1234699 (not res!822122)) b!1234703))

(assert (= (and b!1234703 (not res!822126)) b!1234710))

(assert (= (and b!1234710 (not res!822125)) b!1234701))

(assert (= (and b!1234701 (not res!822135)) b!1234702))

(declare-fun m!1139099 () Bool)

(assert (=> b!1234707 m!1139099))

(declare-fun m!1139101 () Bool)

(assert (=> b!1234710 m!1139101))

(declare-fun m!1139103 () Bool)

(assert (=> start!102820 m!1139103))

(declare-fun m!1139105 () Bool)

(assert (=> b!1234708 m!1139105))

(declare-fun m!1139107 () Bool)

(assert (=> b!1234708 m!1139107))

(assert (=> b!1234702 m!1139105))

(assert (=> b!1234702 m!1139105))

(declare-fun m!1139109 () Bool)

(assert (=> b!1234702 m!1139109))

(assert (=> b!1234699 m!1139105))

(declare-fun m!1139111 () Bool)

(assert (=> b!1234699 m!1139111))

(declare-fun m!1139113 () Bool)

(assert (=> b!1234699 m!1139113))

(declare-fun m!1139115 () Bool)

(assert (=> b!1234699 m!1139115))

(declare-fun m!1139117 () Bool)

(assert (=> b!1234709 m!1139117))

(declare-fun m!1139119 () Bool)

(assert (=> b!1234701 m!1139119))

(assert (=> b!1234700 m!1139105))

(assert (=> b!1234700 m!1139105))

(declare-fun m!1139121 () Bool)

(assert (=> b!1234700 m!1139121))

(declare-fun m!1139123 () Bool)

(assert (=> b!1234697 m!1139123))

(declare-fun m!1139125 () Bool)

(assert (=> b!1234703 m!1139125))

(declare-fun m!1139127 () Bool)

(assert (=> b!1234698 m!1139127))

(declare-fun m!1139129 () Bool)

(assert (=> b!1234704 m!1139129))

(declare-fun m!1139131 () Bool)

(assert (=> b!1234705 m!1139131))

(check-sat (not b!1234704) (not b!1234702) (not b!1234700) (not b!1234710) (not b!1234707) (not b!1234697) (not b!1234705) (not b!1234703) (not b!1234709) (not b!1234701) (not b!1234699) (not b!1234698) (not start!102820) (not b!1234708))
(check-sat)
(get-model)

(declare-fun d!135735 () Bool)

(declare-fun lt!560174 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!576 (List!27164) (InoxSet (_ BitVec 64)))

(assert (=> d!135735 (= lt!560174 (select (content!576 acc!823) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!700544 () Bool)

(assert (=> d!135735 (= lt!560174 e!700544)))

(declare-fun res!822225 () Bool)

(assert (=> d!135735 (=> (not res!822225) (not e!700544))))

(get-info :version)

(assert (=> d!135735 (= res!822225 ((_ is Cons!27160) acc!823))))

(assert (=> d!135735 (= (contains!7235 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000) lt!560174)))

(declare-fun b!1234799 () Bool)

(declare-fun e!700543 () Bool)

(assert (=> b!1234799 (= e!700544 e!700543)))

(declare-fun res!822224 () Bool)

(assert (=> b!1234799 (=> res!822224 e!700543)))

(assert (=> b!1234799 (= res!822224 (= (h!28378 acc!823) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1234800 () Bool)

(assert (=> b!1234800 (= e!700543 (contains!7235 (t!40619 acc!823) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!135735 res!822225) b!1234799))

(assert (= (and b!1234799 (not res!822224)) b!1234800))

(declare-fun m!1139201 () Bool)

(assert (=> d!135735 m!1139201))

(declare-fun m!1139203 () Bool)

(assert (=> d!135735 m!1139203))

(declare-fun m!1139205 () Bool)

(assert (=> b!1234800 m!1139205))

(assert (=> b!1234698 d!135735))

(declare-fun b!1234811 () Bool)

(declare-fun e!700554 () Bool)

(declare-fun e!700556 () Bool)

(assert (=> b!1234811 (= e!700554 e!700556)))

(declare-fun c!121157 () Bool)

(assert (=> b!1234811 (= c!121157 (validKeyInArray!0 (select (arr!38378 a!3806) from!3184)))))

(declare-fun b!1234812 () Bool)

(declare-fun e!700553 () Bool)

(assert (=> b!1234812 (= e!700553 e!700554)))

(declare-fun res!822232 () Bool)

(assert (=> b!1234812 (=> (not res!822232) (not e!700554))))

(declare-fun e!700555 () Bool)

(assert (=> b!1234812 (= res!822232 (not e!700555))))

(declare-fun res!822233 () Bool)

(assert (=> b!1234812 (=> (not res!822233) (not e!700555))))

(assert (=> b!1234812 (= res!822233 (validKeyInArray!0 (select (arr!38378 a!3806) from!3184)))))

(declare-fun b!1234813 () Bool)

(assert (=> b!1234813 (= e!700555 (contains!7235 acc!823 (select (arr!38378 a!3806) from!3184)))))

(declare-fun call!61038 () Bool)

(declare-fun bm!61035 () Bool)

(assert (=> bm!61035 (= call!61038 (arrayNoDuplicates!0 a!3806 (bvadd from!3184 #b00000000000000000000000000000001) (ite c!121157 (Cons!27160 (select (arr!38378 a!3806) from!3184) acc!823) acc!823)))))

(declare-fun b!1234815 () Bool)

(assert (=> b!1234815 (= e!700556 call!61038)))

(declare-fun b!1234814 () Bool)

(assert (=> b!1234814 (= e!700556 call!61038)))

(declare-fun d!135737 () Bool)

(declare-fun res!822234 () Bool)

(assert (=> d!135737 (=> res!822234 e!700553)))

(assert (=> d!135737 (= res!822234 (bvsge from!3184 (size!38915 a!3806)))))

(assert (=> d!135737 (= (arrayNoDuplicates!0 a!3806 from!3184 acc!823) e!700553)))

(assert (= (and d!135737 (not res!822234)) b!1234812))

(assert (= (and b!1234812 res!822233) b!1234813))

(assert (= (and b!1234812 res!822232) b!1234811))

(assert (= (and b!1234811 c!121157) b!1234814))

(assert (= (and b!1234811 (not c!121157)) b!1234815))

(assert (= (or b!1234814 b!1234815) bm!61035))

(assert (=> b!1234811 m!1139105))

(assert (=> b!1234811 m!1139105))

(assert (=> b!1234811 m!1139121))

(assert (=> b!1234812 m!1139105))

(assert (=> b!1234812 m!1139105))

(assert (=> b!1234812 m!1139121))

(assert (=> b!1234813 m!1139105))

(assert (=> b!1234813 m!1139105))

(declare-fun m!1139207 () Bool)

(assert (=> b!1234813 m!1139207))

(assert (=> bm!61035 m!1139105))

(declare-fun m!1139209 () Bool)

(assert (=> bm!61035 m!1139209))

(assert (=> b!1234709 d!135737))

(declare-fun d!135743 () Bool)

(declare-fun lt!560175 () Bool)

(assert (=> d!135743 (= lt!560175 (select (content!576 lt!560159) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!700558 () Bool)

(assert (=> d!135743 (= lt!560175 e!700558)))

(declare-fun res!822236 () Bool)

(assert (=> d!135743 (=> (not res!822236) (not e!700558))))

(assert (=> d!135743 (= res!822236 ((_ is Cons!27160) lt!560159))))

(assert (=> d!135743 (= (contains!7235 lt!560159 #b0000000000000000000000000000000000000000000000000000000000000000) lt!560175)))

(declare-fun b!1234816 () Bool)

(declare-fun e!700557 () Bool)

(assert (=> b!1234816 (= e!700558 e!700557)))

(declare-fun res!822235 () Bool)

(assert (=> b!1234816 (=> res!822235 e!700557)))

(assert (=> b!1234816 (= res!822235 (= (h!28378 lt!560159) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1234817 () Bool)

(assert (=> b!1234817 (= e!700557 (contains!7235 (t!40619 lt!560159) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!135743 res!822236) b!1234816))

(assert (= (and b!1234816 (not res!822235)) b!1234817))

(declare-fun m!1139211 () Bool)

(assert (=> d!135743 m!1139211))

(declare-fun m!1139213 () Bool)

(assert (=> d!135743 m!1139213))

(declare-fun m!1139215 () Bool)

(assert (=> b!1234817 m!1139215))

(assert (=> b!1234710 d!135743))

(declare-fun b!1234818 () Bool)

(declare-fun e!700560 () Bool)

(declare-fun e!700562 () Bool)

(assert (=> b!1234818 (= e!700560 e!700562)))

(declare-fun c!121158 () Bool)

(assert (=> b!1234818 (= c!121158 (validKeyInArray!0 (select (arr!38378 a!3806) from!3184)))))

(declare-fun b!1234819 () Bool)

(declare-fun e!700559 () Bool)

(assert (=> b!1234819 (= e!700559 e!700560)))

(declare-fun res!822237 () Bool)

(assert (=> b!1234819 (=> (not res!822237) (not e!700560))))

(declare-fun e!700561 () Bool)

(assert (=> b!1234819 (= res!822237 (not e!700561))))

(declare-fun res!822238 () Bool)

(assert (=> b!1234819 (=> (not res!822238) (not e!700561))))

(assert (=> b!1234819 (= res!822238 (validKeyInArray!0 (select (arr!38378 a!3806) from!3184)))))

(declare-fun b!1234820 () Bool)

(assert (=> b!1234820 (= e!700561 (contains!7235 Nil!27161 (select (arr!38378 a!3806) from!3184)))))

(declare-fun call!61039 () Bool)

(declare-fun bm!61036 () Bool)

(assert (=> bm!61036 (= call!61039 (arrayNoDuplicates!0 a!3806 (bvadd from!3184 #b00000000000000000000000000000001) (ite c!121158 (Cons!27160 (select (arr!38378 a!3806) from!3184) Nil!27161) Nil!27161)))))

(declare-fun b!1234822 () Bool)

(assert (=> b!1234822 (= e!700562 call!61039)))

(declare-fun b!1234821 () Bool)

(assert (=> b!1234821 (= e!700562 call!61039)))

(declare-fun d!135745 () Bool)

(declare-fun res!822239 () Bool)

(assert (=> d!135745 (=> res!822239 e!700559)))

(assert (=> d!135745 (= res!822239 (bvsge from!3184 (size!38915 a!3806)))))

(assert (=> d!135745 (= (arrayNoDuplicates!0 a!3806 from!3184 Nil!27161) e!700559)))

(assert (= (and d!135745 (not res!822239)) b!1234819))

(assert (= (and b!1234819 res!822238) b!1234820))

(assert (= (and b!1234819 res!822237) b!1234818))

(assert (= (and b!1234818 c!121158) b!1234821))

(assert (= (and b!1234818 (not c!121158)) b!1234822))

(assert (= (or b!1234821 b!1234822) bm!61036))

(assert (=> b!1234818 m!1139105))

(assert (=> b!1234818 m!1139105))

(assert (=> b!1234818 m!1139121))

(assert (=> b!1234819 m!1139105))

(assert (=> b!1234819 m!1139105))

(assert (=> b!1234819 m!1139121))

(assert (=> b!1234820 m!1139105))

(assert (=> b!1234820 m!1139105))

(declare-fun m!1139217 () Bool)

(assert (=> b!1234820 m!1139217))

(assert (=> bm!61036 m!1139105))

(declare-fun m!1139219 () Bool)

(assert (=> bm!61036 m!1139219))

(assert (=> b!1234699 d!135745))

(declare-fun d!135747 () Bool)

(assert (=> d!135747 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27161)))

(declare-fun lt!560182 () Unit!40811)

(declare-fun choose!80 (array!79547 List!27164 List!27164 (_ BitVec 32)) Unit!40811)

(assert (=> d!135747 (= lt!560182 (choose!80 a!3806 acc!823 Nil!27161 from!3184))))

(assert (=> d!135747 (bvslt (size!38915 a!3806) #b01111111111111111111111111111111)))

(assert (=> d!135747 (= (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27161 from!3184) lt!560182)))

(declare-fun bs!34676 () Bool)

(assert (= bs!34676 d!135747))

(assert (=> bs!34676 m!1139111))

(declare-fun m!1139231 () Bool)

(assert (=> bs!34676 m!1139231))

(assert (=> b!1234699 d!135747))

(declare-fun b!1234845 () Bool)

(declare-fun e!700584 () Bool)

(declare-fun e!700586 () Bool)

(assert (=> b!1234845 (= e!700584 e!700586)))

(declare-fun c!121161 () Bool)

(assert (=> b!1234845 (= c!121161 (validKeyInArray!0 (select (arr!38378 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(declare-fun b!1234846 () Bool)

(declare-fun e!700583 () Bool)

(assert (=> b!1234846 (= e!700583 e!700584)))

(declare-fun res!822258 () Bool)

(assert (=> b!1234846 (=> (not res!822258) (not e!700584))))

(declare-fun e!700585 () Bool)

(assert (=> b!1234846 (= res!822258 (not e!700585))))

(declare-fun res!822259 () Bool)

(assert (=> b!1234846 (=> (not res!822259) (not e!700585))))

(assert (=> b!1234846 (= res!822259 (validKeyInArray!0 (select (arr!38378 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(declare-fun b!1234847 () Bool)

(assert (=> b!1234847 (= e!700585 (contains!7235 (Cons!27160 (select (arr!38378 a!3806) from!3184) acc!823) (select (arr!38378 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(declare-fun bm!61039 () Bool)

(declare-fun call!61042 () Bool)

(assert (=> bm!61039 (= call!61042 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001) (ite c!121161 (Cons!27160 (select (arr!38378 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) (Cons!27160 (select (arr!38378 a!3806) from!3184) acc!823)) (Cons!27160 (select (arr!38378 a!3806) from!3184) acc!823))))))

(declare-fun b!1234849 () Bool)

(assert (=> b!1234849 (= e!700586 call!61042)))

(declare-fun b!1234848 () Bool)

(assert (=> b!1234848 (= e!700586 call!61042)))

(declare-fun d!135753 () Bool)

(declare-fun res!822260 () Bool)

(assert (=> d!135753 (=> res!822260 e!700583)))

(assert (=> d!135753 (= res!822260 (bvsge (bvadd #b00000000000000000000000000000001 from!3184) (size!38915 a!3806)))))

(assert (=> d!135753 (= (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27160 (select (arr!38378 a!3806) from!3184) acc!823)) e!700583)))

(assert (= (and d!135753 (not res!822260)) b!1234846))

(assert (= (and b!1234846 res!822259) b!1234847))

(assert (= (and b!1234846 res!822258) b!1234845))

(assert (= (and b!1234845 c!121161) b!1234848))

(assert (= (and b!1234845 (not c!121161)) b!1234849))

(assert (= (or b!1234848 b!1234849) bm!61039))

(declare-fun m!1139233 () Bool)

(assert (=> b!1234845 m!1139233))

(assert (=> b!1234845 m!1139233))

(declare-fun m!1139235 () Bool)

(assert (=> b!1234845 m!1139235))

(assert (=> b!1234846 m!1139233))

(assert (=> b!1234846 m!1139233))

(assert (=> b!1234846 m!1139235))

(assert (=> b!1234847 m!1139233))

(assert (=> b!1234847 m!1139233))

(declare-fun m!1139237 () Bool)

(assert (=> b!1234847 m!1139237))

(assert (=> bm!61039 m!1139233))

(declare-fun m!1139241 () Bool)

(assert (=> bm!61039 m!1139241))

(assert (=> b!1234699 d!135753))

(declare-fun d!135755 () Bool)

(assert (=> d!135755 (= (validKeyInArray!0 (select (arr!38378 a!3806) from!3184)) (and (not (= (select (arr!38378 a!3806) from!3184) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!38378 a!3806) from!3184) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1234700 d!135755))

(declare-fun d!135763 () Bool)

(declare-fun res!822275 () Bool)

(declare-fun e!700603 () Bool)

(assert (=> d!135763 (=> res!822275 e!700603)))

(assert (=> d!135763 (= res!822275 ((_ is Nil!27161) acc!823))))

(assert (=> d!135763 (= (noDuplicate!1816 acc!823) e!700603)))

(declare-fun b!1234868 () Bool)

(declare-fun e!700604 () Bool)

(assert (=> b!1234868 (= e!700603 e!700604)))

(declare-fun res!822276 () Bool)

(assert (=> b!1234868 (=> (not res!822276) (not e!700604))))

(assert (=> b!1234868 (= res!822276 (not (contains!7235 (t!40619 acc!823) (h!28378 acc!823))))))

(declare-fun b!1234869 () Bool)

(assert (=> b!1234869 (= e!700604 (noDuplicate!1816 (t!40619 acc!823)))))

(assert (= (and d!135763 (not res!822275)) b!1234868))

(assert (= (and b!1234868 res!822276) b!1234869))

(declare-fun m!1139259 () Bool)

(assert (=> b!1234868 m!1139259))

(declare-fun m!1139261 () Bool)

(assert (=> b!1234869 m!1139261))

(assert (=> b!1234707 d!135763))

(declare-fun b!1234870 () Bool)

(declare-fun e!700606 () Bool)

(declare-fun e!700608 () Bool)

(assert (=> b!1234870 (= e!700606 e!700608)))

(declare-fun c!121164 () Bool)

(assert (=> b!1234870 (= c!121164 (validKeyInArray!0 (select (arr!38378 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(declare-fun b!1234871 () Bool)

(declare-fun e!700605 () Bool)

(assert (=> b!1234871 (= e!700605 e!700606)))

(declare-fun res!822277 () Bool)

(assert (=> b!1234871 (=> (not res!822277) (not e!700606))))

(declare-fun e!700607 () Bool)

(assert (=> b!1234871 (= res!822277 (not e!700607))))

(declare-fun res!822278 () Bool)

(assert (=> b!1234871 (=> (not res!822278) (not e!700607))))

(assert (=> b!1234871 (= res!822278 (validKeyInArray!0 (select (arr!38378 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(declare-fun b!1234872 () Bool)

(assert (=> b!1234872 (= e!700607 (contains!7235 (Cons!27160 (select (arr!38378 a!3806) from!3184) Nil!27161) (select (arr!38378 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(declare-fun call!61045 () Bool)

(declare-fun bm!61042 () Bool)

(assert (=> bm!61042 (= call!61045 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001) (ite c!121164 (Cons!27160 (select (arr!38378 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) (Cons!27160 (select (arr!38378 a!3806) from!3184) Nil!27161)) (Cons!27160 (select (arr!38378 a!3806) from!3184) Nil!27161))))))

(declare-fun b!1234874 () Bool)

(assert (=> b!1234874 (= e!700608 call!61045)))

(declare-fun b!1234873 () Bool)

(assert (=> b!1234873 (= e!700608 call!61045)))

(declare-fun d!135769 () Bool)

(declare-fun res!822279 () Bool)

(assert (=> d!135769 (=> res!822279 e!700605)))

(assert (=> d!135769 (= res!822279 (bvsge (bvadd #b00000000000000000000000000000001 from!3184) (size!38915 a!3806)))))

(assert (=> d!135769 (= (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27160 (select (arr!38378 a!3806) from!3184) Nil!27161)) e!700605)))

(assert (= (and d!135769 (not res!822279)) b!1234871))

(assert (= (and b!1234871 res!822278) b!1234872))

(assert (= (and b!1234871 res!822277) b!1234870))

(assert (= (and b!1234870 c!121164) b!1234873))

(assert (= (and b!1234870 (not c!121164)) b!1234874))

(assert (= (or b!1234873 b!1234874) bm!61042))

(assert (=> b!1234870 m!1139233))

(assert (=> b!1234870 m!1139233))

(assert (=> b!1234870 m!1139235))

(assert (=> b!1234871 m!1139233))

(assert (=> b!1234871 m!1139233))

(assert (=> b!1234871 m!1139235))

(assert (=> b!1234872 m!1139233))

(assert (=> b!1234872 m!1139233))

(declare-fun m!1139263 () Bool)

(assert (=> b!1234872 m!1139263))

(assert (=> bm!61042 m!1139233))

(declare-fun m!1139267 () Bool)

(assert (=> bm!61042 m!1139267))

(assert (=> b!1234708 d!135769))

(declare-fun d!135773 () Bool)

(declare-fun res!822293 () Bool)

(declare-fun e!700625 () Bool)

(assert (=> d!135773 (=> res!822293 e!700625)))

(assert (=> d!135773 (= res!822293 (= (select (arr!38378 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) k0!2913))))

(assert (=> d!135773 (= (arrayContainsKey!0 a!3806 k0!2913 (bvadd #b00000000000000000000000000000001 from!3184)) e!700625)))

(declare-fun b!1234894 () Bool)

(declare-fun e!700626 () Bool)

(assert (=> b!1234894 (= e!700625 e!700626)))

(declare-fun res!822294 () Bool)

(assert (=> b!1234894 (=> (not res!822294) (not e!700626))))

(assert (=> b!1234894 (= res!822294 (bvslt (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001) (size!38915 a!3806)))))

(declare-fun b!1234895 () Bool)

(assert (=> b!1234895 (= e!700626 (arrayContainsKey!0 a!3806 k0!2913 (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001)))))

(assert (= (and d!135773 (not res!822293)) b!1234894))

(assert (= (and b!1234894 res!822294) b!1234895))

(assert (=> d!135773 m!1139233))

(declare-fun m!1139277 () Bool)

(assert (=> b!1234895 m!1139277))

(assert (=> b!1234697 d!135773))

(declare-fun d!135779 () Bool)

(declare-fun res!822298 () Bool)

(declare-fun e!700631 () Bool)

(assert (=> d!135779 (=> res!822298 e!700631)))

(assert (=> d!135779 (= res!822298 ((_ is Nil!27161) lt!560159))))

(assert (=> d!135779 (= (noDuplicate!1816 lt!560159) e!700631)))

(declare-fun b!1234901 () Bool)

(declare-fun e!700632 () Bool)

(assert (=> b!1234901 (= e!700631 e!700632)))

(declare-fun res!822299 () Bool)

(assert (=> b!1234901 (=> (not res!822299) (not e!700632))))

(assert (=> b!1234901 (= res!822299 (not (contains!7235 (t!40619 lt!560159) (h!28378 lt!560159))))))

(declare-fun b!1234902 () Bool)

(assert (=> b!1234902 (= e!700632 (noDuplicate!1816 (t!40619 lt!560159)))))

(assert (= (and d!135779 (not res!822298)) b!1234901))

(assert (= (and b!1234901 res!822299) b!1234902))

(declare-fun m!1139279 () Bool)

(assert (=> b!1234901 m!1139279))

(declare-fun m!1139281 () Bool)

(assert (=> b!1234902 m!1139281))

(assert (=> b!1234703 d!135779))

(declare-fun d!135781 () Bool)

(assert (=> d!135781 (= (array_inv!29316 a!3806) (bvsge (size!38915 a!3806) #b00000000000000000000000000000000))))

(assert (=> start!102820 d!135781))

(declare-fun d!135785 () Bool)

(declare-fun lt!560190 () Bool)

(assert (=> d!135785 (= lt!560190 (select (content!576 acc!823) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!700640 () Bool)

(assert (=> d!135785 (= lt!560190 e!700640)))

(declare-fun res!822307 () Bool)

(assert (=> d!135785 (=> (not res!822307) (not e!700640))))

(assert (=> d!135785 (= res!822307 ((_ is Cons!27160) acc!823))))

(assert (=> d!135785 (= (contains!7235 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000) lt!560190)))

(declare-fun b!1234909 () Bool)

(declare-fun e!700639 () Bool)

(assert (=> b!1234909 (= e!700640 e!700639)))

(declare-fun res!822306 () Bool)

(assert (=> b!1234909 (=> res!822306 e!700639)))

(assert (=> b!1234909 (= res!822306 (= (h!28378 acc!823) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1234910 () Bool)

(assert (=> b!1234910 (= e!700639 (contains!7235 (t!40619 acc!823) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!135785 res!822307) b!1234909))

(assert (= (and b!1234909 (not res!822306)) b!1234910))

(assert (=> d!135785 m!1139201))

(declare-fun m!1139291 () Bool)

(assert (=> d!135785 m!1139291))

(declare-fun m!1139293 () Bool)

(assert (=> b!1234910 m!1139293))

(assert (=> b!1234704 d!135785))

(declare-fun d!135789 () Bool)

(assert (=> d!135789 (= (validKeyInArray!0 k0!2913) (and (not (= k0!2913 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2913 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1234705 d!135789))

(declare-fun d!135791 () Bool)

(declare-fun lt!560191 () Bool)

(assert (=> d!135791 (= lt!560191 (select (content!576 lt!560159) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!700642 () Bool)

(assert (=> d!135791 (= lt!560191 e!700642)))

(declare-fun res!822309 () Bool)

(assert (=> d!135791 (=> (not res!822309) (not e!700642))))

(assert (=> d!135791 (= res!822309 ((_ is Cons!27160) lt!560159))))

(assert (=> d!135791 (= (contains!7235 lt!560159 #b1000000000000000000000000000000000000000000000000000000000000000) lt!560191)))

(declare-fun b!1234911 () Bool)

(declare-fun e!700641 () Bool)

(assert (=> b!1234911 (= e!700642 e!700641)))

(declare-fun res!822308 () Bool)

(assert (=> b!1234911 (=> res!822308 e!700641)))

(assert (=> b!1234911 (= res!822308 (= (h!28378 lt!560159) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1234912 () Bool)

(assert (=> b!1234912 (= e!700641 (contains!7235 (t!40619 lt!560159) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!135791 res!822309) b!1234911))

(assert (= (and b!1234911 (not res!822308)) b!1234912))

(assert (=> d!135791 m!1139211))

(declare-fun m!1139295 () Bool)

(assert (=> d!135791 m!1139295))

(declare-fun m!1139297 () Bool)

(assert (=> b!1234912 m!1139297))

(assert (=> b!1234701 d!135791))

(declare-fun d!135793 () Bool)

(declare-fun lt!560192 () Bool)

(assert (=> d!135793 (= lt!560192 (select (content!576 lt!560159) (select (arr!38378 a!3806) from!3184)))))

(declare-fun e!700644 () Bool)

(assert (=> d!135793 (= lt!560192 e!700644)))

(declare-fun res!822311 () Bool)

(assert (=> d!135793 (=> (not res!822311) (not e!700644))))

(assert (=> d!135793 (= res!822311 ((_ is Cons!27160) lt!560159))))

(assert (=> d!135793 (= (contains!7235 lt!560159 (select (arr!38378 a!3806) from!3184)) lt!560192)))

(declare-fun b!1234913 () Bool)

(declare-fun e!700643 () Bool)

(assert (=> b!1234913 (= e!700644 e!700643)))

(declare-fun res!822310 () Bool)

(assert (=> b!1234913 (=> res!822310 e!700643)))

(assert (=> b!1234913 (= res!822310 (= (h!28378 lt!560159) (select (arr!38378 a!3806) from!3184)))))

(declare-fun b!1234914 () Bool)

(assert (=> b!1234914 (= e!700643 (contains!7235 (t!40619 lt!560159) (select (arr!38378 a!3806) from!3184)))))

(assert (= (and d!135793 res!822311) b!1234913))

(assert (= (and b!1234913 (not res!822310)) b!1234914))

(assert (=> d!135793 m!1139211))

(assert (=> d!135793 m!1139105))

(declare-fun m!1139299 () Bool)

(assert (=> d!135793 m!1139299))

(assert (=> b!1234914 m!1139105))

(declare-fun m!1139303 () Bool)

(assert (=> b!1234914 m!1139303))

(assert (=> b!1234702 d!135793))

(check-sat (not b!1234868) (not b!1234869) (not b!1234902) (not b!1234846) (not bm!61039) (not d!135785) (not bm!61042) (not b!1234871) (not d!135747) (not b!1234870) (not b!1234847) (not b!1234901) (not d!135735) (not b!1234811) (not b!1234817) (not b!1234800) (not d!135743) (not b!1234872) (not b!1234845) (not d!135791) (not b!1234812) (not b!1234818) (not b!1234820) (not b!1234819) (not b!1234914) (not bm!61036) (not b!1234895) (not bm!61035) (not b!1234813) (not b!1234912) (not b!1234910) (not d!135793))
(check-sat)
