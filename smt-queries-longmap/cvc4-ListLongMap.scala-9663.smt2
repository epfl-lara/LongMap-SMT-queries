; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114120 () Bool)

(assert start!114120)

(declare-fun b!1355366 () Bool)

(declare-datatypes ((Unit!44538 0))(
  ( (Unit!44539) )
))
(declare-fun e!769721 () Unit!44538)

(declare-fun Unit!44540 () Unit!44538)

(assert (=> b!1355366 (= e!769721 Unit!44540)))

(declare-fun b!1355367 () Bool)

(declare-fun res!900312 () Bool)

(declare-fun e!769722 () Bool)

(assert (=> b!1355367 (=> (not res!900312) (not e!769722))))

(declare-datatypes ((List!31640 0))(
  ( (Nil!31637) (Cons!31636 (h!32845 (_ BitVec 64)) (t!46298 List!31640)) )
))
(declare-fun acc!759 () List!31640)

(declare-fun contains!9349 (List!31640 (_ BitVec 64)) Bool)

(assert (=> b!1355367 (= res!900312 (not (contains!9349 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!900304 () Bool)

(assert (=> start!114120 (=> (not res!900304) (not e!769722))))

(declare-datatypes ((array!92302 0))(
  ( (array!92303 (arr!44599 (Array (_ BitVec 32) (_ BitVec 64))) (size!45149 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92302)

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> start!114120 (= res!900304 (and (bvslt (size!45149 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45149 a!3742))))))

(assert (=> start!114120 e!769722))

(assert (=> start!114120 true))

(declare-fun array_inv!33627 (array!92302) Bool)

(assert (=> start!114120 (array_inv!33627 a!3742)))

(declare-fun b!1355368 () Bool)

(declare-fun res!900311 () Bool)

(assert (=> b!1355368 (=> (not res!900311) (not e!769722))))

(assert (=> b!1355368 (= res!900311 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45149 a!3742)))))

(declare-fun b!1355369 () Bool)

(declare-fun res!900309 () Bool)

(assert (=> b!1355369 (=> (not res!900309) (not e!769722))))

(assert (=> b!1355369 (= res!900309 (not (contains!9349 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1355370 () Bool)

(declare-fun res!900305 () Bool)

(assert (=> b!1355370 (=> (not res!900305) (not e!769722))))

(declare-fun noDuplicate!2206 (List!31640) Bool)

(assert (=> b!1355370 (= res!900305 (noDuplicate!2206 acc!759))))

(declare-fun b!1355371 () Bool)

(declare-fun res!900313 () Bool)

(assert (=> b!1355371 (=> (not res!900313) (not e!769722))))

(declare-fun arrayNoDuplicates!0 (array!92302 (_ BitVec 32) List!31640) Bool)

(assert (=> b!1355371 (= res!900313 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1355372 () Bool)

(declare-fun res!900307 () Bool)

(assert (=> b!1355372 (=> (not res!900307) (not e!769722))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1355372 (= res!900307 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1355373 () Bool)

(declare-fun res!900308 () Bool)

(assert (=> b!1355373 (=> (not res!900308) (not e!769722))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1355373 (= res!900308 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45149 a!3742))))))

(declare-fun b!1355374 () Bool)

(declare-fun e!769720 () Bool)

(assert (=> b!1355374 (= e!769722 e!769720)))

(declare-fun res!900310 () Bool)

(assert (=> b!1355374 (=> (not res!900310) (not e!769720))))

(declare-fun lt!598603 () Bool)

(assert (=> b!1355374 (= res!900310 (and (not (= from!3120 i!1404)) (not lt!598603) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-fun lt!598599 () Unit!44538)

(assert (=> b!1355374 (= lt!598599 e!769721)))

(declare-fun c!126971 () Bool)

(assert (=> b!1355374 (= c!126971 lt!598603)))

(assert (=> b!1355374 (= lt!598603 (validKeyInArray!0 (select (arr!44599 a!3742) from!3120)))))

(declare-fun b!1355375 () Bool)

(assert (=> b!1355375 (= e!769720 false)))

(declare-fun lt!598600 () Bool)

(assert (=> b!1355375 (= lt!598600 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1355376 () Bool)

(declare-fun lt!598601 () Unit!44538)

(assert (=> b!1355376 (= e!769721 lt!598601)))

(declare-fun lt!598602 () Unit!44538)

(declare-fun lemmaListSubSeqRefl!0 (List!31640) Unit!44538)

(assert (=> b!1355376 (= lt!598602 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!769 (List!31640 List!31640) Bool)

(assert (=> b!1355376 (subseq!769 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92302 List!31640 List!31640 (_ BitVec 32)) Unit!44538)

(declare-fun $colon$colon!784 (List!31640 (_ BitVec 64)) List!31640)

(assert (=> b!1355376 (= lt!598601 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!784 acc!759 (select (arr!44599 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1355376 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1355377 () Bool)

(declare-fun res!900306 () Bool)

(assert (=> b!1355377 (=> (not res!900306) (not e!769722))))

(assert (=> b!1355377 (= res!900306 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31637))))

(assert (= (and start!114120 res!900304) b!1355370))

(assert (= (and b!1355370 res!900305) b!1355369))

(assert (= (and b!1355369 res!900309) b!1355367))

(assert (= (and b!1355367 res!900312) b!1355377))

(assert (= (and b!1355377 res!900306) b!1355371))

(assert (= (and b!1355371 res!900313) b!1355373))

(assert (= (and b!1355373 res!900308) b!1355372))

(assert (= (and b!1355372 res!900307) b!1355368))

(assert (= (and b!1355368 res!900311) b!1355374))

(assert (= (and b!1355374 c!126971) b!1355376))

(assert (= (and b!1355374 (not c!126971)) b!1355366))

(assert (= (and b!1355374 res!900310) b!1355375))

(declare-fun m!1241565 () Bool)

(assert (=> b!1355376 m!1241565))

(declare-fun m!1241567 () Bool)

(assert (=> b!1355376 m!1241567))

(declare-fun m!1241569 () Bool)

(assert (=> b!1355376 m!1241569))

(declare-fun m!1241571 () Bool)

(assert (=> b!1355376 m!1241571))

(declare-fun m!1241573 () Bool)

(assert (=> b!1355376 m!1241573))

(assert (=> b!1355376 m!1241567))

(assert (=> b!1355376 m!1241569))

(declare-fun m!1241575 () Bool)

(assert (=> b!1355376 m!1241575))

(declare-fun m!1241577 () Bool)

(assert (=> b!1355377 m!1241577))

(declare-fun m!1241579 () Bool)

(assert (=> b!1355371 m!1241579))

(assert (=> b!1355375 m!1241573))

(declare-fun m!1241581 () Bool)

(assert (=> start!114120 m!1241581))

(declare-fun m!1241583 () Bool)

(assert (=> b!1355369 m!1241583))

(declare-fun m!1241585 () Bool)

(assert (=> b!1355370 m!1241585))

(declare-fun m!1241587 () Bool)

(assert (=> b!1355372 m!1241587))

(declare-fun m!1241589 () Bool)

(assert (=> b!1355367 m!1241589))

(assert (=> b!1355374 m!1241567))

(assert (=> b!1355374 m!1241567))

(declare-fun m!1241591 () Bool)

(assert (=> b!1355374 m!1241591))

(push 1)

(assert (not b!1355372))

(assert (not start!114120))

