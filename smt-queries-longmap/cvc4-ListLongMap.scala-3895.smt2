; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53384 () Bool)

(assert start!53384)

(declare-fun b!580706 () Bool)

(declare-fun res!368523 () Bool)

(declare-fun e!333420 () Bool)

(assert (=> b!580706 (=> (not res!368523) (not e!333420))))

(declare-datatypes ((array!36285 0))(
  ( (array!36286 (arr!17417 (Array (_ BitVec 32) (_ BitVec 64))) (size!17781 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36285)

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36285 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!580706 (= res!368523 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun res!368529 () Bool)

(assert (=> start!53384 (=> (not res!368529) (not e!333420))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53384 (= res!368529 (validMask!0 mask!3053))))

(assert (=> start!53384 e!333420))

(assert (=> start!53384 true))

(declare-fun array_inv!13213 (array!36285) Bool)

(assert (=> start!53384 (array_inv!13213 a!2986)))

(declare-fun b!580707 () Bool)

(declare-fun res!368525 () Bool)

(declare-fun e!333418 () Bool)

(assert (=> b!580707 (=> (not res!368525) (not e!333418))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36285 (_ BitVec 32)) Bool)

(assert (=> b!580707 (= res!368525 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!580708 () Bool)

(declare-fun res!368531 () Bool)

(assert (=> b!580708 (=> (not res!368531) (not e!333418))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5857 0))(
  ( (MissingZero!5857 (index!25655 (_ BitVec 32))) (Found!5857 (index!25656 (_ BitVec 32))) (Intermediate!5857 (undefined!6669 Bool) (index!25657 (_ BitVec 32)) (x!54526 (_ BitVec 32))) (Undefined!5857) (MissingVacant!5857 (index!25658 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36285 (_ BitVec 32)) SeekEntryResult!5857)

(assert (=> b!580708 (= res!368531 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17417 a!2986) j!136) a!2986 mask!3053) (Found!5857 j!136)))))

(declare-fun b!580709 () Bool)

(declare-fun res!368524 () Bool)

(assert (=> b!580709 (=> (not res!368524) (not e!333418))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!580709 (= res!368524 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17417 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17417 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!580710 () Bool)

(declare-fun res!368530 () Bool)

(assert (=> b!580710 (=> (not res!368530) (not e!333420))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!580710 (= res!368530 (validKeyInArray!0 k!1786))))

(declare-fun b!580711 () Bool)

(assert (=> b!580711 (= e!333418 (and (bvslt x!910 #b01111111111111111111111111111110) (= (select (arr!17417 a!2986) index!984) (select (arr!17417 a!2986) j!136)) (= index!984 j!136) (bvslt mask!3053 #b00000000000000000000000000000000)))))

(declare-fun b!580712 () Bool)

(declare-fun res!368526 () Bool)

(assert (=> b!580712 (=> (not res!368526) (not e!333418))))

(declare-datatypes ((List!11458 0))(
  ( (Nil!11455) (Cons!11454 (h!12499 (_ BitVec 64)) (t!17686 List!11458)) )
))
(declare-fun arrayNoDuplicates!0 (array!36285 (_ BitVec 32) List!11458) Bool)

(assert (=> b!580712 (= res!368526 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11455))))

(declare-fun b!580713 () Bool)

(declare-fun res!368522 () Bool)

(assert (=> b!580713 (=> (not res!368522) (not e!333420))))

(assert (=> b!580713 (= res!368522 (validKeyInArray!0 (select (arr!17417 a!2986) j!136)))))

(declare-fun b!580714 () Bool)

(declare-fun res!368527 () Bool)

(assert (=> b!580714 (=> (not res!368527) (not e!333420))))

(assert (=> b!580714 (= res!368527 (and (= (size!17781 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17781 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17781 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!580715 () Bool)

(assert (=> b!580715 (= e!333420 e!333418)))

(declare-fun res!368528 () Bool)

(assert (=> b!580715 (=> (not res!368528) (not e!333418))))

(declare-fun lt!264754 () SeekEntryResult!5857)

(assert (=> b!580715 (= res!368528 (or (= lt!264754 (MissingZero!5857 i!1108)) (= lt!264754 (MissingVacant!5857 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36285 (_ BitVec 32)) SeekEntryResult!5857)

(assert (=> b!580715 (= lt!264754 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(assert (= (and start!53384 res!368529) b!580714))

(assert (= (and b!580714 res!368527) b!580713))

(assert (= (and b!580713 res!368522) b!580710))

(assert (= (and b!580710 res!368530) b!580706))

(assert (= (and b!580706 res!368523) b!580715))

(assert (= (and b!580715 res!368528) b!580707))

(assert (= (and b!580707 res!368525) b!580712))

(assert (= (and b!580712 res!368526) b!580709))

(assert (= (and b!580709 res!368524) b!580708))

(assert (= (and b!580708 res!368531) b!580711))

(declare-fun m!559275 () Bool)

(assert (=> b!580706 m!559275))

(declare-fun m!559277 () Bool)

(assert (=> b!580713 m!559277))

(assert (=> b!580713 m!559277))

(declare-fun m!559279 () Bool)

(assert (=> b!580713 m!559279))

(declare-fun m!559281 () Bool)

(assert (=> b!580707 m!559281))

(declare-fun m!559283 () Bool)

(assert (=> start!53384 m!559283))

(declare-fun m!559285 () Bool)

(assert (=> start!53384 m!559285))

(declare-fun m!559287 () Bool)

(assert (=> b!580709 m!559287))

(declare-fun m!559289 () Bool)

(assert (=> b!580709 m!559289))

(declare-fun m!559291 () Bool)

(assert (=> b!580709 m!559291))

(declare-fun m!559293 () Bool)

(assert (=> b!580712 m!559293))

(declare-fun m!559295 () Bool)

(assert (=> b!580710 m!559295))

(declare-fun m!559297 () Bool)

(assert (=> b!580711 m!559297))

(assert (=> b!580711 m!559277))

(assert (=> b!580708 m!559277))

(assert (=> b!580708 m!559277))

(declare-fun m!559299 () Bool)

(assert (=> b!580708 m!559299))

(declare-fun m!559301 () Bool)

(assert (=> b!580715 m!559301))

(push 1)

(assert (not b!580707))

(assert (not b!580713))

(assert (not b!580710))

(assert (not b!580708))

(assert (not start!53384))

(assert (not b!580712))

(assert (not b!580715))

(assert (not b!580706))

(check-sat)

(pop 1)

