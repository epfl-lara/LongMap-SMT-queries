; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114256 () Bool)

(assert start!114256)

(declare-fun b!1354621 () Bool)

(declare-fun res!899053 () Bool)

(declare-fun e!769930 () Bool)

(assert (=> b!1354621 (=> (not res!899053) (not e!769930))))

(declare-datatypes ((List!31636 0))(
  ( (Nil!31633) (Cons!31632 (h!32850 (_ BitVec 64)) (t!46286 List!31636)) )
))
(declare-fun acc!759 () List!31636)

(declare-fun contains!9348 (List!31636 (_ BitVec 64)) Bool)

(assert (=> b!1354621 (= res!899053 (not (contains!9348 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1354622 () Bool)

(declare-fun res!899045 () Bool)

(assert (=> b!1354622 (=> (not res!899045) (not e!769930))))

(assert (=> b!1354622 (= res!899045 (not (contains!9348 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1354623 () Bool)

(declare-datatypes ((Unit!44345 0))(
  ( (Unit!44346) )
))
(declare-fun e!769929 () Unit!44345)

(declare-fun Unit!44347 () Unit!44345)

(assert (=> b!1354623 (= e!769929 Unit!44347)))

(declare-fun b!1354624 () Bool)

(declare-fun res!899046 () Bool)

(declare-fun e!769931 () Bool)

(assert (=> b!1354624 (=> (not res!899046) (not e!769931))))

(declare-fun lt!598310 () List!31636)

(assert (=> b!1354624 (= res!899046 (not (contains!9348 lt!598310 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1354625 () Bool)

(declare-fun res!899048 () Bool)

(assert (=> b!1354625 (=> (not res!899048) (not e!769930))))

(declare-fun noDuplicate!2179 (List!31636) Bool)

(assert (=> b!1354625 (= res!899048 (noDuplicate!2179 acc!759))))

(declare-fun b!1354626 () Bool)

(assert (=> b!1354626 (= e!769931 false)))

(declare-fun lt!598314 () Bool)

(declare-datatypes ((array!92329 0))(
  ( (array!92330 (arr!44608 (Array (_ BitVec 32) (_ BitVec 64))) (size!45159 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92329)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!92329 (_ BitVec 32) List!31636) Bool)

(assert (=> b!1354626 (= lt!598314 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) lt!598310))))

(declare-fun b!1354627 () Bool)

(declare-fun e!769933 () Bool)

(assert (=> b!1354627 (= e!769930 e!769933)))

(declare-fun res!899043 () Bool)

(assert (=> b!1354627 (=> (not res!899043) (not e!769933))))

(declare-fun i!1404 () (_ BitVec 32))

(declare-fun lt!598311 () Bool)

(assert (=> b!1354627 (= res!899043 (and (not (= from!3120 i!1404)) lt!598311))))

(declare-fun lt!598313 () Unit!44345)

(assert (=> b!1354627 (= lt!598313 e!769929)))

(declare-fun c!127237 () Bool)

(assert (=> b!1354627 (= c!127237 lt!598311)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1354627 (= lt!598311 (validKeyInArray!0 (select (arr!44608 a!3742) from!3120)))))

(declare-fun b!1354628 () Bool)

(declare-fun res!899047 () Bool)

(assert (=> b!1354628 (=> (not res!899047) (not e!769930))))

(assert (=> b!1354628 (= res!899047 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1354629 () Bool)

(declare-fun res!899051 () Bool)

(assert (=> b!1354629 (=> (not res!899051) (not e!769930))))

(assert (=> b!1354629 (= res!899051 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45159 a!3742))))))

(declare-fun res!899052 () Bool)

(assert (=> start!114256 (=> (not res!899052) (not e!769930))))

(assert (=> start!114256 (= res!899052 (and (bvslt (size!45159 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45159 a!3742))))))

(assert (=> start!114256 e!769930))

(assert (=> start!114256 true))

(declare-fun array_inv!33889 (array!92329) Bool)

(assert (=> start!114256 (array_inv!33889 a!3742)))

(declare-fun b!1354630 () Bool)

(declare-fun res!899055 () Bool)

(assert (=> b!1354630 (=> (not res!899055) (not e!769930))))

(assert (=> b!1354630 (= res!899055 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31633))))

(declare-fun b!1354631 () Bool)

(declare-fun res!899049 () Bool)

(assert (=> b!1354631 (=> (not res!899049) (not e!769931))))

(assert (=> b!1354631 (= res!899049 (not (contains!9348 lt!598310 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1354632 () Bool)

(declare-fun res!899050 () Bool)

(assert (=> b!1354632 (=> (not res!899050) (not e!769930))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1354632 (= res!899050 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1354633 () Bool)

(declare-fun lt!598309 () Unit!44345)

(assert (=> b!1354633 (= e!769929 lt!598309)))

(declare-fun lt!598312 () Unit!44345)

(declare-fun lemmaListSubSeqRefl!0 (List!31636) Unit!44345)

(assert (=> b!1354633 (= lt!598312 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!725 (List!31636 List!31636) Bool)

(assert (=> b!1354633 (subseq!725 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92329 List!31636 List!31636 (_ BitVec 32)) Unit!44345)

(declare-fun $colon$colon!739 (List!31636 (_ BitVec 64)) List!31636)

(assert (=> b!1354633 (= lt!598309 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!739 acc!759 (select (arr!44608 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1354633 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1354634 () Bool)

(assert (=> b!1354634 (= e!769933 e!769931)))

(declare-fun res!899054 () Bool)

(assert (=> b!1354634 (=> (not res!899054) (not e!769931))))

(assert (=> b!1354634 (= res!899054 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(assert (=> b!1354634 (= lt!598310 ($colon$colon!739 acc!759 (select (arr!44608 a!3742) from!3120)))))

(declare-fun b!1354635 () Bool)

(declare-fun res!899044 () Bool)

(assert (=> b!1354635 (=> (not res!899044) (not e!769931))))

(assert (=> b!1354635 (= res!899044 (noDuplicate!2179 lt!598310))))

(declare-fun b!1354636 () Bool)

(declare-fun res!899042 () Bool)

(assert (=> b!1354636 (=> (not res!899042) (not e!769930))))

(assert (=> b!1354636 (= res!899042 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45159 a!3742)))))

(assert (= (and start!114256 res!899052) b!1354625))

(assert (= (and b!1354625 res!899048) b!1354622))

(assert (= (and b!1354622 res!899045) b!1354621))

(assert (= (and b!1354621 res!899053) b!1354630))

(assert (= (and b!1354630 res!899055) b!1354628))

(assert (= (and b!1354628 res!899047) b!1354629))

(assert (= (and b!1354629 res!899051) b!1354632))

(assert (= (and b!1354632 res!899050) b!1354636))

(assert (= (and b!1354636 res!899042) b!1354627))

(assert (= (and b!1354627 c!127237) b!1354633))

(assert (= (and b!1354627 (not c!127237)) b!1354623))

(assert (= (and b!1354627 res!899043) b!1354634))

(assert (= (and b!1354634 res!899054) b!1354635))

(assert (= (and b!1354635 res!899044) b!1354624))

(assert (= (and b!1354624 res!899046) b!1354631))

(assert (= (and b!1354631 res!899049) b!1354626))

(declare-fun m!1241569 () Bool)

(assert (=> start!114256 m!1241569))

(declare-fun m!1241571 () Bool)

(assert (=> b!1354630 m!1241571))

(declare-fun m!1241573 () Bool)

(assert (=> b!1354626 m!1241573))

(declare-fun m!1241575 () Bool)

(assert (=> b!1354631 m!1241575))

(declare-fun m!1241577 () Bool)

(assert (=> b!1354635 m!1241577))

(declare-fun m!1241579 () Bool)

(assert (=> b!1354627 m!1241579))

(assert (=> b!1354627 m!1241579))

(declare-fun m!1241581 () Bool)

(assert (=> b!1354627 m!1241581))

(declare-fun m!1241583 () Bool)

(assert (=> b!1354625 m!1241583))

(assert (=> b!1354634 m!1241579))

(assert (=> b!1354634 m!1241579))

(declare-fun m!1241585 () Bool)

(assert (=> b!1354634 m!1241585))

(declare-fun m!1241587 () Bool)

(assert (=> b!1354633 m!1241587))

(assert (=> b!1354633 m!1241579))

(assert (=> b!1354633 m!1241585))

(declare-fun m!1241589 () Bool)

(assert (=> b!1354633 m!1241589))

(declare-fun m!1241591 () Bool)

(assert (=> b!1354633 m!1241591))

(assert (=> b!1354633 m!1241579))

(assert (=> b!1354633 m!1241585))

(declare-fun m!1241593 () Bool)

(assert (=> b!1354633 m!1241593))

(declare-fun m!1241595 () Bool)

(assert (=> b!1354628 m!1241595))

(declare-fun m!1241597 () Bool)

(assert (=> b!1354632 m!1241597))

(declare-fun m!1241599 () Bool)

(assert (=> b!1354621 m!1241599))

(declare-fun m!1241601 () Bool)

(assert (=> b!1354622 m!1241601))

(declare-fun m!1241603 () Bool)

(assert (=> b!1354624 m!1241603))

(check-sat (not b!1354630) (not b!1354625) (not b!1354635) (not b!1354631) (not b!1354626) (not b!1354621) (not b!1354634) (not b!1354624) (not b!1354633) (not b!1354627) (not start!114256) (not b!1354622) (not b!1354628) (not b!1354632))
(check-sat)
