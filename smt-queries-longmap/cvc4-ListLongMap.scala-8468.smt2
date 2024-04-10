; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103066 () Bool)

(assert start!103066)

(declare-fun b!1237847 () Bool)

(declare-fun e!701545 () Bool)

(declare-fun e!701546 () Bool)

(assert (=> b!1237847 (= e!701545 (not e!701546))))

(declare-fun res!825643 () Bool)

(assert (=> b!1237847 (=> res!825643 e!701546)))

(declare-fun from!3213 () (_ BitVec 32))

(assert (=> b!1237847 (= res!825643 (bvslt (bvadd #b00000000000000000000000000000001 from!3213) #b00000000000000000000000000000000))))

(declare-datatypes ((List!27276 0))(
  ( (Nil!27273) (Cons!27272 (h!28481 (_ BitVec 64)) (t!40739 List!27276)) )
))
(declare-fun acc!846 () List!27276)

(declare-fun lt!561144 () List!27276)

(declare-fun subseq!592 (List!27276 List!27276) Bool)

(assert (=> b!1237847 (subseq!592 acc!846 lt!561144)))

(declare-datatypes ((Unit!41086 0))(
  ( (Unit!41087) )
))
(declare-fun lt!561146 () Unit!41086)

(declare-fun subseqTail!79 (List!27276 List!27276) Unit!41086)

(assert (=> b!1237847 (= lt!561146 (subseqTail!79 lt!561144 lt!561144))))

(assert (=> b!1237847 (subseq!592 lt!561144 lt!561144)))

(declare-fun lt!561145 () Unit!41086)

(declare-fun lemmaListSubSeqRefl!0 (List!27276) Unit!41086)

(assert (=> b!1237847 (= lt!561145 (lemmaListSubSeqRefl!0 lt!561144))))

(declare-datatypes ((array!79797 0))(
  ( (array!79798 (arr!38503 (Array (_ BitVec 32) (_ BitVec 64))) (size!39039 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79797)

(assert (=> b!1237847 (= lt!561144 (Cons!27272 (select (arr!38503 a!3835) from!3213) acc!846))))

(declare-fun b!1237848 () Bool)

(declare-fun res!825647 () Bool)

(assert (=> b!1237848 (=> (not res!825647) (not e!701545))))

(declare-fun contains!7338 (List!27276 (_ BitVec 64)) Bool)

(assert (=> b!1237848 (= res!825647 (not (contains!7338 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1237849 () Bool)

(declare-fun res!825642 () Bool)

(assert (=> b!1237849 (=> (not res!825642) (not e!701545))))

(declare-fun k!2925 () (_ BitVec 64))

(assert (=> b!1237849 (= res!825642 (contains!7338 acc!846 k!2925))))

(declare-fun b!1237850 () Bool)

(declare-fun res!825651 () Bool)

(assert (=> b!1237850 (=> (not res!825651) (not e!701545))))

(declare-fun noDuplicate!1935 (List!27276) Bool)

(assert (=> b!1237850 (= res!825651 (noDuplicate!1935 acc!846))))

(declare-fun res!825649 () Bool)

(assert (=> start!103066 (=> (not res!825649) (not e!701545))))

(assert (=> start!103066 (= res!825649 (and (bvslt (size!39039 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!39039 a!3835))))))

(assert (=> start!103066 e!701545))

(declare-fun array_inv!29351 (array!79797) Bool)

(assert (=> start!103066 (array_inv!29351 a!3835)))

(assert (=> start!103066 true))

(declare-fun b!1237846 () Bool)

(declare-fun e!701544 () Bool)

(assert (=> b!1237846 (= e!701544 (not (contains!7338 lt!561144 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1237851 () Bool)

(declare-fun res!825644 () Bool)

(assert (=> b!1237851 (=> (not res!825644) (not e!701545))))

(assert (=> b!1237851 (= res!825644 (not (= from!3213 (bvsub (size!39039 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1237852 () Bool)

(declare-fun res!825648 () Bool)

(assert (=> b!1237852 (=> (not res!825648) (not e!701545))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1237852 (= res!825648 (validKeyInArray!0 (select (arr!38503 a!3835) from!3213)))))

(declare-fun b!1237853 () Bool)

(declare-fun res!825645 () Bool)

(assert (=> b!1237853 (=> res!825645 e!701546)))

(assert (=> b!1237853 (= res!825645 (not (noDuplicate!1935 lt!561144)))))

(declare-fun b!1237854 () Bool)

(declare-fun res!825650 () Bool)

(assert (=> b!1237854 (=> (not res!825650) (not e!701545))))

(assert (=> b!1237854 (= res!825650 (not (contains!7338 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1237855 () Bool)

(declare-fun res!825646 () Bool)

(assert (=> b!1237855 (=> (not res!825646) (not e!701545))))

(declare-fun arrayNoDuplicates!0 (array!79797 (_ BitVec 32) List!27276) Bool)

(assert (=> b!1237855 (= res!825646 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1237856 () Bool)

(assert (=> b!1237856 (= e!701546 e!701544)))

(declare-fun res!825652 () Bool)

(assert (=> b!1237856 (=> (not res!825652) (not e!701544))))

(assert (=> b!1237856 (= res!825652 (not (contains!7338 lt!561144 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!103066 res!825649) b!1237850))

(assert (= (and b!1237850 res!825651) b!1237848))

(assert (= (and b!1237848 res!825647) b!1237854))

(assert (= (and b!1237854 res!825650) b!1237855))

(assert (= (and b!1237855 res!825646) b!1237849))

(assert (= (and b!1237849 res!825642) b!1237851))

(assert (= (and b!1237851 res!825644) b!1237852))

(assert (= (and b!1237852 res!825648) b!1237847))

(assert (= (and b!1237847 (not res!825643)) b!1237853))

(assert (= (and b!1237853 (not res!825645)) b!1237856))

(assert (= (and b!1237856 res!825652) b!1237846))

(declare-fun m!1141477 () Bool)

(assert (=> b!1237855 m!1141477))

(declare-fun m!1141479 () Bool)

(assert (=> b!1237856 m!1141479))

(declare-fun m!1141481 () Bool)

(assert (=> b!1237848 m!1141481))

(declare-fun m!1141483 () Bool)

(assert (=> b!1237849 m!1141483))

(declare-fun m!1141485 () Bool)

(assert (=> b!1237853 m!1141485))

(declare-fun m!1141487 () Bool)

(assert (=> b!1237854 m!1141487))

(declare-fun m!1141489 () Bool)

(assert (=> b!1237846 m!1141489))

(declare-fun m!1141491 () Bool)

(assert (=> b!1237850 m!1141491))

(declare-fun m!1141493 () Bool)

(assert (=> start!103066 m!1141493))

(declare-fun m!1141495 () Bool)

(assert (=> b!1237847 m!1141495))

(declare-fun m!1141497 () Bool)

(assert (=> b!1237847 m!1141497))

(declare-fun m!1141499 () Bool)

(assert (=> b!1237847 m!1141499))

(declare-fun m!1141501 () Bool)

(assert (=> b!1237847 m!1141501))

(declare-fun m!1141503 () Bool)

(assert (=> b!1237847 m!1141503))

(assert (=> b!1237852 m!1141503))

(assert (=> b!1237852 m!1141503))

(declare-fun m!1141505 () Bool)

(assert (=> b!1237852 m!1141505))

(push 1)

(assert (not b!1237856))

(assert (not b!1237854))

(assert (not b!1237847))

(assert (not b!1237850))

(assert (not b!1237852))

(assert (not b!1237848))

(assert (not start!103066))

(assert (not b!1237849))

(assert (not b!1237846))

(assert (not b!1237853))

(assert (not b!1237855))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!135769 () Bool)

(declare-fun lt!561151 () Bool)

(declare-fun content!587 (List!27276) (Set (_ BitVec 64)))

(assert (=> d!135769 (= lt!561151 (member k!2925 (content!587 acc!846)))))

(declare-fun e!701591 () Bool)

(assert (=> d!135769 (= lt!561151 e!701591)))

(declare-fun res!825689 () Bool)

(assert (=> d!135769 (=> (not res!825689) (not e!701591))))

(assert (=> d!135769 (= res!825689 (is-Cons!27272 acc!846))))

(assert (=> d!135769 (= (contains!7338 acc!846 k!2925) lt!561151)))

(declare-fun b!1237905 () Bool)

(declare-fun e!701590 () Bool)

(assert (=> b!1237905 (= e!701591 e!701590)))

(declare-fun res!825690 () Bool)

(assert (=> b!1237905 (=> res!825690 e!701590)))

(assert (=> b!1237905 (= res!825690 (= (h!28481 acc!846) k!2925))))

(declare-fun b!1237906 () Bool)

(assert (=> b!1237906 (= e!701590 (contains!7338 (t!40739 acc!846) k!2925))))

(assert (= (and d!135769 res!825689) b!1237905))

(assert (= (and b!1237905 (not res!825690)) b!1237906))

(declare-fun m!1141519 () Bool)

(assert (=> d!135769 m!1141519))

(declare-fun m!1141521 () Bool)

(assert (=> d!135769 m!1141521))

(declare-fun m!1141523 () Bool)

(assert (=> b!1237906 m!1141523))

(assert (=> b!1237849 d!135769))

(declare-fun d!135773 () Bool)

(declare-fun lt!561152 () Bool)

(assert (=> d!135773 (= lt!561152 (member #b0000000000000000000000000000000000000000000000000000000000000000 (content!587 acc!846)))))

(declare-fun e!701593 () Bool)

(assert (=> d!135773 (= lt!561152 e!701593)))

(declare-fun res!825691 () Bool)

(assert (=> d!135773 (=> (not res!825691) (not e!701593))))

(assert (=> d!135773 (= res!825691 (is-Cons!27272 acc!846))))

(assert (=> d!135773 (= (contains!7338 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000) lt!561152)))

(declare-fun b!1237907 () Bool)

(declare-fun e!701592 () Bool)

(assert (=> b!1237907 (= e!701593 e!701592)))

(declare-fun res!825692 () Bool)

(assert (=> b!1237907 (=> res!825692 e!701592)))

(assert (=> b!1237907 (= res!825692 (= (h!28481 acc!846) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1237908 () Bool)

(assert (=> b!1237908 (= e!701592 (contains!7338 (t!40739 acc!846) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!135773 res!825691) b!1237907))

(assert (= (and b!1237907 (not res!825692)) b!1237908))

(assert (=> d!135773 m!1141519))

(declare-fun m!1141525 () Bool)

(assert (=> d!135773 m!1141525))

(declare-fun m!1141527 () Bool)

(assert (=> b!1237908 m!1141527))

(assert (=> b!1237848 d!135773))

(declare-fun b!1237944 () Bool)

(declare-fun e!701620 () Bool)

(assert (=> b!1237944 (= e!701620 (subseq!592 (t!40739 acc!846) (t!40739 lt!561144)))))

(declare-fun d!135775 () Bool)

(declare-fun res!825708 () Bool)

(declare-fun e!701618 () Bool)

(assert (=> d!135775 (=> res!825708 e!701618)))

(assert (=> d!135775 (= res!825708 (is-Nil!27273 acc!846))))

(assert (=> d!135775 (= (subseq!592 acc!846 lt!561144) e!701618)))

(declare-fun b!1237945 () Bool)

(declare-fun e!701619 () Bool)

(assert (=> b!1237945 (= e!701619 (subseq!592 acc!846 (t!40739 lt!561144)))))

(declare-fun b!1237942 () Bool)

(declare-fun e!701621 () Bool)

(assert (=> b!1237942 (= e!701618 e!701621)))

(declare-fun res!825711 () Bool)

(assert (=> b!1237942 (=> (not res!825711) (not e!701621))))

(assert (=> b!1237942 (= res!825711 (is-Cons!27272 lt!561144))))

(declare-fun b!1237943 () Bool)

(assert (=> b!1237943 (= e!701621 e!701619)))

(declare-fun res!825710 () Bool)

(assert (=> b!1237943 (=> res!825710 e!701619)))

(assert (=> b!1237943 (= res!825710 e!701620)))

(declare-fun res!825709 () Bool)

(assert (=> b!1237943 (=> (not res!825709) (not e!701620))))

(assert (=> b!1237943 (= res!825709 (= (h!28481 acc!846) (h!28481 lt!561144)))))

(assert (= (and d!135775 (not res!825708)) b!1237942))

(assert (= (and b!1237942 res!825711) b!1237943))

(assert (= (and b!1237943 res!825709) b!1237944))

(assert (= (and b!1237943 (not res!825710)) b!1237945))

(declare-fun m!1141545 () Bool)

(assert (=> b!1237944 m!1141545))

(declare-fun m!1141547 () Bool)

(assert (=> b!1237945 m!1141547))

(assert (=> b!1237847 d!135775))

(declare-fun b!1237995 () Bool)

(declare-fun e!701662 () Unit!41086)

(declare-fun Unit!41092 () Unit!41086)

(assert (=> b!1237995 (= e!701662 Unit!41092)))

(declare-fun bm!61044 () Bool)

(declare-fun call!61047 () Unit!41086)

(declare-fun c!120990 () Bool)

(assert (=> bm!61044 (= call!61047 (subseqTail!79 (ite c!120990 lt!561144 (t!40739 lt!561144)) (t!40739 lt!561144)))))

(declare-fun b!1237996 () Bool)

(declare-fun e!701663 () Unit!41086)

(assert (=> b!1237996 (= e!701662 e!701663)))

(assert (=> b!1237996 (= c!120990 (subseq!592 lt!561144 (t!40739 lt!561144)))))

(declare-fun b!1237997 () Bool)

(assert (=> b!1237997 (= e!701663 call!61047)))

(declare-fun b!1237998 () Bool)

(declare-fun e!701661 () Unit!41086)

(assert (=> b!1237998 (= e!701661 call!61047)))

(declare-fun b!1237999 () Bool)

(declare-fun c!120989 () Bool)

(declare-fun isEmpty!1013 (List!27276) Bool)

(assert (=> b!1237999 (= c!120989 (not (isEmpty!1013 (t!40739 lt!561144))))))

(assert (=> b!1237999 (= e!701663 e!701661)))

(declare-fun b!1238000 () Bool)

(declare-fun Unit!41093 () Unit!41086)

(assert (=> b!1238000 (= e!701661 Unit!41093)))

(declare-fun d!135785 () Bool)

(declare-fun tail!165 (List!27276) List!27276)

(assert (=> d!135785 (subseq!592 (tail!165 lt!561144) lt!561144)))

(declare-fun lt!561169 () Unit!41086)

(assert (=> d!135785 (= lt!561169 e!701662)))

(declare-fun c!120988 () Bool)

(assert (=> d!135785 (= c!120988 (and (is-Cons!27272 lt!561144) (is-Cons!27272 lt!561144)))))

(declare-fun e!701660 () Bool)

(assert (=> d!135785 e!701660))

(declare-fun res!825739 () Bool)

(assert (=> d!135785 (=> (not res!825739) (not e!701660))))

(assert (=> d!135785 (= res!825739 (not (isEmpty!1013 lt!561144)))))

(assert (=> d!135785 (= (subseqTail!79 lt!561144 lt!561144) lt!561169)))

(declare-fun b!1238001 () Bool)

(assert (=> b!1238001 (= e!701660 (subseq!592 lt!561144 lt!561144))))

(assert (= (and d!135785 res!825739) b!1238001))

(assert (= (and d!135785 c!120988) b!1237996))

(assert (= (and d!135785 (not c!120988)) b!1237995))

(assert (= (and b!1237996 c!120990) b!1237997))

(assert (= (and b!1237996 (not c!120990)) b!1237999))

(assert (= (and b!1237999 c!120989) b!1237998))

(assert (= (and b!1237999 (not c!120989)) b!1238000))

(assert (= (or b!1237997 b!1237998) bm!61044))

(assert (=> b!1238001 m!1141499))

(declare-fun m!1141581 () Bool)

(assert (=> bm!61044 m!1141581))

(declare-fun m!1141583 () Bool)

(assert (=> d!135785 m!1141583))

(assert (=> d!135785 m!1141583))

(declare-fun m!1141585 () Bool)

(assert (=> d!135785 m!1141585))

(declare-fun m!1141587 () Bool)

(assert (=> d!135785 m!1141587))

(declare-fun m!1141589 () Bool)

(assert (=> b!1237996 m!1141589))

(declare-fun m!1141591 () Bool)

(assert (=> b!1237999 m!1141591))

(assert (=> b!1237847 d!135785))

(declare-fun b!1238004 () Bool)

(declare-fun e!701666 () Bool)

(assert (=> b!1238004 (= e!701666 (subseq!592 (t!40739 lt!561144) (t!40739 lt!561144)))))

(declare-fun d!135801 () Bool)

(declare-fun res!825740 () Bool)

(declare-fun e!701664 () Bool)

(assert (=> d!135801 (=> res!825740 e!701664)))

(assert (=> d!135801 (= res!825740 (is-Nil!27273 lt!561144))))

(assert (=> d!135801 (= (subseq!592 lt!561144 lt!561144) e!701664)))

(declare-fun b!1238005 () Bool)

(declare-fun e!701665 () Bool)

(assert (=> b!1238005 (= e!701665 (subseq!592 lt!561144 (t!40739 lt!561144)))))

(declare-fun b!1238002 () Bool)

(declare-fun e!701667 () Bool)

(assert (=> b!1238002 (= e!701664 e!701667)))

(declare-fun res!825743 () Bool)

(assert (=> b!1238002 (=> (not res!825743) (not e!701667))))

(assert (=> b!1238002 (= res!825743 (is-Cons!27272 lt!561144))))

(declare-fun b!1238003 () Bool)

(assert (=> b!1238003 (= e!701667 e!701665)))

(declare-fun res!825742 () Bool)

(assert (=> b!1238003 (=> res!825742 e!701665)))

(assert (=> b!1238003 (= res!825742 e!701666)))

(declare-fun res!825741 () Bool)

(assert (=> b!1238003 (=> (not res!825741) (not e!701666))))

(assert (=> b!1238003 (= res!825741 (= (h!28481 lt!561144) (h!28481 lt!561144)))))

(assert (= (and d!135801 (not res!825740)) b!1238002))

(assert (= (and b!1238002 res!825743) b!1238003))

(assert (= (and b!1238003 res!825741) b!1238004))

(assert (= (and b!1238003 (not res!825742)) b!1238005))

(declare-fun m!1141593 () Bool)

(assert (=> b!1238004 m!1141593))

(assert (=> b!1238005 m!1141589))

(assert (=> b!1237847 d!135801))

(declare-fun d!135803 () Bool)

(assert (=> d!135803 (subseq!592 lt!561144 lt!561144)))

(declare-fun lt!561174 () Unit!41086)

(declare-fun choose!36 (List!27276) Unit!41086)

