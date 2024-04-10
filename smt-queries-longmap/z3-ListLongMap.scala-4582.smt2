; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64008 () Bool)

(assert start!64008)

(declare-fun res!481127 () Bool)

(declare-fun e!403470 () Bool)

(assert (=> start!64008 (=> (not res!481127) (not e!403470))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64008 (= res!481127 (validMask!0 mask!3328))))

(assert (=> start!64008 e!403470))

(assert (=> start!64008 true))

(declare-datatypes ((array!40703 0))(
  ( (array!40704 (arr!19477 (Array (_ BitVec 32) (_ BitVec 64))) (size!19898 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40703)

(declare-fun array_inv!15273 (array!40703) Bool)

(assert (=> start!64008 (array_inv!15273 a!3186)))

(declare-fun b!718726 () Bool)

(declare-fun res!481124 () Bool)

(declare-fun e!403471 () Bool)

(assert (=> b!718726 (=> (not res!481124) (not e!403471))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40703 (_ BitVec 32)) Bool)

(assert (=> b!718726 (= res!481124 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!718727 () Bool)

(declare-fun res!481119 () Bool)

(assert (=> b!718727 (=> (not res!481119) (not e!403471))))

(declare-datatypes ((List!13479 0))(
  ( (Nil!13476) (Cons!13475 (h!14523 (_ BitVec 64)) (t!19794 List!13479)) )
))
(declare-fun arrayNoDuplicates!0 (array!40703 (_ BitVec 32) List!13479) Bool)

(assert (=> b!718727 (= res!481119 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13476))))

(declare-fun b!718728 () Bool)

(declare-fun res!481121 () Bool)

(assert (=> b!718728 (=> (not res!481121) (not e!403470))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!718728 (= res!481121 (validKeyInArray!0 (select (arr!19477 a!3186) j!159)))))

(declare-fun b!718729 () Bool)

(declare-fun res!481120 () Bool)

(assert (=> b!718729 (=> (not res!481120) (not e!403471))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!718729 (= res!481120 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19898 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19898 a!3186))))))

(declare-fun b!718730 () Bool)

(assert (=> b!718730 (= e!403471 false)))

(declare-fun lt!319465 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!718730 (= lt!319465 (toIndex!0 (select (arr!19477 a!3186) j!159) mask!3328))))

(declare-fun b!718731 () Bool)

(declare-fun res!481122 () Bool)

(assert (=> b!718731 (=> (not res!481122) (not e!403470))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!718731 (= res!481122 (validKeyInArray!0 k0!2102))))

(declare-fun b!718732 () Bool)

(declare-fun res!481126 () Bool)

(assert (=> b!718732 (=> (not res!481126) (not e!403470))))

(declare-fun arrayContainsKey!0 (array!40703 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!718732 (= res!481126 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!718733 () Bool)

(declare-fun res!481125 () Bool)

(assert (=> b!718733 (=> (not res!481125) (not e!403470))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!718733 (= res!481125 (and (= (size!19898 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19898 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19898 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!718734 () Bool)

(assert (=> b!718734 (= e!403470 e!403471)))

(declare-fun res!481123 () Bool)

(assert (=> b!718734 (=> (not res!481123) (not e!403471))))

(declare-datatypes ((SeekEntryResult!7077 0))(
  ( (MissingZero!7077 (index!30676 (_ BitVec 32))) (Found!7077 (index!30677 (_ BitVec 32))) (Intermediate!7077 (undefined!7889 Bool) (index!30678 (_ BitVec 32)) (x!61692 (_ BitVec 32))) (Undefined!7077) (MissingVacant!7077 (index!30679 (_ BitVec 32))) )
))
(declare-fun lt!319466 () SeekEntryResult!7077)

(assert (=> b!718734 (= res!481123 (or (= lt!319466 (MissingZero!7077 i!1173)) (= lt!319466 (MissingVacant!7077 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40703 (_ BitVec 32)) SeekEntryResult!7077)

(assert (=> b!718734 (= lt!319466 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(assert (= (and start!64008 res!481127) b!718733))

(assert (= (and b!718733 res!481125) b!718728))

(assert (= (and b!718728 res!481121) b!718731))

(assert (= (and b!718731 res!481122) b!718732))

(assert (= (and b!718732 res!481126) b!718734))

(assert (= (and b!718734 res!481123) b!718726))

(assert (= (and b!718726 res!481124) b!718727))

(assert (= (and b!718727 res!481119) b!718729))

(assert (= (and b!718729 res!481120) b!718730))

(declare-fun m!674277 () Bool)

(assert (=> b!718731 m!674277))

(declare-fun m!674279 () Bool)

(assert (=> start!64008 m!674279))

(declare-fun m!674281 () Bool)

(assert (=> start!64008 m!674281))

(declare-fun m!674283 () Bool)

(assert (=> b!718734 m!674283))

(declare-fun m!674285 () Bool)

(assert (=> b!718728 m!674285))

(assert (=> b!718728 m!674285))

(declare-fun m!674287 () Bool)

(assert (=> b!718728 m!674287))

(declare-fun m!674289 () Bool)

(assert (=> b!718727 m!674289))

(declare-fun m!674291 () Bool)

(assert (=> b!718732 m!674291))

(declare-fun m!674293 () Bool)

(assert (=> b!718726 m!674293))

(assert (=> b!718730 m!674285))

(assert (=> b!718730 m!674285))

(declare-fun m!674295 () Bool)

(assert (=> b!718730 m!674295))

(check-sat (not b!718734) (not b!718731) (not start!64008) (not b!718730) (not b!718727) (not b!718732) (not b!718728) (not b!718726))
(check-sat)
