; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!115802 () Bool)

(assert start!115802)

(declare-fun b!1369213 () Bool)

(declare-fun res!912740 () Bool)

(declare-fun e!775638 () Bool)

(assert (=> b!1369213 (=> (not res!912740) (not e!775638))))

(declare-datatypes ((List!32023 0))(
  ( (Nil!32020) (Cons!32019 (h!33228 (_ BitVec 64)) (t!46709 List!32023)) )
))
(declare-fun newAcc!98 () List!32023)

(declare-fun contains!9616 (List!32023 (_ BitVec 64)) Bool)

(assert (=> b!1369213 (= res!912740 (not (contains!9616 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369214 () Bool)

(declare-fun res!912735 () Bool)

(assert (=> b!1369214 (=> (not res!912735) (not e!775638))))

(declare-fun acc!866 () List!32023)

(declare-fun noDuplicate!2531 (List!32023) Bool)

(assert (=> b!1369214 (= res!912735 (noDuplicate!2531 acc!866))))

(declare-fun res!912736 () Bool)

(assert (=> start!115802 (=> (not res!912736) (not e!775638))))

(declare-datatypes ((array!92908 0))(
  ( (array!92909 (arr!44877 (Array (_ BitVec 32) (_ BitVec 64))) (size!45429 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92908)

(declare-fun from!3239 () (_ BitVec 32))

(assert (=> start!115802 (= res!912736 (and (bvslt (size!45429 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45429 a!3861))))))

(assert (=> start!115802 e!775638))

(declare-fun array_inv!34110 (array!92908) Bool)

(assert (=> start!115802 (array_inv!34110 a!3861)))

(assert (=> start!115802 true))

(declare-fun b!1369215 () Bool)

(declare-fun res!912738 () Bool)

(assert (=> b!1369215 (=> (not res!912738) (not e!775638))))

(assert (=> b!1369215 (= res!912738 (not (contains!9616 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369216 () Bool)

(declare-fun res!912737 () Bool)

(assert (=> b!1369216 (=> (not res!912737) (not e!775638))))

(assert (=> b!1369216 (= res!912737 (not (contains!9616 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369217 () Bool)

(declare-fun res!912734 () Bool)

(assert (=> b!1369217 (=> (not res!912734) (not e!775638))))

(assert (=> b!1369217 (= res!912734 (not (contains!9616 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369218 () Bool)

(assert (=> b!1369218 (= e!775638 false)))

(declare-fun lt!602052 () Bool)

(declare-fun arrayNoDuplicates!0 (array!92908 (_ BitVec 32) List!32023) Bool)

(assert (=> b!1369218 (= lt!602052 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45082 0))(
  ( (Unit!45083) )
))
(declare-fun lt!602051 () Unit!45082)

(declare-fun noDuplicateSubseq!241 (List!32023 List!32023) Unit!45082)

(assert (=> b!1369218 (= lt!602051 (noDuplicateSubseq!241 newAcc!98 acc!866))))

(declare-fun b!1369219 () Bool)

(declare-fun res!912739 () Bool)

(assert (=> b!1369219 (=> (not res!912739) (not e!775638))))

(declare-fun subseq!1054 (List!32023 List!32023) Bool)

(assert (=> b!1369219 (= res!912739 (subseq!1054 newAcc!98 acc!866))))

(assert (= (and start!115802 res!912736) b!1369214))

(assert (= (and b!1369214 res!912735) b!1369215))

(assert (= (and b!1369215 res!912738) b!1369216))

(assert (= (and b!1369216 res!912737) b!1369217))

(assert (= (and b!1369217 res!912734) b!1369213))

(assert (= (and b!1369213 res!912740) b!1369219))

(assert (= (and b!1369219 res!912739) b!1369218))

(declare-fun m!1252575 () Bool)

(assert (=> b!1369216 m!1252575))

(declare-fun m!1252577 () Bool)

(assert (=> b!1369217 m!1252577))

(declare-fun m!1252579 () Bool)

(assert (=> b!1369215 m!1252579))

(declare-fun m!1252581 () Bool)

(assert (=> b!1369213 m!1252581))

(declare-fun m!1252583 () Bool)

(assert (=> b!1369214 m!1252583))

(declare-fun m!1252585 () Bool)

(assert (=> start!115802 m!1252585))

(declare-fun m!1252587 () Bool)

(assert (=> b!1369218 m!1252587))

(declare-fun m!1252589 () Bool)

(assert (=> b!1369218 m!1252589))

(declare-fun m!1252591 () Bool)

(assert (=> b!1369219 m!1252591))

(push 1)

(assert (not b!1369215))

(assert (not b!1369213))

(assert (not b!1369218))

(assert (not b!1369217))

(assert (not start!115802))

(assert (not b!1369214))

(assert (not b!1369219))

(assert (not b!1369216))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

