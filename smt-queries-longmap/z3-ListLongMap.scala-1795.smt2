; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32456 () Bool)

(assert start!32456)

(declare-fun b!324450 () Bool)

(declare-fun res!177839 () Bool)

(declare-fun e!200264 () Bool)

(assert (=> b!324450 (=> (not res!177839) (not e!200264))))

(declare-datatypes ((array!16608 0))(
  ( (array!16609 (arr!7861 (Array (_ BitVec 32) (_ BitVec 64))) (size!8213 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16608)

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!324450 (= res!177839 (and (= (size!8213 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8213 a!3305))))))

(declare-fun b!324451 () Bool)

(declare-fun e!200263 () Bool)

(assert (=> b!324451 (= e!200264 e!200263)))

(declare-fun res!177840 () Bool)

(assert (=> b!324451 (=> (not res!177840) (not e!200263))))

(declare-fun k0!2497 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!2957 0))(
  ( (MissingZero!2957 (index!14004 (_ BitVec 32))) (Found!2957 (index!14005 (_ BitVec 32))) (Intermediate!2957 (undefined!3769 Bool) (index!14006 (_ BitVec 32)) (x!32358 (_ BitVec 32))) (Undefined!2957) (MissingVacant!2957 (index!14007 (_ BitVec 32))) )
))
(declare-fun lt!156834 () SeekEntryResult!2957)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16608 (_ BitVec 32)) SeekEntryResult!2957)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!324451 (= res!177840 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!156834))))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!324451 (= lt!156834 (Intermediate!2957 false resIndex!58 resX!58))))

(declare-fun b!324452 () Bool)

(declare-fun res!177831 () Bool)

(assert (=> b!324452 (=> (not res!177831) (not e!200263))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(assert (=> b!324452 (= res!177831 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!156834))))

(declare-fun res!177835 () Bool)

(assert (=> start!32456 (=> (not res!177835) (not e!200264))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32456 (= res!177835 (validMask!0 mask!3777))))

(assert (=> start!32456 e!200264))

(declare-fun array_inv!5811 (array!16608) Bool)

(assert (=> start!32456 (array_inv!5811 a!3305)))

(assert (=> start!32456 true))

(declare-fun b!324453 () Bool)

(declare-fun res!177837 () Bool)

(assert (=> b!324453 (=> (not res!177837) (not e!200264))))

(declare-fun arrayContainsKey!0 (array!16608 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!324453 (= res!177837 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!324454 () Bool)

(declare-fun res!177832 () Bool)

(assert (=> b!324454 (=> (not res!177832) (not e!200263))))

(assert (=> b!324454 (= res!177832 (and (= (select (arr!7861 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8213 a!3305))))))

(declare-fun b!324455 () Bool)

(declare-fun res!177838 () Bool)

(assert (=> b!324455 (=> (not res!177838) (not e!200264))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16608 (_ BitVec 32)) Bool)

(assert (=> b!324455 (= res!177838 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!324456 () Bool)

(declare-fun res!177833 () Bool)

(assert (=> b!324456 (=> (not res!177833) (not e!200264))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16608 (_ BitVec 32)) SeekEntryResult!2957)

(assert (=> b!324456 (= res!177833 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!2957 i!1250)))))

(declare-fun b!324457 () Bool)

(assert (=> b!324457 (= e!200263 false)))

(declare-fun lt!156833 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!324457 (= lt!156833 (nextIndex!0 index!1840 (bvadd #b00000000000000000000000000000001 x!1490) mask!3777))))

(declare-fun b!324458 () Bool)

(declare-fun res!177834 () Bool)

(assert (=> b!324458 (=> (not res!177834) (not e!200263))))

(assert (=> b!324458 (= res!177834 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7861 a!3305) index!1840) k0!2497)) (not (= x!1490 resX!58))))))

(declare-fun b!324459 () Bool)

(declare-fun res!177836 () Bool)

(assert (=> b!324459 (=> (not res!177836) (not e!200264))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!324459 (= res!177836 (validKeyInArray!0 k0!2497))))

(assert (= (and start!32456 res!177835) b!324450))

(assert (= (and b!324450 res!177839) b!324459))

(assert (= (and b!324459 res!177836) b!324453))

(assert (= (and b!324453 res!177837) b!324456))

(assert (= (and b!324456 res!177833) b!324455))

(assert (= (and b!324455 res!177838) b!324451))

(assert (= (and b!324451 res!177840) b!324454))

(assert (= (and b!324454 res!177832) b!324452))

(assert (= (and b!324452 res!177831) b!324458))

(assert (= (and b!324458 res!177834) b!324457))

(declare-fun m!331717 () Bool)

(assert (=> b!324451 m!331717))

(assert (=> b!324451 m!331717))

(declare-fun m!331719 () Bool)

(assert (=> b!324451 m!331719))

(declare-fun m!331721 () Bool)

(assert (=> b!324457 m!331721))

(declare-fun m!331723 () Bool)

(assert (=> b!324459 m!331723))

(declare-fun m!331725 () Bool)

(assert (=> b!324456 m!331725))

(declare-fun m!331727 () Bool)

(assert (=> b!324455 m!331727))

(declare-fun m!331729 () Bool)

(assert (=> b!324458 m!331729))

(declare-fun m!331731 () Bool)

(assert (=> b!324453 m!331731))

(declare-fun m!331733 () Bool)

(assert (=> b!324454 m!331733))

(declare-fun m!331735 () Bool)

(assert (=> start!32456 m!331735))

(declare-fun m!331737 () Bool)

(assert (=> start!32456 m!331737))

(declare-fun m!331739 () Bool)

(assert (=> b!324452 m!331739))

(check-sat (not b!324457) (not b!324459) (not start!32456) (not b!324455) (not b!324453) (not b!324452) (not b!324456) (not b!324451))
(check-sat)
