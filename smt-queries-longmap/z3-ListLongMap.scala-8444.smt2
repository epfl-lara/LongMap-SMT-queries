; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!102800 () Bool)

(assert start!102800)

(declare-fun b!1235471 () Bool)

(declare-datatypes ((Unit!40934 0))(
  ( (Unit!40935) )
))
(declare-fun e!700458 () Unit!40934)

(declare-fun lt!560311 () Unit!40934)

(assert (=> b!1235471 (= e!700458 lt!560311)))

(declare-datatypes ((List!27203 0))(
  ( (Nil!27200) (Cons!27199 (h!28408 (_ BitVec 64)) (t!40666 List!27203)) )
))
(declare-fun lt!560315 () List!27203)

(declare-datatypes ((array!79645 0))(
  ( (array!79646 (arr!38430 (Array (_ BitVec 32) (_ BitVec 64))) (size!38966 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79645)

(declare-fun acc!846 () List!27203)

(declare-fun from!3213 () (_ BitVec 32))

(assert (=> b!1235471 (= lt!560315 (Cons!27199 (select (arr!38430 a!3835) from!3213) acc!846))))

(declare-fun lt!560310 () Unit!40934)

(declare-fun lemmaListSubSeqRefl!0 (List!27203) Unit!40934)

(assert (=> b!1235471 (= lt!560310 (lemmaListSubSeqRefl!0 lt!560315))))

(declare-fun subseq!537 (List!27203 List!27203) Bool)

(assert (=> b!1235471 (subseq!537 lt!560315 lt!560315)))

(declare-fun lt!560313 () Unit!40934)

(declare-fun subseqTail!30 (List!27203 List!27203) Unit!40934)

(assert (=> b!1235471 (= lt!560313 (subseqTail!30 lt!560315 lt!560315))))

(assert (=> b!1235471 (subseq!537 acc!846 lt!560315)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79645 List!27203 List!27203 (_ BitVec 32)) Unit!40934)

(assert (=> b!1235471 (= lt!560311 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3835 lt!560315 acc!846 (bvadd #b00000000000000000000000000000001 from!3213)))))

(declare-fun arrayNoDuplicates!0 (array!79645 (_ BitVec 32) List!27203) Bool)

(assert (=> b!1235471 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846)))

(declare-fun b!1235472 () Bool)

(declare-fun res!823609 () Bool)

(declare-fun e!700461 () Bool)

(assert (=> b!1235472 (=> (not res!823609) (not e!700461))))

(declare-fun contains!7265 (List!27203 (_ BitVec 64)) Bool)

(assert (=> b!1235472 (= res!823609 (not (contains!7265 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1235473 () Bool)

(declare-fun res!823610 () Bool)

(assert (=> b!1235473 (=> (not res!823610) (not e!700461))))

(assert (=> b!1235473 (= res!823610 (not (= from!3213 (bvsub (size!38966 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1235474 () Bool)

(declare-fun Unit!40936 () Unit!40934)

(assert (=> b!1235474 (= e!700458 Unit!40936)))

(declare-fun b!1235475 () Bool)

(declare-fun res!823605 () Bool)

(assert (=> b!1235475 (=> (not res!823605) (not e!700461))))

(assert (=> b!1235475 (= res!823605 (not (contains!7265 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1235476 () Bool)

(declare-fun e!700460 () Bool)

(assert (=> b!1235476 (= e!700461 e!700460)))

(declare-fun res!823608 () Bool)

(assert (=> b!1235476 (=> (not res!823608) (not e!700460))))

(assert (=> b!1235476 (= res!823608 (and (bvsge (bvadd #b00000000000000000000000000000001 from!3213) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3213) (size!38966 a!3835))))))

(declare-fun lt!560312 () Unit!40934)

(assert (=> b!1235476 (= lt!560312 e!700458)))

(declare-fun c!120793 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1235476 (= c!120793 (validKeyInArray!0 (select (arr!38430 a!3835) from!3213)))))

(declare-fun b!1235478 () Bool)

(assert (=> b!1235478 (= e!700460 false)))

(declare-fun lt!560314 () Bool)

(assert (=> b!1235478 (= lt!560314 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846))))

(declare-fun b!1235479 () Bool)

(declare-fun res!823612 () Bool)

(assert (=> b!1235479 (=> (not res!823612) (not e!700461))))

(assert (=> b!1235479 (= res!823612 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1235480 () Bool)

(declare-fun res!823606 () Bool)

(assert (=> b!1235480 (=> (not res!823606) (not e!700461))))

(declare-fun noDuplicate!1862 (List!27203) Bool)

(assert (=> b!1235480 (= res!823606 (noDuplicate!1862 acc!846))))

(declare-fun b!1235477 () Bool)

(declare-fun res!823611 () Bool)

(assert (=> b!1235477 (=> (not res!823611) (not e!700461))))

(declare-fun k0!2925 () (_ BitVec 64))

(assert (=> b!1235477 (= res!823611 (contains!7265 acc!846 k0!2925))))

(declare-fun res!823607 () Bool)

(assert (=> start!102800 (=> (not res!823607) (not e!700461))))

(assert (=> start!102800 (= res!823607 (and (bvslt (size!38966 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!38966 a!3835))))))

(assert (=> start!102800 e!700461))

(declare-fun array_inv!29278 (array!79645) Bool)

(assert (=> start!102800 (array_inv!29278 a!3835)))

(assert (=> start!102800 true))

(assert (= (and start!102800 res!823607) b!1235480))

(assert (= (and b!1235480 res!823606) b!1235472))

(assert (= (and b!1235472 res!823609) b!1235475))

(assert (= (and b!1235475 res!823605) b!1235479))

(assert (= (and b!1235479 res!823612) b!1235477))

(assert (= (and b!1235477 res!823611) b!1235473))

(assert (= (and b!1235473 res!823610) b!1235476))

(assert (= (and b!1235476 c!120793) b!1235471))

(assert (= (and b!1235476 (not c!120793)) b!1235474))

(assert (= (and b!1235476 res!823608) b!1235478))

(declare-fun m!1139351 () Bool)

(assert (=> b!1235471 m!1139351))

(declare-fun m!1139353 () Bool)

(assert (=> b!1235471 m!1139353))

(declare-fun m!1139355 () Bool)

(assert (=> b!1235471 m!1139355))

(declare-fun m!1139357 () Bool)

(assert (=> b!1235471 m!1139357))

(declare-fun m!1139359 () Bool)

(assert (=> b!1235471 m!1139359))

(declare-fun m!1139361 () Bool)

(assert (=> b!1235471 m!1139361))

(declare-fun m!1139363 () Bool)

(assert (=> b!1235471 m!1139363))

(declare-fun m!1139365 () Bool)

(assert (=> b!1235472 m!1139365))

(assert (=> b!1235476 m!1139363))

(assert (=> b!1235476 m!1139363))

(declare-fun m!1139367 () Bool)

(assert (=> b!1235476 m!1139367))

(declare-fun m!1139369 () Bool)

(assert (=> start!102800 m!1139369))

(assert (=> b!1235478 m!1139355))

(declare-fun m!1139371 () Bool)

(assert (=> b!1235479 m!1139371))

(declare-fun m!1139373 () Bool)

(assert (=> b!1235480 m!1139373))

(declare-fun m!1139375 () Bool)

(assert (=> b!1235477 m!1139375))

(declare-fun m!1139377 () Bool)

(assert (=> b!1235475 m!1139377))

(check-sat (not b!1235478) (not b!1235479) (not b!1235475) (not b!1235480) (not start!102800) (not b!1235476) (not b!1235477) (not b!1235472) (not b!1235471))
(check-sat)
