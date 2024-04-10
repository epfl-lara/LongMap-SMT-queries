; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114020 () Bool)

(assert start!114020)

(declare-fun b!1353055 () Bool)

(declare-datatypes ((Unit!44388 0))(
  ( (Unit!44389) )
))
(declare-fun e!769004 () Unit!44388)

(declare-fun lt!597741 () Unit!44388)

(assert (=> b!1353055 (= e!769004 lt!597741)))

(declare-fun lt!597742 () Unit!44388)

(declare-datatypes ((List!31590 0))(
  ( (Nil!31587) (Cons!31586 (h!32795 (_ BitVec 64)) (t!46248 List!31590)) )
))
(declare-fun acc!759 () List!31590)

(declare-fun lemmaListSubSeqRefl!0 (List!31590) Unit!44388)

(assert (=> b!1353055 (= lt!597742 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!719 (List!31590 List!31590) Bool)

(assert (=> b!1353055 (subseq!719 acc!759 acc!759)))

(declare-datatypes ((array!92202 0))(
  ( (array!92203 (arr!44549 (Array (_ BitVec 32) (_ BitVec 64))) (size!45099 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92202)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92202 List!31590 List!31590 (_ BitVec 32)) Unit!44388)

(declare-fun $colon$colon!734 (List!31590 (_ BitVec 64)) List!31590)

(assert (=> b!1353055 (= lt!597741 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!734 acc!759 (select (arr!44549 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(declare-fun arrayNoDuplicates!0 (array!92202 (_ BitVec 32) List!31590) Bool)

(assert (=> b!1353055 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1353056 () Bool)

(declare-fun res!898295 () Bool)

(declare-fun e!769005 () Bool)

(assert (=> b!1353056 (=> (not res!898295) (not e!769005))))

(assert (=> b!1353056 (= res!898295 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1353057 () Bool)

(declare-fun res!898301 () Bool)

(assert (=> b!1353057 (=> (not res!898301) (not e!769005))))

(declare-fun contains!9299 (List!31590 (_ BitVec 64)) Bool)

(assert (=> b!1353057 (= res!898301 (not (contains!9299 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1353058 () Bool)

(declare-fun e!769006 () Bool)

(assert (=> b!1353058 (= e!769006 (not true))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1353058 (arrayNoDuplicates!0 (array!92203 (store (arr!44549 a!3742) i!1404 l!3587) (size!45099 a!3742)) (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun lt!597739 () Unit!44388)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!92202 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!31590) Unit!44388)

(assert (=> b!1353058 (= lt!597739 (lemmaPutNonValidKeyPreservesNoDuplicate!0 a!3742 l!3587 i!1404 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1353059 () Bool)

(declare-fun res!898294 () Bool)

(assert (=> b!1353059 (=> (not res!898294) (not e!769005))))

(assert (=> b!1353059 (= res!898294 (not (contains!9299 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!898299 () Bool)

(assert (=> start!114020 (=> (not res!898299) (not e!769005))))

(assert (=> start!114020 (= res!898299 (and (bvslt (size!45099 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45099 a!3742))))))

(assert (=> start!114020 e!769005))

(assert (=> start!114020 true))

(declare-fun array_inv!33577 (array!92202) Bool)

(assert (=> start!114020 (array_inv!33577 a!3742)))

(declare-fun b!1353060 () Bool)

(declare-fun res!898300 () Bool)

(assert (=> b!1353060 (=> (not res!898300) (not e!769005))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1353060 (= res!898300 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1353061 () Bool)

(assert (=> b!1353061 (= e!769005 e!769006)))

(declare-fun res!898303 () Bool)

(assert (=> b!1353061 (=> (not res!898303) (not e!769006))))

(assert (=> b!1353061 (= res!898303 (and (= from!3120 i!1404) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-fun lt!597740 () Unit!44388)

(assert (=> b!1353061 (= lt!597740 e!769004)))

(declare-fun c!126821 () Bool)

(assert (=> b!1353061 (= c!126821 (validKeyInArray!0 (select (arr!44549 a!3742) from!3120)))))

(declare-fun b!1353062 () Bool)

(declare-fun res!898293 () Bool)

(assert (=> b!1353062 (=> (not res!898293) (not e!769005))))

(assert (=> b!1353062 (= res!898293 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45099 a!3742)))))

(declare-fun b!1353063 () Bool)

(declare-fun Unit!44390 () Unit!44388)

(assert (=> b!1353063 (= e!769004 Unit!44390)))

(declare-fun b!1353064 () Bool)

(declare-fun res!898302 () Bool)

(assert (=> b!1353064 (=> (not res!898302) (not e!769005))))

(assert (=> b!1353064 (= res!898302 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31587))))

(declare-fun b!1353065 () Bool)

(declare-fun res!898296 () Bool)

(assert (=> b!1353065 (=> (not res!898296) (not e!769005))))

(declare-fun noDuplicate!2156 (List!31590) Bool)

(assert (=> b!1353065 (= res!898296 (noDuplicate!2156 acc!759))))

(declare-fun b!1353066 () Bool)

(declare-fun res!898297 () Bool)

(assert (=> b!1353066 (=> (not res!898297) (not e!769005))))

(assert (=> b!1353066 (= res!898297 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45099 a!3742))))))

(declare-fun b!1353067 () Bool)

(declare-fun res!898298 () Bool)

(assert (=> b!1353067 (=> (not res!898298) (not e!769006))))

(assert (=> b!1353067 (= res!898298 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(assert (= (and start!114020 res!898299) b!1353065))

(assert (= (and b!1353065 res!898296) b!1353057))

(assert (= (and b!1353057 res!898301) b!1353059))

(assert (= (and b!1353059 res!898294) b!1353064))

(assert (= (and b!1353064 res!898302) b!1353056))

(assert (= (and b!1353056 res!898295) b!1353066))

(assert (= (and b!1353066 res!898297) b!1353060))

(assert (= (and b!1353060 res!898300) b!1353062))

(assert (= (and b!1353062 res!898293) b!1353061))

(assert (= (and b!1353061 c!126821) b!1353055))

(assert (= (and b!1353061 (not c!126821)) b!1353063))

(assert (= (and b!1353061 res!898303) b!1353067))

(assert (= (and b!1353067 res!898298) b!1353058))

(declare-fun m!1239763 () Bool)

(assert (=> start!114020 m!1239763))

(declare-fun m!1239765 () Bool)

(assert (=> b!1353056 m!1239765))

(declare-fun m!1239767 () Bool)

(assert (=> b!1353057 m!1239767))

(declare-fun m!1239769 () Bool)

(assert (=> b!1353055 m!1239769))

(declare-fun m!1239771 () Bool)

(assert (=> b!1353055 m!1239771))

(declare-fun m!1239773 () Bool)

(assert (=> b!1353055 m!1239773))

(declare-fun m!1239775 () Bool)

(assert (=> b!1353055 m!1239775))

(declare-fun m!1239777 () Bool)

(assert (=> b!1353055 m!1239777))

(assert (=> b!1353055 m!1239771))

(assert (=> b!1353055 m!1239773))

(declare-fun m!1239779 () Bool)

(assert (=> b!1353055 m!1239779))

(declare-fun m!1239781 () Bool)

(assert (=> b!1353060 m!1239781))

(declare-fun m!1239783 () Bool)

(assert (=> b!1353064 m!1239783))

(declare-fun m!1239785 () Bool)

(assert (=> b!1353065 m!1239785))

(declare-fun m!1239787 () Bool)

(assert (=> b!1353059 m!1239787))

(assert (=> b!1353067 m!1239777))

(assert (=> b!1353061 m!1239771))

(assert (=> b!1353061 m!1239771))

(declare-fun m!1239789 () Bool)

(assert (=> b!1353061 m!1239789))

(declare-fun m!1239791 () Bool)

(assert (=> b!1353058 m!1239791))

(declare-fun m!1239793 () Bool)

(assert (=> b!1353058 m!1239793))

(declare-fun m!1239795 () Bool)

(assert (=> b!1353058 m!1239795))

(push 1)

