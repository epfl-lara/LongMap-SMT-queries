; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26246 () Bool)

(assert start!26246)

(declare-fun b!271724 () Bool)

(declare-fun e!174622 () Bool)

(assert (=> b!271724 (= e!174622 false)))

(declare-fun lt!135847 () Bool)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-datatypes ((List!4129 0))(
  ( (Nil!4126) (Cons!4125 (h!4792 (_ BitVec 64)) (t!9211 List!4129)) )
))
(declare-fun contains!1959 (List!4129 (_ BitVec 64)) Bool)

(assert (=> b!271724 (= lt!135847 (contains!1959 Nil!4126 k0!2581))))

(declare-fun res!135716 () Bool)

(declare-fun e!174623 () Bool)

(assert (=> start!26246 (=> (not res!135716) (not e!174623))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26246 (= res!135716 (validMask!0 mask!3868))))

(assert (=> start!26246 e!174623))

(declare-datatypes ((array!13343 0))(
  ( (array!13344 (arr!6321 (Array (_ BitVec 32) (_ BitVec 64))) (size!6673 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13343)

(declare-fun array_inv!4284 (array!13343) Bool)

(assert (=> start!26246 (array_inv!4284 a!3325)))

(assert (=> start!26246 true))

(declare-fun b!271725 () Bool)

(declare-fun res!135725 () Bool)

(assert (=> b!271725 (=> (not res!135725) (not e!174622))))

(assert (=> b!271725 (= res!135725 (not (contains!1959 Nil!4126 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!271726 () Bool)

(declare-fun res!135722 () Bool)

(assert (=> b!271726 (=> (not res!135722) (not e!174622))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!271726 (= res!135722 (not (= startIndex!26 i!1267)))))

(declare-fun b!271727 () Bool)

(declare-fun res!135724 () Bool)

(assert (=> b!271727 (=> (not res!135724) (not e!174622))))

(declare-fun noDuplicate!147 (List!4129) Bool)

(assert (=> b!271727 (= res!135724 (noDuplicate!147 Nil!4126))))

(declare-fun b!271728 () Bool)

(declare-fun res!135723 () Bool)

(assert (=> b!271728 (=> (not res!135723) (not e!174623))))

(declare-fun arrayContainsKey!0 (array!13343 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!271728 (= res!135723 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!271729 () Bool)

(declare-fun res!135714 () Bool)

(assert (=> b!271729 (=> (not res!135714) (not e!174622))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13343 (_ BitVec 32)) Bool)

(assert (=> b!271729 (= res!135714 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!271730 () Bool)

(declare-fun res!135718 () Bool)

(assert (=> b!271730 (=> (not res!135718) (not e!174622))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!271730 (= res!135718 (validKeyInArray!0 (select (arr!6321 a!3325) startIndex!26)))))

(declare-fun b!271731 () Bool)

(declare-fun res!135726 () Bool)

(assert (=> b!271731 (=> (not res!135726) (not e!174623))))

(declare-fun arrayNoDuplicates!0 (array!13343 (_ BitVec 32) List!4129) Bool)

(assert (=> b!271731 (= res!135726 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4126))))

(declare-fun b!271732 () Bool)

(assert (=> b!271732 (= e!174623 e!174622)))

(declare-fun res!135717 () Bool)

(assert (=> b!271732 (=> (not res!135717) (not e!174622))))

(declare-datatypes ((SeekEntryResult!1479 0))(
  ( (MissingZero!1479 (index!8086 (_ BitVec 32))) (Found!1479 (index!8087 (_ BitVec 32))) (Intermediate!1479 (undefined!2291 Bool) (index!8088 (_ BitVec 32)) (x!26412 (_ BitVec 32))) (Undefined!1479) (MissingVacant!1479 (index!8089 (_ BitVec 32))) )
))
(declare-fun lt!135846 () SeekEntryResult!1479)

(assert (=> b!271732 (= res!135717 (or (= lt!135846 (MissingZero!1479 i!1267)) (= lt!135846 (MissingVacant!1479 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13343 (_ BitVec 32)) SeekEntryResult!1479)

(assert (=> b!271732 (= lt!135846 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!271733 () Bool)

(declare-fun res!135719 () Bool)

(assert (=> b!271733 (=> (not res!135719) (not e!174623))))

(assert (=> b!271733 (= res!135719 (and (= (size!6673 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6673 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6673 a!3325))))))

(declare-fun b!271734 () Bool)

(declare-fun res!135721 () Bool)

(assert (=> b!271734 (=> (not res!135721) (not e!174622))))

(assert (=> b!271734 (= res!135721 (not (contains!1959 Nil!4126 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!271735 () Bool)

(declare-fun res!135720 () Bool)

(assert (=> b!271735 (=> (not res!135720) (not e!174622))))

(assert (=> b!271735 (= res!135720 (and (bvslt (size!6673 a!3325) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!6673 a!3325))))))

(declare-fun b!271736 () Bool)

(declare-fun res!135715 () Bool)

(assert (=> b!271736 (=> (not res!135715) (not e!174623))))

(assert (=> b!271736 (= res!135715 (validKeyInArray!0 k0!2581))))

(assert (= (and start!26246 res!135716) b!271733))

(assert (= (and b!271733 res!135719) b!271736))

(assert (= (and b!271736 res!135715) b!271731))

(assert (= (and b!271731 res!135726) b!271728))

(assert (= (and b!271728 res!135723) b!271732))

(assert (= (and b!271732 res!135717) b!271729))

(assert (= (and b!271729 res!135714) b!271726))

(assert (= (and b!271726 res!135722) b!271730))

(assert (= (and b!271730 res!135718) b!271735))

(assert (= (and b!271735 res!135720) b!271727))

(assert (= (and b!271727 res!135724) b!271734))

(assert (= (and b!271734 res!135721) b!271725))

(assert (= (and b!271725 res!135725) b!271724))

(declare-fun m!286913 () Bool)

(assert (=> b!271736 m!286913))

(declare-fun m!286915 () Bool)

(assert (=> b!271728 m!286915))

(declare-fun m!286917 () Bool)

(assert (=> start!26246 m!286917))

(declare-fun m!286919 () Bool)

(assert (=> start!26246 m!286919))

(declare-fun m!286921 () Bool)

(assert (=> b!271725 m!286921))

(declare-fun m!286923 () Bool)

(assert (=> b!271731 m!286923))

(declare-fun m!286925 () Bool)

(assert (=> b!271730 m!286925))

(assert (=> b!271730 m!286925))

(declare-fun m!286927 () Bool)

(assert (=> b!271730 m!286927))

(declare-fun m!286929 () Bool)

(assert (=> b!271732 m!286929))

(declare-fun m!286931 () Bool)

(assert (=> b!271734 m!286931))

(declare-fun m!286933 () Bool)

(assert (=> b!271727 m!286933))

(declare-fun m!286935 () Bool)

(assert (=> b!271729 m!286935))

(declare-fun m!286937 () Bool)

(assert (=> b!271724 m!286937))

(check-sat (not b!271725) (not b!271728) (not b!271729) (not b!271732) (not b!271724) (not b!271727) (not b!271731) (not start!26246) (not b!271734) (not b!271736) (not b!271730))
(check-sat)
