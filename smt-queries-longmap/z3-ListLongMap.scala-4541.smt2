; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63210 () Bool)

(assert start!63210)

(declare-fun b!711968 () Bool)

(declare-fun res!475233 () Bool)

(declare-fun e!400576 () Bool)

(assert (=> b!711968 (=> (not res!475233) (not e!400576))))

(declare-datatypes ((List!13395 0))(
  ( (Nil!13392) (Cons!13391 (h!14436 (_ BitVec 64)) (t!19704 List!13395)) )
))
(declare-fun newAcc!49 () List!13395)

(declare-fun noDuplicate!1219 (List!13395) Bool)

(assert (=> b!711968 (= res!475233 (noDuplicate!1219 newAcc!49))))

(declare-fun b!711969 () Bool)

(declare-fun res!475224 () Bool)

(assert (=> b!711969 (=> (not res!475224) (not e!400576))))

(declare-fun acc!652 () List!13395)

(declare-fun contains!3972 (List!13395 (_ BitVec 64)) Bool)

(assert (=> b!711969 (= res!475224 (not (contains!3972 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!711970 () Bool)

(declare-fun res!475216 () Bool)

(declare-fun e!400574 () Bool)

(assert (=> b!711970 (=> (not res!475216) (not e!400574))))

(declare-fun lt!318517 () List!13395)

(assert (=> b!711970 (= res!475216 (noDuplicate!1219 lt!318517))))

(declare-fun b!711971 () Bool)

(declare-fun res!475226 () Bool)

(assert (=> b!711971 (=> (not res!475226) (not e!400576))))

(declare-datatypes ((array!40422 0))(
  ( (array!40423 (arr!19354 (Array (_ BitVec 32) (_ BitVec 64))) (size!19759 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40422)

(declare-fun from!2969 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!711971 (= res!475226 (validKeyInArray!0 (select (arr!19354 a!3591) from!2969)))))

(declare-fun b!711972 () Bool)

(declare-fun res!475223 () Bool)

(assert (=> b!711972 (=> (not res!475223) (not e!400576))))

(assert (=> b!711972 (= res!475223 (not (contains!3972 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!711973 () Bool)

(assert (=> b!711973 (= e!400576 e!400574)))

(declare-fun res!475221 () Bool)

(assert (=> b!711973 (=> (not res!475221) (not e!400574))))

(assert (=> b!711973 (= res!475221 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!528 (List!13395 (_ BitVec 64)) List!13395)

(assert (=> b!711973 (= lt!318517 ($colon$colon!528 newAcc!49 (select (arr!19354 a!3591) from!2969)))))

(declare-fun lt!318518 () List!13395)

(assert (=> b!711973 (= lt!318518 ($colon$colon!528 acc!652 (select (arr!19354 a!3591) from!2969)))))

(declare-fun b!711974 () Bool)

(declare-fun res!475222 () Bool)

(assert (=> b!711974 (=> (not res!475222) (not e!400576))))

(assert (=> b!711974 (= res!475222 (not (contains!3972 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!711975 () Bool)

(declare-fun res!475214 () Bool)

(assert (=> b!711975 (=> (not res!475214) (not e!400576))))

(assert (=> b!711975 (= res!475214 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19759 a!3591)))))

(declare-fun b!711976 () Bool)

(declare-fun res!475210 () Bool)

(assert (=> b!711976 (=> (not res!475210) (not e!400574))))

(declare-fun k0!2824 () (_ BitVec 64))

(assert (=> b!711976 (= res!475210 (not (contains!3972 lt!318518 k0!2824)))))

(declare-fun b!711977 () Bool)

(declare-fun res!475211 () Bool)

(assert (=> b!711977 (=> (not res!475211) (not e!400576))))

(assert (=> b!711977 (= res!475211 (not (contains!3972 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!711978 () Bool)

(declare-fun res!475212 () Bool)

(assert (=> b!711978 (=> (not res!475212) (not e!400576))))

(declare-fun arrayContainsKey!0 (array!40422 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!711978 (= res!475212 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(declare-fun b!711979 () Bool)

(declare-fun res!475218 () Bool)

(assert (=> b!711979 (=> (not res!475218) (not e!400576))))

(assert (=> b!711979 (= res!475218 (not (contains!3972 acc!652 k0!2824)))))

(declare-fun b!711980 () Bool)

(declare-fun e!400575 () Bool)

(assert (=> b!711980 (= e!400575 (contains!3972 lt!318517 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!711981 () Bool)

(declare-fun res!475207 () Bool)

(assert (=> b!711981 (=> (not res!475207) (not e!400574))))

(assert (=> b!711981 (= res!475207 (not (contains!3972 lt!318518 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!475232 () Bool)

(assert (=> start!63210 (=> (not res!475232) (not e!400576))))

(assert (=> start!63210 (= res!475232 (and (bvslt (size!19759 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19759 a!3591))))))

(assert (=> start!63210 e!400576))

(assert (=> start!63210 true))

(declare-fun array_inv!15150 (array!40422) Bool)

(assert (=> start!63210 (array_inv!15150 a!3591)))

(declare-fun b!711967 () Bool)

(declare-fun res!475234 () Bool)

(assert (=> b!711967 (=> (not res!475234) (not e!400574))))

(declare-fun arrayNoDuplicates!0 (array!40422 (_ BitVec 32) List!13395) Bool)

(assert (=> b!711967 (= res!475234 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) lt!318518))))

(declare-fun b!711982 () Bool)

(declare-fun res!475227 () Bool)

(assert (=> b!711982 (=> (not res!475227) (not e!400574))))

(declare-fun -!382 (List!13395 (_ BitVec 64)) List!13395)

(assert (=> b!711982 (= res!475227 (= (-!382 lt!318517 k0!2824) lt!318518))))

(declare-fun b!711983 () Bool)

(declare-fun res!475215 () Bool)

(assert (=> b!711983 (=> (not res!475215) (not e!400576))))

(declare-fun subseq!417 (List!13395 List!13395) Bool)

(assert (=> b!711983 (= res!475215 (subseq!417 acc!652 newAcc!49))))

(declare-fun b!711984 () Bool)

(declare-fun res!475219 () Bool)

(assert (=> b!711984 (=> (not res!475219) (not e!400576))))

(assert (=> b!711984 (= res!475219 (validKeyInArray!0 k0!2824))))

(declare-fun b!711985 () Bool)

(declare-fun res!475228 () Bool)

(assert (=> b!711985 (=> (not res!475228) (not e!400576))))

(assert (=> b!711985 (= res!475228 (contains!3972 newAcc!49 k0!2824))))

(declare-fun b!711986 () Bool)

(declare-fun res!475230 () Bool)

(assert (=> b!711986 (=> (not res!475230) (not e!400574))))

(assert (=> b!711986 (= res!475230 (subseq!417 lt!318518 lt!318517))))

(declare-fun b!711987 () Bool)

(declare-fun res!475209 () Bool)

(assert (=> b!711987 (=> (not res!475209) (not e!400576))))

(assert (=> b!711987 (= res!475209 (= (-!382 newAcc!49 k0!2824) acc!652))))

(declare-fun b!711988 () Bool)

(declare-fun res!475213 () Bool)

(assert (=> b!711988 (=> (not res!475213) (not e!400574))))

(assert (=> b!711988 (= res!475213 (noDuplicate!1219 lt!318518))))

(declare-fun b!711989 () Bool)

(declare-fun res!475229 () Bool)

(assert (=> b!711989 (=> (not res!475229) (not e!400574))))

(assert (=> b!711989 (= res!475229 (not (arrayContainsKey!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!711990 () Bool)

(declare-fun res!475217 () Bool)

(assert (=> b!711990 (=> (not res!475217) (not e!400574))))

(assert (=> b!711990 (= res!475217 (contains!3972 lt!318517 k0!2824))))

(declare-fun b!711991 () Bool)

(assert (=> b!711991 (= e!400574 e!400575)))

(declare-fun res!475220 () Bool)

(assert (=> b!711991 (=> res!475220 e!400575)))

(assert (=> b!711991 (= res!475220 (contains!3972 lt!318517 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!711992 () Bool)

(declare-fun res!475225 () Bool)

(assert (=> b!711992 (=> (not res!475225) (not e!400574))))

(assert (=> b!711992 (= res!475225 (not (contains!3972 lt!318518 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!711993 () Bool)

(declare-fun res!475208 () Bool)

(assert (=> b!711993 (=> (not res!475208) (not e!400576))))

(assert (=> b!711993 (= res!475208 (noDuplicate!1219 acc!652))))

(declare-fun b!711994 () Bool)

(declare-fun res!475231 () Bool)

(assert (=> b!711994 (=> (not res!475231) (not e!400576))))

(assert (=> b!711994 (= res!475231 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(assert (= (and start!63210 res!475232) b!711993))

(assert (= (and b!711993 res!475208) b!711968))

(assert (= (and b!711968 res!475233) b!711969))

(assert (= (and b!711969 res!475224) b!711977))

(assert (= (and b!711977 res!475211) b!711978))

(assert (= (and b!711978 res!475212) b!711979))

(assert (= (and b!711979 res!475218) b!711984))

(assert (= (and b!711984 res!475219) b!711994))

(assert (= (and b!711994 res!475231) b!711983))

(assert (= (and b!711983 res!475215) b!711985))

(assert (= (and b!711985 res!475228) b!711987))

(assert (= (and b!711987 res!475209) b!711974))

(assert (= (and b!711974 res!475222) b!711972))

(assert (= (and b!711972 res!475223) b!711975))

(assert (= (and b!711975 res!475214) b!711971))

(assert (= (and b!711971 res!475226) b!711973))

(assert (= (and b!711973 res!475221) b!711988))

(assert (= (and b!711988 res!475213) b!711970))

(assert (= (and b!711970 res!475216) b!711992))

(assert (= (and b!711992 res!475225) b!711981))

(assert (= (and b!711981 res!475207) b!711989))

(assert (= (and b!711989 res!475229) b!711976))

(assert (= (and b!711976 res!475210) b!711967))

(assert (= (and b!711967 res!475234) b!711986))

(assert (= (and b!711986 res!475230) b!711990))

(assert (= (and b!711990 res!475217) b!711982))

(assert (= (and b!711982 res!475227) b!711991))

(assert (= (and b!711991 (not res!475220)) b!711980))

(declare-fun m!668923 () Bool)

(assert (=> b!711970 m!668923))

(declare-fun m!668925 () Bool)

(assert (=> b!711976 m!668925))

(declare-fun m!668927 () Bool)

(assert (=> b!711984 m!668927))

(declare-fun m!668929 () Bool)

(assert (=> b!711980 m!668929))

(declare-fun m!668931 () Bool)

(assert (=> b!711982 m!668931))

(declare-fun m!668933 () Bool)

(assert (=> b!711994 m!668933))

(declare-fun m!668935 () Bool)

(assert (=> b!711967 m!668935))

(declare-fun m!668937 () Bool)

(assert (=> b!711989 m!668937))

(declare-fun m!668939 () Bool)

(assert (=> b!711983 m!668939))

(declare-fun m!668941 () Bool)

(assert (=> b!711991 m!668941))

(declare-fun m!668943 () Bool)

(assert (=> b!711968 m!668943))

(declare-fun m!668945 () Bool)

(assert (=> b!711992 m!668945))

(declare-fun m!668947 () Bool)

(assert (=> b!711979 m!668947))

(declare-fun m!668949 () Bool)

(assert (=> b!711973 m!668949))

(assert (=> b!711973 m!668949))

(declare-fun m!668951 () Bool)

(assert (=> b!711973 m!668951))

(assert (=> b!711973 m!668949))

(declare-fun m!668953 () Bool)

(assert (=> b!711973 m!668953))

(declare-fun m!668955 () Bool)

(assert (=> b!711987 m!668955))

(declare-fun m!668957 () Bool)

(assert (=> start!63210 m!668957))

(declare-fun m!668959 () Bool)

(assert (=> b!711981 m!668959))

(assert (=> b!711971 m!668949))

(assert (=> b!711971 m!668949))

(declare-fun m!668961 () Bool)

(assert (=> b!711971 m!668961))

(declare-fun m!668963 () Bool)

(assert (=> b!711974 m!668963))

(declare-fun m!668965 () Bool)

(assert (=> b!711993 m!668965))

(declare-fun m!668967 () Bool)

(assert (=> b!711977 m!668967))

(declare-fun m!668969 () Bool)

(assert (=> b!711985 m!668969))

(declare-fun m!668971 () Bool)

(assert (=> b!711990 m!668971))

(declare-fun m!668973 () Bool)

(assert (=> b!711972 m!668973))

(declare-fun m!668975 () Bool)

(assert (=> b!711986 m!668975))

(declare-fun m!668977 () Bool)

(assert (=> b!711969 m!668977))

(declare-fun m!668979 () Bool)

(assert (=> b!711988 m!668979))

(declare-fun m!668981 () Bool)

(assert (=> b!711978 m!668981))

(check-sat (not b!711986) (not b!711977) (not b!711990) (not b!711980) (not b!711969) (not b!711993) (not b!711989) (not b!711976) (not start!63210) (not b!711968) (not b!711987) (not b!711978) (not b!711982) (not b!711971) (not b!711967) (not b!711985) (not b!711994) (not b!711988) (not b!711979) (not b!711983) (not b!711973) (not b!711981) (not b!711984) (not b!711972) (not b!711991) (not b!711974) (not b!711992) (not b!711970))
(check-sat)
(get-model)

(declare-fun d!97843 () Bool)

(declare-fun e!400598 () Bool)

(assert (=> d!97843 e!400598))

(declare-fun res!475321 () Bool)

(assert (=> d!97843 (=> (not res!475321) (not e!400598))))

(declare-fun lt!318527 () List!13395)

(declare-fun size!19761 (List!13395) Int)

(assert (=> d!97843 (= res!475321 (<= (size!19761 lt!318527) (size!19761 newAcc!49)))))

(declare-fun e!400597 () List!13395)

(assert (=> d!97843 (= lt!318527 e!400597)))

(declare-fun c!78752 () Bool)

(get-info :version)

(assert (=> d!97843 (= c!78752 ((_ is Cons!13391) newAcc!49))))

(assert (=> d!97843 (= (-!382 newAcc!49 k0!2824) lt!318527)))

(declare-fun b!712089 () Bool)

(declare-fun e!400599 () List!13395)

(declare-fun call!34542 () List!13395)

(assert (=> b!712089 (= e!400599 call!34542)))

(declare-fun b!712090 () Bool)

(assert (=> b!712090 (= e!400597 e!400599)))

(declare-fun c!78751 () Bool)

(assert (=> b!712090 (= c!78751 (= k0!2824 (h!14436 newAcc!49)))))

(declare-fun b!712091 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!358 (List!13395) (InoxSet (_ BitVec 64)))

(assert (=> b!712091 (= e!400598 (= (content!358 lt!318527) ((_ map and) (content!358 newAcc!49) ((_ map not) (store ((as const (Array (_ BitVec 64) Bool)) false) k0!2824 true)))))))

(declare-fun b!712092 () Bool)

(assert (=> b!712092 (= e!400597 Nil!13392)))

(declare-fun b!712093 () Bool)

(assert (=> b!712093 (= e!400599 (Cons!13391 (h!14436 newAcc!49) call!34542))))

(declare-fun bm!34539 () Bool)

(assert (=> bm!34539 (= call!34542 (-!382 (t!19704 newAcc!49) k0!2824))))

(assert (= (and d!97843 c!78752) b!712090))

(assert (= (and d!97843 (not c!78752)) b!712092))

(assert (= (and b!712090 c!78751) b!712089))

(assert (= (and b!712090 (not c!78751)) b!712093))

(assert (= (or b!712089 b!712093) bm!34539))

(assert (= (and d!97843 res!475321) b!712091))

(declare-fun m!669043 () Bool)

(assert (=> d!97843 m!669043))

(declare-fun m!669045 () Bool)

(assert (=> d!97843 m!669045))

(declare-fun m!669047 () Bool)

(assert (=> b!712091 m!669047))

(declare-fun m!669049 () Bool)

(assert (=> b!712091 m!669049))

(declare-fun m!669051 () Bool)

(assert (=> b!712091 m!669051))

(declare-fun m!669053 () Bool)

(assert (=> bm!34539 m!669053))

(assert (=> b!711987 d!97843))

(declare-fun b!712103 () Bool)

(declare-fun e!400608 () Bool)

(declare-fun e!400609 () Bool)

(assert (=> b!712103 (= e!400608 e!400609)))

(declare-fun res!475333 () Bool)

(assert (=> b!712103 (=> res!475333 e!400609)))

(declare-fun e!400610 () Bool)

(assert (=> b!712103 (= res!475333 e!400610)))

(declare-fun res!475332 () Bool)

(assert (=> b!712103 (=> (not res!475332) (not e!400610))))

(assert (=> b!712103 (= res!475332 (= (h!14436 lt!318518) (h!14436 lt!318517)))))

(declare-fun b!712105 () Bool)

(assert (=> b!712105 (= e!400609 (subseq!417 lt!318518 (t!19704 lt!318517)))))

(declare-fun d!97845 () Bool)

(declare-fun res!475331 () Bool)

(declare-fun e!400611 () Bool)

(assert (=> d!97845 (=> res!475331 e!400611)))

(assert (=> d!97845 (= res!475331 ((_ is Nil!13392) lt!318518))))

(assert (=> d!97845 (= (subseq!417 lt!318518 lt!318517) e!400611)))

(declare-fun b!712102 () Bool)

(assert (=> b!712102 (= e!400611 e!400608)))

(declare-fun res!475330 () Bool)

(assert (=> b!712102 (=> (not res!475330) (not e!400608))))

(assert (=> b!712102 (= res!475330 ((_ is Cons!13391) lt!318517))))

(declare-fun b!712104 () Bool)

(assert (=> b!712104 (= e!400610 (subseq!417 (t!19704 lt!318518) (t!19704 lt!318517)))))

(assert (= (and d!97845 (not res!475331)) b!712102))

(assert (= (and b!712102 res!475330) b!712103))

(assert (= (and b!712103 res!475332) b!712104))

(assert (= (and b!712103 (not res!475333)) b!712105))

(declare-fun m!669055 () Bool)

(assert (=> b!712105 m!669055))

(declare-fun m!669057 () Bool)

(assert (=> b!712104 m!669057))

(assert (=> b!711986 d!97845))

(declare-fun d!97847 () Bool)

(declare-fun res!475338 () Bool)

(declare-fun e!400616 () Bool)

(assert (=> d!97847 (=> res!475338 e!400616)))

(assert (=> d!97847 (= res!475338 ((_ is Nil!13392) newAcc!49))))

(assert (=> d!97847 (= (noDuplicate!1219 newAcc!49) e!400616)))

(declare-fun b!712110 () Bool)

(declare-fun e!400617 () Bool)

(assert (=> b!712110 (= e!400616 e!400617)))

(declare-fun res!475339 () Bool)

(assert (=> b!712110 (=> (not res!475339) (not e!400617))))

(assert (=> b!712110 (= res!475339 (not (contains!3972 (t!19704 newAcc!49) (h!14436 newAcc!49))))))

(declare-fun b!712111 () Bool)

(assert (=> b!712111 (= e!400617 (noDuplicate!1219 (t!19704 newAcc!49)))))

(assert (= (and d!97847 (not res!475338)) b!712110))

(assert (= (and b!712110 res!475339) b!712111))

(declare-fun m!669059 () Bool)

(assert (=> b!712110 m!669059))

(declare-fun m!669061 () Bool)

(assert (=> b!712111 m!669061))

(assert (=> b!711968 d!97847))

(declare-fun d!97849 () Bool)

(declare-fun lt!318530 () Bool)

(assert (=> d!97849 (= lt!318530 (select (content!358 lt!318517) k0!2824))))

(declare-fun e!400622 () Bool)

(assert (=> d!97849 (= lt!318530 e!400622)))

(declare-fun res!475344 () Bool)

(assert (=> d!97849 (=> (not res!475344) (not e!400622))))

(assert (=> d!97849 (= res!475344 ((_ is Cons!13391) lt!318517))))

(assert (=> d!97849 (= (contains!3972 lt!318517 k0!2824) lt!318530)))

(declare-fun b!712116 () Bool)

(declare-fun e!400623 () Bool)

(assert (=> b!712116 (= e!400622 e!400623)))

(declare-fun res!475345 () Bool)

(assert (=> b!712116 (=> res!475345 e!400623)))

(assert (=> b!712116 (= res!475345 (= (h!14436 lt!318517) k0!2824))))

(declare-fun b!712117 () Bool)

(assert (=> b!712117 (= e!400623 (contains!3972 (t!19704 lt!318517) k0!2824))))

(assert (= (and d!97849 res!475344) b!712116))

(assert (= (and b!712116 (not res!475345)) b!712117))

(declare-fun m!669063 () Bool)

(assert (=> d!97849 m!669063))

(declare-fun m!669065 () Bool)

(assert (=> d!97849 m!669065))

(declare-fun m!669067 () Bool)

(assert (=> b!712117 m!669067))

(assert (=> b!711990 d!97849))

(declare-fun d!97853 () Bool)

(declare-fun lt!318531 () Bool)

(assert (=> d!97853 (= lt!318531 (select (content!358 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!400624 () Bool)

(assert (=> d!97853 (= lt!318531 e!400624)))

(declare-fun res!475346 () Bool)

(assert (=> d!97853 (=> (not res!475346) (not e!400624))))

(assert (=> d!97853 (= res!475346 ((_ is Cons!13391) acc!652))))

(assert (=> d!97853 (= (contains!3972 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000) lt!318531)))

(declare-fun b!712118 () Bool)

(declare-fun e!400625 () Bool)

(assert (=> b!712118 (= e!400624 e!400625)))

(declare-fun res!475347 () Bool)

(assert (=> b!712118 (=> res!475347 e!400625)))

(assert (=> b!712118 (= res!475347 (= (h!14436 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!712119 () Bool)

(assert (=> b!712119 (= e!400625 (contains!3972 (t!19704 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!97853 res!475346) b!712118))

(assert (= (and b!712118 (not res!475347)) b!712119))

(declare-fun m!669069 () Bool)

(assert (=> d!97853 m!669069))

(declare-fun m!669071 () Bool)

(assert (=> d!97853 m!669071))

(declare-fun m!669073 () Bool)

(assert (=> b!712119 m!669073))

(assert (=> b!711969 d!97853))

(declare-fun d!97855 () Bool)

(declare-fun res!475348 () Bool)

(declare-fun e!400626 () Bool)

(assert (=> d!97855 (=> res!475348 e!400626)))

(assert (=> d!97855 (= res!475348 ((_ is Nil!13392) lt!318518))))

(assert (=> d!97855 (= (noDuplicate!1219 lt!318518) e!400626)))

(declare-fun b!712120 () Bool)

(declare-fun e!400627 () Bool)

(assert (=> b!712120 (= e!400626 e!400627)))

(declare-fun res!475349 () Bool)

(assert (=> b!712120 (=> (not res!475349) (not e!400627))))

(assert (=> b!712120 (= res!475349 (not (contains!3972 (t!19704 lt!318518) (h!14436 lt!318518))))))

(declare-fun b!712121 () Bool)

(assert (=> b!712121 (= e!400627 (noDuplicate!1219 (t!19704 lt!318518)))))

(assert (= (and d!97855 (not res!475348)) b!712120))

(assert (= (and b!712120 res!475349) b!712121))

(declare-fun m!669075 () Bool)

(assert (=> b!712120 m!669075))

(declare-fun m!669077 () Bool)

(assert (=> b!712121 m!669077))

(assert (=> b!711988 d!97855))

(declare-fun b!712144 () Bool)

(declare-fun e!400651 () Bool)

(declare-fun e!400648 () Bool)

(assert (=> b!712144 (= e!400651 e!400648)))

(declare-fun res!475369 () Bool)

(assert (=> b!712144 (=> (not res!475369) (not e!400648))))

(declare-fun e!400650 () Bool)

(assert (=> b!712144 (= res!475369 (not e!400650))))

(declare-fun res!475368 () Bool)

(assert (=> b!712144 (=> (not res!475368) (not e!400650))))

(assert (=> b!712144 (= res!475368 (validKeyInArray!0 (select (arr!19354 a!3591) (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!712145 () Bool)

(declare-fun e!400649 () Bool)

(declare-fun call!34545 () Bool)

(assert (=> b!712145 (= e!400649 call!34545)))

(declare-fun b!712146 () Bool)

(assert (=> b!712146 (= e!400648 e!400649)))

(declare-fun c!78755 () Bool)

(assert (=> b!712146 (= c!78755 (validKeyInArray!0 (select (arr!19354 a!3591) (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun d!97857 () Bool)

(declare-fun res!475370 () Bool)

(assert (=> d!97857 (=> res!475370 e!400651)))

(assert (=> d!97857 (= res!475370 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) (size!19759 a!3591)))))

(assert (=> d!97857 (= (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) lt!318518) e!400651)))

(declare-fun b!712147 () Bool)

(assert (=> b!712147 (= e!400650 (contains!3972 lt!318518 (select (arr!19354 a!3591) (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun bm!34542 () Bool)

(assert (=> bm!34542 (= call!34545 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969 #b00000000000000000000000000000001) (ite c!78755 (Cons!13391 (select (arr!19354 a!3591) (bvadd #b00000000000000000000000000000001 from!2969)) lt!318518) lt!318518)))))

(declare-fun b!712148 () Bool)

(assert (=> b!712148 (= e!400649 call!34545)))

(assert (= (and d!97857 (not res!475370)) b!712144))

(assert (= (and b!712144 res!475368) b!712147))

(assert (= (and b!712144 res!475369) b!712146))

(assert (= (and b!712146 c!78755) b!712148))

(assert (= (and b!712146 (not c!78755)) b!712145))

(assert (= (or b!712148 b!712145) bm!34542))

(declare-fun m!669089 () Bool)

(assert (=> b!712144 m!669089))

(assert (=> b!712144 m!669089))

(declare-fun m!669091 () Bool)

(assert (=> b!712144 m!669091))

(assert (=> b!712146 m!669089))

(assert (=> b!712146 m!669089))

(assert (=> b!712146 m!669091))

(assert (=> b!712147 m!669089))

(assert (=> b!712147 m!669089))

(declare-fun m!669093 () Bool)

(assert (=> b!712147 m!669093))

(assert (=> bm!34542 m!669089))

(declare-fun m!669095 () Bool)

(assert (=> bm!34542 m!669095))

(assert (=> b!711967 d!97857))

(declare-fun d!97867 () Bool)

(declare-fun res!475389 () Bool)

(declare-fun e!400672 () Bool)

(assert (=> d!97867 (=> res!475389 e!400672)))

(assert (=> d!97867 (= res!475389 (= (select (arr!19354 a!3591) (bvadd #b00000000000000000000000000000001 from!2969)) k0!2824))))

(assert (=> d!97867 (= (arrayContainsKey!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969)) e!400672)))

(declare-fun b!712171 () Bool)

(declare-fun e!400673 () Bool)

(assert (=> b!712171 (= e!400672 e!400673)))

(declare-fun res!475390 () Bool)

(assert (=> b!712171 (=> (not res!475390) (not e!400673))))

(assert (=> b!712171 (= res!475390 (bvslt (bvadd #b00000000000000000000000000000001 from!2969 #b00000000000000000000000000000001) (size!19759 a!3591)))))

(declare-fun b!712172 () Bool)

(assert (=> b!712172 (= e!400673 (arrayContainsKey!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969 #b00000000000000000000000000000001)))))

(assert (= (and d!97867 (not res!475389)) b!712171))

(assert (= (and b!712171 res!475390) b!712172))

(assert (=> d!97867 m!669089))

(declare-fun m!669107 () Bool)

(assert (=> b!712172 m!669107))

(assert (=> b!711989 d!97867))

(declare-fun d!97873 () Bool)

(declare-fun lt!318538 () Bool)

(assert (=> d!97873 (= lt!318538 (select (content!358 lt!318518) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!400674 () Bool)

(assert (=> d!97873 (= lt!318538 e!400674)))

(declare-fun res!475391 () Bool)

(assert (=> d!97873 (=> (not res!475391) (not e!400674))))

(assert (=> d!97873 (= res!475391 ((_ is Cons!13391) lt!318518))))

(assert (=> d!97873 (= (contains!3972 lt!318518 #b0000000000000000000000000000000000000000000000000000000000000000) lt!318538)))

(declare-fun b!712173 () Bool)

(declare-fun e!400675 () Bool)

(assert (=> b!712173 (= e!400674 e!400675)))

(declare-fun res!475392 () Bool)

(assert (=> b!712173 (=> res!475392 e!400675)))

(assert (=> b!712173 (= res!475392 (= (h!14436 lt!318518) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!712174 () Bool)

(assert (=> b!712174 (= e!400675 (contains!3972 (t!19704 lt!318518) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!97873 res!475391) b!712173))

(assert (= (and b!712173 (not res!475392)) b!712174))

(declare-fun m!669109 () Bool)

(assert (=> d!97873 m!669109))

(declare-fun m!669111 () Bool)

(assert (=> d!97873 m!669111))

(declare-fun m!669113 () Bool)

(assert (=> b!712174 m!669113))

(assert (=> b!711992 d!97873))

(declare-fun d!97875 () Bool)

(assert (=> d!97875 (= (validKeyInArray!0 (select (arr!19354 a!3591) from!2969)) (and (not (= (select (arr!19354 a!3591) from!2969) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19354 a!3591) from!2969) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!711971 d!97875))

(declare-fun d!97877 () Bool)

(declare-fun res!475393 () Bool)

(declare-fun e!400676 () Bool)

(assert (=> d!97877 (=> res!475393 e!400676)))

(assert (=> d!97877 (= res!475393 ((_ is Nil!13392) acc!652))))

(assert (=> d!97877 (= (noDuplicate!1219 acc!652) e!400676)))

(declare-fun b!712175 () Bool)

(declare-fun e!400677 () Bool)

(assert (=> b!712175 (= e!400676 e!400677)))

(declare-fun res!475394 () Bool)

(assert (=> b!712175 (=> (not res!475394) (not e!400677))))

(assert (=> b!712175 (= res!475394 (not (contains!3972 (t!19704 acc!652) (h!14436 acc!652))))))

(declare-fun b!712176 () Bool)

(assert (=> b!712176 (= e!400677 (noDuplicate!1219 (t!19704 acc!652)))))

(assert (= (and d!97877 (not res!475393)) b!712175))

(assert (= (and b!712175 res!475394) b!712176))

(declare-fun m!669115 () Bool)

(assert (=> b!712175 m!669115))

(declare-fun m!669117 () Bool)

(assert (=> b!712176 m!669117))

(assert (=> b!711993 d!97877))

(declare-fun d!97879 () Bool)

(declare-fun lt!318539 () Bool)

(assert (=> d!97879 (= lt!318539 (select (content!358 lt!318517) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!400678 () Bool)

(assert (=> d!97879 (= lt!318539 e!400678)))

(declare-fun res!475395 () Bool)

(assert (=> d!97879 (=> (not res!475395) (not e!400678))))

(assert (=> d!97879 (= res!475395 ((_ is Cons!13391) lt!318517))))

(assert (=> d!97879 (= (contains!3972 lt!318517 #b0000000000000000000000000000000000000000000000000000000000000000) lt!318539)))

(declare-fun b!712177 () Bool)

(declare-fun e!400679 () Bool)

(assert (=> b!712177 (= e!400678 e!400679)))

(declare-fun res!475396 () Bool)

(assert (=> b!712177 (=> res!475396 e!400679)))

(assert (=> b!712177 (= res!475396 (= (h!14436 lt!318517) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!712178 () Bool)

(assert (=> b!712178 (= e!400679 (contains!3972 (t!19704 lt!318517) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!97879 res!475395) b!712177))

(assert (= (and b!712177 (not res!475396)) b!712178))

(assert (=> d!97879 m!669063))

(declare-fun m!669119 () Bool)

(assert (=> d!97879 m!669119))

(declare-fun m!669121 () Bool)

(assert (=> b!712178 m!669121))

(assert (=> b!711991 d!97879))

(declare-fun d!97881 () Bool)

(declare-fun res!475397 () Bool)

(declare-fun e!400680 () Bool)

(assert (=> d!97881 (=> res!475397 e!400680)))

(assert (=> d!97881 (= res!475397 ((_ is Nil!13392) lt!318517))))

(assert (=> d!97881 (= (noDuplicate!1219 lt!318517) e!400680)))

(declare-fun b!712179 () Bool)

(declare-fun e!400681 () Bool)

(assert (=> b!712179 (= e!400680 e!400681)))

(declare-fun res!475398 () Bool)

(assert (=> b!712179 (=> (not res!475398) (not e!400681))))

(assert (=> b!712179 (= res!475398 (not (contains!3972 (t!19704 lt!318517) (h!14436 lt!318517))))))

(declare-fun b!712180 () Bool)

(assert (=> b!712180 (= e!400681 (noDuplicate!1219 (t!19704 lt!318517)))))

(assert (= (and d!97881 (not res!475397)) b!712179))

(assert (= (and b!712179 res!475398) b!712180))

(declare-fun m!669123 () Bool)

(assert (=> b!712179 m!669123))

(declare-fun m!669125 () Bool)

(assert (=> b!712180 m!669125))

(assert (=> b!711970 d!97881))

(declare-fun d!97883 () Bool)

(declare-fun lt!318540 () Bool)

(assert (=> d!97883 (= lt!318540 (select (content!358 newAcc!49) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!400686 () Bool)

(assert (=> d!97883 (= lt!318540 e!400686)))

(declare-fun res!475402 () Bool)

(assert (=> d!97883 (=> (not res!475402) (not e!400686))))

(assert (=> d!97883 (= res!475402 ((_ is Cons!13391) newAcc!49))))

(assert (=> d!97883 (= (contains!3972 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000) lt!318540)))

(declare-fun b!712186 () Bool)

(declare-fun e!400687 () Bool)

(assert (=> b!712186 (= e!400686 e!400687)))

(declare-fun res!475403 () Bool)

(assert (=> b!712186 (=> res!475403 e!400687)))

(assert (=> b!712186 (= res!475403 (= (h!14436 newAcc!49) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!712187 () Bool)

(assert (=> b!712187 (= e!400687 (contains!3972 (t!19704 newAcc!49) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!97883 res!475402) b!712186))

(assert (= (and b!712186 (not res!475403)) b!712187))

(assert (=> d!97883 m!669049))

(declare-fun m!669127 () Bool)

(assert (=> d!97883 m!669127))

(declare-fun m!669129 () Bool)

(assert (=> b!712187 m!669129))

(assert (=> b!711974 d!97883))

(declare-fun d!97885 () Bool)

(declare-fun lt!318541 () Bool)

(assert (=> d!97885 (= lt!318541 (select (content!358 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!400694 () Bool)

(assert (=> d!97885 (= lt!318541 e!400694)))

(declare-fun res!475410 () Bool)

(assert (=> d!97885 (=> (not res!475410) (not e!400694))))

(assert (=> d!97885 (= res!475410 ((_ is Cons!13391) newAcc!49))))

(assert (=> d!97885 (= (contains!3972 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000) lt!318541)))

(declare-fun b!712192 () Bool)

(declare-fun e!400695 () Bool)

(assert (=> b!712192 (= e!400694 e!400695)))

(declare-fun res!475411 () Bool)

(assert (=> b!712192 (=> res!475411 e!400695)))

(assert (=> b!712192 (= res!475411 (= (h!14436 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!712193 () Bool)

(assert (=> b!712193 (= e!400695 (contains!3972 (t!19704 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!97885 res!475410) b!712192))

(assert (= (and b!712192 (not res!475411)) b!712193))

(assert (=> d!97885 m!669049))

(declare-fun m!669137 () Bool)

(assert (=> d!97885 m!669137))

(declare-fun m!669139 () Bool)

(assert (=> b!712193 m!669139))

(assert (=> b!711972 d!97885))

(declare-fun b!712200 () Bool)

(declare-fun e!400701 () Bool)

(declare-fun e!400698 () Bool)

(assert (=> b!712200 (= e!400701 e!400698)))

(declare-fun res!475413 () Bool)

(assert (=> b!712200 (=> (not res!475413) (not e!400698))))

(declare-fun e!400700 () Bool)

(assert (=> b!712200 (= res!475413 (not e!400700))))

(declare-fun res!475412 () Bool)

(assert (=> b!712200 (=> (not res!475412) (not e!400700))))

(assert (=> b!712200 (= res!475412 (validKeyInArray!0 (select (arr!19354 a!3591) from!2969)))))

(declare-fun b!712201 () Bool)

(declare-fun e!400699 () Bool)

(declare-fun call!34549 () Bool)

(assert (=> b!712201 (= e!400699 call!34549)))

(declare-fun b!712202 () Bool)

(assert (=> b!712202 (= e!400698 e!400699)))

(declare-fun c!78761 () Bool)

(assert (=> b!712202 (= c!78761 (validKeyInArray!0 (select (arr!19354 a!3591) from!2969)))))

(declare-fun d!97887 () Bool)

(declare-fun res!475414 () Bool)

(assert (=> d!97887 (=> res!475414 e!400701)))

(assert (=> d!97887 (= res!475414 (bvsge from!2969 (size!19759 a!3591)))))

(assert (=> d!97887 (= (arrayNoDuplicates!0 a!3591 from!2969 acc!652) e!400701)))

(declare-fun b!712203 () Bool)

(assert (=> b!712203 (= e!400700 (contains!3972 acc!652 (select (arr!19354 a!3591) from!2969)))))

(declare-fun bm!34546 () Bool)

(assert (=> bm!34546 (= call!34549 (arrayNoDuplicates!0 a!3591 (bvadd from!2969 #b00000000000000000000000000000001) (ite c!78761 (Cons!13391 (select (arr!19354 a!3591) from!2969) acc!652) acc!652)))))

(declare-fun b!712204 () Bool)

(assert (=> b!712204 (= e!400699 call!34549)))

(assert (= (and d!97887 (not res!475414)) b!712200))

(assert (= (and b!712200 res!475412) b!712203))

(assert (= (and b!712200 res!475413) b!712202))

(assert (= (and b!712202 c!78761) b!712204))

(assert (= (and b!712202 (not c!78761)) b!712201))

(assert (= (or b!712204 b!712201) bm!34546))

(assert (=> b!712200 m!668949))

(assert (=> b!712200 m!668949))

(assert (=> b!712200 m!668961))

(assert (=> b!712202 m!668949))

(assert (=> b!712202 m!668949))

(assert (=> b!712202 m!668961))

(assert (=> b!712203 m!668949))

(assert (=> b!712203 m!668949))

(declare-fun m!669143 () Bool)

(assert (=> b!712203 m!669143))

(assert (=> bm!34546 m!668949))

(declare-fun m!669145 () Bool)

(assert (=> bm!34546 m!669145))

(assert (=> b!711994 d!97887))

(declare-fun d!97891 () Bool)

(assert (=> d!97891 (= ($colon$colon!528 newAcc!49 (select (arr!19354 a!3591) from!2969)) (Cons!13391 (select (arr!19354 a!3591) from!2969) newAcc!49))))

(assert (=> b!711973 d!97891))

(declare-fun d!97893 () Bool)

(assert (=> d!97893 (= ($colon$colon!528 acc!652 (select (arr!19354 a!3591) from!2969)) (Cons!13391 (select (arr!19354 a!3591) from!2969) acc!652))))

(assert (=> b!711973 d!97893))

(declare-fun d!97895 () Bool)

(declare-fun lt!318542 () Bool)

(assert (=> d!97895 (= lt!318542 (select (content!358 lt!318518) k0!2824))))

(declare-fun e!400706 () Bool)

(assert (=> d!97895 (= lt!318542 e!400706)))

(declare-fun res!475419 () Bool)

(assert (=> d!97895 (=> (not res!475419) (not e!400706))))

(assert (=> d!97895 (= res!475419 ((_ is Cons!13391) lt!318518))))

(assert (=> d!97895 (= (contains!3972 lt!318518 k0!2824) lt!318542)))

(declare-fun b!712209 () Bool)

(declare-fun e!400707 () Bool)

(assert (=> b!712209 (= e!400706 e!400707)))

(declare-fun res!475420 () Bool)

(assert (=> b!712209 (=> res!475420 e!400707)))

(assert (=> b!712209 (= res!475420 (= (h!14436 lt!318518) k0!2824))))

(declare-fun b!712210 () Bool)

(assert (=> b!712210 (= e!400707 (contains!3972 (t!19704 lt!318518) k0!2824))))

(assert (= (and d!97895 res!475419) b!712209))

(assert (= (and b!712209 (not res!475420)) b!712210))

(assert (=> d!97895 m!669109))

(declare-fun m!669147 () Bool)

(assert (=> d!97895 m!669147))

(declare-fun m!669149 () Bool)

(assert (=> b!712210 m!669149))

(assert (=> b!711976 d!97895))

(declare-fun d!97897 () Bool)

(declare-fun lt!318543 () Bool)

(assert (=> d!97897 (= lt!318543 (select (content!358 acc!652) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!400708 () Bool)

(assert (=> d!97897 (= lt!318543 e!400708)))

(declare-fun res!475421 () Bool)

(assert (=> d!97897 (=> (not res!475421) (not e!400708))))

(assert (=> d!97897 (= res!475421 ((_ is Cons!13391) acc!652))))

(assert (=> d!97897 (= (contains!3972 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000) lt!318543)))

(declare-fun b!712211 () Bool)

(declare-fun e!400709 () Bool)

(assert (=> b!712211 (= e!400708 e!400709)))

(declare-fun res!475422 () Bool)

(assert (=> b!712211 (=> res!475422 e!400709)))

(assert (=> b!712211 (= res!475422 (= (h!14436 acc!652) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!712212 () Bool)

(assert (=> b!712212 (= e!400709 (contains!3972 (t!19704 acc!652) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!97897 res!475421) b!712211))

(assert (= (and b!712211 (not res!475422)) b!712212))

(assert (=> d!97897 m!669069))

(declare-fun m!669151 () Bool)

(assert (=> d!97897 m!669151))

(declare-fun m!669153 () Bool)

(assert (=> b!712212 m!669153))

(assert (=> b!711977 d!97897))

(declare-fun d!97899 () Bool)

(assert (=> d!97899 (= (array_inv!15150 a!3591) (bvsge (size!19759 a!3591) #b00000000000000000000000000000000))))

(assert (=> start!63210 d!97899))

(declare-fun d!97901 () Bool)

(declare-fun lt!318544 () Bool)

(assert (=> d!97901 (= lt!318544 (select (content!358 acc!652) k0!2824))))

(declare-fun e!400712 () Bool)

(assert (=> d!97901 (= lt!318544 e!400712)))

(declare-fun res!475425 () Bool)

(assert (=> d!97901 (=> (not res!475425) (not e!400712))))

(assert (=> d!97901 (= res!475425 ((_ is Cons!13391) acc!652))))

(assert (=> d!97901 (= (contains!3972 acc!652 k0!2824) lt!318544)))

(declare-fun b!712215 () Bool)

(declare-fun e!400713 () Bool)

(assert (=> b!712215 (= e!400712 e!400713)))

(declare-fun res!475426 () Bool)

(assert (=> b!712215 (=> res!475426 e!400713)))

(assert (=> b!712215 (= res!475426 (= (h!14436 acc!652) k0!2824))))

(declare-fun b!712216 () Bool)

(assert (=> b!712216 (= e!400713 (contains!3972 (t!19704 acc!652) k0!2824))))

(assert (= (and d!97901 res!475425) b!712215))

(assert (= (and b!712215 (not res!475426)) b!712216))

(assert (=> d!97901 m!669069))

(declare-fun m!669155 () Bool)

(assert (=> d!97901 m!669155))

(declare-fun m!669159 () Bool)

(assert (=> b!712216 m!669159))

(assert (=> b!711979 d!97901))

(declare-fun d!97903 () Bool)

(declare-fun res!475427 () Bool)

(declare-fun e!400714 () Bool)

(assert (=> d!97903 (=> res!475427 e!400714)))

(assert (=> d!97903 (= res!475427 (= (select (arr!19354 a!3591) from!2969) k0!2824))))

(assert (=> d!97903 (= (arrayContainsKey!0 a!3591 k0!2824 from!2969) e!400714)))

(declare-fun b!712217 () Bool)

(declare-fun e!400715 () Bool)

(assert (=> b!712217 (= e!400714 e!400715)))

(declare-fun res!475428 () Bool)

(assert (=> b!712217 (=> (not res!475428) (not e!400715))))

(assert (=> b!712217 (= res!475428 (bvslt (bvadd from!2969 #b00000000000000000000000000000001) (size!19759 a!3591)))))

(declare-fun b!712218 () Bool)

(assert (=> b!712218 (= e!400715 (arrayContainsKey!0 a!3591 k0!2824 (bvadd from!2969 #b00000000000000000000000000000001)))))

(assert (= (and d!97903 (not res!475427)) b!712217))

(assert (= (and b!712217 res!475428) b!712218))

(assert (=> d!97903 m!668949))

(declare-fun m!669163 () Bool)

(assert (=> b!712218 m!669163))

(assert (=> b!711978 d!97903))

(declare-fun d!97907 () Bool)

(declare-fun e!400721 () Bool)

(assert (=> d!97907 e!400721))

(declare-fun res!475432 () Bool)

(assert (=> d!97907 (=> (not res!475432) (not e!400721))))

(declare-fun lt!318545 () List!13395)

(assert (=> d!97907 (= res!475432 (<= (size!19761 lt!318545) (size!19761 lt!318517)))))

(declare-fun e!400720 () List!13395)

(assert (=> d!97907 (= lt!318545 e!400720)))

(declare-fun c!78764 () Bool)

(assert (=> d!97907 (= c!78764 ((_ is Cons!13391) lt!318517))))

(assert (=> d!97907 (= (-!382 lt!318517 k0!2824) lt!318545)))

(declare-fun b!712224 () Bool)

(declare-fun e!400722 () List!13395)

(declare-fun call!34553 () List!13395)

(assert (=> b!712224 (= e!400722 call!34553)))

(declare-fun b!712225 () Bool)

(assert (=> b!712225 (= e!400720 e!400722)))

(declare-fun c!78763 () Bool)

(assert (=> b!712225 (= c!78763 (= k0!2824 (h!14436 lt!318517)))))

(declare-fun b!712226 () Bool)

(assert (=> b!712226 (= e!400721 (= (content!358 lt!318545) ((_ map and) (content!358 lt!318517) ((_ map not) (store ((as const (Array (_ BitVec 64) Bool)) false) k0!2824 true)))))))

(declare-fun b!712227 () Bool)

(assert (=> b!712227 (= e!400720 Nil!13392)))

(declare-fun b!712228 () Bool)

(assert (=> b!712228 (= e!400722 (Cons!13391 (h!14436 lt!318517) call!34553))))

(declare-fun bm!34550 () Bool)

(assert (=> bm!34550 (= call!34553 (-!382 (t!19704 lt!318517) k0!2824))))

(assert (= (and d!97907 c!78764) b!712225))

(assert (= (and d!97907 (not c!78764)) b!712227))

(assert (= (and b!712225 c!78763) b!712224))

(assert (= (and b!712225 (not c!78763)) b!712228))

(assert (= (or b!712224 b!712228) bm!34550))

(assert (= (and d!97907 res!475432) b!712226))

(declare-fun m!669167 () Bool)

(assert (=> d!97907 m!669167))

(declare-fun m!669169 () Bool)

(assert (=> d!97907 m!669169))

(declare-fun m!669171 () Bool)

(assert (=> b!712226 m!669171))

(assert (=> b!712226 m!669063))

(assert (=> b!712226 m!669051))

(declare-fun m!669175 () Bool)

(assert (=> bm!34550 m!669175))

(assert (=> b!711982 d!97907))

(declare-fun d!97909 () Bool)

(declare-fun lt!318546 () Bool)

(assert (=> d!97909 (= lt!318546 (select (content!358 lt!318517) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!400723 () Bool)

(assert (=> d!97909 (= lt!318546 e!400723)))

(declare-fun res!475433 () Bool)

(assert (=> d!97909 (=> (not res!475433) (not e!400723))))

(assert (=> d!97909 (= res!475433 ((_ is Cons!13391) lt!318517))))

(assert (=> d!97909 (= (contains!3972 lt!318517 #b1000000000000000000000000000000000000000000000000000000000000000) lt!318546)))

(declare-fun b!712229 () Bool)

(declare-fun e!400724 () Bool)

(assert (=> b!712229 (= e!400723 e!400724)))

(declare-fun res!475434 () Bool)

(assert (=> b!712229 (=> res!475434 e!400724)))

(assert (=> b!712229 (= res!475434 (= (h!14436 lt!318517) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!712230 () Bool)

(assert (=> b!712230 (= e!400724 (contains!3972 (t!19704 lt!318517) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!97909 res!475433) b!712229))

(assert (= (and b!712229 (not res!475434)) b!712230))

(assert (=> d!97909 m!669063))

(declare-fun m!669181 () Bool)

(assert (=> d!97909 m!669181))

(declare-fun m!669183 () Bool)

(assert (=> b!712230 m!669183))

(assert (=> b!711980 d!97909))

(declare-fun d!97915 () Bool)

(declare-fun lt!318549 () Bool)

(assert (=> d!97915 (= lt!318549 (select (content!358 lt!318518) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!400729 () Bool)

(assert (=> d!97915 (= lt!318549 e!400729)))

(declare-fun res!475439 () Bool)

(assert (=> d!97915 (=> (not res!475439) (not e!400729))))

(assert (=> d!97915 (= res!475439 ((_ is Cons!13391) lt!318518))))

(assert (=> d!97915 (= (contains!3972 lt!318518 #b1000000000000000000000000000000000000000000000000000000000000000) lt!318549)))

(declare-fun b!712235 () Bool)

(declare-fun e!400730 () Bool)

(assert (=> b!712235 (= e!400729 e!400730)))

(declare-fun res!475440 () Bool)

(assert (=> b!712235 (=> res!475440 e!400730)))

(assert (=> b!712235 (= res!475440 (= (h!14436 lt!318518) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!712236 () Bool)

(assert (=> b!712236 (= e!400730 (contains!3972 (t!19704 lt!318518) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!97915 res!475439) b!712235))

(assert (= (and b!712235 (not res!475440)) b!712236))

(assert (=> d!97915 m!669109))

(declare-fun m!669193 () Bool)

(assert (=> d!97915 m!669193))

(declare-fun m!669197 () Bool)

(assert (=> b!712236 m!669197))

(assert (=> b!711981 d!97915))

(declare-fun d!97921 () Bool)

(assert (=> d!97921 (= (validKeyInArray!0 k0!2824) (and (not (= k0!2824 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2824 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!711984 d!97921))

(declare-fun d!97923 () Bool)

(declare-fun lt!318551 () Bool)

(assert (=> d!97923 (= lt!318551 (select (content!358 newAcc!49) k0!2824))))

(declare-fun e!400733 () Bool)

(assert (=> d!97923 (= lt!318551 e!400733)))

(declare-fun res!475443 () Bool)

(assert (=> d!97923 (=> (not res!475443) (not e!400733))))

(assert (=> d!97923 (= res!475443 ((_ is Cons!13391) newAcc!49))))

(assert (=> d!97923 (= (contains!3972 newAcc!49 k0!2824) lt!318551)))

(declare-fun b!712239 () Bool)

(declare-fun e!400734 () Bool)

(assert (=> b!712239 (= e!400733 e!400734)))

(declare-fun res!475444 () Bool)

(assert (=> b!712239 (=> res!475444 e!400734)))

(assert (=> b!712239 (= res!475444 (= (h!14436 newAcc!49) k0!2824))))

(declare-fun b!712240 () Bool)

(assert (=> b!712240 (= e!400734 (contains!3972 (t!19704 newAcc!49) k0!2824))))

(assert (= (and d!97923 res!475443) b!712239))

(assert (= (and b!712239 (not res!475444)) b!712240))

(assert (=> d!97923 m!669049))

(declare-fun m!669201 () Bool)

(assert (=> d!97923 m!669201))

(declare-fun m!669203 () Bool)

(assert (=> b!712240 m!669203))

(assert (=> b!711985 d!97923))

(declare-fun b!712242 () Bool)

(declare-fun e!400735 () Bool)

(declare-fun e!400736 () Bool)

(assert (=> b!712242 (= e!400735 e!400736)))

(declare-fun res!475448 () Bool)

(assert (=> b!712242 (=> res!475448 e!400736)))

(declare-fun e!400737 () Bool)

(assert (=> b!712242 (= res!475448 e!400737)))

(declare-fun res!475447 () Bool)

(assert (=> b!712242 (=> (not res!475447) (not e!400737))))

(assert (=> b!712242 (= res!475447 (= (h!14436 acc!652) (h!14436 newAcc!49)))))

(declare-fun b!712244 () Bool)

(assert (=> b!712244 (= e!400736 (subseq!417 acc!652 (t!19704 newAcc!49)))))

(declare-fun d!97925 () Bool)

(declare-fun res!475446 () Bool)

(declare-fun e!400738 () Bool)

(assert (=> d!97925 (=> res!475446 e!400738)))

(assert (=> d!97925 (= res!475446 ((_ is Nil!13392) acc!652))))

(assert (=> d!97925 (= (subseq!417 acc!652 newAcc!49) e!400738)))

(declare-fun b!712241 () Bool)

(assert (=> b!712241 (= e!400738 e!400735)))

(declare-fun res!475445 () Bool)

(assert (=> b!712241 (=> (not res!475445) (not e!400735))))

(assert (=> b!712241 (= res!475445 ((_ is Cons!13391) newAcc!49))))

(declare-fun b!712243 () Bool)

(assert (=> b!712243 (= e!400737 (subseq!417 (t!19704 acc!652) (t!19704 newAcc!49)))))

(assert (= (and d!97925 (not res!475446)) b!712241))

(assert (= (and b!712241 res!475445) b!712242))

(assert (= (and b!712242 res!475447) b!712243))

(assert (= (and b!712242 (not res!475448)) b!712244))

(declare-fun m!669209 () Bool)

(assert (=> b!712244 m!669209))

(declare-fun m!669211 () Bool)

(assert (=> b!712243 m!669211))

(assert (=> b!711983 d!97925))

(check-sat (not d!97873) (not b!712175) (not b!712146) (not bm!34539) (not d!97843) (not b!712180) (not d!97897) (not d!97915) (not b!712212) (not bm!34546) (not b!712104) (not b!712240) (not b!712174) (not d!97909) (not b!712243) (not b!712105) (not bm!34550) (not d!97895) (not b!712147) (not d!97853) (not b!712119) (not b!712091) (not d!97901) (not b!712236) (not b!712120) (not b!712111) (not b!712230) (not b!712178) (not d!97849) (not b!712200) (not b!712226) (not d!97907) (not b!712244) (not bm!34542) (not b!712121) (not b!712193) (not b!712179) (not b!712110) (not b!712172) (not d!97923) (not d!97883) (not b!712117) (not b!712202) (not b!712144) (not b!712216) (not b!712218) (not b!712203) (not b!712176) (not d!97885) (not d!97879) (not b!712187) (not b!712210))
(check-sat)
