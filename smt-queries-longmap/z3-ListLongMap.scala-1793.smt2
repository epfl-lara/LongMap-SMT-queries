; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32460 () Bool)

(assert start!32460)

(declare-fun res!177686 () Bool)

(declare-fun e!200254 () Bool)

(assert (=> start!32460 (=> (not res!177686) (not e!200254))))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32460 (= res!177686 (validMask!0 mask!3777))))

(assert (=> start!32460 e!200254))

(declare-datatypes ((array!16599 0))(
  ( (array!16600 (arr!7857 (Array (_ BitVec 32) (_ BitVec 64))) (size!8209 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16599)

(declare-fun array_inv!5820 (array!16599) Bool)

(assert (=> start!32460 (array_inv!5820 a!3305)))

(assert (=> start!32460 true))

(declare-fun b!324353 () Bool)

(declare-fun res!177691 () Bool)

(assert (=> b!324353 (=> (not res!177691) (not e!200254))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16599 (_ BitVec 32)) Bool)

(assert (=> b!324353 (= res!177691 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!324354 () Bool)

(declare-fun e!200252 () Bool)

(assert (=> b!324354 (= e!200252 false)))

(declare-fun lt!156785 () (_ BitVec 32))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!324354 (= lt!156785 (nextIndex!0 index!1840 x!1490 mask!3777))))

(declare-fun b!324355 () Bool)

(declare-fun res!177685 () Bool)

(assert (=> b!324355 (=> (not res!177685) (not e!200252))))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!324355 (= res!177685 (and (= (select (arr!7857 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8209 a!3305))))))

(declare-fun b!324356 () Bool)

(declare-fun res!177690 () Bool)

(assert (=> b!324356 (=> (not res!177690) (not e!200254))))

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!324356 (= res!177690 (validKeyInArray!0 k0!2497))))

(declare-fun b!324357 () Bool)

(declare-fun res!177693 () Bool)

(assert (=> b!324357 (=> (not res!177693) (not e!200254))))

(declare-fun arrayContainsKey!0 (array!16599 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!324357 (= res!177693 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!324358 () Bool)

(declare-fun res!177684 () Bool)

(assert (=> b!324358 (=> (not res!177684) (not e!200254))))

(assert (=> b!324358 (= res!177684 (and (= (size!8209 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8209 a!3305))))))

(declare-fun b!324359 () Bool)

(declare-fun res!177689 () Bool)

(assert (=> b!324359 (=> (not res!177689) (not e!200254))))

(declare-datatypes ((SeekEntryResult!2988 0))(
  ( (MissingZero!2988 (index!14128 (_ BitVec 32))) (Found!2988 (index!14129 (_ BitVec 32))) (Intermediate!2988 (undefined!3800 Bool) (index!14130 (_ BitVec 32)) (x!32376 (_ BitVec 32))) (Undefined!2988) (MissingVacant!2988 (index!14131 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16599 (_ BitVec 32)) SeekEntryResult!2988)

(assert (=> b!324359 (= res!177689 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!2988 i!1250)))))

(declare-fun b!324360 () Bool)

(declare-fun res!177692 () Bool)

(assert (=> b!324360 (=> (not res!177692) (not e!200252))))

(declare-fun lt!156786 () SeekEntryResult!2988)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16599 (_ BitVec 32)) SeekEntryResult!2988)

(assert (=> b!324360 (= res!177692 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!156786))))

(declare-fun b!324361 () Bool)

(declare-fun res!177688 () Bool)

(assert (=> b!324361 (=> (not res!177688) (not e!200252))))

(assert (=> b!324361 (= res!177688 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7857 a!3305) index!1840) k0!2497)) (not (= x!1490 resX!58))))))

(declare-fun b!324362 () Bool)

(assert (=> b!324362 (= e!200254 e!200252)))

(declare-fun res!177687 () Bool)

(assert (=> b!324362 (=> (not res!177687) (not e!200252))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!324362 (= res!177687 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!156786))))

(assert (=> b!324362 (= lt!156786 (Intermediate!2988 false resIndex!58 resX!58))))

(assert (= (and start!32460 res!177686) b!324358))

(assert (= (and b!324358 res!177684) b!324356))

(assert (= (and b!324356 res!177690) b!324357))

(assert (= (and b!324357 res!177693) b!324359))

(assert (= (and b!324359 res!177689) b!324353))

(assert (= (and b!324353 res!177691) b!324362))

(assert (= (and b!324362 res!177687) b!324355))

(assert (= (and b!324355 res!177685) b!324360))

(assert (= (and b!324360 res!177692) b!324361))

(assert (= (and b!324361 res!177688) b!324354))

(declare-fun m!331415 () Bool)

(assert (=> b!324354 m!331415))

(declare-fun m!331417 () Bool)

(assert (=> start!32460 m!331417))

(declare-fun m!331419 () Bool)

(assert (=> start!32460 m!331419))

(declare-fun m!331421 () Bool)

(assert (=> b!324355 m!331421))

(declare-fun m!331423 () Bool)

(assert (=> b!324360 m!331423))

(declare-fun m!331425 () Bool)

(assert (=> b!324353 m!331425))

(declare-fun m!331427 () Bool)

(assert (=> b!324357 m!331427))

(declare-fun m!331429 () Bool)

(assert (=> b!324361 m!331429))

(declare-fun m!331431 () Bool)

(assert (=> b!324362 m!331431))

(assert (=> b!324362 m!331431))

(declare-fun m!331433 () Bool)

(assert (=> b!324362 m!331433))

(declare-fun m!331435 () Bool)

(assert (=> b!324359 m!331435))

(declare-fun m!331437 () Bool)

(assert (=> b!324356 m!331437))

(check-sat (not start!32460) (not b!324359) (not b!324362) (not b!324360) (not b!324354) (not b!324356) (not b!324353) (not b!324357))
(check-sat)
