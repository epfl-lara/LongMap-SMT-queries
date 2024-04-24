; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67804 () Bool)

(assert start!67804)

(declare-fun res!531068 () Bool)

(declare-fun e!436527 () Bool)

(assert (=> start!67804 (=> (not res!531068) (not e!436527))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67804 (= res!531068 (validMask!0 mask!3328))))

(assert (=> start!67804 e!436527))

(assert (=> start!67804 true))

(declare-datatypes ((array!42724 0))(
  ( (array!42725 (arr!20446 (Array (_ BitVec 32) (_ BitVec 64))) (size!20866 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42724)

(declare-fun array_inv!16305 (array!42724) Bool)

(assert (=> start!67804 (array_inv!16305 a!3186)))

(declare-fun b!785024 () Bool)

(declare-fun e!436524 () Bool)

(declare-datatypes ((SeekEntryResult!8002 0))(
  ( (MissingZero!8002 (index!34376 (_ BitVec 32))) (Found!8002 (index!34377 (_ BitVec 32))) (Intermediate!8002 (undefined!8814 Bool) (index!34378 (_ BitVec 32)) (x!65489 (_ BitVec 32))) (Undefined!8002) (MissingVacant!8002 (index!34379 (_ BitVec 32))) )
))
(declare-fun lt!349928 () SeekEntryResult!8002)

(declare-fun lt!349927 () SeekEntryResult!8002)

(assert (=> b!785024 (= e!436524 (= lt!349928 lt!349927))))

(declare-fun e!436518 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!785025 () Bool)

(declare-fun lt!349931 () SeekEntryResult!8002)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42724 (_ BitVec 32)) SeekEntryResult!8002)

(assert (=> b!785025 (= e!436518 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20446 a!3186) j!159) a!3186 mask!3328) lt!349931))))

(declare-fun b!785026 () Bool)

(declare-fun res!531064 () Bool)

(assert (=> b!785026 (=> (not res!531064) (not e!436527))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!785026 (= res!531064 (and (= (size!20866 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20866 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20866 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!785027 () Bool)

(declare-fun e!436528 () Bool)

(declare-fun e!436517 () Bool)

(assert (=> b!785027 (= e!436528 e!436517)))

(declare-fun res!531070 () Bool)

(assert (=> b!785027 (=> res!531070 e!436517)))

(declare-fun lt!349926 () (_ BitVec 64))

(declare-fun lt!349935 () (_ BitVec 64))

(assert (=> b!785027 (= res!531070 (= lt!349926 lt!349935))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!785027 (= lt!349926 (select (store (arr!20446 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!785028 () Bool)

(declare-fun res!531057 () Bool)

(declare-fun e!436523 () Bool)

(assert (=> b!785028 (=> (not res!531057) (not e!436523))))

(assert (=> b!785028 (= res!531057 e!436518)))

(declare-fun c!87395 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!785028 (= c!87395 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!785029 () Bool)

(declare-fun res!531065 () Bool)

(assert (=> b!785029 (=> (not res!531065) (not e!436523))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!785029 (= res!531065 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20446 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!785030 () Bool)

(declare-fun e!436525 () Bool)

(assert (=> b!785030 (= e!436523 e!436525)))

(declare-fun res!531059 () Bool)

(assert (=> b!785030 (=> (not res!531059) (not e!436525))))

(declare-fun lt!349932 () SeekEntryResult!8002)

(declare-fun lt!349930 () SeekEntryResult!8002)

(assert (=> b!785030 (= res!531059 (= lt!349932 lt!349930))))

(declare-fun lt!349929 () array!42724)

(assert (=> b!785030 (= lt!349930 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!349935 lt!349929 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!785030 (= lt!349932 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!349935 mask!3328) lt!349935 lt!349929 mask!3328))))

(assert (=> b!785030 (= lt!349935 (select (store (arr!20446 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!785030 (= lt!349929 (array!42725 (store (arr!20446 a!3186) i!1173 k0!2102) (size!20866 a!3186)))))

(declare-fun b!785031 () Bool)

(declare-fun res!531071 () Bool)

(declare-fun e!436520 () Bool)

(assert (=> b!785031 (=> (not res!531071) (not e!436520))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42724 (_ BitVec 32)) Bool)

(assert (=> b!785031 (= res!531071 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!785032 () Bool)

(declare-datatypes ((Unit!27073 0))(
  ( (Unit!27074) )
))
(declare-fun e!436522 () Unit!27073)

(declare-fun Unit!27075 () Unit!27073)

(assert (=> b!785032 (= e!436522 Unit!27075)))

(assert (=> b!785032 false))

(declare-fun b!785033 () Bool)

(declare-fun res!531069 () Bool)

(assert (=> b!785033 (=> (not res!531069) (not e!436527))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!785033 (= res!531069 (validKeyInArray!0 k0!2102))))

(declare-fun b!785034 () Bool)

(declare-fun res!531067 () Bool)

(assert (=> b!785034 (=> (not res!531067) (not e!436527))))

(declare-fun arrayContainsKey!0 (array!42724 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!785034 (= res!531067 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!785035 () Bool)

(assert (=> b!785035 (= e!436527 e!436520)))

(declare-fun res!531066 () Bool)

(assert (=> b!785035 (=> (not res!531066) (not e!436520))))

(declare-fun lt!349933 () SeekEntryResult!8002)

(assert (=> b!785035 (= res!531066 (or (= lt!349933 (MissingZero!8002 i!1173)) (= lt!349933 (MissingVacant!8002 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42724 (_ BitVec 32)) SeekEntryResult!8002)

(assert (=> b!785035 (= lt!349933 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!785036 () Bool)

(declare-fun res!531073 () Bool)

(assert (=> b!785036 (=> (not res!531073) (not e!436520))))

(declare-datatypes ((List!14355 0))(
  ( (Nil!14352) (Cons!14351 (h!15480 (_ BitVec 64)) (t!20662 List!14355)) )
))
(declare-fun arrayNoDuplicates!0 (array!42724 (_ BitVec 32) List!14355) Bool)

(assert (=> b!785036 (= res!531073 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14352))))

(declare-fun b!785037 () Bool)

(declare-fun res!531063 () Bool)

(assert (=> b!785037 (=> (not res!531063) (not e!436524))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42724 (_ BitVec 32)) SeekEntryResult!8002)

(assert (=> b!785037 (= res!531063 (= (seekEntryOrOpen!0 lt!349935 lt!349929 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!349935 lt!349929 mask!3328)))))

(declare-fun b!785038 () Bool)

(assert (=> b!785038 (= e!436518 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20446 a!3186) j!159) a!3186 mask!3328) (Found!8002 j!159)))))

(declare-fun b!785039 () Bool)

(declare-fun res!531061 () Bool)

(assert (=> b!785039 (=> (not res!531061) (not e!436520))))

(assert (=> b!785039 (= res!531061 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20866 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20866 a!3186))))))

(declare-fun b!785040 () Bool)

(declare-fun res!531072 () Bool)

(assert (=> b!785040 (=> (not res!531072) (not e!436527))))

(assert (=> b!785040 (= res!531072 (validKeyInArray!0 (select (arr!20446 a!3186) j!159)))))

(declare-fun b!785041 () Bool)

(declare-fun Unit!27076 () Unit!27073)

(assert (=> b!785041 (= e!436522 Unit!27076)))

(declare-fun b!785042 () Bool)

(declare-fun lt!349925 () SeekEntryResult!8002)

(declare-fun e!436521 () Bool)

(assert (=> b!785042 (= e!436521 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20446 a!3186) j!159) a!3186 mask!3328) lt!349925))))

(declare-fun b!785043 () Bool)

(declare-fun e!436519 () Bool)

(assert (=> b!785043 (= e!436525 (not e!436519))))

(declare-fun res!531062 () Bool)

(assert (=> b!785043 (=> res!531062 e!436519)))

(get-info :version)

(assert (=> b!785043 (= res!531062 (or (not ((_ is Intermediate!8002) lt!349930)) (bvslt x!1131 (x!65489 lt!349930)) (not (= x!1131 (x!65489 lt!349930))) (not (= index!1321 (index!34378 lt!349930)))))))

(assert (=> b!785043 e!436521))

(declare-fun res!531058 () Bool)

(assert (=> b!785043 (=> (not res!531058) (not e!436521))))

(assert (=> b!785043 (= res!531058 (= lt!349928 lt!349925))))

(assert (=> b!785043 (= lt!349925 (Found!8002 j!159))))

(assert (=> b!785043 (= lt!349928 (seekEntryOrOpen!0 (select (arr!20446 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!785043 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!349934 () Unit!27073)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42724 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27073)

(assert (=> b!785043 (= lt!349934 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!785044 () Bool)

(assert (=> b!785044 (= e!436517 true)))

(assert (=> b!785044 e!436524))

(declare-fun res!531075 () Bool)

(assert (=> b!785044 (=> (not res!531075) (not e!436524))))

(assert (=> b!785044 (= res!531075 (= lt!349926 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!349936 () Unit!27073)

(assert (=> b!785044 (= lt!349936 e!436522)))

(declare-fun c!87394 () Bool)

(assert (=> b!785044 (= c!87394 (= lt!349926 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!785045 () Bool)

(assert (=> b!785045 (= e!436520 e!436523)))

(declare-fun res!531074 () Bool)

(assert (=> b!785045 (=> (not res!531074) (not e!436523))))

(assert (=> b!785045 (= res!531074 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20446 a!3186) j!159) mask!3328) (select (arr!20446 a!3186) j!159) a!3186 mask!3328) lt!349931))))

(assert (=> b!785045 (= lt!349931 (Intermediate!8002 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!785046 () Bool)

(assert (=> b!785046 (= e!436519 e!436528)))

(declare-fun res!531060 () Bool)

(assert (=> b!785046 (=> res!531060 e!436528)))

(assert (=> b!785046 (= res!531060 (not (= lt!349927 lt!349925)))))

(assert (=> b!785046 (= lt!349927 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20446 a!3186) j!159) a!3186 mask!3328))))

(assert (= (and start!67804 res!531068) b!785026))

(assert (= (and b!785026 res!531064) b!785040))

(assert (= (and b!785040 res!531072) b!785033))

(assert (= (and b!785033 res!531069) b!785034))

(assert (= (and b!785034 res!531067) b!785035))

(assert (= (and b!785035 res!531066) b!785031))

(assert (= (and b!785031 res!531071) b!785036))

(assert (= (and b!785036 res!531073) b!785039))

(assert (= (and b!785039 res!531061) b!785045))

(assert (= (and b!785045 res!531074) b!785029))

(assert (= (and b!785029 res!531065) b!785028))

(assert (= (and b!785028 c!87395) b!785025))

(assert (= (and b!785028 (not c!87395)) b!785038))

(assert (= (and b!785028 res!531057) b!785030))

(assert (= (and b!785030 res!531059) b!785043))

(assert (= (and b!785043 res!531058) b!785042))

(assert (= (and b!785043 (not res!531062)) b!785046))

(assert (= (and b!785046 (not res!531060)) b!785027))

(assert (= (and b!785027 (not res!531070)) b!785044))

(assert (= (and b!785044 c!87394) b!785032))

(assert (= (and b!785044 (not c!87394)) b!785041))

(assert (= (and b!785044 res!531075) b!785037))

(assert (= (and b!785037 res!531063) b!785024))

(declare-fun m!727775 () Bool)

(assert (=> b!785038 m!727775))

(assert (=> b!785038 m!727775))

(declare-fun m!727777 () Bool)

(assert (=> b!785038 m!727777))

(assert (=> b!785043 m!727775))

(assert (=> b!785043 m!727775))

(declare-fun m!727779 () Bool)

(assert (=> b!785043 m!727779))

(declare-fun m!727781 () Bool)

(assert (=> b!785043 m!727781))

(declare-fun m!727783 () Bool)

(assert (=> b!785043 m!727783))

(declare-fun m!727785 () Bool)

(assert (=> b!785033 m!727785))

(declare-fun m!727787 () Bool)

(assert (=> b!785034 m!727787))

(declare-fun m!727789 () Bool)

(assert (=> b!785036 m!727789))

(assert (=> b!785042 m!727775))

(assert (=> b!785042 m!727775))

(declare-fun m!727791 () Bool)

(assert (=> b!785042 m!727791))

(declare-fun m!727793 () Bool)

(assert (=> b!785030 m!727793))

(declare-fun m!727795 () Bool)

(assert (=> b!785030 m!727795))

(declare-fun m!727797 () Bool)

(assert (=> b!785030 m!727797))

(declare-fun m!727799 () Bool)

(assert (=> b!785030 m!727799))

(declare-fun m!727801 () Bool)

(assert (=> b!785030 m!727801))

(assert (=> b!785030 m!727799))

(declare-fun m!727803 () Bool)

(assert (=> b!785035 m!727803))

(assert (=> b!785025 m!727775))

(assert (=> b!785025 m!727775))

(declare-fun m!727805 () Bool)

(assert (=> b!785025 m!727805))

(assert (=> b!785046 m!727775))

(assert (=> b!785046 m!727775))

(assert (=> b!785046 m!727777))

(assert (=> b!785040 m!727775))

(assert (=> b!785040 m!727775))

(declare-fun m!727807 () Bool)

(assert (=> b!785040 m!727807))

(declare-fun m!727809 () Bool)

(assert (=> b!785037 m!727809))

(declare-fun m!727811 () Bool)

(assert (=> b!785037 m!727811))

(declare-fun m!727813 () Bool)

(assert (=> b!785029 m!727813))

(assert (=> b!785027 m!727793))

(declare-fun m!727815 () Bool)

(assert (=> b!785027 m!727815))

(assert (=> b!785045 m!727775))

(assert (=> b!785045 m!727775))

(declare-fun m!727817 () Bool)

(assert (=> b!785045 m!727817))

(assert (=> b!785045 m!727817))

(assert (=> b!785045 m!727775))

(declare-fun m!727819 () Bool)

(assert (=> b!785045 m!727819))

(declare-fun m!727821 () Bool)

(assert (=> b!785031 m!727821))

(declare-fun m!727823 () Bool)

(assert (=> start!67804 m!727823))

(declare-fun m!727825 () Bool)

(assert (=> start!67804 m!727825))

(check-sat (not b!785043) (not b!785038) (not b!785045) (not b!785042) (not b!785025) (not b!785046) (not b!785034) (not b!785031) (not b!785033) (not b!785030) (not b!785040) (not start!67804) (not b!785036) (not b!785037) (not b!785035))
(check-sat)
