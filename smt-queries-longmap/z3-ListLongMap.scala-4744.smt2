; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65526 () Bool)

(assert start!65526)

(declare-fun b!747793 () Bool)

(declare-fun res!504352 () Bool)

(declare-fun e!417464 () Bool)

(assert (=> b!747793 (=> res!504352 e!417464)))

(declare-datatypes ((array!41699 0))(
  ( (array!41700 (arr!19963 (Array (_ BitVec 32) (_ BitVec 64))) (size!20384 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41699)

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun lt!332405 () (_ BitVec 64))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!747793 (= res!504352 (= (select (store (arr!19963 a!3186) i!1173 k0!2102) index!1321) lt!332405))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!747794 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun e!417467 () Bool)

(declare-datatypes ((SeekEntryResult!7563 0))(
  ( (MissingZero!7563 (index!32620 (_ BitVec 32))) (Found!7563 (index!32621 (_ BitVec 32))) (Intermediate!7563 (undefined!8375 Bool) (index!32622 (_ BitVec 32)) (x!63561 (_ BitVec 32))) (Undefined!7563) (MissingVacant!7563 (index!32623 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41699 (_ BitVec 32)) SeekEntryResult!7563)

(assert (=> b!747794 (= e!417467 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19963 a!3186) j!159) a!3186 mask!3328) (Found!7563 j!159)))))

(declare-fun b!747795 () Bool)

(declare-datatypes ((Unit!25632 0))(
  ( (Unit!25633) )
))
(declare-fun e!417469 () Unit!25632)

(declare-fun Unit!25634 () Unit!25632)

(assert (=> b!747795 (= e!417469 Unit!25634)))

(declare-fun lt!332398 () SeekEntryResult!7563)

(declare-fun b!747796 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41699 (_ BitVec 32)) SeekEntryResult!7563)

(assert (=> b!747796 (= e!417467 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19963 a!3186) j!159) a!3186 mask!3328) lt!332398))))

(declare-fun b!747797 () Bool)

(declare-fun res!504346 () Bool)

(declare-fun e!417468 () Bool)

(assert (=> b!747797 (=> (not res!504346) (not e!417468))))

(declare-fun arrayContainsKey!0 (array!41699 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!747797 (= res!504346 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!747798 () Bool)

(declare-fun Unit!25635 () Unit!25632)

(assert (=> b!747798 (= e!417469 Unit!25635)))

(assert (=> b!747798 false))

(declare-fun b!747799 () Bool)

(declare-fun e!417462 () Bool)

(declare-fun e!417470 () Bool)

(assert (=> b!747799 (= e!417462 e!417470)))

(declare-fun res!504355 () Bool)

(assert (=> b!747799 (=> (not res!504355) (not e!417470))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!747799 (= res!504355 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19963 a!3186) j!159) mask!3328) (select (arr!19963 a!3186) j!159) a!3186 mask!3328) lt!332398))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!747799 (= lt!332398 (Intermediate!7563 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun res!504348 () Bool)

(assert (=> start!65526 (=> (not res!504348) (not e!417468))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65526 (= res!504348 (validMask!0 mask!3328))))

(assert (=> start!65526 e!417468))

(assert (=> start!65526 true))

(declare-fun array_inv!15759 (array!41699) Bool)

(assert (=> start!65526 (array_inv!15759 a!3186)))

(declare-fun b!747800 () Bool)

(declare-fun res!504354 () Bool)

(assert (=> b!747800 (=> (not res!504354) (not e!417468))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!747800 (= res!504354 (validKeyInArray!0 k0!2102))))

(declare-fun b!747801 () Bool)

(assert (=> b!747801 (= e!417468 e!417462)))

(declare-fun res!504351 () Bool)

(assert (=> b!747801 (=> (not res!504351) (not e!417462))))

(declare-fun lt!332396 () SeekEntryResult!7563)

(assert (=> b!747801 (= res!504351 (or (= lt!332396 (MissingZero!7563 i!1173)) (= lt!332396 (MissingVacant!7563 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41699 (_ BitVec 32)) SeekEntryResult!7563)

(assert (=> b!747801 (= lt!332396 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!747802 () Bool)

(declare-fun res!504353 () Bool)

(assert (=> b!747802 (=> (not res!504353) (not e!417462))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41699 (_ BitVec 32)) Bool)

(assert (=> b!747802 (= res!504353 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!747803 () Bool)

(assert (=> b!747803 (= e!417464 true)))

(assert (=> b!747803 (= (select (store (arr!19963 a!3186) i!1173 k0!2102) index!1321) #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!332399 () Unit!25632)

(assert (=> b!747803 (= lt!332399 e!417469)))

(declare-fun c!82107 () Bool)

(assert (=> b!747803 (= c!82107 (= (select (store (arr!19963 a!3186) i!1173 k0!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!747804 () Bool)

(declare-fun e!417463 () Bool)

(assert (=> b!747804 (= e!417463 (not e!417464))))

(declare-fun res!504344 () Bool)

(assert (=> b!747804 (=> res!504344 e!417464)))

(declare-fun lt!332400 () SeekEntryResult!7563)

(get-info :version)

(assert (=> b!747804 (= res!504344 (or (not ((_ is Intermediate!7563) lt!332400)) (bvslt x!1131 (x!63561 lt!332400)) (not (= x!1131 (x!63561 lt!332400))) (not (= index!1321 (index!32622 lt!332400)))))))

(declare-fun e!417465 () Bool)

(assert (=> b!747804 e!417465))

(declare-fun res!504349 () Bool)

(assert (=> b!747804 (=> (not res!504349) (not e!417465))))

(declare-fun lt!332404 () SeekEntryResult!7563)

(declare-fun lt!332401 () SeekEntryResult!7563)

(assert (=> b!747804 (= res!504349 (= lt!332404 lt!332401))))

(assert (=> b!747804 (= lt!332401 (Found!7563 j!159))))

(assert (=> b!747804 (= lt!332404 (seekEntryOrOpen!0 (select (arr!19963 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!747804 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!332397 () Unit!25632)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41699 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25632)

(assert (=> b!747804 (= lt!332397 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!747805 () Bool)

(declare-fun res!504343 () Bool)

(assert (=> b!747805 (=> (not res!504343) (not e!417470))))

(assert (=> b!747805 (= res!504343 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19963 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!747806 () Bool)

(assert (=> b!747806 (= e!417465 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19963 a!3186) j!159) a!3186 mask!3328) lt!332401))))

(declare-fun b!747807 () Bool)

(declare-fun res!504356 () Bool)

(assert (=> b!747807 (=> (not res!504356) (not e!417468))))

(assert (=> b!747807 (= res!504356 (and (= (size!20384 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20384 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20384 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!747808 () Bool)

(declare-fun res!504345 () Bool)

(assert (=> b!747808 (=> (not res!504345) (not e!417462))))

(assert (=> b!747808 (= res!504345 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20384 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20384 a!3186))))))

(declare-fun b!747809 () Bool)

(declare-fun res!504347 () Bool)

(assert (=> b!747809 (=> (not res!504347) (not e!417462))))

(declare-datatypes ((List!13965 0))(
  ( (Nil!13962) (Cons!13961 (h!15033 (_ BitVec 64)) (t!20280 List!13965)) )
))
(declare-fun arrayNoDuplicates!0 (array!41699 (_ BitVec 32) List!13965) Bool)

(assert (=> b!747809 (= res!504347 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13962))))

(declare-fun b!747810 () Bool)

(declare-fun res!504341 () Bool)

(assert (=> b!747810 (=> (not res!504341) (not e!417468))))

(assert (=> b!747810 (= res!504341 (validKeyInArray!0 (select (arr!19963 a!3186) j!159)))))

(declare-fun b!747811 () Bool)

(declare-fun res!504340 () Bool)

(assert (=> b!747811 (=> res!504340 e!417464)))

(assert (=> b!747811 (= res!504340 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19963 a!3186) j!159) a!3186 mask!3328) lt!332401)))))

(declare-fun b!747812 () Bool)

(assert (=> b!747812 (= e!417470 e!417463)))

(declare-fun res!504342 () Bool)

(assert (=> b!747812 (=> (not res!504342) (not e!417463))))

(declare-fun lt!332403 () SeekEntryResult!7563)

(assert (=> b!747812 (= res!504342 (= lt!332403 lt!332400))))

(declare-fun lt!332402 () array!41699)

(assert (=> b!747812 (= lt!332400 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!332405 lt!332402 mask!3328))))

(assert (=> b!747812 (= lt!332403 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!332405 mask!3328) lt!332405 lt!332402 mask!3328))))

(assert (=> b!747812 (= lt!332405 (select (store (arr!19963 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!747812 (= lt!332402 (array!41700 (store (arr!19963 a!3186) i!1173 k0!2102) (size!20384 a!3186)))))

(declare-fun b!747813 () Bool)

(declare-fun res!504350 () Bool)

(assert (=> b!747813 (=> (not res!504350) (not e!417470))))

(assert (=> b!747813 (= res!504350 e!417467)))

(declare-fun c!82108 () Bool)

(assert (=> b!747813 (= c!82108 (bvsle x!1131 resIntermediateX!5))))

(assert (= (and start!65526 res!504348) b!747807))

(assert (= (and b!747807 res!504356) b!747810))

(assert (= (and b!747810 res!504341) b!747800))

(assert (= (and b!747800 res!504354) b!747797))

(assert (= (and b!747797 res!504346) b!747801))

(assert (= (and b!747801 res!504351) b!747802))

(assert (= (and b!747802 res!504353) b!747809))

(assert (= (and b!747809 res!504347) b!747808))

(assert (= (and b!747808 res!504345) b!747799))

(assert (= (and b!747799 res!504355) b!747805))

(assert (= (and b!747805 res!504343) b!747813))

(assert (= (and b!747813 c!82108) b!747796))

(assert (= (and b!747813 (not c!82108)) b!747794))

(assert (= (and b!747813 res!504350) b!747812))

(assert (= (and b!747812 res!504342) b!747804))

(assert (= (and b!747804 res!504349) b!747806))

(assert (= (and b!747804 (not res!504344)) b!747811))

(assert (= (and b!747811 (not res!504340)) b!747793))

(assert (= (and b!747793 (not res!504352)) b!747803))

(assert (= (and b!747803 c!82107) b!747798))

(assert (= (and b!747803 (not c!82107)) b!747795))

(declare-fun m!697789 () Bool)

(assert (=> b!747805 m!697789))

(declare-fun m!697791 () Bool)

(assert (=> b!747811 m!697791))

(assert (=> b!747811 m!697791))

(declare-fun m!697793 () Bool)

(assert (=> b!747811 m!697793))

(declare-fun m!697795 () Bool)

(assert (=> b!747802 m!697795))

(declare-fun m!697797 () Bool)

(assert (=> b!747801 m!697797))

(declare-fun m!697799 () Bool)

(assert (=> b!747793 m!697799))

(declare-fun m!697801 () Bool)

(assert (=> b!747793 m!697801))

(declare-fun m!697803 () Bool)

(assert (=> b!747797 m!697803))

(declare-fun m!697805 () Bool)

(assert (=> start!65526 m!697805))

(declare-fun m!697807 () Bool)

(assert (=> start!65526 m!697807))

(assert (=> b!747804 m!697791))

(assert (=> b!747804 m!697791))

(declare-fun m!697809 () Bool)

(assert (=> b!747804 m!697809))

(declare-fun m!697811 () Bool)

(assert (=> b!747804 m!697811))

(declare-fun m!697813 () Bool)

(assert (=> b!747804 m!697813))

(assert (=> b!747799 m!697791))

(assert (=> b!747799 m!697791))

(declare-fun m!697815 () Bool)

(assert (=> b!747799 m!697815))

(assert (=> b!747799 m!697815))

(assert (=> b!747799 m!697791))

(declare-fun m!697817 () Bool)

(assert (=> b!747799 m!697817))

(assert (=> b!747812 m!697799))

(declare-fun m!697819 () Bool)

(assert (=> b!747812 m!697819))

(declare-fun m!697821 () Bool)

(assert (=> b!747812 m!697821))

(declare-fun m!697823 () Bool)

(assert (=> b!747812 m!697823))

(assert (=> b!747812 m!697823))

(declare-fun m!697825 () Bool)

(assert (=> b!747812 m!697825))

(assert (=> b!747796 m!697791))

(assert (=> b!747796 m!697791))

(declare-fun m!697827 () Bool)

(assert (=> b!747796 m!697827))

(assert (=> b!747803 m!697799))

(assert (=> b!747803 m!697801))

(assert (=> b!747810 m!697791))

(assert (=> b!747810 m!697791))

(declare-fun m!697829 () Bool)

(assert (=> b!747810 m!697829))

(declare-fun m!697831 () Bool)

(assert (=> b!747809 m!697831))

(assert (=> b!747794 m!697791))

(assert (=> b!747794 m!697791))

(assert (=> b!747794 m!697793))

(assert (=> b!747806 m!697791))

(assert (=> b!747806 m!697791))

(declare-fun m!697833 () Bool)

(assert (=> b!747806 m!697833))

(declare-fun m!697835 () Bool)

(assert (=> b!747800 m!697835))

(check-sat (not b!747810) (not b!747811) (not b!747812) (not b!747799) (not b!747797) (not b!747800) (not start!65526) (not b!747801) (not b!747804) (not b!747794) (not b!747809) (not b!747796) (not b!747802) (not b!747806))
(check-sat)
