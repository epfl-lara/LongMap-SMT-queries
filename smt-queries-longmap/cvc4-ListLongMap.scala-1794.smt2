; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32468 () Bool)

(assert start!32468)

(declare-fun b!324473 () Bool)

(declare-fun res!177810 () Bool)

(declare-fun e!200288 () Bool)

(assert (=> b!324473 (=> (not res!177810) (not e!200288))))

(declare-datatypes ((array!16607 0))(
  ( (array!16608 (arr!7861 (Array (_ BitVec 32) (_ BitVec 64))) (size!8213 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16607)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(assert (=> b!324473 (= res!177810 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7861 a!3305) index!1840) k!2497)) (not (= x!1490 resX!58))))))

(declare-fun b!324474 () Bool)

(declare-fun res!177813 () Bool)

(declare-fun e!200290 () Bool)

(assert (=> b!324474 (=> (not res!177813) (not e!200290))))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2992 0))(
  ( (MissingZero!2992 (index!14144 (_ BitVec 32))) (Found!2992 (index!14145 (_ BitVec 32))) (Intermediate!2992 (undefined!3804 Bool) (index!14146 (_ BitVec 32)) (x!32388 (_ BitVec 32))) (Undefined!2992) (MissingVacant!2992 (index!14147 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16607 (_ BitVec 32)) SeekEntryResult!2992)

(assert (=> b!324474 (= res!177813 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!2992 i!1250)))))

(declare-fun b!324475 () Bool)

(declare-fun res!177806 () Bool)

(assert (=> b!324475 (=> (not res!177806) (not e!200290))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!324475 (= res!177806 (validKeyInArray!0 k!2497))))

(declare-fun b!324476 () Bool)

(declare-fun res!177804 () Bool)

(assert (=> b!324476 (=> (not res!177804) (not e!200288))))

(declare-fun lt!156809 () SeekEntryResult!2992)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16607 (_ BitVec 32)) SeekEntryResult!2992)

(assert (=> b!324476 (= res!177804 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!156809))))

(declare-fun b!324477 () Bool)

(declare-fun res!177809 () Bool)

(assert (=> b!324477 (=> (not res!177809) (not e!200290))))

(assert (=> b!324477 (= res!177809 (and (= (size!8213 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8213 a!3305))))))

(declare-fun res!177812 () Bool)

(assert (=> start!32468 (=> (not res!177812) (not e!200290))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32468 (= res!177812 (validMask!0 mask!3777))))

(assert (=> start!32468 e!200290))

(declare-fun array_inv!5824 (array!16607) Bool)

(assert (=> start!32468 (array_inv!5824 a!3305)))

(assert (=> start!32468 true))

(declare-fun b!324478 () Bool)

(assert (=> b!324478 (= e!200288 false)))

(declare-fun lt!156810 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!324478 (= lt!156810 (nextIndex!0 index!1840 x!1490 mask!3777))))

(declare-fun b!324479 () Bool)

(declare-fun res!177805 () Bool)

(assert (=> b!324479 (=> (not res!177805) (not e!200290))))

(declare-fun arrayContainsKey!0 (array!16607 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!324479 (= res!177805 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!324480 () Bool)

(declare-fun res!177811 () Bool)

(assert (=> b!324480 (=> (not res!177811) (not e!200288))))

(declare-fun resIndex!58 () (_ BitVec 32))

(assert (=> b!324480 (= res!177811 (and (= (select (arr!7861 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8213 a!3305))))))

(declare-fun b!324481 () Bool)

(assert (=> b!324481 (= e!200290 e!200288)))

(declare-fun res!177807 () Bool)

(assert (=> b!324481 (=> (not res!177807) (not e!200288))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!324481 (= res!177807 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!156809))))

(assert (=> b!324481 (= lt!156809 (Intermediate!2992 false resIndex!58 resX!58))))

(declare-fun b!324482 () Bool)

(declare-fun res!177808 () Bool)

(assert (=> b!324482 (=> (not res!177808) (not e!200290))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16607 (_ BitVec 32)) Bool)

(assert (=> b!324482 (= res!177808 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(assert (= (and start!32468 res!177812) b!324477))

(assert (= (and b!324477 res!177809) b!324475))

(assert (= (and b!324475 res!177806) b!324479))

(assert (= (and b!324479 res!177805) b!324474))

(assert (= (and b!324474 res!177813) b!324482))

(assert (= (and b!324482 res!177808) b!324481))

(assert (= (and b!324481 res!177807) b!324480))

(assert (= (and b!324480 res!177811) b!324476))

(assert (= (and b!324476 res!177804) b!324473))

(assert (= (and b!324473 res!177810) b!324478))

(declare-fun m!331511 () Bool)

(assert (=> b!324481 m!331511))

(assert (=> b!324481 m!331511))

(declare-fun m!331513 () Bool)

(assert (=> b!324481 m!331513))

(declare-fun m!331515 () Bool)

(assert (=> b!324476 m!331515))

(declare-fun m!331517 () Bool)

(assert (=> b!324473 m!331517))

(declare-fun m!331519 () Bool)

(assert (=> b!324475 m!331519))

(declare-fun m!331521 () Bool)

(assert (=> b!324478 m!331521))

(declare-fun m!331523 () Bool)

(assert (=> b!324474 m!331523))

(declare-fun m!331525 () Bool)

(assert (=> b!324479 m!331525))

(declare-fun m!331527 () Bool)

(assert (=> b!324482 m!331527))

(declare-fun m!331529 () Bool)

(assert (=> b!324480 m!331529))

(declare-fun m!331531 () Bool)

(assert (=> start!32468 m!331531))

(declare-fun m!331533 () Bool)

(assert (=> start!32468 m!331533))

(push 1)

