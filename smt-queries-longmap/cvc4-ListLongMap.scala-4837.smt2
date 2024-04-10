; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66570 () Bool)

(assert start!66570)

(declare-fun b!767160 () Bool)

(declare-fun e!427206 () Bool)

(declare-fun e!427207 () Bool)

(assert (=> b!767160 (= e!427206 e!427207)))

(declare-fun res!518961 () Bool)

(assert (=> b!767160 (=> (not res!518961) (not e!427207))))

(declare-datatypes ((array!42280 0))(
  ( (array!42281 (arr!20243 (Array (_ BitVec 32) (_ BitVec 64))) (size!20664 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42280)

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7843 0))(
  ( (MissingZero!7843 (index!33740 (_ BitVec 32))) (Found!7843 (index!33741 (_ BitVec 32))) (Intermediate!7843 (undefined!8655 Bool) (index!33742 (_ BitVec 32)) (x!64653 (_ BitVec 32))) (Undefined!7843) (MissingVacant!7843 (index!33743 (_ BitVec 32))) )
))
(declare-fun lt!341259 () SeekEntryResult!7843)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42280 (_ BitVec 32)) SeekEntryResult!7843)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!767160 (= res!518961 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20243 a!3186) j!159) mask!3328) (select (arr!20243 a!3186) j!159) a!3186 mask!3328) lt!341259))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!767160 (= lt!341259 (Intermediate!7843 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!767161 () Bool)

(declare-fun res!518952 () Bool)

(declare-fun e!427209 () Bool)

(assert (=> b!767161 (=> (not res!518952) (not e!427209))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42280 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!767161 (= res!518952 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!767162 () Bool)

(declare-fun e!427211 () Bool)

(assert (=> b!767162 (= e!427211 true)))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!341255 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!767162 (= lt!341255 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun lt!341253 () SeekEntryResult!7843)

(declare-fun b!767163 () Bool)

(declare-fun e!427204 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42280 (_ BitVec 32)) SeekEntryResult!7843)

(assert (=> b!767163 (= e!427204 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20243 a!3186) j!159) a!3186 mask!3328) lt!341253))))

(declare-fun e!427208 () Bool)

(declare-fun b!767164 () Bool)

(assert (=> b!767164 (= e!427208 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20243 a!3186) j!159) a!3186 mask!3328) lt!341259))))

(declare-fun res!518953 () Bool)

(assert (=> start!66570 (=> (not res!518953) (not e!427209))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66570 (= res!518953 (validMask!0 mask!3328))))

(assert (=> start!66570 e!427209))

(assert (=> start!66570 true))

(declare-fun array_inv!16039 (array!42280) Bool)

(assert (=> start!66570 (array_inv!16039 a!3186)))

(declare-fun b!767165 () Bool)

(declare-fun res!518957 () Bool)

(assert (=> b!767165 (=> (not res!518957) (not e!427209))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!767165 (= res!518957 (validKeyInArray!0 (select (arr!20243 a!3186) j!159)))))

(declare-fun b!767166 () Bool)

(assert (=> b!767166 (= e!427209 e!427206)))

(declare-fun res!518951 () Bool)

(assert (=> b!767166 (=> (not res!518951) (not e!427206))))

(declare-fun lt!341256 () SeekEntryResult!7843)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!767166 (= res!518951 (or (= lt!341256 (MissingZero!7843 i!1173)) (= lt!341256 (MissingVacant!7843 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42280 (_ BitVec 32)) SeekEntryResult!7843)

(assert (=> b!767166 (= lt!341256 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!767167 () Bool)

(declare-fun res!518964 () Bool)

(assert (=> b!767167 (=> (not res!518964) (not e!427209))))

(assert (=> b!767167 (= res!518964 (and (= (size!20664 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20664 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20664 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!767168 () Bool)

(declare-fun res!518963 () Bool)

(assert (=> b!767168 (=> (not res!518963) (not e!427206))))

(declare-datatypes ((List!14245 0))(
  ( (Nil!14242) (Cons!14241 (h!15334 (_ BitVec 64)) (t!20560 List!14245)) )
))
(declare-fun arrayNoDuplicates!0 (array!42280 (_ BitVec 32) List!14245) Bool)

(assert (=> b!767168 (= res!518963 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14242))))

(declare-fun b!767169 () Bool)

(declare-fun res!518965 () Bool)

(assert (=> b!767169 (=> (not res!518965) (not e!427206))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42280 (_ BitVec 32)) Bool)

(assert (=> b!767169 (= res!518965 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!767170 () Bool)

(declare-fun e!427210 () Bool)

(assert (=> b!767170 (= e!427207 e!427210)))

(declare-fun res!518958 () Bool)

(assert (=> b!767170 (=> (not res!518958) (not e!427210))))

(declare-fun lt!341257 () SeekEntryResult!7843)

(declare-fun lt!341260 () SeekEntryResult!7843)

(assert (=> b!767170 (= res!518958 (= lt!341257 lt!341260))))

(declare-fun lt!341258 () array!42280)

(declare-fun lt!341261 () (_ BitVec 64))

(assert (=> b!767170 (= lt!341260 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!341261 lt!341258 mask!3328))))

(assert (=> b!767170 (= lt!341257 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!341261 mask!3328) lt!341261 lt!341258 mask!3328))))

(assert (=> b!767170 (= lt!341261 (select (store (arr!20243 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!767170 (= lt!341258 (array!42281 (store (arr!20243 a!3186) i!1173 k!2102) (size!20664 a!3186)))))

(declare-fun b!767171 () Bool)

(assert (=> b!767171 (= e!427208 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20243 a!3186) j!159) a!3186 mask!3328) (Found!7843 j!159)))))

(declare-fun b!767172 () Bool)

(declare-fun res!518959 () Bool)

(assert (=> b!767172 (=> (not res!518959) (not e!427209))))

(assert (=> b!767172 (= res!518959 (validKeyInArray!0 k!2102))))

(declare-fun b!767173 () Bool)

(declare-fun res!518960 () Bool)

(assert (=> b!767173 (=> (not res!518960) (not e!427206))))

(assert (=> b!767173 (= res!518960 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20664 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20664 a!3186))))))

(declare-fun b!767174 () Bool)

(declare-fun res!518954 () Bool)

(assert (=> b!767174 (=> (not res!518954) (not e!427207))))

(assert (=> b!767174 (= res!518954 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20243 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!767175 () Bool)

(declare-fun e!427212 () Bool)

(assert (=> b!767175 (= e!427212 e!427204)))

(declare-fun res!518956 () Bool)

(assert (=> b!767175 (=> (not res!518956) (not e!427204))))

(assert (=> b!767175 (= res!518956 (= (seekEntryOrOpen!0 (select (arr!20243 a!3186) j!159) a!3186 mask!3328) lt!341253))))

(assert (=> b!767175 (= lt!341253 (Found!7843 j!159))))

(declare-fun b!767176 () Bool)

(assert (=> b!767176 (= e!427210 (not e!427211))))

(declare-fun res!518955 () Bool)

(assert (=> b!767176 (=> res!518955 e!427211)))

(assert (=> b!767176 (= res!518955 (or (not (is-Intermediate!7843 lt!341260)) (bvsge x!1131 (x!64653 lt!341260))))))

(assert (=> b!767176 e!427212))

(declare-fun res!518962 () Bool)

(assert (=> b!767176 (=> (not res!518962) (not e!427212))))

(assert (=> b!767176 (= res!518962 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26412 0))(
  ( (Unit!26413) )
))
(declare-fun lt!341254 () Unit!26412)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42280 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26412)

(assert (=> b!767176 (= lt!341254 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!767177 () Bool)

(declare-fun res!518950 () Bool)

(assert (=> b!767177 (=> (not res!518950) (not e!427207))))

(assert (=> b!767177 (= res!518950 e!427208)))

(declare-fun c!84496 () Bool)

(assert (=> b!767177 (= c!84496 (bvsle x!1131 resIntermediateX!5))))

(assert (= (and start!66570 res!518953) b!767167))

(assert (= (and b!767167 res!518964) b!767165))

(assert (= (and b!767165 res!518957) b!767172))

(assert (= (and b!767172 res!518959) b!767161))

(assert (= (and b!767161 res!518952) b!767166))

(assert (= (and b!767166 res!518951) b!767169))

(assert (= (and b!767169 res!518965) b!767168))

(assert (= (and b!767168 res!518963) b!767173))

(assert (= (and b!767173 res!518960) b!767160))

(assert (= (and b!767160 res!518961) b!767174))

(assert (= (and b!767174 res!518954) b!767177))

(assert (= (and b!767177 c!84496) b!767164))

(assert (= (and b!767177 (not c!84496)) b!767171))

(assert (= (and b!767177 res!518950) b!767170))

(assert (= (and b!767170 res!518958) b!767176))

(assert (= (and b!767176 res!518962) b!767175))

(assert (= (and b!767175 res!518956) b!767163))

(assert (= (and b!767176 (not res!518955)) b!767162))

(declare-fun m!712977 () Bool)

(assert (=> b!767171 m!712977))

(assert (=> b!767171 m!712977))

(declare-fun m!712979 () Bool)

(assert (=> b!767171 m!712979))

(declare-fun m!712981 () Bool)

(assert (=> b!767161 m!712981))

(declare-fun m!712983 () Bool)

(assert (=> b!767176 m!712983))

(declare-fun m!712985 () Bool)

(assert (=> b!767176 m!712985))

(declare-fun m!712987 () Bool)

(assert (=> b!767174 m!712987))

(assert (=> b!767163 m!712977))

(assert (=> b!767163 m!712977))

(declare-fun m!712989 () Bool)

(assert (=> b!767163 m!712989))

(declare-fun m!712991 () Bool)

(assert (=> b!767168 m!712991))

(assert (=> b!767160 m!712977))

(assert (=> b!767160 m!712977))

(declare-fun m!712993 () Bool)

(assert (=> b!767160 m!712993))

(assert (=> b!767160 m!712993))

(assert (=> b!767160 m!712977))

(declare-fun m!712995 () Bool)

(assert (=> b!767160 m!712995))

(declare-fun m!712997 () Bool)

(assert (=> b!767169 m!712997))

(declare-fun m!712999 () Bool)

(assert (=> b!767162 m!712999))

(declare-fun m!713001 () Bool)

(assert (=> b!767170 m!713001))

(declare-fun m!713003 () Bool)

(assert (=> b!767170 m!713003))

(declare-fun m!713005 () Bool)

(assert (=> b!767170 m!713005))

(assert (=> b!767170 m!713003))

(declare-fun m!713007 () Bool)

(assert (=> b!767170 m!713007))

(declare-fun m!713009 () Bool)

(assert (=> b!767170 m!713009))

(assert (=> b!767175 m!712977))

(assert (=> b!767175 m!712977))

(declare-fun m!713011 () Bool)

(assert (=> b!767175 m!713011))

(assert (=> b!767165 m!712977))

(assert (=> b!767165 m!712977))

(declare-fun m!713013 () Bool)

(assert (=> b!767165 m!713013))

(declare-fun m!713015 () Bool)

(assert (=> b!767166 m!713015))

(declare-fun m!713017 () Bool)

(assert (=> b!767172 m!713017))

(assert (=> b!767164 m!712977))

(assert (=> b!767164 m!712977))

(declare-fun m!713019 () Bool)

(assert (=> b!767164 m!713019))

(declare-fun m!713021 () Bool)

(assert (=> start!66570 m!713021))

(declare-fun m!713023 () Bool)

(assert (=> start!66570 m!713023))

(push 1)

