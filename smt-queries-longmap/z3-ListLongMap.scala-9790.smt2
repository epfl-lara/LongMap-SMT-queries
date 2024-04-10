; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116266 () Bool)

(assert start!116266)

(declare-fun b!1372615 () Bool)

(declare-fun e!777642 () Bool)

(declare-fun from!3239 () (_ BitVec 32))

(assert (=> b!1372615 (= e!777642 (bvslt (bvadd #b00000000000000000000000000000001 from!3239) #b00000000000000000000000000000000))))

(declare-fun b!1372616 () Bool)

(declare-fun res!915884 () Bool)

(declare-fun e!777643 () Bool)

(assert (=> b!1372616 (=> (not res!915884) (not e!777643))))

(declare-datatypes ((List!32020 0))(
  ( (Nil!32017) (Cons!32016 (h!33225 (_ BitVec 64)) (t!46714 List!32020)) )
))
(declare-fun newAcc!98 () List!32020)

(declare-fun acc!866 () List!32020)

(declare-fun subseq!1104 (List!32020 List!32020) Bool)

(assert (=> b!1372616 (= res!915884 (subseq!1104 newAcc!98 acc!866))))

(declare-fun res!915889 () Bool)

(assert (=> start!116266 (=> (not res!915889) (not e!777643))))

(declare-datatypes ((array!93083 0))(
  ( (array!93084 (arr!44952 (Array (_ BitVec 32) (_ BitVec 64))) (size!45502 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!93083)

(assert (=> start!116266 (= res!915889 (and (bvslt (size!45502 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45502 a!3861))))))

(assert (=> start!116266 e!777643))

(declare-fun array_inv!33980 (array!93083) Bool)

(assert (=> start!116266 (array_inv!33980 a!3861)))

(assert (=> start!116266 true))

(declare-fun b!1372617 () Bool)

(assert (=> b!1372617 (= e!777643 e!777642)))

(declare-fun res!915886 () Bool)

(assert (=> b!1372617 (=> (not res!915886) (not e!777642))))

(declare-fun arrayNoDuplicates!0 (array!93083 (_ BitVec 32) List!32020) Bool)

(assert (=> b!1372617 (= res!915886 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45341 0))(
  ( (Unit!45342) )
))
(declare-fun lt!602896 () Unit!45341)

(declare-fun noDuplicateSubseq!291 (List!32020 List!32020) Unit!45341)

(assert (=> b!1372617 (= lt!602896 (noDuplicateSubseq!291 newAcc!98 acc!866))))

(declare-fun b!1372618 () Bool)

(declare-fun res!915892 () Bool)

(assert (=> b!1372618 (=> (not res!915892) (not e!777643))))

(declare-fun contains!9702 (List!32020 (_ BitVec 64)) Bool)

(assert (=> b!1372618 (= res!915892 (not (contains!9702 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1372619 () Bool)

(declare-fun res!915891 () Bool)

(assert (=> b!1372619 (=> (not res!915891) (not e!777643))))

(assert (=> b!1372619 (= res!915891 (not (contains!9702 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1372620 () Bool)

(declare-fun res!915883 () Bool)

(assert (=> b!1372620 (=> (not res!915883) (not e!777643))))

(assert (=> b!1372620 (= res!915883 (not (contains!9702 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1372621 () Bool)

(declare-fun res!915885 () Bool)

(assert (=> b!1372621 (=> (not res!915885) (not e!777643))))

(declare-fun noDuplicate!2559 (List!32020) Bool)

(assert (=> b!1372621 (= res!915885 (noDuplicate!2559 acc!866))))

(declare-fun b!1372622 () Bool)

(declare-fun res!915890 () Bool)

(assert (=> b!1372622 (=> (not res!915890) (not e!777642))))

(assert (=> b!1372622 (= res!915890 (bvslt from!3239 (size!45502 a!3861)))))

(declare-fun b!1372623 () Bool)

(declare-fun res!915888 () Bool)

(assert (=> b!1372623 (=> (not res!915888) (not e!777642))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1372623 (= res!915888 (not (validKeyInArray!0 (select (arr!44952 a!3861) from!3239))))))

(declare-fun b!1372624 () Bool)

(declare-fun res!915887 () Bool)

(assert (=> b!1372624 (=> (not res!915887) (not e!777643))))

(assert (=> b!1372624 (= res!915887 (not (contains!9702 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!116266 res!915889) b!1372621))

(assert (= (and b!1372621 res!915885) b!1372624))

(assert (= (and b!1372624 res!915887) b!1372620))

(assert (= (and b!1372620 res!915883) b!1372618))

(assert (= (and b!1372618 res!915892) b!1372619))

(assert (= (and b!1372619 res!915891) b!1372616))

(assert (= (and b!1372616 res!915884) b!1372617))

(assert (= (and b!1372617 res!915886) b!1372622))

(assert (= (and b!1372622 res!915890) b!1372623))

(assert (= (and b!1372623 res!915888) b!1372615))

(declare-fun m!1256027 () Bool)

(assert (=> b!1372618 m!1256027))

(declare-fun m!1256029 () Bool)

(assert (=> b!1372616 m!1256029))

(declare-fun m!1256031 () Bool)

(assert (=> b!1372620 m!1256031))

(declare-fun m!1256033 () Bool)

(assert (=> b!1372619 m!1256033))

(declare-fun m!1256035 () Bool)

(assert (=> start!116266 m!1256035))

(declare-fun m!1256037 () Bool)

(assert (=> b!1372621 m!1256037))

(declare-fun m!1256039 () Bool)

(assert (=> b!1372617 m!1256039))

(declare-fun m!1256041 () Bool)

(assert (=> b!1372617 m!1256041))

(declare-fun m!1256043 () Bool)

(assert (=> b!1372624 m!1256043))

(declare-fun m!1256045 () Bool)

(assert (=> b!1372623 m!1256045))

(assert (=> b!1372623 m!1256045))

(declare-fun m!1256047 () Bool)

(assert (=> b!1372623 m!1256047))

(check-sat (not start!116266) (not b!1372617) (not b!1372618) (not b!1372624) (not b!1372616) (not b!1372623) (not b!1372621) (not b!1372620) (not b!1372619))
(check-sat)
