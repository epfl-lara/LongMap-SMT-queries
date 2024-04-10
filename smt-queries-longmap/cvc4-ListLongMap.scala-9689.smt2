; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114474 () Bool)

(assert start!114474)

(declare-fun b!1358520 () Bool)

(declare-datatypes ((Unit!44691 0))(
  ( (Unit!44692) )
))
(declare-fun e!771041 () Unit!44691)

(declare-fun lt!599362 () Unit!44691)

(assert (=> b!1358520 (= e!771041 lt!599362)))

(declare-fun lt!599361 () Unit!44691)

(declare-datatypes ((List!31718 0))(
  ( (Nil!31715) (Cons!31714 (h!32923 (_ BitVec 64)) (t!46388 List!31718)) )
))
(declare-fun acc!759 () List!31718)

(declare-fun lemmaListSubSeqRefl!0 (List!31718) Unit!44691)

(assert (=> b!1358520 (= lt!599361 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!829 (List!31718 List!31718) Bool)

(assert (=> b!1358520 (subseq!829 acc!759 acc!759)))

(declare-datatypes ((array!92470 0))(
  ( (array!92471 (arr!44677 (Array (_ BitVec 32) (_ BitVec 64))) (size!45227 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92470)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92470 List!31718 List!31718 (_ BitVec 32)) Unit!44691)

(declare-fun $colon$colon!832 (List!31718 (_ BitVec 64)) List!31718)

(assert (=> b!1358520 (= lt!599362 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!832 acc!759 (select (arr!44677 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(declare-fun arrayNoDuplicates!0 (array!92470 (_ BitVec 32) List!31718) Bool)

(assert (=> b!1358520 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1358521 () Bool)

(declare-fun res!903165 () Bool)

(declare-fun e!771043 () Bool)

(assert (=> b!1358521 (=> (not res!903165) (not e!771043))))

(assert (=> b!1358521 (= res!903165 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31715))))

(declare-fun b!1358522 () Bool)

(declare-fun res!903158 () Bool)

(assert (=> b!1358522 (=> (not res!903158) (not e!771043))))

(declare-fun contains!9427 (List!31718 (_ BitVec 64)) Bool)

(assert (=> b!1358522 (= res!903158 (not (contains!9427 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1358523 () Bool)

(declare-fun Unit!44693 () Unit!44691)

(assert (=> b!1358523 (= e!771041 Unit!44693)))

(declare-fun b!1358524 () Bool)

(declare-fun res!903161 () Bool)

(assert (=> b!1358524 (=> (not res!903161) (not e!771043))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1358524 (= res!903161 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1358525 () Bool)

(declare-fun res!903160 () Bool)

(assert (=> b!1358525 (=> (not res!903160) (not e!771043))))

(assert (=> b!1358525 (= res!903160 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45227 a!3742)))))

(declare-fun res!903163 () Bool)

(assert (=> start!114474 (=> (not res!903163) (not e!771043))))

(assert (=> start!114474 (= res!903163 (and (bvslt (size!45227 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45227 a!3742))))))

(assert (=> start!114474 e!771043))

(assert (=> start!114474 true))

(declare-fun array_inv!33705 (array!92470) Bool)

(assert (=> start!114474 (array_inv!33705 a!3742)))

(declare-fun b!1358526 () Bool)

(assert (=> b!1358526 (= e!771043 false)))

(declare-fun lt!599360 () Unit!44691)

(assert (=> b!1358526 (= lt!599360 e!771041)))

(declare-fun c!127121 () Bool)

(assert (=> b!1358526 (= c!127121 (validKeyInArray!0 (select (arr!44677 a!3742) from!3120)))))

(declare-fun b!1358527 () Bool)

(declare-fun res!903162 () Bool)

(assert (=> b!1358527 (=> (not res!903162) (not e!771043))))

(declare-fun noDuplicate!2284 (List!31718) Bool)

(assert (=> b!1358527 (= res!903162 (noDuplicate!2284 acc!759))))

(declare-fun b!1358528 () Bool)

(declare-fun res!903159 () Bool)

(assert (=> b!1358528 (=> (not res!903159) (not e!771043))))

(assert (=> b!1358528 (= res!903159 (not (contains!9427 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1358529 () Bool)

(declare-fun res!903166 () Bool)

(assert (=> b!1358529 (=> (not res!903166) (not e!771043))))

(assert (=> b!1358529 (= res!903166 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1358530 () Bool)

(declare-fun res!903164 () Bool)

(assert (=> b!1358530 (=> (not res!903164) (not e!771043))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1358530 (= res!903164 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45227 a!3742))))))

(assert (= (and start!114474 res!903163) b!1358527))

(assert (= (and b!1358527 res!903162) b!1358522))

(assert (= (and b!1358522 res!903158) b!1358528))

(assert (= (and b!1358528 res!903159) b!1358521))

(assert (= (and b!1358521 res!903165) b!1358529))

(assert (= (and b!1358529 res!903166) b!1358530))

(assert (= (and b!1358530 res!903164) b!1358524))

(assert (= (and b!1358524 res!903161) b!1358525))

(assert (= (and b!1358525 res!903160) b!1358526))

(assert (= (and b!1358526 c!127121) b!1358520))

(assert (= (and b!1358526 (not c!127121)) b!1358523))

(declare-fun m!1244091 () Bool)

(assert (=> b!1358526 m!1244091))

(assert (=> b!1358526 m!1244091))

(declare-fun m!1244093 () Bool)

(assert (=> b!1358526 m!1244093))

(declare-fun m!1244095 () Bool)

(assert (=> b!1358527 m!1244095))

(declare-fun m!1244097 () Bool)

(assert (=> b!1358529 m!1244097))

(declare-fun m!1244099 () Bool)

(assert (=> b!1358528 m!1244099))

(declare-fun m!1244101 () Bool)

(assert (=> b!1358521 m!1244101))

(declare-fun m!1244103 () Bool)

(assert (=> start!114474 m!1244103))

(declare-fun m!1244105 () Bool)

(assert (=> b!1358520 m!1244105))

(assert (=> b!1358520 m!1244091))

(declare-fun m!1244107 () Bool)

(assert (=> b!1358520 m!1244107))

(declare-fun m!1244109 () Bool)

(assert (=> b!1358520 m!1244109))

(declare-fun m!1244111 () Bool)

(assert (=> b!1358520 m!1244111))

(assert (=> b!1358520 m!1244091))

(assert (=> b!1358520 m!1244107))

(declare-fun m!1244113 () Bool)

(assert (=> b!1358520 m!1244113))

(declare-fun m!1244115 () Bool)

(assert (=> b!1358524 m!1244115))

(declare-fun m!1244117 () Bool)

(assert (=> b!1358522 m!1244117))

(push 1)

(assert (not b!1358524))

(assert (not b!1358526))

(assert (not b!1358521))

(assert (not start!114474))

(assert (not b!1358528))

(assert (not b!1358522))

(assert (not b!1358520))

(assert (not b!1358527))

(assert (not b!1358529))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

