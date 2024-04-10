; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44256 () Bool)

(assert start!44256)

(declare-fun b!486683 () Bool)

(declare-fun res!290070 () Bool)

(declare-fun e!286478 () Bool)

(assert (=> b!486683 (=> (not res!290070) (not e!286478))))

(declare-datatypes ((array!31507 0))(
  ( (array!31508 (arr!15147 (Array (_ BitVec 32) (_ BitVec 64))) (size!15511 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31507)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!486683 (= res!290070 (validKeyInArray!0 (select (arr!15147 a!3235) j!176)))))

(declare-fun b!486684 () Bool)

(declare-fun res!290074 () Bool)

(assert (=> b!486684 (=> (not res!290074) (not e!286478))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!486684 (= res!290074 (and (= (size!15511 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15511 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15511 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!486685 () Bool)

(declare-fun e!286479 () Bool)

(assert (=> b!486685 (= e!286479 false)))

(declare-fun lt!219825 () Bool)

(declare-datatypes ((List!9305 0))(
  ( (Nil!9302) (Cons!9301 (h!10157 (_ BitVec 64)) (t!15533 List!9305)) )
))
(declare-fun arrayNoDuplicates!0 (array!31507 (_ BitVec 32) List!9305) Bool)

(assert (=> b!486685 (= lt!219825 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9302))))

(declare-fun res!290072 () Bool)

(assert (=> start!44256 (=> (not res!290072) (not e!286478))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44256 (= res!290072 (validMask!0 mask!3524))))

(assert (=> start!44256 e!286478))

(assert (=> start!44256 true))

(declare-fun array_inv!10943 (array!31507) Bool)

(assert (=> start!44256 (array_inv!10943 a!3235)))

(declare-fun b!486686 () Bool)

(declare-fun res!290073 () Bool)

(assert (=> b!486686 (=> (not res!290073) (not e!286478))))

(declare-fun k!2280 () (_ BitVec 64))

(assert (=> b!486686 (= res!290073 (validKeyInArray!0 k!2280))))

(declare-fun b!486687 () Bool)

(declare-fun res!290075 () Bool)

(assert (=> b!486687 (=> (not res!290075) (not e!286479))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31507 (_ BitVec 32)) Bool)

(assert (=> b!486687 (= res!290075 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!486688 () Bool)

(declare-fun res!290069 () Bool)

(assert (=> b!486688 (=> (not res!290069) (not e!286478))))

(declare-fun arrayContainsKey!0 (array!31507 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!486688 (= res!290069 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!486689 () Bool)

(assert (=> b!486689 (= e!286478 e!286479)))

(declare-fun res!290071 () Bool)

(assert (=> b!486689 (=> (not res!290071) (not e!286479))))

(declare-datatypes ((SeekEntryResult!3614 0))(
  ( (MissingZero!3614 (index!16635 (_ BitVec 32))) (Found!3614 (index!16636 (_ BitVec 32))) (Intermediate!3614 (undefined!4426 Bool) (index!16637 (_ BitVec 32)) (x!45770 (_ BitVec 32))) (Undefined!3614) (MissingVacant!3614 (index!16638 (_ BitVec 32))) )
))
(declare-fun lt!219826 () SeekEntryResult!3614)

(assert (=> b!486689 (= res!290071 (or (= lt!219826 (MissingZero!3614 i!1204)) (= lt!219826 (MissingVacant!3614 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31507 (_ BitVec 32)) SeekEntryResult!3614)

(assert (=> b!486689 (= lt!219826 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(assert (= (and start!44256 res!290072) b!486684))

(assert (= (and b!486684 res!290074) b!486683))

(assert (= (and b!486683 res!290070) b!486686))

(assert (= (and b!486686 res!290073) b!486688))

(assert (= (and b!486688 res!290069) b!486689))

(assert (= (and b!486689 res!290071) b!486687))

(assert (= (and b!486687 res!290075) b!486685))

(declare-fun m!466587 () Bool)

(assert (=> b!486683 m!466587))

(assert (=> b!486683 m!466587))

(declare-fun m!466589 () Bool)

(assert (=> b!486683 m!466589))

(declare-fun m!466591 () Bool)

(assert (=> b!486685 m!466591))

(declare-fun m!466593 () Bool)

(assert (=> b!486686 m!466593))

(declare-fun m!466595 () Bool)

(assert (=> b!486689 m!466595))

(declare-fun m!466597 () Bool)

(assert (=> b!486688 m!466597))

(declare-fun m!466599 () Bool)

(assert (=> start!44256 m!466599))

(declare-fun m!466601 () Bool)

(assert (=> start!44256 m!466601))

(declare-fun m!466603 () Bool)

(assert (=> b!486687 m!466603))

(push 1)

