; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!115860 () Bool)

(assert start!115860)

(declare-fun b!1369595 () Bool)

(declare-fun res!913061 () Bool)

(declare-fun e!775866 () Bool)

(assert (=> b!1369595 (=> (not res!913061) (not e!775866))))

(declare-datatypes ((List!31976 0))(
  ( (Nil!31973) (Cons!31972 (h!33181 (_ BitVec 64)) (t!46670 List!31976)) )
))
(declare-fun newAcc!98 () List!31976)

(declare-fun contains!9658 (List!31976 (_ BitVec 64)) Bool)

(assert (=> b!1369595 (= res!913061 (not (contains!9658 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369596 () Bool)

(declare-fun res!913060 () Bool)

(assert (=> b!1369596 (=> (not res!913060) (not e!775866))))

(declare-fun acc!866 () List!31976)

(assert (=> b!1369596 (= res!913060 (not (contains!9658 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369597 () Bool)

(declare-fun e!775867 () Bool)

(assert (=> b!1369597 (= e!775866 e!775867)))

(declare-fun res!913057 () Bool)

(assert (=> b!1369597 (=> (not res!913057) (not e!775867))))

(declare-datatypes ((array!92974 0))(
  ( (array!92975 (arr!44908 (Array (_ BitVec 32) (_ BitVec 64))) (size!45458 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92974)

(declare-fun from!3239 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!92974 (_ BitVec 32) List!31976) Bool)

(assert (=> b!1369597 (= res!913057 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45253 0))(
  ( (Unit!45254) )
))
(declare-fun lt!602293 () Unit!45253)

(declare-fun noDuplicateSubseq!247 (List!31976 List!31976) Unit!45253)

(assert (=> b!1369597 (= lt!602293 (noDuplicateSubseq!247 newAcc!98 acc!866))))

(declare-fun b!1369598 () Bool)

(declare-fun res!913059 () Bool)

(assert (=> b!1369598 (=> (not res!913059) (not e!775866))))

(declare-fun subseq!1060 (List!31976 List!31976) Bool)

(assert (=> b!1369598 (= res!913059 (subseq!1060 newAcc!98 acc!866))))

(declare-fun b!1369599 () Bool)

(declare-fun res!913056 () Bool)

(assert (=> b!1369599 (=> (not res!913056) (not e!775866))))

(assert (=> b!1369599 (= res!913056 (not (contains!9658 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369600 () Bool)

(declare-fun res!913058 () Bool)

(assert (=> b!1369600 (=> (not res!913058) (not e!775866))))

(declare-fun noDuplicate!2515 (List!31976) Bool)

(assert (=> b!1369600 (= res!913058 (noDuplicate!2515 acc!866))))

(declare-fun res!913063 () Bool)

(assert (=> start!115860 (=> (not res!913063) (not e!775866))))

(assert (=> start!115860 (= res!913063 (and (bvslt (size!45458 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45458 a!3861))))))

(assert (=> start!115860 e!775866))

(declare-fun array_inv!33936 (array!92974) Bool)

(assert (=> start!115860 (array_inv!33936 a!3861)))

(assert (=> start!115860 true))

(declare-fun b!1369601 () Bool)

(declare-fun res!913055 () Bool)

(assert (=> b!1369601 (=> (not res!913055) (not e!775866))))

(assert (=> b!1369601 (= res!913055 (not (contains!9658 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369602 () Bool)

(assert (=> b!1369602 (= e!775867 false)))

(declare-fun lt!602292 () Bool)

(assert (=> b!1369602 (= lt!602292 (noDuplicate!2515 newAcc!98))))

(declare-fun b!1369603 () Bool)

(declare-fun res!913062 () Bool)

(assert (=> b!1369603 (=> (not res!913062) (not e!775867))))

(assert (=> b!1369603 (= res!913062 (bvsge from!3239 (size!45458 a!3861)))))

(assert (= (and start!115860 res!913063) b!1369600))

(assert (= (and b!1369600 res!913058) b!1369599))

(assert (= (and b!1369599 res!913056) b!1369596))

(assert (= (and b!1369596 res!913060) b!1369601))

(assert (= (and b!1369601 res!913055) b!1369595))

(assert (= (and b!1369595 res!913061) b!1369598))

(assert (= (and b!1369598 res!913059) b!1369597))

(assert (= (and b!1369597 res!913057) b!1369603))

(assert (= (and b!1369603 res!913062) b!1369602))

(declare-fun m!1253345 () Bool)

(assert (=> b!1369596 m!1253345))

(declare-fun m!1253347 () Bool)

(assert (=> b!1369597 m!1253347))

(declare-fun m!1253349 () Bool)

(assert (=> b!1369597 m!1253349))

(declare-fun m!1253351 () Bool)

(assert (=> b!1369602 m!1253351))

(declare-fun m!1253353 () Bool)

(assert (=> b!1369599 m!1253353))

(declare-fun m!1253355 () Bool)

(assert (=> start!115860 m!1253355))

(declare-fun m!1253357 () Bool)

(assert (=> b!1369598 m!1253357))

(declare-fun m!1253359 () Bool)

(assert (=> b!1369600 m!1253359))

(declare-fun m!1253361 () Bool)

(assert (=> b!1369595 m!1253361))

(declare-fun m!1253363 () Bool)

(assert (=> b!1369601 m!1253363))

(push 1)

(assert (not b!1369600))

(assert (not b!1369597))

