; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59800 () Bool)

(assert start!59800)

(declare-fun b!660654 () Bool)

(declare-fun res!428725 () Bool)

(declare-fun e!379625 () Bool)

(assert (=> b!660654 (=> (not res!428725) (not e!379625))))

(declare-datatypes ((array!38847 0))(
  ( (array!38848 (arr!18616 (Array (_ BitVec 32) (_ BitVec 64))) (size!18980 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38847)

(declare-datatypes ((List!12657 0))(
  ( (Nil!12654) (Cons!12653 (h!13698 (_ BitVec 64)) (t!18885 List!12657)) )
))
(declare-fun arrayNoDuplicates!0 (array!38847 (_ BitVec 32) List!12657) Bool)

(assert (=> b!660654 (= res!428725 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12654))))

(declare-fun b!660655 () Bool)

(declare-fun res!428721 () Bool)

(assert (=> b!660655 (=> (not res!428721) (not e!379625))))

(declare-fun acc!681 () List!12657)

(declare-fun contains!3234 (List!12657 (_ BitVec 64)) Bool)

(assert (=> b!660655 (= res!428721 (not (contains!3234 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!660656 () Bool)

(declare-fun e!379624 () Bool)

(declare-fun k0!2843 () (_ BitVec 64))

(assert (=> b!660656 (= e!379624 (contains!3234 acc!681 k0!2843))))

(declare-fun res!428718 () Bool)

(assert (=> start!59800 (=> (not res!428718) (not e!379625))))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> start!59800 (= res!428718 (and (bvslt (size!18980 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!18980 a!3626))))))

(assert (=> start!59800 e!379625))

(assert (=> start!59800 true))

(declare-fun array_inv!14412 (array!38847) Bool)

(assert (=> start!59800 (array_inv!14412 a!3626)))

(declare-fun b!660657 () Bool)

(declare-fun res!428726 () Bool)

(assert (=> b!660657 (=> (not res!428726) (not e!379625))))

(assert (=> b!660657 (= res!428726 (not (contains!3234 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!660658 () Bool)

(declare-fun e!379623 () Bool)

(declare-fun e!379622 () Bool)

(assert (=> b!660658 (= e!379623 e!379622)))

(declare-fun res!428723 () Bool)

(assert (=> b!660658 (=> (not res!428723) (not e!379622))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!660658 (= res!428723 (bvsle from!3004 i!1382))))

(declare-fun b!660659 () Bool)

(declare-fun res!428722 () Bool)

(assert (=> b!660659 (=> (not res!428722) (not e!379625))))

(declare-fun noDuplicate!481 (List!12657) Bool)

(assert (=> b!660659 (= res!428722 (noDuplicate!481 acc!681))))

(declare-fun b!660660 () Bool)

(assert (=> b!660660 (= e!379625 false)))

(declare-fun lt!308797 () Bool)

(assert (=> b!660660 (= lt!308797 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!660661 () Bool)

(declare-fun res!428724 () Bool)

(assert (=> b!660661 (=> (not res!428724) (not e!379625))))

(assert (=> b!660661 (= res!428724 e!379623)))

(declare-fun res!428719 () Bool)

(assert (=> b!660661 (=> res!428719 e!379623)))

(assert (=> b!660661 (= res!428719 e!379624)))

(declare-fun res!428720 () Bool)

(assert (=> b!660661 (=> (not res!428720) (not e!379624))))

(assert (=> b!660661 (= res!428720 (bvsgt from!3004 i!1382))))

(declare-fun b!660662 () Bool)

(assert (=> b!660662 (= e!379622 (not (contains!3234 acc!681 k0!2843)))))

(assert (= (and start!59800 res!428718) b!660659))

(assert (= (and b!660659 res!428722) b!660655))

(assert (= (and b!660655 res!428721) b!660657))

(assert (= (and b!660657 res!428726) b!660661))

(assert (= (and b!660661 res!428720) b!660656))

(assert (= (and b!660661 (not res!428719)) b!660658))

(assert (= (and b!660658 res!428723) b!660662))

(assert (= (and b!660661 res!428724) b!660654))

(assert (= (and b!660654 res!428725) b!660660))

(declare-fun m!633223 () Bool)

(assert (=> b!660662 m!633223))

(declare-fun m!633225 () Bool)

(assert (=> b!660657 m!633225))

(declare-fun m!633227 () Bool)

(assert (=> b!660654 m!633227))

(declare-fun m!633229 () Bool)

(assert (=> start!59800 m!633229))

(declare-fun m!633231 () Bool)

(assert (=> b!660655 m!633231))

(declare-fun m!633233 () Bool)

(assert (=> b!660659 m!633233))

(assert (=> b!660656 m!633223))

(declare-fun m!633235 () Bool)

(assert (=> b!660660 m!633235))

(check-sat (not b!660659) (not b!660657) (not start!59800) (not b!660654) (not b!660656) (not b!660660) (not b!660662) (not b!660655))
