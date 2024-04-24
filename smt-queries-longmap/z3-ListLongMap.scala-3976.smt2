; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53976 () Bool)

(assert start!53976)

(declare-fun b!588716 () Bool)

(declare-fun res!376250 () Bool)

(declare-fun e!336185 () Bool)

(assert (=> b!588716 (=> (not res!376250) (not e!336185))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!36765 0))(
  ( (array!36766 (arr!17653 (Array (_ BitVec 32) (_ BitVec 64))) (size!18017 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36765)

(assert (=> b!588716 (= res!376250 (and (= (size!18017 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18017 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18017 a!2986)) (not (= i!1108 j!136))))))

(declare-fun res!376257 () Bool)

(assert (=> start!53976 (=> (not res!376257) (not e!336185))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53976 (= res!376257 (validMask!0 mask!3053))))

(assert (=> start!53976 e!336185))

(assert (=> start!53976 true))

(declare-fun array_inv!13512 (array!36765) Bool)

(assert (=> start!53976 (array_inv!13512 a!2986)))

(declare-fun b!588717 () Bool)

(declare-fun res!376252 () Bool)

(declare-fun e!336182 () Bool)

(assert (=> b!588717 (=> (not res!376252) (not e!336182))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!588717 (= res!376252 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17653 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17653 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!588718 () Bool)

(declare-fun e!336183 () Bool)

(assert (=> b!588718 (= e!336182 e!336183)))

(declare-fun res!376256 () Bool)

(assert (=> b!588718 (=> (not res!376256) (not e!336183))))

(declare-datatypes ((SeekEntryResult!6049 0))(
  ( (MissingZero!6049 (index!26426 (_ BitVec 32))) (Found!6049 (index!26427 (_ BitVec 32))) (Intermediate!6049 (undefined!6861 Bool) (index!26428 (_ BitVec 32)) (x!55378 (_ BitVec 32))) (Undefined!6049) (MissingVacant!6049 (index!26429 (_ BitVec 32))) )
))
(declare-fun lt!266926 () SeekEntryResult!6049)

(assert (=> b!588718 (= res!376256 (and (= lt!266926 (Found!6049 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17653 a!2986) index!984) (select (arr!17653 a!2986) j!136))) (not (= (select (arr!17653 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36765 (_ BitVec 32)) SeekEntryResult!6049)

(assert (=> b!588718 (= lt!266926 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17653 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!588719 () Bool)

(declare-fun e!336186 () Bool)

(declare-fun lt!266923 () SeekEntryResult!6049)

(assert (=> b!588719 (= e!336186 (= lt!266926 lt!266923))))

(declare-fun b!588720 () Bool)

(declare-fun res!376248 () Bool)

(assert (=> b!588720 (=> (not res!376248) (not e!336182))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36765 (_ BitVec 32)) Bool)

(assert (=> b!588720 (= res!376248 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!588721 () Bool)

(declare-fun res!376255 () Bool)

(assert (=> b!588721 (=> (not res!376255) (not e!336185))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!588721 (= res!376255 (validKeyInArray!0 (select (arr!17653 a!2986) j!136)))))

(declare-fun e!336184 () Bool)

(declare-fun b!588722 () Bool)

(assert (=> b!588722 (= e!336184 (validKeyInArray!0 (select (store (arr!17653 a!2986) i!1108 k0!1786) j!136)))))

(declare-fun b!588723 () Bool)

(declare-fun res!376251 () Bool)

(assert (=> b!588723 (=> (not res!376251) (not e!336185))))

(assert (=> b!588723 (= res!376251 (validKeyInArray!0 k0!1786))))

(declare-fun b!588724 () Bool)

(declare-fun res!376249 () Bool)

(assert (=> b!588724 (=> (not res!376249) (not e!336182))))

(declare-datatypes ((List!11601 0))(
  ( (Nil!11598) (Cons!11597 (h!12645 (_ BitVec 64)) (t!17821 List!11601)) )
))
(declare-fun arrayNoDuplicates!0 (array!36765 (_ BitVec 32) List!11601) Bool)

(assert (=> b!588724 (= res!376249 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11598))))

(declare-fun b!588725 () Bool)

(declare-fun res!376247 () Bool)

(assert (=> b!588725 (=> (not res!376247) (not e!336185))))

(declare-fun arrayContainsKey!0 (array!36765 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!588725 (= res!376247 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!588726 () Bool)

(assert (=> b!588726 (= e!336183 (not e!336184))))

(declare-fun res!376253 () Bool)

(assert (=> b!588726 (=> res!376253 e!336184)))

(assert (=> b!588726 (= res!376253 (bvslt mask!3053 #b00000000000000000000000000000000))))

(assert (=> b!588726 e!336186))

(declare-fun res!376254 () Bool)

(assert (=> b!588726 (=> (not res!376254) (not e!336186))))

(declare-fun lt!266922 () (_ BitVec 32))

(assert (=> b!588726 (= res!376254 (= lt!266923 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266922 vacantSpotIndex!68 (select (store (arr!17653 a!2986) i!1108 k0!1786) j!136) (array!36766 (store (arr!17653 a!2986) i!1108 k0!1786) (size!18017 a!2986)) mask!3053)))))

(assert (=> b!588726 (= lt!266923 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266922 vacantSpotIndex!68 (select (arr!17653 a!2986) j!136) a!2986 mask!3053))))

(declare-datatypes ((Unit!18295 0))(
  ( (Unit!18296) )
))
(declare-fun lt!266925 () Unit!18295)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36765 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18295)

(assert (=> b!588726 (= lt!266925 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!266922 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!588726 (= lt!266922 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!588727 () Bool)

(assert (=> b!588727 (= e!336185 e!336182)))

(declare-fun res!376258 () Bool)

(assert (=> b!588727 (=> (not res!376258) (not e!336182))))

(declare-fun lt!266924 () SeekEntryResult!6049)

(assert (=> b!588727 (= res!376258 (or (= lt!266924 (MissingZero!6049 i!1108)) (= lt!266924 (MissingVacant!6049 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36765 (_ BitVec 32)) SeekEntryResult!6049)

(assert (=> b!588727 (= lt!266924 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(assert (= (and start!53976 res!376257) b!588716))

(assert (= (and b!588716 res!376250) b!588721))

(assert (= (and b!588721 res!376255) b!588723))

(assert (= (and b!588723 res!376251) b!588725))

(assert (= (and b!588725 res!376247) b!588727))

(assert (= (and b!588727 res!376258) b!588720))

(assert (= (and b!588720 res!376248) b!588724))

(assert (= (and b!588724 res!376249) b!588717))

(assert (= (and b!588717 res!376252) b!588718))

(assert (= (and b!588718 res!376256) b!588726))

(assert (= (and b!588726 res!376254) b!588719))

(assert (= (and b!588726 (not res!376253)) b!588722))

(declare-fun m!567431 () Bool)

(assert (=> b!588726 m!567431))

(declare-fun m!567433 () Bool)

(assert (=> b!588726 m!567433))

(declare-fun m!567435 () Bool)

(assert (=> b!588726 m!567435))

(declare-fun m!567437 () Bool)

(assert (=> b!588726 m!567437))

(assert (=> b!588726 m!567433))

(declare-fun m!567439 () Bool)

(assert (=> b!588726 m!567439))

(declare-fun m!567441 () Bool)

(assert (=> b!588726 m!567441))

(assert (=> b!588726 m!567441))

(declare-fun m!567443 () Bool)

(assert (=> b!588726 m!567443))

(declare-fun m!567445 () Bool)

(assert (=> b!588725 m!567445))

(assert (=> b!588721 m!567433))

(assert (=> b!588721 m!567433))

(declare-fun m!567447 () Bool)

(assert (=> b!588721 m!567447))

(assert (=> b!588722 m!567435))

(assert (=> b!588722 m!567441))

(assert (=> b!588722 m!567441))

(declare-fun m!567449 () Bool)

(assert (=> b!588722 m!567449))

(declare-fun m!567451 () Bool)

(assert (=> start!53976 m!567451))

(declare-fun m!567453 () Bool)

(assert (=> start!53976 m!567453))

(declare-fun m!567455 () Bool)

(assert (=> b!588718 m!567455))

(assert (=> b!588718 m!567433))

(assert (=> b!588718 m!567433))

(declare-fun m!567457 () Bool)

(assert (=> b!588718 m!567457))

(declare-fun m!567459 () Bool)

(assert (=> b!588727 m!567459))

(declare-fun m!567461 () Bool)

(assert (=> b!588723 m!567461))

(declare-fun m!567463 () Bool)

(assert (=> b!588724 m!567463))

(declare-fun m!567465 () Bool)

(assert (=> b!588720 m!567465))

(declare-fun m!567467 () Bool)

(assert (=> b!588717 m!567467))

(assert (=> b!588717 m!567435))

(declare-fun m!567469 () Bool)

(assert (=> b!588717 m!567469))

(check-sat (not b!588726) (not b!588727) (not b!588723) (not b!588720) (not start!53976) (not b!588724) (not b!588722) (not b!588721) (not b!588725) (not b!588718))
(check-sat)
