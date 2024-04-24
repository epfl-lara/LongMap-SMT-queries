; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45620 () Bool)

(assert start!45620)

(declare-fun b!502932 () Bool)

(declare-fun e!294555 () Bool)

(declare-fun e!294547 () Bool)

(assert (=> b!502932 (= e!294555 e!294547)))

(declare-fun res!304344 () Bool)

(assert (=> b!502932 (=> (not res!304344) (not e!294547))))

(declare-datatypes ((SeekEntryResult!3991 0))(
  ( (MissingZero!3991 (index!18152 (_ BitVec 32))) (Found!3991 (index!18153 (_ BitVec 32))) (Intermediate!3991 (undefined!4803 Bool) (index!18154 (_ BitVec 32)) (x!47325 (_ BitVec 32))) (Undefined!3991) (MissingVacant!3991 (index!18155 (_ BitVec 32))) )
))
(declare-fun lt!228757 () SeekEntryResult!3991)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!502932 (= res!304344 (or (= lt!228757 (MissingZero!3991 i!1204)) (= lt!228757 (MissingVacant!3991 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!32377 0))(
  ( (array!32378 (arr!15568 (Array (_ BitVec 32) (_ BitVec 64))) (size!15932 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32377)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32377 (_ BitVec 32)) SeekEntryResult!3991)

(assert (=> b!502932 (= lt!228757 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!502933 () Bool)

(declare-fun res!304347 () Bool)

(assert (=> b!502933 (=> (not res!304347) (not e!294547))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32377 (_ BitVec 32)) Bool)

(assert (=> b!502933 (= res!304347 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun res!304350 () Bool)

(assert (=> start!45620 (=> (not res!304350) (not e!294555))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45620 (= res!304350 (validMask!0 mask!3524))))

(assert (=> start!45620 e!294555))

(assert (=> start!45620 true))

(declare-fun array_inv!11427 (array!32377) Bool)

(assert (=> start!45620 (array_inv!11427 a!3235)))

(declare-fun b!502934 () Bool)

(declare-fun e!294548 () Bool)

(assert (=> b!502934 (= e!294548 true)))

(declare-fun lt!228751 () SeekEntryResult!3991)

(declare-fun lt!228754 () (_ BitVec 64))

(declare-fun lt!228755 () array!32377)

(declare-fun lt!228748 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32377 (_ BitVec 32)) SeekEntryResult!3991)

(assert (=> b!502934 (= lt!228751 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228748 lt!228754 lt!228755 mask!3524))))

(declare-fun b!502935 () Bool)

(declare-fun e!294551 () Bool)

(assert (=> b!502935 (= e!294551 e!294548)))

(declare-fun res!304345 () Bool)

(assert (=> b!502935 (=> res!304345 e!294548)))

(declare-fun lt!228750 () SeekEntryResult!3991)

(assert (=> b!502935 (= res!304345 (or (bvsgt (x!47325 lt!228750) #b01111111111111111111111111111110) (bvslt lt!228748 #b00000000000000000000000000000000) (bvsge lt!228748 (size!15932 a!3235)) (bvslt (index!18154 lt!228750) #b00000000000000000000000000000000) (bvsge (index!18154 lt!228750) (size!15932 a!3235)) (not (= lt!228750 (Intermediate!3991 false (index!18154 lt!228750) (x!47325 lt!228750))))))))

(assert (=> b!502935 (= (index!18154 lt!228750) i!1204)))

(declare-datatypes ((Unit!15199 0))(
  ( (Unit!15200) )
))
(declare-fun lt!228756 () Unit!15199)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32377 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15199)

(assert (=> b!502935 (= lt!228756 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!228748 #b00000000000000000000000000000000 (index!18154 lt!228750) (x!47325 lt!228750) mask!3524))))

(assert (=> b!502935 (and (or (= (select (arr!15568 a!3235) (index!18154 lt!228750)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15568 a!3235) (index!18154 lt!228750)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15568 a!3235) (index!18154 lt!228750)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15568 a!3235) (index!18154 lt!228750)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!228749 () Unit!15199)

(declare-fun e!294549 () Unit!15199)

(assert (=> b!502935 (= lt!228749 e!294549)))

(declare-fun c!59576 () Bool)

(assert (=> b!502935 (= c!59576 (= (select (arr!15568 a!3235) (index!18154 lt!228750)) (select (arr!15568 a!3235) j!176)))))

(assert (=> b!502935 (and (bvslt (x!47325 lt!228750) #b01111111111111111111111111111110) (or (= (select (arr!15568 a!3235) (index!18154 lt!228750)) (select (arr!15568 a!3235) j!176)) (= (select (arr!15568 a!3235) (index!18154 lt!228750)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15568 a!3235) (index!18154 lt!228750)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!502936 () Bool)

(declare-fun e!294550 () Bool)

(assert (=> b!502936 (= e!294550 false)))

(declare-fun b!502937 () Bool)

(declare-fun res!304349 () Bool)

(assert (=> b!502937 (=> (not res!304349) (not e!294547))))

(declare-datatypes ((List!9633 0))(
  ( (Nil!9630) (Cons!9629 (h!10506 (_ BitVec 64)) (t!15853 List!9633)) )
))
(declare-fun arrayNoDuplicates!0 (array!32377 (_ BitVec 32) List!9633) Bool)

(assert (=> b!502937 (= res!304349 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9630))))

(declare-fun b!502938 () Bool)

(declare-fun res!304346 () Bool)

(assert (=> b!502938 (=> (not res!304346) (not e!294555))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!502938 (= res!304346 (validKeyInArray!0 (select (arr!15568 a!3235) j!176)))))

(declare-fun b!502939 () Bool)

(declare-fun Unit!15201 () Unit!15199)

(assert (=> b!502939 (= e!294549 Unit!15201)))

(declare-fun lt!228753 () Unit!15199)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32377 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15199)

(assert (=> b!502939 (= lt!228753 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!228748 #b00000000000000000000000000000000 (index!18154 lt!228750) (x!47325 lt!228750) mask!3524))))

(declare-fun res!304343 () Bool)

(assert (=> b!502939 (= res!304343 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228748 lt!228754 lt!228755 mask!3524) (Intermediate!3991 false (index!18154 lt!228750) (x!47325 lt!228750))))))

(assert (=> b!502939 (=> (not res!304343) (not e!294550))))

(assert (=> b!502939 e!294550))

(declare-fun e!294552 () Bool)

(declare-fun b!502940 () Bool)

(assert (=> b!502940 (= e!294552 (= (seekEntryOrOpen!0 (select (arr!15568 a!3235) j!176) a!3235 mask!3524) (Found!3991 j!176)))))

(declare-fun b!502941 () Bool)

(declare-fun Unit!15202 () Unit!15199)

(assert (=> b!502941 (= e!294549 Unit!15202)))

(declare-fun b!502942 () Bool)

(assert (=> b!502942 (= e!294547 (not e!294551))))

(declare-fun res!304341 () Bool)

(assert (=> b!502942 (=> res!304341 e!294551)))

(declare-fun lt!228747 () (_ BitVec 32))

(assert (=> b!502942 (= res!304341 (= lt!228750 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228747 lt!228754 lt!228755 mask!3524)))))

(assert (=> b!502942 (= lt!228750 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228748 (select (arr!15568 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!502942 (= lt!228747 (toIndex!0 lt!228754 mask!3524))))

(assert (=> b!502942 (= lt!228754 (select (store (arr!15568 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!502942 (= lt!228748 (toIndex!0 (select (arr!15568 a!3235) j!176) mask!3524))))

(assert (=> b!502942 (= lt!228755 (array!32378 (store (arr!15568 a!3235) i!1204 k0!2280) (size!15932 a!3235)))))

(assert (=> b!502942 e!294552))

(declare-fun res!304337 () Bool)

(assert (=> b!502942 (=> (not res!304337) (not e!294552))))

(assert (=> b!502942 (= res!304337 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!228752 () Unit!15199)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32377 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15199)

(assert (=> b!502942 (= lt!228752 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!502943 () Bool)

(declare-fun res!304338 () Bool)

(assert (=> b!502943 (=> (not res!304338) (not e!294555))))

(declare-fun arrayContainsKey!0 (array!32377 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!502943 (= res!304338 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!502944 () Bool)

(declare-fun res!304342 () Bool)

(assert (=> b!502944 (=> (not res!304342) (not e!294555))))

(assert (=> b!502944 (= res!304342 (validKeyInArray!0 k0!2280))))

(declare-fun b!502945 () Bool)

(declare-fun res!304348 () Bool)

(assert (=> b!502945 (=> res!304348 e!294548)))

(declare-fun e!294554 () Bool)

(assert (=> b!502945 (= res!304348 e!294554)))

(declare-fun res!304340 () Bool)

(assert (=> b!502945 (=> (not res!304340) (not e!294554))))

(assert (=> b!502945 (= res!304340 (bvsgt #b00000000000000000000000000000000 (x!47325 lt!228750)))))

(declare-fun b!502946 () Bool)

(declare-fun res!304339 () Bool)

(assert (=> b!502946 (=> (not res!304339) (not e!294555))))

(assert (=> b!502946 (= res!304339 (and (= (size!15932 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15932 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15932 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!502947 () Bool)

(declare-fun res!304351 () Bool)

(assert (=> b!502947 (=> res!304351 e!294551)))

(get-info :version)

(assert (=> b!502947 (= res!304351 (or (undefined!4803 lt!228750) (not ((_ is Intermediate!3991) lt!228750))))))

(declare-fun b!502948 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32377 (_ BitVec 32)) SeekEntryResult!3991)

(assert (=> b!502948 (= e!294554 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!228748 (index!18154 lt!228750) (select (arr!15568 a!3235) j!176) a!3235 mask!3524) (Found!3991 j!176))))))

(assert (= (and start!45620 res!304350) b!502946))

(assert (= (and b!502946 res!304339) b!502938))

(assert (= (and b!502938 res!304346) b!502944))

(assert (= (and b!502944 res!304342) b!502943))

(assert (= (and b!502943 res!304338) b!502932))

(assert (= (and b!502932 res!304344) b!502933))

(assert (= (and b!502933 res!304347) b!502937))

(assert (= (and b!502937 res!304349) b!502942))

(assert (= (and b!502942 res!304337) b!502940))

(assert (= (and b!502942 (not res!304341)) b!502947))

(assert (= (and b!502947 (not res!304351)) b!502935))

(assert (= (and b!502935 c!59576) b!502939))

(assert (= (and b!502935 (not c!59576)) b!502941))

(assert (= (and b!502939 res!304343) b!502936))

(assert (= (and b!502935 (not res!304345)) b!502945))

(assert (= (and b!502945 res!304340) b!502948))

(assert (= (and b!502945 (not res!304348)) b!502934))

(declare-fun m!484057 () Bool)

(assert (=> b!502944 m!484057))

(declare-fun m!484059 () Bool)

(assert (=> start!45620 m!484059))

(declare-fun m!484061 () Bool)

(assert (=> start!45620 m!484061))

(declare-fun m!484063 () Bool)

(assert (=> b!502935 m!484063))

(declare-fun m!484065 () Bool)

(assert (=> b!502935 m!484065))

(declare-fun m!484067 () Bool)

(assert (=> b!502935 m!484067))

(declare-fun m!484069 () Bool)

(assert (=> b!502934 m!484069))

(assert (=> b!502948 m!484067))

(assert (=> b!502948 m!484067))

(declare-fun m!484071 () Bool)

(assert (=> b!502948 m!484071))

(declare-fun m!484073 () Bool)

(assert (=> b!502933 m!484073))

(assert (=> b!502938 m!484067))

(assert (=> b!502938 m!484067))

(declare-fun m!484075 () Bool)

(assert (=> b!502938 m!484075))

(declare-fun m!484077 () Bool)

(assert (=> b!502932 m!484077))

(declare-fun m!484079 () Bool)

(assert (=> b!502943 m!484079))

(declare-fun m!484081 () Bool)

(assert (=> b!502937 m!484081))

(assert (=> b!502940 m!484067))

(assert (=> b!502940 m!484067))

(declare-fun m!484083 () Bool)

(assert (=> b!502940 m!484083))

(declare-fun m!484085 () Bool)

(assert (=> b!502939 m!484085))

(assert (=> b!502939 m!484069))

(declare-fun m!484087 () Bool)

(assert (=> b!502942 m!484087))

(declare-fun m!484089 () Bool)

(assert (=> b!502942 m!484089))

(declare-fun m!484091 () Bool)

(assert (=> b!502942 m!484091))

(declare-fun m!484093 () Bool)

(assert (=> b!502942 m!484093))

(assert (=> b!502942 m!484067))

(declare-fun m!484095 () Bool)

(assert (=> b!502942 m!484095))

(declare-fun m!484097 () Bool)

(assert (=> b!502942 m!484097))

(assert (=> b!502942 m!484067))

(declare-fun m!484099 () Bool)

(assert (=> b!502942 m!484099))

(assert (=> b!502942 m!484067))

(declare-fun m!484101 () Bool)

(assert (=> b!502942 m!484101))

(check-sat (not b!502948) (not b!502944) (not b!502940) (not b!502943) (not start!45620) (not b!502934) (not b!502933) (not b!502938) (not b!502935) (not b!502939) (not b!502942) (not b!502932) (not b!502937))
(check-sat)
