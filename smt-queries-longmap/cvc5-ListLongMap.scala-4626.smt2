; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64456 () Bool)

(assert start!64456)

(declare-fun b!724728 () Bool)

(declare-fun res!485918 () Bool)

(declare-fun e!405933 () Bool)

(assert (=> b!724728 (=> (not res!485918) (not e!405933))))

(declare-datatypes ((array!40974 0))(
  ( (array!40975 (arr!19608 (Array (_ BitVec 32) (_ BitVec 64))) (size!20029 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40974)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!724728 (= res!485918 (validKeyInArray!0 (select (arr!19608 a!3186) j!159)))))

(declare-fun res!485921 () Bool)

(assert (=> start!64456 (=> (not res!485921) (not e!405933))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64456 (= res!485921 (validMask!0 mask!3328))))

(assert (=> start!64456 e!405933))

(assert (=> start!64456 true))

(declare-fun array_inv!15404 (array!40974) Bool)

(assert (=> start!64456 (array_inv!15404 a!3186)))

(declare-fun b!724729 () Bool)

(declare-fun e!405934 () Bool)

(declare-fun e!405932 () Bool)

(assert (=> b!724729 (= e!405934 e!405932)))

(declare-fun res!485915 () Bool)

(assert (=> b!724729 (=> (not res!485915) (not e!405932))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!321109 () (_ BitVec 64))

(declare-fun lt!321111 () array!40974)

(declare-datatypes ((SeekEntryResult!7208 0))(
  ( (MissingZero!7208 (index!31200 (_ BitVec 32))) (Found!7208 (index!31201 (_ BitVec 32))) (Intermediate!7208 (undefined!8020 Bool) (index!31202 (_ BitVec 32)) (x!62202 (_ BitVec 32))) (Undefined!7208) (MissingVacant!7208 (index!31203 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40974 (_ BitVec 32)) SeekEntryResult!7208)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!724729 (= res!485915 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!321109 mask!3328) lt!321109 lt!321111 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!321109 lt!321111 mask!3328)))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!724729 (= lt!321109 (select (store (arr!19608 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!724729 (= lt!321111 (array!40975 (store (arr!19608 a!3186) i!1173 k!2102) (size!20029 a!3186)))))

(declare-fun b!724730 () Bool)

(declare-fun e!405931 () Bool)

(declare-fun lt!321113 () SeekEntryResult!7208)

(assert (=> b!724730 (= e!405931 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19608 a!3186) j!159) a!3186 mask!3328) lt!321113))))

(declare-fun e!405930 () Bool)

(declare-fun b!724731 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40974 (_ BitVec 32)) SeekEntryResult!7208)

(assert (=> b!724731 (= e!405930 (= (seekEntryOrOpen!0 (select (arr!19608 a!3186) j!159) a!3186 mask!3328) (Found!7208 j!159)))))

(declare-fun b!724732 () Bool)

(declare-fun res!485919 () Bool)

(declare-fun e!405929 () Bool)

(assert (=> b!724732 (=> (not res!485919) (not e!405929))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40974 (_ BitVec 32)) Bool)

(assert (=> b!724732 (= res!485919 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!724733 () Bool)

(assert (=> b!724733 (= e!405929 e!405934)))

(declare-fun res!485925 () Bool)

(assert (=> b!724733 (=> (not res!485925) (not e!405934))))

(assert (=> b!724733 (= res!485925 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19608 a!3186) j!159) mask!3328) (select (arr!19608 a!3186) j!159) a!3186 mask!3328) lt!321113))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!724733 (= lt!321113 (Intermediate!7208 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!724734 () Bool)

(assert (=> b!724734 (= e!405933 e!405929)))

(declare-fun res!485927 () Bool)

(assert (=> b!724734 (=> (not res!485927) (not e!405929))))

(declare-fun lt!321110 () SeekEntryResult!7208)

(assert (=> b!724734 (= res!485927 (or (= lt!321110 (MissingZero!7208 i!1173)) (= lt!321110 (MissingVacant!7208 i!1173))))))

(assert (=> b!724734 (= lt!321110 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!724735 () Bool)

(declare-fun res!485916 () Bool)

(assert (=> b!724735 (=> (not res!485916) (not e!405934))))

(assert (=> b!724735 (= res!485916 e!405931)))

(declare-fun c!79780 () Bool)

(assert (=> b!724735 (= c!79780 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!724736 () Bool)

(declare-fun res!485924 () Bool)

(assert (=> b!724736 (=> (not res!485924) (not e!405933))))

(assert (=> b!724736 (= res!485924 (validKeyInArray!0 k!2102))))

(declare-fun b!724737 () Bool)

(declare-fun res!485914 () Bool)

(assert (=> b!724737 (=> (not res!485914) (not e!405933))))

(declare-fun arrayContainsKey!0 (array!40974 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!724737 (= res!485914 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!724738 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40974 (_ BitVec 32)) SeekEntryResult!7208)

(assert (=> b!724738 (= e!405931 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19608 a!3186) j!159) a!3186 mask!3328) (Found!7208 j!159)))))

(declare-fun b!724739 () Bool)

(assert (=> b!724739 (= e!405932 (not true))))

(assert (=> b!724739 e!405930))

(declare-fun res!485917 () Bool)

(assert (=> b!724739 (=> (not res!485917) (not e!405930))))

(assert (=> b!724739 (= res!485917 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24734 0))(
  ( (Unit!24735) )
))
(declare-fun lt!321112 () Unit!24734)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!40974 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24734)

(assert (=> b!724739 (= lt!321112 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!724740 () Bool)

(declare-fun res!485920 () Bool)

(assert (=> b!724740 (=> (not res!485920) (not e!405929))))

(declare-datatypes ((List!13610 0))(
  ( (Nil!13607) (Cons!13606 (h!14663 (_ BitVec 64)) (t!19925 List!13610)) )
))
(declare-fun arrayNoDuplicates!0 (array!40974 (_ BitVec 32) List!13610) Bool)

(assert (=> b!724740 (= res!485920 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13607))))

(declare-fun b!724741 () Bool)

(declare-fun res!485923 () Bool)

(assert (=> b!724741 (=> (not res!485923) (not e!405929))))

(assert (=> b!724741 (= res!485923 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20029 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20029 a!3186))))))

(declare-fun b!724742 () Bool)

(declare-fun res!485922 () Bool)

(assert (=> b!724742 (=> (not res!485922) (not e!405934))))

(assert (=> b!724742 (= res!485922 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19608 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!724743 () Bool)

(declare-fun res!485926 () Bool)

(assert (=> b!724743 (=> (not res!485926) (not e!405933))))

(assert (=> b!724743 (= res!485926 (and (= (size!20029 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20029 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20029 a!3186)) (not (= i!1173 j!159))))))

(assert (= (and start!64456 res!485921) b!724743))

(assert (= (and b!724743 res!485926) b!724728))

(assert (= (and b!724728 res!485918) b!724736))

(assert (= (and b!724736 res!485924) b!724737))

(assert (= (and b!724737 res!485914) b!724734))

(assert (= (and b!724734 res!485927) b!724732))

(assert (= (and b!724732 res!485919) b!724740))

(assert (= (and b!724740 res!485920) b!724741))

(assert (= (and b!724741 res!485923) b!724733))

(assert (= (and b!724733 res!485925) b!724742))

(assert (= (and b!724742 res!485922) b!724735))

(assert (= (and b!724735 c!79780) b!724730))

(assert (= (and b!724735 (not c!79780)) b!724738))

(assert (= (and b!724735 res!485916) b!724729))

(assert (= (and b!724729 res!485915) b!724739))

(assert (= (and b!724739 res!485917) b!724731))

(declare-fun m!678955 () Bool)

(assert (=> b!724732 m!678955))

(declare-fun m!678957 () Bool)

(assert (=> b!724742 m!678957))

(declare-fun m!678959 () Bool)

(assert (=> b!724736 m!678959))

(declare-fun m!678961 () Bool)

(assert (=> b!724740 m!678961))

(declare-fun m!678963 () Bool)

(assert (=> b!724738 m!678963))

(assert (=> b!724738 m!678963))

(declare-fun m!678965 () Bool)

(assert (=> b!724738 m!678965))

(assert (=> b!724728 m!678963))

(assert (=> b!724728 m!678963))

(declare-fun m!678967 () Bool)

(assert (=> b!724728 m!678967))

(assert (=> b!724731 m!678963))

(assert (=> b!724731 m!678963))

(declare-fun m!678969 () Bool)

(assert (=> b!724731 m!678969))

(declare-fun m!678971 () Bool)

(assert (=> b!724737 m!678971))

(declare-fun m!678973 () Bool)

(assert (=> start!64456 m!678973))

(declare-fun m!678975 () Bool)

(assert (=> start!64456 m!678975))

(assert (=> b!724730 m!678963))

(assert (=> b!724730 m!678963))

(declare-fun m!678977 () Bool)

(assert (=> b!724730 m!678977))

(declare-fun m!678979 () Bool)

(assert (=> b!724734 m!678979))

(declare-fun m!678981 () Bool)

(assert (=> b!724739 m!678981))

(declare-fun m!678983 () Bool)

(assert (=> b!724739 m!678983))

(assert (=> b!724733 m!678963))

(assert (=> b!724733 m!678963))

(declare-fun m!678985 () Bool)

(assert (=> b!724733 m!678985))

(assert (=> b!724733 m!678985))

(assert (=> b!724733 m!678963))

(declare-fun m!678987 () Bool)

(assert (=> b!724733 m!678987))

(declare-fun m!678989 () Bool)

(assert (=> b!724729 m!678989))

(declare-fun m!678991 () Bool)

(assert (=> b!724729 m!678991))

(declare-fun m!678993 () Bool)

(assert (=> b!724729 m!678993))

(declare-fun m!678995 () Bool)

(assert (=> b!724729 m!678995))

(assert (=> b!724729 m!678989))

(declare-fun m!678997 () Bool)

(assert (=> b!724729 m!678997))

(push 1)

