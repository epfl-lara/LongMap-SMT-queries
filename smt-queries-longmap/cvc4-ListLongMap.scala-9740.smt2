; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!115428 () Bool)

(assert start!115428)

(declare-fun b!1364938 () Bool)

(declare-fun res!908512 () Bool)

(declare-fun e!774091 () Bool)

(assert (=> b!1364938 (=> (not res!908512) (not e!774091))))

(declare-datatypes ((List!31871 0))(
  ( (Nil!31868) (Cons!31867 (h!33076 (_ BitVec 64)) (t!46565 List!31871)) )
))
(declare-fun newAcc!98 () List!31871)

(declare-fun acc!866 () List!31871)

(declare-fun subseq!955 (List!31871 List!31871) Bool)

(assert (=> b!1364938 (= res!908512 (subseq!955 newAcc!98 acc!866))))

(declare-fun b!1364939 () Bool)

(declare-fun res!908513 () Bool)

(assert (=> b!1364939 (=> (not res!908513) (not e!774091))))

(declare-fun contains!9553 (List!31871 (_ BitVec 64)) Bool)

(assert (=> b!1364939 (= res!908513 (not (contains!9553 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1364940 () Bool)

(declare-fun res!908515 () Bool)

(assert (=> b!1364940 (=> (not res!908515) (not e!774091))))

(assert (=> b!1364940 (= res!908515 (not (contains!9553 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1364941 () Bool)

(assert (=> b!1364941 (= e!774091 false)))

(declare-datatypes ((Unit!45043 0))(
  ( (Unit!45044) )
))
(declare-fun lt!601165 () Unit!45043)

(declare-fun noDuplicateSubseq!142 (List!31871 List!31871) Unit!45043)

(assert (=> b!1364941 (= lt!601165 (noDuplicateSubseq!142 newAcc!98 acc!866))))

(declare-fun b!1364943 () Bool)

(declare-fun res!908516 () Bool)

(assert (=> b!1364943 (=> (not res!908516) (not e!774091))))

(assert (=> b!1364943 (= res!908516 (not (contains!9553 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1364944 () Bool)

(declare-fun res!908517 () Bool)

(assert (=> b!1364944 (=> (not res!908517) (not e!774091))))

(declare-fun noDuplicate!2410 (List!31871) Bool)

(assert (=> b!1364944 (= res!908517 (noDuplicate!2410 acc!866))))

(declare-fun b!1364942 () Bool)

(declare-fun res!908518 () Bool)

(assert (=> b!1364942 (=> (not res!908518) (not e!774091))))

(assert (=> b!1364942 (= res!908518 (not (contains!9553 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!908514 () Bool)

(assert (=> start!115428 (=> (not res!908514) (not e!774091))))

(declare-datatypes ((array!92749 0))(
  ( (array!92750 (arr!44803 (Array (_ BitVec 32) (_ BitVec 64))) (size!45353 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92749)

(declare-fun from!3239 () (_ BitVec 32))

(assert (=> start!115428 (= res!908514 (and (bvslt (size!45353 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45353 a!3861))))))

(assert (=> start!115428 e!774091))

(declare-fun array_inv!33831 (array!92749) Bool)

(assert (=> start!115428 (array_inv!33831 a!3861)))

(assert (=> start!115428 true))

(assert (= (and start!115428 res!908514) b!1364944))

(assert (= (and b!1364944 res!908517) b!1364943))

(assert (= (and b!1364943 res!908516) b!1364942))

(assert (= (and b!1364942 res!908518) b!1364939))

(assert (= (and b!1364939 res!908513) b!1364940))

(assert (= (and b!1364940 res!908515) b!1364938))

(assert (= (and b!1364938 res!908512) b!1364941))

(declare-fun m!1249629 () Bool)

(assert (=> b!1364943 m!1249629))

(declare-fun m!1249631 () Bool)

(assert (=> b!1364938 m!1249631))

(declare-fun m!1249633 () Bool)

(assert (=> b!1364940 m!1249633))

(declare-fun m!1249635 () Bool)

(assert (=> b!1364942 m!1249635))

(declare-fun m!1249637 () Bool)

(assert (=> b!1364941 m!1249637))

(declare-fun m!1249639 () Bool)

(assert (=> b!1364939 m!1249639))

(declare-fun m!1249641 () Bool)

(assert (=> b!1364944 m!1249641))

(declare-fun m!1249643 () Bool)

(assert (=> start!115428 m!1249643))

(push 1)

(assert (not b!1364944))

(assert (not b!1364941))

(assert (not b!1364938))

(assert (not b!1364939))

(assert (not start!115428))

(assert (not b!1364940))

(assert (not b!1364943))

(assert (not b!1364942))

(check-sat)

(pop 1)

