; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67010 () Bool)

(assert start!67010)

(declare-fun b!773300 () Bool)

(declare-fun e!430478 () Bool)

(declare-fun e!430474 () Bool)

(assert (=> b!773300 (= e!430478 e!430474)))

(declare-fun res!522974 () Bool)

(assert (=> b!773300 (=> (not res!522974) (not e!430474))))

(declare-datatypes ((SeekEntryResult!7914 0))(
  ( (MissingZero!7914 (index!34024 (_ BitVec 32))) (Found!7914 (index!34025 (_ BitVec 32))) (Intermediate!7914 (undefined!8726 Bool) (index!34026 (_ BitVec 32)) (x!64965 (_ BitVec 32))) (Undefined!7914) (MissingVacant!7914 (index!34027 (_ BitVec 32))) )
))
(declare-fun lt!344336 () SeekEntryResult!7914)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!773300 (= res!522974 (or (= lt!344336 (MissingZero!7914 i!1173)) (= lt!344336 (MissingVacant!7914 i!1173))))))

(declare-datatypes ((array!42434 0))(
  ( (array!42435 (arr!20314 (Array (_ BitVec 32) (_ BitVec 64))) (size!20735 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42434)

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42434 (_ BitVec 32)) SeekEntryResult!7914)

(assert (=> b!773300 (= lt!344336 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!773301 () Bool)

(declare-fun e!430473 () Bool)

(declare-fun e!430476 () Bool)

(assert (=> b!773301 (= e!430473 e!430476)))

(declare-fun res!522975 () Bool)

(assert (=> b!773301 (=> (not res!522975) (not e!430476))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun lt!344335 () SeekEntryResult!7914)

(assert (=> b!773301 (= res!522975 (= (seekEntryOrOpen!0 (select (arr!20314 a!3186) j!159) a!3186 mask!3328) lt!344335))))

(assert (=> b!773301 (= lt!344335 (Found!7914 j!159))))

(declare-fun b!773302 () Bool)

(declare-fun res!522984 () Bool)

(assert (=> b!773302 (=> (not res!522984) (not e!430478))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!773302 (= res!522984 (validKeyInArray!0 (select (arr!20314 a!3186) j!159)))))

(declare-fun b!773303 () Bool)

(declare-fun res!522986 () Bool)

(assert (=> b!773303 (=> (not res!522986) (not e!430478))))

(assert (=> b!773303 (= res!522986 (validKeyInArray!0 k0!2102))))

(declare-fun b!773304 () Bool)

(declare-fun e!430472 () Bool)

(assert (=> b!773304 (= e!430474 e!430472)))

(declare-fun res!522977 () Bool)

(assert (=> b!773304 (=> (not res!522977) (not e!430472))))

(declare-fun lt!344334 () SeekEntryResult!7914)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42434 (_ BitVec 32)) SeekEntryResult!7914)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!773304 (= res!522977 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20314 a!3186) j!159) mask!3328) (select (arr!20314 a!3186) j!159) a!3186 mask!3328) lt!344334))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!773304 (= lt!344334 (Intermediate!7914 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun res!522981 () Bool)

(assert (=> start!67010 (=> (not res!522981) (not e!430478))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67010 (= res!522981 (validMask!0 mask!3328))))

(assert (=> start!67010 e!430478))

(assert (=> start!67010 true))

(declare-fun array_inv!16110 (array!42434) Bool)

(assert (=> start!67010 (array_inv!16110 a!3186)))

(declare-fun b!773305 () Bool)

(declare-fun res!522979 () Bool)

(assert (=> b!773305 (=> (not res!522979) (not e!430472))))

(declare-fun e!430475 () Bool)

(assert (=> b!773305 (= res!522979 e!430475)))

(declare-fun c!85564 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!773305 (= c!85564 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!773306 () Bool)

(declare-fun res!522982 () Bool)

(assert (=> b!773306 (=> (not res!522982) (not e!430474))))

(declare-datatypes ((List!14316 0))(
  ( (Nil!14313) (Cons!14312 (h!15417 (_ BitVec 64)) (t!20631 List!14316)) )
))
(declare-fun arrayNoDuplicates!0 (array!42434 (_ BitVec 32) List!14316) Bool)

(assert (=> b!773306 (= res!522982 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14313))))

(declare-fun b!773307 () Bool)

(declare-fun res!522983 () Bool)

(assert (=> b!773307 (=> (not res!522983) (not e!430474))))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!773307 (= res!522983 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20735 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20735 a!3186))))))

(declare-fun b!773308 () Bool)

(declare-fun e!430479 () Bool)

(assert (=> b!773308 (= e!430479 true)))

(declare-datatypes ((Unit!26670 0))(
  ( (Unit!26671) )
))
(declare-fun lt!344337 () Unit!26670)

(declare-fun e!430477 () Unit!26670)

(assert (=> b!773308 (= lt!344337 e!430477)))

(declare-fun c!85563 () Bool)

(assert (=> b!773308 (= c!85563 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun lt!344342 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!773308 (= lt!344342 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!773309 () Bool)

(declare-fun res!522980 () Bool)

(assert (=> b!773309 (=> (not res!522980) (not e!430472))))

(assert (=> b!773309 (= res!522980 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20314 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!773310 () Bool)

(assert (=> b!773310 (= e!430475 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20314 a!3186) j!159) a!3186 mask!3328) lt!344334))))

(declare-fun b!773311 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42434 (_ BitVec 32)) SeekEntryResult!7914)

(assert (=> b!773311 (= e!430476 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20314 a!3186) j!159) a!3186 mask!3328) lt!344335))))

(declare-fun b!773312 () Bool)

(declare-fun Unit!26672 () Unit!26670)

(assert (=> b!773312 (= e!430477 Unit!26672)))

(assert (=> b!773312 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!344342 (select (arr!20314 a!3186) j!159) a!3186 mask!3328) lt!344334)))

(declare-fun b!773313 () Bool)

(declare-fun res!522978 () Bool)

(assert (=> b!773313 (=> (not res!522978) (not e!430478))))

(declare-fun arrayContainsKey!0 (array!42434 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!773313 (= res!522978 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!773314 () Bool)

(declare-fun res!522973 () Bool)

(assert (=> b!773314 (=> (not res!522973) (not e!430478))))

(assert (=> b!773314 (= res!522973 (and (= (size!20735 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20735 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20735 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!773315 () Bool)

(declare-fun e!430481 () Bool)

(assert (=> b!773315 (= e!430481 (not e!430479))))

(declare-fun res!522971 () Bool)

(assert (=> b!773315 (=> res!522971 e!430479)))

(declare-fun lt!344339 () SeekEntryResult!7914)

(get-info :version)

(assert (=> b!773315 (= res!522971 (or (not ((_ is Intermediate!7914) lt!344339)) (bvsge x!1131 (x!64965 lt!344339))))))

(assert (=> b!773315 e!430473))

(declare-fun res!522972 () Bool)

(assert (=> b!773315 (=> (not res!522972) (not e!430473))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42434 (_ BitVec 32)) Bool)

(assert (=> b!773315 (= res!522972 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!344341 () Unit!26670)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42434 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26670)

(assert (=> b!773315 (= lt!344341 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!773316 () Bool)

(assert (=> b!773316 (= e!430475 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20314 a!3186) j!159) a!3186 mask!3328) (Found!7914 j!159)))))

(declare-fun b!773317 () Bool)

(declare-fun res!522976 () Bool)

(assert (=> b!773317 (=> (not res!522976) (not e!430474))))

(assert (=> b!773317 (= res!522976 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!773318 () Bool)

(assert (=> b!773318 (= e!430472 e!430481)))

(declare-fun res!522985 () Bool)

(assert (=> b!773318 (=> (not res!522985) (not e!430481))))

(declare-fun lt!344333 () SeekEntryResult!7914)

(assert (=> b!773318 (= res!522985 (= lt!344333 lt!344339))))

(declare-fun lt!344332 () array!42434)

(declare-fun lt!344340 () (_ BitVec 64))

(assert (=> b!773318 (= lt!344339 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!344340 lt!344332 mask!3328))))

(assert (=> b!773318 (= lt!344333 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!344340 mask!3328) lt!344340 lt!344332 mask!3328))))

(assert (=> b!773318 (= lt!344340 (select (store (arr!20314 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!773318 (= lt!344332 (array!42435 (store (arr!20314 a!3186) i!1173 k0!2102) (size!20735 a!3186)))))

(declare-fun b!773319 () Bool)

(declare-fun Unit!26673 () Unit!26670)

(assert (=> b!773319 (= e!430477 Unit!26673)))

(declare-fun lt!344338 () SeekEntryResult!7914)

(assert (=> b!773319 (= lt!344338 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20314 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!773319 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!344342 resIntermediateIndex!5 (select (arr!20314 a!3186) j!159) a!3186 mask!3328) (Found!7914 j!159))))

(assert (= (and start!67010 res!522981) b!773314))

(assert (= (and b!773314 res!522973) b!773302))

(assert (= (and b!773302 res!522984) b!773303))

(assert (= (and b!773303 res!522986) b!773313))

(assert (= (and b!773313 res!522978) b!773300))

(assert (= (and b!773300 res!522974) b!773317))

(assert (= (and b!773317 res!522976) b!773306))

(assert (= (and b!773306 res!522982) b!773307))

(assert (= (and b!773307 res!522983) b!773304))

(assert (= (and b!773304 res!522977) b!773309))

(assert (= (and b!773309 res!522980) b!773305))

(assert (= (and b!773305 c!85564) b!773310))

(assert (= (and b!773305 (not c!85564)) b!773316))

(assert (= (and b!773305 res!522979) b!773318))

(assert (= (and b!773318 res!522985) b!773315))

(assert (= (and b!773315 res!522972) b!773301))

(assert (= (and b!773301 res!522975) b!773311))

(assert (= (and b!773315 (not res!522971)) b!773308))

(assert (= (and b!773308 c!85563) b!773312))

(assert (= (and b!773308 (not c!85563)) b!773319))

(declare-fun m!718047 () Bool)

(assert (=> b!773317 m!718047))

(declare-fun m!718049 () Bool)

(assert (=> b!773309 m!718049))

(declare-fun m!718051 () Bool)

(assert (=> b!773302 m!718051))

(assert (=> b!773302 m!718051))

(declare-fun m!718053 () Bool)

(assert (=> b!773302 m!718053))

(declare-fun m!718055 () Bool)

(assert (=> b!773313 m!718055))

(declare-fun m!718057 () Bool)

(assert (=> start!67010 m!718057))

(declare-fun m!718059 () Bool)

(assert (=> start!67010 m!718059))

(declare-fun m!718061 () Bool)

(assert (=> b!773303 m!718061))

(declare-fun m!718063 () Bool)

(assert (=> b!773308 m!718063))

(assert (=> b!773316 m!718051))

(assert (=> b!773316 m!718051))

(declare-fun m!718065 () Bool)

(assert (=> b!773316 m!718065))

(assert (=> b!773310 m!718051))

(assert (=> b!773310 m!718051))

(declare-fun m!718067 () Bool)

(assert (=> b!773310 m!718067))

(declare-fun m!718069 () Bool)

(assert (=> b!773318 m!718069))

(declare-fun m!718071 () Bool)

(assert (=> b!773318 m!718071))

(declare-fun m!718073 () Bool)

(assert (=> b!773318 m!718073))

(declare-fun m!718075 () Bool)

(assert (=> b!773318 m!718075))

(assert (=> b!773318 m!718069))

(declare-fun m!718077 () Bool)

(assert (=> b!773318 m!718077))

(assert (=> b!773311 m!718051))

(assert (=> b!773311 m!718051))

(declare-fun m!718079 () Bool)

(assert (=> b!773311 m!718079))

(assert (=> b!773304 m!718051))

(assert (=> b!773304 m!718051))

(declare-fun m!718081 () Bool)

(assert (=> b!773304 m!718081))

(assert (=> b!773304 m!718081))

(assert (=> b!773304 m!718051))

(declare-fun m!718083 () Bool)

(assert (=> b!773304 m!718083))

(assert (=> b!773319 m!718051))

(assert (=> b!773319 m!718051))

(assert (=> b!773319 m!718065))

(assert (=> b!773319 m!718051))

(declare-fun m!718085 () Bool)

(assert (=> b!773319 m!718085))

(assert (=> b!773312 m!718051))

(assert (=> b!773312 m!718051))

(declare-fun m!718087 () Bool)

(assert (=> b!773312 m!718087))

(declare-fun m!718089 () Bool)

(assert (=> b!773300 m!718089))

(declare-fun m!718091 () Bool)

(assert (=> b!773315 m!718091))

(declare-fun m!718093 () Bool)

(assert (=> b!773315 m!718093))

(assert (=> b!773301 m!718051))

(assert (=> b!773301 m!718051))

(declare-fun m!718095 () Bool)

(assert (=> b!773301 m!718095))

(declare-fun m!718097 () Bool)

(assert (=> b!773306 m!718097))

(check-sat (not b!773302) (not b!773312) (not b!773318) (not b!773319) (not b!773306) (not b!773313) (not b!773308) (not b!773303) (not start!67010) (not b!773316) (not b!773300) (not b!773301) (not b!773315) (not b!773310) (not b!773304) (not b!773317) (not b!773311))
(check-sat)
