; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66578 () Bool)

(assert start!66578)

(declare-datatypes ((array!42235 0))(
  ( (array!42236 (arr!20218 (Array (_ BitVec 32) (_ BitVec 64))) (size!20638 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42235)

(declare-fun b!766297 () Bool)

(declare-datatypes ((SeekEntryResult!7774 0))(
  ( (MissingZero!7774 (index!33464 (_ BitVec 32))) (Found!7774 (index!33465 (_ BitVec 32))) (Intermediate!7774 (undefined!8586 Bool) (index!33466 (_ BitVec 32)) (x!64535 (_ BitVec 32))) (Undefined!7774) (MissingVacant!7774 (index!33467 (_ BitVec 32))) )
))
(declare-fun lt!340883 () SeekEntryResult!7774)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!426836 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42235 (_ BitVec 32)) SeekEntryResult!7774)

(assert (=> b!766297 (= e!426836 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20218 a!3186) j!159) a!3186 mask!3328) lt!340883))))

(declare-fun b!766298 () Bool)

(declare-fun res!518142 () Bool)

(declare-fun e!426830 () Bool)

(assert (=> b!766298 (=> (not res!518142) (not e!426830))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!766298 (= res!518142 (validKeyInArray!0 (select (arr!20218 a!3186) j!159)))))

(declare-fun b!766299 () Bool)

(declare-fun res!518147 () Bool)

(assert (=> b!766299 (=> (not res!518147) (not e!426830))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!766299 (= res!518147 (validKeyInArray!0 k0!2102))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun lt!340882 () SeekEntryResult!7774)

(declare-fun b!766300 () Bool)

(declare-fun e!426831 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42235 (_ BitVec 32)) SeekEntryResult!7774)

(assert (=> b!766300 (= e!426831 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20218 a!3186) j!159) a!3186 mask!3328) lt!340882))))

(declare-fun b!766301 () Bool)

(declare-fun res!518149 () Bool)

(declare-fun e!426832 () Bool)

(assert (=> b!766301 (=> (not res!518149) (not e!426832))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!766301 (= res!518149 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20218 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!766302 () Bool)

(assert (=> b!766302 (= e!426836 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20218 a!3186) j!159) a!3186 mask!3328) (Found!7774 j!159)))))

(declare-fun b!766303 () Bool)

(declare-fun e!426829 () Bool)

(assert (=> b!766303 (= e!426829 e!426831)))

(declare-fun res!518154 () Bool)

(assert (=> b!766303 (=> (not res!518154) (not e!426831))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42235 (_ BitVec 32)) SeekEntryResult!7774)

(assert (=> b!766303 (= res!518154 (= (seekEntryOrOpen!0 (select (arr!20218 a!3186) j!159) a!3186 mask!3328) lt!340882))))

(assert (=> b!766303 (= lt!340882 (Found!7774 j!159))))

(declare-fun b!766304 () Bool)

(declare-fun res!518155 () Bool)

(assert (=> b!766304 (=> (not res!518155) (not e!426830))))

(declare-fun arrayContainsKey!0 (array!42235 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!766304 (= res!518155 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!766305 () Bool)

(declare-fun res!518151 () Bool)

(declare-fun e!426833 () Bool)

(assert (=> b!766305 (=> (not res!518151) (not e!426833))))

(assert (=> b!766305 (= res!518151 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20638 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20638 a!3186))))))

(declare-fun b!766306 () Bool)

(declare-fun res!518146 () Bool)

(assert (=> b!766306 (=> (not res!518146) (not e!426830))))

(assert (=> b!766306 (= res!518146 (and (= (size!20638 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20638 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20638 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!766308 () Bool)

(declare-fun res!518145 () Bool)

(assert (=> b!766308 (=> (not res!518145) (not e!426833))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42235 (_ BitVec 32)) Bool)

(assert (=> b!766308 (= res!518145 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!766309 () Bool)

(declare-fun res!518143 () Bool)

(assert (=> b!766309 (=> (not res!518143) (not e!426833))))

(declare-datatypes ((List!14127 0))(
  ( (Nil!14124) (Cons!14123 (h!15219 (_ BitVec 64)) (t!20434 List!14127)) )
))
(declare-fun arrayNoDuplicates!0 (array!42235 (_ BitVec 32) List!14127) Bool)

(assert (=> b!766309 (= res!518143 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14124))))

(declare-fun b!766307 () Bool)

(declare-fun res!518144 () Bool)

(assert (=> b!766307 (=> (not res!518144) (not e!426832))))

(assert (=> b!766307 (= res!518144 e!426836)))

(declare-fun c!84470 () Bool)

(assert (=> b!766307 (= c!84470 (bvsle x!1131 resIntermediateX!5))))

(declare-fun res!518150 () Bool)

(assert (=> start!66578 (=> (not res!518150) (not e!426830))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66578 (= res!518150 (validMask!0 mask!3328))))

(assert (=> start!66578 e!426830))

(assert (=> start!66578 true))

(declare-fun array_inv!16077 (array!42235) Bool)

(assert (=> start!66578 (array_inv!16077 a!3186)))

(declare-fun b!766310 () Bool)

(assert (=> b!766310 (= e!426833 e!426832)))

(declare-fun res!518153 () Bool)

(assert (=> b!766310 (=> (not res!518153) (not e!426832))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!766310 (= res!518153 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20218 a!3186) j!159) mask!3328) (select (arr!20218 a!3186) j!159) a!3186 mask!3328) lt!340883))))

(assert (=> b!766310 (= lt!340883 (Intermediate!7774 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!766311 () Bool)

(declare-fun e!426834 () Bool)

(assert (=> b!766311 (= e!426834 (not true))))

(assert (=> b!766311 e!426829))

(declare-fun res!518152 () Bool)

(assert (=> b!766311 (=> (not res!518152) (not e!426829))))

(assert (=> b!766311 (= res!518152 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26353 0))(
  ( (Unit!26354) )
))
(declare-fun lt!340880 () Unit!26353)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42235 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26353)

(assert (=> b!766311 (= lt!340880 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!766312 () Bool)

(assert (=> b!766312 (= e!426832 e!426834)))

(declare-fun res!518156 () Bool)

(assert (=> b!766312 (=> (not res!518156) (not e!426834))))

(declare-fun lt!340881 () array!42235)

(declare-fun lt!340884 () (_ BitVec 64))

(assert (=> b!766312 (= res!518156 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!340884 mask!3328) lt!340884 lt!340881 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!340884 lt!340881 mask!3328)))))

(assert (=> b!766312 (= lt!340884 (select (store (arr!20218 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!766312 (= lt!340881 (array!42236 (store (arr!20218 a!3186) i!1173 k0!2102) (size!20638 a!3186)))))

(declare-fun b!766313 () Bool)

(assert (=> b!766313 (= e!426830 e!426833)))

(declare-fun res!518148 () Bool)

(assert (=> b!766313 (=> (not res!518148) (not e!426833))))

(declare-fun lt!340879 () SeekEntryResult!7774)

(assert (=> b!766313 (= res!518148 (or (= lt!340879 (MissingZero!7774 i!1173)) (= lt!340879 (MissingVacant!7774 i!1173))))))

(assert (=> b!766313 (= lt!340879 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(assert (= (and start!66578 res!518150) b!766306))

(assert (= (and b!766306 res!518146) b!766298))

(assert (= (and b!766298 res!518142) b!766299))

(assert (= (and b!766299 res!518147) b!766304))

(assert (= (and b!766304 res!518155) b!766313))

(assert (= (and b!766313 res!518148) b!766308))

(assert (= (and b!766308 res!518145) b!766309))

(assert (= (and b!766309 res!518143) b!766305))

(assert (= (and b!766305 res!518151) b!766310))

(assert (= (and b!766310 res!518153) b!766301))

(assert (= (and b!766301 res!518149) b!766307))

(assert (= (and b!766307 c!84470) b!766297))

(assert (= (and b!766307 (not c!84470)) b!766302))

(assert (= (and b!766307 res!518144) b!766312))

(assert (= (and b!766312 res!518156) b!766311))

(assert (= (and b!766311 res!518152) b!766303))

(assert (= (and b!766303 res!518154) b!766300))

(declare-fun m!712747 () Bool)

(assert (=> b!766312 m!712747))

(declare-fun m!712749 () Bool)

(assert (=> b!766312 m!712749))

(declare-fun m!712751 () Bool)

(assert (=> b!766312 m!712751))

(declare-fun m!712753 () Bool)

(assert (=> b!766312 m!712753))

(assert (=> b!766312 m!712747))

(declare-fun m!712755 () Bool)

(assert (=> b!766312 m!712755))

(declare-fun m!712757 () Bool)

(assert (=> start!66578 m!712757))

(declare-fun m!712759 () Bool)

(assert (=> start!66578 m!712759))

(declare-fun m!712761 () Bool)

(assert (=> b!766313 m!712761))

(declare-fun m!712763 () Bool)

(assert (=> b!766302 m!712763))

(assert (=> b!766302 m!712763))

(declare-fun m!712765 () Bool)

(assert (=> b!766302 m!712765))

(assert (=> b!766303 m!712763))

(assert (=> b!766303 m!712763))

(declare-fun m!712767 () Bool)

(assert (=> b!766303 m!712767))

(declare-fun m!712769 () Bool)

(assert (=> b!766311 m!712769))

(declare-fun m!712771 () Bool)

(assert (=> b!766311 m!712771))

(assert (=> b!766298 m!712763))

(assert (=> b!766298 m!712763))

(declare-fun m!712773 () Bool)

(assert (=> b!766298 m!712773))

(assert (=> b!766310 m!712763))

(assert (=> b!766310 m!712763))

(declare-fun m!712775 () Bool)

(assert (=> b!766310 m!712775))

(assert (=> b!766310 m!712775))

(assert (=> b!766310 m!712763))

(declare-fun m!712777 () Bool)

(assert (=> b!766310 m!712777))

(declare-fun m!712779 () Bool)

(assert (=> b!766304 m!712779))

(declare-fun m!712781 () Bool)

(assert (=> b!766308 m!712781))

(declare-fun m!712783 () Bool)

(assert (=> b!766301 m!712783))

(declare-fun m!712785 () Bool)

(assert (=> b!766309 m!712785))

(declare-fun m!712787 () Bool)

(assert (=> b!766299 m!712787))

(assert (=> b!766297 m!712763))

(assert (=> b!766297 m!712763))

(declare-fun m!712789 () Bool)

(assert (=> b!766297 m!712789))

(assert (=> b!766300 m!712763))

(assert (=> b!766300 m!712763))

(declare-fun m!712791 () Bool)

(assert (=> b!766300 m!712791))

(check-sat (not b!766303) (not b!766313) (not start!66578) (not b!766308) (not b!766309) (not b!766302) (not b!766300) (not b!766304) (not b!766299) (not b!766310) (not b!766312) (not b!766298) (not b!766297) (not b!766311))
(check-sat)
