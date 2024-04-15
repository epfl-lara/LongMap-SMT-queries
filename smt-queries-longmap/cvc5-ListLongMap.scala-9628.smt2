; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113910 () Bool)

(assert start!113910)

(declare-fun b!1350811 () Bool)

(declare-fun res!896313 () Bool)

(declare-fun e!768366 () Bool)

(assert (=> b!1350811 (=> (not res!896313) (not e!768366))))

(declare-datatypes ((List!31588 0))(
  ( (Nil!31585) (Cons!31584 (h!32793 (_ BitVec 64)) (t!46238 List!31588)) )
))
(declare-fun acc!759 () List!31588)

(declare-fun contains!9208 (List!31588 (_ BitVec 64)) Bool)

(assert (=> b!1350811 (= res!896313 (not (contains!9208 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1350812 () Bool)

(declare-fun res!896324 () Bool)

(assert (=> b!1350812 (=> (not res!896324) (not e!768366))))

(declare-fun from!3120 () (_ BitVec 32))

(declare-datatypes ((array!92041 0))(
  ( (array!92042 (arr!44469 (Array (_ BitVec 32) (_ BitVec 64))) (size!45021 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92041)

(assert (=> b!1350812 (= res!896324 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45021 a!3742)))))

(declare-fun b!1350813 () Bool)

(declare-fun res!896318 () Bool)

(assert (=> b!1350813 (=> (not res!896318) (not e!768366))))

(declare-fun arrayNoDuplicates!0 (array!92041 (_ BitVec 32) List!31588) Bool)

(assert (=> b!1350813 (= res!896318 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31585))))

(declare-fun b!1350814 () Bool)

(declare-fun res!896312 () Bool)

(assert (=> b!1350814 (=> (not res!896312) (not e!768366))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1350814 (= res!896312 (validKeyInArray!0 (select (arr!44469 a!3742) from!3120)))))

(declare-fun b!1350815 () Bool)

(declare-fun res!896311 () Bool)

(declare-fun e!768367 () Bool)

(assert (=> b!1350815 (=> res!896311 e!768367)))

(declare-fun lt!596893 () List!31588)

(assert (=> b!1350815 (= res!896311 (contains!9208 lt!596893 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1350816 () Bool)

(declare-fun res!896317 () Bool)

(assert (=> b!1350816 (=> (not res!896317) (not e!768366))))

(declare-fun noDuplicate!2123 (List!31588) Bool)

(assert (=> b!1350816 (= res!896317 (noDuplicate!2123 acc!759))))

(declare-fun b!1350817 () Bool)

(declare-fun res!896322 () Bool)

(assert (=> b!1350817 (=> (not res!896322) (not e!768366))))

(assert (=> b!1350817 (= res!896322 (not (contains!9208 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1350818 () Bool)

(declare-fun res!896320 () Bool)

(assert (=> b!1350818 (=> (not res!896320) (not e!768366))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1350818 (= res!896320 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45021 a!3742))))))

(declare-fun b!1350819 () Bool)

(declare-fun res!896314 () Bool)

(assert (=> b!1350819 (=> res!896314 e!768367)))

(assert (=> b!1350819 (= res!896314 (not (noDuplicate!2123 lt!596893)))))

(declare-fun b!1350820 () Bool)

(declare-fun res!896315 () Bool)

(assert (=> b!1350820 (=> (not res!896315) (not e!768366))))

(assert (=> b!1350820 (= res!896315 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1350822 () Bool)

(declare-fun res!896321 () Bool)

(assert (=> b!1350822 (=> res!896321 e!768367)))

(assert (=> b!1350822 (= res!896321 (contains!9208 lt!596893 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1350823 () Bool)

(declare-fun res!896319 () Bool)

(assert (=> b!1350823 (=> res!896319 e!768367)))

(declare-fun subseq!664 (List!31588 List!31588) Bool)

(assert (=> b!1350823 (= res!896319 (not (subseq!664 acc!759 lt!596893)))))

(declare-fun b!1350824 () Bool)

(assert (=> b!1350824 (= e!768367 true)))

(declare-fun lt!596894 () Bool)

(assert (=> b!1350824 (= lt!596894 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) lt!596893))))

(declare-datatypes ((Unit!44083 0))(
  ( (Unit!44084) )
))
(declare-fun lt!596896 () Unit!44083)

(declare-fun noDuplicateSubseq!115 (List!31588 List!31588) Unit!44083)

(assert (=> b!1350824 (= lt!596896 (noDuplicateSubseq!115 acc!759 lt!596893))))

(declare-fun b!1350825 () Bool)

(assert (=> b!1350825 (= e!768366 (not e!768367))))

(declare-fun res!896323 () Bool)

(assert (=> b!1350825 (=> res!896323 e!768367)))

(assert (=> b!1350825 (= res!896323 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!681 (List!31588 (_ BitVec 64)) List!31588)

(assert (=> b!1350825 (= lt!596893 ($colon$colon!681 acc!759 (select (arr!44469 a!3742) from!3120)))))

(assert (=> b!1350825 (subseq!664 acc!759 acc!759)))

(declare-fun lt!596895 () Unit!44083)

(declare-fun lemmaListSubSeqRefl!0 (List!31588) Unit!44083)

(assert (=> b!1350825 (= lt!596895 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun res!896310 () Bool)

(assert (=> start!113910 (=> (not res!896310) (not e!768366))))

(assert (=> start!113910 (= res!896310 (and (bvslt (size!45021 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45021 a!3742))))))

(assert (=> start!113910 e!768366))

(assert (=> start!113910 true))

(declare-fun array_inv!33702 (array!92041) Bool)

(assert (=> start!113910 (array_inv!33702 a!3742)))

(declare-fun b!1350821 () Bool)

(declare-fun res!896316 () Bool)

(assert (=> b!1350821 (=> (not res!896316) (not e!768366))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1350821 (= res!896316 (not (validKeyInArray!0 l!3587)))))

(assert (= (and start!113910 res!896310) b!1350816))

(assert (= (and b!1350816 res!896317) b!1350811))

(assert (= (and b!1350811 res!896313) b!1350817))

(assert (= (and b!1350817 res!896322) b!1350813))

(assert (= (and b!1350813 res!896318) b!1350820))

(assert (= (and b!1350820 res!896315) b!1350818))

(assert (= (and b!1350818 res!896320) b!1350821))

(assert (= (and b!1350821 res!896316) b!1350812))

(assert (= (and b!1350812 res!896324) b!1350814))

(assert (= (and b!1350814 res!896312) b!1350825))

(assert (= (and b!1350825 (not res!896323)) b!1350819))

(assert (= (and b!1350819 (not res!896314)) b!1350822))

(assert (= (and b!1350822 (not res!896321)) b!1350815))

(assert (= (and b!1350815 (not res!896311)) b!1350823))

(assert (= (and b!1350823 (not res!896319)) b!1350824))

(declare-fun m!1237501 () Bool)

(assert (=> b!1350813 m!1237501))

(declare-fun m!1237503 () Bool)

(assert (=> b!1350824 m!1237503))

(declare-fun m!1237505 () Bool)

(assert (=> b!1350824 m!1237505))

(declare-fun m!1237507 () Bool)

(assert (=> b!1350820 m!1237507))

(declare-fun m!1237509 () Bool)

(assert (=> b!1350823 m!1237509))

(declare-fun m!1237511 () Bool)

(assert (=> b!1350816 m!1237511))

(declare-fun m!1237513 () Bool)

(assert (=> b!1350814 m!1237513))

(assert (=> b!1350814 m!1237513))

(declare-fun m!1237515 () Bool)

(assert (=> b!1350814 m!1237515))

(declare-fun m!1237517 () Bool)

(assert (=> b!1350821 m!1237517))

(assert (=> b!1350825 m!1237513))

(assert (=> b!1350825 m!1237513))

(declare-fun m!1237519 () Bool)

(assert (=> b!1350825 m!1237519))

(declare-fun m!1237521 () Bool)

(assert (=> b!1350825 m!1237521))

(declare-fun m!1237523 () Bool)

(assert (=> b!1350825 m!1237523))

(declare-fun m!1237525 () Bool)

(assert (=> b!1350815 m!1237525))

(declare-fun m!1237527 () Bool)

(assert (=> b!1350817 m!1237527))

(declare-fun m!1237529 () Bool)

(assert (=> b!1350811 m!1237529))

(declare-fun m!1237531 () Bool)

(assert (=> b!1350822 m!1237531))

(declare-fun m!1237533 () Bool)

(assert (=> start!113910 m!1237533))

(declare-fun m!1237535 () Bool)

(assert (=> b!1350819 m!1237535))

(push 1)

(assert (not b!1350820))

(assert (not b!1350821))

(assert (not b!1350817))

(assert (not b!1350814))

(assert (not b!1350813))

(assert (not b!1350816))

(assert (not b!1350822))

(assert (not b!1350824))

(assert (not b!1350823))

(assert (not b!1350819))

(assert (not b!1350825))

(assert (not b!1350811))

(assert (not b!1350815))

(assert (not start!113910))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

