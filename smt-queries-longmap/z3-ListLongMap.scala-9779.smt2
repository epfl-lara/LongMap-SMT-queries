; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115882 () Bool)

(assert start!115882)

(declare-fun b!1369875 () Bool)

(declare-fun res!913339 () Bool)

(declare-fun e!775947 () Bool)

(assert (=> b!1369875 (=> (not res!913339) (not e!775947))))

(declare-datatypes ((List!31987 0))(
  ( (Nil!31984) (Cons!31983 (h!33192 (_ BitVec 64)) (t!46681 List!31987)) )
))
(declare-fun newAcc!98 () List!31987)

(declare-fun contains!9669 (List!31987 (_ BitVec 64)) Bool)

(assert (=> b!1369875 (= res!913339 (not (contains!9669 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369876 () Bool)

(declare-fun res!913337 () Bool)

(assert (=> b!1369876 (=> (not res!913337) (not e!775947))))

(declare-fun acc!866 () List!31987)

(assert (=> b!1369876 (= res!913337 (not (contains!9669 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369877 () Bool)

(declare-fun res!913340 () Bool)

(declare-fun e!775948 () Bool)

(assert (=> b!1369877 (=> (not res!913340) (not e!775948))))

(declare-datatypes ((array!92996 0))(
  ( (array!92997 (arr!44919 (Array (_ BitVec 32) (_ BitVec 64))) (size!45469 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92996)

(declare-fun from!3239 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1369877 (= res!913340 (validKeyInArray!0 (select (arr!44919 a!3861) from!3239)))))

(declare-fun b!1369878 () Bool)

(declare-fun res!913343 () Bool)

(assert (=> b!1369878 (=> (not res!913343) (not e!775948))))

(assert (=> b!1369878 (= res!913343 (bvslt from!3239 (size!45469 a!3861)))))

(declare-fun b!1369879 () Bool)

(declare-fun res!913345 () Bool)

(assert (=> b!1369879 (=> (not res!913345) (not e!775948))))

(assert (=> b!1369879 (= res!913345 (not (contains!9669 acc!866 (select (arr!44919 a!3861) from!3239))))))

(declare-fun b!1369880 () Bool)

(declare-fun res!913336 () Bool)

(assert (=> b!1369880 (=> (not res!913336) (not e!775947))))

(assert (=> b!1369880 (= res!913336 (not (contains!9669 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369882 () Bool)

(assert (=> b!1369882 (= e!775948 (bvslt (bvadd #b00000000000000000000000000000001 from!3239) #b00000000000000000000000000000000))))

(declare-fun b!1369883 () Bool)

(assert (=> b!1369883 (= e!775947 e!775948)))

(declare-fun res!913335 () Bool)

(assert (=> b!1369883 (=> (not res!913335) (not e!775948))))

(declare-fun arrayNoDuplicates!0 (array!92996 (_ BitVec 32) List!31987) Bool)

(assert (=> b!1369883 (= res!913335 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45275 0))(
  ( (Unit!45276) )
))
(declare-fun lt!602353 () Unit!45275)

(declare-fun noDuplicateSubseq!258 (List!31987 List!31987) Unit!45275)

(assert (=> b!1369883 (= lt!602353 (noDuplicateSubseq!258 newAcc!98 acc!866))))

(declare-fun b!1369884 () Bool)

(declare-fun res!913338 () Bool)

(assert (=> b!1369884 (=> (not res!913338) (not e!775947))))

(assert (=> b!1369884 (= res!913338 (not (contains!9669 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369885 () Bool)

(declare-fun res!913344 () Bool)

(assert (=> b!1369885 (=> (not res!913344) (not e!775947))))

(declare-fun noDuplicate!2526 (List!31987) Bool)

(assert (=> b!1369885 (= res!913344 (noDuplicate!2526 acc!866))))

(declare-fun b!1369881 () Bool)

(declare-fun res!913341 () Bool)

(assert (=> b!1369881 (=> (not res!913341) (not e!775947))))

(declare-fun subseq!1071 (List!31987 List!31987) Bool)

(assert (=> b!1369881 (= res!913341 (subseq!1071 newAcc!98 acc!866))))

(declare-fun res!913342 () Bool)

(assert (=> start!115882 (=> (not res!913342) (not e!775947))))

(assert (=> start!115882 (= res!913342 (and (bvslt (size!45469 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45469 a!3861))))))

(assert (=> start!115882 e!775947))

(declare-fun array_inv!33947 (array!92996) Bool)

(assert (=> start!115882 (array_inv!33947 a!3861)))

(assert (=> start!115882 true))

(assert (= (and start!115882 res!913342) b!1369885))

(assert (= (and b!1369885 res!913344) b!1369884))

(assert (= (and b!1369884 res!913338) b!1369876))

(assert (= (and b!1369876 res!913337) b!1369880))

(assert (= (and b!1369880 res!913336) b!1369875))

(assert (= (and b!1369875 res!913339) b!1369881))

(assert (= (and b!1369881 res!913341) b!1369883))

(assert (= (and b!1369883 res!913335) b!1369878))

(assert (= (and b!1369878 res!913343) b!1369877))

(assert (= (and b!1369877 res!913340) b!1369879))

(assert (= (and b!1369879 res!913345) b!1369882))

(declare-fun m!1253569 () Bool)

(assert (=> b!1369885 m!1253569))

(declare-fun m!1253571 () Bool)

(assert (=> b!1369875 m!1253571))

(declare-fun m!1253573 () Bool)

(assert (=> b!1369880 m!1253573))

(declare-fun m!1253575 () Bool)

(assert (=> b!1369876 m!1253575))

(declare-fun m!1253577 () Bool)

(assert (=> b!1369881 m!1253577))

(declare-fun m!1253579 () Bool)

(assert (=> b!1369884 m!1253579))

(declare-fun m!1253581 () Bool)

(assert (=> b!1369879 m!1253581))

(assert (=> b!1369879 m!1253581))

(declare-fun m!1253583 () Bool)

(assert (=> b!1369879 m!1253583))

(assert (=> b!1369877 m!1253581))

(assert (=> b!1369877 m!1253581))

(declare-fun m!1253585 () Bool)

(assert (=> b!1369877 m!1253585))

(declare-fun m!1253587 () Bool)

(assert (=> b!1369883 m!1253587))

(declare-fun m!1253589 () Bool)

(assert (=> b!1369883 m!1253589))

(declare-fun m!1253591 () Bool)

(assert (=> start!115882 m!1253591))

(check-sat (not b!1369884) (not b!1369883) (not start!115882) (not b!1369885) (not b!1369879) (not b!1369881) (not b!1369875) (not b!1369877) (not b!1369880) (not b!1369876))
(check-sat)
