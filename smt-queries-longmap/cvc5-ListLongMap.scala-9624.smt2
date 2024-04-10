; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113882 () Bool)

(assert start!113882)

(declare-fun res!895984 () Bool)

(declare-fun e!768297 () Bool)

(assert (=> start!113882 (=> (not res!895984) (not e!768297))))

(declare-datatypes ((array!92064 0))(
  ( (array!92065 (arr!44480 (Array (_ BitVec 32) (_ BitVec 64))) (size!45030 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92064)

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> start!113882 (= res!895984 (and (bvslt (size!45030 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45030 a!3742))))))

(assert (=> start!113882 e!768297))

(declare-fun array_inv!33508 (array!92064) Bool)

(assert (=> start!113882 (array_inv!33508 a!3742)))

(assert (=> start!113882 true))

(declare-fun b!1350526 () Bool)

(declare-fun res!895985 () Bool)

(assert (=> b!1350526 (=> (not res!895985) (not e!768297))))

(declare-datatypes ((List!31521 0))(
  ( (Nil!31518) (Cons!31517 (h!32726 (_ BitVec 64)) (t!46179 List!31521)) )
))
(declare-fun acc!759 () List!31521)

(declare-fun noDuplicate!2087 (List!31521) Bool)

(assert (=> b!1350526 (= res!895985 (noDuplicate!2087 acc!759))))

(declare-fun b!1350527 () Bool)

(declare-fun res!895986 () Bool)

(assert (=> b!1350527 (=> (not res!895986) (not e!768297))))

(declare-fun contains!9230 (List!31521 (_ BitVec 64)) Bool)

(assert (=> b!1350527 (= res!895986 (not (contains!9230 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1350529 () Bool)

(assert (=> b!1350529 (= e!768297 false)))

(declare-fun lt!596986 () Bool)

(declare-fun arrayNoDuplicates!0 (array!92064 (_ BitVec 32) List!31521) Bool)

(assert (=> b!1350529 (= lt!596986 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31518))))

(declare-fun b!1350528 () Bool)

(declare-fun res!895987 () Bool)

(assert (=> b!1350528 (=> (not res!895987) (not e!768297))))

(assert (=> b!1350528 (= res!895987 (not (contains!9230 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!113882 res!895984) b!1350526))

(assert (= (and b!1350526 res!895985) b!1350527))

(assert (= (and b!1350527 res!895986) b!1350528))

(assert (= (and b!1350528 res!895987) b!1350529))

(declare-fun m!1237747 () Bool)

(assert (=> b!1350528 m!1237747))

(declare-fun m!1237749 () Bool)

(assert (=> b!1350529 m!1237749))

(declare-fun m!1237751 () Bool)

(assert (=> b!1350526 m!1237751))

(declare-fun m!1237753 () Bool)

(assert (=> start!113882 m!1237753))

(declare-fun m!1237755 () Bool)

(assert (=> b!1350527 m!1237755))

(push 1)

(assert (not b!1350527))

(assert (not b!1350529))

(assert (not b!1350526))

(assert (not b!1350528))

(assert (not start!113882))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

