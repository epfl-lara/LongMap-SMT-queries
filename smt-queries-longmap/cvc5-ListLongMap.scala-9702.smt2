; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114662 () Bool)

(assert start!114662)

(declare-fun b!1360168 () Bool)

(declare-datatypes ((Unit!44802 0))(
  ( (Unit!44803) )
))
(declare-fun e!771737 () Unit!44802)

(declare-fun Unit!44804 () Unit!44802)

(assert (=> b!1360168 (= e!771737 Unit!44804)))

(declare-fun b!1360169 () Bool)

(declare-fun res!904511 () Bool)

(declare-fun e!771739 () Bool)

(assert (=> b!1360169 (=> (not res!904511) (not e!771739))))

(declare-datatypes ((List!31755 0))(
  ( (Nil!31752) (Cons!31751 (h!32960 (_ BitVec 64)) (t!46431 List!31755)) )
))
(declare-fun acc!759 () List!31755)

(declare-fun noDuplicate!2321 (List!31755) Bool)

(assert (=> b!1360169 (= res!904511 (noDuplicate!2321 acc!759))))

(declare-fun b!1360170 () Bool)

(declare-fun res!904519 () Bool)

(assert (=> b!1360170 (=> (not res!904519) (not e!771739))))

(declare-fun i!1404 () (_ BitVec 32))

(declare-datatypes ((array!92550 0))(
  ( (array!92551 (arr!44714 (Array (_ BitVec 32) (_ BitVec 64))) (size!45264 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92550)

(assert (=> b!1360170 (= res!904519 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45264 a!3742))))))

(declare-fun b!1360171 () Bool)

(declare-fun res!904515 () Bool)

(assert (=> b!1360171 (=> (not res!904515) (not e!771739))))

(declare-fun contains!9464 (List!31755 (_ BitVec 64)) Bool)

(assert (=> b!1360171 (= res!904515 (not (contains!9464 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1360172 () Bool)

(declare-fun res!904513 () Bool)

(assert (=> b!1360172 (=> (not res!904513) (not e!771739))))

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!92550 (_ BitVec 32) List!31755) Bool)

(assert (=> b!1360172 (= res!904513 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1360173 () Bool)

(declare-fun res!904516 () Bool)

(assert (=> b!1360173 (=> (not res!904516) (not e!771739))))

(assert (=> b!1360173 (= res!904516 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31752))))

(declare-fun b!1360167 () Bool)

(assert (=> b!1360167 (= e!771739 false)))

(declare-fun lt!599808 () Unit!44802)

(assert (=> b!1360167 (= lt!599808 e!771737)))

(declare-fun c!127268 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1360167 (= c!127268 (validKeyInArray!0 (select (arr!44714 a!3742) from!3120)))))

(declare-fun res!904514 () Bool)

(assert (=> start!114662 (=> (not res!904514) (not e!771739))))

(assert (=> start!114662 (= res!904514 (and (bvslt (size!45264 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45264 a!3742))))))

(assert (=> start!114662 e!771739))

(assert (=> start!114662 true))

(declare-fun array_inv!33742 (array!92550) Bool)

(assert (=> start!114662 (array_inv!33742 a!3742)))

(declare-fun b!1360174 () Bool)

(declare-fun res!904518 () Bool)

(assert (=> b!1360174 (=> (not res!904518) (not e!771739))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1360174 (= res!904518 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1360175 () Bool)

(declare-fun lt!599807 () Unit!44802)

(assert (=> b!1360175 (= e!771737 lt!599807)))

(declare-fun lt!599809 () Unit!44802)

(declare-fun lemmaListSubSeqRefl!0 (List!31755) Unit!44802)

(assert (=> b!1360175 (= lt!599809 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!866 (List!31755 List!31755) Bool)

(assert (=> b!1360175 (subseq!866 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92550 List!31755 List!31755 (_ BitVec 32)) Unit!44802)

(declare-fun $colon$colon!869 (List!31755 (_ BitVec 64)) List!31755)

(assert (=> b!1360175 (= lt!599807 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!869 acc!759 (select (arr!44714 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1360175 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1360176 () Bool)

(declare-fun res!904517 () Bool)

(assert (=> b!1360176 (=> (not res!904517) (not e!771739))))

(assert (=> b!1360176 (= res!904517 (not (contains!9464 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1360177 () Bool)

(declare-fun res!904512 () Bool)

(assert (=> b!1360177 (=> (not res!904512) (not e!771739))))

(assert (=> b!1360177 (= res!904512 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45264 a!3742)))))

(assert (= (and start!114662 res!904514) b!1360169))

(assert (= (and b!1360169 res!904511) b!1360176))

(assert (= (and b!1360176 res!904517) b!1360171))

(assert (= (and b!1360171 res!904515) b!1360173))

(assert (= (and b!1360173 res!904516) b!1360172))

(assert (= (and b!1360172 res!904513) b!1360170))

(assert (= (and b!1360170 res!904519) b!1360174))

(assert (= (and b!1360174 res!904518) b!1360177))

(assert (= (and b!1360177 res!904512) b!1360167))

(assert (= (and b!1360167 c!127268) b!1360175))

(assert (= (and b!1360167 (not c!127268)) b!1360168))

(declare-fun m!1245481 () Bool)

(assert (=> b!1360172 m!1245481))

(declare-fun m!1245483 () Bool)

(assert (=> b!1360167 m!1245483))

(assert (=> b!1360167 m!1245483))

(declare-fun m!1245485 () Bool)

(assert (=> b!1360167 m!1245485))

(declare-fun m!1245487 () Bool)

(assert (=> start!114662 m!1245487))

(declare-fun m!1245489 () Bool)

(assert (=> b!1360176 m!1245489))

(declare-fun m!1245491 () Bool)

(assert (=> b!1360175 m!1245491))

(assert (=> b!1360175 m!1245483))

(declare-fun m!1245493 () Bool)

(assert (=> b!1360175 m!1245493))

(declare-fun m!1245495 () Bool)

(assert (=> b!1360175 m!1245495))

(declare-fun m!1245497 () Bool)

(assert (=> b!1360175 m!1245497))

(assert (=> b!1360175 m!1245483))

(assert (=> b!1360175 m!1245493))

(declare-fun m!1245499 () Bool)

(assert (=> b!1360175 m!1245499))

(declare-fun m!1245501 () Bool)

(assert (=> b!1360173 m!1245501))

(declare-fun m!1245503 () Bool)

(assert (=> b!1360171 m!1245503))

(declare-fun m!1245505 () Bool)

(assert (=> b!1360169 m!1245505))

(declare-fun m!1245507 () Bool)

(assert (=> b!1360174 m!1245507))

(push 1)

(assert (not b!1360171))

(assert (not b!1360167))

(assert (not b!1360169))

(assert (not b!1360175))

(assert (not b!1360174))

(assert (not b!1360173))

(assert (not b!1360172))

(assert (not b!1360176))

(assert (not start!114662))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

