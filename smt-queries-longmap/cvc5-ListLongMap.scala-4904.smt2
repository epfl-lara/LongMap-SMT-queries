; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67668 () Bool)

(assert start!67668)

(declare-fun b!783758 () Bool)

(declare-fun e!435781 () Bool)

(declare-fun e!435788 () Bool)

(assert (=> b!783758 (= e!435781 (not e!435788))))

(declare-fun res!530285 () Bool)

(assert (=> b!783758 (=> res!530285 e!435788)))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8042 0))(
  ( (MissingZero!8042 (index!34536 (_ BitVec 32))) (Found!8042 (index!34537 (_ BitVec 32))) (Intermediate!8042 (undefined!8854 Bool) (index!34538 (_ BitVec 32)) (x!65494 (_ BitVec 32))) (Undefined!8042) (MissingVacant!8042 (index!34539 (_ BitVec 32))) )
))
(declare-fun lt!349331 () SeekEntryResult!8042)

(assert (=> b!783758 (= res!530285 (or (not (is-Intermediate!8042 lt!349331)) (bvslt x!1131 (x!65494 lt!349331)) (not (= x!1131 (x!65494 lt!349331))) (not (= index!1321 (index!34538 lt!349331)))))))

(declare-fun e!435780 () Bool)

(assert (=> b!783758 e!435780))

(declare-fun res!530289 () Bool)

(assert (=> b!783758 (=> (not res!530289) (not e!435780))))

(declare-fun lt!349339 () SeekEntryResult!8042)

(declare-fun lt!349340 () SeekEntryResult!8042)

(assert (=> b!783758 (= res!530289 (= lt!349339 lt!349340))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!783758 (= lt!349340 (Found!8042 j!159))))

(declare-datatypes ((array!42708 0))(
  ( (array!42709 (arr!20442 (Array (_ BitVec 32) (_ BitVec 64))) (size!20863 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42708)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42708 (_ BitVec 32)) SeekEntryResult!8042)

(assert (=> b!783758 (= lt!349339 (seekEntryOrOpen!0 (select (arr!20442 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42708 (_ BitVec 32)) Bool)

(assert (=> b!783758 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!27056 0))(
  ( (Unit!27057) )
))
(declare-fun lt!349334 () Unit!27056)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42708 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27056)

(assert (=> b!783758 (= lt!349334 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!783759 () Bool)

(declare-fun e!435785 () Unit!27056)

(declare-fun Unit!27058 () Unit!27056)

(assert (=> b!783759 (= e!435785 Unit!27058)))

(declare-fun b!783760 () Bool)

(declare-fun res!530291 () Bool)

(declare-fun e!435782 () Bool)

(assert (=> b!783760 (=> (not res!530291) (not e!435782))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!783760 (= res!530291 (and (= (size!20863 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20863 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20863 a!3186)) (not (= i!1173 j!159))))))

(declare-fun res!530277 () Bool)

(assert (=> start!67668 (=> (not res!530277) (not e!435782))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67668 (= res!530277 (validMask!0 mask!3328))))

(assert (=> start!67668 e!435782))

(assert (=> start!67668 true))

(declare-fun array_inv!16238 (array!42708) Bool)

(assert (=> start!67668 (array_inv!16238 a!3186)))

(declare-fun b!783761 () Bool)

(declare-fun e!435787 () Bool)

(declare-fun lt!349333 () SeekEntryResult!8042)

(assert (=> b!783761 (= e!435787 (= lt!349339 lt!349333))))

(declare-fun b!783762 () Bool)

(declare-fun e!435784 () Bool)

(assert (=> b!783762 (= e!435784 e!435781)))

(declare-fun res!530279 () Bool)

(assert (=> b!783762 (=> (not res!530279) (not e!435781))))

(declare-fun lt!349338 () SeekEntryResult!8042)

(assert (=> b!783762 (= res!530279 (= lt!349338 lt!349331))))

(declare-fun lt!349335 () (_ BitVec 64))

(declare-fun lt!349337 () array!42708)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42708 (_ BitVec 32)) SeekEntryResult!8042)

(assert (=> b!783762 (= lt!349331 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!349335 lt!349337 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!783762 (= lt!349338 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!349335 mask!3328) lt!349335 lt!349337 mask!3328))))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!783762 (= lt!349335 (select (store (arr!20442 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!783762 (= lt!349337 (array!42709 (store (arr!20442 a!3186) i!1173 k!2102) (size!20863 a!3186)))))

(declare-fun b!783763 () Bool)

(declare-fun res!530273 () Bool)

(assert (=> b!783763 (=> (not res!530273) (not e!435782))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!783763 (= res!530273 (validKeyInArray!0 (select (arr!20442 a!3186) j!159)))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun b!783764 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42708 (_ BitVec 32)) SeekEntryResult!8042)

(assert (=> b!783764 (= e!435780 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20442 a!3186) j!159) a!3186 mask!3328) lt!349340))))

(declare-fun e!435783 () Bool)

(declare-fun b!783765 () Bool)

(assert (=> b!783765 (= e!435783 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20442 a!3186) j!159) a!3186 mask!3328) (Found!8042 j!159)))))

(declare-fun b!783766 () Bool)

(declare-fun res!530284 () Bool)

(assert (=> b!783766 (=> (not res!530284) (not e!435784))))

(assert (=> b!783766 (= res!530284 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20442 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!783767 () Bool)

(declare-fun e!435778 () Bool)

(declare-fun e!435779 () Bool)

(assert (=> b!783767 (= e!435778 e!435779)))

(declare-fun res!530288 () Bool)

(assert (=> b!783767 (=> res!530288 e!435779)))

(declare-fun lt!349329 () (_ BitVec 64))

(assert (=> b!783767 (= res!530288 (= lt!349329 lt!349335))))

(assert (=> b!783767 (= lt!349329 (select (store (arr!20442 a!3186) i!1173 k!2102) index!1321))))

(declare-fun b!783768 () Bool)

(declare-fun res!530281 () Bool)

(declare-fun e!435786 () Bool)

(assert (=> b!783768 (=> (not res!530281) (not e!435786))))

(declare-datatypes ((List!14444 0))(
  ( (Nil!14441) (Cons!14440 (h!15563 (_ BitVec 64)) (t!20759 List!14444)) )
))
(declare-fun arrayNoDuplicates!0 (array!42708 (_ BitVec 32) List!14444) Bool)

(assert (=> b!783768 (= res!530281 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14441))))

(declare-fun b!783769 () Bool)

(assert (=> b!783769 (= e!435779 true)))

(assert (=> b!783769 e!435787))

(declare-fun res!530286 () Bool)

(assert (=> b!783769 (=> (not res!530286) (not e!435787))))

(assert (=> b!783769 (= res!530286 (= lt!349329 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!349336 () Unit!27056)

(assert (=> b!783769 (= lt!349336 e!435785)))

(declare-fun c!87151 () Bool)

(assert (=> b!783769 (= c!87151 (= lt!349329 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!783770 () Bool)

(assert (=> b!783770 (= e!435788 e!435778)))

(declare-fun res!530280 () Bool)

(assert (=> b!783770 (=> res!530280 e!435778)))

(assert (=> b!783770 (= res!530280 (not (= lt!349333 lt!349340)))))

(assert (=> b!783770 (= lt!349333 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20442 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!783771 () Bool)

(declare-fun res!530282 () Bool)

(assert (=> b!783771 (=> (not res!530282) (not e!435782))))

(declare-fun arrayContainsKey!0 (array!42708 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!783771 (= res!530282 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!783772 () Bool)

(declare-fun res!530276 () Bool)

(assert (=> b!783772 (=> (not res!530276) (not e!435787))))

(assert (=> b!783772 (= res!530276 (= (seekEntryOrOpen!0 lt!349335 lt!349337 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!349335 lt!349337 mask!3328)))))

(declare-fun b!783773 () Bool)

(declare-fun res!530278 () Bool)

(assert (=> b!783773 (=> (not res!530278) (not e!435786))))

(assert (=> b!783773 (= res!530278 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20863 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20863 a!3186))))))

(declare-fun b!783774 () Bool)

(assert (=> b!783774 (= e!435786 e!435784)))

(declare-fun res!530274 () Bool)

(assert (=> b!783774 (=> (not res!530274) (not e!435784))))

(declare-fun lt!349332 () SeekEntryResult!8042)

(assert (=> b!783774 (= res!530274 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20442 a!3186) j!159) mask!3328) (select (arr!20442 a!3186) j!159) a!3186 mask!3328) lt!349332))))

(assert (=> b!783774 (= lt!349332 (Intermediate!8042 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!783775 () Bool)

(declare-fun res!530283 () Bool)

(assert (=> b!783775 (=> (not res!530283) (not e!435786))))

(assert (=> b!783775 (= res!530283 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!783776 () Bool)

(assert (=> b!783776 (= e!435782 e!435786)))

(declare-fun res!530275 () Bool)

(assert (=> b!783776 (=> (not res!530275) (not e!435786))))

(declare-fun lt!349330 () SeekEntryResult!8042)

(assert (=> b!783776 (= res!530275 (or (= lt!349330 (MissingZero!8042 i!1173)) (= lt!349330 (MissingVacant!8042 i!1173))))))

(assert (=> b!783776 (= lt!349330 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!783777 () Bool)

(assert (=> b!783777 (= e!435783 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20442 a!3186) j!159) a!3186 mask!3328) lt!349332))))

(declare-fun b!783778 () Bool)

(declare-fun Unit!27059 () Unit!27056)

(assert (=> b!783778 (= e!435785 Unit!27059)))

(assert (=> b!783778 false))

(declare-fun b!783779 () Bool)

(declare-fun res!530290 () Bool)

(assert (=> b!783779 (=> (not res!530290) (not e!435784))))

(assert (=> b!783779 (= res!530290 e!435783)))

(declare-fun c!87150 () Bool)

(assert (=> b!783779 (= c!87150 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!783780 () Bool)

(declare-fun res!530287 () Bool)

(assert (=> b!783780 (=> (not res!530287) (not e!435782))))

(assert (=> b!783780 (= res!530287 (validKeyInArray!0 k!2102))))

(assert (= (and start!67668 res!530277) b!783760))

(assert (= (and b!783760 res!530291) b!783763))

(assert (= (and b!783763 res!530273) b!783780))

(assert (= (and b!783780 res!530287) b!783771))

(assert (= (and b!783771 res!530282) b!783776))

(assert (= (and b!783776 res!530275) b!783775))

(assert (= (and b!783775 res!530283) b!783768))

(assert (= (and b!783768 res!530281) b!783773))

(assert (= (and b!783773 res!530278) b!783774))

(assert (= (and b!783774 res!530274) b!783766))

(assert (= (and b!783766 res!530284) b!783779))

(assert (= (and b!783779 c!87150) b!783777))

(assert (= (and b!783779 (not c!87150)) b!783765))

(assert (= (and b!783779 res!530290) b!783762))

(assert (= (and b!783762 res!530279) b!783758))

(assert (= (and b!783758 res!530289) b!783764))

(assert (= (and b!783758 (not res!530285)) b!783770))

(assert (= (and b!783770 (not res!530280)) b!783767))

(assert (= (and b!783767 (not res!530288)) b!783769))

(assert (= (and b!783769 c!87151) b!783778))

(assert (= (and b!783769 (not c!87151)) b!783759))

(assert (= (and b!783769 res!530286) b!783772))

(assert (= (and b!783772 res!530276) b!783761))

(declare-fun m!726245 () Bool)

(assert (=> b!783763 m!726245))

(assert (=> b!783763 m!726245))

(declare-fun m!726247 () Bool)

(assert (=> b!783763 m!726247))

(assert (=> b!783777 m!726245))

(assert (=> b!783777 m!726245))

(declare-fun m!726249 () Bool)

(assert (=> b!783777 m!726249))

(declare-fun m!726251 () Bool)

(assert (=> b!783766 m!726251))

(declare-fun m!726253 () Bool)

(assert (=> b!783767 m!726253))

(declare-fun m!726255 () Bool)

(assert (=> b!783767 m!726255))

(assert (=> b!783758 m!726245))

(assert (=> b!783758 m!726245))

(declare-fun m!726257 () Bool)

(assert (=> b!783758 m!726257))

(declare-fun m!726259 () Bool)

(assert (=> b!783758 m!726259))

(declare-fun m!726261 () Bool)

(assert (=> b!783758 m!726261))

(declare-fun m!726263 () Bool)

(assert (=> b!783775 m!726263))

(assert (=> b!783762 m!726253))

(declare-fun m!726265 () Bool)

(assert (=> b!783762 m!726265))

(declare-fun m!726267 () Bool)

(assert (=> b!783762 m!726267))

(declare-fun m!726269 () Bool)

(assert (=> b!783762 m!726269))

(declare-fun m!726271 () Bool)

(assert (=> b!783762 m!726271))

(assert (=> b!783762 m!726267))

(declare-fun m!726273 () Bool)

(assert (=> b!783780 m!726273))

(declare-fun m!726275 () Bool)

(assert (=> b!783768 m!726275))

(assert (=> b!783765 m!726245))

(assert (=> b!783765 m!726245))

(declare-fun m!726277 () Bool)

(assert (=> b!783765 m!726277))

(assert (=> b!783764 m!726245))

(assert (=> b!783764 m!726245))

(declare-fun m!726279 () Bool)

(assert (=> b!783764 m!726279))

(assert (=> b!783774 m!726245))

(assert (=> b!783774 m!726245))

(declare-fun m!726281 () Bool)

(assert (=> b!783774 m!726281))

(assert (=> b!783774 m!726281))

(assert (=> b!783774 m!726245))

(declare-fun m!726283 () Bool)

(assert (=> b!783774 m!726283))

(declare-fun m!726285 () Bool)

(assert (=> b!783776 m!726285))

(declare-fun m!726287 () Bool)

(assert (=> start!67668 m!726287))

(declare-fun m!726289 () Bool)

(assert (=> start!67668 m!726289))

(declare-fun m!726291 () Bool)

(assert (=> b!783772 m!726291))

(declare-fun m!726293 () Bool)

(assert (=> b!783772 m!726293))

(declare-fun m!726295 () Bool)

(assert (=> b!783771 m!726295))

(assert (=> b!783770 m!726245))

(assert (=> b!783770 m!726245))

(assert (=> b!783770 m!726277))

(push 1)

