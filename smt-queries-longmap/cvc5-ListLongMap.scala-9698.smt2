; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114578 () Bool)

(assert start!114578)

(declare-fun b!1359529 () Bool)

(declare-datatypes ((Unit!44766 0))(
  ( (Unit!44767) )
))
(declare-fun e!771434 () Unit!44766)

(declare-fun Unit!44768 () Unit!44766)

(assert (=> b!1359529 (= e!771434 Unit!44768)))

(declare-fun b!1359530 () Bool)

(declare-fun res!903989 () Bool)

(declare-fun e!771433 () Bool)

(assert (=> b!1359530 (=> (not res!903989) (not e!771433))))

(declare-datatypes ((List!31743 0))(
  ( (Nil!31740) (Cons!31739 (h!32948 (_ BitVec 64)) (t!46416 List!31743)) )
))
(declare-fun acc!759 () List!31743)

(declare-datatypes ((array!92523 0))(
  ( (array!92524 (arr!44702 (Array (_ BitVec 32) (_ BitVec 64))) (size!45252 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92523)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!92523 (_ BitVec 32) List!31743) Bool)

(assert (=> b!1359530 (= res!903989 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1359531 () Bool)

(declare-fun res!903995 () Bool)

(assert (=> b!1359531 (=> (not res!903995) (not e!771433))))

(declare-fun contains!9452 (List!31743 (_ BitVec 64)) Bool)

(assert (=> b!1359531 (= res!903995 (not (contains!9452 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1359532 () Bool)

(declare-fun e!771436 () Bool)

(assert (=> b!1359532 (= e!771433 e!771436)))

(declare-fun res!903996 () Bool)

(assert (=> b!1359532 (=> (not res!903996) (not e!771436))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1359532 (= res!903996 (and (= from!3120 i!1404) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-fun lt!599634 () Unit!44766)

(assert (=> b!1359532 (= lt!599634 e!771434)))

(declare-fun c!127211 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1359532 (= c!127211 (validKeyInArray!0 (select (arr!44702 a!3742) from!3120)))))

(declare-fun b!1359533 () Bool)

(declare-fun res!903993 () Bool)

(assert (=> b!1359533 (=> (not res!903993) (not e!771433))))

(assert (=> b!1359533 (= res!903993 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45252 a!3742)))))

(declare-fun b!1359534 () Bool)

(declare-fun res!903997 () Bool)

(assert (=> b!1359534 (=> (not res!903997) (not e!771433))))

(assert (=> b!1359534 (= res!903997 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45252 a!3742))))))

(declare-fun b!1359535 () Bool)

(declare-fun res!903994 () Bool)

(assert (=> b!1359535 (=> (not res!903994) (not e!771433))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1359535 (= res!903994 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1359536 () Bool)

(assert (=> b!1359536 (= e!771436 (bvsge (bvsub (size!45252 a!3742) (bvadd #b00000000000000000000000000000001 from!3120)) (bvsub (size!45252 a!3742) from!3120)))))

(declare-fun res!903988 () Bool)

(assert (=> start!114578 (=> (not res!903988) (not e!771433))))

(assert (=> start!114578 (= res!903988 (and (bvslt (size!45252 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45252 a!3742))))))

(assert (=> start!114578 e!771433))

(assert (=> start!114578 true))

(declare-fun array_inv!33730 (array!92523) Bool)

(assert (=> start!114578 (array_inv!33730 a!3742)))

(declare-fun b!1359537 () Bool)

(declare-fun res!903992 () Bool)

(assert (=> b!1359537 (=> (not res!903992) (not e!771433))))

(assert (=> b!1359537 (= res!903992 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31740))))

(declare-fun b!1359538 () Bool)

(declare-fun res!903991 () Bool)

(assert (=> b!1359538 (=> (not res!903991) (not e!771433))))

(assert (=> b!1359538 (= res!903991 (not (contains!9452 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1359539 () Bool)

(declare-fun res!903987 () Bool)

(assert (=> b!1359539 (=> (not res!903987) (not e!771436))))

(assert (=> b!1359539 (= res!903987 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1359540 () Bool)

(declare-fun res!903990 () Bool)

(assert (=> b!1359540 (=> (not res!903990) (not e!771433))))

(declare-fun noDuplicate!2309 (List!31743) Bool)

(assert (=> b!1359540 (= res!903990 (noDuplicate!2309 acc!759))))

(declare-fun b!1359541 () Bool)

(declare-fun lt!599633 () Unit!44766)

(assert (=> b!1359541 (= e!771434 lt!599633)))

(declare-fun lt!599635 () Unit!44766)

(declare-fun lemmaListSubSeqRefl!0 (List!31743) Unit!44766)

(assert (=> b!1359541 (= lt!599635 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!854 (List!31743 List!31743) Bool)

(assert (=> b!1359541 (subseq!854 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92523 List!31743 List!31743 (_ BitVec 32)) Unit!44766)

(declare-fun $colon$colon!857 (List!31743 (_ BitVec 64)) List!31743)

(assert (=> b!1359541 (= lt!599633 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!857 acc!759 (select (arr!44702 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1359541 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(assert (= (and start!114578 res!903988) b!1359540))

(assert (= (and b!1359540 res!903990) b!1359531))

(assert (= (and b!1359531 res!903995) b!1359538))

(assert (= (and b!1359538 res!903991) b!1359537))

(assert (= (and b!1359537 res!903992) b!1359530))

(assert (= (and b!1359530 res!903989) b!1359534))

(assert (= (and b!1359534 res!903997) b!1359535))

(assert (= (and b!1359535 res!903994) b!1359533))

(assert (= (and b!1359533 res!903993) b!1359532))

(assert (= (and b!1359532 c!127211) b!1359541))

(assert (= (and b!1359532 (not c!127211)) b!1359529))

(assert (= (and b!1359532 res!903996) b!1359539))

(assert (= (and b!1359539 res!903987) b!1359536))

(declare-fun m!1244917 () Bool)

(assert (=> b!1359539 m!1244917))

(declare-fun m!1244919 () Bool)

(assert (=> b!1359538 m!1244919))

(declare-fun m!1244921 () Bool)

(assert (=> b!1359531 m!1244921))

(declare-fun m!1244923 () Bool)

(assert (=> b!1359541 m!1244923))

(declare-fun m!1244925 () Bool)

(assert (=> b!1359541 m!1244925))

(declare-fun m!1244927 () Bool)

(assert (=> b!1359541 m!1244927))

(declare-fun m!1244929 () Bool)

(assert (=> b!1359541 m!1244929))

(assert (=> b!1359541 m!1244917))

(assert (=> b!1359541 m!1244925))

(assert (=> b!1359541 m!1244927))

(declare-fun m!1244931 () Bool)

(assert (=> b!1359541 m!1244931))

(declare-fun m!1244933 () Bool)

(assert (=> start!114578 m!1244933))

(declare-fun m!1244935 () Bool)

(assert (=> b!1359537 m!1244935))

(assert (=> b!1359532 m!1244925))

(assert (=> b!1359532 m!1244925))

(declare-fun m!1244937 () Bool)

(assert (=> b!1359532 m!1244937))

(declare-fun m!1244939 () Bool)

(assert (=> b!1359540 m!1244939))

(declare-fun m!1244941 () Bool)

(assert (=> b!1359530 m!1244941))

(declare-fun m!1244943 () Bool)

(assert (=> b!1359535 m!1244943))

(push 1)

(assert (not b!1359531))

(assert (not b!1359541))

(assert (not b!1359535))

(assert (not b!1359530))

(assert (not b!1359537))

(assert (not start!114578))

(assert (not b!1359538))

(assert (not b!1359539))

(assert (not b!1359540))

(assert (not b!1359532))

(check-sat)

(pop 1)

(push 1)

(check-sat)

