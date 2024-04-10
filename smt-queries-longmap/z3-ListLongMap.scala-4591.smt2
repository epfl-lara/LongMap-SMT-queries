; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64062 () Bool)

(assert start!64062)

(declare-fun b!719478 () Bool)

(declare-fun e!403714 () Bool)

(declare-fun e!403715 () Bool)

(assert (=> b!719478 (= e!403714 e!403715)))

(declare-fun res!481877 () Bool)

(assert (=> b!719478 (=> (not res!481877) (not e!403715))))

(declare-datatypes ((SeekEntryResult!7104 0))(
  ( (MissingZero!7104 (index!30784 (_ BitVec 32))) (Found!7104 (index!30785 (_ BitVec 32))) (Intermediate!7104 (undefined!7916 Bool) (index!30786 (_ BitVec 32)) (x!61791 (_ BitVec 32))) (Undefined!7104) (MissingVacant!7104 (index!30787 (_ BitVec 32))) )
))
(declare-fun lt!319604 () SeekEntryResult!7104)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!719478 (= res!481877 (or (= lt!319604 (MissingZero!7104 i!1173)) (= lt!319604 (MissingVacant!7104 i!1173))))))

(declare-datatypes ((array!40757 0))(
  ( (array!40758 (arr!19504 (Array (_ BitVec 32) (_ BitVec 64))) (size!19925 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40757)

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40757 (_ BitVec 32)) SeekEntryResult!7104)

(assert (=> b!719478 (= lt!319604 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!719479 () Bool)

(declare-fun res!481876 () Bool)

(assert (=> b!719479 (=> (not res!481876) (not e!403714))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!719479 (= res!481876 (validKeyInArray!0 (select (arr!19504 a!3186) j!159)))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun b!719480 () Bool)

(assert (=> b!719480 (= e!403715 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19504 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsgt x!1131 resIntermediateX!5) (bvslt mask!3328 #b00000000000000000000000000000000)))))

(declare-fun b!719481 () Bool)

(declare-fun res!481875 () Bool)

(assert (=> b!719481 (=> (not res!481875) (not e!403715))))

(declare-datatypes ((List!13506 0))(
  ( (Nil!13503) (Cons!13502 (h!14550 (_ BitVec 64)) (t!19821 List!13506)) )
))
(declare-fun arrayNoDuplicates!0 (array!40757 (_ BitVec 32) List!13506) Bool)

(assert (=> b!719481 (= res!481875 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13503))))

(declare-fun b!719482 () Bool)

(declare-fun res!481879 () Bool)

(assert (=> b!719482 (=> (not res!481879) (not e!403714))))

(assert (=> b!719482 (= res!481879 (validKeyInArray!0 k0!2102))))

(declare-fun b!719483 () Bool)

(declare-fun res!481874 () Bool)

(assert (=> b!719483 (=> (not res!481874) (not e!403715))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40757 (_ BitVec 32)) Bool)

(assert (=> b!719483 (= res!481874 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!719484 () Bool)

(declare-fun res!481871 () Bool)

(assert (=> b!719484 (=> (not res!481871) (not e!403715))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40757 (_ BitVec 32)) SeekEntryResult!7104)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!719484 (= res!481871 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19504 a!3186) j!159) mask!3328) (select (arr!19504 a!3186) j!159) a!3186 mask!3328) (Intermediate!7104 false resIntermediateIndex!5 resIntermediateX!5)))))

(declare-fun b!719485 () Bool)

(declare-fun res!481873 () Bool)

(assert (=> b!719485 (=> (not res!481873) (not e!403714))))

(declare-fun arrayContainsKey!0 (array!40757 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!719485 (= res!481873 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun res!481872 () Bool)

(assert (=> start!64062 (=> (not res!481872) (not e!403714))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64062 (= res!481872 (validMask!0 mask!3328))))

(assert (=> start!64062 e!403714))

(assert (=> start!64062 true))

(declare-fun array_inv!15300 (array!40757) Bool)

(assert (=> start!64062 (array_inv!15300 a!3186)))

(declare-fun b!719486 () Bool)

(declare-fun res!481880 () Bool)

(assert (=> b!719486 (=> (not res!481880) (not e!403715))))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!719486 (= res!481880 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19925 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19925 a!3186))))))

(declare-fun b!719487 () Bool)

(declare-fun res!481878 () Bool)

(assert (=> b!719487 (=> (not res!481878) (not e!403714))))

(assert (=> b!719487 (= res!481878 (and (= (size!19925 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19925 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19925 a!3186)) (not (= i!1173 j!159))))))

(assert (= (and start!64062 res!481872) b!719487))

(assert (= (and b!719487 res!481878) b!719479))

(assert (= (and b!719479 res!481876) b!719482))

(assert (= (and b!719482 res!481879) b!719485))

(assert (= (and b!719485 res!481873) b!719478))

(assert (= (and b!719478 res!481877) b!719483))

(assert (= (and b!719483 res!481874) b!719481))

(assert (= (and b!719481 res!481875) b!719486))

(assert (= (and b!719486 res!481880) b!719484))

(assert (= (and b!719484 res!481871) b!719480))

(declare-fun m!674875 () Bool)

(assert (=> b!719485 m!674875))

(declare-fun m!674877 () Bool)

(assert (=> b!719482 m!674877))

(declare-fun m!674879 () Bool)

(assert (=> b!719479 m!674879))

(assert (=> b!719479 m!674879))

(declare-fun m!674881 () Bool)

(assert (=> b!719479 m!674881))

(declare-fun m!674883 () Bool)

(assert (=> start!64062 m!674883))

(declare-fun m!674885 () Bool)

(assert (=> start!64062 m!674885))

(declare-fun m!674887 () Bool)

(assert (=> b!719481 m!674887))

(declare-fun m!674889 () Bool)

(assert (=> b!719483 m!674889))

(declare-fun m!674891 () Bool)

(assert (=> b!719480 m!674891))

(assert (=> b!719484 m!674879))

(assert (=> b!719484 m!674879))

(declare-fun m!674893 () Bool)

(assert (=> b!719484 m!674893))

(assert (=> b!719484 m!674893))

(assert (=> b!719484 m!674879))

(declare-fun m!674895 () Bool)

(assert (=> b!719484 m!674895))

(declare-fun m!674897 () Bool)

(assert (=> b!719478 m!674897))

(check-sat (not b!719479) (not b!719483) (not b!719482) (not b!719478) (not b!719484) (not b!719481) (not start!64062) (not b!719485))
(check-sat)
