; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101874 () Bool)

(assert start!101874)

(declare-fun b!1226918 () Bool)

(declare-fun res!815566 () Bool)

(declare-fun e!696692 () Bool)

(assert (=> b!1226918 (=> (not res!815566) (not e!696692))))

(declare-datatypes ((array!79213 0))(
  ( (array!79214 (arr!38232 (Array (_ BitVec 32) (_ BitVec 64))) (size!38768 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79213)

(declare-datatypes ((List!27005 0))(
  ( (Nil!27002) (Cons!27001 (h!28210 (_ BitVec 64)) (t!40468 List!27005)) )
))
(declare-fun acc!823 () List!27005)

(declare-fun from!3184 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!79213 (_ BitVec 32) List!27005) Bool)

(assert (=> b!1226918 (= res!815566 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1226919 () Bool)

(declare-fun res!815573 () Bool)

(assert (=> b!1226919 (=> (not res!815573) (not e!696692))))

(declare-fun k0!2913 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1226919 (= res!815573 (validKeyInArray!0 k0!2913))))

(declare-fun b!1226920 () Bool)

(declare-fun res!815567 () Bool)

(assert (=> b!1226920 (=> (not res!815567) (not e!696692))))

(assert (=> b!1226920 (= res!815567 (validKeyInArray!0 (select (arr!38232 a!3806) from!3184)))))

(declare-fun b!1226921 () Bool)

(declare-fun res!815569 () Bool)

(assert (=> b!1226921 (=> (not res!815569) (not e!696692))))

(declare-fun noDuplicate!1664 (List!27005) Bool)

(assert (=> b!1226921 (= res!815569 (noDuplicate!1664 acc!823))))

(declare-fun b!1226922 () Bool)

(declare-fun res!815568 () Bool)

(assert (=> b!1226922 (=> (not res!815568) (not e!696692))))

(declare-fun arrayContainsKey!0 (array!79213 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1226922 (= res!815568 (arrayContainsKey!0 a!3806 k0!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1226923 () Bool)

(declare-fun res!815571 () Bool)

(assert (=> b!1226923 (=> (not res!815571) (not e!696692))))

(assert (=> b!1226923 (= res!815571 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38768 a!3806)) (bvslt from!3184 (size!38768 a!3806))))))

(declare-fun b!1226924 () Bool)

(declare-fun res!815574 () Bool)

(assert (=> b!1226924 (=> (not res!815574) (not e!696692))))

(declare-fun contains!7067 (List!27005 (_ BitVec 64)) Bool)

(assert (=> b!1226924 (= res!815574 (not (contains!7067 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1226925 () Bool)

(declare-fun res!815570 () Bool)

(assert (=> b!1226925 (=> (not res!815570) (not e!696692))))

(assert (=> b!1226925 (= res!815570 (not (contains!7067 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1226926 () Bool)

(assert (=> b!1226926 (= e!696692 (not (noDuplicate!1664 (Cons!27001 (select (arr!38232 a!3806) from!3184) acc!823))))))

(declare-fun res!815565 () Bool)

(assert (=> start!101874 (=> (not res!815565) (not e!696692))))

(assert (=> start!101874 (= res!815565 (bvslt (size!38768 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!101874 e!696692))

(declare-fun array_inv!29080 (array!79213) Bool)

(assert (=> start!101874 (array_inv!29080 a!3806)))

(assert (=> start!101874 true))

(declare-fun b!1226917 () Bool)

(declare-fun res!815572 () Bool)

(assert (=> b!1226917 (=> (not res!815572) (not e!696692))))

(assert (=> b!1226917 (= res!815572 (bvsge (bvadd #b00000000000000000000000000000001 from!3184) #b00000000000000000000000000000000))))

(assert (= (and start!101874 res!815565) b!1226919))

(assert (= (and b!1226919 res!815573) b!1226923))

(assert (= (and b!1226923 res!815571) b!1226921))

(assert (= (and b!1226921 res!815569) b!1226925))

(assert (= (and b!1226925 res!815570) b!1226924))

(assert (= (and b!1226924 res!815574) b!1226922))

(assert (= (and b!1226922 res!815568) b!1226918))

(assert (= (and b!1226918 res!815566) b!1226920))

(assert (= (and b!1226920 res!815567) b!1226917))

(assert (= (and b!1226917 res!815572) b!1226926))

(declare-fun m!1131845 () Bool)

(assert (=> b!1226925 m!1131845))

(declare-fun m!1131847 () Bool)

(assert (=> b!1226920 m!1131847))

(assert (=> b!1226920 m!1131847))

(declare-fun m!1131849 () Bool)

(assert (=> b!1226920 m!1131849))

(declare-fun m!1131851 () Bool)

(assert (=> b!1226924 m!1131851))

(declare-fun m!1131853 () Bool)

(assert (=> b!1226918 m!1131853))

(declare-fun m!1131855 () Bool)

(assert (=> b!1226919 m!1131855))

(declare-fun m!1131857 () Bool)

(assert (=> b!1226922 m!1131857))

(assert (=> b!1226926 m!1131847))

(declare-fun m!1131859 () Bool)

(assert (=> b!1226926 m!1131859))

(declare-fun m!1131861 () Bool)

(assert (=> b!1226921 m!1131861))

(declare-fun m!1131863 () Bool)

(assert (=> start!101874 m!1131863))

(check-sat (not b!1226922) (not b!1226920) (not b!1226918) (not b!1226925) (not b!1226919) (not b!1226926) (not start!101874) (not b!1226924) (not b!1226921))
(check-sat)
(get-model)

(declare-fun d!134059 () Bool)

(assert (=> d!134059 (= (array_inv!29080 a!3806) (bvsge (size!38768 a!3806) #b00000000000000000000000000000000))))

(assert (=> start!101874 d!134059))

(declare-fun d!134061 () Bool)

(declare-fun lt!558867 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!547 (List!27005) (InoxSet (_ BitVec 64)))

(assert (=> d!134061 (= lt!558867 (select (content!547 acc!823) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!696704 () Bool)

(assert (=> d!134061 (= lt!558867 e!696704)))

(declare-fun res!815610 () Bool)

(assert (=> d!134061 (=> (not res!815610) (not e!696704))))

(get-info :version)

(assert (=> d!134061 (= res!815610 ((_ is Cons!27001) acc!823))))

(assert (=> d!134061 (= (contains!7067 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000) lt!558867)))

(declare-fun b!1226961 () Bool)

(declare-fun e!696703 () Bool)

(assert (=> b!1226961 (= e!696704 e!696703)))

(declare-fun res!815609 () Bool)

(assert (=> b!1226961 (=> res!815609 e!696703)))

(assert (=> b!1226961 (= res!815609 (= (h!28210 acc!823) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1226962 () Bool)

(assert (=> b!1226962 (= e!696703 (contains!7067 (t!40468 acc!823) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!134061 res!815610) b!1226961))

(assert (= (and b!1226961 (not res!815609)) b!1226962))

(declare-fun m!1131885 () Bool)

(assert (=> d!134061 m!1131885))

(declare-fun m!1131887 () Bool)

(assert (=> d!134061 m!1131887))

(declare-fun m!1131889 () Bool)

(assert (=> b!1226962 m!1131889))

(assert (=> b!1226924 d!134061))

(declare-fun d!134063 () Bool)

(assert (=> d!134063 (= (validKeyInArray!0 k0!2913) (and (not (= k0!2913 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2913 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1226919 d!134063))

(declare-fun b!1226977 () Bool)

(declare-fun e!696717 () Bool)

(declare-fun call!60793 () Bool)

(assert (=> b!1226977 (= e!696717 call!60793)))

(declare-fun e!696719 () Bool)

(declare-fun b!1226978 () Bool)

(assert (=> b!1226978 (= e!696719 (contains!7067 acc!823 (select (arr!38232 a!3806) from!3184)))))

(declare-fun b!1226979 () Bool)

(declare-fun e!696720 () Bool)

(declare-fun e!696718 () Bool)

(assert (=> b!1226979 (= e!696720 e!696718)))

(declare-fun res!815622 () Bool)

(assert (=> b!1226979 (=> (not res!815622) (not e!696718))))

(assert (=> b!1226979 (= res!815622 (not e!696719))))

(declare-fun res!815623 () Bool)

(assert (=> b!1226979 (=> (not res!815623) (not e!696719))))

(assert (=> b!1226979 (= res!815623 (validKeyInArray!0 (select (arr!38232 a!3806) from!3184)))))

(declare-fun b!1226980 () Bool)

(assert (=> b!1226980 (= e!696718 e!696717)))

(declare-fun c!120538 () Bool)

(assert (=> b!1226980 (= c!120538 (validKeyInArray!0 (select (arr!38232 a!3806) from!3184)))))

(declare-fun d!134065 () Bool)

(declare-fun res!815621 () Bool)

(assert (=> d!134065 (=> res!815621 e!696720)))

(assert (=> d!134065 (= res!815621 (bvsge from!3184 (size!38768 a!3806)))))

(assert (=> d!134065 (= (arrayNoDuplicates!0 a!3806 from!3184 acc!823) e!696720)))

(declare-fun bm!60790 () Bool)

(assert (=> bm!60790 (= call!60793 (arrayNoDuplicates!0 a!3806 (bvadd from!3184 #b00000000000000000000000000000001) (ite c!120538 (Cons!27001 (select (arr!38232 a!3806) from!3184) acc!823) acc!823)))))

(declare-fun b!1226981 () Bool)

(assert (=> b!1226981 (= e!696717 call!60793)))

(assert (= (and d!134065 (not res!815621)) b!1226979))

(assert (= (and b!1226979 res!815623) b!1226978))

(assert (= (and b!1226979 res!815622) b!1226980))

(assert (= (and b!1226980 c!120538) b!1226981))

(assert (= (and b!1226980 (not c!120538)) b!1226977))

(assert (= (or b!1226981 b!1226977) bm!60790))

(assert (=> b!1226978 m!1131847))

(assert (=> b!1226978 m!1131847))

(declare-fun m!1131897 () Bool)

(assert (=> b!1226978 m!1131897))

(assert (=> b!1226979 m!1131847))

(assert (=> b!1226979 m!1131847))

(assert (=> b!1226979 m!1131849))

(assert (=> b!1226980 m!1131847))

(assert (=> b!1226980 m!1131847))

(assert (=> b!1226980 m!1131849))

(assert (=> bm!60790 m!1131847))

(declare-fun m!1131899 () Bool)

(assert (=> bm!60790 m!1131899))

(assert (=> b!1226918 d!134065))

(declare-fun d!134075 () Bool)

(declare-fun res!815644 () Bool)

(declare-fun e!696743 () Bool)

(assert (=> d!134075 (=> res!815644 e!696743)))

(assert (=> d!134075 (= res!815644 (= (select (arr!38232 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) k0!2913))))

(assert (=> d!134075 (= (arrayContainsKey!0 a!3806 k0!2913 (bvadd #b00000000000000000000000000000001 from!3184)) e!696743)))

(declare-fun b!1227006 () Bool)

(declare-fun e!696744 () Bool)

(assert (=> b!1227006 (= e!696743 e!696744)))

(declare-fun res!815645 () Bool)

(assert (=> b!1227006 (=> (not res!815645) (not e!696744))))

(assert (=> b!1227006 (= res!815645 (bvslt (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001) (size!38768 a!3806)))))

(declare-fun b!1227007 () Bool)

(assert (=> b!1227007 (= e!696744 (arrayContainsKey!0 a!3806 k0!2913 (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001)))))

(assert (= (and d!134075 (not res!815644)) b!1227006))

(assert (= (and b!1227006 res!815645) b!1227007))

(declare-fun m!1131909 () Bool)

(assert (=> d!134075 m!1131909))

(declare-fun m!1131911 () Bool)

(assert (=> b!1227007 m!1131911))

(assert (=> b!1226922 d!134075))

(declare-fun d!134081 () Bool)

(declare-fun res!815659 () Bool)

(declare-fun e!696759 () Bool)

(assert (=> d!134081 (=> res!815659 e!696759)))

(assert (=> d!134081 (= res!815659 ((_ is Nil!27002) (Cons!27001 (select (arr!38232 a!3806) from!3184) acc!823)))))

(assert (=> d!134081 (= (noDuplicate!1664 (Cons!27001 (select (arr!38232 a!3806) from!3184) acc!823)) e!696759)))

(declare-fun b!1227023 () Bool)

(declare-fun e!696760 () Bool)

(assert (=> b!1227023 (= e!696759 e!696760)))

(declare-fun res!815660 () Bool)

(assert (=> b!1227023 (=> (not res!815660) (not e!696760))))

(assert (=> b!1227023 (= res!815660 (not (contains!7067 (t!40468 (Cons!27001 (select (arr!38232 a!3806) from!3184) acc!823)) (h!28210 (Cons!27001 (select (arr!38232 a!3806) from!3184) acc!823)))))))

(declare-fun b!1227024 () Bool)

(assert (=> b!1227024 (= e!696760 (noDuplicate!1664 (t!40468 (Cons!27001 (select (arr!38232 a!3806) from!3184) acc!823))))))

(assert (= (and d!134081 (not res!815659)) b!1227023))

(assert (= (and b!1227023 res!815660) b!1227024))

(declare-fun m!1131921 () Bool)

(assert (=> b!1227023 m!1131921))

(declare-fun m!1131923 () Bool)

(assert (=> b!1227024 m!1131923))

(assert (=> b!1226926 d!134081))

(declare-fun d!134091 () Bool)

(declare-fun res!815661 () Bool)

(declare-fun e!696761 () Bool)

(assert (=> d!134091 (=> res!815661 e!696761)))

(assert (=> d!134091 (= res!815661 ((_ is Nil!27002) acc!823))))

(assert (=> d!134091 (= (noDuplicate!1664 acc!823) e!696761)))

(declare-fun b!1227025 () Bool)

(declare-fun e!696762 () Bool)

(assert (=> b!1227025 (= e!696761 e!696762)))

(declare-fun res!815662 () Bool)

(assert (=> b!1227025 (=> (not res!815662) (not e!696762))))

(assert (=> b!1227025 (= res!815662 (not (contains!7067 (t!40468 acc!823) (h!28210 acc!823))))))

(declare-fun b!1227026 () Bool)

(assert (=> b!1227026 (= e!696762 (noDuplicate!1664 (t!40468 acc!823)))))

(assert (= (and d!134091 (not res!815661)) b!1227025))

(assert (= (and b!1227025 res!815662) b!1227026))

(declare-fun m!1131925 () Bool)

(assert (=> b!1227025 m!1131925))

(declare-fun m!1131927 () Bool)

(assert (=> b!1227026 m!1131927))

(assert (=> b!1226921 d!134091))

(declare-fun d!134093 () Bool)

(assert (=> d!134093 (= (validKeyInArray!0 (select (arr!38232 a!3806) from!3184)) (and (not (= (select (arr!38232 a!3806) from!3184) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!38232 a!3806) from!3184) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1226920 d!134093))

(declare-fun d!134095 () Bool)

(declare-fun lt!558871 () Bool)

(assert (=> d!134095 (= lt!558871 (select (content!547 acc!823) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!696768 () Bool)

(assert (=> d!134095 (= lt!558871 e!696768)))

(declare-fun res!815668 () Bool)

(assert (=> d!134095 (=> (not res!815668) (not e!696768))))

(assert (=> d!134095 (= res!815668 ((_ is Cons!27001) acc!823))))

(assert (=> d!134095 (= (contains!7067 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000) lt!558871)))

(declare-fun b!1227031 () Bool)

(declare-fun e!696767 () Bool)

(assert (=> b!1227031 (= e!696768 e!696767)))

(declare-fun res!815667 () Bool)

(assert (=> b!1227031 (=> res!815667 e!696767)))

(assert (=> b!1227031 (= res!815667 (= (h!28210 acc!823) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1227032 () Bool)

(assert (=> b!1227032 (= e!696767 (contains!7067 (t!40468 acc!823) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!134095 res!815668) b!1227031))

(assert (= (and b!1227031 (not res!815667)) b!1227032))

(assert (=> d!134095 m!1131885))

(declare-fun m!1131929 () Bool)

(assert (=> d!134095 m!1131929))

(declare-fun m!1131931 () Bool)

(assert (=> b!1227032 m!1131931))

(assert (=> b!1226925 d!134095))

(check-sat (not b!1227032) (not b!1227026) (not bm!60790) (not b!1226978) (not b!1226962) (not d!134095) (not b!1227024) (not b!1226980) (not d!134061) (not b!1226979) (not b!1227007) (not b!1227023) (not b!1227025))
(check-sat)
