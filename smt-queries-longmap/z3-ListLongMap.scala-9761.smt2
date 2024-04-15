; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115678 () Bool)

(assert start!115678)

(declare-fun b!1367811 () Bool)

(declare-fun e!775147 () Bool)

(declare-fun e!775148 () Bool)

(assert (=> b!1367811 (= e!775147 e!775148)))

(declare-fun res!911371 () Bool)

(assert (=> b!1367811 (=> (not res!911371) (not e!775148))))

(declare-datatypes ((array!92829 0))(
  ( (array!92830 (arr!44839 (Array (_ BitVec 32) (_ BitVec 64))) (size!45391 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92829)

(declare-fun from!3239 () (_ BitVec 32))

(declare-datatypes ((List!31985 0))(
  ( (Nil!31982) (Cons!31981 (h!33190 (_ BitVec 64)) (t!46671 List!31985)) )
))
(declare-fun acc!866 () List!31985)

(declare-fun arrayNoDuplicates!0 (array!92829 (_ BitVec 32) List!31985) Bool)

(assert (=> b!1367811 (= res!911371 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45006 0))(
  ( (Unit!45007) )
))
(declare-fun lt!601778 () Unit!45006)

(declare-fun newAcc!98 () List!31985)

(declare-fun noDuplicateSubseq!203 (List!31985 List!31985) Unit!45006)

(assert (=> b!1367811 (= lt!601778 (noDuplicateSubseq!203 newAcc!98 acc!866))))

(declare-fun b!1367812 () Bool)

(assert (=> b!1367812 (= e!775148 false)))

(declare-fun lt!601779 () Bool)

(assert (=> b!1367812 (= lt!601779 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) acc!866))))

(declare-fun b!1367813 () Bool)

(declare-fun res!911370 () Bool)

(assert (=> b!1367813 (=> (not res!911370) (not e!775148))))

(assert (=> b!1367813 (= res!911370 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) #b00000000000000000000000000000000))))

(declare-fun b!1367814 () Bool)

(declare-fun res!911365 () Bool)

(assert (=> b!1367814 (=> (not res!911365) (not e!775147))))

(declare-fun contains!9578 (List!31985 (_ BitVec 64)) Bool)

(assert (=> b!1367814 (= res!911365 (not (contains!9578 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1367815 () Bool)

(declare-fun res!911362 () Bool)

(assert (=> b!1367815 (=> (not res!911362) (not e!775147))))

(declare-fun subseq!1016 (List!31985 List!31985) Bool)

(assert (=> b!1367815 (= res!911362 (subseq!1016 newAcc!98 acc!866))))

(declare-fun b!1367816 () Bool)

(declare-fun res!911364 () Bool)

(assert (=> b!1367816 (=> (not res!911364) (not e!775147))))

(assert (=> b!1367816 (= res!911364 (not (contains!9578 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1367817 () Bool)

(declare-fun res!911372 () Bool)

(assert (=> b!1367817 (=> (not res!911372) (not e!775148))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1367817 (= res!911372 (not (validKeyInArray!0 (select (arr!44839 a!3861) from!3239))))))

(declare-fun b!1367818 () Bool)

(declare-fun res!911369 () Bool)

(assert (=> b!1367818 (=> (not res!911369) (not e!775147))))

(assert (=> b!1367818 (= res!911369 (not (contains!9578 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1367819 () Bool)

(declare-fun res!911368 () Bool)

(assert (=> b!1367819 (=> (not res!911368) (not e!775148))))

(assert (=> b!1367819 (= res!911368 (bvslt from!3239 (size!45391 a!3861)))))

(declare-fun res!911367 () Bool)

(assert (=> start!115678 (=> (not res!911367) (not e!775147))))

(assert (=> start!115678 (= res!911367 (and (bvslt (size!45391 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45391 a!3861))))))

(assert (=> start!115678 e!775147))

(declare-fun array_inv!34072 (array!92829) Bool)

(assert (=> start!115678 (array_inv!34072 a!3861)))

(assert (=> start!115678 true))

(declare-fun b!1367820 () Bool)

(declare-fun res!911366 () Bool)

(assert (=> b!1367820 (=> (not res!911366) (not e!775147))))

(declare-fun noDuplicate!2493 (List!31985) Bool)

(assert (=> b!1367820 (= res!911366 (noDuplicate!2493 acc!866))))

(declare-fun b!1367821 () Bool)

(declare-fun res!911363 () Bool)

(assert (=> b!1367821 (=> (not res!911363) (not e!775147))))

(assert (=> b!1367821 (= res!911363 (not (contains!9578 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!115678 res!911367) b!1367820))

(assert (= (and b!1367820 res!911366) b!1367816))

(assert (= (and b!1367816 res!911364) b!1367818))

(assert (= (and b!1367818 res!911369) b!1367814))

(assert (= (and b!1367814 res!911365) b!1367821))

(assert (= (and b!1367821 res!911363) b!1367815))

(assert (= (and b!1367815 res!911362) b!1367811))

(assert (= (and b!1367811 res!911371) b!1367819))

(assert (= (and b!1367819 res!911368) b!1367817))

(assert (= (and b!1367817 res!911372) b!1367813))

(assert (= (and b!1367813 res!911370) b!1367812))

(declare-fun m!1251477 () Bool)

(assert (=> b!1367816 m!1251477))

(declare-fun m!1251479 () Bool)

(assert (=> b!1367811 m!1251479))

(declare-fun m!1251481 () Bool)

(assert (=> b!1367811 m!1251481))

(declare-fun m!1251483 () Bool)

(assert (=> b!1367820 m!1251483))

(declare-fun m!1251485 () Bool)

(assert (=> b!1367821 m!1251485))

(declare-fun m!1251487 () Bool)

(assert (=> b!1367814 m!1251487))

(declare-fun m!1251489 () Bool)

(assert (=> start!115678 m!1251489))

(declare-fun m!1251491 () Bool)

(assert (=> b!1367812 m!1251491))

(declare-fun m!1251493 () Bool)

(assert (=> b!1367817 m!1251493))

(assert (=> b!1367817 m!1251493))

(declare-fun m!1251495 () Bool)

(assert (=> b!1367817 m!1251495))

(declare-fun m!1251497 () Bool)

(assert (=> b!1367818 m!1251497))

(declare-fun m!1251499 () Bool)

(assert (=> b!1367815 m!1251499))

(check-sat (not b!1367818) (not b!1367817) (not b!1367820) (not b!1367812) (not b!1367814) (not b!1367816) (not start!115678) (not b!1367815) (not b!1367811) (not b!1367821))
(check-sat)
