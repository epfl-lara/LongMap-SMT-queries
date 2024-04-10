; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63732 () Bool)

(assert start!63732)

(declare-fun b!717270 () Bool)

(declare-fun res!480056 () Bool)

(declare-fun e!402700 () Bool)

(assert (=> b!717270 (=> (not res!480056) (not e!402700))))

(declare-datatypes ((array!40628 0))(
  ( (array!40629 (arr!19447 (Array (_ BitVec 32) (_ BitVec 64))) (size!19868 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40628)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!717270 (= res!480056 (validKeyInArray!0 (select (arr!19447 a!3186) j!159)))))

(declare-fun b!717271 () Bool)

(declare-fun e!402699 () Bool)

(assert (=> b!717271 (= e!402699 (bvsgt #b00000000000000000000000000000000 (size!19868 a!3186)))))

(declare-fun b!717272 () Bool)

(declare-fun res!480062 () Bool)

(assert (=> b!717272 (=> (not res!480062) (not e!402700))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!717272 (= res!480062 (validKeyInArray!0 k0!2102))))

(declare-fun b!717273 () Bool)

(declare-fun res!480057 () Bool)

(assert (=> b!717273 (=> (not res!480057) (not e!402699))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40628 (_ BitVec 32)) Bool)

(assert (=> b!717273 (= res!480057 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun res!480059 () Bool)

(assert (=> start!63732 (=> (not res!480059) (not e!402700))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!63732 (= res!480059 (validMask!0 mask!3328))))

(assert (=> start!63732 e!402700))

(declare-fun array_inv!15243 (array!40628) Bool)

(assert (=> start!63732 (array_inv!15243 a!3186)))

(assert (=> start!63732 true))

(declare-fun b!717274 () Bool)

(declare-fun res!480058 () Bool)

(assert (=> b!717274 (=> (not res!480058) (not e!402700))))

(declare-fun arrayContainsKey!0 (array!40628 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!717274 (= res!480058 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!717275 () Bool)

(assert (=> b!717275 (= e!402700 e!402699)))

(declare-fun res!480060 () Bool)

(assert (=> b!717275 (=> (not res!480060) (not e!402699))))

(declare-datatypes ((SeekEntryResult!7047 0))(
  ( (MissingZero!7047 (index!30556 (_ BitVec 32))) (Found!7047 (index!30557 (_ BitVec 32))) (Intermediate!7047 (undefined!7859 Bool) (index!30558 (_ BitVec 32)) (x!61579 (_ BitVec 32))) (Undefined!7047) (MissingVacant!7047 (index!30559 (_ BitVec 32))) )
))
(declare-fun lt!319034 () SeekEntryResult!7047)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!717275 (= res!480060 (or (= lt!319034 (MissingZero!7047 i!1173)) (= lt!319034 (MissingVacant!7047 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40628 (_ BitVec 32)) SeekEntryResult!7047)

(assert (=> b!717275 (= lt!319034 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!717276 () Bool)

(declare-fun res!480061 () Bool)

(assert (=> b!717276 (=> (not res!480061) (not e!402700))))

(assert (=> b!717276 (= res!480061 (and (= (size!19868 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19868 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19868 a!3186)) (not (= i!1173 j!159))))))

(assert (= (and start!63732 res!480059) b!717276))

(assert (= (and b!717276 res!480061) b!717270))

(assert (= (and b!717270 res!480056) b!717272))

(assert (= (and b!717272 res!480062) b!717274))

(assert (= (and b!717274 res!480058) b!717275))

(assert (= (and b!717275 res!480060) b!717273))

(assert (= (and b!717273 res!480057) b!717271))

(declare-fun m!673211 () Bool)

(assert (=> start!63732 m!673211))

(declare-fun m!673213 () Bool)

(assert (=> start!63732 m!673213))

(declare-fun m!673215 () Bool)

(assert (=> b!717274 m!673215))

(declare-fun m!673217 () Bool)

(assert (=> b!717273 m!673217))

(declare-fun m!673219 () Bool)

(assert (=> b!717270 m!673219))

(assert (=> b!717270 m!673219))

(declare-fun m!673221 () Bool)

(assert (=> b!717270 m!673221))

(declare-fun m!673223 () Bool)

(assert (=> b!717272 m!673223))

(declare-fun m!673225 () Bool)

(assert (=> b!717275 m!673225))

(check-sat (not b!717270) (not b!717274) (not b!717272) (not b!717273) (not b!717275) (not start!63732))
(check-sat)
