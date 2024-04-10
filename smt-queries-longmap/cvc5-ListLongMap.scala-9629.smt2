; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113912 () Bool)

(assert start!113912)

(declare-fun b!1350926 () Bool)

(declare-fun res!896392 () Bool)

(declare-fun e!768408 () Bool)

(assert (=> b!1350926 (=> (not res!896392) (not e!768408))))

(declare-fun i!1404 () (_ BitVec 32))

(declare-datatypes ((array!92094 0))(
  ( (array!92095 (arr!44495 (Array (_ BitVec 32) (_ BitVec 64))) (size!45045 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92094)

(assert (=> b!1350926 (= res!896392 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45045 a!3742))))))

(declare-fun b!1350927 () Bool)

(declare-fun e!768409 () Bool)

(assert (=> b!1350927 (= e!768409 true)))

(declare-fun lt!597091 () Bool)

(declare-datatypes ((List!31536 0))(
  ( (Nil!31533) (Cons!31532 (h!32741 (_ BitVec 64)) (t!46194 List!31536)) )
))
(declare-fun lt!597092 () List!31536)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!92094 (_ BitVec 32) List!31536) Bool)

(assert (=> b!1350927 (= lt!597091 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) lt!597092))))

(declare-datatypes ((Unit!44244 0))(
  ( (Unit!44245) )
))
(declare-fun lt!597094 () Unit!44244)

(declare-fun acc!759 () List!31536)

(declare-fun noDuplicateSubseq!116 (List!31536 List!31536) Unit!44244)

(assert (=> b!1350927 (= lt!597094 (noDuplicateSubseq!116 acc!759 lt!597092))))

(declare-fun b!1350928 () Bool)

(declare-fun res!896394 () Bool)

(assert (=> b!1350928 (=> (not res!896394) (not e!768408))))

(assert (=> b!1350928 (= res!896394 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1350930 () Bool)

(declare-fun res!896398 () Bool)

(assert (=> b!1350930 (=> (not res!896398) (not e!768408))))

(declare-fun noDuplicate!2102 (List!31536) Bool)

(assert (=> b!1350930 (= res!896398 (noDuplicate!2102 acc!759))))

(declare-fun b!1350931 () Bool)

(declare-fun res!896395 () Bool)

(assert (=> b!1350931 (=> (not res!896395) (not e!768408))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1350931 (= res!896395 (validKeyInArray!0 (select (arr!44495 a!3742) from!3120)))))

(declare-fun b!1350932 () Bool)

(declare-fun res!896396 () Bool)

(assert (=> b!1350932 (=> (not res!896396) (not e!768408))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1350932 (= res!896396 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1350933 () Bool)

(declare-fun res!896389 () Bool)

(assert (=> b!1350933 (=> res!896389 e!768409)))

(declare-fun contains!9245 (List!31536 (_ BitVec 64)) Bool)

(assert (=> b!1350933 (= res!896389 (contains!9245 lt!597092 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1350934 () Bool)

(declare-fun res!896390 () Bool)

(assert (=> b!1350934 (=> (not res!896390) (not e!768408))))

(assert (=> b!1350934 (= res!896390 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45045 a!3742)))))

(declare-fun b!1350935 () Bool)

(declare-fun res!896385 () Bool)

(assert (=> b!1350935 (=> (not res!896385) (not e!768408))))

(assert (=> b!1350935 (= res!896385 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31533))))

(declare-fun b!1350936 () Bool)

(declare-fun res!896388 () Bool)

(assert (=> b!1350936 (=> res!896388 e!768409)))

(declare-fun subseq!665 (List!31536 List!31536) Bool)

(assert (=> b!1350936 (= res!896388 (not (subseq!665 acc!759 lt!597092)))))

(declare-fun b!1350937 () Bool)

(declare-fun res!896393 () Bool)

(assert (=> b!1350937 (=> (not res!896393) (not e!768408))))

(assert (=> b!1350937 (= res!896393 (not (contains!9245 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1350938 () Bool)

(assert (=> b!1350938 (= e!768408 (not e!768409))))

(declare-fun res!896384 () Bool)

(assert (=> b!1350938 (=> res!896384 e!768409)))

(assert (=> b!1350938 (= res!896384 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!680 (List!31536 (_ BitVec 64)) List!31536)

(assert (=> b!1350938 (= lt!597092 ($colon$colon!680 acc!759 (select (arr!44495 a!3742) from!3120)))))

(assert (=> b!1350938 (subseq!665 acc!759 acc!759)))

(declare-fun lt!597093 () Unit!44244)

(declare-fun lemmaListSubSeqRefl!0 (List!31536) Unit!44244)

(assert (=> b!1350938 (= lt!597093 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun b!1350929 () Bool)

(declare-fun res!896386 () Bool)

(assert (=> b!1350929 (=> (not res!896386) (not e!768408))))

(assert (=> b!1350929 (= res!896386 (not (contains!9245 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!896391 () Bool)

(assert (=> start!113912 (=> (not res!896391) (not e!768408))))

(assert (=> start!113912 (= res!896391 (and (bvslt (size!45045 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45045 a!3742))))))

(assert (=> start!113912 e!768408))

(assert (=> start!113912 true))

(declare-fun array_inv!33523 (array!92094) Bool)

(assert (=> start!113912 (array_inv!33523 a!3742)))

(declare-fun b!1350939 () Bool)

(declare-fun res!896387 () Bool)

(assert (=> b!1350939 (=> res!896387 e!768409)))

(assert (=> b!1350939 (= res!896387 (contains!9245 lt!597092 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1350940 () Bool)

(declare-fun res!896397 () Bool)

(assert (=> b!1350940 (=> res!896397 e!768409)))

(assert (=> b!1350940 (= res!896397 (not (noDuplicate!2102 lt!597092)))))

(assert (= (and start!113912 res!896391) b!1350930))

(assert (= (and b!1350930 res!896398) b!1350929))

(assert (= (and b!1350929 res!896386) b!1350937))

(assert (= (and b!1350937 res!896393) b!1350935))

(assert (= (and b!1350935 res!896385) b!1350928))

(assert (= (and b!1350928 res!896394) b!1350926))

(assert (= (and b!1350926 res!896392) b!1350932))

(assert (= (and b!1350932 res!896396) b!1350934))

(assert (= (and b!1350934 res!896390) b!1350931))

(assert (= (and b!1350931 res!896395) b!1350938))

(assert (= (and b!1350938 (not res!896384)) b!1350940))

(assert (= (and b!1350940 (not res!896397)) b!1350939))

(assert (= (and b!1350939 (not res!896387)) b!1350933))

(assert (= (and b!1350933 (not res!896389)) b!1350936))

(assert (= (and b!1350936 (not res!896388)) b!1350927))

(declare-fun m!1238053 () Bool)

(assert (=> b!1350932 m!1238053))

(declare-fun m!1238055 () Bool)

(assert (=> b!1350935 m!1238055))

(declare-fun m!1238057 () Bool)

(assert (=> b!1350937 m!1238057))

(declare-fun m!1238059 () Bool)

(assert (=> b!1350929 m!1238059))

(declare-fun m!1238061 () Bool)

(assert (=> b!1350928 m!1238061))

(declare-fun m!1238063 () Bool)

(assert (=> b!1350936 m!1238063))

(declare-fun m!1238065 () Bool)

(assert (=> b!1350939 m!1238065))

(declare-fun m!1238067 () Bool)

(assert (=> b!1350933 m!1238067))

(declare-fun m!1238069 () Bool)

(assert (=> start!113912 m!1238069))

(declare-fun m!1238071 () Bool)

(assert (=> b!1350930 m!1238071))

(declare-fun m!1238073 () Bool)

(assert (=> b!1350940 m!1238073))

(declare-fun m!1238075 () Bool)

(assert (=> b!1350927 m!1238075))

(declare-fun m!1238077 () Bool)

(assert (=> b!1350927 m!1238077))

(declare-fun m!1238079 () Bool)

(assert (=> b!1350938 m!1238079))

(assert (=> b!1350938 m!1238079))

(declare-fun m!1238081 () Bool)

(assert (=> b!1350938 m!1238081))

(declare-fun m!1238083 () Bool)

(assert (=> b!1350938 m!1238083))

(declare-fun m!1238085 () Bool)

(assert (=> b!1350938 m!1238085))

(assert (=> b!1350931 m!1238079))

(assert (=> b!1350931 m!1238079))

(declare-fun m!1238087 () Bool)

(assert (=> b!1350931 m!1238087))

(push 1)

(assert (not b!1350933))

(assert (not b!1350930))

(assert (not b!1350928))

(assert (not b!1350936))

(assert (not b!1350935))

(assert (not b!1350938))

(assert (not b!1350937))

(assert (not start!113912))

(assert (not b!1350929))

(assert (not b!1350932))

(assert (not b!1350931))

(assert (not b!1350939))

(assert (not b!1350927))

(assert (not b!1350940))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

