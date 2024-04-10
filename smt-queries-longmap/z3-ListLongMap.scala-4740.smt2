; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65502 () Bool)

(assert start!65502)

(declare-fun b!747028 () Bool)

(declare-fun res!503726 () Bool)

(declare-fun e!417137 () Bool)

(assert (=> b!747028 (=> (not res!503726) (not e!417137))))

(declare-datatypes ((array!41675 0))(
  ( (array!41676 (arr!19951 (Array (_ BitVec 32) (_ BitVec 64))) (size!20372 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41675)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!747028 (= res!503726 (validKeyInArray!0 (select (arr!19951 a!3186) j!159)))))

(declare-fun b!747029 () Bool)

(declare-fun e!417131 () Bool)

(assert (=> b!747029 (= e!417137 e!417131)))

(declare-fun res!503733 () Bool)

(assert (=> b!747029 (=> (not res!503733) (not e!417131))))

(declare-datatypes ((SeekEntryResult!7551 0))(
  ( (MissingZero!7551 (index!32572 (_ BitVec 32))) (Found!7551 (index!32573 (_ BitVec 32))) (Intermediate!7551 (undefined!8363 Bool) (index!32574 (_ BitVec 32)) (x!63517 (_ BitVec 32))) (Undefined!7551) (MissingVacant!7551 (index!32575 (_ BitVec 32))) )
))
(declare-fun lt!332040 () SeekEntryResult!7551)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!747029 (= res!503733 (or (= lt!332040 (MissingZero!7551 i!1173)) (= lt!332040 (MissingVacant!7551 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41675 (_ BitVec 32)) SeekEntryResult!7551)

(assert (=> b!747029 (= lt!332040 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!747030 () Bool)

(declare-fun e!417134 () Bool)

(assert (=> b!747030 (= e!417131 e!417134)))

(declare-fun res!503734 () Bool)

(assert (=> b!747030 (=> (not res!503734) (not e!417134))))

(declare-fun lt!332038 () SeekEntryResult!7551)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41675 (_ BitVec 32)) SeekEntryResult!7551)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!747030 (= res!503734 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19951 a!3186) j!159) mask!3328) (select (arr!19951 a!3186) j!159) a!3186 mask!3328) lt!332038))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!747030 (= lt!332038 (Intermediate!7551 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!747031 () Bool)

(declare-fun res!503723 () Bool)

(declare-fun e!417133 () Bool)

(assert (=> b!747031 (=> res!503723 e!417133)))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!332042 () (_ BitVec 64))

(assert (=> b!747031 (= res!503723 (= (select (store (arr!19951 a!3186) i!1173 k0!2102) index!1321) lt!332042))))

(declare-fun b!747032 () Bool)

(declare-fun res!503730 () Bool)

(assert (=> b!747032 (=> (not res!503730) (not e!417131))))

(declare-datatypes ((List!13953 0))(
  ( (Nil!13950) (Cons!13949 (h!15021 (_ BitVec 64)) (t!20268 List!13953)) )
))
(declare-fun arrayNoDuplicates!0 (array!41675 (_ BitVec 32) List!13953) Bool)

(assert (=> b!747032 (= res!503730 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13950))))

(declare-fun b!747033 () Bool)

(declare-fun res!503728 () Bool)

(assert (=> b!747033 (=> (not res!503728) (not e!417137))))

(declare-fun arrayContainsKey!0 (array!41675 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!747033 (= res!503728 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!747034 () Bool)

(declare-fun res!503727 () Bool)

(assert (=> b!747034 (=> (not res!503727) (not e!417137))))

(assert (=> b!747034 (= res!503727 (and (= (size!20372 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20372 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20372 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!747035 () Bool)

(declare-fun res!503729 () Bool)

(assert (=> b!747035 (=> (not res!503729) (not e!417137))))

(assert (=> b!747035 (= res!503729 (validKeyInArray!0 k0!2102))))

(declare-fun b!747036 () Bool)

(declare-fun res!503735 () Bool)

(assert (=> b!747036 (=> (not res!503735) (not e!417131))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41675 (_ BitVec 32)) Bool)

(assert (=> b!747036 (= res!503735 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!747038 () Bool)

(declare-fun e!417130 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41675 (_ BitVec 32)) SeekEntryResult!7551)

(assert (=> b!747038 (= e!417130 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19951 a!3186) j!159) a!3186 mask!3328) (Found!7551 j!159)))))

(declare-fun b!747039 () Bool)

(assert (=> b!747039 (= e!417133 true)))

(assert (=> b!747039 (= (select (store (arr!19951 a!3186) i!1173 k0!2102) index!1321) #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-datatypes ((Unit!25584 0))(
  ( (Unit!25585) )
))
(declare-fun lt!332041 () Unit!25584)

(declare-fun e!417136 () Unit!25584)

(assert (=> b!747039 (= lt!332041 e!417136)))

(declare-fun c!82035 () Bool)

(assert (=> b!747039 (= c!82035 (= (select (store (arr!19951 a!3186) i!1173 k0!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!747040 () Bool)

(declare-fun e!417129 () Bool)

(assert (=> b!747040 (= e!417129 (not e!417133))))

(declare-fun res!503722 () Bool)

(assert (=> b!747040 (=> res!503722 e!417133)))

(declare-fun lt!332036 () SeekEntryResult!7551)

(get-info :version)

(assert (=> b!747040 (= res!503722 (or (not ((_ is Intermediate!7551) lt!332036)) (bvslt x!1131 (x!63517 lt!332036)) (not (= x!1131 (x!63517 lt!332036))) (not (= index!1321 (index!32574 lt!332036)))))))

(declare-fun e!417132 () Bool)

(assert (=> b!747040 e!417132))

(declare-fun res!503732 () Bool)

(assert (=> b!747040 (=> (not res!503732) (not e!417132))))

(declare-fun lt!332039 () SeekEntryResult!7551)

(declare-fun lt!332045 () SeekEntryResult!7551)

(assert (=> b!747040 (= res!503732 (= lt!332039 lt!332045))))

(assert (=> b!747040 (= lt!332045 (Found!7551 j!159))))

(assert (=> b!747040 (= lt!332039 (seekEntryOrOpen!0 (select (arr!19951 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!747040 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!332043 () Unit!25584)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41675 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25584)

(assert (=> b!747040 (= lt!332043 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!747041 () Bool)

(assert (=> b!747041 (= e!417130 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19951 a!3186) j!159) a!3186 mask!3328) lt!332038))))

(declare-fun b!747042 () Bool)

(declare-fun Unit!25586 () Unit!25584)

(assert (=> b!747042 (= e!417136 Unit!25586)))

(assert (=> b!747042 false))

(declare-fun b!747043 () Bool)

(declare-fun res!503719 () Bool)

(assert (=> b!747043 (=> (not res!503719) (not e!417134))))

(assert (=> b!747043 (= res!503719 e!417130)))

(declare-fun c!82036 () Bool)

(assert (=> b!747043 (= c!82036 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!747044 () Bool)

(declare-fun res!503720 () Bool)

(assert (=> b!747044 (=> (not res!503720) (not e!417134))))

(assert (=> b!747044 (= res!503720 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19951 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!747045 () Bool)

(declare-fun res!503731 () Bool)

(assert (=> b!747045 (=> (not res!503731) (not e!417131))))

(assert (=> b!747045 (= res!503731 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20372 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20372 a!3186))))))

(declare-fun b!747046 () Bool)

(declare-fun Unit!25587 () Unit!25584)

(assert (=> b!747046 (= e!417136 Unit!25587)))

(declare-fun b!747047 () Bool)

(assert (=> b!747047 (= e!417134 e!417129)))

(declare-fun res!503721 () Bool)

(assert (=> b!747047 (=> (not res!503721) (not e!417129))))

(declare-fun lt!332044 () SeekEntryResult!7551)

(assert (=> b!747047 (= res!503721 (= lt!332044 lt!332036))))

(declare-fun lt!332037 () array!41675)

(assert (=> b!747047 (= lt!332036 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!332042 lt!332037 mask!3328))))

(assert (=> b!747047 (= lt!332044 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!332042 mask!3328) lt!332042 lt!332037 mask!3328))))

(assert (=> b!747047 (= lt!332042 (select (store (arr!19951 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!747047 (= lt!332037 (array!41676 (store (arr!19951 a!3186) i!1173 k0!2102) (size!20372 a!3186)))))

(declare-fun b!747048 () Bool)

(declare-fun res!503724 () Bool)

(assert (=> b!747048 (=> res!503724 e!417133)))

(assert (=> b!747048 (= res!503724 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19951 a!3186) j!159) a!3186 mask!3328) lt!332045)))))

(declare-fun b!747037 () Bool)

(assert (=> b!747037 (= e!417132 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19951 a!3186) j!159) a!3186 mask!3328) lt!332045))))

(declare-fun res!503725 () Bool)

(assert (=> start!65502 (=> (not res!503725) (not e!417137))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65502 (= res!503725 (validMask!0 mask!3328))))

(assert (=> start!65502 e!417137))

(assert (=> start!65502 true))

(declare-fun array_inv!15747 (array!41675) Bool)

(assert (=> start!65502 (array_inv!15747 a!3186)))

(assert (= (and start!65502 res!503725) b!747034))

(assert (= (and b!747034 res!503727) b!747028))

(assert (= (and b!747028 res!503726) b!747035))

(assert (= (and b!747035 res!503729) b!747033))

(assert (= (and b!747033 res!503728) b!747029))

(assert (= (and b!747029 res!503733) b!747036))

(assert (= (and b!747036 res!503735) b!747032))

(assert (= (and b!747032 res!503730) b!747045))

(assert (= (and b!747045 res!503731) b!747030))

(assert (= (and b!747030 res!503734) b!747044))

(assert (= (and b!747044 res!503720) b!747043))

(assert (= (and b!747043 c!82036) b!747041))

(assert (= (and b!747043 (not c!82036)) b!747038))

(assert (= (and b!747043 res!503719) b!747047))

(assert (= (and b!747047 res!503721) b!747040))

(assert (= (and b!747040 res!503732) b!747037))

(assert (= (and b!747040 (not res!503722)) b!747048))

(assert (= (and b!747048 (not res!503724)) b!747031))

(assert (= (and b!747031 (not res!503723)) b!747039))

(assert (= (and b!747039 c!82035) b!747042))

(assert (= (and b!747039 (not c!82035)) b!747046))

(declare-fun m!697207 () Bool)

(assert (=> b!747035 m!697207))

(declare-fun m!697209 () Bool)

(assert (=> b!747041 m!697209))

(assert (=> b!747041 m!697209))

(declare-fun m!697211 () Bool)

(assert (=> b!747041 m!697211))

(declare-fun m!697213 () Bool)

(assert (=> b!747036 m!697213))

(assert (=> b!747028 m!697209))

(assert (=> b!747028 m!697209))

(declare-fun m!697215 () Bool)

(assert (=> b!747028 m!697215))

(declare-fun m!697217 () Bool)

(assert (=> start!65502 m!697217))

(declare-fun m!697219 () Bool)

(assert (=> start!65502 m!697219))

(assert (=> b!747037 m!697209))

(assert (=> b!747037 m!697209))

(declare-fun m!697221 () Bool)

(assert (=> b!747037 m!697221))

(declare-fun m!697223 () Bool)

(assert (=> b!747032 m!697223))

(assert (=> b!747048 m!697209))

(assert (=> b!747048 m!697209))

(declare-fun m!697225 () Bool)

(assert (=> b!747048 m!697225))

(assert (=> b!747030 m!697209))

(assert (=> b!747030 m!697209))

(declare-fun m!697227 () Bool)

(assert (=> b!747030 m!697227))

(assert (=> b!747030 m!697227))

(assert (=> b!747030 m!697209))

(declare-fun m!697229 () Bool)

(assert (=> b!747030 m!697229))

(assert (=> b!747040 m!697209))

(assert (=> b!747040 m!697209))

(declare-fun m!697231 () Bool)

(assert (=> b!747040 m!697231))

(declare-fun m!697233 () Bool)

(assert (=> b!747040 m!697233))

(declare-fun m!697235 () Bool)

(assert (=> b!747040 m!697235))

(declare-fun m!697237 () Bool)

(assert (=> b!747044 m!697237))

(declare-fun m!697239 () Bool)

(assert (=> b!747031 m!697239))

(declare-fun m!697241 () Bool)

(assert (=> b!747031 m!697241))

(declare-fun m!697243 () Bool)

(assert (=> b!747033 m!697243))

(declare-fun m!697245 () Bool)

(assert (=> b!747029 m!697245))

(declare-fun m!697247 () Bool)

(assert (=> b!747047 m!697247))

(assert (=> b!747047 m!697239))

(declare-fun m!697249 () Bool)

(assert (=> b!747047 m!697249))

(assert (=> b!747047 m!697249))

(declare-fun m!697251 () Bool)

(assert (=> b!747047 m!697251))

(declare-fun m!697253 () Bool)

(assert (=> b!747047 m!697253))

(assert (=> b!747039 m!697239))

(assert (=> b!747039 m!697241))

(assert (=> b!747038 m!697209))

(assert (=> b!747038 m!697209))

(assert (=> b!747038 m!697225))

(check-sat (not b!747036) (not b!747028) (not b!747047) (not b!747041) (not b!747029) (not b!747033) (not b!747030) (not b!747048) (not b!747040) (not b!747032) (not start!65502) (not b!747035) (not b!747038) (not b!747037))
(check-sat)
