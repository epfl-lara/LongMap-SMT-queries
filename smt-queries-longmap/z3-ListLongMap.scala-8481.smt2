; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103360 () Bool)

(assert start!103360)

(declare-fun e!702655 () Bool)

(declare-fun b!1239822 () Bool)

(declare-fun k0!2925 () (_ BitVec 64))

(declare-datatypes ((array!79804 0))(
  ( (array!79805 (arr!38501 (Array (_ BitVec 32) (_ BitVec 64))) (size!39039 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79804)

(declare-fun from!3213 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!79804 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1239822 (= e!702655 (arrayContainsKey!0 a!3835 k0!2925 from!3213))))

(declare-fun b!1239823 () Bool)

(declare-fun res!827186 () Bool)

(assert (=> b!1239823 (=> (not res!827186) (not e!702655))))

(declare-datatypes ((List!27375 0))(
  ( (Nil!27372) (Cons!27371 (h!28580 (_ BitVec 64)) (t!40829 List!27375)) )
))
(declare-fun acc!846 () List!27375)

(declare-fun contains!7347 (List!27375 (_ BitVec 64)) Bool)

(assert (=> b!1239823 (= res!827186 (not (contains!7347 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1239824 () Bool)

(declare-fun res!827187 () Bool)

(assert (=> b!1239824 (=> (not res!827187) (not e!702655))))

(declare-fun noDuplicate!1990 (List!27375) Bool)

(assert (=> b!1239824 (= res!827187 (noDuplicate!1990 acc!846))))

(declare-fun b!1239825 () Bool)

(declare-fun res!827192 () Bool)

(assert (=> b!1239825 (=> (not res!827192) (not e!702655))))

(assert (=> b!1239825 (= res!827192 (= from!3213 (bvsub (size!39039 a!3835) #b00000000000000000000000000000001)))))

(declare-fun b!1239826 () Bool)

(declare-fun res!827191 () Bool)

(assert (=> b!1239826 (=> (not res!827191) (not e!702655))))

(assert (=> b!1239826 (= res!827191 (contains!7347 acc!846 k0!2925))))

(declare-fun b!1239827 () Bool)

(declare-fun res!827188 () Bool)

(assert (=> b!1239827 (=> (not res!827188) (not e!702655))))

(assert (=> b!1239827 (= res!827188 (not (contains!7347 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1239828 () Bool)

(declare-fun res!827189 () Bool)

(assert (=> b!1239828 (=> (not res!827189) (not e!702655))))

(declare-fun arrayNoDuplicates!0 (array!79804 (_ BitVec 32) List!27375) Bool)

(assert (=> b!1239828 (= res!827189 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun res!827190 () Bool)

(assert (=> start!103360 (=> (not res!827190) (not e!702655))))

(assert (=> start!103360 (= res!827190 (and (bvslt (size!39039 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!39039 a!3835))))))

(assert (=> start!103360 e!702655))

(declare-fun array_inv!29484 (array!79804) Bool)

(assert (=> start!103360 (array_inv!29484 a!3835)))

(assert (=> start!103360 true))

(assert (= (and start!103360 res!827190) b!1239824))

(assert (= (and b!1239824 res!827187) b!1239823))

(assert (= (and b!1239823 res!827186) b!1239827))

(assert (= (and b!1239827 res!827188) b!1239828))

(assert (= (and b!1239828 res!827189) b!1239826))

(assert (= (and b!1239826 res!827191) b!1239825))

(assert (= (and b!1239825 res!827192) b!1239822))

(declare-fun m!1142763 () Bool)

(assert (=> b!1239826 m!1142763))

(declare-fun m!1142765 () Bool)

(assert (=> b!1239822 m!1142765))

(declare-fun m!1142767 () Bool)

(assert (=> b!1239827 m!1142767))

(declare-fun m!1142769 () Bool)

(assert (=> b!1239824 m!1142769))

(declare-fun m!1142771 () Bool)

(assert (=> b!1239828 m!1142771))

(declare-fun m!1142773 () Bool)

(assert (=> b!1239823 m!1142773))

(declare-fun m!1142775 () Bool)

(assert (=> start!103360 m!1142775))

(check-sat (not b!1239826) (not b!1239828) (not b!1239827) (not start!103360) (not b!1239823) (not b!1239824) (not b!1239822))
(check-sat)
(get-model)

(declare-fun d!136025 () Bool)

(assert (=> d!136025 (= (array_inv!29484 a!3835) (bvsge (size!39039 a!3835) #b00000000000000000000000000000000))))

(assert (=> start!103360 d!136025))

(declare-fun b!1239881 () Bool)

(declare-fun e!702677 () Bool)

(declare-fun e!702678 () Bool)

(assert (=> b!1239881 (= e!702677 e!702678)))

(declare-fun res!827242 () Bool)

(assert (=> b!1239881 (=> (not res!827242) (not e!702678))))

(declare-fun e!702679 () Bool)

(assert (=> b!1239881 (= res!827242 (not e!702679))))

(declare-fun res!827241 () Bool)

(assert (=> b!1239881 (=> (not res!827241) (not e!702679))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1239881 (= res!827241 (validKeyInArray!0 (select (arr!38501 a!3835) from!3213)))))

(declare-fun bm!61098 () Bool)

(declare-fun c!121183 () Bool)

(declare-fun call!61101 () Bool)

(assert (=> bm!61098 (= call!61101 (arrayNoDuplicates!0 a!3835 (bvadd from!3213 #b00000000000000000000000000000001) (ite c!121183 (Cons!27371 (select (arr!38501 a!3835) from!3213) acc!846) acc!846)))))

(declare-fun b!1239883 () Bool)

(declare-fun e!702680 () Bool)

(assert (=> b!1239883 (= e!702680 call!61101)))

(declare-fun b!1239884 () Bool)

(assert (=> b!1239884 (= e!702679 (contains!7347 acc!846 (select (arr!38501 a!3835) from!3213)))))

(declare-fun b!1239885 () Bool)

(assert (=> b!1239885 (= e!702680 call!61101)))

(declare-fun b!1239882 () Bool)

(assert (=> b!1239882 (= e!702678 e!702680)))

(assert (=> b!1239882 (= c!121183 (validKeyInArray!0 (select (arr!38501 a!3835) from!3213)))))

(declare-fun d!136027 () Bool)

(declare-fun res!827243 () Bool)

(assert (=> d!136027 (=> res!827243 e!702677)))

(assert (=> d!136027 (= res!827243 (bvsge from!3213 (size!39039 a!3835)))))

(assert (=> d!136027 (= (arrayNoDuplicates!0 a!3835 from!3213 acc!846) e!702677)))

(assert (= (and d!136027 (not res!827243)) b!1239881))

(assert (= (and b!1239881 res!827241) b!1239884))

(assert (= (and b!1239881 res!827242) b!1239882))

(assert (= (and b!1239882 c!121183) b!1239885))

(assert (= (and b!1239882 (not c!121183)) b!1239883))

(assert (= (or b!1239885 b!1239883) bm!61098))

(declare-fun m!1142805 () Bool)

(assert (=> b!1239881 m!1142805))

(assert (=> b!1239881 m!1142805))

(declare-fun m!1142807 () Bool)

(assert (=> b!1239881 m!1142807))

(assert (=> bm!61098 m!1142805))

(declare-fun m!1142809 () Bool)

(assert (=> bm!61098 m!1142809))

(assert (=> b!1239884 m!1142805))

(assert (=> b!1239884 m!1142805))

(declare-fun m!1142811 () Bool)

(assert (=> b!1239884 m!1142811))

(assert (=> b!1239882 m!1142805))

(assert (=> b!1239882 m!1142805))

(assert (=> b!1239882 m!1142807))

(assert (=> b!1239828 d!136027))

(declare-fun d!136029 () Bool)

(declare-fun lt!561686 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!598 (List!27375) (InoxSet (_ BitVec 64)))

(assert (=> d!136029 (= lt!561686 (select (content!598 acc!846) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!702685 () Bool)

(assert (=> d!136029 (= lt!561686 e!702685)))

(declare-fun res!827248 () Bool)

(assert (=> d!136029 (=> (not res!827248) (not e!702685))))

(get-info :version)

(assert (=> d!136029 (= res!827248 ((_ is Cons!27371) acc!846))))

(assert (=> d!136029 (= (contains!7347 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000) lt!561686)))

(declare-fun b!1239890 () Bool)

(declare-fun e!702686 () Bool)

(assert (=> b!1239890 (= e!702685 e!702686)))

(declare-fun res!827249 () Bool)

(assert (=> b!1239890 (=> res!827249 e!702686)))

(assert (=> b!1239890 (= res!827249 (= (h!28580 acc!846) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1239891 () Bool)

(assert (=> b!1239891 (= e!702686 (contains!7347 (t!40829 acc!846) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!136029 res!827248) b!1239890))

(assert (= (and b!1239890 (not res!827249)) b!1239891))

(declare-fun m!1142813 () Bool)

(assert (=> d!136029 m!1142813))

(declare-fun m!1142815 () Bool)

(assert (=> d!136029 m!1142815))

(declare-fun m!1142817 () Bool)

(assert (=> b!1239891 m!1142817))

(assert (=> b!1239827 d!136029))

(declare-fun d!136031 () Bool)

(declare-fun res!827258 () Bool)

(declare-fun e!702695 () Bool)

(assert (=> d!136031 (=> res!827258 e!702695)))

(assert (=> d!136031 (= res!827258 (= (select (arr!38501 a!3835) from!3213) k0!2925))))

(assert (=> d!136031 (= (arrayContainsKey!0 a!3835 k0!2925 from!3213) e!702695)))

(declare-fun b!1239900 () Bool)

(declare-fun e!702696 () Bool)

(assert (=> b!1239900 (= e!702695 e!702696)))

(declare-fun res!827259 () Bool)

(assert (=> b!1239900 (=> (not res!827259) (not e!702696))))

(assert (=> b!1239900 (= res!827259 (bvslt (bvadd from!3213 #b00000000000000000000000000000001) (size!39039 a!3835)))))

(declare-fun b!1239901 () Bool)

(assert (=> b!1239901 (= e!702696 (arrayContainsKey!0 a!3835 k0!2925 (bvadd from!3213 #b00000000000000000000000000000001)))))

(assert (= (and d!136031 (not res!827258)) b!1239900))

(assert (= (and b!1239900 res!827259) b!1239901))

(assert (=> d!136031 m!1142805))

(declare-fun m!1142819 () Bool)

(assert (=> b!1239901 m!1142819))

(assert (=> b!1239822 d!136031))

(declare-fun d!136037 () Bool)

(declare-fun lt!561687 () Bool)

(assert (=> d!136037 (= lt!561687 (select (content!598 acc!846) k0!2925))))

(declare-fun e!702697 () Bool)

(assert (=> d!136037 (= lt!561687 e!702697)))

(declare-fun res!827260 () Bool)

(assert (=> d!136037 (=> (not res!827260) (not e!702697))))

(assert (=> d!136037 (= res!827260 ((_ is Cons!27371) acc!846))))

(assert (=> d!136037 (= (contains!7347 acc!846 k0!2925) lt!561687)))

(declare-fun b!1239902 () Bool)

(declare-fun e!702698 () Bool)

(assert (=> b!1239902 (= e!702697 e!702698)))

(declare-fun res!827261 () Bool)

(assert (=> b!1239902 (=> res!827261 e!702698)))

(assert (=> b!1239902 (= res!827261 (= (h!28580 acc!846) k0!2925))))

(declare-fun b!1239903 () Bool)

(assert (=> b!1239903 (= e!702698 (contains!7347 (t!40829 acc!846) k0!2925))))

(assert (= (and d!136037 res!827260) b!1239902))

(assert (= (and b!1239902 (not res!827261)) b!1239903))

(assert (=> d!136037 m!1142813))

(declare-fun m!1142821 () Bool)

(assert (=> d!136037 m!1142821))

(declare-fun m!1142823 () Bool)

(assert (=> b!1239903 m!1142823))

(assert (=> b!1239826 d!136037))

(declare-fun d!136039 () Bool)

(declare-fun res!827274 () Bool)

(declare-fun e!702713 () Bool)

(assert (=> d!136039 (=> res!827274 e!702713)))

(assert (=> d!136039 (= res!827274 ((_ is Nil!27372) acc!846))))

(assert (=> d!136039 (= (noDuplicate!1990 acc!846) e!702713)))

(declare-fun b!1239920 () Bool)

(declare-fun e!702714 () Bool)

(assert (=> b!1239920 (= e!702713 e!702714)))

(declare-fun res!827275 () Bool)

(assert (=> b!1239920 (=> (not res!827275) (not e!702714))))

(assert (=> b!1239920 (= res!827275 (not (contains!7347 (t!40829 acc!846) (h!28580 acc!846))))))

(declare-fun b!1239921 () Bool)

(assert (=> b!1239921 (= e!702714 (noDuplicate!1990 (t!40829 acc!846)))))

(assert (= (and d!136039 (not res!827274)) b!1239920))

(assert (= (and b!1239920 res!827275) b!1239921))

(declare-fun m!1142829 () Bool)

(assert (=> b!1239920 m!1142829))

(declare-fun m!1142831 () Bool)

(assert (=> b!1239921 m!1142831))

(assert (=> b!1239824 d!136039))

(declare-fun d!136043 () Bool)

(declare-fun lt!561688 () Bool)

(assert (=> d!136043 (= lt!561688 (select (content!598 acc!846) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!702715 () Bool)

(assert (=> d!136043 (= lt!561688 e!702715)))

(declare-fun res!827276 () Bool)

(assert (=> d!136043 (=> (not res!827276) (not e!702715))))

(assert (=> d!136043 (= res!827276 ((_ is Cons!27371) acc!846))))

(assert (=> d!136043 (= (contains!7347 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000) lt!561688)))

(declare-fun b!1239922 () Bool)

(declare-fun e!702716 () Bool)

(assert (=> b!1239922 (= e!702715 e!702716)))

(declare-fun res!827277 () Bool)

(assert (=> b!1239922 (=> res!827277 e!702716)))

(assert (=> b!1239922 (= res!827277 (= (h!28580 acc!846) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1239923 () Bool)

(assert (=> b!1239923 (= e!702716 (contains!7347 (t!40829 acc!846) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!136043 res!827276) b!1239922))

(assert (= (and b!1239922 (not res!827277)) b!1239923))

(assert (=> d!136043 m!1142813))

(declare-fun m!1142833 () Bool)

(assert (=> d!136043 m!1142833))

(declare-fun m!1142835 () Bool)

(assert (=> b!1239923 m!1142835))

(assert (=> b!1239823 d!136043))

(check-sat (not b!1239920) (not b!1239901) (not b!1239921) (not b!1239882) (not d!136037) (not b!1239923) (not d!136029) (not d!136043) (not b!1239881) (not b!1239891) (not bm!61098) (not b!1239903) (not b!1239884))
(check-sat)
(get-model)

(declare-fun d!136067 () Bool)

(declare-fun lt!561699 () Bool)

(assert (=> d!136067 (= lt!561699 (select (content!598 (t!40829 acc!846)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!702771 () Bool)

(assert (=> d!136067 (= lt!561699 e!702771)))

(declare-fun res!827328 () Bool)

(assert (=> d!136067 (=> (not res!827328) (not e!702771))))

(assert (=> d!136067 (= res!827328 ((_ is Cons!27371) (t!40829 acc!846)))))

(assert (=> d!136067 (= (contains!7347 (t!40829 acc!846) #b0000000000000000000000000000000000000000000000000000000000000000) lt!561699)))

(declare-fun b!1239982 () Bool)

(declare-fun e!702772 () Bool)

(assert (=> b!1239982 (= e!702771 e!702772)))

(declare-fun res!827329 () Bool)

(assert (=> b!1239982 (=> res!827329 e!702772)))

(assert (=> b!1239982 (= res!827329 (= (h!28580 (t!40829 acc!846)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1239983 () Bool)

(assert (=> b!1239983 (= e!702772 (contains!7347 (t!40829 (t!40829 acc!846)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!136067 res!827328) b!1239982))

(assert (= (and b!1239982 (not res!827329)) b!1239983))

(declare-fun m!1142889 () Bool)

(assert (=> d!136067 m!1142889))

(declare-fun m!1142891 () Bool)

(assert (=> d!136067 m!1142891))

(declare-fun m!1142893 () Bool)

(assert (=> b!1239983 m!1142893))

(assert (=> b!1239923 d!136067))

(declare-fun d!136069 () Bool)

(declare-fun lt!561700 () Bool)

(assert (=> d!136069 (= lt!561700 (select (content!598 (t!40829 acc!846)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!702773 () Bool)

(assert (=> d!136069 (= lt!561700 e!702773)))

(declare-fun res!827330 () Bool)

(assert (=> d!136069 (=> (not res!827330) (not e!702773))))

(assert (=> d!136069 (= res!827330 ((_ is Cons!27371) (t!40829 acc!846)))))

(assert (=> d!136069 (= (contains!7347 (t!40829 acc!846) #b1000000000000000000000000000000000000000000000000000000000000000) lt!561700)))

(declare-fun b!1239984 () Bool)

(declare-fun e!702774 () Bool)

(assert (=> b!1239984 (= e!702773 e!702774)))

(declare-fun res!827331 () Bool)

(assert (=> b!1239984 (=> res!827331 e!702774)))

(assert (=> b!1239984 (= res!827331 (= (h!28580 (t!40829 acc!846)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1239985 () Bool)

(assert (=> b!1239985 (= e!702774 (contains!7347 (t!40829 (t!40829 acc!846)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!136069 res!827330) b!1239984))

(assert (= (and b!1239984 (not res!827331)) b!1239985))

(assert (=> d!136069 m!1142889))

(declare-fun m!1142895 () Bool)

(assert (=> d!136069 m!1142895))

(declare-fun m!1142897 () Bool)

(assert (=> b!1239985 m!1142897))

(assert (=> b!1239891 d!136069))

(declare-fun d!136071 () Bool)

(declare-fun lt!561701 () Bool)

(assert (=> d!136071 (= lt!561701 (select (content!598 (t!40829 acc!846)) k0!2925))))

(declare-fun e!702775 () Bool)

(assert (=> d!136071 (= lt!561701 e!702775)))

(declare-fun res!827332 () Bool)

(assert (=> d!136071 (=> (not res!827332) (not e!702775))))

(assert (=> d!136071 (= res!827332 ((_ is Cons!27371) (t!40829 acc!846)))))

(assert (=> d!136071 (= (contains!7347 (t!40829 acc!846) k0!2925) lt!561701)))

(declare-fun b!1239986 () Bool)

(declare-fun e!702776 () Bool)

(assert (=> b!1239986 (= e!702775 e!702776)))

(declare-fun res!827333 () Bool)

(assert (=> b!1239986 (=> res!827333 e!702776)))

(assert (=> b!1239986 (= res!827333 (= (h!28580 (t!40829 acc!846)) k0!2925))))

(declare-fun b!1239987 () Bool)

(assert (=> b!1239987 (= e!702776 (contains!7347 (t!40829 (t!40829 acc!846)) k0!2925))))

(assert (= (and d!136071 res!827332) b!1239986))

(assert (= (and b!1239986 (not res!827333)) b!1239987))

(assert (=> d!136071 m!1142889))

(declare-fun m!1142899 () Bool)

(assert (=> d!136071 m!1142899))

(declare-fun m!1142901 () Bool)

(assert (=> b!1239987 m!1142901))

(assert (=> b!1239903 d!136071))

(declare-fun d!136073 () Bool)

(declare-fun res!827334 () Bool)

(declare-fun e!702777 () Bool)

(assert (=> d!136073 (=> res!827334 e!702777)))

(assert (=> d!136073 (= res!827334 ((_ is Nil!27372) (t!40829 acc!846)))))

(assert (=> d!136073 (= (noDuplicate!1990 (t!40829 acc!846)) e!702777)))

(declare-fun b!1239988 () Bool)

(declare-fun e!702778 () Bool)

(assert (=> b!1239988 (= e!702777 e!702778)))

(declare-fun res!827335 () Bool)

(assert (=> b!1239988 (=> (not res!827335) (not e!702778))))

(assert (=> b!1239988 (= res!827335 (not (contains!7347 (t!40829 (t!40829 acc!846)) (h!28580 (t!40829 acc!846)))))))

(declare-fun b!1239989 () Bool)

(assert (=> b!1239989 (= e!702778 (noDuplicate!1990 (t!40829 (t!40829 acc!846))))))

(assert (= (and d!136073 (not res!827334)) b!1239988))

(assert (= (and b!1239988 res!827335) b!1239989))

(declare-fun m!1142903 () Bool)

(assert (=> b!1239988 m!1142903))

(declare-fun m!1142905 () Bool)

(assert (=> b!1239989 m!1142905))

(assert (=> b!1239921 d!136073))

(declare-fun d!136075 () Bool)

(declare-fun res!827336 () Bool)

(declare-fun e!702779 () Bool)

(assert (=> d!136075 (=> res!827336 e!702779)))

(assert (=> d!136075 (= res!827336 (= (select (arr!38501 a!3835) (bvadd from!3213 #b00000000000000000000000000000001)) k0!2925))))

(assert (=> d!136075 (= (arrayContainsKey!0 a!3835 k0!2925 (bvadd from!3213 #b00000000000000000000000000000001)) e!702779)))

(declare-fun b!1239990 () Bool)

(declare-fun e!702780 () Bool)

(assert (=> b!1239990 (= e!702779 e!702780)))

(declare-fun res!827337 () Bool)

(assert (=> b!1239990 (=> (not res!827337) (not e!702780))))

(assert (=> b!1239990 (= res!827337 (bvslt (bvadd from!3213 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!39039 a!3835)))))

(declare-fun b!1239991 () Bool)

(assert (=> b!1239991 (= e!702780 (arrayContainsKey!0 a!3835 k0!2925 (bvadd from!3213 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!136075 (not res!827336)) b!1239990))

(assert (= (and b!1239990 res!827337) b!1239991))

(declare-fun m!1142907 () Bool)

(assert (=> d!136075 m!1142907))

(declare-fun m!1142909 () Bool)

(assert (=> b!1239991 m!1142909))

(assert (=> b!1239901 d!136075))

(declare-fun d!136077 () Bool)

(declare-fun lt!561702 () Bool)

(assert (=> d!136077 (= lt!561702 (select (content!598 (t!40829 acc!846)) (h!28580 acc!846)))))

(declare-fun e!702781 () Bool)

(assert (=> d!136077 (= lt!561702 e!702781)))

(declare-fun res!827338 () Bool)

(assert (=> d!136077 (=> (not res!827338) (not e!702781))))

(assert (=> d!136077 (= res!827338 ((_ is Cons!27371) (t!40829 acc!846)))))

(assert (=> d!136077 (= (contains!7347 (t!40829 acc!846) (h!28580 acc!846)) lt!561702)))

(declare-fun b!1239992 () Bool)

(declare-fun e!702782 () Bool)

(assert (=> b!1239992 (= e!702781 e!702782)))

(declare-fun res!827339 () Bool)

(assert (=> b!1239992 (=> res!827339 e!702782)))

(assert (=> b!1239992 (= res!827339 (= (h!28580 (t!40829 acc!846)) (h!28580 acc!846)))))

(declare-fun b!1239993 () Bool)

(assert (=> b!1239993 (= e!702782 (contains!7347 (t!40829 (t!40829 acc!846)) (h!28580 acc!846)))))

(assert (= (and d!136077 res!827338) b!1239992))

(assert (= (and b!1239992 (not res!827339)) b!1239993))

(assert (=> d!136077 m!1142889))

(declare-fun m!1142911 () Bool)

(assert (=> d!136077 m!1142911))

(declare-fun m!1142913 () Bool)

(assert (=> b!1239993 m!1142913))

(assert (=> b!1239920 d!136077))

(declare-fun d!136079 () Bool)

(declare-fun c!121192 () Bool)

(assert (=> d!136079 (= c!121192 ((_ is Nil!27372) acc!846))))

(declare-fun e!702785 () (InoxSet (_ BitVec 64)))

(assert (=> d!136079 (= (content!598 acc!846) e!702785)))

(declare-fun b!1239998 () Bool)

(assert (=> b!1239998 (= e!702785 ((as const (Array (_ BitVec 64) Bool)) false))))

(declare-fun b!1239999 () Bool)

(assert (=> b!1239999 (= e!702785 ((_ map or) (store ((as const (Array (_ BitVec 64) Bool)) false) (h!28580 acc!846) true) (content!598 (t!40829 acc!846))))))

(assert (= (and d!136079 c!121192) b!1239998))

(assert (= (and d!136079 (not c!121192)) b!1239999))

(declare-fun m!1142915 () Bool)

(assert (=> b!1239999 m!1142915))

(assert (=> b!1239999 m!1142889))

(assert (=> d!136029 d!136079))

(declare-fun lt!561703 () Bool)

(declare-fun d!136081 () Bool)

(assert (=> d!136081 (= lt!561703 (select (content!598 acc!846) (select (arr!38501 a!3835) from!3213)))))

(declare-fun e!702786 () Bool)

(assert (=> d!136081 (= lt!561703 e!702786)))

(declare-fun res!827340 () Bool)

(assert (=> d!136081 (=> (not res!827340) (not e!702786))))

(assert (=> d!136081 (= res!827340 ((_ is Cons!27371) acc!846))))

(assert (=> d!136081 (= (contains!7347 acc!846 (select (arr!38501 a!3835) from!3213)) lt!561703)))

(declare-fun b!1240000 () Bool)

(declare-fun e!702787 () Bool)

(assert (=> b!1240000 (= e!702786 e!702787)))

(declare-fun res!827341 () Bool)

(assert (=> b!1240000 (=> res!827341 e!702787)))

(assert (=> b!1240000 (= res!827341 (= (h!28580 acc!846) (select (arr!38501 a!3835) from!3213)))))

(declare-fun b!1240001 () Bool)

(assert (=> b!1240001 (= e!702787 (contains!7347 (t!40829 acc!846) (select (arr!38501 a!3835) from!3213)))))

(assert (= (and d!136081 res!827340) b!1240000))

(assert (= (and b!1240000 (not res!827341)) b!1240001))

(assert (=> d!136081 m!1142813))

(assert (=> d!136081 m!1142805))

(declare-fun m!1142917 () Bool)

(assert (=> d!136081 m!1142917))

(assert (=> b!1240001 m!1142805))

(declare-fun m!1142919 () Bool)

(assert (=> b!1240001 m!1142919))

(assert (=> b!1239884 d!136081))

(declare-fun d!136083 () Bool)

(assert (=> d!136083 (= (validKeyInArray!0 (select (arr!38501 a!3835) from!3213)) (and (not (= (select (arr!38501 a!3835) from!3213) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!38501 a!3835) from!3213) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1239882 d!136083))

(declare-fun b!1240002 () Bool)

(declare-fun e!702788 () Bool)

(declare-fun e!702789 () Bool)

(assert (=> b!1240002 (= e!702788 e!702789)))

(declare-fun res!827343 () Bool)

(assert (=> b!1240002 (=> (not res!827343) (not e!702789))))

(declare-fun e!702790 () Bool)

(assert (=> b!1240002 (= res!827343 (not e!702790))))

(declare-fun res!827342 () Bool)

(assert (=> b!1240002 (=> (not res!827342) (not e!702790))))

(assert (=> b!1240002 (= res!827342 (validKeyInArray!0 (select (arr!38501 a!3835) (bvadd from!3213 #b00000000000000000000000000000001))))))

(declare-fun c!121193 () Bool)

(declare-fun bm!61105 () Bool)

(declare-fun call!61108 () Bool)

(assert (=> bm!61105 (= call!61108 (arrayNoDuplicates!0 a!3835 (bvadd from!3213 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!121193 (Cons!27371 (select (arr!38501 a!3835) (bvadd from!3213 #b00000000000000000000000000000001)) (ite c!121183 (Cons!27371 (select (arr!38501 a!3835) from!3213) acc!846) acc!846)) (ite c!121183 (Cons!27371 (select (arr!38501 a!3835) from!3213) acc!846) acc!846))))))

(declare-fun b!1240004 () Bool)

(declare-fun e!702791 () Bool)

(assert (=> b!1240004 (= e!702791 call!61108)))

(declare-fun b!1240005 () Bool)

(assert (=> b!1240005 (= e!702790 (contains!7347 (ite c!121183 (Cons!27371 (select (arr!38501 a!3835) from!3213) acc!846) acc!846) (select (arr!38501 a!3835) (bvadd from!3213 #b00000000000000000000000000000001))))))

(declare-fun b!1240006 () Bool)

(assert (=> b!1240006 (= e!702791 call!61108)))

(declare-fun b!1240003 () Bool)

(assert (=> b!1240003 (= e!702789 e!702791)))

(assert (=> b!1240003 (= c!121193 (validKeyInArray!0 (select (arr!38501 a!3835) (bvadd from!3213 #b00000000000000000000000000000001))))))

(declare-fun d!136085 () Bool)

(declare-fun res!827344 () Bool)

(assert (=> d!136085 (=> res!827344 e!702788)))

(assert (=> d!136085 (= res!827344 (bvsge (bvadd from!3213 #b00000000000000000000000000000001) (size!39039 a!3835)))))

(assert (=> d!136085 (= (arrayNoDuplicates!0 a!3835 (bvadd from!3213 #b00000000000000000000000000000001) (ite c!121183 (Cons!27371 (select (arr!38501 a!3835) from!3213) acc!846) acc!846)) e!702788)))

(assert (= (and d!136085 (not res!827344)) b!1240002))

(assert (= (and b!1240002 res!827342) b!1240005))

(assert (= (and b!1240002 res!827343) b!1240003))

(assert (= (and b!1240003 c!121193) b!1240006))

(assert (= (and b!1240003 (not c!121193)) b!1240004))

(assert (= (or b!1240006 b!1240004) bm!61105))

(assert (=> b!1240002 m!1142907))

(assert (=> b!1240002 m!1142907))

(declare-fun m!1142921 () Bool)

(assert (=> b!1240002 m!1142921))

(assert (=> bm!61105 m!1142907))

(declare-fun m!1142923 () Bool)

(assert (=> bm!61105 m!1142923))

(assert (=> b!1240005 m!1142907))

(assert (=> b!1240005 m!1142907))

(declare-fun m!1142925 () Bool)

(assert (=> b!1240005 m!1142925))

(assert (=> b!1240003 m!1142907))

(assert (=> b!1240003 m!1142907))

(assert (=> b!1240003 m!1142921))

(assert (=> bm!61098 d!136085))

(assert (=> d!136043 d!136079))

(assert (=> b!1239881 d!136083))

(assert (=> d!136037 d!136079))

(check-sat (not b!1240001) (not b!1239985) (not d!136071) (not d!136069) (not b!1240002) (not d!136067) (not b!1239999) (not b!1240003) (not b!1239983) (not d!136077) (not d!136081) (not bm!61105) (not b!1240005) (not b!1239993) (not b!1239987) (not b!1239989) (not b!1239988) (not b!1239991))
(check-sat)
