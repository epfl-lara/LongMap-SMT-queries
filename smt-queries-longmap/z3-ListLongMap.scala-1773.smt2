; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32270 () Bool)

(assert start!32270)

(declare-fun b!321429 () Bool)

(declare-fun e!199082 () Bool)

(assert (=> b!321429 (= e!199082 false)))

(declare-fun lt!156007 () (_ BitVec 32))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!321429 (= lt!156007 (nextIndex!0 index!1840 x!1490 mask!3777))))

(declare-fun b!321430 () Bool)

(declare-fun res!175695 () Bool)

(declare-fun e!199081 () Bool)

(assert (=> b!321430 (=> (not res!175695) (not e!199081))))

(declare-datatypes ((array!16464 0))(
  ( (array!16465 (arr!7791 (Array (_ BitVec 32) (_ BitVec 64))) (size!8144 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16464)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16464 (_ BitVec 32)) Bool)

(assert (=> b!321430 (= res!175695 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!321432 () Bool)

(declare-fun res!175698 () Bool)

(assert (=> b!321432 (=> (not res!175698) (not e!199082))))

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(assert (=> b!321432 (= res!175698 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7791 a!3305) index!1840) k0!2497)) (= x!1490 resX!58) (not (= resIndex!58 index!1840)) (not (= (select (arr!7791 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7791 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!321433 () Bool)

(declare-fun res!175700 () Bool)

(assert (=> b!321433 (=> (not res!175700) (not e!199081))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!321433 (= res!175700 (validKeyInArray!0 k0!2497))))

(declare-fun b!321434 () Bool)

(assert (=> b!321434 (= e!199081 e!199082)))

(declare-fun res!175703 () Bool)

(assert (=> b!321434 (=> (not res!175703) (not e!199082))))

(declare-datatypes ((SeekEntryResult!2921 0))(
  ( (MissingZero!2921 (index!13860 (_ BitVec 32))) (Found!2921 (index!13861 (_ BitVec 32))) (Intermediate!2921 (undefined!3733 Bool) (index!13862 (_ BitVec 32)) (x!32135 (_ BitVec 32))) (Undefined!2921) (MissingVacant!2921 (index!13863 (_ BitVec 32))) )
))
(declare-fun lt!156008 () SeekEntryResult!2921)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16464 (_ BitVec 32)) SeekEntryResult!2921)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!321434 (= res!175703 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!156008))))

(assert (=> b!321434 (= lt!156008 (Intermediate!2921 false resIndex!58 resX!58))))

(declare-fun b!321435 () Bool)

(declare-fun res!175699 () Bool)

(assert (=> b!321435 (=> (not res!175699) (not e!199081))))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!321435 (= res!175699 (and (= (size!8144 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8144 a!3305))))))

(declare-fun b!321436 () Bool)

(declare-fun res!175704 () Bool)

(assert (=> b!321436 (=> (not res!175704) (not e!199082))))

(assert (=> b!321436 (= res!175704 (and (= (select (arr!7791 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8144 a!3305))))))

(declare-fun b!321437 () Bool)

(declare-fun res!175697 () Bool)

(assert (=> b!321437 (=> (not res!175697) (not e!199081))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16464 (_ BitVec 32)) SeekEntryResult!2921)

(assert (=> b!321437 (= res!175697 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!2921 i!1250)))))

(declare-fun b!321438 () Bool)

(declare-fun res!175701 () Bool)

(assert (=> b!321438 (=> (not res!175701) (not e!199081))))

(declare-fun arrayContainsKey!0 (array!16464 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!321438 (= res!175701 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!321431 () Bool)

(declare-fun res!175702 () Bool)

(assert (=> b!321431 (=> (not res!175702) (not e!199082))))

(assert (=> b!321431 (= res!175702 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!156008))))

(declare-fun res!175696 () Bool)

(assert (=> start!32270 (=> (not res!175696) (not e!199081))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32270 (= res!175696 (validMask!0 mask!3777))))

(assert (=> start!32270 e!199081))

(declare-fun array_inv!5763 (array!16464) Bool)

(assert (=> start!32270 (array_inv!5763 a!3305)))

(assert (=> start!32270 true))

(assert (= (and start!32270 res!175696) b!321435))

(assert (= (and b!321435 res!175699) b!321433))

(assert (= (and b!321433 res!175700) b!321438))

(assert (= (and b!321438 res!175701) b!321437))

(assert (= (and b!321437 res!175697) b!321430))

(assert (= (and b!321430 res!175695) b!321434))

(assert (= (and b!321434 res!175703) b!321436))

(assert (= (and b!321436 res!175704) b!321431))

(assert (= (and b!321431 res!175702) b!321432))

(assert (= (and b!321432 res!175698) b!321429))

(declare-fun m!329065 () Bool)

(assert (=> b!321436 m!329065))

(declare-fun m!329067 () Bool)

(assert (=> b!321433 m!329067))

(declare-fun m!329069 () Bool)

(assert (=> b!321437 m!329069))

(declare-fun m!329071 () Bool)

(assert (=> b!321429 m!329071))

(declare-fun m!329073 () Bool)

(assert (=> b!321434 m!329073))

(assert (=> b!321434 m!329073))

(declare-fun m!329075 () Bool)

(assert (=> b!321434 m!329075))

(declare-fun m!329077 () Bool)

(assert (=> b!321430 m!329077))

(declare-fun m!329079 () Bool)

(assert (=> b!321431 m!329079))

(declare-fun m!329081 () Bool)

(assert (=> b!321432 m!329081))

(declare-fun m!329083 () Bool)

(assert (=> start!32270 m!329083))

(declare-fun m!329085 () Bool)

(assert (=> start!32270 m!329085))

(declare-fun m!329087 () Bool)

(assert (=> b!321438 m!329087))

(check-sat (not b!321431) (not b!321433) (not b!321437) (not b!321429) (not b!321438) (not start!32270) (not b!321434) (not b!321430))
(check-sat)
