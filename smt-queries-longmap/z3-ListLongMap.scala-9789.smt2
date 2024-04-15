; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116248 () Bool)

(assert start!116248)

(declare-fun b!1372444 () Bool)

(declare-fun res!915756 () Bool)

(declare-fun e!777578 () Bool)

(assert (=> b!1372444 (=> (not res!915756) (not e!777578))))

(declare-datatypes ((List!32069 0))(
  ( (Nil!32066) (Cons!32065 (h!33274 (_ BitVec 64)) (t!46755 List!32069)) )
))
(declare-fun newAcc!98 () List!32069)

(declare-fun acc!866 () List!32069)

(declare-fun subseq!1100 (List!32069 List!32069) Bool)

(assert (=> b!1372444 (= res!915756 (subseq!1100 newAcc!98 acc!866))))

(declare-fun b!1372445 () Bool)

(declare-fun res!915759 () Bool)

(assert (=> b!1372445 (=> (not res!915759) (not e!777578))))

(declare-fun contains!9662 (List!32069 (_ BitVec 64)) Bool)

(assert (=> b!1372445 (= res!915759 (not (contains!9662 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1372446 () Bool)

(declare-fun res!915760 () Bool)

(assert (=> b!1372446 (=> (not res!915760) (not e!777578))))

(assert (=> b!1372446 (= res!915760 (not (contains!9662 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1372447 () Bool)

(declare-fun res!915755 () Bool)

(assert (=> b!1372447 (=> (not res!915755) (not e!777578))))

(assert (=> b!1372447 (= res!915755 (not (contains!9662 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1372448 () Bool)

(declare-fun res!915758 () Bool)

(assert (=> b!1372448 (=> (not res!915758) (not e!777578))))

(declare-fun noDuplicate!2577 (List!32069) Bool)

(assert (=> b!1372448 (= res!915758 (noDuplicate!2577 acc!866))))

(declare-fun b!1372449 () Bool)

(declare-fun res!915757 () Bool)

(assert (=> b!1372449 (=> (not res!915757) (not e!777578))))

(assert (=> b!1372449 (= res!915757 (not (contains!9662 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!915761 () Bool)

(assert (=> start!116248 (=> (not res!915761) (not e!777578))))

(declare-datatypes ((array!93024 0))(
  ( (array!93025 (arr!44923 (Array (_ BitVec 32) (_ BitVec 64))) (size!45475 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!93024)

(declare-fun from!3239 () (_ BitVec 32))

(assert (=> start!116248 (= res!915761 (and (bvslt (size!45475 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45475 a!3861))))))

(assert (=> start!116248 e!777578))

(declare-fun array_inv!34156 (array!93024) Bool)

(assert (=> start!116248 (array_inv!34156 a!3861)))

(assert (=> start!116248 true))

(declare-fun b!1372450 () Bool)

(assert (=> b!1372450 (= e!777578 false)))

(declare-fun lt!602690 () Bool)

(declare-fun arrayNoDuplicates!0 (array!93024 (_ BitVec 32) List!32069) Bool)

(assert (=> b!1372450 (= lt!602690 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45174 0))(
  ( (Unit!45175) )
))
(declare-fun lt!602691 () Unit!45174)

(declare-fun noDuplicateSubseq!287 (List!32069 List!32069) Unit!45174)

(assert (=> b!1372450 (= lt!602691 (noDuplicateSubseq!287 newAcc!98 acc!866))))

(assert (= (and start!116248 res!915761) b!1372448))

(assert (= (and b!1372448 res!915758) b!1372447))

(assert (= (and b!1372447 res!915755) b!1372449))

(assert (= (and b!1372449 res!915757) b!1372445))

(assert (= (and b!1372445 res!915759) b!1372446))

(assert (= (and b!1372446 res!915760) b!1372444))

(assert (= (and b!1372444 res!915756) b!1372450))

(declare-fun m!1255425 () Bool)

(assert (=> b!1372448 m!1255425))

(declare-fun m!1255427 () Bool)

(assert (=> b!1372447 m!1255427))

(declare-fun m!1255429 () Bool)

(assert (=> b!1372444 m!1255429))

(declare-fun m!1255431 () Bool)

(assert (=> b!1372449 m!1255431))

(declare-fun m!1255433 () Bool)

(assert (=> start!116248 m!1255433))

(declare-fun m!1255435 () Bool)

(assert (=> b!1372450 m!1255435))

(declare-fun m!1255437 () Bool)

(assert (=> b!1372450 m!1255437))

(declare-fun m!1255439 () Bool)

(assert (=> b!1372446 m!1255439))

(declare-fun m!1255441 () Bool)

(assert (=> b!1372445 m!1255441))

(check-sat (not b!1372449) (not b!1372444) (not b!1372447) (not b!1372448) (not b!1372446) (not b!1372450) (not b!1372445) (not start!116248))
(check-sat)
