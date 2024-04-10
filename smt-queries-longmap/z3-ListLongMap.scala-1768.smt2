; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32256 () Bool)

(assert start!32256)

(declare-datatypes ((array!16446 0))(
  ( (array!16447 (arr!7782 (Array (_ BitVec 32) (_ BitVec 64))) (size!8134 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16446)

(declare-fun e!199132 () Bool)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun b!321306 () Bool)

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun mask!3777 () (_ BitVec 32))

(assert (=> b!321306 (= e!199132 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7782 a!3305) index!1840) k0!2497)) (= x!1490 resX!58) (not (= resIndex!58 index!1840)) (not (= (select (arr!7782 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7782 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt mask!3777 #b00000000000000000000000000000000)))))

(declare-fun b!321307 () Bool)

(declare-fun res!175433 () Bool)

(declare-fun e!199131 () Bool)

(assert (=> b!321307 (=> (not res!175433) (not e!199131))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!321307 (= res!175433 (validKeyInArray!0 k0!2497))))

(declare-fun b!321308 () Bool)

(declare-fun res!175434 () Bool)

(assert (=> b!321308 (=> (not res!175434) (not e!199132))))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!321308 (= res!175434 (and (= (select (arr!7782 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8134 a!3305))))))

(declare-fun b!321309 () Bool)

(declare-fun res!175427 () Bool)

(assert (=> b!321309 (=> (not res!175427) (not e!199131))))

(assert (=> b!321309 (= res!175427 (and (= (size!8134 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8134 a!3305))))))

(declare-fun b!321310 () Bool)

(declare-fun res!175431 () Bool)

(assert (=> b!321310 (=> (not res!175431) (not e!199131))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16446 (_ BitVec 32)) Bool)

(assert (=> b!321310 (= res!175431 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun res!175426 () Bool)

(assert (=> start!32256 (=> (not res!175426) (not e!199131))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32256 (= res!175426 (validMask!0 mask!3777))))

(assert (=> start!32256 e!199131))

(declare-fun array_inv!5745 (array!16446) Bool)

(assert (=> start!32256 (array_inv!5745 a!3305)))

(assert (=> start!32256 true))

(declare-fun b!321311 () Bool)

(assert (=> b!321311 (= e!199131 e!199132)))

(declare-fun res!175430 () Bool)

(assert (=> b!321311 (=> (not res!175430) (not e!199132))))

(declare-datatypes ((SeekEntryResult!2913 0))(
  ( (MissingZero!2913 (index!13828 (_ BitVec 32))) (Found!2913 (index!13829 (_ BitVec 32))) (Intermediate!2913 (undefined!3725 Bool) (index!13830 (_ BitVec 32)) (x!32092 (_ BitVec 32))) (Undefined!2913) (MissingVacant!2913 (index!13831 (_ BitVec 32))) )
))
(declare-fun lt!156180 () SeekEntryResult!2913)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16446 (_ BitVec 32)) SeekEntryResult!2913)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!321311 (= res!175430 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!156180))))

(assert (=> b!321311 (= lt!156180 (Intermediate!2913 false resIndex!58 resX!58))))

(declare-fun b!321312 () Bool)

(declare-fun res!175432 () Bool)

(assert (=> b!321312 (=> (not res!175432) (not e!199131))))

(declare-fun arrayContainsKey!0 (array!16446 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!321312 (= res!175432 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!321313 () Bool)

(declare-fun res!175429 () Bool)

(assert (=> b!321313 (=> (not res!175429) (not e!199131))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16446 (_ BitVec 32)) SeekEntryResult!2913)

(assert (=> b!321313 (= res!175429 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!2913 i!1250)))))

(declare-fun b!321314 () Bool)

(declare-fun res!175428 () Bool)

(assert (=> b!321314 (=> (not res!175428) (not e!199132))))

(assert (=> b!321314 (= res!175428 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!156180))))

(assert (= (and start!32256 res!175426) b!321309))

(assert (= (and b!321309 res!175427) b!321307))

(assert (= (and b!321307 res!175433) b!321312))

(assert (= (and b!321312 res!175432) b!321313))

(assert (= (and b!321313 res!175429) b!321310))

(assert (= (and b!321310 res!175431) b!321311))

(assert (= (and b!321311 res!175430) b!321308))

(assert (= (and b!321308 res!175434) b!321314))

(assert (= (and b!321314 res!175428) b!321306))

(declare-fun m!329475 () Bool)

(assert (=> b!321311 m!329475))

(assert (=> b!321311 m!329475))

(declare-fun m!329477 () Bool)

(assert (=> b!321311 m!329477))

(declare-fun m!329479 () Bool)

(assert (=> b!321310 m!329479))

(declare-fun m!329481 () Bool)

(assert (=> b!321308 m!329481))

(declare-fun m!329483 () Bool)

(assert (=> b!321313 m!329483))

(declare-fun m!329485 () Bool)

(assert (=> b!321307 m!329485))

(declare-fun m!329487 () Bool)

(assert (=> start!32256 m!329487))

(declare-fun m!329489 () Bool)

(assert (=> start!32256 m!329489))

(declare-fun m!329491 () Bool)

(assert (=> b!321312 m!329491))

(declare-fun m!329493 () Bool)

(assert (=> b!321306 m!329493))

(declare-fun m!329495 () Bool)

(assert (=> b!321314 m!329495))

(check-sat (not b!321311) (not b!321310) (not b!321313) (not b!321312) (not b!321307) (not start!32256) (not b!321314))
(check-sat)
