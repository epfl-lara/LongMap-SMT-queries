; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65568 () Bool)

(assert start!65568)

(declare-fun b!746084 () Bool)

(declare-fun res!502542 () Bool)

(declare-fun e!416776 () Bool)

(assert (=> b!746084 (=> (not res!502542) (not e!416776))))

(declare-datatypes ((array!41611 0))(
  ( (array!41612 (arr!19915 (Array (_ BitVec 32) (_ BitVec 64))) (size!20335 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41611)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!746084 (= res!502542 (validKeyInArray!0 (select (arr!19915 a!3186) j!159)))))

(declare-fun b!746085 () Bool)

(declare-fun res!502538 () Bool)

(assert (=> b!746085 (=> (not res!502538) (not e!416776))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!746085 (= res!502538 (validKeyInArray!0 k0!2102))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!746086 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun e!416771 () Bool)

(declare-datatypes ((SeekEntryResult!7471 0))(
  ( (MissingZero!7471 (index!32252 (_ BitVec 32))) (Found!7471 (index!32253 (_ BitVec 32))) (Intermediate!7471 (undefined!8283 Bool) (index!32254 (_ BitVec 32)) (x!63369 (_ BitVec 32))) (Undefined!7471) (MissingVacant!7471 (index!32255 (_ BitVec 32))) )
))
(declare-fun lt!331443 () SeekEntryResult!7471)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41611 (_ BitVec 32)) SeekEntryResult!7471)

(assert (=> b!746086 (= e!416771 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19915 a!3186) j!159) a!3186 mask!3328) lt!331443))))

(declare-fun b!746087 () Bool)

(declare-fun res!502533 () Bool)

(declare-fun e!416772 () Bool)

(assert (=> b!746087 (=> (not res!502533) (not e!416772))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41611 (_ BitVec 32)) Bool)

(assert (=> b!746087 (= res!502533 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun res!502544 () Bool)

(assert (=> start!65568 (=> (not res!502544) (not e!416776))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65568 (= res!502544 (validMask!0 mask!3328))))

(assert (=> start!65568 e!416776))

(assert (=> start!65568 true))

(declare-fun array_inv!15774 (array!41611) Bool)

(assert (=> start!65568 (array_inv!15774 a!3186)))

(declare-fun b!746088 () Bool)

(assert (=> b!746088 (= e!416776 e!416772)))

(declare-fun res!502539 () Bool)

(assert (=> b!746088 (=> (not res!502539) (not e!416772))))

(declare-fun lt!331439 () SeekEntryResult!7471)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!746088 (= res!502539 (or (= lt!331439 (MissingZero!7471 i!1173)) (= lt!331439 (MissingVacant!7471 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41611 (_ BitVec 32)) SeekEntryResult!7471)

(assert (=> b!746088 (= lt!331439 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!746089 () Bool)

(declare-fun e!416775 () Bool)

(declare-fun e!416773 () Bool)

(assert (=> b!746089 (= e!416775 (not e!416773))))

(declare-fun res!502541 () Bool)

(assert (=> b!746089 (=> res!502541 e!416773)))

(declare-fun lt!331436 () SeekEntryResult!7471)

(get-info :version)

(assert (=> b!746089 (= res!502541 (or (not ((_ is Intermediate!7471) lt!331436)) (bvslt x!1131 (x!63369 lt!331436)) (not (= x!1131 (x!63369 lt!331436))) (not (= index!1321 (index!32254 lt!331436)))))))

(declare-fun e!416778 () Bool)

(assert (=> b!746089 e!416778))

(declare-fun res!502536 () Bool)

(assert (=> b!746089 (=> (not res!502536) (not e!416778))))

(assert (=> b!746089 (= res!502536 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25501 0))(
  ( (Unit!25502) )
))
(declare-fun lt!331437 () Unit!25501)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41611 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25501)

(assert (=> b!746089 (= lt!331437 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!746090 () Bool)

(declare-fun res!502531 () Bool)

(assert (=> b!746090 (=> (not res!502531) (not e!416776))))

(declare-fun arrayContainsKey!0 (array!41611 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!746090 (= res!502531 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!746091 () Bool)

(declare-fun res!502545 () Bool)

(assert (=> b!746091 (=> (not res!502545) (not e!416776))))

(assert (=> b!746091 (= res!502545 (and (= (size!20335 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20335 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20335 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!746092 () Bool)

(declare-fun res!502535 () Bool)

(assert (=> b!746092 (=> (not res!502535) (not e!416772))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!746092 (= res!502535 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20335 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20335 a!3186))))))

(declare-fun b!746093 () Bool)

(assert (=> b!746093 (= e!416773 true)))

(declare-fun lt!331441 () SeekEntryResult!7471)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41611 (_ BitVec 32)) SeekEntryResult!7471)

(assert (=> b!746093 (= lt!331441 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19915 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!746094 () Bool)

(declare-fun e!416774 () Bool)

(assert (=> b!746094 (= e!416778 e!416774)))

(declare-fun res!502532 () Bool)

(assert (=> b!746094 (=> (not res!502532) (not e!416774))))

(declare-fun lt!331435 () SeekEntryResult!7471)

(assert (=> b!746094 (= res!502532 (= (seekEntryOrOpen!0 (select (arr!19915 a!3186) j!159) a!3186 mask!3328) lt!331435))))

(assert (=> b!746094 (= lt!331435 (Found!7471 j!159))))

(declare-fun b!746095 () Bool)

(declare-fun e!416777 () Bool)

(assert (=> b!746095 (= e!416772 e!416777)))

(declare-fun res!502534 () Bool)

(assert (=> b!746095 (=> (not res!502534) (not e!416777))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!746095 (= res!502534 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19915 a!3186) j!159) mask!3328) (select (arr!19915 a!3186) j!159) a!3186 mask!3328) lt!331443))))

(assert (=> b!746095 (= lt!331443 (Intermediate!7471 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!746096 () Bool)

(declare-fun res!502537 () Bool)

(assert (=> b!746096 (=> (not res!502537) (not e!416777))))

(assert (=> b!746096 (= res!502537 e!416771)))

(declare-fun c!82160 () Bool)

(assert (=> b!746096 (= c!82160 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!746097 () Bool)

(declare-fun res!502540 () Bool)

(assert (=> b!746097 (=> (not res!502540) (not e!416777))))

(assert (=> b!746097 (= res!502540 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19915 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!746098 () Bool)

(assert (=> b!746098 (= e!416771 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19915 a!3186) j!159) a!3186 mask!3328) (Found!7471 j!159)))))

(declare-fun b!746099 () Bool)

(assert (=> b!746099 (= e!416777 e!416775)))

(declare-fun res!502543 () Bool)

(assert (=> b!746099 (=> (not res!502543) (not e!416775))))

(declare-fun lt!331438 () SeekEntryResult!7471)

(assert (=> b!746099 (= res!502543 (= lt!331438 lt!331436))))

(declare-fun lt!331440 () (_ BitVec 64))

(declare-fun lt!331442 () array!41611)

(assert (=> b!746099 (= lt!331436 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!331440 lt!331442 mask!3328))))

(assert (=> b!746099 (= lt!331438 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!331440 mask!3328) lt!331440 lt!331442 mask!3328))))

(assert (=> b!746099 (= lt!331440 (select (store (arr!19915 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!746099 (= lt!331442 (array!41612 (store (arr!19915 a!3186) i!1173 k0!2102) (size!20335 a!3186)))))

(declare-fun b!746100 () Bool)

(assert (=> b!746100 (= e!416774 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19915 a!3186) j!159) a!3186 mask!3328) lt!331435))))

(declare-fun b!746101 () Bool)

(declare-fun res!502546 () Bool)

(assert (=> b!746101 (=> (not res!502546) (not e!416772))))

(declare-datatypes ((List!13824 0))(
  ( (Nil!13821) (Cons!13820 (h!14898 (_ BitVec 64)) (t!20131 List!13824)) )
))
(declare-fun arrayNoDuplicates!0 (array!41611 (_ BitVec 32) List!13824) Bool)

(assert (=> b!746101 (= res!502546 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13821))))

(assert (= (and start!65568 res!502544) b!746091))

(assert (= (and b!746091 res!502545) b!746084))

(assert (= (and b!746084 res!502542) b!746085))

(assert (= (and b!746085 res!502538) b!746090))

(assert (= (and b!746090 res!502531) b!746088))

(assert (= (and b!746088 res!502539) b!746087))

(assert (= (and b!746087 res!502533) b!746101))

(assert (= (and b!746101 res!502546) b!746092))

(assert (= (and b!746092 res!502535) b!746095))

(assert (= (and b!746095 res!502534) b!746097))

(assert (= (and b!746097 res!502540) b!746096))

(assert (= (and b!746096 c!82160) b!746086))

(assert (= (and b!746096 (not c!82160)) b!746098))

(assert (= (and b!746096 res!502537) b!746099))

(assert (= (and b!746099 res!502543) b!746089))

(assert (= (and b!746089 res!502536) b!746094))

(assert (= (and b!746094 res!502532) b!746100))

(assert (= (and b!746089 (not res!502541)) b!746093))

(declare-fun m!696891 () Bool)

(assert (=> b!746094 m!696891))

(assert (=> b!746094 m!696891))

(declare-fun m!696893 () Bool)

(assert (=> b!746094 m!696893))

(declare-fun m!696895 () Bool)

(assert (=> b!746088 m!696895))

(assert (=> b!746095 m!696891))

(assert (=> b!746095 m!696891))

(declare-fun m!696897 () Bool)

(assert (=> b!746095 m!696897))

(assert (=> b!746095 m!696897))

(assert (=> b!746095 m!696891))

(declare-fun m!696899 () Bool)

(assert (=> b!746095 m!696899))

(declare-fun m!696901 () Bool)

(assert (=> start!65568 m!696901))

(declare-fun m!696903 () Bool)

(assert (=> start!65568 m!696903))

(assert (=> b!746100 m!696891))

(assert (=> b!746100 m!696891))

(declare-fun m!696905 () Bool)

(assert (=> b!746100 m!696905))

(assert (=> b!746093 m!696891))

(assert (=> b!746093 m!696891))

(declare-fun m!696907 () Bool)

(assert (=> b!746093 m!696907))

(declare-fun m!696909 () Bool)

(assert (=> b!746097 m!696909))

(declare-fun m!696911 () Bool)

(assert (=> b!746099 m!696911))

(declare-fun m!696913 () Bool)

(assert (=> b!746099 m!696913))

(declare-fun m!696915 () Bool)

(assert (=> b!746099 m!696915))

(declare-fun m!696917 () Bool)

(assert (=> b!746099 m!696917))

(assert (=> b!746099 m!696911))

(declare-fun m!696919 () Bool)

(assert (=> b!746099 m!696919))

(declare-fun m!696921 () Bool)

(assert (=> b!746101 m!696921))

(declare-fun m!696923 () Bool)

(assert (=> b!746085 m!696923))

(assert (=> b!746086 m!696891))

(assert (=> b!746086 m!696891))

(declare-fun m!696925 () Bool)

(assert (=> b!746086 m!696925))

(assert (=> b!746098 m!696891))

(assert (=> b!746098 m!696891))

(assert (=> b!746098 m!696907))

(assert (=> b!746084 m!696891))

(assert (=> b!746084 m!696891))

(declare-fun m!696927 () Bool)

(assert (=> b!746084 m!696927))

(declare-fun m!696929 () Bool)

(assert (=> b!746089 m!696929))

(declare-fun m!696931 () Bool)

(assert (=> b!746089 m!696931))

(declare-fun m!696933 () Bool)

(assert (=> b!746090 m!696933))

(declare-fun m!696935 () Bool)

(assert (=> b!746087 m!696935))

(check-sat (not b!746084) (not b!746086) (not b!746089) (not b!746093) (not b!746090) (not b!746088) (not b!746100) (not b!746099) (not b!746094) (not start!65568) (not b!746087) (not b!746095) (not b!746085) (not b!746101) (not b!746098))
(check-sat)
