; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115618 () Bool)

(assert start!115618)

(declare-fun res!910809 () Bool)

(declare-fun e!774910 () Bool)

(assert (=> start!115618 (=> (not res!910809) (not e!774910))))

(declare-datatypes ((array!92849 0))(
  ( (array!92850 (arr!44850 (Array (_ BitVec 32) (_ BitVec 64))) (size!45400 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92849)

(declare-fun from!3239 () (_ BitVec 32))

(assert (=> start!115618 (= res!910809 (and (bvslt (size!45400 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45400 a!3861))))))

(assert (=> start!115618 e!774910))

(declare-fun array_inv!33878 (array!92849) Bool)

(assert (=> start!115618 (array_inv!33878 a!3861)))

(assert (=> start!115618 true))

(declare-fun b!1367278 () Bool)

(declare-fun e!774908 () Bool)

(assert (=> b!1367278 (= e!774908 false)))

(declare-fun lt!601860 () Bool)

(declare-datatypes ((List!31918 0))(
  ( (Nil!31915) (Cons!31914 (h!33123 (_ BitVec 64)) (t!46612 List!31918)) )
))
(declare-fun acc!866 () List!31918)

(declare-fun contains!9600 (List!31918 (_ BitVec 64)) Bool)

(assert (=> b!1367278 (= lt!601860 (contains!9600 acc!866 (select (arr!44850 a!3861) from!3239)))))

(declare-fun b!1367279 () Bool)

(declare-fun res!910810 () Bool)

(assert (=> b!1367279 (=> (not res!910810) (not e!774910))))

(declare-fun noDuplicate!2457 (List!31918) Bool)

(assert (=> b!1367279 (= res!910810 (noDuplicate!2457 acc!866))))

(declare-fun b!1367280 () Bool)

(declare-fun res!910813 () Bool)

(assert (=> b!1367280 (=> (not res!910813) (not e!774910))))

(assert (=> b!1367280 (= res!910813 (not (contains!9600 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1367281 () Bool)

(assert (=> b!1367281 (= e!774910 e!774908)))

(declare-fun res!910804 () Bool)

(assert (=> b!1367281 (=> (not res!910804) (not e!774908))))

(declare-fun arrayNoDuplicates!0 (array!92849 (_ BitVec 32) List!31918) Bool)

(assert (=> b!1367281 (= res!910804 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45137 0))(
  ( (Unit!45138) )
))
(declare-fun lt!601861 () Unit!45137)

(declare-fun newAcc!98 () List!31918)

(declare-fun noDuplicateSubseq!189 (List!31918 List!31918) Unit!45137)

(assert (=> b!1367281 (= lt!601861 (noDuplicateSubseq!189 newAcc!98 acc!866))))

(declare-fun b!1367282 () Bool)

(declare-fun res!910808 () Bool)

(assert (=> b!1367282 (=> (not res!910808) (not e!774910))))

(assert (=> b!1367282 (= res!910808 (not (contains!9600 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1367283 () Bool)

(declare-fun res!910811 () Bool)

(assert (=> b!1367283 (=> (not res!910811) (not e!774910))))

(declare-fun subseq!1002 (List!31918 List!31918) Bool)

(assert (=> b!1367283 (= res!910811 (subseq!1002 newAcc!98 acc!866))))

(declare-fun b!1367284 () Bool)

(declare-fun res!910812 () Bool)

(assert (=> b!1367284 (=> (not res!910812) (not e!774910))))

(assert (=> b!1367284 (= res!910812 (not (contains!9600 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1367285 () Bool)

(declare-fun res!910805 () Bool)

(assert (=> b!1367285 (=> (not res!910805) (not e!774910))))

(assert (=> b!1367285 (= res!910805 (not (contains!9600 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1367286 () Bool)

(declare-fun res!910806 () Bool)

(assert (=> b!1367286 (=> (not res!910806) (not e!774908))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1367286 (= res!910806 (validKeyInArray!0 (select (arr!44850 a!3861) from!3239)))))

(declare-fun b!1367287 () Bool)

(declare-fun res!910807 () Bool)

(assert (=> b!1367287 (=> (not res!910807) (not e!774908))))

(assert (=> b!1367287 (= res!910807 (bvslt from!3239 (size!45400 a!3861)))))

(assert (= (and start!115618 res!910809) b!1367279))

(assert (= (and b!1367279 res!910810) b!1367280))

(assert (= (and b!1367280 res!910813) b!1367282))

(assert (= (and b!1367282 res!910808) b!1367285))

(assert (= (and b!1367285 res!910805) b!1367284))

(assert (= (and b!1367284 res!910812) b!1367283))

(assert (= (and b!1367283 res!910811) b!1367281))

(assert (= (and b!1367281 res!910804) b!1367287))

(assert (= (and b!1367287 res!910807) b!1367286))

(assert (= (and b!1367286 res!910806) b!1367278))

(declare-fun m!1251535 () Bool)

(assert (=> b!1367286 m!1251535))

(assert (=> b!1367286 m!1251535))

(declare-fun m!1251537 () Bool)

(assert (=> b!1367286 m!1251537))

(declare-fun m!1251539 () Bool)

(assert (=> start!115618 m!1251539))

(declare-fun m!1251541 () Bool)

(assert (=> b!1367282 m!1251541))

(declare-fun m!1251543 () Bool)

(assert (=> b!1367281 m!1251543))

(declare-fun m!1251545 () Bool)

(assert (=> b!1367281 m!1251545))

(declare-fun m!1251547 () Bool)

(assert (=> b!1367280 m!1251547))

(declare-fun m!1251549 () Bool)

(assert (=> b!1367279 m!1251549))

(declare-fun m!1251551 () Bool)

(assert (=> b!1367285 m!1251551))

(declare-fun m!1251553 () Bool)

(assert (=> b!1367283 m!1251553))

(assert (=> b!1367278 m!1251535))

(assert (=> b!1367278 m!1251535))

(declare-fun m!1251555 () Bool)

(assert (=> b!1367278 m!1251555))

(declare-fun m!1251557 () Bool)

(assert (=> b!1367284 m!1251557))

(check-sat (not b!1367281) (not b!1367283) (not b!1367280) (not b!1367284) (not b!1367279) (not start!115618) (not b!1367286) (not b!1367278) (not b!1367285) (not b!1367282))
(check-sat)
