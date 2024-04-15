; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62540 () Bool)

(assert start!62540)

(declare-fun b!704818 () Bool)

(declare-fun res!468796 () Bool)

(declare-fun e!397613 () Bool)

(assert (=> b!704818 (=> (not res!468796) (not e!397613))))

(declare-fun k0!2824 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!704818 (= res!468796 (validKeyInArray!0 k0!2824))))

(declare-fun b!704819 () Bool)

(declare-fun res!468795 () Bool)

(assert (=> b!704819 (=> (not res!468795) (not e!397613))))

(declare-datatypes ((List!13351 0))(
  ( (Nil!13348) (Cons!13347 (h!14392 (_ BitVec 64)) (t!19624 List!13351)) )
))
(declare-fun acc!652 () List!13351)

(declare-fun contains!3873 (List!13351 (_ BitVec 64)) Bool)

(assert (=> b!704819 (= res!468795 (not (contains!3873 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!704820 () Bool)

(declare-fun res!468803 () Bool)

(assert (=> b!704820 (=> (not res!468803) (not e!397613))))

(declare-datatypes ((array!40230 0))(
  ( (array!40231 (arr!19271 (Array (_ BitVec 32) (_ BitVec 64))) (size!19653 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40230)

(declare-fun from!2969 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!40230 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!704820 (= res!468803 (not (arrayContainsKey!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!704821 () Bool)

(declare-fun res!468788 () Bool)

(assert (=> b!704821 (=> (not res!468788) (not e!397613))))

(declare-fun noDuplicate!1142 (List!13351) Bool)

(assert (=> b!704821 (= res!468788 (noDuplicate!1142 acc!652))))

(declare-fun b!704822 () Bool)

(declare-fun res!468791 () Bool)

(assert (=> b!704822 (=> (not res!468791) (not e!397613))))

(assert (=> b!704822 (= res!468791 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19653 a!3591)))))

(declare-fun res!468799 () Bool)

(assert (=> start!62540 (=> (not res!468799) (not e!397613))))

(assert (=> start!62540 (= res!468799 (and (bvslt (size!19653 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19653 a!3591))))))

(assert (=> start!62540 e!397613))

(assert (=> start!62540 true))

(declare-fun array_inv!15154 (array!40230) Bool)

(assert (=> start!62540 (array_inv!15154 a!3591)))

(declare-fun b!704823 () Bool)

(assert (=> b!704823 (= e!397613 false)))

(declare-fun lt!317628 () Bool)

(declare-fun arrayNoDuplicates!0 (array!40230 (_ BitVec 32) List!13351) Bool)

(assert (=> b!704823 (= lt!317628 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) acc!652))))

(declare-fun b!704824 () Bool)

(declare-fun res!468794 () Bool)

(assert (=> b!704824 (=> (not res!468794) (not e!397613))))

(assert (=> b!704824 (= res!468794 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun b!704825 () Bool)

(declare-fun res!468801 () Bool)

(assert (=> b!704825 (=> (not res!468801) (not e!397613))))

(assert (=> b!704825 (= res!468801 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(declare-fun b!704826 () Bool)

(declare-fun res!468805 () Bool)

(assert (=> b!704826 (=> (not res!468805) (not e!397613))))

(declare-fun newAcc!49 () List!13351)

(assert (=> b!704826 (= res!468805 (noDuplicate!1142 newAcc!49))))

(declare-fun b!704827 () Bool)

(declare-fun res!468802 () Bool)

(assert (=> b!704827 (=> (not res!468802) (not e!397613))))

(assert (=> b!704827 (= res!468802 (not (contains!3873 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!704828 () Bool)

(declare-fun res!468797 () Bool)

(assert (=> b!704828 (=> (not res!468797) (not e!397613))))

(assert (=> b!704828 (= res!468797 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!704829 () Bool)

(declare-fun res!468804 () Bool)

(assert (=> b!704829 (=> (not res!468804) (not e!397613))))

(declare-fun -!300 (List!13351 (_ BitVec 64)) List!13351)

(assert (=> b!704829 (= res!468804 (= (-!300 newAcc!49 k0!2824) acc!652))))

(declare-fun b!704830 () Bool)

(declare-fun res!468793 () Bool)

(assert (=> b!704830 (=> (not res!468793) (not e!397613))))

(assert (=> b!704830 (= res!468793 (not (contains!3873 acc!652 k0!2824)))))

(declare-fun b!704831 () Bool)

(declare-fun res!468800 () Bool)

(assert (=> b!704831 (=> (not res!468800) (not e!397613))))

(assert (=> b!704831 (= res!468800 (not (contains!3873 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!704832 () Bool)

(declare-fun res!468790 () Bool)

(assert (=> b!704832 (=> (not res!468790) (not e!397613))))

(declare-fun subseq!335 (List!13351 List!13351) Bool)

(assert (=> b!704832 (= res!468790 (subseq!335 acc!652 newAcc!49))))

(declare-fun b!704833 () Bool)

(declare-fun res!468792 () Bool)

(assert (=> b!704833 (=> (not res!468792) (not e!397613))))

(assert (=> b!704833 (= res!468792 (not (validKeyInArray!0 (select (arr!19271 a!3591) from!2969))))))

(declare-fun b!704834 () Bool)

(declare-fun res!468789 () Bool)

(assert (=> b!704834 (=> (not res!468789) (not e!397613))))

(assert (=> b!704834 (= res!468789 (contains!3873 newAcc!49 k0!2824))))

(declare-fun b!704835 () Bool)

(declare-fun res!468798 () Bool)

(assert (=> b!704835 (=> (not res!468798) (not e!397613))))

(assert (=> b!704835 (= res!468798 (not (contains!3873 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!62540 res!468799) b!704821))

(assert (= (and b!704821 res!468788) b!704826))

(assert (= (and b!704826 res!468805) b!704819))

(assert (= (and b!704819 res!468795) b!704835))

(assert (= (and b!704835 res!468798) b!704825))

(assert (= (and b!704825 res!468801) b!704830))

(assert (= (and b!704830 res!468793) b!704818))

(assert (= (and b!704818 res!468796) b!704828))

(assert (= (and b!704828 res!468797) b!704832))

(assert (= (and b!704832 res!468790) b!704834))

(assert (= (and b!704834 res!468789) b!704829))

(assert (= (and b!704829 res!468804) b!704831))

(assert (= (and b!704831 res!468800) b!704827))

(assert (= (and b!704827 res!468802) b!704822))

(assert (= (and b!704822 res!468791) b!704833))

(assert (= (and b!704833 res!468792) b!704824))

(assert (= (and b!704824 res!468794) b!704820))

(assert (= (and b!704820 res!468803) b!704823))

(declare-fun m!662619 () Bool)

(assert (=> b!704825 m!662619))

(declare-fun m!662621 () Bool)

(assert (=> b!704827 m!662621))

(declare-fun m!662623 () Bool)

(assert (=> b!704821 m!662623))

(declare-fun m!662625 () Bool)

(assert (=> b!704832 m!662625))

(declare-fun m!662627 () Bool)

(assert (=> b!704829 m!662627))

(declare-fun m!662629 () Bool)

(assert (=> b!704828 m!662629))

(declare-fun m!662631 () Bool)

(assert (=> b!704831 m!662631))

(declare-fun m!662633 () Bool)

(assert (=> b!704834 m!662633))

(declare-fun m!662635 () Bool)

(assert (=> b!704819 m!662635))

(declare-fun m!662637 () Bool)

(assert (=> b!704830 m!662637))

(declare-fun m!662639 () Bool)

(assert (=> b!704835 m!662639))

(declare-fun m!662641 () Bool)

(assert (=> b!704823 m!662641))

(declare-fun m!662643 () Bool)

(assert (=> b!704833 m!662643))

(assert (=> b!704833 m!662643))

(declare-fun m!662645 () Bool)

(assert (=> b!704833 m!662645))

(declare-fun m!662647 () Bool)

(assert (=> start!62540 m!662647))

(declare-fun m!662649 () Bool)

(assert (=> b!704820 m!662649))

(declare-fun m!662651 () Bool)

(assert (=> b!704826 m!662651))

(declare-fun m!662653 () Bool)

(assert (=> b!704818 m!662653))

(check-sat (not b!704828) (not b!704827) (not b!704829) (not b!704835) (not b!704819) (not b!704818) (not b!704831) (not b!704834) (not b!704832) (not b!704825) (not b!704830) (not start!62540) (not b!704823) (not b!704820) (not b!704821) (not b!704826) (not b!704833))
(check-sat)
