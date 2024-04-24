; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64566 () Bool)

(assert start!64566)

(declare-fun b!726257 () Bool)

(declare-fun res!487153 () Bool)

(declare-fun e!406712 () Bool)

(assert (=> b!726257 (=> (not res!487153) (not e!406712))))

(declare-datatypes ((array!41017 0))(
  ( (array!41018 (arr!19627 (Array (_ BitVec 32) (_ BitVec 64))) (size!20047 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41017)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41017 (_ BitVec 32)) Bool)

(assert (=> b!726257 (= res!487153 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!726258 () Bool)

(declare-fun res!487158 () Bool)

(declare-fun e!406709 () Bool)

(assert (=> b!726258 (=> (not res!487158) (not e!406709))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!726258 (= res!487158 (validKeyInArray!0 k0!2102))))

(declare-fun b!726259 () Bool)

(declare-fun e!406713 () Bool)

(assert (=> b!726259 (= e!406712 e!406713)))

(declare-fun res!487154 () Bool)

(assert (=> b!726259 (=> (not res!487154) (not e!406713))))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7183 0))(
  ( (MissingZero!7183 (index!31100 (_ BitVec 32))) (Found!7183 (index!31101 (_ BitVec 32))) (Intermediate!7183 (undefined!7995 Bool) (index!31102 (_ BitVec 32)) (x!62244 (_ BitVec 32))) (Undefined!7183) (MissingVacant!7183 (index!31103 (_ BitVec 32))) )
))
(declare-fun lt!321647 () SeekEntryResult!7183)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41017 (_ BitVec 32)) SeekEntryResult!7183)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!726259 (= res!487154 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19627 a!3186) j!159) mask!3328) (select (arr!19627 a!3186) j!159) a!3186 mask!3328) lt!321647))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!726259 (= lt!321647 (Intermediate!7183 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun res!487156 () Bool)

(assert (=> start!64566 (=> (not res!487156) (not e!406709))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64566 (= res!487156 (validMask!0 mask!3328))))

(assert (=> start!64566 e!406709))

(assert (=> start!64566 true))

(declare-fun array_inv!15486 (array!41017) Bool)

(assert (=> start!64566 (array_inv!15486 a!3186)))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!406715 () Bool)

(declare-fun b!726260 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41017 (_ BitVec 32)) SeekEntryResult!7183)

(assert (=> b!726260 (= e!406715 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19627 a!3186) j!159) a!3186 mask!3328) (Found!7183 j!159)))))

(declare-fun b!726261 () Bool)

(declare-fun e!406711 () Bool)

(declare-fun lt!321651 () (_ BitVec 64))

(assert (=> b!726261 (= e!406711 (validKeyInArray!0 lt!321651))))

(declare-fun b!726262 () Bool)

(declare-fun res!487163 () Bool)

(assert (=> b!726262 (=> (not res!487163) (not e!406709))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!726262 (= res!487163 (and (= (size!20047 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20047 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20047 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!726263 () Bool)

(declare-fun e!406716 () Bool)

(assert (=> b!726263 (= e!406713 e!406716)))

(declare-fun res!487152 () Bool)

(assert (=> b!726263 (=> (not res!487152) (not e!406716))))

(declare-fun lt!321650 () array!41017)

(assert (=> b!726263 (= res!487152 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!321651 mask!3328) lt!321651 lt!321650 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!321651 lt!321650 mask!3328)))))

(assert (=> b!726263 (= lt!321651 (select (store (arr!19627 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!726263 (= lt!321650 (array!41018 (store (arr!19627 a!3186) i!1173 k0!2102) (size!20047 a!3186)))))

(declare-fun b!726264 () Bool)

(assert (=> b!726264 (= e!406716 (not e!406711))))

(declare-fun res!487157 () Bool)

(assert (=> b!726264 (=> res!487157 e!406711)))

(assert (=> b!726264 (= res!487157 (or (bvslt mask!3328 #b00000000000000000000000000000000) (bvsge index!1321 (bvadd #b00000000000000000000000000000001 mask!3328))))))

(declare-fun e!406710 () Bool)

(assert (=> b!726264 e!406710))

(declare-fun res!487161 () Bool)

(assert (=> b!726264 (=> (not res!487161) (not e!406710))))

(assert (=> b!726264 (= res!487161 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24763 0))(
  ( (Unit!24764) )
))
(declare-fun lt!321649 () Unit!24763)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41017 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24763)

(assert (=> b!726264 (= lt!321649 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!726265 () Bool)

(declare-fun res!487150 () Bool)

(assert (=> b!726265 (=> (not res!487150) (not e!406713))))

(assert (=> b!726265 (= res!487150 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19627 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!726266 () Bool)

(assert (=> b!726266 (= e!406709 e!406712)))

(declare-fun res!487160 () Bool)

(assert (=> b!726266 (=> (not res!487160) (not e!406712))))

(declare-fun lt!321646 () SeekEntryResult!7183)

(assert (=> b!726266 (= res!487160 (or (= lt!321646 (MissingZero!7183 i!1173)) (= lt!321646 (MissingVacant!7183 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41017 (_ BitVec 32)) SeekEntryResult!7183)

(assert (=> b!726266 (= lt!321646 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!726267 () Bool)

(declare-fun res!487162 () Bool)

(assert (=> b!726267 (=> (not res!487162) (not e!406713))))

(assert (=> b!726267 (= res!487162 e!406715)))

(declare-fun c!79928 () Bool)

(assert (=> b!726267 (= c!79928 (bvsle x!1131 resIntermediateX!5))))

(declare-fun lt!321648 () SeekEntryResult!7183)

(declare-fun b!726268 () Bool)

(declare-fun e!406714 () Bool)

(assert (=> b!726268 (= e!406714 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19627 a!3186) j!159) a!3186 mask!3328) lt!321648))))

(declare-fun b!726269 () Bool)

(declare-fun res!487151 () Bool)

(assert (=> b!726269 (=> (not res!487151) (not e!406709))))

(declare-fun arrayContainsKey!0 (array!41017 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!726269 (= res!487151 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!726270 () Bool)

(assert (=> b!726270 (= e!406715 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19627 a!3186) j!159) a!3186 mask!3328) lt!321647))))

(declare-fun b!726271 () Bool)

(declare-fun res!487159 () Bool)

(assert (=> b!726271 (=> (not res!487159) (not e!406712))))

(declare-datatypes ((List!13536 0))(
  ( (Nil!13533) (Cons!13532 (h!14592 (_ BitVec 64)) (t!19843 List!13536)) )
))
(declare-fun arrayNoDuplicates!0 (array!41017 (_ BitVec 32) List!13536) Bool)

(assert (=> b!726271 (= res!487159 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13533))))

(declare-fun b!726272 () Bool)

(declare-fun res!487165 () Bool)

(assert (=> b!726272 (=> (not res!487165) (not e!406709))))

(assert (=> b!726272 (= res!487165 (validKeyInArray!0 (select (arr!19627 a!3186) j!159)))))

(declare-fun b!726273 () Bool)

(assert (=> b!726273 (= e!406710 e!406714)))

(declare-fun res!487155 () Bool)

(assert (=> b!726273 (=> (not res!487155) (not e!406714))))

(assert (=> b!726273 (= res!487155 (= (seekEntryOrOpen!0 (select (arr!19627 a!3186) j!159) a!3186 mask!3328) lt!321648))))

(assert (=> b!726273 (= lt!321648 (Found!7183 j!159))))

(declare-fun b!726274 () Bool)

(declare-fun res!487164 () Bool)

(assert (=> b!726274 (=> (not res!487164) (not e!406712))))

(assert (=> b!726274 (= res!487164 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20047 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20047 a!3186))))))

(assert (= (and start!64566 res!487156) b!726262))

(assert (= (and b!726262 res!487163) b!726272))

(assert (= (and b!726272 res!487165) b!726258))

(assert (= (and b!726258 res!487158) b!726269))

(assert (= (and b!726269 res!487151) b!726266))

(assert (= (and b!726266 res!487160) b!726257))

(assert (= (and b!726257 res!487153) b!726271))

(assert (= (and b!726271 res!487159) b!726274))

(assert (= (and b!726274 res!487164) b!726259))

(assert (= (and b!726259 res!487154) b!726265))

(assert (= (and b!726265 res!487150) b!726267))

(assert (= (and b!726267 c!79928) b!726270))

(assert (= (and b!726267 (not c!79928)) b!726260))

(assert (= (and b!726267 res!487162) b!726263))

(assert (= (and b!726263 res!487152) b!726264))

(assert (= (and b!726264 res!487161) b!726273))

(assert (= (and b!726273 res!487155) b!726268))

(assert (= (and b!726264 (not res!487157)) b!726261))

(declare-fun m!680889 () Bool)

(assert (=> b!726260 m!680889))

(assert (=> b!726260 m!680889))

(declare-fun m!680891 () Bool)

(assert (=> b!726260 m!680891))

(declare-fun m!680893 () Bool)

(assert (=> b!726264 m!680893))

(declare-fun m!680895 () Bool)

(assert (=> b!726264 m!680895))

(declare-fun m!680897 () Bool)

(assert (=> b!726271 m!680897))

(declare-fun m!680899 () Bool)

(assert (=> start!64566 m!680899))

(declare-fun m!680901 () Bool)

(assert (=> start!64566 m!680901))

(declare-fun m!680903 () Bool)

(assert (=> b!726269 m!680903))

(assert (=> b!726273 m!680889))

(assert (=> b!726273 m!680889))

(declare-fun m!680905 () Bool)

(assert (=> b!726273 m!680905))

(declare-fun m!680907 () Bool)

(assert (=> b!726257 m!680907))

(assert (=> b!726272 m!680889))

(assert (=> b!726272 m!680889))

(declare-fun m!680909 () Bool)

(assert (=> b!726272 m!680909))

(declare-fun m!680911 () Bool)

(assert (=> b!726261 m!680911))

(declare-fun m!680913 () Bool)

(assert (=> b!726263 m!680913))

(declare-fun m!680915 () Bool)

(assert (=> b!726263 m!680915))

(declare-fun m!680917 () Bool)

(assert (=> b!726263 m!680917))

(declare-fun m!680919 () Bool)

(assert (=> b!726263 m!680919))

(declare-fun m!680921 () Bool)

(assert (=> b!726263 m!680921))

(assert (=> b!726263 m!680913))

(declare-fun m!680923 () Bool)

(assert (=> b!726258 m!680923))

(assert (=> b!726268 m!680889))

(assert (=> b!726268 m!680889))

(declare-fun m!680925 () Bool)

(assert (=> b!726268 m!680925))

(declare-fun m!680927 () Bool)

(assert (=> b!726265 m!680927))

(declare-fun m!680929 () Bool)

(assert (=> b!726266 m!680929))

(assert (=> b!726270 m!680889))

(assert (=> b!726270 m!680889))

(declare-fun m!680931 () Bool)

(assert (=> b!726270 m!680931))

(assert (=> b!726259 m!680889))

(assert (=> b!726259 m!680889))

(declare-fun m!680933 () Bool)

(assert (=> b!726259 m!680933))

(assert (=> b!726259 m!680933))

(assert (=> b!726259 m!680889))

(declare-fun m!680935 () Bool)

(assert (=> b!726259 m!680935))

(check-sat (not b!726260) (not b!726261) (not b!726273) (not b!726266) (not b!726272) (not b!726264) (not b!726258) (not b!726257) (not b!726269) (not start!64566) (not b!726268) (not b!726271) (not b!726259) (not b!726270) (not b!726263))
(check-sat)
