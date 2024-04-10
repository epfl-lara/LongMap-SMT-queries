; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!115740 () Bool)

(assert start!115740)

(declare-fun res!912277 () Bool)

(declare-fun e!775416 () Bool)

(assert (=> start!115740 (=> (not res!912277) (not e!775416))))

(declare-datatypes ((array!92932 0))(
  ( (array!92933 (arr!44890 (Array (_ BitVec 32) (_ BitVec 64))) (size!45440 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92932)

(declare-fun from!3239 () (_ BitVec 32))

(assert (=> start!115740 (= res!912277 (and (bvslt (size!45440 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45440 a!3861))))))

(assert (=> start!115740 e!775416))

(declare-fun array_inv!33918 (array!92932) Bool)

(assert (=> start!115740 (array_inv!33918 a!3861)))

(assert (=> start!115740 true))

(declare-fun b!1368758 () Bool)

(declare-fun res!912266 () Bool)

(assert (=> b!1368758 (=> (not res!912266) (not e!775416))))

(declare-datatypes ((List!31958 0))(
  ( (Nil!31955) (Cons!31954 (h!33163 (_ BitVec 64)) (t!46652 List!31958)) )
))
(declare-fun newAcc!98 () List!31958)

(declare-fun contains!9640 (List!31958 (_ BitVec 64)) Bool)

(assert (=> b!1368758 (= res!912266 (not (contains!9640 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1368759 () Bool)

(declare-fun res!912273 () Bool)

(declare-fun e!775415 () Bool)

(assert (=> b!1368759 (=> (not res!912273) (not e!775415))))

(assert (=> b!1368759 (= res!912273 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) #b00000000000000000000000000000000))))

(declare-fun b!1368760 () Bool)

(declare-fun res!912271 () Bool)

(assert (=> b!1368760 (=> (not res!912271) (not e!775416))))

(declare-fun acc!866 () List!31958)

(declare-fun subseq!1042 (List!31958 List!31958) Bool)

(assert (=> b!1368760 (= res!912271 (subseq!1042 newAcc!98 acc!866))))

(declare-fun b!1368761 () Bool)

(assert (=> b!1368761 (= e!775415 (not true))))

(declare-fun arrayNoDuplicates!0 (array!92932 (_ BitVec 32) List!31958) Bool)

(assert (=> b!1368761 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) newAcc!98)))

(declare-datatypes ((Unit!45217 0))(
  ( (Unit!45218) )
))
(declare-fun lt!602121 () Unit!45217)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92932 List!31958 List!31958 (_ BitVec 32)) Unit!45217)

(assert (=> b!1368761 (= lt!602121 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3861 acc!866 newAcc!98 (bvadd #b00000000000000000000000000000001 from!3239)))))

(declare-fun b!1368762 () Bool)

(declare-fun res!912269 () Bool)

(assert (=> b!1368762 (=> (not res!912269) (not e!775415))))

(assert (=> b!1368762 (= res!912269 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) acc!866))))

(declare-fun b!1368763 () Bool)

(declare-fun res!912268 () Bool)

(assert (=> b!1368763 (=> (not res!912268) (not e!775416))))

(assert (=> b!1368763 (= res!912268 (not (contains!9640 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1368764 () Bool)

(declare-fun res!912270 () Bool)

(assert (=> b!1368764 (=> (not res!912270) (not e!775416))))

(declare-fun noDuplicate!2497 (List!31958) Bool)

(assert (=> b!1368764 (= res!912270 (noDuplicate!2497 acc!866))))

(declare-fun b!1368765 () Bool)

(declare-fun res!912274 () Bool)

(assert (=> b!1368765 (=> (not res!912274) (not e!775415))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1368765 (= res!912274 (not (validKeyInArray!0 (select (arr!44890 a!3861) from!3239))))))

(declare-fun b!1368766 () Bool)

(declare-fun res!912275 () Bool)

(assert (=> b!1368766 (=> (not res!912275) (not e!775416))))

(assert (=> b!1368766 (= res!912275 (not (contains!9640 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1368767 () Bool)

(declare-fun res!912276 () Bool)

(assert (=> b!1368767 (=> (not res!912276) (not e!775415))))

(assert (=> b!1368767 (= res!912276 (bvslt from!3239 (size!45440 a!3861)))))

(declare-fun b!1368768 () Bool)

(assert (=> b!1368768 (= e!775416 e!775415)))

(declare-fun res!912272 () Bool)

(assert (=> b!1368768 (=> (not res!912272) (not e!775415))))

(assert (=> b!1368768 (= res!912272 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-fun lt!602122 () Unit!45217)

(declare-fun noDuplicateSubseq!229 (List!31958 List!31958) Unit!45217)

(assert (=> b!1368768 (= lt!602122 (noDuplicateSubseq!229 newAcc!98 acc!866))))

(declare-fun b!1368769 () Bool)

(declare-fun res!912267 () Bool)

(assert (=> b!1368769 (=> (not res!912267) (not e!775416))))

(assert (=> b!1368769 (= res!912267 (not (contains!9640 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!115740 res!912277) b!1368764))

(assert (= (and b!1368764 res!912270) b!1368769))

(assert (= (and b!1368769 res!912267) b!1368763))

(assert (= (and b!1368763 res!912268) b!1368766))

(assert (= (and b!1368766 res!912275) b!1368758))

(assert (= (and b!1368758 res!912266) b!1368760))

(assert (= (and b!1368760 res!912271) b!1368768))

(assert (= (and b!1368768 res!912272) b!1368767))

(assert (= (and b!1368767 res!912276) b!1368765))

(assert (= (and b!1368765 res!912274) b!1368759))

(assert (= (and b!1368759 res!912273) b!1368762))

(assert (= (and b!1368762 res!912269) b!1368761))

(declare-fun m!1252647 () Bool)

(assert (=> b!1368758 m!1252647))

(declare-fun m!1252649 () Bool)

(assert (=> b!1368763 m!1252649))

(declare-fun m!1252651 () Bool)

(assert (=> start!115740 m!1252651))

(declare-fun m!1252653 () Bool)

(assert (=> b!1368769 m!1252653))

(declare-fun m!1252655 () Bool)

(assert (=> b!1368764 m!1252655))

(declare-fun m!1252657 () Bool)

(assert (=> b!1368761 m!1252657))

(declare-fun m!1252659 () Bool)

(assert (=> b!1368761 m!1252659))

(declare-fun m!1252661 () Bool)

(assert (=> b!1368766 m!1252661))

(declare-fun m!1252663 () Bool)

(assert (=> b!1368762 m!1252663))

(declare-fun m!1252665 () Bool)

(assert (=> b!1368768 m!1252665))

(declare-fun m!1252667 () Bool)

(assert (=> b!1368768 m!1252667))

(declare-fun m!1252669 () Bool)

(assert (=> b!1368760 m!1252669))

(declare-fun m!1252671 () Bool)

(assert (=> b!1368765 m!1252671))

(assert (=> b!1368765 m!1252671))

(declare-fun m!1252673 () Bool)

(assert (=> b!1368765 m!1252673))

(push 1)

(assert (not b!1368768))

(assert (not b!1368762))

