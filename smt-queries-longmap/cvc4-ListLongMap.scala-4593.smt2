; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64076 () Bool)

(assert start!64076)

(declare-fun res!482073 () Bool)

(declare-fun e!403778 () Bool)

(assert (=> start!64076 (=> (not res!482073) (not e!403778))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64076 (= res!482073 (validMask!0 mask!3328))))

(assert (=> start!64076 e!403778))

(assert (=> start!64076 true))

(declare-datatypes ((array!40771 0))(
  ( (array!40772 (arr!19511 (Array (_ BitVec 32) (_ BitVec 64))) (size!19932 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40771)

(declare-fun array_inv!15307 (array!40771) Bool)

(assert (=> start!64076 (array_inv!15307 a!3186)))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun e!403777 () Bool)

(declare-fun b!719679 () Bool)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!719679 (= e!403777 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19511 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsgt x!1131 resIntermediateX!5) (bvsge mask!3328 #b00000000000000000000000000000000) (bvsge index!1321 (bvadd #b00000000000000000000000000000001 mask!3328))))))

(declare-fun b!719680 () Bool)

(declare-fun res!482080 () Bool)

(assert (=> b!719680 (=> (not res!482080) (not e!403778))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!719680 (= res!482080 (validKeyInArray!0 k!2102))))

(declare-fun b!719681 () Bool)

(declare-fun res!482072 () Bool)

(assert (=> b!719681 (=> (not res!482072) (not e!403778))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!719681 (= res!482072 (validKeyInArray!0 (select (arr!19511 a!3186) j!159)))))

(declare-fun b!719682 () Bool)

(declare-fun res!482075 () Bool)

(assert (=> b!719682 (=> (not res!482075) (not e!403778))))

(assert (=> b!719682 (= res!482075 (and (= (size!19932 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19932 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19932 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!719683 () Bool)

(assert (=> b!719683 (= e!403778 e!403777)))

(declare-fun res!482081 () Bool)

(assert (=> b!719683 (=> (not res!482081) (not e!403777))))

(declare-datatypes ((SeekEntryResult!7111 0))(
  ( (MissingZero!7111 (index!30812 (_ BitVec 32))) (Found!7111 (index!30813 (_ BitVec 32))) (Intermediate!7111 (undefined!7923 Bool) (index!30814 (_ BitVec 32)) (x!61814 (_ BitVec 32))) (Undefined!7111) (MissingVacant!7111 (index!30815 (_ BitVec 32))) )
))
(declare-fun lt!319634 () SeekEntryResult!7111)

(assert (=> b!719683 (= res!482081 (or (= lt!319634 (MissingZero!7111 i!1173)) (= lt!319634 (MissingVacant!7111 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40771 (_ BitVec 32)) SeekEntryResult!7111)

(assert (=> b!719683 (= lt!319634 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!719684 () Bool)

(declare-fun res!482076 () Bool)

(assert (=> b!719684 (=> (not res!482076) (not e!403777))))

(assert (=> b!719684 (= res!482076 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19932 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19932 a!3186))))))

(declare-fun b!719685 () Bool)

(declare-fun res!482077 () Bool)

(assert (=> b!719685 (=> (not res!482077) (not e!403777))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40771 (_ BitVec 32)) Bool)

(assert (=> b!719685 (= res!482077 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!719686 () Bool)

(declare-fun res!482079 () Bool)

(assert (=> b!719686 (=> (not res!482079) (not e!403777))))

(declare-datatypes ((List!13513 0))(
  ( (Nil!13510) (Cons!13509 (h!14557 (_ BitVec 64)) (t!19828 List!13513)) )
))
(declare-fun arrayNoDuplicates!0 (array!40771 (_ BitVec 32) List!13513) Bool)

(assert (=> b!719686 (= res!482079 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13510))))

(declare-fun b!719687 () Bool)

(declare-fun res!482074 () Bool)

(assert (=> b!719687 (=> (not res!482074) (not e!403777))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40771 (_ BitVec 32)) SeekEntryResult!7111)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!719687 (= res!482074 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19511 a!3186) j!159) mask!3328) (select (arr!19511 a!3186) j!159) a!3186 mask!3328) (Intermediate!7111 false resIntermediateIndex!5 resIntermediateX!5)))))

(declare-fun b!719688 () Bool)

(declare-fun res!482078 () Bool)

(assert (=> b!719688 (=> (not res!482078) (not e!403778))))

(declare-fun arrayContainsKey!0 (array!40771 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!719688 (= res!482078 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(assert (= (and start!64076 res!482073) b!719682))

(assert (= (and b!719682 res!482075) b!719681))

(assert (= (and b!719681 res!482072) b!719680))

(assert (= (and b!719680 res!482080) b!719688))

(assert (= (and b!719688 res!482078) b!719683))

(assert (= (and b!719683 res!482081) b!719685))

(assert (= (and b!719685 res!482077) b!719686))

(assert (= (and b!719686 res!482079) b!719684))

(assert (= (and b!719684 res!482076) b!719687))

(assert (= (and b!719687 res!482074) b!719679))

(declare-fun m!675037 () Bool)

(assert (=> b!719679 m!675037))

(declare-fun m!675039 () Bool)

(assert (=> b!719687 m!675039))

(assert (=> b!719687 m!675039))

(declare-fun m!675041 () Bool)

(assert (=> b!719687 m!675041))

(assert (=> b!719687 m!675041))

(assert (=> b!719687 m!675039))

(declare-fun m!675043 () Bool)

(assert (=> b!719687 m!675043))

(declare-fun m!675045 () Bool)

(assert (=> b!719688 m!675045))

(declare-fun m!675047 () Bool)

(assert (=> b!719686 m!675047))

(declare-fun m!675049 () Bool)

(assert (=> b!719683 m!675049))

(declare-fun m!675051 () Bool)

(assert (=> b!719680 m!675051))

(declare-fun m!675053 () Bool)

(assert (=> b!719685 m!675053))

(declare-fun m!675055 () Bool)

(assert (=> start!64076 m!675055))

(declare-fun m!675057 () Bool)

(assert (=> start!64076 m!675057))

(assert (=> b!719681 m!675039))

(assert (=> b!719681 m!675039))

(declare-fun m!675059 () Bool)

(assert (=> b!719681 m!675059))

(push 1)

(assert (not b!719683))

(assert (not b!719680))

(assert (not b!719687))

(assert (not start!64076))

(assert (not b!719686))

(assert (not b!719685))

(assert (not b!719681))

(assert (not b!719688))

(check-sat)

(pop 1)

(push 1)

(check-sat)

