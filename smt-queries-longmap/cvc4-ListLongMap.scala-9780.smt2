; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!115890 () Bool)

(assert start!115890)

(declare-fun b!1369999 () Bool)

(declare-fun res!913463 () Bool)

(declare-fun e!775982 () Bool)

(assert (=> b!1369999 (=> (not res!913463) (not e!775982))))

(declare-datatypes ((List!31991 0))(
  ( (Nil!31988) (Cons!31987 (h!33196 (_ BitVec 64)) (t!46685 List!31991)) )
))
(declare-fun newAcc!98 () List!31991)

(declare-fun contains!9673 (List!31991 (_ BitVec 64)) Bool)

(assert (=> b!1369999 (= res!913463 (not (contains!9673 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1370000 () Bool)

(declare-fun res!913461 () Bool)

(assert (=> b!1370000 (=> (not res!913461) (not e!775982))))

(declare-fun acc!866 () List!31991)

(assert (=> b!1370000 (= res!913461 (not (contains!9673 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1370001 () Bool)

(declare-fun res!913460 () Bool)

(assert (=> b!1370001 (=> (not res!913460) (not e!775982))))

(assert (=> b!1370001 (= res!913460 (not (contains!9673 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1370002 () Bool)

(declare-fun res!913462 () Bool)

(assert (=> b!1370002 (=> (not res!913462) (not e!775982))))

(declare-fun noDuplicate!2530 (List!31991) Bool)

(assert (=> b!1370002 (= res!913462 (noDuplicate!2530 acc!866))))

(declare-fun b!1370003 () Bool)

(declare-fun res!913459 () Bool)

(declare-fun e!775983 () Bool)

(assert (=> b!1370003 (=> (not res!913459) (not e!775983))))

(declare-datatypes ((array!93004 0))(
  ( (array!93005 (arr!44923 (Array (_ BitVec 32) (_ BitVec 64))) (size!45473 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!93004)

(declare-fun from!3239 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1370003 (= res!913459 (validKeyInArray!0 (select (arr!44923 a!3861) from!3239)))))

(declare-fun b!1370004 () Bool)

(assert (=> b!1370004 (= e!775982 e!775983)))

(declare-fun res!913467 () Bool)

(assert (=> b!1370004 (=> (not res!913467) (not e!775983))))

(declare-fun arrayNoDuplicates!0 (array!93004 (_ BitVec 32) List!31991) Bool)

(assert (=> b!1370004 (= res!913467 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45283 0))(
  ( (Unit!45284) )
))
(declare-fun lt!602373 () Unit!45283)

(declare-fun noDuplicateSubseq!262 (List!31991 List!31991) Unit!45283)

(assert (=> b!1370004 (= lt!602373 (noDuplicateSubseq!262 newAcc!98 acc!866))))

(declare-fun b!1370005 () Bool)

(assert (=> b!1370005 (= e!775983 false)))

(declare-fun lt!602374 () Bool)

(assert (=> b!1370005 (= lt!602374 (contains!9673 acc!866 (select (arr!44923 a!3861) from!3239)))))

(declare-fun b!1370006 () Bool)

(declare-fun res!913466 () Bool)

(assert (=> b!1370006 (=> (not res!913466) (not e!775982))))

(assert (=> b!1370006 (= res!913466 (not (contains!9673 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1370007 () Bool)

(declare-fun res!913464 () Bool)

(assert (=> b!1370007 (=> (not res!913464) (not e!775982))))

(declare-fun subseq!1075 (List!31991 List!31991) Bool)

(assert (=> b!1370007 (= res!913464 (subseq!1075 newAcc!98 acc!866))))

(declare-fun res!913465 () Bool)

(assert (=> start!115890 (=> (not res!913465) (not e!775982))))

(assert (=> start!115890 (= res!913465 (and (bvslt (size!45473 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45473 a!3861))))))

(assert (=> start!115890 e!775982))

(declare-fun array_inv!33951 (array!93004) Bool)

(assert (=> start!115890 (array_inv!33951 a!3861)))

(assert (=> start!115890 true))

(declare-fun b!1370008 () Bool)

(declare-fun res!913468 () Bool)

(assert (=> b!1370008 (=> (not res!913468) (not e!775983))))

(assert (=> b!1370008 (= res!913468 (bvslt from!3239 (size!45473 a!3861)))))

(assert (= (and start!115890 res!913465) b!1370002))

(assert (= (and b!1370002 res!913462) b!1370006))

(assert (= (and b!1370006 res!913466) b!1370000))

(assert (= (and b!1370000 res!913461) b!1370001))

(assert (= (and b!1370001 res!913460) b!1369999))

(assert (= (and b!1369999 res!913463) b!1370007))

(assert (= (and b!1370007 res!913464) b!1370004))

(assert (= (and b!1370004 res!913467) b!1370008))

(assert (= (and b!1370008 res!913468) b!1370003))

(assert (= (and b!1370003 res!913459) b!1370005))

(declare-fun m!1253665 () Bool)

(assert (=> b!1369999 m!1253665))

(declare-fun m!1253667 () Bool)

(assert (=> b!1370003 m!1253667))

(assert (=> b!1370003 m!1253667))

(declare-fun m!1253669 () Bool)

(assert (=> b!1370003 m!1253669))

(assert (=> b!1370005 m!1253667))

(assert (=> b!1370005 m!1253667))

(declare-fun m!1253671 () Bool)

(assert (=> b!1370005 m!1253671))

(declare-fun m!1253673 () Bool)

(assert (=> b!1370007 m!1253673))

(declare-fun m!1253675 () Bool)

(assert (=> b!1370004 m!1253675))

(declare-fun m!1253677 () Bool)

(assert (=> b!1370004 m!1253677))

(declare-fun m!1253679 () Bool)

(assert (=> b!1370000 m!1253679))

(declare-fun m!1253681 () Bool)

(assert (=> b!1370006 m!1253681))

(declare-fun m!1253683 () Bool)

(assert (=> b!1370002 m!1253683))

(declare-fun m!1253685 () Bool)

(assert (=> start!115890 m!1253685))

(declare-fun m!1253687 () Bool)

(assert (=> b!1370001 m!1253687))

(push 1)

(assert (not b!1370000))

(assert (not b!1370006))

