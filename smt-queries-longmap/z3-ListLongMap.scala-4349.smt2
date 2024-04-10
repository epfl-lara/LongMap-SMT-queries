; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60124 () Bool)

(assert start!60124)

(declare-fun b!670896 () Bool)

(declare-fun e!383550 () Bool)

(declare-datatypes ((List!12819 0))(
  ( (Nil!12816) (Cons!12815 (h!13860 (_ BitVec 64)) (t!19047 List!12819)) )
))
(declare-fun acc!681 () List!12819)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun contains!3396 (List!12819 (_ BitVec 64)) Bool)

(assert (=> b!670896 (= e!383550 (not (contains!3396 acc!681 k0!2843)))))

(declare-fun b!670897 () Bool)

(declare-fun res!437597 () Bool)

(declare-fun e!383547 () Bool)

(assert (=> b!670897 (=> (not res!437597) (not e!383547))))

(assert (=> b!670897 (= res!437597 (not (contains!3396 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!670898 () Bool)

(declare-fun res!437598 () Bool)

(assert (=> b!670898 (=> (not res!437598) (not e!383547))))

(declare-fun noDuplicate!643 (List!12819) Bool)

(assert (=> b!670898 (= res!437598 (noDuplicate!643 acc!681))))

(declare-fun b!670899 () Bool)

(declare-fun res!437596 () Bool)

(assert (=> b!670899 (=> (not res!437596) (not e!383547))))

(assert (=> b!670899 (= res!437596 (not (contains!3396 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!670900 () Bool)

(assert (=> b!670900 (= e!383547 false)))

(declare-datatypes ((array!39171 0))(
  ( (array!39172 (arr!18778 (Array (_ BitVec 32) (_ BitVec 64))) (size!19142 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39171)

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun lt!312163 () Bool)

(declare-fun arrayNoDuplicates!0 (array!39171 (_ BitVec 32) List!12819) Bool)

(assert (=> b!670900 (= lt!312163 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun res!437593 () Bool)

(assert (=> start!60124 (=> (not res!437593) (not e!383547))))

(assert (=> start!60124 (= res!437593 (and (bvslt (size!19142 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19142 a!3626))))))

(assert (=> start!60124 e!383547))

(assert (=> start!60124 true))

(declare-fun array_inv!14574 (array!39171) Bool)

(assert (=> start!60124 (array_inv!14574 a!3626)))

(declare-fun b!670901 () Bool)

(declare-fun e!383548 () Bool)

(assert (=> b!670901 (= e!383548 (contains!3396 acc!681 k0!2843))))

(declare-fun b!670902 () Bool)

(declare-fun res!437592 () Bool)

(assert (=> b!670902 (=> (not res!437592) (not e!383547))))

(assert (=> b!670902 (= res!437592 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12816))))

(declare-fun b!670903 () Bool)

(declare-fun res!437594 () Bool)

(assert (=> b!670903 (=> (not res!437594) (not e!383547))))

(declare-fun e!383549 () Bool)

(assert (=> b!670903 (= res!437594 e!383549)))

(declare-fun res!437600 () Bool)

(assert (=> b!670903 (=> res!437600 e!383549)))

(assert (=> b!670903 (= res!437600 e!383548)))

(declare-fun res!437595 () Bool)

(assert (=> b!670903 (=> (not res!437595) (not e!383548))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!670903 (= res!437595 (bvsgt from!3004 i!1382))))

(declare-fun b!670904 () Bool)

(assert (=> b!670904 (= e!383549 e!383550)))

(declare-fun res!437599 () Bool)

(assert (=> b!670904 (=> (not res!437599) (not e!383550))))

(assert (=> b!670904 (= res!437599 (bvsle from!3004 i!1382))))

(assert (= (and start!60124 res!437593) b!670898))

(assert (= (and b!670898 res!437598) b!670897))

(assert (= (and b!670897 res!437597) b!670899))

(assert (= (and b!670899 res!437596) b!670903))

(assert (= (and b!670903 res!437595) b!670901))

(assert (= (and b!670903 (not res!437600)) b!670904))

(assert (= (and b!670904 res!437599) b!670896))

(assert (= (and b!670903 res!437594) b!670902))

(assert (= (and b!670902 res!437592) b!670900))

(declare-fun m!640657 () Bool)

(assert (=> b!670896 m!640657))

(declare-fun m!640659 () Bool)

(assert (=> b!670902 m!640659))

(declare-fun m!640661 () Bool)

(assert (=> b!670898 m!640661))

(declare-fun m!640663 () Bool)

(assert (=> b!670897 m!640663))

(declare-fun m!640665 () Bool)

(assert (=> b!670899 m!640665))

(assert (=> b!670901 m!640657))

(declare-fun m!640667 () Bool)

(assert (=> b!670900 m!640667))

(declare-fun m!640669 () Bool)

(assert (=> start!60124 m!640669))

(check-sat (not b!670897) (not b!670898) (not b!670899) (not b!670901) (not b!670902) (not b!670896) (not start!60124) (not b!670900))
(check-sat)
