; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66006 () Bool)

(assert start!66006)

(declare-fun b!760248 () Bool)

(declare-fun res!514308 () Bool)

(declare-fun e!423875 () Bool)

(assert (=> b!760248 (=> (not res!514308) (not e!423875))))

(declare-datatypes ((array!42049 0))(
  ( (array!42050 (arr!20134 (Array (_ BitVec 32) (_ BitVec 64))) (size!20554 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42049)

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42049 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!760248 (= res!514308 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!760249 () Bool)

(declare-fun res!514304 () Bool)

(assert (=> b!760249 (=> (not res!514304) (not e!423875))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!760249 (= res!514304 (validKeyInArray!0 (select (arr!20134 a!3186) j!159)))))

(declare-fun b!760250 () Bool)

(declare-fun res!514306 () Bool)

(declare-fun e!423870 () Bool)

(assert (=> b!760250 (=> (not res!514306) (not e!423870))))

(declare-datatypes ((List!14043 0))(
  ( (Nil!14040) (Cons!14039 (h!15117 (_ BitVec 64)) (t!20350 List!14043)) )
))
(declare-fun arrayNoDuplicates!0 (array!42049 (_ BitVec 32) List!14043) Bool)

(assert (=> b!760250 (= res!514306 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14040))))

(declare-datatypes ((SeekEntryResult!7690 0))(
  ( (MissingZero!7690 (index!33128 (_ BitVec 32))) (Found!7690 (index!33129 (_ BitVec 32))) (Intermediate!7690 (undefined!8502 Bool) (index!33130 (_ BitVec 32)) (x!64172 (_ BitVec 32))) (Undefined!7690) (MissingVacant!7690 (index!33131 (_ BitVec 32))) )
))
(declare-fun lt!338739 () SeekEntryResult!7690)

(declare-fun e!423872 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!760251 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42049 (_ BitVec 32)) SeekEntryResult!7690)

(assert (=> b!760251 (= e!423872 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20134 a!3186) j!159) a!3186 mask!3328) lt!338739))))

(declare-fun b!760252 () Bool)

(declare-fun res!514303 () Bool)

(declare-fun e!423873 () Bool)

(assert (=> b!760252 (=> (not res!514303) (not e!423873))))

(assert (=> b!760252 (= res!514303 e!423872)))

(declare-fun c!83357 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!760252 (= c!83357 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!760254 () Bool)

(declare-fun res!514310 () Bool)

(assert (=> b!760254 (=> (not res!514310) (not e!423870))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42049 (_ BitVec 32)) Bool)

(assert (=> b!760254 (= res!514310 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!760255 () Bool)

(declare-fun e!423871 () Bool)

(declare-fun e!423869 () Bool)

(assert (=> b!760255 (= e!423871 e!423869)))

(declare-fun res!514307 () Bool)

(assert (=> b!760255 (=> (not res!514307) (not e!423869))))

(declare-fun lt!338738 () SeekEntryResult!7690)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42049 (_ BitVec 32)) SeekEntryResult!7690)

(assert (=> b!760255 (= res!514307 (= (seekEntryOrOpen!0 (select (arr!20134 a!3186) j!159) a!3186 mask!3328) lt!338738))))

(assert (=> b!760255 (= lt!338738 (Found!7690 j!159))))

(declare-fun b!760256 () Bool)

(assert (=> b!760256 (= e!423875 e!423870)))

(declare-fun res!514315 () Bool)

(assert (=> b!760256 (=> (not res!514315) (not e!423870))))

(declare-fun lt!338741 () SeekEntryResult!7690)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!760256 (= res!514315 (or (= lt!338741 (MissingZero!7690 i!1173)) (= lt!338741 (MissingVacant!7690 i!1173))))))

(assert (=> b!760256 (= lt!338741 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!760257 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42049 (_ BitVec 32)) SeekEntryResult!7690)

(assert (=> b!760257 (= e!423872 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20134 a!3186) j!159) a!3186 mask!3328) (Found!7690 j!159)))))

(declare-fun b!760258 () Bool)

(declare-fun res!514314 () Bool)

(assert (=> b!760258 (=> (not res!514314) (not e!423875))))

(assert (=> b!760258 (= res!514314 (validKeyInArray!0 k0!2102))))

(declare-fun b!760259 () Bool)

(declare-fun res!514311 () Bool)

(assert (=> b!760259 (=> (not res!514311) (not e!423870))))

(assert (=> b!760259 (= res!514311 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20554 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20554 a!3186))))))

(declare-fun b!760260 () Bool)

(declare-fun e!423874 () Bool)

(assert (=> b!760260 (= e!423873 e!423874)))

(declare-fun res!514313 () Bool)

(assert (=> b!760260 (=> (not res!514313) (not e!423874))))

(declare-fun lt!338740 () (_ BitVec 64))

(declare-fun lt!338737 () array!42049)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!760260 (= res!514313 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!338740 mask!3328) lt!338740 lt!338737 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!338740 lt!338737 mask!3328)))))

(assert (=> b!760260 (= lt!338740 (select (store (arr!20134 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!760260 (= lt!338737 (array!42050 (store (arr!20134 a!3186) i!1173 k0!2102) (size!20554 a!3186)))))

(declare-fun b!760261 () Bool)

(assert (=> b!760261 (= e!423874 (not true))))

(assert (=> b!760261 e!423871))

(declare-fun res!514305 () Bool)

(assert (=> b!760261 (=> (not res!514305) (not e!423871))))

(assert (=> b!760261 (= res!514305 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26299 0))(
  ( (Unit!26300) )
))
(declare-fun lt!338742 () Unit!26299)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42049 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26299)

(assert (=> b!760261 (= lt!338742 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!760262 () Bool)

(assert (=> b!760262 (= e!423869 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20134 a!3186) j!159) a!3186 mask!3328) lt!338738))))

(declare-fun b!760263 () Bool)

(declare-fun res!514302 () Bool)

(assert (=> b!760263 (=> (not res!514302) (not e!423873))))

(assert (=> b!760263 (= res!514302 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20134 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!760264 () Bool)

(declare-fun res!514301 () Bool)

(assert (=> b!760264 (=> (not res!514301) (not e!423875))))

(assert (=> b!760264 (= res!514301 (and (= (size!20554 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20554 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20554 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!760253 () Bool)

(assert (=> b!760253 (= e!423870 e!423873)))

(declare-fun res!514312 () Bool)

(assert (=> b!760253 (=> (not res!514312) (not e!423873))))

(assert (=> b!760253 (= res!514312 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20134 a!3186) j!159) mask!3328) (select (arr!20134 a!3186) j!159) a!3186 mask!3328) lt!338739))))

(assert (=> b!760253 (= lt!338739 (Intermediate!7690 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun res!514309 () Bool)

(assert (=> start!66006 (=> (not res!514309) (not e!423875))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66006 (= res!514309 (validMask!0 mask!3328))))

(assert (=> start!66006 e!423875))

(assert (=> start!66006 true))

(declare-fun array_inv!15993 (array!42049) Bool)

(assert (=> start!66006 (array_inv!15993 a!3186)))

(assert (= (and start!66006 res!514309) b!760264))

(assert (= (and b!760264 res!514301) b!760249))

(assert (= (and b!760249 res!514304) b!760258))

(assert (= (and b!760258 res!514314) b!760248))

(assert (= (and b!760248 res!514308) b!760256))

(assert (= (and b!760256 res!514315) b!760254))

(assert (= (and b!760254 res!514310) b!760250))

(assert (= (and b!760250 res!514306) b!760259))

(assert (= (and b!760259 res!514311) b!760253))

(assert (= (and b!760253 res!514312) b!760263))

(assert (= (and b!760263 res!514302) b!760252))

(assert (= (and b!760252 c!83357) b!760251))

(assert (= (and b!760252 (not c!83357)) b!760257))

(assert (= (and b!760252 res!514303) b!760260))

(assert (= (and b!760260 res!514313) b!760261))

(assert (= (and b!760261 res!514305) b!760255))

(assert (= (and b!760255 res!514307) b!760262))

(declare-fun m!708015 () Bool)

(assert (=> b!760251 m!708015))

(assert (=> b!760251 m!708015))

(declare-fun m!708017 () Bool)

(assert (=> b!760251 m!708017))

(declare-fun m!708019 () Bool)

(assert (=> b!760263 m!708019))

(declare-fun m!708021 () Bool)

(assert (=> b!760248 m!708021))

(assert (=> b!760249 m!708015))

(assert (=> b!760249 m!708015))

(declare-fun m!708023 () Bool)

(assert (=> b!760249 m!708023))

(declare-fun m!708025 () Bool)

(assert (=> start!66006 m!708025))

(declare-fun m!708027 () Bool)

(assert (=> start!66006 m!708027))

(assert (=> b!760262 m!708015))

(assert (=> b!760262 m!708015))

(declare-fun m!708029 () Bool)

(assert (=> b!760262 m!708029))

(declare-fun m!708031 () Bool)

(assert (=> b!760250 m!708031))

(assert (=> b!760253 m!708015))

(assert (=> b!760253 m!708015))

(declare-fun m!708033 () Bool)

(assert (=> b!760253 m!708033))

(assert (=> b!760253 m!708033))

(assert (=> b!760253 m!708015))

(declare-fun m!708035 () Bool)

(assert (=> b!760253 m!708035))

(assert (=> b!760257 m!708015))

(assert (=> b!760257 m!708015))

(declare-fun m!708037 () Bool)

(assert (=> b!760257 m!708037))

(declare-fun m!708039 () Bool)

(assert (=> b!760256 m!708039))

(declare-fun m!708041 () Bool)

(assert (=> b!760258 m!708041))

(assert (=> b!760255 m!708015))

(assert (=> b!760255 m!708015))

(declare-fun m!708043 () Bool)

(assert (=> b!760255 m!708043))

(declare-fun m!708045 () Bool)

(assert (=> b!760261 m!708045))

(declare-fun m!708047 () Bool)

(assert (=> b!760261 m!708047))

(declare-fun m!708049 () Bool)

(assert (=> b!760260 m!708049))

(declare-fun m!708051 () Bool)

(assert (=> b!760260 m!708051))

(declare-fun m!708053 () Bool)

(assert (=> b!760260 m!708053))

(declare-fun m!708055 () Bool)

(assert (=> b!760260 m!708055))

(assert (=> b!760260 m!708049))

(declare-fun m!708057 () Bool)

(assert (=> b!760260 m!708057))

(declare-fun m!708059 () Bool)

(assert (=> b!760254 m!708059))

(check-sat (not b!760261) (not b!760253) (not b!760249) (not b!760260) (not b!760257) (not b!760258) (not b!760254) (not b!760256) (not b!760250) (not b!760262) (not start!66006) (not b!760248) (not b!760251) (not b!760255))
(check-sat)
