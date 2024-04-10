; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116304 () Bool)

(assert start!116304)

(declare-fun b!1373058 () Bool)

(declare-fun e!777768 () Bool)

(declare-fun e!777769 () Bool)

(assert (=> b!1373058 (= e!777768 e!777769)))

(declare-fun res!916334 () Bool)

(assert (=> b!1373058 (=> (not res!916334) (not e!777769))))

(declare-datatypes ((array!93121 0))(
  ( (array!93122 (arr!44971 (Array (_ BitVec 32) (_ BitVec 64))) (size!45521 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!93121)

(declare-fun from!3239 () (_ BitVec 32))

(declare-datatypes ((List!32039 0))(
  ( (Nil!32036) (Cons!32035 (h!33244 (_ BitVec 64)) (t!46733 List!32039)) )
))
(declare-fun acc!866 () List!32039)

(declare-fun arrayNoDuplicates!0 (array!93121 (_ BitVec 32) List!32039) Bool)

(assert (=> b!1373058 (= res!916334 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45379 0))(
  ( (Unit!45380) )
))
(declare-fun lt!602998 () Unit!45379)

(declare-fun newAcc!98 () List!32039)

(declare-fun noDuplicateSubseq!310 (List!32039 List!32039) Unit!45379)

(assert (=> b!1373058 (= lt!602998 (noDuplicateSubseq!310 newAcc!98 acc!866))))

(declare-fun res!916332 () Bool)

(assert (=> start!116304 (=> (not res!916332) (not e!777768))))

(assert (=> start!116304 (= res!916332 (and (bvslt (size!45521 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45521 a!3861))))))

(assert (=> start!116304 e!777768))

(declare-fun array_inv!33999 (array!93121) Bool)

(assert (=> start!116304 (array_inv!33999 a!3861)))

(assert (=> start!116304 true))

(declare-fun b!1373059 () Bool)

(declare-fun res!916327 () Bool)

(assert (=> b!1373059 (=> (not res!916327) (not e!777768))))

(declare-fun contains!9721 (List!32039 (_ BitVec 64)) Bool)

(assert (=> b!1373059 (= res!916327 (not (contains!9721 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1373060 () Bool)

(assert (=> b!1373060 (= e!777769 (not (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) acc!866)))))

(declare-fun b!1373061 () Bool)

(declare-fun res!916328 () Bool)

(assert (=> b!1373061 (=> (not res!916328) (not e!777768))))

(assert (=> b!1373061 (= res!916328 (not (contains!9721 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1373062 () Bool)

(declare-fun res!916326 () Bool)

(assert (=> b!1373062 (=> (not res!916326) (not e!777768))))

(declare-fun noDuplicate!2578 (List!32039) Bool)

(assert (=> b!1373062 (= res!916326 (noDuplicate!2578 acc!866))))

(declare-fun b!1373063 () Bool)

(declare-fun res!916330 () Bool)

(assert (=> b!1373063 (=> (not res!916330) (not e!777768))))

(assert (=> b!1373063 (= res!916330 (not (contains!9721 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1373064 () Bool)

(declare-fun res!916331 () Bool)

(assert (=> b!1373064 (=> (not res!916331) (not e!777768))))

(declare-fun subseq!1123 (List!32039 List!32039) Bool)

(assert (=> b!1373064 (= res!916331 (subseq!1123 newAcc!98 acc!866))))

(declare-fun b!1373065 () Bool)

(declare-fun res!916335 () Bool)

(assert (=> b!1373065 (=> (not res!916335) (not e!777769))))

(assert (=> b!1373065 (= res!916335 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) #b00000000000000000000000000000000))))

(declare-fun b!1373066 () Bool)

(declare-fun res!916333 () Bool)

(assert (=> b!1373066 (=> (not res!916333) (not e!777769))))

(assert (=> b!1373066 (= res!916333 (bvslt from!3239 (size!45521 a!3861)))))

(declare-fun b!1373067 () Bool)

(declare-fun res!916329 () Bool)

(assert (=> b!1373067 (=> (not res!916329) (not e!777769))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1373067 (= res!916329 (not (validKeyInArray!0 (select (arr!44971 a!3861) from!3239))))))

(declare-fun b!1373068 () Bool)

(declare-fun res!916336 () Bool)

(assert (=> b!1373068 (=> (not res!916336) (not e!777768))))

(assert (=> b!1373068 (= res!916336 (not (contains!9721 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!116304 res!916332) b!1373062))

(assert (= (and b!1373062 res!916326) b!1373063))

(assert (= (and b!1373063 res!916330) b!1373059))

(assert (= (and b!1373059 res!916327) b!1373061))

(assert (= (and b!1373061 res!916328) b!1373068))

(assert (= (and b!1373068 res!916336) b!1373064))

(assert (= (and b!1373064 res!916331) b!1373058))

(assert (= (and b!1373058 res!916334) b!1373066))

(assert (= (and b!1373066 res!916333) b!1373067))

(assert (= (and b!1373067 res!916329) b!1373065))

(assert (= (and b!1373065 res!916335) b!1373060))

(declare-fun m!1256389 () Bool)

(assert (=> b!1373063 m!1256389))

(declare-fun m!1256391 () Bool)

(assert (=> b!1373068 m!1256391))

(declare-fun m!1256393 () Bool)

(assert (=> start!116304 m!1256393))

(declare-fun m!1256395 () Bool)

(assert (=> b!1373060 m!1256395))

(declare-fun m!1256397 () Bool)

(assert (=> b!1373061 m!1256397))

(declare-fun m!1256399 () Bool)

(assert (=> b!1373064 m!1256399))

(declare-fun m!1256401 () Bool)

(assert (=> b!1373058 m!1256401))

(declare-fun m!1256403 () Bool)

(assert (=> b!1373058 m!1256403))

(declare-fun m!1256405 () Bool)

(assert (=> b!1373059 m!1256405))

(declare-fun m!1256407 () Bool)

(assert (=> b!1373067 m!1256407))

(assert (=> b!1373067 m!1256407))

(declare-fun m!1256409 () Bool)

(assert (=> b!1373067 m!1256409))

(declare-fun m!1256411 () Bool)

(assert (=> b!1373062 m!1256411))

(push 1)

(assert (not b!1373062))

(assert (not start!116304))

(assert (not b!1373063))

(assert (not b!1373068))

(assert (not b!1373060))

(assert (not b!1373067))

(assert (not b!1373061))

(assert (not b!1373058))

(assert (not b!1373064))

(assert (not b!1373059))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!147891 () Bool)

(declare-fun lt!603006 () Bool)

(declare-fun content!747 (List!32039) (Set (_ BitVec 64)))

(assert (=> d!147891 (= lt!603006 (member #b1000000000000000000000000000000000000000000000000000000000000000 (content!747 acc!866)))))

(declare-fun e!777800 () Bool)

(assert (=> d!147891 (= lt!603006 e!777800)))

(declare-fun res!916364 () Bool)

(assert (=> d!147891 (=> (not res!916364) (not e!777800))))

(assert (=> d!147891 (= res!916364 (is-Cons!32035 acc!866))))

(assert (=> d!147891 (= (contains!9721 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000) lt!603006)))

(declare-fun b!1373101 () Bool)

(declare-fun e!777799 () Bool)

(assert (=> b!1373101 (= e!777800 e!777799)))

(declare-fun res!916363 () Bool)

(assert (=> b!1373101 (=> res!916363 e!777799)))

(assert (=> b!1373101 (= res!916363 (= (h!33244 acc!866) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1373102 () Bool)

(assert (=> b!1373102 (= e!777799 (contains!9721 (t!46733 acc!866) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!147891 res!916364) b!1373101))

(assert (= (and b!1373101 (not res!916363)) b!1373102))

(declare-fun m!1256425 () Bool)

(assert (=> d!147891 m!1256425))

(declare-fun m!1256429 () Bool)

(assert (=> d!147891 m!1256429))

(declare-fun m!1256433 () Bool)

(assert (=> b!1373102 m!1256433))

(assert (=> b!1373059 d!147891))

(declare-fun b!1373129 () Bool)

(declare-fun e!777827 () Bool)

(declare-fun e!777825 () Bool)

(assert (=> b!1373129 (= e!777827 e!777825)))

(declare-fun res!916389 () Bool)

(assert (=> b!1373129 (=> (not res!916389) (not e!777825))))

(assert (=> b!1373129 (= res!916389 (is-Cons!32035 acc!866))))

(declare-fun d!147897 () Bool)

(declare-fun res!916388 () Bool)

(assert (=> d!147897 (=> res!916388 e!777827)))

(assert (=> d!147897 (= res!916388 (is-Nil!32036 newAcc!98))))

(assert (=> d!147897 (= (subseq!1123 newAcc!98 acc!866) e!777827)))

(declare-fun b!1373131 () Bool)

(declare-fun e!777826 () Bool)

(assert (=> b!1373131 (= e!777826 (subseq!1123 (t!46733 newAcc!98) (t!46733 acc!866)))))

(declare-fun b!1373132 () Bool)

(declare-fun e!777828 () Bool)

(assert (=> b!1373132 (= e!777828 (subseq!1123 newAcc!98 (t!46733 acc!866)))))

(declare-fun b!1373130 () Bool)

(assert (=> b!1373130 (= e!777825 e!777828)))

(declare-fun res!916390 () Bool)

(assert (=> b!1373130 (=> res!916390 e!777828)))

(assert (=> b!1373130 (= res!916390 e!777826)))

(declare-fun res!916387 () Bool)

(assert (=> b!1373130 (=> (not res!916387) (not e!777826))))

(assert (=> b!1373130 (= res!916387 (= (h!33244 newAcc!98) (h!33244 acc!866)))))

(assert (= (and d!147897 (not res!916388)) b!1373129))

(assert (= (and b!1373129 res!916389) b!1373130))

(assert (= (and b!1373130 res!916387) b!1373131))

(assert (= (and b!1373130 (not res!916390)) b!1373132))

(declare-fun m!1256443 () Bool)

(assert (=> b!1373131 m!1256443))

(declare-fun m!1256445 () Bool)

(assert (=> b!1373132 m!1256445))

(assert (=> b!1373064 d!147897))

(declare-fun d!147907 () Bool)

(assert (=> d!147907 (= (array_inv!33999 a!3861) (bvsge (size!45521 a!3861) #b00000000000000000000000000000000))))

(assert (=> start!116304 d!147907))

(declare-fun b!1373172 () Bool)

(declare-fun e!777864 () Bool)

(declare-fun e!777866 () Bool)

(assert (=> b!1373172 (= e!777864 e!777866)))

(declare-fun c!127815 () Bool)

(assert (=> b!1373172 (= c!127815 (validKeyInArray!0 (select (arr!44971 a!3861) (bvadd #b00000000000000000000000000000001 from!3239))))))

(declare-fun d!147909 () Bool)

(declare-fun res!916423 () Bool)

(declare-fun e!777867 () Bool)

(assert (=> d!147909 (=> res!916423 e!777867)))

(assert (=> d!147909 (= res!916423 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) (size!45521 a!3861)))))

(assert (=> d!147909 (= (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) acc!866) e!777867)))

(declare-fun b!1373173 () Bool)

(declare-fun call!65610 () Bool)

(assert (=> b!1373173 (= e!777866 call!65610)))

(declare-fun b!1373174 () Bool)

(assert (=> b!1373174 (= e!777867 e!777864)))

(declare-fun res!916422 () Bool)

(assert (=> b!1373174 (=> (not res!916422) (not e!777864))))

(declare-fun e!777865 () Bool)

(assert (=> b!1373174 (= res!916422 (not e!777865))))

(declare-fun res!916424 () Bool)

(assert (=> b!1373174 (=> (not res!916424) (not e!777865))))

(assert (=> b!1373174 (= res!916424 (validKeyInArray!0 (select (arr!44971 a!3861) (bvadd #b00000000000000000000000000000001 from!3239))))))

(declare-fun b!1373175 () Bool)

(assert (=> b!1373175 (= e!777865 (contains!9721 acc!866 (select (arr!44971 a!3861) (bvadd #b00000000000000000000000000000001 from!3239))))))

(declare-fun b!1373176 () Bool)

(assert (=> b!1373176 (= e!777866 call!65610)))

(declare-fun bm!65607 () Bool)

(assert (=> bm!65607 (= call!65610 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239 #b00000000000000000000000000000001) (ite c!127815 (Cons!32035 (select (arr!44971 a!3861) (bvadd #b00000000000000000000000000000001 from!3239)) acc!866) acc!866)))))

(assert (= (and d!147909 (not res!916423)) b!1373174))

(assert (= (and b!1373174 res!916424) b!1373175))

(assert (= (and b!1373174 res!916422) b!1373172))

(assert (= (and b!1373172 c!127815) b!1373173))

(assert (= (and b!1373172 (not c!127815)) b!1373176))

(assert (= (or b!1373173 b!1373176) bm!65607))

(declare-fun m!1256470 () Bool)

(assert (=> b!1373172 m!1256470))

(assert (=> b!1373172 m!1256470))

(declare-fun m!1256473 () Bool)

(assert (=> b!1373172 m!1256473))

(assert (=> b!1373174 m!1256470))

(assert (=> b!1373174 m!1256470))

(assert (=> b!1373174 m!1256473))

(assert (=> b!1373175 m!1256470))

(assert (=> b!1373175 m!1256470))

(declare-fun m!1256475 () Bool)

(assert (=> b!1373175 m!1256475))

(assert (=> bm!65607 m!1256470))

(declare-fun m!1256483 () Bool)

(assert (=> bm!65607 m!1256483))

(assert (=> b!1373060 d!147909))

(declare-fun d!147925 () Bool)

(declare-fun lt!603016 () Bool)

(assert (=> d!147925 (= lt!603016 (member #b0000000000000000000000000000000000000000000000000000000000000000 (content!747 newAcc!98)))))

(declare-fun e!777875 () Bool)

(assert (=> d!147925 (= lt!603016 e!777875)))

(declare-fun res!916432 () Bool)

(assert (=> d!147925 (=> (not res!916432) (not e!777875))))

(assert (=> d!147925 (= res!916432 (is-Cons!32035 newAcc!98))))

(assert (=> d!147925 (= (contains!9721 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000) lt!603016)))

(declare-fun b!1373183 () Bool)

(declare-fun e!777874 () Bool)

(assert (=> b!1373183 (= e!777875 e!777874)))

(declare-fun res!916431 () Bool)

(assert (=> b!1373183 (=> res!916431 e!777874)))

(assert (=> b!1373183 (= res!916431 (= (h!33244 newAcc!98) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1373184 () Bool)

(assert (=> b!1373184 (= e!777874 (contains!9721 (t!46733 newAcc!98) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!147925 res!916432) b!1373183))

(assert (= (and b!1373183 (not res!916431)) b!1373184))

(declare-fun m!1256489 () Bool)

(assert (=> d!147925 m!1256489))

(declare-fun m!1256491 () Bool)

(assert (=> d!147925 m!1256491))

(declare-fun m!1256493 () Bool)

(assert (=> b!1373184 m!1256493))

(assert (=> b!1373061 d!147925))

(declare-fun d!147929 () Bool)

(assert (=> d!147929 (= (validKeyInArray!0 (select (arr!44971 a!3861) from!3239)) (and (not (= (select (arr!44971 a!3861) from!3239) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!44971 a!3861) from!3239) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1373067 d!147929))

(declare-fun d!147939 () Bool)

(declare-fun res!916448 () Bool)

(declare-fun e!777892 () Bool)

(assert (=> d!147939 (=> res!916448 e!777892)))

(assert (=> d!147939 (= res!916448 (is-Nil!32036 acc!866))))

(assert (=> d!147939 (= (noDuplicate!2578 acc!866) e!777892)))

(declare-fun b!1373200 () Bool)

(declare-fun e!777893 () Bool)

(assert (=> b!1373200 (= e!777892 e!777893)))

(declare-fun res!916449 () Bool)

(assert (=> b!1373200 (=> (not res!916449) (not e!777893))))

(assert (=> b!1373200 (= res!916449 (not (contains!9721 (t!46733 acc!866) (h!33244 acc!866))))))

(declare-fun b!1373201 () Bool)

(assert (=> b!1373201 (= e!777893 (noDuplicate!2578 (t!46733 acc!866)))))

(assert (= (and d!147939 (not res!916448)) b!1373200))

(assert (= (and b!1373200 res!916449) b!1373201))

(declare-fun m!1256517 () Bool)

(assert (=> b!1373200 m!1256517))

(declare-fun m!1256519 () Bool)

(assert (=> b!1373201 m!1256519))

(assert (=> b!1373062 d!147939))

(declare-fun d!147941 () Bool)

(declare-fun lt!603020 () Bool)

(assert (=> d!147941 (= lt!603020 (member #b0000000000000000000000000000000000000000000000000000000000000000 (content!747 acc!866)))))

(declare-fun e!777901 () Bool)

(assert (=> d!147941 (= lt!603020 e!777901)))

(declare-fun res!916457 () Bool)

(assert (=> d!147941 (=> (not res!916457) (not e!777901))))

(assert (=> d!147941 (= res!916457 (is-Cons!32035 acc!866))))

