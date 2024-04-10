; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59698 () Bool)

(assert start!59698)

(declare-fun b!659647 () Bool)

(declare-fun res!427714 () Bool)

(declare-fun e!379001 () Bool)

(assert (=> b!659647 (=> (not res!427714) (not e!379001))))

(declare-datatypes ((List!12624 0))(
  ( (Nil!12621) (Cons!12620 (h!13665 (_ BitVec 64)) (t!18852 List!12624)) )
))
(declare-fun acc!681 () List!12624)

(declare-fun contains!3201 (List!12624 (_ BitVec 64)) Bool)

(assert (=> b!659647 (= res!427714 (not (contains!3201 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!427715 () Bool)

(assert (=> start!59698 (=> (not res!427715) (not e!379001))))

(declare-datatypes ((array!38775 0))(
  ( (array!38776 (arr!18583 (Array (_ BitVec 32) (_ BitVec 64))) (size!18947 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38775)

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> start!59698 (= res!427715 (and (bvslt (size!18947 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!18947 a!3626))))))

(assert (=> start!59698 e!379001))

(assert (=> start!59698 true))

(declare-fun array_inv!14379 (array!38775) Bool)

(assert (=> start!59698 (array_inv!14379 a!3626)))

(declare-fun b!659648 () Bool)

(declare-fun e!379002 () Bool)

(declare-fun e!378998 () Bool)

(assert (=> b!659648 (= e!379002 e!378998)))

(declare-fun res!427718 () Bool)

(assert (=> b!659648 (=> (not res!427718) (not e!378998))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!659648 (= res!427718 (bvsle from!3004 i!1382))))

(declare-fun b!659649 () Bool)

(declare-fun res!427712 () Bool)

(assert (=> b!659649 (=> (not res!427712) (not e!379001))))

(declare-fun noDuplicate!448 (List!12624) Bool)

(assert (=> b!659649 (= res!427712 (noDuplicate!448 acc!681))))

(declare-fun b!659650 () Bool)

(declare-fun res!427717 () Bool)

(assert (=> b!659650 (=> (not res!427717) (not e!379001))))

(assert (=> b!659650 (= res!427717 (not (contains!3201 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!659651 () Bool)

(declare-fun k0!2843 () (_ BitVec 64))

(assert (=> b!659651 (= e!378998 (not (contains!3201 acc!681 k0!2843)))))

(declare-fun b!659652 () Bool)

(declare-fun res!427711 () Bool)

(assert (=> b!659652 (=> (not res!427711) (not e!379001))))

(assert (=> b!659652 (= res!427711 e!379002)))

(declare-fun res!427713 () Bool)

(assert (=> b!659652 (=> res!427713 e!379002)))

(declare-fun e!379000 () Bool)

(assert (=> b!659652 (= res!427713 e!379000)))

(declare-fun res!427716 () Bool)

(assert (=> b!659652 (=> (not res!427716) (not e!379000))))

(assert (=> b!659652 (= res!427716 (bvsgt from!3004 i!1382))))

(declare-fun b!659653 () Bool)

(assert (=> b!659653 (= e!379001 (bvsgt #b00000000000000000000000000000000 (size!18947 a!3626)))))

(declare-fun b!659654 () Bool)

(assert (=> b!659654 (= e!379000 (contains!3201 acc!681 k0!2843))))

(assert (= (and start!59698 res!427715) b!659649))

(assert (= (and b!659649 res!427712) b!659647))

(assert (= (and b!659647 res!427714) b!659650))

(assert (= (and b!659650 res!427717) b!659652))

(assert (= (and b!659652 res!427716) b!659654))

(assert (= (and b!659652 (not res!427713)) b!659648))

(assert (= (and b!659648 res!427718) b!659651))

(assert (= (and b!659652 res!427711) b!659653))

(declare-fun m!632637 () Bool)

(assert (=> start!59698 m!632637))

(declare-fun m!632639 () Bool)

(assert (=> b!659647 m!632639))

(declare-fun m!632641 () Bool)

(assert (=> b!659649 m!632641))

(declare-fun m!632643 () Bool)

(assert (=> b!659650 m!632643))

(declare-fun m!632645 () Bool)

(assert (=> b!659651 m!632645))

(assert (=> b!659654 m!632645))

(check-sat (not b!659650) (not b!659651) (not b!659649) (not start!59698) (not b!659647) (not b!659654))
(check-sat)
