; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66464 () Bool)

(assert start!66464)

(declare-fun e!426485 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7826 0))(
  ( (MissingZero!7826 (index!33672 (_ BitVec 32))) (Found!7826 (index!33673 (_ BitVec 32))) (Intermediate!7826 (undefined!8638 Bool) (index!33674 (_ BitVec 32)) (x!64584 (_ BitVec 32))) (Undefined!7826) (MissingVacant!7826 (index!33675 (_ BitVec 32))) )
))
(declare-fun lt!340666 () SeekEntryResult!7826)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((array!42243 0))(
  ( (array!42244 (arr!20226 (Array (_ BitVec 32) (_ BitVec 64))) (size!20647 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42243)

(declare-fun b!765805 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42243 (_ BitVec 32)) SeekEntryResult!7826)

(assert (=> b!765805 (= e!426485 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20226 a!3186) j!159) a!3186 mask!3328) lt!340666))))

(declare-fun b!765806 () Bool)

(declare-fun e!426490 () Bool)

(assert (=> b!765806 (= e!426490 (not true))))

(declare-fun e!426487 () Bool)

(assert (=> b!765806 e!426487))

(declare-fun res!518010 () Bool)

(assert (=> b!765806 (=> (not res!518010) (not e!426487))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42243 (_ BitVec 32)) Bool)

(assert (=> b!765806 (= res!518010 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26378 0))(
  ( (Unit!26379) )
))
(declare-fun lt!340662 () Unit!26378)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42243 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26378)

(assert (=> b!765806 (= lt!340662 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!765807 () Bool)

(declare-fun res!518013 () Bool)

(declare-fun e!426489 () Bool)

(assert (=> b!765807 (=> (not res!518013) (not e!426489))))

(assert (=> b!765807 (= res!518013 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!765809 () Bool)

(declare-fun res!518012 () Bool)

(assert (=> b!765809 (=> (not res!518012) (not e!426489))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!765809 (= res!518012 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20647 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20647 a!3186))))))

(declare-fun b!765810 () Bool)

(declare-fun res!518018 () Bool)

(assert (=> b!765810 (=> (not res!518018) (not e!426489))))

(declare-datatypes ((List!14228 0))(
  ( (Nil!14225) (Cons!14224 (h!15314 (_ BitVec 64)) (t!20543 List!14228)) )
))
(declare-fun arrayNoDuplicates!0 (array!42243 (_ BitVec 32) List!14228) Bool)

(assert (=> b!765810 (= res!518018 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14225))))

(declare-fun b!765811 () Bool)

(declare-fun res!518015 () Bool)

(declare-fun e!426486 () Bool)

(assert (=> b!765811 (=> (not res!518015) (not e!426486))))

(assert (=> b!765811 (= res!518015 e!426485)))

(declare-fun c!84289 () Bool)

(assert (=> b!765811 (= c!84289 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!765812 () Bool)

(declare-fun res!518009 () Bool)

(assert (=> b!765812 (=> (not res!518009) (not e!426486))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!765812 (= res!518009 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20226 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!765813 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42243 (_ BitVec 32)) SeekEntryResult!7826)

(assert (=> b!765813 (= e!426485 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20226 a!3186) j!159) a!3186 mask!3328) (Found!7826 j!159)))))

(declare-fun b!765814 () Bool)

(declare-fun res!518006 () Bool)

(declare-fun e!426492 () Bool)

(assert (=> b!765814 (=> (not res!518006) (not e!426492))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42243 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!765814 (= res!518006 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!765815 () Bool)

(assert (=> b!765815 (= e!426492 e!426489)))

(declare-fun res!518008 () Bool)

(assert (=> b!765815 (=> (not res!518008) (not e!426489))))

(declare-fun lt!340664 () SeekEntryResult!7826)

(assert (=> b!765815 (= res!518008 (or (= lt!340664 (MissingZero!7826 i!1173)) (= lt!340664 (MissingVacant!7826 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42243 (_ BitVec 32)) SeekEntryResult!7826)

(assert (=> b!765815 (= lt!340664 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun lt!340667 () SeekEntryResult!7826)

(declare-fun b!765816 () Bool)

(declare-fun e!426491 () Bool)

(assert (=> b!765816 (= e!426491 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20226 a!3186) j!159) a!3186 mask!3328) lt!340667))))

(declare-fun b!765817 () Bool)

(declare-fun res!518019 () Bool)

(assert (=> b!765817 (=> (not res!518019) (not e!426492))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!765817 (= res!518019 (validKeyInArray!0 k!2102))))

(declare-fun b!765808 () Bool)

(assert (=> b!765808 (= e!426489 e!426486)))

(declare-fun res!518014 () Bool)

(assert (=> b!765808 (=> (not res!518014) (not e!426486))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!765808 (= res!518014 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20226 a!3186) j!159) mask!3328) (select (arr!20226 a!3186) j!159) a!3186 mask!3328) lt!340666))))

(assert (=> b!765808 (= lt!340666 (Intermediate!7826 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun res!518007 () Bool)

(assert (=> start!66464 (=> (not res!518007) (not e!426492))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66464 (= res!518007 (validMask!0 mask!3328))))

(assert (=> start!66464 e!426492))

(assert (=> start!66464 true))

(declare-fun array_inv!16022 (array!42243) Bool)

(assert (=> start!66464 (array_inv!16022 a!3186)))

(declare-fun b!765818 () Bool)

(declare-fun res!518016 () Bool)

(assert (=> b!765818 (=> (not res!518016) (not e!426492))))

(assert (=> b!765818 (= res!518016 (validKeyInArray!0 (select (arr!20226 a!3186) j!159)))))

(declare-fun b!765819 () Bool)

(assert (=> b!765819 (= e!426487 e!426491)))

(declare-fun res!518017 () Bool)

(assert (=> b!765819 (=> (not res!518017) (not e!426491))))

(assert (=> b!765819 (= res!518017 (= (seekEntryOrOpen!0 (select (arr!20226 a!3186) j!159) a!3186 mask!3328) lt!340667))))

(assert (=> b!765819 (= lt!340667 (Found!7826 j!159))))

(declare-fun b!765820 () Bool)

(declare-fun res!518011 () Bool)

(assert (=> b!765820 (=> (not res!518011) (not e!426492))))

(assert (=> b!765820 (= res!518011 (and (= (size!20647 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20647 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20647 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!765821 () Bool)

(assert (=> b!765821 (= e!426486 e!426490)))

(declare-fun res!518020 () Bool)

(assert (=> b!765821 (=> (not res!518020) (not e!426490))))

(declare-fun lt!340663 () (_ BitVec 64))

(declare-fun lt!340665 () array!42243)

(assert (=> b!765821 (= res!518020 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!340663 mask!3328) lt!340663 lt!340665 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!340663 lt!340665 mask!3328)))))

(assert (=> b!765821 (= lt!340663 (select (store (arr!20226 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!765821 (= lt!340665 (array!42244 (store (arr!20226 a!3186) i!1173 k!2102) (size!20647 a!3186)))))

(assert (= (and start!66464 res!518007) b!765820))

(assert (= (and b!765820 res!518011) b!765818))

(assert (= (and b!765818 res!518016) b!765817))

(assert (= (and b!765817 res!518019) b!765814))

(assert (= (and b!765814 res!518006) b!765815))

(assert (= (and b!765815 res!518008) b!765807))

(assert (= (and b!765807 res!518013) b!765810))

(assert (= (and b!765810 res!518018) b!765809))

(assert (= (and b!765809 res!518012) b!765808))

(assert (= (and b!765808 res!518014) b!765812))

(assert (= (and b!765812 res!518009) b!765811))

(assert (= (and b!765811 c!84289) b!765805))

(assert (= (and b!765811 (not c!84289)) b!765813))

(assert (= (and b!765811 res!518015) b!765821))

(assert (= (and b!765821 res!518020) b!765806))

(assert (= (and b!765806 res!518010) b!765819))

(assert (= (and b!765819 res!518017) b!765816))

(declare-fun m!711861 () Bool)

(assert (=> b!765813 m!711861))

(assert (=> b!765813 m!711861))

(declare-fun m!711863 () Bool)

(assert (=> b!765813 m!711863))

(declare-fun m!711865 () Bool)

(assert (=> b!765821 m!711865))

(declare-fun m!711867 () Bool)

(assert (=> b!765821 m!711867))

(declare-fun m!711869 () Bool)

(assert (=> b!765821 m!711869))

(declare-fun m!711871 () Bool)

(assert (=> b!765821 m!711871))

(assert (=> b!765821 m!711871))

(declare-fun m!711873 () Bool)

(assert (=> b!765821 m!711873))

(declare-fun m!711875 () Bool)

(assert (=> b!765817 m!711875))

(assert (=> b!765819 m!711861))

(assert (=> b!765819 m!711861))

(declare-fun m!711877 () Bool)

(assert (=> b!765819 m!711877))

(declare-fun m!711879 () Bool)

(assert (=> b!765807 m!711879))

(assert (=> b!765816 m!711861))

(assert (=> b!765816 m!711861))

(declare-fun m!711881 () Bool)

(assert (=> b!765816 m!711881))

(declare-fun m!711883 () Bool)

(assert (=> start!66464 m!711883))

(declare-fun m!711885 () Bool)

(assert (=> start!66464 m!711885))

(declare-fun m!711887 () Bool)

(assert (=> b!765814 m!711887))

(assert (=> b!765818 m!711861))

(assert (=> b!765818 m!711861))

(declare-fun m!711889 () Bool)

(assert (=> b!765818 m!711889))

(declare-fun m!711891 () Bool)

(assert (=> b!765812 m!711891))

(declare-fun m!711893 () Bool)

(assert (=> b!765806 m!711893))

(declare-fun m!711895 () Bool)

(assert (=> b!765806 m!711895))

(declare-fun m!711897 () Bool)

(assert (=> b!765810 m!711897))

(declare-fun m!711899 () Bool)

(assert (=> b!765815 m!711899))

(assert (=> b!765805 m!711861))

(assert (=> b!765805 m!711861))

(declare-fun m!711901 () Bool)

(assert (=> b!765805 m!711901))

(assert (=> b!765808 m!711861))

(assert (=> b!765808 m!711861))

(declare-fun m!711903 () Bool)

(assert (=> b!765808 m!711903))

(assert (=> b!765808 m!711903))

(assert (=> b!765808 m!711861))

(declare-fun m!711905 () Bool)

(assert (=> b!765808 m!711905))

(push 1)

