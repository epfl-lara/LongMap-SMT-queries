; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66282 () Bool)

(assert start!66282)

(declare-fun res!517019 () Bool)

(declare-fun e!425528 () Bool)

(assert (=> start!66282 (=> (not res!517019) (not e!425528))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66282 (= res!517019 (validMask!0 mask!3328))))

(assert (=> start!66282 e!425528))

(assert (=> start!66282 true))

(declare-datatypes ((array!42204 0))(
  ( (array!42205 (arr!20210 (Array (_ BitVec 32) (_ BitVec 64))) (size!20631 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42204)

(declare-fun array_inv!16093 (array!42204) Bool)

(assert (=> start!66282 (array_inv!16093 a!3186)))

(declare-fun b!764024 () Bool)

(declare-fun res!517027 () Bool)

(assert (=> b!764024 (=> (not res!517027) (not e!425528))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!764024 (= res!517027 (validKeyInArray!0 k0!2102))))

(declare-fun b!764025 () Bool)

(declare-fun e!425526 () Bool)

(assert (=> b!764025 (= e!425526 (not true))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42204 (_ BitVec 32)) Bool)

(assert (=> b!764025 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!26312 0))(
  ( (Unit!26313) )
))
(declare-fun lt!339866 () Unit!26312)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42204 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26312)

(assert (=> b!764025 (= lt!339866 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!764026 () Bool)

(declare-fun e!425531 () Bool)

(assert (=> b!764026 (= e!425528 e!425531)))

(declare-fun res!517022 () Bool)

(assert (=> b!764026 (=> (not res!517022) (not e!425531))))

(declare-datatypes ((SeekEntryResult!7807 0))(
  ( (MissingZero!7807 (index!33596 (_ BitVec 32))) (Found!7807 (index!33597 (_ BitVec 32))) (Intermediate!7807 (undefined!8619 Bool) (index!33598 (_ BitVec 32)) (x!64502 (_ BitVec 32))) (Undefined!7807) (MissingVacant!7807 (index!33599 (_ BitVec 32))) )
))
(declare-fun lt!339864 () SeekEntryResult!7807)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!764026 (= res!517022 (or (= lt!339864 (MissingZero!7807 i!1173)) (= lt!339864 (MissingVacant!7807 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42204 (_ BitVec 32)) SeekEntryResult!7807)

(assert (=> b!764026 (= lt!339864 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun e!425527 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!764027 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42204 (_ BitVec 32)) SeekEntryResult!7807)

(assert (=> b!764027 (= e!425527 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20210 a!3186) j!159) a!3186 mask!3328) (Found!7807 j!159)))))

(declare-fun b!764028 () Bool)

(declare-fun res!517028 () Bool)

(assert (=> b!764028 (=> (not res!517028) (not e!425531))))

(declare-datatypes ((List!14251 0))(
  ( (Nil!14248) (Cons!14247 (h!15331 (_ BitVec 64)) (t!20557 List!14251)) )
))
(declare-fun arrayNoDuplicates!0 (array!42204 (_ BitVec 32) List!14251) Bool)

(assert (=> b!764028 (= res!517028 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14248))))

(declare-fun b!764029 () Bool)

(declare-fun e!425529 () Bool)

(assert (=> b!764029 (= e!425531 e!425529)))

(declare-fun res!517029 () Bool)

(assert (=> b!764029 (=> (not res!517029) (not e!425529))))

(declare-fun lt!339863 () SeekEntryResult!7807)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42204 (_ BitVec 32)) SeekEntryResult!7807)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!764029 (= res!517029 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20210 a!3186) j!159) mask!3328) (select (arr!20210 a!3186) j!159) a!3186 mask!3328) lt!339863))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!764029 (= lt!339863 (Intermediate!7807 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!764030 () Bool)

(declare-fun res!517023 () Bool)

(assert (=> b!764030 (=> (not res!517023) (not e!425528))))

(assert (=> b!764030 (= res!517023 (validKeyInArray!0 (select (arr!20210 a!3186) j!159)))))

(declare-fun b!764031 () Bool)

(assert (=> b!764031 (= e!425529 e!425526)))

(declare-fun res!517030 () Bool)

(assert (=> b!764031 (=> (not res!517030) (not e!425526))))

(declare-fun lt!339862 () (_ BitVec 64))

(declare-fun lt!339865 () array!42204)

(assert (=> b!764031 (= res!517030 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!339862 mask!3328) lt!339862 lt!339865 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!339862 lt!339865 mask!3328)))))

(assert (=> b!764031 (= lt!339862 (select (store (arr!20210 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!764031 (= lt!339865 (array!42205 (store (arr!20210 a!3186) i!1173 k0!2102) (size!20631 a!3186)))))

(declare-fun b!764032 () Bool)

(declare-fun res!517021 () Bool)

(assert (=> b!764032 (=> (not res!517021) (not e!425531))))

(assert (=> b!764032 (= res!517021 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!764033 () Bool)

(declare-fun res!517026 () Bool)

(assert (=> b!764033 (=> (not res!517026) (not e!425529))))

(assert (=> b!764033 (= res!517026 e!425527)))

(declare-fun c!83889 () Bool)

(assert (=> b!764033 (= c!83889 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!764034 () Bool)

(declare-fun res!517020 () Bool)

(assert (=> b!764034 (=> (not res!517020) (not e!425531))))

(assert (=> b!764034 (= res!517020 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20631 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20631 a!3186))))))

(declare-fun b!764035 () Bool)

(assert (=> b!764035 (= e!425527 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20210 a!3186) j!159) a!3186 mask!3328) lt!339863))))

(declare-fun b!764036 () Bool)

(declare-fun res!517024 () Bool)

(assert (=> b!764036 (=> (not res!517024) (not e!425528))))

(assert (=> b!764036 (= res!517024 (and (= (size!20631 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20631 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20631 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!764037 () Bool)

(declare-fun res!517025 () Bool)

(assert (=> b!764037 (=> (not res!517025) (not e!425528))))

(declare-fun arrayContainsKey!0 (array!42204 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!764037 (= res!517025 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!764038 () Bool)

(declare-fun res!517031 () Bool)

(assert (=> b!764038 (=> (not res!517031) (not e!425529))))

(assert (=> b!764038 (= res!517031 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20210 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!66282 res!517019) b!764036))

(assert (= (and b!764036 res!517024) b!764030))

(assert (= (and b!764030 res!517023) b!764024))

(assert (= (and b!764024 res!517027) b!764037))

(assert (= (and b!764037 res!517025) b!764026))

(assert (= (and b!764026 res!517022) b!764032))

(assert (= (and b!764032 res!517021) b!764028))

(assert (= (and b!764028 res!517028) b!764034))

(assert (= (and b!764034 res!517020) b!764029))

(assert (= (and b!764029 res!517029) b!764038))

(assert (= (and b!764038 res!517031) b!764033))

(assert (= (and b!764033 c!83889) b!764035))

(assert (= (and b!764033 (not c!83889)) b!764027))

(assert (= (and b!764033 res!517026) b!764031))

(assert (= (and b!764031 res!517030) b!764025))

(declare-fun m!709897 () Bool)

(assert (=> b!764026 m!709897))

(declare-fun m!709899 () Bool)

(assert (=> b!764028 m!709899))

(declare-fun m!709901 () Bool)

(assert (=> start!66282 m!709901))

(declare-fun m!709903 () Bool)

(assert (=> start!66282 m!709903))

(declare-fun m!709905 () Bool)

(assert (=> b!764037 m!709905))

(declare-fun m!709907 () Bool)

(assert (=> b!764032 m!709907))

(declare-fun m!709909 () Bool)

(assert (=> b!764027 m!709909))

(assert (=> b!764027 m!709909))

(declare-fun m!709911 () Bool)

(assert (=> b!764027 m!709911))

(declare-fun m!709913 () Bool)

(assert (=> b!764038 m!709913))

(declare-fun m!709915 () Bool)

(assert (=> b!764031 m!709915))

(declare-fun m!709917 () Bool)

(assert (=> b!764031 m!709917))

(declare-fun m!709919 () Bool)

(assert (=> b!764031 m!709919))

(assert (=> b!764031 m!709917))

(declare-fun m!709921 () Bool)

(assert (=> b!764031 m!709921))

(declare-fun m!709923 () Bool)

(assert (=> b!764031 m!709923))

(declare-fun m!709925 () Bool)

(assert (=> b!764024 m!709925))

(assert (=> b!764035 m!709909))

(assert (=> b!764035 m!709909))

(declare-fun m!709927 () Bool)

(assert (=> b!764035 m!709927))

(assert (=> b!764029 m!709909))

(assert (=> b!764029 m!709909))

(declare-fun m!709929 () Bool)

(assert (=> b!764029 m!709929))

(assert (=> b!764029 m!709929))

(assert (=> b!764029 m!709909))

(declare-fun m!709931 () Bool)

(assert (=> b!764029 m!709931))

(assert (=> b!764030 m!709909))

(assert (=> b!764030 m!709909))

(declare-fun m!709933 () Bool)

(assert (=> b!764030 m!709933))

(declare-fun m!709935 () Bool)

(assert (=> b!764025 m!709935))

(declare-fun m!709937 () Bool)

(assert (=> b!764025 m!709937))

(check-sat (not b!764026) (not b!764032) (not b!764031) (not b!764029) (not b!764025) (not b!764030) (not b!764028) (not b!764035) (not start!66282) (not b!764024) (not b!764037) (not b!764027))
(check-sat)
