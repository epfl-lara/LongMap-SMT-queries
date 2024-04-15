; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115414 () Bool)

(assert start!115414)

(declare-fun b!1364824 () Bool)

(declare-fun res!908443 () Bool)

(declare-fun e!774045 () Bool)

(assert (=> b!1364824 (=> (not res!908443) (not e!774045))))

(declare-datatypes ((List!31922 0))(
  ( (Nil!31919) (Cons!31918 (h!33127 (_ BitVec 64)) (t!46608 List!31922)) )
))
(declare-fun newAcc!98 () List!31922)

(declare-fun contains!9515 (List!31922 (_ BitVec 64)) Bool)

(assert (=> b!1364824 (= res!908443 (not (contains!9515 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1364825 () Bool)

(assert (=> b!1364825 (= e!774045 false)))

(declare-datatypes ((Unit!44880 0))(
  ( (Unit!44881) )
))
(declare-fun lt!600972 () Unit!44880)

(declare-fun acc!866 () List!31922)

(declare-fun noDuplicateSubseq!140 (List!31922 List!31922) Unit!44880)

(assert (=> b!1364825 (= lt!600972 (noDuplicateSubseq!140 newAcc!98 acc!866))))

(declare-fun b!1364826 () Bool)

(declare-fun res!908441 () Bool)

(assert (=> b!1364826 (=> (not res!908441) (not e!774045))))

(assert (=> b!1364826 (= res!908441 (not (contains!9515 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1364828 () Bool)

(declare-fun res!908442 () Bool)

(assert (=> b!1364828 (=> (not res!908442) (not e!774045))))

(declare-fun subseq!953 (List!31922 List!31922) Bool)

(assert (=> b!1364828 (= res!908442 (subseq!953 newAcc!98 acc!866))))

(declare-fun b!1364829 () Bool)

(declare-fun res!908444 () Bool)

(assert (=> b!1364829 (=> (not res!908444) (not e!774045))))

(assert (=> b!1364829 (= res!908444 (not (contains!9515 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1364830 () Bool)

(declare-fun res!908445 () Bool)

(assert (=> b!1364830 (=> (not res!908445) (not e!774045))))

(assert (=> b!1364830 (= res!908445 (not (contains!9515 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1364827 () Bool)

(declare-fun res!908447 () Bool)

(assert (=> b!1364827 (=> (not res!908447) (not e!774045))))

(declare-fun noDuplicate!2430 (List!31922) Bool)

(assert (=> b!1364827 (= res!908447 (noDuplicate!2430 acc!866))))

(declare-fun res!908446 () Bool)

(assert (=> start!115414 (=> (not res!908446) (not e!774045))))

(declare-datatypes ((array!92694 0))(
  ( (array!92695 (arr!44776 (Array (_ BitVec 32) (_ BitVec 64))) (size!45328 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92694)

(declare-fun from!3239 () (_ BitVec 32))

(assert (=> start!115414 (= res!908446 (and (bvslt (size!45328 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45328 a!3861))))))

(assert (=> start!115414 e!774045))

(declare-fun array_inv!34009 (array!92694) Bool)

(assert (=> start!115414 (array_inv!34009 a!3861)))

(assert (=> start!115414 true))

(assert (= (and start!115414 res!908446) b!1364827))

(assert (= (and b!1364827 res!908447) b!1364826))

(assert (= (and b!1364826 res!908441) b!1364830))

(assert (= (and b!1364830 res!908445) b!1364824))

(assert (= (and b!1364824 res!908443) b!1364829))

(assert (= (and b!1364829 res!908444) b!1364828))

(assert (= (and b!1364828 res!908442) b!1364825))

(declare-fun m!1249071 () Bool)

(assert (=> b!1364829 m!1249071))

(declare-fun m!1249073 () Bool)

(assert (=> b!1364826 m!1249073))

(declare-fun m!1249075 () Bool)

(assert (=> b!1364827 m!1249075))

(declare-fun m!1249077 () Bool)

(assert (=> b!1364825 m!1249077))

(declare-fun m!1249079 () Bool)

(assert (=> b!1364828 m!1249079))

(declare-fun m!1249081 () Bool)

(assert (=> b!1364830 m!1249081))

(declare-fun m!1249083 () Bool)

(assert (=> start!115414 m!1249083))

(declare-fun m!1249085 () Bool)

(assert (=> b!1364824 m!1249085))

(check-sat (not b!1364827) (not b!1364830) (not b!1364828) (not b!1364825) (not b!1364824) (not start!115414) (not b!1364826) (not b!1364829))
(check-sat)
