; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32252 () Bool)

(assert start!32252)

(declare-fun b!321388 () Bool)

(declare-fun res!175559 () Bool)

(declare-fun e!199143 () Bool)

(assert (=> b!321388 (=> (not res!175559) (not e!199143))))

(declare-datatypes ((array!16455 0))(
  ( (array!16456 (arr!7786 (Array (_ BitVec 32) (_ BitVec 64))) (size!8138 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16455)

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!16455 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!321388 (= res!175559 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun e!199141 () Bool)

(declare-fun b!321389 () Bool)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun mask!3777 () (_ BitVec 32))

(assert (=> b!321389 (= e!199141 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7786 a!3305) index!1840) k0!2497)) (= x!1490 resX!58) (not (= resIndex!58 index!1840)) (not (= (select (arr!7786 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7786 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge mask!3777 #b00000000000000000000000000000000) (bvslt index!1840 (bvadd #b00000000000000000000000000000001 mask!3777)) (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1490) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1490) #b00000000000000000000000000000000))))))

(declare-fun b!321390 () Bool)

(declare-fun res!175562 () Bool)

(assert (=> b!321390 (=> (not res!175562) (not e!199143))))

(declare-fun i!1250 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2882 0))(
  ( (MissingZero!2882 (index!13704 (_ BitVec 32))) (Found!2882 (index!13705 (_ BitVec 32))) (Intermediate!2882 (undefined!3694 Bool) (index!13706 (_ BitVec 32)) (x!32074 (_ BitVec 32))) (Undefined!2882) (MissingVacant!2882 (index!13707 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16455 (_ BitVec 32)) SeekEntryResult!2882)

(assert (=> b!321390 (= res!175562 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!2882 i!1250)))))

(declare-fun b!321391 () Bool)

(declare-fun res!175563 () Bool)

(assert (=> b!321391 (=> (not res!175563) (not e!199143))))

(assert (=> b!321391 (= res!175563 (and (= (size!8138 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8138 a!3305))))))

(declare-fun b!321392 () Bool)

(assert (=> b!321392 (= e!199143 e!199141)))

(declare-fun res!175564 () Bool)

(assert (=> b!321392 (=> (not res!175564) (not e!199141))))

(declare-fun lt!156213 () SeekEntryResult!2882)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16455 (_ BitVec 32)) SeekEntryResult!2882)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!321392 (= res!175564 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!156213))))

(assert (=> b!321392 (= lt!156213 (Intermediate!2882 false resIndex!58 resX!58))))

(declare-fun b!321393 () Bool)

(declare-fun res!175560 () Bool)

(assert (=> b!321393 (=> (not res!175560) (not e!199141))))

(assert (=> b!321393 (= res!175560 (and (= (select (arr!7786 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8138 a!3305))))))

(declare-fun res!175565 () Bool)

(assert (=> start!32252 (=> (not res!175565) (not e!199143))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32252 (= res!175565 (validMask!0 mask!3777))))

(assert (=> start!32252 e!199143))

(declare-fun array_inv!5736 (array!16455) Bool)

(assert (=> start!32252 (array_inv!5736 a!3305)))

(assert (=> start!32252 true))

(declare-fun b!321394 () Bool)

(declare-fun res!175566 () Bool)

(assert (=> b!321394 (=> (not res!175566) (not e!199143))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16455 (_ BitVec 32)) Bool)

(assert (=> b!321394 (= res!175566 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!321395 () Bool)

(declare-fun res!175561 () Bool)

(assert (=> b!321395 (=> (not res!175561) (not e!199141))))

(assert (=> b!321395 (= res!175561 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!156213))))

(declare-fun b!321396 () Bool)

(declare-fun res!175558 () Bool)

(assert (=> b!321396 (=> (not res!175558) (not e!199143))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!321396 (= res!175558 (validKeyInArray!0 k0!2497))))

(assert (= (and start!32252 res!175565) b!321391))

(assert (= (and b!321391 res!175563) b!321396))

(assert (= (and b!321396 res!175558) b!321388))

(assert (= (and b!321388 res!175559) b!321390))

(assert (= (and b!321390 res!175562) b!321394))

(assert (= (and b!321394 res!175566) b!321392))

(assert (= (and b!321392 res!175564) b!321393))

(assert (= (and b!321393 res!175560) b!321395))

(assert (= (and b!321395 res!175561) b!321389))

(declare-fun m!329761 () Bool)

(assert (=> start!32252 m!329761))

(declare-fun m!329763 () Bool)

(assert (=> start!32252 m!329763))

(declare-fun m!329765 () Bool)

(assert (=> b!321394 m!329765))

(declare-fun m!329767 () Bool)

(assert (=> b!321395 m!329767))

(declare-fun m!329769 () Bool)

(assert (=> b!321392 m!329769))

(assert (=> b!321392 m!329769))

(declare-fun m!329771 () Bool)

(assert (=> b!321392 m!329771))

(declare-fun m!329773 () Bool)

(assert (=> b!321388 m!329773))

(declare-fun m!329775 () Bool)

(assert (=> b!321396 m!329775))

(declare-fun m!329777 () Bool)

(assert (=> b!321390 m!329777))

(declare-fun m!329779 () Bool)

(assert (=> b!321393 m!329779))

(declare-fun m!329781 () Bool)

(assert (=> b!321389 m!329781))

(check-sat (not b!321396) (not b!321390) (not b!321395) (not b!321392) (not start!32252) (not b!321388) (not b!321394))
(check-sat)
