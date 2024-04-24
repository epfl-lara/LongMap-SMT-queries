; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44678 () Bool)

(assert start!44678)

(declare-fun b!490320 () Bool)

(declare-fun e!288243 () Bool)

(assert (=> b!490320 (= e!288243 (not true))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!221470 () (_ BitVec 32))

(declare-datatypes ((array!31738 0))(
  ( (array!31739 (arr!15256 (Array (_ BitVec 32) (_ BitVec 64))) (size!15620 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31738)

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3679 0))(
  ( (MissingZero!3679 (index!16895 (_ BitVec 32))) (Found!3679 (index!16896 (_ BitVec 32))) (Intermediate!3679 (undefined!4491 Bool) (index!16897 (_ BitVec 32)) (x!46142 (_ BitVec 32))) (Undefined!3679) (MissingVacant!3679 (index!16898 (_ BitVec 32))) )
))
(declare-fun lt!221467 () SeekEntryResult!3679)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31738 (_ BitVec 32)) SeekEntryResult!3679)

(assert (=> b!490320 (= lt!221467 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!221470 (select (store (arr!15256 a!3235) i!1204 k0!2280) j!176) (array!31739 (store (arr!15256 a!3235) i!1204 k0!2280) (size!15620 a!3235)) mask!3524))))

(declare-fun lt!221466 () (_ BitVec 32))

(declare-fun lt!221465 () SeekEntryResult!3679)

(assert (=> b!490320 (= lt!221465 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!221466 (select (arr!15256 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!490320 (= lt!221470 (toIndex!0 (select (store (arr!15256 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!490320 (= lt!221466 (toIndex!0 (select (arr!15256 a!3235) j!176) mask!3524))))

(declare-fun e!288240 () Bool)

(assert (=> b!490320 e!288240))

(declare-fun res!293313 () Bool)

(assert (=> b!490320 (=> (not res!293313) (not e!288240))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31738 (_ BitVec 32)) Bool)

(assert (=> b!490320 (= res!293313 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14365 0))(
  ( (Unit!14366) )
))
(declare-fun lt!221469 () Unit!14365)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31738 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14365)

(assert (=> b!490320 (= lt!221469 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!490321 () Bool)

(declare-fun res!293317 () Bool)

(declare-fun e!288242 () Bool)

(assert (=> b!490321 (=> (not res!293317) (not e!288242))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!490321 (= res!293317 (validKeyInArray!0 k0!2280))))

(declare-fun b!490322 () Bool)

(declare-fun res!293315 () Bool)

(assert (=> b!490322 (=> (not res!293315) (not e!288242))))

(assert (=> b!490322 (= res!293315 (and (= (size!15620 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15620 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15620 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!490323 () Bool)

(declare-fun res!293312 () Bool)

(assert (=> b!490323 (=> (not res!293312) (not e!288242))))

(declare-fun arrayContainsKey!0 (array!31738 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!490323 (= res!293312 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!490324 () Bool)

(assert (=> b!490324 (= e!288242 e!288243)))

(declare-fun res!293316 () Bool)

(assert (=> b!490324 (=> (not res!293316) (not e!288243))))

(declare-fun lt!221468 () SeekEntryResult!3679)

(assert (=> b!490324 (= res!293316 (or (= lt!221468 (MissingZero!3679 i!1204)) (= lt!221468 (MissingVacant!3679 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31738 (_ BitVec 32)) SeekEntryResult!3679)

(assert (=> b!490324 (= lt!221468 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!490325 () Bool)

(declare-fun res!293309 () Bool)

(assert (=> b!490325 (=> (not res!293309) (not e!288243))))

(declare-datatypes ((List!9321 0))(
  ( (Nil!9318) (Cons!9317 (h!10179 (_ BitVec 64)) (t!15541 List!9321)) )
))
(declare-fun arrayNoDuplicates!0 (array!31738 (_ BitVec 32) List!9321) Bool)

(assert (=> b!490325 (= res!293309 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9318))))

(declare-fun b!490326 () Bool)

(declare-fun res!293314 () Bool)

(assert (=> b!490326 (=> (not res!293314) (not e!288243))))

(assert (=> b!490326 (= res!293314 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!490327 () Bool)

(declare-fun res!293310 () Bool)

(assert (=> b!490327 (=> (not res!293310) (not e!288242))))

(assert (=> b!490327 (= res!293310 (validKeyInArray!0 (select (arr!15256 a!3235) j!176)))))

(declare-fun res!293311 () Bool)

(assert (=> start!44678 (=> (not res!293311) (not e!288242))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44678 (= res!293311 (validMask!0 mask!3524))))

(assert (=> start!44678 e!288242))

(assert (=> start!44678 true))

(declare-fun array_inv!11115 (array!31738) Bool)

(assert (=> start!44678 (array_inv!11115 a!3235)))

(declare-fun b!490319 () Bool)

(assert (=> b!490319 (= e!288240 (= (seekEntryOrOpen!0 (select (arr!15256 a!3235) j!176) a!3235 mask!3524) (Found!3679 j!176)))))

(assert (= (and start!44678 res!293311) b!490322))

(assert (= (and b!490322 res!293315) b!490327))

(assert (= (and b!490327 res!293310) b!490321))

(assert (= (and b!490321 res!293317) b!490323))

(assert (= (and b!490323 res!293312) b!490324))

(assert (= (and b!490324 res!293316) b!490326))

(assert (= (and b!490326 res!293314) b!490325))

(assert (= (and b!490325 res!293309) b!490320))

(assert (= (and b!490320 res!293313) b!490319))

(declare-fun m!470653 () Bool)

(assert (=> b!490324 m!470653))

(declare-fun m!470655 () Bool)

(assert (=> b!490323 m!470655))

(declare-fun m!470657 () Bool)

(assert (=> start!44678 m!470657))

(declare-fun m!470659 () Bool)

(assert (=> start!44678 m!470659))

(declare-fun m!470661 () Bool)

(assert (=> b!490319 m!470661))

(assert (=> b!490319 m!470661))

(declare-fun m!470663 () Bool)

(assert (=> b!490319 m!470663))

(declare-fun m!470665 () Bool)

(assert (=> b!490321 m!470665))

(assert (=> b!490327 m!470661))

(assert (=> b!490327 m!470661))

(declare-fun m!470667 () Bool)

(assert (=> b!490327 m!470667))

(declare-fun m!470669 () Bool)

(assert (=> b!490325 m!470669))

(declare-fun m!470671 () Bool)

(assert (=> b!490326 m!470671))

(declare-fun m!470673 () Bool)

(assert (=> b!490320 m!470673))

(declare-fun m!470675 () Bool)

(assert (=> b!490320 m!470675))

(assert (=> b!490320 m!470661))

(declare-fun m!470677 () Bool)

(assert (=> b!490320 m!470677))

(assert (=> b!490320 m!470661))

(declare-fun m!470679 () Bool)

(assert (=> b!490320 m!470679))

(assert (=> b!490320 m!470661))

(declare-fun m!470681 () Bool)

(assert (=> b!490320 m!470681))

(declare-fun m!470683 () Bool)

(assert (=> b!490320 m!470683))

(declare-fun m!470685 () Bool)

(assert (=> b!490320 m!470685))

(assert (=> b!490320 m!470683))

(declare-fun m!470687 () Bool)

(assert (=> b!490320 m!470687))

(assert (=> b!490320 m!470683))

(check-sat (not start!44678) (not b!490325) (not b!490324) (not b!490321) (not b!490319) (not b!490327) (not b!490326) (not b!490320) (not b!490323))
(check-sat)
