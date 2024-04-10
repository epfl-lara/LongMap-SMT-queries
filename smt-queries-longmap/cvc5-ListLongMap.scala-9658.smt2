; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114086 () Bool)

(assert start!114086)

(declare-fun b!1354629 () Bool)

(declare-fun res!899675 () Bool)

(declare-fun e!769493 () Bool)

(assert (=> b!1354629 (=> (not res!899675) (not e!769493))))

(declare-datatypes ((List!31623 0))(
  ( (Nil!31620) (Cons!31619 (h!32828 (_ BitVec 64)) (t!46281 List!31623)) )
))
(declare-fun lt!598319 () List!31623)

(declare-fun contains!9332 (List!31623 (_ BitVec 64)) Bool)

(assert (=> b!1354629 (= res!899675 (not (contains!9332 lt!598319 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1354630 () Bool)

(declare-fun res!899678 () Bool)

(assert (=> b!1354630 (=> (not res!899678) (not e!769493))))

(declare-datatypes ((array!92268 0))(
  ( (array!92269 (arr!44582 (Array (_ BitVec 32) (_ BitVec 64))) (size!45132 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92268)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!92268 (_ BitVec 32) List!31623) Bool)

(assert (=> b!1354630 (= res!899678 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) lt!598319))))

(declare-fun b!1354631 () Bool)

(declare-fun res!899680 () Bool)

(assert (=> b!1354631 (=> (not res!899680) (not e!769493))))

(declare-fun noDuplicate!2189 (List!31623) Bool)

(assert (=> b!1354631 (= res!899680 (noDuplicate!2189 lt!598319))))

(declare-fun b!1354632 () Bool)

(declare-datatypes ((Unit!44487 0))(
  ( (Unit!44488) )
))
(declare-fun e!769491 () Unit!44487)

(declare-fun Unit!44489 () Unit!44487)

(assert (=> b!1354632 (= e!769491 Unit!44489)))

(declare-fun b!1354633 () Bool)

(declare-fun res!899682 () Bool)

(declare-fun e!769494 () Bool)

(assert (=> b!1354633 (=> (not res!899682) (not e!769494))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1354633 (= res!899682 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45132 a!3742))))))

(declare-fun res!899683 () Bool)

(assert (=> start!114086 (=> (not res!899683) (not e!769494))))

(assert (=> start!114086 (= res!899683 (and (bvslt (size!45132 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45132 a!3742))))))

(assert (=> start!114086 e!769494))

(assert (=> start!114086 true))

(declare-fun array_inv!33610 (array!92268) Bool)

(assert (=> start!114086 (array_inv!33610 a!3742)))

(declare-fun b!1354634 () Bool)

(declare-fun res!899677 () Bool)

(assert (=> b!1354634 (=> (not res!899677) (not e!769494))))

(declare-fun acc!759 () List!31623)

(assert (=> b!1354634 (= res!899677 (not (contains!9332 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1354635 () Bool)

(declare-fun res!899676 () Bool)

(assert (=> b!1354635 (=> (not res!899676) (not e!769494))))

(assert (=> b!1354635 (= res!899676 (not (contains!9332 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1354636 () Bool)

(declare-fun e!769495 () Bool)

(assert (=> b!1354636 (= e!769495 e!769493)))

(declare-fun res!899669 () Bool)

(assert (=> b!1354636 (=> (not res!899669) (not e!769493))))

(assert (=> b!1354636 (= res!899669 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!767 (List!31623 (_ BitVec 64)) List!31623)

(assert (=> b!1354636 (= lt!598319 ($colon$colon!767 acc!759 (select (arr!44582 a!3742) from!3120)))))

(declare-fun b!1354637 () Bool)

(assert (=> b!1354637 (= e!769494 e!769495)))

(declare-fun res!899673 () Bool)

(assert (=> b!1354637 (=> (not res!899673) (not e!769495))))

(declare-fun lt!598321 () Bool)

(assert (=> b!1354637 (= res!899673 (and (not (= from!3120 i!1404)) lt!598321))))

(declare-fun lt!598320 () Unit!44487)

(assert (=> b!1354637 (= lt!598320 e!769491)))

(declare-fun c!126920 () Bool)

(assert (=> b!1354637 (= c!126920 lt!598321)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1354637 (= lt!598321 (validKeyInArray!0 (select (arr!44582 a!3742) from!3120)))))

(declare-fun b!1354638 () Bool)

(declare-fun lt!598324 () Unit!44487)

(assert (=> b!1354638 (= e!769491 lt!598324)))

(declare-fun lt!598323 () Unit!44487)

(declare-fun lemmaListSubSeqRefl!0 (List!31623) Unit!44487)

(assert (=> b!1354638 (= lt!598323 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!752 (List!31623 List!31623) Bool)

(assert (=> b!1354638 (subseq!752 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92268 List!31623 List!31623 (_ BitVec 32)) Unit!44487)

(assert (=> b!1354638 (= lt!598324 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!767 acc!759 (select (arr!44582 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1354638 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1354639 () Bool)

(assert (=> b!1354639 (= e!769493 (not true))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1354639 (arrayNoDuplicates!0 (array!92269 (store (arr!44582 a!3742) i!1404 l!3587) (size!45132 a!3742)) (bvadd #b00000000000000000000000000000001 from!3120) lt!598319)))

(declare-fun lt!598322 () Unit!44487)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!92268 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!31623) Unit!44487)

(assert (=> b!1354639 (= lt!598322 (lemmaPutNonValidKeyPreservesNoDuplicate!0 a!3742 l!3587 i!1404 (bvadd #b00000000000000000000000000000001 from!3120) lt!598319))))

(declare-fun b!1354640 () Bool)

(declare-fun res!899674 () Bool)

(assert (=> b!1354640 (=> (not res!899674) (not e!769494))))

(assert (=> b!1354640 (= res!899674 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31620))))

(declare-fun b!1354641 () Bool)

(declare-fun res!899671 () Bool)

(assert (=> b!1354641 (=> (not res!899671) (not e!769494))))

(assert (=> b!1354641 (= res!899671 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45132 a!3742)))))

(declare-fun b!1354642 () Bool)

(declare-fun res!899672 () Bool)

(assert (=> b!1354642 (=> (not res!899672) (not e!769494))))

(assert (=> b!1354642 (= res!899672 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1354643 () Bool)

(declare-fun res!899681 () Bool)

(assert (=> b!1354643 (=> (not res!899681) (not e!769494))))

(assert (=> b!1354643 (= res!899681 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1354644 () Bool)

(declare-fun res!899670 () Bool)

(assert (=> b!1354644 (=> (not res!899670) (not e!769493))))

(assert (=> b!1354644 (= res!899670 (not (contains!9332 lt!598319 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1354645 () Bool)

(declare-fun res!899679 () Bool)

(assert (=> b!1354645 (=> (not res!899679) (not e!769494))))

(assert (=> b!1354645 (= res!899679 (noDuplicate!2189 acc!759))))

(assert (= (and start!114086 res!899683) b!1354645))

(assert (= (and b!1354645 res!899679) b!1354634))

(assert (= (and b!1354634 res!899677) b!1354635))

(assert (= (and b!1354635 res!899676) b!1354640))

(assert (= (and b!1354640 res!899674) b!1354642))

(assert (= (and b!1354642 res!899672) b!1354633))

(assert (= (and b!1354633 res!899682) b!1354643))

(assert (= (and b!1354643 res!899681) b!1354641))

(assert (= (and b!1354641 res!899671) b!1354637))

(assert (= (and b!1354637 c!126920) b!1354638))

(assert (= (and b!1354637 (not c!126920)) b!1354632))

(assert (= (and b!1354637 res!899673) b!1354636))

(assert (= (and b!1354636 res!899669) b!1354631))

(assert (= (and b!1354631 res!899680) b!1354629))

(assert (= (and b!1354629 res!899675) b!1354644))

(assert (= (and b!1354644 res!899670) b!1354630))

(assert (= (and b!1354630 res!899678) b!1354639))

(declare-fun m!1240963 () Bool)

(assert (=> b!1354634 m!1240963))

(declare-fun m!1240965 () Bool)

(assert (=> b!1354631 m!1240965))

(declare-fun m!1240967 () Bool)

(assert (=> b!1354635 m!1240967))

(declare-fun m!1240969 () Bool)

(assert (=> b!1354636 m!1240969))

(assert (=> b!1354636 m!1240969))

(declare-fun m!1240971 () Bool)

(assert (=> b!1354636 m!1240971))

(declare-fun m!1240973 () Bool)

(assert (=> b!1354630 m!1240973))

(declare-fun m!1240975 () Bool)

(assert (=> b!1354638 m!1240975))

(assert (=> b!1354638 m!1240969))

(assert (=> b!1354638 m!1240971))

(declare-fun m!1240977 () Bool)

(assert (=> b!1354638 m!1240977))

(declare-fun m!1240979 () Bool)

(assert (=> b!1354638 m!1240979))

(assert (=> b!1354638 m!1240969))

(assert (=> b!1354638 m!1240971))

(declare-fun m!1240981 () Bool)

(assert (=> b!1354638 m!1240981))

(declare-fun m!1240983 () Bool)

(assert (=> b!1354644 m!1240983))

(declare-fun m!1240985 () Bool)

(assert (=> b!1354640 m!1240985))

(declare-fun m!1240987 () Bool)

(assert (=> b!1354629 m!1240987))

(declare-fun m!1240989 () Bool)

(assert (=> start!114086 m!1240989))

(declare-fun m!1240991 () Bool)

(assert (=> b!1354645 m!1240991))

(declare-fun m!1240993 () Bool)

(assert (=> b!1354639 m!1240993))

(declare-fun m!1240995 () Bool)

(assert (=> b!1354639 m!1240995))

(declare-fun m!1240997 () Bool)

(assert (=> b!1354639 m!1240997))

(declare-fun m!1240999 () Bool)

(assert (=> b!1354642 m!1240999))

(declare-fun m!1241001 () Bool)

(assert (=> b!1354643 m!1241001))

(assert (=> b!1354637 m!1240969))

(assert (=> b!1354637 m!1240969))

(declare-fun m!1241003 () Bool)

(assert (=> b!1354637 m!1241003))

(push 1)

