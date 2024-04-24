; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63748 () Bool)

(assert start!63748)

(declare-fun b!717234 () Bool)

(declare-fun res!479873 () Bool)

(declare-fun e!402782 () Bool)

(assert (=> b!717234 (=> (not res!479873) (not e!402782))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!717234 (= res!479873 (validKeyInArray!0 k!2102))))

(declare-fun b!717235 () Bool)

(declare-fun res!479872 () Bool)

(assert (=> b!717235 (=> (not res!479872) (not e!402782))))

(declare-datatypes ((array!40577 0))(
  ( (array!40578 (arr!19419 (Array (_ BitVec 32) (_ BitVec 64))) (size!19839 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40577)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!717235 (= res!479872 (and (= (size!19839 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19839 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19839 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!717236 () Bool)

(declare-fun res!479874 () Bool)

(assert (=> b!717236 (=> (not res!479874) (not e!402782))))

(assert (=> b!717236 (= res!479874 (validKeyInArray!0 (select (arr!19419 a!3186) j!159)))))

(declare-fun res!479871 () Bool)

(assert (=> start!63748 (=> (not res!479871) (not e!402782))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!63748 (= res!479871 (validMask!0 mask!3328))))

(assert (=> start!63748 e!402782))

(declare-fun array_inv!15278 (array!40577) Bool)

(assert (=> start!63748 (array_inv!15278 a!3186)))

(assert (=> start!63748 true))

(declare-fun b!717237 () Bool)

(assert (=> b!717237 (= e!402782 false)))

(declare-datatypes ((SeekEntryResult!6975 0))(
  ( (MissingZero!6975 (index!30268 (_ BitVec 32))) (Found!6975 (index!30269 (_ BitVec 32))) (Intermediate!6975 (undefined!7787 Bool) (index!30270 (_ BitVec 32)) (x!61446 (_ BitVec 32))) (Undefined!6975) (MissingVacant!6975 (index!30271 (_ BitVec 32))) )
))
(declare-fun lt!319104 () SeekEntryResult!6975)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40577 (_ BitVec 32)) SeekEntryResult!6975)

(assert (=> b!717237 (= lt!319104 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!717238 () Bool)

(declare-fun res!479875 () Bool)

(assert (=> b!717238 (=> (not res!479875) (not e!402782))))

(declare-fun arrayContainsKey!0 (array!40577 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!717238 (= res!479875 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(assert (= (and start!63748 res!479871) b!717235))

(assert (= (and b!717235 res!479872) b!717236))

(assert (= (and b!717236 res!479874) b!717234))

(assert (= (and b!717234 res!479873) b!717238))

(assert (= (and b!717238 res!479875) b!717237))

(declare-fun m!673735 () Bool)

(assert (=> b!717237 m!673735))

(declare-fun m!673737 () Bool)

(assert (=> b!717234 m!673737))

(declare-fun m!673739 () Bool)

(assert (=> start!63748 m!673739))

(declare-fun m!673741 () Bool)

(assert (=> start!63748 m!673741))

(declare-fun m!673743 () Bool)

(assert (=> b!717236 m!673743))

(assert (=> b!717236 m!673743))

(declare-fun m!673745 () Bool)

(assert (=> b!717236 m!673745))

(declare-fun m!673747 () Bool)

(assert (=> b!717238 m!673747))

(push 1)

(assert (not start!63748))

(assert (not b!717237))

(assert (not b!717234))

(assert (not b!717238))

(assert (not b!717236))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

