; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64640 () Bool)

(assert start!64640)

(declare-fun b!728038 () Bool)

(declare-fun e!407570 () Bool)

(declare-fun e!407568 () Bool)

(assert (=> b!728038 (= e!407570 e!407568)))

(declare-fun res!488611 () Bool)

(assert (=> b!728038 (=> (not res!488611) (not e!407568))))

(declare-datatypes ((SeekEntryResult!7264 0))(
  ( (MissingZero!7264 (index!31424 (_ BitVec 32))) (Found!7264 (index!31425 (_ BitVec 32))) (Intermediate!7264 (undefined!8076 Bool) (index!31426 (_ BitVec 32)) (x!62414 (_ BitVec 32))) (Undefined!7264) (MissingVacant!7264 (index!31427 (_ BitVec 32))) )
))
(declare-fun lt!322464 () SeekEntryResult!7264)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!728038 (= res!488611 (or (= lt!322464 (MissingZero!7264 i!1173)) (= lt!322464 (MissingVacant!7264 i!1173))))))

(declare-datatypes ((array!41089 0))(
  ( (array!41090 (arr!19664 (Array (_ BitVec 32) (_ BitVec 64))) (size!20085 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41089)

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41089 (_ BitVec 32)) SeekEntryResult!7264)

(assert (=> b!728038 (= lt!322464 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!728039 () Bool)

(declare-fun res!488600 () Bool)

(declare-fun e!407566 () Bool)

(assert (=> b!728039 (=> (not res!488600) (not e!407566))))

(declare-fun e!407569 () Bool)

(assert (=> b!728039 (= res!488600 e!407569)))

(declare-fun c!80095 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!728039 (= c!80095 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!728040 () Bool)

(declare-fun e!407565 () Bool)

(assert (=> b!728040 (= e!407565 true)))

(declare-fun lt!322467 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!728040 (= lt!322467 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun res!488608 () Bool)

(assert (=> start!64640 (=> (not res!488608) (not e!407570))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64640 (= res!488608 (validMask!0 mask!3328))))

(assert (=> start!64640 e!407570))

(assert (=> start!64640 true))

(declare-fun array_inv!15460 (array!41089) Bool)

(assert (=> start!64640 (array_inv!15460 a!3186)))

(declare-fun b!728041 () Bool)

(assert (=> b!728041 (= e!407568 e!407566)))

(declare-fun res!488603 () Bool)

(assert (=> b!728041 (=> (not res!488603) (not e!407566))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun lt!322469 () SeekEntryResult!7264)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41089 (_ BitVec 32)) SeekEntryResult!7264)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!728041 (= res!488603 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19664 a!3186) j!159) mask!3328) (select (arr!19664 a!3186) j!159) a!3186 mask!3328) lt!322469))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!728041 (= lt!322469 (Intermediate!7264 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!728042 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41089 (_ BitVec 32)) SeekEntryResult!7264)

(assert (=> b!728042 (= e!407569 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19664 a!3186) j!159) a!3186 mask!3328) (Found!7264 j!159)))))

(declare-fun b!728043 () Bool)

(declare-fun res!488605 () Bool)

(assert (=> b!728043 (=> (not res!488605) (not e!407570))))

(declare-fun arrayContainsKey!0 (array!41089 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!728043 (= res!488605 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!728044 () Bool)

(declare-fun res!488601 () Bool)

(assert (=> b!728044 (=> (not res!488601) (not e!407566))))

(assert (=> b!728044 (= res!488601 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19664 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!728045 () Bool)

(assert (=> b!728045 (= e!407569 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19664 a!3186) j!159) a!3186 mask!3328) lt!322469))))

(declare-fun b!728046 () Bool)

(declare-fun res!488598 () Bool)

(assert (=> b!728046 (=> (not res!488598) (not e!407568))))

(declare-datatypes ((List!13666 0))(
  ( (Nil!13663) (Cons!13662 (h!14722 (_ BitVec 64)) (t!19981 List!13666)) )
))
(declare-fun arrayNoDuplicates!0 (array!41089 (_ BitVec 32) List!13666) Bool)

(assert (=> b!728046 (= res!488598 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13663))))

(declare-fun b!728047 () Bool)

(declare-fun res!488604 () Bool)

(assert (=> b!728047 (=> (not res!488604) (not e!407570))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!728047 (= res!488604 (validKeyInArray!0 k!2102))))

(declare-fun b!728048 () Bool)

(declare-fun e!407563 () Bool)

(declare-fun lt!322462 () SeekEntryResult!7264)

(assert (=> b!728048 (= e!407563 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19664 a!3186) j!159) a!3186 mask!3328) lt!322462))))

(declare-fun b!728049 () Bool)

(declare-fun e!407564 () Bool)

(assert (=> b!728049 (= e!407564 e!407563)))

(declare-fun res!488612 () Bool)

(assert (=> b!728049 (=> (not res!488612) (not e!407563))))

(assert (=> b!728049 (= res!488612 (= (seekEntryOrOpen!0 (select (arr!19664 a!3186) j!159) a!3186 mask!3328) lt!322462))))

(assert (=> b!728049 (= lt!322462 (Found!7264 j!159))))

(declare-fun b!728050 () Bool)

(declare-fun res!488599 () Bool)

(assert (=> b!728050 (=> (not res!488599) (not e!407570))))

(assert (=> b!728050 (= res!488599 (validKeyInArray!0 (select (arr!19664 a!3186) j!159)))))

(declare-fun b!728051 () Bool)

(declare-fun e!407562 () Bool)

(assert (=> b!728051 (= e!407562 (not e!407565))))

(declare-fun res!488610 () Bool)

(assert (=> b!728051 (=> res!488610 e!407565)))

(declare-fun lt!322466 () SeekEntryResult!7264)

(assert (=> b!728051 (= res!488610 (or (not (is-Intermediate!7264 lt!322466)) (bvsge x!1131 (x!62414 lt!322466))))))

(assert (=> b!728051 e!407564))

(declare-fun res!488602 () Bool)

(assert (=> b!728051 (=> (not res!488602) (not e!407564))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41089 (_ BitVec 32)) Bool)

(assert (=> b!728051 (= res!488602 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24846 0))(
  ( (Unit!24847) )
))
(declare-fun lt!322463 () Unit!24846)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41089 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24846)

(assert (=> b!728051 (= lt!322463 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!728052 () Bool)

(declare-fun res!488597 () Bool)

(assert (=> b!728052 (=> (not res!488597) (not e!407568))))

(assert (=> b!728052 (= res!488597 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20085 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20085 a!3186))))))

(declare-fun b!728053 () Bool)

(declare-fun res!488609 () Bool)

(assert (=> b!728053 (=> (not res!488609) (not e!407568))))

(assert (=> b!728053 (= res!488609 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!728054 () Bool)

(assert (=> b!728054 (= e!407566 e!407562)))

(declare-fun res!488607 () Bool)

(assert (=> b!728054 (=> (not res!488607) (not e!407562))))

(declare-fun lt!322465 () SeekEntryResult!7264)

(assert (=> b!728054 (= res!488607 (= lt!322465 lt!322466))))

(declare-fun lt!322461 () array!41089)

(declare-fun lt!322468 () (_ BitVec 64))

(assert (=> b!728054 (= lt!322466 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!322468 lt!322461 mask!3328))))

(assert (=> b!728054 (= lt!322465 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!322468 mask!3328) lt!322468 lt!322461 mask!3328))))

(assert (=> b!728054 (= lt!322468 (select (store (arr!19664 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!728054 (= lt!322461 (array!41090 (store (arr!19664 a!3186) i!1173 k!2102) (size!20085 a!3186)))))

(declare-fun b!728055 () Bool)

(declare-fun res!488606 () Bool)

(assert (=> b!728055 (=> (not res!488606) (not e!407570))))

(assert (=> b!728055 (= res!488606 (and (= (size!20085 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20085 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20085 a!3186)) (not (= i!1173 j!159))))))

(assert (= (and start!64640 res!488608) b!728055))

(assert (= (and b!728055 res!488606) b!728050))

(assert (= (and b!728050 res!488599) b!728047))

(assert (= (and b!728047 res!488604) b!728043))

(assert (= (and b!728043 res!488605) b!728038))

(assert (= (and b!728038 res!488611) b!728053))

(assert (= (and b!728053 res!488609) b!728046))

(assert (= (and b!728046 res!488598) b!728052))

(assert (= (and b!728052 res!488597) b!728041))

(assert (= (and b!728041 res!488603) b!728044))

(assert (= (and b!728044 res!488601) b!728039))

(assert (= (and b!728039 c!80095) b!728045))

(assert (= (and b!728039 (not c!80095)) b!728042))

(assert (= (and b!728039 res!488600) b!728054))

(assert (= (and b!728054 res!488607) b!728051))

(assert (= (and b!728051 res!488602) b!728049))

(assert (= (and b!728049 res!488612) b!728048))

(assert (= (and b!728051 (not res!488610)) b!728040))

(declare-fun m!681835 () Bool)

(assert (=> b!728053 m!681835))

(declare-fun m!681837 () Bool)

(assert (=> b!728045 m!681837))

(assert (=> b!728045 m!681837))

(declare-fun m!681839 () Bool)

(assert (=> b!728045 m!681839))

(declare-fun m!681841 () Bool)

(assert (=> b!728054 m!681841))

(declare-fun m!681843 () Bool)

(assert (=> b!728054 m!681843))

(declare-fun m!681845 () Bool)

(assert (=> b!728054 m!681845))

(declare-fun m!681847 () Bool)

(assert (=> b!728054 m!681847))

(declare-fun m!681849 () Bool)

(assert (=> b!728054 m!681849))

(assert (=> b!728054 m!681841))

(assert (=> b!728049 m!681837))

(assert (=> b!728049 m!681837))

(declare-fun m!681851 () Bool)

(assert (=> b!728049 m!681851))

(declare-fun m!681853 () Bool)

(assert (=> b!728043 m!681853))

(declare-fun m!681855 () Bool)

(assert (=> b!728044 m!681855))

(declare-fun m!681857 () Bool)

(assert (=> b!728038 m!681857))

(assert (=> b!728042 m!681837))

(assert (=> b!728042 m!681837))

(declare-fun m!681859 () Bool)

(assert (=> b!728042 m!681859))

(assert (=> b!728048 m!681837))

(assert (=> b!728048 m!681837))

(declare-fun m!681861 () Bool)

(assert (=> b!728048 m!681861))

(declare-fun m!681863 () Bool)

(assert (=> start!64640 m!681863))

(declare-fun m!681865 () Bool)

(assert (=> start!64640 m!681865))

(assert (=> b!728041 m!681837))

(assert (=> b!728041 m!681837))

(declare-fun m!681867 () Bool)

(assert (=> b!728041 m!681867))

(assert (=> b!728041 m!681867))

(assert (=> b!728041 m!681837))

(declare-fun m!681869 () Bool)

(assert (=> b!728041 m!681869))

(declare-fun m!681871 () Bool)

(assert (=> b!728040 m!681871))

(declare-fun m!681873 () Bool)

(assert (=> b!728047 m!681873))

(declare-fun m!681875 () Bool)

(assert (=> b!728046 m!681875))

(declare-fun m!681877 () Bool)

(assert (=> b!728051 m!681877))

(declare-fun m!681879 () Bool)

(assert (=> b!728051 m!681879))

(assert (=> b!728050 m!681837))

(assert (=> b!728050 m!681837))

(declare-fun m!681881 () Bool)

(assert (=> b!728050 m!681881))

(push 1)

