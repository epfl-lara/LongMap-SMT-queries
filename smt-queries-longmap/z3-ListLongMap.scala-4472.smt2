; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62204 () Bool)

(assert start!62204)

(declare-fun b!696754 () Bool)

(declare-fun res!460850 () Bool)

(declare-fun e!396112 () Bool)

(assert (=> b!696754 (=> (not res!460850) (not e!396112))))

(declare-datatypes ((List!13225 0))(
  ( (Nil!13222) (Cons!13221 (h!14266 (_ BitVec 64)) (t!19498 List!13225)) )
))
(declare-fun acc!681 () List!13225)

(declare-fun contains!3747 (List!13225 (_ BitVec 64)) Bool)

(assert (=> b!696754 (= res!460850 (not (contains!3747 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!696755 () Bool)

(declare-fun e!396110 () Bool)

(declare-fun k0!2843 () (_ BitVec 64))

(assert (=> b!696755 (= e!396110 (contains!3747 acc!681 k0!2843))))

(declare-fun b!696756 () Bool)

(declare-fun e!396108 () Bool)

(assert (=> b!696756 (= e!396108 (not (contains!3747 acc!681 k0!2843)))))

(declare-fun b!696757 () Bool)

(declare-fun res!460835 () Bool)

(assert (=> b!696757 (=> (not res!460835) (not e!396112))))

(declare-fun e!396109 () Bool)

(assert (=> b!696757 (= res!460835 e!396109)))

(declare-fun res!460836 () Bool)

(assert (=> b!696757 (=> res!460836 e!396109)))

(declare-fun e!396107 () Bool)

(assert (=> b!696757 (= res!460836 e!396107)))

(declare-fun res!460847 () Bool)

(assert (=> b!696757 (=> (not res!460847) (not e!396107))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!696757 (= res!460847 (bvsgt from!3004 i!1382))))

(declare-fun b!696758 () Bool)

(declare-fun res!460842 () Bool)

(assert (=> b!696758 (=> (not res!460842) (not e!396112))))

(declare-datatypes ((array!39972 0))(
  ( (array!39973 (arr!19145 (Array (_ BitVec 32) (_ BitVec 64))) (size!19527 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39972)

(assert (=> b!696758 (= res!460842 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19527 a!3626))))))

(declare-fun b!696759 () Bool)

(declare-fun res!460848 () Bool)

(assert (=> b!696759 (=> (not res!460848) (not e!396112))))

(declare-fun arrayNoDuplicates!0 (array!39972 (_ BitVec 32) List!13225) Bool)

(assert (=> b!696759 (= res!460848 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!696761 () Bool)

(declare-fun res!460852 () Bool)

(assert (=> b!696761 (=> (not res!460852) (not e!396112))))

(declare-fun e!396111 () Bool)

(assert (=> b!696761 (= res!460852 e!396111)))

(declare-fun res!460833 () Bool)

(assert (=> b!696761 (=> res!460833 e!396111)))

(assert (=> b!696761 (= res!460833 e!396110)))

(declare-fun res!460846 () Bool)

(assert (=> b!696761 (=> (not res!460846) (not e!396110))))

(assert (=> b!696761 (= res!460846 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!696762 () Bool)

(declare-fun res!460832 () Bool)

(assert (=> b!696762 (=> (not res!460832) (not e!396112))))

(assert (=> b!696762 (= res!460832 (not (contains!3747 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!696763 () Bool)

(declare-fun res!460841 () Bool)

(assert (=> b!696763 (=> (not res!460841) (not e!396112))))

(assert (=> b!696763 (= res!460841 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19527 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!696764 () Bool)

(declare-fun res!460845 () Bool)

(assert (=> b!696764 (=> (not res!460845) (not e!396112))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!696764 (= res!460845 (not (validKeyInArray!0 (select (arr!19145 a!3626) from!3004))))))

(declare-fun b!696765 () Bool)

(declare-fun e!396106 () Bool)

(assert (=> b!696765 (= e!396106 (not (contains!3747 acc!681 k0!2843)))))

(declare-fun b!696766 () Bool)

(declare-fun res!460849 () Bool)

(assert (=> b!696766 (=> (not res!460849) (not e!396112))))

(assert (=> b!696766 (= res!460849 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13222))))

(declare-fun b!696767 () Bool)

(assert (=> b!696767 (= e!396109 e!396108)))

(declare-fun res!460838 () Bool)

(assert (=> b!696767 (=> (not res!460838) (not e!396108))))

(assert (=> b!696767 (= res!460838 (bvsle from!3004 i!1382))))

(declare-fun b!696768 () Bool)

(declare-fun res!460834 () Bool)

(assert (=> b!696768 (=> (not res!460834) (not e!396112))))

(assert (=> b!696768 (= res!460834 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun b!696769 () Bool)

(assert (=> b!696769 (= e!396107 (contains!3747 acc!681 k0!2843))))

(declare-fun b!696770 () Bool)

(declare-fun res!460851 () Bool)

(assert (=> b!696770 (=> (not res!460851) (not e!396112))))

(declare-fun arrayContainsKey!0 (array!39972 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!696770 (= res!460851 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!696771 () Bool)

(declare-fun res!460843 () Bool)

(assert (=> b!696771 (=> (not res!460843) (not e!396112))))

(declare-fun noDuplicate!1016 (List!13225) Bool)

(assert (=> b!696771 (= res!460843 (noDuplicate!1016 acc!681))))

(declare-fun b!696772 () Bool)

(assert (=> b!696772 (= e!396112 (bvsge (bvsub (size!19527 a!3626) (bvadd #b00000000000000000000000000000001 from!3004)) (bvsub (size!19527 a!3626) from!3004)))))

(declare-fun b!696773 () Bool)

(assert (=> b!696773 (= e!396111 e!396106)))

(declare-fun res!460837 () Bool)

(assert (=> b!696773 (=> (not res!460837) (not e!396106))))

(assert (=> b!696773 (= res!460837 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!696774 () Bool)

(declare-fun res!460840 () Bool)

(assert (=> b!696774 (=> (not res!460840) (not e!396112))))

(assert (=> b!696774 (= res!460840 (validKeyInArray!0 k0!2843))))

(declare-fun b!696760 () Bool)

(declare-fun res!460844 () Bool)

(assert (=> b!696760 (=> (not res!460844) (not e!396112))))

(assert (=> b!696760 (= res!460844 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681))))

(declare-fun res!460839 () Bool)

(assert (=> start!62204 (=> (not res!460839) (not e!396112))))

(assert (=> start!62204 (= res!460839 (and (bvslt (size!19527 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19527 a!3626))))))

(assert (=> start!62204 e!396112))

(assert (=> start!62204 true))

(declare-fun array_inv!15028 (array!39972) Bool)

(assert (=> start!62204 (array_inv!15028 a!3626)))

(assert (= (and start!62204 res!460839) b!696771))

(assert (= (and b!696771 res!460843) b!696754))

(assert (= (and b!696754 res!460850) b!696762))

(assert (= (and b!696762 res!460832) b!696757))

(assert (= (and b!696757 res!460847) b!696769))

(assert (= (and b!696757 (not res!460836)) b!696767))

(assert (= (and b!696767 res!460838) b!696756))

(assert (= (and b!696757 res!460835) b!696766))

(assert (= (and b!696766 res!460849) b!696759))

(assert (= (and b!696759 res!460848) b!696758))

(assert (= (and b!696758 res!460842) b!696774))

(assert (= (and b!696774 res!460840) b!696770))

(assert (= (and b!696770 res!460851) b!696763))

(assert (= (and b!696763 res!460841) b!696764))

(assert (= (and b!696764 res!460845) b!696768))

(assert (= (and b!696768 res!460834) b!696761))

(assert (= (and b!696761 res!460846) b!696755))

(assert (= (and b!696761 (not res!460833)) b!696773))

(assert (= (and b!696773 res!460837) b!696765))

(assert (= (and b!696761 res!460852) b!696760))

(assert (= (and b!696760 res!460844) b!696772))

(declare-fun m!656901 () Bool)

(assert (=> b!696756 m!656901))

(declare-fun m!656903 () Bool)

(assert (=> b!696762 m!656903))

(declare-fun m!656905 () Bool)

(assert (=> b!696774 m!656905))

(declare-fun m!656907 () Bool)

(assert (=> b!696754 m!656907))

(declare-fun m!656909 () Bool)

(assert (=> b!696770 m!656909))

(declare-fun m!656911 () Bool)

(assert (=> b!696759 m!656911))

(assert (=> b!696769 m!656901))

(declare-fun m!656913 () Bool)

(assert (=> start!62204 m!656913))

(declare-fun m!656915 () Bool)

(assert (=> b!696766 m!656915))

(assert (=> b!696765 m!656901))

(assert (=> b!696755 m!656901))

(declare-fun m!656917 () Bool)

(assert (=> b!696771 m!656917))

(declare-fun m!656919 () Bool)

(assert (=> b!696760 m!656919))

(declare-fun m!656921 () Bool)

(assert (=> b!696764 m!656921))

(assert (=> b!696764 m!656921))

(declare-fun m!656923 () Bool)

(assert (=> b!696764 m!656923))

(check-sat (not b!696760) (not b!696770) (not b!696756) (not start!62204) (not b!696755) (not b!696771) (not b!696769) (not b!696766) (not b!696764) (not b!696765) (not b!696774) (not b!696754) (not b!696759) (not b!696762))
(check-sat)
