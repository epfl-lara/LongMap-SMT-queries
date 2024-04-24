; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67888 () Bool)

(assert start!67888)

(declare-fun b!787922 () Bool)

(declare-fun res!533452 () Bool)

(declare-fun e!438031 () Bool)

(assert (=> b!787922 (=> (not res!533452) (not e!438031))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42808 0))(
  ( (array!42809 (arr!20488 (Array (_ BitVec 32) (_ BitVec 64))) (size!20908 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42808)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!787922 (= res!533452 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20908 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20908 a!3186))))))

(declare-fun b!787923 () Bool)

(declare-fun e!438030 () Bool)

(declare-fun e!438032 () Bool)

(assert (=> b!787923 (= e!438030 (not e!438032))))

(declare-fun res!533464 () Bool)

(assert (=> b!787923 (=> res!533464 e!438032)))

(declare-datatypes ((SeekEntryResult!8044 0))(
  ( (MissingZero!8044 (index!34544 (_ BitVec 32))) (Found!8044 (index!34545 (_ BitVec 32))) (Intermediate!8044 (undefined!8856 Bool) (index!34546 (_ BitVec 32)) (x!65643 (_ BitVec 32))) (Undefined!8044) (MissingVacant!8044 (index!34547 (_ BitVec 32))) )
))
(declare-fun lt!351440 () SeekEntryResult!8044)

(get-info :version)

(assert (=> b!787923 (= res!533464 (or (not ((_ is Intermediate!8044) lt!351440)) (bvslt x!1131 (x!65643 lt!351440)) (not (= x!1131 (x!65643 lt!351440))) (not (= index!1321 (index!34546 lt!351440)))))))

(declare-fun e!438038 () Bool)

(assert (=> b!787923 e!438038))

(declare-fun res!533460 () Bool)

(assert (=> b!787923 (=> (not res!533460) (not e!438038))))

(declare-fun lt!351447 () SeekEntryResult!8044)

(declare-fun lt!351444 () SeekEntryResult!8044)

(assert (=> b!787923 (= res!533460 (= lt!351447 lt!351444))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!787923 (= lt!351444 (Found!8044 j!159))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42808 (_ BitVec 32)) SeekEntryResult!8044)

(assert (=> b!787923 (= lt!351447 (seekEntryOrOpen!0 (select (arr!20488 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42808 (_ BitVec 32)) Bool)

(assert (=> b!787923 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!27241 0))(
  ( (Unit!27242) )
))
(declare-fun lt!351437 () Unit!27241)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42808 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27241)

(assert (=> b!787923 (= lt!351437 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!787924 () Bool)

(declare-fun e!438039 () Bool)

(declare-fun lt!351442 () SeekEntryResult!8044)

(assert (=> b!787924 (= e!438039 (= lt!351447 lt!351442))))

(declare-fun b!787925 () Bool)

(declare-fun res!533453 () Bool)

(assert (=> b!787925 (=> (not res!533453) (not e!438039))))

(declare-fun lt!351439 () (_ BitVec 64))

(declare-fun lt!351443 () array!42808)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42808 (_ BitVec 32)) SeekEntryResult!8044)

(assert (=> b!787925 (= res!533453 (= (seekEntryOrOpen!0 lt!351439 lt!351443 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!351439 lt!351443 mask!3328)))))

(declare-fun b!787926 () Bool)

(declare-fun e!438036 () Bool)

(assert (=> b!787926 (= e!438032 e!438036)))

(declare-fun res!533469 () Bool)

(assert (=> b!787926 (=> res!533469 e!438036)))

(assert (=> b!787926 (= res!533469 (not (= lt!351442 lt!351444)))))

(assert (=> b!787926 (= lt!351442 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20488 a!3186) j!159) a!3186 mask!3328))))

(declare-fun res!533463 () Bool)

(declare-fun e!438034 () Bool)

(assert (=> start!67888 (=> (not res!533463) (not e!438034))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67888 (= res!533463 (validMask!0 mask!3328))))

(assert (=> start!67888 e!438034))

(assert (=> start!67888 true))

(declare-fun array_inv!16347 (array!42808) Bool)

(assert (=> start!67888 (array_inv!16347 a!3186)))

(declare-fun b!787927 () Bool)

(declare-fun e!438035 () Bool)

(assert (=> b!787927 (= e!438036 e!438035)))

(declare-fun res!533462 () Bool)

(assert (=> b!787927 (=> res!533462 e!438035)))

(declare-fun lt!351441 () (_ BitVec 64))

(assert (=> b!787927 (= res!533462 (= lt!351441 lt!351439))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!787927 (= lt!351441 (select (store (arr!20488 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!787928 () Bool)

(declare-fun res!533465 () Bool)

(assert (=> b!787928 (=> (not res!533465) (not e!438031))))

(assert (=> b!787928 (= res!533465 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!787929 () Bool)

(declare-fun res!533456 () Bool)

(assert (=> b!787929 (=> (not res!533456) (not e!438031))))

(declare-datatypes ((List!14397 0))(
  ( (Nil!14394) (Cons!14393 (h!15522 (_ BitVec 64)) (t!20704 List!14397)) )
))
(declare-fun arrayNoDuplicates!0 (array!42808 (_ BitVec 32) List!14397) Bool)

(assert (=> b!787929 (= res!533456 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14394))))

(declare-fun b!787930 () Bool)

(declare-fun res!533455 () Bool)

(assert (=> b!787930 (=> (not res!533455) (not e!438034))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!787930 (= res!533455 (validKeyInArray!0 k0!2102))))

(declare-fun b!787931 () Bool)

(assert (=> b!787931 (= e!438038 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20488 a!3186) j!159) a!3186 mask!3328) lt!351444))))

(declare-fun b!787932 () Bool)

(declare-fun e!438037 () Unit!27241)

(declare-fun Unit!27243 () Unit!27241)

(assert (=> b!787932 (= e!438037 Unit!27243)))

(assert (=> b!787932 false))

(declare-fun b!787933 () Bool)

(assert (=> b!787933 (= e!438035 true)))

(assert (=> b!787933 e!438039))

(declare-fun res!533451 () Bool)

(assert (=> b!787933 (=> (not res!533451) (not e!438039))))

(assert (=> b!787933 (= res!533451 (= lt!351441 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!351438 () Unit!27241)

(assert (=> b!787933 (= lt!351438 e!438037)))

(declare-fun c!87647 () Bool)

(assert (=> b!787933 (= c!87647 (= lt!351441 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!787934 () Bool)

(assert (=> b!787934 (= e!438034 e!438031)))

(declare-fun res!533457 () Bool)

(assert (=> b!787934 (=> (not res!533457) (not e!438031))))

(declare-fun lt!351446 () SeekEntryResult!8044)

(assert (=> b!787934 (= res!533457 (or (= lt!351446 (MissingZero!8044 i!1173)) (= lt!351446 (MissingVacant!8044 i!1173))))))

(assert (=> b!787934 (= lt!351446 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!787935 () Bool)

(declare-fun e!438033 () Bool)

(assert (=> b!787935 (= e!438031 e!438033)))

(declare-fun res!533468 () Bool)

(assert (=> b!787935 (=> (not res!533468) (not e!438033))))

(declare-fun lt!351445 () SeekEntryResult!8044)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42808 (_ BitVec 32)) SeekEntryResult!8044)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!787935 (= res!533468 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20488 a!3186) j!159) mask!3328) (select (arr!20488 a!3186) j!159) a!3186 mask!3328) lt!351445))))

(assert (=> b!787935 (= lt!351445 (Intermediate!8044 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!787936 () Bool)

(declare-fun res!533466 () Bool)

(assert (=> b!787936 (=> (not res!533466) (not e!438034))))

(assert (=> b!787936 (= res!533466 (and (= (size!20908 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20908 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20908 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!787937 () Bool)

(declare-fun e!438040 () Bool)

(assert (=> b!787937 (= e!438040 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20488 a!3186) j!159) a!3186 mask!3328) (Found!8044 j!159)))))

(declare-fun b!787938 () Bool)

(declare-fun Unit!27244 () Unit!27241)

(assert (=> b!787938 (= e!438037 Unit!27244)))

(declare-fun b!787939 () Bool)

(declare-fun res!533459 () Bool)

(assert (=> b!787939 (=> (not res!533459) (not e!438034))))

(assert (=> b!787939 (= res!533459 (validKeyInArray!0 (select (arr!20488 a!3186) j!159)))))

(declare-fun b!787940 () Bool)

(assert (=> b!787940 (= e!438040 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20488 a!3186) j!159) a!3186 mask!3328) lt!351445))))

(declare-fun b!787941 () Bool)

(declare-fun res!533461 () Bool)

(assert (=> b!787941 (=> (not res!533461) (not e!438033))))

(assert (=> b!787941 (= res!533461 e!438040)))

(declare-fun c!87646 () Bool)

(assert (=> b!787941 (= c!87646 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!787942 () Bool)

(assert (=> b!787942 (= e!438033 e!438030)))

(declare-fun res!533467 () Bool)

(assert (=> b!787942 (=> (not res!533467) (not e!438030))))

(declare-fun lt!351448 () SeekEntryResult!8044)

(assert (=> b!787942 (= res!533467 (= lt!351448 lt!351440))))

(assert (=> b!787942 (= lt!351440 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!351439 lt!351443 mask!3328))))

(assert (=> b!787942 (= lt!351448 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!351439 mask!3328) lt!351439 lt!351443 mask!3328))))

(assert (=> b!787942 (= lt!351439 (select (store (arr!20488 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!787942 (= lt!351443 (array!42809 (store (arr!20488 a!3186) i!1173 k0!2102) (size!20908 a!3186)))))

(declare-fun b!787943 () Bool)

(declare-fun res!533454 () Bool)

(assert (=> b!787943 (=> (not res!533454) (not e!438034))))

(declare-fun arrayContainsKey!0 (array!42808 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!787943 (= res!533454 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!787944 () Bool)

(declare-fun res!533458 () Bool)

(assert (=> b!787944 (=> (not res!533458) (not e!438033))))

(assert (=> b!787944 (= res!533458 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20488 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!67888 res!533463) b!787936))

(assert (= (and b!787936 res!533466) b!787939))

(assert (= (and b!787939 res!533459) b!787930))

(assert (= (and b!787930 res!533455) b!787943))

(assert (= (and b!787943 res!533454) b!787934))

(assert (= (and b!787934 res!533457) b!787928))

(assert (= (and b!787928 res!533465) b!787929))

(assert (= (and b!787929 res!533456) b!787922))

(assert (= (and b!787922 res!533452) b!787935))

(assert (= (and b!787935 res!533468) b!787944))

(assert (= (and b!787944 res!533458) b!787941))

(assert (= (and b!787941 c!87646) b!787940))

(assert (= (and b!787941 (not c!87646)) b!787937))

(assert (= (and b!787941 res!533461) b!787942))

(assert (= (and b!787942 res!533467) b!787923))

(assert (= (and b!787923 res!533460) b!787931))

(assert (= (and b!787923 (not res!533464)) b!787926))

(assert (= (and b!787926 (not res!533469)) b!787927))

(assert (= (and b!787927 (not res!533462)) b!787933))

(assert (= (and b!787933 c!87647) b!787932))

(assert (= (and b!787933 (not c!87647)) b!787938))

(assert (= (and b!787933 res!533451) b!787925))

(assert (= (and b!787925 res!533453) b!787924))

(declare-fun m!729959 () Bool)

(assert (=> b!787942 m!729959))

(assert (=> b!787942 m!729959))

(declare-fun m!729961 () Bool)

(assert (=> b!787942 m!729961))

(declare-fun m!729963 () Bool)

(assert (=> b!787942 m!729963))

(declare-fun m!729965 () Bool)

(assert (=> b!787942 m!729965))

(declare-fun m!729967 () Bool)

(assert (=> b!787942 m!729967))

(declare-fun m!729969 () Bool)

(assert (=> b!787930 m!729969))

(declare-fun m!729971 () Bool)

(assert (=> b!787937 m!729971))

(assert (=> b!787937 m!729971))

(declare-fun m!729973 () Bool)

(assert (=> b!787937 m!729973))

(declare-fun m!729975 () Bool)

(assert (=> b!787928 m!729975))

(assert (=> b!787939 m!729971))

(assert (=> b!787939 m!729971))

(declare-fun m!729977 () Bool)

(assert (=> b!787939 m!729977))

(assert (=> b!787926 m!729971))

(assert (=> b!787926 m!729971))

(assert (=> b!787926 m!729973))

(assert (=> b!787935 m!729971))

(assert (=> b!787935 m!729971))

(declare-fun m!729979 () Bool)

(assert (=> b!787935 m!729979))

(assert (=> b!787935 m!729979))

(assert (=> b!787935 m!729971))

(declare-fun m!729981 () Bool)

(assert (=> b!787935 m!729981))

(assert (=> b!787931 m!729971))

(assert (=> b!787931 m!729971))

(declare-fun m!729983 () Bool)

(assert (=> b!787931 m!729983))

(declare-fun m!729985 () Bool)

(assert (=> b!787929 m!729985))

(declare-fun m!729987 () Bool)

(assert (=> start!67888 m!729987))

(declare-fun m!729989 () Bool)

(assert (=> start!67888 m!729989))

(declare-fun m!729991 () Bool)

(assert (=> b!787944 m!729991))

(declare-fun m!729993 () Bool)

(assert (=> b!787943 m!729993))

(declare-fun m!729995 () Bool)

(assert (=> b!787934 m!729995))

(assert (=> b!787940 m!729971))

(assert (=> b!787940 m!729971))

(declare-fun m!729997 () Bool)

(assert (=> b!787940 m!729997))

(declare-fun m!729999 () Bool)

(assert (=> b!787925 m!729999))

(declare-fun m!730001 () Bool)

(assert (=> b!787925 m!730001))

(assert (=> b!787923 m!729971))

(assert (=> b!787923 m!729971))

(declare-fun m!730003 () Bool)

(assert (=> b!787923 m!730003))

(declare-fun m!730005 () Bool)

(assert (=> b!787923 m!730005))

(declare-fun m!730007 () Bool)

(assert (=> b!787923 m!730007))

(assert (=> b!787927 m!729963))

(declare-fun m!730009 () Bool)

(assert (=> b!787927 m!730009))

(check-sat (not start!67888) (not b!787929) (not b!787926) (not b!787925) (not b!787923) (not b!787928) (not b!787939) (not b!787934) (not b!787935) (not b!787931) (not b!787942) (not b!787930) (not b!787943) (not b!787937) (not b!787940))
(check-sat)
