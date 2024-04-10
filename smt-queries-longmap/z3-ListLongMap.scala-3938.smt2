; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53640 () Bool)

(assert start!53640)

(declare-fun b!584430 () Bool)

(declare-fun res!372256 () Bool)

(declare-fun e!334649 () Bool)

(assert (=> b!584430 (=> (not res!372256) (not e!334649))))

(declare-datatypes ((array!36541 0))(
  ( (array!36542 (arr!17545 (Array (_ BitVec 32) (_ BitVec 64))) (size!17909 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36541)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36541 (_ BitVec 32)) Bool)

(assert (=> b!584430 (= res!372256 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!584431 () Bool)

(declare-fun e!334647 () Bool)

(assert (=> b!584431 (= e!334647 false)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!265572 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5985 0))(
  ( (MissingZero!5985 (index!26167 (_ BitVec 32))) (Found!5985 (index!26168 (_ BitVec 32))) (Intermediate!5985 (undefined!6797 Bool) (index!26169 (_ BitVec 32)) (x!54998 (_ BitVec 32))) (Undefined!5985) (MissingVacant!5985 (index!26170 (_ BitVec 32))) )
))
(declare-fun lt!265571 () SeekEntryResult!5985)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36541 (_ BitVec 32)) SeekEntryResult!5985)

(assert (=> b!584431 (= lt!265571 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265572 vacantSpotIndex!68 (select (arr!17545 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!584432 () Bool)

(declare-fun res!372250 () Bool)

(assert (=> b!584432 (=> (not res!372250) (not e!334649))))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!584432 (= res!372250 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17545 a!2986) index!984) (select (arr!17545 a!2986) j!136))) (not (= (select (arr!17545 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!584433 () Bool)

(declare-fun res!372251 () Bool)

(declare-fun e!334648 () Bool)

(assert (=> b!584433 (=> (not res!372251) (not e!334648))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!584433 (= res!372251 (validKeyInArray!0 (select (arr!17545 a!2986) j!136)))))

(declare-fun b!584434 () Bool)

(declare-fun res!372254 () Bool)

(assert (=> b!584434 (=> (not res!372254) (not e!334649))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!584434 (= res!372254 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17545 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17545 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!584435 () Bool)

(declare-fun res!372257 () Bool)

(assert (=> b!584435 (=> (not res!372257) (not e!334649))))

(declare-datatypes ((List!11586 0))(
  ( (Nil!11583) (Cons!11582 (h!12627 (_ BitVec 64)) (t!17814 List!11586)) )
))
(declare-fun arrayNoDuplicates!0 (array!36541 (_ BitVec 32) List!11586) Bool)

(assert (=> b!584435 (= res!372257 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11583))))

(declare-fun b!584436 () Bool)

(assert (=> b!584436 (= e!334649 e!334647)))

(declare-fun res!372253 () Bool)

(assert (=> b!584436 (=> (not res!372253) (not e!334647))))

(assert (=> b!584436 (= res!372253 (and (bvsge lt!265572 #b00000000000000000000000000000000) (bvslt lt!265572 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b00000000000000000000000000000000)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!584436 (= lt!265572 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!584437 () Bool)

(declare-fun res!372249 () Bool)

(assert (=> b!584437 (=> (not res!372249) (not e!334648))))

(declare-fun arrayContainsKey!0 (array!36541 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!584437 (= res!372249 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!584438 () Bool)

(declare-fun res!372255 () Bool)

(assert (=> b!584438 (=> (not res!372255) (not e!334649))))

(assert (=> b!584438 (= res!372255 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17545 a!2986) j!136) a!2986 mask!3053) (Found!5985 j!136)))))

(declare-fun b!584439 () Bool)

(declare-fun res!372252 () Bool)

(assert (=> b!584439 (=> (not res!372252) (not e!334648))))

(assert (=> b!584439 (= res!372252 (validKeyInArray!0 k0!1786))))

(declare-fun b!584440 () Bool)

(declare-fun res!372246 () Bool)

(assert (=> b!584440 (=> (not res!372246) (not e!334648))))

(assert (=> b!584440 (= res!372246 (and (= (size!17909 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17909 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17909 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!584441 () Bool)

(assert (=> b!584441 (= e!334648 e!334649)))

(declare-fun res!372247 () Bool)

(assert (=> b!584441 (=> (not res!372247) (not e!334649))))

(declare-fun lt!265573 () SeekEntryResult!5985)

(assert (=> b!584441 (= res!372247 (or (= lt!265573 (MissingZero!5985 i!1108)) (= lt!265573 (MissingVacant!5985 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36541 (_ BitVec 32)) SeekEntryResult!5985)

(assert (=> b!584441 (= lt!265573 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun res!372248 () Bool)

(assert (=> start!53640 (=> (not res!372248) (not e!334648))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53640 (= res!372248 (validMask!0 mask!3053))))

(assert (=> start!53640 e!334648))

(assert (=> start!53640 true))

(declare-fun array_inv!13341 (array!36541) Bool)

(assert (=> start!53640 (array_inv!13341 a!2986)))

(assert (= (and start!53640 res!372248) b!584440))

(assert (= (and b!584440 res!372246) b!584433))

(assert (= (and b!584433 res!372251) b!584439))

(assert (= (and b!584439 res!372252) b!584437))

(assert (= (and b!584437 res!372249) b!584441))

(assert (= (and b!584441 res!372247) b!584430))

(assert (= (and b!584430 res!372256) b!584435))

(assert (= (and b!584435 res!372257) b!584434))

(assert (= (and b!584434 res!372254) b!584438))

(assert (= (and b!584438 res!372255) b!584432))

(assert (= (and b!584432 res!372250) b!584436))

(assert (= (and b!584436 res!372253) b!584431))

(declare-fun m!562785 () Bool)

(assert (=> b!584430 m!562785))

(declare-fun m!562787 () Bool)

(assert (=> b!584438 m!562787))

(assert (=> b!584438 m!562787))

(declare-fun m!562789 () Bool)

(assert (=> b!584438 m!562789))

(assert (=> b!584433 m!562787))

(assert (=> b!584433 m!562787))

(declare-fun m!562791 () Bool)

(assert (=> b!584433 m!562791))

(declare-fun m!562793 () Bool)

(assert (=> b!584434 m!562793))

(declare-fun m!562795 () Bool)

(assert (=> b!584434 m!562795))

(declare-fun m!562797 () Bool)

(assert (=> b!584434 m!562797))

(declare-fun m!562799 () Bool)

(assert (=> start!53640 m!562799))

(declare-fun m!562801 () Bool)

(assert (=> start!53640 m!562801))

(declare-fun m!562803 () Bool)

(assert (=> b!584439 m!562803))

(declare-fun m!562805 () Bool)

(assert (=> b!584437 m!562805))

(declare-fun m!562807 () Bool)

(assert (=> b!584435 m!562807))

(declare-fun m!562809 () Bool)

(assert (=> b!584432 m!562809))

(assert (=> b!584432 m!562787))

(declare-fun m!562811 () Bool)

(assert (=> b!584441 m!562811))

(declare-fun m!562813 () Bool)

(assert (=> b!584436 m!562813))

(assert (=> b!584431 m!562787))

(assert (=> b!584431 m!562787))

(declare-fun m!562815 () Bool)

(assert (=> b!584431 m!562815))

(check-sat (not b!584441) (not b!584437) (not b!584433) (not b!584435) (not b!584431) (not b!584436) (not start!53640) (not b!584439) (not b!584438) (not b!584430))
(check-sat)
