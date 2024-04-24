; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60420 () Bool)

(assert start!60420)

(declare-fun b!678553 () Bool)

(declare-fun e!386700 () Bool)

(declare-datatypes ((List!12840 0))(
  ( (Nil!12837) (Cons!12836 (h!13884 (_ BitVec 64)) (t!19060 List!12840)) )
))
(declare-fun acc!681 () List!12840)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun contains!3492 (List!12840 (_ BitVec 64)) Bool)

(assert (=> b!678553 (= e!386700 (not (contains!3492 acc!681 k0!2843)))))

(declare-fun b!678554 () Bool)

(declare-fun res!444859 () Bool)

(declare-fun e!386699 () Bool)

(assert (=> b!678554 (=> (not res!444859) (not e!386699))))

(declare-datatypes ((array!39405 0))(
  ( (array!39406 (arr!18892 (Array (_ BitVec 32) (_ BitVec 64))) (size!19256 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39405)

(declare-fun arrayContainsKey!0 (array!39405 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!678554 (= res!444859 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!678555 () Bool)

(declare-fun res!444860 () Bool)

(assert (=> b!678555 (=> (not res!444860) (not e!386699))))

(declare-fun e!386697 () Bool)

(assert (=> b!678555 (= res!444860 e!386697)))

(declare-fun res!444853 () Bool)

(assert (=> b!678555 (=> res!444853 e!386697)))

(declare-fun e!386698 () Bool)

(assert (=> b!678555 (= res!444853 e!386698)))

(declare-fun res!444858 () Bool)

(assert (=> b!678555 (=> (not res!444858) (not e!386698))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!678555 (= res!444858 (bvsgt from!3004 i!1382))))

(declare-fun b!678556 () Bool)

(declare-fun res!444855 () Bool)

(assert (=> b!678556 (=> (not res!444855) (not e!386699))))

(declare-fun arrayNoDuplicates!0 (array!39405 (_ BitVec 32) List!12840) Bool)

(assert (=> b!678556 (= res!444855 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12837))))

(declare-fun res!444850 () Bool)

(assert (=> start!60420 (=> (not res!444850) (not e!386699))))

(assert (=> start!60420 (= res!444850 (and (bvslt (size!19256 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19256 a!3626))))))

(assert (=> start!60420 e!386699))

(assert (=> start!60420 true))

(declare-fun array_inv!14751 (array!39405) Bool)

(assert (=> start!60420 (array_inv!14751 a!3626)))

(declare-fun b!678557 () Bool)

(assert (=> b!678557 (= e!386697 e!386700)))

(declare-fun res!444856 () Bool)

(assert (=> b!678557 (=> (not res!444856) (not e!386700))))

(assert (=> b!678557 (= res!444856 (bvsle from!3004 i!1382))))

(declare-fun b!678558 () Bool)

(declare-fun res!444861 () Bool)

(assert (=> b!678558 (=> (not res!444861) (not e!386699))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!678558 (= res!444861 (validKeyInArray!0 k0!2843))))

(declare-fun b!678559 () Bool)

(assert (=> b!678559 (= e!386699 (bvslt (bvsub (size!19256 a!3626) from!3004) #b00000000000000000000000000000000))))

(declare-fun b!678560 () Bool)

(declare-fun res!444862 () Bool)

(assert (=> b!678560 (=> (not res!444862) (not e!386699))))

(assert (=> b!678560 (= res!444862 (not (contains!3492 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!678561 () Bool)

(assert (=> b!678561 (= e!386698 (contains!3492 acc!681 k0!2843))))

(declare-fun b!678562 () Bool)

(declare-fun res!444854 () Bool)

(assert (=> b!678562 (=> (not res!444854) (not e!386699))))

(declare-fun noDuplicate!766 (List!12840) Bool)

(assert (=> b!678562 (= res!444854 (noDuplicate!766 acc!681))))

(declare-fun b!678563 () Bool)

(declare-fun res!444851 () Bool)

(assert (=> b!678563 (=> (not res!444851) (not e!386699))))

(assert (=> b!678563 (= res!444851 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!678564 () Bool)

(declare-fun res!444852 () Bool)

(assert (=> b!678564 (=> (not res!444852) (not e!386699))))

(assert (=> b!678564 (= res!444852 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19256 a!3626))))))

(declare-fun b!678565 () Bool)

(declare-fun res!444857 () Bool)

(assert (=> b!678565 (=> (not res!444857) (not e!386699))))

(assert (=> b!678565 (= res!444857 (not (contains!3492 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!60420 res!444850) b!678562))

(assert (= (and b!678562 res!444854) b!678560))

(assert (= (and b!678560 res!444862) b!678565))

(assert (= (and b!678565 res!444857) b!678555))

(assert (= (and b!678555 res!444858) b!678561))

(assert (= (and b!678555 (not res!444853)) b!678557))

(assert (= (and b!678557 res!444856) b!678553))

(assert (= (and b!678555 res!444860) b!678556))

(assert (= (and b!678556 res!444855) b!678563))

(assert (= (and b!678563 res!444851) b!678564))

(assert (= (and b!678564 res!444852) b!678558))

(assert (= (and b!678558 res!444861) b!678554))

(assert (= (and b!678554 res!444859) b!678559))

(declare-fun m!644863 () Bool)

(assert (=> b!678561 m!644863))

(declare-fun m!644865 () Bool)

(assert (=> b!678558 m!644865))

(assert (=> b!678553 m!644863))

(declare-fun m!644867 () Bool)

(assert (=> b!678563 m!644867))

(declare-fun m!644869 () Bool)

(assert (=> b!678565 m!644869))

(declare-fun m!644871 () Bool)

(assert (=> b!678560 m!644871))

(declare-fun m!644873 () Bool)

(assert (=> b!678562 m!644873))

(declare-fun m!644875 () Bool)

(assert (=> b!678556 m!644875))

(declare-fun m!644877 () Bool)

(assert (=> b!678554 m!644877))

(declare-fun m!644879 () Bool)

(assert (=> start!60420 m!644879))

(check-sat (not b!678560) (not b!678556) (not b!678562) (not start!60420) (not b!678553) (not b!678558) (not b!678554) (not b!678561) (not b!678563) (not b!678565))
(check-sat)
