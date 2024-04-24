; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!61338 () Bool)

(assert start!61338)

(declare-fun res!451861 () Bool)

(declare-fun e!391136 () Bool)

(assert (=> start!61338 (=> (not res!451861) (not e!391136))))

(declare-datatypes ((array!39660 0))(
  ( (array!39661 (arr!19003 (Array (_ BitVec 32) (_ BitVec 64))) (size!19378 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39660)

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> start!61338 (= res!451861 (and (bvslt (size!19378 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19378 a!3626))))))

(assert (=> start!61338 e!391136))

(assert (=> start!61338 true))

(declare-fun array_inv!14862 (array!39660) Bool)

(assert (=> start!61338 (array_inv!14862 a!3626)))

(declare-fun b!686875 () Bool)

(declare-datatypes ((Unit!24186 0))(
  ( (Unit!24187) )
))
(declare-fun e!391130 () Unit!24186)

(declare-fun Unit!24188 () Unit!24186)

(assert (=> b!686875 (= e!391130 Unit!24188)))

(declare-fun lt!315250 () Unit!24186)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39660 (_ BitVec 64) (_ BitVec 32)) Unit!24186)

(assert (=> b!686875 (= lt!315250 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!686875 false))

(declare-fun b!686876 () Bool)

(declare-fun e!391135 () Unit!24186)

(declare-fun Unit!24189 () Unit!24186)

(assert (=> b!686876 (= e!391135 Unit!24189)))

(declare-fun b!686877 () Bool)

(declare-fun res!451862 () Bool)

(assert (=> b!686877 (=> (not res!451862) (not e!391136))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!686877 (= res!451862 (validKeyInArray!0 k0!2843))))

(declare-fun b!686878 () Bool)

(declare-fun e!391137 () Bool)

(declare-fun e!391133 () Bool)

(assert (=> b!686878 (= e!391137 e!391133)))

(declare-fun res!451867 () Bool)

(assert (=> b!686878 (=> (not res!451867) (not e!391133))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!686878 (= res!451867 (bvsle from!3004 i!1382))))

(declare-fun b!686879 () Bool)

(declare-fun res!451856 () Bool)

(assert (=> b!686879 (=> (not res!451856) (not e!391136))))

(assert (=> b!686879 (= res!451856 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19378 a!3626))))))

(declare-fun b!686880 () Bool)

(declare-fun res!451868 () Bool)

(assert (=> b!686880 (=> (not res!451868) (not e!391136))))

(declare-datatypes ((List!12951 0))(
  ( (Nil!12948) (Cons!12947 (h!13995 (_ BitVec 64)) (t!19198 List!12951)) )
))
(declare-fun acc!681 () List!12951)

(declare-fun noDuplicate!877 (List!12951) Bool)

(assert (=> b!686880 (= res!451868 (noDuplicate!877 acc!681))))

(declare-fun b!686881 () Bool)

(declare-fun Unit!24190 () Unit!24186)

(assert (=> b!686881 (= e!391130 Unit!24190)))

(declare-fun b!686882 () Bool)

(declare-fun res!451857 () Bool)

(assert (=> b!686882 (=> (not res!451857) (not e!391136))))

(declare-fun arrayNoDuplicates!0 (array!39660 (_ BitVec 32) List!12951) Bool)

(assert (=> b!686882 (= res!451857 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!686883 () Bool)

(declare-fun contains!3603 (List!12951 (_ BitVec 64)) Bool)

(assert (=> b!686883 (= e!391133 (not (contains!3603 acc!681 k0!2843)))))

(declare-fun b!686884 () Bool)

(declare-fun res!451858 () Bool)

(assert (=> b!686884 (=> (not res!451858) (not e!391136))))

(declare-fun arrayContainsKey!0 (array!39660 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!686884 (= res!451858 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!686885 () Bool)

(declare-fun e!391131 () Bool)

(declare-fun lt!315249 () List!12951)

(assert (=> b!686885 (= e!391131 (noDuplicate!877 lt!315249))))

(declare-fun b!686886 () Bool)

(declare-fun lt!315252 () Unit!24186)

(assert (=> b!686886 (= e!391135 lt!315252)))

(declare-fun lt!315251 () Unit!24186)

(declare-fun lemmaListSubSeqRefl!0 (List!12951) Unit!24186)

(assert (=> b!686886 (= lt!315251 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun subseq!212 (List!12951 List!12951) Bool)

(assert (=> b!686886 (subseq!212 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39660 List!12951 List!12951 (_ BitVec 32)) Unit!24186)

(declare-fun $colon$colon!374 (List!12951 (_ BitVec 64)) List!12951)

(assert (=> b!686886 (= lt!315252 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!374 acc!681 (select (arr!19003 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!686886 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!686887 () Bool)

(declare-fun e!391132 () Bool)

(assert (=> b!686887 (= e!391132 (contains!3603 acc!681 k0!2843))))

(declare-fun b!686888 () Bool)

(declare-fun res!451870 () Bool)

(assert (=> b!686888 (=> (not res!451870) (not e!391136))))

(assert (=> b!686888 (= res!451870 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12948))))

(declare-fun b!686889 () Bool)

(declare-fun res!451859 () Bool)

(assert (=> b!686889 (=> (not res!451859) (not e!391136))))

(assert (=> b!686889 (= res!451859 e!391137)))

(declare-fun res!451869 () Bool)

(assert (=> b!686889 (=> res!451869 e!391137)))

(assert (=> b!686889 (= res!451869 e!391132)))

(declare-fun res!451866 () Bool)

(assert (=> b!686889 (=> (not res!451866) (not e!391132))))

(assert (=> b!686889 (= res!451866 (bvsgt from!3004 i!1382))))

(declare-fun b!686890 () Bool)

(declare-fun res!451863 () Bool)

(assert (=> b!686890 (=> (not res!451863) (not e!391136))))

(assert (=> b!686890 (= res!451863 (not (contains!3603 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!686891 () Bool)

(declare-fun res!451860 () Bool)

(assert (=> b!686891 (=> (not res!451860) (not e!391136))))

(assert (=> b!686891 (= res!451860 (not (contains!3603 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!686892 () Bool)

(declare-fun res!451864 () Bool)

(assert (=> b!686892 (=> (not res!451864) (not e!391136))))

(assert (=> b!686892 (= res!451864 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19378 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!686893 () Bool)

(assert (=> b!686893 (= e!391136 (not e!391131))))

(declare-fun res!451865 () Bool)

(assert (=> b!686893 (=> res!451865 e!391131)))

(assert (=> b!686893 (= res!451865 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(assert (=> b!686893 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!315249)))

(declare-fun lt!315245 () Unit!24186)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!39660 (_ BitVec 64) (_ BitVec 32) List!12951 List!12951) Unit!24186)

(assert (=> b!686893 (= lt!315245 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!315249))))

(declare-fun -!176 (List!12951 (_ BitVec 64)) List!12951)

(assert (=> b!686893 (= (-!176 lt!315249 k0!2843) acc!681)))

(assert (=> b!686893 (= lt!315249 ($colon$colon!374 acc!681 k0!2843))))

(declare-fun lt!315247 () Unit!24186)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12951) Unit!24186)

(assert (=> b!686893 (= lt!315247 (lemmaLMinusHeadEqualsTail!0 k0!2843 acc!681))))

(assert (=> b!686893 (subseq!212 acc!681 acc!681)))

(declare-fun lt!315246 () Unit!24186)

(assert (=> b!686893 (= lt!315246 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!686893 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!315248 () Unit!24186)

(assert (=> b!686893 (= lt!315248 e!391135)))

(declare-fun c!77878 () Bool)

(assert (=> b!686893 (= c!77878 (validKeyInArray!0 (select (arr!19003 a!3626) from!3004)))))

(declare-fun lt!315253 () Unit!24186)

(assert (=> b!686893 (= lt!315253 e!391130)))

(declare-fun c!77879 () Bool)

(assert (=> b!686893 (= c!77879 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!686893 (arrayContainsKey!0 (array!39661 (store (arr!19003 a!3626) i!1382 k0!2843) (size!19378 a!3626)) k0!2843 from!3004)))

(assert (= (and start!61338 res!451861) b!686880))

(assert (= (and b!686880 res!451868) b!686891))

(assert (= (and b!686891 res!451860) b!686890))

(assert (= (and b!686890 res!451863) b!686889))

(assert (= (and b!686889 res!451866) b!686887))

(assert (= (and b!686889 (not res!451869)) b!686878))

(assert (= (and b!686878 res!451867) b!686883))

(assert (= (and b!686889 res!451859) b!686888))

(assert (= (and b!686888 res!451870) b!686882))

(assert (= (and b!686882 res!451857) b!686879))

(assert (= (and b!686879 res!451856) b!686877))

(assert (= (and b!686877 res!451862) b!686884))

(assert (= (and b!686884 res!451858) b!686892))

(assert (= (and b!686892 res!451864) b!686893))

(assert (= (and b!686893 c!77879) b!686875))

(assert (= (and b!686893 (not c!77879)) b!686881))

(assert (= (and b!686893 c!77878) b!686886))

(assert (= (and b!686893 (not c!77878)) b!686876))

(assert (= (and b!686893 (not res!451865)) b!686885))

(declare-fun m!651427 () Bool)

(assert (=> b!686893 m!651427))

(declare-fun m!651429 () Bool)

(assert (=> b!686893 m!651429))

(declare-fun m!651431 () Bool)

(assert (=> b!686893 m!651431))

(declare-fun m!651433 () Bool)

(assert (=> b!686893 m!651433))

(declare-fun m!651435 () Bool)

(assert (=> b!686893 m!651435))

(declare-fun m!651437 () Bool)

(assert (=> b!686893 m!651437))

(declare-fun m!651439 () Bool)

(assert (=> b!686893 m!651439))

(declare-fun m!651441 () Bool)

(assert (=> b!686893 m!651441))

(declare-fun m!651443 () Bool)

(assert (=> b!686893 m!651443))

(declare-fun m!651445 () Bool)

(assert (=> b!686893 m!651445))

(assert (=> b!686893 m!651441))

(declare-fun m!651447 () Bool)

(assert (=> b!686893 m!651447))

(declare-fun m!651449 () Bool)

(assert (=> b!686893 m!651449))

(declare-fun m!651451 () Bool)

(assert (=> b!686893 m!651451))

(declare-fun m!651453 () Bool)

(assert (=> b!686888 m!651453))

(assert (=> b!686886 m!651427))

(assert (=> b!686886 m!651441))

(declare-fun m!651455 () Bool)

(assert (=> b!686886 m!651455))

(declare-fun m!651457 () Bool)

(assert (=> b!686886 m!651457))

(assert (=> b!686886 m!651441))

(assert (=> b!686886 m!651455))

(assert (=> b!686886 m!651433))

(assert (=> b!686886 m!651451))

(declare-fun m!651459 () Bool)

(assert (=> b!686883 m!651459))

(declare-fun m!651461 () Bool)

(assert (=> b!686891 m!651461))

(declare-fun m!651463 () Bool)

(assert (=> b!686890 m!651463))

(declare-fun m!651465 () Bool)

(assert (=> b!686875 m!651465))

(declare-fun m!651467 () Bool)

(assert (=> b!686880 m!651467))

(declare-fun m!651469 () Bool)

(assert (=> b!686877 m!651469))

(assert (=> b!686887 m!651459))

(declare-fun m!651471 () Bool)

(assert (=> b!686885 m!651471))

(declare-fun m!651473 () Bool)

(assert (=> b!686884 m!651473))

(declare-fun m!651475 () Bool)

(assert (=> b!686882 m!651475))

(declare-fun m!651477 () Bool)

(assert (=> start!61338 m!651477))

(check-sat (not b!686886) (not b!686888) (not start!61338) (not b!686875) (not b!686877) (not b!686885) (not b!686891) (not b!686887) (not b!686890) (not b!686884) (not b!686880) (not b!686883) (not b!686893) (not b!686882))
(check-sat)
(get-model)

(declare-fun d!94889 () Bool)

(assert (=> d!94889 (= ($colon$colon!374 acc!681 (select (arr!19003 a!3626) from!3004)) (Cons!12947 (select (arr!19003 a!3626) from!3004) acc!681))))

(assert (=> b!686886 d!94889))

(declare-fun d!94891 () Bool)

(declare-fun res!451972 () Bool)

(declare-fun e!391194 () Bool)

(assert (=> d!94891 (=> res!451972 e!391194)))

(get-info :version)

(assert (=> d!94891 (= res!451972 ((_ is Nil!12948) acc!681))))

(assert (=> d!94891 (= (subseq!212 acc!681 acc!681) e!391194)))

(declare-fun b!687018 () Bool)

(declare-fun e!391195 () Bool)

(assert (=> b!687018 (= e!391195 (subseq!212 (t!19198 acc!681) (t!19198 acc!681)))))

(declare-fun b!687017 () Bool)

(declare-fun e!391197 () Bool)

(declare-fun e!391196 () Bool)

(assert (=> b!687017 (= e!391197 e!391196)))

(declare-fun res!451971 () Bool)

(assert (=> b!687017 (=> res!451971 e!391196)))

(assert (=> b!687017 (= res!451971 e!391195)))

(declare-fun res!451970 () Bool)

(assert (=> b!687017 (=> (not res!451970) (not e!391195))))

(assert (=> b!687017 (= res!451970 (= (h!13995 acc!681) (h!13995 acc!681)))))

(declare-fun b!687019 () Bool)

(assert (=> b!687019 (= e!391196 (subseq!212 acc!681 (t!19198 acc!681)))))

(declare-fun b!687016 () Bool)

(assert (=> b!687016 (= e!391194 e!391197)))

(declare-fun res!451969 () Bool)

(assert (=> b!687016 (=> (not res!451969) (not e!391197))))

(assert (=> b!687016 (= res!451969 ((_ is Cons!12947) acc!681))))

(assert (= (and d!94891 (not res!451972)) b!687016))

(assert (= (and b!687016 res!451969) b!687017))

(assert (= (and b!687017 res!451970) b!687018))

(assert (= (and b!687017 (not res!451971)) b!687019))

(declare-fun m!651583 () Bool)

(assert (=> b!687018 m!651583))

(declare-fun m!651585 () Bool)

(assert (=> b!687019 m!651585))

(assert (=> b!686886 d!94891))

(declare-fun d!94893 () Bool)

(assert (=> d!94893 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!315310 () Unit!24186)

(declare-fun choose!80 (array!39660 List!12951 List!12951 (_ BitVec 32)) Unit!24186)

(assert (=> d!94893 (= lt!315310 (choose!80 a!3626 ($colon$colon!374 acc!681 (select (arr!19003 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> d!94893 (bvslt (size!19378 a!3626) #b01111111111111111111111111111111)))

(assert (=> d!94893 (= (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!374 acc!681 (select (arr!19003 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)) lt!315310)))

(declare-fun bs!20150 () Bool)

(assert (= bs!20150 d!94893))

(assert (=> bs!20150 m!651427))

(assert (=> bs!20150 m!651455))

(declare-fun m!651587 () Bool)

(assert (=> bs!20150 m!651587))

(assert (=> b!686886 d!94893))

(declare-fun d!94895 () Bool)

(assert (=> d!94895 (subseq!212 acc!681 acc!681)))

(declare-fun lt!315313 () Unit!24186)

(declare-fun choose!36 (List!12951) Unit!24186)

(assert (=> d!94895 (= lt!315313 (choose!36 acc!681))))

(assert (=> d!94895 (= (lemmaListSubSeqRefl!0 acc!681) lt!315313)))

(declare-fun bs!20151 () Bool)

(assert (= bs!20151 d!94895))

(assert (=> bs!20151 m!651451))

(declare-fun m!651589 () Bool)

(assert (=> bs!20151 m!651589))

(assert (=> b!686886 d!94895))

(declare-fun b!687030 () Bool)

(declare-fun e!391208 () Bool)

(declare-fun call!34110 () Bool)

(assert (=> b!687030 (= e!391208 call!34110)))

(declare-fun e!391209 () Bool)

(declare-fun b!687031 () Bool)

(assert (=> b!687031 (= e!391209 (contains!3603 acc!681 (select (arr!19003 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun b!687032 () Bool)

(declare-fun e!391207 () Bool)

(assert (=> b!687032 (= e!391207 e!391208)))

(declare-fun c!77894 () Bool)

(assert (=> b!687032 (= c!77894 (validKeyInArray!0 (select (arr!19003 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun d!94897 () Bool)

(declare-fun res!451979 () Bool)

(declare-fun e!391206 () Bool)

(assert (=> d!94897 (=> res!451979 e!391206)))

(assert (=> d!94897 (= res!451979 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) (size!19378 a!3626)))))

(assert (=> d!94897 (= (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681) e!391206)))

(declare-fun bm!34107 () Bool)

(assert (=> bm!34107 (= call!34110 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001) (ite c!77894 (Cons!12947 (select (arr!19003 a!3626) (bvadd #b00000000000000000000000000000001 from!3004)) acc!681) acc!681)))))

(declare-fun b!687033 () Bool)

(assert (=> b!687033 (= e!391206 e!391207)))

(declare-fun res!451981 () Bool)

(assert (=> b!687033 (=> (not res!451981) (not e!391207))))

(assert (=> b!687033 (= res!451981 (not e!391209))))

(declare-fun res!451980 () Bool)

(assert (=> b!687033 (=> (not res!451980) (not e!391209))))

(assert (=> b!687033 (= res!451980 (validKeyInArray!0 (select (arr!19003 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun b!687034 () Bool)

(assert (=> b!687034 (= e!391208 call!34110)))

(assert (= (and d!94897 (not res!451979)) b!687033))

(assert (= (and b!687033 res!451980) b!687031))

(assert (= (and b!687033 res!451981) b!687032))

(assert (= (and b!687032 c!77894) b!687030))

(assert (= (and b!687032 (not c!77894)) b!687034))

(assert (= (or b!687030 b!687034) bm!34107))

(declare-fun m!651591 () Bool)

(assert (=> b!687031 m!651591))

(assert (=> b!687031 m!651591))

(declare-fun m!651593 () Bool)

(assert (=> b!687031 m!651593))

(assert (=> b!687032 m!651591))

(assert (=> b!687032 m!651591))

(declare-fun m!651595 () Bool)

(assert (=> b!687032 m!651595))

(assert (=> bm!34107 m!651591))

(declare-fun m!651597 () Bool)

(assert (=> bm!34107 m!651597))

(assert (=> b!687033 m!651591))

(assert (=> b!687033 m!651591))

(assert (=> b!687033 m!651595))

(assert (=> b!686886 d!94897))

(declare-fun d!94899 () Bool)

(assert (=> d!94899 (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))

(declare-fun lt!315316 () Unit!24186)

(declare-fun choose!13 (array!39660 (_ BitVec 64) (_ BitVec 32)) Unit!24186)

(assert (=> d!94899 (= lt!315316 (choose!13 a!3626 k0!2843 from!3004))))

(assert (=> d!94899 (bvsge from!3004 #b00000000000000000000000000000000)))

(assert (=> d!94899 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004) lt!315316)))

(declare-fun bs!20152 () Bool)

(assert (= bs!20152 d!94899))

(assert (=> bs!20152 m!651473))

(declare-fun m!651599 () Bool)

(assert (=> bs!20152 m!651599))

(assert (=> b!686875 d!94899))

(declare-fun d!94901 () Bool)

(declare-fun lt!315319 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!294 (List!12951) (InoxSet (_ BitVec 64)))

(assert (=> d!94901 (= lt!315319 (select (content!294 acc!681) k0!2843))))

(declare-fun e!391215 () Bool)

(assert (=> d!94901 (= lt!315319 e!391215)))

(declare-fun res!451986 () Bool)

(assert (=> d!94901 (=> (not res!451986) (not e!391215))))

(assert (=> d!94901 (= res!451986 ((_ is Cons!12947) acc!681))))

(assert (=> d!94901 (= (contains!3603 acc!681 k0!2843) lt!315319)))

(declare-fun b!687039 () Bool)

(declare-fun e!391214 () Bool)

(assert (=> b!687039 (= e!391215 e!391214)))

(declare-fun res!451987 () Bool)

(assert (=> b!687039 (=> res!451987 e!391214)))

(assert (=> b!687039 (= res!451987 (= (h!13995 acc!681) k0!2843))))

(declare-fun b!687040 () Bool)

(assert (=> b!687040 (= e!391214 (contains!3603 (t!19198 acc!681) k0!2843))))

(assert (= (and d!94901 res!451986) b!687039))

(assert (= (and b!687039 (not res!451987)) b!687040))

(declare-fun m!651601 () Bool)

(assert (=> d!94901 m!651601))

(declare-fun m!651603 () Bool)

(assert (=> d!94901 m!651603))

(declare-fun m!651605 () Bool)

(assert (=> b!687040 m!651605))

(assert (=> b!686887 d!94901))

(declare-fun b!687041 () Bool)

(declare-fun e!391218 () Bool)

(declare-fun call!34111 () Bool)

(assert (=> b!687041 (= e!391218 call!34111)))

(declare-fun b!687042 () Bool)

(declare-fun e!391219 () Bool)

(assert (=> b!687042 (= e!391219 (contains!3603 Nil!12948 (select (arr!19003 a!3626) #b00000000000000000000000000000000)))))

(declare-fun b!687043 () Bool)

(declare-fun e!391217 () Bool)

(assert (=> b!687043 (= e!391217 e!391218)))

(declare-fun c!77895 () Bool)

(assert (=> b!687043 (= c!77895 (validKeyInArray!0 (select (arr!19003 a!3626) #b00000000000000000000000000000000)))))

(declare-fun d!94903 () Bool)

(declare-fun res!451988 () Bool)

(declare-fun e!391216 () Bool)

(assert (=> d!94903 (=> res!451988 e!391216)))

(assert (=> d!94903 (= res!451988 (bvsge #b00000000000000000000000000000000 (size!19378 a!3626)))))

(assert (=> d!94903 (= (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12948) e!391216)))

(declare-fun bm!34108 () Bool)

(assert (=> bm!34108 (= call!34111 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!77895 (Cons!12947 (select (arr!19003 a!3626) #b00000000000000000000000000000000) Nil!12948) Nil!12948)))))

(declare-fun b!687044 () Bool)

(assert (=> b!687044 (= e!391216 e!391217)))

(declare-fun res!451990 () Bool)

(assert (=> b!687044 (=> (not res!451990) (not e!391217))))

(assert (=> b!687044 (= res!451990 (not e!391219))))

(declare-fun res!451989 () Bool)

(assert (=> b!687044 (=> (not res!451989) (not e!391219))))

(assert (=> b!687044 (= res!451989 (validKeyInArray!0 (select (arr!19003 a!3626) #b00000000000000000000000000000000)))))

(declare-fun b!687045 () Bool)

(assert (=> b!687045 (= e!391218 call!34111)))

(assert (= (and d!94903 (not res!451988)) b!687044))

(assert (= (and b!687044 res!451989) b!687042))

(assert (= (and b!687044 res!451990) b!687043))

(assert (= (and b!687043 c!77895) b!687041))

(assert (= (and b!687043 (not c!77895)) b!687045))

(assert (= (or b!687041 b!687045) bm!34108))

(declare-fun m!651607 () Bool)

(assert (=> b!687042 m!651607))

(assert (=> b!687042 m!651607))

(declare-fun m!651609 () Bool)

(assert (=> b!687042 m!651609))

(assert (=> b!687043 m!651607))

(assert (=> b!687043 m!651607))

(declare-fun m!651611 () Bool)

(assert (=> b!687043 m!651611))

(assert (=> bm!34108 m!651607))

(declare-fun m!651613 () Bool)

(assert (=> bm!34108 m!651613))

(assert (=> b!687044 m!651607))

(assert (=> b!687044 m!651607))

(assert (=> b!687044 m!651611))

(assert (=> b!686888 d!94903))

(declare-fun d!94905 () Bool)

(assert (=> d!94905 (= (validKeyInArray!0 k0!2843) (and (not (= k0!2843 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2843 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!686877 d!94905))

(assert (=> b!686883 d!94901))

(declare-fun d!94907 () Bool)

(declare-fun res!451995 () Bool)

(declare-fun e!391224 () Bool)

(assert (=> d!94907 (=> res!451995 e!391224)))

(assert (=> d!94907 (= res!451995 (= (select (arr!19003 a!3626) #b00000000000000000000000000000000) k0!2843))))

(assert (=> d!94907 (= (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000) e!391224)))

(declare-fun b!687050 () Bool)

(declare-fun e!391225 () Bool)

(assert (=> b!687050 (= e!391224 e!391225)))

(declare-fun res!451996 () Bool)

(assert (=> b!687050 (=> (not res!451996) (not e!391225))))

(assert (=> b!687050 (= res!451996 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!19378 a!3626)))))

(declare-fun b!687051 () Bool)

(assert (=> b!687051 (= e!391225 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!94907 (not res!451995)) b!687050))

(assert (= (and b!687050 res!451996) b!687051))

(assert (=> d!94907 m!651607))

(declare-fun m!651615 () Bool)

(assert (=> b!687051 m!651615))

(assert (=> b!686884 d!94907))

(declare-fun d!94909 () Bool)

(assert (=> d!94909 (= (array_inv!14862 a!3626) (bvsge (size!19378 a!3626) #b00000000000000000000000000000000))))

(assert (=> start!61338 d!94909))

(declare-fun d!94911 () Bool)

(declare-fun res!452001 () Bool)

(declare-fun e!391230 () Bool)

(assert (=> d!94911 (=> res!452001 e!391230)))

(assert (=> d!94911 (= res!452001 ((_ is Nil!12948) lt!315249))))

(assert (=> d!94911 (= (noDuplicate!877 lt!315249) e!391230)))

(declare-fun b!687056 () Bool)

(declare-fun e!391231 () Bool)

(assert (=> b!687056 (= e!391230 e!391231)))

(declare-fun res!452002 () Bool)

(assert (=> b!687056 (=> (not res!452002) (not e!391231))))

(assert (=> b!687056 (= res!452002 (not (contains!3603 (t!19198 lt!315249) (h!13995 lt!315249))))))

(declare-fun b!687057 () Bool)

(assert (=> b!687057 (= e!391231 (noDuplicate!877 (t!19198 lt!315249)))))

(assert (= (and d!94911 (not res!452001)) b!687056))

(assert (= (and b!687056 res!452002) b!687057))

(declare-fun m!651617 () Bool)

(assert (=> b!687056 m!651617))

(declare-fun m!651619 () Bool)

(assert (=> b!687057 m!651619))

(assert (=> b!686885 d!94911))

(declare-fun d!94919 () Bool)

(declare-fun lt!315320 () Bool)

(assert (=> d!94919 (= lt!315320 (select (content!294 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!391233 () Bool)

(assert (=> d!94919 (= lt!315320 e!391233)))

(declare-fun res!452003 () Bool)

(assert (=> d!94919 (=> (not res!452003) (not e!391233))))

(assert (=> d!94919 (= res!452003 ((_ is Cons!12947) acc!681))))

(assert (=> d!94919 (= (contains!3603 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000) lt!315320)))

(declare-fun b!687058 () Bool)

(declare-fun e!391232 () Bool)

(assert (=> b!687058 (= e!391233 e!391232)))

(declare-fun res!452004 () Bool)

(assert (=> b!687058 (=> res!452004 e!391232)))

(assert (=> b!687058 (= res!452004 (= (h!13995 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!687059 () Bool)

(assert (=> b!687059 (= e!391232 (contains!3603 (t!19198 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!94919 res!452003) b!687058))

(assert (= (and b!687058 (not res!452004)) b!687059))

(assert (=> d!94919 m!651601))

(declare-fun m!651621 () Bool)

(assert (=> d!94919 m!651621))

(declare-fun m!651623 () Bool)

(assert (=> b!687059 m!651623))

(assert (=> b!686891 d!94919))

(declare-fun b!687060 () Bool)

(declare-fun e!391236 () Bool)

(declare-fun call!34112 () Bool)

(assert (=> b!687060 (= e!391236 call!34112)))

(declare-fun e!391237 () Bool)

(declare-fun b!687061 () Bool)

(assert (=> b!687061 (= e!391237 (contains!3603 acc!681 (select (arr!19003 a!3626) from!3004)))))

(declare-fun b!687062 () Bool)

(declare-fun e!391235 () Bool)

(assert (=> b!687062 (= e!391235 e!391236)))

(declare-fun c!77896 () Bool)

(assert (=> b!687062 (= c!77896 (validKeyInArray!0 (select (arr!19003 a!3626) from!3004)))))

(declare-fun d!94921 () Bool)

(declare-fun res!452005 () Bool)

(declare-fun e!391234 () Bool)

(assert (=> d!94921 (=> res!452005 e!391234)))

(assert (=> d!94921 (= res!452005 (bvsge from!3004 (size!19378 a!3626)))))

(assert (=> d!94921 (= (arrayNoDuplicates!0 a!3626 from!3004 acc!681) e!391234)))

(declare-fun bm!34109 () Bool)

(assert (=> bm!34109 (= call!34112 (arrayNoDuplicates!0 a!3626 (bvadd from!3004 #b00000000000000000000000000000001) (ite c!77896 (Cons!12947 (select (arr!19003 a!3626) from!3004) acc!681) acc!681)))))

(declare-fun b!687063 () Bool)

(assert (=> b!687063 (= e!391234 e!391235)))

(declare-fun res!452007 () Bool)

(assert (=> b!687063 (=> (not res!452007) (not e!391235))))

(assert (=> b!687063 (= res!452007 (not e!391237))))

(declare-fun res!452006 () Bool)

(assert (=> b!687063 (=> (not res!452006) (not e!391237))))

(assert (=> b!687063 (= res!452006 (validKeyInArray!0 (select (arr!19003 a!3626) from!3004)))))

(declare-fun b!687064 () Bool)

(assert (=> b!687064 (= e!391236 call!34112)))

(assert (= (and d!94921 (not res!452005)) b!687063))

(assert (= (and b!687063 res!452006) b!687061))

(assert (= (and b!687063 res!452007) b!687062))

(assert (= (and b!687062 c!77896) b!687060))

(assert (= (and b!687062 (not c!77896)) b!687064))

(assert (= (or b!687060 b!687064) bm!34109))

(assert (=> b!687061 m!651441))

(assert (=> b!687061 m!651441))

(declare-fun m!651625 () Bool)

(assert (=> b!687061 m!651625))

(assert (=> b!687062 m!651441))

(assert (=> b!687062 m!651441))

(assert (=> b!687062 m!651443))

(assert (=> bm!34109 m!651441))

(declare-fun m!651627 () Bool)

(assert (=> bm!34109 m!651627))

(assert (=> b!687063 m!651441))

(assert (=> b!687063 m!651441))

(assert (=> b!687063 m!651443))

(assert (=> b!686882 d!94921))

(declare-fun d!94923 () Bool)

(declare-fun e!391267 () Bool)

(assert (=> d!94923 e!391267))

(declare-fun res!452030 () Bool)

(assert (=> d!94923 (=> (not res!452030) (not e!391267))))

(declare-fun lt!315327 () List!12951)

(declare-fun size!19381 (List!12951) Int)

(assert (=> d!94923 (= res!452030 (<= (size!19381 lt!315327) (size!19381 lt!315249)))))

(declare-fun e!391266 () List!12951)

(assert (=> d!94923 (= lt!315327 e!391266)))

(declare-fun c!77902 () Bool)

(assert (=> d!94923 (= c!77902 ((_ is Cons!12947) lt!315249))))

(assert (=> d!94923 (= (-!176 lt!315249 k0!2843) lt!315327)))

(declare-fun b!687095 () Bool)

(assert (=> b!687095 (= e!391267 (= (content!294 lt!315327) ((_ map and) (content!294 lt!315249) ((_ map not) (store ((as const (Array (_ BitVec 64) Bool)) false) k0!2843 true)))))))

(declare-fun bm!34112 () Bool)

(declare-fun call!34115 () List!12951)

(assert (=> bm!34112 (= call!34115 (-!176 (t!19198 lt!315249) k0!2843))))

(declare-fun b!687096 () Bool)

(declare-fun e!391265 () List!12951)

(assert (=> b!687096 (= e!391265 call!34115)))

(declare-fun b!687097 () Bool)

(assert (=> b!687097 (= e!391266 Nil!12948)))

(declare-fun b!687098 () Bool)

(assert (=> b!687098 (= e!391265 (Cons!12947 (h!13995 lt!315249) call!34115))))

(declare-fun b!687099 () Bool)

(assert (=> b!687099 (= e!391266 e!391265)))

(declare-fun c!77901 () Bool)

(assert (=> b!687099 (= c!77901 (= k0!2843 (h!13995 lt!315249)))))

(assert (= (and d!94923 c!77902) b!687099))

(assert (= (and d!94923 (not c!77902)) b!687097))

(assert (= (and b!687099 c!77901) b!687096))

(assert (= (and b!687099 (not c!77901)) b!687098))

(assert (= (or b!687096 b!687098) bm!34112))

(assert (= (and d!94923 res!452030) b!687095))

(declare-fun m!651643 () Bool)

(assert (=> d!94923 m!651643))

(declare-fun m!651645 () Bool)

(assert (=> d!94923 m!651645))

(declare-fun m!651647 () Bool)

(assert (=> b!687095 m!651647))

(declare-fun m!651649 () Bool)

(assert (=> b!687095 m!651649))

(declare-fun m!651651 () Bool)

(assert (=> b!687095 m!651651))

(declare-fun m!651653 () Bool)

(assert (=> bm!34112 m!651653))

(assert (=> b!686893 d!94923))

(assert (=> b!686893 d!94891))

(declare-fun d!94931 () Bool)

(declare-fun res!452031 () Bool)

(declare-fun e!391268 () Bool)

(assert (=> d!94931 (=> res!452031 e!391268)))

(assert (=> d!94931 (= res!452031 (= (select (arr!19003 a!3626) (bvadd #b00000000000000000000000000000001 from!3004)) k0!2843))))

(assert (=> d!94931 (= (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)) e!391268)))

(declare-fun b!687100 () Bool)

(declare-fun e!391269 () Bool)

(assert (=> b!687100 (= e!391268 e!391269)))

(declare-fun res!452032 () Bool)

(assert (=> b!687100 (=> (not res!452032) (not e!391269))))

(assert (=> b!687100 (= res!452032 (bvslt (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001) (size!19378 a!3626)))))

(declare-fun b!687101 () Bool)

(assert (=> b!687101 (= e!391269 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001)))))

(assert (= (and d!94931 (not res!452031)) b!687100))

(assert (= (and b!687100 res!452032) b!687101))

(assert (=> d!94931 m!651591))

(declare-fun m!651655 () Bool)

(assert (=> b!687101 m!651655))

(assert (=> b!686893 d!94931))

(declare-fun b!687102 () Bool)

(declare-fun e!391272 () Bool)

(declare-fun call!34116 () Bool)

(assert (=> b!687102 (= e!391272 call!34116)))

(declare-fun e!391273 () Bool)

(declare-fun b!687103 () Bool)

(assert (=> b!687103 (= e!391273 (contains!3603 lt!315249 (select (arr!19003 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun b!687104 () Bool)

(declare-fun e!391271 () Bool)

(assert (=> b!687104 (= e!391271 e!391272)))

(declare-fun c!77903 () Bool)

(assert (=> b!687104 (= c!77903 (validKeyInArray!0 (select (arr!19003 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun d!94933 () Bool)

(declare-fun res!452033 () Bool)

(declare-fun e!391270 () Bool)

(assert (=> d!94933 (=> res!452033 e!391270)))

(assert (=> d!94933 (= res!452033 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) (size!19378 a!3626)))))

(assert (=> d!94933 (= (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!315249) e!391270)))

(declare-fun bm!34113 () Bool)

(assert (=> bm!34113 (= call!34116 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001) (ite c!77903 (Cons!12947 (select (arr!19003 a!3626) (bvadd #b00000000000000000000000000000001 from!3004)) lt!315249) lt!315249)))))

(declare-fun b!687105 () Bool)

(assert (=> b!687105 (= e!391270 e!391271)))

(declare-fun res!452035 () Bool)

(assert (=> b!687105 (=> (not res!452035) (not e!391271))))

(assert (=> b!687105 (= res!452035 (not e!391273))))

(declare-fun res!452034 () Bool)

(assert (=> b!687105 (=> (not res!452034) (not e!391273))))

(assert (=> b!687105 (= res!452034 (validKeyInArray!0 (select (arr!19003 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun b!687106 () Bool)

(assert (=> b!687106 (= e!391272 call!34116)))

(assert (= (and d!94933 (not res!452033)) b!687105))

(assert (= (and b!687105 res!452034) b!687103))

(assert (= (and b!687105 res!452035) b!687104))

(assert (= (and b!687104 c!77903) b!687102))

(assert (= (and b!687104 (not c!77903)) b!687106))

(assert (= (or b!687102 b!687106) bm!34113))

(assert (=> b!687103 m!651591))

(assert (=> b!687103 m!651591))

(declare-fun m!651657 () Bool)

(assert (=> b!687103 m!651657))

(assert (=> b!687104 m!651591))

(assert (=> b!687104 m!651591))

(assert (=> b!687104 m!651595))

(assert (=> bm!34113 m!651591))

(declare-fun m!651659 () Bool)

(assert (=> bm!34113 m!651659))

(assert (=> b!687105 m!651591))

(assert (=> b!687105 m!651591))

(assert (=> b!687105 m!651595))

(assert (=> b!686893 d!94933))

(declare-fun d!94935 () Bool)

(assert (=> d!94935 (= (-!176 ($colon$colon!374 acc!681 k0!2843) k0!2843) acc!681)))

(declare-fun lt!315336 () Unit!24186)

(declare-fun choose!16 ((_ BitVec 64) List!12951) Unit!24186)

(assert (=> d!94935 (= lt!315336 (choose!16 k0!2843 acc!681))))

(assert (=> d!94935 (not (contains!3603 acc!681 k0!2843))))

(assert (=> d!94935 (= (lemmaLMinusHeadEqualsTail!0 k0!2843 acc!681) lt!315336)))

(declare-fun bs!20155 () Bool)

(assert (= bs!20155 d!94935))

(assert (=> bs!20155 m!651439))

(assert (=> bs!20155 m!651439))

(declare-fun m!651665 () Bool)

(assert (=> bs!20155 m!651665))

(declare-fun m!651667 () Bool)

(assert (=> bs!20155 m!651667))

(assert (=> bs!20155 m!651459))

(assert (=> b!686893 d!94935))

(declare-fun d!94941 () Bool)

(assert (=> d!94941 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!315249)))

(declare-fun lt!315339 () Unit!24186)

(declare-fun choose!66 (array!39660 (_ BitVec 64) (_ BitVec 32) List!12951 List!12951) Unit!24186)

(assert (=> d!94941 (= lt!315339 (choose!66 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!315249))))

(assert (=> d!94941 (bvslt (size!19378 a!3626) #b01111111111111111111111111111111)))

(assert (=> d!94941 (= (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!315249) lt!315339)))

(declare-fun bs!20156 () Bool)

(assert (= bs!20156 d!94941))

(assert (=> bs!20156 m!651447))

(declare-fun m!651671 () Bool)

(assert (=> bs!20156 m!651671))

(assert (=> b!686893 d!94941))

(declare-fun d!94943 () Bool)

(declare-fun res!452045 () Bool)

(declare-fun e!391286 () Bool)

(assert (=> d!94943 (=> res!452045 e!391286)))

(assert (=> d!94943 (= res!452045 (= (select (arr!19003 (array!39661 (store (arr!19003 a!3626) i!1382 k0!2843) (size!19378 a!3626))) from!3004) k0!2843))))

(assert (=> d!94943 (= (arrayContainsKey!0 (array!39661 (store (arr!19003 a!3626) i!1382 k0!2843) (size!19378 a!3626)) k0!2843 from!3004) e!391286)))

(declare-fun b!687122 () Bool)

(declare-fun e!391287 () Bool)

(assert (=> b!687122 (= e!391286 e!391287)))

(declare-fun res!452046 () Bool)

(assert (=> b!687122 (=> (not res!452046) (not e!391287))))

(assert (=> b!687122 (= res!452046 (bvslt (bvadd from!3004 #b00000000000000000000000000000001) (size!19378 (array!39661 (store (arr!19003 a!3626) i!1382 k0!2843) (size!19378 a!3626)))))))

(declare-fun b!687123 () Bool)

(assert (=> b!687123 (= e!391287 (arrayContainsKey!0 (array!39661 (store (arr!19003 a!3626) i!1382 k0!2843) (size!19378 a!3626)) k0!2843 (bvadd from!3004 #b00000000000000000000000000000001)))))

(assert (= (and d!94943 (not res!452045)) b!687122))

(assert (= (and b!687122 res!452046) b!687123))

(declare-fun m!651679 () Bool)

(assert (=> d!94943 m!651679))

(declare-fun m!651681 () Bool)

(assert (=> b!687123 m!651681))

(assert (=> b!686893 d!94943))

(assert (=> b!686893 d!94895))

(declare-fun d!94945 () Bool)

(assert (=> d!94945 (= (validKeyInArray!0 (select (arr!19003 a!3626) from!3004)) (and (not (= (select (arr!19003 a!3626) from!3004) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19003 a!3626) from!3004) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!686893 d!94945))

(declare-fun d!94949 () Bool)

(assert (=> d!94949 (= ($colon$colon!374 acc!681 k0!2843) (Cons!12947 k0!2843 acc!681))))

(assert (=> b!686893 d!94949))

(assert (=> b!686893 d!94897))

(declare-fun d!94951 () Bool)

(declare-fun lt!315340 () Bool)

(assert (=> d!94951 (= lt!315340 (select (content!294 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!391289 () Bool)

(assert (=> d!94951 (= lt!315340 e!391289)))

(declare-fun res!452047 () Bool)

(assert (=> d!94951 (=> (not res!452047) (not e!391289))))

(assert (=> d!94951 (= res!452047 ((_ is Cons!12947) acc!681))))

(assert (=> d!94951 (= (contains!3603 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000) lt!315340)))

(declare-fun b!687124 () Bool)

(declare-fun e!391288 () Bool)

(assert (=> b!687124 (= e!391289 e!391288)))

(declare-fun res!452048 () Bool)

(assert (=> b!687124 (=> res!452048 e!391288)))

(assert (=> b!687124 (= res!452048 (= (h!13995 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!687125 () Bool)

(assert (=> b!687125 (= e!391288 (contains!3603 (t!19198 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!94951 res!452047) b!687124))

(assert (= (and b!687124 (not res!452048)) b!687125))

(assert (=> d!94951 m!651601))

(declare-fun m!651683 () Bool)

(assert (=> d!94951 m!651683))

(declare-fun m!651685 () Bool)

(assert (=> b!687125 m!651685))

(assert (=> b!686890 d!94951))

(declare-fun d!94953 () Bool)

(declare-fun res!452049 () Bool)

(declare-fun e!391290 () Bool)

(assert (=> d!94953 (=> res!452049 e!391290)))

(assert (=> d!94953 (= res!452049 ((_ is Nil!12948) acc!681))))

(assert (=> d!94953 (= (noDuplicate!877 acc!681) e!391290)))

(declare-fun b!687126 () Bool)

(declare-fun e!391291 () Bool)

(assert (=> b!687126 (= e!391290 e!391291)))

(declare-fun res!452050 () Bool)

(assert (=> b!687126 (=> (not res!452050) (not e!391291))))

(assert (=> b!687126 (= res!452050 (not (contains!3603 (t!19198 acc!681) (h!13995 acc!681))))))

(declare-fun b!687127 () Bool)

(assert (=> b!687127 (= e!391291 (noDuplicate!877 (t!19198 acc!681)))))

(assert (= (and d!94953 (not res!452049)) b!687126))

(assert (= (and b!687126 res!452050) b!687127))

(declare-fun m!651687 () Bool)

(assert (=> b!687126 m!651687))

(declare-fun m!651689 () Bool)

(assert (=> b!687127 m!651689))

(assert (=> b!686880 d!94953))

(check-sat (not b!687040) (not b!687061) (not b!687101) (not b!687056) (not b!687018) (not b!687032) (not d!94893) (not bm!34112) (not b!687042) (not b!687123) (not b!687062) (not b!687019) (not d!94895) (not d!94951) (not b!687127) (not b!687105) (not d!94941) (not b!687043) (not d!94919) (not d!94935) (not b!687044) (not bm!34113) (not b!687125) (not d!94923) (not b!687095) (not b!687031) (not d!94899) (not d!94901) (not b!687057) (not bm!34107) (not b!687063) (not b!687033) (not b!687059) (not bm!34108) (not b!687104) (not b!687103) (not bm!34109) (not b!687051) (not b!687126))
(check-sat)
