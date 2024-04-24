; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59908 () Bool)

(assert start!59908)

(declare-fun b!661818 () Bool)

(declare-fun res!429783 () Bool)

(declare-fun e!380139 () Bool)

(assert (=> b!661818 (=> (not res!429783) (not e!380139))))

(declare-datatypes ((List!12584 0))(
  ( (Nil!12581) (Cons!12580 (h!13628 (_ BitVec 64)) (t!18804 List!12584)) )
))
(declare-fun acc!681 () List!12584)

(declare-fun contains!3236 (List!12584 (_ BitVec 64)) Bool)

(assert (=> b!661818 (= res!429783 (not (contains!3236 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!661819 () Bool)

(declare-fun res!429779 () Bool)

(assert (=> b!661819 (=> (not res!429779) (not e!380139))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-datatypes ((array!38893 0))(
  ( (array!38894 (arr!18636 (Array (_ BitVec 32) (_ BitVec 64))) (size!19000 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38893)

(assert (=> b!661819 (= res!429779 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19000 a!3626))))))

(declare-fun b!661820 () Bool)

(assert (=> b!661820 (= e!380139 (not true))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!38893 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!661820 (arrayContainsKey!0 (array!38894 (store (arr!18636 a!3626) i!1382 k!2843) (size!19000 a!3626)) k!2843 from!3004)))

(declare-fun b!661821 () Bool)

(declare-fun res!429776 () Bool)

(assert (=> b!661821 (=> (not res!429776) (not e!380139))))

(assert (=> b!661821 (= res!429776 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!661822 () Bool)

(declare-fun res!429781 () Bool)

(assert (=> b!661822 (=> (not res!429781) (not e!380139))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!661822 (= res!429781 (validKeyInArray!0 k!2843))))

(declare-fun b!661823 () Bool)

(declare-fun res!429774 () Bool)

(assert (=> b!661823 (=> (not res!429774) (not e!380139))))

(declare-fun arrayNoDuplicates!0 (array!38893 (_ BitVec 32) List!12584) Bool)

(assert (=> b!661823 (= res!429774 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!661824 () Bool)

(declare-fun res!429784 () Bool)

(assert (=> b!661824 (=> (not res!429784) (not e!380139))))

(declare-fun noDuplicate!510 (List!12584) Bool)

(assert (=> b!661824 (= res!429784 (noDuplicate!510 acc!681))))

(declare-fun res!429777 () Bool)

(assert (=> start!59908 (=> (not res!429777) (not e!380139))))

(assert (=> start!59908 (= res!429777 (and (bvslt (size!19000 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19000 a!3626))))))

(assert (=> start!59908 e!380139))

(assert (=> start!59908 true))

(declare-fun array_inv!14495 (array!38893) Bool)

(assert (=> start!59908 (array_inv!14495 a!3626)))

(declare-fun b!661825 () Bool)

(declare-fun res!429771 () Bool)

(assert (=> b!661825 (=> (not res!429771) (not e!380139))))

(assert (=> b!661825 (= res!429771 (not (contains!3236 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!661826 () Bool)

(declare-fun e!380141 () Bool)

(assert (=> b!661826 (= e!380141 (contains!3236 acc!681 k!2843))))

(declare-fun b!661827 () Bool)

(declare-fun e!380140 () Bool)

(assert (=> b!661827 (= e!380140 (not (contains!3236 acc!681 k!2843)))))

(declare-fun b!661828 () Bool)

(declare-fun res!429772 () Bool)

(assert (=> b!661828 (=> (not res!429772) (not e!380139))))

(assert (=> b!661828 (= res!429772 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19000 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!661829 () Bool)

(declare-fun res!429778 () Bool)

(assert (=> b!661829 (=> (not res!429778) (not e!380139))))

(declare-fun e!380142 () Bool)

(assert (=> b!661829 (= res!429778 e!380142)))

(declare-fun res!429775 () Bool)

(assert (=> b!661829 (=> res!429775 e!380142)))

(assert (=> b!661829 (= res!429775 e!380141)))

(declare-fun res!429782 () Bool)

(assert (=> b!661829 (=> (not res!429782) (not e!380141))))

(assert (=> b!661829 (= res!429782 (bvsgt from!3004 i!1382))))

(declare-fun b!661830 () Bool)

(assert (=> b!661830 (= e!380142 e!380140)))

(declare-fun res!429773 () Bool)

(assert (=> b!661830 (=> (not res!429773) (not e!380140))))

(assert (=> b!661830 (= res!429773 (bvsle from!3004 i!1382))))

(declare-fun b!661831 () Bool)

(declare-fun res!429780 () Bool)

(assert (=> b!661831 (=> (not res!429780) (not e!380139))))

(assert (=> b!661831 (= res!429780 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12581))))

(assert (= (and start!59908 res!429777) b!661824))

(assert (= (and b!661824 res!429784) b!661818))

(assert (= (and b!661818 res!429783) b!661825))

(assert (= (and b!661825 res!429771) b!661829))

(assert (= (and b!661829 res!429782) b!661826))

(assert (= (and b!661829 (not res!429775)) b!661830))

(assert (= (and b!661830 res!429773) b!661827))

(assert (= (and b!661829 res!429778) b!661831))

(assert (= (and b!661831 res!429780) b!661823))

(assert (= (and b!661823 res!429774) b!661819))

(assert (= (and b!661819 res!429779) b!661822))

(assert (= (and b!661822 res!429781) b!661821))

(assert (= (and b!661821 res!429776) b!661828))

(assert (= (and b!661828 res!429772) b!661820))

(declare-fun m!634407 () Bool)

(assert (=> b!661818 m!634407))

(declare-fun m!634409 () Bool)

(assert (=> b!661831 m!634409))

(declare-fun m!634411 () Bool)

(assert (=> b!661821 m!634411))

(declare-fun m!634413 () Bool)

(assert (=> start!59908 m!634413))

(declare-fun m!634415 () Bool)

(assert (=> b!661826 m!634415))

(declare-fun m!634417 () Bool)

(assert (=> b!661824 m!634417))

(declare-fun m!634419 () Bool)

(assert (=> b!661822 m!634419))

(declare-fun m!634421 () Bool)

(assert (=> b!661825 m!634421))

(declare-fun m!634423 () Bool)

(assert (=> b!661820 m!634423))

(declare-fun m!634425 () Bool)

(assert (=> b!661820 m!634425))

(assert (=> b!661827 m!634415))

(declare-fun m!634427 () Bool)

(assert (=> b!661823 m!634427))

(push 1)

(assert (not b!661824))

(assert (not b!661831))

(assert (not b!661821))

(assert (not b!661825))

(assert (not start!59908))

(assert (not b!661826))

(assert (not b!661820))

(assert (not b!661818))

(assert (not b!661822))

(assert (not b!661823))

(assert (not b!661827))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

