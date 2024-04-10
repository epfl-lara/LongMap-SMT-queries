; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67562 () Bool)

(assert start!67562)

(declare-fun b!782014 () Bool)

(declare-fun e!434891 () Bool)

(declare-fun e!434896 () Bool)

(assert (=> b!782014 (= e!434891 e!434896)))

(declare-fun res!529102 () Bool)

(assert (=> b!782014 (=> (not res!529102) (not e!434896))))

(declare-datatypes ((SeekEntryResult!8022 0))(
  ( (MissingZero!8022 (index!34456 (_ BitVec 32))) (Found!8022 (index!34457 (_ BitVec 32))) (Intermediate!8022 (undefined!8834 Bool) (index!34458 (_ BitVec 32)) (x!65409 (_ BitVec 32))) (Undefined!8022) (MissingVacant!8022 (index!34459 (_ BitVec 32))) )
))
(declare-fun lt!348503 () SeekEntryResult!8022)

(declare-fun lt!348509 () SeekEntryResult!8022)

(assert (=> b!782014 (= res!529102 (= lt!348503 lt!348509))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((array!42665 0))(
  ( (array!42666 (arr!20422 (Array (_ BitVec 32) (_ BitVec 64))) (size!20843 (_ BitVec 32))) )
))
(declare-fun lt!348502 () array!42665)

(declare-fun lt!348500 () (_ BitVec 64))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42665 (_ BitVec 32)) SeekEntryResult!8022)

(assert (=> b!782014 (= lt!348509 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!348500 lt!348502 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!782014 (= lt!348503 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!348500 mask!3328) lt!348500 lt!348502 mask!3328))))

(declare-fun a!3186 () array!42665)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!782014 (= lt!348500 (select (store (arr!20422 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!782014 (= lt!348502 (array!42666 (store (arr!20422 a!3186) i!1173 k0!2102) (size!20843 a!3186)))))

(declare-fun b!782015 () Bool)

(declare-fun res!529107 () Bool)

(declare-fun e!434889 () Bool)

(assert (=> b!782015 (=> (not res!529107) (not e!434889))))

(declare-datatypes ((List!14424 0))(
  ( (Nil!14421) (Cons!14420 (h!15540 (_ BitVec 64)) (t!20739 List!14424)) )
))
(declare-fun arrayNoDuplicates!0 (array!42665 (_ BitVec 32) List!14424) Bool)

(assert (=> b!782015 (= res!529107 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14421))))

(declare-fun b!782016 () Bool)

(declare-fun res!529099 () Bool)

(declare-fun e!434892 () Bool)

(assert (=> b!782016 (=> (not res!529099) (not e!434892))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!782016 (= res!529099 (validKeyInArray!0 (select (arr!20422 a!3186) j!159)))))

(declare-fun b!782017 () Bool)

(declare-fun res!529104 () Bool)

(assert (=> b!782017 (=> (not res!529104) (not e!434891))))

(declare-fun e!434897 () Bool)

(assert (=> b!782017 (= res!529104 e!434897)))

(declare-fun c!86865 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!782017 (= c!86865 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!782018 () Bool)

(assert (=> b!782018 (= e!434889 e!434891)))

(declare-fun res!529111 () Bool)

(assert (=> b!782018 (=> (not res!529111) (not e!434891))))

(declare-fun lt!348505 () SeekEntryResult!8022)

(assert (=> b!782018 (= res!529111 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20422 a!3186) j!159) mask!3328) (select (arr!20422 a!3186) j!159) a!3186 mask!3328) lt!348505))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!782018 (= lt!348505 (Intermediate!8022 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!782019 () Bool)

(declare-fun res!529098 () Bool)

(assert (=> b!782019 (=> (not res!529098) (not e!434892))))

(declare-fun arrayContainsKey!0 (array!42665 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!782019 (= res!529098 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!782020 () Bool)

(declare-datatypes ((Unit!26976 0))(
  ( (Unit!26977) )
))
(declare-fun e!434893 () Unit!26976)

(declare-fun Unit!26978 () Unit!26976)

(assert (=> b!782020 (= e!434893 Unit!26978)))

(assert (=> b!782020 false))

(declare-fun b!782021 () Bool)

(declare-fun e!434894 () Bool)

(assert (=> b!782021 (= e!434894 true)))

(assert (=> b!782021 (= (select (store (arr!20422 a!3186) i!1173 k0!2102) index!1321) #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!348507 () Unit!26976)

(assert (=> b!782021 (= lt!348507 e!434893)))

(declare-fun c!86866 () Bool)

(assert (=> b!782021 (= c!86866 (= (select (store (arr!20422 a!3186) i!1173 k0!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!782022 () Bool)

(declare-fun res!529101 () Bool)

(assert (=> b!782022 (=> (not res!529101) (not e!434892))))

(assert (=> b!782022 (= res!529101 (and (= (size!20843 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20843 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20843 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!782023 () Bool)

(assert (=> b!782023 (= e!434897 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20422 a!3186) j!159) a!3186 mask!3328) lt!348505))))

(declare-fun lt!348508 () SeekEntryResult!8022)

(declare-fun e!434890 () Bool)

(declare-fun b!782024 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42665 (_ BitVec 32)) SeekEntryResult!8022)

(assert (=> b!782024 (= e!434890 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20422 a!3186) j!159) a!3186 mask!3328) lt!348508))))

(declare-fun b!782025 () Bool)

(declare-fun res!529097 () Bool)

(assert (=> b!782025 (=> (not res!529097) (not e!434889))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42665 (_ BitVec 32)) Bool)

(assert (=> b!782025 (= res!529097 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun res!529106 () Bool)

(assert (=> start!67562 (=> (not res!529106) (not e!434892))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67562 (= res!529106 (validMask!0 mask!3328))))

(assert (=> start!67562 e!434892))

(assert (=> start!67562 true))

(declare-fun array_inv!16218 (array!42665) Bool)

(assert (=> start!67562 (array_inv!16218 a!3186)))

(declare-fun b!782026 () Bool)

(declare-fun res!529105 () Bool)

(assert (=> b!782026 (=> res!529105 e!434894)))

(assert (=> b!782026 (= res!529105 (= (select (store (arr!20422 a!3186) i!1173 k0!2102) index!1321) lt!348500))))

(declare-fun b!782027 () Bool)

(declare-fun res!529100 () Bool)

(assert (=> b!782027 (=> (not res!529100) (not e!434891))))

(assert (=> b!782027 (= res!529100 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20422 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!782028 () Bool)

(declare-fun Unit!26979 () Unit!26976)

(assert (=> b!782028 (= e!434893 Unit!26979)))

(declare-fun b!782029 () Bool)

(assert (=> b!782029 (= e!434892 e!434889)))

(declare-fun res!529110 () Bool)

(assert (=> b!782029 (=> (not res!529110) (not e!434889))))

(declare-fun lt!348501 () SeekEntryResult!8022)

(assert (=> b!782029 (= res!529110 (or (= lt!348501 (MissingZero!8022 i!1173)) (= lt!348501 (MissingVacant!8022 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42665 (_ BitVec 32)) SeekEntryResult!8022)

(assert (=> b!782029 (= lt!348501 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!782030 () Bool)

(declare-fun res!529096 () Bool)

(assert (=> b!782030 (=> res!529096 e!434894)))

(assert (=> b!782030 (= res!529096 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20422 a!3186) j!159) a!3186 mask!3328) lt!348508)))))

(declare-fun b!782031 () Bool)

(assert (=> b!782031 (= e!434897 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20422 a!3186) j!159) a!3186 mask!3328) (Found!8022 j!159)))))

(declare-fun b!782032 () Bool)

(declare-fun res!529103 () Bool)

(assert (=> b!782032 (=> (not res!529103) (not e!434889))))

(assert (=> b!782032 (= res!529103 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20843 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20843 a!3186))))))

(declare-fun b!782033 () Bool)

(declare-fun res!529112 () Bool)

(assert (=> b!782033 (=> (not res!529112) (not e!434892))))

(assert (=> b!782033 (= res!529112 (validKeyInArray!0 k0!2102))))

(declare-fun b!782034 () Bool)

(assert (=> b!782034 (= e!434896 (not e!434894))))

(declare-fun res!529109 () Bool)

(assert (=> b!782034 (=> res!529109 e!434894)))

(get-info :version)

(assert (=> b!782034 (= res!529109 (or (not ((_ is Intermediate!8022) lt!348509)) (bvslt x!1131 (x!65409 lt!348509)) (not (= x!1131 (x!65409 lt!348509))) (not (= index!1321 (index!34458 lt!348509)))))))

(assert (=> b!782034 e!434890))

(declare-fun res!529108 () Bool)

(assert (=> b!782034 (=> (not res!529108) (not e!434890))))

(declare-fun lt!348504 () SeekEntryResult!8022)

(assert (=> b!782034 (= res!529108 (= lt!348504 lt!348508))))

(assert (=> b!782034 (= lt!348508 (Found!8022 j!159))))

(assert (=> b!782034 (= lt!348504 (seekEntryOrOpen!0 (select (arr!20422 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!782034 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!348506 () Unit!26976)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42665 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26976)

(assert (=> b!782034 (= lt!348506 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (= (and start!67562 res!529106) b!782022))

(assert (= (and b!782022 res!529101) b!782016))

(assert (= (and b!782016 res!529099) b!782033))

(assert (= (and b!782033 res!529112) b!782019))

(assert (= (and b!782019 res!529098) b!782029))

(assert (= (and b!782029 res!529110) b!782025))

(assert (= (and b!782025 res!529097) b!782015))

(assert (= (and b!782015 res!529107) b!782032))

(assert (= (and b!782032 res!529103) b!782018))

(assert (= (and b!782018 res!529111) b!782027))

(assert (= (and b!782027 res!529100) b!782017))

(assert (= (and b!782017 c!86865) b!782023))

(assert (= (and b!782017 (not c!86865)) b!782031))

(assert (= (and b!782017 res!529104) b!782014))

(assert (= (and b!782014 res!529102) b!782034))

(assert (= (and b!782034 res!529108) b!782024))

(assert (= (and b!782034 (not res!529109)) b!782030))

(assert (= (and b!782030 (not res!529096)) b!782026))

(assert (= (and b!782026 (not res!529105)) b!782021))

(assert (= (and b!782021 c!86866) b!782020))

(assert (= (and b!782021 (not c!86866)) b!782028))

(declare-fun m!724907 () Bool)

(assert (=> b!782016 m!724907))

(assert (=> b!782016 m!724907))

(declare-fun m!724909 () Bool)

(assert (=> b!782016 m!724909))

(assert (=> b!782024 m!724907))

(assert (=> b!782024 m!724907))

(declare-fun m!724911 () Bool)

(assert (=> b!782024 m!724911))

(assert (=> b!782030 m!724907))

(assert (=> b!782030 m!724907))

(declare-fun m!724913 () Bool)

(assert (=> b!782030 m!724913))

(declare-fun m!724915 () Bool)

(assert (=> b!782029 m!724915))

(assert (=> b!782031 m!724907))

(assert (=> b!782031 m!724907))

(assert (=> b!782031 m!724913))

(assert (=> b!782034 m!724907))

(assert (=> b!782034 m!724907))

(declare-fun m!724917 () Bool)

(assert (=> b!782034 m!724917))

(declare-fun m!724919 () Bool)

(assert (=> b!782034 m!724919))

(declare-fun m!724921 () Bool)

(assert (=> b!782034 m!724921))

(assert (=> b!782023 m!724907))

(assert (=> b!782023 m!724907))

(declare-fun m!724923 () Bool)

(assert (=> b!782023 m!724923))

(declare-fun m!724925 () Bool)

(assert (=> b!782033 m!724925))

(declare-fun m!724927 () Bool)

(assert (=> b!782027 m!724927))

(declare-fun m!724929 () Bool)

(assert (=> b!782025 m!724929))

(declare-fun m!724931 () Bool)

(assert (=> b!782014 m!724931))

(assert (=> b!782014 m!724931))

(declare-fun m!724933 () Bool)

(assert (=> b!782014 m!724933))

(declare-fun m!724935 () Bool)

(assert (=> b!782014 m!724935))

(declare-fun m!724937 () Bool)

(assert (=> b!782014 m!724937))

(declare-fun m!724939 () Bool)

(assert (=> b!782014 m!724939))

(assert (=> b!782018 m!724907))

(assert (=> b!782018 m!724907))

(declare-fun m!724941 () Bool)

(assert (=> b!782018 m!724941))

(assert (=> b!782018 m!724941))

(assert (=> b!782018 m!724907))

(declare-fun m!724943 () Bool)

(assert (=> b!782018 m!724943))

(assert (=> b!782026 m!724935))

(declare-fun m!724945 () Bool)

(assert (=> b!782026 m!724945))

(declare-fun m!724947 () Bool)

(assert (=> b!782015 m!724947))

(declare-fun m!724949 () Bool)

(assert (=> start!67562 m!724949))

(declare-fun m!724951 () Bool)

(assert (=> start!67562 m!724951))

(assert (=> b!782021 m!724935))

(assert (=> b!782021 m!724945))

(declare-fun m!724953 () Bool)

(assert (=> b!782019 m!724953))

(check-sat (not b!782024) (not b!782030) (not b!782023) (not b!782018) (not b!782025) (not b!782029) (not b!782014) (not b!782033) (not b!782031) (not start!67562) (not b!782034) (not b!782016) (not b!782019) (not b!782015))
(check-sat)
