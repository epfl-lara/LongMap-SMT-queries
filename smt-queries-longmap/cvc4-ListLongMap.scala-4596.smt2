; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64094 () Bool)

(assert start!64094)

(declare-fun b!719932 () Bool)

(declare-fun res!482328 () Bool)

(declare-fun e!403858 () Bool)

(assert (=> b!719932 (=> (not res!482328) (not e!403858))))

(declare-datatypes ((array!40789 0))(
  ( (array!40790 (arr!19520 (Array (_ BitVec 32) (_ BitVec 64))) (size!19941 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40789)

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!40789 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!719932 (= res!482328 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!719933 () Bool)

(declare-fun res!482325 () Bool)

(assert (=> b!719933 (=> (not res!482325) (not e!403858))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!719933 (= res!482325 (validKeyInArray!0 k!2102))))

(declare-fun b!719934 () Bool)

(declare-fun res!482326 () Bool)

(assert (=> b!719934 (=> (not res!482326) (not e!403858))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!719934 (= res!482326 (validKeyInArray!0 (select (arr!19520 a!3186) j!159)))))

(declare-fun b!719935 () Bool)

(declare-fun res!482329 () Bool)

(assert (=> b!719935 (=> (not res!482329) (not e!403858))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!719935 (= res!482329 (and (= (size!19941 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19941 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19941 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!719936 () Bool)

(declare-fun res!482333 () Bool)

(declare-fun e!403859 () Bool)

(assert (=> b!719936 (=> (not res!482333) (not e!403859))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!719936 (= res!482333 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19941 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19941 a!3186))))))

(declare-fun b!719937 () Bool)

(declare-fun res!482330 () Bool)

(assert (=> b!719937 (=> (not res!482330) (not e!403859))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40789 (_ BitVec 32)) Bool)

(assert (=> b!719937 (= res!482330 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!719939 () Bool)

(assert (=> b!719939 (= e!403858 e!403859)))

(declare-fun res!482327 () Bool)

(assert (=> b!719939 (=> (not res!482327) (not e!403859))))

(declare-datatypes ((SeekEntryResult!7120 0))(
  ( (MissingZero!7120 (index!30848 (_ BitVec 32))) (Found!7120 (index!30849 (_ BitVec 32))) (Intermediate!7120 (undefined!7932 Bool) (index!30850 (_ BitVec 32)) (x!61847 (_ BitVec 32))) (Undefined!7120) (MissingVacant!7120 (index!30851 (_ BitVec 32))) )
))
(declare-fun lt!319678 () SeekEntryResult!7120)

(assert (=> b!719939 (= res!482327 (or (= lt!319678 (MissingZero!7120 i!1173)) (= lt!319678 (MissingVacant!7120 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40789 (_ BitVec 32)) SeekEntryResult!7120)

(assert (=> b!719939 (= lt!319678 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!719940 () Bool)

(declare-fun res!482332 () Bool)

(assert (=> b!719940 (=> (not res!482332) (not e!403859))))

(declare-datatypes ((List!13522 0))(
  ( (Nil!13519) (Cons!13518 (h!14566 (_ BitVec 64)) (t!19837 List!13522)) )
))
(declare-fun arrayNoDuplicates!0 (array!40789 (_ BitVec 32) List!13522) Bool)

(assert (=> b!719940 (= res!482332 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13519))))

(declare-fun res!482331 () Bool)

(assert (=> start!64094 (=> (not res!482331) (not e!403858))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64094 (= res!482331 (validMask!0 mask!3328))))

(assert (=> start!64094 e!403858))

(assert (=> start!64094 true))

(declare-fun array_inv!15316 (array!40789) Bool)

(assert (=> start!64094 (array_inv!15316 a!3186)))

(declare-fun b!719938 () Bool)

(assert (=> b!719938 (= e!403859 false)))

(declare-fun lt!319679 () SeekEntryResult!7120)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40789 (_ BitVec 32)) SeekEntryResult!7120)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!719938 (= lt!319679 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19520 a!3186) j!159) mask!3328) (select (arr!19520 a!3186) j!159) a!3186 mask!3328))))

(assert (= (and start!64094 res!482331) b!719935))

(assert (= (and b!719935 res!482329) b!719934))

(assert (= (and b!719934 res!482326) b!719933))

(assert (= (and b!719933 res!482325) b!719932))

(assert (= (and b!719932 res!482328) b!719939))

(assert (= (and b!719939 res!482327) b!719937))

(assert (= (and b!719937 res!482330) b!719940))

(assert (= (and b!719940 res!482332) b!719936))

(assert (= (and b!719936 res!482333) b!719938))

(declare-fun m!675243 () Bool)

(assert (=> b!719940 m!675243))

(declare-fun m!675245 () Bool)

(assert (=> b!719938 m!675245))

(assert (=> b!719938 m!675245))

(declare-fun m!675247 () Bool)

(assert (=> b!719938 m!675247))

(assert (=> b!719938 m!675247))

(assert (=> b!719938 m!675245))

(declare-fun m!675249 () Bool)

(assert (=> b!719938 m!675249))

(declare-fun m!675251 () Bool)

(assert (=> b!719937 m!675251))

(assert (=> b!719934 m!675245))

(assert (=> b!719934 m!675245))

(declare-fun m!675253 () Bool)

(assert (=> b!719934 m!675253))

(declare-fun m!675255 () Bool)

(assert (=> b!719933 m!675255))

(declare-fun m!675257 () Bool)

(assert (=> b!719932 m!675257))

(declare-fun m!675259 () Bool)

(assert (=> start!64094 m!675259))

(declare-fun m!675261 () Bool)

(assert (=> start!64094 m!675261))

(declare-fun m!675263 () Bool)

(assert (=> b!719939 m!675263))

(push 1)

(assert (not b!719934))

(assert (not b!719939))

(assert (not b!719938))

(assert (not b!719937))

(assert (not b!719932))

(assert (not start!64094))

(assert (not b!719933))

(assert (not b!719940))

(check-sat)

