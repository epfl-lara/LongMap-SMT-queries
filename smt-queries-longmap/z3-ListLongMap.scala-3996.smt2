; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54150 () Bool)

(assert start!54150)

(declare-fun b!591593 () Bool)

(declare-datatypes ((Unit!18528 0))(
  ( (Unit!18529) )
))
(declare-fun e!337787 () Unit!18528)

(declare-fun Unit!18530 () Unit!18528)

(assert (=> b!591593 (= e!337787 Unit!18530)))

(declare-fun b!591594 () Bool)

(declare-fun e!337793 () Bool)

(declare-fun e!337788 () Bool)

(assert (=> b!591594 (= e!337793 e!337788)))

(declare-fun res!378640 () Bool)

(assert (=> b!591594 (=> (not res!378640) (not e!337788))))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6154 0))(
  ( (MissingZero!6154 (index!26852 (_ BitVec 32))) (Found!6154 (index!26853 (_ BitVec 32))) (Intermediate!6154 (undefined!6966 Bool) (index!26854 (_ BitVec 32)) (x!55653 (_ BitVec 32))) (Undefined!6154) (MissingVacant!6154 (index!26855 (_ BitVec 32))) )
))
(declare-fun lt!268378 () SeekEntryResult!6154)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36894 0))(
  ( (array!36895 (arr!17717 (Array (_ BitVec 32) (_ BitVec 64))) (size!18082 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36894)

(assert (=> b!591594 (= res!378640 (and (= lt!268378 (Found!6154 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17717 a!2986) index!984) (select (arr!17717 a!2986) j!136))) (not (= (select (arr!17717 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36894 (_ BitVec 32)) SeekEntryResult!6154)

(assert (=> b!591594 (= lt!268378 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17717 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!591595 () Bool)

(declare-fun res!378643 () Bool)

(declare-fun e!337786 () Bool)

(assert (=> b!591595 (=> (not res!378643) (not e!337786))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!591595 (= res!378643 (validKeyInArray!0 (select (arr!17717 a!2986) j!136)))))

(declare-fun b!591596 () Bool)

(declare-fun e!337791 () Bool)

(declare-fun lt!268369 () SeekEntryResult!6154)

(assert (=> b!591596 (= e!337791 (= lt!268378 lt!268369))))

(declare-fun b!591597 () Bool)

(declare-fun res!378635 () Bool)

(assert (=> b!591597 (=> (not res!378635) (not e!337786))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36894 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!591597 (= res!378635 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!591598 () Bool)

(declare-fun e!337794 () Bool)

(assert (=> b!591598 (= e!337794 true)))

(declare-fun e!337792 () Bool)

(assert (=> b!591598 e!337792))

(declare-fun res!378644 () Bool)

(assert (=> b!591598 (=> (not res!378644) (not e!337792))))

(declare-fun lt!268372 () (_ BitVec 64))

(assert (=> b!591598 (= res!378644 (= lt!268372 (select (arr!17717 a!2986) j!136)))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!591598 (= lt!268372 (select (store (arr!17717 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!591599 () Bool)

(assert (=> b!591599 (= e!337788 (not e!337794))))

(declare-fun res!378629 () Bool)

(assert (=> b!591599 (=> res!378629 e!337794)))

(declare-fun lt!268376 () SeekEntryResult!6154)

(assert (=> b!591599 (= res!378629 (not (= lt!268376 (Found!6154 index!984))))))

(declare-fun lt!268377 () Unit!18528)

(assert (=> b!591599 (= lt!268377 e!337787)))

(declare-fun c!66849 () Bool)

(assert (=> b!591599 (= c!66849 (= lt!268376 Undefined!6154))))

(declare-fun lt!268370 () (_ BitVec 64))

(declare-fun lt!268374 () array!36894)

(assert (=> b!591599 (= lt!268376 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!268370 lt!268374 mask!3053))))

(assert (=> b!591599 e!337791))

(declare-fun res!378638 () Bool)

(assert (=> b!591599 (=> (not res!378638) (not e!337791))))

(declare-fun lt!268371 () (_ BitVec 32))

(assert (=> b!591599 (= res!378638 (= lt!268369 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!268371 vacantSpotIndex!68 lt!268370 lt!268374 mask!3053)))))

(assert (=> b!591599 (= lt!268369 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!268371 vacantSpotIndex!68 (select (arr!17717 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!591599 (= lt!268370 (select (store (arr!17717 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!268375 () Unit!18528)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36894 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18528)

(assert (=> b!591599 (= lt!268375 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!268371 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!591599 (= lt!268371 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!591600 () Bool)

(declare-fun e!337789 () Bool)

(assert (=> b!591600 (= e!337792 e!337789)))

(declare-fun res!378641 () Bool)

(assert (=> b!591600 (=> res!378641 e!337789)))

(assert (=> b!591600 (= res!378641 (or (not (= (select (arr!17717 a!2986) j!136) lt!268370)) (not (= (select (arr!17717 a!2986) j!136) lt!268372)) (bvsge j!136 index!984)))))

(declare-fun b!591601 () Bool)

(declare-fun e!337790 () Bool)

(assert (=> b!591601 (= e!337786 e!337790)))

(declare-fun res!378634 () Bool)

(assert (=> b!591601 (=> (not res!378634) (not e!337790))))

(declare-fun lt!268373 () SeekEntryResult!6154)

(assert (=> b!591601 (= res!378634 (or (= lt!268373 (MissingZero!6154 i!1108)) (= lt!268373 (MissingVacant!6154 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36894 (_ BitVec 32)) SeekEntryResult!6154)

(assert (=> b!591601 (= lt!268373 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!591602 () Bool)

(declare-fun res!378637 () Bool)

(assert (=> b!591602 (=> (not res!378637) (not e!337786))))

(assert (=> b!591602 (= res!378637 (and (= (size!18082 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18082 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18082 a!2986)) (not (= i!1108 j!136))))))

(declare-fun res!378639 () Bool)

(assert (=> start!54150 (=> (not res!378639) (not e!337786))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54150 (= res!378639 (validMask!0 mask!3053))))

(assert (=> start!54150 e!337786))

(assert (=> start!54150 true))

(declare-fun array_inv!13600 (array!36894) Bool)

(assert (=> start!54150 (array_inv!13600 a!2986)))

(declare-fun b!591603 () Bool)

(assert (=> b!591603 (= e!337790 e!337793)))

(declare-fun res!378636 () Bool)

(assert (=> b!591603 (=> (not res!378636) (not e!337793))))

(assert (=> b!591603 (= res!378636 (= (select (store (arr!17717 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!591603 (= lt!268374 (array!36895 (store (arr!17717 a!2986) i!1108 k0!1786) (size!18082 a!2986)))))

(declare-fun e!337785 () Bool)

(declare-fun b!591604 () Bool)

(assert (=> b!591604 (= e!337785 (arrayContainsKey!0 lt!268374 (select (arr!17717 a!2986) j!136) index!984))))

(declare-fun b!591605 () Bool)

(declare-fun Unit!18531 () Unit!18528)

(assert (=> b!591605 (= e!337787 Unit!18531)))

(assert (=> b!591605 false))

(declare-fun b!591606 () Bool)

(assert (=> b!591606 (= e!337789 e!337785)))

(declare-fun res!378632 () Bool)

(assert (=> b!591606 (=> (not res!378632) (not e!337785))))

(assert (=> b!591606 (= res!378632 (arrayContainsKey!0 lt!268374 (select (arr!17717 a!2986) j!136) j!136))))

(declare-fun b!591607 () Bool)

(declare-fun res!378633 () Bool)

(assert (=> b!591607 (=> (not res!378633) (not e!337786))))

(assert (=> b!591607 (= res!378633 (validKeyInArray!0 k0!1786))))

(declare-fun b!591608 () Bool)

(declare-fun res!378642 () Bool)

(assert (=> b!591608 (=> (not res!378642) (not e!337790))))

(declare-datatypes ((List!11797 0))(
  ( (Nil!11794) (Cons!11793 (h!12838 (_ BitVec 64)) (t!18016 List!11797)) )
))
(declare-fun arrayNoDuplicates!0 (array!36894 (_ BitVec 32) List!11797) Bool)

(assert (=> b!591608 (= res!378642 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11794))))

(declare-fun b!591609 () Bool)

(declare-fun res!378630 () Bool)

(assert (=> b!591609 (=> (not res!378630) (not e!337790))))

(assert (=> b!591609 (= res!378630 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17717 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!591610 () Bool)

(declare-fun res!378631 () Bool)

(assert (=> b!591610 (=> (not res!378631) (not e!337790))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36894 (_ BitVec 32)) Bool)

(assert (=> b!591610 (= res!378631 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(assert (= (and start!54150 res!378639) b!591602))

(assert (= (and b!591602 res!378637) b!591595))

(assert (= (and b!591595 res!378643) b!591607))

(assert (= (and b!591607 res!378633) b!591597))

(assert (= (and b!591597 res!378635) b!591601))

(assert (= (and b!591601 res!378634) b!591610))

(assert (= (and b!591610 res!378631) b!591608))

(assert (= (and b!591608 res!378642) b!591609))

(assert (= (and b!591609 res!378630) b!591603))

(assert (= (and b!591603 res!378636) b!591594))

(assert (= (and b!591594 res!378640) b!591599))

(assert (= (and b!591599 res!378638) b!591596))

(assert (= (and b!591599 c!66849) b!591605))

(assert (= (and b!591599 (not c!66849)) b!591593))

(assert (= (and b!591599 (not res!378629)) b!591598))

(assert (= (and b!591598 res!378644) b!591600))

(assert (= (and b!591600 (not res!378641)) b!591606))

(assert (= (and b!591606 res!378632) b!591604))

(declare-fun m!569263 () Bool)

(assert (=> b!591608 m!569263))

(declare-fun m!569265 () Bool)

(assert (=> b!591604 m!569265))

(assert (=> b!591604 m!569265))

(declare-fun m!569267 () Bool)

(assert (=> b!591604 m!569267))

(declare-fun m!569269 () Bool)

(assert (=> b!591594 m!569269))

(assert (=> b!591594 m!569265))

(assert (=> b!591594 m!569265))

(declare-fun m!569271 () Bool)

(assert (=> b!591594 m!569271))

(declare-fun m!569273 () Bool)

(assert (=> start!54150 m!569273))

(declare-fun m!569275 () Bool)

(assert (=> start!54150 m!569275))

(assert (=> b!591595 m!569265))

(assert (=> b!591595 m!569265))

(declare-fun m!569277 () Bool)

(assert (=> b!591595 m!569277))

(assert (=> b!591600 m!569265))

(declare-fun m!569279 () Bool)

(assert (=> b!591597 m!569279))

(declare-fun m!569281 () Bool)

(assert (=> b!591599 m!569281))

(declare-fun m!569283 () Bool)

(assert (=> b!591599 m!569283))

(assert (=> b!591599 m!569265))

(declare-fun m!569285 () Bool)

(assert (=> b!591599 m!569285))

(declare-fun m!569287 () Bool)

(assert (=> b!591599 m!569287))

(assert (=> b!591599 m!569265))

(declare-fun m!569289 () Bool)

(assert (=> b!591599 m!569289))

(declare-fun m!569291 () Bool)

(assert (=> b!591599 m!569291))

(declare-fun m!569293 () Bool)

(assert (=> b!591599 m!569293))

(declare-fun m!569295 () Bool)

(assert (=> b!591610 m!569295))

(declare-fun m!569297 () Bool)

(assert (=> b!591601 m!569297))

(assert (=> b!591598 m!569265))

(assert (=> b!591598 m!569285))

(declare-fun m!569299 () Bool)

(assert (=> b!591598 m!569299))

(assert (=> b!591603 m!569285))

(declare-fun m!569301 () Bool)

(assert (=> b!591603 m!569301))

(declare-fun m!569303 () Bool)

(assert (=> b!591607 m!569303))

(declare-fun m!569305 () Bool)

(assert (=> b!591609 m!569305))

(assert (=> b!591606 m!569265))

(assert (=> b!591606 m!569265))

(declare-fun m!569307 () Bool)

(assert (=> b!591606 m!569307))

(check-sat (not b!591608) (not b!591604) (not b!591595) (not b!591610) (not b!591599) (not b!591594) (not b!591601) (not b!591606) (not start!54150) (not b!591597) (not b!591607))
(check-sat)
