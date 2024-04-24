; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62452 () Bool)

(assert start!62452)

(declare-fun b!699811 () Bool)

(declare-fun res!463547 () Bool)

(declare-fun e!397318 () Bool)

(assert (=> b!699811 (=> (not res!463547) (not e!397318))))

(declare-datatypes ((List!13137 0))(
  ( (Nil!13134) (Cons!13133 (h!14181 (_ BitVec 64)) (t!19411 List!13137)) )
))
(declare-fun newAcc!49 () List!13137)

(declare-fun contains!3789 (List!13137 (_ BitVec 64)) Bool)

(assert (=> b!699811 (= res!463547 (not (contains!3789 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!699812 () Bool)

(declare-fun res!463524 () Bool)

(declare-fun e!397319 () Bool)

(assert (=> b!699812 (=> (not res!463524) (not e!397319))))

(declare-fun lt!317497 () List!13137)

(declare-fun lt!317498 () List!13137)

(declare-fun subseq!257 (List!13137 List!13137) Bool)

(assert (=> b!699812 (= res!463524 (subseq!257 lt!317497 lt!317498))))

(declare-fun b!699813 () Bool)

(declare-fun res!463531 () Bool)

(assert (=> b!699813 (=> (not res!463531) (not e!397318))))

(declare-fun acc!652 () List!13137)

(assert (=> b!699813 (= res!463531 (not (contains!3789 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!699814 () Bool)

(declare-fun res!463543 () Bool)

(assert (=> b!699814 (=> (not res!463543) (not e!397319))))

(declare-fun noDuplicate!1063 (List!13137) Bool)

(assert (=> b!699814 (= res!463543 (noDuplicate!1063 lt!317497))))

(declare-fun res!463530 () Bool)

(assert (=> start!62452 (=> (not res!463530) (not e!397318))))

(declare-datatypes ((array!40071 0))(
  ( (array!40072 (arr!19189 (Array (_ BitVec 32) (_ BitVec 64))) (size!19572 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40071)

(declare-fun from!2969 () (_ BitVec 32))

(assert (=> start!62452 (= res!463530 (and (bvslt (size!19572 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19572 a!3591))))))

(assert (=> start!62452 e!397318))

(assert (=> start!62452 true))

(declare-fun array_inv!15048 (array!40071) Bool)

(assert (=> start!62452 (array_inv!15048 a!3591)))

(declare-fun b!699815 () Bool)

(declare-fun res!463541 () Bool)

(assert (=> b!699815 (=> (not res!463541) (not e!397318))))

(assert (=> b!699815 (= res!463541 (not (contains!3789 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!699816 () Bool)

(declare-fun res!463544 () Bool)

(assert (=> b!699816 (=> (not res!463544) (not e!397318))))

(declare-fun k0!2824 () (_ BitVec 64))

(declare-fun -!221 (List!13137 (_ BitVec 64)) List!13137)

(assert (=> b!699816 (= res!463544 (= (-!221 newAcc!49 k0!2824) acc!652))))

(declare-fun b!699817 () Bool)

(declare-fun res!463536 () Bool)

(assert (=> b!699817 (=> (not res!463536) (not e!397318))))

(assert (=> b!699817 (= res!463536 (noDuplicate!1063 newAcc!49))))

(declare-fun b!699818 () Bool)

(declare-fun res!463522 () Bool)

(assert (=> b!699818 (=> (not res!463522) (not e!397319))))

(assert (=> b!699818 (= res!463522 (contains!3789 lt!317498 k0!2824))))

(declare-fun b!699819 () Bool)

(declare-fun res!463538 () Bool)

(assert (=> b!699819 (=> (not res!463538) (not e!397318))))

(declare-fun arrayNoDuplicates!0 (array!40071 (_ BitVec 32) List!13137) Bool)

(assert (=> b!699819 (= res!463538 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!699820 () Bool)

(declare-fun res!463529 () Bool)

(assert (=> b!699820 (=> (not res!463529) (not e!397318))))

(assert (=> b!699820 (= res!463529 (noDuplicate!1063 acc!652))))

(declare-fun b!699821 () Bool)

(declare-fun res!463526 () Bool)

(assert (=> b!699821 (=> (not res!463526) (not e!397319))))

(assert (=> b!699821 (= res!463526 (noDuplicate!1063 lt!317498))))

(declare-fun b!699822 () Bool)

(declare-fun res!463532 () Bool)

(assert (=> b!699822 (=> (not res!463532) (not e!397318))))

(assert (=> b!699822 (= res!463532 (subseq!257 acc!652 newAcc!49))))

(declare-fun b!699823 () Bool)

(declare-fun res!463542 () Bool)

(assert (=> b!699823 (=> (not res!463542) (not e!397319))))

(assert (=> b!699823 (= res!463542 (not (contains!3789 lt!317498 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!699824 () Bool)

(assert (=> b!699824 (= e!397319 false)))

(declare-fun lt!317499 () Bool)

(assert (=> b!699824 (= lt!317499 (contains!3789 lt!317498 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!699825 () Bool)

(declare-fun res!463527 () Bool)

(assert (=> b!699825 (=> (not res!463527) (not e!397318))))

(declare-fun arrayContainsKey!0 (array!40071 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!699825 (= res!463527 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(declare-fun b!699826 () Bool)

(declare-fun res!463540 () Bool)

(assert (=> b!699826 (=> (not res!463540) (not e!397318))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!699826 (= res!463540 (validKeyInArray!0 (select (arr!19189 a!3591) from!2969)))))

(declare-fun b!699827 () Bool)

(declare-fun res!463548 () Bool)

(assert (=> b!699827 (=> (not res!463548) (not e!397319))))

(assert (=> b!699827 (= res!463548 (not (contains!3789 lt!317497 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!699828 () Bool)

(declare-fun res!463537 () Bool)

(assert (=> b!699828 (=> (not res!463537) (not e!397318))))

(assert (=> b!699828 (= res!463537 (validKeyInArray!0 k0!2824))))

(declare-fun b!699829 () Bool)

(declare-fun res!463539 () Bool)

(assert (=> b!699829 (=> (not res!463539) (not e!397319))))

(assert (=> b!699829 (= res!463539 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) lt!317497))))

(declare-fun b!699830 () Bool)

(assert (=> b!699830 (= e!397318 e!397319)))

(declare-fun res!463525 () Bool)

(assert (=> b!699830 (=> (not res!463525) (not e!397319))))

(assert (=> b!699830 (= res!463525 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!452 (List!13137 (_ BitVec 64)) List!13137)

(assert (=> b!699830 (= lt!317498 ($colon$colon!452 newAcc!49 (select (arr!19189 a!3591) from!2969)))))

(assert (=> b!699830 (= lt!317497 ($colon$colon!452 acc!652 (select (arr!19189 a!3591) from!2969)))))

(declare-fun b!699831 () Bool)

(declare-fun res!463528 () Bool)

(assert (=> b!699831 (=> (not res!463528) (not e!397319))))

(assert (=> b!699831 (= res!463528 (not (contains!3789 lt!317497 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!699832 () Bool)

(declare-fun res!463545 () Bool)

(assert (=> b!699832 (=> (not res!463545) (not e!397318))))

(assert (=> b!699832 (= res!463545 (not (contains!3789 acc!652 k0!2824)))))

(declare-fun b!699833 () Bool)

(declare-fun res!463546 () Bool)

(assert (=> b!699833 (=> (not res!463546) (not e!397319))))

(assert (=> b!699833 (= res!463546 (= (-!221 lt!317498 k0!2824) lt!317497))))

(declare-fun b!699834 () Bool)

(declare-fun res!463534 () Bool)

(assert (=> b!699834 (=> (not res!463534) (not e!397319))))

(assert (=> b!699834 (= res!463534 (not (contains!3789 lt!317497 k0!2824)))))

(declare-fun b!699835 () Bool)

(declare-fun res!463535 () Bool)

(assert (=> b!699835 (=> (not res!463535) (not e!397318))))

(assert (=> b!699835 (= res!463535 (contains!3789 newAcc!49 k0!2824))))

(declare-fun b!699836 () Bool)

(declare-fun res!463549 () Bool)

(assert (=> b!699836 (=> (not res!463549) (not e!397318))))

(assert (=> b!699836 (= res!463549 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19572 a!3591)))))

(declare-fun b!699837 () Bool)

(declare-fun res!463533 () Bool)

(assert (=> b!699837 (=> (not res!463533) (not e!397318))))

(assert (=> b!699837 (= res!463533 (not (contains!3789 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!699838 () Bool)

(declare-fun res!463523 () Bool)

(assert (=> b!699838 (=> (not res!463523) (not e!397319))))

(assert (=> b!699838 (= res!463523 (not (arrayContainsKey!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(assert (= (and start!62452 res!463530) b!699820))

(assert (= (and b!699820 res!463529) b!699817))

(assert (= (and b!699817 res!463536) b!699813))

(assert (= (and b!699813 res!463531) b!699815))

(assert (= (and b!699815 res!463541) b!699825))

(assert (= (and b!699825 res!463527) b!699832))

(assert (= (and b!699832 res!463545) b!699828))

(assert (= (and b!699828 res!463537) b!699819))

(assert (= (and b!699819 res!463538) b!699822))

(assert (= (and b!699822 res!463532) b!699835))

(assert (= (and b!699835 res!463535) b!699816))

(assert (= (and b!699816 res!463544) b!699811))

(assert (= (and b!699811 res!463547) b!699837))

(assert (= (and b!699837 res!463533) b!699836))

(assert (= (and b!699836 res!463549) b!699826))

(assert (= (and b!699826 res!463540) b!699830))

(assert (= (and b!699830 res!463525) b!699814))

(assert (= (and b!699814 res!463543) b!699821))

(assert (= (and b!699821 res!463526) b!699827))

(assert (= (and b!699827 res!463548) b!699831))

(assert (= (and b!699831 res!463528) b!699838))

(assert (= (and b!699838 res!463523) b!699834))

(assert (= (and b!699834 res!463534) b!699829))

(assert (= (and b!699829 res!463539) b!699812))

(assert (= (and b!699812 res!463524) b!699818))

(assert (= (and b!699818 res!463522) b!699833))

(assert (= (and b!699833 res!463546) b!699823))

(assert (= (and b!699823 res!463542) b!699824))

(declare-fun m!660171 () Bool)

(assert (=> b!699826 m!660171))

(assert (=> b!699826 m!660171))

(declare-fun m!660173 () Bool)

(assert (=> b!699826 m!660173))

(declare-fun m!660175 () Bool)

(assert (=> b!699820 m!660175))

(declare-fun m!660177 () Bool)

(assert (=> b!699815 m!660177))

(declare-fun m!660179 () Bool)

(assert (=> b!699814 m!660179))

(declare-fun m!660181 () Bool)

(assert (=> b!699822 m!660181))

(declare-fun m!660183 () Bool)

(assert (=> b!699838 m!660183))

(declare-fun m!660185 () Bool)

(assert (=> b!699811 m!660185))

(declare-fun m!660187 () Bool)

(assert (=> b!699827 m!660187))

(declare-fun m!660189 () Bool)

(assert (=> b!699837 m!660189))

(declare-fun m!660191 () Bool)

(assert (=> b!699834 m!660191))

(declare-fun m!660193 () Bool)

(assert (=> b!699832 m!660193))

(declare-fun m!660195 () Bool)

(assert (=> b!699818 m!660195))

(declare-fun m!660197 () Bool)

(assert (=> start!62452 m!660197))

(declare-fun m!660199 () Bool)

(assert (=> b!699812 m!660199))

(declare-fun m!660201 () Bool)

(assert (=> b!699831 m!660201))

(declare-fun m!660203 () Bool)

(assert (=> b!699829 m!660203))

(declare-fun m!660205 () Bool)

(assert (=> b!699835 m!660205))

(declare-fun m!660207 () Bool)

(assert (=> b!699828 m!660207))

(declare-fun m!660209 () Bool)

(assert (=> b!699823 m!660209))

(declare-fun m!660211 () Bool)

(assert (=> b!699817 m!660211))

(declare-fun m!660213 () Bool)

(assert (=> b!699821 m!660213))

(declare-fun m!660215 () Bool)

(assert (=> b!699816 m!660215))

(assert (=> b!699830 m!660171))

(assert (=> b!699830 m!660171))

(declare-fun m!660217 () Bool)

(assert (=> b!699830 m!660217))

(assert (=> b!699830 m!660171))

(declare-fun m!660219 () Bool)

(assert (=> b!699830 m!660219))

(declare-fun m!660221 () Bool)

(assert (=> b!699819 m!660221))

(declare-fun m!660223 () Bool)

(assert (=> b!699813 m!660223))

(declare-fun m!660225 () Bool)

(assert (=> b!699833 m!660225))

(declare-fun m!660227 () Bool)

(assert (=> b!699824 m!660227))

(declare-fun m!660229 () Bool)

(assert (=> b!699825 m!660229))

(check-sat (not b!699822) (not b!699838) (not start!62452) (not b!699837) (not b!699814) (not b!699827) (not b!699821) (not b!699817) (not b!699828) (not b!699831) (not b!699835) (not b!699830) (not b!699824) (not b!699829) (not b!699819) (not b!699815) (not b!699825) (not b!699813) (not b!699818) (not b!699811) (not b!699820) (not b!699826) (not b!699833) (not b!699823) (not b!699834) (not b!699816) (not b!699812) (not b!699832))
(check-sat)
