; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53296 () Bool)

(assert start!53296)

(declare-fun b!579510 () Bool)

(declare-fun res!367327 () Bool)

(declare-fun e!333022 () Bool)

(assert (=> b!579510 (=> (not res!367327) (not e!333022))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!579510 (= res!367327 (validKeyInArray!0 k!1786))))

(declare-fun b!579511 () Bool)

(declare-fun res!367332 () Bool)

(assert (=> b!579511 (=> (not res!367332) (not e!333022))))

(declare-datatypes ((array!36197 0))(
  ( (array!36198 (arr!17373 (Array (_ BitVec 32) (_ BitVec 64))) (size!17737 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36197)

(declare-fun arrayContainsKey!0 (array!36197 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!579511 (= res!367332 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!579512 () Bool)

(declare-fun e!333023 () Bool)

(assert (=> b!579512 (= e!333023 false)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5813 0))(
  ( (MissingZero!5813 (index!25479 (_ BitVec 32))) (Found!5813 (index!25480 (_ BitVec 32))) (Intermediate!5813 (undefined!6625 Bool) (index!25481 (_ BitVec 32)) (x!54370 (_ BitVec 32))) (Undefined!5813) (MissingVacant!5813 (index!25482 (_ BitVec 32))) )
))
(declare-fun lt!264498 () SeekEntryResult!5813)

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36197 (_ BitVec 32)) SeekEntryResult!5813)

(assert (=> b!579512 (= lt!264498 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17373 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!579513 () Bool)

(declare-fun res!367329 () Bool)

(assert (=> b!579513 (=> (not res!367329) (not e!333023))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!579513 (= res!367329 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17373 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17373 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!579514 () Bool)

(declare-fun res!367334 () Bool)

(assert (=> b!579514 (=> (not res!367334) (not e!333022))))

(assert (=> b!579514 (= res!367334 (and (= (size!17737 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17737 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17737 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!579515 () Bool)

(assert (=> b!579515 (= e!333022 e!333023)))

(declare-fun res!367331 () Bool)

(assert (=> b!579515 (=> (not res!367331) (not e!333023))))

(declare-fun lt!264499 () SeekEntryResult!5813)

(assert (=> b!579515 (= res!367331 (or (= lt!264499 (MissingZero!5813 i!1108)) (= lt!264499 (MissingVacant!5813 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36197 (_ BitVec 32)) SeekEntryResult!5813)

(assert (=> b!579515 (= lt!264499 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!579517 () Bool)

(declare-fun res!367326 () Bool)

(assert (=> b!579517 (=> (not res!367326) (not e!333023))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36197 (_ BitVec 32)) Bool)

(assert (=> b!579517 (= res!367326 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!579518 () Bool)

(declare-fun res!367328 () Bool)

(assert (=> b!579518 (=> (not res!367328) (not e!333022))))

(assert (=> b!579518 (= res!367328 (validKeyInArray!0 (select (arr!17373 a!2986) j!136)))))

(declare-fun res!367333 () Bool)

(assert (=> start!53296 (=> (not res!367333) (not e!333022))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53296 (= res!367333 (validMask!0 mask!3053))))

(assert (=> start!53296 e!333022))

(assert (=> start!53296 true))

(declare-fun array_inv!13169 (array!36197) Bool)

(assert (=> start!53296 (array_inv!13169 a!2986)))

(declare-fun b!579516 () Bool)

(declare-fun res!367330 () Bool)

(assert (=> b!579516 (=> (not res!367330) (not e!333023))))

(declare-datatypes ((List!11414 0))(
  ( (Nil!11411) (Cons!11410 (h!12455 (_ BitVec 64)) (t!17642 List!11414)) )
))
(declare-fun arrayNoDuplicates!0 (array!36197 (_ BitVec 32) List!11414) Bool)

(assert (=> b!579516 (= res!367330 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11411))))

(assert (= (and start!53296 res!367333) b!579514))

(assert (= (and b!579514 res!367334) b!579518))

(assert (= (and b!579518 res!367328) b!579510))

(assert (= (and b!579510 res!367327) b!579511))

(assert (= (and b!579511 res!367332) b!579515))

(assert (= (and b!579515 res!367331) b!579517))

(assert (= (and b!579517 res!367326) b!579516))

(assert (= (and b!579516 res!367330) b!579513))

(assert (= (and b!579513 res!367329) b!579512))

(declare-fun m!558127 () Bool)

(assert (=> b!579516 m!558127))

(declare-fun m!558129 () Bool)

(assert (=> b!579511 m!558129))

(declare-fun m!558131 () Bool)

(assert (=> b!579517 m!558131))

(declare-fun m!558133 () Bool)

(assert (=> start!53296 m!558133))

(declare-fun m!558135 () Bool)

(assert (=> start!53296 m!558135))

(declare-fun m!558137 () Bool)

(assert (=> b!579515 m!558137))

(declare-fun m!558139 () Bool)

(assert (=> b!579510 m!558139))

(declare-fun m!558141 () Bool)

(assert (=> b!579513 m!558141))

(declare-fun m!558143 () Bool)

(assert (=> b!579513 m!558143))

(declare-fun m!558145 () Bool)

(assert (=> b!579513 m!558145))

(declare-fun m!558147 () Bool)

(assert (=> b!579512 m!558147))

(assert (=> b!579512 m!558147))

(declare-fun m!558149 () Bool)

(assert (=> b!579512 m!558149))

(assert (=> b!579518 m!558147))

(assert (=> b!579518 m!558147))

(declare-fun m!558151 () Bool)

(assert (=> b!579518 m!558151))

(push 1)

(assert (not b!579515))

(assert (not b!579518))

(assert (not b!579512))

(assert (not start!53296))

(assert (not b!579517))

(assert (not b!579510))

(assert (not b!579511))

(assert (not b!579516))

(check-sat)

(pop 1)

