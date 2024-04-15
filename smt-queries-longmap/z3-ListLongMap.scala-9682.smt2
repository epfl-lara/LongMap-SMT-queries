; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114230 () Bool)

(assert start!114230)

(declare-fun b!1356948 () Bool)

(declare-fun res!901753 () Bool)

(declare-fun e!770200 () Bool)

(assert (=> b!1356948 (=> (not res!901753) (not e!770200))))

(declare-datatypes ((array!92361 0))(
  ( (array!92362 (arr!44629 (Array (_ BitVec 32) (_ BitVec 64))) (size!45181 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92361)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1356948 (= res!901753 (validKeyInArray!0 (select (arr!44629 a!3742) from!3120)))))

(declare-fun b!1356949 () Bool)

(declare-fun res!901746 () Bool)

(assert (=> b!1356949 (=> (not res!901746) (not e!770200))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1356949 (= res!901746 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45181 a!3742))))))

(declare-fun b!1356950 () Bool)

(assert (=> b!1356950 (= e!770200 (not (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-datatypes ((List!31748 0))(
  ( (Nil!31745) (Cons!31744 (h!32953 (_ BitVec 64)) (t!46398 List!31748)) )
))
(declare-fun acc!759 () List!31748)

(declare-fun subseq!806 (List!31748 List!31748) Bool)

(assert (=> b!1356950 (subseq!806 acc!759 acc!759)))

(declare-datatypes ((Unit!44484 0))(
  ( (Unit!44485) )
))
(declare-fun lt!598924 () Unit!44484)

(declare-fun lemmaListSubSeqRefl!0 (List!31748) Unit!44484)

(assert (=> b!1356950 (= lt!598924 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun b!1356951 () Bool)

(declare-fun res!901745 () Bool)

(assert (=> b!1356951 (=> (not res!901745) (not e!770200))))

(declare-fun arrayNoDuplicates!0 (array!92361 (_ BitVec 32) List!31748) Bool)

(assert (=> b!1356951 (= res!901745 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31745))))

(declare-fun b!1356952 () Bool)

(declare-fun res!901750 () Bool)

(assert (=> b!1356952 (=> (not res!901750) (not e!770200))))

(declare-fun contains!9368 (List!31748 (_ BitVec 64)) Bool)

(assert (=> b!1356952 (= res!901750 (not (contains!9368 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1356954 () Bool)

(declare-fun res!901749 () Bool)

(assert (=> b!1356954 (=> (not res!901749) (not e!770200))))

(assert (=> b!1356954 (= res!901749 (not (contains!9368 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1356955 () Bool)

(declare-fun res!901754 () Bool)

(assert (=> b!1356955 (=> (not res!901754) (not e!770200))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1356955 (= res!901754 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1356956 () Bool)

(declare-fun res!901752 () Bool)

(assert (=> b!1356956 (=> (not res!901752) (not e!770200))))

(assert (=> b!1356956 (= res!901752 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45181 a!3742)))))

(declare-fun b!1356957 () Bool)

(declare-fun res!901748 () Bool)

(assert (=> b!1356957 (=> (not res!901748) (not e!770200))))

(declare-fun noDuplicate!2283 (List!31748) Bool)

(assert (=> b!1356957 (= res!901748 (noDuplicate!2283 acc!759))))

(declare-fun res!901751 () Bool)

(assert (=> start!114230 (=> (not res!901751) (not e!770200))))

(assert (=> start!114230 (= res!901751 (and (bvslt (size!45181 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45181 a!3742))))))

(assert (=> start!114230 e!770200))

(assert (=> start!114230 true))

(declare-fun array_inv!33862 (array!92361) Bool)

(assert (=> start!114230 (array_inv!33862 a!3742)))

(declare-fun b!1356953 () Bool)

(declare-fun res!901747 () Bool)

(assert (=> b!1356953 (=> (not res!901747) (not e!770200))))

(assert (=> b!1356953 (= res!901747 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(assert (= (and start!114230 res!901751) b!1356957))

(assert (= (and b!1356957 res!901748) b!1356954))

(assert (= (and b!1356954 res!901749) b!1356952))

(assert (= (and b!1356952 res!901750) b!1356951))

(assert (= (and b!1356951 res!901745) b!1356953))

(assert (= (and b!1356953 res!901747) b!1356949))

(assert (= (and b!1356949 res!901746) b!1356955))

(assert (= (and b!1356955 res!901754) b!1356956))

(assert (= (and b!1356956 res!901752) b!1356948))

(assert (= (and b!1356948 res!901753) b!1356950))

(declare-fun m!1242349 () Bool)

(assert (=> b!1356948 m!1242349))

(assert (=> b!1356948 m!1242349))

(declare-fun m!1242351 () Bool)

(assert (=> b!1356948 m!1242351))

(declare-fun m!1242353 () Bool)

(assert (=> b!1356951 m!1242353))

(declare-fun m!1242355 () Bool)

(assert (=> b!1356950 m!1242355))

(declare-fun m!1242357 () Bool)

(assert (=> b!1356950 m!1242357))

(declare-fun m!1242359 () Bool)

(assert (=> b!1356953 m!1242359))

(declare-fun m!1242361 () Bool)

(assert (=> b!1356955 m!1242361))

(declare-fun m!1242363 () Bool)

(assert (=> b!1356957 m!1242363))

(declare-fun m!1242365 () Bool)

(assert (=> b!1356954 m!1242365))

(declare-fun m!1242367 () Bool)

(assert (=> b!1356952 m!1242367))

(declare-fun m!1242369 () Bool)

(assert (=> start!114230 m!1242369))

(check-sat (not b!1356950) (not b!1356955) (not b!1356952) (not b!1356953) (not start!114230) (not b!1356951) (not b!1356954) (not b!1356948) (not b!1356957))
(check-sat)
