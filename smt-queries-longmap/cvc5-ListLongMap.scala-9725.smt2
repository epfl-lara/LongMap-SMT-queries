; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!115076 () Bool)

(assert start!115076)

(declare-fun b!1363765 () Bool)

(declare-fun res!907527 () Bool)

(declare-fun e!773367 () Bool)

(assert (=> b!1363765 (=> (not res!907527) (not e!773367))))

(declare-datatypes ((List!31824 0))(
  ( (Nil!31821) (Cons!31820 (h!33029 (_ BitVec 64)) (t!46515 List!31824)) )
))
(declare-fun acc!759 () List!31824)

(declare-datatypes ((array!92703 0))(
  ( (array!92704 (arr!44783 (Array (_ BitVec 32) (_ BitVec 64))) (size!45333 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92703)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!92703 (_ BitVec 32) List!31824) Bool)

(assert (=> b!1363765 (= res!907527 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun res!907524 () Bool)

(declare-fun e!773365 () Bool)

(assert (=> start!115076 (=> (not res!907524) (not e!773365))))

(assert (=> start!115076 (= res!907524 (and (bvslt (size!45333 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45333 a!3742))))))

(assert (=> start!115076 e!773365))

(assert (=> start!115076 true))

(declare-fun array_inv!33811 (array!92703) Bool)

(assert (=> start!115076 (array_inv!33811 a!3742)))

(declare-fun b!1363766 () Bool)

(declare-fun res!907528 () Bool)

(assert (=> b!1363766 (=> (not res!907528) (not e!773365))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1363766 (= res!907528 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45333 a!3742))))))

(declare-fun b!1363767 () Bool)

(assert (=> b!1363767 (= e!773367 (not true))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1363767 (arrayNoDuplicates!0 (array!92704 (store (arr!44783 a!3742) i!1404 l!3587) (size!45333 a!3742)) (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-datatypes ((Unit!45009 0))(
  ( (Unit!45010) )
))
(declare-fun lt!600890 () Unit!45009)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!92703 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!31824) Unit!45009)

(assert (=> b!1363767 (= lt!600890 (lemmaPutNonValidKeyPreservesNoDuplicate!0 a!3742 l!3587 i!1404 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1363768 () Bool)

(declare-fun res!907530 () Bool)

(assert (=> b!1363768 (=> (not res!907530) (not e!773365))))

(assert (=> b!1363768 (= res!907530 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45333 a!3742)))))

(declare-fun b!1363769 () Bool)

(declare-fun res!907531 () Bool)

(assert (=> b!1363769 (=> (not res!907531) (not e!773365))))

(declare-fun contains!9533 (List!31824 (_ BitVec 64)) Bool)

(assert (=> b!1363769 (= res!907531 (not (contains!9533 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1363770 () Bool)

(declare-fun res!907523 () Bool)

(assert (=> b!1363770 (=> (not res!907523) (not e!773365))))

(assert (=> b!1363770 (= res!907523 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1363771 () Bool)

(declare-fun res!907525 () Bool)

(assert (=> b!1363771 (=> (not res!907525) (not e!773365))))

(assert (=> b!1363771 (= res!907525 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31821))))

(declare-fun b!1363772 () Bool)

(declare-fun e!773366 () Unit!45009)

(declare-fun lt!600888 () Unit!45009)

(assert (=> b!1363772 (= e!773366 lt!600888)))

(declare-fun lt!600891 () Unit!45009)

(declare-fun lemmaListSubSeqRefl!0 (List!31824) Unit!45009)

(assert (=> b!1363772 (= lt!600891 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!935 (List!31824 List!31824) Bool)

(assert (=> b!1363772 (subseq!935 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92703 List!31824 List!31824 (_ BitVec 32)) Unit!45009)

(declare-fun $colon$colon!938 (List!31824 (_ BitVec 64)) List!31824)

(assert (=> b!1363772 (= lt!600888 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!938 acc!759 (select (arr!44783 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1363772 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1363773 () Bool)

(assert (=> b!1363773 (= e!773365 e!773367)))

(declare-fun res!907522 () Bool)

(assert (=> b!1363773 (=> (not res!907522) (not e!773367))))

(declare-fun lt!600892 () Bool)

(assert (=> b!1363773 (= res!907522 (and (not (= from!3120 i!1404)) (not lt!600892) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-fun lt!600889 () Unit!45009)

(assert (=> b!1363773 (= lt!600889 e!773366)))

(declare-fun c!127562 () Bool)

(assert (=> b!1363773 (= c!127562 lt!600892)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1363773 (= lt!600892 (validKeyInArray!0 (select (arr!44783 a!3742) from!3120)))))

(declare-fun b!1363774 () Bool)

(declare-fun res!907529 () Bool)

(assert (=> b!1363774 (=> (not res!907529) (not e!773365))))

(assert (=> b!1363774 (= res!907529 (not (contains!9533 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1363775 () Bool)

(declare-fun res!907521 () Bool)

(assert (=> b!1363775 (=> (not res!907521) (not e!773365))))

(declare-fun noDuplicate!2390 (List!31824) Bool)

(assert (=> b!1363775 (= res!907521 (noDuplicate!2390 acc!759))))

(declare-fun b!1363776 () Bool)

(declare-fun Unit!45011 () Unit!45009)

(assert (=> b!1363776 (= e!773366 Unit!45011)))

(declare-fun b!1363777 () Bool)

(declare-fun res!907526 () Bool)

(assert (=> b!1363777 (=> (not res!907526) (not e!773365))))

(assert (=> b!1363777 (= res!907526 (not (validKeyInArray!0 l!3587)))))

(assert (= (and start!115076 res!907524) b!1363775))

(assert (= (and b!1363775 res!907521) b!1363769))

(assert (= (and b!1363769 res!907531) b!1363774))

(assert (= (and b!1363774 res!907529) b!1363771))

(assert (= (and b!1363771 res!907525) b!1363770))

(assert (= (and b!1363770 res!907523) b!1363766))

(assert (= (and b!1363766 res!907528) b!1363777))

(assert (= (and b!1363777 res!907526) b!1363768))

(assert (= (and b!1363768 res!907530) b!1363773))

(assert (= (and b!1363773 c!127562) b!1363772))

(assert (= (and b!1363773 (not c!127562)) b!1363776))

(assert (= (and b!1363773 res!907522) b!1363765))

(assert (= (and b!1363765 res!907527) b!1363767))

(declare-fun m!1248493 () Bool)

(assert (=> start!115076 m!1248493))

(declare-fun m!1248495 () Bool)

(assert (=> b!1363767 m!1248495))

(declare-fun m!1248497 () Bool)

(assert (=> b!1363767 m!1248497))

(declare-fun m!1248499 () Bool)

(assert (=> b!1363767 m!1248499))

(declare-fun m!1248501 () Bool)

(assert (=> b!1363774 m!1248501))

(declare-fun m!1248503 () Bool)

(assert (=> b!1363771 m!1248503))

(declare-fun m!1248505 () Bool)

(assert (=> b!1363775 m!1248505))

(declare-fun m!1248507 () Bool)

(assert (=> b!1363769 m!1248507))

(declare-fun m!1248509 () Bool)

(assert (=> b!1363765 m!1248509))

(declare-fun m!1248511 () Bool)

(assert (=> b!1363772 m!1248511))

(declare-fun m!1248513 () Bool)

(assert (=> b!1363772 m!1248513))

(declare-fun m!1248515 () Bool)

(assert (=> b!1363772 m!1248515))

(declare-fun m!1248517 () Bool)

(assert (=> b!1363772 m!1248517))

(assert (=> b!1363772 m!1248509))

(assert (=> b!1363772 m!1248513))

(assert (=> b!1363772 m!1248515))

(declare-fun m!1248519 () Bool)

(assert (=> b!1363772 m!1248519))

(assert (=> b!1363773 m!1248513))

(assert (=> b!1363773 m!1248513))

(declare-fun m!1248521 () Bool)

(assert (=> b!1363773 m!1248521))

(declare-fun m!1248523 () Bool)

(assert (=> b!1363777 m!1248523))

(declare-fun m!1248525 () Bool)

(assert (=> b!1363770 m!1248525))

(push 1)

