; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62554 () Bool)

(assert start!62554)

(declare-fun b!703841 () Bool)

(declare-fun res!467559 () Bool)

(declare-fun e!397748 () Bool)

(assert (=> b!703841 (=> (not res!467559) (not e!397748))))

(declare-fun k0!2824 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!703841 (= res!467559 (validKeyInArray!0 k0!2824))))

(declare-fun b!703842 () Bool)

(declare-fun res!467562 () Bool)

(assert (=> b!703842 (=> (not res!467562) (not e!397748))))

(declare-fun from!2969 () (_ BitVec 32))

(declare-datatypes ((array!40173 0))(
  ( (array!40174 (arr!19240 (Array (_ BitVec 32) (_ BitVec 64))) (size!19623 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40173)

(assert (=> b!703842 (= res!467562 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19623 a!3591)))))

(declare-fun b!703843 () Bool)

(declare-fun res!467557 () Bool)

(assert (=> b!703843 (=> (not res!467557) (not e!397748))))

(declare-fun arrayContainsKey!0 (array!40173 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!703843 (= res!467557 (not (arrayContainsKey!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!703844 () Bool)

(declare-fun res!467565 () Bool)

(assert (=> b!703844 (=> (not res!467565) (not e!397748))))

(assert (=> b!703844 (= res!467565 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun b!703845 () Bool)

(declare-fun res!467568 () Bool)

(assert (=> b!703845 (=> (not res!467568) (not e!397748))))

(assert (=> b!703845 (= res!467568 (not (validKeyInArray!0 (select (arr!19240 a!3591) from!2969))))))

(declare-fun b!703846 () Bool)

(declare-fun res!467552 () Bool)

(assert (=> b!703846 (=> (not res!467552) (not e!397748))))

(declare-datatypes ((List!13188 0))(
  ( (Nil!13185) (Cons!13184 (h!14232 (_ BitVec 64)) (t!19462 List!13188)) )
))
(declare-fun newAcc!49 () List!13188)

(declare-fun noDuplicate!1114 (List!13188) Bool)

(assert (=> b!703846 (= res!467552 (noDuplicate!1114 newAcc!49))))

(declare-fun b!703847 () Bool)

(declare-fun res!467567 () Bool)

(assert (=> b!703847 (=> (not res!467567) (not e!397748))))

(declare-fun acc!652 () List!13188)

(assert (=> b!703847 (= res!467567 (noDuplicate!1114 acc!652))))

(declare-fun b!703848 () Bool)

(declare-fun res!467553 () Bool)

(assert (=> b!703848 (=> (not res!467553) (not e!397748))))

(declare-fun subseq!308 (List!13188 List!13188) Bool)

(assert (=> b!703848 (= res!467553 (subseq!308 acc!652 newAcc!49))))

(declare-fun b!703849 () Bool)

(declare-fun res!467563 () Bool)

(assert (=> b!703849 (=> (not res!467563) (not e!397748))))

(assert (=> b!703849 (= res!467563 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(declare-fun b!703850 () Bool)

(declare-fun res!467564 () Bool)

(assert (=> b!703850 (=> (not res!467564) (not e!397748))))

(declare-fun contains!3840 (List!13188 (_ BitVec 64)) Bool)

(assert (=> b!703850 (= res!467564 (not (contains!3840 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!703851 () Bool)

(declare-fun res!467554 () Bool)

(assert (=> b!703851 (=> (not res!467554) (not e!397748))))

(assert (=> b!703851 (= res!467554 (not (contains!3840 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!703852 () Bool)

(declare-fun res!467561 () Bool)

(assert (=> b!703852 (=> (not res!467561) (not e!397748))))

(assert (=> b!703852 (= res!467561 (contains!3840 newAcc!49 k0!2824))))

(declare-fun res!467558 () Bool)

(assert (=> start!62554 (=> (not res!467558) (not e!397748))))

(assert (=> start!62554 (= res!467558 (and (bvslt (size!19623 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19623 a!3591))))))

(assert (=> start!62554 e!397748))

(assert (=> start!62554 true))

(declare-fun array_inv!15099 (array!40173) Bool)

(assert (=> start!62554 (array_inv!15099 a!3591)))

(declare-fun b!703853 () Bool)

(declare-fun res!467560 () Bool)

(assert (=> b!703853 (=> (not res!467560) (not e!397748))))

(declare-fun arrayNoDuplicates!0 (array!40173 (_ BitVec 32) List!13188) Bool)

(assert (=> b!703853 (= res!467560 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!703854 () Bool)

(assert (=> b!703854 (= e!397748 false)))

(declare-fun lt!317898 () Bool)

(assert (=> b!703854 (= lt!317898 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) acc!652))))

(declare-fun b!703855 () Bool)

(declare-fun res!467566 () Bool)

(assert (=> b!703855 (=> (not res!467566) (not e!397748))))

(assert (=> b!703855 (= res!467566 (not (contains!3840 acc!652 k0!2824)))))

(declare-fun b!703856 () Bool)

(declare-fun res!467556 () Bool)

(assert (=> b!703856 (=> (not res!467556) (not e!397748))))

(assert (=> b!703856 (= res!467556 (not (contains!3840 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!703857 () Bool)

(declare-fun res!467569 () Bool)

(assert (=> b!703857 (=> (not res!467569) (not e!397748))))

(assert (=> b!703857 (= res!467569 (not (contains!3840 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!703858 () Bool)

(declare-fun res!467555 () Bool)

(assert (=> b!703858 (=> (not res!467555) (not e!397748))))

(declare-fun -!272 (List!13188 (_ BitVec 64)) List!13188)

(assert (=> b!703858 (= res!467555 (= (-!272 newAcc!49 k0!2824) acc!652))))

(assert (= (and start!62554 res!467558) b!703847))

(assert (= (and b!703847 res!467567) b!703846))

(assert (= (and b!703846 res!467552) b!703851))

(assert (= (and b!703851 res!467554) b!703856))

(assert (= (and b!703856 res!467556) b!703849))

(assert (= (and b!703849 res!467563) b!703855))

(assert (= (and b!703855 res!467566) b!703841))

(assert (= (and b!703841 res!467559) b!703853))

(assert (= (and b!703853 res!467560) b!703848))

(assert (= (and b!703848 res!467553) b!703852))

(assert (= (and b!703852 res!467561) b!703858))

(assert (= (and b!703858 res!467555) b!703857))

(assert (= (and b!703857 res!467569) b!703850))

(assert (= (and b!703850 res!467564) b!703842))

(assert (= (and b!703842 res!467562) b!703845))

(assert (= (and b!703845 res!467568) b!703844))

(assert (= (and b!703844 res!467565) b!703843))

(assert (= (and b!703843 res!467557) b!703854))

(declare-fun m!663063 () Bool)

(assert (=> b!703858 m!663063))

(declare-fun m!663065 () Bool)

(assert (=> b!703853 m!663065))

(declare-fun m!663067 () Bool)

(assert (=> b!703848 m!663067))

(declare-fun m!663069 () Bool)

(assert (=> b!703854 m!663069))

(declare-fun m!663071 () Bool)

(assert (=> b!703851 m!663071))

(declare-fun m!663073 () Bool)

(assert (=> b!703856 m!663073))

(declare-fun m!663075 () Bool)

(assert (=> start!62554 m!663075))

(declare-fun m!663077 () Bool)

(assert (=> b!703841 m!663077))

(declare-fun m!663079 () Bool)

(assert (=> b!703843 m!663079))

(declare-fun m!663081 () Bool)

(assert (=> b!703855 m!663081))

(declare-fun m!663083 () Bool)

(assert (=> b!703846 m!663083))

(declare-fun m!663085 () Bool)

(assert (=> b!703847 m!663085))

(declare-fun m!663087 () Bool)

(assert (=> b!703849 m!663087))

(declare-fun m!663089 () Bool)

(assert (=> b!703845 m!663089))

(assert (=> b!703845 m!663089))

(declare-fun m!663091 () Bool)

(assert (=> b!703845 m!663091))

(declare-fun m!663093 () Bool)

(assert (=> b!703857 m!663093))

(declare-fun m!663095 () Bool)

(assert (=> b!703850 m!663095))

(declare-fun m!663097 () Bool)

(assert (=> b!703852 m!663097))

(check-sat (not b!703845) (not b!703857) (not b!703856) (not b!703849) (not b!703853) (not b!703854) (not b!703843) (not b!703847) (not b!703855) (not b!703858) (not b!703852) (not b!703848) (not b!703846) (not b!703851) (not b!703850) (not b!703841) (not start!62554))
(check-sat)
