; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!102908 () Bool)

(assert start!102908)

(declare-fun res!824781 () Bool)

(declare-fun e!700934 () Bool)

(assert (=> start!102908 (=> (not res!824781) (not e!700934))))

(declare-datatypes ((array!79753 0))(
  ( (array!79754 (arr!38484 (Array (_ BitVec 32) (_ BitVec 64))) (size!39020 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79753)

(declare-fun from!3213 () (_ BitVec 32))

(assert (=> start!102908 (= res!824781 (and (bvslt (size!39020 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!39020 a!3835))))))

(assert (=> start!102908 e!700934))

(declare-fun array_inv!29332 (array!79753) Bool)

(assert (=> start!102908 (array_inv!29332 a!3835)))

(assert (=> start!102908 true))

(declare-fun b!1236793 () Bool)

(declare-fun res!824782 () Bool)

(assert (=> b!1236793 (=> (not res!824782) (not e!700934))))

(assert (=> b!1236793 (= res!824782 (not (= from!3213 (bvsub (size!39020 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1236794 () Bool)

(declare-fun res!824777 () Bool)

(assert (=> b!1236794 (=> (not res!824777) (not e!700934))))

(declare-datatypes ((List!27257 0))(
  ( (Nil!27254) (Cons!27253 (h!28462 (_ BitVec 64)) (t!40720 List!27257)) )
))
(declare-fun acc!846 () List!27257)

(declare-fun contains!7319 (List!27257 (_ BitVec 64)) Bool)

(assert (=> b!1236794 (= res!824777 (not (contains!7319 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1236795 () Bool)

(declare-fun res!824779 () Bool)

(assert (=> b!1236795 (=> (not res!824779) (not e!700934))))

(declare-fun arrayNoDuplicates!0 (array!79753 (_ BitVec 32) List!27257) Bool)

(assert (=> b!1236795 (= res!824779 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1236796 () Bool)

(declare-fun lt!560889 () List!27257)

(declare-fun subseq!573 (List!27257 List!27257) Bool)

(assert (=> b!1236796 (= e!700934 (not (subseq!573 acc!846 lt!560889)))))

(declare-datatypes ((Unit!41032 0))(
  ( (Unit!41033) )
))
(declare-fun lt!560890 () Unit!41032)

(declare-fun subseqTail!60 (List!27257 List!27257) Unit!41032)

(assert (=> b!1236796 (= lt!560890 (subseqTail!60 lt!560889 lt!560889))))

(assert (=> b!1236796 (subseq!573 lt!560889 lt!560889)))

(declare-fun lt!560891 () Unit!41032)

(declare-fun lemmaListSubSeqRefl!0 (List!27257) Unit!41032)

(assert (=> b!1236796 (= lt!560891 (lemmaListSubSeqRefl!0 lt!560889))))

(assert (=> b!1236796 (= lt!560889 (Cons!27253 (select (arr!38484 a!3835) from!3213) acc!846))))

(declare-fun b!1236797 () Bool)

(declare-fun res!824775 () Bool)

(assert (=> b!1236797 (=> (not res!824775) (not e!700934))))

(declare-fun k0!2925 () (_ BitVec 64))

(assert (=> b!1236797 (= res!824775 (contains!7319 acc!846 k0!2925))))

(declare-fun b!1236798 () Bool)

(declare-fun res!824778 () Bool)

(assert (=> b!1236798 (=> (not res!824778) (not e!700934))))

(assert (=> b!1236798 (= res!824778 (not (contains!7319 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1236799 () Bool)

(declare-fun res!824776 () Bool)

(assert (=> b!1236799 (=> (not res!824776) (not e!700934))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1236799 (= res!824776 (validKeyInArray!0 (select (arr!38484 a!3835) from!3213)))))

(declare-fun b!1236800 () Bool)

(declare-fun res!824780 () Bool)

(assert (=> b!1236800 (=> (not res!824780) (not e!700934))))

(declare-fun noDuplicate!1916 (List!27257) Bool)

(assert (=> b!1236800 (= res!824780 (noDuplicate!1916 acc!846))))

(assert (= (and start!102908 res!824781) b!1236800))

(assert (= (and b!1236800 res!824780) b!1236794))

(assert (= (and b!1236794 res!824777) b!1236798))

(assert (= (and b!1236798 res!824778) b!1236795))

(assert (= (and b!1236795 res!824779) b!1236797))

(assert (= (and b!1236797 res!824775) b!1236793))

(assert (= (and b!1236793 res!824782) b!1236799))

(assert (= (and b!1236799 res!824776) b!1236796))

(declare-fun m!1140541 () Bool)

(assert (=> b!1236794 m!1140541))

(declare-fun m!1140543 () Bool)

(assert (=> b!1236797 m!1140543))

(declare-fun m!1140545 () Bool)

(assert (=> b!1236798 m!1140545))

(declare-fun m!1140547 () Bool)

(assert (=> b!1236795 m!1140547))

(declare-fun m!1140549 () Bool)

(assert (=> start!102908 m!1140549))

(declare-fun m!1140551 () Bool)

(assert (=> b!1236800 m!1140551))

(declare-fun m!1140553 () Bool)

(assert (=> b!1236799 m!1140553))

(assert (=> b!1236799 m!1140553))

(declare-fun m!1140555 () Bool)

(assert (=> b!1236799 m!1140555))

(declare-fun m!1140557 () Bool)

(assert (=> b!1236796 m!1140557))

(declare-fun m!1140559 () Bool)

(assert (=> b!1236796 m!1140559))

(declare-fun m!1140561 () Bool)

(assert (=> b!1236796 m!1140561))

(assert (=> b!1236796 m!1140553))

(declare-fun m!1140563 () Bool)

(assert (=> b!1236796 m!1140563))

(check-sat (not b!1236799) (not b!1236795) (not b!1236794) (not b!1236798) (not b!1236796) (not start!102908) (not b!1236797) (not b!1236800))
(check-sat)
(get-model)

(declare-fun b!1236835 () Bool)

(declare-fun e!700951 () Bool)

(declare-fun call!60997 () Bool)

(assert (=> b!1236835 (= e!700951 call!60997)))

(declare-fun b!1236836 () Bool)

(declare-fun e!700952 () Bool)

(assert (=> b!1236836 (= e!700952 e!700951)))

(declare-fun c!120871 () Bool)

(assert (=> b!1236836 (= c!120871 (validKeyInArray!0 (select (arr!38484 a!3835) from!3213)))))

(declare-fun b!1236837 () Bool)

(assert (=> b!1236837 (= e!700951 call!60997)))

(declare-fun b!1236838 () Bool)

(declare-fun e!700953 () Bool)

(assert (=> b!1236838 (= e!700953 e!700952)))

(declare-fun res!824814 () Bool)

(assert (=> b!1236838 (=> (not res!824814) (not e!700952))))

(declare-fun e!700950 () Bool)

(assert (=> b!1236838 (= res!824814 (not e!700950))))

(declare-fun res!824813 () Bool)

(assert (=> b!1236838 (=> (not res!824813) (not e!700950))))

(assert (=> b!1236838 (= res!824813 (validKeyInArray!0 (select (arr!38484 a!3835) from!3213)))))

(declare-fun b!1236839 () Bool)

(assert (=> b!1236839 (= e!700950 (contains!7319 acc!846 (select (arr!38484 a!3835) from!3213)))))

(declare-fun bm!60994 () Bool)

(assert (=> bm!60994 (= call!60997 (arrayNoDuplicates!0 a!3835 (bvadd from!3213 #b00000000000000000000000000000001) (ite c!120871 (Cons!27253 (select (arr!38484 a!3835) from!3213) acc!846) acc!846)))))

(declare-fun d!135503 () Bool)

(declare-fun res!824815 () Bool)

(assert (=> d!135503 (=> res!824815 e!700953)))

(assert (=> d!135503 (= res!824815 (bvsge from!3213 (size!39020 a!3835)))))

(assert (=> d!135503 (= (arrayNoDuplicates!0 a!3835 from!3213 acc!846) e!700953)))

(assert (= (and d!135503 (not res!824815)) b!1236838))

(assert (= (and b!1236838 res!824813) b!1236839))

(assert (= (and b!1236838 res!824814) b!1236836))

(assert (= (and b!1236836 c!120871) b!1236837))

(assert (= (and b!1236836 (not c!120871)) b!1236835))

(assert (= (or b!1236837 b!1236835) bm!60994))

(assert (=> b!1236836 m!1140553))

(assert (=> b!1236836 m!1140553))

(assert (=> b!1236836 m!1140555))

(assert (=> b!1236838 m!1140553))

(assert (=> b!1236838 m!1140553))

(assert (=> b!1236838 m!1140555))

(assert (=> b!1236839 m!1140553))

(assert (=> b!1236839 m!1140553))

(declare-fun m!1140589 () Bool)

(assert (=> b!1236839 m!1140589))

(assert (=> bm!60994 m!1140553))

(declare-fun m!1140591 () Bool)

(assert (=> bm!60994 m!1140591))

(assert (=> b!1236795 d!135503))

(declare-fun d!135509 () Bool)

(declare-fun res!824841 () Bool)

(declare-fun e!700979 () Bool)

(assert (=> d!135509 (=> res!824841 e!700979)))

(get-info :version)

(assert (=> d!135509 (= res!824841 ((_ is Nil!27254) acc!846))))

(assert (=> d!135509 (= (subseq!573 acc!846 lt!560889) e!700979)))

(declare-fun b!1236864 () Bool)

(declare-fun e!700980 () Bool)

(assert (=> b!1236864 (= e!700979 e!700980)))

(declare-fun res!824840 () Bool)

(assert (=> b!1236864 (=> (not res!824840) (not e!700980))))

(assert (=> b!1236864 (= res!824840 ((_ is Cons!27253) lt!560889))))

(declare-fun b!1236866 () Bool)

(declare-fun e!700981 () Bool)

(assert (=> b!1236866 (= e!700981 (subseq!573 (t!40720 acc!846) (t!40720 lt!560889)))))

(declare-fun b!1236867 () Bool)

(declare-fun e!700978 () Bool)

(assert (=> b!1236867 (= e!700978 (subseq!573 acc!846 (t!40720 lt!560889)))))

(declare-fun b!1236865 () Bool)

(assert (=> b!1236865 (= e!700980 e!700978)))

(declare-fun res!824842 () Bool)

(assert (=> b!1236865 (=> res!824842 e!700978)))

(assert (=> b!1236865 (= res!824842 e!700981)))

(declare-fun res!824843 () Bool)

(assert (=> b!1236865 (=> (not res!824843) (not e!700981))))

(assert (=> b!1236865 (= res!824843 (= (h!28462 acc!846) (h!28462 lt!560889)))))

(assert (= (and d!135509 (not res!824841)) b!1236864))

(assert (= (and b!1236864 res!824840) b!1236865))

(assert (= (and b!1236865 res!824843) b!1236866))

(assert (= (and b!1236865 (not res!824842)) b!1236867))

(declare-fun m!1140611 () Bool)

(assert (=> b!1236866 m!1140611))

(declare-fun m!1140613 () Bool)

(assert (=> b!1236867 m!1140613))

(assert (=> b!1236796 d!135509))

(declare-fun b!1236917 () Bool)

(declare-fun c!120881 () Bool)

(declare-fun isEmpty!1006 (List!27257) Bool)

(assert (=> b!1236917 (= c!120881 (not (isEmpty!1006 (t!40720 lt!560889))))))

(declare-fun e!701024 () Unit!41032)

(declare-fun e!701023 () Unit!41032)

(assert (=> b!1236917 (= e!701024 e!701023)))

(declare-fun d!135523 () Bool)

(declare-fun tail!158 (List!27257) List!27257)

(assert (=> d!135523 (subseq!573 (tail!158 lt!560889) lt!560889)))

(declare-fun lt!560912 () Unit!41032)

(declare-fun e!701022 () Unit!41032)

(assert (=> d!135523 (= lt!560912 e!701022)))

(declare-fun c!120882 () Bool)

(assert (=> d!135523 (= c!120882 (and ((_ is Cons!27253) lt!560889) ((_ is Cons!27253) lt!560889)))))

(declare-fun e!701025 () Bool)

(assert (=> d!135523 e!701025))

(declare-fun res!824875 () Bool)

(assert (=> d!135523 (=> (not res!824875) (not e!701025))))

(assert (=> d!135523 (= res!824875 (not (isEmpty!1006 lt!560889)))))

(assert (=> d!135523 (= (subseqTail!60 lt!560889 lt!560889) lt!560912)))

(declare-fun bm!61000 () Bool)

(declare-fun call!61003 () Unit!41032)

(declare-fun c!120883 () Bool)

(assert (=> bm!61000 (= call!61003 (subseqTail!60 (ite c!120883 lt!560889 (t!40720 lt!560889)) (t!40720 lt!560889)))))

(declare-fun b!1236918 () Bool)

(declare-fun Unit!41036 () Unit!41032)

(assert (=> b!1236918 (= e!701023 Unit!41036)))

(declare-fun b!1236919 () Bool)

(declare-fun Unit!41037 () Unit!41032)

(assert (=> b!1236919 (= e!701022 Unit!41037)))

(declare-fun b!1236920 () Bool)

(assert (=> b!1236920 (= e!701024 call!61003)))

(declare-fun b!1236921 () Bool)

(assert (=> b!1236921 (= e!701025 (subseq!573 lt!560889 lt!560889))))

(declare-fun b!1236922 () Bool)

(assert (=> b!1236922 (= e!701022 e!701024)))

(assert (=> b!1236922 (= c!120883 (subseq!573 lt!560889 (t!40720 lt!560889)))))

(declare-fun b!1236923 () Bool)

(assert (=> b!1236923 (= e!701023 call!61003)))

(assert (= (and d!135523 res!824875) b!1236921))

(assert (= (and d!135523 c!120882) b!1236922))

(assert (= (and d!135523 (not c!120882)) b!1236919))

(assert (= (and b!1236922 c!120883) b!1236920))

(assert (= (and b!1236922 (not c!120883)) b!1236917))

(assert (= (and b!1236917 c!120881) b!1236923))

(assert (= (and b!1236917 (not c!120881)) b!1236918))

(assert (= (or b!1236920 b!1236923) bm!61000))

(declare-fun m!1140633 () Bool)

(assert (=> d!135523 m!1140633))

(assert (=> d!135523 m!1140633))

(declare-fun m!1140635 () Bool)

(assert (=> d!135523 m!1140635))

(declare-fun m!1140637 () Bool)

(assert (=> d!135523 m!1140637))

(assert (=> b!1236921 m!1140561))

(declare-fun m!1140639 () Bool)

(assert (=> bm!61000 m!1140639))

(declare-fun m!1140641 () Bool)

(assert (=> b!1236922 m!1140641))

(declare-fun m!1140643 () Bool)

(assert (=> b!1236917 m!1140643))

(assert (=> b!1236796 d!135523))

(declare-fun d!135535 () Bool)

(declare-fun res!824885 () Bool)

(declare-fun e!701035 () Bool)

(assert (=> d!135535 (=> res!824885 e!701035)))

(assert (=> d!135535 (= res!824885 ((_ is Nil!27254) lt!560889))))

(assert (=> d!135535 (= (subseq!573 lt!560889 lt!560889) e!701035)))

(declare-fun b!1236932 () Bool)

(declare-fun e!701036 () Bool)

(assert (=> b!1236932 (= e!701035 e!701036)))

(declare-fun res!824884 () Bool)

(assert (=> b!1236932 (=> (not res!824884) (not e!701036))))

(assert (=> b!1236932 (= res!824884 ((_ is Cons!27253) lt!560889))))

(declare-fun b!1236934 () Bool)

(declare-fun e!701037 () Bool)

(assert (=> b!1236934 (= e!701037 (subseq!573 (t!40720 lt!560889) (t!40720 lt!560889)))))

(declare-fun b!1236935 () Bool)

(declare-fun e!701034 () Bool)

(assert (=> b!1236935 (= e!701034 (subseq!573 lt!560889 (t!40720 lt!560889)))))

(declare-fun b!1236933 () Bool)

(assert (=> b!1236933 (= e!701036 e!701034)))

(declare-fun res!824886 () Bool)

(assert (=> b!1236933 (=> res!824886 e!701034)))

(assert (=> b!1236933 (= res!824886 e!701037)))

(declare-fun res!824887 () Bool)

(assert (=> b!1236933 (=> (not res!824887) (not e!701037))))

(assert (=> b!1236933 (= res!824887 (= (h!28462 lt!560889) (h!28462 lt!560889)))))

(assert (= (and d!135535 (not res!824885)) b!1236932))

(assert (= (and b!1236932 res!824884) b!1236933))

(assert (= (and b!1236933 res!824887) b!1236934))

(assert (= (and b!1236933 (not res!824886)) b!1236935))

(declare-fun m!1140645 () Bool)

(assert (=> b!1236934 m!1140645))

(assert (=> b!1236935 m!1140641))

(assert (=> b!1236796 d!135535))

(declare-fun d!135537 () Bool)

(assert (=> d!135537 (subseq!573 lt!560889 lt!560889)))

(declare-fun lt!560915 () Unit!41032)

(declare-fun choose!36 (List!27257) Unit!41032)

(assert (=> d!135537 (= lt!560915 (choose!36 lt!560889))))

(assert (=> d!135537 (= (lemmaListSubSeqRefl!0 lt!560889) lt!560915)))

(declare-fun bs!34781 () Bool)

(assert (= bs!34781 d!135537))

(assert (=> bs!34781 m!1140561))

(declare-fun m!1140651 () Bool)

(assert (=> bs!34781 m!1140651))

(assert (=> b!1236796 d!135537))

(declare-fun d!135541 () Bool)

(assert (=> d!135541 (= (array_inv!29332 a!3835) (bvsge (size!39020 a!3835) #b00000000000000000000000000000000))))

(assert (=> start!102908 d!135541))

(declare-fun d!135543 () Bool)

(declare-fun lt!560920 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!583 (List!27257) (InoxSet (_ BitVec 64)))

(assert (=> d!135543 (= lt!560920 (select (content!583 acc!846) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!701054 () Bool)

(assert (=> d!135543 (= lt!560920 e!701054)))

(declare-fun res!824899 () Bool)

(assert (=> d!135543 (=> (not res!824899) (not e!701054))))

(assert (=> d!135543 (= res!824899 ((_ is Cons!27253) acc!846))))

(assert (=> d!135543 (= (contains!7319 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000) lt!560920)))

(declare-fun b!1236958 () Bool)

(declare-fun e!701055 () Bool)

(assert (=> b!1236958 (= e!701054 e!701055)))

(declare-fun res!824898 () Bool)

(assert (=> b!1236958 (=> res!824898 e!701055)))

(assert (=> b!1236958 (= res!824898 (= (h!28462 acc!846) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1236959 () Bool)

(assert (=> b!1236959 (= e!701055 (contains!7319 (t!40720 acc!846) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!135543 res!824899) b!1236958))

(assert (= (and b!1236958 (not res!824898)) b!1236959))

(declare-fun m!1140653 () Bool)

(assert (=> d!135543 m!1140653))

(declare-fun m!1140655 () Bool)

(assert (=> d!135543 m!1140655))

(declare-fun m!1140657 () Bool)

(assert (=> b!1236959 m!1140657))

(assert (=> b!1236794 d!135543))

(declare-fun d!135545 () Bool)

(assert (=> d!135545 (= (validKeyInArray!0 (select (arr!38484 a!3835) from!3213)) (and (not (= (select (arr!38484 a!3835) from!3213) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!38484 a!3835) from!3213) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1236799 d!135545))

(declare-fun d!135547 () Bool)

(declare-fun res!824911 () Bool)

(declare-fun e!701076 () Bool)

(assert (=> d!135547 (=> res!824911 e!701076)))

(assert (=> d!135547 (= res!824911 ((_ is Nil!27254) acc!846))))

(assert (=> d!135547 (= (noDuplicate!1916 acc!846) e!701076)))

(declare-fun b!1236989 () Bool)

(declare-fun e!701077 () Bool)

(assert (=> b!1236989 (= e!701076 e!701077)))

(declare-fun res!824912 () Bool)

(assert (=> b!1236989 (=> (not res!824912) (not e!701077))))

(assert (=> b!1236989 (= res!824912 (not (contains!7319 (t!40720 acc!846) (h!28462 acc!846))))))

(declare-fun b!1236990 () Bool)

(assert (=> b!1236990 (= e!701077 (noDuplicate!1916 (t!40720 acc!846)))))

(assert (= (and d!135547 (not res!824911)) b!1236989))

(assert (= (and b!1236989 res!824912) b!1236990))

(declare-fun m!1140673 () Bool)

(assert (=> b!1236989 m!1140673))

(declare-fun m!1140675 () Bool)

(assert (=> b!1236990 m!1140675))

(assert (=> b!1236800 d!135547))

(declare-fun d!135553 () Bool)

(declare-fun lt!560926 () Bool)

(assert (=> d!135553 (= lt!560926 (select (content!583 acc!846) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!701078 () Bool)

(assert (=> d!135553 (= lt!560926 e!701078)))

(declare-fun res!824914 () Bool)

(assert (=> d!135553 (=> (not res!824914) (not e!701078))))

(assert (=> d!135553 (= res!824914 ((_ is Cons!27253) acc!846))))

(assert (=> d!135553 (= (contains!7319 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000) lt!560926)))

(declare-fun b!1236991 () Bool)

(declare-fun e!701079 () Bool)

(assert (=> b!1236991 (= e!701078 e!701079)))

(declare-fun res!824913 () Bool)

(assert (=> b!1236991 (=> res!824913 e!701079)))

(assert (=> b!1236991 (= res!824913 (= (h!28462 acc!846) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1236992 () Bool)

(assert (=> b!1236992 (= e!701079 (contains!7319 (t!40720 acc!846) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!135553 res!824914) b!1236991))

(assert (= (and b!1236991 (not res!824913)) b!1236992))

(assert (=> d!135553 m!1140653))

(declare-fun m!1140679 () Bool)

(assert (=> d!135553 m!1140679))

(declare-fun m!1140681 () Bool)

(assert (=> b!1236992 m!1140681))

(assert (=> b!1236798 d!135553))

(declare-fun d!135557 () Bool)

(declare-fun lt!560929 () Bool)

(assert (=> d!135557 (= lt!560929 (select (content!583 acc!846) k0!2925))))

(declare-fun e!701082 () Bool)

(assert (=> d!135557 (= lt!560929 e!701082)))

(declare-fun res!824918 () Bool)

(assert (=> d!135557 (=> (not res!824918) (not e!701082))))

(assert (=> d!135557 (= res!824918 ((_ is Cons!27253) acc!846))))

(assert (=> d!135557 (= (contains!7319 acc!846 k0!2925) lt!560929)))

(declare-fun b!1236995 () Bool)

(declare-fun e!701083 () Bool)

(assert (=> b!1236995 (= e!701082 e!701083)))

(declare-fun res!824917 () Bool)

(assert (=> b!1236995 (=> res!824917 e!701083)))

(assert (=> b!1236995 (= res!824917 (= (h!28462 acc!846) k0!2925))))

(declare-fun b!1236996 () Bool)

(assert (=> b!1236996 (= e!701083 (contains!7319 (t!40720 acc!846) k0!2925))))

(assert (= (and d!135557 res!824918) b!1236995))

(assert (= (and b!1236995 (not res!824917)) b!1236996))

(assert (=> d!135557 m!1140653))

(declare-fun m!1140685 () Bool)

(assert (=> d!135557 m!1140685))

(declare-fun m!1140689 () Bool)

(assert (=> b!1236996 m!1140689))

(assert (=> b!1236797 d!135557))

(check-sat (not bm!60994) (not b!1236836) (not b!1236838) (not d!135543) (not d!135537) (not b!1236989) (not b!1236996) (not b!1236866) (not d!135553) (not bm!61000) (not d!135557) (not b!1236921) (not b!1236839) (not b!1236992) (not b!1236934) (not d!135523) (not b!1236959) (not b!1236922) (not b!1236990) (not b!1236867) (not b!1236935) (not b!1236917))
(check-sat)
(get-model)

(declare-fun d!135569 () Bool)

(declare-fun lt!560934 () Bool)

(assert (=> d!135569 (= lt!560934 (select (content!583 acc!846) (select (arr!38484 a!3835) from!3213)))))

(declare-fun e!701110 () Bool)

(assert (=> d!135569 (= lt!560934 e!701110)))

(declare-fun res!824940 () Bool)

(assert (=> d!135569 (=> (not res!824940) (not e!701110))))

(assert (=> d!135569 (= res!824940 ((_ is Cons!27253) acc!846))))

(assert (=> d!135569 (= (contains!7319 acc!846 (select (arr!38484 a!3835) from!3213)) lt!560934)))

(declare-fun b!1237029 () Bool)

(declare-fun e!701111 () Bool)

(assert (=> b!1237029 (= e!701110 e!701111)))

(declare-fun res!824939 () Bool)

(assert (=> b!1237029 (=> res!824939 e!701111)))

(assert (=> b!1237029 (= res!824939 (= (h!28462 acc!846) (select (arr!38484 a!3835) from!3213)))))

(declare-fun b!1237030 () Bool)

(assert (=> b!1237030 (= e!701111 (contains!7319 (t!40720 acc!846) (select (arr!38484 a!3835) from!3213)))))

(assert (= (and d!135569 res!824940) b!1237029))

(assert (= (and b!1237029 (not res!824939)) b!1237030))

(assert (=> d!135569 m!1140653))

(assert (=> d!135569 m!1140553))

(declare-fun m!1140715 () Bool)

(assert (=> d!135569 m!1140715))

(assert (=> b!1237030 m!1140553))

(declare-fun m!1140717 () Bool)

(assert (=> b!1237030 m!1140717))

(assert (=> b!1236839 d!135569))

(declare-fun d!135571 () Bool)

(declare-fun res!824942 () Bool)

(declare-fun e!701113 () Bool)

(assert (=> d!135571 (=> res!824942 e!701113)))

(assert (=> d!135571 (= res!824942 ((_ is Nil!27254) lt!560889))))

(assert (=> d!135571 (= (subseq!573 lt!560889 (t!40720 lt!560889)) e!701113)))

(declare-fun b!1237031 () Bool)

(declare-fun e!701114 () Bool)

(assert (=> b!1237031 (= e!701113 e!701114)))

(declare-fun res!824941 () Bool)

(assert (=> b!1237031 (=> (not res!824941) (not e!701114))))

(assert (=> b!1237031 (= res!824941 ((_ is Cons!27253) (t!40720 lt!560889)))))

(declare-fun b!1237033 () Bool)

(declare-fun e!701115 () Bool)

(assert (=> b!1237033 (= e!701115 (subseq!573 (t!40720 lt!560889) (t!40720 (t!40720 lt!560889))))))

(declare-fun b!1237034 () Bool)

(declare-fun e!701112 () Bool)

(assert (=> b!1237034 (= e!701112 (subseq!573 lt!560889 (t!40720 (t!40720 lt!560889))))))

(declare-fun b!1237032 () Bool)

(assert (=> b!1237032 (= e!701114 e!701112)))

(declare-fun res!824943 () Bool)

(assert (=> b!1237032 (=> res!824943 e!701112)))

(assert (=> b!1237032 (= res!824943 e!701115)))

(declare-fun res!824944 () Bool)

(assert (=> b!1237032 (=> (not res!824944) (not e!701115))))

(assert (=> b!1237032 (= res!824944 (= (h!28462 lt!560889) (h!28462 (t!40720 lt!560889))))))

(assert (= (and d!135571 (not res!824942)) b!1237031))

(assert (= (and b!1237031 res!824941) b!1237032))

(assert (= (and b!1237032 res!824944) b!1237033))

(assert (= (and b!1237032 (not res!824943)) b!1237034))

(declare-fun m!1140719 () Bool)

(assert (=> b!1237033 m!1140719))

(declare-fun m!1140721 () Bool)

(assert (=> b!1237034 m!1140721))

(assert (=> b!1236935 d!135571))

(declare-fun d!135573 () Bool)

(declare-fun lt!560935 () Bool)

(assert (=> d!135573 (= lt!560935 (select (content!583 (t!40720 acc!846)) (h!28462 acc!846)))))

(declare-fun e!701116 () Bool)

(assert (=> d!135573 (= lt!560935 e!701116)))

(declare-fun res!824946 () Bool)

(assert (=> d!135573 (=> (not res!824946) (not e!701116))))

(assert (=> d!135573 (= res!824946 ((_ is Cons!27253) (t!40720 acc!846)))))

(assert (=> d!135573 (= (contains!7319 (t!40720 acc!846) (h!28462 acc!846)) lt!560935)))

(declare-fun b!1237035 () Bool)

(declare-fun e!701117 () Bool)

(assert (=> b!1237035 (= e!701116 e!701117)))

(declare-fun res!824945 () Bool)

(assert (=> b!1237035 (=> res!824945 e!701117)))

(assert (=> b!1237035 (= res!824945 (= (h!28462 (t!40720 acc!846)) (h!28462 acc!846)))))

(declare-fun b!1237036 () Bool)

(assert (=> b!1237036 (= e!701117 (contains!7319 (t!40720 (t!40720 acc!846)) (h!28462 acc!846)))))

(assert (= (and d!135573 res!824946) b!1237035))

(assert (= (and b!1237035 (not res!824945)) b!1237036))

(declare-fun m!1140723 () Bool)

(assert (=> d!135573 m!1140723))

(declare-fun m!1140725 () Bool)

(assert (=> d!135573 m!1140725))

(declare-fun m!1140727 () Bool)

(assert (=> b!1237036 m!1140727))

(assert (=> b!1236989 d!135573))

(assert (=> b!1236922 d!135571))

(assert (=> b!1236838 d!135545))

(declare-fun d!135575 () Bool)

(declare-fun res!824948 () Bool)

(declare-fun e!701119 () Bool)

(assert (=> d!135575 (=> res!824948 e!701119)))

(assert (=> d!135575 (= res!824948 ((_ is Nil!27254) (t!40720 lt!560889)))))

(assert (=> d!135575 (= (subseq!573 (t!40720 lt!560889) (t!40720 lt!560889)) e!701119)))

(declare-fun b!1237037 () Bool)

(declare-fun e!701120 () Bool)

(assert (=> b!1237037 (= e!701119 e!701120)))

(declare-fun res!824947 () Bool)

(assert (=> b!1237037 (=> (not res!824947) (not e!701120))))

(assert (=> b!1237037 (= res!824947 ((_ is Cons!27253) (t!40720 lt!560889)))))

(declare-fun b!1237039 () Bool)

(declare-fun e!701121 () Bool)

(assert (=> b!1237039 (= e!701121 (subseq!573 (t!40720 (t!40720 lt!560889)) (t!40720 (t!40720 lt!560889))))))

(declare-fun b!1237040 () Bool)

(declare-fun e!701118 () Bool)

(assert (=> b!1237040 (= e!701118 (subseq!573 (t!40720 lt!560889) (t!40720 (t!40720 lt!560889))))))

(declare-fun b!1237038 () Bool)

(assert (=> b!1237038 (= e!701120 e!701118)))

(declare-fun res!824949 () Bool)

(assert (=> b!1237038 (=> res!824949 e!701118)))

(assert (=> b!1237038 (= res!824949 e!701121)))

(declare-fun res!824950 () Bool)

(assert (=> b!1237038 (=> (not res!824950) (not e!701121))))

(assert (=> b!1237038 (= res!824950 (= (h!28462 (t!40720 lt!560889)) (h!28462 (t!40720 lt!560889))))))

(assert (= (and d!135575 (not res!824948)) b!1237037))

(assert (= (and b!1237037 res!824947) b!1237038))

(assert (= (and b!1237038 res!824950) b!1237039))

(assert (= (and b!1237038 (not res!824949)) b!1237040))

(declare-fun m!1140729 () Bool)

(assert (=> b!1237039 m!1140729))

(assert (=> b!1237040 m!1140719))

(assert (=> b!1236934 d!135575))

(assert (=> b!1236836 d!135545))

(assert (=> b!1236921 d!135535))

(declare-fun d!135577 () Bool)

(declare-fun lt!560936 () Bool)

(assert (=> d!135577 (= lt!560936 (select (content!583 (t!40720 acc!846)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!701122 () Bool)

(assert (=> d!135577 (= lt!560936 e!701122)))

(declare-fun res!824952 () Bool)

(assert (=> d!135577 (=> (not res!824952) (not e!701122))))

(assert (=> d!135577 (= res!824952 ((_ is Cons!27253) (t!40720 acc!846)))))

(assert (=> d!135577 (= (contains!7319 (t!40720 acc!846) #b1000000000000000000000000000000000000000000000000000000000000000) lt!560936)))

(declare-fun b!1237041 () Bool)

(declare-fun e!701123 () Bool)

(assert (=> b!1237041 (= e!701122 e!701123)))

(declare-fun res!824951 () Bool)

(assert (=> b!1237041 (=> res!824951 e!701123)))

(assert (=> b!1237041 (= res!824951 (= (h!28462 (t!40720 acc!846)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1237042 () Bool)

(assert (=> b!1237042 (= e!701123 (contains!7319 (t!40720 (t!40720 acc!846)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!135577 res!824952) b!1237041))

(assert (= (and b!1237041 (not res!824951)) b!1237042))

(assert (=> d!135577 m!1140723))

(declare-fun m!1140731 () Bool)

(assert (=> d!135577 m!1140731))

(declare-fun m!1140733 () Bool)

(assert (=> b!1237042 m!1140733))

(assert (=> b!1236992 d!135577))

(declare-fun d!135579 () Bool)

(declare-fun res!824954 () Bool)

(declare-fun e!701125 () Bool)

(assert (=> d!135579 (=> res!824954 e!701125)))

(assert (=> d!135579 (= res!824954 ((_ is Nil!27254) acc!846))))

(assert (=> d!135579 (= (subseq!573 acc!846 (t!40720 lt!560889)) e!701125)))

(declare-fun b!1237043 () Bool)

(declare-fun e!701126 () Bool)

(assert (=> b!1237043 (= e!701125 e!701126)))

(declare-fun res!824953 () Bool)

(assert (=> b!1237043 (=> (not res!824953) (not e!701126))))

(assert (=> b!1237043 (= res!824953 ((_ is Cons!27253) (t!40720 lt!560889)))))

(declare-fun b!1237045 () Bool)

(declare-fun e!701127 () Bool)

(assert (=> b!1237045 (= e!701127 (subseq!573 (t!40720 acc!846) (t!40720 (t!40720 lt!560889))))))

(declare-fun b!1237046 () Bool)

(declare-fun e!701124 () Bool)

(assert (=> b!1237046 (= e!701124 (subseq!573 acc!846 (t!40720 (t!40720 lt!560889))))))

(declare-fun b!1237044 () Bool)

(assert (=> b!1237044 (= e!701126 e!701124)))

(declare-fun res!824955 () Bool)

(assert (=> b!1237044 (=> res!824955 e!701124)))

(assert (=> b!1237044 (= res!824955 e!701127)))

(declare-fun res!824956 () Bool)

(assert (=> b!1237044 (=> (not res!824956) (not e!701127))))

(assert (=> b!1237044 (= res!824956 (= (h!28462 acc!846) (h!28462 (t!40720 lt!560889))))))

(assert (= (and d!135579 (not res!824954)) b!1237043))

(assert (= (and b!1237043 res!824953) b!1237044))

(assert (= (and b!1237044 res!824956) b!1237045))

(assert (= (and b!1237044 (not res!824955)) b!1237046))

(declare-fun m!1140735 () Bool)

(assert (=> b!1237045 m!1140735))

(declare-fun m!1140737 () Bool)

(assert (=> b!1237046 m!1140737))

(assert (=> b!1236867 d!135579))

(declare-fun d!135581 () Bool)

(declare-fun lt!560937 () Bool)

(assert (=> d!135581 (= lt!560937 (select (content!583 (t!40720 acc!846)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!701128 () Bool)

(assert (=> d!135581 (= lt!560937 e!701128)))

(declare-fun res!824958 () Bool)

(assert (=> d!135581 (=> (not res!824958) (not e!701128))))

(assert (=> d!135581 (= res!824958 ((_ is Cons!27253) (t!40720 acc!846)))))

(assert (=> d!135581 (= (contains!7319 (t!40720 acc!846) #b0000000000000000000000000000000000000000000000000000000000000000) lt!560937)))

(declare-fun b!1237047 () Bool)

(declare-fun e!701129 () Bool)

(assert (=> b!1237047 (= e!701128 e!701129)))

(declare-fun res!824957 () Bool)

(assert (=> b!1237047 (=> res!824957 e!701129)))

(assert (=> b!1237047 (= res!824957 (= (h!28462 (t!40720 acc!846)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1237048 () Bool)

(assert (=> b!1237048 (= e!701129 (contains!7319 (t!40720 (t!40720 acc!846)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!135581 res!824958) b!1237047))

(assert (= (and b!1237047 (not res!824957)) b!1237048))

(assert (=> d!135581 m!1140723))

(declare-fun m!1140739 () Bool)

(assert (=> d!135581 m!1140739))

(declare-fun m!1140741 () Bool)

(assert (=> b!1237048 m!1140741))

(assert (=> b!1236959 d!135581))

(declare-fun d!135583 () Bool)

(declare-fun res!824960 () Bool)

(declare-fun e!701131 () Bool)

(assert (=> d!135583 (=> res!824960 e!701131)))

(assert (=> d!135583 (= res!824960 ((_ is Nil!27254) (t!40720 acc!846)))))

(assert (=> d!135583 (= (subseq!573 (t!40720 acc!846) (t!40720 lt!560889)) e!701131)))

(declare-fun b!1237049 () Bool)

(declare-fun e!701132 () Bool)

(assert (=> b!1237049 (= e!701131 e!701132)))

(declare-fun res!824959 () Bool)

(assert (=> b!1237049 (=> (not res!824959) (not e!701132))))

(assert (=> b!1237049 (= res!824959 ((_ is Cons!27253) (t!40720 lt!560889)))))

(declare-fun b!1237051 () Bool)

(declare-fun e!701133 () Bool)

(assert (=> b!1237051 (= e!701133 (subseq!573 (t!40720 (t!40720 acc!846)) (t!40720 (t!40720 lt!560889))))))

(declare-fun b!1237052 () Bool)

(declare-fun e!701130 () Bool)

(assert (=> b!1237052 (= e!701130 (subseq!573 (t!40720 acc!846) (t!40720 (t!40720 lt!560889))))))

(declare-fun b!1237050 () Bool)

(assert (=> b!1237050 (= e!701132 e!701130)))

(declare-fun res!824961 () Bool)

(assert (=> b!1237050 (=> res!824961 e!701130)))

(assert (=> b!1237050 (= res!824961 e!701133)))

(declare-fun res!824962 () Bool)

(assert (=> b!1237050 (=> (not res!824962) (not e!701133))))

(assert (=> b!1237050 (= res!824962 (= (h!28462 (t!40720 acc!846)) (h!28462 (t!40720 lt!560889))))))

(assert (= (and d!135583 (not res!824960)) b!1237049))

(assert (= (and b!1237049 res!824959) b!1237050))

(assert (= (and b!1237050 res!824962) b!1237051))

(assert (= (and b!1237050 (not res!824961)) b!1237052))

(declare-fun m!1140743 () Bool)

(assert (=> b!1237051 m!1140743))

(assert (=> b!1237052 m!1140735))

(assert (=> b!1236866 d!135583))

(declare-fun d!135585 () Bool)

(declare-fun c!120907 () Bool)

(assert (=> d!135585 (= c!120907 ((_ is Nil!27254) acc!846))))

(declare-fun e!701136 () (InoxSet (_ BitVec 64)))

(assert (=> d!135585 (= (content!583 acc!846) e!701136)))

(declare-fun b!1237057 () Bool)

(assert (=> b!1237057 (= e!701136 ((as const (Array (_ BitVec 64) Bool)) false))))

(declare-fun b!1237058 () Bool)

(assert (=> b!1237058 (= e!701136 ((_ map or) (store ((as const (Array (_ BitVec 64) Bool)) false) (h!28462 acc!846) true) (content!583 (t!40720 acc!846))))))

(assert (= (and d!135585 c!120907) b!1237057))

(assert (= (and d!135585 (not c!120907)) b!1237058))

(declare-fun m!1140745 () Bool)

(assert (=> b!1237058 m!1140745))

(assert (=> b!1237058 m!1140723))

(assert (=> d!135543 d!135585))

(assert (=> d!135557 d!135585))

(declare-fun b!1237059 () Bool)

(declare-fun c!120908 () Bool)

(assert (=> b!1237059 (= c!120908 (not (isEmpty!1006 (t!40720 (ite c!120883 lt!560889 (t!40720 lt!560889))))))))

(declare-fun e!701139 () Unit!41032)

(declare-fun e!701138 () Unit!41032)

(assert (=> b!1237059 (= e!701139 e!701138)))

(declare-fun d!135587 () Bool)

(assert (=> d!135587 (subseq!573 (tail!158 (ite c!120883 lt!560889 (t!40720 lt!560889))) (t!40720 lt!560889))))

(declare-fun lt!560938 () Unit!41032)

(declare-fun e!701137 () Unit!41032)

(assert (=> d!135587 (= lt!560938 e!701137)))

(declare-fun c!120909 () Bool)

(assert (=> d!135587 (= c!120909 (and ((_ is Cons!27253) (ite c!120883 lt!560889 (t!40720 lt!560889))) ((_ is Cons!27253) (t!40720 lt!560889))))))

(declare-fun e!701140 () Bool)

(assert (=> d!135587 e!701140))

(declare-fun res!824963 () Bool)

(assert (=> d!135587 (=> (not res!824963) (not e!701140))))

(assert (=> d!135587 (= res!824963 (not (isEmpty!1006 (ite c!120883 lt!560889 (t!40720 lt!560889)))))))

(assert (=> d!135587 (= (subseqTail!60 (ite c!120883 lt!560889 (t!40720 lt!560889)) (t!40720 lt!560889)) lt!560938)))

(declare-fun c!120910 () Bool)

(declare-fun call!61013 () Unit!41032)

(declare-fun bm!61010 () Bool)

(assert (=> bm!61010 (= call!61013 (subseqTail!60 (ite c!120910 (ite c!120883 lt!560889 (t!40720 lt!560889)) (t!40720 (ite c!120883 lt!560889 (t!40720 lt!560889)))) (t!40720 (t!40720 lt!560889))))))

(declare-fun b!1237060 () Bool)

(declare-fun Unit!41042 () Unit!41032)

(assert (=> b!1237060 (= e!701138 Unit!41042)))

(declare-fun b!1237061 () Bool)

(declare-fun Unit!41043 () Unit!41032)

(assert (=> b!1237061 (= e!701137 Unit!41043)))

(declare-fun b!1237062 () Bool)

(assert (=> b!1237062 (= e!701139 call!61013)))

(declare-fun b!1237063 () Bool)

(assert (=> b!1237063 (= e!701140 (subseq!573 (ite c!120883 lt!560889 (t!40720 lt!560889)) (t!40720 lt!560889)))))

(declare-fun b!1237064 () Bool)

(assert (=> b!1237064 (= e!701137 e!701139)))

(assert (=> b!1237064 (= c!120910 (subseq!573 (ite c!120883 lt!560889 (t!40720 lt!560889)) (t!40720 (t!40720 lt!560889))))))

(declare-fun b!1237065 () Bool)

(assert (=> b!1237065 (= e!701138 call!61013)))

(assert (= (and d!135587 res!824963) b!1237063))

(assert (= (and d!135587 c!120909) b!1237064))

(assert (= (and d!135587 (not c!120909)) b!1237061))

(assert (= (and b!1237064 c!120910) b!1237062))

(assert (= (and b!1237064 (not c!120910)) b!1237059))

(assert (= (and b!1237059 c!120908) b!1237065))

(assert (= (and b!1237059 (not c!120908)) b!1237060))

(assert (= (or b!1237062 b!1237065) bm!61010))

(declare-fun m!1140747 () Bool)

(assert (=> d!135587 m!1140747))

(assert (=> d!135587 m!1140747))

(declare-fun m!1140749 () Bool)

(assert (=> d!135587 m!1140749))

(declare-fun m!1140751 () Bool)

(assert (=> d!135587 m!1140751))

(declare-fun m!1140753 () Bool)

(assert (=> b!1237063 m!1140753))

(declare-fun m!1140755 () Bool)

(assert (=> bm!61010 m!1140755))

(declare-fun m!1140757 () Bool)

(assert (=> b!1237064 m!1140757))

(declare-fun m!1140759 () Bool)

(assert (=> b!1237059 m!1140759))

(assert (=> bm!61000 d!135587))

(assert (=> d!135537 d!135535))

(declare-fun d!135589 () Bool)

(assert (=> d!135589 (subseq!573 lt!560889 lt!560889)))

(assert (=> d!135589 true))

(declare-fun _$69!47 () Unit!41032)

(assert (=> d!135589 (= (choose!36 lt!560889) _$69!47)))

(declare-fun bs!34784 () Bool)

(assert (= bs!34784 d!135589))

(assert (=> bs!34784 m!1140561))

(assert (=> d!135537 d!135589))

(declare-fun d!135591 () Bool)

(declare-fun lt!560939 () Bool)

(assert (=> d!135591 (= lt!560939 (select (content!583 (t!40720 acc!846)) k0!2925))))

(declare-fun e!701141 () Bool)

(assert (=> d!135591 (= lt!560939 e!701141)))

(declare-fun res!824965 () Bool)

(assert (=> d!135591 (=> (not res!824965) (not e!701141))))

(assert (=> d!135591 (= res!824965 ((_ is Cons!27253) (t!40720 acc!846)))))

(assert (=> d!135591 (= (contains!7319 (t!40720 acc!846) k0!2925) lt!560939)))

(declare-fun b!1237066 () Bool)

(declare-fun e!701142 () Bool)

(assert (=> b!1237066 (= e!701141 e!701142)))

(declare-fun res!824964 () Bool)

(assert (=> b!1237066 (=> res!824964 e!701142)))

(assert (=> b!1237066 (= res!824964 (= (h!28462 (t!40720 acc!846)) k0!2925))))

(declare-fun b!1237067 () Bool)

(assert (=> b!1237067 (= e!701142 (contains!7319 (t!40720 (t!40720 acc!846)) k0!2925))))

(assert (= (and d!135591 res!824965) b!1237066))

(assert (= (and b!1237066 (not res!824964)) b!1237067))

(assert (=> d!135591 m!1140723))

(declare-fun m!1140761 () Bool)

(assert (=> d!135591 m!1140761))

(declare-fun m!1140763 () Bool)

(assert (=> b!1237067 m!1140763))

(assert (=> b!1236996 d!135591))

(declare-fun d!135593 () Bool)

(assert (=> d!135593 (= (isEmpty!1006 (t!40720 lt!560889)) ((_ is Nil!27254) (t!40720 lt!560889)))))

(assert (=> b!1236917 d!135593))

(declare-fun b!1237068 () Bool)

(declare-fun e!701144 () Bool)

(declare-fun call!61014 () Bool)

(assert (=> b!1237068 (= e!701144 call!61014)))

(declare-fun b!1237069 () Bool)

(declare-fun e!701145 () Bool)

(assert (=> b!1237069 (= e!701145 e!701144)))

(declare-fun c!120911 () Bool)

(assert (=> b!1237069 (= c!120911 (validKeyInArray!0 (select (arr!38484 a!3835) (bvadd from!3213 #b00000000000000000000000000000001))))))

(declare-fun b!1237070 () Bool)

(assert (=> b!1237070 (= e!701144 call!61014)))

(declare-fun b!1237071 () Bool)

(declare-fun e!701146 () Bool)

(assert (=> b!1237071 (= e!701146 e!701145)))

(declare-fun res!824967 () Bool)

(assert (=> b!1237071 (=> (not res!824967) (not e!701145))))

(declare-fun e!701143 () Bool)

(assert (=> b!1237071 (= res!824967 (not e!701143))))

(declare-fun res!824966 () Bool)

(assert (=> b!1237071 (=> (not res!824966) (not e!701143))))

(assert (=> b!1237071 (= res!824966 (validKeyInArray!0 (select (arr!38484 a!3835) (bvadd from!3213 #b00000000000000000000000000000001))))))

(declare-fun b!1237072 () Bool)

(assert (=> b!1237072 (= e!701143 (contains!7319 (ite c!120871 (Cons!27253 (select (arr!38484 a!3835) from!3213) acc!846) acc!846) (select (arr!38484 a!3835) (bvadd from!3213 #b00000000000000000000000000000001))))))

(declare-fun bm!61011 () Bool)

(assert (=> bm!61011 (= call!61014 (arrayNoDuplicates!0 a!3835 (bvadd from!3213 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!120911 (Cons!27253 (select (arr!38484 a!3835) (bvadd from!3213 #b00000000000000000000000000000001)) (ite c!120871 (Cons!27253 (select (arr!38484 a!3835) from!3213) acc!846) acc!846)) (ite c!120871 (Cons!27253 (select (arr!38484 a!3835) from!3213) acc!846) acc!846))))))

(declare-fun d!135595 () Bool)

(declare-fun res!824968 () Bool)

(assert (=> d!135595 (=> res!824968 e!701146)))

(assert (=> d!135595 (= res!824968 (bvsge (bvadd from!3213 #b00000000000000000000000000000001) (size!39020 a!3835)))))

(assert (=> d!135595 (= (arrayNoDuplicates!0 a!3835 (bvadd from!3213 #b00000000000000000000000000000001) (ite c!120871 (Cons!27253 (select (arr!38484 a!3835) from!3213) acc!846) acc!846)) e!701146)))

(assert (= (and d!135595 (not res!824968)) b!1237071))

(assert (= (and b!1237071 res!824966) b!1237072))

(assert (= (and b!1237071 res!824967) b!1237069))

(assert (= (and b!1237069 c!120911) b!1237070))

(assert (= (and b!1237069 (not c!120911)) b!1237068))

(assert (= (or b!1237070 b!1237068) bm!61011))

(declare-fun m!1140765 () Bool)

(assert (=> b!1237069 m!1140765))

(assert (=> b!1237069 m!1140765))

(declare-fun m!1140767 () Bool)

(assert (=> b!1237069 m!1140767))

(assert (=> b!1237071 m!1140765))

(assert (=> b!1237071 m!1140765))

(assert (=> b!1237071 m!1140767))

(assert (=> b!1237072 m!1140765))

(assert (=> b!1237072 m!1140765))

(declare-fun m!1140769 () Bool)

(assert (=> b!1237072 m!1140769))

(assert (=> bm!61011 m!1140765))

(declare-fun m!1140771 () Bool)

(assert (=> bm!61011 m!1140771))

(assert (=> bm!60994 d!135595))

(declare-fun d!135597 () Bool)

(declare-fun res!824969 () Bool)

(declare-fun e!701147 () Bool)

(assert (=> d!135597 (=> res!824969 e!701147)))

(assert (=> d!135597 (= res!824969 ((_ is Nil!27254) (t!40720 acc!846)))))

(assert (=> d!135597 (= (noDuplicate!1916 (t!40720 acc!846)) e!701147)))

(declare-fun b!1237073 () Bool)

(declare-fun e!701148 () Bool)

(assert (=> b!1237073 (= e!701147 e!701148)))

(declare-fun res!824970 () Bool)

(assert (=> b!1237073 (=> (not res!824970) (not e!701148))))

(assert (=> b!1237073 (= res!824970 (not (contains!7319 (t!40720 (t!40720 acc!846)) (h!28462 (t!40720 acc!846)))))))

(declare-fun b!1237074 () Bool)

(assert (=> b!1237074 (= e!701148 (noDuplicate!1916 (t!40720 (t!40720 acc!846))))))

(assert (= (and d!135597 (not res!824969)) b!1237073))

(assert (= (and b!1237073 res!824970) b!1237074))

(declare-fun m!1140773 () Bool)

(assert (=> b!1237073 m!1140773))

(declare-fun m!1140775 () Bool)

(assert (=> b!1237074 m!1140775))

(assert (=> b!1236990 d!135597))

(assert (=> d!135553 d!135585))

(declare-fun d!135599 () Bool)

(declare-fun res!824972 () Bool)

(declare-fun e!701150 () Bool)

(assert (=> d!135599 (=> res!824972 e!701150)))

(assert (=> d!135599 (= res!824972 ((_ is Nil!27254) (tail!158 lt!560889)))))

(assert (=> d!135599 (= (subseq!573 (tail!158 lt!560889) lt!560889) e!701150)))

(declare-fun b!1237075 () Bool)

(declare-fun e!701151 () Bool)

(assert (=> b!1237075 (= e!701150 e!701151)))

(declare-fun res!824971 () Bool)

(assert (=> b!1237075 (=> (not res!824971) (not e!701151))))

(assert (=> b!1237075 (= res!824971 ((_ is Cons!27253) lt!560889))))

(declare-fun b!1237077 () Bool)

(declare-fun e!701152 () Bool)

(assert (=> b!1237077 (= e!701152 (subseq!573 (t!40720 (tail!158 lt!560889)) (t!40720 lt!560889)))))

(declare-fun b!1237078 () Bool)

(declare-fun e!701149 () Bool)

(assert (=> b!1237078 (= e!701149 (subseq!573 (tail!158 lt!560889) (t!40720 lt!560889)))))

(declare-fun b!1237076 () Bool)

(assert (=> b!1237076 (= e!701151 e!701149)))

(declare-fun res!824973 () Bool)

(assert (=> b!1237076 (=> res!824973 e!701149)))

(assert (=> b!1237076 (= res!824973 e!701152)))

(declare-fun res!824974 () Bool)

(assert (=> b!1237076 (=> (not res!824974) (not e!701152))))

(assert (=> b!1237076 (= res!824974 (= (h!28462 (tail!158 lt!560889)) (h!28462 lt!560889)))))

(assert (= (and d!135599 (not res!824972)) b!1237075))

(assert (= (and b!1237075 res!824971) b!1237076))

(assert (= (and b!1237076 res!824974) b!1237077))

(assert (= (and b!1237076 (not res!824973)) b!1237078))

(declare-fun m!1140777 () Bool)

(assert (=> b!1237077 m!1140777))

(assert (=> b!1237078 m!1140633))

(declare-fun m!1140779 () Bool)

(assert (=> b!1237078 m!1140779))

(assert (=> d!135523 d!135599))

(declare-fun d!135601 () Bool)

(assert (=> d!135601 (= (tail!158 lt!560889) (t!40720 lt!560889))))

(assert (=> d!135523 d!135601))

(declare-fun d!135603 () Bool)

(assert (=> d!135603 (= (isEmpty!1006 lt!560889) ((_ is Nil!27254) lt!560889))))

(assert (=> d!135523 d!135603))

(check-sat (not b!1237078) (not d!135577) (not b!1237034) (not b!1237059) (not bm!61011) (not b!1237077) (not b!1237073) (not b!1237036) (not b!1237046) (not b!1237052) (not b!1237069) (not b!1237030) (not b!1237039) (not b!1237074) (not bm!61010) (not b!1237071) (not b!1237072) (not b!1237042) (not d!135591) (not b!1237067) (not d!135587) (not b!1237064) (not d!135589) (not b!1237033) (not b!1237045) (not d!135573) (not b!1237048) (not b!1237058) (not b!1237063) (not b!1237051) (not b!1237040) (not d!135569) (not d!135581))
(check-sat)
