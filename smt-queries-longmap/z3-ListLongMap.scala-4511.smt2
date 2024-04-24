; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62590 () Bool)

(assert start!62590)

(declare-fun b!704813 () Bool)

(declare-fun res!468527 () Bool)

(declare-fun e!397857 () Bool)

(assert (=> b!704813 (=> (not res!468527) (not e!397857))))

(declare-fun k0!2824 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!704813 (= res!468527 (validKeyInArray!0 k0!2824))))

(declare-fun b!704814 () Bool)

(declare-fun res!468538 () Bool)

(assert (=> b!704814 (=> (not res!468538) (not e!397857))))

(declare-datatypes ((List!13206 0))(
  ( (Nil!13203) (Cons!13202 (h!14250 (_ BitVec 64)) (t!19480 List!13206)) )
))
(declare-fun newAcc!49 () List!13206)

(declare-fun contains!3858 (List!13206 (_ BitVec 64)) Bool)

(assert (=> b!704814 (= res!468538 (contains!3858 newAcc!49 k0!2824))))

(declare-fun b!704815 () Bool)

(declare-fun res!468524 () Bool)

(assert (=> b!704815 (=> (not res!468524) (not e!397857))))

(declare-fun acc!652 () List!13206)

(declare-fun subseq!326 (List!13206 List!13206) Bool)

(assert (=> b!704815 (= res!468524 (subseq!326 acc!652 newAcc!49))))

(declare-fun b!704816 () Bool)

(assert (=> b!704816 (= e!397857 false)))

(declare-fun lt!317952 () Bool)

(declare-datatypes ((array!40209 0))(
  ( (array!40210 (arr!19258 (Array (_ BitVec 32) (_ BitVec 64))) (size!19641 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40209)

(declare-fun from!2969 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!40209 (_ BitVec 32) List!13206) Bool)

(assert (=> b!704816 (= lt!317952 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) acc!652))))

(declare-fun b!704817 () Bool)

(declare-fun res!468536 () Bool)

(assert (=> b!704817 (=> (not res!468536) (not e!397857))))

(assert (=> b!704817 (= res!468536 (not (contains!3858 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!704818 () Bool)

(declare-fun res!468541 () Bool)

(assert (=> b!704818 (=> (not res!468541) (not e!397857))))

(declare-fun -!290 (List!13206 (_ BitVec 64)) List!13206)

(assert (=> b!704818 (= res!468541 (= (-!290 newAcc!49 k0!2824) acc!652))))

(declare-fun b!704819 () Bool)

(declare-fun res!468533 () Bool)

(assert (=> b!704819 (=> (not res!468533) (not e!397857))))

(assert (=> b!704819 (= res!468533 (not (validKeyInArray!0 (select (arr!19258 a!3591) from!2969))))))

(declare-fun b!704820 () Bool)

(declare-fun res!468540 () Bool)

(assert (=> b!704820 (=> (not res!468540) (not e!397857))))

(declare-fun arrayContainsKey!0 (array!40209 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!704820 (= res!468540 (not (arrayContainsKey!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!704821 () Bool)

(declare-fun res!468526 () Bool)

(assert (=> b!704821 (=> (not res!468526) (not e!397857))))

(assert (=> b!704821 (= res!468526 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun b!704822 () Bool)

(declare-fun res!468530 () Bool)

(assert (=> b!704822 (=> (not res!468530) (not e!397857))))

(assert (=> b!704822 (= res!468530 (not (contains!3858 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!704824 () Bool)

(declare-fun res!468529 () Bool)

(assert (=> b!704824 (=> (not res!468529) (not e!397857))))

(assert (=> b!704824 (= res!468529 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!704825 () Bool)

(declare-fun res!468525 () Bool)

(assert (=> b!704825 (=> (not res!468525) (not e!397857))))

(assert (=> b!704825 (= res!468525 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19641 a!3591)))))

(declare-fun b!704826 () Bool)

(declare-fun res!468537 () Bool)

(assert (=> b!704826 (=> (not res!468537) (not e!397857))))

(assert (=> b!704826 (= res!468537 (not (contains!3858 acc!652 k0!2824)))))

(declare-fun b!704827 () Bool)

(declare-fun res!468531 () Bool)

(assert (=> b!704827 (=> (not res!468531) (not e!397857))))

(assert (=> b!704827 (= res!468531 (not (contains!3858 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!704828 () Bool)

(declare-fun res!468539 () Bool)

(assert (=> b!704828 (=> (not res!468539) (not e!397857))))

(declare-fun noDuplicate!1132 (List!13206) Bool)

(assert (=> b!704828 (= res!468539 (noDuplicate!1132 newAcc!49))))

(declare-fun b!704829 () Bool)

(declare-fun res!468535 () Bool)

(assert (=> b!704829 (=> (not res!468535) (not e!397857))))

(assert (=> b!704829 (= res!468535 (noDuplicate!1132 acc!652))))

(declare-fun b!704830 () Bool)

(declare-fun res!468534 () Bool)

(assert (=> b!704830 (=> (not res!468534) (not e!397857))))

(assert (=> b!704830 (= res!468534 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(declare-fun res!468528 () Bool)

(assert (=> start!62590 (=> (not res!468528) (not e!397857))))

(assert (=> start!62590 (= res!468528 (and (bvslt (size!19641 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19641 a!3591))))))

(assert (=> start!62590 e!397857))

(assert (=> start!62590 true))

(declare-fun array_inv!15117 (array!40209) Bool)

(assert (=> start!62590 (array_inv!15117 a!3591)))

(declare-fun b!704823 () Bool)

(declare-fun res!468532 () Bool)

(assert (=> b!704823 (=> (not res!468532) (not e!397857))))

(assert (=> b!704823 (= res!468532 (not (contains!3858 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!62590 res!468528) b!704829))

(assert (= (and b!704829 res!468535) b!704828))

(assert (= (and b!704828 res!468539) b!704817))

(assert (= (and b!704817 res!468536) b!704827))

(assert (= (and b!704827 res!468531) b!704830))

(assert (= (and b!704830 res!468534) b!704826))

(assert (= (and b!704826 res!468537) b!704813))

(assert (= (and b!704813 res!468527) b!704824))

(assert (= (and b!704824 res!468529) b!704815))

(assert (= (and b!704815 res!468524) b!704814))

(assert (= (and b!704814 res!468538) b!704818))

(assert (= (and b!704818 res!468541) b!704823))

(assert (= (and b!704823 res!468532) b!704822))

(assert (= (and b!704822 res!468530) b!704825))

(assert (= (and b!704825 res!468525) b!704819))

(assert (= (and b!704819 res!468533) b!704821))

(assert (= (and b!704821 res!468526) b!704820))

(assert (= (and b!704820 res!468540) b!704816))

(declare-fun m!663711 () Bool)

(assert (=> b!704826 m!663711))

(declare-fun m!663713 () Bool)

(assert (=> start!62590 m!663713))

(declare-fun m!663715 () Bool)

(assert (=> b!704828 m!663715))

(declare-fun m!663717 () Bool)

(assert (=> b!704822 m!663717))

(declare-fun m!663719 () Bool)

(assert (=> b!704815 m!663719))

(declare-fun m!663721 () Bool)

(assert (=> b!704814 m!663721))

(declare-fun m!663723 () Bool)

(assert (=> b!704819 m!663723))

(assert (=> b!704819 m!663723))

(declare-fun m!663725 () Bool)

(assert (=> b!704819 m!663725))

(declare-fun m!663727 () Bool)

(assert (=> b!704827 m!663727))

(declare-fun m!663729 () Bool)

(assert (=> b!704829 m!663729))

(declare-fun m!663731 () Bool)

(assert (=> b!704817 m!663731))

(declare-fun m!663733 () Bool)

(assert (=> b!704830 m!663733))

(declare-fun m!663735 () Bool)

(assert (=> b!704823 m!663735))

(declare-fun m!663737 () Bool)

(assert (=> b!704813 m!663737))

(declare-fun m!663739 () Bool)

(assert (=> b!704818 m!663739))

(declare-fun m!663741 () Bool)

(assert (=> b!704820 m!663741))

(declare-fun m!663743 () Bool)

(assert (=> b!704816 m!663743))

(declare-fun m!663745 () Bool)

(assert (=> b!704824 m!663745))

(check-sat (not b!704828) (not b!704826) (not b!704818) (not b!704830) (not b!704813) (not b!704827) (not b!704824) (not b!704819) (not b!704817) (not b!704815) (not b!704814) (not b!704823) (not start!62590) (not b!704820) (not b!704829) (not b!704816) (not b!704822))
(check-sat)
