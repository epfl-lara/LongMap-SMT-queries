; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59694 () Bool)

(assert start!59694)

(declare-fun b!659439 () Bool)

(declare-fun res!427663 () Bool)

(declare-fun e!378868 () Bool)

(assert (=> b!659439 (=> (not res!427663) (not e!378868))))

(declare-datatypes ((List!12666 0))(
  ( (Nil!12663) (Cons!12662 (h!13707 (_ BitVec 64)) (t!18885 List!12666)) )
))
(declare-fun acc!681 () List!12666)

(declare-fun contains!3188 (List!12666 (_ BitVec 64)) Bool)

(assert (=> b!659439 (= res!427663 (not (contains!3188 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!659440 () Bool)

(declare-fun e!378870 () Bool)

(declare-fun e!378871 () Bool)

(assert (=> b!659440 (= e!378870 e!378871)))

(declare-fun res!427667 () Bool)

(assert (=> b!659440 (=> (not res!427667) (not e!378871))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!659440 (= res!427667 (bvsle from!3004 i!1382))))

(declare-fun res!427669 () Bool)

(assert (=> start!59694 (=> (not res!427669) (not e!378868))))

(declare-datatypes ((array!38782 0))(
  ( (array!38783 (arr!18586 (Array (_ BitVec 32) (_ BitVec 64))) (size!18951 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38782)

(assert (=> start!59694 (= res!427669 (and (bvslt (size!18951 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!18951 a!3626))))))

(assert (=> start!59694 e!378868))

(assert (=> start!59694 true))

(declare-fun array_inv!14469 (array!38782) Bool)

(assert (=> start!59694 (array_inv!14469 a!3626)))

(declare-fun b!659441 () Bool)

(declare-fun res!427666 () Bool)

(assert (=> b!659441 (=> (not res!427666) (not e!378868))))

(declare-fun noDuplicate!457 (List!12666) Bool)

(assert (=> b!659441 (= res!427666 (noDuplicate!457 acc!681))))

(declare-fun b!659442 () Bool)

(assert (=> b!659442 (= e!378868 false)))

(declare-fun lt!308454 () Bool)

(assert (=> b!659442 (= lt!308454 e!378870)))

(declare-fun res!427668 () Bool)

(assert (=> b!659442 (=> res!427668 e!378870)))

(declare-fun e!378869 () Bool)

(assert (=> b!659442 (= res!427668 e!378869)))

(declare-fun res!427665 () Bool)

(assert (=> b!659442 (=> (not res!427665) (not e!378869))))

(assert (=> b!659442 (= res!427665 (bvsgt from!3004 i!1382))))

(declare-fun b!659443 () Bool)

(declare-fun res!427664 () Bool)

(assert (=> b!659443 (=> (not res!427664) (not e!378868))))

(assert (=> b!659443 (= res!427664 (not (contains!3188 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!659444 () Bool)

(declare-fun k!2843 () (_ BitVec 64))

(assert (=> b!659444 (= e!378871 (not (contains!3188 acc!681 k!2843)))))

(declare-fun b!659445 () Bool)

(assert (=> b!659445 (= e!378869 (contains!3188 acc!681 k!2843))))

(assert (= (and start!59694 res!427669) b!659441))

(assert (= (and b!659441 res!427666) b!659439))

(assert (= (and b!659439 res!427663) b!659443))

(assert (= (and b!659443 res!427664) b!659442))

(assert (= (and b!659442 res!427665) b!659445))

(assert (= (and b!659442 (not res!427668)) b!659440))

(assert (= (and b!659440 res!427667) b!659444))

(declare-fun m!631895 () Bool)

(assert (=> start!59694 m!631895))

(declare-fun m!631897 () Bool)

(assert (=> b!659441 m!631897))

(declare-fun m!631899 () Bool)

(assert (=> b!659439 m!631899))

(declare-fun m!631901 () Bool)

(assert (=> b!659443 m!631901))

(declare-fun m!631903 () Bool)

(assert (=> b!659445 m!631903))

(assert (=> b!659444 m!631903))

(push 1)

(assert (not b!659441))

(assert (not b!659445))

(assert (not start!59694))

(assert (not b!659439))

(assert (not b!659444))

(assert (not b!659443))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

