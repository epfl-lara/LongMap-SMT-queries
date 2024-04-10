; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102910 () Bool)

(assert start!102910)

(declare-fun b!1236817 () Bool)

(declare-fun res!824804 () Bool)

(declare-fun e!700940 () Bool)

(assert (=> b!1236817 (=> (not res!824804) (not e!700940))))

(declare-fun from!3213 () (_ BitVec 32))

(declare-datatypes ((array!79755 0))(
  ( (array!79756 (arr!38485 (Array (_ BitVec 32) (_ BitVec 64))) (size!39021 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79755)

(assert (=> b!1236817 (= res!824804 (not (= from!3213 (bvsub (size!39021 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1236818 () Bool)

(declare-fun res!824803 () Bool)

(assert (=> b!1236818 (=> (not res!824803) (not e!700940))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1236818 (= res!824803 (validKeyInArray!0 (select (arr!38485 a!3835) from!3213)))))

(declare-fun b!1236819 () Bool)

(declare-fun res!824805 () Bool)

(assert (=> b!1236819 (=> (not res!824805) (not e!700940))))

(declare-datatypes ((List!27258 0))(
  ( (Nil!27255) (Cons!27254 (h!28463 (_ BitVec 64)) (t!40721 List!27258)) )
))
(declare-fun acc!846 () List!27258)

(declare-fun contains!7320 (List!27258 (_ BitVec 64)) Bool)

(assert (=> b!1236819 (= res!824805 (not (contains!7320 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1236820 () Bool)

(declare-fun res!824799 () Bool)

(assert (=> b!1236820 (=> (not res!824799) (not e!700940))))

(assert (=> b!1236820 (= res!824799 (not (contains!7320 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1236822 () Bool)

(declare-fun res!824801 () Bool)

(assert (=> b!1236822 (=> (not res!824801) (not e!700940))))

(declare-fun k!2925 () (_ BitVec 64))

(assert (=> b!1236822 (= res!824801 (contains!7320 acc!846 k!2925))))

(declare-fun b!1236823 () Bool)

(declare-fun res!824800 () Bool)

(assert (=> b!1236823 (=> (not res!824800) (not e!700940))))

(declare-fun arrayNoDuplicates!0 (array!79755 (_ BitVec 32) List!27258) Bool)

(assert (=> b!1236823 (= res!824800 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1236824 () Bool)

(declare-fun lt!560899 () List!27258)

(declare-fun subseq!574 (List!27258 List!27258) Bool)

(assert (=> b!1236824 (= e!700940 (not (subseq!574 acc!846 lt!560899)))))

(declare-datatypes ((Unit!41034 0))(
  ( (Unit!41035) )
))
(declare-fun lt!560900 () Unit!41034)

(declare-fun subseqTail!61 (List!27258 List!27258) Unit!41034)

(assert (=> b!1236824 (= lt!560900 (subseqTail!61 lt!560899 lt!560899))))

(assert (=> b!1236824 (subseq!574 lt!560899 lt!560899)))

(declare-fun lt!560898 () Unit!41034)

(declare-fun lemmaListSubSeqRefl!0 (List!27258) Unit!41034)

(assert (=> b!1236824 (= lt!560898 (lemmaListSubSeqRefl!0 lt!560899))))

(assert (=> b!1236824 (= lt!560899 (Cons!27254 (select (arr!38485 a!3835) from!3213) acc!846))))

(declare-fun b!1236821 () Bool)

(declare-fun res!824802 () Bool)

(assert (=> b!1236821 (=> (not res!824802) (not e!700940))))

(declare-fun noDuplicate!1917 (List!27258) Bool)

(assert (=> b!1236821 (= res!824802 (noDuplicate!1917 acc!846))))

(declare-fun res!824806 () Bool)

(assert (=> start!102910 (=> (not res!824806) (not e!700940))))

(assert (=> start!102910 (= res!824806 (and (bvslt (size!39021 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!39021 a!3835))))))

(assert (=> start!102910 e!700940))

(declare-fun array_inv!29333 (array!79755) Bool)

(assert (=> start!102910 (array_inv!29333 a!3835)))

(assert (=> start!102910 true))

(assert (= (and start!102910 res!824806) b!1236821))

(assert (= (and b!1236821 res!824802) b!1236819))

(assert (= (and b!1236819 res!824805) b!1236820))

(assert (= (and b!1236820 res!824799) b!1236823))

(assert (= (and b!1236823 res!824800) b!1236822))

(assert (= (and b!1236822 res!824801) b!1236817))

(assert (= (and b!1236817 res!824804) b!1236818))

(assert (= (and b!1236818 res!824803) b!1236824))

(declare-fun m!1140565 () Bool)

(assert (=> b!1236823 m!1140565))

(declare-fun m!1140567 () Bool)

(assert (=> b!1236820 m!1140567))

(declare-fun m!1140569 () Bool)

(assert (=> start!102910 m!1140569))

(declare-fun m!1140571 () Bool)

(assert (=> b!1236819 m!1140571))

(declare-fun m!1140573 () Bool)

(assert (=> b!1236821 m!1140573))

(declare-fun m!1140575 () Bool)

(assert (=> b!1236824 m!1140575))

(declare-fun m!1140577 () Bool)

(assert (=> b!1236824 m!1140577))

(declare-fun m!1140579 () Bool)

(assert (=> b!1236824 m!1140579))

(declare-fun m!1140581 () Bool)

(assert (=> b!1236824 m!1140581))

(declare-fun m!1140583 () Bool)

(assert (=> b!1236824 m!1140583))

(assert (=> b!1236818 m!1140583))

(assert (=> b!1236818 m!1140583))

(declare-fun m!1140585 () Bool)

(assert (=> b!1236818 m!1140585))

(declare-fun m!1140587 () Bool)

(assert (=> b!1236822 m!1140587))

(push 1)

(assert (not b!1236822))

(assert (not b!1236823))

(assert (not b!1236820))

(assert (not b!1236819))

(assert (not start!102910))

(assert (not b!1236818))

(assert (not b!1236824))

(assert (not b!1236821))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!135507 () Bool)

(declare-fun res!824826 () Bool)

(declare-fun e!700964 () Bool)

(assert (=> d!135507 (=> res!824826 e!700964)))

(assert (=> d!135507 (= res!824826 (is-Nil!27255 acc!846))))

(assert (=> d!135507 (= (noDuplicate!1917 acc!846) e!700964)))

(declare-fun b!1236850 () Bool)

(declare-fun e!700965 () Bool)

(assert (=> b!1236850 (= e!700964 e!700965)))

(declare-fun res!824827 () Bool)

(assert (=> b!1236850 (=> (not res!824827) (not e!700965))))

(assert (=> b!1236850 (= res!824827 (not (contains!7320 (t!40721 acc!846) (h!28463 acc!846))))))

(declare-fun b!1236851 () Bool)

(assert (=> b!1236851 (= e!700965 (noDuplicate!1917 (t!40721 acc!846)))))

(assert (= (and d!135507 (not res!824826)) b!1236850))

(assert (= (and b!1236850 res!824827) b!1236851))

(declare-fun m!1140599 () Bool)

(assert (=> b!1236850 m!1140599))

(declare-fun m!1140601 () Bool)

(assert (=> b!1236851 m!1140601))

(assert (=> b!1236821 d!135507))

(declare-fun d!135513 () Bool)

(assert (=> d!135513 (= (array_inv!29333 a!3835) (bvsge (size!39021 a!3835) #b00000000000000000000000000000000))))

(assert (=> start!102910 d!135513))

(declare-fun d!135519 () Bool)

(declare-fun lt!560908 () Bool)

(declare-fun content!582 (List!27258) (Set (_ BitVec 64)))

(assert (=> d!135519 (= lt!560908 (member #b1000000000000000000000000000000000000000000000000000000000000000 (content!582 acc!846)))))

(declare-fun e!700986 () Bool)

(assert (=> d!135519 (= lt!560908 e!700986)))

(declare-fun res!824848 () Bool)

(assert (=> d!135519 (=> (not res!824848) (not e!700986))))

(assert (=> d!135519 (= res!824848 (is-Cons!27254 acc!846))))

(assert (=> d!135519 (= (contains!7320 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000) lt!560908)))

(declare-fun b!1236872 () Bool)

(declare-fun e!700987 () Bool)

(assert (=> b!1236872 (= e!700986 e!700987)))

(declare-fun res!824849 () Bool)

(assert (=> b!1236872 (=> res!824849 e!700987)))

(assert (=> b!1236872 (= res!824849 (= (h!28463 acc!846) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1236873 () Bool)

(assert (=> b!1236873 (= e!700987 (contains!7320 (t!40721 acc!846) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!135519 res!824848) b!1236872))

(assert (= (and b!1236872 (not res!824849)) b!1236873))

(declare-fun m!1140615 () Bool)

(assert (=> d!135519 m!1140615))

(declare-fun m!1140617 () Bool)

(assert (=> d!135519 m!1140617))

(declare-fun m!1140619 () Bool)

(assert (=> b!1236873 m!1140619))

(assert (=> b!1236820 d!135519))

(declare-fun d!135525 () Bool)

(assert (=> d!135525 (= (validKeyInArray!0 (select (arr!38485 a!3835) from!3213)) (and (not (= (select (arr!38485 a!3835) from!3213) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!38485 a!3835) from!3213) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1236818 d!135525))

(declare-fun d!135527 () Bool)

(declare-fun lt!560909 () Bool)

(assert (=> d!135527 (= lt!560909 (member #b0000000000000000000000000000000000000000000000000000000000000000 (content!582 acc!846)))))

(declare-fun e!700996 () Bool)

(assert (=> d!135527 (= lt!560909 e!700996)))

(declare-fun res!824856 () Bool)

(assert (=> d!135527 (=> (not res!824856) (not e!700996))))

(assert (=> d!135527 (= res!824856 (is-Cons!27254 acc!846))))

(assert (=> d!135527 (= (contains!7320 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000) lt!560909)))

(declare-fun b!1236884 () Bool)

(declare-fun e!700997 () Bool)

(assert (=> b!1236884 (= e!700996 e!700997)))

(declare-fun res!824857 () Bool)

(assert (=> b!1236884 (=> res!824857 e!700997)))

(assert (=> b!1236884 (= res!824857 (= (h!28463 acc!846) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1236885 () Bool)

(assert (=> b!1236885 (= e!700997 (contains!7320 (t!40721 acc!846) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!135527 res!824856) b!1236884))

(assert (= (and b!1236884 (not res!824857)) b!1236885))

(assert (=> d!135527 m!1140615))

(declare-fun m!1140621 () Bool)

(assert (=> d!135527 m!1140621))

(declare-fun m!1140623 () Bool)

(assert (=> b!1236885 m!1140623))

(assert (=> b!1236819 d!135527))

(declare-fun b!1236916 () Bool)

(declare-fun e!701019 () Bool)

(assert (=> b!1236916 (= e!701019 (subseq!574 acc!846 (t!40721 lt!560899)))))

(declare-fun b!1236914 () Bool)

(declare-fun e!701020 () Bool)

(assert (=> b!1236914 (= e!701020 e!701019)))

(declare-fun res!824872 () Bool)

(assert (=> b!1236914 (=> res!824872 e!701019)))

(declare-fun e!701021 () Bool)

(assert (=> b!1236914 (= res!824872 e!701021)))

(declare-fun res!824871 () Bool)

(assert (=> b!1236914 (=> (not res!824871) (not e!701021))))

(assert (=> b!1236914 (= res!824871 (= (h!28463 acc!846) (h!28463 lt!560899)))))

(declare-fun d!135529 () Bool)

(declare-fun res!824874 () Bool)

(declare-fun e!701018 () Bool)

(assert (=> d!135529 (=> res!824874 e!701018)))

(assert (=> d!135529 (= res!824874 (is-Nil!27255 acc!846))))

(assert (=> d!135529 (= (subseq!574 acc!846 lt!560899) e!701018)))

(declare-fun b!1236915 () Bool)

(assert (=> b!1236915 (= e!701021 (subseq!574 (t!40721 acc!846) (t!40721 lt!560899)))))

(declare-fun b!1236913 () Bool)

(assert (=> b!1236913 (= e!701018 e!701020)))

(declare-fun res!824873 () Bool)

(assert (=> b!1236913 (=> (not res!824873) (not e!701020))))

(assert (=> b!1236913 (= res!824873 (is-Cons!27254 lt!560899))))

(assert (= (and d!135529 (not res!824874)) b!1236913))

(assert (= (and b!1236913 res!824873) b!1236914))

(assert (= (and b!1236914 res!824871) b!1236915))

(assert (= (and b!1236914 (not res!824872)) b!1236916))

(declare-fun m!1140629 () Bool)

(assert (=> b!1236916 m!1140629))

(declare-fun m!1140631 () Bool)

(assert (=> b!1236915 m!1140631))

(assert (=> b!1236824 d!135529))

(declare-fun b!1236974 () Bool)

(declare-fun e!701065 () Unit!41034)

(declare-fun Unit!41040 () Unit!41034)

(assert (=> b!1236974 (= e!701065 Unit!41040)))

(declare-fun b!1236975 () Bool)

(declare-fun e!701064 () Bool)

(assert (=> b!1236975 (= e!701064 (subseq!574 lt!560899 lt!560899))))

(declare-fun b!1236976 () Bool)

(declare-fun call!61008 () Unit!41034)

(assert (=> b!1236976 (= e!701065 call!61008)))

(declare-fun bm!61005 () Bool)

(declare-fun c!120896 () Bool)

(assert (=> bm!61005 (= call!61008 (subseqTail!61 (ite c!120896 lt!560899 (t!40721 lt!560899)) (t!40721 lt!560899)))))

(declare-fun b!1236977 () Bool)

(declare-fun e!701067 () Unit!41034)

(assert (=> b!1236977 (= e!701067 call!61008)))

(declare-fun b!1236978 () Bool)

(declare-fun c!120898 () Bool)

(declare-fun isEmpty!1008 (List!27258) Bool)

(assert (=> b!1236978 (= c!120898 (not (isEmpty!1008 (t!40721 lt!560899))))))

(assert (=> b!1236978 (= e!701067 e!701065)))

(declare-fun b!1236979 () Bool)

(declare-fun e!701066 () Unit!41034)

(assert (=> b!1236979 (= e!701066 e!701067)))

(assert (=> b!1236979 (= c!120896 (subseq!574 lt!560899 (t!40721 lt!560899)))))

(declare-fun b!1236980 () Bool)

(declare-fun Unit!41041 () Unit!41034)

(assert (=> b!1236980 (= e!701066 Unit!41041)))

(declare-fun d!135533 () Bool)

(declare-fun tail!160 (List!27258) List!27258)

(assert (=> d!135533 (subseq!574 (tail!160 lt!560899) lt!560899)))

(declare-fun lt!560923 () Unit!41034)

(assert (=> d!135533 (= lt!560923 e!701066)))

(declare-fun c!120897 () Bool)

(assert (=> d!135533 (= c!120897 (and (is-Cons!27254 lt!560899) (is-Cons!27254 lt!560899)))))

(assert (=> d!135533 e!701064))

(declare-fun res!824902 () Bool)

(assert (=> d!135533 (=> (not res!824902) (not e!701064))))

(assert (=> d!135533 (= res!824902 (not (isEmpty!1008 lt!560899)))))

(assert (=> d!135533 (= (subseqTail!61 lt!560899 lt!560899) lt!560923)))

(assert (= (and d!135533 res!824902) b!1236975))

(assert (= (and d!135533 c!120897) b!1236979))

(assert (= (and d!135533 (not c!120897)) b!1236980))

(assert (= (and b!1236979 c!120896) b!1236977))

(assert (= (and b!1236979 (not c!120896)) b!1236978))

(assert (= (and b!1236978 c!120898) b!1236976))

(assert (= (and b!1236978 (not c!120898)) b!1236974))

(assert (= (or b!1236977 b!1236976) bm!61005))

(declare-fun m!1140659 () Bool)

(assert (=> d!135533 m!1140659))

(assert (=> d!135533 m!1140659))

(declare-fun m!1140661 () Bool)

(assert (=> d!135533 m!1140661))

(declare-fun m!1140663 () Bool)

(assert (=> d!135533 m!1140663))

(declare-fun m!1140665 () Bool)

(assert (=> b!1236978 m!1140665))

(assert (=> b!1236975 m!1140581))

(declare-fun m!1140667 () Bool)

(assert (=> bm!61005 m!1140667))

(declare-fun m!1140669 () Bool)

(assert (=> b!1236979 m!1140669))

(assert (=> b!1236824 d!135533))

(declare-fun b!1236986 () Bool)

(declare-fun e!701071 () Bool)

(assert (=> b!1236986 (= e!701071 (subseq!574 lt!560899 (t!40721 lt!560899)))))

(declare-fun b!1236984 () Bool)

(declare-fun e!701072 () Bool)

(assert (=> b!1236984 (= e!701072 e!701071)))

(declare-fun res!824906 () Bool)

(assert (=> b!1236984 (=> res!824906 e!701071)))

(declare-fun e!701073 () Bool)

(assert (=> b!1236984 (= res!824906 e!701073)))

(declare-fun res!824905 () Bool)

(assert (=> b!1236984 (=> (not res!824905) (not e!701073))))

(assert (=> b!1236984 (= res!824905 (= (h!28463 lt!560899) (h!28463 lt!560899)))))

(declare-fun d!135549 () Bool)

(declare-fun res!824908 () Bool)

(declare-fun e!701070 () Bool)

(assert (=> d!135549 (=> res!824908 e!701070)))

(assert (=> d!135549 (= res!824908 (is-Nil!27255 lt!560899))))

(assert (=> d!135549 (= (subseq!574 lt!560899 lt!560899) e!701070)))

(declare-fun b!1236985 () Bool)

(assert (=> b!1236985 (= e!701073 (subseq!574 (t!40721 lt!560899) (t!40721 lt!560899)))))

(declare-fun b!1236983 () Bool)

(assert (=> b!1236983 (= e!701070 e!701072)))

(declare-fun res!824907 () Bool)

(assert (=> b!1236983 (=> (not res!824907) (not e!701072))))

(assert (=> b!1236983 (= res!824907 (is-Cons!27254 lt!560899))))

(assert (= (and d!135549 (not res!824908)) b!1236983))

(assert (= (and b!1236983 res!824907) b!1236984))

(assert (= (and b!1236984 res!824905) b!1236985))

(assert (= (and b!1236984 (not res!824906)) b!1236986))

(assert (=> b!1236986 m!1140669))

(declare-fun m!1140671 () Bool)

(assert (=> b!1236985 m!1140671))

(assert (=> b!1236824 d!135549))

(declare-fun d!135551 () Bool)

(assert (=> d!135551 (subseq!574 lt!560899 lt!560899)))

(declare-fun lt!560927 () Unit!41034)

(declare-fun choose!36 (List!27258) Unit!41034)

(assert (=> d!135551 (= lt!560927 (choose!36 lt!560899))))

(assert (=> d!135551 (= (lemmaListSubSeqRefl!0 lt!560899) lt!560927)))

(declare-fun bs!34782 () Bool)

(assert (= bs!34782 d!135551))

(assert (=> bs!34782 m!1140581))

(declare-fun m!1140677 () Bool)

(assert (=> bs!34782 m!1140677))

(assert (=> b!1236824 d!135551))

(declare-fun d!135555 () Bool)

(declare-fun lt!560928 () Bool)

(assert (=> d!135555 (= lt!560928 (member k!2925 (content!582 acc!846)))))

(declare-fun e!701080 () Bool)

(assert (=> d!135555 (= lt!560928 e!701080)))

(declare-fun res!824915 () Bool)

(assert (=> d!135555 (=> (not res!824915) (not e!701080))))

(assert (=> d!135555 (= res!824915 (is-Cons!27254 acc!846))))

(assert (=> d!135555 (= (contains!7320 acc!846 k!2925) lt!560928)))

(declare-fun b!1236993 () Bool)

(declare-fun e!701081 () Bool)

(assert (=> b!1236993 (= e!701080 e!701081)))

(declare-fun res!824916 () Bool)

(assert (=> b!1236993 (=> res!824916 e!701081)))

(assert (=> b!1236993 (= res!824916 (= (h!28463 acc!846) k!2925))))

(declare-fun b!1236994 () Bool)

(assert (=> b!1236994 (= e!701081 (contains!7320 (t!40721 acc!846) k!2925))))

(assert (= (and d!135555 res!824915) b!1236993))

(assert (= (and b!1236993 (not res!824916)) b!1236994))

(assert (=> d!135555 m!1140615))

(declare-fun m!1140683 () Bool)

(assert (=> d!135555 m!1140683))

(declare-fun m!1140687 () Bool)

(assert (=> b!1236994 m!1140687))

(assert (=> b!1236822 d!135555))

(declare-fun bm!61009 () Bool)

(declare-fun c!120904 () Bool)

(declare-fun call!61012 () Bool)

(assert (=> bm!61009 (= call!61012 (arrayNoDuplicates!0 a!3835 (bvadd from!3213 #b00000000000000000000000000000001) (ite c!120904 (Cons!27254 (select (arr!38485 a!3835) from!3213) acc!846) acc!846)))))

(declare-fun b!1237024 () Bool)

(declare-fun e!701107 () Bool)

(declare-fun e!701108 () Bool)

(assert (=> b!1237024 (= e!701107 e!701108)))

(declare-fun res!824938 () Bool)

(assert (=> b!1237024 (=> (not res!824938) (not e!701108))))

(declare-fun e!701109 () Bool)

(assert (=> b!1237024 (= res!824938 (not e!701109))))

(declare-fun res!824937 () Bool)

(assert (=> b!1237024 (=> (not res!824937) (not e!701109))))

(assert (=> b!1237024 (= res!824937 (validKeyInArray!0 (select (arr!38485 a!3835) from!3213)))))

(declare-fun b!1237025 () Bool)

(declare-fun e!701106 () Bool)

(assert (=> b!1237025 (= e!701106 call!61012)))

(declare-fun b!1237026 () Bool)

(assert (=> b!1237026 (= e!701109 (contains!7320 acc!846 (select (arr!38485 a!3835) from!3213)))))

(declare-fun d!135559 () Bool)

(declare-fun res!824936 () Bool)

(assert (=> d!135559 (=> res!824936 e!701107)))

(assert (=> d!135559 (= res!824936 (bvsge from!3213 (size!39021 a!3835)))))

(assert (=> d!135559 (= (arrayNoDuplicates!0 a!3835 from!3213 acc!846) e!701107)))

(declare-fun b!1237027 () Bool)

(assert (=> b!1237027 (= e!701106 call!61012)))

(declare-fun b!1237028 () Bool)

(assert (=> b!1237028 (= e!701108 e!701106)))

(assert (=> b!1237028 (= c!120904 (validKeyInArray!0 (select (arr!38485 a!3835) from!3213)))))

(assert (= (and d!135559 (not res!824936)) b!1237024))

(assert (= (and b!1237024 res!824937) b!1237026))

(assert (= (and b!1237024 res!824938) b!1237028))

(assert (= (and b!1237028 c!120904) b!1237027))

(assert (= (and b!1237028 (not c!120904)) b!1237025))

(assert (= (or b!1237027 b!1237025) bm!61009))

(assert (=> bm!61009 m!1140583))

(declare-fun m!1140711 () Bool)

(assert (=> bm!61009 m!1140711))

(assert (=> b!1237024 m!1140583))

(assert (=> b!1237024 m!1140583))

(assert (=> b!1237024 m!1140585))

(assert (=> b!1237026 m!1140583))

(assert (=> b!1237026 m!1140583))

(declare-fun m!1140713 () Bool)

(assert (=> b!1237026 m!1140713))

(assert (=> b!1237028 m!1140583))

(assert (=> b!1237028 m!1140583))

(assert (=> b!1237028 m!1140585))

(assert (=> b!1236823 d!135559))

(push 1)

(assert (not b!1236915))

(assert (not b!1236994))

(assert (not b!1236885))

(assert (not b!1236873))

(assert (not b!1236916))

(assert (not b!1236985))

(assert (not b!1236979))

(assert (not b!1236975))

(assert (not b!1236850))

(assert (not d!135519))

(assert (not b!1236851))

(assert (not b!1236986))

(assert (not d!135533))

(assert (not d!135527))

(assert (not b!1237026))

(assert (not bm!61005))

(assert (not b!1236978))

(assert (not b!1237024))

(assert (not bm!61009))

(assert (not b!1237028))

(assert (not d!135551))

(assert (not d!135555))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!135641 () Bool)

(declare-fun c!120921 () Bool)

(assert (=> d!135641 (= c!120921 (is-Nil!27255 acc!846))))

(declare-fun e!701198 () (Set (_ BitVec 64)))

(assert (=> d!135641 (= (content!582 acc!846) e!701198)))

(declare-fun b!1237133 () Bool)

(assert (=> b!1237133 (= e!701198 (as emptyset (Set (_ BitVec 64))))))

(declare-fun b!1237134 () Bool)

(assert (=> b!1237134 (= e!701198 (union (insert (h!28463 acc!846) (as emptyset (Set (_ BitVec 64)))) (content!582 (t!40721 acc!846))))))

(assert (= (and d!135641 c!120921) b!1237133))

(assert (= (and d!135641 (not c!120921)) b!1237134))

(declare-fun m!1140847 () Bool)

(assert (=> b!1237134 m!1140847))

(declare-fun m!1140849 () Bool)

(assert (=> b!1237134 m!1140849))

(assert (=> d!135519 d!135641))

(assert (=> d!135527 d!135641))

(assert (=> b!1237024 d!135525))

(declare-fun b!1237135 () Bool)

(declare-fun e!701200 () Unit!41034)

(declare-fun Unit!41046 () Unit!41034)

(assert (=> b!1237135 (= e!701200 Unit!41046)))

(declare-fun b!1237136 () Bool)

(declare-fun e!701199 () Bool)

(assert (=> b!1237136 (= e!701199 (subseq!574 (ite c!120896 lt!560899 (t!40721 lt!560899)) (t!40721 lt!560899)))))

(declare-fun b!1237137 () Bool)

(declare-fun call!61017 () Unit!41034)

(assert (=> b!1237137 (= e!701200 call!61017)))

(declare-fun c!120922 () Bool)

(declare-fun bm!61014 () Bool)

(assert (=> bm!61014 (= call!61017 (subseqTail!61 (ite c!120922 (ite c!120896 lt!560899 (t!40721 lt!560899)) (t!40721 (ite c!120896 lt!560899 (t!40721 lt!560899)))) (t!40721 (t!40721 lt!560899))))))

(declare-fun b!1237138 () Bool)

(declare-fun e!701202 () Unit!41034)

(assert (=> b!1237138 (= e!701202 call!61017)))

(declare-fun b!1237139 () Bool)

(declare-fun c!120924 () Bool)

(assert (=> b!1237139 (= c!120924 (not (isEmpty!1008 (t!40721 (ite c!120896 lt!560899 (t!40721 lt!560899))))))))

(assert (=> b!1237139 (= e!701202 e!701200)))

(declare-fun b!1237140 () Bool)

(declare-fun e!701201 () Unit!41034)

(assert (=> b!1237140 (= e!701201 e!701202)))

(assert (=> b!1237140 (= c!120922 (subseq!574 (ite c!120896 lt!560899 (t!40721 lt!560899)) (t!40721 (t!40721 lt!560899))))))

(declare-fun b!1237141 () Bool)

(declare-fun Unit!41047 () Unit!41034)

(assert (=> b!1237141 (= e!701201 Unit!41047)))

(declare-fun d!135643 () Bool)

(assert (=> d!135643 (subseq!574 (tail!160 (ite c!120896 lt!560899 (t!40721 lt!560899))) (t!40721 lt!560899))))

(declare-fun lt!560946 () Unit!41034)

(assert (=> d!135643 (= lt!560946 e!701201)))

(declare-fun c!120923 () Bool)

(assert (=> d!135643 (= c!120923 (and (is-Cons!27254 (ite c!120896 lt!560899 (t!40721 lt!560899))) (is-Cons!27254 (t!40721 lt!560899))))))

(assert (=> d!135643 e!701199))

(declare-fun res!825011 () Bool)

(assert (=> d!135643 (=> (not res!825011) (not e!701199))))

(assert (=> d!135643 (= res!825011 (not (isEmpty!1008 (ite c!120896 lt!560899 (t!40721 lt!560899)))))))

(assert (=> d!135643 (= (subseqTail!61 (ite c!120896 lt!560899 (t!40721 lt!560899)) (t!40721 lt!560899)) lt!560946)))

