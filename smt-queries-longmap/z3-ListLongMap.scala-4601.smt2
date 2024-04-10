; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64182 () Bool)

(assert start!64182)

(declare-fun res!482906 () Bool)

(declare-fun e!404242 () Bool)

(assert (=> start!64182 (=> (not res!482906) (not e!404242))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64182 (= res!482906 (validMask!0 mask!3328))))

(assert (=> start!64182 e!404242))

(assert (=> start!64182 true))

(declare-datatypes ((array!40820 0))(
  ( (array!40821 (arr!19534 (Array (_ BitVec 32) (_ BitVec 64))) (size!19955 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40820)

(declare-fun array_inv!15330 (array!40820) Bool)

(assert (=> start!64182 (array_inv!15330 a!3186)))

(declare-fun b!720785 () Bool)

(declare-fun res!482912 () Bool)

(declare-fun e!404243 () Bool)

(assert (=> b!720785 (=> (not res!482912) (not e!404243))))

(declare-datatypes ((List!13536 0))(
  ( (Nil!13533) (Cons!13532 (h!14583 (_ BitVec 64)) (t!19851 List!13536)) )
))
(declare-fun arrayNoDuplicates!0 (array!40820 (_ BitVec 32) List!13536) Bool)

(assert (=> b!720785 (= res!482912 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13533))))

(declare-fun b!720786 () Bool)

(declare-fun res!482901 () Bool)

(declare-fun e!404244 () Bool)

(assert (=> b!720786 (=> (not res!482901) (not e!404244))))

(declare-fun e!404245 () Bool)

(assert (=> b!720786 (= res!482901 e!404245)))

(declare-fun c!79312 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!720786 (= c!79312 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!720787 () Bool)

(declare-fun res!482911 () Bool)

(assert (=> b!720787 (=> (not res!482911) (not e!404242))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!40820 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!720787 (= res!482911 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!720788 () Bool)

(declare-fun res!482908 () Bool)

(assert (=> b!720788 (=> (not res!482908) (not e!404243))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!720788 (= res!482908 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19955 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19955 a!3186))))))

(declare-fun b!720789 () Bool)

(declare-fun res!482903 () Bool)

(assert (=> b!720789 (=> (not res!482903) (not e!404242))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!720789 (= res!482903 (and (= (size!19955 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19955 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19955 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!720790 () Bool)

(declare-fun res!482904 () Bool)

(assert (=> b!720790 (=> (not res!482904) (not e!404242))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!720790 (= res!482904 (validKeyInArray!0 (select (arr!19534 a!3186) j!159)))))

(declare-fun b!720791 () Bool)

(declare-fun res!482905 () Bool)

(assert (=> b!720791 (=> (not res!482905) (not e!404242))))

(assert (=> b!720791 (= res!482905 (validKeyInArray!0 k0!2102))))

(declare-fun b!720792 () Bool)

(declare-fun res!482907 () Bool)

(assert (=> b!720792 (=> (not res!482907) (not e!404243))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40820 (_ BitVec 32)) Bool)

(assert (=> b!720792 (= res!482907 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!720793 () Bool)

(assert (=> b!720793 (= e!404244 (bvslt mask!3328 #b00000000000000000000000000000000))))

(declare-fun lt!319890 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!720793 (= lt!319890 (toIndex!0 (select (store (arr!19534 a!3186) i!1173 k0!2102) j!159) mask!3328))))

(declare-fun b!720794 () Bool)

(assert (=> b!720794 (= e!404243 e!404244)))

(declare-fun res!482902 () Bool)

(assert (=> b!720794 (=> (not res!482902) (not e!404244))))

(declare-datatypes ((SeekEntryResult!7134 0))(
  ( (MissingZero!7134 (index!30904 (_ BitVec 32))) (Found!7134 (index!30905 (_ BitVec 32))) (Intermediate!7134 (undefined!7946 Bool) (index!30906 (_ BitVec 32)) (x!61910 (_ BitVec 32))) (Undefined!7134) (MissingVacant!7134 (index!30907 (_ BitVec 32))) )
))
(declare-fun lt!319891 () SeekEntryResult!7134)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40820 (_ BitVec 32)) SeekEntryResult!7134)

(assert (=> b!720794 (= res!482902 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19534 a!3186) j!159) mask!3328) (select (arr!19534 a!3186) j!159) a!3186 mask!3328) lt!319891))))

(assert (=> b!720794 (= lt!319891 (Intermediate!7134 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!720795 () Bool)

(assert (=> b!720795 (= e!404242 e!404243)))

(declare-fun res!482910 () Bool)

(assert (=> b!720795 (=> (not res!482910) (not e!404243))))

(declare-fun lt!319892 () SeekEntryResult!7134)

(assert (=> b!720795 (= res!482910 (or (= lt!319892 (MissingZero!7134 i!1173)) (= lt!319892 (MissingVacant!7134 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40820 (_ BitVec 32)) SeekEntryResult!7134)

(assert (=> b!720795 (= lt!319892 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!720796 () Bool)

(declare-fun res!482909 () Bool)

(assert (=> b!720796 (=> (not res!482909) (not e!404244))))

(assert (=> b!720796 (= res!482909 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19534 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!720797 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40820 (_ BitVec 32)) SeekEntryResult!7134)

(assert (=> b!720797 (= e!404245 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19534 a!3186) j!159) a!3186 mask!3328) (Found!7134 j!159)))))

(declare-fun b!720798 () Bool)

(assert (=> b!720798 (= e!404245 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19534 a!3186) j!159) a!3186 mask!3328) lt!319891))))

(assert (= (and start!64182 res!482906) b!720789))

(assert (= (and b!720789 res!482903) b!720790))

(assert (= (and b!720790 res!482904) b!720791))

(assert (= (and b!720791 res!482905) b!720787))

(assert (= (and b!720787 res!482911) b!720795))

(assert (= (and b!720795 res!482910) b!720792))

(assert (= (and b!720792 res!482907) b!720785))

(assert (= (and b!720785 res!482912) b!720788))

(assert (= (and b!720788 res!482908) b!720794))

(assert (= (and b!720794 res!482902) b!720796))

(assert (= (and b!720796 res!482909) b!720786))

(assert (= (and b!720786 c!79312) b!720798))

(assert (= (and b!720786 (not c!79312)) b!720797))

(assert (= (and b!720786 res!482901) b!720793))

(declare-fun m!675797 () Bool)

(assert (=> b!720792 m!675797))

(declare-fun m!675799 () Bool)

(assert (=> b!720785 m!675799))

(declare-fun m!675801 () Bool)

(assert (=> b!720796 m!675801))

(declare-fun m!675803 () Bool)

(assert (=> b!720787 m!675803))

(declare-fun m!675805 () Bool)

(assert (=> b!720790 m!675805))

(assert (=> b!720790 m!675805))

(declare-fun m!675807 () Bool)

(assert (=> b!720790 m!675807))

(declare-fun m!675809 () Bool)

(assert (=> b!720795 m!675809))

(assert (=> b!720794 m!675805))

(assert (=> b!720794 m!675805))

(declare-fun m!675811 () Bool)

(assert (=> b!720794 m!675811))

(assert (=> b!720794 m!675811))

(assert (=> b!720794 m!675805))

(declare-fun m!675813 () Bool)

(assert (=> b!720794 m!675813))

(assert (=> b!720798 m!675805))

(assert (=> b!720798 m!675805))

(declare-fun m!675815 () Bool)

(assert (=> b!720798 m!675815))

(declare-fun m!675817 () Bool)

(assert (=> b!720793 m!675817))

(declare-fun m!675819 () Bool)

(assert (=> b!720793 m!675819))

(assert (=> b!720793 m!675819))

(declare-fun m!675821 () Bool)

(assert (=> b!720793 m!675821))

(declare-fun m!675823 () Bool)

(assert (=> start!64182 m!675823))

(declare-fun m!675825 () Bool)

(assert (=> start!64182 m!675825))

(assert (=> b!720797 m!675805))

(assert (=> b!720797 m!675805))

(declare-fun m!675827 () Bool)

(assert (=> b!720797 m!675827))

(declare-fun m!675829 () Bool)

(assert (=> b!720791 m!675829))

(check-sat (not b!720793) (not b!720795) (not b!720794) (not b!720785) (not b!720798) (not start!64182) (not b!720791) (not b!720790) (not b!720797) (not b!720792) (not b!720787))
(check-sat)
