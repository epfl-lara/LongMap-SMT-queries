; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115918 () Bool)

(assert start!115918)

(declare-fun b!1369281 () Bool)

(declare-fun res!912016 () Bool)

(declare-fun e!776053 () Bool)

(assert (=> b!1369281 (=> (not res!912016) (not e!776053))))

(declare-datatypes ((List!31975 0))(
  ( (Nil!31972) (Cons!31971 (h!33189 (_ BitVec 64)) (t!46661 List!31975)) )
))
(declare-fun acc!866 () List!31975)

(declare-fun contains!9660 (List!31975 (_ BitVec 64)) Bool)

(assert (=> b!1369281 (= res!912016 (not (contains!9660 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369283 () Bool)

(declare-fun res!912010 () Bool)

(assert (=> b!1369283 (=> (not res!912010) (not e!776053))))

(declare-fun newAcc!98 () List!31975)

(assert (=> b!1369283 (= res!912010 (not (contains!9660 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369284 () Bool)

(declare-fun res!912011 () Bool)

(declare-fun e!776052 () Bool)

(assert (=> b!1369284 (=> (not res!912011) (not e!776052))))

(declare-fun from!3239 () (_ BitVec 32))

(declare-datatypes ((array!93001 0))(
  ( (array!93002 (arr!44920 (Array (_ BitVec 32) (_ BitVec 64))) (size!45471 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!93001)

(assert (=> b!1369284 (= res!912011 (bvslt from!3239 (size!45471 a!3861)))))

(declare-fun b!1369285 () Bool)

(declare-fun res!912012 () Bool)

(assert (=> b!1369285 (=> (not res!912012) (not e!776053))))

(assert (=> b!1369285 (= res!912012 (not (contains!9660 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369286 () Bool)

(declare-fun res!912018 () Bool)

(assert (=> b!1369286 (=> (not res!912018) (not e!776053))))

(assert (=> b!1369286 (= res!912018 (not (contains!9660 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369287 () Bool)

(declare-fun res!912017 () Bool)

(assert (=> b!1369287 (=> (not res!912017) (not e!776053))))

(declare-fun noDuplicate!2491 (List!31975) Bool)

(assert (=> b!1369287 (= res!912017 (noDuplicate!2491 acc!866))))

(declare-fun res!912013 () Bool)

(assert (=> start!115918 (=> (not res!912013) (not e!776053))))

(assert (=> start!115918 (= res!912013 (and (bvslt (size!45471 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45471 a!3861))))))

(assert (=> start!115918 e!776053))

(declare-fun array_inv!34201 (array!93001) Bool)

(assert (=> start!115918 (array_inv!34201 a!3861)))

(assert (=> start!115918 true))

(declare-fun b!1369282 () Bool)

(declare-fun res!912008 () Bool)

(assert (=> b!1369282 (=> (not res!912008) (not e!776052))))

(assert (=> b!1369282 (= res!912008 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) #b00000000000000000000000000000000))))

(declare-fun b!1369288 () Bool)

(declare-fun res!912014 () Bool)

(assert (=> b!1369288 (=> (not res!912014) (not e!776053))))

(declare-fun subseq!1019 (List!31975 List!31975) Bool)

(assert (=> b!1369288 (= res!912014 (subseq!1019 newAcc!98 acc!866))))

(declare-fun b!1369289 () Bool)

(assert (=> b!1369289 (= e!776052 false)))

(declare-fun lt!602460 () Bool)

(declare-fun arrayNoDuplicates!0 (array!93001 (_ BitVec 32) List!31975) Bool)

(assert (=> b!1369289 (= lt!602460 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) acc!866))))

(declare-fun b!1369290 () Bool)

(declare-fun res!912009 () Bool)

(assert (=> b!1369290 (=> (not res!912009) (not e!776052))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1369290 (= res!912009 (not (validKeyInArray!0 (select (arr!44920 a!3861) from!3239))))))

(declare-fun b!1369291 () Bool)

(assert (=> b!1369291 (= e!776053 e!776052)))

(declare-fun res!912015 () Bool)

(assert (=> b!1369291 (=> (not res!912015) (not e!776052))))

(assert (=> b!1369291 (= res!912015 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45110 0))(
  ( (Unit!45111) )
))
(declare-fun lt!602459 () Unit!45110)

(declare-fun noDuplicateSubseq!206 (List!31975 List!31975) Unit!45110)

(assert (=> b!1369291 (= lt!602459 (noDuplicateSubseq!206 newAcc!98 acc!866))))

(assert (= (and start!115918 res!912013) b!1369287))

(assert (= (and b!1369287 res!912017) b!1369285))

(assert (= (and b!1369285 res!912012) b!1369281))

(assert (= (and b!1369281 res!912016) b!1369283))

(assert (= (and b!1369283 res!912010) b!1369286))

(assert (= (and b!1369286 res!912018) b!1369288))

(assert (= (and b!1369288 res!912014) b!1369291))

(assert (= (and b!1369291 res!912015) b!1369284))

(assert (= (and b!1369284 res!912011) b!1369290))

(assert (= (and b!1369290 res!912009) b!1369282))

(assert (= (and b!1369282 res!912008) b!1369289))

(declare-fun m!1253671 () Bool)

(assert (=> start!115918 m!1253671))

(declare-fun m!1253673 () Bool)

(assert (=> b!1369290 m!1253673))

(assert (=> b!1369290 m!1253673))

(declare-fun m!1253675 () Bool)

(assert (=> b!1369290 m!1253675))

(declare-fun m!1253677 () Bool)

(assert (=> b!1369281 m!1253677))

(declare-fun m!1253679 () Bool)

(assert (=> b!1369289 m!1253679))

(declare-fun m!1253681 () Bool)

(assert (=> b!1369287 m!1253681))

(declare-fun m!1253683 () Bool)

(assert (=> b!1369291 m!1253683))

(declare-fun m!1253685 () Bool)

(assert (=> b!1369291 m!1253685))

(declare-fun m!1253687 () Bool)

(assert (=> b!1369285 m!1253687))

(declare-fun m!1253689 () Bool)

(assert (=> b!1369283 m!1253689))

(declare-fun m!1253691 () Bool)

(assert (=> b!1369288 m!1253691))

(declare-fun m!1253693 () Bool)

(assert (=> b!1369286 m!1253693))

(check-sat (not b!1369281) (not b!1369290) (not b!1369285) (not start!115918) (not b!1369291) (not b!1369286) (not b!1369283) (not b!1369288) (not b!1369289) (not b!1369287))
(check-sat)
