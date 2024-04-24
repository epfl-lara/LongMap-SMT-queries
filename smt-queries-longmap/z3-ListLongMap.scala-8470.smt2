; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103360 () Bool)

(assert start!103360)

(declare-fun res!826465 () Bool)

(declare-fun e!702630 () Bool)

(assert (=> start!103360 (=> (not res!826465) (not e!702630))))

(declare-datatypes ((array!79844 0))(
  ( (array!79845 (arr!38519 (Array (_ BitVec 32) (_ BitVec 64))) (size!39056 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79844)

(declare-fun from!3213 () (_ BitVec 32))

(assert (=> start!103360 (= res!826465 (and (bvslt (size!39056 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!39056 a!3835))))))

(assert (=> start!103360 e!702630))

(declare-fun array_inv!29457 (array!79844) Bool)

(assert (=> start!103360 (array_inv!29457 a!3835)))

(assert (=> start!103360 true))

(declare-fun b!1239524 () Bool)

(declare-fun res!826462 () Bool)

(declare-fun e!702632 () Bool)

(assert (=> b!1239524 (=> res!826462 e!702632)))

(declare-datatypes ((List!27305 0))(
  ( (Nil!27302) (Cons!27301 (h!28519 (_ BitVec 64)) (t!40760 List!27305)) )
))
(declare-fun lt!561717 () List!27305)

(declare-fun noDuplicate!1957 (List!27305) Bool)

(assert (=> b!1239524 (= res!826462 (not (noDuplicate!1957 lt!561717)))))

(declare-fun b!1239525 () Bool)

(declare-fun res!826467 () Bool)

(assert (=> b!1239525 (=> (not res!826467) (not e!702630))))

(declare-fun acc!846 () List!27305)

(declare-fun contains!7376 (List!27305 (_ BitVec 64)) Bool)

(assert (=> b!1239525 (= res!826467 (not (contains!7376 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1239526 () Bool)

(declare-fun res!826460 () Bool)

(assert (=> b!1239526 (=> (not res!826460) (not e!702630))))

(assert (=> b!1239526 (= res!826460 (not (contains!7376 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1239527 () Bool)

(assert (=> b!1239527 (= e!702632 true)))

(declare-fun lt!561716 () Bool)

(assert (=> b!1239527 (= lt!561716 (contains!7376 lt!561717 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1239528 () Bool)

(assert (=> b!1239528 (= e!702630 (not e!702632))))

(declare-fun res!826461 () Bool)

(assert (=> b!1239528 (=> res!826461 e!702632)))

(assert (=> b!1239528 (= res!826461 (bvslt (bvadd #b00000000000000000000000000000001 from!3213) #b00000000000000000000000000000000))))

(declare-fun subseq!596 (List!27305 List!27305) Bool)

(assert (=> b!1239528 (subseq!596 acc!846 lt!561717)))

(declare-datatypes ((Unit!41071 0))(
  ( (Unit!41072) )
))
(declare-fun lt!561719 () Unit!41071)

(declare-fun subseqTail!83 (List!27305 List!27305) Unit!41071)

(assert (=> b!1239528 (= lt!561719 (subseqTail!83 lt!561717 lt!561717))))

(assert (=> b!1239528 (subseq!596 lt!561717 lt!561717)))

(declare-fun lt!561718 () Unit!41071)

(declare-fun lemmaListSubSeqRefl!0 (List!27305) Unit!41071)

(assert (=> b!1239528 (= lt!561718 (lemmaListSubSeqRefl!0 lt!561717))))

(assert (=> b!1239528 (= lt!561717 (Cons!27301 (select (arr!38519 a!3835) from!3213) acc!846))))

(declare-fun b!1239529 () Bool)

(declare-fun res!826466 () Bool)

(assert (=> b!1239529 (=> res!826466 e!702632)))

(assert (=> b!1239529 (= res!826466 (contains!7376 lt!561717 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1239530 () Bool)

(declare-fun res!826458 () Bool)

(assert (=> b!1239530 (=> (not res!826458) (not e!702630))))

(assert (=> b!1239530 (= res!826458 (noDuplicate!1957 acc!846))))

(declare-fun b!1239531 () Bool)

(declare-fun res!826463 () Bool)

(assert (=> b!1239531 (=> (not res!826463) (not e!702630))))

(declare-fun k0!2925 () (_ BitVec 64))

(assert (=> b!1239531 (= res!826463 (contains!7376 acc!846 k0!2925))))

(declare-fun b!1239532 () Bool)

(declare-fun res!826459 () Bool)

(assert (=> b!1239532 (=> (not res!826459) (not e!702630))))

(assert (=> b!1239532 (= res!826459 (not (= from!3213 (bvsub (size!39056 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1239533 () Bool)

(declare-fun res!826457 () Bool)

(assert (=> b!1239533 (=> (not res!826457) (not e!702630))))

(declare-fun arrayNoDuplicates!0 (array!79844 (_ BitVec 32) List!27305) Bool)

(assert (=> b!1239533 (= res!826457 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1239534 () Bool)

(declare-fun res!826464 () Bool)

(assert (=> b!1239534 (=> (not res!826464) (not e!702630))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1239534 (= res!826464 (validKeyInArray!0 (select (arr!38519 a!3835) from!3213)))))

(assert (= (and start!103360 res!826465) b!1239530))

(assert (= (and b!1239530 res!826458) b!1239525))

(assert (= (and b!1239525 res!826467) b!1239526))

(assert (= (and b!1239526 res!826460) b!1239533))

(assert (= (and b!1239533 res!826457) b!1239531))

(assert (= (and b!1239531 res!826463) b!1239532))

(assert (= (and b!1239532 res!826459) b!1239534))

(assert (= (and b!1239534 res!826464) b!1239528))

(assert (= (and b!1239528 (not res!826461)) b!1239524))

(assert (= (and b!1239524 (not res!826462)) b!1239529))

(assert (= (and b!1239529 (not res!826466)) b!1239527))

(declare-fun m!1143413 () Bool)

(assert (=> b!1239527 m!1143413))

(declare-fun m!1143415 () Bool)

(assert (=> start!103360 m!1143415))

(declare-fun m!1143417 () Bool)

(assert (=> b!1239524 m!1143417))

(declare-fun m!1143419 () Bool)

(assert (=> b!1239534 m!1143419))

(assert (=> b!1239534 m!1143419))

(declare-fun m!1143421 () Bool)

(assert (=> b!1239534 m!1143421))

(declare-fun m!1143423 () Bool)

(assert (=> b!1239525 m!1143423))

(declare-fun m!1143425 () Bool)

(assert (=> b!1239528 m!1143425))

(declare-fun m!1143427 () Bool)

(assert (=> b!1239528 m!1143427))

(declare-fun m!1143429 () Bool)

(assert (=> b!1239528 m!1143429))

(declare-fun m!1143431 () Bool)

(assert (=> b!1239528 m!1143431))

(assert (=> b!1239528 m!1143419))

(declare-fun m!1143433 () Bool)

(assert (=> b!1239531 m!1143433))

(declare-fun m!1143435 () Bool)

(assert (=> b!1239530 m!1143435))

(declare-fun m!1143437 () Bool)

(assert (=> b!1239533 m!1143437))

(declare-fun m!1143439 () Bool)

(assert (=> b!1239526 m!1143439))

(declare-fun m!1143441 () Bool)

(assert (=> b!1239529 m!1143441))

(check-sat (not b!1239524) (not b!1239531) (not b!1239530) (not b!1239528) (not b!1239534) (not b!1239529) (not b!1239533) (not b!1239525) (not b!1239526) (not b!1239527) (not start!103360))
(check-sat)
