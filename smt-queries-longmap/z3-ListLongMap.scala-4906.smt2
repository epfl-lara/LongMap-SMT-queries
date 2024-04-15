; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67658 () Bool)

(assert start!67658)

(declare-fun b!783922 () Bool)

(declare-datatypes ((Unit!27044 0))(
  ( (Unit!27045) )
))
(declare-fun e!435848 () Unit!27044)

(declare-fun Unit!27046 () Unit!27044)

(assert (=> b!783922 (= e!435848 Unit!27046)))

(assert (=> b!783922 false))

(declare-fun b!783923 () Bool)

(declare-fun res!530513 () Bool)

(declare-fun e!435841 () Bool)

(assert (=> b!783923 (=> (not res!530513) (not e!435841))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42717 0))(
  ( (array!42718 (arr!20447 (Array (_ BitVec 32) (_ BitVec 64))) (size!20868 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42717)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!783923 (= res!530513 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20868 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20868 a!3186))))))

(declare-fun b!783924 () Bool)

(declare-fun e!435847 () Bool)

(declare-datatypes ((SeekEntryResult!8044 0))(
  ( (MissingZero!8044 (index!34544 (_ BitVec 32))) (Found!8044 (index!34545 (_ BitVec 32))) (Intermediate!8044 (undefined!8856 Bool) (index!34546 (_ BitVec 32)) (x!65507 (_ BitVec 32))) (Undefined!8044) (MissingVacant!8044 (index!34547 (_ BitVec 32))) )
))
(declare-fun lt!349313 () SeekEntryResult!8044)

(declare-fun lt!349307 () SeekEntryResult!8044)

(assert (=> b!783924 (= e!435847 (= lt!349313 lt!349307))))

(declare-fun b!783925 () Bool)

(declare-fun res!530507 () Bool)

(assert (=> b!783925 (=> (not res!530507) (not e!435841))))

(declare-datatypes ((List!14488 0))(
  ( (Nil!14485) (Cons!14484 (h!15607 (_ BitVec 64)) (t!20794 List!14488)) )
))
(declare-fun arrayNoDuplicates!0 (array!42717 (_ BitVec 32) List!14488) Bool)

(assert (=> b!783925 (= res!530507 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14485))))

(declare-fun b!783926 () Bool)

(declare-fun e!435850 () Bool)

(declare-fun e!435842 () Bool)

(assert (=> b!783926 (= e!435850 e!435842)))

(declare-fun res!530514 () Bool)

(assert (=> b!783926 (=> res!530514 e!435842)))

(declare-fun lt!349315 () SeekEntryResult!8044)

(assert (=> b!783926 (= res!530514 (not (= lt!349307 lt!349315)))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42717 (_ BitVec 32)) SeekEntryResult!8044)

(assert (=> b!783926 (= lt!349307 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20447 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!783927 () Bool)

(declare-fun res!530509 () Bool)

(declare-fun e!435849 () Bool)

(assert (=> b!783927 (=> (not res!530509) (not e!435849))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!783927 (= res!530509 (and (= (size!20868 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20868 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20868 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!783928 () Bool)

(declare-fun e!435844 () Bool)

(assert (=> b!783928 (= e!435844 true)))

(assert (=> b!783928 e!435847))

(declare-fun res!530519 () Bool)

(assert (=> b!783928 (=> (not res!530519) (not e!435847))))

(declare-fun lt!349308 () (_ BitVec 64))

(assert (=> b!783928 (= res!530519 (= lt!349308 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!349312 () Unit!27044)

(assert (=> b!783928 (= lt!349312 e!435848)))

(declare-fun c!87116 () Bool)

(assert (=> b!783928 (= c!87116 (= lt!349308 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!530521 () Bool)

(assert (=> start!67658 (=> (not res!530521) (not e!435849))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67658 (= res!530521 (validMask!0 mask!3328))))

(assert (=> start!67658 e!435849))

(assert (=> start!67658 true))

(declare-fun array_inv!16330 (array!42717) Bool)

(assert (=> start!67658 (array_inv!16330 a!3186)))

(declare-fun lt!349311 () SeekEntryResult!8044)

(declare-fun b!783929 () Bool)

(declare-fun e!435840 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42717 (_ BitVec 32)) SeekEntryResult!8044)

(assert (=> b!783929 (= e!435840 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20447 a!3186) j!159) a!3186 mask!3328) lt!349311))))

(declare-fun b!783930 () Bool)

(declare-fun res!530515 () Bool)

(assert (=> b!783930 (=> (not res!530515) (not e!435849))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!783930 (= res!530515 (validKeyInArray!0 (select (arr!20447 a!3186) j!159)))))

(declare-fun b!783931 () Bool)

(declare-fun res!530511 () Bool)

(assert (=> b!783931 (=> (not res!530511) (not e!435841))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42717 (_ BitVec 32)) Bool)

(assert (=> b!783931 (= res!530511 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!783932 () Bool)

(declare-fun res!530516 () Bool)

(declare-fun e!435845 () Bool)

(assert (=> b!783932 (=> (not res!530516) (not e!435845))))

(assert (=> b!783932 (= res!530516 e!435840)))

(declare-fun c!87117 () Bool)

(assert (=> b!783932 (= c!87117 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!783933 () Bool)

(declare-fun res!530522 () Bool)

(assert (=> b!783933 (=> (not res!530522) (not e!435845))))

(assert (=> b!783933 (= res!530522 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20447 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!783934 () Bool)

(declare-fun e!435843 () Bool)

(assert (=> b!783934 (= e!435843 (not e!435850))))

(declare-fun res!530523 () Bool)

(assert (=> b!783934 (=> res!530523 e!435850)))

(declare-fun lt!349314 () SeekEntryResult!8044)

(get-info :version)

(assert (=> b!783934 (= res!530523 (or (not ((_ is Intermediate!8044) lt!349314)) (bvslt x!1131 (x!65507 lt!349314)) (not (= x!1131 (x!65507 lt!349314))) (not (= index!1321 (index!34546 lt!349314)))))))

(declare-fun e!435839 () Bool)

(assert (=> b!783934 e!435839))

(declare-fun res!530518 () Bool)

(assert (=> b!783934 (=> (not res!530518) (not e!435839))))

(assert (=> b!783934 (= res!530518 (= lt!349313 lt!349315))))

(assert (=> b!783934 (= lt!349315 (Found!8044 j!159))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42717 (_ BitVec 32)) SeekEntryResult!8044)

(assert (=> b!783934 (= lt!349313 (seekEntryOrOpen!0 (select (arr!20447 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!783934 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!349305 () Unit!27044)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42717 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27044)

(assert (=> b!783934 (= lt!349305 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!783935 () Bool)

(declare-fun res!530506 () Bool)

(assert (=> b!783935 (=> (not res!530506) (not e!435849))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42717 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!783935 (= res!530506 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!783936 () Bool)

(assert (=> b!783936 (= e!435845 e!435843)))

(declare-fun res!530510 () Bool)

(assert (=> b!783936 (=> (not res!530510) (not e!435843))))

(declare-fun lt!349316 () SeekEntryResult!8044)

(assert (=> b!783936 (= res!530510 (= lt!349316 lt!349314))))

(declare-fun lt!349306 () array!42717)

(declare-fun lt!349309 () (_ BitVec 64))

(assert (=> b!783936 (= lt!349314 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!349309 lt!349306 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!783936 (= lt!349316 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!349309 mask!3328) lt!349309 lt!349306 mask!3328))))

(assert (=> b!783936 (= lt!349309 (select (store (arr!20447 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!783936 (= lt!349306 (array!42718 (store (arr!20447 a!3186) i!1173 k0!2102) (size!20868 a!3186)))))

(declare-fun b!783937 () Bool)

(assert (=> b!783937 (= e!435841 e!435845)))

(declare-fun res!530505 () Bool)

(assert (=> b!783937 (=> (not res!530505) (not e!435845))))

(assert (=> b!783937 (= res!530505 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20447 a!3186) j!159) mask!3328) (select (arr!20447 a!3186) j!159) a!3186 mask!3328) lt!349311))))

(assert (=> b!783937 (= lt!349311 (Intermediate!8044 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!783938 () Bool)

(declare-fun res!530517 () Bool)

(assert (=> b!783938 (=> (not res!530517) (not e!435849))))

(assert (=> b!783938 (= res!530517 (validKeyInArray!0 k0!2102))))

(declare-fun b!783939 () Bool)

(assert (=> b!783939 (= e!435842 e!435844)))

(declare-fun res!530508 () Bool)

(assert (=> b!783939 (=> res!530508 e!435844)))

(assert (=> b!783939 (= res!530508 (= lt!349308 lt!349309))))

(assert (=> b!783939 (= lt!349308 (select (store (arr!20447 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!783940 () Bool)

(assert (=> b!783940 (= e!435840 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20447 a!3186) j!159) a!3186 mask!3328) (Found!8044 j!159)))))

(declare-fun b!783941 () Bool)

(declare-fun res!530520 () Bool)

(assert (=> b!783941 (=> (not res!530520) (not e!435847))))

(assert (=> b!783941 (= res!530520 (= (seekEntryOrOpen!0 lt!349309 lt!349306 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!349309 lt!349306 mask!3328)))))

(declare-fun b!783942 () Bool)

(assert (=> b!783942 (= e!435839 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20447 a!3186) j!159) a!3186 mask!3328) lt!349315))))

(declare-fun b!783943 () Bool)

(assert (=> b!783943 (= e!435849 e!435841)))

(declare-fun res!530512 () Bool)

(assert (=> b!783943 (=> (not res!530512) (not e!435841))))

(declare-fun lt!349310 () SeekEntryResult!8044)

(assert (=> b!783943 (= res!530512 (or (= lt!349310 (MissingZero!8044 i!1173)) (= lt!349310 (MissingVacant!8044 i!1173))))))

(assert (=> b!783943 (= lt!349310 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!783944 () Bool)

(declare-fun Unit!27047 () Unit!27044)

(assert (=> b!783944 (= e!435848 Unit!27047)))

(assert (= (and start!67658 res!530521) b!783927))

(assert (= (and b!783927 res!530509) b!783930))

(assert (= (and b!783930 res!530515) b!783938))

(assert (= (and b!783938 res!530517) b!783935))

(assert (= (and b!783935 res!530506) b!783943))

(assert (= (and b!783943 res!530512) b!783931))

(assert (= (and b!783931 res!530511) b!783925))

(assert (= (and b!783925 res!530507) b!783923))

(assert (= (and b!783923 res!530513) b!783937))

(assert (= (and b!783937 res!530505) b!783933))

(assert (= (and b!783933 res!530522) b!783932))

(assert (= (and b!783932 c!87117) b!783929))

(assert (= (and b!783932 (not c!87117)) b!783940))

(assert (= (and b!783932 res!530516) b!783936))

(assert (= (and b!783936 res!530510) b!783934))

(assert (= (and b!783934 res!530518) b!783942))

(assert (= (and b!783934 (not res!530523)) b!783926))

(assert (= (and b!783926 (not res!530514)) b!783939))

(assert (= (and b!783939 (not res!530508)) b!783928))

(assert (= (and b!783928 c!87116) b!783922))

(assert (= (and b!783928 (not c!87116)) b!783944))

(assert (= (and b!783928 res!530519) b!783941))

(assert (= (and b!783941 res!530520) b!783924))

(declare-fun m!725799 () Bool)

(assert (=> b!783929 m!725799))

(assert (=> b!783929 m!725799))

(declare-fun m!725801 () Bool)

(assert (=> b!783929 m!725801))

(declare-fun m!725803 () Bool)

(assert (=> b!783943 m!725803))

(declare-fun m!725805 () Bool)

(assert (=> b!783941 m!725805))

(declare-fun m!725807 () Bool)

(assert (=> b!783941 m!725807))

(declare-fun m!725809 () Bool)

(assert (=> b!783933 m!725809))

(declare-fun m!725811 () Bool)

(assert (=> b!783939 m!725811))

(declare-fun m!725813 () Bool)

(assert (=> b!783939 m!725813))

(assert (=> b!783940 m!725799))

(assert (=> b!783940 m!725799))

(declare-fun m!725815 () Bool)

(assert (=> b!783940 m!725815))

(assert (=> b!783937 m!725799))

(assert (=> b!783937 m!725799))

(declare-fun m!725817 () Bool)

(assert (=> b!783937 m!725817))

(assert (=> b!783937 m!725817))

(assert (=> b!783937 m!725799))

(declare-fun m!725819 () Bool)

(assert (=> b!783937 m!725819))

(assert (=> b!783926 m!725799))

(assert (=> b!783926 m!725799))

(assert (=> b!783926 m!725815))

(assert (=> b!783942 m!725799))

(assert (=> b!783942 m!725799))

(declare-fun m!725821 () Bool)

(assert (=> b!783942 m!725821))

(declare-fun m!725823 () Bool)

(assert (=> b!783935 m!725823))

(declare-fun m!725825 () Bool)

(assert (=> b!783936 m!725825))

(declare-fun m!725827 () Bool)

(assert (=> b!783936 m!725827))

(assert (=> b!783936 m!725811))

(declare-fun m!725829 () Bool)

(assert (=> b!783936 m!725829))

(assert (=> b!783936 m!725825))

(declare-fun m!725831 () Bool)

(assert (=> b!783936 m!725831))

(declare-fun m!725833 () Bool)

(assert (=> start!67658 m!725833))

(declare-fun m!725835 () Bool)

(assert (=> start!67658 m!725835))

(declare-fun m!725837 () Bool)

(assert (=> b!783931 m!725837))

(declare-fun m!725839 () Bool)

(assert (=> b!783938 m!725839))

(declare-fun m!725841 () Bool)

(assert (=> b!783925 m!725841))

(assert (=> b!783934 m!725799))

(assert (=> b!783934 m!725799))

(declare-fun m!725843 () Bool)

(assert (=> b!783934 m!725843))

(declare-fun m!725845 () Bool)

(assert (=> b!783934 m!725845))

(declare-fun m!725847 () Bool)

(assert (=> b!783934 m!725847))

(assert (=> b!783930 m!725799))

(assert (=> b!783930 m!725799))

(declare-fun m!725849 () Bool)

(assert (=> b!783930 m!725849))

(check-sat (not b!783940) (not b!783926) (not b!783941) (not b!783931) (not b!783930) (not b!783929) (not b!783935) (not b!783937) (not b!783934) (not start!67658) (not b!783925) (not b!783942) (not b!783938) (not b!783943) (not b!783936))
(check-sat)
