; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64040 () Bool)

(assert start!64040)

(declare-fun b!719198 () Bool)

(declare-fun res!481736 () Bool)

(declare-fun e!403551 () Bool)

(assert (=> b!719198 (=> (not res!481736) (not e!403551))))

(declare-datatypes ((array!40752 0))(
  ( (array!40753 (arr!19502 (Array (_ BitVec 32) (_ BitVec 64))) (size!19923 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40752)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40752 (_ BitVec 32)) Bool)

(assert (=> b!719198 (= res!481736 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!719199 () Bool)

(declare-fun res!481731 () Bool)

(assert (=> b!719199 (=> (not res!481731) (not e!403551))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7099 0))(
  ( (MissingZero!7099 (index!30764 (_ BitVec 32))) (Found!7099 (index!30765 (_ BitVec 32))) (Intermediate!7099 (undefined!7911 Bool) (index!30766 (_ BitVec 32)) (x!61781 (_ BitVec 32))) (Undefined!7099) (MissingVacant!7099 (index!30767 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40752 (_ BitVec 32)) SeekEntryResult!7099)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!719199 (= res!481731 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19502 a!3186) j!159) mask!3328) (select (arr!19502 a!3186) j!159) a!3186 mask!3328) (Intermediate!7099 false resIntermediateIndex!5 resIntermediateX!5)))))

(declare-fun b!719201 () Bool)

(declare-fun res!481739 () Bool)

(declare-fun e!403550 () Bool)

(assert (=> b!719201 (=> (not res!481739) (not e!403550))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!40752 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!719201 (= res!481739 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!719202 () Bool)

(declare-fun res!481732 () Bool)

(assert (=> b!719202 (=> (not res!481732) (not e!403551))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!719202 (= res!481732 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19923 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19923 a!3186))))))

(declare-fun b!719203 () Bool)

(declare-fun res!481735 () Bool)

(assert (=> b!719203 (=> (not res!481735) (not e!403550))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!719203 (= res!481735 (validKeyInArray!0 (select (arr!19502 a!3186) j!159)))))

(declare-fun b!719204 () Bool)

(declare-fun res!481737 () Bool)

(assert (=> b!719204 (=> (not res!481737) (not e!403551))))

(declare-datatypes ((List!13543 0))(
  ( (Nil!13540) (Cons!13539 (h!14587 (_ BitVec 64)) (t!19849 List!13543)) )
))
(declare-fun arrayNoDuplicates!0 (array!40752 (_ BitVec 32) List!13543) Bool)

(assert (=> b!719204 (= res!481737 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13540))))

(declare-fun b!719205 () Bool)

(assert (=> b!719205 (= e!403550 e!403551)))

(declare-fun res!481733 () Bool)

(assert (=> b!719205 (=> (not res!481733) (not e!403551))))

(declare-fun lt!319361 () SeekEntryResult!7099)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!719205 (= res!481733 (or (= lt!319361 (MissingZero!7099 i!1173)) (= lt!319361 (MissingVacant!7099 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40752 (_ BitVec 32)) SeekEntryResult!7099)

(assert (=> b!719205 (= lt!319361 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!719206 () Bool)

(declare-fun res!481734 () Bool)

(assert (=> b!719206 (=> (not res!481734) (not e!403550))))

(assert (=> b!719206 (= res!481734 (validKeyInArray!0 k0!2102))))

(declare-fun b!719207 () Bool)

(assert (=> b!719207 (= e!403551 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19502 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsgt x!1131 resIntermediateX!5) (bvslt mask!3328 #b00000000000000000000000000000000)))))

(declare-fun res!481740 () Bool)

(assert (=> start!64040 (=> (not res!481740) (not e!403550))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64040 (= res!481740 (validMask!0 mask!3328))))

(assert (=> start!64040 e!403550))

(assert (=> start!64040 true))

(declare-fun array_inv!15385 (array!40752) Bool)

(assert (=> start!64040 (array_inv!15385 a!3186)))

(declare-fun b!719200 () Bool)

(declare-fun res!481738 () Bool)

(assert (=> b!719200 (=> (not res!481738) (not e!403550))))

(assert (=> b!719200 (= res!481738 (and (= (size!19923 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19923 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19923 a!3186)) (not (= i!1173 j!159))))))

(assert (= (and start!64040 res!481740) b!719200))

(assert (= (and b!719200 res!481738) b!719203))

(assert (= (and b!719203 res!481735) b!719206))

(assert (= (and b!719206 res!481734) b!719201))

(assert (= (and b!719201 res!481739) b!719205))

(assert (= (and b!719205 res!481733) b!719198))

(assert (= (and b!719198 res!481736) b!719204))

(assert (= (and b!719204 res!481737) b!719202))

(assert (= (and b!719202 res!481732) b!719199))

(assert (= (and b!719199 res!481731) b!719207))

(declare-fun m!674093 () Bool)

(assert (=> b!719205 m!674093))

(declare-fun m!674095 () Bool)

(assert (=> b!719204 m!674095))

(declare-fun m!674097 () Bool)

(assert (=> b!719206 m!674097))

(declare-fun m!674099 () Bool)

(assert (=> b!719198 m!674099))

(declare-fun m!674101 () Bool)

(assert (=> b!719201 m!674101))

(declare-fun m!674103 () Bool)

(assert (=> b!719199 m!674103))

(assert (=> b!719199 m!674103))

(declare-fun m!674105 () Bool)

(assert (=> b!719199 m!674105))

(assert (=> b!719199 m!674105))

(assert (=> b!719199 m!674103))

(declare-fun m!674107 () Bool)

(assert (=> b!719199 m!674107))

(assert (=> b!719203 m!674103))

(assert (=> b!719203 m!674103))

(declare-fun m!674109 () Bool)

(assert (=> b!719203 m!674109))

(declare-fun m!674111 () Bool)

(assert (=> start!64040 m!674111))

(declare-fun m!674113 () Bool)

(assert (=> start!64040 m!674113))

(declare-fun m!674115 () Bool)

(assert (=> b!719207 m!674115))

(check-sat (not b!719204) (not start!64040) (not b!719206) (not b!719198) (not b!719203) (not b!719205) (not b!719201) (not b!719199))
(check-sat)
