; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!115944 () Bool)

(assert start!115944)

(declare-fun b!1370385 () Bool)

(declare-fun res!913831 () Bool)

(declare-fun e!776201 () Bool)

(assert (=> b!1370385 (=> (not res!913831) (not e!776201))))

(declare-datatypes ((List!31997 0))(
  ( (Nil!31994) (Cons!31993 (h!33202 (_ BitVec 64)) (t!46691 List!31997)) )
))
(declare-fun acc!866 () List!31997)

(declare-fun noDuplicate!2536 (List!31997) Bool)

(assert (=> b!1370385 (= res!913831 (noDuplicate!2536 acc!866))))

(declare-fun b!1370386 () Bool)

(declare-fun e!776200 () Bool)

(assert (=> b!1370386 (= e!776201 e!776200)))

(declare-fun res!913827 () Bool)

(assert (=> b!1370386 (=> (not res!913827) (not e!776200))))

(declare-datatypes ((array!93019 0))(
  ( (array!93020 (arr!44929 (Array (_ BitVec 32) (_ BitVec 64))) (size!45479 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!93019)

(declare-fun from!3239 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!93019 (_ BitVec 32) List!31997) Bool)

(assert (=> b!1370386 (= res!913827 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45295 0))(
  ( (Unit!45296) )
))
(declare-fun lt!602430 () Unit!45295)

(declare-fun newAcc!98 () List!31997)

(declare-fun noDuplicateSubseq!268 (List!31997 List!31997) Unit!45295)

(assert (=> b!1370386 (= lt!602430 (noDuplicateSubseq!268 newAcc!98 acc!866))))

(declare-fun b!1370387 () Bool)

(declare-fun res!913834 () Bool)

(assert (=> b!1370387 (=> (not res!913834) (not e!776200))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1370387 (= res!913834 (validKeyInArray!0 (select (arr!44929 a!3861) from!3239)))))

(declare-fun res!913836 () Bool)

(assert (=> start!115944 (=> (not res!913836) (not e!776201))))

(assert (=> start!115944 (= res!913836 (and (bvslt (size!45479 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45479 a!3861))))))

(assert (=> start!115944 e!776201))

(declare-fun array_inv!33957 (array!93019) Bool)

(assert (=> start!115944 (array_inv!33957 a!3861)))

(assert (=> start!115944 true))

(declare-fun b!1370388 () Bool)

(declare-fun res!913840 () Bool)

(assert (=> b!1370388 (=> (not res!913840) (not e!776201))))

(declare-fun subseq!1081 (List!31997 List!31997) Bool)

(assert (=> b!1370388 (= res!913840 (subseq!1081 newAcc!98 acc!866))))

(declare-fun b!1370389 () Bool)

(declare-fun res!913832 () Bool)

(assert (=> b!1370389 (=> (not res!913832) (not e!776201))))

(declare-fun contains!9679 (List!31997 (_ BitVec 64)) Bool)

(assert (=> b!1370389 (= res!913832 (not (contains!9679 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1370390 () Bool)

(declare-fun e!776199 () Bool)

(declare-fun e!776202 () Bool)

(assert (=> b!1370390 (= e!776199 e!776202)))

(declare-fun res!913835 () Bool)

(assert (=> b!1370390 (=> res!913835 e!776202)))

(declare-fun lt!602431 () List!31997)

(assert (=> b!1370390 (= res!913835 (contains!9679 lt!602431 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1370391 () Bool)

(declare-fun res!913837 () Bool)

(assert (=> b!1370391 (=> (not res!913837) (not e!776199))))

(assert (=> b!1370391 (= res!913837 (noDuplicate!2536 lt!602431))))

(declare-fun b!1370392 () Bool)

(assert (=> b!1370392 (= e!776200 e!776199)))

(declare-fun res!913833 () Bool)

(assert (=> b!1370392 (=> (not res!913833) (not e!776199))))

(assert (=> b!1370392 (= res!913833 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) #b00000000000000000000000000000000))))

(assert (=> b!1370392 (= lt!602431 (Cons!31993 (select (arr!44929 a!3861) from!3239) acc!866))))

(declare-fun b!1370393 () Bool)

(assert (=> b!1370393 (= e!776202 (contains!9679 lt!602431 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1370394 () Bool)

(declare-fun res!913829 () Bool)

(assert (=> b!1370394 (=> (not res!913829) (not e!776201))))

(assert (=> b!1370394 (= res!913829 (not (contains!9679 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1370395 () Bool)

(declare-fun res!913828 () Bool)

(assert (=> b!1370395 (=> (not res!913828) (not e!776201))))

(assert (=> b!1370395 (= res!913828 (not (contains!9679 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1370396 () Bool)

(declare-fun res!913830 () Bool)

(assert (=> b!1370396 (=> (not res!913830) (not e!776200))))

(assert (=> b!1370396 (= res!913830 (bvslt from!3239 (size!45479 a!3861)))))

(declare-fun b!1370397 () Bool)

(declare-fun res!913839 () Bool)

(assert (=> b!1370397 (=> (not res!913839) (not e!776200))))

(assert (=> b!1370397 (= res!913839 (not (contains!9679 acc!866 (select (arr!44929 a!3861) from!3239))))))

(declare-fun b!1370398 () Bool)

(declare-fun res!913838 () Bool)

(assert (=> b!1370398 (=> (not res!913838) (not e!776201))))

(assert (=> b!1370398 (= res!913838 (not (contains!9679 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!115944 res!913836) b!1370385))

(assert (= (and b!1370385 res!913831) b!1370389))

(assert (= (and b!1370389 res!913832) b!1370398))

(assert (= (and b!1370398 res!913838) b!1370395))

(assert (= (and b!1370395 res!913828) b!1370394))

(assert (= (and b!1370394 res!913829) b!1370388))

(assert (= (and b!1370388 res!913840) b!1370386))

(assert (= (and b!1370386 res!913827) b!1370396))

(assert (= (and b!1370396 res!913830) b!1370387))

(assert (= (and b!1370387 res!913834) b!1370397))

(assert (= (and b!1370397 res!913839) b!1370392))

(assert (= (and b!1370392 res!913833) b!1370391))

(assert (= (and b!1370391 res!913837) b!1370390))

(assert (= (and b!1370390 (not res!913835)) b!1370393))

(declare-fun m!1253953 () Bool)

(assert (=> b!1370388 m!1253953))

(declare-fun m!1253955 () Bool)

(assert (=> b!1370397 m!1253955))

(assert (=> b!1370397 m!1253955))

(declare-fun m!1253957 () Bool)

(assert (=> b!1370397 m!1253957))

(declare-fun m!1253959 () Bool)

(assert (=> b!1370389 m!1253959))

(declare-fun m!1253961 () Bool)

(assert (=> b!1370393 m!1253961))

(declare-fun m!1253963 () Bool)

(assert (=> b!1370386 m!1253963))

(declare-fun m!1253965 () Bool)

(assert (=> b!1370386 m!1253965))

(declare-fun m!1253967 () Bool)

(assert (=> b!1370390 m!1253967))

(declare-fun m!1253969 () Bool)

(assert (=> b!1370385 m!1253969))

(assert (=> b!1370387 m!1253955))

(assert (=> b!1370387 m!1253955))

(declare-fun m!1253971 () Bool)

(assert (=> b!1370387 m!1253971))

(declare-fun m!1253973 () Bool)

(assert (=> b!1370391 m!1253973))

(declare-fun m!1253975 () Bool)

(assert (=> b!1370395 m!1253975))

(declare-fun m!1253977 () Bool)

(assert (=> b!1370398 m!1253977))

(assert (=> b!1370392 m!1253955))

(declare-fun m!1253979 () Bool)

(assert (=> b!1370394 m!1253979))

(declare-fun m!1253981 () Bool)

(assert (=> start!115944 m!1253981))

(push 1)

(assert (not b!1370385))

(assert (not b!1370395))

(assert (not b!1370389))

(assert (not b!1370398))

(assert (not start!115944))

(assert (not b!1370394))

(assert (not b!1370391))

(assert (not b!1370387))

(assert (not b!1370388))

(assert (not b!1370390))

(assert (not b!1370386))

(assert (not b!1370393))

(assert (not b!1370397))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1370451 () Bool)

(declare-fun e!776254 () Bool)

(declare-fun call!65528 () Bool)

(assert (=> b!1370451 (= e!776254 call!65528)))

(declare-fun b!1370452 () Bool)

(declare-fun e!776255 () Bool)

(assert (=> b!1370452 (= e!776255 (contains!9679 acc!866 (select (arr!44929 a!3861) from!3239)))))

(declare-fun b!1370453 () Bool)

(assert (=> b!1370453 (= e!776254 call!65528)))

(declare-fun c!127721 () Bool)

(declare-fun bm!65525 () Bool)

(assert (=> bm!65525 (= call!65528 (arrayNoDuplicates!0 a!3861 (bvadd from!3239 #b00000000000000000000000000000001) (ite c!127721 (Cons!31993 (select (arr!44929 a!3861) from!3239) acc!866) acc!866)))))

(declare-fun d!147163 () Bool)

(declare-fun res!913890 () Bool)

(declare-fun e!776256 () Bool)

(assert (=> d!147163 (=> res!913890 e!776256)))

(assert (=> d!147163 (= res!913890 (bvsge from!3239 (size!45479 a!3861)))))

(assert (=> d!147163 (= (arrayNoDuplicates!0 a!3861 from!3239 acc!866) e!776256)))

(declare-fun b!1370454 () Bool)

(declare-fun e!776257 () Bool)

(assert (=> b!1370454 (= e!776257 e!776254)))

(assert (=> b!1370454 (= c!127721 (validKeyInArray!0 (select (arr!44929 a!3861) from!3239)))))

(declare-fun b!1370455 () Bool)

(assert (=> b!1370455 (= e!776256 e!776257)))

(declare-fun res!913889 () Bool)

(assert (=> b!1370455 (=> (not res!913889) (not e!776257))))

(assert (=> b!1370455 (= res!913889 (not e!776255))))

(declare-fun res!913891 () Bool)

(assert (=> b!1370455 (=> (not res!913891) (not e!776255))))

(assert (=> b!1370455 (= res!913891 (validKeyInArray!0 (select (arr!44929 a!3861) from!3239)))))

(assert (= (and d!147163 (not res!913890)) b!1370455))

(assert (= (and b!1370455 res!913891) b!1370452))

(assert (= (and b!1370455 res!913889) b!1370454))

(assert (= (and b!1370454 c!127721) b!1370451))

(assert (= (and b!1370454 (not c!127721)) b!1370453))

(assert (= (or b!1370451 b!1370453) bm!65525))

(assert (=> b!1370452 m!1253955))

(assert (=> b!1370452 m!1253955))

(assert (=> b!1370452 m!1253957))

(assert (=> bm!65525 m!1253955))

(declare-fun m!1254023 () Bool)

(assert (=> bm!65525 m!1254023))

(assert (=> b!1370454 m!1253955))

(assert (=> b!1370454 m!1253955))

(assert (=> b!1370454 m!1253971))

(assert (=> b!1370455 m!1253955))

(assert (=> b!1370455 m!1253955))

(assert (=> b!1370455 m!1253971))

(assert (=> b!1370386 d!147163))

(declare-fun d!147181 () Bool)

(assert (=> d!147181 (noDuplicate!2536 newAcc!98)))

(declare-fun lt!602442 () Unit!45295)

(declare-fun choose!2007 (List!31997 List!31997) Unit!45295)

(assert (=> d!147181 (= lt!602442 (choose!2007 newAcc!98 acc!866))))

(declare-fun e!776276 () Bool)

(assert (=> d!147181 e!776276))

(declare-fun res!913906 () Bool)

(assert (=> d!147181 (=> (not res!913906) (not e!776276))))

(assert (=> d!147181 (= res!913906 (subseq!1081 newAcc!98 acc!866))))

(assert (=> d!147181 (= (noDuplicateSubseq!268 newAcc!98 acc!866) lt!602442)))

(declare-fun b!1370478 () Bool)

(assert (=> b!1370478 (= e!776276 (noDuplicate!2536 acc!866))))

(assert (= (and d!147181 res!913906) b!1370478))

(declare-fun m!1254025 () Bool)

(assert (=> d!147181 m!1254025))

(declare-fun m!1254027 () Bool)

(assert (=> d!147181 m!1254027))

(assert (=> d!147181 m!1253953))

(assert (=> b!1370478 m!1253969))

(assert (=> b!1370386 d!147181))

(declare-fun d!147183 () Bool)

(declare-fun res!913917 () Bool)

(declare-fun e!776289 () Bool)

(assert (=> d!147183 (=> res!913917 e!776289)))

(assert (=> d!147183 (= res!913917 (is-Nil!31994 acc!866))))

(assert (=> d!147183 (= (noDuplicate!2536 acc!866) e!776289)))

(declare-fun b!1370493 () Bool)

(declare-fun e!776290 () Bool)

(assert (=> b!1370493 (= e!776289 e!776290)))

(declare-fun res!913918 () Bool)

(assert (=> b!1370493 (=> (not res!913918) (not e!776290))))

(assert (=> b!1370493 (= res!913918 (not (contains!9679 (t!46691 acc!866) (h!33202 acc!866))))))

(declare-fun b!1370494 () Bool)

(assert (=> b!1370494 (= e!776290 (noDuplicate!2536 (t!46691 acc!866)))))

(assert (= (and d!147183 (not res!913917)) b!1370493))

(assert (= (and b!1370493 res!913918) b!1370494))

(declare-fun m!1254031 () Bool)

(assert (=> b!1370493 m!1254031))

(declare-fun m!1254033 () Bool)

(assert (=> b!1370494 m!1254033))

(assert (=> b!1370385 d!147183))

(declare-fun d!147187 () Bool)

(declare-fun lt!602454 () Bool)

(declare-fun content!731 (List!31997) (Set (_ BitVec 64)))

(assert (=> d!147187 (= lt!602454 (member #b0000000000000000000000000000000000000000000000000000000000000000 (content!731 newAcc!98)))))

(declare-fun e!776308 () Bool)

(assert (=> d!147187 (= lt!602454 e!776308)))

(declare-fun res!913936 () Bool)

(assert (=> d!147187 (=> (not res!913936) (not e!776308))))

(assert (=> d!147187 (= res!913936 (is-Cons!31993 newAcc!98))))

(assert (=> d!147187 (= (contains!9679 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000) lt!602454)))

(declare-fun b!1370512 () Bool)

(declare-fun e!776309 () Bool)

(assert (=> b!1370512 (= e!776308 e!776309)))

(declare-fun res!913937 () Bool)

(assert (=> b!1370512 (=> res!913937 e!776309)))

(assert (=> b!1370512 (= res!913937 (= (h!33202 newAcc!98) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1370513 () Bool)

(assert (=> b!1370513 (= e!776309 (contains!9679 (t!46691 newAcc!98) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!147187 res!913936) b!1370512))

(assert (= (and b!1370512 (not res!913937)) b!1370513))

(declare-fun m!1254057 () Bool)

(assert (=> d!147187 m!1254057))

(declare-fun m!1254059 () Bool)

(assert (=> d!147187 m!1254059))

(declare-fun m!1254061 () Bool)

(assert (=> b!1370513 m!1254061))

(assert (=> b!1370395 d!147187))

(declare-fun b!1370534 () Bool)

(declare-fun e!776330 () Bool)

(assert (=> b!1370534 (= e!776330 (subseq!1081 newAcc!98 (t!46691 acc!866)))))

(declare-fun d!147199 () Bool)

(declare-fun res!913957 () Bool)

(declare-fun e!776327 () Bool)

(assert (=> d!147199 (=> res!913957 e!776327)))

(assert (=> d!147199 (= res!913957 (is-Nil!31994 newAcc!98))))

(assert (=> d!147199 (= (subseq!1081 newAcc!98 acc!866) e!776327)))

(declare-fun b!1370532 () Bool)

(declare-fun e!776328 () Bool)

(assert (=> b!1370532 (= e!776328 e!776330)))

(declare-fun res!913956 () Bool)

(assert (=> b!1370532 (=> res!913956 e!776330)))

(declare-fun e!776329 () Bool)

(assert (=> b!1370532 (= res!913956 e!776329)))

(declare-fun res!913955 () Bool)

(assert (=> b!1370532 (=> (not res!913955) (not e!776329))))

(assert (=> b!1370532 (= res!913955 (= (h!33202 newAcc!98) (h!33202 acc!866)))))

(declare-fun b!1370531 () Bool)

(assert (=> b!1370531 (= e!776327 e!776328)))

(declare-fun res!913958 () Bool)

(assert (=> b!1370531 (=> (not res!913958) (not e!776328))))

(assert (=> b!1370531 (= res!913958 (is-Cons!31993 acc!866))))

(declare-fun b!1370533 () Bool)

(assert (=> b!1370533 (= e!776329 (subseq!1081 (t!46691 newAcc!98) (t!46691 acc!866)))))

(assert (= (and d!147199 (not res!913957)) b!1370531))

(assert (= (and b!1370531 res!913958) b!1370532))

(assert (= (and b!1370532 res!913955) b!1370533))

(assert (= (and b!1370532 (not res!913956)) b!1370534))

(declare-fun m!1254067 () Bool)

(assert (=> b!1370534 m!1254067))

(declare-fun m!1254069 () Bool)

(assert (=> b!1370533 m!1254069))

(assert (=> b!1370388 d!147199))

(declare-fun d!147203 () Bool)

(assert (=> d!147203 (= (validKeyInArray!0 (select (arr!44929 a!3861) from!3239)) (and (not (= (select (arr!44929 a!3861) from!3239) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!44929 a!3861) from!3239) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1370387 d!147203))

(declare-fun d!147205 () Bool)

(declare-fun lt!602456 () Bool)

(assert (=> d!147205 (= lt!602456 (member #b1000000000000000000000000000000000000000000000000000000000000000 (content!731 acc!866)))))

(declare-fun e!776335 () Bool)

(assert (=> d!147205 (= lt!602456 e!776335)))

(declare-fun res!913963 () Bool)

(assert (=> d!147205 (=> (not res!913963) (not e!776335))))

(assert (=> d!147205 (= res!913963 (is-Cons!31993 acc!866))))

(assert (=> d!147205 (= (contains!9679 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000) lt!602456)))

(declare-fun b!1370539 () Bool)

(declare-fun e!776336 () Bool)

(assert (=> b!1370539 (= e!776335 e!776336)))

(declare-fun res!913964 () Bool)

(assert (=> b!1370539 (=> res!913964 e!776336)))

(assert (=> b!1370539 (= res!913964 (= (h!33202 acc!866) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1370540 () Bool)

(assert (=> b!1370540 (= e!776336 (contains!9679 (t!46691 acc!866) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!147205 res!913963) b!1370539))

(assert (= (and b!1370539 (not res!913964)) b!1370540))

(declare-fun m!1254075 () Bool)

(assert (=> d!147205 m!1254075))

(declare-fun m!1254077 () Bool)

(assert (=> d!147205 m!1254077))

(declare-fun m!1254079 () Bool)

(assert (=> b!1370540 m!1254079))

(assert (=> b!1370398 d!147205))

(declare-fun d!147209 () Bool)

(declare-fun lt!602457 () Bool)

(assert (=> d!147209 (= lt!602457 (member (select (arr!44929 a!3861) from!3239) (content!731 acc!866)))))

(declare-fun e!776337 () Bool)

(assert (=> d!147209 (= lt!602457 e!776337)))

(declare-fun res!913965 () Bool)

(assert (=> d!147209 (=> (not res!913965) (not e!776337))))

(assert (=> d!147209 (= res!913965 (is-Cons!31993 acc!866))))

(assert (=> d!147209 (= (contains!9679 acc!866 (select (arr!44929 a!3861) from!3239)) lt!602457)))

(declare-fun b!1370541 () Bool)

(declare-fun e!776338 () Bool)

(assert (=> b!1370541 (= e!776337 e!776338)))

(declare-fun res!913966 () Bool)

(assert (=> b!1370541 (=> res!913966 e!776338)))

(assert (=> b!1370541 (= res!913966 (= (h!33202 acc!866) (select (arr!44929 a!3861) from!3239)))))

(declare-fun b!1370542 () Bool)

(assert (=> b!1370542 (= e!776338 (contains!9679 (t!46691 acc!866) (select (arr!44929 a!3861) from!3239)))))

(assert (= (and d!147209 res!913965) b!1370541))

(assert (= (and b!1370541 (not res!913966)) b!1370542))

(assert (=> d!147209 m!1254075))

(assert (=> d!147209 m!1253955))

(declare-fun m!1254081 () Bool)

(assert (=> d!147209 m!1254081))

(assert (=> b!1370542 m!1253955))

(declare-fun m!1254083 () Bool)

(assert (=> b!1370542 m!1254083))

(assert (=> b!1370397 d!147209))

(declare-fun d!147211 () Bool)

(declare-fun res!913967 () Bool)

(declare-fun e!776339 () Bool)

(assert (=> d!147211 (=> res!913967 e!776339)))

(assert (=> d!147211 (= res!913967 (is-Nil!31994 lt!602431))))

(assert (=> d!147211 (= (noDuplicate!2536 lt!602431) e!776339)))

