; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61060 () Bool)

(assert start!61060)

(declare-fun b!684713 () Bool)

(declare-fun res!450159 () Bool)

(declare-fun e!389936 () Bool)

(assert (=> b!684713 (=> (not res!450159) (not e!389936))))

(declare-datatypes ((List!12929 0))(
  ( (Nil!12926) (Cons!12925 (h!13973 (_ BitVec 64)) (t!19167 List!12929)) )
))
(declare-fun acc!681 () List!12929)

(declare-fun contains!3581 (List!12929 (_ BitVec 64)) Bool)

(assert (=> b!684713 (= res!450159 (not (contains!3581 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!684714 () Bool)

(declare-fun res!450169 () Bool)

(assert (=> b!684714 (=> (not res!450169) (not e!389936))))

(declare-datatypes ((array!39607 0))(
  ( (array!39608 (arr!18981 (Array (_ BitVec 32) (_ BitVec 64))) (size!19348 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39607)

(declare-fun arrayNoDuplicates!0 (array!39607 (_ BitVec 32) List!12929) Bool)

(assert (=> b!684714 (= res!450169 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12926))))

(declare-fun b!684715 () Bool)

(declare-fun res!450170 () Bool)

(assert (=> b!684715 (=> (not res!450170) (not e!389936))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!684715 (= res!450170 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19348 a!3626))))))

(declare-fun b!684716 () Bool)

(declare-fun res!450162 () Bool)

(assert (=> b!684716 (=> (not res!450162) (not e!389936))))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!684716 (= res!450162 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!684717 () Bool)

(declare-datatypes ((Unit!24076 0))(
  ( (Unit!24077) )
))
(declare-fun e!389933 () Unit!24076)

(declare-fun Unit!24078 () Unit!24076)

(assert (=> b!684717 (= e!389933 Unit!24078)))

(declare-fun lt!314453 () Unit!24076)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39607 (_ BitVec 64) (_ BitVec 32)) Unit!24076)

(assert (=> b!684717 (= lt!314453 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!684717 false))

(declare-fun b!684718 () Bool)

(declare-fun res!450166 () Bool)

(assert (=> b!684718 (=> (not res!450166) (not e!389936))))

(assert (=> b!684718 (= res!450166 (not (contains!3581 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!684719 () Bool)

(declare-fun Unit!24079 () Unit!24076)

(assert (=> b!684719 (= e!389933 Unit!24079)))

(declare-fun b!684720 () Bool)

(declare-fun e!389931 () Bool)

(declare-fun e!389935 () Bool)

(assert (=> b!684720 (= e!389931 e!389935)))

(declare-fun res!450156 () Bool)

(assert (=> b!684720 (=> (not res!450156) (not e!389935))))

(assert (=> b!684720 (= res!450156 (bvsle from!3004 i!1382))))

(declare-fun res!450158 () Bool)

(assert (=> start!61060 (=> (not res!450158) (not e!389936))))

(assert (=> start!61060 (= res!450158 (and (bvslt (size!19348 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19348 a!3626))))))

(assert (=> start!61060 e!389936))

(assert (=> start!61060 true))

(declare-fun array_inv!14840 (array!39607) Bool)

(assert (=> start!61060 (array_inv!14840 a!3626)))

(declare-fun b!684721 () Bool)

(declare-fun res!450167 () Bool)

(assert (=> b!684721 (=> (not res!450167) (not e!389936))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!684721 (= res!450167 (validKeyInArray!0 k!2843))))

(declare-fun b!684722 () Bool)

(declare-fun res!450171 () Bool)

(declare-fun e!389937 () Bool)

(assert (=> b!684722 (=> res!450171 e!389937)))

(declare-fun lt!314451 () Bool)

(assert (=> b!684722 (= res!450171 lt!314451)))

(declare-fun b!684723 () Bool)

(declare-fun res!450161 () Bool)

(assert (=> b!684723 (=> res!450161 e!389937)))

(declare-fun lt!314456 () List!12929)

(declare-fun noDuplicate!855 (List!12929) Bool)

(assert (=> b!684723 (= res!450161 (not (noDuplicate!855 lt!314456)))))

(declare-fun b!684724 () Bool)

(declare-fun e!389932 () Bool)

(assert (=> b!684724 (= e!389932 (contains!3581 acc!681 k!2843))))

(declare-fun b!684725 () Bool)

(assert (=> b!684725 (= e!389936 (not e!389937))))

(declare-fun res!450165 () Bool)

(assert (=> b!684725 (=> res!450165 e!389937)))

(assert (=> b!684725 (= res!450165 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun -!154 (List!12929 (_ BitVec 64)) List!12929)

(assert (=> b!684725 (= (-!154 lt!314456 k!2843) acc!681)))

(declare-fun $colon$colon!352 (List!12929 (_ BitVec 64)) List!12929)

(assert (=> b!684725 (= lt!314456 ($colon$colon!352 acc!681 k!2843))))

(declare-fun lt!314449 () Unit!24076)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12929) Unit!24076)

(assert (=> b!684725 (= lt!314449 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(declare-fun subseq!190 (List!12929 List!12929) Bool)

(assert (=> b!684725 (subseq!190 acc!681 acc!681)))

(declare-fun lt!314450 () Unit!24076)

(declare-fun lemmaListSubSeqRefl!0 (List!12929) Unit!24076)

(assert (=> b!684725 (= lt!314450 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!684725 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!314454 () Unit!24076)

(declare-fun e!389930 () Unit!24076)

(assert (=> b!684725 (= lt!314454 e!389930)))

(declare-fun c!77647 () Bool)

(assert (=> b!684725 (= c!77647 (validKeyInArray!0 (select (arr!18981 a!3626) from!3004)))))

(declare-fun lt!314457 () Unit!24076)

(assert (=> b!684725 (= lt!314457 e!389933)))

(declare-fun c!77648 () Bool)

(assert (=> b!684725 (= c!77648 lt!314451)))

(declare-fun arrayContainsKey!0 (array!39607 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!684725 (= lt!314451 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!684725 (arrayContainsKey!0 (array!39608 (store (arr!18981 a!3626) i!1382 k!2843) (size!19348 a!3626)) k!2843 from!3004)))

(declare-fun b!684726 () Bool)

(declare-fun lt!314458 () Unit!24076)

(assert (=> b!684726 (= e!389930 lt!314458)))

(declare-fun lt!314452 () Unit!24076)

(assert (=> b!684726 (= lt!314452 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!684726 (subseq!190 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39607 List!12929 List!12929 (_ BitVec 32)) Unit!24076)

(assert (=> b!684726 (= lt!314458 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!352 acc!681 (select (arr!18981 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!684726 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!684727 () Bool)

(declare-fun res!450157 () Bool)

(assert (=> b!684727 (=> (not res!450157) (not e!389936))))

(assert (=> b!684727 (= res!450157 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19348 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!684728 () Bool)

(assert (=> b!684728 (= e!389935 (not (contains!3581 acc!681 k!2843)))))

(declare-fun b!684729 () Bool)

(assert (=> b!684729 (= e!389937 true)))

(declare-fun lt!314455 () Bool)

(assert (=> b!684729 (= lt!314455 (contains!3581 acc!681 k!2843))))

(declare-fun b!684730 () Bool)

(declare-fun Unit!24080 () Unit!24076)

(assert (=> b!684730 (= e!389930 Unit!24080)))

(declare-fun b!684731 () Bool)

(declare-fun res!450172 () Bool)

(assert (=> b!684731 (=> (not res!450172) (not e!389936))))

(assert (=> b!684731 (= res!450172 (noDuplicate!855 acc!681))))

(declare-fun b!684732 () Bool)

(declare-fun res!450163 () Bool)

(assert (=> b!684732 (=> (not res!450163) (not e!389936))))

(assert (=> b!684732 (= res!450163 e!389931)))

(declare-fun res!450160 () Bool)

(assert (=> b!684732 (=> res!450160 e!389931)))

(assert (=> b!684732 (= res!450160 e!389932)))

(declare-fun res!450168 () Bool)

(assert (=> b!684732 (=> (not res!450168) (not e!389932))))

(assert (=> b!684732 (= res!450168 (bvsgt from!3004 i!1382))))

(declare-fun b!684733 () Bool)

(declare-fun res!450164 () Bool)

(assert (=> b!684733 (=> (not res!450164) (not e!389936))))

(assert (=> b!684733 (= res!450164 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(assert (= (and start!61060 res!450158) b!684731))

(assert (= (and b!684731 res!450172) b!684718))

(assert (= (and b!684718 res!450166) b!684713))

(assert (= (and b!684713 res!450159) b!684732))

(assert (= (and b!684732 res!450168) b!684724))

(assert (= (and b!684732 (not res!450160)) b!684720))

(assert (= (and b!684720 res!450156) b!684728))

(assert (= (and b!684732 res!450163) b!684714))

(assert (= (and b!684714 res!450169) b!684716))

(assert (= (and b!684716 res!450162) b!684715))

(assert (= (and b!684715 res!450170) b!684721))

(assert (= (and b!684721 res!450167) b!684733))

(assert (= (and b!684733 res!450164) b!684727))

(assert (= (and b!684727 res!450157) b!684725))

(assert (= (and b!684725 c!77648) b!684717))

(assert (= (and b!684725 (not c!77648)) b!684719))

(assert (= (and b!684725 c!77647) b!684726))

(assert (= (and b!684725 (not c!77647)) b!684730))

(assert (= (and b!684725 (not res!450165)) b!684723))

(assert (= (and b!684723 (not res!450161)) b!684722))

(assert (= (and b!684722 (not res!450171)) b!684729))

(declare-fun m!649531 () Bool)

(assert (=> b!684728 m!649531))

(assert (=> b!684724 m!649531))

(declare-fun m!649533 () Bool)

(assert (=> b!684713 m!649533))

(declare-fun m!649535 () Bool)

(assert (=> b!684718 m!649535))

(assert (=> b!684729 m!649531))

(declare-fun m!649537 () Bool)

(assert (=> b!684726 m!649537))

(declare-fun m!649539 () Bool)

(assert (=> b!684726 m!649539))

(declare-fun m!649541 () Bool)

(assert (=> b!684726 m!649541))

(declare-fun m!649543 () Bool)

(assert (=> b!684726 m!649543))

(assert (=> b!684726 m!649539))

(assert (=> b!684726 m!649541))

(declare-fun m!649545 () Bool)

(assert (=> b!684726 m!649545))

(declare-fun m!649547 () Bool)

(assert (=> b!684726 m!649547))

(declare-fun m!649549 () Bool)

(assert (=> b!684716 m!649549))

(declare-fun m!649551 () Bool)

(assert (=> b!684733 m!649551))

(declare-fun m!649553 () Bool)

(assert (=> b!684714 m!649553))

(declare-fun m!649555 () Bool)

(assert (=> start!61060 m!649555))

(declare-fun m!649557 () Bool)

(assert (=> b!684717 m!649557))

(declare-fun m!649559 () Bool)

(assert (=> b!684721 m!649559))

(declare-fun m!649561 () Bool)

(assert (=> b!684723 m!649561))

(declare-fun m!649563 () Bool)

(assert (=> b!684731 m!649563))

(assert (=> b!684725 m!649537))

(assert (=> b!684725 m!649539))

(declare-fun m!649565 () Bool)

(assert (=> b!684725 m!649565))

(declare-fun m!649567 () Bool)

(assert (=> b!684725 m!649567))

(declare-fun m!649569 () Bool)

(assert (=> b!684725 m!649569))

(assert (=> b!684725 m!649545))

(declare-fun m!649571 () Bool)

(assert (=> b!684725 m!649571))

(declare-fun m!649573 () Bool)

(assert (=> b!684725 m!649573))

(assert (=> b!684725 m!649539))

(declare-fun m!649575 () Bool)

(assert (=> b!684725 m!649575))

(declare-fun m!649577 () Bool)

(assert (=> b!684725 m!649577))

(assert (=> b!684725 m!649547))

(push 1)

(assert (not b!684726))

(assert (not b!684724))

(assert (not b!684723))

(assert (not b!684717))

(assert (not b!684731))

(assert (not b!684714))

(assert (not b!684733))

(assert (not b!684716))

(assert (not b!684725))

(assert (not b!684728))

(assert (not b!684729))

(assert (not start!61060))

(assert (not b!684718))

(assert (not b!684721))

(assert (not b!684713))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

