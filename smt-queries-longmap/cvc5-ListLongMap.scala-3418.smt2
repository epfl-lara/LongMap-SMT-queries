; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47430 () Bool)

(assert start!47430)

(declare-fun b!521999 () Bool)

(declare-fun res!319722 () Bool)

(declare-fun e!304495 () Bool)

(assert (=> b!521999 (=> (not res!319722) (not e!304495))))

(declare-datatypes ((array!33256 0))(
  ( (array!33257 (arr!15984 (Array (_ BitVec 32) (_ BitVec 64))) (size!16348 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33256)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!521999 (= res!319722 (validKeyInArray!0 (select (arr!15984 a!3235) j!176)))))

(declare-fun b!522000 () Bool)

(declare-datatypes ((Unit!16256 0))(
  ( (Unit!16257) )
))
(declare-fun e!304494 () Unit!16256)

(declare-fun Unit!16258 () Unit!16256)

(assert (=> b!522000 (= e!304494 Unit!16258)))

(declare-fun b!522001 () Bool)

(declare-fun res!319721 () Bool)

(assert (=> b!522001 (=> (not res!319721) (not e!304495))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!522001 (= res!319721 (and (= (size!16348 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16348 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16348 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!522002 () Bool)

(declare-fun e!304498 () Bool)

(declare-fun e!304499 () Bool)

(assert (=> b!522002 (= e!304498 (not e!304499))))

(declare-fun res!319724 () Bool)

(assert (=> b!522002 (=> res!319724 e!304499)))

(declare-fun lt!239326 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!4451 0))(
  ( (MissingZero!4451 (index!20007 (_ BitVec 32))) (Found!4451 (index!20008 (_ BitVec 32))) (Intermediate!4451 (undefined!5263 Bool) (index!20009 (_ BitVec 32)) (x!48989 (_ BitVec 32))) (Undefined!4451) (MissingVacant!4451 (index!20010 (_ BitVec 32))) )
))
(declare-fun lt!239323 () SeekEntryResult!4451)

(declare-fun lt!239322 () array!33256)

(declare-fun lt!239321 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33256 (_ BitVec 32)) SeekEntryResult!4451)

(assert (=> b!522002 (= res!319724 (= lt!239323 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239321 lt!239326 lt!239322 mask!3524)))))

(declare-fun lt!239318 () (_ BitVec 32))

(assert (=> b!522002 (= lt!239323 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239318 (select (arr!15984 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!522002 (= lt!239321 (toIndex!0 lt!239326 mask!3524))))

(declare-fun k!2280 () (_ BitVec 64))

(assert (=> b!522002 (= lt!239326 (select (store (arr!15984 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!522002 (= lt!239318 (toIndex!0 (select (arr!15984 a!3235) j!176) mask!3524))))

(assert (=> b!522002 (= lt!239322 (array!33257 (store (arr!15984 a!3235) i!1204 k!2280) (size!16348 a!3235)))))

(declare-fun e!304497 () Bool)

(assert (=> b!522002 e!304497))

(declare-fun res!319720 () Bool)

(assert (=> b!522002 (=> (not res!319720) (not e!304497))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33256 (_ BitVec 32)) Bool)

(assert (=> b!522002 (= res!319720 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!239320 () Unit!16256)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33256 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16256)

(assert (=> b!522002 (= lt!239320 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!522003 () Bool)

(assert (=> b!522003 (= e!304495 e!304498)))

(declare-fun res!319718 () Bool)

(assert (=> b!522003 (=> (not res!319718) (not e!304498))))

(declare-fun lt!239325 () SeekEntryResult!4451)

(assert (=> b!522003 (= res!319718 (or (= lt!239325 (MissingZero!4451 i!1204)) (= lt!239325 (MissingVacant!4451 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33256 (_ BitVec 32)) SeekEntryResult!4451)

(assert (=> b!522003 (= lt!239325 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!522004 () Bool)

(declare-fun res!319727 () Bool)

(assert (=> b!522004 (=> (not res!319727) (not e!304495))))

(assert (=> b!522004 (= res!319727 (validKeyInArray!0 k!2280))))

(declare-fun b!522005 () Bool)

(declare-fun res!319719 () Bool)

(assert (=> b!522005 (=> (not res!319719) (not e!304495))))

(declare-fun arrayContainsKey!0 (array!33256 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!522005 (= res!319719 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!522006 () Bool)

(assert (=> b!522006 (= e!304497 (= (seekEntryOrOpen!0 (select (arr!15984 a!3235) j!176) a!3235 mask!3524) (Found!4451 j!176)))))

(declare-fun b!522007 () Bool)

(declare-fun res!319716 () Bool)

(assert (=> b!522007 (=> (not res!319716) (not e!304498))))

(assert (=> b!522007 (= res!319716 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!522008 () Bool)

(declare-fun res!319725 () Bool)

(assert (=> b!522008 (=> (not res!319725) (not e!304498))))

(declare-datatypes ((List!10142 0))(
  ( (Nil!10139) (Cons!10138 (h!11060 (_ BitVec 64)) (t!16370 List!10142)) )
))
(declare-fun arrayNoDuplicates!0 (array!33256 (_ BitVec 32) List!10142) Bool)

(assert (=> b!522008 (= res!319725 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10139))))

(declare-fun b!522009 () Bool)

(declare-fun res!319723 () Bool)

(assert (=> b!522009 (=> res!319723 e!304499)))

(assert (=> b!522009 (= res!319723 (or (undefined!5263 lt!239323) (not (is-Intermediate!4451 lt!239323))))))

(declare-fun res!319726 () Bool)

(assert (=> start!47430 (=> (not res!319726) (not e!304495))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47430 (= res!319726 (validMask!0 mask!3524))))

(assert (=> start!47430 e!304495))

(assert (=> start!47430 true))

(declare-fun array_inv!11780 (array!33256) Bool)

(assert (=> start!47430 (array_inv!11780 a!3235)))

(declare-fun b!521998 () Bool)

(declare-fun Unit!16259 () Unit!16256)

(assert (=> b!521998 (= e!304494 Unit!16259)))

(declare-fun lt!239319 () Unit!16256)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33256 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16256)

(assert (=> b!521998 (= lt!239319 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!239318 #b00000000000000000000000000000000 (index!20009 lt!239323) (x!48989 lt!239323) mask!3524))))

(declare-fun res!319717 () Bool)

(assert (=> b!521998 (= res!319717 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239318 lt!239326 lt!239322 mask!3524) (Intermediate!4451 false (index!20009 lt!239323) (x!48989 lt!239323))))))

(declare-fun e!304500 () Bool)

(assert (=> b!521998 (=> (not res!319717) (not e!304500))))

(assert (=> b!521998 e!304500))

(declare-fun b!522010 () Bool)

(assert (=> b!522010 (= e!304500 false)))

(declare-fun b!522011 () Bool)

(assert (=> b!522011 (= e!304499 true)))

(assert (=> b!522011 (and (or (= (select (arr!15984 a!3235) (index!20009 lt!239323)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15984 a!3235) (index!20009 lt!239323)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15984 a!3235) (index!20009 lt!239323)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15984 a!3235) (index!20009 lt!239323)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!239324 () Unit!16256)

(assert (=> b!522011 (= lt!239324 e!304494)))

(declare-fun c!61442 () Bool)

(assert (=> b!522011 (= c!61442 (= (select (arr!15984 a!3235) (index!20009 lt!239323)) (select (arr!15984 a!3235) j!176)))))

(assert (=> b!522011 (and (bvslt (x!48989 lt!239323) #b01111111111111111111111111111110) (or (= (select (arr!15984 a!3235) (index!20009 lt!239323)) (select (arr!15984 a!3235) j!176)) (= (select (arr!15984 a!3235) (index!20009 lt!239323)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15984 a!3235) (index!20009 lt!239323)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!47430 res!319726) b!522001))

(assert (= (and b!522001 res!319721) b!521999))

(assert (= (and b!521999 res!319722) b!522004))

(assert (= (and b!522004 res!319727) b!522005))

(assert (= (and b!522005 res!319719) b!522003))

(assert (= (and b!522003 res!319718) b!522007))

(assert (= (and b!522007 res!319716) b!522008))

(assert (= (and b!522008 res!319725) b!522002))

(assert (= (and b!522002 res!319720) b!522006))

(assert (= (and b!522002 (not res!319724)) b!522009))

(assert (= (and b!522009 (not res!319723)) b!522011))

(assert (= (and b!522011 c!61442) b!521998))

(assert (= (and b!522011 (not c!61442)) b!522000))

(assert (= (and b!521998 res!319717) b!522010))

(declare-fun m!502911 () Bool)

(assert (=> b!522011 m!502911))

(declare-fun m!502913 () Bool)

(assert (=> b!522011 m!502913))

(assert (=> b!522006 m!502913))

(assert (=> b!522006 m!502913))

(declare-fun m!502915 () Bool)

(assert (=> b!522006 m!502915))

(declare-fun m!502917 () Bool)

(assert (=> b!521998 m!502917))

(declare-fun m!502919 () Bool)

(assert (=> b!521998 m!502919))

(declare-fun m!502921 () Bool)

(assert (=> b!522005 m!502921))

(declare-fun m!502923 () Bool)

(assert (=> b!522007 m!502923))

(declare-fun m!502925 () Bool)

(assert (=> b!522002 m!502925))

(declare-fun m!502927 () Bool)

(assert (=> b!522002 m!502927))

(declare-fun m!502929 () Bool)

(assert (=> b!522002 m!502929))

(assert (=> b!522002 m!502913))

(declare-fun m!502931 () Bool)

(assert (=> b!522002 m!502931))

(declare-fun m!502933 () Bool)

(assert (=> b!522002 m!502933))

(declare-fun m!502935 () Bool)

(assert (=> b!522002 m!502935))

(assert (=> b!522002 m!502913))

(declare-fun m!502937 () Bool)

(assert (=> b!522002 m!502937))

(assert (=> b!522002 m!502913))

(declare-fun m!502939 () Bool)

(assert (=> b!522002 m!502939))

(declare-fun m!502941 () Bool)

(assert (=> b!522008 m!502941))

(assert (=> b!521999 m!502913))

(assert (=> b!521999 m!502913))

(declare-fun m!502943 () Bool)

(assert (=> b!521999 m!502943))

(declare-fun m!502945 () Bool)

(assert (=> start!47430 m!502945))

(declare-fun m!502947 () Bool)

(assert (=> start!47430 m!502947))

(declare-fun m!502949 () Bool)

(assert (=> b!522003 m!502949))

(declare-fun m!502951 () Bool)

(assert (=> b!522004 m!502951))

(push 1)

