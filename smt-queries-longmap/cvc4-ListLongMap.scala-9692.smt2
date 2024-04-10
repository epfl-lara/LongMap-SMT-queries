; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114492 () Bool)

(assert start!114492)

(declare-fun b!1358817 () Bool)

(declare-fun res!903402 () Bool)

(declare-fun e!771123 () Bool)

(assert (=> b!1358817 (=> (not res!903402) (not e!771123))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1358817 (= res!903402 (not (validKeyInArray!0 l!3587)))))

(declare-fun res!903403 () Bool)

(assert (=> start!114492 (=> (not res!903403) (not e!771123))))

(declare-datatypes ((array!92488 0))(
  ( (array!92489 (arr!44686 (Array (_ BitVec 32) (_ BitVec 64))) (size!45236 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92488)

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> start!114492 (= res!903403 (and (bvslt (size!45236 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45236 a!3742))))))

(assert (=> start!114492 e!771123))

(assert (=> start!114492 true))

(declare-fun array_inv!33714 (array!92488) Bool)

(assert (=> start!114492 (array_inv!33714 a!3742)))

(declare-fun b!1358818 () Bool)

(declare-fun res!903409 () Bool)

(assert (=> b!1358818 (=> (not res!903409) (not e!771123))))

(declare-datatypes ((List!31727 0))(
  ( (Nil!31724) (Cons!31723 (h!32932 (_ BitVec 64)) (t!46397 List!31727)) )
))
(declare-fun acc!759 () List!31727)

(declare-fun arrayNoDuplicates!0 (array!92488 (_ BitVec 32) List!31727) Bool)

(assert (=> b!1358818 (= res!903409 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1358819 () Bool)

(declare-datatypes ((Unit!44718 0))(
  ( (Unit!44719) )
))
(declare-fun e!771124 () Unit!44718)

(declare-fun lt!599442 () Unit!44718)

(assert (=> b!1358819 (= e!771124 lt!599442)))

(declare-fun lt!599443 () Unit!44718)

(declare-fun lemmaListSubSeqRefl!0 (List!31727) Unit!44718)

(assert (=> b!1358819 (= lt!599443 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!838 (List!31727 List!31727) Bool)

(assert (=> b!1358819 (subseq!838 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92488 List!31727 List!31727 (_ BitVec 32)) Unit!44718)

(declare-fun $colon$colon!841 (List!31727 (_ BitVec 64)) List!31727)

(assert (=> b!1358819 (= lt!599442 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!841 acc!759 (select (arr!44686 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1358819 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1358820 () Bool)

(declare-fun res!903406 () Bool)

(assert (=> b!1358820 (=> (not res!903406) (not e!771123))))

(declare-fun noDuplicate!2293 (List!31727) Bool)

(assert (=> b!1358820 (= res!903406 (noDuplicate!2293 acc!759))))

(declare-fun b!1358821 () Bool)

(declare-fun res!903407 () Bool)

(assert (=> b!1358821 (=> (not res!903407) (not e!771123))))

(assert (=> b!1358821 (= res!903407 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31724))))

(declare-fun b!1358822 () Bool)

(declare-fun Unit!44720 () Unit!44718)

(assert (=> b!1358822 (= e!771124 Unit!44720)))

(declare-fun b!1358823 () Bool)

(declare-fun res!903404 () Bool)

(assert (=> b!1358823 (=> (not res!903404) (not e!771123))))

(declare-fun contains!9436 (List!31727 (_ BitVec 64)) Bool)

(assert (=> b!1358823 (= res!903404 (not (contains!9436 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1358824 () Bool)

(assert (=> b!1358824 (= e!771123 false)))

(declare-fun lt!599441 () Unit!44718)

(assert (=> b!1358824 (= lt!599441 e!771124)))

(declare-fun c!127148 () Bool)

(assert (=> b!1358824 (= c!127148 (validKeyInArray!0 (select (arr!44686 a!3742) from!3120)))))

(declare-fun b!1358825 () Bool)

(declare-fun res!903408 () Bool)

(assert (=> b!1358825 (=> (not res!903408) (not e!771123))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1358825 (= res!903408 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45236 a!3742))))))

(declare-fun b!1358826 () Bool)

(declare-fun res!903401 () Bool)

(assert (=> b!1358826 (=> (not res!903401) (not e!771123))))

(assert (=> b!1358826 (= res!903401 (not (contains!9436 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1358827 () Bool)

(declare-fun res!903405 () Bool)

(assert (=> b!1358827 (=> (not res!903405) (not e!771123))))

(assert (=> b!1358827 (= res!903405 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45236 a!3742)))))

(assert (= (and start!114492 res!903403) b!1358820))

(assert (= (and b!1358820 res!903406) b!1358823))

(assert (= (and b!1358823 res!903404) b!1358826))

(assert (= (and b!1358826 res!903401) b!1358821))

(assert (= (and b!1358821 res!903407) b!1358818))

(assert (= (and b!1358818 res!903409) b!1358825))

(assert (= (and b!1358825 res!903408) b!1358817))

(assert (= (and b!1358817 res!903402) b!1358827))

(assert (= (and b!1358827 res!903405) b!1358824))

(assert (= (and b!1358824 c!127148) b!1358819))

(assert (= (and b!1358824 (not c!127148)) b!1358822))

(declare-fun m!1244343 () Bool)

(assert (=> b!1358817 m!1244343))

(declare-fun m!1244345 () Bool)

(assert (=> b!1358819 m!1244345))

(declare-fun m!1244347 () Bool)

(assert (=> b!1358819 m!1244347))

(declare-fun m!1244349 () Bool)

(assert (=> b!1358819 m!1244349))

(declare-fun m!1244351 () Bool)

(assert (=> b!1358819 m!1244351))

(declare-fun m!1244353 () Bool)

(assert (=> b!1358819 m!1244353))

(assert (=> b!1358819 m!1244347))

(assert (=> b!1358819 m!1244349))

(declare-fun m!1244355 () Bool)

(assert (=> b!1358819 m!1244355))

(declare-fun m!1244357 () Bool)

(assert (=> b!1358820 m!1244357))

(declare-fun m!1244359 () Bool)

(assert (=> b!1358823 m!1244359))

(declare-fun m!1244361 () Bool)

(assert (=> b!1358821 m!1244361))

(declare-fun m!1244363 () Bool)

(assert (=> b!1358826 m!1244363))

(declare-fun m!1244365 () Bool)

(assert (=> b!1358818 m!1244365))

(assert (=> b!1358824 m!1244347))

(assert (=> b!1358824 m!1244347))

(declare-fun m!1244367 () Bool)

(assert (=> b!1358824 m!1244367))

(declare-fun m!1244369 () Bool)

(assert (=> start!114492 m!1244369))

(push 1)

(assert (not b!1358821))

(assert (not b!1358824))

(assert (not b!1358819))

(assert (not b!1358818))

(assert (not b!1358826))

(assert (not b!1358817))

(assert (not b!1358823))

(assert (not b!1358820))

(assert (not start!114492))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

