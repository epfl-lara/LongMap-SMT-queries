; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66552 () Bool)

(assert start!66552)

(declare-fun b!766966 () Bool)

(declare-fun res!518903 () Bool)

(declare-fun e!427080 () Bool)

(assert (=> b!766966 (=> (not res!518903) (not e!427080))))

(declare-datatypes ((array!42279 0))(
  ( (array!42280 (arr!20243 (Array (_ BitVec 32) (_ BitVec 64))) (size!20664 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42279)

(declare-datatypes ((List!14284 0))(
  ( (Nil!14281) (Cons!14280 (h!15373 (_ BitVec 64)) (t!20590 List!14284)) )
))
(declare-fun arrayNoDuplicates!0 (array!42279 (_ BitVec 32) List!14284) Bool)

(assert (=> b!766966 (= res!518903 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14281))))

(declare-fun res!518904 () Bool)

(declare-fun e!427088 () Bool)

(assert (=> start!66552 (=> (not res!518904) (not e!427088))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66552 (= res!518904 (validMask!0 mask!3328))))

(assert (=> start!66552 e!427088))

(assert (=> start!66552 true))

(declare-fun array_inv!16126 (array!42279) Bool)

(assert (=> start!66552 (array_inv!16126 a!3186)))

(declare-fun b!766967 () Bool)

(declare-fun e!427084 () Bool)

(declare-fun e!427086 () Bool)

(assert (=> b!766967 (= e!427084 (not e!427086))))

(declare-fun res!518901 () Bool)

(assert (=> b!766967 (=> res!518901 e!427086)))

(declare-datatypes ((SeekEntryResult!7840 0))(
  ( (MissingZero!7840 (index!33728 (_ BitVec 32))) (Found!7840 (index!33729 (_ BitVec 32))) (Intermediate!7840 (undefined!8652 Bool) (index!33730 (_ BitVec 32)) (x!64653 (_ BitVec 32))) (Undefined!7840) (MissingVacant!7840 (index!33731 (_ BitVec 32))) )
))
(declare-fun lt!341042 () SeekEntryResult!7840)

(declare-fun x!1131 () (_ BitVec 32))

(get-info :version)

(assert (=> b!766967 (= res!518901 (or (not ((_ is Intermediate!7840) lt!341042)) (bvsge x!1131 (x!64653 lt!341042))))))

(declare-fun e!427079 () Bool)

(assert (=> b!766967 e!427079))

(declare-fun res!518894 () Bool)

(assert (=> b!766967 (=> (not res!518894) (not e!427079))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42279 (_ BitVec 32)) Bool)

(assert (=> b!766967 (= res!518894 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26378 0))(
  ( (Unit!26379) )
))
(declare-fun lt!341045 () Unit!26378)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42279 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26378)

(assert (=> b!766967 (= lt!341045 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!766968 () Bool)

(declare-fun res!518890 () Bool)

(declare-fun e!427087 () Bool)

(assert (=> b!766968 (=> (not res!518890) (not e!427087))))

(declare-fun e!427083 () Bool)

(assert (=> b!766968 (= res!518890 e!427083)))

(declare-fun c!84429 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!766968 (= c!84429 (bvsle x!1131 resIntermediateX!5))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!766969 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42279 (_ BitVec 32)) SeekEntryResult!7840)

(assert (=> b!766969 (= e!427083 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20243 a!3186) j!159) a!3186 mask!3328) (Found!7840 j!159)))))

(declare-fun b!766970 () Bool)

(declare-fun res!518902 () Bool)

(assert (=> b!766970 (=> (not res!518902) (not e!427088))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!766970 (= res!518902 (validKeyInArray!0 (select (arr!20243 a!3186) j!159)))))

(declare-fun b!766971 () Bool)

(assert (=> b!766971 (= e!427080 e!427087)))

(declare-fun res!518895 () Bool)

(assert (=> b!766971 (=> (not res!518895) (not e!427087))))

(declare-fun lt!341043 () SeekEntryResult!7840)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42279 (_ BitVec 32)) SeekEntryResult!7840)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!766971 (= res!518895 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20243 a!3186) j!159) mask!3328) (select (arr!20243 a!3186) j!159) a!3186 mask!3328) lt!341043))))

(assert (=> b!766971 (= lt!341043 (Intermediate!7840 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!766972 () Bool)

(declare-fun res!518905 () Bool)

(assert (=> b!766972 (=> (not res!518905) (not e!427080))))

(assert (=> b!766972 (= res!518905 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20664 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20664 a!3186))))))

(declare-fun lt!341050 () SeekEntryResult!7840)

(declare-fun b!766973 () Bool)

(declare-fun e!427085 () Bool)

(assert (=> b!766973 (= e!427085 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20243 a!3186) j!159) a!3186 mask!3328) lt!341050))))

(declare-fun b!766974 () Bool)

(declare-fun res!518906 () Bool)

(assert (=> b!766974 (=> (not res!518906) (not e!427088))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!766974 (= res!518906 (validKeyInArray!0 k0!2102))))

(declare-fun b!766975 () Bool)

(declare-fun res!518891 () Bool)

(assert (=> b!766975 (=> (not res!518891) (not e!427088))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!766975 (= res!518891 (and (= (size!20664 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20664 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20664 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!766976 () Bool)

(declare-fun res!518898 () Bool)

(assert (=> b!766976 (=> (not res!518898) (not e!427087))))

(assert (=> b!766976 (= res!518898 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20243 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!766977 () Bool)

(assert (=> b!766977 (= e!427079 e!427085)))

(declare-fun res!518896 () Bool)

(assert (=> b!766977 (=> (not res!518896) (not e!427085))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42279 (_ BitVec 32)) SeekEntryResult!7840)

(assert (=> b!766977 (= res!518896 (= (seekEntryOrOpen!0 (select (arr!20243 a!3186) j!159) a!3186 mask!3328) lt!341050))))

(assert (=> b!766977 (= lt!341050 (Found!7840 j!159))))

(declare-fun b!766978 () Bool)

(declare-fun res!518899 () Bool)

(assert (=> b!766978 (=> (not res!518899) (not e!427080))))

(assert (=> b!766978 (= res!518899 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!766979 () Bool)

(declare-fun e!427081 () Bool)

(assert (=> b!766979 (= e!427081 true)))

(declare-fun lt!341046 () SeekEntryResult!7840)

(assert (=> b!766979 (= lt!341046 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20243 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!766980 () Bool)

(assert (=> b!766980 (= e!427088 e!427080)))

(declare-fun res!518893 () Bool)

(assert (=> b!766980 (=> (not res!518893) (not e!427080))))

(declare-fun lt!341051 () SeekEntryResult!7840)

(assert (=> b!766980 (= res!518893 (or (= lt!341051 (MissingZero!7840 i!1173)) (= lt!341051 (MissingVacant!7840 i!1173))))))

(assert (=> b!766980 (= lt!341051 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!766981 () Bool)

(assert (=> b!766981 (= e!427083 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20243 a!3186) j!159) a!3186 mask!3328) lt!341043))))

(declare-fun b!766982 () Bool)

(assert (=> b!766982 (= e!427087 e!427084)))

(declare-fun res!518892 () Bool)

(assert (=> b!766982 (=> (not res!518892) (not e!427084))))

(declare-fun lt!341047 () SeekEntryResult!7840)

(assert (=> b!766982 (= res!518892 (= lt!341047 lt!341042))))

(declare-fun lt!341048 () (_ BitVec 64))

(declare-fun lt!341049 () array!42279)

(assert (=> b!766982 (= lt!341042 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!341048 lt!341049 mask!3328))))

(assert (=> b!766982 (= lt!341047 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!341048 mask!3328) lt!341048 lt!341049 mask!3328))))

(assert (=> b!766982 (= lt!341048 (select (store (arr!20243 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!766982 (= lt!341049 (array!42280 (store (arr!20243 a!3186) i!1173 k0!2102) (size!20664 a!3186)))))

(declare-fun b!766983 () Bool)

(declare-fun res!518897 () Bool)

(assert (=> b!766983 (=> (not res!518897) (not e!427088))))

(declare-fun arrayContainsKey!0 (array!42279 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!766983 (= res!518897 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!766984 () Bool)

(assert (=> b!766984 (= e!427086 e!427081)))

(declare-fun res!518900 () Bool)

(assert (=> b!766984 (=> res!518900 e!427081)))

(assert (=> b!766984 (= res!518900 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun lt!341044 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!766984 (= lt!341044 (nextIndex!0 index!1321 x!1131 mask!3328))))

(assert (= (and start!66552 res!518904) b!766975))

(assert (= (and b!766975 res!518891) b!766970))

(assert (= (and b!766970 res!518902) b!766974))

(assert (= (and b!766974 res!518906) b!766983))

(assert (= (and b!766983 res!518897) b!766980))

(assert (= (and b!766980 res!518893) b!766978))

(assert (= (and b!766978 res!518899) b!766966))

(assert (= (and b!766966 res!518903) b!766972))

(assert (= (and b!766972 res!518905) b!766971))

(assert (= (and b!766971 res!518895) b!766976))

(assert (= (and b!766976 res!518898) b!766968))

(assert (= (and b!766968 c!84429) b!766981))

(assert (= (and b!766968 (not c!84429)) b!766969))

(assert (= (and b!766968 res!518890) b!766982))

(assert (= (and b!766982 res!518892) b!766967))

(assert (= (and b!766967 res!518894) b!766977))

(assert (= (and b!766977 res!518896) b!766973))

(assert (= (and b!766967 (not res!518901)) b!766984))

(assert (= (and b!766984 (not res!518900)) b!766979))

(declare-fun m!712267 () Bool)

(assert (=> b!766981 m!712267))

(assert (=> b!766981 m!712267))

(declare-fun m!712269 () Bool)

(assert (=> b!766981 m!712269))

(assert (=> b!766969 m!712267))

(assert (=> b!766969 m!712267))

(declare-fun m!712271 () Bool)

(assert (=> b!766969 m!712271))

(assert (=> b!766971 m!712267))

(assert (=> b!766971 m!712267))

(declare-fun m!712273 () Bool)

(assert (=> b!766971 m!712273))

(assert (=> b!766971 m!712273))

(assert (=> b!766971 m!712267))

(declare-fun m!712275 () Bool)

(assert (=> b!766971 m!712275))

(declare-fun m!712277 () Bool)

(assert (=> b!766976 m!712277))

(assert (=> b!766977 m!712267))

(assert (=> b!766977 m!712267))

(declare-fun m!712279 () Bool)

(assert (=> b!766977 m!712279))

(declare-fun m!712281 () Bool)

(assert (=> b!766978 m!712281))

(declare-fun m!712283 () Bool)

(assert (=> b!766974 m!712283))

(assert (=> b!766970 m!712267))

(assert (=> b!766970 m!712267))

(declare-fun m!712285 () Bool)

(assert (=> b!766970 m!712285))

(declare-fun m!712287 () Bool)

(assert (=> b!766966 m!712287))

(declare-fun m!712289 () Bool)

(assert (=> b!766982 m!712289))

(declare-fun m!712291 () Bool)

(assert (=> b!766982 m!712291))

(declare-fun m!712293 () Bool)

(assert (=> b!766982 m!712293))

(declare-fun m!712295 () Bool)

(assert (=> b!766982 m!712295))

(declare-fun m!712297 () Bool)

(assert (=> b!766982 m!712297))

(assert (=> b!766982 m!712289))

(assert (=> b!766973 m!712267))

(assert (=> b!766973 m!712267))

(declare-fun m!712299 () Bool)

(assert (=> b!766973 m!712299))

(declare-fun m!712301 () Bool)

(assert (=> b!766967 m!712301))

(declare-fun m!712303 () Bool)

(assert (=> b!766967 m!712303))

(declare-fun m!712305 () Bool)

(assert (=> b!766984 m!712305))

(declare-fun m!712307 () Bool)

(assert (=> b!766983 m!712307))

(declare-fun m!712309 () Bool)

(assert (=> start!66552 m!712309))

(declare-fun m!712311 () Bool)

(assert (=> start!66552 m!712311))

(declare-fun m!712313 () Bool)

(assert (=> b!766980 m!712313))

(assert (=> b!766979 m!712267))

(assert (=> b!766979 m!712267))

(assert (=> b!766979 m!712271))

(check-sat (not start!66552) (not b!766967) (not b!766983) (not b!766981) (not b!766966) (not b!766977) (not b!766978) (not b!766980) (not b!766970) (not b!766974) (not b!766973) (not b!766982) (not b!766969) (not b!766979) (not b!766971) (not b!766984))
(check-sat)
