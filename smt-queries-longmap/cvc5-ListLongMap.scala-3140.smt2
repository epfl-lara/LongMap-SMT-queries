; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44262 () Bool)

(assert start!44262)

(declare-fun b!486746 () Bool)

(declare-fun res!290134 () Bool)

(declare-fun e!286504 () Bool)

(assert (=> b!486746 (=> (not res!290134) (not e!286504))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!486746 (= res!290134 (validKeyInArray!0 k!2280))))

(declare-fun b!486747 () Bool)

(declare-fun res!290136 () Bool)

(assert (=> b!486747 (=> (not res!290136) (not e!286504))))

(declare-datatypes ((array!31513 0))(
  ( (array!31514 (arr!15150 (Array (_ BitVec 32) (_ BitVec 64))) (size!15514 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31513)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!486747 (= res!290136 (validKeyInArray!0 (select (arr!15150 a!3235) j!176)))))

(declare-fun res!290132 () Bool)

(assert (=> start!44262 (=> (not res!290132) (not e!286504))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44262 (= res!290132 (validMask!0 mask!3524))))

(assert (=> start!44262 e!286504))

(assert (=> start!44262 true))

(declare-fun array_inv!10946 (array!31513) Bool)

(assert (=> start!44262 (array_inv!10946 a!3235)))

(declare-fun b!486748 () Bool)

(declare-fun e!286505 () Bool)

(assert (=> b!486748 (= e!286504 e!286505)))

(declare-fun res!290137 () Bool)

(assert (=> b!486748 (=> (not res!290137) (not e!286505))))

(declare-datatypes ((SeekEntryResult!3617 0))(
  ( (MissingZero!3617 (index!16647 (_ BitVec 32))) (Found!3617 (index!16648 (_ BitVec 32))) (Intermediate!3617 (undefined!4429 Bool) (index!16649 (_ BitVec 32)) (x!45781 (_ BitVec 32))) (Undefined!3617) (MissingVacant!3617 (index!16650 (_ BitVec 32))) )
))
(declare-fun lt!219844 () SeekEntryResult!3617)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!486748 (= res!290137 (or (= lt!219844 (MissingZero!3617 i!1204)) (= lt!219844 (MissingVacant!3617 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31513 (_ BitVec 32)) SeekEntryResult!3617)

(assert (=> b!486748 (= lt!219844 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!486749 () Bool)

(declare-fun res!290133 () Bool)

(assert (=> b!486749 (=> (not res!290133) (not e!286504))))

(declare-fun arrayContainsKey!0 (array!31513 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!486749 (= res!290133 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!486750 () Bool)

(declare-fun res!290138 () Bool)

(assert (=> b!486750 (=> (not res!290138) (not e!286504))))

(assert (=> b!486750 (= res!290138 (and (= (size!15514 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15514 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15514 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!486751 () Bool)

(declare-fun res!290135 () Bool)

(assert (=> b!486751 (=> (not res!290135) (not e!286505))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31513 (_ BitVec 32)) Bool)

(assert (=> b!486751 (= res!290135 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!486752 () Bool)

(assert (=> b!486752 (= e!286505 false)))

(declare-fun lt!219843 () Bool)

(declare-datatypes ((List!9308 0))(
  ( (Nil!9305) (Cons!9304 (h!10160 (_ BitVec 64)) (t!15536 List!9308)) )
))
(declare-fun arrayNoDuplicates!0 (array!31513 (_ BitVec 32) List!9308) Bool)

(assert (=> b!486752 (= lt!219843 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9305))))

(assert (= (and start!44262 res!290132) b!486750))

(assert (= (and b!486750 res!290138) b!486747))

(assert (= (and b!486747 res!290136) b!486746))

(assert (= (and b!486746 res!290134) b!486749))

(assert (= (and b!486749 res!290133) b!486748))

(assert (= (and b!486748 res!290137) b!486751))

(assert (= (and b!486751 res!290135) b!486752))

(declare-fun m!466641 () Bool)

(assert (=> start!44262 m!466641))

(declare-fun m!466643 () Bool)

(assert (=> start!44262 m!466643))

(declare-fun m!466645 () Bool)

(assert (=> b!486752 m!466645))

(declare-fun m!466647 () Bool)

(assert (=> b!486748 m!466647))

(declare-fun m!466649 () Bool)

(assert (=> b!486749 m!466649))

(declare-fun m!466651 () Bool)

(assert (=> b!486747 m!466651))

(assert (=> b!486747 m!466651))

(declare-fun m!466653 () Bool)

(assert (=> b!486747 m!466653))

(declare-fun m!466655 () Bool)

(assert (=> b!486746 m!466655))

(declare-fun m!466657 () Bool)

(assert (=> b!486751 m!466657))

(push 1)

(assert (not b!486746))

