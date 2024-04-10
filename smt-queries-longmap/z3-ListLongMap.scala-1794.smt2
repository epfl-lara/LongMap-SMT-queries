; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32466 () Bool)

(assert start!32466)

(declare-fun b!324443 () Bool)

(declare-fun res!177775 () Bool)

(declare-fun e!200280 () Bool)

(assert (=> b!324443 (=> (not res!177775) (not e!200280))))

(declare-datatypes ((array!16605 0))(
  ( (array!16606 (arr!7860 (Array (_ BitVec 32) (_ BitVec 64))) (size!8212 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16605)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!324443 (= res!177775 (and (= (select (arr!7860 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8212 a!3305))))))

(declare-fun b!324444 () Bool)

(declare-fun e!200279 () Bool)

(assert (=> b!324444 (= e!200279 e!200280)))

(declare-fun res!177783 () Bool)

(assert (=> b!324444 (=> (not res!177783) (not e!200280))))

(declare-fun k0!2497 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!2991 0))(
  ( (MissingZero!2991 (index!14140 (_ BitVec 32))) (Found!2991 (index!14141 (_ BitVec 32))) (Intermediate!2991 (undefined!3803 Bool) (index!14142 (_ BitVec 32)) (x!32387 (_ BitVec 32))) (Undefined!2991) (MissingVacant!2991 (index!14143 (_ BitVec 32))) )
))
(declare-fun lt!156803 () SeekEntryResult!2991)

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16605 (_ BitVec 32)) SeekEntryResult!2991)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!324444 (= res!177783 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!156803))))

(assert (=> b!324444 (= lt!156803 (Intermediate!2991 false resIndex!58 resX!58))))

(declare-fun b!324446 () Bool)

(declare-fun res!177777 () Bool)

(assert (=> b!324446 (=> (not res!177777) (not e!200279))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16605 (_ BitVec 32)) Bool)

(assert (=> b!324446 (= res!177777 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!324447 () Bool)

(declare-fun res!177779 () Bool)

(assert (=> b!324447 (=> (not res!177779) (not e!200279))))

(declare-fun arrayContainsKey!0 (array!16605 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!324447 (= res!177779 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!324448 () Bool)

(declare-fun res!177781 () Bool)

(assert (=> b!324448 (=> (not res!177781) (not e!200279))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!324448 (= res!177781 (validKeyInArray!0 k0!2497))))

(declare-fun b!324449 () Bool)

(assert (=> b!324449 (= e!200280 false)))

(declare-fun lt!156804 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!324449 (= lt!156804 (nextIndex!0 index!1840 x!1490 mask!3777))))

(declare-fun b!324450 () Bool)

(declare-fun res!177776 () Bool)

(assert (=> b!324450 (=> (not res!177776) (not e!200279))))

(assert (=> b!324450 (= res!177776 (and (= (size!8212 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8212 a!3305))))))

(declare-fun b!324445 () Bool)

(declare-fun res!177774 () Bool)

(assert (=> b!324445 (=> (not res!177774) (not e!200279))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16605 (_ BitVec 32)) SeekEntryResult!2991)

(assert (=> b!324445 (= res!177774 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!2991 i!1250)))))

(declare-fun res!177782 () Bool)

(assert (=> start!32466 (=> (not res!177782) (not e!200279))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32466 (= res!177782 (validMask!0 mask!3777))))

(assert (=> start!32466 e!200279))

(declare-fun array_inv!5823 (array!16605) Bool)

(assert (=> start!32466 (array_inv!5823 a!3305)))

(assert (=> start!32466 true))

(declare-fun b!324451 () Bool)

(declare-fun res!177780 () Bool)

(assert (=> b!324451 (=> (not res!177780) (not e!200280))))

(assert (=> b!324451 (= res!177780 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!156803))))

(declare-fun b!324452 () Bool)

(declare-fun res!177778 () Bool)

(assert (=> b!324452 (=> (not res!177778) (not e!200280))))

(assert (=> b!324452 (= res!177778 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7860 a!3305) index!1840) k0!2497)) (not (= x!1490 resX!58))))))

(assert (= (and start!32466 res!177782) b!324450))

(assert (= (and b!324450 res!177776) b!324448))

(assert (= (and b!324448 res!177781) b!324447))

(assert (= (and b!324447 res!177779) b!324445))

(assert (= (and b!324445 res!177774) b!324446))

(assert (= (and b!324446 res!177777) b!324444))

(assert (= (and b!324444 res!177783) b!324443))

(assert (= (and b!324443 res!177775) b!324451))

(assert (= (and b!324451 res!177780) b!324452))

(assert (= (and b!324452 res!177778) b!324449))

(declare-fun m!331487 () Bool)

(assert (=> b!324443 m!331487))

(declare-fun m!331489 () Bool)

(assert (=> b!324452 m!331489))

(declare-fun m!331491 () Bool)

(assert (=> b!324451 m!331491))

(declare-fun m!331493 () Bool)

(assert (=> start!32466 m!331493))

(declare-fun m!331495 () Bool)

(assert (=> start!32466 m!331495))

(declare-fun m!331497 () Bool)

(assert (=> b!324444 m!331497))

(assert (=> b!324444 m!331497))

(declare-fun m!331499 () Bool)

(assert (=> b!324444 m!331499))

(declare-fun m!331501 () Bool)

(assert (=> b!324446 m!331501))

(declare-fun m!331503 () Bool)

(assert (=> b!324445 m!331503))

(declare-fun m!331505 () Bool)

(assert (=> b!324449 m!331505))

(declare-fun m!331507 () Bool)

(assert (=> b!324448 m!331507))

(declare-fun m!331509 () Bool)

(assert (=> b!324447 m!331509))

(check-sat (not b!324447) (not b!324451) (not b!324444) (not b!324449) (not b!324446) (not b!324445) (not b!324448) (not start!32466))
(check-sat)
