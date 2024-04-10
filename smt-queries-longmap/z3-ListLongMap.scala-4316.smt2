; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59926 () Bool)

(assert start!59926)

(declare-fun b!663894 () Bool)

(declare-fun res!431696 () Bool)

(declare-fun e!380852 () Bool)

(assert (=> b!663894 (=> (not res!431696) (not e!380852))))

(declare-datatypes ((array!38973 0))(
  ( (array!38974 (arr!18679 (Array (_ BitVec 32) (_ BitVec 64))) (size!19043 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38973)

(declare-datatypes ((List!12720 0))(
  ( (Nil!12717) (Cons!12716 (h!13761 (_ BitVec 64)) (t!18948 List!12720)) )
))
(declare-fun arrayNoDuplicates!0 (array!38973 (_ BitVec 32) List!12720) Bool)

(assert (=> b!663894 (= res!431696 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12717))))

(declare-fun b!663895 () Bool)

(declare-fun e!380847 () Bool)

(declare-fun acc!681 () List!12720)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun contains!3297 (List!12720 (_ BitVec 64)) Bool)

(assert (=> b!663895 (= e!380847 (not (contains!3297 acc!681 k0!2843)))))

(declare-fun b!663896 () Bool)

(declare-datatypes ((Unit!23120 0))(
  ( (Unit!23121) )
))
(declare-fun e!380849 () Unit!23120)

(declare-fun Unit!23122 () Unit!23120)

(assert (=> b!663896 (= e!380849 Unit!23122)))

(declare-fun b!663897 () Bool)

(assert (=> b!663897 (= e!380852 (not true))))

(declare-fun lt!309414 () Unit!23120)

(declare-fun e!380848 () Unit!23120)

(assert (=> b!663897 (= lt!309414 e!380848)))

(declare-fun c!76472 () Bool)

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!663897 (= c!76472 (validKeyInArray!0 (select (arr!18679 a!3626) from!3004)))))

(declare-fun lt!309412 () Unit!23120)

(assert (=> b!663897 (= lt!309412 e!380849)))

(declare-fun c!76471 () Bool)

(declare-fun arrayContainsKey!0 (array!38973 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!663897 (= c!76471 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!663897 (arrayContainsKey!0 (array!38974 (store (arr!18679 a!3626) i!1382 k0!2843) (size!19043 a!3626)) k0!2843 from!3004)))

(declare-fun b!663898 () Bool)

(declare-fun res!431687 () Bool)

(assert (=> b!663898 (=> (not res!431687) (not e!380852))))

(assert (=> b!663898 (= res!431687 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19043 a!3626))))))

(declare-fun b!663899 () Bool)

(declare-fun res!431699 () Bool)

(assert (=> b!663899 (=> (not res!431699) (not e!380852))))

(assert (=> b!663899 (= res!431699 (validKeyInArray!0 k0!2843))))

(declare-fun b!663900 () Bool)

(declare-fun res!431692 () Bool)

(assert (=> b!663900 (=> (not res!431692) (not e!380852))))

(assert (=> b!663900 (= res!431692 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!663901 () Bool)

(declare-fun lt!309415 () Unit!23120)

(assert (=> b!663901 (= e!380848 lt!309415)))

(declare-fun lt!309411 () Unit!23120)

(declare-fun lemmaListSubSeqRefl!0 (List!12720) Unit!23120)

(assert (=> b!663901 (= lt!309411 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun subseq!36 (List!12720 List!12720) Bool)

(assert (=> b!663901 (subseq!36 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!38973 List!12720 List!12720 (_ BitVec 32)) Unit!23120)

(declare-fun $colon$colon!168 (List!12720 (_ BitVec 64)) List!12720)

(assert (=> b!663901 (= lt!309415 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!168 acc!681 (select (arr!18679 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!663901 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!663902 () Bool)

(declare-fun e!380850 () Bool)

(assert (=> b!663902 (= e!380850 e!380847)))

(declare-fun res!431693 () Bool)

(assert (=> b!663902 (=> (not res!431693) (not e!380847))))

(assert (=> b!663902 (= res!431693 (bvsle from!3004 i!1382))))

(declare-fun b!663903 () Bool)

(declare-fun e!380853 () Bool)

(assert (=> b!663903 (= e!380853 (contains!3297 acc!681 k0!2843))))

(declare-fun b!663904 () Bool)

(declare-fun Unit!23123 () Unit!23120)

(assert (=> b!663904 (= e!380849 Unit!23123)))

(declare-fun lt!309413 () Unit!23120)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38973 (_ BitVec 64) (_ BitVec 32)) Unit!23120)

(assert (=> b!663904 (= lt!309413 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!663904 false))

(declare-fun b!663905 () Bool)

(declare-fun res!431688 () Bool)

(assert (=> b!663905 (=> (not res!431688) (not e!380852))))

(declare-fun noDuplicate!544 (List!12720) Bool)

(assert (=> b!663905 (= res!431688 (noDuplicate!544 acc!681))))

(declare-fun b!663906 () Bool)

(declare-fun Unit!23124 () Unit!23120)

(assert (=> b!663906 (= e!380848 Unit!23124)))

(declare-fun b!663908 () Bool)

(declare-fun res!431690 () Bool)

(assert (=> b!663908 (=> (not res!431690) (not e!380852))))

(assert (=> b!663908 (= res!431690 e!380850)))

(declare-fun res!431689 () Bool)

(assert (=> b!663908 (=> res!431689 e!380850)))

(assert (=> b!663908 (= res!431689 e!380853)))

(declare-fun res!431694 () Bool)

(assert (=> b!663908 (=> (not res!431694) (not e!380853))))

(assert (=> b!663908 (= res!431694 (bvsgt from!3004 i!1382))))

(declare-fun b!663909 () Bool)

(declare-fun res!431698 () Bool)

(assert (=> b!663909 (=> (not res!431698) (not e!380852))))

(assert (=> b!663909 (= res!431698 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!663910 () Bool)

(declare-fun res!431691 () Bool)

(assert (=> b!663910 (=> (not res!431691) (not e!380852))))

(assert (=> b!663910 (= res!431691 (not (contains!3297 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!663911 () Bool)

(declare-fun res!431695 () Bool)

(assert (=> b!663911 (=> (not res!431695) (not e!380852))))

(assert (=> b!663911 (= res!431695 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19043 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!663907 () Bool)

(declare-fun res!431697 () Bool)

(assert (=> b!663907 (=> (not res!431697) (not e!380852))))

(assert (=> b!663907 (= res!431697 (not (contains!3297 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!431686 () Bool)

(assert (=> start!59926 (=> (not res!431686) (not e!380852))))

(assert (=> start!59926 (= res!431686 (and (bvslt (size!19043 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19043 a!3626))))))

(assert (=> start!59926 e!380852))

(assert (=> start!59926 true))

(declare-fun array_inv!14475 (array!38973) Bool)

(assert (=> start!59926 (array_inv!14475 a!3626)))

(assert (= (and start!59926 res!431686) b!663905))

(assert (= (and b!663905 res!431688) b!663907))

(assert (= (and b!663907 res!431697) b!663910))

(assert (= (and b!663910 res!431691) b!663908))

(assert (= (and b!663908 res!431694) b!663903))

(assert (= (and b!663908 (not res!431689)) b!663902))

(assert (= (and b!663902 res!431693) b!663895))

(assert (= (and b!663908 res!431690) b!663894))

(assert (= (and b!663894 res!431696) b!663900))

(assert (= (and b!663900 res!431692) b!663898))

(assert (= (and b!663898 res!431687) b!663899))

(assert (= (and b!663899 res!431699) b!663909))

(assert (= (and b!663909 res!431698) b!663911))

(assert (= (and b!663911 res!431695) b!663897))

(assert (= (and b!663897 c!76471) b!663904))

(assert (= (and b!663897 (not c!76471)) b!663896))

(assert (= (and b!663897 c!76472) b!663901))

(assert (= (and b!663897 (not c!76472)) b!663906))

(declare-fun m!635349 () Bool)

(assert (=> b!663894 m!635349))

(declare-fun m!635351 () Bool)

(assert (=> b!663900 m!635351))

(declare-fun m!635353 () Bool)

(assert (=> b!663897 m!635353))

(declare-fun m!635355 () Bool)

(assert (=> b!663897 m!635355))

(declare-fun m!635357 () Bool)

(assert (=> b!663897 m!635357))

(assert (=> b!663897 m!635353))

(declare-fun m!635359 () Bool)

(assert (=> b!663897 m!635359))

(declare-fun m!635361 () Bool)

(assert (=> b!663897 m!635361))

(declare-fun m!635363 () Bool)

(assert (=> b!663907 m!635363))

(declare-fun m!635365 () Bool)

(assert (=> b!663899 m!635365))

(declare-fun m!635367 () Bool)

(assert (=> b!663905 m!635367))

(declare-fun m!635369 () Bool)

(assert (=> b!663903 m!635369))

(declare-fun m!635371 () Bool)

(assert (=> start!59926 m!635371))

(declare-fun m!635373 () Bool)

(assert (=> b!663909 m!635373))

(declare-fun m!635375 () Bool)

(assert (=> b!663910 m!635375))

(assert (=> b!663895 m!635369))

(declare-fun m!635377 () Bool)

(assert (=> b!663901 m!635377))

(assert (=> b!663901 m!635353))

(declare-fun m!635379 () Bool)

(assert (=> b!663901 m!635379))

(declare-fun m!635381 () Bool)

(assert (=> b!663901 m!635381))

(assert (=> b!663901 m!635353))

(assert (=> b!663901 m!635379))

(declare-fun m!635383 () Bool)

(assert (=> b!663901 m!635383))

(declare-fun m!635385 () Bool)

(assert (=> b!663901 m!635385))

(declare-fun m!635387 () Bool)

(assert (=> b!663904 m!635387))

(check-sat (not b!663909) (not b!663905) (not start!59926) (not b!663894) (not b!663903) (not b!663910) (not b!663899) (not b!663901) (not b!663895) (not b!663907) (not b!663904) (not b!663897) (not b!663900))
(check-sat)
