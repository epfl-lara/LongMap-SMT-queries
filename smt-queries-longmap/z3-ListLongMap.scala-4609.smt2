; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64268 () Bool)

(assert start!64268)

(declare-fun b!721807 () Bool)

(declare-fun res!483719 () Bool)

(declare-fun e!404637 () Bool)

(assert (=> b!721807 (=> (not res!483719) (not e!404637))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!40866 0))(
  ( (array!40867 (arr!19556 (Array (_ BitVec 32) (_ BitVec 64))) (size!19977 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40866)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!721807 (= res!483719 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19556 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!404639 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!721808 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7153 0))(
  ( (MissingZero!7153 (index!30980 (_ BitVec 32))) (Found!7153 (index!30981 (_ BitVec 32))) (Intermediate!7153 (undefined!7965 Bool) (index!30982 (_ BitVec 32)) (x!61997 (_ BitVec 32))) (Undefined!7153) (MissingVacant!7153 (index!30983 (_ BitVec 32))) )
))
(declare-fun lt!319966 () SeekEntryResult!7153)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40866 (_ BitVec 32)) SeekEntryResult!7153)

(assert (=> b!721808 (= e!404639 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19556 a!3186) j!159) a!3186 mask!3328) lt!319966))))

(declare-fun b!721809 () Bool)

(declare-fun e!404638 () Bool)

(declare-fun e!404640 () Bool)

(assert (=> b!721809 (= e!404638 e!404640)))

(declare-fun res!483722 () Bool)

(assert (=> b!721809 (=> (not res!483722) (not e!404640))))

(declare-fun lt!319967 () SeekEntryResult!7153)

(assert (=> b!721809 (= res!483722 (or (= lt!319967 (MissingZero!7153 i!1173)) (= lt!319967 (MissingVacant!7153 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40866 (_ BitVec 32)) SeekEntryResult!7153)

(assert (=> b!721809 (= lt!319967 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!721810 () Bool)

(declare-fun res!483717 () Bool)

(assert (=> b!721810 (=> (not res!483717) (not e!404640))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40866 (_ BitVec 32)) Bool)

(assert (=> b!721810 (= res!483717 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!721811 () Bool)

(declare-fun res!483718 () Bool)

(assert (=> b!721811 (=> (not res!483718) (not e!404638))))

(declare-fun arrayContainsKey!0 (array!40866 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!721811 (= res!483718 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!721812 () Bool)

(declare-fun res!483720 () Bool)

(assert (=> b!721812 (=> (not res!483720) (not e!404638))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!721812 (= res!483720 (validKeyInArray!0 (select (arr!19556 a!3186) j!159)))))

(declare-fun b!721813 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40866 (_ BitVec 32)) SeekEntryResult!7153)

(assert (=> b!721813 (= e!404639 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19556 a!3186) j!159) a!3186 mask!3328) (Found!7153 j!159)))))

(declare-fun res!483714 () Bool)

(assert (=> start!64268 (=> (not res!483714) (not e!404638))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64268 (= res!483714 (validMask!0 mask!3328))))

(assert (=> start!64268 e!404638))

(assert (=> start!64268 true))

(declare-fun array_inv!15439 (array!40866) Bool)

(assert (=> start!64268 (array_inv!15439 a!3186)))

(declare-fun b!721814 () Bool)

(assert (=> b!721814 (= e!404640 e!404637)))

(declare-fun res!483723 () Bool)

(assert (=> b!721814 (=> (not res!483723) (not e!404637))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!721814 (= res!483723 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19556 a!3186) j!159) mask!3328) (select (arr!19556 a!3186) j!159) a!3186 mask!3328) lt!319966))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!721814 (= lt!319966 (Intermediate!7153 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!721815 () Bool)

(declare-fun res!483715 () Bool)

(assert (=> b!721815 (=> (not res!483715) (not e!404640))))

(assert (=> b!721815 (= res!483715 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19977 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19977 a!3186))))))

(declare-fun b!721816 () Bool)

(declare-fun res!483721 () Bool)

(assert (=> b!721816 (=> (not res!483721) (not e!404638))))

(assert (=> b!721816 (= res!483721 (and (= (size!19977 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19977 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19977 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!721817 () Bool)

(declare-fun res!483716 () Bool)

(assert (=> b!721817 (=> (not res!483716) (not e!404640))))

(declare-datatypes ((List!13597 0))(
  ( (Nil!13594) (Cons!13593 (h!14647 (_ BitVec 64)) (t!19903 List!13597)) )
))
(declare-fun arrayNoDuplicates!0 (array!40866 (_ BitVec 32) List!13597) Bool)

(assert (=> b!721817 (= res!483716 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13594))))

(declare-fun b!721818 () Bool)

(declare-fun res!483712 () Bool)

(assert (=> b!721818 (=> (not res!483712) (not e!404638))))

(assert (=> b!721818 (= res!483712 (validKeyInArray!0 k0!2102))))

(declare-fun b!721819 () Bool)

(declare-fun res!483713 () Bool)

(assert (=> b!721819 (=> (not res!483713) (not e!404637))))

(assert (=> b!721819 (= res!483713 e!404639)))

(declare-fun c!79419 () Bool)

(assert (=> b!721819 (= c!79419 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!721820 () Bool)

(assert (=> b!721820 (= e!404637 (and (bvsge mask!3328 #b00000000000000000000000000000000) (bvsge index!1321 (bvadd #b00000000000000000000000000000001 mask!3328))))))

(assert (= (and start!64268 res!483714) b!721816))

(assert (= (and b!721816 res!483721) b!721812))

(assert (= (and b!721812 res!483720) b!721818))

(assert (= (and b!721818 res!483712) b!721811))

(assert (= (and b!721811 res!483718) b!721809))

(assert (= (and b!721809 res!483722) b!721810))

(assert (= (and b!721810 res!483717) b!721817))

(assert (= (and b!721817 res!483716) b!721815))

(assert (= (and b!721815 res!483715) b!721814))

(assert (= (and b!721814 res!483723) b!721807))

(assert (= (and b!721807 res!483719) b!721819))

(assert (= (and b!721819 c!79419) b!721808))

(assert (= (and b!721819 (not c!79419)) b!721813))

(assert (= (and b!721819 res!483713) b!721820))

(declare-fun m!675935 () Bool)

(assert (=> start!64268 m!675935))

(declare-fun m!675937 () Bool)

(assert (=> start!64268 m!675937))

(declare-fun m!675939 () Bool)

(assert (=> b!721807 m!675939))

(declare-fun m!675941 () Bool)

(assert (=> b!721811 m!675941))

(declare-fun m!675943 () Bool)

(assert (=> b!721813 m!675943))

(assert (=> b!721813 m!675943))

(declare-fun m!675945 () Bool)

(assert (=> b!721813 m!675945))

(declare-fun m!675947 () Bool)

(assert (=> b!721818 m!675947))

(assert (=> b!721812 m!675943))

(assert (=> b!721812 m!675943))

(declare-fun m!675949 () Bool)

(assert (=> b!721812 m!675949))

(declare-fun m!675951 () Bool)

(assert (=> b!721810 m!675951))

(assert (=> b!721808 m!675943))

(assert (=> b!721808 m!675943))

(declare-fun m!675953 () Bool)

(assert (=> b!721808 m!675953))

(declare-fun m!675955 () Bool)

(assert (=> b!721809 m!675955))

(declare-fun m!675957 () Bool)

(assert (=> b!721817 m!675957))

(assert (=> b!721814 m!675943))

(assert (=> b!721814 m!675943))

(declare-fun m!675959 () Bool)

(assert (=> b!721814 m!675959))

(assert (=> b!721814 m!675959))

(assert (=> b!721814 m!675943))

(declare-fun m!675961 () Bool)

(assert (=> b!721814 m!675961))

(check-sat (not b!721817) (not b!721818) (not b!721808) (not b!721811) (not b!721813) (not b!721809) (not b!721812) (not start!64268) (not b!721810) (not b!721814))
(check-sat)
