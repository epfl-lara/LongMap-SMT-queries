; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115552 () Bool)

(assert start!115552)

(declare-fun b!1366812 () Bool)

(declare-fun res!910366 () Bool)

(declare-fun e!774665 () Bool)

(assert (=> b!1366812 (=> (not res!910366) (not e!774665))))

(declare-datatypes ((array!92828 0))(
  ( (array!92829 (arr!44841 (Array (_ BitVec 32) (_ BitVec 64))) (size!45391 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92828)

(declare-fun from!3239 () (_ BitVec 32))

(declare-datatypes ((List!31909 0))(
  ( (Nil!31906) (Cons!31905 (h!33114 (_ BitVec 64)) (t!46603 List!31909)) )
))
(declare-fun acc!866 () List!31909)

(declare-fun contains!9591 (List!31909 (_ BitVec 64)) Bool)

(assert (=> b!1366812 (= res!910366 (not (contains!9591 acc!866 (select (arr!44841 a!3861) from!3239))))))

(declare-fun b!1366813 () Bool)

(declare-fun res!910371 () Bool)

(declare-fun e!774667 () Bool)

(assert (=> b!1366813 (=> (not res!910371) (not e!774667))))

(assert (=> b!1366813 (= res!910371 (not (contains!9591 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366814 () Bool)

(declare-fun res!910363 () Bool)

(assert (=> b!1366814 (=> (not res!910363) (not e!774667))))

(declare-fun newAcc!98 () List!31909)

(declare-fun subseq!993 (List!31909 List!31909) Bool)

(assert (=> b!1366814 (= res!910363 (subseq!993 newAcc!98 acc!866))))

(declare-fun b!1366815 () Bool)

(assert (=> b!1366815 (= e!774667 e!774665)))

(declare-fun res!910369 () Bool)

(assert (=> b!1366815 (=> (not res!910369) (not e!774665))))

(declare-fun arrayNoDuplicates!0 (array!92828 (_ BitVec 32) List!31909) Bool)

(assert (=> b!1366815 (= res!910369 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45119 0))(
  ( (Unit!45120) )
))
(declare-fun lt!601691 () Unit!45119)

(declare-fun noDuplicateSubseq!180 (List!31909 List!31909) Unit!45119)

(assert (=> b!1366815 (= lt!601691 (noDuplicateSubseq!180 newAcc!98 acc!866))))

(declare-fun b!1366816 () Bool)

(assert (=> b!1366816 (= e!774665 (not true))))

(declare-fun lt!601690 () Unit!45119)

(declare-fun lt!601693 () List!31909)

(declare-fun lt!601692 () List!31909)

(assert (=> b!1366816 (= lt!601690 (noDuplicateSubseq!180 lt!601693 lt!601692))))

(assert (=> b!1366816 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) lt!601693)))

(declare-fun lt!601689 () Unit!45119)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92828 List!31909 List!31909 (_ BitVec 32)) Unit!45119)

(assert (=> b!1366816 (= lt!601689 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3861 lt!601692 lt!601693 (bvadd #b00000000000000000000000000000001 from!3239)))))

(assert (=> b!1366816 (= lt!601693 (Cons!31905 (select (arr!44841 a!3861) from!3239) newAcc!98))))

(assert (=> b!1366816 (= lt!601692 (Cons!31905 (select (arr!44841 a!3861) from!3239) acc!866))))

(declare-fun b!1366817 () Bool)

(declare-fun res!910365 () Bool)

(assert (=> b!1366817 (=> (not res!910365) (not e!774667))))

(assert (=> b!1366817 (= res!910365 (not (contains!9591 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366818 () Bool)

(declare-fun res!910364 () Bool)

(assert (=> b!1366818 (=> (not res!910364) (not e!774667))))

(assert (=> b!1366818 (= res!910364 (not (contains!9591 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366819 () Bool)

(declare-fun res!910362 () Bool)

(assert (=> b!1366819 (=> (not res!910362) (not e!774667))))

(declare-fun noDuplicate!2448 (List!31909) Bool)

(assert (=> b!1366819 (= res!910362 (noDuplicate!2448 acc!866))))

(declare-fun res!910370 () Bool)

(assert (=> start!115552 (=> (not res!910370) (not e!774667))))

(assert (=> start!115552 (= res!910370 (and (bvslt (size!45391 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45391 a!3861))))))

(assert (=> start!115552 e!774667))

(declare-fun array_inv!33869 (array!92828) Bool)

(assert (=> start!115552 (array_inv!33869 a!3861)))

(assert (=> start!115552 true))

(declare-fun b!1366820 () Bool)

(declare-fun res!910367 () Bool)

(assert (=> b!1366820 (=> (not res!910367) (not e!774665))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1366820 (= res!910367 (validKeyInArray!0 (select (arr!44841 a!3861) from!3239)))))

(declare-fun b!1366821 () Bool)

(declare-fun res!910368 () Bool)

(assert (=> b!1366821 (=> (not res!910368) (not e!774665))))

(assert (=> b!1366821 (= res!910368 (bvslt from!3239 (size!45391 a!3861)))))

(declare-fun b!1366822 () Bool)

(declare-fun res!910372 () Bool)

(assert (=> b!1366822 (=> (not res!910372) (not e!774667))))

(assert (=> b!1366822 (= res!910372 (not (contains!9591 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!115552 res!910370) b!1366819))

(assert (= (and b!1366819 res!910362) b!1366822))

(assert (= (and b!1366822 res!910372) b!1366813))

(assert (= (and b!1366813 res!910371) b!1366818))

(assert (= (and b!1366818 res!910364) b!1366817))

(assert (= (and b!1366817 res!910365) b!1366814))

(assert (= (and b!1366814 res!910363) b!1366815))

(assert (= (and b!1366815 res!910369) b!1366821))

(assert (= (and b!1366821 res!910368) b!1366820))

(assert (= (and b!1366820 res!910367) b!1366812))

(assert (= (and b!1366812 res!910366) b!1366816))

(declare-fun m!1251085 () Bool)

(assert (=> b!1366814 m!1251085))

(declare-fun m!1251087 () Bool)

(assert (=> b!1366816 m!1251087))

(declare-fun m!1251089 () Bool)

(assert (=> b!1366816 m!1251089))

(declare-fun m!1251091 () Bool)

(assert (=> b!1366816 m!1251091))

(declare-fun m!1251093 () Bool)

(assert (=> b!1366816 m!1251093))

(assert (=> b!1366812 m!1251093))

(assert (=> b!1366812 m!1251093))

(declare-fun m!1251095 () Bool)

(assert (=> b!1366812 m!1251095))

(declare-fun m!1251097 () Bool)

(assert (=> start!115552 m!1251097))

(declare-fun m!1251099 () Bool)

(assert (=> b!1366819 m!1251099))

(declare-fun m!1251101 () Bool)

(assert (=> b!1366815 m!1251101))

(declare-fun m!1251103 () Bool)

(assert (=> b!1366815 m!1251103))

(declare-fun m!1251105 () Bool)

(assert (=> b!1366822 m!1251105))

(declare-fun m!1251107 () Bool)

(assert (=> b!1366818 m!1251107))

(declare-fun m!1251109 () Bool)

(assert (=> b!1366813 m!1251109))

(assert (=> b!1366820 m!1251093))

(assert (=> b!1366820 m!1251093))

(declare-fun m!1251111 () Bool)

(assert (=> b!1366820 m!1251111))

(declare-fun m!1251113 () Bool)

(assert (=> b!1366817 m!1251113))

(check-sat (not start!115552) (not b!1366815) (not b!1366822) (not b!1366820) (not b!1366813) (not b!1366819) (not b!1366818) (not b!1366812) (not b!1366817) (not b!1366816) (not b!1366814))
(check-sat)
