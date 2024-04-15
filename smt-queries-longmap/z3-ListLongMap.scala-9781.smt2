; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115882 () Bool)

(assert start!115882)

(declare-fun b!1369961 () Bool)

(declare-fun res!913473 () Bool)

(declare-fun e!775958 () Bool)

(assert (=> b!1369961 (=> (not res!913473) (not e!775958))))

(declare-fun from!3239 () (_ BitVec 32))

(declare-datatypes ((array!92955 0))(
  ( (array!92956 (arr!44899 (Array (_ BitVec 32) (_ BitVec 64))) (size!45451 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92955)

(assert (=> b!1369961 (= res!913473 (bvslt from!3239 (size!45451 a!3861)))))

(declare-fun b!1369962 () Bool)

(declare-fun res!913467 () Bool)

(declare-fun e!775957 () Bool)

(assert (=> b!1369962 (=> (not res!913467) (not e!775957))))

(declare-datatypes ((List!32045 0))(
  ( (Nil!32042) (Cons!32041 (h!33250 (_ BitVec 64)) (t!46731 List!32045)) )
))
(declare-fun newAcc!98 () List!32045)

(declare-fun acc!866 () List!32045)

(declare-fun subseq!1076 (List!32045 List!32045) Bool)

(assert (=> b!1369962 (= res!913467 (subseq!1076 newAcc!98 acc!866))))

(declare-fun b!1369963 () Bool)

(declare-fun res!913474 () Bool)

(assert (=> b!1369963 (=> (not res!913474) (not e!775958))))

(assert (=> b!1369963 (= res!913474 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) #b00000000000000000000000000000000))))

(declare-fun b!1369964 () Bool)

(declare-fun res!913475 () Bool)

(assert (=> b!1369964 (=> (not res!913475) (not e!775957))))

(declare-fun contains!9638 (List!32045 (_ BitVec 64)) Bool)

(assert (=> b!1369964 (= res!913475 (not (contains!9638 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369965 () Bool)

(declare-fun res!913471 () Bool)

(assert (=> b!1369965 (=> (not res!913471) (not e!775957))))

(assert (=> b!1369965 (= res!913471 (not (contains!9638 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369966 () Bool)

(assert (=> b!1369966 (= e!775957 e!775958)))

(declare-fun res!913468 () Bool)

(assert (=> b!1369966 (=> (not res!913468) (not e!775958))))

(declare-fun arrayNoDuplicates!0 (array!92955 (_ BitVec 32) List!32045) Bool)

(assert (=> b!1369966 (= res!913468 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45126 0))(
  ( (Unit!45127) )
))
(declare-fun lt!602190 () Unit!45126)

(declare-fun noDuplicateSubseq!263 (List!32045 List!32045) Unit!45126)

(assert (=> b!1369966 (= lt!602190 (noDuplicateSubseq!263 newAcc!98 acc!866))))

(declare-fun b!1369967 () Bool)

(declare-fun res!913464 () Bool)

(assert (=> b!1369967 (=> (not res!913464) (not e!775958))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1369967 (= res!913464 (validKeyInArray!0 (select (arr!44899 a!3861) from!3239)))))

(declare-fun b!1369968 () Bool)

(declare-fun noDuplicate!2553 (List!32045) Bool)

(assert (=> b!1369968 (= e!775958 (not (noDuplicate!2553 (Cons!32041 (select (arr!44899 a!3861) from!3239) acc!866))))))

(declare-fun res!913469 () Bool)

(assert (=> start!115882 (=> (not res!913469) (not e!775957))))

(assert (=> start!115882 (= res!913469 (and (bvslt (size!45451 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45451 a!3861))))))

(assert (=> start!115882 e!775957))

(declare-fun array_inv!34132 (array!92955) Bool)

(assert (=> start!115882 (array_inv!34132 a!3861)))

(assert (=> start!115882 true))

(declare-fun b!1369969 () Bool)

(declare-fun res!913465 () Bool)

(assert (=> b!1369969 (=> (not res!913465) (not e!775957))))

(assert (=> b!1369969 (= res!913465 (not (contains!9638 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369970 () Bool)

(declare-fun res!913470 () Bool)

(assert (=> b!1369970 (=> (not res!913470) (not e!775957))))

(assert (=> b!1369970 (= res!913470 (noDuplicate!2553 acc!866))))

(declare-fun b!1369971 () Bool)

(declare-fun res!913472 () Bool)

(assert (=> b!1369971 (=> (not res!913472) (not e!775957))))

(assert (=> b!1369971 (= res!913472 (not (contains!9638 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369972 () Bool)

(declare-fun res!913466 () Bool)

(assert (=> b!1369972 (=> (not res!913466) (not e!775958))))

(assert (=> b!1369972 (= res!913466 (not (contains!9638 acc!866 (select (arr!44899 a!3861) from!3239))))))

(assert (= (and start!115882 res!913469) b!1369970))

(assert (= (and b!1369970 res!913470) b!1369969))

(assert (= (and b!1369969 res!913465) b!1369964))

(assert (= (and b!1369964 res!913475) b!1369971))

(assert (= (and b!1369971 res!913472) b!1369965))

(assert (= (and b!1369965 res!913471) b!1369962))

(assert (= (and b!1369962 res!913467) b!1369966))

(assert (= (and b!1369966 res!913468) b!1369961))

(assert (= (and b!1369961 res!913473) b!1369967))

(assert (= (and b!1369967 res!913464) b!1369972))

(assert (= (and b!1369972 res!913466) b!1369963))

(assert (= (and b!1369963 res!913474) b!1369968))

(declare-fun m!1253163 () Bool)

(assert (=> b!1369968 m!1253163))

(declare-fun m!1253165 () Bool)

(assert (=> b!1369968 m!1253165))

(declare-fun m!1253167 () Bool)

(assert (=> b!1369969 m!1253167))

(declare-fun m!1253169 () Bool)

(assert (=> b!1369970 m!1253169))

(declare-fun m!1253171 () Bool)

(assert (=> start!115882 m!1253171))

(assert (=> b!1369967 m!1253163))

(assert (=> b!1369967 m!1253163))

(declare-fun m!1253173 () Bool)

(assert (=> b!1369967 m!1253173))

(declare-fun m!1253175 () Bool)

(assert (=> b!1369962 m!1253175))

(declare-fun m!1253177 () Bool)

(assert (=> b!1369965 m!1253177))

(declare-fun m!1253179 () Bool)

(assert (=> b!1369966 m!1253179))

(declare-fun m!1253181 () Bool)

(assert (=> b!1369966 m!1253181))

(declare-fun m!1253183 () Bool)

(assert (=> b!1369964 m!1253183))

(assert (=> b!1369972 m!1253163))

(assert (=> b!1369972 m!1253163))

(declare-fun m!1253185 () Bool)

(assert (=> b!1369972 m!1253185))

(declare-fun m!1253187 () Bool)

(assert (=> b!1369971 m!1253187))

(check-sat (not start!115882) (not b!1369970) (not b!1369965) (not b!1369969) (not b!1369967) (not b!1369964) (not b!1369971) (not b!1369968) (not b!1369962) (not b!1369972) (not b!1369966))
(check-sat)
(get-model)

(declare-fun d!146957 () Bool)

(declare-fun lt!602202 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!723 (List!32045) (InoxSet (_ BitVec 64)))

(assert (=> d!146957 (= lt!602202 (select (content!723 acc!866) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!776003 () Bool)

(assert (=> d!146957 (= lt!602202 e!776003)))

(declare-fun res!913572 () Bool)

(assert (=> d!146957 (=> (not res!913572) (not e!776003))))

(get-info :version)

(assert (=> d!146957 (= res!913572 ((_ is Cons!32041) acc!866))))

(assert (=> d!146957 (= (contains!9638 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000) lt!602202)))

(declare-fun b!1370069 () Bool)

(declare-fun e!776002 () Bool)

(assert (=> b!1370069 (= e!776003 e!776002)))

(declare-fun res!913573 () Bool)

(assert (=> b!1370069 (=> res!913573 e!776002)))

(assert (=> b!1370069 (= res!913573 (= (h!33250 acc!866) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1370070 () Bool)

(assert (=> b!1370070 (= e!776002 (contains!9638 (t!46731 acc!866) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!146957 res!913572) b!1370069))

(assert (= (and b!1370069 (not res!913573)) b!1370070))

(declare-fun m!1253251 () Bool)

(assert (=> d!146957 m!1253251))

(declare-fun m!1253253 () Bool)

(assert (=> d!146957 m!1253253))

(declare-fun m!1253255 () Bool)

(assert (=> b!1370070 m!1253255))

(assert (=> b!1369964 d!146957))

(declare-fun d!146963 () Bool)

(declare-fun res!913588 () Bool)

(declare-fun e!776018 () Bool)

(assert (=> d!146963 (=> res!913588 e!776018)))

(assert (=> d!146963 (= res!913588 ((_ is Nil!32042) acc!866))))

(assert (=> d!146963 (= (noDuplicate!2553 acc!866) e!776018)))

(declare-fun b!1370085 () Bool)

(declare-fun e!776019 () Bool)

(assert (=> b!1370085 (= e!776018 e!776019)))

(declare-fun res!913589 () Bool)

(assert (=> b!1370085 (=> (not res!913589) (not e!776019))))

(assert (=> b!1370085 (= res!913589 (not (contains!9638 (t!46731 acc!866) (h!33250 acc!866))))))

(declare-fun b!1370086 () Bool)

(assert (=> b!1370086 (= e!776019 (noDuplicate!2553 (t!46731 acc!866)))))

(assert (= (and d!146963 (not res!913588)) b!1370085))

(assert (= (and b!1370085 res!913589) b!1370086))

(declare-fun m!1253267 () Bool)

(assert (=> b!1370085 m!1253267))

(declare-fun m!1253269 () Bool)

(assert (=> b!1370086 m!1253269))

(assert (=> b!1369970 d!146963))

(declare-fun d!146969 () Bool)

(declare-fun lt!602206 () Bool)

(assert (=> d!146969 (= lt!602206 (select (content!723 newAcc!98) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!776021 () Bool)

(assert (=> d!146969 (= lt!602206 e!776021)))

(declare-fun res!913590 () Bool)

(assert (=> d!146969 (=> (not res!913590) (not e!776021))))

(assert (=> d!146969 (= res!913590 ((_ is Cons!32041) newAcc!98))))

(assert (=> d!146969 (= (contains!9638 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000) lt!602206)))

(declare-fun b!1370087 () Bool)

(declare-fun e!776020 () Bool)

(assert (=> b!1370087 (= e!776021 e!776020)))

(declare-fun res!913591 () Bool)

(assert (=> b!1370087 (=> res!913591 e!776020)))

(assert (=> b!1370087 (= res!913591 (= (h!33250 newAcc!98) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1370088 () Bool)

(assert (=> b!1370088 (= e!776020 (contains!9638 (t!46731 newAcc!98) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!146969 res!913590) b!1370087))

(assert (= (and b!1370087 (not res!913591)) b!1370088))

(declare-fun m!1253271 () Bool)

(assert (=> d!146969 m!1253271))

(declare-fun m!1253273 () Bool)

(assert (=> d!146969 m!1253273))

(declare-fun m!1253275 () Bool)

(assert (=> b!1370088 m!1253275))

(assert (=> b!1369965 d!146969))

(declare-fun d!146973 () Bool)

(declare-fun lt!602209 () Bool)

(assert (=> d!146973 (= lt!602209 (select (content!723 newAcc!98) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!776027 () Bool)

(assert (=> d!146973 (= lt!602209 e!776027)))

(declare-fun res!913596 () Bool)

(assert (=> d!146973 (=> (not res!913596) (not e!776027))))

(assert (=> d!146973 (= res!913596 ((_ is Cons!32041) newAcc!98))))

(assert (=> d!146973 (= (contains!9638 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000) lt!602209)))

(declare-fun b!1370093 () Bool)

(declare-fun e!776026 () Bool)

(assert (=> b!1370093 (= e!776027 e!776026)))

(declare-fun res!913597 () Bool)

(assert (=> b!1370093 (=> res!913597 e!776026)))

(assert (=> b!1370093 (= res!913597 (= (h!33250 newAcc!98) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1370094 () Bool)

(assert (=> b!1370094 (= e!776026 (contains!9638 (t!46731 newAcc!98) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!146973 res!913596) b!1370093))

(assert (= (and b!1370093 (not res!913597)) b!1370094))

(assert (=> d!146973 m!1253271))

(declare-fun m!1253287 () Bool)

(assert (=> d!146973 m!1253287))

(declare-fun m!1253289 () Bool)

(assert (=> b!1370094 m!1253289))

(assert (=> b!1369971 d!146973))

(declare-fun c!127697 () Bool)

(declare-fun bm!65501 () Bool)

(declare-fun call!65504 () Bool)

(assert (=> bm!65501 (= call!65504 (arrayNoDuplicates!0 a!3861 (bvadd from!3239 #b00000000000000000000000000000001) (ite c!127697 (Cons!32041 (select (arr!44899 a!3861) from!3239) acc!866) acc!866)))))

(declare-fun b!1370129 () Bool)

(declare-fun e!776059 () Bool)

(assert (=> b!1370129 (= e!776059 call!65504)))

(declare-fun b!1370130 () Bool)

(assert (=> b!1370130 (= e!776059 call!65504)))

(declare-fun b!1370131 () Bool)

(declare-fun e!776057 () Bool)

(assert (=> b!1370131 (= e!776057 e!776059)))

(assert (=> b!1370131 (= c!127697 (validKeyInArray!0 (select (arr!44899 a!3861) from!3239)))))

(declare-fun b!1370132 () Bool)

(declare-fun e!776056 () Bool)

(assert (=> b!1370132 (= e!776056 (contains!9638 acc!866 (select (arr!44899 a!3861) from!3239)))))

(declare-fun d!146979 () Bool)

(declare-fun res!913620 () Bool)

(declare-fun e!776058 () Bool)

(assert (=> d!146979 (=> res!913620 e!776058)))

(assert (=> d!146979 (= res!913620 (bvsge from!3239 (size!45451 a!3861)))))

(assert (=> d!146979 (= (arrayNoDuplicates!0 a!3861 from!3239 acc!866) e!776058)))

(declare-fun b!1370133 () Bool)

(assert (=> b!1370133 (= e!776058 e!776057)))

(declare-fun res!913622 () Bool)

(assert (=> b!1370133 (=> (not res!913622) (not e!776057))))

(assert (=> b!1370133 (= res!913622 (not e!776056))))

(declare-fun res!913621 () Bool)

(assert (=> b!1370133 (=> (not res!913621) (not e!776056))))

(assert (=> b!1370133 (= res!913621 (validKeyInArray!0 (select (arr!44899 a!3861) from!3239)))))

(assert (= (and d!146979 (not res!913620)) b!1370133))

(assert (= (and b!1370133 res!913621) b!1370132))

(assert (= (and b!1370133 res!913622) b!1370131))

(assert (= (and b!1370131 c!127697) b!1370130))

(assert (= (and b!1370131 (not c!127697)) b!1370129))

(assert (= (or b!1370130 b!1370129) bm!65501))

(assert (=> bm!65501 m!1253163))

(declare-fun m!1253299 () Bool)

(assert (=> bm!65501 m!1253299))

(assert (=> b!1370131 m!1253163))

(assert (=> b!1370131 m!1253163))

(assert (=> b!1370131 m!1253173))

(assert (=> b!1370132 m!1253163))

(assert (=> b!1370132 m!1253163))

(assert (=> b!1370132 m!1253185))

(assert (=> b!1370133 m!1253163))

(assert (=> b!1370133 m!1253163))

(assert (=> b!1370133 m!1253173))

(assert (=> b!1369966 d!146979))

(declare-fun d!146987 () Bool)

(assert (=> d!146987 (noDuplicate!2553 newAcc!98)))

(declare-fun lt!602216 () Unit!45126)

(declare-fun choose!2013 (List!32045 List!32045) Unit!45126)

(assert (=> d!146987 (= lt!602216 (choose!2013 newAcc!98 acc!866))))

(declare-fun e!776073 () Bool)

(assert (=> d!146987 e!776073))

(declare-fun res!913633 () Bool)

(assert (=> d!146987 (=> (not res!913633) (not e!776073))))

(assert (=> d!146987 (= res!913633 (subseq!1076 newAcc!98 acc!866))))

(assert (=> d!146987 (= (noDuplicateSubseq!263 newAcc!98 acc!866) lt!602216)))

(declare-fun b!1370148 () Bool)

(assert (=> b!1370148 (= e!776073 (noDuplicate!2553 acc!866))))

(assert (= (and d!146987 res!913633) b!1370148))

(declare-fun m!1253305 () Bool)

(assert (=> d!146987 m!1253305))

(declare-fun m!1253309 () Bool)

(assert (=> d!146987 m!1253309))

(assert (=> d!146987 m!1253175))

(assert (=> b!1370148 m!1253169))

(assert (=> b!1369966 d!146987))

(declare-fun d!146993 () Bool)

(declare-fun lt!602220 () Bool)

(assert (=> d!146993 (= lt!602220 (select (content!723 acc!866) (select (arr!44899 a!3861) from!3239)))))

(declare-fun e!776077 () Bool)

(assert (=> d!146993 (= lt!602220 e!776077)))

(declare-fun res!913637 () Bool)

(assert (=> d!146993 (=> (not res!913637) (not e!776077))))

(assert (=> d!146993 (= res!913637 ((_ is Cons!32041) acc!866))))

(assert (=> d!146993 (= (contains!9638 acc!866 (select (arr!44899 a!3861) from!3239)) lt!602220)))

(declare-fun b!1370152 () Bool)

(declare-fun e!776076 () Bool)

(assert (=> b!1370152 (= e!776077 e!776076)))

(declare-fun res!913638 () Bool)

(assert (=> b!1370152 (=> res!913638 e!776076)))

(assert (=> b!1370152 (= res!913638 (= (h!33250 acc!866) (select (arr!44899 a!3861) from!3239)))))

(declare-fun b!1370153 () Bool)

(assert (=> b!1370153 (= e!776076 (contains!9638 (t!46731 acc!866) (select (arr!44899 a!3861) from!3239)))))

(assert (= (and d!146993 res!913637) b!1370152))

(assert (= (and b!1370152 (not res!913638)) b!1370153))

(assert (=> d!146993 m!1253251))

(assert (=> d!146993 m!1253163))

(declare-fun m!1253313 () Bool)

(assert (=> d!146993 m!1253313))

(assert (=> b!1370153 m!1253163))

(declare-fun m!1253315 () Bool)

(assert (=> b!1370153 m!1253315))

(assert (=> b!1369972 d!146993))

(declare-fun d!146997 () Bool)

(assert (=> d!146997 (= (validKeyInArray!0 (select (arr!44899 a!3861) from!3239)) (and (not (= (select (arr!44899 a!3861) from!3239) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!44899 a!3861) from!3239) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1369967 d!146997))

(declare-fun d!147001 () Bool)

(declare-fun res!913670 () Bool)

(declare-fun e!776108 () Bool)

(assert (=> d!147001 (=> res!913670 e!776108)))

(assert (=> d!147001 (= res!913670 ((_ is Nil!32042) newAcc!98))))

(assert (=> d!147001 (= (subseq!1076 newAcc!98 acc!866) e!776108)))

(declare-fun b!1370185 () Bool)

(declare-fun e!776109 () Bool)

(assert (=> b!1370185 (= e!776109 (subseq!1076 (t!46731 newAcc!98) (t!46731 acc!866)))))

(declare-fun b!1370184 () Bool)

(declare-fun e!776110 () Bool)

(declare-fun e!776107 () Bool)

(assert (=> b!1370184 (= e!776110 e!776107)))

(declare-fun res!913669 () Bool)

(assert (=> b!1370184 (=> res!913669 e!776107)))

(assert (=> b!1370184 (= res!913669 e!776109)))

(declare-fun res!913671 () Bool)

(assert (=> b!1370184 (=> (not res!913671) (not e!776109))))

(assert (=> b!1370184 (= res!913671 (= (h!33250 newAcc!98) (h!33250 acc!866)))))

(declare-fun b!1370186 () Bool)

(assert (=> b!1370186 (= e!776107 (subseq!1076 newAcc!98 (t!46731 acc!866)))))

(declare-fun b!1370183 () Bool)

(assert (=> b!1370183 (= e!776108 e!776110)))

(declare-fun res!913668 () Bool)

(assert (=> b!1370183 (=> (not res!913668) (not e!776110))))

(assert (=> b!1370183 (= res!913668 ((_ is Cons!32041) acc!866))))

(assert (= (and d!147001 (not res!913670)) b!1370183))

(assert (= (and b!1370183 res!913668) b!1370184))

(assert (= (and b!1370184 res!913671) b!1370185))

(assert (= (and b!1370184 (not res!913669)) b!1370186))

(declare-fun m!1253339 () Bool)

(assert (=> b!1370185 m!1253339))

(declare-fun m!1253341 () Bool)

(assert (=> b!1370186 m!1253341))

(assert (=> b!1369962 d!147001))

(declare-fun d!147009 () Bool)

(assert (=> d!147009 (= (array_inv!34132 a!3861) (bvsge (size!45451 a!3861) #b00000000000000000000000000000000))))

(assert (=> start!115882 d!147009))

(declare-fun d!147011 () Bool)

(declare-fun res!913672 () Bool)

(declare-fun e!776111 () Bool)

(assert (=> d!147011 (=> res!913672 e!776111)))

(assert (=> d!147011 (= res!913672 ((_ is Nil!32042) (Cons!32041 (select (arr!44899 a!3861) from!3239) acc!866)))))

(assert (=> d!147011 (= (noDuplicate!2553 (Cons!32041 (select (arr!44899 a!3861) from!3239) acc!866)) e!776111)))

(declare-fun b!1370187 () Bool)

(declare-fun e!776112 () Bool)

(assert (=> b!1370187 (= e!776111 e!776112)))

(declare-fun res!913673 () Bool)

(assert (=> b!1370187 (=> (not res!913673) (not e!776112))))

(assert (=> b!1370187 (= res!913673 (not (contains!9638 (t!46731 (Cons!32041 (select (arr!44899 a!3861) from!3239) acc!866)) (h!33250 (Cons!32041 (select (arr!44899 a!3861) from!3239) acc!866)))))))

(declare-fun b!1370188 () Bool)

(assert (=> b!1370188 (= e!776112 (noDuplicate!2553 (t!46731 (Cons!32041 (select (arr!44899 a!3861) from!3239) acc!866))))))

(assert (= (and d!147011 (not res!913672)) b!1370187))

(assert (= (and b!1370187 res!913673) b!1370188))

(declare-fun m!1253343 () Bool)

(assert (=> b!1370187 m!1253343))

(declare-fun m!1253345 () Bool)

(assert (=> b!1370188 m!1253345))

(assert (=> b!1369968 d!147011))

(declare-fun d!147013 () Bool)

(declare-fun lt!602224 () Bool)

(assert (=> d!147013 (= lt!602224 (select (content!723 acc!866) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!776118 () Bool)

(assert (=> d!147013 (= lt!602224 e!776118)))

(declare-fun res!913678 () Bool)

(assert (=> d!147013 (=> (not res!913678) (not e!776118))))

(assert (=> d!147013 (= res!913678 ((_ is Cons!32041) acc!866))))

(assert (=> d!147013 (= (contains!9638 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000) lt!602224)))

(declare-fun b!1370193 () Bool)

(declare-fun e!776117 () Bool)

(assert (=> b!1370193 (= e!776118 e!776117)))

(declare-fun res!913679 () Bool)

(assert (=> b!1370193 (=> res!913679 e!776117)))

(assert (=> b!1370193 (= res!913679 (= (h!33250 acc!866) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1370194 () Bool)

(assert (=> b!1370194 (= e!776117 (contains!9638 (t!46731 acc!866) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!147013 res!913678) b!1370193))

(assert (= (and b!1370193 (not res!913679)) b!1370194))

(assert (=> d!147013 m!1253251))

(declare-fun m!1253351 () Bool)

(assert (=> d!147013 m!1253351))

(declare-fun m!1253355 () Bool)

(assert (=> b!1370194 m!1253355))

(assert (=> b!1369969 d!147013))

(check-sat (not b!1370194) (not b!1370085) (not d!146957) (not d!146987) (not b!1370133) (not b!1370185) (not b!1370153) (not d!146973) (not d!146969) (not b!1370148) (not b!1370186) (not d!147013) (not b!1370188) (not b!1370132) (not b!1370070) (not b!1370187) (not b!1370086) (not b!1370094) (not bm!65501) (not d!146993) (not b!1370088) (not b!1370131))
(check-sat)
