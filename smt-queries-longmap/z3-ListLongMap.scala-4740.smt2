; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65628 () Bool)

(assert start!65628)

(declare-fun b!747710 () Bool)

(declare-fun res!503987 () Bool)

(declare-fun e!417584 () Bool)

(assert (=> b!747710 (=> (not res!503987) (not e!417584))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!747710 (= res!503987 (validKeyInArray!0 k0!2102))))

(declare-fun b!747711 () Bool)

(declare-fun res!503978 () Bool)

(declare-fun e!417587 () Bool)

(assert (=> b!747711 (=> res!503978 e!417587)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41671 0))(
  ( (array!41672 (arr!19945 (Array (_ BitVec 32) (_ BitVec 64))) (size!20365 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41671)

(declare-datatypes ((SeekEntryResult!7501 0))(
  ( (MissingZero!7501 (index!32372 (_ BitVec 32))) (Found!7501 (index!32373 (_ BitVec 32))) (Intermediate!7501 (undefined!8313 Bool) (index!32374 (_ BitVec 32)) (x!63479 (_ BitVec 32))) (Undefined!7501) (MissingVacant!7501 (index!32375 (_ BitVec 32))) )
))
(declare-fun lt!332328 () SeekEntryResult!7501)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41671 (_ BitVec 32)) SeekEntryResult!7501)

(assert (=> b!747711 (= res!503978 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19945 a!3186) j!159) a!3186 mask!3328) lt!332328)))))

(declare-fun b!747712 () Bool)

(declare-fun res!503985 () Bool)

(assert (=> b!747712 (=> (not res!503985) (not e!417584))))

(declare-fun arrayContainsKey!0 (array!41671 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!747712 (= res!503985 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun res!503974 () Bool)

(assert (=> start!65628 (=> (not res!503974) (not e!417584))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65628 (= res!503974 (validMask!0 mask!3328))))

(assert (=> start!65628 e!417584))

(assert (=> start!65628 true))

(declare-fun array_inv!15804 (array!41671) Bool)

(assert (=> start!65628 (array_inv!15804 a!3186)))

(declare-fun b!747713 () Bool)

(declare-fun res!503986 () Bool)

(declare-fun e!417586 () Bool)

(assert (=> b!747713 (=> (not res!503986) (not e!417586))))

(declare-datatypes ((List!13854 0))(
  ( (Nil!13851) (Cons!13850 (h!14928 (_ BitVec 64)) (t!20161 List!13854)) )
))
(declare-fun arrayNoDuplicates!0 (array!41671 (_ BitVec 32) List!13854) Bool)

(assert (=> b!747713 (= res!503986 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13851))))

(declare-fun e!417585 () Bool)

(declare-fun b!747714 () Bool)

(declare-fun lt!332321 () SeekEntryResult!7501)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41671 (_ BitVec 32)) SeekEntryResult!7501)

(assert (=> b!747714 (= e!417585 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19945 a!3186) j!159) a!3186 mask!3328) lt!332321))))

(declare-fun b!747715 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun e!417588 () Bool)

(assert (=> b!747715 (= e!417588 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19945 a!3186) j!159) a!3186 mask!3328) lt!332328))))

(declare-fun b!747716 () Bool)

(declare-fun e!417582 () Bool)

(declare-fun e!417580 () Bool)

(assert (=> b!747716 (= e!417582 e!417580)))

(declare-fun res!503988 () Bool)

(assert (=> b!747716 (=> (not res!503988) (not e!417580))))

(declare-fun lt!332325 () SeekEntryResult!7501)

(declare-fun lt!332327 () SeekEntryResult!7501)

(assert (=> b!747716 (= res!503988 (= lt!332325 lt!332327))))

(declare-fun lt!332322 () (_ BitVec 64))

(declare-fun lt!332326 () array!41671)

(assert (=> b!747716 (= lt!332327 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!332322 lt!332326 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!747716 (= lt!332325 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!332322 mask!3328) lt!332322 lt!332326 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!747716 (= lt!332322 (select (store (arr!19945 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!747716 (= lt!332326 (array!41672 (store (arr!19945 a!3186) i!1173 k0!2102) (size!20365 a!3186)))))

(declare-fun b!747717 () Bool)

(declare-fun res!503979 () Bool)

(assert (=> b!747717 (=> (not res!503979) (not e!417582))))

(assert (=> b!747717 (= res!503979 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19945 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!747718 () Bool)

(declare-fun res!503975 () Bool)

(assert (=> b!747718 (=> res!503975 e!417587)))

(assert (=> b!747718 (= res!503975 (= (select (store (arr!19945 a!3186) i!1173 k0!2102) index!1321) lt!332322))))

(declare-fun b!747719 () Bool)

(declare-fun res!503976 () Bool)

(assert (=> b!747719 (=> (not res!503976) (not e!417584))))

(assert (=> b!747719 (= res!503976 (and (= (size!20365 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20365 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20365 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!747720 () Bool)

(declare-fun res!503977 () Bool)

(assert (=> b!747720 (=> (not res!503977) (not e!417584))))

(assert (=> b!747720 (= res!503977 (validKeyInArray!0 (select (arr!19945 a!3186) j!159)))))

(declare-fun b!747721 () Bool)

(declare-datatypes ((Unit!25561 0))(
  ( (Unit!25562) )
))
(declare-fun e!417583 () Unit!25561)

(declare-fun Unit!25563 () Unit!25561)

(assert (=> b!747721 (= e!417583 Unit!25563)))

(declare-fun b!747722 () Bool)

(declare-fun res!503980 () Bool)

(assert (=> b!747722 (=> (not res!503980) (not e!417586))))

(assert (=> b!747722 (= res!503980 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20365 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20365 a!3186))))))

(declare-fun b!747723 () Bool)

(assert (=> b!747723 (= e!417586 e!417582)))

(declare-fun res!503989 () Bool)

(assert (=> b!747723 (=> (not res!503989) (not e!417582))))

(assert (=> b!747723 (= res!503989 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19945 a!3186) j!159) mask!3328) (select (arr!19945 a!3186) j!159) a!3186 mask!3328) lt!332321))))

(assert (=> b!747723 (= lt!332321 (Intermediate!7501 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!747724 () Bool)

(assert (=> b!747724 (= e!417580 (not e!417587))))

(declare-fun res!503973 () Bool)

(assert (=> b!747724 (=> res!503973 e!417587)))

(get-info :version)

(assert (=> b!747724 (= res!503973 (or (not ((_ is Intermediate!7501) lt!332327)) (bvslt x!1131 (x!63479 lt!332327)) (not (= x!1131 (x!63479 lt!332327))) (not (= index!1321 (index!32374 lt!332327)))))))

(assert (=> b!747724 e!417588))

(declare-fun res!503983 () Bool)

(assert (=> b!747724 (=> (not res!503983) (not e!417588))))

(declare-fun lt!332324 () SeekEntryResult!7501)

(assert (=> b!747724 (= res!503983 (= lt!332324 lt!332328))))

(assert (=> b!747724 (= lt!332328 (Found!7501 j!159))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41671 (_ BitVec 32)) SeekEntryResult!7501)

(assert (=> b!747724 (= lt!332324 (seekEntryOrOpen!0 (select (arr!19945 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41671 (_ BitVec 32)) Bool)

(assert (=> b!747724 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!332323 () Unit!25561)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41671 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25561)

(assert (=> b!747724 (= lt!332323 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!747725 () Bool)

(assert (=> b!747725 (= e!417584 e!417586)))

(declare-fun res!503981 () Bool)

(assert (=> b!747725 (=> (not res!503981) (not e!417586))))

(declare-fun lt!332320 () SeekEntryResult!7501)

(assert (=> b!747725 (= res!503981 (or (= lt!332320 (MissingZero!7501 i!1173)) (= lt!332320 (MissingVacant!7501 i!1173))))))

(assert (=> b!747725 (= lt!332320 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!747726 () Bool)

(declare-fun res!503982 () Bool)

(assert (=> b!747726 (=> (not res!503982) (not e!417582))))

(assert (=> b!747726 (= res!503982 e!417585)))

(declare-fun c!82253 () Bool)

(assert (=> b!747726 (= c!82253 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!747727 () Bool)

(declare-fun res!503984 () Bool)

(assert (=> b!747727 (=> (not res!503984) (not e!417586))))

(assert (=> b!747727 (= res!503984 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!747728 () Bool)

(declare-fun Unit!25564 () Unit!25561)

(assert (=> b!747728 (= e!417583 Unit!25564)))

(assert (=> b!747728 false))

(declare-fun b!747729 () Bool)

(assert (=> b!747729 (= e!417585 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19945 a!3186) j!159) a!3186 mask!3328) (Found!7501 j!159)))))

(declare-fun b!747730 () Bool)

(assert (=> b!747730 (= e!417587 true)))

(assert (=> b!747730 (= (select (store (arr!19945 a!3186) i!1173 k0!2102) index!1321) #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!332319 () Unit!25561)

(assert (=> b!747730 (= lt!332319 e!417583)))

(declare-fun c!82252 () Bool)

(assert (=> b!747730 (= c!82252 (= (select (store (arr!19945 a!3186) i!1173 k0!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!65628 res!503974) b!747719))

(assert (= (and b!747719 res!503976) b!747720))

(assert (= (and b!747720 res!503977) b!747710))

(assert (= (and b!747710 res!503987) b!747712))

(assert (= (and b!747712 res!503985) b!747725))

(assert (= (and b!747725 res!503981) b!747727))

(assert (= (and b!747727 res!503984) b!747713))

(assert (= (and b!747713 res!503986) b!747722))

(assert (= (and b!747722 res!503980) b!747723))

(assert (= (and b!747723 res!503989) b!747717))

(assert (= (and b!747717 res!503979) b!747726))

(assert (= (and b!747726 c!82253) b!747714))

(assert (= (and b!747726 (not c!82253)) b!747729))

(assert (= (and b!747726 res!503982) b!747716))

(assert (= (and b!747716 res!503988) b!747724))

(assert (= (and b!747724 res!503983) b!747715))

(assert (= (and b!747724 (not res!503973)) b!747711))

(assert (= (and b!747711 (not res!503978)) b!747718))

(assert (= (and b!747718 (not res!503975)) b!747730))

(assert (= (and b!747730 c!82252) b!747728))

(assert (= (and b!747730 (not c!82252)) b!747721))

(declare-fun m!698319 () Bool)

(assert (=> b!747725 m!698319))

(declare-fun m!698321 () Bool)

(assert (=> b!747713 m!698321))

(declare-fun m!698323 () Bool)

(assert (=> b!747712 m!698323))

(declare-fun m!698325 () Bool)

(assert (=> b!747715 m!698325))

(assert (=> b!747715 m!698325))

(declare-fun m!698327 () Bool)

(assert (=> b!747715 m!698327))

(declare-fun m!698329 () Bool)

(assert (=> start!65628 m!698329))

(declare-fun m!698331 () Bool)

(assert (=> start!65628 m!698331))

(assert (=> b!747711 m!698325))

(assert (=> b!747711 m!698325))

(declare-fun m!698333 () Bool)

(assert (=> b!747711 m!698333))

(assert (=> b!747724 m!698325))

(assert (=> b!747724 m!698325))

(declare-fun m!698335 () Bool)

(assert (=> b!747724 m!698335))

(declare-fun m!698337 () Bool)

(assert (=> b!747724 m!698337))

(declare-fun m!698339 () Bool)

(assert (=> b!747724 m!698339))

(assert (=> b!747714 m!698325))

(assert (=> b!747714 m!698325))

(declare-fun m!698341 () Bool)

(assert (=> b!747714 m!698341))

(declare-fun m!698343 () Bool)

(assert (=> b!747718 m!698343))

(declare-fun m!698345 () Bool)

(assert (=> b!747718 m!698345))

(declare-fun m!698347 () Bool)

(assert (=> b!747717 m!698347))

(assert (=> b!747730 m!698343))

(assert (=> b!747730 m!698345))

(declare-fun m!698349 () Bool)

(assert (=> b!747727 m!698349))

(assert (=> b!747720 m!698325))

(assert (=> b!747720 m!698325))

(declare-fun m!698351 () Bool)

(assert (=> b!747720 m!698351))

(assert (=> b!747723 m!698325))

(assert (=> b!747723 m!698325))

(declare-fun m!698353 () Bool)

(assert (=> b!747723 m!698353))

(assert (=> b!747723 m!698353))

(assert (=> b!747723 m!698325))

(declare-fun m!698355 () Bool)

(assert (=> b!747723 m!698355))

(declare-fun m!698357 () Bool)

(assert (=> b!747710 m!698357))

(assert (=> b!747729 m!698325))

(assert (=> b!747729 m!698325))

(assert (=> b!747729 m!698333))

(declare-fun m!698359 () Bool)

(assert (=> b!747716 m!698359))

(declare-fun m!698361 () Bool)

(assert (=> b!747716 m!698361))

(assert (=> b!747716 m!698343))

(assert (=> b!747716 m!698361))

(declare-fun m!698363 () Bool)

(assert (=> b!747716 m!698363))

(declare-fun m!698365 () Bool)

(assert (=> b!747716 m!698365))

(check-sat (not b!747727) (not b!747711) (not b!747729) (not b!747720) (not b!747716) (not b!747725) (not b!747714) (not b!747715) (not b!747712) (not b!747713) (not b!747724) (not b!747710) (not start!65628) (not b!747723))
(check-sat)
