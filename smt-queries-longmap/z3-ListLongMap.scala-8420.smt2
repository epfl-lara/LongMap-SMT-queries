; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!102458 () Bool)

(assert start!102458)

(declare-fun b!1232437 () Bool)

(declare-fun e!698997 () Bool)

(declare-fun e!698995 () Bool)

(assert (=> b!1232437 (= e!698997 (not e!698995))))

(declare-fun res!820820 () Bool)

(assert (=> b!1232437 (=> res!820820 e!698995)))

(declare-fun from!3184 () (_ BitVec 32))

(assert (=> b!1232437 (= res!820820 (bvslt (bvadd #b00000000000000000000000000000001 from!3184) #b00000000000000000000000000000000))))

(declare-fun e!698996 () Bool)

(assert (=> b!1232437 e!698996))

(declare-fun res!820819 () Bool)

(assert (=> b!1232437 (=> (not res!820819) (not e!698996))))

(declare-datatypes ((array!79489 0))(
  ( (array!79490 (arr!38358 (Array (_ BitVec 32) (_ BitVec 64))) (size!38894 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79489)

(declare-datatypes ((List!27131 0))(
  ( (Nil!27128) (Cons!27127 (h!28336 (_ BitVec 64)) (t!40594 List!27131)) )
))
(declare-fun arrayNoDuplicates!0 (array!79489 (_ BitVec 32) List!27131) Bool)

(assert (=> b!1232437 (= res!820819 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27128))))

(declare-datatypes ((Unit!40822 0))(
  ( (Unit!40823) )
))
(declare-fun lt!559517 () Unit!40822)

(declare-fun acc!823 () List!27131)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79489 List!27131 List!27131 (_ BitVec 32)) Unit!40822)

(assert (=> b!1232437 (= lt!559517 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27128 from!3184))))

(assert (=> b!1232437 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27127 (select (arr!38358 a!3806) from!3184) acc!823))))

(declare-fun b!1232438 () Bool)

(declare-fun res!820822 () Bool)

(assert (=> b!1232438 (=> (not res!820822) (not e!698997))))

(declare-fun k0!2913 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1232438 (= res!820822 (validKeyInArray!0 k0!2913))))

(declare-fun b!1232440 () Bool)

(declare-fun res!820823 () Bool)

(assert (=> b!1232440 (=> (not res!820823) (not e!698997))))

(declare-fun contains!7193 (List!27131 (_ BitVec 64)) Bool)

(assert (=> b!1232440 (= res!820823 (not (contains!7193 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1232441 () Bool)

(declare-fun res!820824 () Bool)

(assert (=> b!1232441 (=> (not res!820824) (not e!698997))))

(assert (=> b!1232441 (= res!820824 (not (contains!7193 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1232442 () Bool)

(assert (=> b!1232442 (= e!698996 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27127 (select (arr!38358 a!3806) from!3184) Nil!27128)))))

(declare-fun b!1232443 () Bool)

(declare-fun res!820821 () Bool)

(assert (=> b!1232443 (=> (not res!820821) (not e!698997))))

(assert (=> b!1232443 (= res!820821 (validKeyInArray!0 (select (arr!38358 a!3806) from!3184)))))

(declare-fun b!1232444 () Bool)

(declare-fun res!820817 () Bool)

(assert (=> b!1232444 (=> (not res!820817) (not e!698997))))

(assert (=> b!1232444 (= res!820817 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38894 a!3806)) (bvslt from!3184 (size!38894 a!3806))))))

(declare-fun b!1232445 () Bool)

(declare-fun res!820818 () Bool)

(assert (=> b!1232445 (=> (not res!820818) (not e!698997))))

(declare-fun arrayContainsKey!0 (array!79489 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1232445 (= res!820818 (arrayContainsKey!0 a!3806 k0!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1232439 () Bool)

(declare-fun noDuplicate!1790 (List!27131) Bool)

(assert (=> b!1232439 (= e!698995 (noDuplicate!1790 (Cons!27127 (select (arr!38358 a!3806) from!3184) Nil!27128)))))

(declare-fun res!820816 () Bool)

(assert (=> start!102458 (=> (not res!820816) (not e!698997))))

(assert (=> start!102458 (= res!820816 (bvslt (size!38894 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102458 e!698997))

(declare-fun array_inv!29206 (array!79489) Bool)

(assert (=> start!102458 (array_inv!29206 a!3806)))

(assert (=> start!102458 true))

(declare-fun b!1232446 () Bool)

(declare-fun res!820815 () Bool)

(assert (=> b!1232446 (=> (not res!820815) (not e!698997))))

(assert (=> b!1232446 (= res!820815 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1232447 () Bool)

(declare-fun res!820825 () Bool)

(assert (=> b!1232447 (=> (not res!820825) (not e!698997))))

(assert (=> b!1232447 (= res!820825 (noDuplicate!1790 acc!823))))

(assert (= (and start!102458 res!820816) b!1232438))

(assert (= (and b!1232438 res!820822) b!1232444))

(assert (= (and b!1232444 res!820817) b!1232447))

(assert (= (and b!1232447 res!820825) b!1232441))

(assert (= (and b!1232441 res!820824) b!1232440))

(assert (= (and b!1232440 res!820823) b!1232445))

(assert (= (and b!1232445 res!820818) b!1232446))

(assert (= (and b!1232446 res!820815) b!1232443))

(assert (= (and b!1232443 res!820821) b!1232437))

(assert (= (and b!1232437 res!820819) b!1232442))

(assert (= (and b!1232437 (not res!820820)) b!1232439))

(declare-fun m!1136423 () Bool)

(assert (=> b!1232440 m!1136423))

(declare-fun m!1136425 () Bool)

(assert (=> b!1232437 m!1136425))

(declare-fun m!1136427 () Bool)

(assert (=> b!1232437 m!1136427))

(declare-fun m!1136429 () Bool)

(assert (=> b!1232437 m!1136429))

(declare-fun m!1136431 () Bool)

(assert (=> b!1232437 m!1136431))

(declare-fun m!1136433 () Bool)

(assert (=> b!1232438 m!1136433))

(declare-fun m!1136435 () Bool)

(assert (=> b!1232445 m!1136435))

(assert (=> b!1232439 m!1136429))

(declare-fun m!1136437 () Bool)

(assert (=> b!1232439 m!1136437))

(declare-fun m!1136439 () Bool)

(assert (=> b!1232446 m!1136439))

(declare-fun m!1136441 () Bool)

(assert (=> b!1232441 m!1136441))

(assert (=> b!1232443 m!1136429))

(assert (=> b!1232443 m!1136429))

(declare-fun m!1136443 () Bool)

(assert (=> b!1232443 m!1136443))

(assert (=> b!1232442 m!1136429))

(declare-fun m!1136445 () Bool)

(assert (=> b!1232442 m!1136445))

(declare-fun m!1136447 () Bool)

(assert (=> start!102458 m!1136447))

(declare-fun m!1136449 () Bool)

(assert (=> b!1232447 m!1136449))

(check-sat (not b!1232443) (not start!102458) (not b!1232441) (not b!1232439) (not b!1232445) (not b!1232437) (not b!1232446) (not b!1232447) (not b!1232438) (not b!1232442) (not b!1232440))
(check-sat)
(get-model)

(declare-fun b!1232491 () Bool)

(declare-fun e!699019 () Bool)

(declare-fun e!699020 () Bool)

(assert (=> b!1232491 (= e!699019 e!699020)))

(declare-fun c!120673 () Bool)

(assert (=> b!1232491 (= c!120673 (validKeyInArray!0 (select (arr!38358 a!3806) from!3184)))))

(declare-fun d!134861 () Bool)

(declare-fun res!820867 () Bool)

(declare-fun e!699018 () Bool)

(assert (=> d!134861 (=> res!820867 e!699018)))

(assert (=> d!134861 (= res!820867 (bvsge from!3184 (size!38894 a!3806)))))

(assert (=> d!134861 (= (arrayNoDuplicates!0 a!3806 from!3184 acc!823) e!699018)))

(declare-fun b!1232492 () Bool)

(declare-fun call!60910 () Bool)

(assert (=> b!1232492 (= e!699020 call!60910)))

(declare-fun bm!60907 () Bool)

(assert (=> bm!60907 (= call!60910 (arrayNoDuplicates!0 a!3806 (bvadd from!3184 #b00000000000000000000000000000001) (ite c!120673 (Cons!27127 (select (arr!38358 a!3806) from!3184) acc!823) acc!823)))))

(declare-fun b!1232493 () Bool)

(declare-fun e!699021 () Bool)

(assert (=> b!1232493 (= e!699021 (contains!7193 acc!823 (select (arr!38358 a!3806) from!3184)))))

(declare-fun b!1232494 () Bool)

(assert (=> b!1232494 (= e!699020 call!60910)))

(declare-fun b!1232495 () Bool)

(assert (=> b!1232495 (= e!699018 e!699019)))

(declare-fun res!820865 () Bool)

(assert (=> b!1232495 (=> (not res!820865) (not e!699019))))

(assert (=> b!1232495 (= res!820865 (not e!699021))))

(declare-fun res!820866 () Bool)

(assert (=> b!1232495 (=> (not res!820866) (not e!699021))))

(assert (=> b!1232495 (= res!820866 (validKeyInArray!0 (select (arr!38358 a!3806) from!3184)))))

(assert (= (and d!134861 (not res!820867)) b!1232495))

(assert (= (and b!1232495 res!820866) b!1232493))

(assert (= (and b!1232495 res!820865) b!1232491))

(assert (= (and b!1232491 c!120673) b!1232492))

(assert (= (and b!1232491 (not c!120673)) b!1232494))

(assert (= (or b!1232492 b!1232494) bm!60907))

(assert (=> b!1232491 m!1136429))

(assert (=> b!1232491 m!1136429))

(assert (=> b!1232491 m!1136443))

(assert (=> bm!60907 m!1136429))

(declare-fun m!1136479 () Bool)

(assert (=> bm!60907 m!1136479))

(assert (=> b!1232493 m!1136429))

(assert (=> b!1232493 m!1136429))

(declare-fun m!1136481 () Bool)

(assert (=> b!1232493 m!1136481))

(assert (=> b!1232495 m!1136429))

(assert (=> b!1232495 m!1136429))

(assert (=> b!1232495 m!1136443))

(assert (=> b!1232446 d!134861))

(declare-fun d!134865 () Bool)

(declare-fun lt!559523 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!569 (List!27131) (InoxSet (_ BitVec 64)))

(assert (=> d!134865 (= lt!559523 (select (content!569 acc!823) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!699041 () Bool)

(assert (=> d!134865 (= lt!559523 e!699041)))

(declare-fun res!820885 () Bool)

(assert (=> d!134865 (=> (not res!820885) (not e!699041))))

(get-info :version)

(assert (=> d!134865 (= res!820885 ((_ is Cons!27127) acc!823))))

(assert (=> d!134865 (= (contains!7193 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000) lt!559523)))

(declare-fun b!1232516 () Bool)

(declare-fun e!699040 () Bool)

(assert (=> b!1232516 (= e!699041 e!699040)))

(declare-fun res!820884 () Bool)

(assert (=> b!1232516 (=> res!820884 e!699040)))

(assert (=> b!1232516 (= res!820884 (= (h!28336 acc!823) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1232517 () Bool)

(assert (=> b!1232517 (= e!699040 (contains!7193 (t!40594 acc!823) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!134865 res!820885) b!1232516))

(assert (= (and b!1232516 (not res!820884)) b!1232517))

(declare-fun m!1136487 () Bool)

(assert (=> d!134865 m!1136487))

(declare-fun m!1136489 () Bool)

(assert (=> d!134865 m!1136489))

(declare-fun m!1136491 () Bool)

(assert (=> b!1232517 m!1136491))

(assert (=> b!1232441 d!134865))

(declare-fun d!134873 () Bool)

(declare-fun res!820896 () Bool)

(declare-fun e!699054 () Bool)

(assert (=> d!134873 (=> res!820896 e!699054)))

(assert (=> d!134873 (= res!820896 ((_ is Nil!27128) (Cons!27127 (select (arr!38358 a!3806) from!3184) Nil!27128)))))

(assert (=> d!134873 (= (noDuplicate!1790 (Cons!27127 (select (arr!38358 a!3806) from!3184) Nil!27128)) e!699054)))

(declare-fun b!1232532 () Bool)

(declare-fun e!699055 () Bool)

(assert (=> b!1232532 (= e!699054 e!699055)))

(declare-fun res!820897 () Bool)

(assert (=> b!1232532 (=> (not res!820897) (not e!699055))))

(assert (=> b!1232532 (= res!820897 (not (contains!7193 (t!40594 (Cons!27127 (select (arr!38358 a!3806) from!3184) Nil!27128)) (h!28336 (Cons!27127 (select (arr!38358 a!3806) from!3184) Nil!27128)))))))

(declare-fun b!1232533 () Bool)

(assert (=> b!1232533 (= e!699055 (noDuplicate!1790 (t!40594 (Cons!27127 (select (arr!38358 a!3806) from!3184) Nil!27128))))))

(assert (= (and d!134873 (not res!820896)) b!1232532))

(assert (= (and b!1232532 res!820897) b!1232533))

(declare-fun m!1136493 () Bool)

(assert (=> b!1232532 m!1136493))

(declare-fun m!1136495 () Bool)

(assert (=> b!1232533 m!1136495))

(assert (=> b!1232439 d!134873))

(declare-fun d!134875 () Bool)

(assert (=> d!134875 (= (array_inv!29206 a!3806) (bvsge (size!38894 a!3806) #b00000000000000000000000000000000))))

(assert (=> start!102458 d!134875))

(declare-fun d!134877 () Bool)

(declare-fun res!820915 () Bool)

(declare-fun e!699075 () Bool)

(assert (=> d!134877 (=> res!820915 e!699075)))

(assert (=> d!134877 (= res!820915 (= (select (arr!38358 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) k0!2913))))

(assert (=> d!134877 (= (arrayContainsKey!0 a!3806 k0!2913 (bvadd #b00000000000000000000000000000001 from!3184)) e!699075)))

(declare-fun b!1232554 () Bool)

(declare-fun e!699077 () Bool)

(assert (=> b!1232554 (= e!699075 e!699077)))

(declare-fun res!820917 () Bool)

(assert (=> b!1232554 (=> (not res!820917) (not e!699077))))

(assert (=> b!1232554 (= res!820917 (bvslt (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001) (size!38894 a!3806)))))

(declare-fun b!1232556 () Bool)

(assert (=> b!1232556 (= e!699077 (arrayContainsKey!0 a!3806 k0!2913 (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001)))))

(assert (= (and d!134877 (not res!820915)) b!1232554))

(assert (= (and b!1232554 res!820917) b!1232556))

(declare-fun m!1136508 () Bool)

(assert (=> d!134877 m!1136508))

(declare-fun m!1136513 () Bool)

(assert (=> b!1232556 m!1136513))

(assert (=> b!1232445 d!134877))

(declare-fun d!134885 () Bool)

(declare-fun lt!559526 () Bool)

(assert (=> d!134885 (= lt!559526 (select (content!569 acc!823) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!699081 () Bool)

(assert (=> d!134885 (= lt!559526 e!699081)))

(declare-fun res!820921 () Bool)

(assert (=> d!134885 (=> (not res!820921) (not e!699081))))

(assert (=> d!134885 (= res!820921 ((_ is Cons!27127) acc!823))))

(assert (=> d!134885 (= (contains!7193 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000) lt!559526)))

(declare-fun b!1232560 () Bool)

(declare-fun e!699080 () Bool)

(assert (=> b!1232560 (= e!699081 e!699080)))

(declare-fun res!820920 () Bool)

(assert (=> b!1232560 (=> res!820920 e!699080)))

(assert (=> b!1232560 (= res!820920 (= (h!28336 acc!823) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1232561 () Bool)

(assert (=> b!1232561 (= e!699080 (contains!7193 (t!40594 acc!823) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!134885 res!820921) b!1232560))

(assert (= (and b!1232560 (not res!820920)) b!1232561))

(assert (=> d!134885 m!1136487))

(declare-fun m!1136515 () Bool)

(assert (=> d!134885 m!1136515))

(declare-fun m!1136517 () Bool)

(assert (=> b!1232561 m!1136517))

(assert (=> b!1232440 d!134885))

(declare-fun d!134887 () Bool)

(assert (=> d!134887 (= (validKeyInArray!0 (select (arr!38358 a!3806) from!3184)) (and (not (= (select (arr!38358 a!3806) from!3184) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!38358 a!3806) from!3184) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1232443 d!134887))

(declare-fun d!134893 () Bool)

(assert (=> d!134893 (= (validKeyInArray!0 k0!2913) (and (not (= k0!2913 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2913 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1232438 d!134893))

(declare-fun d!134895 () Bool)

(declare-fun res!820927 () Bool)

(declare-fun e!699088 () Bool)

(assert (=> d!134895 (=> res!820927 e!699088)))

(assert (=> d!134895 (= res!820927 ((_ is Nil!27128) acc!823))))

(assert (=> d!134895 (= (noDuplicate!1790 acc!823) e!699088)))

(declare-fun b!1232569 () Bool)

(declare-fun e!699089 () Bool)

(assert (=> b!1232569 (= e!699088 e!699089)))

(declare-fun res!820928 () Bool)

(assert (=> b!1232569 (=> (not res!820928) (not e!699089))))

(assert (=> b!1232569 (= res!820928 (not (contains!7193 (t!40594 acc!823) (h!28336 acc!823))))))

(declare-fun b!1232570 () Bool)

(assert (=> b!1232570 (= e!699089 (noDuplicate!1790 (t!40594 acc!823)))))

(assert (= (and d!134895 (not res!820927)) b!1232569))

(assert (= (and b!1232569 res!820928) b!1232570))

(declare-fun m!1136533 () Bool)

(assert (=> b!1232569 m!1136533))

(declare-fun m!1136535 () Bool)

(assert (=> b!1232570 m!1136535))

(assert (=> b!1232447 d!134895))

(declare-fun b!1232575 () Bool)

(declare-fun e!699095 () Bool)

(declare-fun e!699096 () Bool)

(assert (=> b!1232575 (= e!699095 e!699096)))

(declare-fun c!120681 () Bool)

(assert (=> b!1232575 (= c!120681 (validKeyInArray!0 (select (arr!38358 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(declare-fun d!134897 () Bool)

(declare-fun res!820935 () Bool)

(declare-fun e!699094 () Bool)

(assert (=> d!134897 (=> res!820935 e!699094)))

(assert (=> d!134897 (= res!820935 (bvsge (bvadd #b00000000000000000000000000000001 from!3184) (size!38894 a!3806)))))

(assert (=> d!134897 (= (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27127 (select (arr!38358 a!3806) from!3184) Nil!27128)) e!699094)))

(declare-fun b!1232576 () Bool)

(declare-fun call!60918 () Bool)

(assert (=> b!1232576 (= e!699096 call!60918)))

(declare-fun bm!60915 () Bool)

(assert (=> bm!60915 (= call!60918 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001) (ite c!120681 (Cons!27127 (select (arr!38358 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) (Cons!27127 (select (arr!38358 a!3806) from!3184) Nil!27128)) (Cons!27127 (select (arr!38358 a!3806) from!3184) Nil!27128))))))

(declare-fun b!1232577 () Bool)

(declare-fun e!699097 () Bool)

(assert (=> b!1232577 (= e!699097 (contains!7193 (Cons!27127 (select (arr!38358 a!3806) from!3184) Nil!27128) (select (arr!38358 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(declare-fun b!1232578 () Bool)

(assert (=> b!1232578 (= e!699096 call!60918)))

(declare-fun b!1232579 () Bool)

(assert (=> b!1232579 (= e!699094 e!699095)))

(declare-fun res!820933 () Bool)

(assert (=> b!1232579 (=> (not res!820933) (not e!699095))))

(assert (=> b!1232579 (= res!820933 (not e!699097))))

(declare-fun res!820934 () Bool)

(assert (=> b!1232579 (=> (not res!820934) (not e!699097))))

(assert (=> b!1232579 (= res!820934 (validKeyInArray!0 (select (arr!38358 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(assert (= (and d!134897 (not res!820935)) b!1232579))

(assert (= (and b!1232579 res!820934) b!1232577))

(assert (= (and b!1232579 res!820933) b!1232575))

(assert (= (and b!1232575 c!120681) b!1232576))

(assert (= (and b!1232575 (not c!120681)) b!1232578))

(assert (= (or b!1232576 b!1232578) bm!60915))

(assert (=> b!1232575 m!1136508))

(assert (=> b!1232575 m!1136508))

(declare-fun m!1136541 () Bool)

(assert (=> b!1232575 m!1136541))

(assert (=> bm!60915 m!1136508))

(declare-fun m!1136543 () Bool)

(assert (=> bm!60915 m!1136543))

(assert (=> b!1232577 m!1136508))

(assert (=> b!1232577 m!1136508))

(declare-fun m!1136545 () Bool)

(assert (=> b!1232577 m!1136545))

(assert (=> b!1232579 m!1136508))

(assert (=> b!1232579 m!1136508))

(assert (=> b!1232579 m!1136541))

(assert (=> b!1232442 d!134897))

(declare-fun b!1232584 () Bool)

(declare-fun e!699103 () Bool)

(declare-fun e!699104 () Bool)

(assert (=> b!1232584 (= e!699103 e!699104)))

(declare-fun c!120682 () Bool)

(assert (=> b!1232584 (= c!120682 (validKeyInArray!0 (select (arr!38358 a!3806) from!3184)))))

(declare-fun d!134903 () Bool)

(declare-fun res!820942 () Bool)

(declare-fun e!699102 () Bool)

(assert (=> d!134903 (=> res!820942 e!699102)))

(assert (=> d!134903 (= res!820942 (bvsge from!3184 (size!38894 a!3806)))))

(assert (=> d!134903 (= (arrayNoDuplicates!0 a!3806 from!3184 Nil!27128) e!699102)))

(declare-fun b!1232585 () Bool)

(declare-fun call!60919 () Bool)

(assert (=> b!1232585 (= e!699104 call!60919)))

(declare-fun bm!60916 () Bool)

(assert (=> bm!60916 (= call!60919 (arrayNoDuplicates!0 a!3806 (bvadd from!3184 #b00000000000000000000000000000001) (ite c!120682 (Cons!27127 (select (arr!38358 a!3806) from!3184) Nil!27128) Nil!27128)))))

(declare-fun b!1232586 () Bool)

(declare-fun e!699105 () Bool)

(assert (=> b!1232586 (= e!699105 (contains!7193 Nil!27128 (select (arr!38358 a!3806) from!3184)))))

(declare-fun b!1232587 () Bool)

(assert (=> b!1232587 (= e!699104 call!60919)))

(declare-fun b!1232588 () Bool)

(assert (=> b!1232588 (= e!699102 e!699103)))

(declare-fun res!820940 () Bool)

(assert (=> b!1232588 (=> (not res!820940) (not e!699103))))

(assert (=> b!1232588 (= res!820940 (not e!699105))))

(declare-fun res!820941 () Bool)

(assert (=> b!1232588 (=> (not res!820941) (not e!699105))))

(assert (=> b!1232588 (= res!820941 (validKeyInArray!0 (select (arr!38358 a!3806) from!3184)))))

(assert (= (and d!134903 (not res!820942)) b!1232588))

(assert (= (and b!1232588 res!820941) b!1232586))

(assert (= (and b!1232588 res!820940) b!1232584))

(assert (= (and b!1232584 c!120682) b!1232585))

(assert (= (and b!1232584 (not c!120682)) b!1232587))

(assert (= (or b!1232585 b!1232587) bm!60916))

(assert (=> b!1232584 m!1136429))

(assert (=> b!1232584 m!1136429))

(assert (=> b!1232584 m!1136443))

(assert (=> bm!60916 m!1136429))

(declare-fun m!1136555 () Bool)

(assert (=> bm!60916 m!1136555))

(assert (=> b!1232586 m!1136429))

(assert (=> b!1232586 m!1136429))

(declare-fun m!1136557 () Bool)

(assert (=> b!1232586 m!1136557))

(assert (=> b!1232588 m!1136429))

(assert (=> b!1232588 m!1136429))

(assert (=> b!1232588 m!1136443))

(assert (=> b!1232437 d!134903))

(declare-fun d!134911 () Bool)

(assert (=> d!134911 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27128)))

(declare-fun lt!559536 () Unit!40822)

(declare-fun choose!80 (array!79489 List!27131 List!27131 (_ BitVec 32)) Unit!40822)

(assert (=> d!134911 (= lt!559536 (choose!80 a!3806 acc!823 Nil!27128 from!3184))))

(assert (=> d!134911 (bvslt (size!38894 a!3806) #b01111111111111111111111111111111)))

(assert (=> d!134911 (= (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27128 from!3184) lt!559536)))

(declare-fun bs!34638 () Bool)

(assert (= bs!34638 d!134911))

(assert (=> bs!34638 m!1136425))

(declare-fun m!1136575 () Bool)

(assert (=> bs!34638 m!1136575))

(assert (=> b!1232437 d!134911))

(declare-fun b!1232615 () Bool)

(declare-fun e!699129 () Bool)

(declare-fun e!699130 () Bool)

(assert (=> b!1232615 (= e!699129 e!699130)))

(declare-fun c!120687 () Bool)

(assert (=> b!1232615 (= c!120687 (validKeyInArray!0 (select (arr!38358 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(declare-fun d!134921 () Bool)

(declare-fun res!820963 () Bool)

(declare-fun e!699128 () Bool)

(assert (=> d!134921 (=> res!820963 e!699128)))

(assert (=> d!134921 (= res!820963 (bvsge (bvadd #b00000000000000000000000000000001 from!3184) (size!38894 a!3806)))))

(assert (=> d!134921 (= (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27127 (select (arr!38358 a!3806) from!3184) acc!823)) e!699128)))

(declare-fun b!1232616 () Bool)

(declare-fun call!60924 () Bool)

(assert (=> b!1232616 (= e!699130 call!60924)))

(declare-fun bm!60921 () Bool)

(assert (=> bm!60921 (= call!60924 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001) (ite c!120687 (Cons!27127 (select (arr!38358 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) (Cons!27127 (select (arr!38358 a!3806) from!3184) acc!823)) (Cons!27127 (select (arr!38358 a!3806) from!3184) acc!823))))))

(declare-fun b!1232617 () Bool)

(declare-fun e!699131 () Bool)

(assert (=> b!1232617 (= e!699131 (contains!7193 (Cons!27127 (select (arr!38358 a!3806) from!3184) acc!823) (select (arr!38358 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(declare-fun b!1232618 () Bool)

(assert (=> b!1232618 (= e!699130 call!60924)))

(declare-fun b!1232619 () Bool)

(assert (=> b!1232619 (= e!699128 e!699129)))

(declare-fun res!820961 () Bool)

(assert (=> b!1232619 (=> (not res!820961) (not e!699129))))

(assert (=> b!1232619 (= res!820961 (not e!699131))))

(declare-fun res!820962 () Bool)

(assert (=> b!1232619 (=> (not res!820962) (not e!699131))))

(assert (=> b!1232619 (= res!820962 (validKeyInArray!0 (select (arr!38358 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(assert (= (and d!134921 (not res!820963)) b!1232619))

(assert (= (and b!1232619 res!820962) b!1232617))

(assert (= (and b!1232619 res!820961) b!1232615))

(assert (= (and b!1232615 c!120687) b!1232616))

(assert (= (and b!1232615 (not c!120687)) b!1232618))

(assert (= (or b!1232616 b!1232618) bm!60921))

(assert (=> b!1232615 m!1136508))

(assert (=> b!1232615 m!1136508))

(assert (=> b!1232615 m!1136541))

(assert (=> bm!60921 m!1136508))

(declare-fun m!1136585 () Bool)

(assert (=> bm!60921 m!1136585))

(assert (=> b!1232617 m!1136508))

(assert (=> b!1232617 m!1136508))

(declare-fun m!1136587 () Bool)

(assert (=> b!1232617 m!1136587))

(assert (=> b!1232619 m!1136508))

(assert (=> b!1232619 m!1136508))

(assert (=> b!1232619 m!1136541))

(assert (=> b!1232437 d!134921))

(check-sat (not b!1232577) (not b!1232615) (not b!1232586) (not d!134865) (not bm!60907) (not b!1232561) (not b!1232556) (not b!1232533) (not b!1232570) (not b!1232532) (not d!134885) (not bm!60921) (not b!1232569) (not b!1232579) (not b!1232517) (not bm!60916) (not b!1232588) (not b!1232493) (not b!1232575) (not b!1232584) (not bm!60915) (not b!1232617) (not d!134911) (not b!1232495) (not b!1232491) (not b!1232619))
(check-sat)
(get-model)

(declare-fun d!134939 () Bool)

(declare-fun lt!559542 () Bool)

(assert (=> d!134939 (= lt!559542 (select (content!569 (Cons!27127 (select (arr!38358 a!3806) from!3184) Nil!27128)) (select (arr!38358 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(declare-fun e!699149 () Bool)

(assert (=> d!134939 (= lt!559542 e!699149)))

(declare-fun res!820980 () Bool)

(assert (=> d!134939 (=> (not res!820980) (not e!699149))))

(assert (=> d!134939 (= res!820980 ((_ is Cons!27127) (Cons!27127 (select (arr!38358 a!3806) from!3184) Nil!27128)))))

(assert (=> d!134939 (= (contains!7193 (Cons!27127 (select (arr!38358 a!3806) from!3184) Nil!27128) (select (arr!38358 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))) lt!559542)))

(declare-fun b!1232637 () Bool)

(declare-fun e!699148 () Bool)

(assert (=> b!1232637 (= e!699149 e!699148)))

(declare-fun res!820979 () Bool)

(assert (=> b!1232637 (=> res!820979 e!699148)))

(assert (=> b!1232637 (= res!820979 (= (h!28336 (Cons!27127 (select (arr!38358 a!3806) from!3184) Nil!27128)) (select (arr!38358 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(declare-fun b!1232638 () Bool)

(assert (=> b!1232638 (= e!699148 (contains!7193 (t!40594 (Cons!27127 (select (arr!38358 a!3806) from!3184) Nil!27128)) (select (arr!38358 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(assert (= (and d!134939 res!820980) b!1232637))

(assert (= (and b!1232637 (not res!820979)) b!1232638))

(declare-fun m!1136605 () Bool)

(assert (=> d!134939 m!1136605))

(assert (=> d!134939 m!1136508))

(declare-fun m!1136607 () Bool)

(assert (=> d!134939 m!1136607))

(assert (=> b!1232638 m!1136508))

(declare-fun m!1136609 () Bool)

(assert (=> b!1232638 m!1136609))

(assert (=> b!1232577 d!134939))

(declare-fun b!1232639 () Bool)

(declare-fun e!699151 () Bool)

(declare-fun e!699152 () Bool)

(assert (=> b!1232639 (= e!699151 e!699152)))

(declare-fun c!120689 () Bool)

(assert (=> b!1232639 (= c!120689 (validKeyInArray!0 (select (arr!38358 a!3806) (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001))))))

(declare-fun d!134941 () Bool)

(declare-fun res!820983 () Bool)

(declare-fun e!699150 () Bool)

(assert (=> d!134941 (=> res!820983 e!699150)))

(assert (=> d!134941 (= res!820983 (bvsge (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001) (size!38894 a!3806)))))

(assert (=> d!134941 (= (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001) (ite c!120681 (Cons!27127 (select (arr!38358 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) (Cons!27127 (select (arr!38358 a!3806) from!3184) Nil!27128)) (Cons!27127 (select (arr!38358 a!3806) from!3184) Nil!27128))) e!699150)))

(declare-fun b!1232640 () Bool)

(declare-fun call!60926 () Bool)

(assert (=> b!1232640 (= e!699152 call!60926)))

(declare-fun bm!60923 () Bool)

(assert (=> bm!60923 (= call!60926 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!120689 (Cons!27127 (select (arr!38358 a!3806) (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001)) (ite c!120681 (Cons!27127 (select (arr!38358 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) (Cons!27127 (select (arr!38358 a!3806) from!3184) Nil!27128)) (Cons!27127 (select (arr!38358 a!3806) from!3184) Nil!27128))) (ite c!120681 (Cons!27127 (select (arr!38358 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) (Cons!27127 (select (arr!38358 a!3806) from!3184) Nil!27128)) (Cons!27127 (select (arr!38358 a!3806) from!3184) Nil!27128)))))))

(declare-fun b!1232641 () Bool)

(declare-fun e!699153 () Bool)

(assert (=> b!1232641 (= e!699153 (contains!7193 (ite c!120681 (Cons!27127 (select (arr!38358 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) (Cons!27127 (select (arr!38358 a!3806) from!3184) Nil!27128)) (Cons!27127 (select (arr!38358 a!3806) from!3184) Nil!27128)) (select (arr!38358 a!3806) (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001))))))

(declare-fun b!1232642 () Bool)

(assert (=> b!1232642 (= e!699152 call!60926)))

(declare-fun b!1232643 () Bool)

(assert (=> b!1232643 (= e!699150 e!699151)))

(declare-fun res!820981 () Bool)

(assert (=> b!1232643 (=> (not res!820981) (not e!699151))))

(assert (=> b!1232643 (= res!820981 (not e!699153))))

(declare-fun res!820982 () Bool)

(assert (=> b!1232643 (=> (not res!820982) (not e!699153))))

(assert (=> b!1232643 (= res!820982 (validKeyInArray!0 (select (arr!38358 a!3806) (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001))))))

(assert (= (and d!134941 (not res!820983)) b!1232643))

(assert (= (and b!1232643 res!820982) b!1232641))

(assert (= (and b!1232643 res!820981) b!1232639))

(assert (= (and b!1232639 c!120689) b!1232640))

(assert (= (and b!1232639 (not c!120689)) b!1232642))

(assert (= (or b!1232640 b!1232642) bm!60923))

(declare-fun m!1136611 () Bool)

(assert (=> b!1232639 m!1136611))

(assert (=> b!1232639 m!1136611))

(declare-fun m!1136613 () Bool)

(assert (=> b!1232639 m!1136613))

(assert (=> bm!60923 m!1136611))

(declare-fun m!1136615 () Bool)

(assert (=> bm!60923 m!1136615))

(assert (=> b!1232641 m!1136611))

(assert (=> b!1232641 m!1136611))

(declare-fun m!1136617 () Bool)

(assert (=> b!1232641 m!1136617))

(assert (=> b!1232643 m!1136611))

(assert (=> b!1232643 m!1136611))

(assert (=> b!1232643 m!1136613))

(assert (=> bm!60915 d!134941))

(assert (=> b!1232491 d!134887))

(declare-fun d!134943 () Bool)

(assert (=> d!134943 (= (validKeyInArray!0 (select (arr!38358 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))) (and (not (= (select (arr!38358 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!38358 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1232579 d!134943))

(declare-fun d!134945 () Bool)

(declare-fun lt!559543 () Bool)

(assert (=> d!134945 (= lt!559543 (select (content!569 (t!40594 acc!823)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!699155 () Bool)

(assert (=> d!134945 (= lt!559543 e!699155)))

(declare-fun res!820985 () Bool)

(assert (=> d!134945 (=> (not res!820985) (not e!699155))))

(assert (=> d!134945 (= res!820985 ((_ is Cons!27127) (t!40594 acc!823)))))

(assert (=> d!134945 (= (contains!7193 (t!40594 acc!823) #b0000000000000000000000000000000000000000000000000000000000000000) lt!559543)))

(declare-fun b!1232644 () Bool)

(declare-fun e!699154 () Bool)

(assert (=> b!1232644 (= e!699155 e!699154)))

(declare-fun res!820984 () Bool)

(assert (=> b!1232644 (=> res!820984 e!699154)))

(assert (=> b!1232644 (= res!820984 (= (h!28336 (t!40594 acc!823)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1232645 () Bool)

(assert (=> b!1232645 (= e!699154 (contains!7193 (t!40594 (t!40594 acc!823)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!134945 res!820985) b!1232644))

(assert (= (and b!1232644 (not res!820984)) b!1232645))

(declare-fun m!1136619 () Bool)

(assert (=> d!134945 m!1136619))

(declare-fun m!1136621 () Bool)

(assert (=> d!134945 m!1136621))

(declare-fun m!1136623 () Bool)

(assert (=> b!1232645 m!1136623))

(assert (=> b!1232517 d!134945))

(assert (=> b!1232615 d!134943))

(declare-fun d!134947 () Bool)

(declare-fun c!120692 () Bool)

(assert (=> d!134947 (= c!120692 ((_ is Nil!27128) acc!823))))

(declare-fun e!699158 () (InoxSet (_ BitVec 64)))

(assert (=> d!134947 (= (content!569 acc!823) e!699158)))

(declare-fun b!1232650 () Bool)

(assert (=> b!1232650 (= e!699158 ((as const (Array (_ BitVec 64) Bool)) false))))

(declare-fun b!1232651 () Bool)

(assert (=> b!1232651 (= e!699158 ((_ map or) (store ((as const (Array (_ BitVec 64) Bool)) false) (h!28336 acc!823) true) (content!569 (t!40594 acc!823))))))

(assert (= (and d!134947 c!120692) b!1232650))

(assert (= (and d!134947 (not c!120692)) b!1232651))

(declare-fun m!1136625 () Bool)

(assert (=> b!1232651 m!1136625))

(assert (=> b!1232651 m!1136619))

(assert (=> d!134865 d!134947))

(declare-fun d!134949 () Bool)

(declare-fun lt!559544 () Bool)

(assert (=> d!134949 (= lt!559544 (select (content!569 Nil!27128) (select (arr!38358 a!3806) from!3184)))))

(declare-fun e!699160 () Bool)

(assert (=> d!134949 (= lt!559544 e!699160)))

(declare-fun res!820987 () Bool)

(assert (=> d!134949 (=> (not res!820987) (not e!699160))))

(assert (=> d!134949 (= res!820987 ((_ is Cons!27127) Nil!27128))))

(assert (=> d!134949 (= (contains!7193 Nil!27128 (select (arr!38358 a!3806) from!3184)) lt!559544)))

(declare-fun b!1232652 () Bool)

(declare-fun e!699159 () Bool)

(assert (=> b!1232652 (= e!699160 e!699159)))

(declare-fun res!820986 () Bool)

(assert (=> b!1232652 (=> res!820986 e!699159)))

(assert (=> b!1232652 (= res!820986 (= (h!28336 Nil!27128) (select (arr!38358 a!3806) from!3184)))))

(declare-fun b!1232653 () Bool)

(assert (=> b!1232653 (= e!699159 (contains!7193 (t!40594 Nil!27128) (select (arr!38358 a!3806) from!3184)))))

(assert (= (and d!134949 res!820987) b!1232652))

(assert (= (and b!1232652 (not res!820986)) b!1232653))

(declare-fun m!1136627 () Bool)

(assert (=> d!134949 m!1136627))

(assert (=> d!134949 m!1136429))

(declare-fun m!1136629 () Bool)

(assert (=> d!134949 m!1136629))

(assert (=> b!1232653 m!1136429))

(declare-fun m!1136631 () Bool)

(assert (=> b!1232653 m!1136631))

(assert (=> b!1232586 d!134949))

(assert (=> b!1232588 d!134887))

(assert (=> b!1232575 d!134943))

(declare-fun d!134951 () Bool)

(declare-fun res!820988 () Bool)

(declare-fun e!699161 () Bool)

(assert (=> d!134951 (=> res!820988 e!699161)))

(assert (=> d!134951 (= res!820988 ((_ is Nil!27128) (t!40594 acc!823)))))

(assert (=> d!134951 (= (noDuplicate!1790 (t!40594 acc!823)) e!699161)))

(declare-fun b!1232654 () Bool)

(declare-fun e!699162 () Bool)

(assert (=> b!1232654 (= e!699161 e!699162)))

(declare-fun res!820989 () Bool)

(assert (=> b!1232654 (=> (not res!820989) (not e!699162))))

(assert (=> b!1232654 (= res!820989 (not (contains!7193 (t!40594 (t!40594 acc!823)) (h!28336 (t!40594 acc!823)))))))

(declare-fun b!1232655 () Bool)

(assert (=> b!1232655 (= e!699162 (noDuplicate!1790 (t!40594 (t!40594 acc!823))))))

(assert (= (and d!134951 (not res!820988)) b!1232654))

(assert (= (and b!1232654 res!820989) b!1232655))

(declare-fun m!1136633 () Bool)

(assert (=> b!1232654 m!1136633))

(declare-fun m!1136635 () Bool)

(assert (=> b!1232655 m!1136635))

(assert (=> b!1232570 d!134951))

(declare-fun d!134953 () Bool)

(declare-fun lt!559545 () Bool)

(assert (=> d!134953 (= lt!559545 (select (content!569 (t!40594 acc!823)) (h!28336 acc!823)))))

(declare-fun e!699164 () Bool)

(assert (=> d!134953 (= lt!559545 e!699164)))

(declare-fun res!820991 () Bool)

(assert (=> d!134953 (=> (not res!820991) (not e!699164))))

(assert (=> d!134953 (= res!820991 ((_ is Cons!27127) (t!40594 acc!823)))))

(assert (=> d!134953 (= (contains!7193 (t!40594 acc!823) (h!28336 acc!823)) lt!559545)))

(declare-fun b!1232656 () Bool)

(declare-fun e!699163 () Bool)

(assert (=> b!1232656 (= e!699164 e!699163)))

(declare-fun res!820990 () Bool)

(assert (=> b!1232656 (=> res!820990 e!699163)))

(assert (=> b!1232656 (= res!820990 (= (h!28336 (t!40594 acc!823)) (h!28336 acc!823)))))

(declare-fun b!1232657 () Bool)

(assert (=> b!1232657 (= e!699163 (contains!7193 (t!40594 (t!40594 acc!823)) (h!28336 acc!823)))))

(assert (= (and d!134953 res!820991) b!1232656))

(assert (= (and b!1232656 (not res!820990)) b!1232657))

(assert (=> d!134953 m!1136619))

(declare-fun m!1136637 () Bool)

(assert (=> d!134953 m!1136637))

(declare-fun m!1136639 () Bool)

(assert (=> b!1232657 m!1136639))

(assert (=> b!1232569 d!134953))

(declare-fun d!134955 () Bool)

(declare-fun lt!559546 () Bool)

(assert (=> d!134955 (= lt!559546 (select (content!569 (t!40594 acc!823)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!699166 () Bool)

(assert (=> d!134955 (= lt!559546 e!699166)))

(declare-fun res!820993 () Bool)

(assert (=> d!134955 (=> (not res!820993) (not e!699166))))

(assert (=> d!134955 (= res!820993 ((_ is Cons!27127) (t!40594 acc!823)))))

(assert (=> d!134955 (= (contains!7193 (t!40594 acc!823) #b1000000000000000000000000000000000000000000000000000000000000000) lt!559546)))

(declare-fun b!1232658 () Bool)

(declare-fun e!699165 () Bool)

(assert (=> b!1232658 (= e!699166 e!699165)))

(declare-fun res!820992 () Bool)

(assert (=> b!1232658 (=> res!820992 e!699165)))

(assert (=> b!1232658 (= res!820992 (= (h!28336 (t!40594 acc!823)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1232659 () Bool)

(assert (=> b!1232659 (= e!699165 (contains!7193 (t!40594 (t!40594 acc!823)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!134955 res!820993) b!1232658))

(assert (= (and b!1232658 (not res!820992)) b!1232659))

(assert (=> d!134955 m!1136619))

(declare-fun m!1136641 () Bool)

(assert (=> d!134955 m!1136641))

(declare-fun m!1136643 () Bool)

(assert (=> b!1232659 m!1136643))

(assert (=> b!1232561 d!134955))

(assert (=> b!1232584 d!134887))

(declare-fun b!1232660 () Bool)

(declare-fun e!699168 () Bool)

(declare-fun e!699169 () Bool)

(assert (=> b!1232660 (= e!699168 e!699169)))

(declare-fun c!120693 () Bool)

(assert (=> b!1232660 (= c!120693 (validKeyInArray!0 (select (arr!38358 a!3806) (bvadd from!3184 #b00000000000000000000000000000001))))))

(declare-fun d!134957 () Bool)

(declare-fun res!820996 () Bool)

(declare-fun e!699167 () Bool)

(assert (=> d!134957 (=> res!820996 e!699167)))

(assert (=> d!134957 (= res!820996 (bvsge (bvadd from!3184 #b00000000000000000000000000000001) (size!38894 a!3806)))))

(assert (=> d!134957 (= (arrayNoDuplicates!0 a!3806 (bvadd from!3184 #b00000000000000000000000000000001) (ite c!120682 (Cons!27127 (select (arr!38358 a!3806) from!3184) Nil!27128) Nil!27128)) e!699167)))

(declare-fun b!1232661 () Bool)

(declare-fun call!60927 () Bool)

(assert (=> b!1232661 (= e!699169 call!60927)))

(declare-fun bm!60924 () Bool)

(assert (=> bm!60924 (= call!60927 (arrayNoDuplicates!0 a!3806 (bvadd from!3184 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!120693 (Cons!27127 (select (arr!38358 a!3806) (bvadd from!3184 #b00000000000000000000000000000001)) (ite c!120682 (Cons!27127 (select (arr!38358 a!3806) from!3184) Nil!27128) Nil!27128)) (ite c!120682 (Cons!27127 (select (arr!38358 a!3806) from!3184) Nil!27128) Nil!27128))))))

(declare-fun e!699170 () Bool)

(declare-fun b!1232662 () Bool)

(assert (=> b!1232662 (= e!699170 (contains!7193 (ite c!120682 (Cons!27127 (select (arr!38358 a!3806) from!3184) Nil!27128) Nil!27128) (select (arr!38358 a!3806) (bvadd from!3184 #b00000000000000000000000000000001))))))

(declare-fun b!1232663 () Bool)

(assert (=> b!1232663 (= e!699169 call!60927)))

(declare-fun b!1232664 () Bool)

(assert (=> b!1232664 (= e!699167 e!699168)))

(declare-fun res!820994 () Bool)

(assert (=> b!1232664 (=> (not res!820994) (not e!699168))))

(assert (=> b!1232664 (= res!820994 (not e!699170))))

(declare-fun res!820995 () Bool)

(assert (=> b!1232664 (=> (not res!820995) (not e!699170))))

(assert (=> b!1232664 (= res!820995 (validKeyInArray!0 (select (arr!38358 a!3806) (bvadd from!3184 #b00000000000000000000000000000001))))))

(assert (= (and d!134957 (not res!820996)) b!1232664))

(assert (= (and b!1232664 res!820995) b!1232662))

(assert (= (and b!1232664 res!820994) b!1232660))

(assert (= (and b!1232660 c!120693) b!1232661))

(assert (= (and b!1232660 (not c!120693)) b!1232663))

(assert (= (or b!1232661 b!1232663) bm!60924))

(declare-fun m!1136645 () Bool)

(assert (=> b!1232660 m!1136645))

(assert (=> b!1232660 m!1136645))

(declare-fun m!1136647 () Bool)

(assert (=> b!1232660 m!1136647))

(assert (=> bm!60924 m!1136645))

(declare-fun m!1136649 () Bool)

(assert (=> bm!60924 m!1136649))

(assert (=> b!1232662 m!1136645))

(assert (=> b!1232662 m!1136645))

(declare-fun m!1136651 () Bool)

(assert (=> b!1232662 m!1136651))

(assert (=> b!1232664 m!1136645))

(assert (=> b!1232664 m!1136645))

(assert (=> b!1232664 m!1136647))

(assert (=> bm!60916 d!134957))

(declare-fun d!134959 () Bool)

(declare-fun res!820997 () Bool)

(declare-fun e!699171 () Bool)

(assert (=> d!134959 (=> res!820997 e!699171)))

(assert (=> d!134959 (= res!820997 ((_ is Nil!27128) (t!40594 (Cons!27127 (select (arr!38358 a!3806) from!3184) Nil!27128))))))

(assert (=> d!134959 (= (noDuplicate!1790 (t!40594 (Cons!27127 (select (arr!38358 a!3806) from!3184) Nil!27128))) e!699171)))

(declare-fun b!1232665 () Bool)

(declare-fun e!699172 () Bool)

(assert (=> b!1232665 (= e!699171 e!699172)))

(declare-fun res!820998 () Bool)

(assert (=> b!1232665 (=> (not res!820998) (not e!699172))))

(assert (=> b!1232665 (= res!820998 (not (contains!7193 (t!40594 (t!40594 (Cons!27127 (select (arr!38358 a!3806) from!3184) Nil!27128))) (h!28336 (t!40594 (Cons!27127 (select (arr!38358 a!3806) from!3184) Nil!27128))))))))

(declare-fun b!1232666 () Bool)

(assert (=> b!1232666 (= e!699172 (noDuplicate!1790 (t!40594 (t!40594 (Cons!27127 (select (arr!38358 a!3806) from!3184) Nil!27128)))))))

(assert (= (and d!134959 (not res!820997)) b!1232665))

(assert (= (and b!1232665 res!820998) b!1232666))

(declare-fun m!1136653 () Bool)

(assert (=> b!1232665 m!1136653))

(declare-fun m!1136655 () Bool)

(assert (=> b!1232666 m!1136655))

(assert (=> b!1232533 d!134959))

(declare-fun lt!559547 () Bool)

(declare-fun d!134961 () Bool)

(assert (=> d!134961 (= lt!559547 (select (content!569 acc!823) (select (arr!38358 a!3806) from!3184)))))

(declare-fun e!699174 () Bool)

(assert (=> d!134961 (= lt!559547 e!699174)))

(declare-fun res!821000 () Bool)

(assert (=> d!134961 (=> (not res!821000) (not e!699174))))

(assert (=> d!134961 (= res!821000 ((_ is Cons!27127) acc!823))))

(assert (=> d!134961 (= (contains!7193 acc!823 (select (arr!38358 a!3806) from!3184)) lt!559547)))

(declare-fun b!1232667 () Bool)

(declare-fun e!699173 () Bool)

(assert (=> b!1232667 (= e!699174 e!699173)))

(declare-fun res!820999 () Bool)

(assert (=> b!1232667 (=> res!820999 e!699173)))

(assert (=> b!1232667 (= res!820999 (= (h!28336 acc!823) (select (arr!38358 a!3806) from!3184)))))

(declare-fun b!1232668 () Bool)

(assert (=> b!1232668 (= e!699173 (contains!7193 (t!40594 acc!823) (select (arr!38358 a!3806) from!3184)))))

(assert (= (and d!134961 res!821000) b!1232667))

(assert (= (and b!1232667 (not res!820999)) b!1232668))

(assert (=> d!134961 m!1136487))

(assert (=> d!134961 m!1136429))

(declare-fun m!1136657 () Bool)

(assert (=> d!134961 m!1136657))

(assert (=> b!1232668 m!1136429))

(declare-fun m!1136659 () Bool)

(assert (=> b!1232668 m!1136659))

(assert (=> b!1232493 d!134961))

(assert (=> d!134885 d!134947))

(declare-fun d!134963 () Bool)

(declare-fun lt!559548 () Bool)

(assert (=> d!134963 (= lt!559548 (select (content!569 (Cons!27127 (select (arr!38358 a!3806) from!3184) acc!823)) (select (arr!38358 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(declare-fun e!699176 () Bool)

(assert (=> d!134963 (= lt!559548 e!699176)))

(declare-fun res!821002 () Bool)

(assert (=> d!134963 (=> (not res!821002) (not e!699176))))

(assert (=> d!134963 (= res!821002 ((_ is Cons!27127) (Cons!27127 (select (arr!38358 a!3806) from!3184) acc!823)))))

(assert (=> d!134963 (= (contains!7193 (Cons!27127 (select (arr!38358 a!3806) from!3184) acc!823) (select (arr!38358 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))) lt!559548)))

(declare-fun b!1232669 () Bool)

(declare-fun e!699175 () Bool)

(assert (=> b!1232669 (= e!699176 e!699175)))

(declare-fun res!821001 () Bool)

(assert (=> b!1232669 (=> res!821001 e!699175)))

(assert (=> b!1232669 (= res!821001 (= (h!28336 (Cons!27127 (select (arr!38358 a!3806) from!3184) acc!823)) (select (arr!38358 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(declare-fun b!1232670 () Bool)

(assert (=> b!1232670 (= e!699175 (contains!7193 (t!40594 (Cons!27127 (select (arr!38358 a!3806) from!3184) acc!823)) (select (arr!38358 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(assert (= (and d!134963 res!821002) b!1232669))

(assert (= (and b!1232669 (not res!821001)) b!1232670))

(declare-fun m!1136661 () Bool)

(assert (=> d!134963 m!1136661))

(assert (=> d!134963 m!1136508))

(declare-fun m!1136663 () Bool)

(assert (=> d!134963 m!1136663))

(assert (=> b!1232670 m!1136508))

(declare-fun m!1136665 () Bool)

(assert (=> b!1232670 m!1136665))

(assert (=> b!1232617 d!134963))

(declare-fun d!134965 () Bool)

(declare-fun lt!559549 () Bool)

(assert (=> d!134965 (= lt!559549 (select (content!569 (t!40594 (Cons!27127 (select (arr!38358 a!3806) from!3184) Nil!27128))) (h!28336 (Cons!27127 (select (arr!38358 a!3806) from!3184) Nil!27128))))))

(declare-fun e!699178 () Bool)

(assert (=> d!134965 (= lt!559549 e!699178)))

(declare-fun res!821004 () Bool)

(assert (=> d!134965 (=> (not res!821004) (not e!699178))))

(assert (=> d!134965 (= res!821004 ((_ is Cons!27127) (t!40594 (Cons!27127 (select (arr!38358 a!3806) from!3184) Nil!27128))))))

(assert (=> d!134965 (= (contains!7193 (t!40594 (Cons!27127 (select (arr!38358 a!3806) from!3184) Nil!27128)) (h!28336 (Cons!27127 (select (arr!38358 a!3806) from!3184) Nil!27128))) lt!559549)))

(declare-fun b!1232671 () Bool)

(declare-fun e!699177 () Bool)

(assert (=> b!1232671 (= e!699178 e!699177)))

(declare-fun res!821003 () Bool)

(assert (=> b!1232671 (=> res!821003 e!699177)))

(assert (=> b!1232671 (= res!821003 (= (h!28336 (t!40594 (Cons!27127 (select (arr!38358 a!3806) from!3184) Nil!27128))) (h!28336 (Cons!27127 (select (arr!38358 a!3806) from!3184) Nil!27128))))))

(declare-fun b!1232672 () Bool)

(assert (=> b!1232672 (= e!699177 (contains!7193 (t!40594 (t!40594 (Cons!27127 (select (arr!38358 a!3806) from!3184) Nil!27128))) (h!28336 (Cons!27127 (select (arr!38358 a!3806) from!3184) Nil!27128))))))

(assert (= (and d!134965 res!821004) b!1232671))

(assert (= (and b!1232671 (not res!821003)) b!1232672))

(declare-fun m!1136667 () Bool)

(assert (=> d!134965 m!1136667))

(declare-fun m!1136669 () Bool)

(assert (=> d!134965 m!1136669))

(declare-fun m!1136671 () Bool)

(assert (=> b!1232672 m!1136671))

(assert (=> b!1232532 d!134965))

(declare-fun b!1232673 () Bool)

(declare-fun e!699180 () Bool)

(declare-fun e!699181 () Bool)

(assert (=> b!1232673 (= e!699180 e!699181)))

(declare-fun c!120694 () Bool)

(assert (=> b!1232673 (= c!120694 (validKeyInArray!0 (select (arr!38358 a!3806) (bvadd from!3184 #b00000000000000000000000000000001))))))

(declare-fun d!134967 () Bool)

(declare-fun res!821007 () Bool)

(declare-fun e!699179 () Bool)

(assert (=> d!134967 (=> res!821007 e!699179)))

(assert (=> d!134967 (= res!821007 (bvsge (bvadd from!3184 #b00000000000000000000000000000001) (size!38894 a!3806)))))

(assert (=> d!134967 (= (arrayNoDuplicates!0 a!3806 (bvadd from!3184 #b00000000000000000000000000000001) (ite c!120673 (Cons!27127 (select (arr!38358 a!3806) from!3184) acc!823) acc!823)) e!699179)))

(declare-fun b!1232674 () Bool)

(declare-fun call!60928 () Bool)

(assert (=> b!1232674 (= e!699181 call!60928)))

(declare-fun bm!60925 () Bool)

(assert (=> bm!60925 (= call!60928 (arrayNoDuplicates!0 a!3806 (bvadd from!3184 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!120694 (Cons!27127 (select (arr!38358 a!3806) (bvadd from!3184 #b00000000000000000000000000000001)) (ite c!120673 (Cons!27127 (select (arr!38358 a!3806) from!3184) acc!823) acc!823)) (ite c!120673 (Cons!27127 (select (arr!38358 a!3806) from!3184) acc!823) acc!823))))))

(declare-fun b!1232675 () Bool)

(declare-fun e!699182 () Bool)

(assert (=> b!1232675 (= e!699182 (contains!7193 (ite c!120673 (Cons!27127 (select (arr!38358 a!3806) from!3184) acc!823) acc!823) (select (arr!38358 a!3806) (bvadd from!3184 #b00000000000000000000000000000001))))))

(declare-fun b!1232676 () Bool)

(assert (=> b!1232676 (= e!699181 call!60928)))

(declare-fun b!1232677 () Bool)

(assert (=> b!1232677 (= e!699179 e!699180)))

(declare-fun res!821005 () Bool)

(assert (=> b!1232677 (=> (not res!821005) (not e!699180))))

(assert (=> b!1232677 (= res!821005 (not e!699182))))

(declare-fun res!821006 () Bool)

(assert (=> b!1232677 (=> (not res!821006) (not e!699182))))

(assert (=> b!1232677 (= res!821006 (validKeyInArray!0 (select (arr!38358 a!3806) (bvadd from!3184 #b00000000000000000000000000000001))))))

(assert (= (and d!134967 (not res!821007)) b!1232677))

(assert (= (and b!1232677 res!821006) b!1232675))

(assert (= (and b!1232677 res!821005) b!1232673))

(assert (= (and b!1232673 c!120694) b!1232674))

(assert (= (and b!1232673 (not c!120694)) b!1232676))

(assert (= (or b!1232674 b!1232676) bm!60925))

(assert (=> b!1232673 m!1136645))

(assert (=> b!1232673 m!1136645))

(assert (=> b!1232673 m!1136647))

(assert (=> bm!60925 m!1136645))

(declare-fun m!1136673 () Bool)

(assert (=> bm!60925 m!1136673))

(assert (=> b!1232675 m!1136645))

(assert (=> b!1232675 m!1136645))

(declare-fun m!1136675 () Bool)

(assert (=> b!1232675 m!1136675))

(assert (=> b!1232677 m!1136645))

(assert (=> b!1232677 m!1136645))

(assert (=> b!1232677 m!1136647))

(assert (=> bm!60907 d!134967))

(declare-fun b!1232678 () Bool)

(declare-fun e!699184 () Bool)

(declare-fun e!699185 () Bool)

(assert (=> b!1232678 (= e!699184 e!699185)))

(declare-fun c!120695 () Bool)

(assert (=> b!1232678 (= c!120695 (validKeyInArray!0 (select (arr!38358 a!3806) (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001))))))

(declare-fun d!134969 () Bool)

(declare-fun res!821010 () Bool)

(declare-fun e!699183 () Bool)

(assert (=> d!134969 (=> res!821010 e!699183)))

(assert (=> d!134969 (= res!821010 (bvsge (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001) (size!38894 a!3806)))))

(assert (=> d!134969 (= (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001) (ite c!120687 (Cons!27127 (select (arr!38358 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) (Cons!27127 (select (arr!38358 a!3806) from!3184) acc!823)) (Cons!27127 (select (arr!38358 a!3806) from!3184) acc!823))) e!699183)))

(declare-fun b!1232679 () Bool)

(declare-fun call!60929 () Bool)

(assert (=> b!1232679 (= e!699185 call!60929)))

(declare-fun bm!60926 () Bool)

(assert (=> bm!60926 (= call!60929 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!120695 (Cons!27127 (select (arr!38358 a!3806) (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001)) (ite c!120687 (Cons!27127 (select (arr!38358 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) (Cons!27127 (select (arr!38358 a!3806) from!3184) acc!823)) (Cons!27127 (select (arr!38358 a!3806) from!3184) acc!823))) (ite c!120687 (Cons!27127 (select (arr!38358 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) (Cons!27127 (select (arr!38358 a!3806) from!3184) acc!823)) (Cons!27127 (select (arr!38358 a!3806) from!3184) acc!823)))))))

(declare-fun e!699186 () Bool)

(declare-fun b!1232680 () Bool)

(assert (=> b!1232680 (= e!699186 (contains!7193 (ite c!120687 (Cons!27127 (select (arr!38358 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) (Cons!27127 (select (arr!38358 a!3806) from!3184) acc!823)) (Cons!27127 (select (arr!38358 a!3806) from!3184) acc!823)) (select (arr!38358 a!3806) (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001))))))

(declare-fun b!1232681 () Bool)

(assert (=> b!1232681 (= e!699185 call!60929)))

(declare-fun b!1232682 () Bool)

(assert (=> b!1232682 (= e!699183 e!699184)))

(declare-fun res!821008 () Bool)

(assert (=> b!1232682 (=> (not res!821008) (not e!699184))))

(assert (=> b!1232682 (= res!821008 (not e!699186))))

(declare-fun res!821009 () Bool)

(assert (=> b!1232682 (=> (not res!821009) (not e!699186))))

(assert (=> b!1232682 (= res!821009 (validKeyInArray!0 (select (arr!38358 a!3806) (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001))))))

(assert (= (and d!134969 (not res!821010)) b!1232682))

(assert (= (and b!1232682 res!821009) b!1232680))

(assert (= (and b!1232682 res!821008) b!1232678))

(assert (= (and b!1232678 c!120695) b!1232679))

(assert (= (and b!1232678 (not c!120695)) b!1232681))

(assert (= (or b!1232679 b!1232681) bm!60926))

(assert (=> b!1232678 m!1136611))

(assert (=> b!1232678 m!1136611))

(assert (=> b!1232678 m!1136613))

(assert (=> bm!60926 m!1136611))

(declare-fun m!1136677 () Bool)

(assert (=> bm!60926 m!1136677))

(assert (=> b!1232680 m!1136611))

(assert (=> b!1232680 m!1136611))

(declare-fun m!1136679 () Bool)

(assert (=> b!1232680 m!1136679))

(assert (=> b!1232682 m!1136611))

(assert (=> b!1232682 m!1136611))

(assert (=> b!1232682 m!1136613))

(assert (=> bm!60921 d!134969))

(assert (=> b!1232495 d!134887))

(declare-fun d!134971 () Bool)

(declare-fun res!821011 () Bool)

(declare-fun e!699187 () Bool)

(assert (=> d!134971 (=> res!821011 e!699187)))

(assert (=> d!134971 (= res!821011 (= (select (arr!38358 a!3806) (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001)) k0!2913))))

(assert (=> d!134971 (= (arrayContainsKey!0 a!3806 k0!2913 (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001)) e!699187)))

(declare-fun b!1232683 () Bool)

(declare-fun e!699188 () Bool)

(assert (=> b!1232683 (= e!699187 e!699188)))

(declare-fun res!821012 () Bool)

(assert (=> b!1232683 (=> (not res!821012) (not e!699188))))

(assert (=> b!1232683 (= res!821012 (bvslt (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!38894 a!3806)))))

(declare-fun b!1232684 () Bool)

(assert (=> b!1232684 (= e!699188 (arrayContainsKey!0 a!3806 k0!2913 (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!134971 (not res!821011)) b!1232683))

(assert (= (and b!1232683 res!821012) b!1232684))

(assert (=> d!134971 m!1136611))

(declare-fun m!1136681 () Bool)

(assert (=> b!1232684 m!1136681))

(assert (=> b!1232556 d!134971))

(assert (=> d!134911 d!134903))

(declare-fun d!134973 () Bool)

(assert (=> d!134973 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27128)))

(assert (=> d!134973 true))

(declare-fun _$70!89 () Unit!40822)

(assert (=> d!134973 (= (choose!80 a!3806 acc!823 Nil!27128 from!3184) _$70!89)))

(declare-fun bs!34640 () Bool)

(assert (= bs!34640 d!134973))

(assert (=> bs!34640 m!1136425))

(assert (=> d!134911 d!134973))

(assert (=> b!1232619 d!134943))

(check-sat (not b!1232654) (not bm!60924) (not b!1232668) (not d!134965) (not d!134945) (not b!1232675) (not b!1232673) (not b!1232682) (not b!1232678) (not b!1232677) (not b!1232653) (not d!134939) (not d!134955) (not b!1232638) (not b!1232639) (not b!1232651) (not b!1232684) (not b!1232657) (not d!134963) (not d!134961) (not b!1232672) (not b!1232664) (not b!1232645) (not bm!60925) (not bm!60926) (not b!1232641) (not b!1232680) (not d!134953) (not b!1232662) (not b!1232666) (not bm!60923) (not b!1232665) (not d!134973) (not b!1232643) (not b!1232655) (not b!1232659) (not b!1232670) (not d!134949) (not b!1232660))
(check-sat)
