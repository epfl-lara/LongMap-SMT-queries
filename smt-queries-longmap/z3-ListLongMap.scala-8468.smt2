; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103300 () Bool)

(assert start!103300)

(declare-fun b!1239104 () Bool)

(declare-fun res!826111 () Bool)

(declare-fun e!702384 () Bool)

(assert (=> b!1239104 (=> (not res!826111) (not e!702384))))

(declare-datatypes ((array!79829 0))(
  ( (array!79830 (arr!38513 (Array (_ BitVec 32) (_ BitVec 64))) (size!39050 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79829)

(declare-fun from!3213 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1239104 (= res!826111 (validKeyInArray!0 (select (arr!38513 a!3835) from!3213)))))

(declare-fun b!1239105 () Bool)

(declare-fun e!702383 () Bool)

(assert (=> b!1239105 (= e!702384 (not e!702383))))

(declare-fun res!826117 () Bool)

(assert (=> b!1239105 (=> res!826117 e!702383)))

(assert (=> b!1239105 (= res!826117 (bvslt (bvadd #b00000000000000000000000000000001 from!3213) #b00000000000000000000000000000000))))

(declare-datatypes ((List!27299 0))(
  ( (Nil!27296) (Cons!27295 (h!28513 (_ BitVec 64)) (t!40754 List!27299)) )
))
(declare-fun acc!846 () List!27299)

(declare-fun lt!561613 () List!27299)

(declare-fun subseq!590 (List!27299 List!27299) Bool)

(assert (=> b!1239105 (subseq!590 acc!846 lt!561613)))

(declare-datatypes ((Unit!41053 0))(
  ( (Unit!41054) )
))
(declare-fun lt!561614 () Unit!41053)

(declare-fun subseqTail!77 (List!27299 List!27299) Unit!41053)

(assert (=> b!1239105 (= lt!561614 (subseqTail!77 lt!561613 lt!561613))))

(assert (=> b!1239105 (subseq!590 lt!561613 lt!561613)))

(declare-fun lt!561612 () Unit!41053)

(declare-fun lemmaListSubSeqRefl!0 (List!27299) Unit!41053)

(assert (=> b!1239105 (= lt!561612 (lemmaListSubSeqRefl!0 lt!561613))))

(assert (=> b!1239105 (= lt!561613 (Cons!27295 (select (arr!38513 a!3835) from!3213) acc!846))))

(declare-fun b!1239106 () Bool)

(declare-fun e!702386 () Bool)

(declare-fun contains!7370 (List!27299 (_ BitVec 64)) Bool)

(assert (=> b!1239106 (= e!702386 (not (contains!7370 lt!561613 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1239107 () Bool)

(declare-fun res!826118 () Bool)

(assert (=> b!1239107 (=> res!826118 e!702383)))

(declare-fun noDuplicate!1951 (List!27299) Bool)

(assert (=> b!1239107 (= res!826118 (not (noDuplicate!1951 lt!561613)))))

(declare-fun b!1239108 () Bool)

(declare-fun res!826109 () Bool)

(assert (=> b!1239108 (=> (not res!826109) (not e!702384))))

(assert (=> b!1239108 (= res!826109 (noDuplicate!1951 acc!846))))

(declare-fun b!1239109 () Bool)

(declare-fun res!826113 () Bool)

(assert (=> b!1239109 (=> (not res!826113) (not e!702384))))

(assert (=> b!1239109 (= res!826113 (not (contains!7370 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1239111 () Bool)

(declare-fun res!826110 () Bool)

(assert (=> b!1239111 (=> (not res!826110) (not e!702384))))

(declare-fun k0!2925 () (_ BitVec 64))

(assert (=> b!1239111 (= res!826110 (contains!7370 acc!846 k0!2925))))

(declare-fun b!1239112 () Bool)

(declare-fun res!826119 () Bool)

(assert (=> b!1239112 (=> (not res!826119) (not e!702384))))

(declare-fun arrayNoDuplicates!0 (array!79829 (_ BitVec 32) List!27299) Bool)

(assert (=> b!1239112 (= res!826119 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1239113 () Bool)

(assert (=> b!1239113 (= e!702383 e!702386)))

(declare-fun res!826114 () Bool)

(assert (=> b!1239113 (=> (not res!826114) (not e!702386))))

(assert (=> b!1239113 (= res!826114 (not (contains!7370 lt!561613 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1239114 () Bool)

(declare-fun res!826116 () Bool)

(assert (=> b!1239114 (=> (not res!826116) (not e!702384))))

(assert (=> b!1239114 (= res!826116 (not (contains!7370 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1239110 () Bool)

(declare-fun res!826112 () Bool)

(assert (=> b!1239110 (=> (not res!826112) (not e!702384))))

(assert (=> b!1239110 (= res!826112 (not (= from!3213 (bvsub (size!39050 a!3835) #b00000000000000000000000000000001))))))

(declare-fun res!826115 () Bool)

(assert (=> start!103300 (=> (not res!826115) (not e!702384))))

(assert (=> start!103300 (= res!826115 (and (bvslt (size!39050 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!39050 a!3835))))))

(assert (=> start!103300 e!702384))

(declare-fun array_inv!29451 (array!79829) Bool)

(assert (=> start!103300 (array_inv!29451 a!3835)))

(assert (=> start!103300 true))

(assert (= (and start!103300 res!826115) b!1239108))

(assert (= (and b!1239108 res!826109) b!1239109))

(assert (= (and b!1239109 res!826113) b!1239114))

(assert (= (and b!1239114 res!826116) b!1239112))

(assert (= (and b!1239112 res!826119) b!1239111))

(assert (= (and b!1239111 res!826110) b!1239110))

(assert (= (and b!1239110 res!826112) b!1239104))

(assert (= (and b!1239104 res!826111) b!1239105))

(assert (= (and b!1239105 (not res!826117)) b!1239107))

(assert (= (and b!1239107 (not res!826118)) b!1239113))

(assert (= (and b!1239113 res!826114) b!1239106))

(declare-fun m!1143065 () Bool)

(assert (=> b!1239111 m!1143065))

(declare-fun m!1143067 () Bool)

(assert (=> b!1239105 m!1143067))

(declare-fun m!1143069 () Bool)

(assert (=> b!1239105 m!1143069))

(declare-fun m!1143071 () Bool)

(assert (=> b!1239105 m!1143071))

(declare-fun m!1143073 () Bool)

(assert (=> b!1239105 m!1143073))

(declare-fun m!1143075 () Bool)

(assert (=> b!1239105 m!1143075))

(declare-fun m!1143077 () Bool)

(assert (=> b!1239114 m!1143077))

(declare-fun m!1143079 () Bool)

(assert (=> b!1239106 m!1143079))

(declare-fun m!1143081 () Bool)

(assert (=> b!1239112 m!1143081))

(declare-fun m!1143083 () Bool)

(assert (=> b!1239107 m!1143083))

(declare-fun m!1143085 () Bool)

(assert (=> b!1239109 m!1143085))

(declare-fun m!1143087 () Bool)

(assert (=> start!103300 m!1143087))

(declare-fun m!1143089 () Bool)

(assert (=> b!1239108 m!1143089))

(assert (=> b!1239104 m!1143071))

(assert (=> b!1239104 m!1143071))

(declare-fun m!1143091 () Bool)

(assert (=> b!1239104 m!1143091))

(declare-fun m!1143093 () Bool)

(assert (=> b!1239113 m!1143093))

(check-sat (not b!1239109) (not b!1239104) (not b!1239111) (not b!1239106) (not b!1239108) (not b!1239107) (not b!1239105) (not b!1239112) (not start!103300) (not b!1239114) (not b!1239113))
(check-sat)
(get-model)

(declare-fun d!136227 () Bool)

(declare-fun lt!561635 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!588 (List!27299) (InoxSet (_ BitVec 64)))

(assert (=> d!136227 (= lt!561635 (select (content!588 lt!561613) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!702416 () Bool)

(assert (=> d!136227 (= lt!561635 e!702416)))

(declare-fun res!826191 () Bool)

(assert (=> d!136227 (=> (not res!826191) (not e!702416))))

(get-info :version)

(assert (=> d!136227 (= res!826191 ((_ is Cons!27295) lt!561613))))

(assert (=> d!136227 (= (contains!7370 lt!561613 #b1000000000000000000000000000000000000000000000000000000000000000) lt!561635)))

(declare-fun b!1239185 () Bool)

(declare-fun e!702415 () Bool)

(assert (=> b!1239185 (= e!702416 e!702415)))

(declare-fun res!826190 () Bool)

(assert (=> b!1239185 (=> res!826190 e!702415)))

(assert (=> b!1239185 (= res!826190 (= (h!28513 lt!561613) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1239186 () Bool)

(assert (=> b!1239186 (= e!702415 (contains!7370 (t!40754 lt!561613) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!136227 res!826191) b!1239185))

(assert (= (and b!1239185 (not res!826190)) b!1239186))

(declare-fun m!1143155 () Bool)

(assert (=> d!136227 m!1143155))

(declare-fun m!1143157 () Bool)

(assert (=> d!136227 m!1143157))

(declare-fun m!1143159 () Bool)

(assert (=> b!1239186 m!1143159))

(assert (=> b!1239106 d!136227))

(declare-fun d!136229 () Bool)

(declare-fun lt!561636 () Bool)

(assert (=> d!136229 (= lt!561636 (select (content!588 acc!846) k0!2925))))

(declare-fun e!702418 () Bool)

(assert (=> d!136229 (= lt!561636 e!702418)))

(declare-fun res!826193 () Bool)

(assert (=> d!136229 (=> (not res!826193) (not e!702418))))

(assert (=> d!136229 (= res!826193 ((_ is Cons!27295) acc!846))))

(assert (=> d!136229 (= (contains!7370 acc!846 k0!2925) lt!561636)))

(declare-fun b!1239187 () Bool)

(declare-fun e!702417 () Bool)

(assert (=> b!1239187 (= e!702418 e!702417)))

(declare-fun res!826192 () Bool)

(assert (=> b!1239187 (=> res!826192 e!702417)))

(assert (=> b!1239187 (= res!826192 (= (h!28513 acc!846) k0!2925))))

(declare-fun b!1239188 () Bool)

(assert (=> b!1239188 (= e!702417 (contains!7370 (t!40754 acc!846) k0!2925))))

(assert (= (and d!136229 res!826193) b!1239187))

(assert (= (and b!1239187 (not res!826192)) b!1239188))

(declare-fun m!1143161 () Bool)

(assert (=> d!136229 m!1143161))

(declare-fun m!1143163 () Bool)

(assert (=> d!136229 m!1143163))

(declare-fun m!1143165 () Bool)

(assert (=> b!1239188 m!1143165))

(assert (=> b!1239111 d!136229))

(declare-fun d!136231 () Bool)

(declare-fun lt!561637 () Bool)

(assert (=> d!136231 (= lt!561637 (select (content!588 lt!561613) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!702420 () Bool)

(assert (=> d!136231 (= lt!561637 e!702420)))

(declare-fun res!826195 () Bool)

(assert (=> d!136231 (=> (not res!826195) (not e!702420))))

(assert (=> d!136231 (= res!826195 ((_ is Cons!27295) lt!561613))))

(assert (=> d!136231 (= (contains!7370 lt!561613 #b0000000000000000000000000000000000000000000000000000000000000000) lt!561637)))

(declare-fun b!1239189 () Bool)

(declare-fun e!702419 () Bool)

(assert (=> b!1239189 (= e!702420 e!702419)))

(declare-fun res!826194 () Bool)

(assert (=> b!1239189 (=> res!826194 e!702419)))

(assert (=> b!1239189 (= res!826194 (= (h!28513 lt!561613) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1239190 () Bool)

(assert (=> b!1239190 (= e!702419 (contains!7370 (t!40754 lt!561613) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!136231 res!826195) b!1239189))

(assert (= (and b!1239189 (not res!826194)) b!1239190))

(assert (=> d!136231 m!1143155))

(declare-fun m!1143167 () Bool)

(assert (=> d!136231 m!1143167))

(declare-fun m!1143169 () Bool)

(assert (=> b!1239190 m!1143169))

(assert (=> b!1239113 d!136231))

(declare-fun b!1239201 () Bool)

(declare-fun e!702431 () Bool)

(declare-fun call!61107 () Bool)

(assert (=> b!1239201 (= e!702431 call!61107)))

(declare-fun b!1239202 () Bool)

(declare-fun e!702429 () Bool)

(declare-fun e!702430 () Bool)

(assert (=> b!1239202 (= e!702429 e!702430)))

(declare-fun res!826204 () Bool)

(assert (=> b!1239202 (=> (not res!826204) (not e!702430))))

(declare-fun e!702432 () Bool)

(assert (=> b!1239202 (= res!826204 (not e!702432))))

(declare-fun res!826202 () Bool)

(assert (=> b!1239202 (=> (not res!826202) (not e!702432))))

(assert (=> b!1239202 (= res!826202 (validKeyInArray!0 (select (arr!38513 a!3835) from!3213)))))

(declare-fun d!136233 () Bool)

(declare-fun res!826203 () Bool)

(assert (=> d!136233 (=> res!826203 e!702429)))

(assert (=> d!136233 (= res!826203 (bvsge from!3213 (size!39050 a!3835)))))

(assert (=> d!136233 (= (arrayNoDuplicates!0 a!3835 from!3213 acc!846) e!702429)))

(declare-fun b!1239203 () Bool)

(assert (=> b!1239203 (= e!702430 e!702431)))

(declare-fun c!121367 () Bool)

(assert (=> b!1239203 (= c!121367 (validKeyInArray!0 (select (arr!38513 a!3835) from!3213)))))

(declare-fun bm!61104 () Bool)

(assert (=> bm!61104 (= call!61107 (arrayNoDuplicates!0 a!3835 (bvadd from!3213 #b00000000000000000000000000000001) (ite c!121367 (Cons!27295 (select (arr!38513 a!3835) from!3213) acc!846) acc!846)))))

(declare-fun b!1239204 () Bool)

(assert (=> b!1239204 (= e!702431 call!61107)))

(declare-fun b!1239205 () Bool)

(assert (=> b!1239205 (= e!702432 (contains!7370 acc!846 (select (arr!38513 a!3835) from!3213)))))

(assert (= (and d!136233 (not res!826203)) b!1239202))

(assert (= (and b!1239202 res!826202) b!1239205))

(assert (= (and b!1239202 res!826204) b!1239203))

(assert (= (and b!1239203 c!121367) b!1239201))

(assert (= (and b!1239203 (not c!121367)) b!1239204))

(assert (= (or b!1239201 b!1239204) bm!61104))

(assert (=> b!1239202 m!1143071))

(assert (=> b!1239202 m!1143071))

(assert (=> b!1239202 m!1143091))

(assert (=> b!1239203 m!1143071))

(assert (=> b!1239203 m!1143071))

(assert (=> b!1239203 m!1143091))

(assert (=> bm!61104 m!1143071))

(declare-fun m!1143171 () Bool)

(assert (=> bm!61104 m!1143171))

(assert (=> b!1239205 m!1143071))

(assert (=> b!1239205 m!1143071))

(declare-fun m!1143173 () Bool)

(assert (=> b!1239205 m!1143173))

(assert (=> b!1239112 d!136233))

(declare-fun d!136237 () Bool)

(assert (=> d!136237 (= (array_inv!29451 a!3835) (bvsge (size!39050 a!3835) #b00000000000000000000000000000000))))

(assert (=> start!103300 d!136237))

(declare-fun d!136239 () Bool)

(declare-fun res!826217 () Bool)

(declare-fun e!702445 () Bool)

(assert (=> d!136239 (=> res!826217 e!702445)))

(assert (=> d!136239 (= res!826217 ((_ is Nil!27296) lt!561613))))

(assert (=> d!136239 (= (noDuplicate!1951 lt!561613) e!702445)))

(declare-fun b!1239218 () Bool)

(declare-fun e!702446 () Bool)

(assert (=> b!1239218 (= e!702445 e!702446)))

(declare-fun res!826218 () Bool)

(assert (=> b!1239218 (=> (not res!826218) (not e!702446))))

(assert (=> b!1239218 (= res!826218 (not (contains!7370 (t!40754 lt!561613) (h!28513 lt!561613))))))

(declare-fun b!1239219 () Bool)

(assert (=> b!1239219 (= e!702446 (noDuplicate!1951 (t!40754 lt!561613)))))

(assert (= (and d!136239 (not res!826217)) b!1239218))

(assert (= (and b!1239218 res!826218) b!1239219))

(declare-fun m!1143183 () Bool)

(assert (=> b!1239218 m!1143183))

(declare-fun m!1143185 () Bool)

(assert (=> b!1239219 m!1143185))

(assert (=> b!1239107 d!136239))

(declare-fun d!136247 () Bool)

(declare-fun lt!561638 () Bool)

(assert (=> d!136247 (= lt!561638 (select (content!588 acc!846) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!702448 () Bool)

(assert (=> d!136247 (= lt!561638 e!702448)))

(declare-fun res!826220 () Bool)

(assert (=> d!136247 (=> (not res!826220) (not e!702448))))

(assert (=> d!136247 (= res!826220 ((_ is Cons!27295) acc!846))))

(assert (=> d!136247 (= (contains!7370 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000) lt!561638)))

(declare-fun b!1239220 () Bool)

(declare-fun e!702447 () Bool)

(assert (=> b!1239220 (= e!702448 e!702447)))

(declare-fun res!826219 () Bool)

(assert (=> b!1239220 (=> res!826219 e!702447)))

(assert (=> b!1239220 (= res!826219 (= (h!28513 acc!846) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1239221 () Bool)

(assert (=> b!1239221 (= e!702447 (contains!7370 (t!40754 acc!846) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!136247 res!826220) b!1239220))

(assert (= (and b!1239220 (not res!826219)) b!1239221))

(assert (=> d!136247 m!1143161))

(declare-fun m!1143187 () Bool)

(assert (=> d!136247 m!1143187))

(declare-fun m!1143189 () Bool)

(assert (=> b!1239221 m!1143189))

(assert (=> b!1239114 d!136247))

(declare-fun d!136249 () Bool)

(declare-fun lt!561639 () Bool)

(assert (=> d!136249 (= lt!561639 (select (content!588 acc!846) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!702450 () Bool)

(assert (=> d!136249 (= lt!561639 e!702450)))

(declare-fun res!826222 () Bool)

(assert (=> d!136249 (=> (not res!826222) (not e!702450))))

(assert (=> d!136249 (= res!826222 ((_ is Cons!27295) acc!846))))

(assert (=> d!136249 (= (contains!7370 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000) lt!561639)))

(declare-fun b!1239222 () Bool)

(declare-fun e!702449 () Bool)

(assert (=> b!1239222 (= e!702450 e!702449)))

(declare-fun res!826221 () Bool)

(assert (=> b!1239222 (=> res!826221 e!702449)))

(assert (=> b!1239222 (= res!826221 (= (h!28513 acc!846) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1239223 () Bool)

(assert (=> b!1239223 (= e!702449 (contains!7370 (t!40754 acc!846) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!136249 res!826222) b!1239222))

(assert (= (and b!1239222 (not res!826221)) b!1239223))

(assert (=> d!136249 m!1143161))

(declare-fun m!1143191 () Bool)

(assert (=> d!136249 m!1143191))

(declare-fun m!1143193 () Bool)

(assert (=> b!1239223 m!1143193))

(assert (=> b!1239109 d!136249))

(declare-fun d!136251 () Bool)

(declare-fun res!826223 () Bool)

(declare-fun e!702451 () Bool)

(assert (=> d!136251 (=> res!826223 e!702451)))

(assert (=> d!136251 (= res!826223 ((_ is Nil!27296) acc!846))))

(assert (=> d!136251 (= (noDuplicate!1951 acc!846) e!702451)))

(declare-fun b!1239224 () Bool)

(declare-fun e!702452 () Bool)

(assert (=> b!1239224 (= e!702451 e!702452)))

(declare-fun res!826224 () Bool)

(assert (=> b!1239224 (=> (not res!826224) (not e!702452))))

(assert (=> b!1239224 (= res!826224 (not (contains!7370 (t!40754 acc!846) (h!28513 acc!846))))))

(declare-fun b!1239225 () Bool)

(assert (=> b!1239225 (= e!702452 (noDuplicate!1951 (t!40754 acc!846)))))

(assert (= (and d!136251 (not res!826223)) b!1239224))

(assert (= (and b!1239224 res!826224) b!1239225))

(declare-fun m!1143195 () Bool)

(assert (=> b!1239224 m!1143195))

(declare-fun m!1143197 () Bool)

(assert (=> b!1239225 m!1143197))

(assert (=> b!1239108 d!136251))

(declare-fun d!136253 () Bool)

(declare-fun res!826241 () Bool)

(declare-fun e!702471 () Bool)

(assert (=> d!136253 (=> res!826241 e!702471)))

(assert (=> d!136253 (= res!826241 ((_ is Nil!27296) acc!846))))

(assert (=> d!136253 (= (subseq!590 acc!846 lt!561613) e!702471)))

(declare-fun b!1239246 () Bool)

(declare-fun e!702470 () Bool)

(assert (=> b!1239246 (= e!702470 (subseq!590 (t!40754 acc!846) (t!40754 lt!561613)))))

(declare-fun b!1239247 () Bool)

(declare-fun e!702469 () Bool)

(assert (=> b!1239247 (= e!702469 (subseq!590 acc!846 (t!40754 lt!561613)))))

(declare-fun b!1239244 () Bool)

(declare-fun e!702472 () Bool)

(assert (=> b!1239244 (= e!702471 e!702472)))

(declare-fun res!826242 () Bool)

(assert (=> b!1239244 (=> (not res!826242) (not e!702472))))

(assert (=> b!1239244 (= res!826242 ((_ is Cons!27295) lt!561613))))

(declare-fun b!1239245 () Bool)

(assert (=> b!1239245 (= e!702472 e!702469)))

(declare-fun res!826240 () Bool)

(assert (=> b!1239245 (=> res!826240 e!702469)))

(assert (=> b!1239245 (= res!826240 e!702470)))

(declare-fun res!826239 () Bool)

(assert (=> b!1239245 (=> (not res!826239) (not e!702470))))

(assert (=> b!1239245 (= res!826239 (= (h!28513 acc!846) (h!28513 lt!561613)))))

(assert (= (and d!136253 (not res!826241)) b!1239244))

(assert (= (and b!1239244 res!826242) b!1239245))

(assert (= (and b!1239245 res!826239) b!1239246))

(assert (= (and b!1239245 (not res!826240)) b!1239247))

(declare-fun m!1143199 () Bool)

(assert (=> b!1239246 m!1143199))

(declare-fun m!1143201 () Bool)

(assert (=> b!1239247 m!1143201))

(assert (=> b!1239105 d!136253))

(declare-fun bm!61113 () Bool)

(declare-fun call!61116 () Unit!41053)

(declare-fun c!121381 () Bool)

(assert (=> bm!61113 (= call!61116 (subseqTail!77 (ite c!121381 lt!561613 (t!40754 lt!561613)) (t!40754 lt!561613)))))

(declare-fun b!1239294 () Bool)

(declare-fun e!702511 () Unit!41053)

(declare-fun Unit!41059 () Unit!41053)

(assert (=> b!1239294 (= e!702511 Unit!41059)))

(declare-fun b!1239295 () Bool)

(declare-fun e!702509 () Unit!41053)

(declare-fun Unit!41060 () Unit!41053)

(assert (=> b!1239295 (= e!702509 Unit!41060)))

(declare-fun b!1239296 () Bool)

(declare-fun e!702510 () Unit!41053)

(assert (=> b!1239296 (= e!702510 call!61116)))

(declare-fun d!136257 () Bool)

(declare-fun tail!163 (List!27299) List!27299)

(assert (=> d!136257 (subseq!590 (tail!163 lt!561613) lt!561613)))

(declare-fun lt!561642 () Unit!41053)

(assert (=> d!136257 (= lt!561642 e!702509)))

(declare-fun c!121380 () Bool)

(assert (=> d!136257 (= c!121380 (and ((_ is Cons!27295) lt!561613) ((_ is Cons!27295) lt!561613)))))

(declare-fun e!702512 () Bool)

(assert (=> d!136257 e!702512))

(declare-fun res!826269 () Bool)

(assert (=> d!136257 (=> (not res!826269) (not e!702512))))

(declare-fun isEmpty!1015 (List!27299) Bool)

(assert (=> d!136257 (= res!826269 (not (isEmpty!1015 lt!561613)))))

(assert (=> d!136257 (= (subseqTail!77 lt!561613 lt!561613) lt!561642)))

(declare-fun b!1239297 () Bool)

(assert (=> b!1239297 (= e!702511 call!61116)))

(declare-fun b!1239298 () Bool)

(declare-fun c!121382 () Bool)

(assert (=> b!1239298 (= c!121382 (not (isEmpty!1015 (t!40754 lt!561613))))))

(assert (=> b!1239298 (= e!702510 e!702511)))

(declare-fun b!1239299 () Bool)

(assert (=> b!1239299 (= e!702512 (subseq!590 lt!561613 lt!561613))))

(declare-fun b!1239300 () Bool)

(assert (=> b!1239300 (= e!702509 e!702510)))

(assert (=> b!1239300 (= c!121381 (subseq!590 lt!561613 (t!40754 lt!561613)))))

(assert (= (and d!136257 res!826269) b!1239299))

(assert (= (and d!136257 c!121380) b!1239300))

(assert (= (and d!136257 (not c!121380)) b!1239295))

(assert (= (and b!1239300 c!121381) b!1239296))

(assert (= (and b!1239300 (not c!121381)) b!1239298))

(assert (= (and b!1239298 c!121382) b!1239297))

(assert (= (and b!1239298 (not c!121382)) b!1239294))

(assert (= (or b!1239296 b!1239297) bm!61113))

(declare-fun m!1143211 () Bool)

(assert (=> bm!61113 m!1143211))

(declare-fun m!1143213 () Bool)

(assert (=> d!136257 m!1143213))

(assert (=> d!136257 m!1143213))

(declare-fun m!1143215 () Bool)

(assert (=> d!136257 m!1143215))

(declare-fun m!1143217 () Bool)

(assert (=> d!136257 m!1143217))

(declare-fun m!1143219 () Bool)

(assert (=> b!1239300 m!1143219))

(assert (=> b!1239299 m!1143067))

(declare-fun m!1143221 () Bool)

(assert (=> b!1239298 m!1143221))

(assert (=> b!1239105 d!136257))

(declare-fun d!136263 () Bool)

(declare-fun res!826272 () Bool)

(declare-fun e!702515 () Bool)

(assert (=> d!136263 (=> res!826272 e!702515)))

(assert (=> d!136263 (= res!826272 ((_ is Nil!27296) lt!561613))))

(assert (=> d!136263 (= (subseq!590 lt!561613 lt!561613) e!702515)))

(declare-fun b!1239303 () Bool)

(declare-fun e!702514 () Bool)

(assert (=> b!1239303 (= e!702514 (subseq!590 (t!40754 lt!561613) (t!40754 lt!561613)))))

(declare-fun b!1239304 () Bool)

(declare-fun e!702513 () Bool)

(assert (=> b!1239304 (= e!702513 (subseq!590 lt!561613 (t!40754 lt!561613)))))

(declare-fun b!1239301 () Bool)

(declare-fun e!702516 () Bool)

(assert (=> b!1239301 (= e!702515 e!702516)))

(declare-fun res!826273 () Bool)

(assert (=> b!1239301 (=> (not res!826273) (not e!702516))))

(assert (=> b!1239301 (= res!826273 ((_ is Cons!27295) lt!561613))))

(declare-fun b!1239302 () Bool)

(assert (=> b!1239302 (= e!702516 e!702513)))

(declare-fun res!826271 () Bool)

(assert (=> b!1239302 (=> res!826271 e!702513)))

(assert (=> b!1239302 (= res!826271 e!702514)))

(declare-fun res!826270 () Bool)

(assert (=> b!1239302 (=> (not res!826270) (not e!702514))))

(assert (=> b!1239302 (= res!826270 (= (h!28513 lt!561613) (h!28513 lt!561613)))))

(assert (= (and d!136263 (not res!826272)) b!1239301))

(assert (= (and b!1239301 res!826273) b!1239302))

(assert (= (and b!1239302 res!826270) b!1239303))

(assert (= (and b!1239302 (not res!826271)) b!1239304))

(declare-fun m!1143227 () Bool)

(assert (=> b!1239303 m!1143227))

(assert (=> b!1239304 m!1143219))

(assert (=> b!1239105 d!136263))

(declare-fun d!136265 () Bool)

(assert (=> d!136265 (subseq!590 lt!561613 lt!561613)))

(declare-fun lt!561647 () Unit!41053)

(declare-fun choose!36 (List!27299) Unit!41053)

(assert (=> d!136265 (= lt!561647 (choose!36 lt!561613))))

(assert (=> d!136265 (= (lemmaListSubSeqRefl!0 lt!561613) lt!561647)))

(declare-fun bs!34826 () Bool)

(assert (= bs!34826 d!136265))

(assert (=> bs!34826 m!1143067))

(declare-fun m!1143229 () Bool)

(assert (=> bs!34826 m!1143229))

(assert (=> b!1239105 d!136265))

(declare-fun d!136269 () Bool)

(assert (=> d!136269 (= (validKeyInArray!0 (select (arr!38513 a!3835) from!3213)) (and (not (= (select (arr!38513 a!3835) from!3213) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!38513 a!3835) from!3213) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1239104 d!136269))

(check-sat (not b!1239247) (not b!1239298) (not b!1239202) (not d!136257) (not b!1239224) (not d!136229) (not b!1239299) (not b!1239303) (not d!136247) (not b!1239246) (not d!136231) (not b!1239219) (not d!136227) (not b!1239221) (not bm!61113) (not b!1239225) (not d!136249) (not b!1239218) (not b!1239203) (not b!1239304) (not d!136265) (not b!1239186) (not bm!61104) (not b!1239188) (not b!1239300) (not b!1239205) (not b!1239223) (not b!1239190))
(check-sat)
