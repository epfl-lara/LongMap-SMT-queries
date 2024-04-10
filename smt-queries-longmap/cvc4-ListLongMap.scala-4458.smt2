; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62046 () Bool)

(assert start!62046)

(declare-fun res!458662 () Bool)

(declare-fun e!395117 () Bool)

(assert (=> start!62046 (=> (not res!458662) (not e!395117))))

(declare-datatypes ((array!39887 0))(
  ( (array!39888 (arr!19106 (Array (_ BitVec 32) (_ BitVec 64))) (size!19491 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39887)

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> start!62046 (= res!458662 (and (bvslt (size!19491 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19491 a!3626))))))

(assert (=> start!62046 e!395117))

(assert (=> start!62046 true))

(declare-fun array_inv!14902 (array!39887) Bool)

(assert (=> start!62046 (array_inv!14902 a!3626)))

(declare-fun b!694623 () Bool)

(declare-fun e!395112 () Bool)

(declare-fun e!395113 () Bool)

(assert (=> b!694623 (= e!395112 e!395113)))

(declare-fun res!458667 () Bool)

(assert (=> b!694623 (=> (not res!458667) (not e!395113))))

(assert (=> b!694623 (= res!458667 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-datatypes ((List!13147 0))(
  ( (Nil!13144) (Cons!13143 (h!14188 (_ BitVec 64)) (t!19426 List!13147)) )
))
(declare-fun acc!681 () List!13147)

(declare-fun lt!316925 () List!13147)

(declare-fun $colon$colon!436 (List!13147 (_ BitVec 64)) List!13147)

(assert (=> b!694623 (= lt!316925 ($colon$colon!436 acc!681 (select (arr!19106 a!3626) from!3004)))))

(declare-fun b!694624 () Bool)

(declare-fun e!395118 () Bool)

(declare-fun e!395109 () Bool)

(assert (=> b!694624 (= e!395118 e!395109)))

(declare-fun res!458668 () Bool)

(assert (=> b!694624 (=> (not res!458668) (not e!395109))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!694624 (= res!458668 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!694625 () Bool)

(declare-fun res!458674 () Bool)

(assert (=> b!694625 (=> (not res!458674) (not e!395117))))

(assert (=> b!694625 (= res!458674 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19491 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!694626 () Bool)

(declare-fun res!458671 () Bool)

(assert (=> b!694626 (=> (not res!458671) (not e!395113))))

(assert (=> b!694626 (= res!458671 e!395118)))

(declare-fun res!458656 () Bool)

(assert (=> b!694626 (=> res!458656 e!395118)))

(declare-fun e!395108 () Bool)

(assert (=> b!694626 (= res!458656 e!395108)))

(declare-fun res!458659 () Bool)

(assert (=> b!694626 (=> (not res!458659) (not e!395108))))

(assert (=> b!694626 (= res!458659 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!694627 () Bool)

(declare-fun res!458654 () Bool)

(assert (=> b!694627 (=> (not res!458654) (not e!395117))))

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!694627 (= res!458654 (validKeyInArray!0 k!2843))))

(declare-fun b!694628 () Bool)

(declare-fun res!458652 () Bool)

(assert (=> b!694628 (=> (not res!458652) (not e!395117))))

(declare-fun arrayNoDuplicates!0 (array!39887 (_ BitVec 32) List!13147) Bool)

(assert (=> b!694628 (= res!458652 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!694629 () Bool)

(declare-fun res!458657 () Bool)

(assert (=> b!694629 (=> (not res!458657) (not e!395113))))

(declare-fun noDuplicate!971 (List!13147) Bool)

(assert (=> b!694629 (= res!458657 (noDuplicate!971 lt!316925))))

(declare-fun b!694630 () Bool)

(declare-fun contains!3724 (List!13147 (_ BitVec 64)) Bool)

(assert (=> b!694630 (= e!395108 (contains!3724 lt!316925 k!2843))))

(declare-fun b!694631 () Bool)

(declare-fun e!395110 () Bool)

(assert (=> b!694631 (= e!395110 (not (contains!3724 acc!681 k!2843)))))

(declare-fun b!694632 () Bool)

(declare-fun res!458658 () Bool)

(assert (=> b!694632 (=> (not res!458658) (not e!395117))))

(assert (=> b!694632 (= res!458658 (not (contains!3724 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!694633 () Bool)

(declare-fun res!458673 () Bool)

(assert (=> b!694633 (=> (not res!458673) (not e!395113))))

(assert (=> b!694633 (= res!458673 (not (contains!3724 lt!316925 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!694634 () Bool)

(declare-fun res!458666 () Bool)

(assert (=> b!694634 (=> (not res!458666) (not e!395113))))

(assert (=> b!694634 (= res!458666 (not (contains!3724 lt!316925 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!694635 () Bool)

(declare-fun e!395114 () Bool)

(assert (=> b!694635 (= e!395114 e!395110)))

(declare-fun res!458672 () Bool)

(assert (=> b!694635 (=> (not res!458672) (not e!395110))))

(assert (=> b!694635 (= res!458672 (bvsle from!3004 i!1382))))

(declare-fun b!694636 () Bool)

(declare-fun res!458655 () Bool)

(assert (=> b!694636 (=> (not res!458655) (not e!395117))))

(assert (=> b!694636 (= res!458655 (validKeyInArray!0 (select (arr!19106 a!3626) from!3004)))))

(declare-fun b!694637 () Bool)

(declare-fun res!458660 () Bool)

(assert (=> b!694637 (=> (not res!458660) (not e!395117))))

(assert (=> b!694637 (= res!458660 e!395114)))

(declare-fun res!458653 () Bool)

(assert (=> b!694637 (=> res!458653 e!395114)))

(declare-fun e!395115 () Bool)

(assert (=> b!694637 (= res!458653 e!395115)))

(declare-fun res!458651 () Bool)

(assert (=> b!694637 (=> (not res!458651) (not e!395115))))

(assert (=> b!694637 (= res!458651 (bvsgt from!3004 i!1382))))

(declare-fun b!694638 () Bool)

(declare-fun res!458664 () Bool)

(assert (=> b!694638 (=> (not res!458664) (not e!395117))))

(assert (=> b!694638 (= res!458664 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19491 a!3626))))))

(declare-fun b!694639 () Bool)

(declare-datatypes ((Unit!24542 0))(
  ( (Unit!24543) )
))
(declare-fun e!395116 () Unit!24542)

(declare-fun Unit!24544 () Unit!24542)

(assert (=> b!694639 (= e!395116 Unit!24544)))

(declare-fun b!694640 () Bool)

(declare-fun Unit!24545 () Unit!24542)

(assert (=> b!694640 (= e!395116 Unit!24545)))

(declare-fun arrayContainsKey!0 (array!39887 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!694640 (arrayContainsKey!0 a!3626 k!2843 from!3004)))

(declare-fun lt!316926 () Unit!24542)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39887 (_ BitVec 64) (_ BitVec 32)) Unit!24542)

(assert (=> b!694640 (= lt!316926 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!694640 false))

(declare-fun b!694641 () Bool)

(declare-fun res!458661 () Bool)

(assert (=> b!694641 (=> (not res!458661) (not e!395113))))

(assert (=> b!694641 (= res!458661 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!316925))))

(declare-fun b!694642 () Bool)

(declare-fun res!458670 () Bool)

(assert (=> b!694642 (=> (not res!458670) (not e!395117))))

(assert (=> b!694642 (= res!458670 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13144))))

(declare-fun b!694643 () Bool)

(assert (=> b!694643 (= e!395109 (not (contains!3724 lt!316925 k!2843)))))

(declare-fun b!694644 () Bool)

(declare-fun res!458663 () Bool)

(assert (=> b!694644 (=> (not res!458663) (not e!395117))))

(assert (=> b!694644 (= res!458663 (not (contains!3724 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!694645 () Bool)

(assert (=> b!694645 (= e!395113 (bvsge (bvsub (size!19491 a!3626) (bvadd #b00000000000000000000000000000001 from!3004)) (bvsub (size!19491 a!3626) from!3004)))))

(declare-fun b!694646 () Bool)

(assert (=> b!694646 (= e!395115 (contains!3724 acc!681 k!2843))))

(declare-fun b!694647 () Bool)

(declare-fun res!458669 () Bool)

(assert (=> b!694647 (=> (not res!458669) (not e!395117))))

(assert (=> b!694647 (= res!458669 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!694648 () Bool)

(assert (=> b!694648 (= e!395117 e!395112)))

(declare-fun res!458665 () Bool)

(assert (=> b!694648 (=> (not res!458665) (not e!395112))))

(assert (=> b!694648 (= res!458665 (not (= (select (arr!19106 a!3626) from!3004) k!2843)))))

(declare-fun lt!316927 () Unit!24542)

(assert (=> b!694648 (= lt!316927 e!395116)))

(declare-fun c!78353 () Bool)

(assert (=> b!694648 (= c!78353 (= (select (arr!19106 a!3626) from!3004) k!2843))))

(declare-fun b!694649 () Bool)

(declare-fun res!458675 () Bool)

(assert (=> b!694649 (=> (not res!458675) (not e!395117))))

(assert (=> b!694649 (= res!458675 (noDuplicate!971 acc!681))))

(assert (= (and start!62046 res!458662) b!694649))

(assert (= (and b!694649 res!458675) b!694644))

(assert (= (and b!694644 res!458663) b!694632))

(assert (= (and b!694632 res!458658) b!694637))

(assert (= (and b!694637 res!458651) b!694646))

(assert (= (and b!694637 (not res!458653)) b!694635))

(assert (= (and b!694635 res!458672) b!694631))

(assert (= (and b!694637 res!458660) b!694642))

(assert (= (and b!694642 res!458670) b!694628))

(assert (= (and b!694628 res!458652) b!694638))

(assert (= (and b!694638 res!458664) b!694627))

(assert (= (and b!694627 res!458654) b!694647))

(assert (= (and b!694647 res!458669) b!694625))

(assert (= (and b!694625 res!458674) b!694636))

(assert (= (and b!694636 res!458655) b!694648))

(assert (= (and b!694648 c!78353) b!694640))

(assert (= (and b!694648 (not c!78353)) b!694639))

(assert (= (and b!694648 res!458665) b!694623))

(assert (= (and b!694623 res!458667) b!694629))

(assert (= (and b!694629 res!458657) b!694634))

(assert (= (and b!694634 res!458666) b!694633))

(assert (= (and b!694633 res!458673) b!694626))

(assert (= (and b!694626 res!458659) b!694630))

(assert (= (and b!694626 (not res!458656)) b!694624))

(assert (= (and b!694624 res!458668) b!694643))

(assert (= (and b!694626 res!458671) b!694641))

(assert (= (and b!694641 res!458661) b!694645))

(declare-fun m!656355 () Bool)

(assert (=> b!694631 m!656355))

(declare-fun m!656357 () Bool)

(assert (=> b!694647 m!656357))

(declare-fun m!656359 () Bool)

(assert (=> b!694636 m!656359))

(assert (=> b!694636 m!656359))

(declare-fun m!656361 () Bool)

(assert (=> b!694636 m!656361))

(declare-fun m!656363 () Bool)

(assert (=> b!694633 m!656363))

(declare-fun m!656365 () Bool)

(assert (=> b!694644 m!656365))

(declare-fun m!656367 () Bool)

(assert (=> b!694634 m!656367))

(declare-fun m!656369 () Bool)

(assert (=> b!694629 m!656369))

(assert (=> b!694648 m!656359))

(declare-fun m!656371 () Bool)

(assert (=> start!62046 m!656371))

(declare-fun m!656373 () Bool)

(assert (=> b!694641 m!656373))

(declare-fun m!656375 () Bool)

(assert (=> b!694642 m!656375))

(assert (=> b!694623 m!656359))

(assert (=> b!694623 m!656359))

(declare-fun m!656377 () Bool)

(assert (=> b!694623 m!656377))

(declare-fun m!656379 () Bool)

(assert (=> b!694632 m!656379))

(declare-fun m!656381 () Bool)

(assert (=> b!694628 m!656381))

(declare-fun m!656383 () Bool)

(assert (=> b!694643 m!656383))

(declare-fun m!656385 () Bool)

(assert (=> b!694649 m!656385))

(declare-fun m!656387 () Bool)

(assert (=> b!694640 m!656387))

(declare-fun m!656389 () Bool)

(assert (=> b!694640 m!656389))

(assert (=> b!694630 m!656383))

(declare-fun m!656391 () Bool)

(assert (=> b!694627 m!656391))

(assert (=> b!694646 m!656355))

(push 1)

(assert (not b!694640))

(assert (not b!694636))

(assert (not b!694642))

(assert (not b!694629))

(assert (not b!694634))

(assert (not b!694643))

(assert (not b!694644))

(assert (not b!694633))

(assert (not b!694623))

(assert (not b!694631))

(assert (not b!694627))

(assert (not b!694641))

(assert (not b!694647))

(assert (not b!694630))

(assert (not b!694628))

(assert (not b!694632))

(assert (not b!694646))

(assert (not b!694649))

(assert (not start!62046))

(check-sat)

(pop 1)

(push 1)

(check-sat)

