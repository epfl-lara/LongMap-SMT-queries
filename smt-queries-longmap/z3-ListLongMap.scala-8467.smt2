; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103246 () Bool)

(assert start!103246)

(declare-fun b!1238809 () Bool)

(declare-fun e!702182 () Bool)

(declare-fun e!702180 () Bool)

(assert (=> b!1238809 (= e!702182 (not e!702180))))

(declare-fun res!825887 () Bool)

(assert (=> b!1238809 (=> res!825887 e!702180)))

(declare-fun from!3213 () (_ BitVec 32))

(assert (=> b!1238809 (= res!825887 (bvslt (bvadd #b00000000000000000000000000000001 from!3213) #b00000000000000000000000000000000))))

(declare-datatypes ((List!27296 0))(
  ( (Nil!27293) (Cons!27292 (h!28510 (_ BitVec 64)) (t!40751 List!27296)) )
))
(declare-fun acc!846 () List!27296)

(declare-fun lt!561553 () List!27296)

(declare-fun subseq!587 (List!27296 List!27296) Bool)

(assert (=> b!1238809 (subseq!587 acc!846 lt!561553)))

(declare-datatypes ((Unit!41043 0))(
  ( (Unit!41044) )
))
(declare-fun lt!561552 () Unit!41043)

(declare-fun subseqTail!74 (List!27296 List!27296) Unit!41043)

(assert (=> b!1238809 (= lt!561552 (subseqTail!74 lt!561553 lt!561553))))

(assert (=> b!1238809 (subseq!587 lt!561553 lt!561553)))

(declare-fun lt!561554 () Unit!41043)

(declare-fun lemmaListSubSeqRefl!0 (List!27296) Unit!41043)

(assert (=> b!1238809 (= lt!561554 (lemmaListSubSeqRefl!0 lt!561553))))

(declare-datatypes ((array!79820 0))(
  ( (array!79821 (arr!38510 (Array (_ BitVec 32) (_ BitVec 64))) (size!39047 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79820)

(assert (=> b!1238809 (= lt!561553 (Cons!27292 (select (arr!38510 a!3835) from!3213) acc!846))))

(declare-fun b!1238810 () Bool)

(declare-fun res!825888 () Bool)

(assert (=> b!1238810 (=> (not res!825888) (not e!702182))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1238810 (= res!825888 (validKeyInArray!0 (select (arr!38510 a!3835) from!3213)))))

(declare-fun b!1238811 () Bool)

(declare-fun res!825886 () Bool)

(assert (=> b!1238811 (=> (not res!825886) (not e!702182))))

(declare-fun contains!7367 (List!27296 (_ BitVec 64)) Bool)

(assert (=> b!1238811 (= res!825886 (not (contains!7367 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1238812 () Bool)

(declare-fun res!825892 () Bool)

(assert (=> b!1238812 (=> (not res!825892) (not e!702182))))

(declare-fun arrayNoDuplicates!0 (array!79820 (_ BitVec 32) List!27296) Bool)

(assert (=> b!1238812 (= res!825892 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1238813 () Bool)

(declare-fun res!825894 () Bool)

(assert (=> b!1238813 (=> (not res!825894) (not e!702182))))

(declare-fun k0!2925 () (_ BitVec 64))

(assert (=> b!1238813 (= res!825894 (contains!7367 acc!846 k0!2925))))

(declare-fun b!1238814 () Bool)

(declare-fun res!825889 () Bool)

(assert (=> b!1238814 (=> (not res!825889) (not e!702182))))

(declare-fun noDuplicate!1948 (List!27296) Bool)

(assert (=> b!1238814 (= res!825889 (noDuplicate!1948 acc!846))))

(declare-fun b!1238815 () Bool)

(declare-fun res!825893 () Bool)

(assert (=> b!1238815 (=> (not res!825893) (not e!702182))))

(assert (=> b!1238815 (= res!825893 (not (contains!7367 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1238816 () Bool)

(assert (=> b!1238816 (= e!702180 (noDuplicate!1948 lt!561553))))

(declare-fun res!825891 () Bool)

(assert (=> start!103246 (=> (not res!825891) (not e!702182))))

(assert (=> start!103246 (= res!825891 (and (bvslt (size!39047 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!39047 a!3835))))))

(assert (=> start!103246 e!702182))

(declare-fun array_inv!29448 (array!79820) Bool)

(assert (=> start!103246 (array_inv!29448 a!3835)))

(assert (=> start!103246 true))

(declare-fun b!1238817 () Bool)

(declare-fun res!825890 () Bool)

(assert (=> b!1238817 (=> (not res!825890) (not e!702182))))

(assert (=> b!1238817 (= res!825890 (not (= from!3213 (bvsub (size!39047 a!3835) #b00000000000000000000000000000001))))))

(assert (= (and start!103246 res!825891) b!1238814))

(assert (= (and b!1238814 res!825889) b!1238815))

(assert (= (and b!1238815 res!825893) b!1238811))

(assert (= (and b!1238811 res!825886) b!1238812))

(assert (= (and b!1238812 res!825892) b!1238813))

(assert (= (and b!1238813 res!825894) b!1238817))

(assert (= (and b!1238817 res!825890) b!1238810))

(assert (= (and b!1238810 res!825888) b!1238809))

(assert (= (and b!1238809 (not res!825887)) b!1238816))

(declare-fun m!1142849 () Bool)

(assert (=> b!1238816 m!1142849))

(declare-fun m!1142851 () Bool)

(assert (=> b!1238814 m!1142851))

(declare-fun m!1142853 () Bool)

(assert (=> b!1238815 m!1142853))

(declare-fun m!1142855 () Bool)

(assert (=> b!1238809 m!1142855))

(declare-fun m!1142857 () Bool)

(assert (=> b!1238809 m!1142857))

(declare-fun m!1142859 () Bool)

(assert (=> b!1238809 m!1142859))

(declare-fun m!1142861 () Bool)

(assert (=> b!1238809 m!1142861))

(declare-fun m!1142863 () Bool)

(assert (=> b!1238809 m!1142863))

(declare-fun m!1142865 () Bool)

(assert (=> b!1238812 m!1142865))

(assert (=> b!1238810 m!1142863))

(assert (=> b!1238810 m!1142863))

(declare-fun m!1142867 () Bool)

(assert (=> b!1238810 m!1142867))

(declare-fun m!1142869 () Bool)

(assert (=> b!1238811 m!1142869))

(declare-fun m!1142871 () Bool)

(assert (=> start!103246 m!1142871))

(declare-fun m!1142873 () Bool)

(assert (=> b!1238813 m!1142873))

(check-sat (not b!1238815) (not b!1238809) (not b!1238810) (not b!1238813) (not b!1238816) (not b!1238811) (not b!1238814) (not b!1238812) (not start!103246))
(check-sat)
(get-model)

(declare-fun d!136153 () Bool)

(declare-fun lt!561575 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!585 (List!27296) (InoxSet (_ BitVec 64)))

(assert (=> d!136153 (= lt!561575 (select (content!585 acc!846) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!702205 () Bool)

(assert (=> d!136153 (= lt!561575 e!702205)))

(declare-fun res!825953 () Bool)

(assert (=> d!136153 (=> (not res!825953) (not e!702205))))

(get-info :version)

(assert (=> d!136153 (= res!825953 ((_ is Cons!27292) acc!846))))

(assert (=> d!136153 (= (contains!7367 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000) lt!561575)))

(declare-fun b!1238876 () Bool)

(declare-fun e!702206 () Bool)

(assert (=> b!1238876 (= e!702205 e!702206)))

(declare-fun res!825954 () Bool)

(assert (=> b!1238876 (=> res!825954 e!702206)))

(assert (=> b!1238876 (= res!825954 (= (h!28510 acc!846) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1238877 () Bool)

(assert (=> b!1238877 (= e!702206 (contains!7367 (t!40751 acc!846) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!136153 res!825953) b!1238876))

(assert (= (and b!1238876 (not res!825954)) b!1238877))

(declare-fun m!1142927 () Bool)

(assert (=> d!136153 m!1142927))

(declare-fun m!1142929 () Bool)

(assert (=> d!136153 m!1142929))

(declare-fun m!1142931 () Bool)

(assert (=> b!1238877 m!1142931))

(assert (=> b!1238811 d!136153))

(declare-fun d!136155 () Bool)

(declare-fun res!825959 () Bool)

(declare-fun e!702211 () Bool)

(assert (=> d!136155 (=> res!825959 e!702211)))

(assert (=> d!136155 (= res!825959 ((_ is Nil!27293) lt!561553))))

(assert (=> d!136155 (= (noDuplicate!1948 lt!561553) e!702211)))

(declare-fun b!1238882 () Bool)

(declare-fun e!702212 () Bool)

(assert (=> b!1238882 (= e!702211 e!702212)))

(declare-fun res!825960 () Bool)

(assert (=> b!1238882 (=> (not res!825960) (not e!702212))))

(assert (=> b!1238882 (= res!825960 (not (contains!7367 (t!40751 lt!561553) (h!28510 lt!561553))))))

(declare-fun b!1238883 () Bool)

(assert (=> b!1238883 (= e!702212 (noDuplicate!1948 (t!40751 lt!561553)))))

(assert (= (and d!136155 (not res!825959)) b!1238882))

(assert (= (and b!1238882 res!825960) b!1238883))

(declare-fun m!1142933 () Bool)

(assert (=> b!1238882 m!1142933))

(declare-fun m!1142935 () Bool)

(assert (=> b!1238883 m!1142935))

(assert (=> b!1238816 d!136155))

(declare-fun bm!61086 () Bool)

(declare-fun call!61089 () Bool)

(declare-fun c!121331 () Bool)

(assert (=> bm!61086 (= call!61089 (arrayNoDuplicates!0 a!3835 (bvadd from!3213 #b00000000000000000000000000000001) (ite c!121331 (Cons!27292 (select (arr!38510 a!3835) from!3213) acc!846) acc!846)))))

(declare-fun b!1238906 () Bool)

(declare-fun e!702234 () Bool)

(assert (=> b!1238906 (= e!702234 (contains!7367 acc!846 (select (arr!38510 a!3835) from!3213)))))

(declare-fun d!136157 () Bool)

(declare-fun res!825981 () Bool)

(declare-fun e!702236 () Bool)

(assert (=> d!136157 (=> res!825981 e!702236)))

(assert (=> d!136157 (= res!825981 (bvsge from!3213 (size!39047 a!3835)))))

(assert (=> d!136157 (= (arrayNoDuplicates!0 a!3835 from!3213 acc!846) e!702236)))

(declare-fun b!1238907 () Bool)

(declare-fun e!702233 () Bool)

(declare-fun e!702235 () Bool)

(assert (=> b!1238907 (= e!702233 e!702235)))

(assert (=> b!1238907 (= c!121331 (validKeyInArray!0 (select (arr!38510 a!3835) from!3213)))))

(declare-fun b!1238908 () Bool)

(assert (=> b!1238908 (= e!702235 call!61089)))

(declare-fun b!1238909 () Bool)

(assert (=> b!1238909 (= e!702236 e!702233)))

(declare-fun res!825979 () Bool)

(assert (=> b!1238909 (=> (not res!825979) (not e!702233))))

(assert (=> b!1238909 (= res!825979 (not e!702234))))

(declare-fun res!825980 () Bool)

(assert (=> b!1238909 (=> (not res!825980) (not e!702234))))

(assert (=> b!1238909 (= res!825980 (validKeyInArray!0 (select (arr!38510 a!3835) from!3213)))))

(declare-fun b!1238910 () Bool)

(assert (=> b!1238910 (= e!702235 call!61089)))

(assert (= (and d!136157 (not res!825981)) b!1238909))

(assert (= (and b!1238909 res!825980) b!1238906))

(assert (= (and b!1238909 res!825979) b!1238907))

(assert (= (and b!1238907 c!121331) b!1238908))

(assert (= (and b!1238907 (not c!121331)) b!1238910))

(assert (= (or b!1238908 b!1238910) bm!61086))

(assert (=> bm!61086 m!1142863))

(declare-fun m!1142941 () Bool)

(assert (=> bm!61086 m!1142941))

(assert (=> b!1238906 m!1142863))

(assert (=> b!1238906 m!1142863))

(declare-fun m!1142943 () Bool)

(assert (=> b!1238906 m!1142943))

(assert (=> b!1238907 m!1142863))

(assert (=> b!1238907 m!1142863))

(assert (=> b!1238907 m!1142867))

(assert (=> b!1238909 m!1142863))

(assert (=> b!1238909 m!1142863))

(assert (=> b!1238909 m!1142867))

(assert (=> b!1238812 d!136157))

(declare-fun d!136163 () Bool)

(declare-fun res!825982 () Bool)

(declare-fun e!702237 () Bool)

(assert (=> d!136163 (=> res!825982 e!702237)))

(assert (=> d!136163 (= res!825982 ((_ is Nil!27293) acc!846))))

(assert (=> d!136163 (= (noDuplicate!1948 acc!846) e!702237)))

(declare-fun b!1238911 () Bool)

(declare-fun e!702238 () Bool)

(assert (=> b!1238911 (= e!702237 e!702238)))

(declare-fun res!825983 () Bool)

(assert (=> b!1238911 (=> (not res!825983) (not e!702238))))

(assert (=> b!1238911 (= res!825983 (not (contains!7367 (t!40751 acc!846) (h!28510 acc!846))))))

(declare-fun b!1238912 () Bool)

(assert (=> b!1238912 (= e!702238 (noDuplicate!1948 (t!40751 acc!846)))))

(assert (= (and d!136163 (not res!825982)) b!1238911))

(assert (= (and b!1238911 res!825983) b!1238912))

(declare-fun m!1142945 () Bool)

(assert (=> b!1238911 m!1142945))

(declare-fun m!1142947 () Bool)

(assert (=> b!1238912 m!1142947))

(assert (=> b!1238814 d!136163))

(declare-fun d!136165 () Bool)

(declare-fun lt!561576 () Bool)

(assert (=> d!136165 (= lt!561576 (select (content!585 acc!846) k0!2925))))

(declare-fun e!702239 () Bool)

(assert (=> d!136165 (= lt!561576 e!702239)))

(declare-fun res!825984 () Bool)

(assert (=> d!136165 (=> (not res!825984) (not e!702239))))

(assert (=> d!136165 (= res!825984 ((_ is Cons!27292) acc!846))))

(assert (=> d!136165 (= (contains!7367 acc!846 k0!2925) lt!561576)))

(declare-fun b!1238913 () Bool)

(declare-fun e!702240 () Bool)

(assert (=> b!1238913 (= e!702239 e!702240)))

(declare-fun res!825985 () Bool)

(assert (=> b!1238913 (=> res!825985 e!702240)))

(assert (=> b!1238913 (= res!825985 (= (h!28510 acc!846) k0!2925))))

(declare-fun b!1238914 () Bool)

(assert (=> b!1238914 (= e!702240 (contains!7367 (t!40751 acc!846) k0!2925))))

(assert (= (and d!136165 res!825984) b!1238913))

(assert (= (and b!1238913 (not res!825985)) b!1238914))

(assert (=> d!136165 m!1142927))

(declare-fun m!1142949 () Bool)

(assert (=> d!136165 m!1142949))

(declare-fun m!1142951 () Bool)

(assert (=> b!1238914 m!1142951))

(assert (=> b!1238813 d!136165))

(declare-fun d!136167 () Bool)

(assert (=> d!136167 (= (validKeyInArray!0 (select (arr!38510 a!3835) from!3213)) (and (not (= (select (arr!38510 a!3835) from!3213) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!38510 a!3835) from!3213) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1238810 d!136167))

(declare-fun d!136169 () Bool)

(declare-fun lt!561577 () Bool)

(assert (=> d!136169 (= lt!561577 (select (content!585 acc!846) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!702241 () Bool)

(assert (=> d!136169 (= lt!561577 e!702241)))

(declare-fun res!825986 () Bool)

(assert (=> d!136169 (=> (not res!825986) (not e!702241))))

(assert (=> d!136169 (= res!825986 ((_ is Cons!27292) acc!846))))

(assert (=> d!136169 (= (contains!7367 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000) lt!561577)))

(declare-fun b!1238915 () Bool)

(declare-fun e!702242 () Bool)

(assert (=> b!1238915 (= e!702241 e!702242)))

(declare-fun res!825987 () Bool)

(assert (=> b!1238915 (=> res!825987 e!702242)))

(assert (=> b!1238915 (= res!825987 (= (h!28510 acc!846) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1238916 () Bool)

(assert (=> b!1238916 (= e!702242 (contains!7367 (t!40751 acc!846) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!136169 res!825986) b!1238915))

(assert (= (and b!1238915 (not res!825987)) b!1238916))

(assert (=> d!136169 m!1142927))

(declare-fun m!1142953 () Bool)

(assert (=> d!136169 m!1142953))

(declare-fun m!1142955 () Bool)

(assert (=> b!1238916 m!1142955))

(assert (=> b!1238815 d!136169))

(declare-fun d!136171 () Bool)

(assert (=> d!136171 (= (array_inv!29448 a!3835) (bvsge (size!39047 a!3835) #b00000000000000000000000000000000))))

(assert (=> start!103246 d!136171))

(declare-fun b!1238947 () Bool)

(declare-fun e!702263 () Bool)

(declare-fun e!702265 () Bool)

(assert (=> b!1238947 (= e!702263 e!702265)))

(declare-fun res!825999 () Bool)

(assert (=> b!1238947 (=> res!825999 e!702265)))

(declare-fun e!702264 () Bool)

(assert (=> b!1238947 (= res!825999 e!702264)))

(declare-fun res!826000 () Bool)

(assert (=> b!1238947 (=> (not res!826000) (not e!702264))))

(assert (=> b!1238947 (= res!826000 (= (h!28510 acc!846) (h!28510 lt!561553)))))

(declare-fun b!1238949 () Bool)

(assert (=> b!1238949 (= e!702265 (subseq!587 acc!846 (t!40751 lt!561553)))))

(declare-fun b!1238946 () Bool)

(declare-fun e!702266 () Bool)

(assert (=> b!1238946 (= e!702266 e!702263)))

(declare-fun res!826002 () Bool)

(assert (=> b!1238946 (=> (not res!826002) (not e!702263))))

(assert (=> b!1238946 (= res!826002 ((_ is Cons!27292) lt!561553))))

(declare-fun d!136173 () Bool)

(declare-fun res!826001 () Bool)

(assert (=> d!136173 (=> res!826001 e!702266)))

(assert (=> d!136173 (= res!826001 ((_ is Nil!27293) acc!846))))

(assert (=> d!136173 (= (subseq!587 acc!846 lt!561553) e!702266)))

(declare-fun b!1238948 () Bool)

(assert (=> b!1238948 (= e!702264 (subseq!587 (t!40751 acc!846) (t!40751 lt!561553)))))

(assert (= (and d!136173 (not res!826001)) b!1238946))

(assert (= (and b!1238946 res!826002) b!1238947))

(assert (= (and b!1238947 res!826000) b!1238948))

(assert (= (and b!1238947 (not res!825999)) b!1238949))

(declare-fun m!1142957 () Bool)

(assert (=> b!1238949 m!1142957))

(declare-fun m!1142961 () Bool)

(assert (=> b!1238948 m!1142961))

(assert (=> b!1238809 d!136173))

(declare-fun b!1238990 () Bool)

(declare-fun e!702299 () Bool)

(assert (=> b!1238990 (= e!702299 (subseq!587 lt!561553 lt!561553))))

(declare-fun bm!61094 () Bool)

(declare-fun call!61097 () Unit!41043)

(declare-fun c!121350 () Bool)

(assert (=> bm!61094 (= call!61097 (subseqTail!74 (ite c!121350 lt!561553 (t!40751 lt!561553)) (t!40751 lt!561553)))))

(declare-fun b!1238991 () Bool)

(declare-fun c!121349 () Bool)

(declare-fun isEmpty!1014 (List!27296) Bool)

(assert (=> b!1238991 (= c!121349 (not (isEmpty!1014 (t!40751 lt!561553))))))

(declare-fun e!702301 () Unit!41043)

(declare-fun e!702300 () Unit!41043)

(assert (=> b!1238991 (= e!702301 e!702300)))

(declare-fun b!1238992 () Bool)

(assert (=> b!1238992 (= e!702300 call!61097)))

(declare-fun b!1238993 () Bool)

(declare-fun e!702302 () Unit!41043)

(assert (=> b!1238993 (= e!702302 e!702301)))

(assert (=> b!1238993 (= c!121350 (subseq!587 lt!561553 (t!40751 lt!561553)))))

(declare-fun b!1238994 () Bool)

(assert (=> b!1238994 (= e!702301 call!61097)))

(declare-fun d!136177 () Bool)

(declare-fun tail!162 (List!27296) List!27296)

(assert (=> d!136177 (subseq!587 (tail!162 lt!561553) lt!561553)))

(declare-fun lt!561589 () Unit!41043)

(assert (=> d!136177 (= lt!561589 e!702302)))

(declare-fun c!121351 () Bool)

(assert (=> d!136177 (= c!121351 (and ((_ is Cons!27292) lt!561553) ((_ is Cons!27292) lt!561553)))))

(assert (=> d!136177 e!702299))

(declare-fun res!826027 () Bool)

(assert (=> d!136177 (=> (not res!826027) (not e!702299))))

(assert (=> d!136177 (= res!826027 (not (isEmpty!1014 lt!561553)))))

(assert (=> d!136177 (= (subseqTail!74 lt!561553 lt!561553) lt!561589)))

(declare-fun b!1238995 () Bool)

(declare-fun Unit!41051 () Unit!41043)

(assert (=> b!1238995 (= e!702300 Unit!41051)))

(declare-fun b!1238996 () Bool)

(declare-fun Unit!41052 () Unit!41043)

(assert (=> b!1238996 (= e!702302 Unit!41052)))

(assert (= (and d!136177 res!826027) b!1238990))

(assert (= (and d!136177 c!121351) b!1238993))

(assert (= (and d!136177 (not c!121351)) b!1238996))

(assert (= (and b!1238993 c!121350) b!1238994))

(assert (= (and b!1238993 (not c!121350)) b!1238991))

(assert (= (and b!1238991 c!121349) b!1238992))

(assert (= (and b!1238991 (not c!121349)) b!1238995))

(assert (= (or b!1238994 b!1238992) bm!61094))

(declare-fun m!1142987 () Bool)

(assert (=> b!1238993 m!1142987))

(assert (=> b!1238990 m!1142861))

(declare-fun m!1142989 () Bool)

(assert (=> b!1238991 m!1142989))

(declare-fun m!1142991 () Bool)

(assert (=> bm!61094 m!1142991))

(declare-fun m!1142993 () Bool)

(assert (=> d!136177 m!1142993))

(assert (=> d!136177 m!1142993))

(declare-fun m!1142995 () Bool)

(assert (=> d!136177 m!1142995))

(declare-fun m!1142997 () Bool)

(assert (=> d!136177 m!1142997))

(assert (=> b!1238809 d!136177))

(declare-fun b!1238998 () Bool)

(declare-fun e!702303 () Bool)

(declare-fun e!702305 () Bool)

(assert (=> b!1238998 (= e!702303 e!702305)))

(declare-fun res!826028 () Bool)

(assert (=> b!1238998 (=> res!826028 e!702305)))

(declare-fun e!702304 () Bool)

(assert (=> b!1238998 (= res!826028 e!702304)))

(declare-fun res!826029 () Bool)

(assert (=> b!1238998 (=> (not res!826029) (not e!702304))))

(assert (=> b!1238998 (= res!826029 (= (h!28510 lt!561553) (h!28510 lt!561553)))))

(declare-fun b!1239000 () Bool)

(assert (=> b!1239000 (= e!702305 (subseq!587 lt!561553 (t!40751 lt!561553)))))

(declare-fun b!1238997 () Bool)

(declare-fun e!702306 () Bool)

(assert (=> b!1238997 (= e!702306 e!702303)))

(declare-fun res!826031 () Bool)

(assert (=> b!1238997 (=> (not res!826031) (not e!702303))))

(assert (=> b!1238997 (= res!826031 ((_ is Cons!27292) lt!561553))))

(declare-fun d!136189 () Bool)

(declare-fun res!826030 () Bool)

(assert (=> d!136189 (=> res!826030 e!702306)))

(assert (=> d!136189 (= res!826030 ((_ is Nil!27293) lt!561553))))

(assert (=> d!136189 (= (subseq!587 lt!561553 lt!561553) e!702306)))

(declare-fun b!1238999 () Bool)

(assert (=> b!1238999 (= e!702304 (subseq!587 (t!40751 lt!561553) (t!40751 lt!561553)))))

(assert (= (and d!136189 (not res!826030)) b!1238997))

(assert (= (and b!1238997 res!826031) b!1238998))

(assert (= (and b!1238998 res!826029) b!1238999))

(assert (= (and b!1238998 (not res!826028)) b!1239000))

(assert (=> b!1239000 m!1142987))

(declare-fun m!1142999 () Bool)

(assert (=> b!1238999 m!1142999))

(assert (=> b!1238809 d!136189))

(declare-fun d!136191 () Bool)

(assert (=> d!136191 (subseq!587 lt!561553 lt!561553)))

(declare-fun lt!561592 () Unit!41043)

(declare-fun choose!36 (List!27296) Unit!41043)

(assert (=> d!136191 (= lt!561592 (choose!36 lt!561553))))

(assert (=> d!136191 (= (lemmaListSubSeqRefl!0 lt!561553) lt!561592)))

(declare-fun bs!34821 () Bool)

(assert (= bs!34821 d!136191))

(assert (=> bs!34821 m!1142861))

(declare-fun m!1143001 () Bool)

(assert (=> bs!34821 m!1143001))

(assert (=> b!1238809 d!136191))

(check-sat (not b!1238906) (not b!1238911) (not b!1238914) (not d!136169) (not b!1238993) (not b!1238912) (not b!1238999) (not bm!61094) (not d!136153) (not b!1238882) (not b!1238909) (not bm!61086) (not b!1238948) (not b!1238883) (not b!1238916) (not d!136165) (not d!136191) (not b!1238991) (not d!136177) (not b!1238990) (not b!1238907) (not b!1238877) (not b!1238949) (not b!1239000))
(check-sat)
