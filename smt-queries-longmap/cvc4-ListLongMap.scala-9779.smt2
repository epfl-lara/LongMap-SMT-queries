; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!115884 () Bool)

(assert start!115884)

(declare-fun b!1369908 () Bool)

(declare-fun res!913369 () Bool)

(declare-fun e!775957 () Bool)

(assert (=> b!1369908 (=> (not res!913369) (not e!775957))))

(declare-datatypes ((List!31988 0))(
  ( (Nil!31985) (Cons!31984 (h!33193 (_ BitVec 64)) (t!46682 List!31988)) )
))
(declare-fun newAcc!98 () List!31988)

(declare-fun contains!9670 (List!31988 (_ BitVec 64)) Bool)

(assert (=> b!1369908 (= res!913369 (not (contains!9670 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369909 () Bool)

(declare-fun res!913370 () Bool)

(assert (=> b!1369909 (=> (not res!913370) (not e!775957))))

(assert (=> b!1369909 (= res!913370 (not (contains!9670 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369910 () Bool)

(declare-fun e!775955 () Bool)

(assert (=> b!1369910 (= e!775957 e!775955)))

(declare-fun res!913377 () Bool)

(assert (=> b!1369910 (=> (not res!913377) (not e!775955))))

(declare-datatypes ((array!92998 0))(
  ( (array!92999 (arr!44920 (Array (_ BitVec 32) (_ BitVec 64))) (size!45470 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92998)

(declare-fun acc!866 () List!31988)

(declare-fun from!3239 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!92998 (_ BitVec 32) List!31988) Bool)

(assert (=> b!1369910 (= res!913377 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45277 0))(
  ( (Unit!45278) )
))
(declare-fun lt!602356 () Unit!45277)

(declare-fun noDuplicateSubseq!259 (List!31988 List!31988) Unit!45277)

(assert (=> b!1369910 (= lt!602356 (noDuplicateSubseq!259 newAcc!98 acc!866))))

(declare-fun b!1369911 () Bool)

(declare-fun res!913372 () Bool)

(assert (=> b!1369911 (=> (not res!913372) (not e!775955))))

(assert (=> b!1369911 (= res!913372 (not (contains!9670 acc!866 (select (arr!44920 a!3861) from!3239))))))

(declare-fun b!1369912 () Bool)

(declare-fun res!913375 () Bool)

(assert (=> b!1369912 (=> (not res!913375) (not e!775957))))

(declare-fun subseq!1072 (List!31988 List!31988) Bool)

(assert (=> b!1369912 (= res!913375 (subseq!1072 newAcc!98 acc!866))))

(declare-fun b!1369913 () Bool)

(declare-fun res!913374 () Bool)

(assert (=> b!1369913 (=> (not res!913374) (not e!775957))))

(assert (=> b!1369913 (= res!913374 (not (contains!9670 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369914 () Bool)

(declare-fun res!913373 () Bool)

(assert (=> b!1369914 (=> (not res!913373) (not e!775955))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1369914 (= res!913373 (validKeyInArray!0 (select (arr!44920 a!3861) from!3239)))))

(declare-fun b!1369915 () Bool)

(declare-fun res!913378 () Bool)

(assert (=> b!1369915 (=> (not res!913378) (not e!775957))))

(assert (=> b!1369915 (= res!913378 (not (contains!9670 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369917 () Bool)

(declare-fun res!913368 () Bool)

(assert (=> b!1369917 (=> (not res!913368) (not e!775957))))

(declare-fun noDuplicate!2527 (List!31988) Bool)

(assert (=> b!1369917 (= res!913368 (noDuplicate!2527 acc!866))))

(declare-fun b!1369918 () Bool)

(declare-fun res!913371 () Bool)

(assert (=> b!1369918 (=> (not res!913371) (not e!775955))))

(assert (=> b!1369918 (= res!913371 (bvslt from!3239 (size!45470 a!3861)))))

(declare-fun res!913376 () Bool)

(assert (=> start!115884 (=> (not res!913376) (not e!775957))))

(assert (=> start!115884 (= res!913376 (and (bvslt (size!45470 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45470 a!3861))))))

(assert (=> start!115884 e!775957))

(declare-fun array_inv!33948 (array!92998) Bool)

(assert (=> start!115884 (array_inv!33948 a!3861)))

(assert (=> start!115884 true))

(declare-fun b!1369916 () Bool)

(assert (=> b!1369916 (= e!775955 (bvslt (bvadd #b00000000000000000000000000000001 from!3239) #b00000000000000000000000000000000))))

(assert (= (and start!115884 res!913376) b!1369917))

(assert (= (and b!1369917 res!913368) b!1369915))

(assert (= (and b!1369915 res!913378) b!1369913))

(assert (= (and b!1369913 res!913374) b!1369908))

(assert (= (and b!1369908 res!913369) b!1369909))

(assert (= (and b!1369909 res!913370) b!1369912))

(assert (= (and b!1369912 res!913375) b!1369910))

(assert (= (and b!1369910 res!913377) b!1369918))

(assert (= (and b!1369918 res!913371) b!1369914))

(assert (= (and b!1369914 res!913373) b!1369911))

(assert (= (and b!1369911 res!913372) b!1369916))

(declare-fun m!1253593 () Bool)

(assert (=> b!1369908 m!1253593))

(declare-fun m!1253595 () Bool)

(assert (=> start!115884 m!1253595))

(declare-fun m!1253597 () Bool)

(assert (=> b!1369915 m!1253597))

(declare-fun m!1253599 () Bool)

(assert (=> b!1369909 m!1253599))

(declare-fun m!1253601 () Bool)

(assert (=> b!1369910 m!1253601))

(declare-fun m!1253603 () Bool)

(assert (=> b!1369910 m!1253603))

(declare-fun m!1253605 () Bool)

(assert (=> b!1369917 m!1253605))

(declare-fun m!1253607 () Bool)

(assert (=> b!1369911 m!1253607))

(assert (=> b!1369911 m!1253607))

(declare-fun m!1253609 () Bool)

(assert (=> b!1369911 m!1253609))

(declare-fun m!1253611 () Bool)

(assert (=> b!1369913 m!1253611))

(declare-fun m!1253613 () Bool)

(assert (=> b!1369912 m!1253613))

(assert (=> b!1369914 m!1253607))

(assert (=> b!1369914 m!1253607))

(declare-fun m!1253615 () Bool)

(assert (=> b!1369914 m!1253615))

(push 1)

(assert (not b!1369913))

(assert (not b!1369914))

(assert (not b!1369910))

