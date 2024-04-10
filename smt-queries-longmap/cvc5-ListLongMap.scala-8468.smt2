; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103062 () Bool)

(assert start!103062)

(declare-fun b!1237780 () Bool)

(declare-fun e!701520 () Bool)

(declare-fun e!701522 () Bool)

(assert (=> b!1237780 (= e!701520 e!701522)))

(declare-fun res!825585 () Bool)

(assert (=> b!1237780 (=> (not res!825585) (not e!701522))))

(declare-datatypes ((List!27274 0))(
  ( (Nil!27271) (Cons!27270 (h!28479 (_ BitVec 64)) (t!40737 List!27274)) )
))
(declare-fun lt!561128 () List!27274)

(declare-fun contains!7336 (List!27274 (_ BitVec 64)) Bool)

(assert (=> b!1237780 (= res!825585 (not (contains!7336 lt!561128 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1237781 () Bool)

(declare-fun res!825577 () Bool)

(declare-fun e!701523 () Bool)

(assert (=> b!1237781 (=> (not res!825577) (not e!701523))))

(declare-datatypes ((array!79793 0))(
  ( (array!79794 (arr!38501 (Array (_ BitVec 32) (_ BitVec 64))) (size!39037 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79793)

(declare-fun from!3213 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1237781 (= res!825577 (validKeyInArray!0 (select (arr!38501 a!3835) from!3213)))))

(declare-fun b!1237782 () Bool)

(declare-fun res!825584 () Bool)

(assert (=> b!1237782 (=> (not res!825584) (not e!701523))))

(assert (=> b!1237782 (= res!825584 (not (= from!3213 (bvsub (size!39037 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1237783 () Bool)

(declare-fun res!825583 () Bool)

(assert (=> b!1237783 (=> res!825583 e!701520)))

(declare-fun noDuplicate!1933 (List!27274) Bool)

(assert (=> b!1237783 (= res!825583 (not (noDuplicate!1933 lt!561128)))))

(declare-fun b!1237784 () Bool)

(declare-fun res!825582 () Bool)

(assert (=> b!1237784 (=> (not res!825582) (not e!701523))))

(declare-fun acc!846 () List!27274)

(declare-fun k!2925 () (_ BitVec 64))

(assert (=> b!1237784 (= res!825582 (contains!7336 acc!846 k!2925))))

(declare-fun res!825586 () Bool)

(assert (=> start!103062 (=> (not res!825586) (not e!701523))))

(assert (=> start!103062 (= res!825586 (and (bvslt (size!39037 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!39037 a!3835))))))

(assert (=> start!103062 e!701523))

(declare-fun array_inv!29349 (array!79793) Bool)

(assert (=> start!103062 (array_inv!29349 a!3835)))

(assert (=> start!103062 true))

(declare-fun b!1237785 () Bool)

(declare-fun res!825576 () Bool)

(assert (=> b!1237785 (=> (not res!825576) (not e!701523))))

(assert (=> b!1237785 (= res!825576 (not (contains!7336 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1237786 () Bool)

(declare-fun res!825581 () Bool)

(assert (=> b!1237786 (=> (not res!825581) (not e!701523))))

(declare-fun arrayNoDuplicates!0 (array!79793 (_ BitVec 32) List!27274) Bool)

(assert (=> b!1237786 (= res!825581 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1237787 () Bool)

(assert (=> b!1237787 (= e!701523 (not e!701520))))

(declare-fun res!825579 () Bool)

(assert (=> b!1237787 (=> res!825579 e!701520)))

(assert (=> b!1237787 (= res!825579 (bvslt (bvadd #b00000000000000000000000000000001 from!3213) #b00000000000000000000000000000000))))

(declare-fun subseq!590 (List!27274 List!27274) Bool)

(assert (=> b!1237787 (subseq!590 acc!846 lt!561128)))

(declare-datatypes ((Unit!41082 0))(
  ( (Unit!41083) )
))
(declare-fun lt!561127 () Unit!41082)

(declare-fun subseqTail!77 (List!27274 List!27274) Unit!41082)

(assert (=> b!1237787 (= lt!561127 (subseqTail!77 lt!561128 lt!561128))))

(assert (=> b!1237787 (subseq!590 lt!561128 lt!561128)))

(declare-fun lt!561126 () Unit!41082)

(declare-fun lemmaListSubSeqRefl!0 (List!27274) Unit!41082)

(assert (=> b!1237787 (= lt!561126 (lemmaListSubSeqRefl!0 lt!561128))))

(assert (=> b!1237787 (= lt!561128 (Cons!27270 (select (arr!38501 a!3835) from!3213) acc!846))))

(declare-fun b!1237788 () Bool)

(declare-fun res!825578 () Bool)

(assert (=> b!1237788 (=> (not res!825578) (not e!701523))))

(assert (=> b!1237788 (= res!825578 (noDuplicate!1933 acc!846))))

(declare-fun b!1237789 () Bool)

(declare-fun res!825580 () Bool)

(assert (=> b!1237789 (=> (not res!825580) (not e!701523))))

(assert (=> b!1237789 (= res!825580 (not (contains!7336 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1237790 () Bool)

(assert (=> b!1237790 (= e!701522 (not (contains!7336 lt!561128 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!103062 res!825586) b!1237788))

(assert (= (and b!1237788 res!825578) b!1237789))

(assert (= (and b!1237789 res!825580) b!1237785))

(assert (= (and b!1237785 res!825576) b!1237786))

(assert (= (and b!1237786 res!825581) b!1237784))

(assert (= (and b!1237784 res!825582) b!1237782))

(assert (= (and b!1237782 res!825584) b!1237781))

(assert (= (and b!1237781 res!825577) b!1237787))

(assert (= (and b!1237787 (not res!825579)) b!1237783))

(assert (= (and b!1237783 (not res!825583)) b!1237780))

(assert (= (and b!1237780 res!825585) b!1237790))

(declare-fun m!1141417 () Bool)

(assert (=> b!1237785 m!1141417))

(declare-fun m!1141419 () Bool)

(assert (=> b!1237784 m!1141419))

(declare-fun m!1141421 () Bool)

(assert (=> b!1237786 m!1141421))

(declare-fun m!1141423 () Bool)

(assert (=> start!103062 m!1141423))

(declare-fun m!1141425 () Bool)

(assert (=> b!1237781 m!1141425))

(assert (=> b!1237781 m!1141425))

(declare-fun m!1141427 () Bool)

(assert (=> b!1237781 m!1141427))

(declare-fun m!1141429 () Bool)

(assert (=> b!1237788 m!1141429))

(declare-fun m!1141431 () Bool)

(assert (=> b!1237787 m!1141431))

(declare-fun m!1141433 () Bool)

(assert (=> b!1237787 m!1141433))

(declare-fun m!1141435 () Bool)

(assert (=> b!1237787 m!1141435))

(declare-fun m!1141437 () Bool)

(assert (=> b!1237787 m!1141437))

(assert (=> b!1237787 m!1141425))

(declare-fun m!1141439 () Bool)

(assert (=> b!1237789 m!1141439))

(declare-fun m!1141441 () Bool)

(assert (=> b!1237780 m!1141441))

(declare-fun m!1141443 () Bool)

(assert (=> b!1237790 m!1141443))

(declare-fun m!1141445 () Bool)

(assert (=> b!1237783 m!1141445))

(push 1)

(assert (not b!1237788))

(assert (not b!1237783))

(assert (not start!103062))

(assert (not b!1237785))

(assert (not b!1237784))

(assert (not b!1237787))

(assert (not b!1237790))

(assert (not b!1237781))

(assert (not b!1237786))

(assert (not b!1237789))

(assert (not b!1237780))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1237901 () Bool)

(declare-fun e!701589 () Bool)

(declare-fun e!701586 () Bool)

(assert (=> b!1237901 (= e!701589 e!701586)))

(declare-fun res!825685 () Bool)

(assert (=> b!1237901 (=> (not res!825685) (not e!701586))))

(assert (=> b!1237901 (= res!825685 (is-Cons!27270 lt!561128))))

(declare-fun b!1237903 () Bool)

(declare-fun e!701588 () Bool)

(assert (=> b!1237903 (= e!701588 (subseq!590 (t!40737 acc!846) (t!40737 lt!561128)))))

(declare-fun d!135767 () Bool)

(declare-fun res!825686 () Bool)

(assert (=> d!135767 (=> res!825686 e!701589)))

(assert (=> d!135767 (= res!825686 (is-Nil!27271 acc!846))))

(assert (=> d!135767 (= (subseq!590 acc!846 lt!561128) e!701589)))

(declare-fun b!1237904 () Bool)

(declare-fun e!701587 () Bool)

(assert (=> b!1237904 (= e!701587 (subseq!590 acc!846 (t!40737 lt!561128)))))

(declare-fun b!1237902 () Bool)

(assert (=> b!1237902 (= e!701586 e!701587)))

(declare-fun res!825688 () Bool)

(assert (=> b!1237902 (=> res!825688 e!701587)))

(assert (=> b!1237902 (= res!825688 e!701588)))

(declare-fun res!825687 () Bool)

(assert (=> b!1237902 (=> (not res!825687) (not e!701588))))

(assert (=> b!1237902 (= res!825687 (= (h!28479 acc!846) (h!28479 lt!561128)))))

(assert (= (and d!135767 (not res!825686)) b!1237901))

(assert (= (and b!1237901 res!825685) b!1237902))

(assert (= (and b!1237902 res!825687) b!1237903))

(assert (= (and b!1237902 (not res!825688)) b!1237904))

(declare-fun m!1141515 () Bool)

(assert (=> b!1237903 m!1141515))

(declare-fun m!1141517 () Bool)

(assert (=> b!1237904 m!1141517))

(assert (=> b!1237787 d!135767))

(declare-fun b!1237952 () Bool)

(declare-fun c!120977 () Bool)

(declare-fun isEmpty!1012 (List!27274) Bool)

(assert (=> b!1237952 (= c!120977 (not (isEmpty!1012 (t!40737 lt!561128))))))

(declare-fun e!701628 () Unit!41082)

(declare-fun e!701629 () Unit!41082)

(assert (=> b!1237952 (= e!701628 e!701629)))

(declare-fun bm!61039 () Bool)

(declare-fun call!61042 () Unit!41082)

(declare-fun c!120979 () Bool)

(assert (=> bm!61039 (= call!61042 (subseqTail!77 (ite c!120979 lt!561128 (t!40737 lt!561128)) (t!40737 lt!561128)))))

(declare-fun b!1237953 () Bool)

(assert (=> b!1237953 (= e!701629 call!61042)))

(declare-fun b!1237954 () Bool)

(assert (=> b!1237954 (= e!701628 call!61042)))

(declare-fun b!1237955 () Bool)

(declare-fun e!701630 () Unit!41082)

(assert (=> b!1237955 (= e!701630 e!701628)))

(assert (=> b!1237955 (= c!120979 (subseq!590 lt!561128 (t!40737 lt!561128)))))

(declare-fun b!1237957 () Bool)

(declare-fun Unit!41090 () Unit!41082)

(assert (=> b!1237957 (= e!701629 Unit!41090)))

(declare-fun b!1237958 () Bool)

(declare-fun e!701631 () Bool)

(assert (=> b!1237958 (= e!701631 (subseq!590 lt!561128 lt!561128))))

(declare-fun b!1237956 () Bool)

(declare-fun Unit!41091 () Unit!41082)

(assert (=> b!1237956 (= e!701630 Unit!41091)))

(declare-fun d!135771 () Bool)

(declare-fun tail!164 (List!27274) List!27274)

(assert (=> d!135771 (subseq!590 (tail!164 lt!561128) lt!561128)))

(declare-fun lt!561162 () Unit!41082)

(assert (=> d!135771 (= lt!561162 e!701630)))

(declare-fun c!120978 () Bool)

(assert (=> d!135771 (= c!120978 (and (is-Cons!27270 lt!561128) (is-Cons!27270 lt!561128)))))

(assert (=> d!135771 e!701631))

(declare-fun res!825718 () Bool)

(assert (=> d!135771 (=> (not res!825718) (not e!701631))))

(assert (=> d!135771 (= res!825718 (not (isEmpty!1012 lt!561128)))))

(assert (=> d!135771 (= (subseqTail!77 lt!561128 lt!561128) lt!561162)))

(assert (= (and d!135771 res!825718) b!1237958))

(assert (= (and d!135771 c!120978) b!1237955))

(assert (= (and d!135771 (not c!120978)) b!1237956))

(assert (= (and b!1237955 c!120979) b!1237954))

(assert (= (and b!1237955 (not c!120979)) b!1237952))

(assert (= (and b!1237952 c!120977) b!1237953))

(assert (= (and b!1237952 (not c!120977)) b!1237957))

(assert (= (or b!1237954 b!1237953) bm!61039))

(assert (=> b!1237958 m!1141433))

(declare-fun m!1141561 () Bool)

(assert (=> b!1237952 m!1141561))

(declare-fun m!1141563 () Bool)

(assert (=> b!1237955 m!1141563))

(declare-fun m!1141565 () Bool)

(assert (=> d!135771 m!1141565))

(assert (=> d!135771 m!1141565))

(declare-fun m!1141567 () Bool)

(assert (=> d!135771 m!1141567))

(declare-fun m!1141569 () Bool)

(assert (=> d!135771 m!1141569))

(declare-fun m!1141571 () Bool)

(assert (=> bm!61039 m!1141571))

(assert (=> b!1237787 d!135771))

(declare-fun b!1237961 () Bool)

(declare-fun e!701637 () Bool)

(declare-fun e!701634 () Bool)

(assert (=> b!1237961 (= e!701637 e!701634)))

(declare-fun res!825721 () Bool)

(assert (=> b!1237961 (=> (not res!825721) (not e!701634))))

(assert (=> b!1237961 (= res!825721 (is-Cons!27270 lt!561128))))

(declare-fun b!1237963 () Bool)

(declare-fun e!701636 () Bool)

(assert (=> b!1237963 (= e!701636 (subseq!590 (t!40737 lt!561128) (t!40737 lt!561128)))))

(declare-fun d!135791 () Bool)

(declare-fun res!825722 () Bool)

(assert (=> d!135791 (=> res!825722 e!701637)))

(assert (=> d!135791 (= res!825722 (is-Nil!27271 lt!561128))))

(assert (=> d!135791 (= (subseq!590 lt!561128 lt!561128) e!701637)))

(declare-fun b!1237964 () Bool)

(declare-fun e!701635 () Bool)

(assert (=> b!1237964 (= e!701635 (subseq!590 lt!561128 (t!40737 lt!561128)))))

(declare-fun b!1237962 () Bool)

(assert (=> b!1237962 (= e!701634 e!701635)))

(declare-fun res!825724 () Bool)

(assert (=> b!1237962 (=> res!825724 e!701635)))

(assert (=> b!1237962 (= res!825724 e!701636)))

(declare-fun res!825723 () Bool)

(assert (=> b!1237962 (=> (not res!825723) (not e!701636))))

(assert (=> b!1237962 (= res!825723 (= (h!28479 lt!561128) (h!28479 lt!561128)))))

(assert (= (and d!135791 (not res!825722)) b!1237961))

(assert (= (and b!1237961 res!825721) b!1237962))

(assert (= (and b!1237962 res!825723) b!1237963))

(assert (= (and b!1237962 (not res!825724)) b!1237964))

(declare-fun m!1141573 () Bool)

(assert (=> b!1237963 m!1141573))

(assert (=> b!1237964 m!1141563))

(assert (=> b!1237787 d!135791))

(declare-fun d!135793 () Bool)

(assert (=> d!135793 (subseq!590 lt!561128 lt!561128)))

(declare-fun lt!561168 () Unit!41082)

(declare-fun choose!36 (List!27274) Unit!41082)

(assert (=> d!135793 (= lt!561168 (choose!36 lt!561128))))

(assert (=> d!135793 (= (lemmaListSubSeqRefl!0 lt!561128) lt!561168)))

(declare-fun bs!34809 () Bool)

(assert (= bs!34809 d!135793))

(assert (=> bs!34809 m!1141433))

(declare-fun m!1141575 () Bool)

(assert (=> bs!34809 m!1141575))

(assert (=> b!1237787 d!135793))

(declare-fun d!135795 () Bool)

(declare-fun res!825737 () Bool)

(declare-fun e!701658 () Bool)

(assert (=> d!135795 (=> res!825737 e!701658)))

(assert (=> d!135795 (= res!825737 (is-Nil!27271 acc!846))))

(assert (=> d!135795 (= (noDuplicate!1933 acc!846) e!701658)))

(declare-fun b!1237993 () Bool)

(declare-fun e!701659 () Bool)

(assert (=> b!1237993 (= e!701658 e!701659)))

(declare-fun res!825738 () Bool)

(assert (=> b!1237993 (=> (not res!825738) (not e!701659))))

(assert (=> b!1237993 (= res!825738 (not (contains!7336 (t!40737 acc!846) (h!28479 acc!846))))))

(declare-fun b!1237994 () Bool)

(assert (=> b!1237994 (= e!701659 (noDuplicate!1933 (t!40737 acc!846)))))

(assert (= (and d!135795 (not res!825737)) b!1237993))

(assert (= (and b!1237993 res!825738) b!1237994))

(declare-fun m!1141577 () Bool)

(assert (=> b!1237993 m!1141577))

(declare-fun m!1141579 () Bool)

(assert (=> b!1237994 m!1141579))

(assert (=> b!1237788 d!135795))

(declare-fun d!135797 () Bool)

(assert (=> d!135797 (= (array_inv!29349 a!3835) (bvsge (size!39037 a!3835) #b00000000000000000000000000000000))))

(assert (=> start!103062 d!135797))

(declare-fun d!135799 () Bool)

(declare-fun lt!561176 () Bool)

(declare-fun content!589 (List!27274) (Set (_ BitVec 64)))

(assert (=> d!135799 (= lt!561176 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!589 acc!846)))))

(declare-fun e!701681 () Bool)

(assert (=> d!135799 (= lt!561176 e!701681)))

(declare-fun res!825756 () Bool)

(assert (=> d!135799 (=> (not res!825756) (not e!701681))))

(assert (=> d!135799 (= res!825756 (is-Cons!27270 acc!846))))

(assert (=> d!135799 (= (contains!7336 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000) lt!561176)))

(declare-fun b!1238019 () Bool)

(declare-fun e!701680 () Bool)

(assert (=> b!1238019 (= e!701681 e!701680)))

(declare-fun res!825755 () Bool)

(assert (=> b!1238019 (=> res!825755 e!701680)))

(assert (=> b!1238019 (= res!825755 (= (h!28479 acc!846) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1238020 () Bool)

(assert (=> b!1238020 (= e!701680 (contains!7336 (t!40737 acc!846) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!135799 res!825756) b!1238019))

(assert (= (and b!1238019 (not res!825755)) b!1238020))

(declare-fun m!1141609 () Bool)

(assert (=> d!135799 m!1141609))

(declare-fun m!1141611 () Bool)

(assert (=> d!135799 m!1141611))

(declare-fun m!1141613 () Bool)

(assert (=> b!1238020 m!1141613))

(assert (=> b!1237789 d!135799))

(declare-fun d!135817 () Bool)

(declare-fun lt!561178 () Bool)

(assert (=> d!135817 (= lt!561178 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!589 acc!846)))))

(declare-fun e!701685 () Bool)

(assert (=> d!135817 (= lt!561178 e!701685)))

(declare-fun res!825760 () Bool)

(assert (=> d!135817 (=> (not res!825760) (not e!701685))))

(assert (=> d!135817 (= res!825760 (is-Cons!27270 acc!846))))

(assert (=> d!135817 (= (contains!7336 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000) lt!561178)))

(declare-fun b!1238023 () Bool)

(declare-fun e!701684 () Bool)

(assert (=> b!1238023 (= e!701685 e!701684)))

(declare-fun res!825759 () Bool)

(assert (=> b!1238023 (=> res!825759 e!701684)))

(assert (=> b!1238023 (= res!825759 (= (h!28479 acc!846) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1238024 () Bool)

(assert (=> b!1238024 (= e!701684 (contains!7336 (t!40737 acc!846) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!135817 res!825760) b!1238023))

(assert (= (and b!1238023 (not res!825759)) b!1238024))

(assert (=> d!135817 m!1141609))

(declare-fun m!1141619 () Bool)

(assert (=> d!135817 m!1141619))

(declare-fun m!1141621 () Bool)

(assert (=> b!1238024 m!1141621))

(assert (=> b!1237785 d!135817))

(declare-fun b!1238051 () Bool)

(declare-fun e!701710 () Bool)

(assert (=> b!1238051 (= e!701710 (contains!7336 acc!846 (select (arr!38501 a!3835) from!3213)))))

(declare-fun d!135821 () Bool)

(declare-fun res!825785 () Bool)

(declare-fun e!701713 () Bool)

(assert (=> d!135821 (=> res!825785 e!701713)))

(assert (=> d!135821 (= res!825785 (bvsge from!3213 (size!39037 a!3835)))))

(assert (=> d!135821 (= (arrayNoDuplicates!0 a!3835 from!3213 acc!846) e!701713)))

(declare-fun call!61051 () Bool)

(declare-fun c!120994 () Bool)

(declare-fun bm!61048 () Bool)

(assert (=> bm!61048 (= call!61051 (arrayNoDuplicates!0 a!3835 (bvadd from!3213 #b00000000000000000000000000000001) (ite c!120994 (Cons!27270 (select (arr!38501 a!3835) from!3213) acc!846) acc!846)))))

(declare-fun b!1238052 () Bool)

(declare-fun e!701712 () Bool)

(assert (=> b!1238052 (= e!701712 call!61051)))

(declare-fun b!1238053 () Bool)

(declare-fun e!701711 () Bool)

(assert (=> b!1238053 (= e!701711 e!701712)))

(assert (=> b!1238053 (= c!120994 (validKeyInArray!0 (select (arr!38501 a!3835) from!3213)))))

(declare-fun b!1238054 () Bool)

(assert (=> b!1238054 (= e!701713 e!701711)))

(declare-fun res!825784 () Bool)

(assert (=> b!1238054 (=> (not res!825784) (not e!701711))))

(assert (=> b!1238054 (= res!825784 (not e!701710))))

(declare-fun res!825783 () Bool)

(assert (=> b!1238054 (=> (not res!825783) (not e!701710))))

(assert (=> b!1238054 (= res!825783 (validKeyInArray!0 (select (arr!38501 a!3835) from!3213)))))

(declare-fun b!1238055 () Bool)

(assert (=> b!1238055 (= e!701712 call!61051)))

(assert (= (and d!135821 (not res!825785)) b!1238054))

(assert (= (and b!1238054 res!825783) b!1238051))

(assert (= (and b!1238054 res!825784) b!1238053))

(assert (= (and b!1238053 c!120994) b!1238052))

(assert (= (and b!1238053 (not c!120994)) b!1238055))

(assert (= (or b!1238052 b!1238055) bm!61048))

(assert (=> b!1238051 m!1141425))

(assert (=> b!1238051 m!1141425))

(declare-fun m!1141649 () Bool)

(assert (=> b!1238051 m!1141649))

(assert (=> bm!61048 m!1141425))

(declare-fun m!1141651 () Bool)

(assert (=> bm!61048 m!1141651))

(assert (=> b!1238053 m!1141425))

(assert (=> b!1238053 m!1141425))

(assert (=> b!1238053 m!1141427))

(assert (=> b!1238054 m!1141425))

(assert (=> b!1238054 m!1141425))

(assert (=> b!1238054 m!1141427))

(assert (=> b!1237786 d!135821))

(declare-fun d!135835 () Bool)

