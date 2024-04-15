; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67340 () Bool)

(assert start!67340)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42588 0))(
  ( (array!42589 (arr!20387 (Array (_ BitVec 32) (_ BitVec 64))) (size!20808 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42588)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!433330 () Bool)

(declare-fun b!778926 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7984 0))(
  ( (MissingZero!7984 (index!34304 (_ BitVec 32))) (Found!7984 (index!34305 (_ BitVec 32))) (Intermediate!7984 (undefined!8796 Bool) (index!34306 (_ BitVec 32)) (x!65260 (_ BitVec 32))) (Undefined!7984) (MissingVacant!7984 (index!34307 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42588 (_ BitVec 32)) SeekEntryResult!7984)

(assert (=> b!778926 (= e!433330 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20387 a!3186) j!159) a!3186 mask!3328) (Found!7984 j!159)))))

(declare-fun b!778927 () Bool)

(declare-fun res!527055 () Bool)

(declare-fun e!433329 () Bool)

(assert (=> b!778927 (=> (not res!527055) (not e!433329))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!778927 (= res!527055 (and (= (size!20808 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20808 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20808 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!778928 () Bool)

(declare-fun res!527058 () Bool)

(declare-fun e!433326 () Bool)

(assert (=> b!778928 (=> (not res!527058) (not e!433326))))

(assert (=> b!778928 (= res!527058 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20387 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!778929 () Bool)

(declare-fun e!433324 () Bool)

(assert (=> b!778929 (= e!433324 true)))

(declare-fun lt!346918 () SeekEntryResult!7984)

(assert (=> b!778929 (= lt!346918 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20387 a!3186) j!159) a!3186 mask!3328))))

(declare-fun lt!346920 () SeekEntryResult!7984)

(declare-fun b!778930 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42588 (_ BitVec 32)) SeekEntryResult!7984)

(assert (=> b!778930 (= e!433330 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20387 a!3186) j!159) a!3186 mask!3328) lt!346920))))

(declare-fun b!778931 () Bool)

(declare-fun e!433323 () Bool)

(assert (=> b!778931 (= e!433329 e!433323)))

(declare-fun res!527066 () Bool)

(assert (=> b!778931 (=> (not res!527066) (not e!433323))))

(declare-fun lt!346917 () SeekEntryResult!7984)

(assert (=> b!778931 (= res!527066 (or (= lt!346917 (MissingZero!7984 i!1173)) (= lt!346917 (MissingVacant!7984 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42588 (_ BitVec 32)) SeekEntryResult!7984)

(assert (=> b!778931 (= lt!346917 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun lt!346922 () SeekEntryResult!7984)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun b!778932 () Bool)

(declare-fun e!433327 () Bool)

(assert (=> b!778932 (= e!433327 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20387 a!3186) j!159) a!3186 mask!3328) lt!346922))))

(declare-fun res!527056 () Bool)

(assert (=> start!67340 (=> (not res!527056) (not e!433329))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67340 (= res!527056 (validMask!0 mask!3328))))

(assert (=> start!67340 e!433329))

(assert (=> start!67340 true))

(declare-fun array_inv!16270 (array!42588) Bool)

(assert (=> start!67340 (array_inv!16270 a!3186)))

(declare-fun b!778933 () Bool)

(declare-fun res!527057 () Bool)

(assert (=> b!778933 (=> (not res!527057) (not e!433323))))

(declare-datatypes ((List!14428 0))(
  ( (Nil!14425) (Cons!14424 (h!15538 (_ BitVec 64)) (t!20734 List!14428)) )
))
(declare-fun arrayNoDuplicates!0 (array!42588 (_ BitVec 32) List!14428) Bool)

(assert (=> b!778933 (= res!527057 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14425))))

(declare-fun b!778934 () Bool)

(declare-fun res!527065 () Bool)

(assert (=> b!778934 (=> (not res!527065) (not e!433329))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!778934 (= res!527065 (validKeyInArray!0 (select (arr!20387 a!3186) j!159)))))

(declare-fun b!778935 () Bool)

(declare-fun res!527053 () Bool)

(assert (=> b!778935 (=> (not res!527053) (not e!433326))))

(assert (=> b!778935 (= res!527053 e!433330)))

(declare-fun c!86340 () Bool)

(assert (=> b!778935 (= c!86340 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!778936 () Bool)

(declare-fun res!527054 () Bool)

(assert (=> b!778936 (=> (not res!527054) (not e!433323))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42588 (_ BitVec 32)) Bool)

(assert (=> b!778936 (= res!527054 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!778937 () Bool)

(declare-fun e!433328 () Bool)

(assert (=> b!778937 (= e!433328 (not e!433324))))

(declare-fun res!527067 () Bool)

(assert (=> b!778937 (=> res!527067 e!433324)))

(declare-fun lt!346921 () SeekEntryResult!7984)

(get-info :version)

(assert (=> b!778937 (= res!527067 (or (not ((_ is Intermediate!7984) lt!346921)) (bvslt x!1131 (x!65260 lt!346921)) (not (= x!1131 (x!65260 lt!346921))) (not (= index!1321 (index!34306 lt!346921)))))))

(declare-fun e!433325 () Bool)

(assert (=> b!778937 e!433325))

(declare-fun res!527060 () Bool)

(assert (=> b!778937 (=> (not res!527060) (not e!433325))))

(assert (=> b!778937 (= res!527060 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26834 0))(
  ( (Unit!26835) )
))
(declare-fun lt!346924 () Unit!26834)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42588 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26834)

(assert (=> b!778937 (= lt!346924 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!778938 () Bool)

(assert (=> b!778938 (= e!433326 e!433328)))

(declare-fun res!527063 () Bool)

(assert (=> b!778938 (=> (not res!527063) (not e!433328))))

(declare-fun lt!346923 () SeekEntryResult!7984)

(assert (=> b!778938 (= res!527063 (= lt!346923 lt!346921))))

(declare-fun lt!346925 () (_ BitVec 64))

(declare-fun lt!346919 () array!42588)

(assert (=> b!778938 (= lt!346921 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!346925 lt!346919 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!778938 (= lt!346923 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!346925 mask!3328) lt!346925 lt!346919 mask!3328))))

(assert (=> b!778938 (= lt!346925 (select (store (arr!20387 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!778938 (= lt!346919 (array!42589 (store (arr!20387 a!3186) i!1173 k0!2102) (size!20808 a!3186)))))

(declare-fun b!778939 () Bool)

(assert (=> b!778939 (= e!433325 e!433327)))

(declare-fun res!527052 () Bool)

(assert (=> b!778939 (=> (not res!527052) (not e!433327))))

(assert (=> b!778939 (= res!527052 (= (seekEntryOrOpen!0 (select (arr!20387 a!3186) j!159) a!3186 mask!3328) lt!346922))))

(assert (=> b!778939 (= lt!346922 (Found!7984 j!159))))

(declare-fun b!778940 () Bool)

(declare-fun res!527062 () Bool)

(assert (=> b!778940 (=> (not res!527062) (not e!433329))))

(assert (=> b!778940 (= res!527062 (validKeyInArray!0 k0!2102))))

(declare-fun b!778941 () Bool)

(declare-fun res!527059 () Bool)

(assert (=> b!778941 (=> (not res!527059) (not e!433329))))

(declare-fun arrayContainsKey!0 (array!42588 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!778941 (= res!527059 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!778942 () Bool)

(assert (=> b!778942 (= e!433323 e!433326)))

(declare-fun res!527061 () Bool)

(assert (=> b!778942 (=> (not res!527061) (not e!433326))))

(assert (=> b!778942 (= res!527061 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20387 a!3186) j!159) mask!3328) (select (arr!20387 a!3186) j!159) a!3186 mask!3328) lt!346920))))

(assert (=> b!778942 (= lt!346920 (Intermediate!7984 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!778943 () Bool)

(declare-fun res!527064 () Bool)

(assert (=> b!778943 (=> (not res!527064) (not e!433323))))

(assert (=> b!778943 (= res!527064 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20808 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20808 a!3186))))))

(assert (= (and start!67340 res!527056) b!778927))

(assert (= (and b!778927 res!527055) b!778934))

(assert (= (and b!778934 res!527065) b!778940))

(assert (= (and b!778940 res!527062) b!778941))

(assert (= (and b!778941 res!527059) b!778931))

(assert (= (and b!778931 res!527066) b!778936))

(assert (= (and b!778936 res!527054) b!778933))

(assert (= (and b!778933 res!527057) b!778943))

(assert (= (and b!778943 res!527064) b!778942))

(assert (= (and b!778942 res!527061) b!778928))

(assert (= (and b!778928 res!527058) b!778935))

(assert (= (and b!778935 c!86340) b!778930))

(assert (= (and b!778935 (not c!86340)) b!778926))

(assert (= (and b!778935 res!527053) b!778938))

(assert (= (and b!778938 res!527063) b!778937))

(assert (= (and b!778937 res!527060) b!778939))

(assert (= (and b!778939 res!527052) b!778932))

(assert (= (and b!778937 (not res!527067)) b!778929))

(declare-fun m!721959 () Bool)

(assert (=> b!778926 m!721959))

(assert (=> b!778926 m!721959))

(declare-fun m!721961 () Bool)

(assert (=> b!778926 m!721961))

(declare-fun m!721963 () Bool)

(assert (=> b!778937 m!721963))

(declare-fun m!721965 () Bool)

(assert (=> b!778937 m!721965))

(declare-fun m!721967 () Bool)

(assert (=> b!778940 m!721967))

(declare-fun m!721969 () Bool)

(assert (=> b!778933 m!721969))

(declare-fun m!721971 () Bool)

(assert (=> b!778928 m!721971))

(assert (=> b!778932 m!721959))

(assert (=> b!778932 m!721959))

(declare-fun m!721973 () Bool)

(assert (=> b!778932 m!721973))

(declare-fun m!721975 () Bool)

(assert (=> b!778941 m!721975))

(assert (=> b!778939 m!721959))

(assert (=> b!778939 m!721959))

(declare-fun m!721977 () Bool)

(assert (=> b!778939 m!721977))

(assert (=> b!778942 m!721959))

(assert (=> b!778942 m!721959))

(declare-fun m!721979 () Bool)

(assert (=> b!778942 m!721979))

(assert (=> b!778942 m!721979))

(assert (=> b!778942 m!721959))

(declare-fun m!721981 () Bool)

(assert (=> b!778942 m!721981))

(declare-fun m!721983 () Bool)

(assert (=> start!67340 m!721983))

(declare-fun m!721985 () Bool)

(assert (=> start!67340 m!721985))

(declare-fun m!721987 () Bool)

(assert (=> b!778938 m!721987))

(declare-fun m!721989 () Bool)

(assert (=> b!778938 m!721989))

(assert (=> b!778938 m!721987))

(declare-fun m!721991 () Bool)

(assert (=> b!778938 m!721991))

(declare-fun m!721993 () Bool)

(assert (=> b!778938 m!721993))

(declare-fun m!721995 () Bool)

(assert (=> b!778938 m!721995))

(declare-fun m!721997 () Bool)

(assert (=> b!778931 m!721997))

(assert (=> b!778930 m!721959))

(assert (=> b!778930 m!721959))

(declare-fun m!721999 () Bool)

(assert (=> b!778930 m!721999))

(declare-fun m!722001 () Bool)

(assert (=> b!778936 m!722001))

(assert (=> b!778929 m!721959))

(assert (=> b!778929 m!721959))

(assert (=> b!778929 m!721961))

(assert (=> b!778934 m!721959))

(assert (=> b!778934 m!721959))

(declare-fun m!722003 () Bool)

(assert (=> b!778934 m!722003))

(check-sat (not b!778933) (not b!778937) (not b!778941) (not start!67340) (not b!778926) (not b!778936) (not b!778939) (not b!778934) (not b!778930) (not b!778931) (not b!778942) (not b!778929) (not b!778938) (not b!778940) (not b!778932))
(check-sat)
