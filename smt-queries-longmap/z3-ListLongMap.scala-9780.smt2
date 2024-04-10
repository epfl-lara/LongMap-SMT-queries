; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115888 () Bool)

(assert start!115888)

(declare-fun b!1369969 () Bool)

(declare-fun res!913433 () Bool)

(declare-fun e!775975 () Bool)

(assert (=> b!1369969 (=> (not res!913433) (not e!775975))))

(declare-datatypes ((List!31990 0))(
  ( (Nil!31987) (Cons!31986 (h!33195 (_ BitVec 64)) (t!46684 List!31990)) )
))
(declare-fun acc!866 () List!31990)

(declare-fun noDuplicate!2529 (List!31990) Bool)

(assert (=> b!1369969 (= res!913433 (noDuplicate!2529 acc!866))))

(declare-fun b!1369970 () Bool)

(declare-fun res!913434 () Bool)

(assert (=> b!1369970 (=> (not res!913434) (not e!775975))))

(declare-fun contains!9672 (List!31990 (_ BitVec 64)) Bool)

(assert (=> b!1369970 (= res!913434 (not (contains!9672 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369971 () Bool)

(declare-fun res!913438 () Bool)

(declare-fun e!775973 () Bool)

(assert (=> b!1369971 (=> (not res!913438) (not e!775973))))

(declare-datatypes ((array!93002 0))(
  ( (array!93003 (arr!44922 (Array (_ BitVec 32) (_ BitVec 64))) (size!45472 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!93002)

(declare-fun from!3239 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1369971 (= res!913438 (validKeyInArray!0 (select (arr!44922 a!3861) from!3239)))))

(declare-fun b!1369972 () Bool)

(declare-fun res!913437 () Bool)

(assert (=> b!1369972 (=> (not res!913437) (not e!775973))))

(assert (=> b!1369972 (= res!913437 (bvslt from!3239 (size!45472 a!3861)))))

(declare-fun b!1369973 () Bool)

(declare-fun res!913431 () Bool)

(assert (=> b!1369973 (=> (not res!913431) (not e!775975))))

(assert (=> b!1369973 (= res!913431 (not (contains!9672 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369974 () Bool)

(assert (=> b!1369974 (= e!775975 e!775973)))

(declare-fun res!913435 () Bool)

(assert (=> b!1369974 (=> (not res!913435) (not e!775973))))

(declare-fun arrayNoDuplicates!0 (array!93002 (_ BitVec 32) List!31990) Bool)

(assert (=> b!1369974 (= res!913435 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45281 0))(
  ( (Unit!45282) )
))
(declare-fun lt!602368 () Unit!45281)

(declare-fun newAcc!98 () List!31990)

(declare-fun noDuplicateSubseq!261 (List!31990 List!31990) Unit!45281)

(assert (=> b!1369974 (= lt!602368 (noDuplicateSubseq!261 newAcc!98 acc!866))))

(declare-fun b!1369975 () Bool)

(declare-fun res!913429 () Bool)

(assert (=> b!1369975 (=> (not res!913429) (not e!775975))))

(declare-fun subseq!1074 (List!31990 List!31990) Bool)

(assert (=> b!1369975 (= res!913429 (subseq!1074 newAcc!98 acc!866))))

(declare-fun b!1369976 () Bool)

(assert (=> b!1369976 (= e!775973 false)))

(declare-fun lt!602367 () Bool)

(assert (=> b!1369976 (= lt!602367 (contains!9672 acc!866 (select (arr!44922 a!3861) from!3239)))))

(declare-fun b!1369977 () Bool)

(declare-fun res!913436 () Bool)

(assert (=> b!1369977 (=> (not res!913436) (not e!775975))))

(assert (=> b!1369977 (= res!913436 (not (contains!9672 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369978 () Bool)

(declare-fun res!913430 () Bool)

(assert (=> b!1369978 (=> (not res!913430) (not e!775975))))

(assert (=> b!1369978 (= res!913430 (not (contains!9672 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!913432 () Bool)

(assert (=> start!115888 (=> (not res!913432) (not e!775975))))

(assert (=> start!115888 (= res!913432 (and (bvslt (size!45472 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45472 a!3861))))))

(assert (=> start!115888 e!775975))

(declare-fun array_inv!33950 (array!93002) Bool)

(assert (=> start!115888 (array_inv!33950 a!3861)))

(assert (=> start!115888 true))

(assert (= (and start!115888 res!913432) b!1369969))

(assert (= (and b!1369969 res!913433) b!1369973))

(assert (= (and b!1369973 res!913431) b!1369970))

(assert (= (and b!1369970 res!913434) b!1369978))

(assert (= (and b!1369978 res!913430) b!1369977))

(assert (= (and b!1369977 res!913436) b!1369975))

(assert (= (and b!1369975 res!913429) b!1369974))

(assert (= (and b!1369974 res!913435) b!1369972))

(assert (= (and b!1369972 res!913437) b!1369971))

(assert (= (and b!1369971 res!913438) b!1369976))

(declare-fun m!1253641 () Bool)

(assert (=> b!1369974 m!1253641))

(declare-fun m!1253643 () Bool)

(assert (=> b!1369974 m!1253643))

(declare-fun m!1253645 () Bool)

(assert (=> b!1369975 m!1253645))

(declare-fun m!1253647 () Bool)

(assert (=> b!1369977 m!1253647))

(declare-fun m!1253649 () Bool)

(assert (=> start!115888 m!1253649))

(declare-fun m!1253651 () Bool)

(assert (=> b!1369969 m!1253651))

(declare-fun m!1253653 () Bool)

(assert (=> b!1369970 m!1253653))

(declare-fun m!1253655 () Bool)

(assert (=> b!1369976 m!1253655))

(assert (=> b!1369976 m!1253655))

(declare-fun m!1253657 () Bool)

(assert (=> b!1369976 m!1253657))

(assert (=> b!1369971 m!1253655))

(assert (=> b!1369971 m!1253655))

(declare-fun m!1253659 () Bool)

(assert (=> b!1369971 m!1253659))

(declare-fun m!1253661 () Bool)

(assert (=> b!1369973 m!1253661))

(declare-fun m!1253663 () Bool)

(assert (=> b!1369978 m!1253663))

(check-sat (not start!115888) (not b!1369977) (not b!1369971) (not b!1369974) (not b!1369975) (not b!1369973) (not b!1369969) (not b!1369970) (not b!1369976) (not b!1369978))
(check-sat)
