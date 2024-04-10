; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66818 () Bool)

(assert start!66818)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!770936 () Bool)

(declare-fun e!429205 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((array!42380 0))(
  ( (array!42381 (arr!20290 (Array (_ BitVec 32) (_ BitVec 64))) (size!20711 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42380)

(declare-datatypes ((SeekEntryResult!7890 0))(
  ( (MissingZero!7890 (index!33928 (_ BitVec 32))) (Found!7890 (index!33929 (_ BitVec 32))) (Intermediate!7890 (undefined!8702 Bool) (index!33930 (_ BitVec 32)) (x!64853 (_ BitVec 32))) (Undefined!7890) (MissingVacant!7890 (index!33931 (_ BitVec 32))) )
))
(declare-fun lt!343169 () SeekEntryResult!7890)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42380 (_ BitVec 32)) SeekEntryResult!7890)

(assert (=> b!770936 (= e!429205 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20290 a!3186) j!159) a!3186 mask!3328) lt!343169))))

(declare-fun b!770937 () Bool)

(declare-fun e!429204 () Bool)

(declare-fun e!429208 () Bool)

(assert (=> b!770937 (= e!429204 (not e!429208))))

(declare-fun res!521553 () Bool)

(assert (=> b!770937 (=> res!521553 e!429208)))

(declare-fun lt!343168 () SeekEntryResult!7890)

(get-info :version)

(assert (=> b!770937 (= res!521553 (or (not ((_ is Intermediate!7890) lt!343168)) (bvsge x!1131 (x!64853 lt!343168))))))

(declare-fun e!429207 () Bool)

(assert (=> b!770937 e!429207))

(declare-fun res!521551 () Bool)

(assert (=> b!770937 (=> (not res!521551) (not e!429207))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42380 (_ BitVec 32)) Bool)

(assert (=> b!770937 (= res!521551 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26574 0))(
  ( (Unit!26575) )
))
(declare-fun lt!343175 () Unit!26574)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42380 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26574)

(assert (=> b!770937 (= lt!343175 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun res!521554 () Bool)

(declare-fun e!429209 () Bool)

(assert (=> start!66818 (=> (not res!521554) (not e!429209))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66818 (= res!521554 (validMask!0 mask!3328))))

(assert (=> start!66818 e!429209))

(assert (=> start!66818 true))

(declare-fun array_inv!16086 (array!42380) Bool)

(assert (=> start!66818 (array_inv!16086 a!3186)))

(declare-fun b!770938 () Bool)

(declare-fun res!521558 () Bool)

(declare-fun e!429206 () Bool)

(assert (=> b!770938 (=> (not res!521558) (not e!429206))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!770938 (= res!521558 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20290 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!770939 () Bool)

(assert (=> b!770939 (= e!429208 true)))

(declare-fun lt!343177 () Unit!26574)

(declare-fun e!429201 () Unit!26574)

(assert (=> b!770939 (= lt!343177 e!429201)))

(declare-fun c!85089 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!770939 (= c!85089 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun lt!343174 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!770939 (= lt!343174 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!770940 () Bool)

(declare-fun res!521555 () Bool)

(declare-fun e!429202 () Bool)

(assert (=> b!770940 (=> (not res!521555) (not e!429202))))

(assert (=> b!770940 (= res!521555 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20711 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20711 a!3186))))))

(declare-fun e!429200 () Bool)

(declare-fun b!770941 () Bool)

(declare-fun lt!343172 () SeekEntryResult!7890)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42380 (_ BitVec 32)) SeekEntryResult!7890)

(assert (=> b!770941 (= e!429200 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20290 a!3186) j!159) a!3186 mask!3328) lt!343172))))

(declare-fun b!770942 () Bool)

(assert (=> b!770942 (= e!429209 e!429202)))

(declare-fun res!521559 () Bool)

(assert (=> b!770942 (=> (not res!521559) (not e!429202))))

(declare-fun lt!343170 () SeekEntryResult!7890)

(assert (=> b!770942 (= res!521559 (or (= lt!343170 (MissingZero!7890 i!1173)) (= lt!343170 (MissingVacant!7890 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42380 (_ BitVec 32)) SeekEntryResult!7890)

(assert (=> b!770942 (= lt!343170 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!770943 () Bool)

(declare-fun res!521561 () Bool)

(assert (=> b!770943 (=> (not res!521561) (not e!429206))))

(assert (=> b!770943 (= res!521561 e!429205)))

(declare-fun c!85090 () Bool)

(assert (=> b!770943 (= c!85090 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!770944 () Bool)

(declare-fun res!521562 () Bool)

(assert (=> b!770944 (=> (not res!521562) (not e!429209))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!770944 (= res!521562 (validKeyInArray!0 (select (arr!20290 a!3186) j!159)))))

(declare-fun b!770945 () Bool)

(declare-fun res!521556 () Bool)

(assert (=> b!770945 (=> (not res!521556) (not e!429209))))

(assert (=> b!770945 (= res!521556 (validKeyInArray!0 k0!2102))))

(declare-fun b!770946 () Bool)

(declare-fun Unit!26576 () Unit!26574)

(assert (=> b!770946 (= e!429201 Unit!26576)))

(declare-fun lt!343178 () SeekEntryResult!7890)

(assert (=> b!770946 (= lt!343178 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20290 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!770946 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!343174 resIntermediateIndex!5 (select (arr!20290 a!3186) j!159) a!3186 mask!3328) (Found!7890 j!159))))

(declare-fun b!770947 () Bool)

(declare-fun res!521549 () Bool)

(assert (=> b!770947 (=> (not res!521549) (not e!429209))))

(assert (=> b!770947 (= res!521549 (and (= (size!20711 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20711 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20711 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!770948 () Bool)

(declare-fun Unit!26577 () Unit!26574)

(assert (=> b!770948 (= e!429201 Unit!26577)))

(assert (=> b!770948 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!343174 (select (arr!20290 a!3186) j!159) a!3186 mask!3328) lt!343169)))

(declare-fun b!770949 () Bool)

(declare-fun res!521564 () Bool)

(assert (=> b!770949 (=> (not res!521564) (not e!429202))))

(declare-datatypes ((List!14292 0))(
  ( (Nil!14289) (Cons!14288 (h!15387 (_ BitVec 64)) (t!20607 List!14292)) )
))
(declare-fun arrayNoDuplicates!0 (array!42380 (_ BitVec 32) List!14292) Bool)

(assert (=> b!770949 (= res!521564 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14289))))

(declare-fun b!770950 () Bool)

(assert (=> b!770950 (= e!429205 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20290 a!3186) j!159) a!3186 mask!3328) (Found!7890 j!159)))))

(declare-fun b!770951 () Bool)

(declare-fun res!521563 () Bool)

(assert (=> b!770951 (=> (not res!521563) (not e!429209))))

(declare-fun arrayContainsKey!0 (array!42380 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!770951 (= res!521563 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!770952 () Bool)

(assert (=> b!770952 (= e!429207 e!429200)))

(declare-fun res!521550 () Bool)

(assert (=> b!770952 (=> (not res!521550) (not e!429200))))

(assert (=> b!770952 (= res!521550 (= (seekEntryOrOpen!0 (select (arr!20290 a!3186) j!159) a!3186 mask!3328) lt!343172))))

(assert (=> b!770952 (= lt!343172 (Found!7890 j!159))))

(declare-fun b!770953 () Bool)

(assert (=> b!770953 (= e!429206 e!429204)))

(declare-fun res!521560 () Bool)

(assert (=> b!770953 (=> (not res!521560) (not e!429204))))

(declare-fun lt!343176 () SeekEntryResult!7890)

(assert (=> b!770953 (= res!521560 (= lt!343176 lt!343168))))

(declare-fun lt!343173 () array!42380)

(declare-fun lt!343171 () (_ BitVec 64))

(assert (=> b!770953 (= lt!343168 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!343171 lt!343173 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!770953 (= lt!343176 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!343171 mask!3328) lt!343171 lt!343173 mask!3328))))

(assert (=> b!770953 (= lt!343171 (select (store (arr!20290 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!770953 (= lt!343173 (array!42381 (store (arr!20290 a!3186) i!1173 k0!2102) (size!20711 a!3186)))))

(declare-fun b!770954 () Bool)

(declare-fun res!521557 () Bool)

(assert (=> b!770954 (=> (not res!521557) (not e!429202))))

(assert (=> b!770954 (= res!521557 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!770955 () Bool)

(assert (=> b!770955 (= e!429202 e!429206)))

(declare-fun res!521552 () Bool)

(assert (=> b!770955 (=> (not res!521552) (not e!429206))))

(assert (=> b!770955 (= res!521552 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20290 a!3186) j!159) mask!3328) (select (arr!20290 a!3186) j!159) a!3186 mask!3328) lt!343169))))

(assert (=> b!770955 (= lt!343169 (Intermediate!7890 false resIntermediateIndex!5 resIntermediateX!5))))

(assert (= (and start!66818 res!521554) b!770947))

(assert (= (and b!770947 res!521549) b!770944))

(assert (= (and b!770944 res!521562) b!770945))

(assert (= (and b!770945 res!521556) b!770951))

(assert (= (and b!770951 res!521563) b!770942))

(assert (= (and b!770942 res!521559) b!770954))

(assert (= (and b!770954 res!521557) b!770949))

(assert (= (and b!770949 res!521564) b!770940))

(assert (= (and b!770940 res!521555) b!770955))

(assert (= (and b!770955 res!521552) b!770938))

(assert (= (and b!770938 res!521558) b!770943))

(assert (= (and b!770943 c!85090) b!770936))

(assert (= (and b!770943 (not c!85090)) b!770950))

(assert (= (and b!770943 res!521561) b!770953))

(assert (= (and b!770953 res!521560) b!770937))

(assert (= (and b!770937 res!521551) b!770952))

(assert (= (and b!770952 res!521550) b!770941))

(assert (= (and b!770937 (not res!521553)) b!770939))

(assert (= (and b!770939 c!85089) b!770948))

(assert (= (and b!770939 (not c!85089)) b!770946))

(declare-fun m!716151 () Bool)

(assert (=> b!770955 m!716151))

(assert (=> b!770955 m!716151))

(declare-fun m!716153 () Bool)

(assert (=> b!770955 m!716153))

(assert (=> b!770955 m!716153))

(assert (=> b!770955 m!716151))

(declare-fun m!716155 () Bool)

(assert (=> b!770955 m!716155))

(declare-fun m!716157 () Bool)

(assert (=> b!770954 m!716157))

(assert (=> b!770948 m!716151))

(assert (=> b!770948 m!716151))

(declare-fun m!716159 () Bool)

(assert (=> b!770948 m!716159))

(assert (=> b!770936 m!716151))

(assert (=> b!770936 m!716151))

(declare-fun m!716161 () Bool)

(assert (=> b!770936 m!716161))

(declare-fun m!716163 () Bool)

(assert (=> b!770939 m!716163))

(declare-fun m!716165 () Bool)

(assert (=> b!770951 m!716165))

(assert (=> b!770952 m!716151))

(assert (=> b!770952 m!716151))

(declare-fun m!716167 () Bool)

(assert (=> b!770952 m!716167))

(declare-fun m!716169 () Bool)

(assert (=> b!770938 m!716169))

(assert (=> b!770950 m!716151))

(assert (=> b!770950 m!716151))

(declare-fun m!716171 () Bool)

(assert (=> b!770950 m!716171))

(assert (=> b!770944 m!716151))

(assert (=> b!770944 m!716151))

(declare-fun m!716173 () Bool)

(assert (=> b!770944 m!716173))

(declare-fun m!716175 () Bool)

(assert (=> b!770942 m!716175))

(declare-fun m!716177 () Bool)

(assert (=> b!770945 m!716177))

(assert (=> b!770946 m!716151))

(assert (=> b!770946 m!716151))

(assert (=> b!770946 m!716171))

(assert (=> b!770946 m!716151))

(declare-fun m!716179 () Bool)

(assert (=> b!770946 m!716179))

(assert (=> b!770941 m!716151))

(assert (=> b!770941 m!716151))

(declare-fun m!716181 () Bool)

(assert (=> b!770941 m!716181))

(declare-fun m!716183 () Bool)

(assert (=> start!66818 m!716183))

(declare-fun m!716185 () Bool)

(assert (=> start!66818 m!716185))

(declare-fun m!716187 () Bool)

(assert (=> b!770949 m!716187))

(declare-fun m!716189 () Bool)

(assert (=> b!770937 m!716189))

(declare-fun m!716191 () Bool)

(assert (=> b!770937 m!716191))

(declare-fun m!716193 () Bool)

(assert (=> b!770953 m!716193))

(declare-fun m!716195 () Bool)

(assert (=> b!770953 m!716195))

(declare-fun m!716197 () Bool)

(assert (=> b!770953 m!716197))

(declare-fun m!716199 () Bool)

(assert (=> b!770953 m!716199))

(assert (=> b!770953 m!716193))

(declare-fun m!716201 () Bool)

(assert (=> b!770953 m!716201))

(check-sat (not b!770942) (not b!770939) (not b!770945) (not b!770941) (not b!770955) (not b!770946) (not b!770948) (not b!770951) (not b!770936) (not b!770953) (not b!770937) (not start!66818) (not b!770952) (not b!770949) (not b!770950) (not b!770954) (not b!770944))
(check-sat)
