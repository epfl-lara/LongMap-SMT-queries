; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64282 () Bool)

(assert start!64282)

(declare-fun res!483731 () Bool)

(declare-fun e!404746 () Bool)

(assert (=> start!64282 (=> (not res!483731) (not e!404746))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64282 (= res!483731 (validMask!0 mask!3328))))

(assert (=> start!64282 e!404746))

(assert (=> start!64282 true))

(declare-datatypes ((array!40863 0))(
  ( (array!40864 (arr!19554 (Array (_ BitVec 32) (_ BitVec 64))) (size!19975 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40863)

(declare-fun array_inv!15350 (array!40863) Bool)

(assert (=> start!64282 (array_inv!15350 a!3186)))

(declare-fun b!721938 () Bool)

(declare-fun res!483722 () Bool)

(declare-fun e!404750 () Bool)

(assert (=> b!721938 (=> (not res!483722) (not e!404750))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40863 (_ BitVec 32)) Bool)

(assert (=> b!721938 (= res!483722 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!721939 () Bool)

(declare-fun res!483724 () Bool)

(declare-fun e!404747 () Bool)

(assert (=> b!721939 (=> (not res!483724) (not e!404747))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!721939 (= res!483724 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19554 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!721940 () Bool)

(declare-fun res!483727 () Bool)

(assert (=> b!721940 (=> (not res!483727) (not e!404750))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!721940 (= res!483727 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19975 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19975 a!3186))))))

(declare-fun b!721941 () Bool)

(declare-fun res!483725 () Bool)

(assert (=> b!721941 (=> (not res!483725) (not e!404746))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!40863 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!721941 (= res!483725 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!721942 () Bool)

(assert (=> b!721942 (= e!404746 e!404750)))

(declare-fun res!483729 () Bool)

(assert (=> b!721942 (=> (not res!483729) (not e!404750))))

(declare-datatypes ((SeekEntryResult!7154 0))(
  ( (MissingZero!7154 (index!30984 (_ BitVec 32))) (Found!7154 (index!30985 (_ BitVec 32))) (Intermediate!7154 (undefined!7966 Bool) (index!30986 (_ BitVec 32)) (x!61995 (_ BitVec 32))) (Undefined!7154) (MissingVacant!7154 (index!30987 (_ BitVec 32))) )
))
(declare-fun lt!320183 () SeekEntryResult!7154)

(assert (=> b!721942 (= res!483729 (or (= lt!320183 (MissingZero!7154 i!1173)) (= lt!320183 (MissingVacant!7154 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40863 (_ BitVec 32)) SeekEntryResult!7154)

(assert (=> b!721942 (= lt!320183 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!721943 () Bool)

(assert (=> b!721943 (= e!404750 e!404747)))

(declare-fun res!483730 () Bool)

(assert (=> b!721943 (=> (not res!483730) (not e!404747))))

(declare-fun lt!320182 () SeekEntryResult!7154)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40863 (_ BitVec 32)) SeekEntryResult!7154)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!721943 (= res!483730 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19554 a!3186) j!159) mask!3328) (select (arr!19554 a!3186) j!159) a!3186 mask!3328) lt!320182))))

(assert (=> b!721943 (= lt!320182 (Intermediate!7154 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!721944 () Bool)

(declare-fun res!483721 () Bool)

(assert (=> b!721944 (=> (not res!483721) (not e!404746))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!721944 (= res!483721 (validKeyInArray!0 k!2102))))

(declare-fun e!404748 () Bool)

(declare-fun b!721945 () Bool)

(assert (=> b!721945 (= e!404748 (not (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19554 a!3186) j!159) a!3186 mask!3328) lt!320182)))))

(declare-fun b!721946 () Bool)

(declare-fun res!483726 () Bool)

(assert (=> b!721946 (=> (not res!483726) (not e!404746))))

(assert (=> b!721946 (= res!483726 (validKeyInArray!0 (select (arr!19554 a!3186) j!159)))))

(declare-fun b!721947 () Bool)

(declare-fun res!483728 () Bool)

(assert (=> b!721947 (=> (not res!483728) (not e!404750))))

(declare-datatypes ((List!13556 0))(
  ( (Nil!13553) (Cons!13552 (h!14606 (_ BitVec 64)) (t!19871 List!13556)) )
))
(declare-fun arrayNoDuplicates!0 (array!40863 (_ BitVec 32) List!13556) Bool)

(assert (=> b!721947 (= res!483728 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13553))))

(declare-fun b!721948 () Bool)

(assert (=> b!721948 (= e!404747 false)))

(declare-fun lt!320181 () Bool)

(assert (=> b!721948 (= lt!320181 e!404748)))

(declare-fun c!79480 () Bool)

(assert (=> b!721948 (= c!79480 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!721949 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40863 (_ BitVec 32)) SeekEntryResult!7154)

(assert (=> b!721949 (= e!404748 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19554 a!3186) j!159) a!3186 mask!3328) (Found!7154 j!159))))))

(declare-fun b!721950 () Bool)

(declare-fun res!483723 () Bool)

(assert (=> b!721950 (=> (not res!483723) (not e!404746))))

(assert (=> b!721950 (= res!483723 (and (= (size!19975 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19975 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19975 a!3186)) (not (= i!1173 j!159))))))

(assert (= (and start!64282 res!483731) b!721950))

(assert (= (and b!721950 res!483723) b!721946))

(assert (= (and b!721946 res!483726) b!721944))

(assert (= (and b!721944 res!483721) b!721941))

(assert (= (and b!721941 res!483725) b!721942))

(assert (= (and b!721942 res!483729) b!721938))

(assert (= (and b!721938 res!483722) b!721947))

(assert (= (and b!721947 res!483728) b!721940))

(assert (= (and b!721940 res!483727) b!721943))

(assert (= (and b!721943 res!483730) b!721939))

(assert (= (and b!721939 res!483724) b!721948))

(assert (= (and b!721948 c!79480) b!721945))

(assert (= (and b!721948 (not c!79480)) b!721949))

(declare-fun m!676609 () Bool)

(assert (=> b!721945 m!676609))

(assert (=> b!721945 m!676609))

(declare-fun m!676611 () Bool)

(assert (=> b!721945 m!676611))

(declare-fun m!676613 () Bool)

(assert (=> b!721942 m!676613))

(declare-fun m!676615 () Bool)

(assert (=> b!721944 m!676615))

(declare-fun m!676617 () Bool)

(assert (=> b!721941 m!676617))

(assert (=> b!721943 m!676609))

(assert (=> b!721943 m!676609))

(declare-fun m!676619 () Bool)

(assert (=> b!721943 m!676619))

(assert (=> b!721943 m!676619))

(assert (=> b!721943 m!676609))

(declare-fun m!676621 () Bool)

(assert (=> b!721943 m!676621))

(declare-fun m!676623 () Bool)

(assert (=> start!64282 m!676623))

(declare-fun m!676625 () Bool)

(assert (=> start!64282 m!676625))

(declare-fun m!676627 () Bool)

(assert (=> b!721939 m!676627))

(declare-fun m!676629 () Bool)

(assert (=> b!721947 m!676629))

(assert (=> b!721949 m!676609))

(assert (=> b!721949 m!676609))

(declare-fun m!676631 () Bool)

(assert (=> b!721949 m!676631))

(declare-fun m!676633 () Bool)

(assert (=> b!721938 m!676633))

(assert (=> b!721946 m!676609))

(assert (=> b!721946 m!676609))

(declare-fun m!676635 () Bool)

(assert (=> b!721946 m!676635))

(push 1)

