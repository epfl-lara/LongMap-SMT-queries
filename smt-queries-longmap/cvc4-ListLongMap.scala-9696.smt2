; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114570 () Bool)

(assert start!114570)

(declare-fun b!1359383 () Bool)

(declare-fun res!903868 () Bool)

(declare-fun e!771387 () Bool)

(assert (=> b!1359383 (=> (not res!903868) (not e!771387))))

(declare-datatypes ((array!92515 0))(
  ( (array!92516 (arr!44698 (Array (_ BitVec 32) (_ BitVec 64))) (size!45248 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92515)

(declare-fun from!3120 () (_ BitVec 32))

(declare-datatypes ((List!31739 0))(
  ( (Nil!31736) (Cons!31735 (h!32944 (_ BitVec 64)) (t!46412 List!31739)) )
))
(declare-fun acc!759 () List!31739)

(declare-fun arrayNoDuplicates!0 (array!92515 (_ BitVec 32) List!31739) Bool)

(assert (=> b!1359383 (= res!903868 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1359384 () Bool)

(declare-fun res!903866 () Bool)

(assert (=> b!1359384 (=> (not res!903866) (not e!771387))))

(assert (=> b!1359384 (= res!903866 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45248 a!3742)))))

(declare-fun b!1359385 () Bool)

(declare-fun res!903865 () Bool)

(assert (=> b!1359385 (=> (not res!903865) (not e!771387))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1359385 (= res!903865 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1359386 () Bool)

(declare-datatypes ((Unit!44754 0))(
  ( (Unit!44755) )
))
(declare-fun e!771386 () Unit!44754)

(declare-fun lt!599590 () Unit!44754)

(assert (=> b!1359386 (= e!771386 lt!599590)))

(declare-fun lt!599588 () Unit!44754)

(declare-fun lemmaListSubSeqRefl!0 (List!31739) Unit!44754)

(assert (=> b!1359386 (= lt!599588 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!850 (List!31739 List!31739) Bool)

(assert (=> b!1359386 (subseq!850 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92515 List!31739 List!31739 (_ BitVec 32)) Unit!44754)

(declare-fun $colon$colon!853 (List!31739 (_ BitVec 64)) List!31739)

(assert (=> b!1359386 (= lt!599590 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!853 acc!759 (select (arr!44698 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1359386 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun res!903867 () Bool)

(assert (=> start!114570 (=> (not res!903867) (not e!771387))))

(assert (=> start!114570 (= res!903867 (and (bvslt (size!45248 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45248 a!3742))))))

(assert (=> start!114570 e!771387))

(assert (=> start!114570 true))

(declare-fun array_inv!33726 (array!92515) Bool)

(assert (=> start!114570 (array_inv!33726 a!3742)))

(declare-fun b!1359387 () Bool)

(declare-fun res!903872 () Bool)

(assert (=> b!1359387 (=> (not res!903872) (not e!771387))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1359387 (= res!903872 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45248 a!3742))))))

(declare-fun b!1359388 () Bool)

(declare-fun Unit!44756 () Unit!44754)

(assert (=> b!1359388 (= e!771386 Unit!44756)))

(declare-fun b!1359389 () Bool)

(declare-fun res!903869 () Bool)

(assert (=> b!1359389 (=> (not res!903869) (not e!771387))))

(declare-fun contains!9448 (List!31739 (_ BitVec 64)) Bool)

(assert (=> b!1359389 (= res!903869 (not (contains!9448 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1359390 () Bool)

(declare-fun res!903874 () Bool)

(assert (=> b!1359390 (=> (not res!903874) (not e!771387))))

(declare-fun noDuplicate!2305 (List!31739) Bool)

(assert (=> b!1359390 (= res!903874 (noDuplicate!2305 acc!759))))

(declare-fun b!1359391 () Bool)

(declare-fun res!903873 () Bool)

(assert (=> b!1359391 (=> (not res!903873) (not e!771387))))

(assert (=> b!1359391 (= res!903873 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31736))))

(declare-fun b!1359392 () Bool)

(declare-fun e!771388 () Bool)

(assert (=> b!1359392 (= e!771388 false)))

(declare-fun lt!599587 () Bool)

(assert (=> b!1359392 (= lt!599587 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1359393 () Bool)

(declare-fun res!903870 () Bool)

(assert (=> b!1359393 (=> (not res!903870) (not e!771387))))

(assert (=> b!1359393 (= res!903870 (not (contains!9448 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1359394 () Bool)

(assert (=> b!1359394 (= e!771387 e!771388)))

(declare-fun res!903871 () Bool)

(assert (=> b!1359394 (=> (not res!903871) (not e!771388))))

(assert (=> b!1359394 (= res!903871 (and (= from!3120 i!1404) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-fun lt!599589 () Unit!44754)

(assert (=> b!1359394 (= lt!599589 e!771386)))

(declare-fun c!127199 () Bool)

(assert (=> b!1359394 (= c!127199 (validKeyInArray!0 (select (arr!44698 a!3742) from!3120)))))

(assert (= (and start!114570 res!903867) b!1359390))

(assert (= (and b!1359390 res!903874) b!1359389))

(assert (= (and b!1359389 res!903869) b!1359393))

(assert (= (and b!1359393 res!903870) b!1359391))

(assert (= (and b!1359391 res!903873) b!1359383))

(assert (= (and b!1359383 res!903868) b!1359387))

(assert (= (and b!1359387 res!903872) b!1359385))

(assert (= (and b!1359385 res!903865) b!1359384))

(assert (= (and b!1359384 res!903866) b!1359394))

(assert (= (and b!1359394 c!127199) b!1359386))

(assert (= (and b!1359394 (not c!127199)) b!1359388))

(assert (= (and b!1359394 res!903871) b!1359392))

(declare-fun m!1244805 () Bool)

(assert (=> b!1359393 m!1244805))

(declare-fun m!1244807 () Bool)

(assert (=> b!1359390 m!1244807))

(declare-fun m!1244809 () Bool)

(assert (=> b!1359383 m!1244809))

(declare-fun m!1244811 () Bool)

(assert (=> b!1359392 m!1244811))

(declare-fun m!1244813 () Bool)

(assert (=> b!1359394 m!1244813))

(assert (=> b!1359394 m!1244813))

(declare-fun m!1244815 () Bool)

(assert (=> b!1359394 m!1244815))

(declare-fun m!1244817 () Bool)

(assert (=> start!114570 m!1244817))

(declare-fun m!1244819 () Bool)

(assert (=> b!1359386 m!1244819))

(assert (=> b!1359386 m!1244813))

(declare-fun m!1244821 () Bool)

(assert (=> b!1359386 m!1244821))

(declare-fun m!1244823 () Bool)

(assert (=> b!1359386 m!1244823))

(assert (=> b!1359386 m!1244811))

(assert (=> b!1359386 m!1244813))

(assert (=> b!1359386 m!1244821))

(declare-fun m!1244825 () Bool)

(assert (=> b!1359386 m!1244825))

(declare-fun m!1244827 () Bool)

(assert (=> b!1359385 m!1244827))

(declare-fun m!1244829 () Bool)

(assert (=> b!1359389 m!1244829))

(declare-fun m!1244831 () Bool)

(assert (=> b!1359391 m!1244831))

(push 1)

