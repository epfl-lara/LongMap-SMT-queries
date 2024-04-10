; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32148 () Bool)

(assert start!32148)

(declare-fun b!320396 () Bool)

(declare-fun res!174641 () Bool)

(declare-fun e!198802 () Bool)

(assert (=> b!320396 (=> (not res!174641) (not e!198802))))

(declare-datatypes ((array!16383 0))(
  ( (array!16384 (arr!7752 (Array (_ BitVec 32) (_ BitVec 64))) (size!8104 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16383)

(declare-fun i!1250 () (_ BitVec 32))

(declare-fun mask!3777 () (_ BitVec 32))

(assert (=> b!320396 (= res!174641 (and (= (size!8104 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8104 a!3305))))))

(declare-fun res!174639 () Bool)

(assert (=> start!32148 (=> (not res!174639) (not e!198802))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32148 (= res!174639 (validMask!0 mask!3777))))

(assert (=> start!32148 e!198802))

(declare-fun array_inv!5715 (array!16383) Bool)

(assert (=> start!32148 (array_inv!5715 a!3305)))

(assert (=> start!32148 true))

(declare-fun b!320397 () Bool)

(declare-fun res!174643 () Bool)

(assert (=> b!320397 (=> (not res!174643) (not e!198802))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16383 (_ BitVec 32)) Bool)

(assert (=> b!320397 (= res!174643 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!320398 () Bool)

(declare-fun res!174644 () Bool)

(assert (=> b!320398 (=> (not res!174644) (not e!198802))))

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2883 0))(
  ( (MissingZero!2883 (index!13708 (_ BitVec 32))) (Found!2883 (index!13709 (_ BitVec 32))) (Intermediate!2883 (undefined!3695 Bool) (index!13710 (_ BitVec 32)) (x!31976 (_ BitVec 32))) (Undefined!2883) (MissingVacant!2883 (index!13711 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16383 (_ BitVec 32)) SeekEntryResult!2883)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!320398 (= res!174644 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) (Intermediate!2883 false resIndex!58 resX!58)))))

(declare-fun b!320399 () Bool)

(declare-fun res!174642 () Bool)

(assert (=> b!320399 (=> (not res!174642) (not e!198802))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16383 (_ BitVec 32)) SeekEntryResult!2883)

(assert (=> b!320399 (= res!174642 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!2883 i!1250)))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun b!320400 () Bool)

(assert (=> b!320400 (= e!198802 (and (= (select (arr!7752 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8104 a!3305)) (bvsge mask!3777 #b00000000000000000000000000000000) (bvsge index!1840 (bvadd #b00000000000000000000000000000001 mask!3777))))))

(declare-fun b!320401 () Bool)

(declare-fun res!174645 () Bool)

(assert (=> b!320401 (=> (not res!174645) (not e!198802))))

(declare-fun arrayContainsKey!0 (array!16383 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!320401 (= res!174645 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!320402 () Bool)

(declare-fun res!174640 () Bool)

(assert (=> b!320402 (=> (not res!174640) (not e!198802))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!320402 (= res!174640 (validKeyInArray!0 k0!2497))))

(assert (= (and start!32148 res!174639) b!320396))

(assert (= (and b!320396 res!174641) b!320402))

(assert (= (and b!320402 res!174640) b!320401))

(assert (= (and b!320401 res!174645) b!320399))

(assert (= (and b!320399 res!174642) b!320397))

(assert (= (and b!320397 res!174643) b!320398))

(assert (= (and b!320398 res!174644) b!320400))

(declare-fun m!328781 () Bool)

(assert (=> b!320400 m!328781))

(declare-fun m!328783 () Bool)

(assert (=> b!320398 m!328783))

(assert (=> b!320398 m!328783))

(declare-fun m!328785 () Bool)

(assert (=> b!320398 m!328785))

(declare-fun m!328787 () Bool)

(assert (=> b!320397 m!328787))

(declare-fun m!328789 () Bool)

(assert (=> b!320401 m!328789))

(declare-fun m!328791 () Bool)

(assert (=> start!32148 m!328791))

(declare-fun m!328793 () Bool)

(assert (=> start!32148 m!328793))

(declare-fun m!328795 () Bool)

(assert (=> b!320399 m!328795))

(declare-fun m!328797 () Bool)

(assert (=> b!320402 m!328797))

(check-sat (not b!320399) (not start!32148) (not b!320397) (not b!320402) (not b!320398) (not b!320401))
(check-sat)
