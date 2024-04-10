; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44266 () Bool)

(assert start!44266)

(declare-fun b!486788 () Bool)

(declare-fun res!290179 () Bool)

(declare-fun e!286523 () Bool)

(assert (=> b!486788 (=> (not res!290179) (not e!286523))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!486788 (= res!290179 (validKeyInArray!0 k!2280))))

(declare-fun b!486789 () Bool)

(declare-fun e!286522 () Bool)

(assert (=> b!486789 (= e!286523 e!286522)))

(declare-fun res!290174 () Bool)

(assert (=> b!486789 (=> (not res!290174) (not e!286522))))

(declare-datatypes ((SeekEntryResult!3619 0))(
  ( (MissingZero!3619 (index!16655 (_ BitVec 32))) (Found!3619 (index!16656 (_ BitVec 32))) (Intermediate!3619 (undefined!4431 Bool) (index!16657 (_ BitVec 32)) (x!45783 (_ BitVec 32))) (Undefined!3619) (MissingVacant!3619 (index!16658 (_ BitVec 32))) )
))
(declare-fun lt!219856 () SeekEntryResult!3619)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!486789 (= res!290174 (or (= lt!219856 (MissingZero!3619 i!1204)) (= lt!219856 (MissingVacant!3619 i!1204))))))

(declare-datatypes ((array!31517 0))(
  ( (array!31518 (arr!15152 (Array (_ BitVec 32) (_ BitVec 64))) (size!15516 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31517)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31517 (_ BitVec 32)) SeekEntryResult!3619)

(assert (=> b!486789 (= lt!219856 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun res!290180 () Bool)

(assert (=> start!44266 (=> (not res!290180) (not e!286523))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44266 (= res!290180 (validMask!0 mask!3524))))

(assert (=> start!44266 e!286523))

(assert (=> start!44266 true))

(declare-fun array_inv!10948 (array!31517) Bool)

(assert (=> start!44266 (array_inv!10948 a!3235)))

(declare-fun b!486790 () Bool)

(declare-fun res!290177 () Bool)

(assert (=> b!486790 (=> (not res!290177) (not e!286522))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31517 (_ BitVec 32)) Bool)

(assert (=> b!486790 (= res!290177 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!486791 () Bool)

(declare-fun res!290175 () Bool)

(assert (=> b!486791 (=> (not res!290175) (not e!286523))))

(declare-fun arrayContainsKey!0 (array!31517 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!486791 (= res!290175 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!486792 () Bool)

(declare-fun res!290178 () Bool)

(assert (=> b!486792 (=> (not res!290178) (not e!286523))))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!486792 (= res!290178 (and (= (size!15516 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15516 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15516 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!486793 () Bool)

(assert (=> b!486793 (= e!286522 false)))

(declare-fun lt!219855 () Bool)

(declare-datatypes ((List!9310 0))(
  ( (Nil!9307) (Cons!9306 (h!10162 (_ BitVec 64)) (t!15538 List!9310)) )
))
(declare-fun arrayNoDuplicates!0 (array!31517 (_ BitVec 32) List!9310) Bool)

(assert (=> b!486793 (= lt!219855 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9307))))

(declare-fun b!486794 () Bool)

(declare-fun res!290176 () Bool)

(assert (=> b!486794 (=> (not res!290176) (not e!286523))))

(assert (=> b!486794 (= res!290176 (validKeyInArray!0 (select (arr!15152 a!3235) j!176)))))

(assert (= (and start!44266 res!290180) b!486792))

(assert (= (and b!486792 res!290178) b!486794))

(assert (= (and b!486794 res!290176) b!486788))

(assert (= (and b!486788 res!290179) b!486791))

(assert (= (and b!486791 res!290175) b!486789))

(assert (= (and b!486789 res!290174) b!486790))

(assert (= (and b!486790 res!290177) b!486793))

(declare-fun m!466677 () Bool)

(assert (=> b!486794 m!466677))

(assert (=> b!486794 m!466677))

(declare-fun m!466679 () Bool)

(assert (=> b!486794 m!466679))

(declare-fun m!466681 () Bool)

(assert (=> b!486790 m!466681))

(declare-fun m!466683 () Bool)

(assert (=> start!44266 m!466683))

(declare-fun m!466685 () Bool)

(assert (=> start!44266 m!466685))

(declare-fun m!466687 () Bool)

(assert (=> b!486788 m!466687))

(declare-fun m!466689 () Bool)

(assert (=> b!486789 m!466689))

(declare-fun m!466691 () Bool)

(assert (=> b!486791 m!466691))

(declare-fun m!466693 () Bool)

(assert (=> b!486793 m!466693))

(push 1)

(assert (not b!486791))

(assert (not b!486788))

(assert (not b!486790))

(assert (not b!486793))

(assert (not b!486789))

(assert (not start!44266))

(assert (not b!486794))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

