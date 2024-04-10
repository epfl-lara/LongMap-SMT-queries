; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114576 () Bool)

(assert start!114576)

(declare-fun b!1359491 () Bool)

(declare-fun res!903958 () Bool)

(declare-fun e!771423 () Bool)

(assert (=> b!1359491 (=> (not res!903958) (not e!771423))))

(declare-datatypes ((List!31742 0))(
  ( (Nil!31739) (Cons!31738 (h!32947 (_ BitVec 64)) (t!46415 List!31742)) )
))
(declare-fun acc!759 () List!31742)

(declare-datatypes ((array!92521 0))(
  ( (array!92522 (arr!44701 (Array (_ BitVec 32) (_ BitVec 64))) (size!45251 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92521)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!92521 (_ BitVec 32) List!31742) Bool)

(assert (=> b!1359491 (= res!903958 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1359492 () Bool)

(declare-fun res!903959 () Bool)

(assert (=> b!1359492 (=> (not res!903959) (not e!771423))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1359492 (= res!903959 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45251 a!3742))))))

(declare-fun b!1359493 () Bool)

(declare-datatypes ((Unit!44763 0))(
  ( (Unit!44764) )
))
(declare-fun e!771421 () Unit!44763)

(declare-fun lt!599625 () Unit!44763)

(assert (=> b!1359493 (= e!771421 lt!599625)))

(declare-fun lt!599624 () Unit!44763)

(declare-fun lemmaListSubSeqRefl!0 (List!31742) Unit!44763)

(assert (=> b!1359493 (= lt!599624 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!853 (List!31742 List!31742) Bool)

(assert (=> b!1359493 (subseq!853 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92521 List!31742 List!31742 (_ BitVec 32)) Unit!44763)

(declare-fun $colon$colon!856 (List!31742 (_ BitVec 64)) List!31742)

(assert (=> b!1359493 (= lt!599625 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!856 acc!759 (select (arr!44701 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1359493 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1359494 () Bool)

(declare-fun res!903957 () Bool)

(assert (=> b!1359494 (=> (not res!903957) (not e!771423))))

(declare-fun contains!9451 (List!31742 (_ BitVec 64)) Bool)

(assert (=> b!1359494 (= res!903957 (not (contains!9451 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1359495 () Bool)

(declare-fun Unit!44765 () Unit!44763)

(assert (=> b!1359495 (= e!771421 Unit!44765)))

(declare-fun b!1359496 () Bool)

(declare-fun res!903964 () Bool)

(assert (=> b!1359496 (=> (not res!903964) (not e!771423))))

(assert (=> b!1359496 (= res!903964 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31739))))

(declare-fun b!1359497 () Bool)

(declare-fun res!903960 () Bool)

(assert (=> b!1359497 (=> (not res!903960) (not e!771423))))

(declare-fun noDuplicate!2308 (List!31742) Bool)

(assert (=> b!1359497 (= res!903960 (noDuplicate!2308 acc!759))))

(declare-fun b!1359498 () Bool)

(declare-fun e!771422 () Bool)

(assert (=> b!1359498 (= e!771423 e!771422)))

(declare-fun res!903961 () Bool)

(assert (=> b!1359498 (=> (not res!903961) (not e!771422))))

(assert (=> b!1359498 (= res!903961 (and (= from!3120 i!1404) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-fun lt!599626 () Unit!44763)

(assert (=> b!1359498 (= lt!599626 e!771421)))

(declare-fun c!127208 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1359498 (= c!127208 (validKeyInArray!0 (select (arr!44701 a!3742) from!3120)))))

(declare-fun res!903962 () Bool)

(assert (=> start!114576 (=> (not res!903962) (not e!771423))))

(assert (=> start!114576 (= res!903962 (and (bvslt (size!45251 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45251 a!3742))))))

(assert (=> start!114576 e!771423))

(assert (=> start!114576 true))

(declare-fun array_inv!33729 (array!92521) Bool)

(assert (=> start!114576 (array_inv!33729 a!3742)))

(declare-fun b!1359499 () Bool)

(declare-fun res!903956 () Bool)

(assert (=> b!1359499 (=> (not res!903956) (not e!771423))))

(assert (=> b!1359499 (= res!903956 (not (contains!9451 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1359500 () Bool)

(assert (=> b!1359500 (= e!771422 false)))

(declare-fun lt!599623 () Bool)

(assert (=> b!1359500 (= lt!599623 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1359501 () Bool)

(declare-fun res!903963 () Bool)

(assert (=> b!1359501 (=> (not res!903963) (not e!771423))))

(assert (=> b!1359501 (= res!903963 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45251 a!3742)))))

(declare-fun b!1359502 () Bool)

(declare-fun res!903955 () Bool)

(assert (=> b!1359502 (=> (not res!903955) (not e!771423))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1359502 (= res!903955 (not (validKeyInArray!0 l!3587)))))

(assert (= (and start!114576 res!903962) b!1359497))

(assert (= (and b!1359497 res!903960) b!1359499))

(assert (= (and b!1359499 res!903956) b!1359494))

(assert (= (and b!1359494 res!903957) b!1359496))

(assert (= (and b!1359496 res!903964) b!1359491))

(assert (= (and b!1359491 res!903958) b!1359492))

(assert (= (and b!1359492 res!903959) b!1359502))

(assert (= (and b!1359502 res!903955) b!1359501))

(assert (= (and b!1359501 res!903963) b!1359498))

(assert (= (and b!1359498 c!127208) b!1359493))

(assert (= (and b!1359498 (not c!127208)) b!1359495))

(assert (= (and b!1359498 res!903961) b!1359500))

(declare-fun m!1244889 () Bool)

(assert (=> b!1359498 m!1244889))

(assert (=> b!1359498 m!1244889))

(declare-fun m!1244891 () Bool)

(assert (=> b!1359498 m!1244891))

(declare-fun m!1244893 () Bool)

(assert (=> b!1359502 m!1244893))

(declare-fun m!1244895 () Bool)

(assert (=> b!1359496 m!1244895))

(declare-fun m!1244897 () Bool)

(assert (=> b!1359494 m!1244897))

(declare-fun m!1244899 () Bool)

(assert (=> b!1359499 m!1244899))

(declare-fun m!1244901 () Bool)

(assert (=> b!1359500 m!1244901))

(declare-fun m!1244903 () Bool)

(assert (=> b!1359491 m!1244903))

(declare-fun m!1244905 () Bool)

(assert (=> start!114576 m!1244905))

(declare-fun m!1244907 () Bool)

(assert (=> b!1359493 m!1244907))

(assert (=> b!1359493 m!1244889))

(declare-fun m!1244909 () Bool)

(assert (=> b!1359493 m!1244909))

(declare-fun m!1244911 () Bool)

(assert (=> b!1359493 m!1244911))

(assert (=> b!1359493 m!1244901))

(assert (=> b!1359493 m!1244889))

(assert (=> b!1359493 m!1244909))

(declare-fun m!1244913 () Bool)

(assert (=> b!1359493 m!1244913))

(declare-fun m!1244915 () Bool)

(assert (=> b!1359497 m!1244915))

(push 1)

(assert (not b!1359496))

(assert (not b!1359498))

