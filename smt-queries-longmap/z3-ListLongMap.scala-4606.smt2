; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64332 () Bool)

(assert start!64332)

(declare-fun res!483694 () Bool)

(declare-fun e!404884 () Bool)

(assert (=> start!64332 (=> (not res!483694) (not e!404884))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64332 (= res!483694 (validMask!0 mask!3328))))

(assert (=> start!64332 e!404884))

(assert (=> start!64332 true))

(declare-datatypes ((array!40846 0))(
  ( (array!40847 (arr!19543 (Array (_ BitVec 32) (_ BitVec 64))) (size!19963 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40846)

(declare-fun array_inv!15402 (array!40846) Bool)

(assert (=> start!64332 (array_inv!15402 a!3186)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun e!404885 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!722023 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7099 0))(
  ( (MissingZero!7099 (index!30764 (_ BitVec 32))) (Found!7099 (index!30765 (_ BitVec 32))) (Intermediate!7099 (undefined!7911 Bool) (index!30766 (_ BitVec 32)) (x!61927 (_ BitVec 32))) (Undefined!7099) (MissingVacant!7099 (index!30767 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40846 (_ BitVec 32)) SeekEntryResult!7099)

(assert (=> b!722023 (= e!404885 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19543 a!3186) j!159) a!3186 mask!3328) (Found!7099 j!159))))))

(declare-fun b!722024 () Bool)

(declare-fun res!483702 () Bool)

(declare-fun e!404882 () Bool)

(assert (=> b!722024 (=> (not res!483702) (not e!404882))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!722024 (= res!483702 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19963 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19963 a!3186))))))

(declare-fun b!722025 () Bool)

(declare-fun res!483693 () Bool)

(assert (=> b!722025 (=> (not res!483693) (not e!404884))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!722025 (= res!483693 (validKeyInArray!0 (select (arr!19543 a!3186) j!159)))))

(declare-fun b!722026 () Bool)

(declare-fun res!483697 () Bool)

(assert (=> b!722026 (=> (not res!483697) (not e!404884))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!722026 (= res!483697 (and (= (size!19963 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19963 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19963 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!722027 () Bool)

(declare-fun res!483695 () Bool)

(declare-fun e!404883 () Bool)

(assert (=> b!722027 (=> (not res!483695) (not e!404883))))

(assert (=> b!722027 (= res!483695 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19543 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!722028 () Bool)

(declare-fun res!483701 () Bool)

(assert (=> b!722028 (=> (not res!483701) (not e!404882))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40846 (_ BitVec 32)) Bool)

(assert (=> b!722028 (= res!483701 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!722029 () Bool)

(declare-fun res!483700 () Bool)

(assert (=> b!722029 (=> (not res!483700) (not e!404882))))

(declare-datatypes ((List!13452 0))(
  ( (Nil!13449) (Cons!13448 (h!14505 (_ BitVec 64)) (t!19759 List!13452)) )
))
(declare-fun arrayNoDuplicates!0 (array!40846 (_ BitVec 32) List!13452) Bool)

(assert (=> b!722029 (= res!483700 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13449))))

(declare-fun b!722030 () Bool)

(declare-fun lt!320268 () SeekEntryResult!7099)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40846 (_ BitVec 32)) SeekEntryResult!7099)

(assert (=> b!722030 (= e!404885 (not (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19543 a!3186) j!159) a!3186 mask!3328) lt!320268)))))

(declare-fun b!722031 () Bool)

(assert (=> b!722031 (= e!404882 e!404883)))

(declare-fun res!483703 () Bool)

(assert (=> b!722031 (=> (not res!483703) (not e!404883))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!722031 (= res!483703 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19543 a!3186) j!159) mask!3328) (select (arr!19543 a!3186) j!159) a!3186 mask!3328) lt!320268))))

(assert (=> b!722031 (= lt!320268 (Intermediate!7099 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!722032 () Bool)

(assert (=> b!722032 (= e!404883 false)))

(declare-fun lt!320267 () Bool)

(assert (=> b!722032 (= lt!320267 e!404885)))

(declare-fun c!79538 () Bool)

(assert (=> b!722032 (= c!79538 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!722033 () Bool)

(assert (=> b!722033 (= e!404884 e!404882)))

(declare-fun res!483698 () Bool)

(assert (=> b!722033 (=> (not res!483698) (not e!404882))))

(declare-fun lt!320266 () SeekEntryResult!7099)

(assert (=> b!722033 (= res!483698 (or (= lt!320266 (MissingZero!7099 i!1173)) (= lt!320266 (MissingVacant!7099 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40846 (_ BitVec 32)) SeekEntryResult!7099)

(assert (=> b!722033 (= lt!320266 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!722034 () Bool)

(declare-fun res!483699 () Bool)

(assert (=> b!722034 (=> (not res!483699) (not e!404884))))

(assert (=> b!722034 (= res!483699 (validKeyInArray!0 k0!2102))))

(declare-fun b!722035 () Bool)

(declare-fun res!483696 () Bool)

(assert (=> b!722035 (=> (not res!483696) (not e!404884))))

(declare-fun arrayContainsKey!0 (array!40846 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!722035 (= res!483696 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(assert (= (and start!64332 res!483694) b!722026))

(assert (= (and b!722026 res!483697) b!722025))

(assert (= (and b!722025 res!483693) b!722034))

(assert (= (and b!722034 res!483699) b!722035))

(assert (= (and b!722035 res!483696) b!722033))

(assert (= (and b!722033 res!483698) b!722028))

(assert (= (and b!722028 res!483701) b!722029))

(assert (= (and b!722029 res!483700) b!722024))

(assert (= (and b!722024 res!483702) b!722031))

(assert (= (and b!722031 res!483703) b!722027))

(assert (= (and b!722027 res!483695) b!722032))

(assert (= (and b!722032 c!79538) b!722030))

(assert (= (and b!722032 (not c!79538)) b!722023))

(declare-fun m!677289 () Bool)

(assert (=> b!722023 m!677289))

(assert (=> b!722023 m!677289))

(declare-fun m!677291 () Bool)

(assert (=> b!722023 m!677291))

(declare-fun m!677293 () Bool)

(assert (=> start!64332 m!677293))

(declare-fun m!677295 () Bool)

(assert (=> start!64332 m!677295))

(declare-fun m!677297 () Bool)

(assert (=> b!722028 m!677297))

(declare-fun m!677299 () Bool)

(assert (=> b!722035 m!677299))

(assert (=> b!722025 m!677289))

(assert (=> b!722025 m!677289))

(declare-fun m!677301 () Bool)

(assert (=> b!722025 m!677301))

(declare-fun m!677303 () Bool)

(assert (=> b!722027 m!677303))

(declare-fun m!677305 () Bool)

(assert (=> b!722033 m!677305))

(assert (=> b!722030 m!677289))

(assert (=> b!722030 m!677289))

(declare-fun m!677307 () Bool)

(assert (=> b!722030 m!677307))

(declare-fun m!677309 () Bool)

(assert (=> b!722034 m!677309))

(declare-fun m!677311 () Bool)

(assert (=> b!722029 m!677311))

(assert (=> b!722031 m!677289))

(assert (=> b!722031 m!677289))

(declare-fun m!677313 () Bool)

(assert (=> b!722031 m!677313))

(assert (=> b!722031 m!677313))

(assert (=> b!722031 m!677289))

(declare-fun m!677315 () Bool)

(assert (=> b!722031 m!677315))

(check-sat (not start!64332) (not b!722034) (not b!722029) (not b!722023) (not b!722025) (not b!722030) (not b!722035) (not b!722033) (not b!722031) (not b!722028))
(check-sat)
