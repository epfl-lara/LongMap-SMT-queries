; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59734 () Bool)

(assert start!59734)

(declare-fun res!428000 () Bool)

(declare-fun e!379197 () Bool)

(assert (=> start!59734 (=> (not res!428000) (not e!379197))))

(declare-datatypes ((array!38796 0))(
  ( (array!38797 (arr!18592 (Array (_ BitVec 32) (_ BitVec 64))) (size!18956 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38796)

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> start!59734 (= res!428000 (and (bvslt (size!18956 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!18956 a!3626))))))

(assert (=> start!59734 e!379197))

(assert (=> start!59734 true))

(declare-fun array_inv!14388 (array!38796) Bool)

(assert (=> start!59734 (array_inv!14388 a!3626)))

(declare-fun b!659932 () Bool)

(declare-fun res!428003 () Bool)

(assert (=> b!659932 (=> (not res!428003) (not e!379197))))

(declare-datatypes ((List!12633 0))(
  ( (Nil!12630) (Cons!12629 (h!13674 (_ BitVec 64)) (t!18861 List!12633)) )
))
(declare-fun acc!681 () List!12633)

(declare-fun contains!3210 (List!12633 (_ BitVec 64)) Bool)

(assert (=> b!659932 (= res!428003 (not (contains!3210 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!659933 () Bool)

(declare-fun e!379195 () Bool)

(declare-fun e!379192 () Bool)

(assert (=> b!659933 (= e!379195 e!379192)))

(declare-fun res!428002 () Bool)

(assert (=> b!659933 (=> (not res!428002) (not e!379192))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!659933 (= res!428002 (bvsle from!3004 i!1382))))

(declare-fun b!659934 () Bool)

(declare-fun k0!2843 () (_ BitVec 64))

(assert (=> b!659934 (= e!379192 (not (contains!3210 acc!681 k0!2843)))))

(declare-fun b!659935 () Bool)

(declare-fun res!428006 () Bool)

(assert (=> b!659935 (=> (not res!428006) (not e!379197))))

(declare-fun noDuplicate!457 (List!12633) Bool)

(assert (=> b!659935 (= res!428006 (noDuplicate!457 Nil!12630))))

(declare-fun b!659936 () Bool)

(declare-fun e!379193 () Bool)

(assert (=> b!659936 (= e!379193 (contains!3210 acc!681 k0!2843))))

(declare-fun b!659937 () Bool)

(declare-fun res!428004 () Bool)

(assert (=> b!659937 (=> (not res!428004) (not e!379197))))

(assert (=> b!659937 (= res!428004 (noDuplicate!457 acc!681))))

(declare-fun b!659938 () Bool)

(declare-fun e!379194 () Bool)

(assert (=> b!659938 (= e!379197 e!379194)))

(declare-fun res!428001 () Bool)

(assert (=> b!659938 (=> res!428001 e!379194)))

(assert (=> b!659938 (= res!428001 (contains!3210 Nil!12630 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!659939 () Bool)

(declare-fun res!427997 () Bool)

(assert (=> b!659939 (=> (not res!427997) (not e!379197))))

(assert (=> b!659939 (= res!427997 (bvsle #b00000000000000000000000000000000 (size!18956 a!3626)))))

(declare-fun b!659940 () Bool)

(declare-fun res!427998 () Bool)

(assert (=> b!659940 (=> (not res!427998) (not e!379197))))

(assert (=> b!659940 (= res!427998 e!379195)))

(declare-fun res!427999 () Bool)

(assert (=> b!659940 (=> res!427999 e!379195)))

(assert (=> b!659940 (= res!427999 e!379193)))

(declare-fun res!428005 () Bool)

(assert (=> b!659940 (=> (not res!428005) (not e!379193))))

(assert (=> b!659940 (= res!428005 (bvsgt from!3004 i!1382))))

(declare-fun b!659941 () Bool)

(assert (=> b!659941 (= e!379194 (contains!3210 Nil!12630 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!659942 () Bool)

(declare-fun res!427996 () Bool)

(assert (=> b!659942 (=> (not res!427996) (not e!379197))))

(assert (=> b!659942 (= res!427996 (not (contains!3210 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!59734 res!428000) b!659937))

(assert (= (and b!659937 res!428004) b!659932))

(assert (= (and b!659932 res!428003) b!659942))

(assert (= (and b!659942 res!427996) b!659940))

(assert (= (and b!659940 res!428005) b!659936))

(assert (= (and b!659940 (not res!427999)) b!659933))

(assert (= (and b!659933 res!428002) b!659934))

(assert (= (and b!659940 res!427998) b!659939))

(assert (= (and b!659939 res!427997) b!659935))

(assert (= (and b!659935 res!428006) b!659938))

(assert (= (and b!659938 (not res!428001)) b!659941))

(declare-fun m!632805 () Bool)

(assert (=> b!659936 m!632805))

(declare-fun m!632807 () Bool)

(assert (=> b!659932 m!632807))

(declare-fun m!632809 () Bool)

(assert (=> b!659938 m!632809))

(declare-fun m!632811 () Bool)

(assert (=> b!659942 m!632811))

(declare-fun m!632813 () Bool)

(assert (=> b!659935 m!632813))

(declare-fun m!632815 () Bool)

(assert (=> b!659937 m!632815))

(declare-fun m!632817 () Bool)

(assert (=> start!59734 m!632817))

(declare-fun m!632819 () Bool)

(assert (=> b!659941 m!632819))

(assert (=> b!659934 m!632805))

(check-sat (not b!659937) (not b!659936) (not b!659941) (not b!659938) (not b!659932) (not b!659942) (not b!659934) (not start!59734) (not b!659935))
(check-sat)
(get-model)

(declare-fun d!93163 () Bool)

(declare-fun lt!308728 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!258 (List!12633) (InoxSet (_ BitVec 64)))

(assert (=> d!93163 (= lt!308728 (select (content!258 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!379221 () Bool)

(assert (=> d!93163 (= lt!308728 e!379221)))

(declare-fun res!428045 () Bool)

(assert (=> d!93163 (=> (not res!428045) (not e!379221))))

(get-info :version)

(assert (=> d!93163 (= res!428045 ((_ is Cons!12629) acc!681))))

(assert (=> d!93163 (= (contains!3210 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000) lt!308728)))

(declare-fun b!659980 () Bool)

(declare-fun e!379220 () Bool)

(assert (=> b!659980 (= e!379221 e!379220)))

(declare-fun res!428044 () Bool)

(assert (=> b!659980 (=> res!428044 e!379220)))

(assert (=> b!659980 (= res!428044 (= (h!13674 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!659981 () Bool)

(assert (=> b!659981 (= e!379220 (contains!3210 (t!18861 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!93163 res!428045) b!659980))

(assert (= (and b!659980 (not res!428044)) b!659981))

(declare-fun m!632837 () Bool)

(assert (=> d!93163 m!632837))

(declare-fun m!632839 () Bool)

(assert (=> d!93163 m!632839))

(declare-fun m!632841 () Bool)

(assert (=> b!659981 m!632841))

(assert (=> b!659942 d!93163))

(declare-fun d!93165 () Bool)

(declare-fun res!428050 () Bool)

(declare-fun e!379226 () Bool)

(assert (=> d!93165 (=> res!428050 e!379226)))

(assert (=> d!93165 (= res!428050 ((_ is Nil!12630) acc!681))))

(assert (=> d!93165 (= (noDuplicate!457 acc!681) e!379226)))

(declare-fun b!659986 () Bool)

(declare-fun e!379227 () Bool)

(assert (=> b!659986 (= e!379226 e!379227)))

(declare-fun res!428051 () Bool)

(assert (=> b!659986 (=> (not res!428051) (not e!379227))))

(assert (=> b!659986 (= res!428051 (not (contains!3210 (t!18861 acc!681) (h!13674 acc!681))))))

(declare-fun b!659987 () Bool)

(assert (=> b!659987 (= e!379227 (noDuplicate!457 (t!18861 acc!681)))))

(assert (= (and d!93165 (not res!428050)) b!659986))

(assert (= (and b!659986 res!428051) b!659987))

(declare-fun m!632843 () Bool)

(assert (=> b!659986 m!632843))

(declare-fun m!632845 () Bool)

(assert (=> b!659987 m!632845))

(assert (=> b!659937 d!93165))

(declare-fun d!93167 () Bool)

(declare-fun lt!308729 () Bool)

(assert (=> d!93167 (= lt!308729 (select (content!258 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!379229 () Bool)

(assert (=> d!93167 (= lt!308729 e!379229)))

(declare-fun res!428053 () Bool)

(assert (=> d!93167 (=> (not res!428053) (not e!379229))))

(assert (=> d!93167 (= res!428053 ((_ is Cons!12629) acc!681))))

(assert (=> d!93167 (= (contains!3210 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000) lt!308729)))

(declare-fun b!659988 () Bool)

(declare-fun e!379228 () Bool)

(assert (=> b!659988 (= e!379229 e!379228)))

(declare-fun res!428052 () Bool)

(assert (=> b!659988 (=> res!428052 e!379228)))

(assert (=> b!659988 (= res!428052 (= (h!13674 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!659989 () Bool)

(assert (=> b!659989 (= e!379228 (contains!3210 (t!18861 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!93167 res!428053) b!659988))

(assert (= (and b!659988 (not res!428052)) b!659989))

(assert (=> d!93167 m!632837))

(declare-fun m!632847 () Bool)

(assert (=> d!93167 m!632847))

(declare-fun m!632849 () Bool)

(assert (=> b!659989 m!632849))

(assert (=> b!659932 d!93167))

(declare-fun d!93169 () Bool)

(declare-fun lt!308730 () Bool)

(assert (=> d!93169 (= lt!308730 (select (content!258 Nil!12630) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!379231 () Bool)

(assert (=> d!93169 (= lt!308730 e!379231)))

(declare-fun res!428055 () Bool)

(assert (=> d!93169 (=> (not res!428055) (not e!379231))))

(assert (=> d!93169 (= res!428055 ((_ is Cons!12629) Nil!12630))))

(assert (=> d!93169 (= (contains!3210 Nil!12630 #b0000000000000000000000000000000000000000000000000000000000000000) lt!308730)))

(declare-fun b!659990 () Bool)

(declare-fun e!379230 () Bool)

(assert (=> b!659990 (= e!379231 e!379230)))

(declare-fun res!428054 () Bool)

(assert (=> b!659990 (=> res!428054 e!379230)))

(assert (=> b!659990 (= res!428054 (= (h!13674 Nil!12630) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!659991 () Bool)

(assert (=> b!659991 (= e!379230 (contains!3210 (t!18861 Nil!12630) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!93169 res!428055) b!659990))

(assert (= (and b!659990 (not res!428054)) b!659991))

(declare-fun m!632851 () Bool)

(assert (=> d!93169 m!632851))

(declare-fun m!632853 () Bool)

(assert (=> d!93169 m!632853))

(declare-fun m!632855 () Bool)

(assert (=> b!659991 m!632855))

(assert (=> b!659938 d!93169))

(declare-fun d!93171 () Bool)

(assert (=> d!93171 (= (array_inv!14388 a!3626) (bvsge (size!18956 a!3626) #b00000000000000000000000000000000))))

(assert (=> start!59734 d!93171))

(declare-fun d!93173 () Bool)

(declare-fun lt!308731 () Bool)

(assert (=> d!93173 (= lt!308731 (select (content!258 acc!681) k0!2843))))

(declare-fun e!379233 () Bool)

(assert (=> d!93173 (= lt!308731 e!379233)))

(declare-fun res!428057 () Bool)

(assert (=> d!93173 (=> (not res!428057) (not e!379233))))

(assert (=> d!93173 (= res!428057 ((_ is Cons!12629) acc!681))))

(assert (=> d!93173 (= (contains!3210 acc!681 k0!2843) lt!308731)))

(declare-fun b!659992 () Bool)

(declare-fun e!379232 () Bool)

(assert (=> b!659992 (= e!379233 e!379232)))

(declare-fun res!428056 () Bool)

(assert (=> b!659992 (=> res!428056 e!379232)))

(assert (=> b!659992 (= res!428056 (= (h!13674 acc!681) k0!2843))))

(declare-fun b!659993 () Bool)

(assert (=> b!659993 (= e!379232 (contains!3210 (t!18861 acc!681) k0!2843))))

(assert (= (and d!93173 res!428057) b!659992))

(assert (= (and b!659992 (not res!428056)) b!659993))

(assert (=> d!93173 m!632837))

(declare-fun m!632857 () Bool)

(assert (=> d!93173 m!632857))

(declare-fun m!632859 () Bool)

(assert (=> b!659993 m!632859))

(assert (=> b!659934 d!93173))

(declare-fun d!93175 () Bool)

(declare-fun res!428058 () Bool)

(declare-fun e!379234 () Bool)

(assert (=> d!93175 (=> res!428058 e!379234)))

(assert (=> d!93175 (= res!428058 ((_ is Nil!12630) Nil!12630))))

(assert (=> d!93175 (= (noDuplicate!457 Nil!12630) e!379234)))

(declare-fun b!659994 () Bool)

(declare-fun e!379235 () Bool)

(assert (=> b!659994 (= e!379234 e!379235)))

(declare-fun res!428059 () Bool)

(assert (=> b!659994 (=> (not res!428059) (not e!379235))))

(assert (=> b!659994 (= res!428059 (not (contains!3210 (t!18861 Nil!12630) (h!13674 Nil!12630))))))

(declare-fun b!659995 () Bool)

(assert (=> b!659995 (= e!379235 (noDuplicate!457 (t!18861 Nil!12630)))))

(assert (= (and d!93175 (not res!428058)) b!659994))

(assert (= (and b!659994 res!428059) b!659995))

(declare-fun m!632861 () Bool)

(assert (=> b!659994 m!632861))

(declare-fun m!632863 () Bool)

(assert (=> b!659995 m!632863))

(assert (=> b!659935 d!93175))

(declare-fun d!93177 () Bool)

(declare-fun lt!308732 () Bool)

(assert (=> d!93177 (= lt!308732 (select (content!258 Nil!12630) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!379237 () Bool)

(assert (=> d!93177 (= lt!308732 e!379237)))

(declare-fun res!428061 () Bool)

(assert (=> d!93177 (=> (not res!428061) (not e!379237))))

(assert (=> d!93177 (= res!428061 ((_ is Cons!12629) Nil!12630))))

(assert (=> d!93177 (= (contains!3210 Nil!12630 #b1000000000000000000000000000000000000000000000000000000000000000) lt!308732)))

(declare-fun b!659996 () Bool)

(declare-fun e!379236 () Bool)

(assert (=> b!659996 (= e!379237 e!379236)))

(declare-fun res!428060 () Bool)

(assert (=> b!659996 (=> res!428060 e!379236)))

(assert (=> b!659996 (= res!428060 (= (h!13674 Nil!12630) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!659997 () Bool)

(assert (=> b!659997 (= e!379236 (contains!3210 (t!18861 Nil!12630) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!93177 res!428061) b!659996))

(assert (= (and b!659996 (not res!428060)) b!659997))

(assert (=> d!93177 m!632851))

(declare-fun m!632865 () Bool)

(assert (=> d!93177 m!632865))

(declare-fun m!632867 () Bool)

(assert (=> b!659997 m!632867))

(assert (=> b!659941 d!93177))

(assert (=> b!659936 d!93173))

(check-sat (not b!659991) (not b!659981) (not b!659994) (not b!659989) (not d!93177) (not b!659997) (not b!659993) (not b!659987) (not b!659986) (not d!93163) (not d!93169) (not d!93173) (not d!93167) (not b!659995))
(check-sat)
