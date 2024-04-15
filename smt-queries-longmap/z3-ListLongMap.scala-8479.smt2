; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103282 () Bool)

(assert start!103282)

(declare-fun b!1239389 () Bool)

(declare-fun res!826866 () Bool)

(declare-fun e!702386 () Bool)

(assert (=> b!1239389 (=> (not res!826866) (not e!702386))))

(declare-datatypes ((List!27369 0))(
  ( (Nil!27366) (Cons!27365 (h!28574 (_ BitVec 64)) (t!40823 List!27369)) )
))
(declare-fun acc!846 () List!27369)

(declare-fun contains!7341 (List!27369 (_ BitVec 64)) Bool)

(assert (=> b!1239389 (= res!826866 (not (contains!7341 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1239390 () Bool)

(declare-fun res!826865 () Bool)

(assert (=> b!1239390 (=> (not res!826865) (not e!702386))))

(declare-fun noDuplicate!1984 (List!27369) Bool)

(assert (=> b!1239390 (= res!826865 (noDuplicate!1984 acc!846))))

(declare-fun res!826864 () Bool)

(assert (=> start!103282 (=> (not res!826864) (not e!702386))))

(declare-datatypes ((array!79789 0))(
  ( (array!79790 (arr!38495 (Array (_ BitVec 32) (_ BitVec 64))) (size!39033 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79789)

(declare-fun from!3213 () (_ BitVec 32))

(assert (=> start!103282 (= res!826864 (and (bvslt (size!39033 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!39033 a!3835))))))

(assert (=> start!103282 e!702386))

(declare-fun array_inv!29478 (array!79789) Bool)

(assert (=> start!103282 (array_inv!29478 a!3835)))

(assert (=> start!103282 true))

(declare-fun b!1239391 () Bool)

(declare-fun res!826863 () Bool)

(assert (=> b!1239391 (=> (not res!826863) (not e!702386))))

(assert (=> b!1239391 (= res!826863 (not (= from!3213 (bvsub (size!39033 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1239392 () Bool)

(declare-fun res!826868 () Bool)

(assert (=> b!1239392 (=> (not res!826868) (not e!702386))))

(declare-fun arrayNoDuplicates!0 (array!79789 (_ BitVec 32) List!27369) Bool)

(assert (=> b!1239392 (= res!826868 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1239393 () Bool)

(declare-datatypes ((Unit!41028 0))(
  ( (Unit!41029) )
))
(declare-fun e!702383 () Unit!41028)

(declare-fun lt!561547 () Unit!41028)

(assert (=> b!1239393 (= e!702383 lt!561547)))

(declare-fun lt!561548 () List!27369)

(assert (=> b!1239393 (= lt!561548 (Cons!27365 (select (arr!38495 a!3835) from!3213) acc!846))))

(declare-fun lt!561546 () Unit!41028)

(declare-fun lemmaListSubSeqRefl!0 (List!27369) Unit!41028)

(assert (=> b!1239393 (= lt!561546 (lemmaListSubSeqRefl!0 lt!561548))))

(declare-fun subseq!623 (List!27369 List!27369) Bool)

(assert (=> b!1239393 (subseq!623 lt!561548 lt!561548)))

(declare-fun lt!561544 () Unit!41028)

(declare-fun subseqTail!110 (List!27369 List!27369) Unit!41028)

(assert (=> b!1239393 (= lt!561544 (subseqTail!110 lt!561548 lt!561548))))

(assert (=> b!1239393 (subseq!623 acc!846 lt!561548)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79789 List!27369 List!27369 (_ BitVec 32)) Unit!41028)

(assert (=> b!1239393 (= lt!561547 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3835 lt!561548 acc!846 (bvadd #b00000000000000000000000000000001 from!3213)))))

(assert (=> b!1239393 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846)))

(declare-fun b!1239394 () Bool)

(declare-fun res!826867 () Bool)

(declare-fun e!702385 () Bool)

(assert (=> b!1239394 (=> (not res!826867) (not e!702385))))

(assert (=> b!1239394 (= res!826867 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846))))

(declare-fun b!1239395 () Bool)

(declare-fun res!826871 () Bool)

(assert (=> b!1239395 (=> (not res!826871) (not e!702386))))

(assert (=> b!1239395 (= res!826871 (not (contains!7341 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1239396 () Bool)

(assert (=> b!1239396 (= e!702386 e!702385)))

(declare-fun res!826869 () Bool)

(assert (=> b!1239396 (=> (not res!826869) (not e!702385))))

(assert (=> b!1239396 (= res!826869 (and (bvsge (bvadd #b00000000000000000000000000000001 from!3213) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3213) (size!39033 a!3835))))))

(declare-fun lt!561545 () Unit!41028)

(assert (=> b!1239396 (= lt!561545 e!702383)))

(declare-fun c!121126 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1239396 (= c!121126 (validKeyInArray!0 (select (arr!38495 a!3835) from!3213)))))

(declare-fun b!1239397 () Bool)

(assert (=> b!1239397 (= e!702385 (bvsge (bvsub (size!39033 a!3835) (bvadd #b00000000000000000000000000000001 from!3213)) (bvsub (size!39033 a!3835) from!3213)))))

(declare-fun b!1239398 () Bool)

(declare-fun Unit!41030 () Unit!41028)

(assert (=> b!1239398 (= e!702383 Unit!41030)))

(declare-fun b!1239399 () Bool)

(declare-fun res!826870 () Bool)

(assert (=> b!1239399 (=> (not res!826870) (not e!702386))))

(declare-fun k0!2925 () (_ BitVec 64))

(assert (=> b!1239399 (= res!826870 (contains!7341 acc!846 k0!2925))))

(assert (= (and start!103282 res!826864) b!1239390))

(assert (= (and b!1239390 res!826865) b!1239395))

(assert (= (and b!1239395 res!826871) b!1239389))

(assert (= (and b!1239389 res!826866) b!1239392))

(assert (= (and b!1239392 res!826868) b!1239399))

(assert (= (and b!1239399 res!826870) b!1239391))

(assert (= (and b!1239391 res!826863) b!1239396))

(assert (= (and b!1239396 c!121126) b!1239393))

(assert (= (and b!1239396 (not c!121126)) b!1239398))

(assert (= (and b!1239396 res!826869) b!1239394))

(assert (= (and b!1239394 res!826867) b!1239397))

(declare-fun m!1142403 () Bool)

(assert (=> b!1239395 m!1142403))

(declare-fun m!1142405 () Bool)

(assert (=> b!1239393 m!1142405))

(declare-fun m!1142407 () Bool)

(assert (=> b!1239393 m!1142407))

(declare-fun m!1142409 () Bool)

(assert (=> b!1239393 m!1142409))

(declare-fun m!1142411 () Bool)

(assert (=> b!1239393 m!1142411))

(declare-fun m!1142413 () Bool)

(assert (=> b!1239393 m!1142413))

(declare-fun m!1142415 () Bool)

(assert (=> b!1239393 m!1142415))

(declare-fun m!1142417 () Bool)

(assert (=> b!1239393 m!1142417))

(declare-fun m!1142419 () Bool)

(assert (=> b!1239390 m!1142419))

(declare-fun m!1142421 () Bool)

(assert (=> start!103282 m!1142421))

(declare-fun m!1142423 () Bool)

(assert (=> b!1239392 m!1142423))

(assert (=> b!1239394 m!1142409))

(declare-fun m!1142425 () Bool)

(assert (=> b!1239399 m!1142425))

(assert (=> b!1239396 m!1142411))

(assert (=> b!1239396 m!1142411))

(declare-fun m!1142427 () Bool)

(assert (=> b!1239396 m!1142427))

(declare-fun m!1142429 () Bool)

(assert (=> b!1239389 m!1142429))

(check-sat (not b!1239390) (not start!103282) (not b!1239392) (not b!1239399) (not b!1239395) (not b!1239396) (not b!1239389) (not b!1239394) (not b!1239393))
(check-sat)
