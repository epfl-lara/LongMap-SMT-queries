; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53394 () Bool)

(assert start!53394)

(declare-fun b!580358 () Bool)

(declare-fun e!333368 () Bool)

(declare-fun e!333369 () Bool)

(assert (=> b!580358 (= e!333368 e!333369)))

(declare-fun res!368074 () Bool)

(assert (=> b!580358 (=> (not res!368074) (not e!333369))))

(declare-datatypes ((SeekEntryResult!5788 0))(
  ( (MissingZero!5788 (index!25379 (_ BitVec 32))) (Found!5788 (index!25380 (_ BitVec 32))) (Intermediate!5788 (undefined!6600 Bool) (index!25381 (_ BitVec 32)) (x!54412 (_ BitVec 32))) (Undefined!5788) (MissingVacant!5788 (index!25382 (_ BitVec 32))) )
))
(declare-fun lt!264754 () SeekEntryResult!5788)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!580358 (= res!368074 (or (= lt!264754 (MissingZero!5788 i!1108)) (= lt!264754 (MissingVacant!5788 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-datatypes ((array!36240 0))(
  ( (array!36241 (arr!17392 (Array (_ BitVec 32) (_ BitVec 64))) (size!17756 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36240)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36240 (_ BitVec 32)) SeekEntryResult!5788)

(assert (=> b!580358 (= lt!264754 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!580359 () Bool)

(declare-fun res!368072 () Bool)

(assert (=> b!580359 (=> (not res!368072) (not e!333369))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36240 (_ BitVec 32)) Bool)

(assert (=> b!580359 (= res!368072 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun res!368076 () Bool)

(assert (=> start!53394 (=> (not res!368076) (not e!333368))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53394 (= res!368076 (validMask!0 mask!3053))))

(assert (=> start!53394 e!333368))

(assert (=> start!53394 true))

(declare-fun array_inv!13251 (array!36240) Bool)

(assert (=> start!53394 (array_inv!13251 a!2986)))

(declare-fun b!580360 () Bool)

(assert (=> b!580360 (= e!333369 false)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun lt!264753 () SeekEntryResult!5788)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36240 (_ BitVec 32)) SeekEntryResult!5788)

(assert (=> b!580360 (= lt!264753 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17392 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!580361 () Bool)

(declare-fun res!368073 () Bool)

(assert (=> b!580361 (=> (not res!368073) (not e!333369))))

(assert (=> b!580361 (= res!368073 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17392 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17392 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!580362 () Bool)

(declare-fun res!368070 () Bool)

(assert (=> b!580362 (=> (not res!368070) (not e!333368))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!580362 (= res!368070 (validKeyInArray!0 (select (arr!17392 a!2986) j!136)))))

(declare-fun b!580363 () Bool)

(declare-fun res!368075 () Bool)

(assert (=> b!580363 (=> (not res!368075) (not e!333369))))

(declare-datatypes ((List!11340 0))(
  ( (Nil!11337) (Cons!11336 (h!12384 (_ BitVec 64)) (t!17560 List!11340)) )
))
(declare-fun arrayNoDuplicates!0 (array!36240 (_ BitVec 32) List!11340) Bool)

(assert (=> b!580363 (= res!368075 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11337))))

(declare-fun b!580364 () Bool)

(declare-fun res!368077 () Bool)

(assert (=> b!580364 (=> (not res!368077) (not e!333368))))

(declare-fun arrayContainsKey!0 (array!36240 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!580364 (= res!368077 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!580365 () Bool)

(declare-fun res!368069 () Bool)

(assert (=> b!580365 (=> (not res!368069) (not e!333368))))

(assert (=> b!580365 (= res!368069 (validKeyInArray!0 k0!1786))))

(declare-fun b!580366 () Bool)

(declare-fun res!368071 () Bool)

(assert (=> b!580366 (=> (not res!368071) (not e!333368))))

(assert (=> b!580366 (= res!368071 (and (= (size!17756 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17756 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17756 a!2986)) (not (= i!1108 j!136))))))

(assert (= (and start!53394 res!368076) b!580366))

(assert (= (and b!580366 res!368071) b!580362))

(assert (= (and b!580362 res!368070) b!580365))

(assert (= (and b!580365 res!368069) b!580364))

(assert (= (and b!580364 res!368077) b!580358))

(assert (= (and b!580358 res!368074) b!580359))

(assert (= (and b!580359 res!368072) b!580363))

(assert (= (and b!580363 res!368075) b!580361))

(assert (= (and b!580361 res!368073) b!580360))

(declare-fun m!559103 () Bool)

(assert (=> b!580364 m!559103))

(declare-fun m!559105 () Bool)

(assert (=> start!53394 m!559105))

(declare-fun m!559107 () Bool)

(assert (=> start!53394 m!559107))

(declare-fun m!559109 () Bool)

(assert (=> b!580358 m!559109))

(declare-fun m!559111 () Bool)

(assert (=> b!580361 m!559111))

(declare-fun m!559113 () Bool)

(assert (=> b!580361 m!559113))

(declare-fun m!559115 () Bool)

(assert (=> b!580361 m!559115))

(declare-fun m!559117 () Bool)

(assert (=> b!580362 m!559117))

(assert (=> b!580362 m!559117))

(declare-fun m!559119 () Bool)

(assert (=> b!580362 m!559119))

(declare-fun m!559121 () Bool)

(assert (=> b!580359 m!559121))

(assert (=> b!580360 m!559117))

(assert (=> b!580360 m!559117))

(declare-fun m!559123 () Bool)

(assert (=> b!580360 m!559123))

(declare-fun m!559125 () Bool)

(assert (=> b!580365 m!559125))

(declare-fun m!559127 () Bool)

(assert (=> b!580363 m!559127))

(check-sat (not b!580359) (not b!580364) (not b!580358) (not b!580363) (not b!580360) (not b!580362) (not start!53394) (not b!580365))
(check-sat)
