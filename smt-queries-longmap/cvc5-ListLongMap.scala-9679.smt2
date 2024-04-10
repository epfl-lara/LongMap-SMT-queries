; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114212 () Bool)

(assert start!114212)

(declare-fun res!901542 () Bool)

(declare-fun e!770178 () Bool)

(assert (=> start!114212 (=> (not res!901542) (not e!770178))))

(declare-datatypes ((array!92394 0))(
  ( (array!92395 (arr!44645 (Array (_ BitVec 32) (_ BitVec 64))) (size!45195 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92394)

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> start!114212 (= res!901542 (and (bvslt (size!45195 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45195 a!3742))))))

(assert (=> start!114212 e!770178))

(declare-fun array_inv!33673 (array!92394) Bool)

(assert (=> start!114212 (array_inv!33673 a!3742)))

(assert (=> start!114212 true))

(declare-fun b!1356783 () Bool)

(assert (=> b!1356783 (= e!770178 false)))

(declare-datatypes ((List!31686 0))(
  ( (Nil!31683) (Cons!31682 (h!32891 (_ BitVec 64)) (t!46344 List!31686)) )
))
(declare-fun acc!759 () List!31686)

(declare-fun lt!599083 () Bool)

(declare-fun arrayNoDuplicates!0 (array!92394 (_ BitVec 32) List!31686) Bool)

(assert (=> b!1356783 (= lt!599083 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1356784 () Bool)

(declare-fun res!901540 () Bool)

(assert (=> b!1356784 (=> (not res!901540) (not e!770178))))

(declare-fun contains!9395 (List!31686 (_ BitVec 64)) Bool)

(assert (=> b!1356784 (= res!901540 (not (contains!9395 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1356785 () Bool)

(declare-fun res!901539 () Bool)

(assert (=> b!1356785 (=> (not res!901539) (not e!770178))))

(assert (=> b!1356785 (= res!901539 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31683))))

(declare-fun b!1356786 () Bool)

(declare-fun res!901541 () Bool)

(assert (=> b!1356786 (=> (not res!901541) (not e!770178))))

(declare-fun noDuplicate!2252 (List!31686) Bool)

(assert (=> b!1356786 (= res!901541 (noDuplicate!2252 acc!759))))

(declare-fun b!1356787 () Bool)

(declare-fun res!901543 () Bool)

(assert (=> b!1356787 (=> (not res!901543) (not e!770178))))

(assert (=> b!1356787 (= res!901543 (not (contains!9395 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!114212 res!901542) b!1356786))

(assert (= (and b!1356786 res!901541) b!1356784))

(assert (= (and b!1356784 res!901540) b!1356787))

(assert (= (and b!1356787 res!901543) b!1356785))

(assert (= (and b!1356785 res!901539) b!1356783))

(declare-fun m!1242697 () Bool)

(assert (=> start!114212 m!1242697))

(declare-fun m!1242699 () Bool)

(assert (=> b!1356783 m!1242699))

(declare-fun m!1242701 () Bool)

(assert (=> b!1356786 m!1242701))

(declare-fun m!1242703 () Bool)

(assert (=> b!1356784 m!1242703))

(declare-fun m!1242705 () Bool)

(assert (=> b!1356787 m!1242705))

(declare-fun m!1242707 () Bool)

(assert (=> b!1356785 m!1242707))

(push 1)

(assert (not start!114212))

(assert (not b!1356787))

(assert (not b!1356783))

(assert (not b!1356785))

(assert (not b!1356784))

(assert (not b!1356786))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

