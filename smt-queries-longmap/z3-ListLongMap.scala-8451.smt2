; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103078 () Bool)

(assert start!103078)

(declare-fun b!1237406 () Bool)

(declare-fun res!824633 () Bool)

(declare-fun e!701561 () Bool)

(assert (=> b!1237406 (=> (not res!824633) (not e!701561))))

(declare-datatypes ((array!79721 0))(
  ( (array!79722 (arr!38462 (Array (_ BitVec 32) (_ BitVec 64))) (size!38999 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79721)

(declare-fun from!3213 () (_ BitVec 32))

(declare-datatypes ((List!27248 0))(
  ( (Nil!27245) (Cons!27244 (h!28462 (_ BitVec 64)) (t!40703 List!27248)) )
))
(declare-fun acc!846 () List!27248)

(declare-fun arrayNoDuplicates!0 (array!79721 (_ BitVec 32) List!27248) Bool)

(assert (=> b!1237406 (= res!824633 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846))))

(declare-fun b!1237407 () Bool)

(assert (=> b!1237407 (= e!701561 (not true))))

(declare-fun k0!2925 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!79721 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1237407 (not (arrayContainsKey!0 a!3835 k0!2925 (bvadd #b00000000000000000000000000000001 from!3213)))))

(declare-datatypes ((Unit!40967 0))(
  ( (Unit!40968) )
))
(declare-fun lt!561158 () Unit!40967)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!79721 (_ BitVec 32) (_ BitVec 64) List!27248) Unit!40967)

(assert (=> b!1237407 (= lt!561158 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) k0!2925 acc!846))))

(declare-fun b!1237408 () Bool)

(declare-fun res!824637 () Bool)

(declare-fun e!701563 () Bool)

(assert (=> b!1237408 (=> (not res!824637) (not e!701563))))

(declare-fun contains!7319 (List!27248 (_ BitVec 64)) Bool)

(assert (=> b!1237408 (= res!824637 (contains!7319 acc!846 k0!2925))))

(declare-fun res!824636 () Bool)

(assert (=> start!103078 (=> (not res!824636) (not e!701563))))

(assert (=> start!103078 (= res!824636 (and (bvslt (size!38999 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!38999 a!3835))))))

(assert (=> start!103078 e!701563))

(declare-fun array_inv!29400 (array!79721) Bool)

(assert (=> start!103078 (array_inv!29400 a!3835)))

(assert (=> start!103078 true))

(declare-fun b!1237409 () Bool)

(declare-fun res!824629 () Bool)

(assert (=> b!1237409 (=> (not res!824629) (not e!701563))))

(assert (=> b!1237409 (= res!824629 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1237410 () Bool)

(declare-fun e!701562 () Unit!40967)

(declare-fun Unit!40969 () Unit!40967)

(assert (=> b!1237410 (= e!701562 Unit!40969)))

(declare-fun b!1237411 () Bool)

(declare-fun res!824635 () Bool)

(assert (=> b!1237411 (=> (not res!824635) (not e!701563))))

(assert (=> b!1237411 (= res!824635 (not (contains!7319 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1237412 () Bool)

(declare-fun res!824634 () Bool)

(assert (=> b!1237412 (=> (not res!824634) (not e!701563))))

(assert (=> b!1237412 (= res!824634 (not (= from!3213 (bvsub (size!38999 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1237413 () Bool)

(declare-fun res!824630 () Bool)

(assert (=> b!1237413 (=> (not res!824630) (not e!701563))))

(assert (=> b!1237413 (= res!824630 (not (contains!7319 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1237414 () Bool)

(assert (=> b!1237414 (= e!701563 e!701561)))

(declare-fun res!824631 () Bool)

(assert (=> b!1237414 (=> (not res!824631) (not e!701561))))

(assert (=> b!1237414 (= res!824631 (and (bvsge (bvadd #b00000000000000000000000000000001 from!3213) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3213) (size!38999 a!3835))))))

(declare-fun lt!561161 () Unit!40967)

(assert (=> b!1237414 (= lt!561161 e!701562)))

(declare-fun c!121256 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1237414 (= c!121256 (validKeyInArray!0 (select (arr!38462 a!3835) from!3213)))))

(declare-fun b!1237415 () Bool)

(declare-fun res!824632 () Bool)

(assert (=> b!1237415 (=> (not res!824632) (not e!701563))))

(declare-fun noDuplicate!1900 (List!27248) Bool)

(assert (=> b!1237415 (= res!824632 (noDuplicate!1900 acc!846))))

(declare-fun b!1237416 () Bool)

(declare-fun lt!561157 () Unit!40967)

(assert (=> b!1237416 (= e!701562 lt!561157)))

(declare-fun lt!561160 () List!27248)

(assert (=> b!1237416 (= lt!561160 (Cons!27244 (select (arr!38462 a!3835) from!3213) acc!846))))

(declare-fun lt!561159 () Unit!40967)

(declare-fun lemmaListSubSeqRefl!0 (List!27248) Unit!40967)

(assert (=> b!1237416 (= lt!561159 (lemmaListSubSeqRefl!0 lt!561160))))

(declare-fun subseq!557 (List!27248 List!27248) Bool)

(assert (=> b!1237416 (subseq!557 lt!561160 lt!561160)))

(declare-fun lt!561156 () Unit!40967)

(declare-fun subseqTail!50 (List!27248 List!27248) Unit!40967)

(assert (=> b!1237416 (= lt!561156 (subseqTail!50 lt!561160 lt!561160))))

(assert (=> b!1237416 (subseq!557 acc!846 lt!561160)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79721 List!27248 List!27248 (_ BitVec 32)) Unit!40967)

(assert (=> b!1237416 (= lt!561157 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3835 lt!561160 acc!846 (bvadd #b00000000000000000000000000000001 from!3213)))))

(assert (=> b!1237416 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846)))

(assert (= (and start!103078 res!824636) b!1237415))

(assert (= (and b!1237415 res!824632) b!1237413))

(assert (= (and b!1237413 res!824630) b!1237411))

(assert (= (and b!1237411 res!824635) b!1237409))

(assert (= (and b!1237409 res!824629) b!1237408))

(assert (= (and b!1237408 res!824637) b!1237412))

(assert (= (and b!1237412 res!824634) b!1237414))

(assert (= (and b!1237414 c!121256) b!1237416))

(assert (= (and b!1237414 (not c!121256)) b!1237410))

(assert (= (and b!1237414 res!824631) b!1237406))

(assert (= (and b!1237406 res!824633) b!1237407))

(declare-fun m!1141571 () Bool)

(assert (=> b!1237416 m!1141571))

(declare-fun m!1141573 () Bool)

(assert (=> b!1237416 m!1141573))

(declare-fun m!1141575 () Bool)

(assert (=> b!1237416 m!1141575))

(declare-fun m!1141577 () Bool)

(assert (=> b!1237416 m!1141577))

(declare-fun m!1141579 () Bool)

(assert (=> b!1237416 m!1141579))

(declare-fun m!1141581 () Bool)

(assert (=> b!1237416 m!1141581))

(declare-fun m!1141583 () Bool)

(assert (=> b!1237416 m!1141583))

(declare-fun m!1141585 () Bool)

(assert (=> b!1237409 m!1141585))

(declare-fun m!1141587 () Bool)

(assert (=> b!1237411 m!1141587))

(declare-fun m!1141589 () Bool)

(assert (=> b!1237415 m!1141589))

(declare-fun m!1141591 () Bool)

(assert (=> b!1237413 m!1141591))

(declare-fun m!1141593 () Bool)

(assert (=> b!1237407 m!1141593))

(declare-fun m!1141595 () Bool)

(assert (=> b!1237407 m!1141595))

(declare-fun m!1141597 () Bool)

(assert (=> start!103078 m!1141597))

(declare-fun m!1141599 () Bool)

(assert (=> b!1237408 m!1141599))

(assert (=> b!1237406 m!1141581))

(assert (=> b!1237414 m!1141583))

(assert (=> b!1237414 m!1141583))

(declare-fun m!1141601 () Bool)

(assert (=> b!1237414 m!1141601))

(check-sat (not b!1237413) (not b!1237407) (not b!1237406) (not start!103078) (not b!1237414) (not b!1237409) (not b!1237411) (not b!1237416) (not b!1237408) (not b!1237415))
(check-sat)
