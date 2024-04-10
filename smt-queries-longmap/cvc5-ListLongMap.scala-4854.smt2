; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66822 () Bool)

(assert start!66822)

(declare-fun b!771056 () Bool)

(declare-fun res!521652 () Bool)

(declare-fun e!429263 () Bool)

(assert (=> b!771056 (=> (not res!521652) (not e!429263))))

(declare-fun e!429261 () Bool)

(assert (=> b!771056 (= res!521652 e!429261)))

(declare-fun c!85101 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!771056 (= c!85101 (bvsle x!1131 resIntermediateX!5))))

(declare-datatypes ((array!42384 0))(
  ( (array!42385 (arr!20292 (Array (_ BitVec 32) (_ BitVec 64))) (size!20713 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42384)

(declare-fun b!771057 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7892 0))(
  ( (MissingZero!7892 (index!33936 (_ BitVec 32))) (Found!7892 (index!33937 (_ BitVec 32))) (Intermediate!7892 (undefined!8704 Bool) (index!33938 (_ BitVec 32)) (x!64863 (_ BitVec 32))) (Undefined!7892) (MissingVacant!7892 (index!33939 (_ BitVec 32))) )
))
(declare-fun lt!343237 () SeekEntryResult!7892)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42384 (_ BitVec 32)) SeekEntryResult!7892)

(assert (=> b!771057 (= e!429261 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20292 a!3186) j!159) a!3186 mask!3328) lt!343237))))

(declare-fun b!771058 () Bool)

(declare-fun e!429264 () Bool)

(declare-fun e!429265 () Bool)

(assert (=> b!771058 (= e!429264 e!429265)))

(declare-fun res!521647 () Bool)

(assert (=> b!771058 (=> (not res!521647) (not e!429265))))

(declare-fun lt!343236 () SeekEntryResult!7892)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42384 (_ BitVec 32)) SeekEntryResult!7892)

(assert (=> b!771058 (= res!521647 (= (seekEntryOrOpen!0 (select (arr!20292 a!3186) j!159) a!3186 mask!3328) lt!343236))))

(assert (=> b!771058 (= lt!343236 (Found!7892 j!159))))

(declare-fun b!771059 () Bool)

(declare-fun res!521654 () Bool)

(assert (=> b!771059 (=> (not res!521654) (not e!429263))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!771059 (= res!521654 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20292 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!771060 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42384 (_ BitVec 32)) SeekEntryResult!7892)

(assert (=> b!771060 (= e!429261 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20292 a!3186) j!159) a!3186 mask!3328) (Found!7892 j!159)))))

(declare-fun b!771061 () Bool)

(declare-fun res!521653 () Bool)

(declare-fun e!429266 () Bool)

(assert (=> b!771061 (=> (not res!521653) (not e!429266))))

(declare-datatypes ((List!14294 0))(
  ( (Nil!14291) (Cons!14290 (h!15389 (_ BitVec 64)) (t!20609 List!14294)) )
))
(declare-fun arrayNoDuplicates!0 (array!42384 (_ BitVec 32) List!14294) Bool)

(assert (=> b!771061 (= res!521653 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14291))))

(declare-fun b!771062 () Bool)

(declare-fun res!521648 () Bool)

(assert (=> b!771062 (=> (not res!521648) (not e!429266))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42384 (_ BitVec 32)) Bool)

(assert (=> b!771062 (= res!521648 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!771063 () Bool)

(declare-fun res!521659 () Bool)

(declare-fun e!429267 () Bool)

(assert (=> b!771063 (=> (not res!521659) (not e!429267))))

(assert (=> b!771063 (= res!521659 (and (= (size!20713 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20713 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20713 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!771064 () Bool)

(assert (=> b!771064 (= e!429265 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20292 a!3186) j!159) a!3186 mask!3328) lt!343236))))

(declare-fun b!771065 () Bool)

(declare-datatypes ((Unit!26582 0))(
  ( (Unit!26583) )
))
(declare-fun e!429260 () Unit!26582)

(declare-fun Unit!26584 () Unit!26582)

(assert (=> b!771065 (= e!429260 Unit!26584)))

(declare-fun lt!343239 () (_ BitVec 32))

(assert (=> b!771065 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!343239 (select (arr!20292 a!3186) j!159) a!3186 mask!3328) lt!343237)))

(declare-fun b!771066 () Bool)

(assert (=> b!771066 (= e!429266 e!429263)))

(declare-fun res!521656 () Bool)

(assert (=> b!771066 (=> (not res!521656) (not e!429263))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!771066 (= res!521656 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20292 a!3186) j!159) mask!3328) (select (arr!20292 a!3186) j!159) a!3186 mask!3328) lt!343237))))

(assert (=> b!771066 (= lt!343237 (Intermediate!7892 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!771067 () Bool)

(declare-fun res!521649 () Bool)

(assert (=> b!771067 (=> (not res!521649) (not e!429267))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42384 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!771067 (= res!521649 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!771068 () Bool)

(assert (=> b!771068 (= e!429267 e!429266)))

(declare-fun res!521651 () Bool)

(assert (=> b!771068 (=> (not res!521651) (not e!429266))))

(declare-fun lt!343238 () SeekEntryResult!7892)

(assert (=> b!771068 (= res!521651 (or (= lt!343238 (MissingZero!7892 i!1173)) (= lt!343238 (MissingVacant!7892 i!1173))))))

(assert (=> b!771068 (= lt!343238 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!771069 () Bool)

(declare-fun res!521646 () Bool)

(assert (=> b!771069 (=> (not res!521646) (not e!429267))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!771069 (= res!521646 (validKeyInArray!0 (select (arr!20292 a!3186) j!159)))))

(declare-fun b!771070 () Bool)

(declare-fun Unit!26585 () Unit!26582)

(assert (=> b!771070 (= e!429260 Unit!26585)))

(declare-fun lt!343240 () SeekEntryResult!7892)

(assert (=> b!771070 (= lt!343240 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20292 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!771070 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!343239 resIntermediateIndex!5 (select (arr!20292 a!3186) j!159) a!3186 mask!3328) (Found!7892 j!159))))

(declare-fun b!771071 () Bool)

(declare-fun e!429269 () Bool)

(declare-fun e!429262 () Bool)

(assert (=> b!771071 (= e!429269 (not e!429262))))

(declare-fun res!521655 () Bool)

(assert (=> b!771071 (=> res!521655 e!429262)))

(declare-fun lt!343242 () SeekEntryResult!7892)

(assert (=> b!771071 (= res!521655 (or (not (is-Intermediate!7892 lt!343242)) (bvsge x!1131 (x!64863 lt!343242))))))

(assert (=> b!771071 e!429264))

(declare-fun res!521645 () Bool)

(assert (=> b!771071 (=> (not res!521645) (not e!429264))))

(assert (=> b!771071 (= res!521645 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!343235 () Unit!26582)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42384 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26582)

(assert (=> b!771071 (= lt!343235 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!771072 () Bool)

(declare-fun res!521657 () Bool)

(assert (=> b!771072 (=> (not res!521657) (not e!429266))))

(assert (=> b!771072 (= res!521657 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20713 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20713 a!3186))))))

(declare-fun b!771073 () Bool)

(declare-fun res!521650 () Bool)

(assert (=> b!771073 (=> (not res!521650) (not e!429267))))

(assert (=> b!771073 (= res!521650 (validKeyInArray!0 k!2102))))

(declare-fun b!771074 () Bool)

(assert (=> b!771074 (= e!429262 true)))

(declare-fun lt!343244 () Unit!26582)

(assert (=> b!771074 (= lt!343244 e!429260)))

(declare-fun c!85102 () Bool)

(assert (=> b!771074 (= c!85102 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!771074 (= lt!343239 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun res!521658 () Bool)

(assert (=> start!66822 (=> (not res!521658) (not e!429267))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66822 (= res!521658 (validMask!0 mask!3328))))

(assert (=> start!66822 e!429267))

(assert (=> start!66822 true))

(declare-fun array_inv!16088 (array!42384) Bool)

(assert (=> start!66822 (array_inv!16088 a!3186)))

(declare-fun b!771075 () Bool)

(assert (=> b!771075 (= e!429263 e!429269)))

(declare-fun res!521660 () Bool)

(assert (=> b!771075 (=> (not res!521660) (not e!429269))))

(declare-fun lt!343234 () SeekEntryResult!7892)

(assert (=> b!771075 (= res!521660 (= lt!343234 lt!343242))))

(declare-fun lt!343241 () (_ BitVec 64))

(declare-fun lt!343243 () array!42384)

(assert (=> b!771075 (= lt!343242 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!343241 lt!343243 mask!3328))))

(assert (=> b!771075 (= lt!343234 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!343241 mask!3328) lt!343241 lt!343243 mask!3328))))

(assert (=> b!771075 (= lt!343241 (select (store (arr!20292 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!771075 (= lt!343243 (array!42385 (store (arr!20292 a!3186) i!1173 k!2102) (size!20713 a!3186)))))

(assert (= (and start!66822 res!521658) b!771063))

(assert (= (and b!771063 res!521659) b!771069))

(assert (= (and b!771069 res!521646) b!771073))

(assert (= (and b!771073 res!521650) b!771067))

(assert (= (and b!771067 res!521649) b!771068))

(assert (= (and b!771068 res!521651) b!771062))

(assert (= (and b!771062 res!521648) b!771061))

(assert (= (and b!771061 res!521653) b!771072))

(assert (= (and b!771072 res!521657) b!771066))

(assert (= (and b!771066 res!521656) b!771059))

(assert (= (and b!771059 res!521654) b!771056))

(assert (= (and b!771056 c!85101) b!771057))

(assert (= (and b!771056 (not c!85101)) b!771060))

(assert (= (and b!771056 res!521652) b!771075))

(assert (= (and b!771075 res!521660) b!771071))

(assert (= (and b!771071 res!521645) b!771058))

(assert (= (and b!771058 res!521647) b!771064))

(assert (= (and b!771071 (not res!521655)) b!771074))

(assert (= (and b!771074 c!85102) b!771065))

(assert (= (and b!771074 (not c!85102)) b!771070))

(declare-fun m!716255 () Bool)

(assert (=> b!771061 m!716255))

(declare-fun m!716257 () Bool)

(assert (=> b!771067 m!716257))

(declare-fun m!716259 () Bool)

(assert (=> b!771062 m!716259))

(declare-fun m!716261 () Bool)

(assert (=> b!771069 m!716261))

(assert (=> b!771069 m!716261))

(declare-fun m!716263 () Bool)

(assert (=> b!771069 m!716263))

(declare-fun m!716265 () Bool)

(assert (=> b!771059 m!716265))

(assert (=> b!771057 m!716261))

(assert (=> b!771057 m!716261))

(declare-fun m!716267 () Bool)

(assert (=> b!771057 m!716267))

(assert (=> b!771065 m!716261))

(assert (=> b!771065 m!716261))

(declare-fun m!716269 () Bool)

(assert (=> b!771065 m!716269))

(declare-fun m!716271 () Bool)

(assert (=> b!771073 m!716271))

(assert (=> b!771064 m!716261))

(assert (=> b!771064 m!716261))

(declare-fun m!716273 () Bool)

(assert (=> b!771064 m!716273))

(declare-fun m!716275 () Bool)

(assert (=> b!771075 m!716275))

(declare-fun m!716277 () Bool)

(assert (=> b!771075 m!716277))

(declare-fun m!716279 () Bool)

(assert (=> b!771075 m!716279))

(declare-fun m!716281 () Bool)

(assert (=> b!771075 m!716281))

(declare-fun m!716283 () Bool)

(assert (=> b!771075 m!716283))

(assert (=> b!771075 m!716275))

(assert (=> b!771066 m!716261))

(assert (=> b!771066 m!716261))

(declare-fun m!716285 () Bool)

(assert (=> b!771066 m!716285))

(assert (=> b!771066 m!716285))

(assert (=> b!771066 m!716261))

(declare-fun m!716287 () Bool)

(assert (=> b!771066 m!716287))

(assert (=> b!771070 m!716261))

(assert (=> b!771070 m!716261))

(declare-fun m!716289 () Bool)

(assert (=> b!771070 m!716289))

(assert (=> b!771070 m!716261))

(declare-fun m!716291 () Bool)

(assert (=> b!771070 m!716291))

(assert (=> b!771060 m!716261))

(assert (=> b!771060 m!716261))

(assert (=> b!771060 m!716289))

(declare-fun m!716293 () Bool)

(assert (=> b!771071 m!716293))

(declare-fun m!716295 () Bool)

(assert (=> b!771071 m!716295))

(declare-fun m!716297 () Bool)

(assert (=> b!771074 m!716297))

(declare-fun m!716299 () Bool)

(assert (=> b!771068 m!716299))

(declare-fun m!716301 () Bool)

(assert (=> start!66822 m!716301))

(declare-fun m!716303 () Bool)

(assert (=> start!66822 m!716303))

(assert (=> b!771058 m!716261))

(assert (=> b!771058 m!716261))

(declare-fun m!716305 () Bool)

(assert (=> b!771058 m!716305))

(push 1)

