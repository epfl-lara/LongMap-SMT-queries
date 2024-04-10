; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66462 () Bool)

(assert start!66462)

(declare-fun b!765754 () Bool)

(declare-fun e!426464 () Bool)

(declare-fun e!426461 () Bool)

(assert (=> b!765754 (= e!426464 e!426461)))

(declare-fun res!517966 () Bool)

(assert (=> b!765754 (=> (not res!517966) (not e!426461))))

(declare-datatypes ((array!42241 0))(
  ( (array!42242 (arr!20225 (Array (_ BitVec 32) (_ BitVec 64))) (size!20646 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42241)

(declare-datatypes ((SeekEntryResult!7825 0))(
  ( (MissingZero!7825 (index!33668 (_ BitVec 32))) (Found!7825 (index!33669 (_ BitVec 32))) (Intermediate!7825 (undefined!8637 Bool) (index!33670 (_ BitVec 32)) (x!64575 (_ BitVec 32))) (Undefined!7825) (MissingVacant!7825 (index!33671 (_ BitVec 32))) )
))
(declare-fun lt!340649 () SeekEntryResult!7825)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42241 (_ BitVec 32)) SeekEntryResult!7825)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!765754 (= res!517966 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20225 a!3186) j!159) mask!3328) (select (arr!20225 a!3186) j!159) a!3186 mask!3328) lt!340649))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!765754 (= lt!340649 (Intermediate!7825 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!765755 () Bool)

(declare-fun e!426463 () Bool)

(assert (=> b!765755 (= e!426463 e!426464)))

(declare-fun res!517967 () Bool)

(assert (=> b!765755 (=> (not res!517967) (not e!426464))))

(declare-fun lt!340644 () SeekEntryResult!7825)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!765755 (= res!517967 (or (= lt!340644 (MissingZero!7825 i!1173)) (= lt!340644 (MissingVacant!7825 i!1173))))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42241 (_ BitVec 32)) SeekEntryResult!7825)

(assert (=> b!765755 (= lt!340644 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!765756 () Bool)

(declare-fun e!426468 () Bool)

(assert (=> b!765756 (= e!426468 (not true))))

(declare-fun e!426467 () Bool)

(assert (=> b!765756 e!426467))

(declare-fun res!517964 () Bool)

(assert (=> b!765756 (=> (not res!517964) (not e!426467))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42241 (_ BitVec 32)) Bool)

(assert (=> b!765756 (= res!517964 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26376 0))(
  ( (Unit!26377) )
))
(declare-fun lt!340646 () Unit!26376)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42241 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26376)

(assert (=> b!765756 (= lt!340646 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun lt!340647 () SeekEntryResult!7825)

(declare-fun e!426465 () Bool)

(declare-fun b!765757 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42241 (_ BitVec 32)) SeekEntryResult!7825)

(assert (=> b!765757 (= e!426465 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20225 a!3186) j!159) a!3186 mask!3328) lt!340647))))

(declare-fun b!765758 () Bool)

(declare-fun res!517975 () Bool)

(assert (=> b!765758 (=> (not res!517975) (not e!426463))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!765758 (= res!517975 (validKeyInArray!0 (select (arr!20225 a!3186) j!159)))))

(declare-fun b!765759 () Bool)

(declare-fun res!517961 () Bool)

(assert (=> b!765759 (=> (not res!517961) (not e!426461))))

(declare-fun e!426466 () Bool)

(assert (=> b!765759 (= res!517961 e!426466)))

(declare-fun c!84286 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!765759 (= c!84286 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!765760 () Bool)

(declare-fun res!517963 () Bool)

(assert (=> b!765760 (=> (not res!517963) (not e!426463))))

(assert (=> b!765760 (= res!517963 (and (= (size!20646 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20646 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20646 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!765761 () Bool)

(declare-fun res!517971 () Bool)

(assert (=> b!765761 (=> (not res!517971) (not e!426464))))

(declare-datatypes ((List!14227 0))(
  ( (Nil!14224) (Cons!14223 (h!15313 (_ BitVec 64)) (t!20542 List!14227)) )
))
(declare-fun arrayNoDuplicates!0 (array!42241 (_ BitVec 32) List!14227) Bool)

(assert (=> b!765761 (= res!517971 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14224))))

(declare-fun b!765763 () Bool)

(declare-fun res!517969 () Bool)

(assert (=> b!765763 (=> (not res!517969) (not e!426461))))

(assert (=> b!765763 (= res!517969 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20225 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!765764 () Bool)

(declare-fun res!517968 () Bool)

(assert (=> b!765764 (=> (not res!517968) (not e!426464))))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!765764 (= res!517968 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20646 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20646 a!3186))))))

(declare-fun b!765765 () Bool)

(assert (=> b!765765 (= e!426466 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20225 a!3186) j!159) a!3186 mask!3328) lt!340649))))

(declare-fun b!765766 () Bool)

(declare-fun res!517973 () Bool)

(assert (=> b!765766 (=> (not res!517973) (not e!426463))))

(assert (=> b!765766 (= res!517973 (validKeyInArray!0 k!2102))))

(declare-fun res!517965 () Bool)

(assert (=> start!66462 (=> (not res!517965) (not e!426463))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66462 (= res!517965 (validMask!0 mask!3328))))

(assert (=> start!66462 e!426463))

(assert (=> start!66462 true))

(declare-fun array_inv!16021 (array!42241) Bool)

(assert (=> start!66462 (array_inv!16021 a!3186)))

(declare-fun b!765762 () Bool)

(assert (=> b!765762 (= e!426461 e!426468)))

(declare-fun res!517972 () Bool)

(assert (=> b!765762 (=> (not res!517972) (not e!426468))))

(declare-fun lt!340648 () (_ BitVec 64))

(declare-fun lt!340645 () array!42241)

(assert (=> b!765762 (= res!517972 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!340648 mask!3328) lt!340648 lt!340645 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!340648 lt!340645 mask!3328)))))

(assert (=> b!765762 (= lt!340648 (select (store (arr!20225 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!765762 (= lt!340645 (array!42242 (store (arr!20225 a!3186) i!1173 k!2102) (size!20646 a!3186)))))

(declare-fun b!765767 () Bool)

(declare-fun res!517970 () Bool)

(assert (=> b!765767 (=> (not res!517970) (not e!426463))))

(declare-fun arrayContainsKey!0 (array!42241 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!765767 (= res!517970 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!765768 () Bool)

(assert (=> b!765768 (= e!426467 e!426465)))

(declare-fun res!517962 () Bool)

(assert (=> b!765768 (=> (not res!517962) (not e!426465))))

(assert (=> b!765768 (= res!517962 (= (seekEntryOrOpen!0 (select (arr!20225 a!3186) j!159) a!3186 mask!3328) lt!340647))))

(assert (=> b!765768 (= lt!340647 (Found!7825 j!159))))

(declare-fun b!765769 () Bool)

(declare-fun res!517974 () Bool)

(assert (=> b!765769 (=> (not res!517974) (not e!426464))))

(assert (=> b!765769 (= res!517974 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!765770 () Bool)

(assert (=> b!765770 (= e!426466 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20225 a!3186) j!159) a!3186 mask!3328) (Found!7825 j!159)))))

(assert (= (and start!66462 res!517965) b!765760))

(assert (= (and b!765760 res!517963) b!765758))

(assert (= (and b!765758 res!517975) b!765766))

(assert (= (and b!765766 res!517973) b!765767))

(assert (= (and b!765767 res!517970) b!765755))

(assert (= (and b!765755 res!517967) b!765769))

(assert (= (and b!765769 res!517974) b!765761))

(assert (= (and b!765761 res!517971) b!765764))

(assert (= (and b!765764 res!517968) b!765754))

(assert (= (and b!765754 res!517966) b!765763))

(assert (= (and b!765763 res!517969) b!765759))

(assert (= (and b!765759 c!84286) b!765765))

(assert (= (and b!765759 (not c!84286)) b!765770))

(assert (= (and b!765759 res!517961) b!765762))

(assert (= (and b!765762 res!517972) b!765756))

(assert (= (and b!765756 res!517964) b!765768))

(assert (= (and b!765768 res!517962) b!765757))

(declare-fun m!711815 () Bool)

(assert (=> b!765756 m!711815))

(declare-fun m!711817 () Bool)

(assert (=> b!765756 m!711817))

(declare-fun m!711819 () Bool)

(assert (=> b!765770 m!711819))

(assert (=> b!765770 m!711819))

(declare-fun m!711821 () Bool)

(assert (=> b!765770 m!711821))

(assert (=> b!765768 m!711819))

(assert (=> b!765768 m!711819))

(declare-fun m!711823 () Bool)

(assert (=> b!765768 m!711823))

(declare-fun m!711825 () Bool)

(assert (=> b!765762 m!711825))

(declare-fun m!711827 () Bool)

(assert (=> b!765762 m!711827))

(declare-fun m!711829 () Bool)

(assert (=> b!765762 m!711829))

(declare-fun m!711831 () Bool)

(assert (=> b!765762 m!711831))

(assert (=> b!765762 m!711825))

(declare-fun m!711833 () Bool)

(assert (=> b!765762 m!711833))

(declare-fun m!711835 () Bool)

(assert (=> b!765766 m!711835))

(declare-fun m!711837 () Bool)

(assert (=> b!765755 m!711837))

(declare-fun m!711839 () Bool)

(assert (=> start!66462 m!711839))

(declare-fun m!711841 () Bool)

(assert (=> start!66462 m!711841))

(declare-fun m!711843 () Bool)

(assert (=> b!765767 m!711843))

(declare-fun m!711845 () Bool)

(assert (=> b!765763 m!711845))

(assert (=> b!765758 m!711819))

(assert (=> b!765758 m!711819))

(declare-fun m!711847 () Bool)

(assert (=> b!765758 m!711847))

(declare-fun m!711849 () Bool)

(assert (=> b!765769 m!711849))

(assert (=> b!765754 m!711819))

(assert (=> b!765754 m!711819))

(declare-fun m!711851 () Bool)

(assert (=> b!765754 m!711851))

(assert (=> b!765754 m!711851))

(assert (=> b!765754 m!711819))

(declare-fun m!711853 () Bool)

(assert (=> b!765754 m!711853))

(assert (=> b!765765 m!711819))

(assert (=> b!765765 m!711819))

(declare-fun m!711855 () Bool)

(assert (=> b!765765 m!711855))

(assert (=> b!765757 m!711819))

(assert (=> b!765757 m!711819))

(declare-fun m!711857 () Bool)

(assert (=> b!765757 m!711857))

(declare-fun m!711859 () Bool)

(assert (=> b!765761 m!711859))

(push 1)

