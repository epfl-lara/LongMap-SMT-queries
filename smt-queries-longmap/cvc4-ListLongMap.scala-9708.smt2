; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114810 () Bool)

(assert start!114810)

(declare-fun b!1361234 () Bool)

(declare-fun e!772272 () Bool)

(declare-fun e!772271 () Bool)

(assert (=> b!1361234 (= e!772272 e!772271)))

(declare-fun res!905408 () Bool)

(assert (=> b!1361234 (=> (not res!905408) (not e!772271))))

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun lt!600115 () Bool)

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1361234 (= res!905408 (and (not (= from!3120 i!1404)) lt!600115))))

(declare-datatypes ((Unit!44862 0))(
  ( (Unit!44863) )
))
(declare-fun lt!600113 () Unit!44862)

(declare-fun e!772270 () Unit!44862)

(assert (=> b!1361234 (= lt!600113 e!772270)))

(declare-fun c!127358 () Bool)

(assert (=> b!1361234 (= c!127358 lt!600115)))

(declare-datatypes ((array!92596 0))(
  ( (array!92597 (arr!44734 (Array (_ BitVec 32) (_ BitVec 64))) (size!45284 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92596)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1361234 (= lt!600115 (validKeyInArray!0 (select (arr!44734 a!3742) from!3120)))))

(declare-fun b!1361235 () Bool)

(declare-fun e!772273 () Bool)

(assert (=> b!1361235 (= e!772273 false)))

(declare-fun lt!600116 () Bool)

(declare-datatypes ((List!31775 0))(
  ( (Nil!31772) (Cons!31771 (h!32980 (_ BitVec 64)) (t!46457 List!31775)) )
))
(declare-fun lt!600117 () List!31775)

(declare-fun contains!9484 (List!31775 (_ BitVec 64)) Bool)

(assert (=> b!1361235 (= lt!600116 (contains!9484 lt!600117 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1361236 () Bool)

(declare-fun res!905403 () Bool)

(assert (=> b!1361236 (=> (not res!905403) (not e!772272))))

(declare-fun acc!759 () List!31775)

(assert (=> b!1361236 (= res!905403 (not (contains!9484 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1361237 () Bool)

(declare-fun res!905404 () Bool)

(assert (=> b!1361237 (=> (not res!905404) (not e!772272))))

(declare-fun arrayNoDuplicates!0 (array!92596 (_ BitVec 32) List!31775) Bool)

(assert (=> b!1361237 (= res!905404 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1361238 () Bool)

(declare-fun res!905406 () Bool)

(assert (=> b!1361238 (=> (not res!905406) (not e!772272))))

(assert (=> b!1361238 (= res!905406 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31772))))

(declare-fun b!1361239 () Bool)

(declare-fun res!905405 () Bool)

(assert (=> b!1361239 (=> (not res!905405) (not e!772273))))

(assert (=> b!1361239 (= res!905405 (not (contains!9484 lt!600117 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!905402 () Bool)

(assert (=> start!114810 (=> (not res!905402) (not e!772272))))

(assert (=> start!114810 (= res!905402 (and (bvslt (size!45284 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45284 a!3742))))))

(assert (=> start!114810 e!772272))

(assert (=> start!114810 true))

(declare-fun array_inv!33762 (array!92596) Bool)

(assert (=> start!114810 (array_inv!33762 a!3742)))

(declare-fun b!1361240 () Bool)

(declare-fun Unit!44864 () Unit!44862)

(assert (=> b!1361240 (= e!772270 Unit!44864)))

(declare-fun b!1361241 () Bool)

(assert (=> b!1361241 (= e!772271 e!772273)))

(declare-fun res!905401 () Bool)

(assert (=> b!1361241 (=> (not res!905401) (not e!772273))))

(assert (=> b!1361241 (= res!905401 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!889 (List!31775 (_ BitVec 64)) List!31775)

(assert (=> b!1361241 (= lt!600117 ($colon$colon!889 acc!759 (select (arr!44734 a!3742) from!3120)))))

(declare-fun b!1361242 () Bool)

(declare-fun lt!600114 () Unit!44862)

(assert (=> b!1361242 (= e!772270 lt!600114)))

(declare-fun lt!600118 () Unit!44862)

(declare-fun lemmaListSubSeqRefl!0 (List!31775) Unit!44862)

(assert (=> b!1361242 (= lt!600118 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!886 (List!31775 List!31775) Bool)

(assert (=> b!1361242 (subseq!886 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92596 List!31775 List!31775 (_ BitVec 32)) Unit!44862)

(assert (=> b!1361242 (= lt!600114 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!889 acc!759 (select (arr!44734 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1361242 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1361243 () Bool)

(declare-fun res!905399 () Bool)

(assert (=> b!1361243 (=> (not res!905399) (not e!772272))))

(assert (=> b!1361243 (= res!905399 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45284 a!3742)))))

(declare-fun b!1361244 () Bool)

(declare-fun res!905407 () Bool)

(assert (=> b!1361244 (=> (not res!905407) (not e!772272))))

(assert (=> b!1361244 (= res!905407 (not (contains!9484 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1361245 () Bool)

(declare-fun res!905409 () Bool)

(assert (=> b!1361245 (=> (not res!905409) (not e!772272))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1361245 (= res!905409 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1361246 () Bool)

(declare-fun res!905400 () Bool)

(assert (=> b!1361246 (=> (not res!905400) (not e!772272))))

(assert (=> b!1361246 (= res!905400 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45284 a!3742))))))

(declare-fun b!1361247 () Bool)

(declare-fun res!905410 () Bool)

(assert (=> b!1361247 (=> (not res!905410) (not e!772272))))

(declare-fun noDuplicate!2341 (List!31775) Bool)

(assert (=> b!1361247 (= res!905410 (noDuplicate!2341 acc!759))))

(declare-fun b!1361248 () Bool)

(declare-fun res!905398 () Bool)

(assert (=> b!1361248 (=> (not res!905398) (not e!772273))))

(assert (=> b!1361248 (= res!905398 (noDuplicate!2341 lt!600117))))

(assert (= (and start!114810 res!905402) b!1361247))

(assert (= (and b!1361247 res!905410) b!1361236))

(assert (= (and b!1361236 res!905403) b!1361244))

(assert (= (and b!1361244 res!905407) b!1361238))

(assert (= (and b!1361238 res!905406) b!1361237))

(assert (= (and b!1361237 res!905404) b!1361246))

(assert (= (and b!1361246 res!905400) b!1361245))

(assert (= (and b!1361245 res!905409) b!1361243))

(assert (= (and b!1361243 res!905399) b!1361234))

(assert (= (and b!1361234 c!127358) b!1361242))

(assert (= (and b!1361234 (not c!127358)) b!1361240))

(assert (= (and b!1361234 res!905408) b!1361241))

(assert (= (and b!1361241 res!905401) b!1361248))

(assert (= (and b!1361248 res!905398) b!1361239))

(assert (= (and b!1361239 res!905405) b!1361235))

(declare-fun m!1246383 () Bool)

(assert (=> b!1361234 m!1246383))

(assert (=> b!1361234 m!1246383))

(declare-fun m!1246385 () Bool)

(assert (=> b!1361234 m!1246385))

(declare-fun m!1246387 () Bool)

(assert (=> b!1361247 m!1246387))

(declare-fun m!1246389 () Bool)

(assert (=> b!1361239 m!1246389))

(declare-fun m!1246391 () Bool)

(assert (=> b!1361245 m!1246391))

(declare-fun m!1246393 () Bool)

(assert (=> b!1361244 m!1246393))

(declare-fun m!1246395 () Bool)

(assert (=> b!1361238 m!1246395))

(declare-fun m!1246397 () Bool)

(assert (=> b!1361237 m!1246397))

(declare-fun m!1246399 () Bool)

(assert (=> b!1361236 m!1246399))

(assert (=> b!1361241 m!1246383))

(assert (=> b!1361241 m!1246383))

(declare-fun m!1246401 () Bool)

(assert (=> b!1361241 m!1246401))

(declare-fun m!1246403 () Bool)

(assert (=> b!1361248 m!1246403))

(declare-fun m!1246405 () Bool)

(assert (=> b!1361242 m!1246405))

(assert (=> b!1361242 m!1246383))

(assert (=> b!1361242 m!1246401))

(declare-fun m!1246407 () Bool)

(assert (=> b!1361242 m!1246407))

(declare-fun m!1246409 () Bool)

(assert (=> b!1361242 m!1246409))

(assert (=> b!1361242 m!1246383))

(assert (=> b!1361242 m!1246401))

(declare-fun m!1246411 () Bool)

(assert (=> b!1361242 m!1246411))

(declare-fun m!1246413 () Bool)

(assert (=> b!1361235 m!1246413))

(declare-fun m!1246415 () Bool)

(assert (=> start!114810 m!1246415))

(push 1)

