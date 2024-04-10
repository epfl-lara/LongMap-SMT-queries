; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26860 () Bool)

(assert start!26860)

(declare-fun b!278664 () Bool)

(declare-fun res!142098 () Bool)

(declare-fun e!177716 () Bool)

(assert (=> b!278664 (=> (not res!142098) (not e!177716))))

(declare-datatypes ((array!13864 0))(
  ( (array!13865 (arr!6580 (Array (_ BitVec 32) (_ BitVec 64))) (size!6932 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13864)

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!278664 (= res!142098 (and (= (size!6932 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6932 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6932 a!3325))))))

(declare-fun b!278665 () Bool)

(declare-fun e!177714 () Bool)

(assert (=> b!278665 (= e!177714 (bvsge (size!6932 a!3325) #b01111111111111111111111111111111))))

(declare-fun b!278666 () Bool)

(declare-fun res!142093 () Bool)

(assert (=> b!278666 (=> (not res!142093) (not e!177714))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13864 (_ BitVec 32)) Bool)

(assert (=> b!278666 (= res!142093 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun res!142100 () Bool)

(assert (=> start!26860 (=> (not res!142100) (not e!177716))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26860 (= res!142100 (validMask!0 mask!3868))))

(assert (=> start!26860 e!177716))

(declare-fun array_inv!4543 (array!13864) Bool)

(assert (=> start!26860 (array_inv!4543 a!3325)))

(assert (=> start!26860 true))

(declare-fun b!278667 () Bool)

(declare-fun res!142101 () Bool)

(assert (=> b!278667 (=> (not res!142101) (not e!177714))))

(assert (=> b!278667 (= res!142101 (not (= startIndex!26 i!1267)))))

(declare-fun b!278668 () Bool)

(assert (=> b!278668 (= e!177716 e!177714)))

(declare-fun res!142095 () Bool)

(assert (=> b!278668 (=> (not res!142095) (not e!177714))))

(declare-datatypes ((SeekEntryResult!1738 0))(
  ( (MissingZero!1738 (index!9122 (_ BitVec 32))) (Found!1738 (index!9123 (_ BitVec 32))) (Intermediate!1738 (undefined!2550 Bool) (index!9124 (_ BitVec 32)) (x!27368 (_ BitVec 32))) (Undefined!1738) (MissingVacant!1738 (index!9125 (_ BitVec 32))) )
))
(declare-fun lt!138436 () SeekEntryResult!1738)

(assert (=> b!278668 (= res!142095 (or (= lt!138436 (MissingZero!1738 i!1267)) (= lt!138436 (MissingVacant!1738 i!1267))))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13864 (_ BitVec 32)) SeekEntryResult!1738)

(assert (=> b!278668 (= lt!138436 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!278669 () Bool)

(declare-fun res!142099 () Bool)

(assert (=> b!278669 (=> (not res!142099) (not e!177714))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!278669 (= res!142099 (validKeyInArray!0 (select (arr!6580 a!3325) startIndex!26)))))

(declare-fun b!278670 () Bool)

(declare-fun res!142096 () Bool)

(assert (=> b!278670 (=> (not res!142096) (not e!177716))))

(assert (=> b!278670 (= res!142096 (validKeyInArray!0 k!2581))))

(declare-fun b!278671 () Bool)

(declare-fun res!142094 () Bool)

(assert (=> b!278671 (=> (not res!142094) (not e!177716))))

(declare-datatypes ((List!4388 0))(
  ( (Nil!4385) (Cons!4384 (h!5054 (_ BitVec 64)) (t!9470 List!4388)) )
))
(declare-fun arrayNoDuplicates!0 (array!13864 (_ BitVec 32) List!4388) Bool)

(assert (=> b!278671 (= res!142094 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4385))))

(declare-fun b!278672 () Bool)

(declare-fun res!142097 () Bool)

(assert (=> b!278672 (=> (not res!142097) (not e!177716))))

(declare-fun arrayContainsKey!0 (array!13864 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!278672 (= res!142097 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(assert (= (and start!26860 res!142100) b!278664))

(assert (= (and b!278664 res!142098) b!278670))

(assert (= (and b!278670 res!142096) b!278671))

(assert (= (and b!278671 res!142094) b!278672))

(assert (= (and b!278672 res!142097) b!278668))

(assert (= (and b!278668 res!142095) b!278666))

(assert (= (and b!278666 res!142093) b!278667))

(assert (= (and b!278667 res!142101) b!278669))

(assert (= (and b!278669 res!142099) b!278665))

(declare-fun m!293673 () Bool)

(assert (=> b!278670 m!293673))

(declare-fun m!293675 () Bool)

(assert (=> b!278671 m!293675))

(declare-fun m!293677 () Bool)

(assert (=> start!26860 m!293677))

(declare-fun m!293679 () Bool)

(assert (=> start!26860 m!293679))

(declare-fun m!293681 () Bool)

(assert (=> b!278668 m!293681))

(declare-fun m!293683 () Bool)

(assert (=> b!278666 m!293683))

(declare-fun m!293685 () Bool)

(assert (=> b!278669 m!293685))

(assert (=> b!278669 m!293685))

(declare-fun m!293687 () Bool)

(assert (=> b!278669 m!293687))

(declare-fun m!293689 () Bool)

(assert (=> b!278672 m!293689))

(push 1)

(assert (not b!278668))

(assert (not b!278672))

(assert (not b!278670))

(assert (not b!278666))

(assert (not b!278671))

(assert (not start!26860))

(assert (not b!278669))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!278713 () Bool)

(declare-fun e!177751 () Bool)

(declare-fun e!177749 () Bool)

(assert (=> b!278713 (= e!177751 e!177749)))

(declare-fun c!45846 () Bool)

(assert (=> b!278713 (= c!45846 (validKeyInArray!0 (select (arr!6580 a!3325) #b00000000000000000000000000000000)))))

(declare-fun b!278714 () Bool)

(declare-fun e!177752 () Bool)

(declare-fun contains!1965 (List!4388 (_ BitVec 64)) Bool)

(assert (=> b!278714 (= e!177752 (contains!1965 Nil!4385 (select (arr!6580 a!3325) #b00000000000000000000000000000000)))))

(declare-fun b!278715 () Bool)

(declare-fun e!177750 () Bool)

(assert (=> b!278715 (= e!177750 e!177751)))

(declare-fun res!142128 () Bool)

(assert (=> b!278715 (=> (not res!142128) (not e!177751))))

(assert (=> b!278715 (= res!142128 (not e!177752))))

(declare-fun res!142126 () Bool)

(assert (=> b!278715 (=> (not res!142126) (not e!177752))))

(assert (=> b!278715 (= res!142126 (validKeyInArray!0 (select (arr!6580 a!3325) #b00000000000000000000000000000000)))))

(declare-fun b!278716 () Bool)

(declare-fun call!25396 () Bool)

(assert (=> b!278716 (= e!177749 call!25396)))

(declare-fun d!64935 () Bool)

(declare-fun res!142127 () Bool)

(assert (=> d!64935 (=> res!142127 e!177750)))

(assert (=> d!64935 (= res!142127 (bvsge #b00000000000000000000000000000000 (size!6932 a!3325)))))

(assert (=> d!64935 (= (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4385) e!177750)))

(declare-fun b!278717 () Bool)

(assert (=> b!278717 (= e!177749 call!25396)))

(declare-fun bm!25393 () Bool)

(assert (=> bm!25393 (= call!25396 (arrayNoDuplicates!0 a!3325 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!45846 (Cons!4384 (select (arr!6580 a!3325) #b00000000000000000000000000000000) Nil!4385) Nil!4385)))))

(assert (= (and d!64935 (not res!142127)) b!278715))

(assert (= (and b!278715 res!142126) b!278714))

(assert (= (and b!278715 res!142128) b!278713))

(assert (= (and b!278713 c!45846) b!278716))

(assert (= (and b!278713 (not c!45846)) b!278717))

(assert (= (or b!278716 b!278717) bm!25393))

(declare-fun m!293707 () Bool)

(assert (=> b!278713 m!293707))

(assert (=> b!278713 m!293707))

(declare-fun m!293709 () Bool)

(assert (=> b!278713 m!293709))

(assert (=> b!278714 m!293707))

(assert (=> b!278714 m!293707))

(declare-fun m!293711 () Bool)

(assert (=> b!278714 m!293711))

(assert (=> b!278715 m!293707))

(assert (=> b!278715 m!293707))

(assert (=> b!278715 m!293709))

(assert (=> bm!25393 m!293707))

(declare-fun m!293713 () Bool)

(assert (=> bm!25393 m!293713))

(assert (=> b!278671 d!64935))

(declare-fun b!278726 () Bool)

(declare-fun e!177759 () Bool)

(declare-fun e!177761 () Bool)

(assert (=> b!278726 (= e!177759 e!177761)))

(declare-fun lt!138445 () (_ BitVec 64))

(assert (=> b!278726 (= lt!138445 (select (arr!6580 a!3325) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!8804 0))(
  ( (Unit!8805) )
))
(declare-fun lt!138443 () Unit!8804)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!13864 (_ BitVec 64) (_ BitVec 32)) Unit!8804)

(assert (=> b!278726 (= lt!138443 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3325 lt!138445 #b00000000000000000000000000000000))))

(assert (=> b!278726 (arrayContainsKey!0 a!3325 lt!138445 #b00000000000000000000000000000000)))

(declare-fun lt!138444 () Unit!8804)

(assert (=> b!278726 (= lt!138444 lt!138443)))

(declare-fun res!142134 () Bool)

(assert (=> b!278726 (= res!142134 (= (seekEntryOrOpen!0 (select (arr!6580 a!3325) #b00000000000000000000000000000000) a!3325 mask!3868) (Found!1738 #b00000000000000000000000000000000)))))

(assert (=> b!278726 (=> (not res!142134) (not e!177761))))

(declare-fun bm!25396 () Bool)

(declare-fun call!25399 () Bool)

(assert (=> bm!25396 (= call!25399 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3325 mask!3868))))

(declare-fun b!278727 () Bool)

(assert (=> b!278727 (= e!177761 call!25399)))

(declare-fun b!278728 () Bool)

(assert (=> b!278728 (= e!177759 call!25399)))

(declare-fun d!64941 () Bool)

(declare-fun res!142133 () Bool)

(declare-fun e!177760 () Bool)

(assert (=> d!64941 (=> res!142133 e!177760)))

(assert (=> d!64941 (= res!142133 (bvsge #b00000000000000000000000000000000 (size!6932 a!3325)))))

(assert (=> d!64941 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868) e!177760)))

(declare-fun b!278729 () Bool)

(assert (=> b!278729 (= e!177760 e!177759)))

(declare-fun c!45849 () Bool)

(assert (=> b!278729 (= c!45849 (validKeyInArray!0 (select (arr!6580 a!3325) #b00000000000000000000000000000000)))))

(assert (= (and d!64941 (not res!142133)) b!278729))

(assert (= (and b!278729 c!45849) b!278726))

(assert (= (and b!278729 (not c!45849)) b!278728))

(assert (= (and b!278726 res!142134) b!278727))

(assert (= (or b!278727 b!278728) bm!25396))

(assert (=> b!278726 m!293707))

(declare-fun m!293715 () Bool)

(assert (=> b!278726 m!293715))

(declare-fun m!293717 () Bool)

(assert (=> b!278726 m!293717))

(assert (=> b!278726 m!293707))

(declare-fun m!293719 () Bool)

(assert (=> b!278726 m!293719))

(declare-fun m!293721 () Bool)

(assert (=> bm!25396 m!293721))

(assert (=> b!278729 m!293707))

(assert (=> b!278729 m!293707))

(assert (=> b!278729 m!293709))

(assert (=> b!278666 d!64941))

(declare-fun d!64951 () Bool)

(declare-fun res!142139 () Bool)

(declare-fun e!177766 () Bool)

(assert (=> d!64951 (=> res!142139 e!177766)))

(assert (=> d!64951 (= res!142139 (= (select (arr!6580 a!3325) #b00000000000000000000000000000000) k!2581))))

(assert (=> d!64951 (= (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000) e!177766)))

(declare-fun b!278734 () Bool)

(declare-fun e!177767 () Bool)

(assert (=> b!278734 (= e!177766 e!177767)))

(declare-fun res!142140 () Bool)

(assert (=> b!278734 (=> (not res!142140) (not e!177767))))

(assert (=> b!278734 (= res!142140 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6932 a!3325)))))

(declare-fun b!278735 () Bool)

(assert (=> b!278735 (= e!177767 (arrayContainsKey!0 a!3325 k!2581 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!64951 (not res!142139)) b!278734))

(assert (= (and b!278734 res!142140) b!278735))

(assert (=> d!64951 m!293707))

(declare-fun m!293723 () Bool)

