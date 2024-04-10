; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!115886 () Bool)

(assert start!115886)

(declare-fun b!1369939 () Bool)

(declare-fun res!913402 () Bool)

(declare-fun e!775965 () Bool)

(assert (=> b!1369939 (=> (not res!913402) (not e!775965))))

(declare-datatypes ((List!31989 0))(
  ( (Nil!31986) (Cons!31985 (h!33194 (_ BitVec 64)) (t!46683 List!31989)) )
))
(declare-fun newAcc!98 () List!31989)

(declare-fun acc!866 () List!31989)

(declare-fun subseq!1073 (List!31989 List!31989) Bool)

(assert (=> b!1369939 (= res!913402 (subseq!1073 newAcc!98 acc!866))))

(declare-fun b!1369940 () Bool)

(declare-fun res!913403 () Bool)

(assert (=> b!1369940 (=> (not res!913403) (not e!775965))))

(declare-fun contains!9671 (List!31989 (_ BitVec 64)) Bool)

(assert (=> b!1369940 (= res!913403 (not (contains!9671 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369941 () Bool)

(declare-fun res!913408 () Bool)

(assert (=> b!1369941 (=> (not res!913408) (not e!775965))))

(declare-fun noDuplicate!2528 (List!31989) Bool)

(assert (=> b!1369941 (= res!913408 (noDuplicate!2528 acc!866))))

(declare-fun b!1369942 () Bool)

(declare-fun res!913405 () Bool)

(declare-fun e!775964 () Bool)

(assert (=> b!1369942 (=> (not res!913405) (not e!775964))))

(declare-fun from!3239 () (_ BitVec 32))

(declare-datatypes ((array!93000 0))(
  ( (array!93001 (arr!44921 (Array (_ BitVec 32) (_ BitVec 64))) (size!45471 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!93000)

(assert (=> b!1369942 (= res!913405 (bvslt from!3239 (size!45471 a!3861)))))

(declare-fun b!1369943 () Bool)

(declare-fun res!913401 () Bool)

(assert (=> b!1369943 (=> (not res!913401) (not e!775965))))

(assert (=> b!1369943 (= res!913401 (not (contains!9671 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!913399 () Bool)

(assert (=> start!115886 (=> (not res!913399) (not e!775965))))

(assert (=> start!115886 (= res!913399 (and (bvslt (size!45471 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45471 a!3861))))))

(assert (=> start!115886 e!775965))

(declare-fun array_inv!33949 (array!93000) Bool)

(assert (=> start!115886 (array_inv!33949 a!3861)))

(assert (=> start!115886 true))

(declare-fun b!1369944 () Bool)

(assert (=> b!1369944 (= e!775965 e!775964)))

(declare-fun res!913407 () Bool)

(assert (=> b!1369944 (=> (not res!913407) (not e!775964))))

(declare-fun arrayNoDuplicates!0 (array!93000 (_ BitVec 32) List!31989) Bool)

(assert (=> b!1369944 (= res!913407 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45279 0))(
  ( (Unit!45280) )
))
(declare-fun lt!602362 () Unit!45279)

(declare-fun noDuplicateSubseq!260 (List!31989 List!31989) Unit!45279)

(assert (=> b!1369944 (= lt!602362 (noDuplicateSubseq!260 newAcc!98 acc!866))))

(declare-fun b!1369945 () Bool)

(declare-fun res!913400 () Bool)

(assert (=> b!1369945 (=> (not res!913400) (not e!775965))))

(assert (=> b!1369945 (= res!913400 (not (contains!9671 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369946 () Bool)

(declare-fun res!913404 () Bool)

(assert (=> b!1369946 (=> (not res!913404) (not e!775964))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1369946 (= res!913404 (validKeyInArray!0 (select (arr!44921 a!3861) from!3239)))))

(declare-fun b!1369947 () Bool)

(declare-fun res!913406 () Bool)

(assert (=> b!1369947 (=> (not res!913406) (not e!775965))))

(assert (=> b!1369947 (= res!913406 (not (contains!9671 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369948 () Bool)

(assert (=> b!1369948 (= e!775964 false)))

(declare-fun lt!602361 () Bool)

(assert (=> b!1369948 (= lt!602361 (contains!9671 acc!866 (select (arr!44921 a!3861) from!3239)))))

(assert (= (and start!115886 res!913399) b!1369941))

(assert (= (and b!1369941 res!913408) b!1369945))

(assert (= (and b!1369945 res!913400) b!1369940))

(assert (= (and b!1369940 res!913403) b!1369947))

(assert (= (and b!1369947 res!913406) b!1369943))

(assert (= (and b!1369943 res!913401) b!1369939))

(assert (= (and b!1369939 res!913402) b!1369944))

(assert (= (and b!1369944 res!913407) b!1369942))

(assert (= (and b!1369942 res!913405) b!1369946))

(assert (= (and b!1369946 res!913404) b!1369948))

(declare-fun m!1253617 () Bool)

(assert (=> b!1369948 m!1253617))

(assert (=> b!1369948 m!1253617))

(declare-fun m!1253619 () Bool)

(assert (=> b!1369948 m!1253619))

(declare-fun m!1253621 () Bool)

(assert (=> start!115886 m!1253621))

(declare-fun m!1253623 () Bool)

(assert (=> b!1369947 m!1253623))

(declare-fun m!1253625 () Bool)

(assert (=> b!1369941 m!1253625))

(assert (=> b!1369946 m!1253617))

(assert (=> b!1369946 m!1253617))

(declare-fun m!1253627 () Bool)

(assert (=> b!1369946 m!1253627))

(declare-fun m!1253629 () Bool)

(assert (=> b!1369939 m!1253629))

(declare-fun m!1253631 () Bool)

(assert (=> b!1369944 m!1253631))

(declare-fun m!1253633 () Bool)

(assert (=> b!1369944 m!1253633))

(declare-fun m!1253635 () Bool)

(assert (=> b!1369943 m!1253635))

(declare-fun m!1253637 () Bool)

(assert (=> b!1369945 m!1253637))

(declare-fun m!1253639 () Bool)

(assert (=> b!1369940 m!1253639))

(push 1)

