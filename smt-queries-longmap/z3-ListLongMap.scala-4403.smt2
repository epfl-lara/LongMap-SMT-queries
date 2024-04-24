; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60636 () Bool)

(assert start!60636)

(declare-fun b!680913 () Bool)

(declare-fun e!387886 () Bool)

(declare-fun e!387887 () Bool)

(assert (=> b!680913 (= e!387886 (not e!387887))))

(declare-fun res!447038 () Bool)

(assert (=> b!680913 (=> res!447038 e!387887)))

(declare-datatypes ((array!39498 0))(
  ( (array!39499 (arr!18934 (Array (_ BitVec 32) (_ BitVec 64))) (size!19298 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39498)

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!680913 (= res!447038 (not (validKeyInArray!0 (select (arr!18934 a!3626) from!3004))))))

(declare-datatypes ((Unit!23853 0))(
  ( (Unit!23854) )
))
(declare-fun lt!313232 () Unit!23853)

(declare-fun e!387880 () Unit!23853)

(assert (=> b!680913 (= lt!313232 e!387880)))

(declare-fun c!77312 () Bool)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!39498 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!680913 (= c!77312 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!680913 (arrayContainsKey!0 (array!39499 (store (arr!18934 a!3626) i!1382 k0!2843) (size!19298 a!3626)) k0!2843 from!3004)))

(declare-fun b!680914 () Bool)

(declare-fun Unit!23855 () Unit!23853)

(assert (=> b!680914 (= e!387880 Unit!23855)))

(declare-fun lt!313231 () Unit!23853)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39498 (_ BitVec 64) (_ BitVec 32)) Unit!23853)

(assert (=> b!680914 (= lt!313231 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!680914 false))

(declare-fun b!680915 () Bool)

(declare-fun res!447034 () Bool)

(assert (=> b!680915 (=> (not res!447034) (not e!387886))))

(assert (=> b!680915 (= res!447034 (validKeyInArray!0 k0!2843))))

(declare-fun b!680916 () Bool)

(declare-fun res!447028 () Bool)

(declare-fun e!387883 () Bool)

(assert (=> b!680916 (=> res!447028 e!387883)))

(declare-datatypes ((List!12882 0))(
  ( (Nil!12879) (Cons!12878 (h!13926 (_ BitVec 64)) (t!19105 List!12882)) )
))
(declare-fun lt!313234 () List!12882)

(declare-fun noDuplicate!808 (List!12882) Bool)

(assert (=> b!680916 (= res!447028 (not (noDuplicate!808 lt!313234)))))

(declare-fun b!680917 () Bool)

(declare-fun res!447036 () Bool)

(assert (=> b!680917 (=> (not res!447036) (not e!387886))))

(declare-fun acc!681 () List!12882)

(assert (=> b!680917 (= res!447036 (noDuplicate!808 acc!681))))

(declare-fun b!680918 () Bool)

(declare-fun res!447040 () Bool)

(assert (=> b!680918 (=> (not res!447040) (not e!387886))))

(assert (=> b!680918 (= res!447040 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19298 a!3626))))))

(declare-fun b!680919 () Bool)

(declare-fun e!387888 () Bool)

(declare-fun e!387885 () Bool)

(assert (=> b!680919 (= e!387888 e!387885)))

(declare-fun res!447035 () Bool)

(assert (=> b!680919 (=> (not res!447035) (not e!387885))))

(assert (=> b!680919 (= res!447035 (bvsle from!3004 i!1382))))

(declare-fun b!680920 () Bool)

(declare-fun res!447027 () Bool)

(assert (=> b!680920 (=> (not res!447027) (not e!387886))))

(assert (=> b!680920 (= res!447027 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19298 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!680921 () Bool)

(declare-fun res!447031 () Bool)

(assert (=> b!680921 (=> (not res!447031) (not e!387886))))

(declare-fun contains!3534 (List!12882 (_ BitVec 64)) Bool)

(assert (=> b!680921 (= res!447031 (not (contains!3534 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!680922 () Bool)

(declare-fun res!447030 () Bool)

(assert (=> b!680922 (=> (not res!447030) (not e!387886))))

(declare-fun arrayNoDuplicates!0 (array!39498 (_ BitVec 32) List!12882) Bool)

(assert (=> b!680922 (= res!447030 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun res!447039 () Bool)

(assert (=> start!60636 (=> (not res!447039) (not e!387886))))

(assert (=> start!60636 (= res!447039 (and (bvslt (size!19298 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19298 a!3626))))))

(assert (=> start!60636 e!387886))

(assert (=> start!60636 true))

(declare-fun array_inv!14793 (array!39498) Bool)

(assert (=> start!60636 (array_inv!14793 a!3626)))

(declare-fun b!680923 () Bool)

(declare-fun res!447037 () Bool)

(assert (=> b!680923 (=> (not res!447037) (not e!387886))))

(assert (=> b!680923 (= res!447037 e!387888)))

(declare-fun res!447026 () Bool)

(assert (=> b!680923 (=> res!447026 e!387888)))

(declare-fun e!387884 () Bool)

(assert (=> b!680923 (= res!447026 e!387884)))

(declare-fun res!447043 () Bool)

(assert (=> b!680923 (=> (not res!447043) (not e!387884))))

(assert (=> b!680923 (= res!447043 (bvsgt from!3004 i!1382))))

(declare-fun b!680924 () Bool)

(declare-fun e!387882 () Bool)

(assert (=> b!680924 (= e!387882 (not (contains!3534 lt!313234 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!680925 () Bool)

(declare-fun Unit!23856 () Unit!23853)

(assert (=> b!680925 (= e!387880 Unit!23856)))

(declare-fun b!680926 () Bool)

(assert (=> b!680926 (= e!387885 (not (contains!3534 acc!681 k0!2843)))))

(declare-fun b!680927 () Bool)

(declare-fun res!447033 () Bool)

(assert (=> b!680927 (=> (not res!447033) (not e!387886))))

(assert (=> b!680927 (= res!447033 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!680928 () Bool)

(assert (=> b!680928 (= e!387884 (contains!3534 acc!681 k0!2843))))

(declare-fun b!680929 () Bool)

(declare-fun res!447041 () Bool)

(assert (=> b!680929 (=> (not res!447041) (not e!387886))))

(assert (=> b!680929 (= res!447041 (not (contains!3534 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!680930 () Bool)

(assert (=> b!680930 (= e!387883 e!387882)))

(declare-fun res!447032 () Bool)

(assert (=> b!680930 (=> (not res!447032) (not e!387882))))

(assert (=> b!680930 (= res!447032 (not (contains!3534 lt!313234 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!680931 () Bool)

(assert (=> b!680931 (= e!387887 e!387883)))

(declare-fun res!447029 () Bool)

(assert (=> b!680931 (=> res!447029 e!387883)))

(assert (=> b!680931 (= res!447029 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!305 (List!12882 (_ BitVec 64)) List!12882)

(assert (=> b!680931 (= lt!313234 ($colon$colon!305 acc!681 (select (arr!18934 a!3626) from!3004)))))

(declare-fun subseq!143 (List!12882 List!12882) Bool)

(assert (=> b!680931 (subseq!143 acc!681 acc!681)))

(declare-fun lt!313233 () Unit!23853)

(declare-fun lemmaListSubSeqRefl!0 (List!12882) Unit!23853)

(assert (=> b!680931 (= lt!313233 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun b!680932 () Bool)

(declare-fun res!447042 () Bool)

(assert (=> b!680932 (=> (not res!447042) (not e!387886))))

(assert (=> b!680932 (= res!447042 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12879))))

(assert (= (and start!60636 res!447039) b!680917))

(assert (= (and b!680917 res!447036) b!680929))

(assert (= (and b!680929 res!447041) b!680921))

(assert (= (and b!680921 res!447031) b!680923))

(assert (= (and b!680923 res!447043) b!680928))

(assert (= (and b!680923 (not res!447026)) b!680919))

(assert (= (and b!680919 res!447035) b!680926))

(assert (= (and b!680923 res!447037) b!680932))

(assert (= (and b!680932 res!447042) b!680922))

(assert (= (and b!680922 res!447030) b!680918))

(assert (= (and b!680918 res!447040) b!680915))

(assert (= (and b!680915 res!447034) b!680927))

(assert (= (and b!680927 res!447033) b!680920))

(assert (= (and b!680920 res!447027) b!680913))

(assert (= (and b!680913 c!77312) b!680914))

(assert (= (and b!680913 (not c!77312)) b!680925))

(assert (= (and b!680913 (not res!447038)) b!680931))

(assert (= (and b!680931 (not res!447029)) b!680916))

(assert (= (and b!680916 (not res!447028)) b!680930))

(assert (= (and b!680930 res!447032) b!680924))

(declare-fun m!646393 () Bool)

(assert (=> b!680921 m!646393))

(declare-fun m!646395 () Bool)

(assert (=> b!680917 m!646395))

(declare-fun m!646397 () Bool)

(assert (=> b!680916 m!646397))

(declare-fun m!646399 () Bool)

(assert (=> b!680931 m!646399))

(assert (=> b!680931 m!646399))

(declare-fun m!646401 () Bool)

(assert (=> b!680931 m!646401))

(declare-fun m!646403 () Bool)

(assert (=> b!680931 m!646403))

(declare-fun m!646405 () Bool)

(assert (=> b!680931 m!646405))

(declare-fun m!646407 () Bool)

(assert (=> b!680927 m!646407))

(declare-fun m!646409 () Bool)

(assert (=> b!680929 m!646409))

(declare-fun m!646411 () Bool)

(assert (=> b!680924 m!646411))

(declare-fun m!646413 () Bool)

(assert (=> start!60636 m!646413))

(declare-fun m!646415 () Bool)

(assert (=> b!680932 m!646415))

(declare-fun m!646417 () Bool)

(assert (=> b!680922 m!646417))

(declare-fun m!646419 () Bool)

(assert (=> b!680915 m!646419))

(assert (=> b!680913 m!646399))

(declare-fun m!646421 () Bool)

(assert (=> b!680913 m!646421))

(declare-fun m!646423 () Bool)

(assert (=> b!680913 m!646423))

(assert (=> b!680913 m!646399))

(declare-fun m!646425 () Bool)

(assert (=> b!680913 m!646425))

(declare-fun m!646427 () Bool)

(assert (=> b!680913 m!646427))

(declare-fun m!646429 () Bool)

(assert (=> b!680928 m!646429))

(declare-fun m!646431 () Bool)

(assert (=> b!680930 m!646431))

(assert (=> b!680926 m!646429))

(declare-fun m!646433 () Bool)

(assert (=> b!680914 m!646433))

(check-sat (not b!680921) (not b!680932) (not b!680928) (not b!680922) (not b!680914) (not b!680927) (not b!680913) (not b!680929) (not b!680931) (not b!680924) (not b!680930) (not start!60636) (not b!680916) (not b!680917) (not b!680926) (not b!680915))
(check-sat)
(get-model)

(declare-fun d!93799 () Bool)

(declare-fun res!447156 () Bool)

(declare-fun e!387947 () Bool)

(assert (=> d!93799 (=> res!447156 e!387947)))

(assert (=> d!93799 (= res!447156 (= (select (arr!18934 a!3626) #b00000000000000000000000000000000) k0!2843))))

(assert (=> d!93799 (= (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000) e!387947)))

(declare-fun b!681057 () Bool)

(declare-fun e!387948 () Bool)

(assert (=> b!681057 (= e!387947 e!387948)))

(declare-fun res!447157 () Bool)

(assert (=> b!681057 (=> (not res!447157) (not e!387948))))

(assert (=> b!681057 (= res!447157 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!19298 a!3626)))))

(declare-fun b!681058 () Bool)

(assert (=> b!681058 (= e!387948 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!93799 (not res!447156)) b!681057))

(assert (= (and b!681057 res!447157) b!681058))

(declare-fun m!646519 () Bool)

(assert (=> d!93799 m!646519))

(declare-fun m!646521 () Bool)

(assert (=> b!681058 m!646521))

(assert (=> b!680927 d!93799))

(declare-fun d!93801 () Bool)

(declare-fun res!447162 () Bool)

(declare-fun e!387953 () Bool)

(assert (=> d!93801 (=> res!447162 e!387953)))

(get-info :version)

(assert (=> d!93801 (= res!447162 ((_ is Nil!12879) acc!681))))

(assert (=> d!93801 (= (noDuplicate!808 acc!681) e!387953)))

(declare-fun b!681063 () Bool)

(declare-fun e!387954 () Bool)

(assert (=> b!681063 (= e!387953 e!387954)))

(declare-fun res!447163 () Bool)

(assert (=> b!681063 (=> (not res!447163) (not e!387954))))

(assert (=> b!681063 (= res!447163 (not (contains!3534 (t!19105 acc!681) (h!13926 acc!681))))))

(declare-fun b!681064 () Bool)

(assert (=> b!681064 (= e!387954 (noDuplicate!808 (t!19105 acc!681)))))

(assert (= (and d!93801 (not res!447162)) b!681063))

(assert (= (and b!681063 res!447163) b!681064))

(declare-fun m!646523 () Bool)

(assert (=> b!681063 m!646523))

(declare-fun m!646525 () Bool)

(assert (=> b!681064 m!646525))

(assert (=> b!680917 d!93801))

(declare-fun d!93803 () Bool)

(declare-fun lt!313261 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!270 (List!12882) (InoxSet (_ BitVec 64)))

(assert (=> d!93803 (= lt!313261 (select (content!270 acc!681) k0!2843))))

(declare-fun e!387959 () Bool)

(assert (=> d!93803 (= lt!313261 e!387959)))

(declare-fun res!447169 () Bool)

(assert (=> d!93803 (=> (not res!447169) (not e!387959))))

(assert (=> d!93803 (= res!447169 ((_ is Cons!12878) acc!681))))

(assert (=> d!93803 (= (contains!3534 acc!681 k0!2843) lt!313261)))

(declare-fun b!681069 () Bool)

(declare-fun e!387960 () Bool)

(assert (=> b!681069 (= e!387959 e!387960)))

(declare-fun res!447168 () Bool)

(assert (=> b!681069 (=> res!447168 e!387960)))

(assert (=> b!681069 (= res!447168 (= (h!13926 acc!681) k0!2843))))

(declare-fun b!681070 () Bool)

(assert (=> b!681070 (= e!387960 (contains!3534 (t!19105 acc!681) k0!2843))))

(assert (= (and d!93803 res!447169) b!681069))

(assert (= (and b!681069 (not res!447168)) b!681070))

(declare-fun m!646527 () Bool)

(assert (=> d!93803 m!646527))

(declare-fun m!646529 () Bool)

(assert (=> d!93803 m!646529))

(declare-fun m!646531 () Bool)

(assert (=> b!681070 m!646531))

(assert (=> b!680928 d!93803))

(declare-fun d!93805 () Bool)

(assert (=> d!93805 (= (validKeyInArray!0 k0!2843) (and (not (= k0!2843 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2843 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!680915 d!93805))

(assert (=> b!680926 d!93803))

(declare-fun d!93809 () Bool)

(declare-fun res!447170 () Bool)

(declare-fun e!387961 () Bool)

(assert (=> d!93809 (=> res!447170 e!387961)))

(assert (=> d!93809 (= res!447170 ((_ is Nil!12879) lt!313234))))

(assert (=> d!93809 (= (noDuplicate!808 lt!313234) e!387961)))

(declare-fun b!681071 () Bool)

(declare-fun e!387962 () Bool)

(assert (=> b!681071 (= e!387961 e!387962)))

(declare-fun res!447171 () Bool)

(assert (=> b!681071 (=> (not res!447171) (not e!387962))))

(assert (=> b!681071 (= res!447171 (not (contains!3534 (t!19105 lt!313234) (h!13926 lt!313234))))))

(declare-fun b!681072 () Bool)

(assert (=> b!681072 (= e!387962 (noDuplicate!808 (t!19105 lt!313234)))))

(assert (= (and d!93809 (not res!447170)) b!681071))

(assert (= (and b!681071 res!447171) b!681072))

(declare-fun m!646533 () Bool)

(assert (=> b!681071 m!646533))

(declare-fun m!646535 () Bool)

(assert (=> b!681072 m!646535))

(assert (=> b!680916 d!93809))

(declare-fun d!93811 () Bool)

(declare-fun lt!313262 () Bool)

(assert (=> d!93811 (= lt!313262 (select (content!270 lt!313234) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!387963 () Bool)

(assert (=> d!93811 (= lt!313262 e!387963)))

(declare-fun res!447173 () Bool)

(assert (=> d!93811 (=> (not res!447173) (not e!387963))))

(assert (=> d!93811 (= res!447173 ((_ is Cons!12878) lt!313234))))

(assert (=> d!93811 (= (contains!3534 lt!313234 #b0000000000000000000000000000000000000000000000000000000000000000) lt!313262)))

(declare-fun b!681073 () Bool)

(declare-fun e!387964 () Bool)

(assert (=> b!681073 (= e!387963 e!387964)))

(declare-fun res!447172 () Bool)

(assert (=> b!681073 (=> res!447172 e!387964)))

(assert (=> b!681073 (= res!447172 (= (h!13926 lt!313234) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!681074 () Bool)

(assert (=> b!681074 (= e!387964 (contains!3534 (t!19105 lt!313234) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!93811 res!447173) b!681073))

(assert (= (and b!681073 (not res!447172)) b!681074))

(declare-fun m!646537 () Bool)

(assert (=> d!93811 m!646537))

(declare-fun m!646539 () Bool)

(assert (=> d!93811 m!646539))

(declare-fun m!646541 () Bool)

(assert (=> b!681074 m!646541))

(assert (=> b!680930 d!93811))

(declare-fun d!93813 () Bool)

(declare-fun lt!313263 () Bool)

(assert (=> d!93813 (= lt!313263 (select (content!270 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!387965 () Bool)

(assert (=> d!93813 (= lt!313263 e!387965)))

(declare-fun res!447175 () Bool)

(assert (=> d!93813 (=> (not res!447175) (not e!387965))))

(assert (=> d!93813 (= res!447175 ((_ is Cons!12878) acc!681))))

(assert (=> d!93813 (= (contains!3534 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000) lt!313263)))

(declare-fun b!681075 () Bool)

(declare-fun e!387966 () Bool)

(assert (=> b!681075 (= e!387965 e!387966)))

(declare-fun res!447174 () Bool)

(assert (=> b!681075 (=> res!447174 e!387966)))

(assert (=> b!681075 (= res!447174 (= (h!13926 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!681076 () Bool)

(assert (=> b!681076 (= e!387966 (contains!3534 (t!19105 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!93813 res!447175) b!681075))

(assert (= (and b!681075 (not res!447174)) b!681076))

(assert (=> d!93813 m!646527))

(declare-fun m!646543 () Bool)

(assert (=> d!93813 m!646543))

(declare-fun m!646545 () Bool)

(assert (=> b!681076 m!646545))

(assert (=> b!680929 d!93813))

(declare-fun call!33960 () Bool)

(declare-fun c!77321 () Bool)

(declare-fun bm!33957 () Bool)

(assert (=> bm!33957 (= call!33960 (arrayNoDuplicates!0 a!3626 (bvadd from!3004 #b00000000000000000000000000000001) (ite c!77321 (Cons!12878 (select (arr!18934 a!3626) from!3004) acc!681) acc!681)))))

(declare-fun b!681109 () Bool)

(declare-fun e!388002 () Bool)

(declare-fun e!388000 () Bool)

(assert (=> b!681109 (= e!388002 e!388000)))

(assert (=> b!681109 (= c!77321 (validKeyInArray!0 (select (arr!18934 a!3626) from!3004)))))

(declare-fun d!93815 () Bool)

(declare-fun res!447208 () Bool)

(declare-fun e!387999 () Bool)

(assert (=> d!93815 (=> res!447208 e!387999)))

(assert (=> d!93815 (= res!447208 (bvsge from!3004 (size!19298 a!3626)))))

(assert (=> d!93815 (= (arrayNoDuplicates!0 a!3626 from!3004 acc!681) e!387999)))

(declare-fun b!681110 () Bool)

(declare-fun e!388001 () Bool)

(assert (=> b!681110 (= e!388001 (contains!3534 acc!681 (select (arr!18934 a!3626) from!3004)))))

(declare-fun b!681111 () Bool)

(assert (=> b!681111 (= e!387999 e!388002)))

(declare-fun res!447206 () Bool)

(assert (=> b!681111 (=> (not res!447206) (not e!388002))))

(assert (=> b!681111 (= res!447206 (not e!388001))))

(declare-fun res!447207 () Bool)

(assert (=> b!681111 (=> (not res!447207) (not e!388001))))

(assert (=> b!681111 (= res!447207 (validKeyInArray!0 (select (arr!18934 a!3626) from!3004)))))

(declare-fun b!681112 () Bool)

(assert (=> b!681112 (= e!388000 call!33960)))

(declare-fun b!681113 () Bool)

(assert (=> b!681113 (= e!388000 call!33960)))

(assert (= (and d!93815 (not res!447208)) b!681111))

(assert (= (and b!681111 res!447207) b!681110))

(assert (= (and b!681111 res!447206) b!681109))

(assert (= (and b!681109 c!77321) b!681112))

(assert (= (and b!681109 (not c!77321)) b!681113))

(assert (= (or b!681112 b!681113) bm!33957))

(assert (=> bm!33957 m!646399))

(declare-fun m!646563 () Bool)

(assert (=> bm!33957 m!646563))

(assert (=> b!681109 m!646399))

(assert (=> b!681109 m!646399))

(assert (=> b!681109 m!646425))

(assert (=> b!681110 m!646399))

(assert (=> b!681110 m!646399))

(declare-fun m!646565 () Bool)

(assert (=> b!681110 m!646565))

(assert (=> b!681111 m!646399))

(assert (=> b!681111 m!646399))

(assert (=> b!681111 m!646425))

(assert (=> b!680922 d!93815))

(declare-fun d!93825 () Bool)

(assert (=> d!93825 (= ($colon$colon!305 acc!681 (select (arr!18934 a!3626) from!3004)) (Cons!12878 (select (arr!18934 a!3626) from!3004) acc!681))))

(assert (=> b!680931 d!93825))

(declare-fun b!681152 () Bool)

(declare-fun e!388032 () Bool)

(assert (=> b!681152 (= e!388032 (subseq!143 (t!19105 acc!681) (t!19105 acc!681)))))

(declare-fun d!93829 () Bool)

(declare-fun res!447233 () Bool)

(declare-fun e!388033 () Bool)

(assert (=> d!93829 (=> res!447233 e!388033)))

(assert (=> d!93829 (= res!447233 ((_ is Nil!12879) acc!681))))

(assert (=> d!93829 (= (subseq!143 acc!681 acc!681) e!388033)))

(declare-fun b!681151 () Bool)

(declare-fun e!388031 () Bool)

(declare-fun e!388034 () Bool)

(assert (=> b!681151 (= e!388031 e!388034)))

(declare-fun res!447234 () Bool)

(assert (=> b!681151 (=> res!447234 e!388034)))

(assert (=> b!681151 (= res!447234 e!388032)))

(declare-fun res!447232 () Bool)

(assert (=> b!681151 (=> (not res!447232) (not e!388032))))

(assert (=> b!681151 (= res!447232 (= (h!13926 acc!681) (h!13926 acc!681)))))

(declare-fun b!681150 () Bool)

(assert (=> b!681150 (= e!388033 e!388031)))

(declare-fun res!447231 () Bool)

(assert (=> b!681150 (=> (not res!447231) (not e!388031))))

(assert (=> b!681150 (= res!447231 ((_ is Cons!12878) acc!681))))

(declare-fun b!681153 () Bool)

(assert (=> b!681153 (= e!388034 (subseq!143 acc!681 (t!19105 acc!681)))))

(assert (= (and d!93829 (not res!447233)) b!681150))

(assert (= (and b!681150 res!447231) b!681151))

(assert (= (and b!681151 res!447232) b!681152))

(assert (= (and b!681151 (not res!447234)) b!681153))

(declare-fun m!646583 () Bool)

(assert (=> b!681152 m!646583))

(declare-fun m!646585 () Bool)

(assert (=> b!681153 m!646585))

(assert (=> b!680931 d!93829))

(declare-fun d!93835 () Bool)

(assert (=> d!93835 (subseq!143 acc!681 acc!681)))

(declare-fun lt!313273 () Unit!23853)

(declare-fun choose!36 (List!12882) Unit!23853)

(assert (=> d!93835 (= lt!313273 (choose!36 acc!681))))

(assert (=> d!93835 (= (lemmaListSubSeqRefl!0 acc!681) lt!313273)))

(declare-fun bs!20006 () Bool)

(assert (= bs!20006 d!93835))

(assert (=> bs!20006 m!646403))

(declare-fun m!646587 () Bool)

(assert (=> bs!20006 m!646587))

(assert (=> b!680931 d!93835))

(declare-fun d!93837 () Bool)

(declare-fun lt!313274 () Bool)

(assert (=> d!93837 (= lt!313274 (select (content!270 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!388041 () Bool)

(assert (=> d!93837 (= lt!313274 e!388041)))

(declare-fun res!447242 () Bool)

(assert (=> d!93837 (=> (not res!447242) (not e!388041))))

(assert (=> d!93837 (= res!447242 ((_ is Cons!12878) acc!681))))

(assert (=> d!93837 (= (contains!3534 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000) lt!313274)))

(declare-fun b!681160 () Bool)

(declare-fun e!388042 () Bool)

(assert (=> b!681160 (= e!388041 e!388042)))

(declare-fun res!447241 () Bool)

(assert (=> b!681160 (=> res!447241 e!388042)))

(assert (=> b!681160 (= res!447241 (= (h!13926 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!681161 () Bool)

(assert (=> b!681161 (= e!388042 (contains!3534 (t!19105 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!93837 res!447242) b!681160))

(assert (= (and b!681160 (not res!447241)) b!681161))

(assert (=> d!93837 m!646527))

(declare-fun m!646593 () Bool)

(assert (=> d!93837 m!646593))

(declare-fun m!646595 () Bool)

(assert (=> b!681161 m!646595))

(assert (=> b!680921 d!93837))

(declare-fun bm!33965 () Bool)

(declare-fun call!33968 () Bool)

(declare-fun c!77329 () Bool)

(assert (=> bm!33965 (= call!33968 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!77329 (Cons!12878 (select (arr!18934 a!3626) #b00000000000000000000000000000000) Nil!12879) Nil!12879)))))

(declare-fun b!681169 () Bool)

(declare-fun e!388052 () Bool)

(declare-fun e!388050 () Bool)

(assert (=> b!681169 (= e!388052 e!388050)))

(assert (=> b!681169 (= c!77329 (validKeyInArray!0 (select (arr!18934 a!3626) #b00000000000000000000000000000000)))))

(declare-fun d!93841 () Bool)

(declare-fun res!447250 () Bool)

(declare-fun e!388049 () Bool)

(assert (=> d!93841 (=> res!447250 e!388049)))

(assert (=> d!93841 (= res!447250 (bvsge #b00000000000000000000000000000000 (size!19298 a!3626)))))

(assert (=> d!93841 (= (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12879) e!388049)))

(declare-fun b!681170 () Bool)

(declare-fun e!388051 () Bool)

(assert (=> b!681170 (= e!388051 (contains!3534 Nil!12879 (select (arr!18934 a!3626) #b00000000000000000000000000000000)))))

(declare-fun b!681171 () Bool)

(assert (=> b!681171 (= e!388049 e!388052)))

(declare-fun res!447248 () Bool)

(assert (=> b!681171 (=> (not res!447248) (not e!388052))))

(assert (=> b!681171 (= res!447248 (not e!388051))))

(declare-fun res!447249 () Bool)

(assert (=> b!681171 (=> (not res!447249) (not e!388051))))

(assert (=> b!681171 (= res!447249 (validKeyInArray!0 (select (arr!18934 a!3626) #b00000000000000000000000000000000)))))

(declare-fun b!681172 () Bool)

(assert (=> b!681172 (= e!388050 call!33968)))

(declare-fun b!681173 () Bool)

(assert (=> b!681173 (= e!388050 call!33968)))

(assert (= (and d!93841 (not res!447250)) b!681171))

(assert (= (and b!681171 res!447249) b!681170))

(assert (= (and b!681171 res!447248) b!681169))

(assert (= (and b!681169 c!77329) b!681172))

(assert (= (and b!681169 (not c!77329)) b!681173))

(assert (= (or b!681172 b!681173) bm!33965))

(assert (=> bm!33965 m!646519))

(declare-fun m!646607 () Bool)

(assert (=> bm!33965 m!646607))

(assert (=> b!681169 m!646519))

(assert (=> b!681169 m!646519))

(declare-fun m!646609 () Bool)

(assert (=> b!681169 m!646609))

(assert (=> b!681170 m!646519))

(assert (=> b!681170 m!646519))

(declare-fun m!646611 () Bool)

(assert (=> b!681170 m!646611))

(assert (=> b!681171 m!646519))

(assert (=> b!681171 m!646519))

(assert (=> b!681171 m!646609))

(assert (=> b!680932 d!93841))

(declare-fun d!93849 () Bool)

(assert (=> d!93849 (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))

(declare-fun lt!313278 () Unit!23853)

(declare-fun choose!13 (array!39498 (_ BitVec 64) (_ BitVec 32)) Unit!23853)

(assert (=> d!93849 (= lt!313278 (choose!13 a!3626 k0!2843 from!3004))))

(assert (=> d!93849 (bvsge from!3004 #b00000000000000000000000000000000)))

(assert (=> d!93849 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004) lt!313278)))

(declare-fun bs!20007 () Bool)

(assert (= bs!20007 d!93849))

(assert (=> bs!20007 m!646407))

(declare-fun m!646621 () Bool)

(assert (=> bs!20007 m!646621))

(assert (=> b!680914 d!93849))

(declare-fun d!93859 () Bool)

(assert (=> d!93859 (= (array_inv!14793 a!3626) (bvsge (size!19298 a!3626) #b00000000000000000000000000000000))))

(assert (=> start!60636 d!93859))

(declare-fun d!93861 () Bool)

(assert (=> d!93861 (= (validKeyInArray!0 (select (arr!18934 a!3626) from!3004)) (and (not (= (select (arr!18934 a!3626) from!3004) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18934 a!3626) from!3004) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!680913 d!93861))

(declare-fun d!93863 () Bool)

(declare-fun res!447266 () Bool)

(declare-fun e!388069 () Bool)

(assert (=> d!93863 (=> res!447266 e!388069)))

(assert (=> d!93863 (= res!447266 (= (select (arr!18934 a!3626) (bvadd #b00000000000000000000000000000001 from!3004)) k0!2843))))

(assert (=> d!93863 (= (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)) e!388069)))

(declare-fun b!681191 () Bool)

(declare-fun e!388070 () Bool)

(assert (=> b!681191 (= e!388069 e!388070)))

(declare-fun res!447267 () Bool)

(assert (=> b!681191 (=> (not res!447267) (not e!388070))))

(assert (=> b!681191 (= res!447267 (bvslt (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001) (size!19298 a!3626)))))

(declare-fun b!681192 () Bool)

(assert (=> b!681192 (= e!388070 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001)))))

(assert (= (and d!93863 (not res!447266)) b!681191))

(assert (= (and b!681191 res!447267) b!681192))

(declare-fun m!646629 () Bool)

(assert (=> d!93863 m!646629))

(declare-fun m!646631 () Bool)

(assert (=> b!681192 m!646631))

(assert (=> b!680913 d!93863))

(declare-fun d!93867 () Bool)

(declare-fun res!447268 () Bool)

(declare-fun e!388071 () Bool)

(assert (=> d!93867 (=> res!447268 e!388071)))

(assert (=> d!93867 (= res!447268 (= (select (arr!18934 (array!39499 (store (arr!18934 a!3626) i!1382 k0!2843) (size!19298 a!3626))) from!3004) k0!2843))))

(assert (=> d!93867 (= (arrayContainsKey!0 (array!39499 (store (arr!18934 a!3626) i!1382 k0!2843) (size!19298 a!3626)) k0!2843 from!3004) e!388071)))

(declare-fun b!681193 () Bool)

(declare-fun e!388072 () Bool)

(assert (=> b!681193 (= e!388071 e!388072)))

(declare-fun res!447269 () Bool)

(assert (=> b!681193 (=> (not res!447269) (not e!388072))))

(assert (=> b!681193 (= res!447269 (bvslt (bvadd from!3004 #b00000000000000000000000000000001) (size!19298 (array!39499 (store (arr!18934 a!3626) i!1382 k0!2843) (size!19298 a!3626)))))))

(declare-fun b!681194 () Bool)

(assert (=> b!681194 (= e!388072 (arrayContainsKey!0 (array!39499 (store (arr!18934 a!3626) i!1382 k0!2843) (size!19298 a!3626)) k0!2843 (bvadd from!3004 #b00000000000000000000000000000001)))))

(assert (= (and d!93867 (not res!447268)) b!681193))

(assert (= (and b!681193 res!447269) b!681194))

(declare-fun m!646633 () Bool)

(assert (=> d!93867 m!646633))

(declare-fun m!646635 () Bool)

(assert (=> b!681194 m!646635))

(assert (=> b!680913 d!93867))

(declare-fun d!93869 () Bool)

(declare-fun lt!313279 () Bool)

(assert (=> d!93869 (= lt!313279 (select (content!270 lt!313234) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!388077 () Bool)

(assert (=> d!93869 (= lt!313279 e!388077)))

(declare-fun res!447275 () Bool)

(assert (=> d!93869 (=> (not res!447275) (not e!388077))))

(assert (=> d!93869 (= res!447275 ((_ is Cons!12878) lt!313234))))

(assert (=> d!93869 (= (contains!3534 lt!313234 #b1000000000000000000000000000000000000000000000000000000000000000) lt!313279)))

(declare-fun b!681199 () Bool)

(declare-fun e!388078 () Bool)

(assert (=> b!681199 (= e!388077 e!388078)))

(declare-fun res!447274 () Bool)

(assert (=> b!681199 (=> res!447274 e!388078)))

(assert (=> b!681199 (= res!447274 (= (h!13926 lt!313234) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!681200 () Bool)

(assert (=> b!681200 (= e!388078 (contains!3534 (t!19105 lt!313234) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!93869 res!447275) b!681199))

(assert (= (and b!681199 (not res!447274)) b!681200))

(assert (=> d!93869 m!646537))

(declare-fun m!646641 () Bool)

(assert (=> d!93869 m!646641))

(declare-fun m!646643 () Bool)

(assert (=> b!681200 m!646643))

(assert (=> b!680924 d!93869))

(check-sat (not b!681153) (not b!681064) (not b!681058) (not bm!33965) (not b!681110) (not bm!33957) (not d!93869) (not b!681111) (not b!681171) (not d!93813) (not b!681152) (not b!681109) (not b!681200) (not d!93835) (not b!681063) (not b!681169) (not b!681161) (not b!681194) (not b!681074) (not d!93849) (not b!681071) (not d!93837) (not b!681192) (not b!681070) (not b!681170) (not b!681072) (not b!681076) (not d!93811) (not d!93803))
(check-sat)
