; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103222 () Bool)

(assert start!103222)

(declare-fun b!1238519 () Bool)

(declare-fun res!825599 () Bool)

(declare-fun e!702107 () Bool)

(assert (=> b!1238519 (=> (not res!825599) (not e!702107))))

(declare-datatypes ((List!27284 0))(
  ( (Nil!27281) (Cons!27280 (h!28498 (_ BitVec 64)) (t!40739 List!27284)) )
))
(declare-fun acc!846 () List!27284)

(declare-fun noDuplicate!1936 (List!27284) Bool)

(assert (=> b!1238519 (= res!825599 (noDuplicate!1936 acc!846))))

(declare-fun b!1238520 () Bool)

(declare-fun res!825603 () Bool)

(assert (=> b!1238520 (=> (not res!825603) (not e!702107))))

(declare-fun k0!2925 () (_ BitVec 64))

(declare-fun contains!7355 (List!27284 (_ BitVec 64)) Bool)

(assert (=> b!1238520 (= res!825603 (contains!7355 acc!846 k0!2925))))

(declare-fun b!1238521 () Bool)

(declare-fun res!825602 () Bool)

(assert (=> b!1238521 (=> (not res!825602) (not e!702107))))

(assert (=> b!1238521 (= res!825602 (not (contains!7355 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1238522 () Bool)

(declare-fun res!825596 () Bool)

(assert (=> b!1238522 (=> (not res!825596) (not e!702107))))

(declare-datatypes ((array!79796 0))(
  ( (array!79797 (arr!38498 (Array (_ BitVec 32) (_ BitVec 64))) (size!39035 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79796)

(declare-fun from!3213 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!79796 (_ BitVec 32) List!27284) Bool)

(assert (=> b!1238522 (= res!825596 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1238523 () Bool)

(declare-fun res!825600 () Bool)

(assert (=> b!1238523 (=> (not res!825600) (not e!702107))))

(assert (=> b!1238523 (= res!825600 (not (= from!3213 (bvsub (size!39035 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1238524 () Bool)

(declare-fun res!825598 () Bool)

(assert (=> b!1238524 (=> (not res!825598) (not e!702107))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1238524 (= res!825598 (validKeyInArray!0 (select (arr!38498 a!3835) from!3213)))))

(declare-fun b!1238525 () Bool)

(assert (=> b!1238525 (= e!702107 (not true))))

(declare-fun lt!561445 () List!27284)

(declare-fun subseq!575 (List!27284 List!27284) Bool)

(assert (=> b!1238525 (subseq!575 acc!846 lt!561445)))

(declare-datatypes ((Unit!41019 0))(
  ( (Unit!41020) )
))
(declare-fun lt!561444 () Unit!41019)

(declare-fun subseqTail!62 (List!27284 List!27284) Unit!41019)

(assert (=> b!1238525 (= lt!561444 (subseqTail!62 lt!561445 lt!561445))))

(assert (=> b!1238525 (subseq!575 lt!561445 lt!561445)))

(declare-fun lt!561446 () Unit!41019)

(declare-fun lemmaListSubSeqRefl!0 (List!27284) Unit!41019)

(assert (=> b!1238525 (= lt!561446 (lemmaListSubSeqRefl!0 lt!561445))))

(assert (=> b!1238525 (= lt!561445 (Cons!27280 (select (arr!38498 a!3835) from!3213) acc!846))))

(declare-fun res!825601 () Bool)

(assert (=> start!103222 (=> (not res!825601) (not e!702107))))

(assert (=> start!103222 (= res!825601 (and (bvslt (size!39035 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!39035 a!3835))))))

(assert (=> start!103222 e!702107))

(declare-fun array_inv!29436 (array!79796) Bool)

(assert (=> start!103222 (array_inv!29436 a!3835)))

(assert (=> start!103222 true))

(declare-fun b!1238526 () Bool)

(declare-fun res!825597 () Bool)

(assert (=> b!1238526 (=> (not res!825597) (not e!702107))))

(assert (=> b!1238526 (= res!825597 (not (contains!7355 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!103222 res!825601) b!1238519))

(assert (= (and b!1238519 res!825599) b!1238521))

(assert (= (and b!1238521 res!825602) b!1238526))

(assert (= (and b!1238526 res!825597) b!1238522))

(assert (= (and b!1238522 res!825596) b!1238520))

(assert (= (and b!1238520 res!825603) b!1238523))

(assert (= (and b!1238523 res!825600) b!1238524))

(assert (= (and b!1238524 res!825598) b!1238525))

(declare-fun m!1142561 () Bool)

(assert (=> start!103222 m!1142561))

(declare-fun m!1142563 () Bool)

(assert (=> b!1238522 m!1142563))

(declare-fun m!1142565 () Bool)

(assert (=> b!1238520 m!1142565))

(declare-fun m!1142567 () Bool)

(assert (=> b!1238521 m!1142567))

(declare-fun m!1142569 () Bool)

(assert (=> b!1238525 m!1142569))

(declare-fun m!1142571 () Bool)

(assert (=> b!1238525 m!1142571))

(declare-fun m!1142573 () Bool)

(assert (=> b!1238525 m!1142573))

(declare-fun m!1142575 () Bool)

(assert (=> b!1238525 m!1142575))

(declare-fun m!1142577 () Bool)

(assert (=> b!1238525 m!1142577))

(declare-fun m!1142579 () Bool)

(assert (=> b!1238526 m!1142579))

(assert (=> b!1238524 m!1142577))

(assert (=> b!1238524 m!1142577))

(declare-fun m!1142581 () Bool)

(assert (=> b!1238524 m!1142581))

(declare-fun m!1142583 () Bool)

(assert (=> b!1238519 m!1142583))

(check-sat (not b!1238519) (not b!1238522) (not b!1238520) (not b!1238526) (not b!1238525) (not b!1238521) (not start!103222) (not b!1238524))
(check-sat)
