; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62132 () Bool)

(assert start!62132)

(declare-fun b!695661 () Bool)

(declare-fun e!395655 () Bool)

(assert (=> b!695661 (= e!395655 false)))

(declare-fun lt!317071 () Bool)

(declare-datatypes ((array!39922 0))(
  ( (array!39923 (arr!19122 (Array (_ BitVec 32) (_ BitVec 64))) (size!19507 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39922)

(declare-fun from!3004 () (_ BitVec 32))

(declare-datatypes ((List!13163 0))(
  ( (Nil!13160) (Cons!13159 (h!14204 (_ BitVec 64)) (t!19445 List!13163)) )
))
(declare-fun acc!681 () List!13163)

(declare-fun arrayNoDuplicates!0 (array!39922 (_ BitVec 32) List!13163) Bool)

(assert (=> b!695661 (= lt!317071 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!695662 () Bool)

(declare-fun res!459611 () Bool)

(assert (=> b!695662 (=> (not res!459611) (not e!395655))))

(assert (=> b!695662 (= res!459611 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13160))))

(declare-fun b!695663 () Bool)

(declare-fun e!395654 () Bool)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3740 (List!13163 (_ BitVec 64)) Bool)

(assert (=> b!695663 (= e!395654 (contains!3740 acc!681 k!2843))))

(declare-fun b!695664 () Bool)

(declare-fun res!459610 () Bool)

(assert (=> b!695664 (=> (not res!459610) (not e!395655))))

(declare-fun noDuplicate!987 (List!13163) Bool)

(assert (=> b!695664 (= res!459610 (noDuplicate!987 acc!681))))

(declare-fun b!695665 () Bool)

(declare-fun res!459613 () Bool)

(assert (=> b!695665 (=> (not res!459613) (not e!395655))))

(assert (=> b!695665 (= res!459613 (not (contains!3740 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!695666 () Bool)

(declare-fun res!459612 () Bool)

(assert (=> b!695666 (=> (not res!459612) (not e!395655))))

(assert (=> b!695666 (= res!459612 (not (contains!3740 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!695667 () Bool)

(declare-fun e!395652 () Bool)

(assert (=> b!695667 (= e!395652 (not (contains!3740 acc!681 k!2843)))))

(declare-fun res!459615 () Bool)

(assert (=> start!62132 (=> (not res!459615) (not e!395655))))

(assert (=> start!62132 (= res!459615 (and (bvslt (size!19507 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19507 a!3626))))))

(assert (=> start!62132 e!395655))

(assert (=> start!62132 true))

(declare-fun array_inv!14918 (array!39922) Bool)

(assert (=> start!62132 (array_inv!14918 a!3626)))

(declare-fun b!695668 () Bool)

(declare-fun e!395651 () Bool)

(assert (=> b!695668 (= e!395651 e!395652)))

(declare-fun res!459617 () Bool)

(assert (=> b!695668 (=> (not res!459617) (not e!395652))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!695668 (= res!459617 (bvsle from!3004 i!1382))))

(declare-fun b!695669 () Bool)

(declare-fun res!459614 () Bool)

(assert (=> b!695669 (=> (not res!459614) (not e!395655))))

(assert (=> b!695669 (= res!459614 e!395651)))

(declare-fun res!459616 () Bool)

(assert (=> b!695669 (=> res!459616 e!395651)))

(assert (=> b!695669 (= res!459616 e!395654)))

(declare-fun res!459609 () Bool)

(assert (=> b!695669 (=> (not res!459609) (not e!395654))))

(assert (=> b!695669 (= res!459609 (bvsgt from!3004 i!1382))))

(assert (= (and start!62132 res!459615) b!695664))

(assert (= (and b!695664 res!459610) b!695665))

(assert (= (and b!695665 res!459613) b!695666))

(assert (= (and b!695666 res!459612) b!695669))

(assert (= (and b!695669 res!459609) b!695663))

(assert (= (and b!695669 (not res!459616)) b!695668))

(assert (= (and b!695668 res!459617) b!695667))

(assert (= (and b!695669 res!459614) b!695662))

(assert (= (and b!695662 res!459611) b!695661))

(declare-fun m!657059 () Bool)

(assert (=> b!695666 m!657059))

(declare-fun m!657061 () Bool)

(assert (=> b!695661 m!657061))

(declare-fun m!657063 () Bool)

(assert (=> b!695663 m!657063))

(declare-fun m!657065 () Bool)

(assert (=> b!695665 m!657065))

(declare-fun m!657067 () Bool)

(assert (=> b!695662 m!657067))

(declare-fun m!657069 () Bool)

(assert (=> b!695664 m!657069))

(declare-fun m!657071 () Bool)

(assert (=> start!62132 m!657071))

(assert (=> b!695667 m!657063))

(push 1)

(assert (not b!695667))

(assert (not b!695661))

(assert (not b!695663))

(assert (not b!695662))

(assert (not b!695664))

(assert (not start!62132))

(assert (not b!695666))

(assert (not b!695665))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

