; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103126 () Bool)

(assert start!103126)

(declare-fun b!1238233 () Bool)

(declare-fun res!825997 () Bool)

(declare-fun e!701760 () Bool)

(assert (=> b!1238233 (=> (not res!825997) (not e!701760))))

(declare-fun from!3213 () (_ BitVec 32))

(declare-datatypes ((array!79735 0))(
  ( (array!79736 (arr!38471 (Array (_ BitVec 32) (_ BitVec 64))) (size!39009 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79735)

(assert (=> b!1238233 (= res!825997 (not (= from!3213 (bvsub (size!39009 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1238234 () Bool)

(declare-fun res!826002 () Bool)

(declare-fun e!701761 () Bool)

(assert (=> b!1238234 (=> res!826002 e!701761)))

(declare-datatypes ((List!27345 0))(
  ( (Nil!27342) (Cons!27341 (h!28550 (_ BitVec 64)) (t!40799 List!27345)) )
))
(declare-fun lt!561093 () List!27345)

(declare-fun contains!7317 (List!27345 (_ BitVec 64)) Bool)

(assert (=> b!1238234 (= res!826002 (contains!7317 lt!561093 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1238235 () Bool)

(declare-fun res!826000 () Bool)

(assert (=> b!1238235 (=> (not res!826000) (not e!701760))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1238235 (= res!826000 (validKeyInArray!0 (select (arr!38471 a!3835) from!3213)))))

(declare-fun res!825993 () Bool)

(assert (=> start!103126 (=> (not res!825993) (not e!701760))))

(assert (=> start!103126 (= res!825993 (and (bvslt (size!39009 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!39009 a!3835))))))

(assert (=> start!103126 e!701760))

(declare-fun array_inv!29454 (array!79735) Bool)

(assert (=> start!103126 (array_inv!29454 a!3835)))

(assert (=> start!103126 true))

(declare-fun b!1238236 () Bool)

(declare-fun res!825996 () Bool)

(assert (=> b!1238236 (=> (not res!825996) (not e!701760))))

(declare-fun acc!846 () List!27345)

(declare-fun arrayNoDuplicates!0 (array!79735 (_ BitVec 32) List!27345) Bool)

(assert (=> b!1238236 (= res!825996 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1238237 () Bool)

(declare-fun res!825995 () Bool)

(assert (=> b!1238237 (=> (not res!825995) (not e!701760))))

(declare-fun k0!2925 () (_ BitVec 64))

(assert (=> b!1238237 (= res!825995 (contains!7317 acc!846 k0!2925))))

(declare-fun b!1238238 () Bool)

(declare-fun res!826004 () Bool)

(assert (=> b!1238238 (=> res!826004 e!701761)))

(declare-fun noDuplicate!1960 (List!27345) Bool)

(assert (=> b!1238238 (= res!826004 (not (noDuplicate!1960 lt!561093)))))

(declare-fun b!1238239 () Bool)

(declare-fun res!825998 () Bool)

(assert (=> b!1238239 (=> (not res!825998) (not e!701760))))

(assert (=> b!1238239 (= res!825998 (not (contains!7317 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1238240 () Bool)

(declare-fun res!826001 () Bool)

(assert (=> b!1238240 (=> (not res!826001) (not e!701760))))

(assert (=> b!1238240 (= res!826001 (noDuplicate!1960 acc!846))))

(declare-fun b!1238241 () Bool)

(assert (=> b!1238241 (= e!701760 (not e!701761))))

(declare-fun res!825999 () Bool)

(assert (=> b!1238241 (=> res!825999 e!701761)))

(assert (=> b!1238241 (= res!825999 (bvslt (bvadd #b00000000000000000000000000000001 from!3213) #b00000000000000000000000000000000))))

(declare-fun subseq!599 (List!27345 List!27345) Bool)

(assert (=> b!1238241 (subseq!599 acc!846 lt!561093)))

(declare-datatypes ((Unit!40951 0))(
  ( (Unit!40952) )
))
(declare-fun lt!561095 () Unit!40951)

(declare-fun subseqTail!86 (List!27345 List!27345) Unit!40951)

(assert (=> b!1238241 (= lt!561095 (subseqTail!86 lt!561093 lt!561093))))

(assert (=> b!1238241 (subseq!599 lt!561093 lt!561093)))

(declare-fun lt!561094 () Unit!40951)

(declare-fun lemmaListSubSeqRefl!0 (List!27345) Unit!40951)

(assert (=> b!1238241 (= lt!561094 (lemmaListSubSeqRefl!0 lt!561093))))

(assert (=> b!1238241 (= lt!561093 (Cons!27341 (select (arr!38471 a!3835) from!3213) acc!846))))

(declare-fun b!1238242 () Bool)

(declare-fun res!826003 () Bool)

(assert (=> b!1238242 (=> (not res!826003) (not e!701760))))

(assert (=> b!1238242 (= res!826003 (not (contains!7317 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1238243 () Bool)

(declare-fun res!825994 () Bool)

(assert (=> b!1238243 (=> res!825994 e!701761)))

(assert (=> b!1238243 (= res!825994 (contains!7317 lt!561093 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1238244 () Bool)

(assert (=> b!1238244 (= e!701761 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) lt!561093))))

(declare-fun lt!561092 () Unit!40951)

(declare-fun noDuplicateSubseq!80 (List!27345 List!27345) Unit!40951)

(assert (=> b!1238244 (= lt!561092 (noDuplicateSubseq!80 acc!846 lt!561093))))

(assert (= (and start!103126 res!825993) b!1238240))

(assert (= (and b!1238240 res!826001) b!1238242))

(assert (= (and b!1238242 res!826003) b!1238239))

(assert (= (and b!1238239 res!825998) b!1238236))

(assert (= (and b!1238236 res!825996) b!1238237))

(assert (= (and b!1238237 res!825995) b!1238233))

(assert (= (and b!1238233 res!825997) b!1238235))

(assert (= (and b!1238235 res!826000) b!1238241))

(assert (= (and b!1238241 (not res!825999)) b!1238238))

(assert (= (and b!1238238 (not res!826004)) b!1238243))

(assert (= (and b!1238243 (not res!825994)) b!1238234))

(assert (= (and b!1238234 (not res!826002)) b!1238244))

(declare-fun m!1141359 () Bool)

(assert (=> b!1238240 m!1141359))

(declare-fun m!1141361 () Bool)

(assert (=> b!1238237 m!1141361))

(declare-fun m!1141363 () Bool)

(assert (=> b!1238239 m!1141363))

(declare-fun m!1141365 () Bool)

(assert (=> b!1238242 m!1141365))

(declare-fun m!1141367 () Bool)

(assert (=> b!1238241 m!1141367))

(declare-fun m!1141369 () Bool)

(assert (=> b!1238241 m!1141369))

(declare-fun m!1141371 () Bool)

(assert (=> b!1238241 m!1141371))

(declare-fun m!1141373 () Bool)

(assert (=> b!1238241 m!1141373))

(declare-fun m!1141375 () Bool)

(assert (=> b!1238241 m!1141375))

(declare-fun m!1141377 () Bool)

(assert (=> b!1238234 m!1141377))

(declare-fun m!1141379 () Bool)

(assert (=> start!103126 m!1141379))

(declare-fun m!1141381 () Bool)

(assert (=> b!1238244 m!1141381))

(declare-fun m!1141383 () Bool)

(assert (=> b!1238244 m!1141383))

(declare-fun m!1141385 () Bool)

(assert (=> b!1238238 m!1141385))

(declare-fun m!1141387 () Bool)

(assert (=> b!1238236 m!1141387))

(declare-fun m!1141389 () Bool)

(assert (=> b!1238243 m!1141389))

(assert (=> b!1238235 m!1141375))

(assert (=> b!1238235 m!1141375))

(declare-fun m!1141391 () Bool)

(assert (=> b!1238235 m!1141391))

(check-sat (not b!1238240) (not b!1238239) (not b!1238235) (not b!1238243) (not start!103126) (not b!1238234) (not b!1238242) (not b!1238241) (not b!1238236) (not b!1238238) (not b!1238244) (not b!1238237))
(check-sat)
(get-model)

(declare-fun d!135735 () Bool)

(declare-fun res!826081 () Bool)

(declare-fun e!701785 () Bool)

(assert (=> d!135735 (=> res!826081 e!701785)))

(get-info :version)

(assert (=> d!135735 (= res!826081 ((_ is Nil!27342) lt!561093))))

(assert (=> d!135735 (= (noDuplicate!1960 lt!561093) e!701785)))

(declare-fun b!1238321 () Bool)

(declare-fun e!701786 () Bool)

(assert (=> b!1238321 (= e!701785 e!701786)))

(declare-fun res!826082 () Bool)

(assert (=> b!1238321 (=> (not res!826082) (not e!701786))))

(assert (=> b!1238321 (= res!826082 (not (contains!7317 (t!40799 lt!561093) (h!28550 lt!561093))))))

(declare-fun b!1238322 () Bool)

(assert (=> b!1238322 (= e!701786 (noDuplicate!1960 (t!40799 lt!561093)))))

(assert (= (and d!135735 (not res!826081)) b!1238321))

(assert (= (and b!1238321 res!826082) b!1238322))

(declare-fun m!1141461 () Bool)

(assert (=> b!1238321 m!1141461))

(declare-fun m!1141463 () Bool)

(assert (=> b!1238322 m!1141463))

(assert (=> b!1238238 d!135735))

(declare-fun d!135737 () Bool)

(declare-fun lt!561122 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!590 (List!27345) (InoxSet (_ BitVec 64)))

(assert (=> d!135737 (= lt!561122 (select (content!590 acc!846) k0!2925))))

(declare-fun e!701791 () Bool)

(assert (=> d!135737 (= lt!561122 e!701791)))

(declare-fun res!826088 () Bool)

(assert (=> d!135737 (=> (not res!826088) (not e!701791))))

(assert (=> d!135737 (= res!826088 ((_ is Cons!27341) acc!846))))

(assert (=> d!135737 (= (contains!7317 acc!846 k0!2925) lt!561122)))

(declare-fun b!1238327 () Bool)

(declare-fun e!701792 () Bool)

(assert (=> b!1238327 (= e!701791 e!701792)))

(declare-fun res!826087 () Bool)

(assert (=> b!1238327 (=> res!826087 e!701792)))

(assert (=> b!1238327 (= res!826087 (= (h!28550 acc!846) k0!2925))))

(declare-fun b!1238328 () Bool)

(assert (=> b!1238328 (= e!701792 (contains!7317 (t!40799 acc!846) k0!2925))))

(assert (= (and d!135737 res!826088) b!1238327))

(assert (= (and b!1238327 (not res!826087)) b!1238328))

(declare-fun m!1141465 () Bool)

(assert (=> d!135737 m!1141465))

(declare-fun m!1141467 () Bool)

(assert (=> d!135737 m!1141467))

(declare-fun m!1141469 () Bool)

(assert (=> b!1238328 m!1141469))

(assert (=> b!1238237 d!135737))

(declare-fun d!135739 () Bool)

(assert (=> d!135739 (= (array_inv!29454 a!3835) (bvsge (size!39009 a!3835) #b00000000000000000000000000000000))))

(assert (=> start!103126 d!135739))

(declare-fun b!1238343 () Bool)

(declare-fun e!701808 () Bool)

(assert (=> b!1238343 (= e!701808 (subseq!599 (t!40799 acc!846) (t!40799 lt!561093)))))

(declare-fun d!135741 () Bool)

(declare-fun res!826104 () Bool)

(declare-fun e!701805 () Bool)

(assert (=> d!135741 (=> res!826104 e!701805)))

(assert (=> d!135741 (= res!826104 ((_ is Nil!27342) acc!846))))

(assert (=> d!135741 (= (subseq!599 acc!846 lt!561093) e!701805)))

(declare-fun b!1238342 () Bool)

(declare-fun e!701807 () Bool)

(declare-fun e!701806 () Bool)

(assert (=> b!1238342 (= e!701807 e!701806)))

(declare-fun res!826101 () Bool)

(assert (=> b!1238342 (=> res!826101 e!701806)))

(assert (=> b!1238342 (= res!826101 e!701808)))

(declare-fun res!826103 () Bool)

(assert (=> b!1238342 (=> (not res!826103) (not e!701808))))

(assert (=> b!1238342 (= res!826103 (= (h!28550 acc!846) (h!28550 lt!561093)))))

(declare-fun b!1238341 () Bool)

(assert (=> b!1238341 (= e!701805 e!701807)))

(declare-fun res!826102 () Bool)

(assert (=> b!1238341 (=> (not res!826102) (not e!701807))))

(assert (=> b!1238341 (= res!826102 ((_ is Cons!27341) lt!561093))))

(declare-fun b!1238344 () Bool)

(assert (=> b!1238344 (= e!701806 (subseq!599 acc!846 (t!40799 lt!561093)))))

(assert (= (and d!135741 (not res!826104)) b!1238341))

(assert (= (and b!1238341 res!826102) b!1238342))

(assert (= (and b!1238342 res!826103) b!1238343))

(assert (= (and b!1238342 (not res!826101)) b!1238344))

(declare-fun m!1141471 () Bool)

(assert (=> b!1238343 m!1141471))

(declare-fun m!1141473 () Bool)

(assert (=> b!1238344 m!1141473))

(assert (=> b!1238241 d!135741))

(declare-fun b!1238402 () Bool)

(declare-fun e!701858 () Unit!40951)

(declare-fun call!61043 () Unit!40951)

(assert (=> b!1238402 (= e!701858 call!61043)))

(declare-fun b!1238403 () Bool)

(declare-fun c!120995 () Bool)

(declare-fun isEmpty!1020 (List!27345) Bool)

(assert (=> b!1238403 (= c!120995 (not (isEmpty!1020 (t!40799 lt!561093))))))

(declare-fun e!701857 () Unit!40951)

(assert (=> b!1238403 (= e!701858 e!701857)))

(declare-fun b!1238404 () Bool)

(declare-fun e!701856 () Unit!40951)

(declare-fun Unit!40957 () Unit!40951)

(assert (=> b!1238404 (= e!701856 Unit!40957)))

(declare-fun bm!61040 () Bool)

(declare-fun c!120994 () Bool)

(assert (=> bm!61040 (= call!61043 (subseqTail!86 (ite c!120994 lt!561093 (t!40799 lt!561093)) (t!40799 lt!561093)))))

(declare-fun d!135747 () Bool)

(declare-fun tail!167 (List!27345) List!27345)

(assert (=> d!135747 (subseq!599 (tail!167 lt!561093) lt!561093)))

(declare-fun lt!561132 () Unit!40951)

(assert (=> d!135747 (= lt!561132 e!701856)))

(declare-fun c!120996 () Bool)

(assert (=> d!135747 (= c!120996 (and ((_ is Cons!27341) lt!561093) ((_ is Cons!27341) lt!561093)))))

(declare-fun e!701855 () Bool)

(assert (=> d!135747 e!701855))

(declare-fun res!826140 () Bool)

(assert (=> d!135747 (=> (not res!826140) (not e!701855))))

(assert (=> d!135747 (= res!826140 (not (isEmpty!1020 lt!561093)))))

(assert (=> d!135747 (= (subseqTail!86 lt!561093 lt!561093) lt!561132)))

(declare-fun b!1238405 () Bool)

(assert (=> b!1238405 (= e!701856 e!701858)))

(assert (=> b!1238405 (= c!120994 (subseq!599 lt!561093 (t!40799 lt!561093)))))

(declare-fun b!1238406 () Bool)

(declare-fun Unit!40958 () Unit!40951)

(assert (=> b!1238406 (= e!701857 Unit!40958)))

(declare-fun b!1238407 () Bool)

(assert (=> b!1238407 (= e!701855 (subseq!599 lt!561093 lt!561093))))

(declare-fun b!1238408 () Bool)

(assert (=> b!1238408 (= e!701857 call!61043)))

(assert (= (and d!135747 res!826140) b!1238407))

(assert (= (and d!135747 c!120996) b!1238405))

(assert (= (and d!135747 (not c!120996)) b!1238404))

(assert (= (and b!1238405 c!120994) b!1238402))

(assert (= (and b!1238405 (not c!120994)) b!1238403))

(assert (= (and b!1238403 c!120995) b!1238408))

(assert (= (and b!1238403 (not c!120995)) b!1238406))

(assert (= (or b!1238402 b!1238408) bm!61040))

(declare-fun m!1141507 () Bool)

(assert (=> bm!61040 m!1141507))

(assert (=> b!1238407 m!1141369))

(declare-fun m!1141509 () Bool)

(assert (=> d!135747 m!1141509))

(assert (=> d!135747 m!1141509))

(declare-fun m!1141511 () Bool)

(assert (=> d!135747 m!1141511))

(declare-fun m!1141513 () Bool)

(assert (=> d!135747 m!1141513))

(declare-fun m!1141515 () Bool)

(assert (=> b!1238403 m!1141515))

(declare-fun m!1141517 () Bool)

(assert (=> b!1238405 m!1141517))

(assert (=> b!1238241 d!135747))

(declare-fun b!1238411 () Bool)

(declare-fun e!701862 () Bool)

(assert (=> b!1238411 (= e!701862 (subseq!599 (t!40799 lt!561093) (t!40799 lt!561093)))))

(declare-fun d!135761 () Bool)

(declare-fun res!826144 () Bool)

(declare-fun e!701859 () Bool)

(assert (=> d!135761 (=> res!826144 e!701859)))

(assert (=> d!135761 (= res!826144 ((_ is Nil!27342) lt!561093))))

(assert (=> d!135761 (= (subseq!599 lt!561093 lt!561093) e!701859)))

(declare-fun b!1238410 () Bool)

(declare-fun e!701861 () Bool)

(declare-fun e!701860 () Bool)

(assert (=> b!1238410 (= e!701861 e!701860)))

(declare-fun res!826141 () Bool)

(assert (=> b!1238410 (=> res!826141 e!701860)))

(assert (=> b!1238410 (= res!826141 e!701862)))

(declare-fun res!826143 () Bool)

(assert (=> b!1238410 (=> (not res!826143) (not e!701862))))

(assert (=> b!1238410 (= res!826143 (= (h!28550 lt!561093) (h!28550 lt!561093)))))

(declare-fun b!1238409 () Bool)

(assert (=> b!1238409 (= e!701859 e!701861)))

(declare-fun res!826142 () Bool)

(assert (=> b!1238409 (=> (not res!826142) (not e!701861))))

(assert (=> b!1238409 (= res!826142 ((_ is Cons!27341) lt!561093))))

(declare-fun b!1238412 () Bool)

(assert (=> b!1238412 (= e!701860 (subseq!599 lt!561093 (t!40799 lt!561093)))))

(assert (= (and d!135761 (not res!826144)) b!1238409))

(assert (= (and b!1238409 res!826142) b!1238410))

(assert (= (and b!1238410 res!826143) b!1238411))

(assert (= (and b!1238410 (not res!826141)) b!1238412))

(declare-fun m!1141519 () Bool)

(assert (=> b!1238411 m!1141519))

(assert (=> b!1238412 m!1141517))

(assert (=> b!1238241 d!135761))

(declare-fun d!135763 () Bool)

(assert (=> d!135763 (subseq!599 lt!561093 lt!561093)))

(declare-fun lt!561136 () Unit!40951)

(declare-fun choose!36 (List!27345) Unit!40951)

(assert (=> d!135763 (= lt!561136 (choose!36 lt!561093))))

(assert (=> d!135763 (= (lemmaListSubSeqRefl!0 lt!561093) lt!561136)))

(declare-fun bs!34792 () Bool)

(assert (= bs!34792 d!135763))

(assert (=> bs!34792 m!1141369))

(declare-fun m!1141529 () Bool)

(assert (=> bs!34792 m!1141529))

(assert (=> b!1238241 d!135763))

(declare-fun d!135767 () Bool)

(declare-fun res!826152 () Bool)

(declare-fun e!701871 () Bool)

(assert (=> d!135767 (=> res!826152 e!701871)))

(assert (=> d!135767 (= res!826152 ((_ is Nil!27342) acc!846))))

(assert (=> d!135767 (= (noDuplicate!1960 acc!846) e!701871)))

(declare-fun b!1238422 () Bool)

(declare-fun e!701872 () Bool)

(assert (=> b!1238422 (= e!701871 e!701872)))

(declare-fun res!826153 () Bool)

(assert (=> b!1238422 (=> (not res!826153) (not e!701872))))

(assert (=> b!1238422 (= res!826153 (not (contains!7317 (t!40799 acc!846) (h!28550 acc!846))))))

(declare-fun b!1238423 () Bool)

(assert (=> b!1238423 (= e!701872 (noDuplicate!1960 (t!40799 acc!846)))))

(assert (= (and d!135767 (not res!826152)) b!1238422))

(assert (= (and b!1238422 res!826153) b!1238423))

(declare-fun m!1141533 () Bool)

(assert (=> b!1238422 m!1141533))

(declare-fun m!1141535 () Bool)

(assert (=> b!1238423 m!1141535))

(assert (=> b!1238240 d!135767))

(declare-fun d!135771 () Bool)

(declare-fun lt!561139 () Bool)

(assert (=> d!135771 (= lt!561139 (select (content!590 acc!846) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!701873 () Bool)

(assert (=> d!135771 (= lt!561139 e!701873)))

(declare-fun res!826155 () Bool)

(assert (=> d!135771 (=> (not res!826155) (not e!701873))))

(assert (=> d!135771 (= res!826155 ((_ is Cons!27341) acc!846))))

(assert (=> d!135771 (= (contains!7317 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000) lt!561139)))

(declare-fun b!1238424 () Bool)

(declare-fun e!701874 () Bool)

(assert (=> b!1238424 (= e!701873 e!701874)))

(declare-fun res!826154 () Bool)

(assert (=> b!1238424 (=> res!826154 e!701874)))

(assert (=> b!1238424 (= res!826154 (= (h!28550 acc!846) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1238425 () Bool)

(assert (=> b!1238425 (= e!701874 (contains!7317 (t!40799 acc!846) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!135771 res!826155) b!1238424))

(assert (= (and b!1238424 (not res!826154)) b!1238425))

(assert (=> d!135771 m!1141465))

(declare-fun m!1141537 () Bool)

(assert (=> d!135771 m!1141537))

(declare-fun m!1141539 () Bool)

(assert (=> b!1238425 m!1141539))

(assert (=> b!1238239 d!135771))

(declare-fun b!1238468 () Bool)

(declare-fun e!701916 () Bool)

(declare-fun call!61049 () Bool)

(assert (=> b!1238468 (= e!701916 call!61049)))

(declare-fun b!1238469 () Bool)

(declare-fun e!701913 () Bool)

(assert (=> b!1238469 (= e!701913 e!701916)))

(declare-fun c!121002 () Bool)

(assert (=> b!1238469 (= c!121002 (validKeyInArray!0 (select (arr!38471 a!3835) (bvadd #b00000000000000000000000000000001 from!3213))))))

(declare-fun b!1238470 () Bool)

(declare-fun e!701914 () Bool)

(assert (=> b!1238470 (= e!701914 e!701913)))

(declare-fun res!826190 () Bool)

(assert (=> b!1238470 (=> (not res!826190) (not e!701913))))

(declare-fun e!701915 () Bool)

(assert (=> b!1238470 (= res!826190 (not e!701915))))

(declare-fun res!826192 () Bool)

(assert (=> b!1238470 (=> (not res!826192) (not e!701915))))

(assert (=> b!1238470 (= res!826192 (validKeyInArray!0 (select (arr!38471 a!3835) (bvadd #b00000000000000000000000000000001 from!3213))))))

(declare-fun d!135775 () Bool)

(declare-fun res!826191 () Bool)

(assert (=> d!135775 (=> res!826191 e!701914)))

(assert (=> d!135775 (= res!826191 (bvsge (bvadd #b00000000000000000000000000000001 from!3213) (size!39009 a!3835)))))

(assert (=> d!135775 (= (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) lt!561093) e!701914)))

(declare-fun b!1238471 () Bool)

(assert (=> b!1238471 (= e!701915 (contains!7317 lt!561093 (select (arr!38471 a!3835) (bvadd #b00000000000000000000000000000001 from!3213))))))

(declare-fun bm!61046 () Bool)

(assert (=> bm!61046 (= call!61049 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213 #b00000000000000000000000000000001) (ite c!121002 (Cons!27341 (select (arr!38471 a!3835) (bvadd #b00000000000000000000000000000001 from!3213)) lt!561093) lt!561093)))))

(declare-fun b!1238472 () Bool)

(assert (=> b!1238472 (= e!701916 call!61049)))

(assert (= (and d!135775 (not res!826191)) b!1238470))

(assert (= (and b!1238470 res!826192) b!1238471))

(assert (= (and b!1238470 res!826190) b!1238469))

(assert (= (and b!1238469 c!121002) b!1238472))

(assert (= (and b!1238469 (not c!121002)) b!1238468))

(assert (= (or b!1238472 b!1238468) bm!61046))

(declare-fun m!1141587 () Bool)

(assert (=> b!1238469 m!1141587))

(assert (=> b!1238469 m!1141587))

(declare-fun m!1141589 () Bool)

(assert (=> b!1238469 m!1141589))

(assert (=> b!1238470 m!1141587))

(assert (=> b!1238470 m!1141587))

(assert (=> b!1238470 m!1141589))

(assert (=> b!1238471 m!1141587))

(assert (=> b!1238471 m!1141587))

(declare-fun m!1141595 () Bool)

(assert (=> b!1238471 m!1141595))

(assert (=> bm!61046 m!1141587))

(declare-fun m!1141597 () Bool)

(assert (=> bm!61046 m!1141597))

(assert (=> b!1238244 d!135775))

(declare-fun d!135807 () Bool)

(assert (=> d!135807 (noDuplicate!1960 acc!846)))

(declare-fun lt!561152 () Unit!40951)

(declare-fun choose!1839 (List!27345 List!27345) Unit!40951)

(assert (=> d!135807 (= lt!561152 (choose!1839 acc!846 lt!561093))))

(declare-fun e!701937 () Bool)

(assert (=> d!135807 e!701937))

(declare-fun res!826213 () Bool)

(assert (=> d!135807 (=> (not res!826213) (not e!701937))))

(assert (=> d!135807 (= res!826213 (subseq!599 acc!846 lt!561093))))

(assert (=> d!135807 (= (noDuplicateSubseq!80 acc!846 lt!561093) lt!561152)))

(declare-fun b!1238493 () Bool)

(assert (=> b!1238493 (= e!701937 (noDuplicate!1960 lt!561093))))

(assert (= (and d!135807 res!826213) b!1238493))

(assert (=> d!135807 m!1141359))

(declare-fun m!1141599 () Bool)

(assert (=> d!135807 m!1141599))

(assert (=> d!135807 m!1141367))

(assert (=> b!1238493 m!1141385))

(assert (=> b!1238244 d!135807))

(declare-fun d!135809 () Bool)

(declare-fun lt!561153 () Bool)

(assert (=> d!135809 (= lt!561153 (select (content!590 lt!561093) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!701942 () Bool)

(assert (=> d!135809 (= lt!561153 e!701942)))

(declare-fun res!826219 () Bool)

(assert (=> d!135809 (=> (not res!826219) (not e!701942))))

(assert (=> d!135809 (= res!826219 ((_ is Cons!27341) lt!561093))))

(assert (=> d!135809 (= (contains!7317 lt!561093 #b0000000000000000000000000000000000000000000000000000000000000000) lt!561153)))

(declare-fun b!1238498 () Bool)

(declare-fun e!701943 () Bool)

(assert (=> b!1238498 (= e!701942 e!701943)))

(declare-fun res!826218 () Bool)

(assert (=> b!1238498 (=> res!826218 e!701943)))

(assert (=> b!1238498 (= res!826218 (= (h!28550 lt!561093) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1238499 () Bool)

(assert (=> b!1238499 (= e!701943 (contains!7317 (t!40799 lt!561093) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!135809 res!826219) b!1238498))

(assert (= (and b!1238498 (not res!826218)) b!1238499))

(declare-fun m!1141601 () Bool)

(assert (=> d!135809 m!1141601))

(declare-fun m!1141605 () Bool)

(assert (=> d!135809 m!1141605))

(declare-fun m!1141609 () Bool)

(assert (=> b!1238499 m!1141609))

(assert (=> b!1238243 d!135809))

(declare-fun d!135813 () Bool)

(declare-fun lt!561154 () Bool)

(assert (=> d!135813 (= lt!561154 (select (content!590 acc!846) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!701944 () Bool)

(assert (=> d!135813 (= lt!561154 e!701944)))

(declare-fun res!826221 () Bool)

(assert (=> d!135813 (=> (not res!826221) (not e!701944))))

(assert (=> d!135813 (= res!826221 ((_ is Cons!27341) acc!846))))

(assert (=> d!135813 (= (contains!7317 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000) lt!561154)))

(declare-fun b!1238500 () Bool)

(declare-fun e!701945 () Bool)

(assert (=> b!1238500 (= e!701944 e!701945)))

(declare-fun res!826220 () Bool)

(assert (=> b!1238500 (=> res!826220 e!701945)))

(assert (=> b!1238500 (= res!826220 (= (h!28550 acc!846) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1238501 () Bool)

(assert (=> b!1238501 (= e!701945 (contains!7317 (t!40799 acc!846) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!135813 res!826221) b!1238500))

(assert (= (and b!1238500 (not res!826220)) b!1238501))

(assert (=> d!135813 m!1141465))

(declare-fun m!1141611 () Bool)

(assert (=> d!135813 m!1141611))

(declare-fun m!1141613 () Bool)

(assert (=> b!1238501 m!1141613))

(assert (=> b!1238242 d!135813))

(declare-fun b!1238506 () Bool)

(declare-fun e!701953 () Bool)

(declare-fun call!61050 () Bool)

(assert (=> b!1238506 (= e!701953 call!61050)))

(declare-fun b!1238507 () Bool)

(declare-fun e!701950 () Bool)

(assert (=> b!1238507 (= e!701950 e!701953)))

(declare-fun c!121003 () Bool)

(assert (=> b!1238507 (= c!121003 (validKeyInArray!0 (select (arr!38471 a!3835) from!3213)))))

(declare-fun b!1238508 () Bool)

(declare-fun e!701951 () Bool)

(assert (=> b!1238508 (= e!701951 e!701950)))

(declare-fun res!826226 () Bool)

(assert (=> b!1238508 (=> (not res!826226) (not e!701950))))

(declare-fun e!701952 () Bool)

(assert (=> b!1238508 (= res!826226 (not e!701952))))

(declare-fun res!826228 () Bool)

(assert (=> b!1238508 (=> (not res!826228) (not e!701952))))

(assert (=> b!1238508 (= res!826228 (validKeyInArray!0 (select (arr!38471 a!3835) from!3213)))))

(declare-fun d!135815 () Bool)

(declare-fun res!826227 () Bool)

(assert (=> d!135815 (=> res!826227 e!701951)))

(assert (=> d!135815 (= res!826227 (bvsge from!3213 (size!39009 a!3835)))))

(assert (=> d!135815 (= (arrayNoDuplicates!0 a!3835 from!3213 acc!846) e!701951)))

(declare-fun b!1238509 () Bool)

(assert (=> b!1238509 (= e!701952 (contains!7317 acc!846 (select (arr!38471 a!3835) from!3213)))))

(declare-fun bm!61047 () Bool)

(assert (=> bm!61047 (= call!61050 (arrayNoDuplicates!0 a!3835 (bvadd from!3213 #b00000000000000000000000000000001) (ite c!121003 (Cons!27341 (select (arr!38471 a!3835) from!3213) acc!846) acc!846)))))

(declare-fun b!1238510 () Bool)

(assert (=> b!1238510 (= e!701953 call!61050)))

(assert (= (and d!135815 (not res!826227)) b!1238508))

(assert (= (and b!1238508 res!826228) b!1238509))

(assert (= (and b!1238508 res!826226) b!1238507))

(assert (= (and b!1238507 c!121003) b!1238510))

(assert (= (and b!1238507 (not c!121003)) b!1238506))

(assert (= (or b!1238510 b!1238506) bm!61047))

(assert (=> b!1238507 m!1141375))

(assert (=> b!1238507 m!1141375))

(assert (=> b!1238507 m!1141391))

(assert (=> b!1238508 m!1141375))

(assert (=> b!1238508 m!1141375))

(assert (=> b!1238508 m!1141391))

(assert (=> b!1238509 m!1141375))

(assert (=> b!1238509 m!1141375))

(declare-fun m!1141619 () Bool)

(assert (=> b!1238509 m!1141619))

(assert (=> bm!61047 m!1141375))

(declare-fun m!1141621 () Bool)

(assert (=> bm!61047 m!1141621))

(assert (=> b!1238236 d!135815))

(declare-fun d!135819 () Bool)

(assert (=> d!135819 (= (validKeyInArray!0 (select (arr!38471 a!3835) from!3213)) (and (not (= (select (arr!38471 a!3835) from!3213) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!38471 a!3835) from!3213) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1238235 d!135819))

(declare-fun d!135821 () Bool)

(declare-fun lt!561155 () Bool)

(assert (=> d!135821 (= lt!561155 (select (content!590 lt!561093) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!701954 () Bool)

(assert (=> d!135821 (= lt!561155 e!701954)))

(declare-fun res!826230 () Bool)

(assert (=> d!135821 (=> (not res!826230) (not e!701954))))

(assert (=> d!135821 (= res!826230 ((_ is Cons!27341) lt!561093))))

(assert (=> d!135821 (= (contains!7317 lt!561093 #b1000000000000000000000000000000000000000000000000000000000000000) lt!561155)))

(declare-fun b!1238511 () Bool)

(declare-fun e!701955 () Bool)

(assert (=> b!1238511 (= e!701954 e!701955)))

(declare-fun res!826229 () Bool)

(assert (=> b!1238511 (=> res!826229 e!701955)))

(assert (=> b!1238511 (= res!826229 (= (h!28550 lt!561093) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1238512 () Bool)

(assert (=> b!1238512 (= e!701955 (contains!7317 (t!40799 lt!561093) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!135821 res!826230) b!1238511))

(assert (= (and b!1238511 (not res!826229)) b!1238512))

(assert (=> d!135821 m!1141601))

(declare-fun m!1141623 () Bool)

(assert (=> d!135821 m!1141623))

(declare-fun m!1141625 () Bool)

(assert (=> b!1238512 m!1141625))

(assert (=> b!1238234 d!135821))

(check-sat (not b!1238469) (not bm!61046) (not b!1238508) (not b!1238405) (not b!1238423) (not b!1238499) (not d!135737) (not b!1238512) (not d!135821) (not d!135807) (not b!1238403) (not b!1238470) (not b!1238507) (not d!135747) (not b!1238425) (not b!1238471) (not b!1238321) (not b!1238422) (not d!135809) (not bm!61047) (not b!1238501) (not b!1238407) (not bm!61040) (not b!1238412) (not d!135763) (not b!1238344) (not d!135813) (not d!135771) (not b!1238328) (not b!1238493) (not b!1238322) (not b!1238509) (not b!1238343) (not b!1238411))
(check-sat)
