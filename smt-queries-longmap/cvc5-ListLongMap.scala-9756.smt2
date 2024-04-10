; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!115616 () Bool)

(assert start!115616)

(declare-fun b!1367248 () Bool)

(declare-fun res!910783 () Bool)

(declare-fun e!774899 () Bool)

(assert (=> b!1367248 (=> (not res!910783) (not e!774899))))

(declare-datatypes ((List!31917 0))(
  ( (Nil!31914) (Cons!31913 (h!33122 (_ BitVec 64)) (t!46611 List!31917)) )
))
(declare-fun newAcc!98 () List!31917)

(declare-fun contains!9599 (List!31917 (_ BitVec 64)) Bool)

(assert (=> b!1367248 (= res!910783 (not (contains!9599 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!910775 () Bool)

(assert (=> start!115616 (=> (not res!910775) (not e!774899))))

(declare-datatypes ((array!92847 0))(
  ( (array!92848 (arr!44849 (Array (_ BitVec 32) (_ BitVec 64))) (size!45399 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92847)

(declare-fun from!3239 () (_ BitVec 32))

(assert (=> start!115616 (= res!910775 (and (bvslt (size!45399 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45399 a!3861))))))

(assert (=> start!115616 e!774899))

(declare-fun array_inv!33877 (array!92847) Bool)

(assert (=> start!115616 (array_inv!33877 a!3861)))

(assert (=> start!115616 true))

(declare-fun b!1367249 () Bool)

(declare-fun res!910779 () Bool)

(assert (=> b!1367249 (=> (not res!910779) (not e!774899))))

(declare-fun acc!866 () List!31917)

(assert (=> b!1367249 (= res!910779 (not (contains!9599 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1367250 () Bool)

(declare-fun res!910774 () Bool)

(assert (=> b!1367250 (=> (not res!910774) (not e!774899))))

(assert (=> b!1367250 (= res!910774 (not (contains!9599 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1367251 () Bool)

(declare-fun res!910777 () Bool)

(assert (=> b!1367251 (=> (not res!910777) (not e!774899))))

(assert (=> b!1367251 (= res!910777 (not (contains!9599 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1367252 () Bool)

(declare-fun res!910776 () Bool)

(declare-fun e!774901 () Bool)

(assert (=> b!1367252 (=> (not res!910776) (not e!774901))))

(assert (=> b!1367252 (= res!910776 (bvslt from!3239 (size!45399 a!3861)))))

(declare-fun b!1367253 () Bool)

(declare-fun res!910781 () Bool)

(assert (=> b!1367253 (=> (not res!910781) (not e!774899))))

(declare-fun noDuplicate!2456 (List!31917) Bool)

(assert (=> b!1367253 (= res!910781 (noDuplicate!2456 acc!866))))

(declare-fun b!1367254 () Bool)

(assert (=> b!1367254 (= e!774899 e!774901)))

(declare-fun res!910782 () Bool)

(assert (=> b!1367254 (=> (not res!910782) (not e!774901))))

(declare-fun arrayNoDuplicates!0 (array!92847 (_ BitVec 32) List!31917) Bool)

(assert (=> b!1367254 (= res!910782 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45135 0))(
  ( (Unit!45136) )
))
(declare-fun lt!601855 () Unit!45135)

(declare-fun noDuplicateSubseq!188 (List!31917 List!31917) Unit!45135)

(assert (=> b!1367254 (= lt!601855 (noDuplicateSubseq!188 newAcc!98 acc!866))))

(declare-fun b!1367255 () Bool)

(declare-fun res!910778 () Bool)

(assert (=> b!1367255 (=> (not res!910778) (not e!774899))))

(declare-fun subseq!1001 (List!31917 List!31917) Bool)

(assert (=> b!1367255 (= res!910778 (subseq!1001 newAcc!98 acc!866))))

(declare-fun b!1367256 () Bool)

(assert (=> b!1367256 (= e!774901 false)))

(declare-fun lt!601854 () Bool)

(assert (=> b!1367256 (= lt!601854 (contains!9599 acc!866 (select (arr!44849 a!3861) from!3239)))))

(declare-fun b!1367257 () Bool)

(declare-fun res!910780 () Bool)

(assert (=> b!1367257 (=> (not res!910780) (not e!774901))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1367257 (= res!910780 (validKeyInArray!0 (select (arr!44849 a!3861) from!3239)))))

(assert (= (and start!115616 res!910775) b!1367253))

(assert (= (and b!1367253 res!910781) b!1367249))

(assert (= (and b!1367249 res!910779) b!1367250))

(assert (= (and b!1367250 res!910774) b!1367248))

(assert (= (and b!1367248 res!910783) b!1367251))

(assert (= (and b!1367251 res!910777) b!1367255))

(assert (= (and b!1367255 res!910778) b!1367254))

(assert (= (and b!1367254 res!910782) b!1367252))

(assert (= (and b!1367252 res!910776) b!1367257))

(assert (= (and b!1367257 res!910780) b!1367256))

(declare-fun m!1251511 () Bool)

(assert (=> b!1367250 m!1251511))

(declare-fun m!1251513 () Bool)

(assert (=> b!1367256 m!1251513))

(assert (=> b!1367256 m!1251513))

(declare-fun m!1251515 () Bool)

(assert (=> b!1367256 m!1251515))

(declare-fun m!1251517 () Bool)

(assert (=> start!115616 m!1251517))

(declare-fun m!1251519 () Bool)

(assert (=> b!1367255 m!1251519))

(assert (=> b!1367257 m!1251513))

(assert (=> b!1367257 m!1251513))

(declare-fun m!1251521 () Bool)

(assert (=> b!1367257 m!1251521))

(declare-fun m!1251523 () Bool)

(assert (=> b!1367253 m!1251523))

(declare-fun m!1251525 () Bool)

(assert (=> b!1367248 m!1251525))

(declare-fun m!1251527 () Bool)

(assert (=> b!1367249 m!1251527))

(declare-fun m!1251529 () Bool)

(assert (=> b!1367251 m!1251529))

(declare-fun m!1251531 () Bool)

(assert (=> b!1367254 m!1251531))

(declare-fun m!1251533 () Bool)

(assert (=> b!1367254 m!1251533))

(push 1)

(assert (not b!1367257))

