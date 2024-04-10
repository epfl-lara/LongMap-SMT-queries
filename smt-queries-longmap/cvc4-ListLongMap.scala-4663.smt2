; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64754 () Bool)

(assert start!64754)

(declare-fun b!731151 () Bool)

(declare-fun res!491369 () Bool)

(declare-fun e!409135 () Bool)

(assert (=> b!731151 (=> (not res!491369) (not e!409135))))

(declare-datatypes ((array!41203 0))(
  ( (array!41204 (arr!19721 (Array (_ BitVec 32) (_ BitVec 64))) (size!20142 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41203)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!731151 (= res!491369 (and (= (size!20142 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20142 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20142 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!731152 () Bool)

(declare-fun e!409133 () Bool)

(declare-fun e!409134 () Bool)

(assert (=> b!731152 (= e!409133 e!409134)))

(declare-fun res!491375 () Bool)

(assert (=> b!731152 (=> res!491375 e!409134)))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!731152 (= res!491375 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!324023 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!731152 (= lt!324023 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!731153 () Bool)

(declare-fun e!409136 () Bool)

(assert (=> b!731153 (= e!409136 (not e!409133))))

(declare-fun res!491373 () Bool)

(assert (=> b!731153 (=> res!491373 e!409133)))

(declare-datatypes ((SeekEntryResult!7321 0))(
  ( (MissingZero!7321 (index!31652 (_ BitVec 32))) (Found!7321 (index!31653 (_ BitVec 32))) (Intermediate!7321 (undefined!8133 Bool) (index!31654 (_ BitVec 32)) (x!62623 (_ BitVec 32))) (Undefined!7321) (MissingVacant!7321 (index!31655 (_ BitVec 32))) )
))
(declare-fun lt!324019 () SeekEntryResult!7321)

(assert (=> b!731153 (= res!491373 (or (not (is-Intermediate!7321 lt!324019)) (bvsge x!1131 (x!62623 lt!324019))))))

(declare-fun e!409127 () Bool)

(assert (=> b!731153 e!409127))

(declare-fun res!491379 () Bool)

(assert (=> b!731153 (=> (not res!491379) (not e!409127))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41203 (_ BitVec 32)) Bool)

(assert (=> b!731153 (= res!491379 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24960 0))(
  ( (Unit!24961) )
))
(declare-fun lt!324026 () Unit!24960)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41203 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24960)

(assert (=> b!731153 (= lt!324026 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!731154 () Bool)

(declare-fun res!491368 () Bool)

(assert (=> b!731154 (=> (not res!491368) (not e!409135))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!731154 (= res!491368 (validKeyInArray!0 (select (arr!19721 a!3186) j!159)))))

(declare-fun res!491383 () Bool)

(assert (=> start!64754 (=> (not res!491383) (not e!409135))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64754 (= res!491383 (validMask!0 mask!3328))))

(assert (=> start!64754 e!409135))

(assert (=> start!64754 true))

(declare-fun array_inv!15517 (array!41203) Bool)

(assert (=> start!64754 (array_inv!15517 a!3186)))

(declare-fun b!731155 () Bool)

(declare-fun res!491376 () Bool)

(declare-fun e!409132 () Bool)

(assert (=> b!731155 (=> (not res!491376) (not e!409132))))

(declare-datatypes ((List!13723 0))(
  ( (Nil!13720) (Cons!13719 (h!14779 (_ BitVec 64)) (t!20038 List!13723)) )
))
(declare-fun arrayNoDuplicates!0 (array!41203 (_ BitVec 32) List!13723) Bool)

(assert (=> b!731155 (= res!491376 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13720))))

(declare-fun b!731156 () Bool)

(declare-fun e!409131 () Bool)

(assert (=> b!731156 (= e!409127 e!409131)))

(declare-fun res!491380 () Bool)

(assert (=> b!731156 (=> (not res!491380) (not e!409131))))

(declare-fun lt!324018 () SeekEntryResult!7321)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41203 (_ BitVec 32)) SeekEntryResult!7321)

(assert (=> b!731156 (= res!491380 (= (seekEntryOrOpen!0 (select (arr!19721 a!3186) j!159) a!3186 mask!3328) lt!324018))))

(assert (=> b!731156 (= lt!324018 (Found!7321 j!159))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun e!409129 () Bool)

(declare-fun b!731157 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41203 (_ BitVec 32)) SeekEntryResult!7321)

(assert (=> b!731157 (= e!409129 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19721 a!3186) j!159) a!3186 mask!3328) (Found!7321 j!159)))))

(declare-fun b!731158 () Bool)

(declare-fun e!409130 () Bool)

(assert (=> b!731158 (= e!409130 e!409136)))

(declare-fun res!491381 () Bool)

(assert (=> b!731158 (=> (not res!491381) (not e!409136))))

(declare-fun lt!324024 () SeekEntryResult!7321)

(assert (=> b!731158 (= res!491381 (= lt!324024 lt!324019))))

(declare-fun lt!324022 () array!41203)

(declare-fun lt!324017 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41203 (_ BitVec 32)) SeekEntryResult!7321)

(assert (=> b!731158 (= lt!324019 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!324017 lt!324022 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!731158 (= lt!324024 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!324017 mask!3328) lt!324017 lt!324022 mask!3328))))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!731158 (= lt!324017 (select (store (arr!19721 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!731158 (= lt!324022 (array!41204 (store (arr!19721 a!3186) i!1173 k!2102) (size!20142 a!3186)))))

(declare-fun b!731159 () Bool)

(assert (=> b!731159 (= e!409132 e!409130)))

(declare-fun res!491371 () Bool)

(assert (=> b!731159 (=> (not res!491371) (not e!409130))))

(declare-fun lt!324020 () SeekEntryResult!7321)

(assert (=> b!731159 (= res!491371 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19721 a!3186) j!159) mask!3328) (select (arr!19721 a!3186) j!159) a!3186 mask!3328) lt!324020))))

(assert (=> b!731159 (= lt!324020 (Intermediate!7321 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!731160 () Bool)

(assert (=> b!731160 (= e!409131 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19721 a!3186) j!159) a!3186 mask!3328) lt!324018))))

(declare-fun b!731161 () Bool)

(assert (=> b!731161 (= e!409134 true)))

(declare-fun lt!324021 () SeekEntryResult!7321)

(assert (=> b!731161 (= lt!324021 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19721 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!731162 () Bool)

(declare-fun res!491370 () Bool)

(assert (=> b!731162 (=> (not res!491370) (not e!409130))))

(assert (=> b!731162 (= res!491370 e!409129)))

(declare-fun c!80266 () Bool)

(assert (=> b!731162 (= c!80266 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!731163 () Bool)

(declare-fun res!491382 () Bool)

(assert (=> b!731163 (=> (not res!491382) (not e!409130))))

(assert (=> b!731163 (= res!491382 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19721 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!731164 () Bool)

(declare-fun res!491377 () Bool)

(assert (=> b!731164 (=> (not res!491377) (not e!409135))))

(assert (=> b!731164 (= res!491377 (validKeyInArray!0 k!2102))))

(declare-fun b!731165 () Bool)

(declare-fun res!491378 () Bool)

(assert (=> b!731165 (=> (not res!491378) (not e!409132))))

(assert (=> b!731165 (= res!491378 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20142 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20142 a!3186))))))

(declare-fun b!731166 () Bool)

(assert (=> b!731166 (= e!409129 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19721 a!3186) j!159) a!3186 mask!3328) lt!324020))))

(declare-fun b!731167 () Bool)

(declare-fun res!491372 () Bool)

(assert (=> b!731167 (=> (not res!491372) (not e!409135))))

(declare-fun arrayContainsKey!0 (array!41203 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!731167 (= res!491372 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!731168 () Bool)

(assert (=> b!731168 (= e!409135 e!409132)))

(declare-fun res!491384 () Bool)

(assert (=> b!731168 (=> (not res!491384) (not e!409132))))

(declare-fun lt!324025 () SeekEntryResult!7321)

(assert (=> b!731168 (= res!491384 (or (= lt!324025 (MissingZero!7321 i!1173)) (= lt!324025 (MissingVacant!7321 i!1173))))))

(assert (=> b!731168 (= lt!324025 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!731169 () Bool)

(declare-fun res!491374 () Bool)

(assert (=> b!731169 (=> (not res!491374) (not e!409132))))

(assert (=> b!731169 (= res!491374 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(assert (= (and start!64754 res!491383) b!731151))

(assert (= (and b!731151 res!491369) b!731154))

(assert (= (and b!731154 res!491368) b!731164))

(assert (= (and b!731164 res!491377) b!731167))

(assert (= (and b!731167 res!491372) b!731168))

(assert (= (and b!731168 res!491384) b!731169))

(assert (= (and b!731169 res!491374) b!731155))

(assert (= (and b!731155 res!491376) b!731165))

(assert (= (and b!731165 res!491378) b!731159))

(assert (= (and b!731159 res!491371) b!731163))

(assert (= (and b!731163 res!491382) b!731162))

(assert (= (and b!731162 c!80266) b!731166))

(assert (= (and b!731162 (not c!80266)) b!731157))

(assert (= (and b!731162 res!491370) b!731158))

(assert (= (and b!731158 res!491381) b!731153))

(assert (= (and b!731153 res!491379) b!731156))

(assert (= (and b!731156 res!491380) b!731160))

(assert (= (and b!731153 (not res!491373)) b!731152))

(assert (= (and b!731152 (not res!491375)) b!731161))

(declare-fun m!684571 () Bool)

(assert (=> b!731163 m!684571))

(declare-fun m!684573 () Bool)

(assert (=> b!731160 m!684573))

(assert (=> b!731160 m!684573))

(declare-fun m!684575 () Bool)

(assert (=> b!731160 m!684575))

(assert (=> b!731159 m!684573))

(assert (=> b!731159 m!684573))

(declare-fun m!684577 () Bool)

(assert (=> b!731159 m!684577))

(assert (=> b!731159 m!684577))

(assert (=> b!731159 m!684573))

(declare-fun m!684579 () Bool)

(assert (=> b!731159 m!684579))

(declare-fun m!684581 () Bool)

(assert (=> b!731152 m!684581))

(declare-fun m!684583 () Bool)

(assert (=> b!731158 m!684583))

(declare-fun m!684585 () Bool)

(assert (=> b!731158 m!684585))

(declare-fun m!684587 () Bool)

(assert (=> b!731158 m!684587))

(declare-fun m!684589 () Bool)

(assert (=> b!731158 m!684589))

(declare-fun m!684591 () Bool)

(assert (=> b!731158 m!684591))

(assert (=> b!731158 m!684583))

(assert (=> b!731154 m!684573))

(assert (=> b!731154 m!684573))

(declare-fun m!684593 () Bool)

(assert (=> b!731154 m!684593))

(declare-fun m!684595 () Bool)

(assert (=> b!731153 m!684595))

(declare-fun m!684597 () Bool)

(assert (=> b!731153 m!684597))

(declare-fun m!684599 () Bool)

(assert (=> b!731164 m!684599))

(declare-fun m!684601 () Bool)

(assert (=> b!731155 m!684601))

(declare-fun m!684603 () Bool)

(assert (=> b!731167 m!684603))

(declare-fun m!684605 () Bool)

(assert (=> b!731168 m!684605))

(assert (=> b!731161 m!684573))

(assert (=> b!731161 m!684573))

(declare-fun m!684607 () Bool)

(assert (=> b!731161 m!684607))

(declare-fun m!684609 () Bool)

(assert (=> b!731169 m!684609))

(declare-fun m!684611 () Bool)

(assert (=> start!64754 m!684611))

(declare-fun m!684613 () Bool)

(assert (=> start!64754 m!684613))

(assert (=> b!731156 m!684573))

(assert (=> b!731156 m!684573))

(declare-fun m!684615 () Bool)

(assert (=> b!731156 m!684615))

(assert (=> b!731166 m!684573))

(assert (=> b!731166 m!684573))

(declare-fun m!684617 () Bool)

(assert (=> b!731166 m!684617))

(assert (=> b!731157 m!684573))

(assert (=> b!731157 m!684573))

(assert (=> b!731157 m!684607))

(push 1)

