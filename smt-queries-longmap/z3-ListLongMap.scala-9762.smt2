; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115684 () Bool)

(assert start!115684)

(declare-fun b!1367910 () Bool)

(declare-fun res!911462 () Bool)

(declare-fun e!775174 () Bool)

(assert (=> b!1367910 (=> (not res!911462) (not e!775174))))

(declare-fun from!3239 () (_ BitVec 32))

(assert (=> b!1367910 (= res!911462 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) #b00000000000000000000000000000000))))

(declare-fun b!1367911 () Bool)

(declare-fun res!911469 () Bool)

(declare-fun e!775175 () Bool)

(assert (=> b!1367911 (=> (not res!911469) (not e!775175))))

(declare-datatypes ((List!31988 0))(
  ( (Nil!31985) (Cons!31984 (h!33193 (_ BitVec 64)) (t!46674 List!31988)) )
))
(declare-fun newAcc!98 () List!31988)

(declare-fun contains!9581 (List!31988 (_ BitVec 64)) Bool)

(assert (=> b!1367911 (= res!911469 (not (contains!9581 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1367912 () Bool)

(declare-fun res!911471 () Bool)

(assert (=> b!1367912 (=> (not res!911471) (not e!775175))))

(declare-fun acc!866 () List!31988)

(declare-fun subseq!1019 (List!31988 List!31988) Bool)

(assert (=> b!1367912 (= res!911471 (subseq!1019 newAcc!98 acc!866))))

(declare-fun res!911467 () Bool)

(assert (=> start!115684 (=> (not res!911467) (not e!775175))))

(declare-datatypes ((array!92835 0))(
  ( (array!92836 (arr!44842 (Array (_ BitVec 32) (_ BitVec 64))) (size!45394 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92835)

(assert (=> start!115684 (= res!911467 (and (bvslt (size!45394 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45394 a!3861))))))

(assert (=> start!115684 e!775175))

(declare-fun array_inv!34075 (array!92835) Bool)

(assert (=> start!115684 (array_inv!34075 a!3861)))

(assert (=> start!115684 true))

(declare-fun b!1367913 () Bool)

(declare-fun res!911463 () Bool)

(assert (=> b!1367913 (=> (not res!911463) (not e!775174))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1367913 (= res!911463 (not (validKeyInArray!0 (select (arr!44842 a!3861) from!3239))))))

(declare-fun b!1367914 () Bool)

(declare-fun res!911466 () Bool)

(assert (=> b!1367914 (=> (not res!911466) (not e!775175))))

(assert (=> b!1367914 (= res!911466 (not (contains!9581 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1367915 () Bool)

(assert (=> b!1367915 (= e!775174 false)))

(declare-fun lt!601796 () Bool)

(declare-fun arrayNoDuplicates!0 (array!92835 (_ BitVec 32) List!31988) Bool)

(assert (=> b!1367915 (= lt!601796 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) acc!866))))

(declare-fun b!1367916 () Bool)

(declare-fun res!911470 () Bool)

(assert (=> b!1367916 (=> (not res!911470) (not e!775175))))

(declare-fun noDuplicate!2496 (List!31988) Bool)

(assert (=> b!1367916 (= res!911470 (noDuplicate!2496 acc!866))))

(declare-fun b!1367917 () Bool)

(assert (=> b!1367917 (= e!775175 e!775174)))

(declare-fun res!911461 () Bool)

(assert (=> b!1367917 (=> (not res!911461) (not e!775174))))

(assert (=> b!1367917 (= res!911461 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45012 0))(
  ( (Unit!45013) )
))
(declare-fun lt!601797 () Unit!45012)

(declare-fun noDuplicateSubseq!206 (List!31988 List!31988) Unit!45012)

(assert (=> b!1367917 (= lt!601797 (noDuplicateSubseq!206 newAcc!98 acc!866))))

(declare-fun b!1367918 () Bool)

(declare-fun res!911465 () Bool)

(assert (=> b!1367918 (=> (not res!911465) (not e!775175))))

(assert (=> b!1367918 (= res!911465 (not (contains!9581 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1367919 () Bool)

(declare-fun res!911468 () Bool)

(assert (=> b!1367919 (=> (not res!911468) (not e!775174))))

(assert (=> b!1367919 (= res!911468 (bvslt from!3239 (size!45394 a!3861)))))

(declare-fun b!1367920 () Bool)

(declare-fun res!911464 () Bool)

(assert (=> b!1367920 (=> (not res!911464) (not e!775175))))

(assert (=> b!1367920 (= res!911464 (not (contains!9581 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!115684 res!911467) b!1367916))

(assert (= (and b!1367916 res!911470) b!1367918))

(assert (= (and b!1367918 res!911465) b!1367914))

(assert (= (and b!1367914 res!911466) b!1367911))

(assert (= (and b!1367911 res!911469) b!1367920))

(assert (= (and b!1367920 res!911464) b!1367912))

(assert (= (and b!1367912 res!911471) b!1367917))

(assert (= (and b!1367917 res!911461) b!1367919))

(assert (= (and b!1367919 res!911468) b!1367913))

(assert (= (and b!1367913 res!911463) b!1367910))

(assert (= (and b!1367910 res!911462) b!1367915))

(declare-fun m!1251549 () Bool)

(assert (=> start!115684 m!1251549))

(declare-fun m!1251551 () Bool)

(assert (=> b!1367913 m!1251551))

(assert (=> b!1367913 m!1251551))

(declare-fun m!1251553 () Bool)

(assert (=> b!1367913 m!1251553))

(declare-fun m!1251555 () Bool)

(assert (=> b!1367918 m!1251555))

(declare-fun m!1251557 () Bool)

(assert (=> b!1367917 m!1251557))

(declare-fun m!1251559 () Bool)

(assert (=> b!1367917 m!1251559))

(declare-fun m!1251561 () Bool)

(assert (=> b!1367911 m!1251561))

(declare-fun m!1251563 () Bool)

(assert (=> b!1367916 m!1251563))

(declare-fun m!1251565 () Bool)

(assert (=> b!1367912 m!1251565))

(declare-fun m!1251567 () Bool)

(assert (=> b!1367920 m!1251567))

(declare-fun m!1251569 () Bool)

(assert (=> b!1367915 m!1251569))

(declare-fun m!1251571 () Bool)

(assert (=> b!1367914 m!1251571))

(check-sat (not start!115684) (not b!1367912) (not b!1367920) (not b!1367915) (not b!1367913) (not b!1367917) (not b!1367916) (not b!1367918) (not b!1367911) (not b!1367914))
(check-sat)
