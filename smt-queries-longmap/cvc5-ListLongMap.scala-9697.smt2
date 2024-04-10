; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114572 () Bool)

(assert start!114572)

(declare-fun b!1359419 () Bool)

(declare-fun res!903902 () Bool)

(declare-fun e!771397 () Bool)

(assert (=> b!1359419 (=> (not res!903902) (not e!771397))))

(declare-datatypes ((List!31740 0))(
  ( (Nil!31737) (Cons!31736 (h!32945 (_ BitVec 64)) (t!46413 List!31740)) )
))
(declare-fun acc!759 () List!31740)

(declare-fun contains!9449 (List!31740 (_ BitVec 64)) Bool)

(assert (=> b!1359419 (= res!903902 (not (contains!9449 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1359420 () Bool)

(declare-fun res!903895 () Bool)

(assert (=> b!1359420 (=> (not res!903895) (not e!771397))))

(declare-fun from!3120 () (_ BitVec 32))

(declare-datatypes ((array!92517 0))(
  ( (array!92518 (arr!44699 (Array (_ BitVec 32) (_ BitVec 64))) (size!45249 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92517)

(assert (=> b!1359420 (= res!903895 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45249 a!3742)))))

(declare-fun res!903896 () Bool)

(assert (=> start!114572 (=> (not res!903896) (not e!771397))))

(assert (=> start!114572 (= res!903896 (and (bvslt (size!45249 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45249 a!3742))))))

(assert (=> start!114572 e!771397))

(assert (=> start!114572 true))

(declare-fun array_inv!33727 (array!92517) Bool)

(assert (=> start!114572 (array_inv!33727 a!3742)))

(declare-fun b!1359421 () Bool)

(declare-fun res!903900 () Bool)

(assert (=> b!1359421 (=> (not res!903900) (not e!771397))))

(declare-fun arrayNoDuplicates!0 (array!92517 (_ BitVec 32) List!31740) Bool)

(assert (=> b!1359421 (= res!903900 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31737))))

(declare-fun b!1359422 () Bool)

(declare-fun res!903898 () Bool)

(assert (=> b!1359422 (=> (not res!903898) (not e!771397))))

(assert (=> b!1359422 (= res!903898 (not (contains!9449 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1359423 () Bool)

(declare-datatypes ((Unit!44757 0))(
  ( (Unit!44758) )
))
(declare-fun e!771399 () Unit!44757)

(declare-fun lt!599601 () Unit!44757)

(assert (=> b!1359423 (= e!771399 lt!599601)))

(declare-fun lt!599602 () Unit!44757)

(declare-fun lemmaListSubSeqRefl!0 (List!31740) Unit!44757)

(assert (=> b!1359423 (= lt!599602 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!851 (List!31740 List!31740) Bool)

(assert (=> b!1359423 (subseq!851 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92517 List!31740 List!31740 (_ BitVec 32)) Unit!44757)

(declare-fun $colon$colon!854 (List!31740 (_ BitVec 64)) List!31740)

(assert (=> b!1359423 (= lt!599601 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!854 acc!759 (select (arr!44699 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1359423 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1359424 () Bool)

(declare-fun res!903903 () Bool)

(assert (=> b!1359424 (=> (not res!903903) (not e!771397))))

(assert (=> b!1359424 (= res!903903 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1359425 () Bool)

(declare-fun res!903904 () Bool)

(assert (=> b!1359425 (=> (not res!903904) (not e!771397))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1359425 (= res!903904 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45249 a!3742))))))

(declare-fun b!1359426 () Bool)

(declare-fun e!771400 () Bool)

(assert (=> b!1359426 (= e!771400 false)))

(declare-fun lt!599599 () Bool)

(assert (=> b!1359426 (= lt!599599 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1359427 () Bool)

(declare-fun res!903897 () Bool)

(assert (=> b!1359427 (=> (not res!903897) (not e!771397))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1359427 (= res!903897 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1359428 () Bool)

(assert (=> b!1359428 (= e!771397 e!771400)))

(declare-fun res!903899 () Bool)

(assert (=> b!1359428 (=> (not res!903899) (not e!771400))))

(assert (=> b!1359428 (= res!903899 (and (= from!3120 i!1404) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-fun lt!599600 () Unit!44757)

(assert (=> b!1359428 (= lt!599600 e!771399)))

(declare-fun c!127202 () Bool)

(assert (=> b!1359428 (= c!127202 (validKeyInArray!0 (select (arr!44699 a!3742) from!3120)))))

(declare-fun b!1359429 () Bool)

(declare-fun Unit!44759 () Unit!44757)

(assert (=> b!1359429 (= e!771399 Unit!44759)))

(declare-fun b!1359430 () Bool)

(declare-fun res!903901 () Bool)

(assert (=> b!1359430 (=> (not res!903901) (not e!771397))))

(declare-fun noDuplicate!2306 (List!31740) Bool)

(assert (=> b!1359430 (= res!903901 (noDuplicate!2306 acc!759))))

(assert (= (and start!114572 res!903896) b!1359430))

(assert (= (and b!1359430 res!903901) b!1359419))

(assert (= (and b!1359419 res!903902) b!1359422))

(assert (= (and b!1359422 res!903898) b!1359421))

(assert (= (and b!1359421 res!903900) b!1359424))

(assert (= (and b!1359424 res!903903) b!1359425))

(assert (= (and b!1359425 res!903904) b!1359427))

(assert (= (and b!1359427 res!903897) b!1359420))

(assert (= (and b!1359420 res!903895) b!1359428))

(assert (= (and b!1359428 c!127202) b!1359423))

(assert (= (and b!1359428 (not c!127202)) b!1359429))

(assert (= (and b!1359428 res!903899) b!1359426))

(declare-fun m!1244833 () Bool)

(assert (=> b!1359426 m!1244833))

(declare-fun m!1244835 () Bool)

(assert (=> b!1359423 m!1244835))

(declare-fun m!1244837 () Bool)

(assert (=> b!1359423 m!1244837))

(declare-fun m!1244839 () Bool)

(assert (=> b!1359423 m!1244839))

(declare-fun m!1244841 () Bool)

(assert (=> b!1359423 m!1244841))

(assert (=> b!1359423 m!1244833))

(assert (=> b!1359423 m!1244837))

(assert (=> b!1359423 m!1244839))

(declare-fun m!1244843 () Bool)

(assert (=> b!1359423 m!1244843))

(declare-fun m!1244845 () Bool)

(assert (=> b!1359427 m!1244845))

(declare-fun m!1244847 () Bool)

(assert (=> b!1359424 m!1244847))

(declare-fun m!1244849 () Bool)

(assert (=> b!1359430 m!1244849))

(declare-fun m!1244851 () Bool)

(assert (=> b!1359421 m!1244851))

(declare-fun m!1244853 () Bool)

(assert (=> start!114572 m!1244853))

(declare-fun m!1244855 () Bool)

(assert (=> b!1359422 m!1244855))

(declare-fun m!1244857 () Bool)

(assert (=> b!1359419 m!1244857))

(assert (=> b!1359428 m!1244837))

(assert (=> b!1359428 m!1244837))

(declare-fun m!1244859 () Bool)

(assert (=> b!1359428 m!1244859))

(push 1)

