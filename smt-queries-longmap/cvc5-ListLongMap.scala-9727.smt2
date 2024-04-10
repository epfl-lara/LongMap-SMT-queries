; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!115148 () Bool)

(assert start!115148)

(declare-fun b!1364175 () Bool)

(declare-fun res!907857 () Bool)

(declare-fun e!773604 () Bool)

(assert (=> b!1364175 (=> (not res!907857) (not e!773604))))

(declare-datatypes ((List!31830 0))(
  ( (Nil!31827) (Cons!31826 (h!33035 (_ BitVec 64)) (t!46524 List!31830)) )
))
(declare-fun acc!759 () List!31830)

(declare-fun noDuplicate!2396 (List!31830) Bool)

(assert (=> b!1364175 (= res!907857 (noDuplicate!2396 acc!759))))

(declare-fun b!1364176 () Bool)

(declare-fun res!907858 () Bool)

(assert (=> b!1364176 (=> (not res!907858) (not e!773604))))

(declare-fun contains!9539 (List!31830 (_ BitVec 64)) Bool)

(assert (=> b!1364176 (= res!907858 (not (contains!9539 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1364177 () Bool)

(declare-fun res!907860 () Bool)

(assert (=> b!1364177 (=> (not res!907860) (not e!773604))))

(assert (=> b!1364177 (= res!907860 (not (contains!9539 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1364178 () Bool)

(assert (=> b!1364178 (= e!773604 false)))

(declare-fun lt!601018 () Bool)

(declare-datatypes ((array!92718 0))(
  ( (array!92719 (arr!44789 (Array (_ BitVec 32) (_ BitVec 64))) (size!45339 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92718)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!92718 (_ BitVec 32) List!31830) Bool)

(assert (=> b!1364178 (= lt!601018 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1364179 () Bool)

(declare-fun res!907861 () Bool)

(assert (=> b!1364179 (=> (not res!907861) (not e!773604))))

(assert (=> b!1364179 (= res!907861 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31827))))

(declare-fun res!907859 () Bool)

(assert (=> start!115148 (=> (not res!907859) (not e!773604))))

(assert (=> start!115148 (= res!907859 (and (bvslt (size!45339 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45339 a!3742))))))

(assert (=> start!115148 e!773604))

(declare-fun array_inv!33817 (array!92718) Bool)

(assert (=> start!115148 (array_inv!33817 a!3742)))

(assert (=> start!115148 true))

(assert (= (and start!115148 res!907859) b!1364175))

(assert (= (and b!1364175 res!907857) b!1364176))

(assert (= (and b!1364176 res!907858) b!1364177))

(assert (= (and b!1364177 res!907860) b!1364179))

(assert (= (and b!1364179 res!907861) b!1364178))

(declare-fun m!1248889 () Bool)

(assert (=> b!1364176 m!1248889))

(declare-fun m!1248891 () Bool)

(assert (=> b!1364175 m!1248891))

(declare-fun m!1248893 () Bool)

(assert (=> b!1364179 m!1248893))

(declare-fun m!1248895 () Bool)

(assert (=> b!1364178 m!1248895))

(declare-fun m!1248897 () Bool)

(assert (=> start!115148 m!1248897))

(declare-fun m!1248899 () Bool)

(assert (=> b!1364177 m!1248899))

(push 1)

(assert (not start!115148))

(assert (not b!1364175))

(assert (not b!1364177))

(assert (not b!1364179))

(assert (not b!1364178))

(assert (not b!1364176))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

