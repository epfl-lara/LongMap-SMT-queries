; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67222 () Bool)

(assert start!67222)

(declare-fun b!775167 () Bool)

(declare-fun e!431554 () Bool)

(declare-fun e!431559 () Bool)

(assert (=> b!775167 (= e!431554 e!431559)))

(declare-fun res!523960 () Bool)

(assert (=> b!775167 (=> (not res!523960) (not e!431559))))

(declare-datatypes ((SeekEntryResult!7876 0))(
  ( (MissingZero!7876 (index!33872 (_ BitVec 32))) (Found!7876 (index!33873 (_ BitVec 32))) (Intermediate!7876 (undefined!8688 Bool) (index!33874 (_ BitVec 32)) (x!64982 (_ BitVec 32))) (Undefined!7876) (MissingVacant!7876 (index!33875 (_ BitVec 32))) )
))
(declare-fun lt!345210 () SeekEntryResult!7876)

(declare-fun lt!345203 () SeekEntryResult!7876)

(assert (=> b!775167 (= res!523960 (= lt!345210 lt!345203))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-datatypes ((array!42457 0))(
  ( (array!42458 (arr!20320 (Array (_ BitVec 32) (_ BitVec 64))) (size!20740 (_ BitVec 32))) )
))
(declare-fun lt!345199 () array!42457)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!345200 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42457 (_ BitVec 32)) SeekEntryResult!7876)

(assert (=> b!775167 (= lt!345203 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!345200 lt!345199 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!775167 (= lt!345210 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!345200 mask!3328) lt!345200 lt!345199 mask!3328))))

(declare-fun a!3186 () array!42457)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!775167 (= lt!345200 (select (store (arr!20320 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!775167 (= lt!345199 (array!42458 (store (arr!20320 a!3186) i!1173 k0!2102) (size!20740 a!3186)))))

(declare-fun b!775168 () Bool)

(declare-datatypes ((Unit!26695 0))(
  ( (Unit!26696) )
))
(declare-fun e!431551 () Unit!26695)

(declare-fun Unit!26697 () Unit!26695)

(assert (=> b!775168 (= e!431551 Unit!26697)))

(declare-fun lt!345206 () (_ BitVec 32))

(declare-fun lt!345207 () SeekEntryResult!7876)

(assert (=> b!775168 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!345206 (select (arr!20320 a!3186) j!159) a!3186 mask!3328) lt!345207)))

(declare-fun b!775169 () Bool)

(declare-fun e!431560 () Bool)

(assert (=> b!775169 (= e!431559 (not e!431560))))

(declare-fun res!523950 () Bool)

(assert (=> b!775169 (=> res!523950 e!431560)))

(get-info :version)

(assert (=> b!775169 (= res!523950 (or (not ((_ is Intermediate!7876) lt!345203)) (bvsge x!1131 (x!64982 lt!345203))))))

(declare-fun lt!345202 () SeekEntryResult!7876)

(assert (=> b!775169 (= lt!345202 (Found!7876 j!159))))

(declare-fun e!431549 () Bool)

(assert (=> b!775169 e!431549))

(declare-fun res!523961 () Bool)

(assert (=> b!775169 (=> (not res!523961) (not e!431549))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42457 (_ BitVec 32)) Bool)

(assert (=> b!775169 (= res!523961 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!345209 () Unit!26695)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42457 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26695)

(assert (=> b!775169 (= lt!345209 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!775170 () Bool)

(declare-fun lt!345211 () SeekEntryResult!7876)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun e!431558 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42457 (_ BitVec 32)) SeekEntryResult!7876)

(assert (=> b!775170 (= e!431558 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20320 a!3186) j!159) a!3186 mask!3328) lt!345211))))

(declare-fun b!775171 () Bool)

(declare-fun res!523957 () Bool)

(declare-fun e!431553 () Bool)

(assert (=> b!775171 (=> (not res!523957) (not e!431553))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!775171 (= res!523957 (validKeyInArray!0 k0!2102))))

(declare-fun e!431555 () Bool)

(declare-fun b!775172 () Bool)

(assert (=> b!775172 (= e!431555 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!345206 resIntermediateIndex!5 (select (arr!20320 a!3186) j!159) a!3186 mask!3328) lt!345202)))))

(declare-fun b!775173 () Bool)

(declare-fun res!523952 () Bool)

(declare-fun e!431557 () Bool)

(assert (=> b!775173 (=> (not res!523952) (not e!431557))))

(assert (=> b!775173 (= res!523952 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!775174 () Bool)

(declare-fun res!523956 () Bool)

(declare-fun e!431556 () Bool)

(assert (=> b!775174 (=> res!523956 e!431556)))

(assert (=> b!775174 (= res!523956 (not (= lt!345210 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!345206 lt!345200 lt!345199 mask!3328))))))

(declare-fun b!775175 () Bool)

(assert (=> b!775175 (= e!431560 e!431556)))

(declare-fun res!523948 () Bool)

(assert (=> b!775175 (=> res!523948 e!431556)))

(assert (=> b!775175 (= res!523948 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!345206 #b00000000000000000000000000000000) (bvsge lt!345206 (size!20740 a!3186))))))

(declare-fun lt!345205 () Unit!26695)

(assert (=> b!775175 (= lt!345205 e!431551)))

(declare-fun c!86014 () Bool)

(declare-fun lt!345208 () Bool)

(assert (=> b!775175 (= c!86014 lt!345208)))

(assert (=> b!775175 (= lt!345208 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!775175 (= lt!345206 (nextIndex!0 index!1321 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328))))

(declare-fun res!523959 () Bool)

(assert (=> start!67222 (=> (not res!523959) (not e!431553))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67222 (= res!523959 (validMask!0 mask!3328))))

(assert (=> start!67222 e!431553))

(assert (=> start!67222 true))

(declare-fun array_inv!16179 (array!42457) Bool)

(assert (=> start!67222 (array_inv!16179 a!3186)))

(declare-fun b!775176 () Bool)

(assert (=> b!775176 (= e!431549 e!431558)))

(declare-fun res!523949 () Bool)

(assert (=> b!775176 (=> (not res!523949) (not e!431558))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42457 (_ BitVec 32)) SeekEntryResult!7876)

(assert (=> b!775176 (= res!523949 (= (seekEntryOrOpen!0 (select (arr!20320 a!3186) j!159) a!3186 mask!3328) lt!345211))))

(assert (=> b!775176 (= lt!345211 (Found!7876 j!159))))

(declare-fun b!775177 () Bool)

(declare-fun res!523964 () Bool)

(assert (=> b!775177 (=> (not res!523964) (not e!431554))))

(assert (=> b!775177 (= res!523964 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20320 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!775178 () Bool)

(declare-fun Unit!26698 () Unit!26695)

(assert (=> b!775178 (= e!431551 Unit!26698)))

(declare-fun lt!345201 () SeekEntryResult!7876)

(assert (=> b!775178 (= lt!345201 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20320 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!775178 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!345206 resIntermediateIndex!5 (select (arr!20320 a!3186) j!159) a!3186 mask!3328) lt!345202)))

(declare-fun b!775179 () Bool)

(declare-fun res!523954 () Bool)

(assert (=> b!775179 (=> (not res!523954) (not e!431557))))

(declare-datatypes ((List!14229 0))(
  ( (Nil!14226) (Cons!14225 (h!15339 (_ BitVec 64)) (t!20536 List!14229)) )
))
(declare-fun arrayNoDuplicates!0 (array!42457 (_ BitVec 32) List!14229) Bool)

(assert (=> b!775179 (= res!523954 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14226))))

(declare-fun b!775180 () Bool)

(declare-fun res!523965 () Bool)

(assert (=> b!775180 (=> (not res!523965) (not e!431553))))

(assert (=> b!775180 (= res!523965 (and (= (size!20740 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20740 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20740 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!775181 () Bool)

(assert (=> b!775181 (= e!431556 (bvslt (bvsub #b01111111111111111111111111111110 (bvadd #b00000000000000000000000000000001 x!1131)) (bvsub #b01111111111111111111111111111110 x!1131)))))

(declare-fun b!775182 () Bool)

(declare-fun res!523953 () Bool)

(assert (=> b!775182 (=> (not res!523953) (not e!431553))))

(assert (=> b!775182 (= res!523953 (validKeyInArray!0 (select (arr!20320 a!3186) j!159)))))

(declare-fun b!775183 () Bool)

(assert (=> b!775183 (= e!431557 e!431554)))

(declare-fun res!523947 () Bool)

(assert (=> b!775183 (=> (not res!523947) (not e!431554))))

(assert (=> b!775183 (= res!523947 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20320 a!3186) j!159) mask!3328) (select (arr!20320 a!3186) j!159) a!3186 mask!3328) lt!345207))))

(assert (=> b!775183 (= lt!345207 (Intermediate!7876 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!775184 () Bool)

(declare-fun res!523955 () Bool)

(assert (=> b!775184 (=> res!523955 e!431556)))

(assert (=> b!775184 (= res!523955 e!431555)))

(declare-fun c!86015 () Bool)

(assert (=> b!775184 (= c!86015 lt!345208)))

(declare-fun e!431552 () Bool)

(declare-fun b!775185 () Bool)

(assert (=> b!775185 (= e!431552 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20320 a!3186) j!159) a!3186 mask!3328) lt!345207))))

(declare-fun b!775186 () Bool)

(declare-fun res!523958 () Bool)

(assert (=> b!775186 (=> (not res!523958) (not e!431557))))

(assert (=> b!775186 (= res!523958 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20740 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20740 a!3186))))))

(declare-fun b!775187 () Bool)

(declare-fun res!523951 () Bool)

(assert (=> b!775187 (=> (not res!523951) (not e!431554))))

(assert (=> b!775187 (= res!523951 e!431552)))

(declare-fun c!86013 () Bool)

(assert (=> b!775187 (= c!86013 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!775188 () Bool)

(assert (=> b!775188 (= e!431553 e!431557)))

(declare-fun res!523963 () Bool)

(assert (=> b!775188 (=> (not res!523963) (not e!431557))))

(declare-fun lt!345204 () SeekEntryResult!7876)

(assert (=> b!775188 (= res!523963 (or (= lt!345204 (MissingZero!7876 i!1173)) (= lt!345204 (MissingVacant!7876 i!1173))))))

(assert (=> b!775188 (= lt!345204 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!775189 () Bool)

(declare-fun res!523962 () Bool)

(assert (=> b!775189 (=> (not res!523962) (not e!431553))))

(declare-fun arrayContainsKey!0 (array!42457 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!775189 (= res!523962 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!775190 () Bool)

(assert (=> b!775190 (= e!431552 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20320 a!3186) j!159) a!3186 mask!3328) (Found!7876 j!159)))))

(declare-fun b!775191 () Bool)

(assert (=> b!775191 (= e!431555 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!345206 (select (arr!20320 a!3186) j!159) a!3186 mask!3328) lt!345207)))))

(assert (= (and start!67222 res!523959) b!775180))

(assert (= (and b!775180 res!523965) b!775182))

(assert (= (and b!775182 res!523953) b!775171))

(assert (= (and b!775171 res!523957) b!775189))

(assert (= (and b!775189 res!523962) b!775188))

(assert (= (and b!775188 res!523963) b!775173))

(assert (= (and b!775173 res!523952) b!775179))

(assert (= (and b!775179 res!523954) b!775186))

(assert (= (and b!775186 res!523958) b!775183))

(assert (= (and b!775183 res!523947) b!775177))

(assert (= (and b!775177 res!523964) b!775187))

(assert (= (and b!775187 c!86013) b!775185))

(assert (= (and b!775187 (not c!86013)) b!775190))

(assert (= (and b!775187 res!523951) b!775167))

(assert (= (and b!775167 res!523960) b!775169))

(assert (= (and b!775169 res!523961) b!775176))

(assert (= (and b!775176 res!523949) b!775170))

(assert (= (and b!775169 (not res!523950)) b!775175))

(assert (= (and b!775175 c!86014) b!775168))

(assert (= (and b!775175 (not c!86014)) b!775178))

(assert (= (and b!775175 (not res!523948)) b!775184))

(assert (= (and b!775184 c!86015) b!775191))

(assert (= (and b!775184 (not c!86015)) b!775172))

(assert (= (and b!775184 (not res!523955)) b!775174))

(assert (= (and b!775174 (not res!523956)) b!775181))

(declare-fun m!720029 () Bool)

(assert (=> b!775183 m!720029))

(assert (=> b!775183 m!720029))

(declare-fun m!720031 () Bool)

(assert (=> b!775183 m!720031))

(assert (=> b!775183 m!720031))

(assert (=> b!775183 m!720029))

(declare-fun m!720033 () Bool)

(assert (=> b!775183 m!720033))

(assert (=> b!775172 m!720029))

(assert (=> b!775172 m!720029))

(declare-fun m!720035 () Bool)

(assert (=> b!775172 m!720035))

(assert (=> b!775168 m!720029))

(assert (=> b!775168 m!720029))

(declare-fun m!720037 () Bool)

(assert (=> b!775168 m!720037))

(declare-fun m!720039 () Bool)

(assert (=> b!775171 m!720039))

(declare-fun m!720041 () Bool)

(assert (=> b!775174 m!720041))

(assert (=> b!775185 m!720029))

(assert (=> b!775185 m!720029))

(declare-fun m!720043 () Bool)

(assert (=> b!775185 m!720043))

(assert (=> b!775176 m!720029))

(assert (=> b!775176 m!720029))

(declare-fun m!720045 () Bool)

(assert (=> b!775176 m!720045))

(declare-fun m!720047 () Bool)

(assert (=> b!775177 m!720047))

(declare-fun m!720049 () Bool)

(assert (=> b!775189 m!720049))

(assert (=> b!775190 m!720029))

(assert (=> b!775190 m!720029))

(declare-fun m!720051 () Bool)

(assert (=> b!775190 m!720051))

(assert (=> b!775178 m!720029))

(assert (=> b!775178 m!720029))

(assert (=> b!775178 m!720051))

(assert (=> b!775178 m!720029))

(assert (=> b!775178 m!720035))

(declare-fun m!720053 () Bool)

(assert (=> b!775167 m!720053))

(declare-fun m!720055 () Bool)

(assert (=> b!775167 m!720055))

(assert (=> b!775167 m!720053))

(declare-fun m!720057 () Bool)

(assert (=> b!775167 m!720057))

(declare-fun m!720059 () Bool)

(assert (=> b!775167 m!720059))

(declare-fun m!720061 () Bool)

(assert (=> b!775167 m!720061))

(declare-fun m!720063 () Bool)

(assert (=> b!775173 m!720063))

(declare-fun m!720065 () Bool)

(assert (=> start!67222 m!720065))

(declare-fun m!720067 () Bool)

(assert (=> start!67222 m!720067))

(declare-fun m!720069 () Bool)

(assert (=> b!775169 m!720069))

(declare-fun m!720071 () Bool)

(assert (=> b!775169 m!720071))

(assert (=> b!775170 m!720029))

(assert (=> b!775170 m!720029))

(declare-fun m!720073 () Bool)

(assert (=> b!775170 m!720073))

(assert (=> b!775182 m!720029))

(assert (=> b!775182 m!720029))

(declare-fun m!720075 () Bool)

(assert (=> b!775182 m!720075))

(declare-fun m!720077 () Bool)

(assert (=> b!775179 m!720077))

(declare-fun m!720079 () Bool)

(assert (=> b!775175 m!720079))

(declare-fun m!720081 () Bool)

(assert (=> b!775188 m!720081))

(assert (=> b!775191 m!720029))

(assert (=> b!775191 m!720029))

(assert (=> b!775191 m!720037))

(check-sat (not b!775170) (not b!775174) (not b!775189) (not b!775171) (not b!775183) (not b!775167) (not b!775172) (not b!775182) (not b!775188) (not b!775185) (not b!775190) (not b!775178) (not b!775176) (not b!775168) (not b!775169) (not b!775173) (not b!775191) (not b!775175) (not start!67222) (not b!775179))
(check-sat)
