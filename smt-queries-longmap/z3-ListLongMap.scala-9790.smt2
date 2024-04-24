; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116488 () Bool)

(assert start!116488)

(declare-fun b!1373884 () Bool)

(declare-fun res!916372 () Bool)

(declare-fun e!778476 () Bool)

(assert (=> b!1373884 (=> (not res!916372) (not e!778476))))

(declare-datatypes ((array!93196 0))(
  ( (array!93197 (arr!45004 (Array (_ BitVec 32) (_ BitVec 64))) (size!45555 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!93196)

(declare-fun from!3239 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1373884 (= res!916372 (not (validKeyInArray!0 (select (arr!45004 a!3861) from!3239))))))

(declare-fun b!1373885 () Bool)

(declare-fun res!916374 () Bool)

(declare-fun e!778475 () Bool)

(assert (=> b!1373885 (=> (not res!916374) (not e!778475))))

(declare-datatypes ((List!32059 0))(
  ( (Nil!32056) (Cons!32055 (h!33273 (_ BitVec 64)) (t!46745 List!32059)) )
))
(declare-fun acc!866 () List!32059)

(declare-fun noDuplicate!2575 (List!32059) Bool)

(assert (=> b!1373885 (= res!916374 (noDuplicate!2575 acc!866))))

(declare-fun b!1373886 () Bool)

(declare-fun res!916375 () Bool)

(assert (=> b!1373886 (=> (not res!916375) (not e!778475))))

(declare-fun contains!9744 (List!32059 (_ BitVec 64)) Bool)

(assert (=> b!1373886 (= res!916375 (not (contains!9744 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1373887 () Bool)

(declare-fun res!916373 () Bool)

(assert (=> b!1373887 (=> (not res!916373) (not e!778475))))

(declare-fun newAcc!98 () List!32059)

(assert (=> b!1373887 (= res!916373 (not (contains!9744 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1373888 () Bool)

(assert (=> b!1373888 (= e!778476 (bvslt (bvadd #b00000000000000000000000000000001 from!3239) #b00000000000000000000000000000000))))

(declare-fun res!916378 () Bool)

(assert (=> start!116488 (=> (not res!916378) (not e!778475))))

(assert (=> start!116488 (= res!916378 (and (bvslt (size!45555 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45555 a!3861))))))

(assert (=> start!116488 e!778475))

(declare-fun array_inv!34285 (array!93196) Bool)

(assert (=> start!116488 (array_inv!34285 a!3861)))

(assert (=> start!116488 true))

(declare-fun b!1373889 () Bool)

(declare-fun res!916377 () Bool)

(assert (=> b!1373889 (=> (not res!916377) (not e!778475))))

(assert (=> b!1373889 (= res!916377 (not (contains!9744 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1373890 () Bool)

(declare-fun res!916380 () Bool)

(assert (=> b!1373890 (=> (not res!916380) (not e!778476))))

(assert (=> b!1373890 (= res!916380 (bvslt from!3239 (size!45555 a!3861)))))

(declare-fun b!1373891 () Bool)

(declare-fun res!916379 () Bool)

(assert (=> b!1373891 (=> (not res!916379) (not e!778475))))

(declare-fun subseq!1103 (List!32059 List!32059) Bool)

(assert (=> b!1373891 (= res!916379 (subseq!1103 newAcc!98 acc!866))))

(declare-fun b!1373892 () Bool)

(assert (=> b!1373892 (= e!778475 e!778476)))

(declare-fun res!916376 () Bool)

(assert (=> b!1373892 (=> (not res!916376) (not e!778476))))

(declare-fun arrayNoDuplicates!0 (array!93196 (_ BitVec 32) List!32059) Bool)

(assert (=> b!1373892 (= res!916376 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45278 0))(
  ( (Unit!45279) )
))
(declare-fun lt!603369 () Unit!45278)

(declare-fun noDuplicateSubseq!290 (List!32059 List!32059) Unit!45278)

(assert (=> b!1373892 (= lt!603369 (noDuplicateSubseq!290 newAcc!98 acc!866))))

(declare-fun b!1373893 () Bool)

(declare-fun res!916371 () Bool)

(assert (=> b!1373893 (=> (not res!916371) (not e!778475))))

(assert (=> b!1373893 (= res!916371 (not (contains!9744 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!116488 res!916378) b!1373885))

(assert (= (and b!1373885 res!916374) b!1373893))

(assert (= (and b!1373893 res!916371) b!1373886))

(assert (= (and b!1373886 res!916375) b!1373887))

(assert (= (and b!1373887 res!916373) b!1373889))

(assert (= (and b!1373889 res!916377) b!1373891))

(assert (= (and b!1373891 res!916379) b!1373892))

(assert (= (and b!1373892 res!916376) b!1373890))

(assert (= (and b!1373890 res!916380) b!1373884))

(assert (= (and b!1373884 res!916372) b!1373888))

(declare-fun m!1257601 () Bool)

(assert (=> b!1373884 m!1257601))

(assert (=> b!1373884 m!1257601))

(declare-fun m!1257603 () Bool)

(assert (=> b!1373884 m!1257603))

(declare-fun m!1257605 () Bool)

(assert (=> b!1373887 m!1257605))

(declare-fun m!1257607 () Bool)

(assert (=> b!1373886 m!1257607))

(declare-fun m!1257609 () Bool)

(assert (=> b!1373891 m!1257609))

(declare-fun m!1257611 () Bool)

(assert (=> b!1373889 m!1257611))

(declare-fun m!1257613 () Bool)

(assert (=> b!1373893 m!1257613))

(declare-fun m!1257615 () Bool)

(assert (=> start!116488 m!1257615))

(declare-fun m!1257617 () Bool)

(assert (=> b!1373892 m!1257617))

(declare-fun m!1257619 () Bool)

(assert (=> b!1373892 m!1257619))

(declare-fun m!1257621 () Bool)

(assert (=> b!1373885 m!1257621))

(check-sat (not b!1373884) (not b!1373887) (not b!1373889) (not b!1373892) (not b!1373893) (not start!116488) (not b!1373891) (not b!1373885) (not b!1373886))
(check-sat)
