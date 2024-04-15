; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59744 () Bool)

(assert start!59744)

(declare-fun b!659764 () Bool)

(declare-fun res!427988 () Bool)

(declare-fun e!379104 () Bool)

(assert (=> b!659764 (=> (not res!427988) (not e!379104))))

(declare-fun e!379103 () Bool)

(assert (=> b!659764 (= res!427988 e!379103)))

(declare-fun res!427996 () Bool)

(assert (=> b!659764 (=> res!427996 e!379103)))

(declare-fun e!379102 () Bool)

(assert (=> b!659764 (= res!427996 e!379102)))

(declare-fun res!427993 () Bool)

(assert (=> b!659764 (=> (not res!427993) (not e!379102))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!659764 (= res!427993 (bvsgt from!3004 i!1382))))

(declare-fun b!659765 () Bool)

(declare-fun res!427990 () Bool)

(assert (=> b!659765 (=> (not res!427990) (not e!379104))))

(declare-datatypes ((List!12673 0))(
  ( (Nil!12670) (Cons!12669 (h!13714 (_ BitVec 64)) (t!18892 List!12673)) )
))
(declare-fun acc!681 () List!12673)

(declare-fun noDuplicate!464 (List!12673) Bool)

(assert (=> b!659765 (= res!427990 (noDuplicate!464 acc!681))))

(declare-fun b!659766 () Bool)

(declare-fun res!427989 () Bool)

(assert (=> b!659766 (=> (not res!427989) (not e!379104))))

(declare-datatypes ((array!38802 0))(
  ( (array!38803 (arr!18593 (Array (_ BitVec 32) (_ BitVec 64))) (size!18958 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38802)

(declare-fun arrayNoDuplicates!0 (array!38802 (_ BitVec 32) List!12673) Bool)

(assert (=> b!659766 (= res!427989 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12670))))

(declare-fun b!659767 () Bool)

(declare-fun res!427995 () Bool)

(assert (=> b!659767 (=> (not res!427995) (not e!379104))))

(declare-fun contains!3195 (List!12673 (_ BitVec 64)) Bool)

(assert (=> b!659767 (= res!427995 (not (contains!3195 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!427992 () Bool)

(assert (=> start!59744 (=> (not res!427992) (not e!379104))))

(assert (=> start!59744 (= res!427992 (and (bvslt (size!18958 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!18958 a!3626))))))

(assert (=> start!59744 e!379104))

(assert (=> start!59744 true))

(declare-fun array_inv!14476 (array!38802) Bool)

(assert (=> start!59744 (array_inv!14476 a!3626)))

(declare-fun b!659768 () Bool)

(declare-fun k0!2843 () (_ BitVec 64))

(assert (=> b!659768 (= e!379102 (contains!3195 acc!681 k0!2843))))

(declare-fun b!659769 () Bool)

(assert (=> b!659769 (= e!379104 (bvsgt from!3004 (size!18958 a!3626)))))

(declare-fun b!659770 () Bool)

(declare-fun res!427991 () Bool)

(assert (=> b!659770 (=> (not res!427991) (not e!379104))))

(assert (=> b!659770 (= res!427991 (not (contains!3195 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!659771 () Bool)

(declare-fun e!379105 () Bool)

(assert (=> b!659771 (= e!379105 (not (contains!3195 acc!681 k0!2843)))))

(declare-fun b!659772 () Bool)

(assert (=> b!659772 (= e!379103 e!379105)))

(declare-fun res!427994 () Bool)

(assert (=> b!659772 (=> (not res!427994) (not e!379105))))

(assert (=> b!659772 (= res!427994 (bvsle from!3004 i!1382))))

(assert (= (and start!59744 res!427992) b!659765))

(assert (= (and b!659765 res!427990) b!659770))

(assert (= (and b!659770 res!427991) b!659767))

(assert (= (and b!659767 res!427995) b!659764))

(assert (= (and b!659764 res!427993) b!659768))

(assert (= (and b!659764 (not res!427996)) b!659772))

(assert (= (and b!659772 res!427994) b!659771))

(assert (= (and b!659764 res!427988) b!659766))

(assert (= (and b!659766 res!427989) b!659769))

(declare-fun m!632151 () Bool)

(assert (=> b!659768 m!632151))

(declare-fun m!632153 () Bool)

(assert (=> b!659765 m!632153))

(declare-fun m!632155 () Bool)

(assert (=> b!659766 m!632155))

(declare-fun m!632157 () Bool)

(assert (=> b!659770 m!632157))

(declare-fun m!632159 () Bool)

(assert (=> start!59744 m!632159))

(assert (=> b!659771 m!632151))

(declare-fun m!632161 () Bool)

(assert (=> b!659767 m!632161))

(check-sat (not start!59744) (not b!659767) (not b!659765) (not b!659768) (not b!659770) (not b!659766) (not b!659771))
(check-sat)
