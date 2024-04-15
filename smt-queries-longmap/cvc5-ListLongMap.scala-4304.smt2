; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59844 () Bool)

(assert start!59844)

(declare-fun b!661424 () Bool)

(declare-fun res!429661 () Bool)

(declare-fun e!379854 () Bool)

(assert (=> b!661424 (=> (not res!429661) (not e!379854))))

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!661424 (= res!429661 (validKeyInArray!0 k!2843))))

(declare-fun res!429648 () Bool)

(assert (=> start!59844 (=> (not res!429648) (not e!379854))))

(declare-datatypes ((array!38902 0))(
  ( (array!38903 (arr!18643 (Array (_ BitVec 32) (_ BitVec 64))) (size!19008 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38902)

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> start!59844 (= res!429648 (and (bvslt (size!19008 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19008 a!3626))))))

(assert (=> start!59844 e!379854))

(assert (=> start!59844 true))

(declare-fun array_inv!14526 (array!38902) Bool)

(assert (=> start!59844 (array_inv!14526 a!3626)))

(declare-fun b!661425 () Bool)

(declare-fun res!429658 () Bool)

(assert (=> b!661425 (=> (not res!429658) (not e!379854))))

(declare-datatypes ((List!12723 0))(
  ( (Nil!12720) (Cons!12719 (h!13764 (_ BitVec 64)) (t!18942 List!12723)) )
))
(declare-fun acc!681 () List!12723)

(declare-fun contains!3245 (List!12723 (_ BitVec 64)) Bool)

(assert (=> b!661425 (= res!429658 (not (contains!3245 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!661426 () Bool)

(declare-fun e!379853 () Bool)

(declare-fun e!379855 () Bool)

(assert (=> b!661426 (= e!379853 e!379855)))

(declare-fun res!429652 () Bool)

(assert (=> b!661426 (=> (not res!429652) (not e!379855))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!661426 (= res!429652 (bvsle from!3004 i!1382))))

(declare-fun b!661427 () Bool)

(assert (=> b!661427 (= e!379854 (not true))))

(declare-fun arrayContainsKey!0 (array!38902 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!661427 (arrayContainsKey!0 (array!38903 (store (arr!18643 a!3626) i!1382 k!2843) (size!19008 a!3626)) k!2843 from!3004)))

(declare-fun b!661428 () Bool)

(declare-fun res!429653 () Bool)

(assert (=> b!661428 (=> (not res!429653) (not e!379854))))

(assert (=> b!661428 (= res!429653 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19008 a!3626))))))

(declare-fun b!661429 () Bool)

(declare-fun res!429654 () Bool)

(assert (=> b!661429 (=> (not res!429654) (not e!379854))))

(declare-fun arrayNoDuplicates!0 (array!38902 (_ BitVec 32) List!12723) Bool)

(assert (=> b!661429 (= res!429654 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12720))))

(declare-fun b!661430 () Bool)

(declare-fun res!429655 () Bool)

(assert (=> b!661430 (=> (not res!429655) (not e!379854))))

(assert (=> b!661430 (= res!429655 e!379853)))

(declare-fun res!429660 () Bool)

(assert (=> b!661430 (=> res!429660 e!379853)))

(declare-fun e!379852 () Bool)

(assert (=> b!661430 (= res!429660 e!379852)))

(declare-fun res!429659 () Bool)

(assert (=> b!661430 (=> (not res!429659) (not e!379852))))

(assert (=> b!661430 (= res!429659 (bvsgt from!3004 i!1382))))

(declare-fun b!661431 () Bool)

(declare-fun res!429651 () Bool)

(assert (=> b!661431 (=> (not res!429651) (not e!379854))))

(assert (=> b!661431 (= res!429651 (not (contains!3245 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!661432 () Bool)

(declare-fun res!429656 () Bool)

(assert (=> b!661432 (=> (not res!429656) (not e!379854))))

(assert (=> b!661432 (= res!429656 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!661433 () Bool)

(declare-fun res!429657 () Bool)

(assert (=> b!661433 (=> (not res!429657) (not e!379854))))

(assert (=> b!661433 (= res!429657 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19008 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!661434 () Bool)

(declare-fun res!429649 () Bool)

(assert (=> b!661434 (=> (not res!429649) (not e!379854))))

(declare-fun noDuplicate!514 (List!12723) Bool)

(assert (=> b!661434 (= res!429649 (noDuplicate!514 acc!681))))

(declare-fun b!661435 () Bool)

(declare-fun res!429650 () Bool)

(assert (=> b!661435 (=> (not res!429650) (not e!379854))))

(assert (=> b!661435 (= res!429650 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!661436 () Bool)

(assert (=> b!661436 (= e!379852 (contains!3245 acc!681 k!2843))))

(declare-fun b!661437 () Bool)

(assert (=> b!661437 (= e!379855 (not (contains!3245 acc!681 k!2843)))))

(assert (= (and start!59844 res!429648) b!661434))

(assert (= (and b!661434 res!429649) b!661425))

(assert (= (and b!661425 res!429658) b!661431))

(assert (= (and b!661431 res!429651) b!661430))

(assert (= (and b!661430 res!429659) b!661436))

(assert (= (and b!661430 (not res!429660)) b!661426))

(assert (= (and b!661426 res!429652) b!661437))

(assert (= (and b!661430 res!429655) b!661429))

(assert (= (and b!661429 res!429654) b!661432))

(assert (= (and b!661432 res!429656) b!661428))

(assert (= (and b!661428 res!429653) b!661424))

(assert (= (and b!661424 res!429661) b!661435))

(assert (= (and b!661435 res!429650) b!661433))

(assert (= (and b!661433 res!429657) b!661427))

(declare-fun m!632993 () Bool)

(assert (=> b!661427 m!632993))

(declare-fun m!632995 () Bool)

(assert (=> b!661427 m!632995))

(declare-fun m!632997 () Bool)

(assert (=> start!59844 m!632997))

(declare-fun m!632999 () Bool)

(assert (=> b!661437 m!632999))

(declare-fun m!633001 () Bool)

(assert (=> b!661429 m!633001))

(declare-fun m!633003 () Bool)

(assert (=> b!661434 m!633003))

(declare-fun m!633005 () Bool)

(assert (=> b!661432 m!633005))

(declare-fun m!633007 () Bool)

(assert (=> b!661435 m!633007))

(declare-fun m!633009 () Bool)

(assert (=> b!661425 m!633009))

(declare-fun m!633011 () Bool)

(assert (=> b!661424 m!633011))

(assert (=> b!661436 m!632999))

(declare-fun m!633013 () Bool)

(assert (=> b!661431 m!633013))

(push 1)

(assert (not b!661437))

(assert (not b!661432))

(assert (not b!661436))

(assert (not b!661435))

(assert (not start!59844))

(assert (not b!661427))

(assert (not b!661434))

(assert (not b!661429))

(assert (not b!661425))

(assert (not b!661431))

(assert (not b!661424))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

