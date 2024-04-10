; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!115434 () Bool)

(assert start!115434)

(declare-fun b!1365001 () Bool)

(declare-fun res!908581 () Bool)

(declare-fun e!774109 () Bool)

(assert (=> b!1365001 (=> (not res!908581) (not e!774109))))

(declare-datatypes ((List!31874 0))(
  ( (Nil!31871) (Cons!31870 (h!33079 (_ BitVec 64)) (t!46568 List!31874)) )
))
(declare-fun newAcc!98 () List!31874)

(declare-fun contains!9556 (List!31874 (_ BitVec 64)) Bool)

(assert (=> b!1365001 (= res!908581 (not (contains!9556 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1365002 () Bool)

(declare-fun res!908578 () Bool)

(assert (=> b!1365002 (=> (not res!908578) (not e!774109))))

(assert (=> b!1365002 (= res!908578 (not (contains!9556 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1365003 () Bool)

(declare-fun res!908577 () Bool)

(assert (=> b!1365003 (=> (not res!908577) (not e!774109))))

(declare-fun acc!866 () List!31874)

(assert (=> b!1365003 (= res!908577 (not (contains!9556 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1365004 () Bool)

(declare-fun res!908575 () Bool)

(assert (=> b!1365004 (=> (not res!908575) (not e!774109))))

(assert (=> b!1365004 (= res!908575 (not (contains!9556 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1365005 () Bool)

(declare-fun res!908576 () Bool)

(assert (=> b!1365005 (=> (not res!908576) (not e!774109))))

(declare-fun noDuplicate!2413 (List!31874) Bool)

(assert (=> b!1365005 (= res!908576 (noDuplicate!2413 acc!866))))

(declare-fun res!908580 () Bool)

(assert (=> start!115434 (=> (not res!908580) (not e!774109))))

(declare-datatypes ((array!92755 0))(
  ( (array!92756 (arr!44806 (Array (_ BitVec 32) (_ BitVec 64))) (size!45356 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92755)

(declare-fun from!3239 () (_ BitVec 32))

(assert (=> start!115434 (= res!908580 (and (bvslt (size!45356 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45356 a!3861))))))

(assert (=> start!115434 e!774109))

(declare-fun array_inv!33834 (array!92755) Bool)

(assert (=> start!115434 (array_inv!33834 a!3861)))

(assert (=> start!115434 true))

(declare-fun b!1365006 () Bool)

(declare-fun res!908579 () Bool)

(assert (=> b!1365006 (=> (not res!908579) (not e!774109))))

(declare-fun subseq!958 (List!31874 List!31874) Bool)

(assert (=> b!1365006 (= res!908579 (subseq!958 newAcc!98 acc!866))))

(declare-fun b!1365007 () Bool)

(assert (=> b!1365007 (= e!774109 false)))

(declare-datatypes ((Unit!45049 0))(
  ( (Unit!45050) )
))
(declare-fun lt!601174 () Unit!45049)

(declare-fun noDuplicateSubseq!145 (List!31874 List!31874) Unit!45049)

(assert (=> b!1365007 (= lt!601174 (noDuplicateSubseq!145 newAcc!98 acc!866))))

(assert (= (and start!115434 res!908580) b!1365005))

(assert (= (and b!1365005 res!908576) b!1365004))

(assert (= (and b!1365004 res!908575) b!1365003))

(assert (= (and b!1365003 res!908577) b!1365001))

(assert (= (and b!1365001 res!908581) b!1365002))

(assert (= (and b!1365002 res!908578) b!1365006))

(assert (= (and b!1365006 res!908579) b!1365007))

(declare-fun m!1249677 () Bool)

(assert (=> start!115434 m!1249677))

(declare-fun m!1249679 () Bool)

(assert (=> b!1365007 m!1249679))

(declare-fun m!1249681 () Bool)

(assert (=> b!1365002 m!1249681))

(declare-fun m!1249683 () Bool)

(assert (=> b!1365001 m!1249683))

(declare-fun m!1249685 () Bool)

(assert (=> b!1365004 m!1249685))

(declare-fun m!1249687 () Bool)

(assert (=> b!1365006 m!1249687))

(declare-fun m!1249689 () Bool)

(assert (=> b!1365003 m!1249689))

(declare-fun m!1249691 () Bool)

(assert (=> b!1365005 m!1249691))

(push 1)

(assert (not b!1365003))

(assert (not start!115434))

(assert (not b!1365001))

(assert (not b!1365004))

(assert (not b!1365007))

(assert (not b!1365002))

(assert (not b!1365006))

(assert (not b!1365005))

(check-sat)

(pop 1)

(push 1)

