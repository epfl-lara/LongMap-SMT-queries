; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44288 () Bool)

(assert start!44288)

(declare-fun res!290411 () Bool)

(declare-fun e!286621 () Bool)

(assert (=> start!44288 (=> (not res!290411) (not e!286621))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44288 (= res!290411 (validMask!0 mask!3524))))

(assert (=> start!44288 e!286621))

(assert (=> start!44288 true))

(declare-datatypes ((array!31539 0))(
  ( (array!31540 (arr!15163 (Array (_ BitVec 32) (_ BitVec 64))) (size!15527 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31539)

(declare-fun array_inv!10959 (array!31539) Bool)

(assert (=> start!44288 (array_inv!10959 a!3235)))

(declare-fun b!487024 () Bool)

(declare-fun res!290416 () Bool)

(declare-fun e!286622 () Bool)

(assert (=> b!487024 (=> (not res!290416) (not e!286622))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31539 (_ BitVec 32)) Bool)

(assert (=> b!487024 (= res!290416 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!487025 () Bool)

(declare-fun res!290410 () Bool)

(assert (=> b!487025 (=> (not res!290410) (not e!286621))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!31539 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!487025 (= res!290410 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!487026 () Bool)

(declare-fun res!290417 () Bool)

(assert (=> b!487026 (=> (not res!290417) (not e!286621))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!487026 (= res!290417 (validKeyInArray!0 k0!2280))))

(declare-fun b!487027 () Bool)

(declare-fun res!290414 () Bool)

(assert (=> b!487027 (=> (not res!290414) (not e!286621))))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!487027 (= res!290414 (and (= (size!15527 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15527 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15527 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!487028 () Bool)

(declare-fun res!290413 () Bool)

(assert (=> b!487028 (=> (not res!290413) (not e!286622))))

(declare-datatypes ((List!9321 0))(
  ( (Nil!9318) (Cons!9317 (h!10173 (_ BitVec 64)) (t!15549 List!9321)) )
))
(declare-fun arrayNoDuplicates!0 (array!31539 (_ BitVec 32) List!9321) Bool)

(assert (=> b!487028 (= res!290413 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9318))))

(declare-fun b!487029 () Bool)

(assert (=> b!487029 (= e!286621 e!286622)))

(declare-fun res!290412 () Bool)

(assert (=> b!487029 (=> (not res!290412) (not e!286622))))

(declare-datatypes ((SeekEntryResult!3630 0))(
  ( (MissingZero!3630 (index!16699 (_ BitVec 32))) (Found!3630 (index!16700 (_ BitVec 32))) (Intermediate!3630 (undefined!4442 Bool) (index!16701 (_ BitVec 32)) (x!45826 (_ BitVec 32))) (Undefined!3630) (MissingVacant!3630 (index!16702 (_ BitVec 32))) )
))
(declare-fun lt!219921 () SeekEntryResult!3630)

(assert (=> b!487029 (= res!290412 (or (= lt!219921 (MissingZero!3630 i!1204)) (= lt!219921 (MissingVacant!3630 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31539 (_ BitVec 32)) SeekEntryResult!3630)

(assert (=> b!487029 (= lt!219921 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!487030 () Bool)

(assert (=> b!487030 (= e!286622 (not true))))

(assert (=> b!487030 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!14206 0))(
  ( (Unit!14207) )
))
(declare-fun lt!219922 () Unit!14206)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31539 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14206)

(assert (=> b!487030 (= lt!219922 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!487031 () Bool)

(declare-fun res!290415 () Bool)

(assert (=> b!487031 (=> (not res!290415) (not e!286621))))

(assert (=> b!487031 (= res!290415 (validKeyInArray!0 (select (arr!15163 a!3235) j!176)))))

(assert (= (and start!44288 res!290411) b!487027))

(assert (= (and b!487027 res!290414) b!487031))

(assert (= (and b!487031 res!290415) b!487026))

(assert (= (and b!487026 res!290417) b!487025))

(assert (= (and b!487025 res!290410) b!487029))

(assert (= (and b!487029 res!290412) b!487024))

(assert (= (and b!487024 res!290416) b!487028))

(assert (= (and b!487028 res!290413) b!487030))

(declare-fun m!466879 () Bool)

(assert (=> b!487030 m!466879))

(declare-fun m!466881 () Bool)

(assert (=> b!487030 m!466881))

(declare-fun m!466883 () Bool)

(assert (=> b!487031 m!466883))

(assert (=> b!487031 m!466883))

(declare-fun m!466885 () Bool)

(assert (=> b!487031 m!466885))

(declare-fun m!466887 () Bool)

(assert (=> b!487024 m!466887))

(declare-fun m!466889 () Bool)

(assert (=> b!487028 m!466889))

(declare-fun m!466891 () Bool)

(assert (=> b!487026 m!466891))

(declare-fun m!466893 () Bool)

(assert (=> start!44288 m!466893))

(declare-fun m!466895 () Bool)

(assert (=> start!44288 m!466895))

(declare-fun m!466897 () Bool)

(assert (=> b!487025 m!466897))

(declare-fun m!466899 () Bool)

(assert (=> b!487029 m!466899))

(check-sat (not b!487031) (not b!487025) (not start!44288) (not b!487026) (not b!487028) (not b!487030) (not b!487029) (not b!487024))
(check-sat)
