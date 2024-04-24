; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67576 () Bool)

(assert start!67576)

(declare-fun b!781045 () Bool)

(declare-fun res!528281 () Bool)

(declare-fun e!434542 () Bool)

(assert (=> b!781045 (=> (not res!528281) (not e!434542))))

(declare-datatypes ((array!42622 0))(
  ( (array!42623 (arr!20398 (Array (_ BitVec 32) (_ BitVec 64))) (size!20818 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42622)

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42622 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!781045 (= res!528281 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!781046 () Bool)

(declare-fun res!528284 () Bool)

(declare-fun e!434540 () Bool)

(assert (=> b!781046 (=> (not res!528284) (not e!434540))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!781046 (= res!528284 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20818 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20818 a!3186))))))

(declare-fun b!781047 () Bool)

(declare-fun res!528280 () Bool)

(declare-fun e!434544 () Bool)

(assert (=> b!781047 (=> (not res!528280) (not e!434544))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!781047 (= res!528280 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20398 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!781048 () Bool)

(declare-fun e!434543 () Bool)

(assert (=> b!781048 (= e!434543 true)))

(declare-datatypes ((Unit!26881 0))(
  ( (Unit!26882) )
))
(declare-fun lt!348039 () Unit!26881)

(declare-fun e!434545 () Unit!26881)

(assert (=> b!781048 (= lt!348039 e!434545)))

(declare-fun c!86795 () Bool)

(assert (=> b!781048 (= c!86795 (= (select (store (arr!20398 a!3186) i!1173 k0!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!434541 () Bool)

(declare-fun b!781049 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7954 0))(
  ( (MissingZero!7954 (index!34184 (_ BitVec 32))) (Found!7954 (index!34185 (_ BitVec 32))) (Intermediate!7954 (undefined!8766 Bool) (index!34186 (_ BitVec 32)) (x!65295 (_ BitVec 32))) (Undefined!7954) (MissingVacant!7954 (index!34187 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42622 (_ BitVec 32)) SeekEntryResult!7954)

(assert (=> b!781049 (= e!434541 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20398 a!3186) j!159) a!3186 mask!3328) (Found!7954 j!159)))))

(declare-fun b!781050 () Bool)

(declare-fun e!434548 () Bool)

(assert (=> b!781050 (= e!434544 e!434548)))

(declare-fun res!528283 () Bool)

(assert (=> b!781050 (=> (not res!528283) (not e!434548))))

(declare-fun lt!348046 () SeekEntryResult!7954)

(declare-fun lt!348041 () SeekEntryResult!7954)

(assert (=> b!781050 (= res!528283 (= lt!348046 lt!348041))))

(declare-fun lt!348042 () (_ BitVec 64))

(declare-fun lt!348045 () array!42622)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42622 (_ BitVec 32)) SeekEntryResult!7954)

(assert (=> b!781050 (= lt!348041 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!348042 lt!348045 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!781050 (= lt!348046 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!348042 mask!3328) lt!348042 lt!348045 mask!3328))))

(assert (=> b!781050 (= lt!348042 (select (store (arr!20398 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!781050 (= lt!348045 (array!42623 (store (arr!20398 a!3186) i!1173 k0!2102) (size!20818 a!3186)))))

(declare-fun b!781051 () Bool)

(declare-fun res!528287 () Bool)

(assert (=> b!781051 (=> (not res!528287) (not e!434540))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42622 (_ BitVec 32)) Bool)

(assert (=> b!781051 (= res!528287 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!781052 () Bool)

(declare-fun Unit!26883 () Unit!26881)

(assert (=> b!781052 (= e!434545 Unit!26883)))

(assert (=> b!781052 false))

(declare-fun res!528277 () Bool)

(assert (=> start!67576 (=> (not res!528277) (not e!434542))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67576 (= res!528277 (validMask!0 mask!3328))))

(assert (=> start!67576 e!434542))

(assert (=> start!67576 true))

(declare-fun array_inv!16257 (array!42622) Bool)

(assert (=> start!67576 (array_inv!16257 a!3186)))

(declare-fun b!781053 () Bool)

(declare-fun res!528272 () Bool)

(assert (=> b!781053 (=> (not res!528272) (not e!434542))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!781053 (= res!528272 (validKeyInArray!0 (select (arr!20398 a!3186) j!159)))))

(declare-fun b!781054 () Bool)

(assert (=> b!781054 (= e!434540 e!434544)))

(declare-fun res!528286 () Bool)

(assert (=> b!781054 (=> (not res!528286) (not e!434544))))

(declare-fun lt!348044 () SeekEntryResult!7954)

(assert (=> b!781054 (= res!528286 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20398 a!3186) j!159) mask!3328) (select (arr!20398 a!3186) j!159) a!3186 mask!3328) lt!348044))))

(assert (=> b!781054 (= lt!348044 (Intermediate!7954 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!781055 () Bool)

(declare-fun res!528274 () Bool)

(assert (=> b!781055 (=> (not res!528274) (not e!434540))))

(declare-datatypes ((List!14307 0))(
  ( (Nil!14304) (Cons!14303 (h!15426 (_ BitVec 64)) (t!20614 List!14307)) )
))
(declare-fun arrayNoDuplicates!0 (array!42622 (_ BitVec 32) List!14307) Bool)

(assert (=> b!781055 (= res!528274 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14304))))

(declare-fun b!781056 () Bool)

(declare-fun res!528278 () Bool)

(assert (=> b!781056 (=> (not res!528278) (not e!434542))))

(assert (=> b!781056 (= res!528278 (and (= (size!20818 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20818 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20818 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!781057 () Bool)

(declare-fun res!528275 () Bool)

(assert (=> b!781057 (=> (not res!528275) (not e!434544))))

(assert (=> b!781057 (= res!528275 e!434541)))

(declare-fun c!86794 () Bool)

(assert (=> b!781057 (= c!86794 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!781058 () Bool)

(declare-fun lt!348038 () SeekEntryResult!7954)

(declare-fun e!434546 () Bool)

(assert (=> b!781058 (= e!434546 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20398 a!3186) j!159) a!3186 mask!3328) lt!348038))))

(declare-fun b!781059 () Bool)

(declare-fun res!528273 () Bool)

(assert (=> b!781059 (=> (not res!528273) (not e!434542))))

(assert (=> b!781059 (= res!528273 (validKeyInArray!0 k0!2102))))

(declare-fun b!781060 () Bool)

(declare-fun res!528288 () Bool)

(assert (=> b!781060 (=> res!528288 e!434543)))

(assert (=> b!781060 (= res!528288 (= (select (store (arr!20398 a!3186) i!1173 k0!2102) index!1321) lt!348042))))

(declare-fun b!781061 () Bool)

(assert (=> b!781061 (= e!434548 (not e!434543))))

(declare-fun res!528285 () Bool)

(assert (=> b!781061 (=> res!528285 e!434543)))

(get-info :version)

(assert (=> b!781061 (= res!528285 (or (not ((_ is Intermediate!7954) lt!348041)) (bvslt x!1131 (x!65295 lt!348041)) (not (= x!1131 (x!65295 lt!348041))) (not (= index!1321 (index!34186 lt!348041)))))))

(assert (=> b!781061 e!434546))

(declare-fun res!528279 () Bool)

(assert (=> b!781061 (=> (not res!528279) (not e!434546))))

(declare-fun lt!348037 () SeekEntryResult!7954)

(assert (=> b!781061 (= res!528279 (= lt!348037 lt!348038))))

(assert (=> b!781061 (= lt!348038 (Found!7954 j!159))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42622 (_ BitVec 32)) SeekEntryResult!7954)

(assert (=> b!781061 (= lt!348037 (seekEntryOrOpen!0 (select (arr!20398 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!781061 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!348043 () Unit!26881)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42622 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26881)

(assert (=> b!781061 (= lt!348043 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!781062 () Bool)

(declare-fun res!528282 () Bool)

(assert (=> b!781062 (=> res!528282 e!434543)))

(assert (=> b!781062 (= res!528282 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20398 a!3186) j!159) a!3186 mask!3328) lt!348038)))))

(declare-fun b!781063 () Bool)

(assert (=> b!781063 (= e!434542 e!434540)))

(declare-fun res!528276 () Bool)

(assert (=> b!781063 (=> (not res!528276) (not e!434540))))

(declare-fun lt!348040 () SeekEntryResult!7954)

(assert (=> b!781063 (= res!528276 (or (= lt!348040 (MissingZero!7954 i!1173)) (= lt!348040 (MissingVacant!7954 i!1173))))))

(assert (=> b!781063 (= lt!348040 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!781064 () Bool)

(declare-fun Unit!26884 () Unit!26881)

(assert (=> b!781064 (= e!434545 Unit!26884)))

(declare-fun b!781065 () Bool)

(assert (=> b!781065 (= e!434541 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20398 a!3186) j!159) a!3186 mask!3328) lt!348044))))

(assert (= (and start!67576 res!528277) b!781056))

(assert (= (and b!781056 res!528278) b!781053))

(assert (= (and b!781053 res!528272) b!781059))

(assert (= (and b!781059 res!528273) b!781045))

(assert (= (and b!781045 res!528281) b!781063))

(assert (= (and b!781063 res!528276) b!781051))

(assert (= (and b!781051 res!528287) b!781055))

(assert (= (and b!781055 res!528274) b!781046))

(assert (= (and b!781046 res!528284) b!781054))

(assert (= (and b!781054 res!528286) b!781047))

(assert (= (and b!781047 res!528280) b!781057))

(assert (= (and b!781057 c!86794) b!781065))

(assert (= (and b!781057 (not c!86794)) b!781049))

(assert (= (and b!781057 res!528275) b!781050))

(assert (= (and b!781050 res!528283) b!781061))

(assert (= (and b!781061 res!528279) b!781058))

(assert (= (and b!781061 (not res!528285)) b!781062))

(assert (= (and b!781062 (not res!528282)) b!781060))

(assert (= (and b!781060 (not res!528288)) b!781048))

(assert (= (and b!781048 c!86795) b!781052))

(assert (= (and b!781048 (not c!86795)) b!781064))

(declare-fun m!724775 () Bool)

(assert (=> b!781060 m!724775))

(declare-fun m!724777 () Bool)

(assert (=> b!781060 m!724777))

(declare-fun m!724779 () Bool)

(assert (=> b!781061 m!724779))

(assert (=> b!781061 m!724779))

(declare-fun m!724781 () Bool)

(assert (=> b!781061 m!724781))

(declare-fun m!724783 () Bool)

(assert (=> b!781061 m!724783))

(declare-fun m!724785 () Bool)

(assert (=> b!781061 m!724785))

(declare-fun m!724787 () Bool)

(assert (=> b!781055 m!724787))

(declare-fun m!724789 () Bool)

(assert (=> b!781051 m!724789))

(assert (=> b!781048 m!724775))

(assert (=> b!781048 m!724777))

(assert (=> b!781058 m!724779))

(assert (=> b!781058 m!724779))

(declare-fun m!724791 () Bool)

(assert (=> b!781058 m!724791))

(assert (=> b!781049 m!724779))

(assert (=> b!781049 m!724779))

(declare-fun m!724793 () Bool)

(assert (=> b!781049 m!724793))

(assert (=> b!781062 m!724779))

(assert (=> b!781062 m!724779))

(assert (=> b!781062 m!724793))

(declare-fun m!724795 () Bool)

(assert (=> start!67576 m!724795))

(declare-fun m!724797 () Bool)

(assert (=> start!67576 m!724797))

(assert (=> b!781054 m!724779))

(assert (=> b!781054 m!724779))

(declare-fun m!724799 () Bool)

(assert (=> b!781054 m!724799))

(assert (=> b!781054 m!724799))

(assert (=> b!781054 m!724779))

(declare-fun m!724801 () Bool)

(assert (=> b!781054 m!724801))

(declare-fun m!724803 () Bool)

(assert (=> b!781050 m!724803))

(assert (=> b!781050 m!724803))

(declare-fun m!724805 () Bool)

(assert (=> b!781050 m!724805))

(assert (=> b!781050 m!724775))

(declare-fun m!724807 () Bool)

(assert (=> b!781050 m!724807))

(declare-fun m!724809 () Bool)

(assert (=> b!781050 m!724809))

(declare-fun m!724811 () Bool)

(assert (=> b!781063 m!724811))

(declare-fun m!724813 () Bool)

(assert (=> b!781045 m!724813))

(declare-fun m!724815 () Bool)

(assert (=> b!781047 m!724815))

(declare-fun m!724817 () Bool)

(assert (=> b!781059 m!724817))

(assert (=> b!781065 m!724779))

(assert (=> b!781065 m!724779))

(declare-fun m!724819 () Bool)

(assert (=> b!781065 m!724819))

(assert (=> b!781053 m!724779))

(assert (=> b!781053 m!724779))

(declare-fun m!724821 () Bool)

(assert (=> b!781053 m!724821))

(check-sat (not b!781055) (not b!781045) (not b!781063) (not b!781061) (not b!781051) (not b!781062) (not b!781065) (not b!781053) (not b!781059) (not b!781049) (not b!781050) (not b!781058) (not start!67576) (not b!781054))
(check-sat)
