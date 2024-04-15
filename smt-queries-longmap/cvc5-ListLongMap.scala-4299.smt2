; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59814 () Bool)

(assert start!59814)

(declare-fun b!660794 () Bool)

(declare-fun res!429022 () Bool)

(declare-fun e!379631 () Bool)

(assert (=> b!660794 (=> (not res!429022) (not e!379631))))

(declare-datatypes ((List!12708 0))(
  ( (Nil!12705) (Cons!12704 (h!13749 (_ BitVec 64)) (t!18927 List!12708)) )
))
(declare-fun acc!681 () List!12708)

(declare-fun noDuplicate!499 (List!12708) Bool)

(assert (=> b!660794 (= res!429022 (noDuplicate!499 acc!681))))

(declare-fun b!660795 () Bool)

(declare-fun res!429023 () Bool)

(assert (=> b!660795 (=> (not res!429023) (not e!379631))))

(declare-fun contains!3230 (List!12708 (_ BitVec 64)) Bool)

(assert (=> b!660795 (= res!429023 (not (contains!3230 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!660796 () Bool)

(declare-fun res!429018 () Bool)

(assert (=> b!660796 (=> (not res!429018) (not e!379631))))

(declare-datatypes ((array!38872 0))(
  ( (array!38873 (arr!18628 (Array (_ BitVec 32) (_ BitVec 64))) (size!18993 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38872)

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!38872 (_ BitVec 32) List!12708) Bool)

(assert (=> b!660796 (= res!429018 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!660797 () Bool)

(declare-fun e!379630 () Bool)

(declare-fun k!2843 () (_ BitVec 64))

(assert (=> b!660797 (= e!379630 (not (contains!3230 acc!681 k!2843)))))

(declare-fun res!429030 () Bool)

(assert (=> start!59814 (=> (not res!429030) (not e!379631))))

(assert (=> start!59814 (= res!429030 (and (bvslt (size!18993 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!18993 a!3626))))))

(assert (=> start!59814 e!379631))

(assert (=> start!59814 true))

(declare-fun array_inv!14511 (array!38872) Bool)

(assert (=> start!59814 (array_inv!14511 a!3626)))

(declare-fun b!660798 () Bool)

(declare-fun res!429026 () Bool)

(assert (=> b!660798 (=> (not res!429026) (not e!379631))))

(declare-fun arrayContainsKey!0 (array!38872 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!660798 (= res!429026 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!660799 () Bool)

(declare-fun e!379627 () Bool)

(assert (=> b!660799 (= e!379627 (contains!3230 acc!681 k!2843))))

(declare-fun b!660800 () Bool)

(declare-fun e!379628 () Bool)

(assert (=> b!660800 (= e!379628 e!379630)))

(declare-fun res!429028 () Bool)

(assert (=> b!660800 (=> (not res!429028) (not e!379630))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!660800 (= res!429028 (bvsle from!3004 i!1382))))

(declare-fun b!660801 () Bool)

(declare-fun res!429021 () Bool)

(assert (=> b!660801 (=> (not res!429021) (not e!379631))))

(assert (=> b!660801 (= res!429021 e!379628)))

(declare-fun res!429019 () Bool)

(assert (=> b!660801 (=> res!429019 e!379628)))

(assert (=> b!660801 (= res!429019 e!379627)))

(declare-fun res!429031 () Bool)

(assert (=> b!660801 (=> (not res!429031) (not e!379627))))

(assert (=> b!660801 (= res!429031 (bvsgt from!3004 i!1382))))

(declare-fun b!660802 () Bool)

(assert (=> b!660802 (= e!379631 (not true))))

(assert (=> b!660802 (arrayContainsKey!0 (array!38873 (store (arr!18628 a!3626) i!1382 k!2843) (size!18993 a!3626)) k!2843 from!3004)))

(declare-fun b!660803 () Bool)

(declare-fun res!429027 () Bool)

(assert (=> b!660803 (=> (not res!429027) (not e!379631))))

(assert (=> b!660803 (= res!429027 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!18993 a!3626))))))

(declare-fun b!660804 () Bool)

(declare-fun res!429025 () Bool)

(assert (=> b!660804 (=> (not res!429025) (not e!379631))))

(assert (=> b!660804 (= res!429025 (not (contains!3230 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!660805 () Bool)

(declare-fun res!429029 () Bool)

(assert (=> b!660805 (=> (not res!429029) (not e!379631))))

(assert (=> b!660805 (= res!429029 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12705))))

(declare-fun b!660806 () Bool)

(declare-fun res!429024 () Bool)

(assert (=> b!660806 (=> (not res!429024) (not e!379631))))

(assert (=> b!660806 (= res!429024 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!18993 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!660807 () Bool)

(declare-fun res!429020 () Bool)

(assert (=> b!660807 (=> (not res!429020) (not e!379631))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!660807 (= res!429020 (validKeyInArray!0 k!2843))))

(assert (= (and start!59814 res!429030) b!660794))

(assert (= (and b!660794 res!429022) b!660804))

(assert (= (and b!660804 res!429025) b!660795))

(assert (= (and b!660795 res!429023) b!660801))

(assert (= (and b!660801 res!429031) b!660799))

(assert (= (and b!660801 (not res!429019)) b!660800))

(assert (= (and b!660800 res!429028) b!660797))

(assert (= (and b!660801 res!429021) b!660805))

(assert (= (and b!660805 res!429029) b!660796))

(assert (= (and b!660796 res!429018) b!660803))

(assert (= (and b!660803 res!429027) b!660807))

(assert (= (and b!660807 res!429020) b!660798))

(assert (= (and b!660798 res!429026) b!660806))

(assert (= (and b!660806 res!429024) b!660802))

(declare-fun m!632663 () Bool)

(assert (=> b!660795 m!632663))

(declare-fun m!632665 () Bool)

(assert (=> b!660802 m!632665))

(declare-fun m!632667 () Bool)

(assert (=> b!660802 m!632667))

(declare-fun m!632669 () Bool)

(assert (=> b!660804 m!632669))

(declare-fun m!632671 () Bool)

(assert (=> start!59814 m!632671))

(declare-fun m!632673 () Bool)

(assert (=> b!660798 m!632673))

(declare-fun m!632675 () Bool)

(assert (=> b!660796 m!632675))

(declare-fun m!632677 () Bool)

(assert (=> b!660799 m!632677))

(declare-fun m!632679 () Bool)

(assert (=> b!660807 m!632679))

(assert (=> b!660797 m!632677))

(declare-fun m!632681 () Bool)

(assert (=> b!660794 m!632681))

(declare-fun m!632683 () Bool)

(assert (=> b!660805 m!632683))

(push 1)

(assert (not b!660805))

(assert (not b!660807))

(assert (not b!660799))

(assert (not b!660802))

(assert (not start!59814))

(assert (not b!660796))

(assert (not b!660795))

(assert (not b!660794))

(assert (not b!660798))

(assert (not b!660804))

(assert (not b!660797))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

