; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116254 () Bool)

(assert start!116254)

(declare-fun res!915831 () Bool)

(declare-fun e!777599 () Bool)

(assert (=> start!116254 (=> (not res!915831) (not e!777599))))

(declare-datatypes ((array!93030 0))(
  ( (array!93031 (arr!44926 (Array (_ BitVec 32) (_ BitVec 64))) (size!45478 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!93030)

(declare-fun from!3239 () (_ BitVec 32))

(assert (=> start!116254 (= res!915831 (and (bvslt (size!45478 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45478 a!3861))))))

(assert (=> start!116254 e!777599))

(declare-fun array_inv!34159 (array!93030) Bool)

(assert (=> start!116254 (array_inv!34159 a!3861)))

(assert (=> start!116254 true))

(declare-fun b!1372513 () Bool)

(declare-fun res!915825 () Bool)

(assert (=> b!1372513 (=> (not res!915825) (not e!777599))))

(declare-datatypes ((List!32072 0))(
  ( (Nil!32069) (Cons!32068 (h!33277 (_ BitVec 64)) (t!46758 List!32072)) )
))
(declare-fun acc!866 () List!32072)

(declare-fun contains!9665 (List!32072 (_ BitVec 64)) Bool)

(assert (=> b!1372513 (= res!915825 (not (contains!9665 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1372514 () Bool)

(declare-fun res!915826 () Bool)

(assert (=> b!1372514 (=> (not res!915826) (not e!777599))))

(declare-fun newAcc!98 () List!32072)

(assert (=> b!1372514 (= res!915826 (not (contains!9665 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1372515 () Bool)

(declare-fun res!915824 () Bool)

(declare-fun e!777600 () Bool)

(assert (=> b!1372515 (=> (not res!915824) (not e!777600))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1372515 (= res!915824 (not (validKeyInArray!0 (select (arr!44926 a!3861) from!3239))))))

(declare-fun b!1372516 () Bool)

(declare-fun res!915833 () Bool)

(assert (=> b!1372516 (=> (not res!915833) (not e!777599))))

(declare-fun subseq!1103 (List!32072 List!32072) Bool)

(assert (=> b!1372516 (= res!915833 (subseq!1103 newAcc!98 acc!866))))

(declare-fun b!1372517 () Bool)

(declare-fun res!915832 () Bool)

(assert (=> b!1372517 (=> (not res!915832) (not e!777599))))

(assert (=> b!1372517 (= res!915832 (not (contains!9665 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1372518 () Bool)

(assert (=> b!1372518 (= e!777599 e!777600)))

(declare-fun res!915828 () Bool)

(assert (=> b!1372518 (=> (not res!915828) (not e!777600))))

(declare-fun arrayNoDuplicates!0 (array!93030 (_ BitVec 32) List!32072) Bool)

(assert (=> b!1372518 (= res!915828 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45180 0))(
  ( (Unit!45181) )
))
(declare-fun lt!602706 () Unit!45180)

(declare-fun noDuplicateSubseq!290 (List!32072 List!32072) Unit!45180)

(assert (=> b!1372518 (= lt!602706 (noDuplicateSubseq!290 newAcc!98 acc!866))))

(declare-fun b!1372519 () Bool)

(declare-fun res!915830 () Bool)

(assert (=> b!1372519 (=> (not res!915830) (not e!777600))))

(assert (=> b!1372519 (= res!915830 (bvslt from!3239 (size!45478 a!3861)))))

(declare-fun b!1372520 () Bool)

(declare-fun res!915829 () Bool)

(assert (=> b!1372520 (=> (not res!915829) (not e!777599))))

(declare-fun noDuplicate!2580 (List!32072) Bool)

(assert (=> b!1372520 (= res!915829 (noDuplicate!2580 acc!866))))

(declare-fun b!1372521 () Bool)

(assert (=> b!1372521 (= e!777600 (bvslt (bvadd #b00000000000000000000000000000001 from!3239) #b00000000000000000000000000000000))))

(declare-fun b!1372522 () Bool)

(declare-fun res!915827 () Bool)

(assert (=> b!1372522 (=> (not res!915827) (not e!777599))))

(assert (=> b!1372522 (= res!915827 (not (contains!9665 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!116254 res!915831) b!1372520))

(assert (= (and b!1372520 res!915829) b!1372513))

(assert (= (and b!1372513 res!915825) b!1372522))

(assert (= (and b!1372522 res!915827) b!1372514))

(assert (= (and b!1372514 res!915826) b!1372517))

(assert (= (and b!1372517 res!915832) b!1372516))

(assert (= (and b!1372516 res!915833) b!1372518))

(assert (= (and b!1372518 res!915828) b!1372519))

(assert (= (and b!1372519 res!915830) b!1372515))

(assert (= (and b!1372515 res!915824) b!1372521))

(declare-fun m!1255479 () Bool)

(assert (=> start!116254 m!1255479))

(declare-fun m!1255481 () Bool)

(assert (=> b!1372518 m!1255481))

(declare-fun m!1255483 () Bool)

(assert (=> b!1372518 m!1255483))

(declare-fun m!1255485 () Bool)

(assert (=> b!1372513 m!1255485))

(declare-fun m!1255487 () Bool)

(assert (=> b!1372514 m!1255487))

(declare-fun m!1255489 () Bool)

(assert (=> b!1372516 m!1255489))

(declare-fun m!1255491 () Bool)

(assert (=> b!1372515 m!1255491))

(assert (=> b!1372515 m!1255491))

(declare-fun m!1255493 () Bool)

(assert (=> b!1372515 m!1255493))

(declare-fun m!1255495 () Bool)

(assert (=> b!1372522 m!1255495))

(declare-fun m!1255497 () Bool)

(assert (=> b!1372520 m!1255497))

(declare-fun m!1255499 () Bool)

(assert (=> b!1372517 m!1255499))

(check-sat (not b!1372514) (not b!1372520) (not b!1372515) (not start!116254) (not b!1372517) (not b!1372516) (not b!1372518) (not b!1372522) (not b!1372513))
(check-sat)
