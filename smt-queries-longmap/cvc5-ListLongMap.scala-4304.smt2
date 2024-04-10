; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59852 () Bool)

(assert start!59852)

(declare-fun b!661636 () Bool)

(declare-fun res!429707 () Bool)

(declare-fun e!380013 () Bool)

(assert (=> b!661636 (=> (not res!429707) (not e!380013))))

(declare-datatypes ((List!12683 0))(
  ( (Nil!12680) (Cons!12679 (h!13724 (_ BitVec 64)) (t!18911 List!12683)) )
))
(declare-fun acc!681 () List!12683)

(declare-fun noDuplicate!507 (List!12683) Bool)

(assert (=> b!661636 (= res!429707 (noDuplicate!507 acc!681))))

(declare-fun b!661637 () Bool)

(declare-fun res!429710 () Bool)

(assert (=> b!661637 (=> (not res!429710) (not e!380013))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-datatypes ((array!38899 0))(
  ( (array!38900 (arr!18642 (Array (_ BitVec 32) (_ BitVec 64))) (size!19006 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38899)

(assert (=> b!661637 (= res!429710 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19006 a!3626))))))

(declare-fun b!661638 () Bool)

(declare-fun res!429709 () Bool)

(assert (=> b!661638 (=> (not res!429709) (not e!380013))))

(declare-fun contains!3260 (List!12683 (_ BitVec 64)) Bool)

(assert (=> b!661638 (= res!429709 (not (contains!3260 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!661639 () Bool)

(declare-fun e!380016 () Bool)

(declare-fun k!2843 () (_ BitVec 64))

(assert (=> b!661639 (= e!380016 (not (contains!3260 acc!681 k!2843)))))

(declare-fun b!661640 () Bool)

(assert (=> b!661640 (= e!380013 (not true))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!38899 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!661640 (arrayContainsKey!0 (array!38900 (store (arr!18642 a!3626) i!1382 k!2843) (size!19006 a!3626)) k!2843 from!3004)))

(declare-fun b!661641 () Bool)

(declare-fun res!429713 () Bool)

(assert (=> b!661641 (=> (not res!429713) (not e!380013))))

(assert (=> b!661641 (= res!429713 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19006 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!661642 () Bool)

(declare-fun res!429706 () Bool)

(assert (=> b!661642 (=> (not res!429706) (not e!380013))))

(declare-fun arrayNoDuplicates!0 (array!38899 (_ BitVec 32) List!12683) Bool)

(assert (=> b!661642 (= res!429706 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12680))))

(declare-fun b!661643 () Bool)

(declare-fun res!429708 () Bool)

(assert (=> b!661643 (=> (not res!429708) (not e!380013))))

(assert (=> b!661643 (= res!429708 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!661644 () Bool)

(declare-fun res!429705 () Bool)

(assert (=> b!661644 (=> (not res!429705) (not e!380013))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!661644 (= res!429705 (validKeyInArray!0 k!2843))))

(declare-fun b!661645 () Bool)

(declare-fun res!429703 () Bool)

(assert (=> b!661645 (=> (not res!429703) (not e!380013))))

(assert (=> b!661645 (= res!429703 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun res!429702 () Bool)

(assert (=> start!59852 (=> (not res!429702) (not e!380013))))

(assert (=> start!59852 (= res!429702 (and (bvslt (size!19006 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19006 a!3626))))))

(assert (=> start!59852 e!380013))

(assert (=> start!59852 true))

(declare-fun array_inv!14438 (array!38899) Bool)

(assert (=> start!59852 (array_inv!14438 a!3626)))

(declare-fun b!661646 () Bool)

(declare-fun e!380012 () Bool)

(assert (=> b!661646 (= e!380012 (contains!3260 acc!681 k!2843))))

(declare-fun b!661647 () Bool)

(declare-fun res!429712 () Bool)

(assert (=> b!661647 (=> (not res!429712) (not e!380013))))

(declare-fun e!380014 () Bool)

(assert (=> b!661647 (= res!429712 e!380014)))

(declare-fun res!429704 () Bool)

(assert (=> b!661647 (=> res!429704 e!380014)))

(assert (=> b!661647 (= res!429704 e!380012)))

(declare-fun res!429711 () Bool)

(assert (=> b!661647 (=> (not res!429711) (not e!380012))))

(assert (=> b!661647 (= res!429711 (bvsgt from!3004 i!1382))))

(declare-fun b!661648 () Bool)

(assert (=> b!661648 (= e!380014 e!380016)))

(declare-fun res!429701 () Bool)

(assert (=> b!661648 (=> (not res!429701) (not e!380016))))

(assert (=> b!661648 (= res!429701 (bvsle from!3004 i!1382))))

(declare-fun b!661649 () Bool)

(declare-fun res!429700 () Bool)

(assert (=> b!661649 (=> (not res!429700) (not e!380013))))

(assert (=> b!661649 (= res!429700 (not (contains!3260 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!59852 res!429702) b!661636))

(assert (= (and b!661636 res!429707) b!661638))

(assert (= (and b!661638 res!429709) b!661649))

(assert (= (and b!661649 res!429700) b!661647))

(assert (= (and b!661647 res!429711) b!661646))

(assert (= (and b!661647 (not res!429704)) b!661648))

(assert (= (and b!661648 res!429701) b!661639))

(assert (= (and b!661647 res!429712) b!661642))

(assert (= (and b!661642 res!429706) b!661645))

(assert (= (and b!661645 res!429703) b!661637))

(assert (= (and b!661637 res!429710) b!661644))

(assert (= (and b!661644 res!429705) b!661643))

(assert (= (and b!661643 res!429708) b!661641))

(assert (= (and b!661641 res!429713) b!661640))

(declare-fun m!633731 () Bool)

(assert (=> start!59852 m!633731))

(declare-fun m!633733 () Bool)

(assert (=> b!661636 m!633733))

(declare-fun m!633735 () Bool)

(assert (=> b!661649 m!633735))

(declare-fun m!633737 () Bool)

(assert (=> b!661639 m!633737))

(declare-fun m!633739 () Bool)

(assert (=> b!661638 m!633739))

(declare-fun m!633741 () Bool)

(assert (=> b!661642 m!633741))

(declare-fun m!633743 () Bool)

(assert (=> b!661644 m!633743))

(declare-fun m!633745 () Bool)

(assert (=> b!661643 m!633745))

(declare-fun m!633747 () Bool)

(assert (=> b!661640 m!633747))

(declare-fun m!633749 () Bool)

(assert (=> b!661640 m!633749))

(declare-fun m!633751 () Bool)

(assert (=> b!661645 m!633751))

(assert (=> b!661646 m!633737))

(push 1)

(assert (not start!59852))

(assert (not b!661639))

(assert (not b!661636))

(assert (not b!661640))

(assert (not b!661646))

(assert (not b!661649))

(assert (not b!661638))

(assert (not b!661644))

(assert (not b!661643))

(assert (not b!661645))

(assert (not b!661642))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

