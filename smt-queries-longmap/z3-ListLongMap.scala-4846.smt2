; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66892 () Bool)

(assert start!66892)

(declare-fun b!770261 () Bool)

(declare-datatypes ((Unit!26467 0))(
  ( (Unit!26468) )
))
(declare-fun e!428963 () Unit!26467)

(declare-fun Unit!26469 () Unit!26467)

(assert (=> b!770261 (= e!428963 Unit!26469)))

(declare-datatypes ((array!42334 0))(
  ( (array!42335 (arr!20263 (Array (_ BitVec 32) (_ BitVec 64))) (size!20683 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42334)

(declare-datatypes ((SeekEntryResult!7819 0))(
  ( (MissingZero!7819 (index!33644 (_ BitVec 32))) (Found!7819 (index!33645 (_ BitVec 32))) (Intermediate!7819 (undefined!8631 Bool) (index!33646 (_ BitVec 32)) (x!64737 (_ BitVec 32))) (Undefined!7819) (MissingVacant!7819 (index!33647 (_ BitVec 32))) )
))
(declare-fun lt!342724 () SeekEntryResult!7819)

(declare-fun lt!342720 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42334 (_ BitVec 32)) SeekEntryResult!7819)

(assert (=> b!770261 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!342720 (select (arr!20263 a!3186) j!159) a!3186 mask!3328) lt!342724)))

(declare-fun b!770262 () Bool)

(declare-fun e!428957 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!770262 (= e!428957 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20263 a!3186) j!159) a!3186 mask!3328) lt!342724))))

(declare-fun b!770263 () Bool)

(declare-fun res!520771 () Bool)

(declare-fun e!428962 () Bool)

(assert (=> b!770263 (=> (not res!520771) (not e!428962))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!770263 (= res!520771 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20263 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!770264 () Bool)

(declare-fun e!428956 () Bool)

(assert (=> b!770264 (= e!428962 e!428956)))

(declare-fun res!520776 () Bool)

(assert (=> b!770264 (=> (not res!520776) (not e!428956))))

(declare-fun lt!342719 () SeekEntryResult!7819)

(declare-fun lt!342723 () SeekEntryResult!7819)

(assert (=> b!770264 (= res!520776 (= lt!342719 lt!342723))))

(declare-fun lt!342722 () (_ BitVec 64))

(declare-fun lt!342717 () array!42334)

(assert (=> b!770264 (= lt!342723 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!342722 lt!342717 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!770264 (= lt!342719 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!342722 mask!3328) lt!342722 lt!342717 mask!3328))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!770264 (= lt!342722 (select (store (arr!20263 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!770264 (= lt!342717 (array!42335 (store (arr!20263 a!3186) i!1173 k0!2102) (size!20683 a!3186)))))

(declare-fun b!770265 () Bool)

(declare-fun res!520767 () Bool)

(assert (=> b!770265 (=> (not res!520767) (not e!428962))))

(assert (=> b!770265 (= res!520767 e!428957)))

(declare-fun c!85148 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!770265 (= c!85148 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!770266 () Bool)

(declare-fun e!428964 () Bool)

(assert (=> b!770266 (= e!428964 e!428962)))

(declare-fun res!520765 () Bool)

(assert (=> b!770266 (=> (not res!520765) (not e!428962))))

(assert (=> b!770266 (= res!520765 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20263 a!3186) j!159) mask!3328) (select (arr!20263 a!3186) j!159) a!3186 mask!3328) lt!342724))))

(assert (=> b!770266 (= lt!342724 (Intermediate!7819 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!770267 () Bool)

(declare-fun res!520773 () Bool)

(declare-fun e!428960 () Bool)

(assert (=> b!770267 (=> (not res!520773) (not e!428960))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!770267 (= res!520773 (validKeyInArray!0 k0!2102))))

(declare-fun res!520768 () Bool)

(assert (=> start!66892 (=> (not res!520768) (not e!428960))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66892 (= res!520768 (validMask!0 mask!3328))))

(assert (=> start!66892 e!428960))

(assert (=> start!66892 true))

(declare-fun array_inv!16122 (array!42334) Bool)

(assert (=> start!66892 (array_inv!16122 a!3186)))

(declare-fun b!770268 () Bool)

(declare-fun Unit!26470 () Unit!26467)

(assert (=> b!770268 (= e!428963 Unit!26470)))

(declare-fun lt!342715 () SeekEntryResult!7819)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42334 (_ BitVec 32)) SeekEntryResult!7819)

(assert (=> b!770268 (= lt!342715 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20263 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!770268 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!342720 resIntermediateIndex!5 (select (arr!20263 a!3186) j!159) a!3186 mask!3328) (Found!7819 j!159))))

(declare-fun b!770269 () Bool)

(assert (=> b!770269 (= e!428960 e!428964)))

(declare-fun res!520772 () Bool)

(assert (=> b!770269 (=> (not res!520772) (not e!428964))))

(declare-fun lt!342714 () SeekEntryResult!7819)

(assert (=> b!770269 (= res!520772 (or (= lt!342714 (MissingZero!7819 i!1173)) (= lt!342714 (MissingVacant!7819 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42334 (_ BitVec 32)) SeekEntryResult!7819)

(assert (=> b!770269 (= lt!342714 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!770270 () Bool)

(declare-fun res!520770 () Bool)

(assert (=> b!770270 (=> (not res!520770) (not e!428960))))

(declare-fun arrayContainsKey!0 (array!42334 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!770270 (= res!520770 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!770271 () Bool)

(declare-fun lt!342716 () SeekEntryResult!7819)

(declare-fun e!428959 () Bool)

(assert (=> b!770271 (= e!428959 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20263 a!3186) j!159) a!3186 mask!3328) lt!342716))))

(declare-fun b!770272 () Bool)

(declare-fun res!520764 () Bool)

(assert (=> b!770272 (=> (not res!520764) (not e!428964))))

(declare-datatypes ((List!14172 0))(
  ( (Nil!14169) (Cons!14168 (h!15273 (_ BitVec 64)) (t!20479 List!14172)) )
))
(declare-fun arrayNoDuplicates!0 (array!42334 (_ BitVec 32) List!14172) Bool)

(assert (=> b!770272 (= res!520764 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14169))))

(declare-fun b!770273 () Bool)

(declare-fun res!520778 () Bool)

(assert (=> b!770273 (=> (not res!520778) (not e!428960))))

(assert (=> b!770273 (= res!520778 (and (= (size!20683 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20683 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20683 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!770274 () Bool)

(declare-fun e!428965 () Bool)

(assert (=> b!770274 (= e!428965 true)))

(declare-fun lt!342721 () Unit!26467)

(assert (=> b!770274 (= lt!342721 e!428963)))

(declare-fun c!85147 () Bool)

(assert (=> b!770274 (= c!85147 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!770274 (= lt!342720 (nextIndex!0 index!1321 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328))))

(declare-fun b!770275 () Bool)

(assert (=> b!770275 (= e!428956 (not e!428965))))

(declare-fun res!520777 () Bool)

(assert (=> b!770275 (=> res!520777 e!428965)))

(get-info :version)

(assert (=> b!770275 (= res!520777 (or (not ((_ is Intermediate!7819) lt!342723)) (bvsge x!1131 (x!64737 lt!342723))))))

(declare-fun e!428961 () Bool)

(assert (=> b!770275 e!428961))

(declare-fun res!520766 () Bool)

(assert (=> b!770275 (=> (not res!520766) (not e!428961))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42334 (_ BitVec 32)) Bool)

(assert (=> b!770275 (= res!520766 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!342718 () Unit!26467)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42334 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26467)

(assert (=> b!770275 (= lt!342718 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!770276 () Bool)

(declare-fun res!520774 () Bool)

(assert (=> b!770276 (=> (not res!520774) (not e!428964))))

(assert (=> b!770276 (= res!520774 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!770277 () Bool)

(declare-fun res!520775 () Bool)

(assert (=> b!770277 (=> (not res!520775) (not e!428960))))

(assert (=> b!770277 (= res!520775 (validKeyInArray!0 (select (arr!20263 a!3186) j!159)))))

(declare-fun b!770278 () Bool)

(assert (=> b!770278 (= e!428961 e!428959)))

(declare-fun res!520769 () Bool)

(assert (=> b!770278 (=> (not res!520769) (not e!428959))))

(assert (=> b!770278 (= res!520769 (= (seekEntryOrOpen!0 (select (arr!20263 a!3186) j!159) a!3186 mask!3328) lt!342716))))

(assert (=> b!770278 (= lt!342716 (Found!7819 j!159))))

(declare-fun b!770279 () Bool)

(declare-fun res!520779 () Bool)

(assert (=> b!770279 (=> (not res!520779) (not e!428964))))

(assert (=> b!770279 (= res!520779 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20683 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20683 a!3186))))))

(declare-fun b!770280 () Bool)

(assert (=> b!770280 (= e!428957 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20263 a!3186) j!159) a!3186 mask!3328) (Found!7819 j!159)))))

(assert (= (and start!66892 res!520768) b!770273))

(assert (= (and b!770273 res!520778) b!770277))

(assert (= (and b!770277 res!520775) b!770267))

(assert (= (and b!770267 res!520773) b!770270))

(assert (= (and b!770270 res!520770) b!770269))

(assert (= (and b!770269 res!520772) b!770276))

(assert (= (and b!770276 res!520774) b!770272))

(assert (= (and b!770272 res!520764) b!770279))

(assert (= (and b!770279 res!520779) b!770266))

(assert (= (and b!770266 res!520765) b!770263))

(assert (= (and b!770263 res!520771) b!770265))

(assert (= (and b!770265 c!85148) b!770262))

(assert (= (and b!770265 (not c!85148)) b!770280))

(assert (= (and b!770265 res!520767) b!770264))

(assert (= (and b!770264 res!520776) b!770275))

(assert (= (and b!770275 res!520766) b!770278))

(assert (= (and b!770278 res!520769) b!770271))

(assert (= (and b!770275 (not res!520777)) b!770274))

(assert (= (and b!770274 c!85147) b!770261))

(assert (= (and b!770274 (not c!85147)) b!770268))

(declare-fun m!716051 () Bool)

(assert (=> b!770264 m!716051))

(declare-fun m!716053 () Bool)

(assert (=> b!770264 m!716053))

(assert (=> b!770264 m!716051))

(declare-fun m!716055 () Bool)

(assert (=> b!770264 m!716055))

(declare-fun m!716057 () Bool)

(assert (=> b!770264 m!716057))

(declare-fun m!716059 () Bool)

(assert (=> b!770264 m!716059))

(declare-fun m!716061 () Bool)

(assert (=> b!770270 m!716061))

(declare-fun m!716063 () Bool)

(assert (=> b!770278 m!716063))

(assert (=> b!770278 m!716063))

(declare-fun m!716065 () Bool)

(assert (=> b!770278 m!716065))

(assert (=> b!770261 m!716063))

(assert (=> b!770261 m!716063))

(declare-fun m!716067 () Bool)

(assert (=> b!770261 m!716067))

(declare-fun m!716069 () Bool)

(assert (=> b!770269 m!716069))

(declare-fun m!716071 () Bool)

(assert (=> b!770272 m!716071))

(declare-fun m!716073 () Bool)

(assert (=> b!770263 m!716073))

(assert (=> b!770262 m!716063))

(assert (=> b!770262 m!716063))

(declare-fun m!716075 () Bool)

(assert (=> b!770262 m!716075))

(declare-fun m!716077 () Bool)

(assert (=> b!770275 m!716077))

(declare-fun m!716079 () Bool)

(assert (=> b!770275 m!716079))

(declare-fun m!716081 () Bool)

(assert (=> b!770274 m!716081))

(declare-fun m!716083 () Bool)

(assert (=> b!770267 m!716083))

(assert (=> b!770277 m!716063))

(assert (=> b!770277 m!716063))

(declare-fun m!716085 () Bool)

(assert (=> b!770277 m!716085))

(assert (=> b!770268 m!716063))

(assert (=> b!770268 m!716063))

(declare-fun m!716087 () Bool)

(assert (=> b!770268 m!716087))

(assert (=> b!770268 m!716063))

(declare-fun m!716089 () Bool)

(assert (=> b!770268 m!716089))

(assert (=> b!770266 m!716063))

(assert (=> b!770266 m!716063))

(declare-fun m!716091 () Bool)

(assert (=> b!770266 m!716091))

(assert (=> b!770266 m!716091))

(assert (=> b!770266 m!716063))

(declare-fun m!716093 () Bool)

(assert (=> b!770266 m!716093))

(assert (=> b!770271 m!716063))

(assert (=> b!770271 m!716063))

(declare-fun m!716095 () Bool)

(assert (=> b!770271 m!716095))

(declare-fun m!716097 () Bool)

(assert (=> b!770276 m!716097))

(assert (=> b!770280 m!716063))

(assert (=> b!770280 m!716063))

(assert (=> b!770280 m!716087))

(declare-fun m!716099 () Bool)

(assert (=> start!66892 m!716099))

(declare-fun m!716101 () Bool)

(assert (=> start!66892 m!716101))

(check-sat (not b!770262) (not b!770264) (not b!770274) (not b!770280) (not b!770261) (not start!66892) (not b!770277) (not b!770270) (not b!770276) (not b!770278) (not b!770267) (not b!770269) (not b!770275) (not b!770271) (not b!770272) (not b!770266) (not b!770268))
(check-sat)
