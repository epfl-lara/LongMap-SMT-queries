; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113880 () Bool)

(assert start!113880)

(declare-fun b!1350513 () Bool)

(declare-fun res!895972 () Bool)

(declare-fun e!768292 () Bool)

(assert (=> b!1350513 (=> (not res!895972) (not e!768292))))

(declare-datatypes ((List!31520 0))(
  ( (Nil!31517) (Cons!31516 (h!32725 (_ BitVec 64)) (t!46178 List!31520)) )
))
(declare-fun acc!759 () List!31520)

(declare-fun noDuplicate!2086 (List!31520) Bool)

(assert (=> b!1350513 (= res!895972 (noDuplicate!2086 acc!759))))

(declare-fun b!1350514 () Bool)

(declare-fun res!895974 () Bool)

(assert (=> b!1350514 (=> (not res!895974) (not e!768292))))

(declare-fun contains!9229 (List!31520 (_ BitVec 64)) Bool)

(assert (=> b!1350514 (= res!895974 (not (contains!9229 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1350515 () Bool)

(declare-fun res!895971 () Bool)

(assert (=> b!1350515 (=> (not res!895971) (not e!768292))))

(assert (=> b!1350515 (= res!895971 (not (contains!9229 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1350516 () Bool)

(declare-fun from!3120 () (_ BitVec 32))

(declare-datatypes ((array!92062 0))(
  ( (array!92063 (arr!44479 (Array (_ BitVec 32) (_ BitVec 64))) (size!45029 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92062)

(assert (=> b!1350516 (= e!768292 (bvsgt from!3120 (size!45029 a!3742)))))

(declare-fun res!895975 () Bool)

(assert (=> start!113880 (=> (not res!895975) (not e!768292))))

(assert (=> start!113880 (= res!895975 (and (bvslt (size!45029 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45029 a!3742))))))

(assert (=> start!113880 e!768292))

(declare-fun array_inv!33507 (array!92062) Bool)

(assert (=> start!113880 (array_inv!33507 a!3742)))

(assert (=> start!113880 true))

(declare-fun b!1350517 () Bool)

(declare-fun res!895973 () Bool)

(assert (=> b!1350517 (=> (not res!895973) (not e!768292))))

(declare-fun arrayNoDuplicates!0 (array!92062 (_ BitVec 32) List!31520) Bool)

(assert (=> b!1350517 (= res!895973 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31517))))

(assert (= (and start!113880 res!895975) b!1350513))

(assert (= (and b!1350513 res!895972) b!1350514))

(assert (= (and b!1350514 res!895974) b!1350515))

(assert (= (and b!1350515 res!895971) b!1350517))

(assert (= (and b!1350517 res!895973) b!1350516))

(declare-fun m!1237737 () Bool)

(assert (=> b!1350514 m!1237737))

(declare-fun m!1237739 () Bool)

(assert (=> b!1350513 m!1237739))

(declare-fun m!1237741 () Bool)

(assert (=> b!1350515 m!1237741))

(declare-fun m!1237743 () Bool)

(assert (=> b!1350517 m!1237743))

(declare-fun m!1237745 () Bool)

(assert (=> start!113880 m!1237745))

(push 1)

(assert (not b!1350513))

(assert (not b!1350515))

(assert (not start!113880))

(assert (not b!1350517))

(assert (not b!1350514))

(check-sat)

(pop 1)

(push 1)

(check-sat)

