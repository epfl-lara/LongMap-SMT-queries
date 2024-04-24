; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62194 () Bool)

(assert start!62194)

(declare-fun b!695939 () Bool)

(declare-fun e!395826 () Bool)

(declare-datatypes ((List!13067 0))(
  ( (Nil!13064) (Cons!13063 (h!14111 (_ BitVec 64)) (t!19341 List!13067)) )
))
(declare-fun acc!681 () List!13067)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3719 (List!13067 (_ BitVec 64)) Bool)

(assert (=> b!695939 (= e!395826 (not (contains!3719 acc!681 k!2843)))))

(declare-fun b!695940 () Bool)

(declare-fun res!459781 () Bool)

(declare-fun e!395823 () Bool)

(assert (=> b!695940 (=> (not res!459781) (not e!395823))))

(assert (=> b!695940 (= res!459781 (not (contains!3719 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!695941 () Bool)

(declare-fun e!395824 () Bool)

(assert (=> b!695941 (= e!395824 (contains!3719 acc!681 k!2843))))

(declare-fun res!459782 () Bool)

(assert (=> start!62194 (=> (not res!459782) (not e!395823))))

(declare-datatypes ((array!39922 0))(
  ( (array!39923 (arr!19119 (Array (_ BitVec 32) (_ BitVec 64))) (size!19502 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39922)

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> start!62194 (= res!459782 (and (bvslt (size!19502 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19502 a!3626))))))

(assert (=> start!62194 e!395823))

(assert (=> start!62194 true))

(declare-fun array_inv!14978 (array!39922) Bool)

(assert (=> start!62194 (array_inv!14978 a!3626)))

(declare-fun b!695942 () Bool)

(declare-fun res!459779 () Bool)

(assert (=> b!695942 (=> (not res!459779) (not e!395823))))

(declare-fun e!395822 () Bool)

(assert (=> b!695942 (= res!459779 e!395822)))

(declare-fun res!459778 () Bool)

(assert (=> b!695942 (=> res!459778 e!395822)))

(assert (=> b!695942 (= res!459778 e!395824)))

(declare-fun res!459784 () Bool)

(assert (=> b!695942 (=> (not res!459784) (not e!395824))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!695942 (= res!459784 (bvsgt from!3004 i!1382))))

(declare-fun b!695943 () Bool)

(declare-fun res!459783 () Bool)

(assert (=> b!695943 (=> (not res!459783) (not e!395823))))

(assert (=> b!695943 (= res!459783 (not (contains!3719 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!695944 () Bool)

(assert (=> b!695944 (= e!395822 e!395826)))

(declare-fun res!459777 () Bool)

(assert (=> b!695944 (=> (not res!459777) (not e!395826))))

(assert (=> b!695944 (= res!459777 (bvsle from!3004 i!1382))))

(declare-fun b!695945 () Bool)

(declare-fun res!459780 () Bool)

(assert (=> b!695945 (=> (not res!459780) (not e!395823))))

(declare-fun noDuplicate!993 (List!13067) Bool)

(assert (=> b!695945 (= res!459780 (noDuplicate!993 acc!681))))

(declare-fun b!695946 () Bool)

(declare-fun res!459776 () Bool)

(assert (=> b!695946 (=> (not res!459776) (not e!395823))))

(declare-fun arrayNoDuplicates!0 (array!39922 (_ BitVec 32) List!13067) Bool)

(assert (=> b!695946 (= res!459776 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13064))))

(declare-fun b!695947 () Bool)

(assert (=> b!695947 (= e!395823 false)))

(declare-fun lt!317179 () Bool)

(assert (=> b!695947 (= lt!317179 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(assert (= (and start!62194 res!459782) b!695945))

(assert (= (and b!695945 res!459780) b!695943))

(assert (= (and b!695943 res!459783) b!695940))

(assert (= (and b!695940 res!459781) b!695942))

(assert (= (and b!695942 res!459784) b!695941))

(assert (= (and b!695942 (not res!459778)) b!695944))

(assert (= (and b!695944 res!459777) b!695939))

(assert (= (and b!695942 res!459779) b!695946))

(assert (= (and b!695946 res!459776) b!695947))

(declare-fun m!657785 () Bool)

(assert (=> b!695947 m!657785))

(declare-fun m!657787 () Bool)

(assert (=> b!695941 m!657787))

(declare-fun m!657789 () Bool)

(assert (=> start!62194 m!657789))

(declare-fun m!657791 () Bool)

(assert (=> b!695946 m!657791))

(declare-fun m!657793 () Bool)

(assert (=> b!695940 m!657793))

(assert (=> b!695939 m!657787))

(declare-fun m!657795 () Bool)

(assert (=> b!695945 m!657795))

(declare-fun m!657797 () Bool)

(assert (=> b!695943 m!657797))

(push 1)

(assert (not start!62194))

(assert (not b!695946))

(assert (not b!695943))

(assert (not b!695939))

(assert (not b!695940))

(assert (not b!695947))

(assert (not b!695945))

(assert (not b!695941))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

