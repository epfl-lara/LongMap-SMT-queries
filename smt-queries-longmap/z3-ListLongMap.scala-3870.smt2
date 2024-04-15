; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53214 () Bool)

(assert start!53214)

(declare-fun b!578339 () Bool)

(declare-fun res!366299 () Bool)

(declare-fun e!332553 () Bool)

(assert (=> b!578339 (=> (not res!366299) (not e!332553))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!578339 (= res!366299 (validKeyInArray!0 k0!1786))))

(declare-fun b!578340 () Bool)

(declare-fun e!332551 () Bool)

(assert (=> b!578340 (= e!332551 false)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5776 0))(
  ( (MissingZero!5776 (index!25331 (_ BitVec 32))) (Found!5776 (index!25332 (_ BitVec 32))) (Intermediate!5776 (undefined!6588 Bool) (index!25333 (_ BitVec 32)) (x!54240 (_ BitVec 32))) (Undefined!5776) (MissingVacant!5776 (index!25334 (_ BitVec 32))) )
))
(declare-fun lt!264075 () SeekEntryResult!5776)

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36129 0))(
  ( (array!36130 (arr!17339 (Array (_ BitVec 32) (_ BitVec 64))) (size!17704 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36129)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36129 (_ BitVec 32)) SeekEntryResult!5776)

(assert (=> b!578340 (= lt!264075 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17339 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!578341 () Bool)

(declare-fun res!366297 () Bool)

(assert (=> b!578341 (=> (not res!366297) (not e!332553))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!578341 (= res!366297 (and (= (size!17704 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17704 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17704 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!578343 () Bool)

(declare-fun res!366300 () Bool)

(assert (=> b!578343 (=> (not res!366300) (not e!332553))))

(assert (=> b!578343 (= res!366300 (validKeyInArray!0 (select (arr!17339 a!2986) j!136)))))

(declare-fun b!578344 () Bool)

(assert (=> b!578344 (= e!332553 e!332551)))

(declare-fun res!366304 () Bool)

(assert (=> b!578344 (=> (not res!366304) (not e!332551))))

(declare-fun lt!264076 () SeekEntryResult!5776)

(assert (=> b!578344 (= res!366304 (or (= lt!264076 (MissingZero!5776 i!1108)) (= lt!264076 (MissingVacant!5776 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36129 (_ BitVec 32)) SeekEntryResult!5776)

(assert (=> b!578344 (= lt!264076 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!578345 () Bool)

(declare-fun res!366298 () Bool)

(assert (=> b!578345 (=> (not res!366298) (not e!332551))))

(assert (=> b!578345 (= res!366298 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17339 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17339 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!578346 () Bool)

(declare-fun res!366302 () Bool)

(assert (=> b!578346 (=> (not res!366302) (not e!332553))))

(declare-fun arrayContainsKey!0 (array!36129 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!578346 (= res!366302 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!578347 () Bool)

(declare-fun res!366305 () Bool)

(assert (=> b!578347 (=> (not res!366305) (not e!332551))))

(declare-datatypes ((List!11419 0))(
  ( (Nil!11416) (Cons!11415 (h!12460 (_ BitVec 64)) (t!17638 List!11419)) )
))
(declare-fun arrayNoDuplicates!0 (array!36129 (_ BitVec 32) List!11419) Bool)

(assert (=> b!578347 (= res!366305 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11416))))

(declare-fun res!366303 () Bool)

(assert (=> start!53214 (=> (not res!366303) (not e!332553))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53214 (= res!366303 (validMask!0 mask!3053))))

(assert (=> start!53214 e!332553))

(assert (=> start!53214 true))

(declare-fun array_inv!13222 (array!36129) Bool)

(assert (=> start!53214 (array_inv!13222 a!2986)))

(declare-fun b!578342 () Bool)

(declare-fun res!366301 () Bool)

(assert (=> b!578342 (=> (not res!366301) (not e!332551))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36129 (_ BitVec 32)) Bool)

(assert (=> b!578342 (= res!366301 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(assert (= (and start!53214 res!366303) b!578341))

(assert (= (and b!578341 res!366297) b!578343))

(assert (= (and b!578343 res!366300) b!578339))

(assert (= (and b!578339 res!366299) b!578346))

(assert (= (and b!578346 res!366302) b!578344))

(assert (= (and b!578344 res!366304) b!578342))

(assert (= (and b!578342 res!366301) b!578347))

(assert (= (and b!578347 res!366305) b!578345))

(assert (= (and b!578345 res!366298) b!578340))

(declare-fun m!556483 () Bool)

(assert (=> b!578342 m!556483))

(declare-fun m!556485 () Bool)

(assert (=> b!578343 m!556485))

(assert (=> b!578343 m!556485))

(declare-fun m!556487 () Bool)

(assert (=> b!578343 m!556487))

(declare-fun m!556489 () Bool)

(assert (=> b!578344 m!556489))

(assert (=> b!578340 m!556485))

(assert (=> b!578340 m!556485))

(declare-fun m!556491 () Bool)

(assert (=> b!578340 m!556491))

(declare-fun m!556493 () Bool)

(assert (=> b!578339 m!556493))

(declare-fun m!556495 () Bool)

(assert (=> b!578347 m!556495))

(declare-fun m!556497 () Bool)

(assert (=> b!578345 m!556497))

(declare-fun m!556499 () Bool)

(assert (=> b!578345 m!556499))

(declare-fun m!556501 () Bool)

(assert (=> b!578345 m!556501))

(declare-fun m!556503 () Bool)

(assert (=> b!578346 m!556503))

(declare-fun m!556505 () Bool)

(assert (=> start!53214 m!556505))

(declare-fun m!556507 () Bool)

(assert (=> start!53214 m!556507))

(check-sat (not b!578346) (not b!578347) (not b!578339) (not b!578342) (not b!578344) (not b!578343) (not b!578340) (not start!53214))
(check-sat)
