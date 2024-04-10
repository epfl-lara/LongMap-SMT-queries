; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!115470 () Bool)

(assert start!115470)

(declare-fun b!1365863 () Bool)

(declare-fun res!909451 () Bool)

(declare-fun e!774304 () Bool)

(assert (=> b!1365863 (=> (not res!909451) (not e!774304))))

(declare-fun from!3239 () (_ BitVec 32))

(declare-datatypes ((array!92791 0))(
  ( (array!92792 (arr!44824 (Array (_ BitVec 32) (_ BitVec 64))) (size!45374 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92791)

(assert (=> b!1365863 (= res!909451 (bvslt from!3239 (size!45374 a!3861)))))

(declare-fun b!1365864 () Bool)

(declare-fun res!909442 () Bool)

(declare-fun e!774305 () Bool)

(assert (=> b!1365864 (=> (not res!909442) (not e!774305))))

(declare-datatypes ((List!31892 0))(
  ( (Nil!31889) (Cons!31888 (h!33097 (_ BitVec 64)) (t!46586 List!31892)) )
))
(declare-fun lt!601407 () List!31892)

(declare-fun contains!9574 (List!31892 (_ BitVec 64)) Bool)

(assert (=> b!1365864 (= res!909442 (not (contains!9574 lt!601407 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1365865 () Bool)

(declare-fun res!909452 () Bool)

(declare-fun e!774306 () Bool)

(assert (=> b!1365865 (=> (not res!909452) (not e!774306))))

(declare-fun acc!866 () List!31892)

(assert (=> b!1365865 (= res!909452 (not (contains!9574 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1365866 () Bool)

(declare-fun res!909449 () Bool)

(assert (=> b!1365866 (=> (not res!909449) (not e!774306))))

(declare-fun noDuplicate!2431 (List!31892) Bool)

(assert (=> b!1365866 (= res!909449 (noDuplicate!2431 acc!866))))

(declare-fun b!1365867 () Bool)

(assert (=> b!1365867 (= e!774306 e!774304)))

(declare-fun res!909444 () Bool)

(assert (=> b!1365867 (=> (not res!909444) (not e!774304))))

(declare-fun arrayNoDuplicates!0 (array!92791 (_ BitVec 32) List!31892) Bool)

(assert (=> b!1365867 (= res!909444 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45085 0))(
  ( (Unit!45086) )
))
(declare-fun lt!601406 () Unit!45085)

(declare-fun newAcc!98 () List!31892)

(declare-fun noDuplicateSubseq!163 (List!31892 List!31892) Unit!45085)

(assert (=> b!1365867 (= lt!601406 (noDuplicateSubseq!163 newAcc!98 acc!866))))

(declare-fun b!1365868 () Bool)

(assert (=> b!1365868 (= e!774304 e!774305)))

(declare-fun res!909445 () Bool)

(assert (=> b!1365868 (=> (not res!909445) (not e!774305))))

(assert (=> b!1365868 (= res!909445 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) #b00000000000000000000000000000000))))

(declare-fun lt!601408 () List!31892)

(assert (=> b!1365868 (= lt!601408 (Cons!31888 (select (arr!44824 a!3861) from!3239) newAcc!98))))

(assert (=> b!1365868 (= lt!601407 (Cons!31888 (select (arr!44824 a!3861) from!3239) acc!866))))

(declare-fun b!1365869 () Bool)

(declare-fun res!909439 () Bool)

(assert (=> b!1365869 (=> (not res!909439) (not e!774305))))

(assert (=> b!1365869 (= res!909439 (not (contains!9574 lt!601408 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1365870 () Bool)

(declare-fun res!909438 () Bool)

(assert (=> b!1365870 (=> (not res!909438) (not e!774306))))

(assert (=> b!1365870 (= res!909438 (not (contains!9574 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1365871 () Bool)

(declare-fun res!909447 () Bool)

(assert (=> b!1365871 (=> (not res!909447) (not e!774305))))

(assert (=> b!1365871 (= res!909447 (not (contains!9574 lt!601407 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!909446 () Bool)

(assert (=> start!115470 (=> (not res!909446) (not e!774306))))

(assert (=> start!115470 (= res!909446 (and (bvslt (size!45374 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45374 a!3861))))))

(assert (=> start!115470 e!774306))

(declare-fun array_inv!33852 (array!92791) Bool)

(assert (=> start!115470 (array_inv!33852 a!3861)))

(assert (=> start!115470 true))

(declare-fun b!1365872 () Bool)

(declare-fun res!909437 () Bool)

(assert (=> b!1365872 (=> (not res!909437) (not e!774304))))

(assert (=> b!1365872 (= res!909437 (not (contains!9574 acc!866 (select (arr!44824 a!3861) from!3239))))))

(declare-fun b!1365873 () Bool)

(declare-fun res!909440 () Bool)

(assert (=> b!1365873 (=> (not res!909440) (not e!774305))))

(declare-fun subseq!976 (List!31892 List!31892) Bool)

(assert (=> b!1365873 (= res!909440 (subseq!976 lt!601408 lt!601407))))

(declare-fun b!1365874 () Bool)

(declare-fun res!909441 () Bool)

(assert (=> b!1365874 (=> (not res!909441) (not e!774305))))

(assert (=> b!1365874 (= res!909441 (not (contains!9574 lt!601408 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1365875 () Bool)

(declare-fun res!909453 () Bool)

(assert (=> b!1365875 (=> (not res!909453) (not e!774306))))

(assert (=> b!1365875 (= res!909453 (not (contains!9574 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1365876 () Bool)

(assert (=> b!1365876 (= e!774305 false)))

(declare-fun lt!601405 () Bool)

(assert (=> b!1365876 (= lt!601405 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) lt!601407))))

(declare-fun lt!601404 () Unit!45085)

(assert (=> b!1365876 (= lt!601404 (noDuplicateSubseq!163 lt!601408 lt!601407))))

(declare-fun b!1365877 () Bool)

(declare-fun res!909454 () Bool)

(assert (=> b!1365877 (=> (not res!909454) (not e!774306))))

(assert (=> b!1365877 (= res!909454 (subseq!976 newAcc!98 acc!866))))

(declare-fun b!1365878 () Bool)

(declare-fun res!909448 () Bool)

(assert (=> b!1365878 (=> (not res!909448) (not e!774306))))

(assert (=> b!1365878 (= res!909448 (not (contains!9574 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1365879 () Bool)

(declare-fun res!909450 () Bool)

(assert (=> b!1365879 (=> (not res!909450) (not e!774305))))

(assert (=> b!1365879 (= res!909450 (noDuplicate!2431 lt!601407))))

(declare-fun b!1365880 () Bool)

(declare-fun res!909443 () Bool)

(assert (=> b!1365880 (=> (not res!909443) (not e!774304))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1365880 (= res!909443 (validKeyInArray!0 (select (arr!44824 a!3861) from!3239)))))

(assert (= (and start!115470 res!909446) b!1365866))

(assert (= (and b!1365866 res!909449) b!1365865))

(assert (= (and b!1365865 res!909452) b!1365878))

(assert (= (and b!1365878 res!909448) b!1365875))

(assert (= (and b!1365875 res!909453) b!1365870))

(assert (= (and b!1365870 res!909438) b!1365877))

(assert (= (and b!1365877 res!909454) b!1365867))

(assert (= (and b!1365867 res!909444) b!1365863))

(assert (= (and b!1365863 res!909451) b!1365880))

(assert (= (and b!1365880 res!909443) b!1365872))

(assert (= (and b!1365872 res!909437) b!1365868))

(assert (= (and b!1365868 res!909445) b!1365879))

(assert (= (and b!1365879 res!909450) b!1365864))

(assert (= (and b!1365864 res!909442) b!1365871))

(assert (= (and b!1365871 res!909447) b!1365869))

(assert (= (and b!1365869 res!909439) b!1365874))

(assert (= (and b!1365874 res!909441) b!1365873))

(assert (= (and b!1365873 res!909440) b!1365876))

(declare-fun m!1250301 () Bool)

(assert (=> b!1365876 m!1250301))

(declare-fun m!1250303 () Bool)

(assert (=> b!1365876 m!1250303))

(declare-fun m!1250305 () Bool)

(assert (=> b!1365866 m!1250305))

(declare-fun m!1250307 () Bool)

(assert (=> b!1365869 m!1250307))

(declare-fun m!1250309 () Bool)

(assert (=> b!1365872 m!1250309))

(assert (=> b!1365872 m!1250309))

(declare-fun m!1250311 () Bool)

(assert (=> b!1365872 m!1250311))

(declare-fun m!1250313 () Bool)

(assert (=> b!1365877 m!1250313))

(declare-fun m!1250315 () Bool)

(assert (=> b!1365871 m!1250315))

(declare-fun m!1250317 () Bool)

(assert (=> b!1365865 m!1250317))

(assert (=> b!1365868 m!1250309))

(declare-fun m!1250319 () Bool)

(assert (=> b!1365864 m!1250319))

(declare-fun m!1250321 () Bool)

(assert (=> b!1365873 m!1250321))

(declare-fun m!1250323 () Bool)

(assert (=> b!1365874 m!1250323))

(declare-fun m!1250325 () Bool)

(assert (=> b!1365878 m!1250325))

(declare-fun m!1250327 () Bool)

(assert (=> b!1365870 m!1250327))

(declare-fun m!1250329 () Bool)

(assert (=> b!1365879 m!1250329))

(assert (=> b!1365880 m!1250309))

(assert (=> b!1365880 m!1250309))

(declare-fun m!1250331 () Bool)

(assert (=> b!1365880 m!1250331))

(declare-fun m!1250333 () Bool)

(assert (=> b!1365867 m!1250333))

(declare-fun m!1250335 () Bool)

(assert (=> b!1365867 m!1250335))

(declare-fun m!1250337 () Bool)

(assert (=> start!115470 m!1250337))

(declare-fun m!1250339 () Bool)

(assert (=> b!1365875 m!1250339))

(push 1)

