; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26248 () Bool)

(assert start!26248)

(declare-fun b!271763 () Bool)

(declare-fun res!135758 () Bool)

(declare-fun e!174632 () Bool)

(assert (=> b!271763 (=> (not res!135758) (not e!174632))))

(declare-datatypes ((array!13345 0))(
  ( (array!13346 (arr!6322 (Array (_ BitVec 32) (_ BitVec 64))) (size!6674 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13345)

(declare-datatypes ((List!4130 0))(
  ( (Nil!4127) (Cons!4126 (h!4793 (_ BitVec 64)) (t!9212 List!4130)) )
))
(declare-fun arrayNoDuplicates!0 (array!13345 (_ BitVec 32) List!4130) Bool)

(assert (=> b!271763 (= res!135758 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4127))))

(declare-fun b!271764 () Bool)

(declare-fun res!135764 () Bool)

(declare-fun e!174631 () Bool)

(assert (=> b!271764 (=> (not res!135764) (not e!174631))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!271764 (= res!135764 (not (= startIndex!26 i!1267)))))

(declare-fun b!271765 () Bool)

(declare-fun res!135753 () Bool)

(assert (=> b!271765 (=> (not res!135753) (not e!174631))))

(declare-fun contains!1960 (List!4130 (_ BitVec 64)) Bool)

(assert (=> b!271765 (= res!135753 (not (contains!1960 Nil!4127 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!271766 () Bool)

(declare-fun res!135757 () Bool)

(assert (=> b!271766 (=> (not res!135757) (not e!174632))))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!271766 (= res!135757 (and (= (size!6674 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6674 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6674 a!3325))))))

(declare-fun b!271767 () Bool)

(declare-fun res!135756 () Bool)

(assert (=> b!271767 (=> (not res!135756) (not e!174632))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13345 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!271767 (= res!135756 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!271768 () Bool)

(declare-fun res!135761 () Bool)

(assert (=> b!271768 (=> (not res!135761) (not e!174631))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!271768 (= res!135761 (validKeyInArray!0 (select (arr!6322 a!3325) startIndex!26)))))

(declare-fun b!271769 () Bool)

(declare-fun res!135762 () Bool)

(assert (=> b!271769 (=> (not res!135762) (not e!174631))))

(declare-fun noDuplicate!148 (List!4130) Bool)

(assert (=> b!271769 (= res!135762 (noDuplicate!148 Nil!4127))))

(declare-fun b!271770 () Bool)

(declare-fun res!135765 () Bool)

(assert (=> b!271770 (=> (not res!135765) (not e!174631))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13345 (_ BitVec 32)) Bool)

(assert (=> b!271770 (= res!135765 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun res!135763 () Bool)

(assert (=> start!26248 (=> (not res!135763) (not e!174632))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26248 (= res!135763 (validMask!0 mask!3868))))

(assert (=> start!26248 e!174632))

(declare-fun array_inv!4285 (array!13345) Bool)

(assert (=> start!26248 (array_inv!4285 a!3325)))

(assert (=> start!26248 true))

(declare-fun b!271771 () Bool)

(assert (=> b!271771 (= e!174631 false)))

(declare-fun lt!135852 () Bool)

(assert (=> b!271771 (= lt!135852 (contains!1960 Nil!4127 k!2581))))

(declare-fun b!271772 () Bool)

(declare-fun res!135754 () Bool)

(assert (=> b!271772 (=> (not res!135754) (not e!174631))))

(assert (=> b!271772 (= res!135754 (and (bvslt (size!6674 a!3325) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!6674 a!3325))))))

(declare-fun b!271773 () Bool)

(declare-fun res!135760 () Bool)

(assert (=> b!271773 (=> (not res!135760) (not e!174632))))

(assert (=> b!271773 (= res!135760 (validKeyInArray!0 k!2581))))

(declare-fun b!271774 () Bool)

(assert (=> b!271774 (= e!174632 e!174631)))

(declare-fun res!135759 () Bool)

(assert (=> b!271774 (=> (not res!135759) (not e!174631))))

(declare-datatypes ((SeekEntryResult!1480 0))(
  ( (MissingZero!1480 (index!8090 (_ BitVec 32))) (Found!1480 (index!8091 (_ BitVec 32))) (Intermediate!1480 (undefined!2292 Bool) (index!8092 (_ BitVec 32)) (x!26413 (_ BitVec 32))) (Undefined!1480) (MissingVacant!1480 (index!8093 (_ BitVec 32))) )
))
(declare-fun lt!135853 () SeekEntryResult!1480)

(assert (=> b!271774 (= res!135759 (or (= lt!135853 (MissingZero!1480 i!1267)) (= lt!135853 (MissingVacant!1480 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13345 (_ BitVec 32)) SeekEntryResult!1480)

(assert (=> b!271774 (= lt!135853 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!271775 () Bool)

(declare-fun res!135755 () Bool)

(assert (=> b!271775 (=> (not res!135755) (not e!174631))))

(assert (=> b!271775 (= res!135755 (not (contains!1960 Nil!4127 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!26248 res!135763) b!271766))

(assert (= (and b!271766 res!135757) b!271773))

(assert (= (and b!271773 res!135760) b!271763))

(assert (= (and b!271763 res!135758) b!271767))

(assert (= (and b!271767 res!135756) b!271774))

(assert (= (and b!271774 res!135759) b!271770))

(assert (= (and b!271770 res!135765) b!271764))

(assert (= (and b!271764 res!135764) b!271768))

(assert (= (and b!271768 res!135761) b!271772))

(assert (= (and b!271772 res!135754) b!271769))

(assert (= (and b!271769 res!135762) b!271775))

(assert (= (and b!271775 res!135755) b!271765))

(assert (= (and b!271765 res!135753) b!271771))

(declare-fun m!286939 () Bool)

(assert (=> b!271774 m!286939))

(declare-fun m!286941 () Bool)

(assert (=> b!271771 m!286941))

(declare-fun m!286943 () Bool)

(assert (=> b!271775 m!286943))

(declare-fun m!286945 () Bool)

(assert (=> b!271767 m!286945))

(declare-fun m!286947 () Bool)

(assert (=> b!271769 m!286947))

(declare-fun m!286949 () Bool)

(assert (=> b!271773 m!286949))

(declare-fun m!286951 () Bool)

(assert (=> b!271765 m!286951))

(declare-fun m!286953 () Bool)

(assert (=> b!271763 m!286953))

(declare-fun m!286955 () Bool)

(assert (=> b!271770 m!286955))

(declare-fun m!286957 () Bool)

(assert (=> b!271768 m!286957))

(assert (=> b!271768 m!286957))

(declare-fun m!286959 () Bool)

(assert (=> b!271768 m!286959))

(declare-fun m!286961 () Bool)

(assert (=> start!26248 m!286961))

(declare-fun m!286963 () Bool)

(assert (=> start!26248 m!286963))

(push 1)

