; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114140 () Bool)

(assert start!114140)

(declare-fun b!1352315 () Bool)

(declare-fun res!896992 () Bool)

(declare-fun e!769269 () Bool)

(assert (=> b!1352315 (=> (not res!896992) (not e!769269))))

(declare-datatypes ((List!31578 0))(
  ( (Nil!31575) (Cons!31574 (h!32792 (_ BitVec 64)) (t!46228 List!31578)) )
))
(declare-fun acc!759 () List!31578)

(declare-fun contains!9290 (List!31578 (_ BitVec 64)) Bool)

(assert (=> b!1352315 (= res!896992 (not (contains!9290 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1352316 () Bool)

(declare-fun res!896998 () Bool)

(declare-fun e!769268 () Bool)

(assert (=> b!1352316 (=> res!896998 e!769268)))

(declare-fun lt!597592 () List!31578)

(declare-fun noDuplicate!2121 (List!31578) Bool)

(assert (=> b!1352316 (= res!896998 (not (noDuplicate!2121 lt!597592)))))

(declare-fun b!1352317 () Bool)

(declare-fun res!897003 () Bool)

(assert (=> b!1352317 (=> res!897003 e!769268)))

(declare-fun subseq!667 (List!31578 List!31578) Bool)

(assert (=> b!1352317 (= res!897003 (not (subseq!667 acc!759 lt!597592)))))

(declare-fun b!1352318 () Bool)

(declare-fun res!896999 () Bool)

(assert (=> b!1352318 (=> res!896999 e!769268)))

(assert (=> b!1352318 (= res!896999 (contains!9290 lt!597592 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1352319 () Bool)

(declare-fun res!897006 () Bool)

(assert (=> b!1352319 (=> (not res!897006) (not e!769269))))

(declare-fun i!1404 () (_ BitVec 32))

(declare-datatypes ((array!92213 0))(
  ( (array!92214 (arr!44550 (Array (_ BitVec 32) (_ BitVec 64))) (size!45101 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92213)

(assert (=> b!1352319 (= res!897006 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45101 a!3742))))))

(declare-fun b!1352320 () Bool)

(declare-fun res!896995 () Bool)

(assert (=> b!1352320 (=> (not res!896995) (not e!769269))))

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!92213 (_ BitVec 32) List!31578) Bool)

(assert (=> b!1352320 (= res!896995 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1352321 () Bool)

(declare-fun res!897004 () Bool)

(assert (=> b!1352321 (=> res!897004 e!769268)))

(assert (=> b!1352321 (= res!897004 (contains!9290 lt!597592 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1352322 () Bool)

(declare-fun res!896993 () Bool)

(assert (=> b!1352322 (=> (not res!896993) (not e!769269))))

(assert (=> b!1352322 (= res!896993 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45101 a!3742)))))

(declare-fun b!1352323 () Bool)

(declare-fun res!896994 () Bool)

(assert (=> b!1352323 (=> (not res!896994) (not e!769269))))

(assert (=> b!1352323 (= res!896994 (noDuplicate!2121 acc!759))))

(declare-fun b!1352324 () Bool)

(declare-fun res!897005 () Bool)

(assert (=> b!1352324 (=> (not res!897005) (not e!769269))))

(assert (=> b!1352324 (= res!897005 (not (contains!9290 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1352325 () Bool)

(assert (=> b!1352325 (= e!769269 (not e!769268))))

(declare-fun res!897001 () Bool)

(assert (=> b!1352325 (=> res!897001 e!769268)))

(assert (=> b!1352325 (= res!897001 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!681 (List!31578 (_ BitVec 64)) List!31578)

(assert (=> b!1352325 (= lt!597592 ($colon$colon!681 acc!759 (select (arr!44550 a!3742) from!3120)))))

(assert (=> b!1352325 (subseq!667 acc!759 acc!759)))

(declare-datatypes ((Unit!44187 0))(
  ( (Unit!44188) )
))
(declare-fun lt!597591 () Unit!44187)

(declare-fun lemmaListSubSeqRefl!0 (List!31578) Unit!44187)

(assert (=> b!1352325 (= lt!597591 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun b!1352326 () Bool)

(assert (=> b!1352326 (= e!769268 true)))

(declare-fun lt!597593 () Bool)

(assert (=> b!1352326 (= lt!597593 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) lt!597592))))

(declare-fun lt!597594 () Unit!44187)

(declare-fun noDuplicateSubseq!118 (List!31578 List!31578) Unit!44187)

(assert (=> b!1352326 (= lt!597594 (noDuplicateSubseq!118 acc!759 lt!597592))))

(declare-fun b!1352327 () Bool)

(declare-fun res!896996 () Bool)

(assert (=> b!1352327 (=> (not res!896996) (not e!769269))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1352327 (= res!896996 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1352328 () Bool)

(declare-fun res!896997 () Bool)

(assert (=> b!1352328 (=> (not res!896997) (not e!769269))))

(assert (=> b!1352328 (= res!896997 (validKeyInArray!0 (select (arr!44550 a!3742) from!3120)))))

(declare-fun b!1352329 () Bool)

(declare-fun res!897002 () Bool)

(assert (=> b!1352329 (=> (not res!897002) (not e!769269))))

(assert (=> b!1352329 (= res!897002 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31575))))

(declare-fun res!897000 () Bool)

(assert (=> start!114140 (=> (not res!897000) (not e!769269))))

(assert (=> start!114140 (= res!897000 (and (bvslt (size!45101 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45101 a!3742))))))

(assert (=> start!114140 e!769269))

(assert (=> start!114140 true))

(declare-fun array_inv!33831 (array!92213) Bool)

(assert (=> start!114140 (array_inv!33831 a!3742)))

(assert (= (and start!114140 res!897000) b!1352323))

(assert (= (and b!1352323 res!896994) b!1352324))

(assert (= (and b!1352324 res!897005) b!1352315))

(assert (= (and b!1352315 res!896992) b!1352329))

(assert (= (and b!1352329 res!897002) b!1352320))

(assert (= (and b!1352320 res!896995) b!1352319))

(assert (= (and b!1352319 res!897006) b!1352327))

(assert (= (and b!1352327 res!896996) b!1352322))

(assert (= (and b!1352322 res!896993) b!1352328))

(assert (= (and b!1352328 res!896997) b!1352325))

(assert (= (and b!1352325 (not res!897001)) b!1352316))

(assert (= (and b!1352316 (not res!896998)) b!1352321))

(assert (= (and b!1352321 (not res!897004)) b!1352318))

(assert (= (and b!1352318 (not res!896999)) b!1352317))

(assert (= (and b!1352317 (not res!897003)) b!1352326))

(declare-fun m!1239721 () Bool)

(assert (=> b!1352323 m!1239721))

(declare-fun m!1239723 () Bool)

(assert (=> b!1352321 m!1239723))

(declare-fun m!1239725 () Bool)

(assert (=> b!1352329 m!1239725))

(declare-fun m!1239727 () Bool)

(assert (=> b!1352320 m!1239727))

(declare-fun m!1239729 () Bool)

(assert (=> b!1352325 m!1239729))

(assert (=> b!1352325 m!1239729))

(declare-fun m!1239731 () Bool)

(assert (=> b!1352325 m!1239731))

(declare-fun m!1239733 () Bool)

(assert (=> b!1352325 m!1239733))

(declare-fun m!1239735 () Bool)

(assert (=> b!1352325 m!1239735))

(declare-fun m!1239737 () Bool)

(assert (=> start!114140 m!1239737))

(declare-fun m!1239739 () Bool)

(assert (=> b!1352316 m!1239739))

(declare-fun m!1239741 () Bool)

(assert (=> b!1352326 m!1239741))

(declare-fun m!1239743 () Bool)

(assert (=> b!1352326 m!1239743))

(assert (=> b!1352328 m!1239729))

(assert (=> b!1352328 m!1239729))

(declare-fun m!1239745 () Bool)

(assert (=> b!1352328 m!1239745))

(declare-fun m!1239747 () Bool)

(assert (=> b!1352315 m!1239747))

(declare-fun m!1239749 () Bool)

(assert (=> b!1352324 m!1239749))

(declare-fun m!1239751 () Bool)

(assert (=> b!1352317 m!1239751))

(declare-fun m!1239753 () Bool)

(assert (=> b!1352327 m!1239753))

(declare-fun m!1239755 () Bool)

(assert (=> b!1352318 m!1239755))

(push 1)

(assert (not b!1352320))

(assert (not b!1352316))

(assert (not b!1352315))

(assert (not b!1352328))

(assert (not b!1352329))

(assert (not b!1352326))

(assert (not b!1352327))

(assert (not b!1352324))

(assert (not b!1352325))

(assert (not b!1352323))

(assert (not b!1352321))

(assert (not b!1352318))

(assert (not b!1352317))

(assert (not start!114140))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

