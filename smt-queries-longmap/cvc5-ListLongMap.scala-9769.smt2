; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!115736 () Bool)

(assert start!115736)

(declare-fun b!1368686 () Bool)

(declare-fun res!912196 () Bool)

(declare-fun e!775397 () Bool)

(assert (=> b!1368686 (=> (not res!912196) (not e!775397))))

(declare-datatypes ((List!31956 0))(
  ( (Nil!31953) (Cons!31952 (h!33161 (_ BitVec 64)) (t!46650 List!31956)) )
))
(declare-fun acc!866 () List!31956)

(declare-fun noDuplicate!2495 (List!31956) Bool)

(assert (=> b!1368686 (= res!912196 (noDuplicate!2495 acc!866))))

(declare-fun b!1368687 () Bool)

(declare-fun res!912195 () Bool)

(declare-fun e!775399 () Bool)

(assert (=> b!1368687 (=> (not res!912195) (not e!775399))))

(declare-datatypes ((array!92928 0))(
  ( (array!92929 (arr!44888 (Array (_ BitVec 32) (_ BitVec 64))) (size!45438 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92928)

(declare-fun from!3239 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1368687 (= res!912195 (not (validKeyInArray!0 (select (arr!44888 a!3861) from!3239))))))

(declare-fun b!1368688 () Bool)

(declare-fun res!912203 () Bool)

(assert (=> b!1368688 (=> (not res!912203) (not e!775397))))

(declare-fun newAcc!98 () List!31956)

(declare-fun contains!9638 (List!31956 (_ BitVec 64)) Bool)

(assert (=> b!1368688 (= res!912203 (not (contains!9638 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1368689 () Bool)

(declare-fun res!912199 () Bool)

(assert (=> b!1368689 (=> (not res!912199) (not e!775397))))

(assert (=> b!1368689 (= res!912199 (not (contains!9638 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1368690 () Bool)

(declare-fun res!912200 () Bool)

(assert (=> b!1368690 (=> (not res!912200) (not e!775397))))

(assert (=> b!1368690 (= res!912200 (not (contains!9638 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1368691 () Bool)

(declare-fun res!912201 () Bool)

(assert (=> b!1368691 (=> (not res!912201) (not e!775399))))

(declare-fun arrayNoDuplicates!0 (array!92928 (_ BitVec 32) List!31956) Bool)

(assert (=> b!1368691 (= res!912201 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) acc!866))))

(declare-fun b!1368692 () Bool)

(declare-fun res!912197 () Bool)

(assert (=> b!1368692 (=> (not res!912197) (not e!775397))))

(declare-fun subseq!1040 (List!31956 List!31956) Bool)

(assert (=> b!1368692 (= res!912197 (subseq!1040 newAcc!98 acc!866))))

(declare-fun b!1368693 () Bool)

(declare-fun res!912194 () Bool)

(assert (=> b!1368693 (=> (not res!912194) (not e!775399))))

(assert (=> b!1368693 (= res!912194 (bvslt from!3239 (size!45438 a!3861)))))

(declare-fun res!912204 () Bool)

(assert (=> start!115736 (=> (not res!912204) (not e!775397))))

(assert (=> start!115736 (= res!912204 (and (bvslt (size!45438 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45438 a!3861))))))

(assert (=> start!115736 e!775397))

(declare-fun array_inv!33916 (array!92928) Bool)

(assert (=> start!115736 (array_inv!33916 a!3861)))

(assert (=> start!115736 true))

(declare-fun b!1368694 () Bool)

(declare-fun res!912205 () Bool)

(assert (=> b!1368694 (=> (not res!912205) (not e!775397))))

(assert (=> b!1368694 (= res!912205 (not (contains!9638 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1368695 () Bool)

(assert (=> b!1368695 (= e!775399 (not true))))

(assert (=> b!1368695 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) newAcc!98)))

(declare-datatypes ((Unit!45213 0))(
  ( (Unit!45214) )
))
(declare-fun lt!602109 () Unit!45213)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92928 List!31956 List!31956 (_ BitVec 32)) Unit!45213)

(assert (=> b!1368695 (= lt!602109 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3861 acc!866 newAcc!98 (bvadd #b00000000000000000000000000000001 from!3239)))))

(declare-fun b!1368696 () Bool)

(assert (=> b!1368696 (= e!775397 e!775399)))

(declare-fun res!912202 () Bool)

(assert (=> b!1368696 (=> (not res!912202) (not e!775399))))

(assert (=> b!1368696 (= res!912202 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-fun lt!602110 () Unit!45213)

(declare-fun noDuplicateSubseq!227 (List!31956 List!31956) Unit!45213)

(assert (=> b!1368696 (= lt!602110 (noDuplicateSubseq!227 newAcc!98 acc!866))))

(declare-fun b!1368697 () Bool)

(declare-fun res!912198 () Bool)

(assert (=> b!1368697 (=> (not res!912198) (not e!775399))))

(assert (=> b!1368697 (= res!912198 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) #b00000000000000000000000000000000))))

(assert (= (and start!115736 res!912204) b!1368686))

(assert (= (and b!1368686 res!912196) b!1368694))

(assert (= (and b!1368694 res!912205) b!1368689))

(assert (= (and b!1368689 res!912199) b!1368688))

(assert (= (and b!1368688 res!912203) b!1368690))

(assert (= (and b!1368690 res!912200) b!1368692))

(assert (= (and b!1368692 res!912197) b!1368696))

(assert (= (and b!1368696 res!912202) b!1368693))

(assert (= (and b!1368693 res!912194) b!1368687))

(assert (= (and b!1368687 res!912195) b!1368697))

(assert (= (and b!1368697 res!912198) b!1368691))

(assert (= (and b!1368691 res!912201) b!1368695))

(declare-fun m!1252591 () Bool)

(assert (=> b!1368687 m!1252591))

(assert (=> b!1368687 m!1252591))

(declare-fun m!1252593 () Bool)

(assert (=> b!1368687 m!1252593))

(declare-fun m!1252595 () Bool)

(assert (=> b!1368694 m!1252595))

(declare-fun m!1252597 () Bool)

(assert (=> b!1368686 m!1252597))

(declare-fun m!1252599 () Bool)

(assert (=> b!1368690 m!1252599))

(declare-fun m!1252601 () Bool)

(assert (=> b!1368688 m!1252601))

(declare-fun m!1252603 () Bool)

(assert (=> b!1368692 m!1252603))

(declare-fun m!1252605 () Bool)

(assert (=> b!1368696 m!1252605))

(declare-fun m!1252607 () Bool)

(assert (=> b!1368696 m!1252607))

(declare-fun m!1252609 () Bool)

(assert (=> b!1368691 m!1252609))

(declare-fun m!1252611 () Bool)

(assert (=> start!115736 m!1252611))

(declare-fun m!1252613 () Bool)

(assert (=> b!1368695 m!1252613))

(declare-fun m!1252615 () Bool)

(assert (=> b!1368695 m!1252615))

(declare-fun m!1252617 () Bool)

(assert (=> b!1368689 m!1252617))

(push 1)

