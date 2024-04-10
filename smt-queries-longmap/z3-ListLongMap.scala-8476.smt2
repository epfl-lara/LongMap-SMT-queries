; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103214 () Bool)

(assert start!103214)

(declare-fun b!1239000 () Bool)

(declare-fun e!702146 () Bool)

(assert (=> b!1239000 (= e!702146 false)))

(declare-datatypes ((Unit!41155 0))(
  ( (Unit!41156) )
))
(declare-fun lt!561547 () Unit!41155)

(declare-fun e!702145 () Unit!41155)

(assert (=> b!1239000 (= lt!561547 e!702145)))

(declare-fun c!121078 () Bool)

(declare-datatypes ((array!79849 0))(
  ( (array!79850 (arr!38526 (Array (_ BitVec 32) (_ BitVec 64))) (size!39062 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79849)

(declare-fun from!3213 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1239000 (= c!121078 (validKeyInArray!0 (select (arr!38526 a!3835) from!3213)))))

(declare-fun b!1239001 () Bool)

(declare-fun res!826569 () Bool)

(assert (=> b!1239001 (=> (not res!826569) (not e!702146))))

(declare-datatypes ((List!27299 0))(
  ( (Nil!27296) (Cons!27295 (h!28504 (_ BitVec 64)) (t!40762 List!27299)) )
))
(declare-fun acc!846 () List!27299)

(declare-fun contains!7361 (List!27299 (_ BitVec 64)) Bool)

(assert (=> b!1239001 (= res!826569 (not (contains!7361 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1239002 () Bool)

(declare-fun res!826564 () Bool)

(assert (=> b!1239002 (=> (not res!826564) (not e!702146))))

(declare-fun arrayNoDuplicates!0 (array!79849 (_ BitVec 32) List!27299) Bool)

(assert (=> b!1239002 (= res!826564 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun res!826568 () Bool)

(assert (=> start!103214 (=> (not res!826568) (not e!702146))))

(assert (=> start!103214 (= res!826568 (and (bvslt (size!39062 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!39062 a!3835))))))

(assert (=> start!103214 e!702146))

(declare-fun array_inv!29374 (array!79849) Bool)

(assert (=> start!103214 (array_inv!29374 a!3835)))

(assert (=> start!103214 true))

(declare-fun b!1239003 () Bool)

(declare-fun res!826567 () Bool)

(assert (=> b!1239003 (=> (not res!826567) (not e!702146))))

(assert (=> b!1239003 (= res!826567 (not (= from!3213 (bvsub (size!39062 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1239004 () Bool)

(declare-fun res!826565 () Bool)

(assert (=> b!1239004 (=> (not res!826565) (not e!702146))))

(assert (=> b!1239004 (= res!826565 (not (contains!7361 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1239005 () Bool)

(declare-fun res!826566 () Bool)

(assert (=> b!1239005 (=> (not res!826566) (not e!702146))))

(declare-fun noDuplicate!1958 (List!27299) Bool)

(assert (=> b!1239005 (= res!826566 (noDuplicate!1958 acc!846))))

(declare-fun b!1239006 () Bool)

(declare-fun Unit!41157 () Unit!41155)

(assert (=> b!1239006 (= e!702145 Unit!41157)))

(declare-fun b!1239007 () Bool)

(declare-fun res!826570 () Bool)

(assert (=> b!1239007 (=> (not res!826570) (not e!702146))))

(declare-fun k0!2925 () (_ BitVec 64))

(assert (=> b!1239007 (= res!826570 (contains!7361 acc!846 k0!2925))))

(declare-fun b!1239008 () Bool)

(declare-fun lt!561551 () Unit!41155)

(assert (=> b!1239008 (= e!702145 lt!561551)))

(declare-fun lt!561548 () List!27299)

(assert (=> b!1239008 (= lt!561548 (Cons!27295 (select (arr!38526 a!3835) from!3213) acc!846))))

(declare-fun lt!561550 () Unit!41155)

(declare-fun lemmaListSubSeqRefl!0 (List!27299) Unit!41155)

(assert (=> b!1239008 (= lt!561550 (lemmaListSubSeqRefl!0 lt!561548))))

(declare-fun subseq!615 (List!27299 List!27299) Bool)

(assert (=> b!1239008 (subseq!615 lt!561548 lt!561548)))

(declare-fun lt!561549 () Unit!41155)

(declare-fun subseqTail!102 (List!27299 List!27299) Unit!41155)

(assert (=> b!1239008 (= lt!561549 (subseqTail!102 lt!561548 lt!561548))))

(assert (=> b!1239008 (subseq!615 acc!846 lt!561548)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79849 List!27299 List!27299 (_ BitVec 32)) Unit!41155)

(assert (=> b!1239008 (= lt!561551 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3835 lt!561548 acc!846 (bvadd #b00000000000000000000000000000001 from!3213)))))

(assert (=> b!1239008 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846)))

(assert (= (and start!103214 res!826568) b!1239005))

(assert (= (and b!1239005 res!826566) b!1239004))

(assert (= (and b!1239004 res!826565) b!1239001))

(assert (= (and b!1239001 res!826569) b!1239002))

(assert (= (and b!1239002 res!826564) b!1239007))

(assert (= (and b!1239007 res!826570) b!1239003))

(assert (= (and b!1239003 res!826567) b!1239000))

(assert (= (and b!1239000 c!121078) b!1239008))

(assert (= (and b!1239000 (not c!121078)) b!1239006))

(declare-fun m!1142519 () Bool)

(assert (=> b!1239001 m!1142519))

(declare-fun m!1142521 () Bool)

(assert (=> b!1239008 m!1142521))

(declare-fun m!1142523 () Bool)

(assert (=> b!1239008 m!1142523))

(declare-fun m!1142525 () Bool)

(assert (=> b!1239008 m!1142525))

(declare-fun m!1142527 () Bool)

(assert (=> b!1239008 m!1142527))

(declare-fun m!1142529 () Bool)

(assert (=> b!1239008 m!1142529))

(declare-fun m!1142531 () Bool)

(assert (=> b!1239008 m!1142531))

(declare-fun m!1142533 () Bool)

(assert (=> b!1239008 m!1142533))

(declare-fun m!1142535 () Bool)

(assert (=> start!103214 m!1142535))

(declare-fun m!1142537 () Bool)

(assert (=> b!1239004 m!1142537))

(declare-fun m!1142539 () Bool)

(assert (=> b!1239002 m!1142539))

(assert (=> b!1239000 m!1142533))

(assert (=> b!1239000 m!1142533))

(declare-fun m!1142541 () Bool)

(assert (=> b!1239000 m!1142541))

(declare-fun m!1142543 () Bool)

(assert (=> b!1239005 m!1142543))

(declare-fun m!1142545 () Bool)

(assert (=> b!1239007 m!1142545))

(check-sat (not b!1239002) (not start!103214) (not b!1239001) (not b!1239000) (not b!1239008) (not b!1239004) (not b!1239007) (not b!1239005))
