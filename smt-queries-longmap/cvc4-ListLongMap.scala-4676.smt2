; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65120 () Bool)

(assert start!65120)

(declare-fun b!735105 () Bool)

(declare-fun res!493937 () Bool)

(declare-fun e!411305 () Bool)

(assert (=> b!735105 (=> (not res!493937) (not e!411305))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41293 0))(
  ( (array!41294 (arr!19760 (Array (_ BitVec 32) (_ BitVec 64))) (size!20181 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41293)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!735105 (= res!493937 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19760 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!735106 () Bool)

(declare-fun res!493936 () Bool)

(declare-fun e!411308 () Bool)

(assert (=> b!735106 (=> (not res!493936) (not e!411308))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!735106 (= res!493936 (and (= (size!20181 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20181 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20181 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!735107 () Bool)

(declare-fun res!493933 () Bool)

(declare-fun e!411311 () Bool)

(assert (=> b!735107 (=> (not res!493933) (not e!411311))))

(declare-datatypes ((List!13762 0))(
  ( (Nil!13759) (Cons!13758 (h!14830 (_ BitVec 64)) (t!20077 List!13762)) )
))
(declare-fun arrayNoDuplicates!0 (array!41293 (_ BitVec 32) List!13762) Bool)

(assert (=> b!735107 (= res!493933 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13759))))

(declare-fun b!735108 () Bool)

(declare-fun res!493932 () Bool)

(assert (=> b!735108 (=> (not res!493932) (not e!411308))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41293 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!735108 (= res!493932 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!735109 () Bool)

(declare-fun res!493927 () Bool)

(assert (=> b!735109 (=> (not res!493927) (not e!411311))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41293 (_ BitVec 32)) Bool)

(assert (=> b!735109 (= res!493927 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!735110 () Bool)

(declare-fun e!411310 () Bool)

(declare-fun e!411306 () Bool)

(assert (=> b!735110 (= e!411310 e!411306)))

(declare-fun res!493935 () Bool)

(assert (=> b!735110 (=> res!493935 e!411306)))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!735110 (= res!493935 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun lt!325825 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!735110 (= lt!325825 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun e!411313 () Bool)

(declare-datatypes ((SeekEntryResult!7360 0))(
  ( (MissingZero!7360 (index!31808 (_ BitVec 32))) (Found!7360 (index!31809 (_ BitVec 32))) (Intermediate!7360 (undefined!8172 Bool) (index!31810 (_ BitVec 32)) (x!62814 (_ BitVec 32))) (Undefined!7360) (MissingVacant!7360 (index!31811 (_ BitVec 32))) )
))
(declare-fun lt!325823 () SeekEntryResult!7360)

(declare-fun b!735111 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41293 (_ BitVec 32)) SeekEntryResult!7360)

(assert (=> b!735111 (= e!411313 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19760 a!3186) j!159) a!3186 mask!3328) lt!325823))))

(declare-fun b!735112 () Bool)

(declare-fun res!493934 () Bool)

(assert (=> b!735112 (=> (not res!493934) (not e!411308))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!735112 (= res!493934 (validKeyInArray!0 k!2102))))

(declare-fun b!735113 () Bool)

(assert (=> b!735113 (= e!411311 e!411305)))

(declare-fun res!493929 () Bool)

(assert (=> b!735113 (=> (not res!493929) (not e!411305))))

(declare-fun lt!325824 () SeekEntryResult!7360)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41293 (_ BitVec 32)) SeekEntryResult!7360)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!735113 (= res!493929 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19760 a!3186) j!159) mask!3328) (select (arr!19760 a!3186) j!159) a!3186 mask!3328) lt!325824))))

(assert (=> b!735113 (= lt!325824 (Intermediate!7360 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!735114 () Bool)

(declare-fun res!493939 () Bool)

(assert (=> b!735114 (=> (not res!493939) (not e!411311))))

(assert (=> b!735114 (= res!493939 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20181 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20181 a!3186))))))

(declare-fun b!735115 () Bool)

(declare-fun e!411312 () Bool)

(assert (=> b!735115 (= e!411312 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19760 a!3186) j!159) a!3186 mask!3328) lt!325824))))

(declare-fun b!735117 () Bool)

(assert (=> b!735117 (= e!411312 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19760 a!3186) j!159) a!3186 mask!3328) (Found!7360 j!159)))))

(declare-fun b!735118 () Bool)

(declare-fun res!493924 () Bool)

(assert (=> b!735118 (=> (not res!493924) (not e!411305))))

(assert (=> b!735118 (= res!493924 e!411312)))

(declare-fun c!80971 () Bool)

(assert (=> b!735118 (= c!80971 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!735119 () Bool)

(declare-fun e!411314 () Bool)

(assert (=> b!735119 (= e!411314 (not e!411310))))

(declare-fun res!493938 () Bool)

(assert (=> b!735119 (=> res!493938 e!411310)))

(declare-fun lt!325820 () SeekEntryResult!7360)

(assert (=> b!735119 (= res!493938 (or (not (is-Intermediate!7360 lt!325820)) (bvsge x!1131 (x!62814 lt!325820))))))

(declare-fun e!411307 () Bool)

(assert (=> b!735119 e!411307))

(declare-fun res!493925 () Bool)

(assert (=> b!735119 (=> (not res!493925) (not e!411307))))

(assert (=> b!735119 (= res!493925 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25038 0))(
  ( (Unit!25039) )
))
(declare-fun lt!325827 () Unit!25038)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41293 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25038)

(assert (=> b!735119 (= lt!325827 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!735120 () Bool)

(assert (=> b!735120 (= e!411306 true)))

(declare-fun lt!325829 () SeekEntryResult!7360)

(assert (=> b!735120 (= lt!325829 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19760 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!735121 () Bool)

(declare-fun res!493931 () Bool)

(assert (=> b!735121 (=> (not res!493931) (not e!411308))))

(assert (=> b!735121 (= res!493931 (validKeyInArray!0 (select (arr!19760 a!3186) j!159)))))

(declare-fun b!735122 () Bool)

(assert (=> b!735122 (= e!411305 e!411314)))

(declare-fun res!493926 () Bool)

(assert (=> b!735122 (=> (not res!493926) (not e!411314))))

(declare-fun lt!325828 () SeekEntryResult!7360)

(assert (=> b!735122 (= res!493926 (= lt!325828 lt!325820))))

(declare-fun lt!325822 () (_ BitVec 64))

(declare-fun lt!325821 () array!41293)

(assert (=> b!735122 (= lt!325820 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!325822 lt!325821 mask!3328))))

(assert (=> b!735122 (= lt!325828 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!325822 mask!3328) lt!325822 lt!325821 mask!3328))))

(assert (=> b!735122 (= lt!325822 (select (store (arr!19760 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!735122 (= lt!325821 (array!41294 (store (arr!19760 a!3186) i!1173 k!2102) (size!20181 a!3186)))))

(declare-fun b!735123 () Bool)

(assert (=> b!735123 (= e!411307 e!411313)))

(declare-fun res!493928 () Bool)

(assert (=> b!735123 (=> (not res!493928) (not e!411313))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41293 (_ BitVec 32)) SeekEntryResult!7360)

(assert (=> b!735123 (= res!493928 (= (seekEntryOrOpen!0 (select (arr!19760 a!3186) j!159) a!3186 mask!3328) lt!325823))))

(assert (=> b!735123 (= lt!325823 (Found!7360 j!159))))

(declare-fun res!493930 () Bool)

(assert (=> start!65120 (=> (not res!493930) (not e!411308))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65120 (= res!493930 (validMask!0 mask!3328))))

(assert (=> start!65120 e!411308))

(assert (=> start!65120 true))

(declare-fun array_inv!15556 (array!41293) Bool)

(assert (=> start!65120 (array_inv!15556 a!3186)))

(declare-fun b!735116 () Bool)

(assert (=> b!735116 (= e!411308 e!411311)))

(declare-fun res!493940 () Bool)

(assert (=> b!735116 (=> (not res!493940) (not e!411311))))

(declare-fun lt!325826 () SeekEntryResult!7360)

(assert (=> b!735116 (= res!493940 (or (= lt!325826 (MissingZero!7360 i!1173)) (= lt!325826 (MissingVacant!7360 i!1173))))))

(assert (=> b!735116 (= lt!325826 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(assert (= (and start!65120 res!493930) b!735106))

(assert (= (and b!735106 res!493936) b!735121))

(assert (= (and b!735121 res!493931) b!735112))

(assert (= (and b!735112 res!493934) b!735108))

(assert (= (and b!735108 res!493932) b!735116))

(assert (= (and b!735116 res!493940) b!735109))

(assert (= (and b!735109 res!493927) b!735107))

(assert (= (and b!735107 res!493933) b!735114))

(assert (= (and b!735114 res!493939) b!735113))

(assert (= (and b!735113 res!493929) b!735105))

(assert (= (and b!735105 res!493937) b!735118))

(assert (= (and b!735118 c!80971) b!735115))

(assert (= (and b!735118 (not c!80971)) b!735117))

(assert (= (and b!735118 res!493924) b!735122))

(assert (= (and b!735122 res!493926) b!735119))

(assert (= (and b!735119 res!493925) b!735123))

(assert (= (and b!735123 res!493928) b!735111))

(assert (= (and b!735119 (not res!493938)) b!735110))

(assert (= (and b!735110 (not res!493935)) b!735120))

(declare-fun m!687571 () Bool)

(assert (=> b!735117 m!687571))

(assert (=> b!735117 m!687571))

(declare-fun m!687573 () Bool)

(assert (=> b!735117 m!687573))

(declare-fun m!687575 () Bool)

(assert (=> start!65120 m!687575))

(declare-fun m!687577 () Bool)

(assert (=> start!65120 m!687577))

(declare-fun m!687579 () Bool)

(assert (=> b!735109 m!687579))

(assert (=> b!735123 m!687571))

(assert (=> b!735123 m!687571))

(declare-fun m!687581 () Bool)

(assert (=> b!735123 m!687581))

(declare-fun m!687583 () Bool)

(assert (=> b!735105 m!687583))

(assert (=> b!735115 m!687571))

(assert (=> b!735115 m!687571))

(declare-fun m!687585 () Bool)

(assert (=> b!735115 m!687585))

(assert (=> b!735120 m!687571))

(assert (=> b!735120 m!687571))

(assert (=> b!735120 m!687573))

(declare-fun m!687587 () Bool)

(assert (=> b!735107 m!687587))

(declare-fun m!687589 () Bool)

(assert (=> b!735108 m!687589))

(declare-fun m!687591 () Bool)

(assert (=> b!735112 m!687591))

(assert (=> b!735121 m!687571))

(assert (=> b!735121 m!687571))

(declare-fun m!687593 () Bool)

(assert (=> b!735121 m!687593))

(declare-fun m!687595 () Bool)

(assert (=> b!735116 m!687595))

(declare-fun m!687597 () Bool)

(assert (=> b!735110 m!687597))

(declare-fun m!687599 () Bool)

(assert (=> b!735122 m!687599))

(assert (=> b!735122 m!687599))

(declare-fun m!687601 () Bool)

(assert (=> b!735122 m!687601))

(declare-fun m!687603 () Bool)

(assert (=> b!735122 m!687603))

(declare-fun m!687605 () Bool)

(assert (=> b!735122 m!687605))

(declare-fun m!687607 () Bool)

(assert (=> b!735122 m!687607))

(assert (=> b!735113 m!687571))

(assert (=> b!735113 m!687571))

(declare-fun m!687609 () Bool)

(assert (=> b!735113 m!687609))

(assert (=> b!735113 m!687609))

(assert (=> b!735113 m!687571))

(declare-fun m!687611 () Bool)

(assert (=> b!735113 m!687611))

(declare-fun m!687613 () Bool)

(assert (=> b!735119 m!687613))

(declare-fun m!687615 () Bool)

(assert (=> b!735119 m!687615))

(assert (=> b!735111 m!687571))

(assert (=> b!735111 m!687571))

(declare-fun m!687617 () Bool)

(assert (=> b!735111 m!687617))

(push 1)

