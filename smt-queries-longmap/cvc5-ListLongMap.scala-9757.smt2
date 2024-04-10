; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!115622 () Bool)

(assert start!115622)

(declare-fun b!1367338 () Bool)

(declare-fun res!910871 () Bool)

(declare-fun e!774928 () Bool)

(assert (=> b!1367338 (=> (not res!910871) (not e!774928))))

(declare-datatypes ((List!31920 0))(
  ( (Nil!31917) (Cons!31916 (h!33125 (_ BitVec 64)) (t!46614 List!31920)) )
))
(declare-fun acc!866 () List!31920)

(declare-fun noDuplicate!2459 (List!31920) Bool)

(assert (=> b!1367338 (= res!910871 (noDuplicate!2459 acc!866))))

(declare-fun res!910869 () Bool)

(assert (=> start!115622 (=> (not res!910869) (not e!774928))))

(declare-datatypes ((array!92853 0))(
  ( (array!92854 (arr!44852 (Array (_ BitVec 32) (_ BitVec 64))) (size!45402 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92853)

(declare-fun from!3239 () (_ BitVec 32))

(assert (=> start!115622 (= res!910869 (and (bvslt (size!45402 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45402 a!3861))))))

(assert (=> start!115622 e!774928))

(declare-fun array_inv!33880 (array!92853) Bool)

(assert (=> start!115622 (array_inv!33880 a!3861)))

(assert (=> start!115622 true))

(declare-fun b!1367339 () Bool)

(declare-fun res!910865 () Bool)

(assert (=> b!1367339 (=> (not res!910865) (not e!774928))))

(declare-fun contains!9602 (List!31920 (_ BitVec 64)) Bool)

(assert (=> b!1367339 (= res!910865 (not (contains!9602 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1367340 () Bool)

(declare-fun e!774927 () Bool)

(assert (=> b!1367340 (= e!774928 e!774927)))

(declare-fun res!910870 () Bool)

(assert (=> b!1367340 (=> (not res!910870) (not e!774927))))

(declare-fun arrayNoDuplicates!0 (array!92853 (_ BitVec 32) List!31920) Bool)

(assert (=> b!1367340 (= res!910870 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45141 0))(
  ( (Unit!45142) )
))
(declare-fun lt!601873 () Unit!45141)

(declare-fun newAcc!98 () List!31920)

(declare-fun noDuplicateSubseq!191 (List!31920 List!31920) Unit!45141)

(assert (=> b!1367340 (= lt!601873 (noDuplicateSubseq!191 newAcc!98 acc!866))))

(declare-fun b!1367341 () Bool)

(assert (=> b!1367341 (= e!774927 false)))

(declare-fun lt!601872 () Bool)

(assert (=> b!1367341 (= lt!601872 (contains!9602 acc!866 (select (arr!44852 a!3861) from!3239)))))

(declare-fun b!1367342 () Bool)

(declare-fun res!910867 () Bool)

(assert (=> b!1367342 (=> (not res!910867) (not e!774928))))

(assert (=> b!1367342 (= res!910867 (not (contains!9602 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1367343 () Bool)

(declare-fun res!910868 () Bool)

(assert (=> b!1367343 (=> (not res!910868) (not e!774928))))

(assert (=> b!1367343 (= res!910868 (not (contains!9602 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1367344 () Bool)

(declare-fun res!910864 () Bool)

(assert (=> b!1367344 (=> (not res!910864) (not e!774928))))

(assert (=> b!1367344 (= res!910864 (not (contains!9602 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1367345 () Bool)

(declare-fun res!910872 () Bool)

(assert (=> b!1367345 (=> (not res!910872) (not e!774927))))

(assert (=> b!1367345 (= res!910872 (bvslt from!3239 (size!45402 a!3861)))))

(declare-fun b!1367346 () Bool)

(declare-fun res!910873 () Bool)

(assert (=> b!1367346 (=> (not res!910873) (not e!774927))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1367346 (= res!910873 (validKeyInArray!0 (select (arr!44852 a!3861) from!3239)))))

(declare-fun b!1367347 () Bool)

(declare-fun res!910866 () Bool)

(assert (=> b!1367347 (=> (not res!910866) (not e!774928))))

(declare-fun subseq!1004 (List!31920 List!31920) Bool)

(assert (=> b!1367347 (= res!910866 (subseq!1004 newAcc!98 acc!866))))

(assert (= (and start!115622 res!910869) b!1367338))

(assert (= (and b!1367338 res!910871) b!1367339))

(assert (= (and b!1367339 res!910865) b!1367343))

(assert (= (and b!1367343 res!910868) b!1367344))

(assert (= (and b!1367344 res!910864) b!1367342))

(assert (= (and b!1367342 res!910867) b!1367347))

(assert (= (and b!1367347 res!910866) b!1367340))

(assert (= (and b!1367340 res!910870) b!1367345))

(assert (= (and b!1367345 res!910872) b!1367346))

(assert (= (and b!1367346 res!910873) b!1367341))

(declare-fun m!1251583 () Bool)

(assert (=> b!1367342 m!1251583))

(declare-fun m!1251585 () Bool)

(assert (=> b!1367344 m!1251585))

(declare-fun m!1251587 () Bool)

(assert (=> b!1367338 m!1251587))

(declare-fun m!1251589 () Bool)

(assert (=> b!1367347 m!1251589))

(declare-fun m!1251591 () Bool)

(assert (=> b!1367341 m!1251591))

(assert (=> b!1367341 m!1251591))

(declare-fun m!1251593 () Bool)

(assert (=> b!1367341 m!1251593))

(assert (=> b!1367346 m!1251591))

(assert (=> b!1367346 m!1251591))

(declare-fun m!1251595 () Bool)

(assert (=> b!1367346 m!1251595))

(declare-fun m!1251597 () Bool)

(assert (=> b!1367340 m!1251597))

(declare-fun m!1251599 () Bool)

(assert (=> b!1367340 m!1251599))

(declare-fun m!1251601 () Bool)

(assert (=> start!115622 m!1251601))

(declare-fun m!1251603 () Bool)

(assert (=> b!1367343 m!1251603))

(declare-fun m!1251605 () Bool)

(assert (=> b!1367339 m!1251605))

(push 1)

