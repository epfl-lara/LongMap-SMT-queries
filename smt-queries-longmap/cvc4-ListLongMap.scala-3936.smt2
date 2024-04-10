; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53630 () Bool)

(assert start!53630)

(declare-fun b!584250 () Bool)

(declare-fun res!372075 () Bool)

(declare-fun e!334588 () Bool)

(assert (=> b!584250 (=> (not res!372075) (not e!334588))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36531 0))(
  ( (array!36532 (arr!17540 (Array (_ BitVec 32) (_ BitVec 64))) (size!17904 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36531)

(assert (=> b!584250 (= res!372075 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17540 a!2986) index!984) (select (arr!17540 a!2986) j!136))) (not (= (select (arr!17540 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!584251 () Bool)

(declare-fun e!334587 () Bool)

(assert (=> b!584251 (= e!334587 false)))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun lt!265527 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5980 0))(
  ( (MissingZero!5980 (index!26147 (_ BitVec 32))) (Found!5980 (index!26148 (_ BitVec 32))) (Intermediate!5980 (undefined!6792 Bool) (index!26149 (_ BitVec 32)) (x!54977 (_ BitVec 32))) (Undefined!5980) (MissingVacant!5980 (index!26150 (_ BitVec 32))) )
))
(declare-fun lt!265526 () SeekEntryResult!5980)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36531 (_ BitVec 32)) SeekEntryResult!5980)

(assert (=> b!584251 (= lt!265526 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265527 vacantSpotIndex!68 (select (arr!17540 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!584252 () Bool)

(assert (=> b!584252 (= e!334588 e!334587)))

(declare-fun res!372069 () Bool)

(assert (=> b!584252 (=> (not res!372069) (not e!334587))))

(assert (=> b!584252 (= res!372069 (and (bvsge lt!265527 #b00000000000000000000000000000000) (bvslt lt!265527 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b00000000000000000000000000000000)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!584252 (= lt!265527 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!584253 () Bool)

(declare-fun e!334590 () Bool)

(assert (=> b!584253 (= e!334590 e!334588)))

(declare-fun res!372072 () Bool)

(assert (=> b!584253 (=> (not res!372072) (not e!334588))))

(declare-fun lt!265528 () SeekEntryResult!5980)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!584253 (= res!372072 (or (= lt!265528 (MissingZero!5980 i!1108)) (= lt!265528 (MissingVacant!5980 i!1108))))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36531 (_ BitVec 32)) SeekEntryResult!5980)

(assert (=> b!584253 (= lt!265528 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!584254 () Bool)

(declare-fun res!372070 () Bool)

(assert (=> b!584254 (=> (not res!372070) (not e!334590))))

(assert (=> b!584254 (= res!372070 (and (= (size!17904 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17904 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17904 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!584255 () Bool)

(declare-fun res!372076 () Bool)

(assert (=> b!584255 (=> (not res!372076) (not e!334590))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!584255 (= res!372076 (validKeyInArray!0 k!1786))))

(declare-fun b!584256 () Bool)

(declare-fun res!372067 () Bool)

(assert (=> b!584256 (=> (not res!372067) (not e!334588))))

(assert (=> b!584256 (= res!372067 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17540 a!2986) j!136) a!2986 mask!3053) (Found!5980 j!136)))))

(declare-fun b!584257 () Bool)

(declare-fun res!372068 () Bool)

(assert (=> b!584257 (=> (not res!372068) (not e!334588))))

(declare-datatypes ((List!11581 0))(
  ( (Nil!11578) (Cons!11577 (h!12622 (_ BitVec 64)) (t!17809 List!11581)) )
))
(declare-fun arrayNoDuplicates!0 (array!36531 (_ BitVec 32) List!11581) Bool)

(assert (=> b!584257 (= res!372068 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11578))))

(declare-fun b!584258 () Bool)

(declare-fun res!372073 () Bool)

(assert (=> b!584258 (=> (not res!372073) (not e!334588))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36531 (_ BitVec 32)) Bool)

(assert (=> b!584258 (= res!372073 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!584260 () Bool)

(declare-fun res!372074 () Bool)

(assert (=> b!584260 (=> (not res!372074) (not e!334588))))

(assert (=> b!584260 (= res!372074 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17540 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17540 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!584261 () Bool)

(declare-fun res!372071 () Bool)

(assert (=> b!584261 (=> (not res!372071) (not e!334590))))

(declare-fun arrayContainsKey!0 (array!36531 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!584261 (= res!372071 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun res!372077 () Bool)

(assert (=> start!53630 (=> (not res!372077) (not e!334590))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53630 (= res!372077 (validMask!0 mask!3053))))

(assert (=> start!53630 e!334590))

(assert (=> start!53630 true))

(declare-fun array_inv!13336 (array!36531) Bool)

(assert (=> start!53630 (array_inv!13336 a!2986)))

(declare-fun b!584259 () Bool)

(declare-fun res!372066 () Bool)

(assert (=> b!584259 (=> (not res!372066) (not e!334590))))

(assert (=> b!584259 (= res!372066 (validKeyInArray!0 (select (arr!17540 a!2986) j!136)))))

(assert (= (and start!53630 res!372077) b!584254))

(assert (= (and b!584254 res!372070) b!584259))

(assert (= (and b!584259 res!372066) b!584255))

(assert (= (and b!584255 res!372076) b!584261))

(assert (= (and b!584261 res!372071) b!584253))

(assert (= (and b!584253 res!372072) b!584258))

(assert (= (and b!584258 res!372073) b!584257))

(assert (= (and b!584257 res!372068) b!584260))

(assert (= (and b!584260 res!372074) b!584256))

(assert (= (and b!584256 res!372067) b!584250))

(assert (= (and b!584250 res!372075) b!584252))

(assert (= (and b!584252 res!372069) b!584251))

(declare-fun m!562625 () Bool)

(assert (=> b!584256 m!562625))

(assert (=> b!584256 m!562625))

(declare-fun m!562627 () Bool)

(assert (=> b!584256 m!562627))

(assert (=> b!584251 m!562625))

(assert (=> b!584251 m!562625))

(declare-fun m!562629 () Bool)

(assert (=> b!584251 m!562629))

(declare-fun m!562631 () Bool)

(assert (=> b!584257 m!562631))

(declare-fun m!562633 () Bool)

(assert (=> b!584253 m!562633))

(declare-fun m!562635 () Bool)

(assert (=> start!53630 m!562635))

(declare-fun m!562637 () Bool)

(assert (=> start!53630 m!562637))

(declare-fun m!562639 () Bool)

(assert (=> b!584255 m!562639))

(declare-fun m!562641 () Bool)

(assert (=> b!584261 m!562641))

(declare-fun m!562643 () Bool)

(assert (=> b!584258 m!562643))

(declare-fun m!562645 () Bool)

(assert (=> b!584250 m!562645))

(assert (=> b!584250 m!562625))

(declare-fun m!562647 () Bool)

(assert (=> b!584260 m!562647))

(declare-fun m!562649 () Bool)

(assert (=> b!584260 m!562649))

(declare-fun m!562651 () Bool)

(assert (=> b!584260 m!562651))

(declare-fun m!562653 () Bool)

(assert (=> b!584252 m!562653))

(assert (=> b!584259 m!562625))

(assert (=> b!584259 m!562625))

(declare-fun m!562655 () Bool)

(assert (=> b!584259 m!562655))

(push 1)

(assert (not b!584259))

(assert (not b!584252))

(assert (not b!584255))

(assert (not start!53630))

(assert (not b!584251))

(assert (not b!584253))

(assert (not b!584258))

(assert (not b!584261))

(assert (not b!584256))

(assert (not b!584257))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

