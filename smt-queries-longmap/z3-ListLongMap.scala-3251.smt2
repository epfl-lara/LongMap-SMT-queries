; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45368 () Bool)

(assert start!45368)

(declare-fun b!498407 () Bool)

(declare-fun res!300562 () Bool)

(declare-fun e!292114 () Bool)

(assert (=> b!498407 (=> (not res!300562) (not e!292114))))

(declare-datatypes ((array!32194 0))(
  ( (array!32195 (arr!15478 (Array (_ BitVec 32) (_ BitVec 64))) (size!15842 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32194)

(declare-datatypes ((List!9543 0))(
  ( (Nil!9540) (Cons!9539 (h!10413 (_ BitVec 64)) (t!15763 List!9543)) )
))
(declare-fun arrayNoDuplicates!0 (array!32194 (_ BitVec 32) List!9543) Bool)

(assert (=> b!498407 (= res!300562 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9540))))

(declare-fun b!498408 () Bool)

(declare-fun res!300561 () Bool)

(declare-fun e!292113 () Bool)

(assert (=> b!498408 (=> (not res!300561) (not e!292113))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!498408 (= res!300561 (and (= (size!15842 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15842 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15842 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!498410 () Bool)

(declare-fun res!300557 () Bool)

(assert (=> b!498410 (=> (not res!300557) (not e!292114))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32194 (_ BitVec 32)) Bool)

(assert (=> b!498410 (= res!300557 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!498411 () Bool)

(declare-datatypes ((Unit!14839 0))(
  ( (Unit!14840) )
))
(declare-fun e!292115 () Unit!14839)

(declare-fun Unit!14841 () Unit!14839)

(assert (=> b!498411 (= e!292115 Unit!14841)))

(declare-fun b!498412 () Bool)

(declare-fun e!292119 () Bool)

(declare-datatypes ((SeekEntryResult!3901 0))(
  ( (MissingZero!3901 (index!17786 (_ BitVec 32))) (Found!3901 (index!17787 (_ BitVec 32))) (Intermediate!3901 (undefined!4713 Bool) (index!17788 (_ BitVec 32)) (x!46983 (_ BitVec 32))) (Undefined!3901) (MissingVacant!3901 (index!17789 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32194 (_ BitVec 32)) SeekEntryResult!3901)

(assert (=> b!498412 (= e!292119 (= (seekEntryOrOpen!0 (select (arr!15478 a!3235) j!176) a!3235 mask!3524) (Found!3901 j!176)))))

(declare-fun b!498413 () Bool)

(declare-fun Unit!14842 () Unit!14839)

(assert (=> b!498413 (= e!292115 Unit!14842)))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun lt!225815 () SeekEntryResult!3901)

(declare-fun lt!225819 () Unit!14839)

(declare-fun lt!225812 () (_ BitVec 32))

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32194 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14839)

(assert (=> b!498413 (= lt!225819 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!225812 #b00000000000000000000000000000000 (index!17788 lt!225815) (x!46983 lt!225815) mask!3524))))

(declare-fun lt!225813 () (_ BitVec 64))

(declare-fun lt!225811 () array!32194)

(declare-fun res!300560 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32194 (_ BitVec 32)) SeekEntryResult!3901)

(assert (=> b!498413 (= res!300560 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225812 lt!225813 lt!225811 mask!3524) (Intermediate!3901 false (index!17788 lt!225815) (x!46983 lt!225815))))))

(declare-fun e!292117 () Bool)

(assert (=> b!498413 (=> (not res!300560) (not e!292117))))

(assert (=> b!498413 e!292117))

(declare-fun b!498414 () Bool)

(declare-fun e!292112 () Bool)

(assert (=> b!498414 (= e!292114 (not e!292112))))

(declare-fun res!300559 () Bool)

(assert (=> b!498414 (=> res!300559 e!292112)))

(declare-fun lt!225814 () (_ BitVec 32))

(assert (=> b!498414 (= res!300559 (= lt!225815 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225814 lt!225813 lt!225811 mask!3524)))))

(assert (=> b!498414 (= lt!225815 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225812 (select (arr!15478 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!498414 (= lt!225814 (toIndex!0 lt!225813 mask!3524))))

(assert (=> b!498414 (= lt!225813 (select (store (arr!15478 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!498414 (= lt!225812 (toIndex!0 (select (arr!15478 a!3235) j!176) mask!3524))))

(assert (=> b!498414 (= lt!225811 (array!32195 (store (arr!15478 a!3235) i!1204 k0!2280) (size!15842 a!3235)))))

(assert (=> b!498414 e!292119))

(declare-fun res!300563 () Bool)

(assert (=> b!498414 (=> (not res!300563) (not e!292119))))

(assert (=> b!498414 (= res!300563 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!225818 () Unit!14839)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32194 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14839)

(assert (=> b!498414 (= lt!225818 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!498415 () Bool)

(declare-fun res!300564 () Bool)

(assert (=> b!498415 (=> (not res!300564) (not e!292113))))

(declare-fun arrayContainsKey!0 (array!32194 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!498415 (= res!300564 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun res!300554 () Bool)

(assert (=> start!45368 (=> (not res!300554) (not e!292113))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45368 (= res!300554 (validMask!0 mask!3524))))

(assert (=> start!45368 e!292113))

(assert (=> start!45368 true))

(declare-fun array_inv!11337 (array!32194) Bool)

(assert (=> start!45368 (array_inv!11337 a!3235)))

(declare-fun b!498409 () Bool)

(declare-fun e!292116 () Bool)

(assert (=> b!498409 (= e!292112 e!292116)))

(declare-fun res!300555 () Bool)

(assert (=> b!498409 (=> res!300555 e!292116)))

(assert (=> b!498409 (= res!300555 (or (bvsgt #b00000000000000000000000000000000 (x!46983 lt!225815)) (bvsgt (x!46983 lt!225815) #b01111111111111111111111111111110) (bvslt lt!225812 #b00000000000000000000000000000000) (bvsge lt!225812 (size!15842 a!3235)) (bvslt (index!17788 lt!225815) #b00000000000000000000000000000000) (bvsge (index!17788 lt!225815) (size!15842 a!3235)) (not (= lt!225815 (Intermediate!3901 false (index!17788 lt!225815) (x!46983 lt!225815))))))))

(assert (=> b!498409 (and (or (= (select (arr!15478 a!3235) (index!17788 lt!225815)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15478 a!3235) (index!17788 lt!225815)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15478 a!3235) (index!17788 lt!225815)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15478 a!3235) (index!17788 lt!225815)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!225817 () Unit!14839)

(assert (=> b!498409 (= lt!225817 e!292115)))

(declare-fun c!59204 () Bool)

(assert (=> b!498409 (= c!59204 (= (select (arr!15478 a!3235) (index!17788 lt!225815)) (select (arr!15478 a!3235) j!176)))))

(assert (=> b!498409 (and (bvslt (x!46983 lt!225815) #b01111111111111111111111111111110) (or (= (select (arr!15478 a!3235) (index!17788 lt!225815)) (select (arr!15478 a!3235) j!176)) (= (select (arr!15478 a!3235) (index!17788 lt!225815)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15478 a!3235) (index!17788 lt!225815)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!498416 () Bool)

(declare-fun res!300556 () Bool)

(assert (=> b!498416 (=> (not res!300556) (not e!292113))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!498416 (= res!300556 (validKeyInArray!0 (select (arr!15478 a!3235) j!176)))))

(declare-fun b!498417 () Bool)

(assert (=> b!498417 (= e!292117 false)))

(declare-fun b!498418 () Bool)

(declare-fun res!300553 () Bool)

(assert (=> b!498418 (=> (not res!300553) (not e!292113))))

(assert (=> b!498418 (= res!300553 (validKeyInArray!0 k0!2280))))

(declare-fun b!498419 () Bool)

(declare-fun res!300558 () Bool)

(assert (=> b!498419 (=> res!300558 e!292112)))

(get-info :version)

(assert (=> b!498419 (= res!300558 (or (undefined!4713 lt!225815) (not ((_ is Intermediate!3901) lt!225815))))))

(declare-fun b!498420 () Bool)

(assert (=> b!498420 (= e!292113 e!292114)))

(declare-fun res!300565 () Bool)

(assert (=> b!498420 (=> (not res!300565) (not e!292114))))

(declare-fun lt!225816 () SeekEntryResult!3901)

(assert (=> b!498420 (= res!300565 (or (= lt!225816 (MissingZero!3901 i!1204)) (= lt!225816 (MissingVacant!3901 i!1204))))))

(assert (=> b!498420 (= lt!225816 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!498421 () Bool)

(assert (=> b!498421 (= e!292116 true)))

(declare-fun lt!225820 () SeekEntryResult!3901)

(assert (=> b!498421 (= lt!225820 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225812 lt!225813 lt!225811 mask!3524))))

(assert (= (and start!45368 res!300554) b!498408))

(assert (= (and b!498408 res!300561) b!498416))

(assert (= (and b!498416 res!300556) b!498418))

(assert (= (and b!498418 res!300553) b!498415))

(assert (= (and b!498415 res!300564) b!498420))

(assert (= (and b!498420 res!300565) b!498410))

(assert (= (and b!498410 res!300557) b!498407))

(assert (= (and b!498407 res!300562) b!498414))

(assert (= (and b!498414 res!300563) b!498412))

(assert (= (and b!498414 (not res!300559)) b!498419))

(assert (= (and b!498419 (not res!300558)) b!498409))

(assert (= (and b!498409 c!59204) b!498413))

(assert (= (and b!498409 (not c!59204)) b!498411))

(assert (= (and b!498413 res!300560) b!498417))

(assert (= (and b!498409 (not res!300555)) b!498421))

(declare-fun m!479917 () Bool)

(assert (=> b!498412 m!479917))

(assert (=> b!498412 m!479917))

(declare-fun m!479919 () Bool)

(assert (=> b!498412 m!479919))

(declare-fun m!479921 () Bool)

(assert (=> b!498420 m!479921))

(declare-fun m!479923 () Bool)

(assert (=> b!498418 m!479923))

(declare-fun m!479925 () Bool)

(assert (=> b!498407 m!479925))

(assert (=> b!498416 m!479917))

(assert (=> b!498416 m!479917))

(declare-fun m!479927 () Bool)

(assert (=> b!498416 m!479927))

(declare-fun m!479929 () Bool)

(assert (=> start!45368 m!479929))

(declare-fun m!479931 () Bool)

(assert (=> start!45368 m!479931))

(declare-fun m!479933 () Bool)

(assert (=> b!498421 m!479933))

(declare-fun m!479935 () Bool)

(assert (=> b!498413 m!479935))

(assert (=> b!498413 m!479933))

(declare-fun m!479937 () Bool)

(assert (=> b!498414 m!479937))

(declare-fun m!479939 () Bool)

(assert (=> b!498414 m!479939))

(declare-fun m!479941 () Bool)

(assert (=> b!498414 m!479941))

(assert (=> b!498414 m!479917))

(declare-fun m!479943 () Bool)

(assert (=> b!498414 m!479943))

(assert (=> b!498414 m!479917))

(declare-fun m!479945 () Bool)

(assert (=> b!498414 m!479945))

(assert (=> b!498414 m!479917))

(declare-fun m!479947 () Bool)

(assert (=> b!498414 m!479947))

(declare-fun m!479949 () Bool)

(assert (=> b!498414 m!479949))

(declare-fun m!479951 () Bool)

(assert (=> b!498414 m!479951))

(declare-fun m!479953 () Bool)

(assert (=> b!498410 m!479953))

(declare-fun m!479955 () Bool)

(assert (=> b!498415 m!479955))

(declare-fun m!479957 () Bool)

(assert (=> b!498409 m!479957))

(assert (=> b!498409 m!479917))

(check-sat (not b!498418) (not b!498414) (not b!498407) (not start!45368) (not b!498420) (not b!498412) (not b!498410) (not b!498421) (not b!498416) (not b!498415) (not b!498413))
(check-sat)
