; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!115806 () Bool)

(assert start!115806)

(declare-fun res!912700 () Bool)

(declare-fun e!775653 () Bool)

(assert (=> start!115806 (=> (not res!912700) (not e!775653))))

(declare-datatypes ((array!92953 0))(
  ( (array!92954 (arr!44899 (Array (_ BitVec 32) (_ BitVec 64))) (size!45449 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92953)

(declare-fun from!3239 () (_ BitVec 32))

(assert (=> start!115806 (= res!912700 (and (bvslt (size!45449 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45449 a!3861))))))

(assert (=> start!115806 e!775653))

(declare-fun array_inv!33927 (array!92953) Bool)

(assert (=> start!115806 (array_inv!33927 a!3861)))

(assert (=> start!115806 true))

(declare-fun b!1369222 () Bool)

(declare-fun res!912704 () Bool)

(assert (=> b!1369222 (=> (not res!912704) (not e!775653))))

(declare-datatypes ((List!31967 0))(
  ( (Nil!31964) (Cons!31963 (h!33172 (_ BitVec 64)) (t!46661 List!31967)) )
))
(declare-fun newAcc!98 () List!31967)

(declare-fun acc!866 () List!31967)

(declare-fun subseq!1051 (List!31967 List!31967) Bool)

(assert (=> b!1369222 (= res!912704 (subseq!1051 newAcc!98 acc!866))))

(declare-fun b!1369223 () Bool)

(declare-fun res!912706 () Bool)

(assert (=> b!1369223 (=> (not res!912706) (not e!775653))))

(declare-fun contains!9649 (List!31967 (_ BitVec 64)) Bool)

(assert (=> b!1369223 (= res!912706 (not (contains!9649 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369224 () Bool)

(assert (=> b!1369224 (= e!775653 false)))

(declare-fun lt!602221 () Bool)

(declare-fun arrayNoDuplicates!0 (array!92953 (_ BitVec 32) List!31967) Bool)

(assert (=> b!1369224 (= lt!602221 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45235 0))(
  ( (Unit!45236) )
))
(declare-fun lt!602220 () Unit!45235)

(declare-fun noDuplicateSubseq!238 (List!31967 List!31967) Unit!45235)

(assert (=> b!1369224 (= lt!602220 (noDuplicateSubseq!238 newAcc!98 acc!866))))

(declare-fun b!1369225 () Bool)

(declare-fun res!912702 () Bool)

(assert (=> b!1369225 (=> (not res!912702) (not e!775653))))

(assert (=> b!1369225 (= res!912702 (not (contains!9649 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369226 () Bool)

(declare-fun res!912701 () Bool)

(assert (=> b!1369226 (=> (not res!912701) (not e!775653))))

(assert (=> b!1369226 (= res!912701 (not (contains!9649 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369227 () Bool)

(declare-fun res!912703 () Bool)

(assert (=> b!1369227 (=> (not res!912703) (not e!775653))))

(assert (=> b!1369227 (= res!912703 (not (contains!9649 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369228 () Bool)

(declare-fun res!912705 () Bool)

(assert (=> b!1369228 (=> (not res!912705) (not e!775653))))

(declare-fun noDuplicate!2506 (List!31967) Bool)

(assert (=> b!1369228 (= res!912705 (noDuplicate!2506 acc!866))))

(assert (= (and start!115806 res!912700) b!1369228))

(assert (= (and b!1369228 res!912705) b!1369225))

(assert (= (and b!1369225 res!912702) b!1369227))

(assert (= (and b!1369227 res!912703) b!1369226))

(assert (= (and b!1369226 res!912701) b!1369223))

(assert (= (and b!1369223 res!912706) b!1369222))

(assert (= (and b!1369222 res!912704) b!1369224))

(declare-fun m!1253047 () Bool)

(assert (=> b!1369222 m!1253047))

(declare-fun m!1253049 () Bool)

(assert (=> start!115806 m!1253049))

(declare-fun m!1253051 () Bool)

(assert (=> b!1369228 m!1253051))

(declare-fun m!1253053 () Bool)

(assert (=> b!1369226 m!1253053))

(declare-fun m!1253055 () Bool)

(assert (=> b!1369224 m!1253055))

(declare-fun m!1253057 () Bool)

(assert (=> b!1369224 m!1253057))

(declare-fun m!1253059 () Bool)

(assert (=> b!1369225 m!1253059))

(declare-fun m!1253061 () Bool)

(assert (=> b!1369227 m!1253061))

(declare-fun m!1253063 () Bool)

(assert (=> b!1369223 m!1253063))

(push 1)

(assert (not b!1369226))

(assert (not b!1369227))

(assert (not start!115806))

(assert (not b!1369222))

(assert (not b!1369223))

(assert (not b!1369224))

(assert (not b!1369225))

(assert (not b!1369228))

(check-sat)

