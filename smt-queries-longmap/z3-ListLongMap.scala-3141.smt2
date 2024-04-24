; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44258 () Bool)

(assert start!44258)

(declare-fun b!486748 () Bool)

(declare-fun res!290189 () Bool)

(declare-fun e!286492 () Bool)

(assert (=> b!486748 (=> (not res!290189) (not e!286492))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!31510 0))(
  ( (array!31511 (arr!15148 (Array (_ BitVec 32) (_ BitVec 64))) (size!15512 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31510)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!486748 (= res!290189 (and (= (size!15512 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15512 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15512 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!486749 () Bool)

(declare-fun e!286494 () Bool)

(assert (=> b!486749 (= e!286494 false)))

(declare-fun lt!219873 () Bool)

(declare-datatypes ((List!9213 0))(
  ( (Nil!9210) (Cons!9209 (h!10065 (_ BitVec 64)) (t!15433 List!9213)) )
))
(declare-fun arrayNoDuplicates!0 (array!31510 (_ BitVec 32) List!9213) Bool)

(assert (=> b!486749 (= lt!219873 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9210))))

(declare-fun b!486750 () Bool)

(declare-fun res!290188 () Bool)

(assert (=> b!486750 (=> (not res!290188) (not e!286494))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31510 (_ BitVec 32)) Bool)

(assert (=> b!486750 (= res!290188 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!486751 () Bool)

(declare-fun res!290193 () Bool)

(assert (=> b!486751 (=> (not res!290193) (not e!286492))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!31510 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!486751 (= res!290193 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!486752 () Bool)

(declare-fun res!290190 () Bool)

(assert (=> b!486752 (=> (not res!290190) (not e!286492))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!486752 (= res!290190 (validKeyInArray!0 k0!2280))))

(declare-fun res!290194 () Bool)

(assert (=> start!44258 (=> (not res!290194) (not e!286492))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44258 (= res!290194 (validMask!0 mask!3524))))

(assert (=> start!44258 e!286492))

(assert (=> start!44258 true))

(declare-fun array_inv!11007 (array!31510) Bool)

(assert (=> start!44258 (array_inv!11007 a!3235)))

(declare-fun b!486753 () Bool)

(assert (=> b!486753 (= e!286492 e!286494)))

(declare-fun res!290191 () Bool)

(assert (=> b!486753 (=> (not res!290191) (not e!286494))))

(declare-datatypes ((SeekEntryResult!3571 0))(
  ( (MissingZero!3571 (index!16463 (_ BitVec 32))) (Found!3571 (index!16464 (_ BitVec 32))) (Intermediate!3571 (undefined!4383 Bool) (index!16465 (_ BitVec 32)) (x!45740 (_ BitVec 32))) (Undefined!3571) (MissingVacant!3571 (index!16466 (_ BitVec 32))) )
))
(declare-fun lt!219874 () SeekEntryResult!3571)

(assert (=> b!486753 (= res!290191 (or (= lt!219874 (MissingZero!3571 i!1204)) (= lt!219874 (MissingVacant!3571 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31510 (_ BitVec 32)) SeekEntryResult!3571)

(assert (=> b!486753 (= lt!219874 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!486754 () Bool)

(declare-fun res!290192 () Bool)

(assert (=> b!486754 (=> (not res!290192) (not e!286492))))

(assert (=> b!486754 (= res!290192 (validKeyInArray!0 (select (arr!15148 a!3235) j!176)))))

(assert (= (and start!44258 res!290194) b!486748))

(assert (= (and b!486748 res!290189) b!486754))

(assert (= (and b!486754 res!290192) b!486752))

(assert (= (and b!486752 res!290190) b!486751))

(assert (= (and b!486751 res!290193) b!486753))

(assert (= (and b!486753 res!290191) b!486750))

(assert (= (and b!486750 res!290188) b!486749))

(declare-fun m!466879 () Bool)

(assert (=> b!486750 m!466879))

(declare-fun m!466881 () Bool)

(assert (=> b!486753 m!466881))

(declare-fun m!466883 () Bool)

(assert (=> b!486752 m!466883))

(declare-fun m!466885 () Bool)

(assert (=> b!486749 m!466885))

(declare-fun m!466887 () Bool)

(assert (=> b!486751 m!466887))

(declare-fun m!466889 () Bool)

(assert (=> b!486754 m!466889))

(assert (=> b!486754 m!466889))

(declare-fun m!466891 () Bool)

(assert (=> b!486754 m!466891))

(declare-fun m!466893 () Bool)

(assert (=> start!44258 m!466893))

(declare-fun m!466895 () Bool)

(assert (=> start!44258 m!466895))

(check-sat (not b!486751) (not b!486749) (not b!486753) (not b!486750) (not b!486752) (not b!486754) (not start!44258))
(check-sat)
