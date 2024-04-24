; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116020 () Bool)

(assert start!116020)

(declare-fun b!1370381 () Bool)

(declare-fun res!913081 () Bool)

(declare-fun e!776460 () Bool)

(assert (=> b!1370381 (=> (not res!913081) (not e!776460))))

(declare-datatypes ((array!93058 0))(
  ( (array!93059 (arr!44947 (Array (_ BitVec 32) (_ BitVec 64))) (size!45498 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!93058)

(declare-fun from!3239 () (_ BitVec 32))

(declare-datatypes ((List!32002 0))(
  ( (Nil!31999) (Cons!31998 (h!33216 (_ BitVec 64)) (t!46688 List!32002)) )
))
(declare-fun acc!866 () List!32002)

(declare-fun arrayNoDuplicates!0 (array!93058 (_ BitVec 32) List!32002) Bool)

(assert (=> b!1370381 (= res!913081 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) acc!866))))

(declare-fun b!1370382 () Bool)

(declare-fun res!913078 () Bool)

(declare-fun e!776459 () Bool)

(assert (=> b!1370382 (=> (not res!913078) (not e!776459))))

(declare-fun newAcc!98 () List!32002)

(declare-fun subseq!1046 (List!32002 List!32002) Bool)

(assert (=> b!1370382 (= res!913078 (subseq!1046 newAcc!98 acc!866))))

(declare-fun b!1370383 () Bool)

(assert (=> b!1370383 (= e!776459 e!776460)))

(declare-fun res!913086 () Bool)

(assert (=> b!1370383 (=> (not res!913086) (not e!776460))))

(assert (=> b!1370383 (= res!913086 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45164 0))(
  ( (Unit!45165) )
))
(declare-fun lt!602661 () Unit!45164)

(declare-fun noDuplicateSubseq!233 (List!32002 List!32002) Unit!45164)

(assert (=> b!1370383 (= lt!602661 (noDuplicateSubseq!233 newAcc!98 acc!866))))

(declare-fun b!1370384 () Bool)

(declare-fun res!913079 () Bool)

(assert (=> b!1370384 (=> (not res!913079) (not e!776460))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1370384 (= res!913079 (not (validKeyInArray!0 (select (arr!44947 a!3861) from!3239))))))

(declare-fun b!1370385 () Bool)

(declare-fun res!913083 () Bool)

(assert (=> b!1370385 (=> (not res!913083) (not e!776460))))

(assert (=> b!1370385 (= res!913083 (bvslt from!3239 (size!45498 a!3861)))))

(declare-fun b!1370386 () Bool)

(assert (=> b!1370386 (= e!776460 (not true))))

(declare-fun lt!602659 () Bool)

(declare-fun noDuplicate!2518 (List!32002) Bool)

(assert (=> b!1370386 (= lt!602659 (noDuplicate!2518 newAcc!98))))

(assert (=> b!1370386 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) newAcc!98)))

(declare-fun lt!602660 () Unit!45164)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!93058 List!32002 List!32002 (_ BitVec 32)) Unit!45164)

(assert (=> b!1370386 (= lt!602660 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3861 acc!866 newAcc!98 (bvadd #b00000000000000000000000000000001 from!3239)))))

(declare-fun b!1370387 () Bool)

(declare-fun res!913080 () Bool)

(assert (=> b!1370387 (=> (not res!913080) (not e!776459))))

(declare-fun contains!9687 (List!32002 (_ BitVec 64)) Bool)

(assert (=> b!1370387 (= res!913080 (not (contains!9687 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!913082 () Bool)

(assert (=> start!116020 (=> (not res!913082) (not e!776459))))

(assert (=> start!116020 (= res!913082 (and (bvslt (size!45498 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45498 a!3861))))))

(assert (=> start!116020 e!776459))

(declare-fun array_inv!34228 (array!93058) Bool)

(assert (=> start!116020 (array_inv!34228 a!3861)))

(assert (=> start!116020 true))

(declare-fun b!1370388 () Bool)

(declare-fun res!913087 () Bool)

(assert (=> b!1370388 (=> (not res!913087) (not e!776459))))

(assert (=> b!1370388 (= res!913087 (not (contains!9687 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1370389 () Bool)

(declare-fun res!913085 () Bool)

(assert (=> b!1370389 (=> (not res!913085) (not e!776459))))

(assert (=> b!1370389 (= res!913085 (not (contains!9687 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1370390 () Bool)

(declare-fun res!913089 () Bool)

(assert (=> b!1370390 (=> (not res!913089) (not e!776459))))

(assert (=> b!1370390 (= res!913089 (noDuplicate!2518 acc!866))))

(declare-fun b!1370391 () Bool)

(declare-fun res!913084 () Bool)

(assert (=> b!1370391 (=> (not res!913084) (not e!776460))))

(assert (=> b!1370391 (= res!913084 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) #b00000000000000000000000000000000))))

(declare-fun b!1370392 () Bool)

(declare-fun res!913088 () Bool)

(assert (=> b!1370392 (=> (not res!913088) (not e!776459))))

(assert (=> b!1370392 (= res!913088 (not (contains!9687 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!116020 res!913082) b!1370390))

(assert (= (and b!1370390 res!913089) b!1370389))

(assert (= (and b!1370389 res!913085) b!1370387))

(assert (= (and b!1370387 res!913080) b!1370388))

(assert (= (and b!1370388 res!913087) b!1370392))

(assert (= (and b!1370392 res!913088) b!1370382))

(assert (= (and b!1370382 res!913078) b!1370383))

(assert (= (and b!1370383 res!913086) b!1370385))

(assert (= (and b!1370385 res!913083) b!1370384))

(assert (= (and b!1370384 res!913079) b!1370391))

(assert (= (and b!1370391 res!913084) b!1370381))

(assert (= (and b!1370381 res!913081) b!1370386))

(declare-fun m!1254517 () Bool)

(assert (=> b!1370383 m!1254517))

(declare-fun m!1254519 () Bool)

(assert (=> b!1370383 m!1254519))

(declare-fun m!1254521 () Bool)

(assert (=> b!1370388 m!1254521))

(declare-fun m!1254523 () Bool)

(assert (=> b!1370381 m!1254523))

(declare-fun m!1254525 () Bool)

(assert (=> b!1370386 m!1254525))

(declare-fun m!1254527 () Bool)

(assert (=> b!1370386 m!1254527))

(declare-fun m!1254529 () Bool)

(assert (=> b!1370386 m!1254529))

(declare-fun m!1254531 () Bool)

(assert (=> b!1370392 m!1254531))

(declare-fun m!1254533 () Bool)

(assert (=> b!1370384 m!1254533))

(assert (=> b!1370384 m!1254533))

(declare-fun m!1254535 () Bool)

(assert (=> b!1370384 m!1254535))

(declare-fun m!1254537 () Bool)

(assert (=> b!1370389 m!1254537))

(declare-fun m!1254539 () Bool)

(assert (=> b!1370390 m!1254539))

(declare-fun m!1254541 () Bool)

(assert (=> start!116020 m!1254541))

(declare-fun m!1254543 () Bool)

(assert (=> b!1370387 m!1254543))

(declare-fun m!1254545 () Bool)

(assert (=> b!1370382 m!1254545))

(check-sat (not b!1370383) (not b!1370388) (not b!1370389) (not b!1370381) (not b!1370387) (not start!116020) (not b!1370390) (not b!1370384) (not b!1370382) (not b!1370392) (not b!1370386))
(check-sat)
