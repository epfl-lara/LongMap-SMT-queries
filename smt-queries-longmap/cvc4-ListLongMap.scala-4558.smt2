; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63524 () Bool)

(assert start!63524)

(declare-fun b!715792 () Bool)

(declare-fun res!478770 () Bool)

(declare-fun e!401903 () Bool)

(assert (=> b!715792 (=> (not res!478770) (not e!401903))))

(declare-datatypes ((List!13447 0))(
  ( (Nil!13444) (Cons!13443 (h!14488 (_ BitVec 64)) (t!19762 List!13447)) )
))
(declare-fun newAcc!49 () List!13447)

(declare-fun contains!4024 (List!13447 (_ BitVec 64)) Bool)

(assert (=> b!715792 (= res!478770 (not (contains!4024 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!715793 () Bool)

(declare-fun res!478776 () Bool)

(assert (=> b!715793 (=> (not res!478776) (not e!401903))))

(declare-datatypes ((array!40538 0))(
  ( (array!40539 (arr!19406 (Array (_ BitVec 32) (_ BitVec 64))) (size!19822 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40538)

(declare-fun from!2969 () (_ BitVec 32))

(declare-fun acc!652 () List!13447)

(declare-fun arrayNoDuplicates!0 (array!40538 (_ BitVec 32) List!13447) Bool)

(assert (=> b!715793 (= res!478776 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) acc!652))))

(declare-fun b!715794 () Bool)

(declare-fun res!478767 () Bool)

(assert (=> b!715794 (=> (not res!478767) (not e!401903))))

(assert (=> b!715794 (= res!478767 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!715795 () Bool)

(declare-fun res!478763 () Bool)

(assert (=> b!715795 (=> (not res!478763) (not e!401903))))

(assert (=> b!715795 (= res!478763 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun b!715796 () Bool)

(declare-fun res!478768 () Bool)

(assert (=> b!715796 (=> (not res!478768) (not e!401903))))

(declare-fun k!2824 () (_ BitVec 64))

(declare-fun -!434 (List!13447 (_ BitVec 64)) List!13447)

(assert (=> b!715796 (= res!478768 (= (-!434 newAcc!49 k!2824) acc!652))))

(declare-fun b!715797 () Bool)

(declare-fun res!478764 () Bool)

(assert (=> b!715797 (=> (not res!478764) (not e!401903))))

(assert (=> b!715797 (= res!478764 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19822 a!3591)))))

(declare-fun res!478773 () Bool)

(assert (=> start!63524 (=> (not res!478773) (not e!401903))))

(assert (=> start!63524 (= res!478773 (and (bvslt (size!19822 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19822 a!3591))))))

(assert (=> start!63524 e!401903))

(assert (=> start!63524 true))

(declare-fun array_inv!15202 (array!40538) Bool)

(assert (=> start!63524 (array_inv!15202 a!3591)))

(declare-fun b!715798 () Bool)

(declare-fun res!478774 () Bool)

(assert (=> b!715798 (=> (not res!478774) (not e!401903))))

(declare-fun noDuplicate!1271 (List!13447) Bool)

(assert (=> b!715798 (= res!478774 (noDuplicate!1271 acc!652))))

(declare-fun b!715799 () Bool)

(declare-fun res!478775 () Bool)

(assert (=> b!715799 (=> (not res!478775) (not e!401903))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!715799 (= res!478775 (validKeyInArray!0 k!2824))))

(declare-fun b!715800 () Bool)

(declare-fun res!478772 () Bool)

(assert (=> b!715800 (=> (not res!478772) (not e!401903))))

(declare-fun subseq!469 (List!13447 List!13447) Bool)

(assert (=> b!715800 (= res!478772 (subseq!469 acc!652 newAcc!49))))

(declare-fun b!715801 () Bool)

(declare-fun res!478779 () Bool)

(assert (=> b!715801 (=> (not res!478779) (not e!401903))))

(declare-fun arrayContainsKey!0 (array!40538 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!715801 (= res!478779 (not (arrayContainsKey!0 a!3591 k!2824 from!2969)))))

(declare-fun b!715802 () Bool)

(declare-fun res!478778 () Bool)

(assert (=> b!715802 (=> (not res!478778) (not e!401903))))

(assert (=> b!715802 (= res!478778 (not (contains!4024 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!715803 () Bool)

(declare-fun res!478771 () Bool)

(assert (=> b!715803 (=> (not res!478771) (not e!401903))))

(assert (=> b!715803 (= res!478771 (contains!4024 newAcc!49 k!2824))))

(declare-fun b!715804 () Bool)

(declare-fun res!478765 () Bool)

(assert (=> b!715804 (=> (not res!478765) (not e!401903))))

(assert (=> b!715804 (= res!478765 (noDuplicate!1271 newAcc!49))))

(declare-fun b!715805 () Bool)

(declare-fun res!478777 () Bool)

(assert (=> b!715805 (=> (not res!478777) (not e!401903))))

(assert (=> b!715805 (= res!478777 (not (validKeyInArray!0 (select (arr!19406 a!3591) from!2969))))))

(declare-fun b!715806 () Bool)

(declare-fun res!478762 () Bool)

(assert (=> b!715806 (=> (not res!478762) (not e!401903))))

(assert (=> b!715806 (= res!478762 (not (contains!4024 acc!652 k!2824)))))

(declare-fun b!715807 () Bool)

(declare-fun res!478780 () Bool)

(assert (=> b!715807 (=> (not res!478780) (not e!401903))))

(assert (=> b!715807 (= res!478780 (not (contains!4024 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!715808 () Bool)

(declare-fun res!478769 () Bool)

(assert (=> b!715808 (=> (not res!478769) (not e!401903))))

(assert (=> b!715808 (= res!478769 (not (arrayContainsKey!0 a!3591 k!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!715809 () Bool)

(assert (=> b!715809 (= e!401903 (bvsge (bvsub (size!19822 a!3591) (bvadd #b00000000000000000000000000000001 from!2969)) (bvsub (size!19822 a!3591) from!2969)))))

(declare-fun b!715810 () Bool)

(declare-fun res!478766 () Bool)

(assert (=> b!715810 (=> (not res!478766) (not e!401903))))

(assert (=> b!715810 (= res!478766 (not (contains!4024 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!63524 res!478773) b!715798))

(assert (= (and b!715798 res!478774) b!715804))

(assert (= (and b!715804 res!478765) b!715807))

(assert (= (and b!715807 res!478780) b!715802))

(assert (= (and b!715802 res!478778) b!715801))

(assert (= (and b!715801 res!478779) b!715806))

(assert (= (and b!715806 res!478762) b!715799))

(assert (= (and b!715799 res!478775) b!715794))

(assert (= (and b!715794 res!478767) b!715800))

(assert (= (and b!715800 res!478772) b!715803))

(assert (= (and b!715803 res!478771) b!715796))

(assert (= (and b!715796 res!478768) b!715810))

(assert (= (and b!715810 res!478766) b!715792))

(assert (= (and b!715792 res!478770) b!715797))

(assert (= (and b!715797 res!478764) b!715805))

(assert (= (and b!715805 res!478777) b!715795))

(assert (= (and b!715795 res!478763) b!715808))

(assert (= (and b!715808 res!478769) b!715793))

(assert (= (and b!715793 res!478776) b!715809))

(declare-fun m!671911 () Bool)

(assert (=> b!715802 m!671911))

(declare-fun m!671913 () Bool)

(assert (=> b!715804 m!671913))

(declare-fun m!671915 () Bool)

(assert (=> b!715810 m!671915))

(declare-fun m!671917 () Bool)

(assert (=> b!715805 m!671917))

(assert (=> b!715805 m!671917))

(declare-fun m!671919 () Bool)

(assert (=> b!715805 m!671919))

(declare-fun m!671921 () Bool)

(assert (=> b!715800 m!671921))

(declare-fun m!671923 () Bool)

(assert (=> b!715799 m!671923))

(declare-fun m!671925 () Bool)

(assert (=> b!715808 m!671925))

(declare-fun m!671927 () Bool)

(assert (=> b!715806 m!671927))

(declare-fun m!671929 () Bool)

(assert (=> b!715794 m!671929))

(declare-fun m!671931 () Bool)

(assert (=> b!715807 m!671931))

(declare-fun m!671933 () Bool)

(assert (=> start!63524 m!671933))

(declare-fun m!671935 () Bool)

(assert (=> b!715793 m!671935))

(declare-fun m!671937 () Bool)

(assert (=> b!715801 m!671937))

(declare-fun m!671939 () Bool)

(assert (=> b!715803 m!671939))

(declare-fun m!671941 () Bool)

(assert (=> b!715792 m!671941))

(declare-fun m!671943 () Bool)

(assert (=> b!715796 m!671943))

(declare-fun m!671945 () Bool)

(assert (=> b!715798 m!671945))

(push 1)

(assert (not b!715799))

(assert (not b!715803))

(assert (not b!715796))

(assert (not b!715805))

(assert (not b!715802))

(assert (not b!715808))

(assert (not b!715806))

(assert (not b!715801))

(assert (not b!715793))

(assert (not b!715794))

(assert (not b!715807))

(assert (not b!715810))

(assert (not b!715792))

(assert (not b!715800))

(assert (not b!715798))

(assert (not start!63524))

(assert (not b!715804))

(check-sat)

(pop 1)

(push 1)

(check-sat)

