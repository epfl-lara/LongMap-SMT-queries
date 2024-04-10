; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59806 () Bool)

(assert start!59806)

(declare-fun res!428802 () Bool)

(declare-fun e!379671 () Bool)

(assert (=> start!59806 (=> (not res!428802) (not e!379671))))

(declare-datatypes ((array!38853 0))(
  ( (array!38854 (arr!18619 (Array (_ BitVec 32) (_ BitVec 64))) (size!18983 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38853)

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> start!59806 (= res!428802 (and (bvslt (size!18983 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!18983 a!3626))))))

(assert (=> start!59806 e!379671))

(assert (=> start!59806 true))

(declare-fun array_inv!14415 (array!38853) Bool)

(assert (=> start!59806 (array_inv!14415 a!3626)))

(declare-fun b!660735 () Bool)

(declare-fun e!379670 () Bool)

(declare-fun e!379669 () Bool)

(assert (=> b!660735 (= e!379670 e!379669)))

(declare-fun res!428807 () Bool)

(assert (=> b!660735 (=> (not res!428807) (not e!379669))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!660735 (= res!428807 (bvsle from!3004 i!1382))))

(declare-fun b!660736 () Bool)

(declare-fun res!428799 () Bool)

(assert (=> b!660736 (=> (not res!428799) (not e!379671))))

(assert (=> b!660736 (= res!428799 e!379670)))

(declare-fun res!428805 () Bool)

(assert (=> b!660736 (=> res!428805 e!379670)))

(declare-fun e!379668 () Bool)

(assert (=> b!660736 (= res!428805 e!379668)))

(declare-fun res!428803 () Bool)

(assert (=> b!660736 (=> (not res!428803) (not e!379668))))

(assert (=> b!660736 (= res!428803 (bvsgt from!3004 i!1382))))

(declare-fun b!660737 () Bool)

(declare-fun res!428801 () Bool)

(assert (=> b!660737 (=> (not res!428801) (not e!379671))))

(declare-datatypes ((List!12660 0))(
  ( (Nil!12657) (Cons!12656 (h!13701 (_ BitVec 64)) (t!18888 List!12660)) )
))
(declare-fun acc!681 () List!12660)

(declare-fun contains!3237 (List!12660 (_ BitVec 64)) Bool)

(assert (=> b!660737 (= res!428801 (not (contains!3237 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!660738 () Bool)

(declare-fun res!428806 () Bool)

(assert (=> b!660738 (=> (not res!428806) (not e!379671))))

(assert (=> b!660738 (= res!428806 (not (contains!3237 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!660739 () Bool)

(declare-fun res!428800 () Bool)

(assert (=> b!660739 (=> (not res!428800) (not e!379671))))

(declare-fun noDuplicate!484 (List!12660) Bool)

(assert (=> b!660739 (= res!428800 (noDuplicate!484 acc!681))))

(declare-fun b!660740 () Bool)

(declare-fun k0!2843 () (_ BitVec 64))

(assert (=> b!660740 (= e!379669 (not (contains!3237 acc!681 k0!2843)))))

(declare-fun b!660741 () Bool)

(assert (=> b!660741 (= e!379671 false)))

(declare-fun lt!308806 () Bool)

(declare-fun arrayNoDuplicates!0 (array!38853 (_ BitVec 32) List!12660) Bool)

(assert (=> b!660741 (= lt!308806 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!660742 () Bool)

(declare-fun res!428804 () Bool)

(assert (=> b!660742 (=> (not res!428804) (not e!379671))))

(assert (=> b!660742 (= res!428804 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12657))))

(declare-fun b!660743 () Bool)

(assert (=> b!660743 (= e!379668 (contains!3237 acc!681 k0!2843))))

(assert (= (and start!59806 res!428802) b!660739))

(assert (= (and b!660739 res!428800) b!660738))

(assert (= (and b!660738 res!428806) b!660737))

(assert (= (and b!660737 res!428801) b!660736))

(assert (= (and b!660736 res!428803) b!660743))

(assert (= (and b!660736 (not res!428805)) b!660735))

(assert (= (and b!660735 res!428807) b!660740))

(assert (= (and b!660736 res!428799) b!660742))

(assert (= (and b!660742 res!428804) b!660741))

(declare-fun m!633265 () Bool)

(assert (=> b!660741 m!633265))

(declare-fun m!633267 () Bool)

(assert (=> b!660737 m!633267))

(declare-fun m!633269 () Bool)

(assert (=> b!660740 m!633269))

(declare-fun m!633271 () Bool)

(assert (=> b!660742 m!633271))

(declare-fun m!633273 () Bool)

(assert (=> b!660739 m!633273))

(declare-fun m!633275 () Bool)

(assert (=> start!59806 m!633275))

(assert (=> b!660743 m!633269))

(declare-fun m!633277 () Bool)

(assert (=> b!660738 m!633277))

(check-sat (not b!660737) (not b!660739) (not start!59806) (not b!660738) (not b!660741) (not b!660743) (not b!660742) (not b!660740))
(check-sat)
