; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64002 () Bool)

(assert start!64002)

(declare-fun b!718631 () Bool)

(declare-fun e!403498 () Bool)

(declare-fun e!403500 () Bool)

(assert (=> b!718631 (= e!403498 e!403500)))

(declare-fun res!480964 () Bool)

(assert (=> b!718631 (=> (not res!480964) (not e!403500))))

(declare-datatypes ((SeekEntryResult!7018 0))(
  ( (MissingZero!7018 (index!30440 (_ BitVec 32))) (Found!7018 (index!30441 (_ BitVec 32))) (Intermediate!7018 (undefined!7830 Bool) (index!30442 (_ BitVec 32)) (x!61609 (_ BitVec 32))) (Undefined!7018) (MissingVacant!7018 (index!30443 (_ BitVec 32))) )
))
(declare-fun lt!319463 () SeekEntryResult!7018)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!718631 (= res!480964 (or (= lt!319463 (MissingZero!7018 i!1173)) (= lt!319463 (MissingVacant!7018 i!1173))))))

(declare-datatypes ((array!40675 0))(
  ( (array!40676 (arr!19462 (Array (_ BitVec 32) (_ BitVec 64))) (size!19882 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40675)

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40675 (_ BitVec 32)) SeekEntryResult!7018)

(assert (=> b!718631 (= lt!319463 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!718632 () Bool)

(assert (=> b!718632 (= e!403500 (bvslt mask!3328 #b00000000000000000000000000000000))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun lt!319464 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!718632 (= lt!319464 (toIndex!0 (select (arr!19462 a!3186) j!159) mask!3328))))

(declare-fun b!718633 () Bool)

(declare-fun res!480970 () Bool)

(assert (=> b!718633 (=> (not res!480970) (not e!403498))))

(declare-fun arrayContainsKey!0 (array!40675 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!718633 (= res!480970 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!718634 () Bool)

(declare-fun res!480962 () Bool)

(assert (=> b!718634 (=> (not res!480962) (not e!403498))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!718634 (= res!480962 (validKeyInArray!0 (select (arr!19462 a!3186) j!159)))))

(declare-fun b!718635 () Bool)

(declare-fun res!480965 () Bool)

(assert (=> b!718635 (=> (not res!480965) (not e!403498))))

(assert (=> b!718635 (= res!480965 (and (= (size!19882 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19882 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19882 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!718636 () Bool)

(declare-fun res!480968 () Bool)

(assert (=> b!718636 (=> (not res!480968) (not e!403498))))

(assert (=> b!718636 (= res!480968 (validKeyInArray!0 k0!2102))))

(declare-fun b!718637 () Bool)

(declare-fun res!480963 () Bool)

(assert (=> b!718637 (=> (not res!480963) (not e!403500))))

(declare-datatypes ((List!13371 0))(
  ( (Nil!13368) (Cons!13367 (h!14415 (_ BitVec 64)) (t!19678 List!13371)) )
))
(declare-fun arrayNoDuplicates!0 (array!40675 (_ BitVec 32) List!13371) Bool)

(assert (=> b!718637 (= res!480963 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13368))))

(declare-fun b!718638 () Bool)

(declare-fun res!480966 () Bool)

(assert (=> b!718638 (=> (not res!480966) (not e!403500))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!718638 (= res!480966 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19882 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19882 a!3186))))))

(declare-fun b!718639 () Bool)

(declare-fun res!480967 () Bool)

(assert (=> b!718639 (=> (not res!480967) (not e!403500))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40675 (_ BitVec 32)) Bool)

(assert (=> b!718639 (= res!480967 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun res!480969 () Bool)

(assert (=> start!64002 (=> (not res!480969) (not e!403498))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64002 (= res!480969 (validMask!0 mask!3328))))

(assert (=> start!64002 e!403498))

(assert (=> start!64002 true))

(declare-fun array_inv!15321 (array!40675) Bool)

(assert (=> start!64002 (array_inv!15321 a!3186)))

(assert (= (and start!64002 res!480969) b!718635))

(assert (= (and b!718635 res!480965) b!718634))

(assert (= (and b!718634 res!480962) b!718636))

(assert (= (and b!718636 res!480968) b!718633))

(assert (= (and b!718633 res!480970) b!718631))

(assert (= (and b!718631 res!480964) b!718639))

(assert (= (and b!718639 res!480967) b!718637))

(assert (= (and b!718637 res!480963) b!718638))

(assert (= (and b!718638 res!480966) b!718632))

(declare-fun m!674829 () Bool)

(assert (=> start!64002 m!674829))

(declare-fun m!674831 () Bool)

(assert (=> start!64002 m!674831))

(declare-fun m!674833 () Bool)

(assert (=> b!718633 m!674833))

(declare-fun m!674835 () Bool)

(assert (=> b!718639 m!674835))

(declare-fun m!674837 () Bool)

(assert (=> b!718634 m!674837))

(assert (=> b!718634 m!674837))

(declare-fun m!674839 () Bool)

(assert (=> b!718634 m!674839))

(declare-fun m!674841 () Bool)

(assert (=> b!718631 m!674841))

(declare-fun m!674843 () Bool)

(assert (=> b!718636 m!674843))

(assert (=> b!718632 m!674837))

(assert (=> b!718632 m!674837))

(declare-fun m!674845 () Bool)

(assert (=> b!718632 m!674845))

(declare-fun m!674847 () Bool)

(assert (=> b!718637 m!674847))

(check-sat (not b!718636) (not b!718637) (not b!718639) (not b!718632) (not b!718631) (not b!718634) (not start!64002) (not b!718633))
(check-sat)
