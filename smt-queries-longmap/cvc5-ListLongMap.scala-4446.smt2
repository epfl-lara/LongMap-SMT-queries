; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61778 () Bool)

(assert start!61778)

(declare-fun b!691478 () Bool)

(declare-fun res!455848 () Bool)

(declare-fun e!393523 () Bool)

(assert (=> b!691478 (=> (not res!455848) (not e!393523))))

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!691478 (= res!455848 (validKeyInArray!0 k!2843))))

(declare-fun b!691479 () Bool)

(assert (=> b!691479 (= e!393523 false)))

(declare-datatypes ((Unit!24390 0))(
  ( (Unit!24391) )
))
(declare-fun lt!316470 () Unit!24390)

(declare-fun e!393527 () Unit!24390)

(assert (=> b!691479 (= lt!316470 e!393527)))

(declare-fun c!78188 () Bool)

(declare-fun from!3004 () (_ BitVec 32))

(declare-datatypes ((array!39799 0))(
  ( (array!39800 (arr!19068 (Array (_ BitVec 32) (_ BitVec 64))) (size!19453 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39799)

(assert (=> b!691479 (= c!78188 (= (select (arr!19068 a!3626) from!3004) k!2843))))

(declare-fun b!691480 () Bool)

(declare-fun res!455844 () Bool)

(assert (=> b!691480 (=> (not res!455844) (not e!393523))))

(declare-datatypes ((List!13109 0))(
  ( (Nil!13106) (Cons!13105 (h!14150 (_ BitVec 64)) (t!19376 List!13109)) )
))
(declare-fun arrayNoDuplicates!0 (array!39799 (_ BitVec 32) List!13109) Bool)

(assert (=> b!691480 (= res!455844 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13106))))

(declare-fun b!691481 () Bool)

(declare-fun Unit!24392 () Unit!24390)

(assert (=> b!691481 (= e!393527 Unit!24392)))

(declare-fun b!691482 () Bool)

(declare-fun e!393526 () Bool)

(declare-fun e!393525 () Bool)

(assert (=> b!691482 (= e!393526 e!393525)))

(declare-fun res!455841 () Bool)

(assert (=> b!691482 (=> (not res!455841) (not e!393525))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!691482 (= res!455841 (bvsle from!3004 i!1382))))

(declare-fun b!691483 () Bool)

(declare-fun res!455838 () Bool)

(assert (=> b!691483 (=> (not res!455838) (not e!393523))))

(declare-fun acc!681 () List!13109)

(assert (=> b!691483 (= res!455838 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!691484 () Bool)

(declare-fun res!455843 () Bool)

(assert (=> b!691484 (=> (not res!455843) (not e!393523))))

(assert (=> b!691484 (= res!455843 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19453 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!691485 () Bool)

(declare-fun res!455840 () Bool)

(assert (=> b!691485 (=> (not res!455840) (not e!393523))))

(assert (=> b!691485 (= res!455840 (validKeyInArray!0 (select (arr!19068 a!3626) from!3004)))))

(declare-fun b!691486 () Bool)

(declare-fun res!455842 () Bool)

(assert (=> b!691486 (=> (not res!455842) (not e!393523))))

(assert (=> b!691486 (= res!455842 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19453 a!3626))))))

(declare-fun b!691487 () Bool)

(declare-fun res!455847 () Bool)

(assert (=> b!691487 (=> (not res!455847) (not e!393523))))

(assert (=> b!691487 (= res!455847 e!393526)))

(declare-fun res!455837 () Bool)

(assert (=> b!691487 (=> res!455837 e!393526)))

(declare-fun e!393528 () Bool)

(assert (=> b!691487 (= res!455837 e!393528)))

(declare-fun res!455849 () Bool)

(assert (=> b!691487 (=> (not res!455849) (not e!393528))))

(assert (=> b!691487 (= res!455849 (bvsgt from!3004 i!1382))))

(declare-fun b!691477 () Bool)

(declare-fun res!455836 () Bool)

(assert (=> b!691477 (=> (not res!455836) (not e!393523))))

(declare-fun noDuplicate!933 (List!13109) Bool)

(assert (=> b!691477 (= res!455836 (noDuplicate!933 acc!681))))

(declare-fun res!455839 () Bool)

(assert (=> start!61778 (=> (not res!455839) (not e!393523))))

(assert (=> start!61778 (= res!455839 (and (bvslt (size!19453 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19453 a!3626))))))

(assert (=> start!61778 e!393523))

(assert (=> start!61778 true))

(declare-fun array_inv!14864 (array!39799) Bool)

(assert (=> start!61778 (array_inv!14864 a!3626)))

(declare-fun b!691488 () Bool)

(declare-fun contains!3686 (List!13109 (_ BitVec 64)) Bool)

(assert (=> b!691488 (= e!393525 (not (contains!3686 acc!681 k!2843)))))

(declare-fun b!691489 () Bool)

(declare-fun res!455846 () Bool)

(assert (=> b!691489 (=> (not res!455846) (not e!393523))))

(assert (=> b!691489 (= res!455846 (not (contains!3686 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!691490 () Bool)

(declare-fun Unit!24393 () Unit!24390)

(assert (=> b!691490 (= e!393527 Unit!24393)))

(declare-fun arrayContainsKey!0 (array!39799 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!691490 (arrayContainsKey!0 a!3626 k!2843 from!3004)))

(declare-fun lt!316471 () Unit!24390)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39799 (_ BitVec 64) (_ BitVec 32)) Unit!24390)

(assert (=> b!691490 (= lt!316471 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!691490 false))

(declare-fun b!691491 () Bool)

(assert (=> b!691491 (= e!393528 (contains!3686 acc!681 k!2843))))

(declare-fun b!691492 () Bool)

(declare-fun res!455845 () Bool)

(assert (=> b!691492 (=> (not res!455845) (not e!393523))))

(assert (=> b!691492 (= res!455845 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!691493 () Bool)

(declare-fun res!455835 () Bool)

(assert (=> b!691493 (=> (not res!455835) (not e!393523))))

(assert (=> b!691493 (= res!455835 (not (contains!3686 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!61778 res!455839) b!691477))

(assert (= (and b!691477 res!455836) b!691493))

(assert (= (and b!691493 res!455835) b!691489))

(assert (= (and b!691489 res!455846) b!691487))

(assert (= (and b!691487 res!455849) b!691491))

(assert (= (and b!691487 (not res!455837)) b!691482))

(assert (= (and b!691482 res!455841) b!691488))

(assert (= (and b!691487 res!455847) b!691480))

(assert (= (and b!691480 res!455844) b!691483))

(assert (= (and b!691483 res!455838) b!691486))

(assert (= (and b!691486 res!455842) b!691478))

(assert (= (and b!691478 res!455848) b!691492))

(assert (= (and b!691492 res!455845) b!691484))

(assert (= (and b!691484 res!455843) b!691485))

(assert (= (and b!691485 res!455840) b!691479))

(assert (= (and b!691479 c!78188) b!691490))

(assert (= (and b!691479 (not c!78188)) b!691481))

(declare-fun m!654485 () Bool)

(assert (=> b!691477 m!654485))

(declare-fun m!654487 () Bool)

(assert (=> b!691490 m!654487))

(declare-fun m!654489 () Bool)

(assert (=> b!691490 m!654489))

(declare-fun m!654491 () Bool)

(assert (=> b!691492 m!654491))

(declare-fun m!654493 () Bool)

(assert (=> b!691489 m!654493))

(declare-fun m!654495 () Bool)

(assert (=> b!691491 m!654495))

(declare-fun m!654497 () Bool)

(assert (=> b!691480 m!654497))

(declare-fun m!654499 () Bool)

(assert (=> b!691478 m!654499))

(declare-fun m!654501 () Bool)

(assert (=> b!691479 m!654501))

(declare-fun m!654503 () Bool)

(assert (=> b!691493 m!654503))

(declare-fun m!654505 () Bool)

(assert (=> b!691483 m!654505))

(assert (=> b!691488 m!654495))

(assert (=> b!691485 m!654501))

(assert (=> b!691485 m!654501))

(declare-fun m!654507 () Bool)

(assert (=> b!691485 m!654507))

(declare-fun m!654509 () Bool)

(assert (=> start!61778 m!654509))

(push 1)

(assert (not b!691485))

(assert (not b!691478))

(assert (not b!691491))

(assert (not b!691490))

(assert (not b!691492))

(assert (not b!691493))

(assert (not b!691488))

(assert (not b!691489))

(assert (not b!691477))

(assert (not b!691480))

(assert (not b!691483))

(assert (not start!61778))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

