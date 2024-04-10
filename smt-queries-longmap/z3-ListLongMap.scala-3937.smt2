; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53634 () Bool)

(assert start!53634)

(declare-fun b!584322 () Bool)

(declare-fun res!372146 () Bool)

(declare-fun e!334611 () Bool)

(assert (=> b!584322 (=> (not res!372146) (not e!334611))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!36535 0))(
  ( (array!36536 (arr!17542 (Array (_ BitVec 32) (_ BitVec 64))) (size!17906 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36535)

(assert (=> b!584322 (= res!372146 (and (= (size!17906 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17906 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17906 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!584323 () Bool)

(declare-fun res!372148 () Bool)

(assert (=> b!584323 (=> (not res!372148) (not e!334611))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!584323 (= res!372148 (validKeyInArray!0 (select (arr!17542 a!2986) j!136)))))

(declare-fun b!584324 () Bool)

(declare-fun res!372145 () Bool)

(assert (=> b!584324 (=> (not res!372145) (not e!334611))))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!584324 (= res!372145 (validKeyInArray!0 k0!1786))))

(declare-fun b!584325 () Bool)

(declare-fun res!372143 () Bool)

(declare-fun e!334614 () Bool)

(assert (=> b!584325 (=> (not res!372143) (not e!334614))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!584325 (= res!372143 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17542 a!2986) index!984) (select (arr!17542 a!2986) j!136))) (not (= (select (arr!17542 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!584327 () Bool)

(declare-fun e!334613 () Bool)

(assert (=> b!584327 (= e!334614 e!334613)))

(declare-fun res!372138 () Bool)

(assert (=> b!584327 (=> (not res!372138) (not e!334613))))

(declare-fun lt!265544 () (_ BitVec 32))

(assert (=> b!584327 (= res!372138 (and (bvsge lt!265544 #b00000000000000000000000000000000) (bvslt lt!265544 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b00000000000000000000000000000000)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!584327 (= lt!265544 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!584328 () Bool)

(assert (=> b!584328 (= e!334611 e!334614)))

(declare-fun res!372142 () Bool)

(assert (=> b!584328 (=> (not res!372142) (not e!334614))))

(declare-datatypes ((SeekEntryResult!5982 0))(
  ( (MissingZero!5982 (index!26155 (_ BitVec 32))) (Found!5982 (index!26156 (_ BitVec 32))) (Intermediate!5982 (undefined!6794 Bool) (index!26157 (_ BitVec 32)) (x!54987 (_ BitVec 32))) (Undefined!5982) (MissingVacant!5982 (index!26158 (_ BitVec 32))) )
))
(declare-fun lt!265546 () SeekEntryResult!5982)

(assert (=> b!584328 (= res!372142 (or (= lt!265546 (MissingZero!5982 i!1108)) (= lt!265546 (MissingVacant!5982 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36535 (_ BitVec 32)) SeekEntryResult!5982)

(assert (=> b!584328 (= lt!265546 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!584329 () Bool)

(declare-fun res!372139 () Bool)

(assert (=> b!584329 (=> (not res!372139) (not e!334614))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36535 (_ BitVec 32)) Bool)

(assert (=> b!584329 (= res!372139 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!584330 () Bool)

(declare-fun res!372147 () Bool)

(assert (=> b!584330 (=> (not res!372147) (not e!334614))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36535 (_ BitVec 32)) SeekEntryResult!5982)

(assert (=> b!584330 (= res!372147 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17542 a!2986) j!136) a!2986 mask!3053) (Found!5982 j!136)))))

(declare-fun b!584331 () Bool)

(declare-fun res!372144 () Bool)

(assert (=> b!584331 (=> (not res!372144) (not e!334614))))

(assert (=> b!584331 (= res!372144 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17542 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17542 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!584332 () Bool)

(declare-fun res!372149 () Bool)

(assert (=> b!584332 (=> (not res!372149) (not e!334611))))

(declare-fun arrayContainsKey!0 (array!36535 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!584332 (= res!372149 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!584333 () Bool)

(assert (=> b!584333 (= e!334613 false)))

(declare-fun lt!265545 () SeekEntryResult!5982)

(assert (=> b!584333 (= lt!265545 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265544 vacantSpotIndex!68 (select (arr!17542 a!2986) j!136) a!2986 mask!3053))))

(declare-fun res!372141 () Bool)

(assert (=> start!53634 (=> (not res!372141) (not e!334611))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53634 (= res!372141 (validMask!0 mask!3053))))

(assert (=> start!53634 e!334611))

(assert (=> start!53634 true))

(declare-fun array_inv!13338 (array!36535) Bool)

(assert (=> start!53634 (array_inv!13338 a!2986)))

(declare-fun b!584326 () Bool)

(declare-fun res!372140 () Bool)

(assert (=> b!584326 (=> (not res!372140) (not e!334614))))

(declare-datatypes ((List!11583 0))(
  ( (Nil!11580) (Cons!11579 (h!12624 (_ BitVec 64)) (t!17811 List!11583)) )
))
(declare-fun arrayNoDuplicates!0 (array!36535 (_ BitVec 32) List!11583) Bool)

(assert (=> b!584326 (= res!372140 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11580))))

(assert (= (and start!53634 res!372141) b!584322))

(assert (= (and b!584322 res!372146) b!584323))

(assert (= (and b!584323 res!372148) b!584324))

(assert (= (and b!584324 res!372145) b!584332))

(assert (= (and b!584332 res!372149) b!584328))

(assert (= (and b!584328 res!372142) b!584329))

(assert (= (and b!584329 res!372139) b!584326))

(assert (= (and b!584326 res!372140) b!584331))

(assert (= (and b!584331 res!372144) b!584330))

(assert (= (and b!584330 res!372147) b!584325))

(assert (= (and b!584325 res!372143) b!584327))

(assert (= (and b!584327 res!372138) b!584333))

(declare-fun m!562689 () Bool)

(assert (=> b!584325 m!562689))

(declare-fun m!562691 () Bool)

(assert (=> b!584325 m!562691))

(declare-fun m!562693 () Bool)

(assert (=> b!584332 m!562693))

(declare-fun m!562695 () Bool)

(assert (=> b!584329 m!562695))

(declare-fun m!562697 () Bool)

(assert (=> b!584331 m!562697))

(declare-fun m!562699 () Bool)

(assert (=> b!584331 m!562699))

(declare-fun m!562701 () Bool)

(assert (=> b!584331 m!562701))

(declare-fun m!562703 () Bool)

(assert (=> b!584328 m!562703))

(assert (=> b!584330 m!562691))

(assert (=> b!584330 m!562691))

(declare-fun m!562705 () Bool)

(assert (=> b!584330 m!562705))

(declare-fun m!562707 () Bool)

(assert (=> start!53634 m!562707))

(declare-fun m!562709 () Bool)

(assert (=> start!53634 m!562709))

(declare-fun m!562711 () Bool)

(assert (=> b!584324 m!562711))

(assert (=> b!584333 m!562691))

(assert (=> b!584333 m!562691))

(declare-fun m!562713 () Bool)

(assert (=> b!584333 m!562713))

(declare-fun m!562715 () Bool)

(assert (=> b!584326 m!562715))

(assert (=> b!584323 m!562691))

(assert (=> b!584323 m!562691))

(declare-fun m!562717 () Bool)

(assert (=> b!584323 m!562717))

(declare-fun m!562719 () Bool)

(assert (=> b!584327 m!562719))

(check-sat (not b!584332) (not b!584326) (not b!584333) (not b!584330) (not start!53634) (not b!584323) (not b!584324) (not b!584328) (not b!584327) (not b!584329))
(check-sat)
