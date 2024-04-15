; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44250 () Bool)

(assert start!44250)

(declare-fun b!486475 () Bool)

(declare-fun res!290005 () Bool)

(declare-fun e!286331 () Bool)

(assert (=> b!486475 (=> (not res!290005) (not e!286331))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!486475 (= res!290005 (validKeyInArray!0 k0!2280))))

(declare-fun b!486476 () Bool)

(declare-fun res!290007 () Bool)

(declare-fun e!286332 () Bool)

(assert (=> b!486476 (=> (not res!290007) (not e!286332))))

(declare-datatypes ((array!31511 0))(
  ( (array!31512 (arr!15149 (Array (_ BitVec 32) (_ BitVec 64))) (size!15514 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31511)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31511 (_ BitVec 32)) Bool)

(assert (=> b!486476 (= res!290007 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun res!290004 () Bool)

(assert (=> start!44250 (=> (not res!290004) (not e!286331))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44250 (= res!290004 (validMask!0 mask!3524))))

(assert (=> start!44250 e!286331))

(assert (=> start!44250 true))

(declare-fun array_inv!11032 (array!31511) Bool)

(assert (=> start!44250 (array_inv!11032 a!3235)))

(declare-fun b!486477 () Bool)

(declare-fun res!290008 () Bool)

(assert (=> b!486477 (=> (not res!290008) (not e!286331))))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!486477 (= res!290008 (validKeyInArray!0 (select (arr!15149 a!3235) j!176)))))

(declare-fun b!486478 () Bool)

(assert (=> b!486478 (= e!286332 false)))

(declare-fun lt!219609 () Bool)

(declare-datatypes ((List!9346 0))(
  ( (Nil!9343) (Cons!9342 (h!10198 (_ BitVec 64)) (t!15565 List!9346)) )
))
(declare-fun arrayNoDuplicates!0 (array!31511 (_ BitVec 32) List!9346) Bool)

(assert (=> b!486478 (= lt!219609 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9343))))

(declare-fun b!486479 () Bool)

(declare-fun res!290009 () Bool)

(assert (=> b!486479 (=> (not res!290009) (not e!286331))))

(declare-fun arrayContainsKey!0 (array!31511 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!486479 (= res!290009 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!486480 () Bool)

(declare-fun res!290003 () Bool)

(assert (=> b!486480 (=> (not res!290003) (not e!286331))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!486480 (= res!290003 (and (= (size!15514 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15514 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15514 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!486481 () Bool)

(assert (=> b!486481 (= e!286331 e!286332)))

(declare-fun res!290006 () Bool)

(assert (=> b!486481 (=> (not res!290006) (not e!286332))))

(declare-datatypes ((SeekEntryResult!3613 0))(
  ( (MissingZero!3613 (index!16631 (_ BitVec 32))) (Found!3613 (index!16632 (_ BitVec 32))) (Intermediate!3613 (undefined!4425 Bool) (index!16633 (_ BitVec 32)) (x!45772 (_ BitVec 32))) (Undefined!3613) (MissingVacant!3613 (index!16634 (_ BitVec 32))) )
))
(declare-fun lt!219610 () SeekEntryResult!3613)

(assert (=> b!486481 (= res!290006 (or (= lt!219610 (MissingZero!3613 i!1204)) (= lt!219610 (MissingVacant!3613 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31511 (_ BitVec 32)) SeekEntryResult!3613)

(assert (=> b!486481 (= lt!219610 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(assert (= (and start!44250 res!290004) b!486480))

(assert (= (and b!486480 res!290003) b!486477))

(assert (= (and b!486477 res!290008) b!486475))

(assert (= (and b!486475 res!290005) b!486479))

(assert (= (and b!486479 res!290009) b!486481))

(assert (= (and b!486481 res!290006) b!486476))

(assert (= (and b!486476 res!290007) b!486478))

(declare-fun m!465889 () Bool)

(assert (=> b!486478 m!465889))

(declare-fun m!465891 () Bool)

(assert (=> b!486477 m!465891))

(assert (=> b!486477 m!465891))

(declare-fun m!465893 () Bool)

(assert (=> b!486477 m!465893))

(declare-fun m!465895 () Bool)

(assert (=> b!486475 m!465895))

(declare-fun m!465897 () Bool)

(assert (=> start!44250 m!465897))

(declare-fun m!465899 () Bool)

(assert (=> start!44250 m!465899))

(declare-fun m!465901 () Bool)

(assert (=> b!486481 m!465901))

(declare-fun m!465903 () Bool)

(assert (=> b!486476 m!465903))

(declare-fun m!465905 () Bool)

(assert (=> b!486479 m!465905))

(check-sat (not b!486477) (not b!486481) (not b!486478) (not b!486475) (not b!486479) (not start!44250) (not b!486476))
(check-sat)
