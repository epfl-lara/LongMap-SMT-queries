; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53988 () Bool)

(assert start!53988)

(declare-fun b!588954 () Bool)

(declare-fun res!376474 () Bool)

(declare-fun e!336305 () Bool)

(assert (=> b!588954 (=> (not res!376474) (not e!336305))))

(declare-datatypes ((array!36777 0))(
  ( (array!36778 (arr!17659 (Array (_ BitVec 32) (_ BitVec 64))) (size!18023 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36777)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!588954 (= res!376474 (validKeyInArray!0 (select (arr!17659 a!2986) j!136)))))

(declare-fun b!588955 () Bool)

(declare-fun res!376467 () Bool)

(assert (=> b!588955 (=> (not res!376467) (not e!336305))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36777 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!588955 (= res!376467 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!588956 () Bool)

(declare-fun e!336306 () Bool)

(declare-fun e!336300 () Bool)

(assert (=> b!588956 (= e!336306 e!336300)))

(declare-fun res!376464 () Bool)

(assert (=> b!588956 (=> (not res!376464) (not e!336300))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!588956 (= res!376464 (= (select (store (arr!17659 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!267046 () array!36777)

(assert (=> b!588956 (= lt!267046 (array!36778 (store (arr!17659 a!2986) i!1108 k0!1786) (size!18023 a!2986)))))

(declare-fun b!588958 () Bool)

(declare-fun res!376469 () Bool)

(assert (=> b!588958 (=> (not res!376469) (not e!336306))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!588958 (= res!376469 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17659 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!588959 () Bool)

(declare-datatypes ((Unit!18313 0))(
  ( (Unit!18314) )
))
(declare-fun e!336304 () Unit!18313)

(declare-fun Unit!18315 () Unit!18313)

(assert (=> b!588959 (= e!336304 Unit!18315)))

(assert (=> b!588959 false))

(declare-fun b!588960 () Bool)

(declare-fun e!336301 () Bool)

(declare-datatypes ((SeekEntryResult!6055 0))(
  ( (MissingZero!6055 (index!26450 (_ BitVec 32))) (Found!6055 (index!26451 (_ BitVec 32))) (Intermediate!6055 (undefined!6867 Bool) (index!26452 (_ BitVec 32)) (x!55400 (_ BitVec 32))) (Undefined!6055) (MissingVacant!6055 (index!26453 (_ BitVec 32))) )
))
(declare-fun lt!267048 () SeekEntryResult!6055)

(declare-fun lt!267047 () SeekEntryResult!6055)

(assert (=> b!588960 (= e!336301 (= lt!267048 lt!267047))))

(declare-fun b!588961 () Bool)

(assert (=> b!588961 (= e!336305 e!336306)))

(declare-fun res!376463 () Bool)

(assert (=> b!588961 (=> (not res!376463) (not e!336306))))

(declare-fun lt!267045 () SeekEntryResult!6055)

(assert (=> b!588961 (= res!376463 (or (= lt!267045 (MissingZero!6055 i!1108)) (= lt!267045 (MissingVacant!6055 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36777 (_ BitVec 32)) SeekEntryResult!6055)

(assert (=> b!588961 (= lt!267045 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!588962 () Bool)

(declare-fun e!336302 () Bool)

(assert (=> b!588962 (= e!336302 (not (bvsge mask!3053 #b00000000000000000000000000000000)))))

(declare-fun lt!267050 () Unit!18313)

(assert (=> b!588962 (= lt!267050 e!336304)))

(declare-fun lt!267052 () (_ BitVec 64))

(declare-fun c!66614 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36777 (_ BitVec 32)) SeekEntryResult!6055)

(assert (=> b!588962 (= c!66614 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!267052 lt!267046 mask!3053) Undefined!6055))))

(assert (=> b!588962 e!336301))

(declare-fun res!376470 () Bool)

(assert (=> b!588962 (=> (not res!376470) (not e!336301))))

(declare-fun lt!267051 () (_ BitVec 32))

(assert (=> b!588962 (= res!376470 (= lt!267047 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!267051 vacantSpotIndex!68 lt!267052 lt!267046 mask!3053)))))

(assert (=> b!588962 (= lt!267047 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!267051 vacantSpotIndex!68 (select (arr!17659 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!588962 (= lt!267052 (select (store (arr!17659 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!267049 () Unit!18313)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36777 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18313)

(assert (=> b!588962 (= lt!267049 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!267051 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!588962 (= lt!267051 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!588963 () Bool)

(declare-fun Unit!18316 () Unit!18313)

(assert (=> b!588963 (= e!336304 Unit!18316)))

(declare-fun b!588964 () Bool)

(declare-fun res!376471 () Bool)

(assert (=> b!588964 (=> (not res!376471) (not e!336305))))

(assert (=> b!588964 (= res!376471 (and (= (size!18023 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18023 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18023 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!588965 () Bool)

(declare-fun res!376472 () Bool)

(assert (=> b!588965 (=> (not res!376472) (not e!336305))))

(assert (=> b!588965 (= res!376472 (validKeyInArray!0 k0!1786))))

(declare-fun b!588957 () Bool)

(declare-fun res!376466 () Bool)

(assert (=> b!588957 (=> (not res!376466) (not e!336306))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36777 (_ BitVec 32)) Bool)

(assert (=> b!588957 (= res!376466 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun res!376473 () Bool)

(assert (=> start!53988 (=> (not res!376473) (not e!336305))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53988 (= res!376473 (validMask!0 mask!3053))))

(assert (=> start!53988 e!336305))

(assert (=> start!53988 true))

(declare-fun array_inv!13518 (array!36777) Bool)

(assert (=> start!53988 (array_inv!13518 a!2986)))

(declare-fun b!588966 () Bool)

(declare-fun res!376465 () Bool)

(assert (=> b!588966 (=> (not res!376465) (not e!336306))))

(declare-datatypes ((List!11607 0))(
  ( (Nil!11604) (Cons!11603 (h!12651 (_ BitVec 64)) (t!17827 List!11607)) )
))
(declare-fun arrayNoDuplicates!0 (array!36777 (_ BitVec 32) List!11607) Bool)

(assert (=> b!588966 (= res!376465 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11604))))

(declare-fun b!588967 () Bool)

(assert (=> b!588967 (= e!336300 e!336302)))

(declare-fun res!376468 () Bool)

(assert (=> b!588967 (=> (not res!376468) (not e!336302))))

(assert (=> b!588967 (= res!376468 (and (= lt!267048 (Found!6055 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17659 a!2986) index!984) (select (arr!17659 a!2986) j!136))) (not (= (select (arr!17659 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!588967 (= lt!267048 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17659 a!2986) j!136) a!2986 mask!3053))))

(assert (= (and start!53988 res!376473) b!588964))

(assert (= (and b!588964 res!376471) b!588954))

(assert (= (and b!588954 res!376474) b!588965))

(assert (= (and b!588965 res!376472) b!588955))

(assert (= (and b!588955 res!376467) b!588961))

(assert (= (and b!588961 res!376463) b!588957))

(assert (= (and b!588957 res!376466) b!588966))

(assert (= (and b!588966 res!376465) b!588958))

(assert (= (and b!588958 res!376469) b!588956))

(assert (= (and b!588956 res!376464) b!588967))

(assert (= (and b!588967 res!376468) b!588962))

(assert (= (and b!588962 res!376470) b!588960))

(assert (= (and b!588962 c!66614) b!588959))

(assert (= (and b!588962 (not c!66614)) b!588963))

(declare-fun m!567671 () Bool)

(assert (=> b!588956 m!567671))

(declare-fun m!567673 () Bool)

(assert (=> b!588956 m!567673))

(declare-fun m!567675 () Bool)

(assert (=> b!588958 m!567675))

(declare-fun m!567677 () Bool)

(assert (=> b!588966 m!567677))

(declare-fun m!567679 () Bool)

(assert (=> b!588967 m!567679))

(declare-fun m!567681 () Bool)

(assert (=> b!588967 m!567681))

(assert (=> b!588967 m!567681))

(declare-fun m!567683 () Bool)

(assert (=> b!588967 m!567683))

(declare-fun m!567685 () Bool)

(assert (=> b!588962 m!567685))

(declare-fun m!567687 () Bool)

(assert (=> b!588962 m!567687))

(assert (=> b!588962 m!567681))

(declare-fun m!567689 () Bool)

(assert (=> b!588962 m!567689))

(assert (=> b!588962 m!567671))

(declare-fun m!567691 () Bool)

(assert (=> b!588962 m!567691))

(declare-fun m!567693 () Bool)

(assert (=> b!588962 m!567693))

(assert (=> b!588962 m!567681))

(declare-fun m!567695 () Bool)

(assert (=> b!588962 m!567695))

(declare-fun m!567697 () Bool)

(assert (=> b!588961 m!567697))

(declare-fun m!567699 () Bool)

(assert (=> b!588957 m!567699))

(declare-fun m!567701 () Bool)

(assert (=> b!588955 m!567701))

(declare-fun m!567703 () Bool)

(assert (=> b!588965 m!567703))

(assert (=> b!588954 m!567681))

(assert (=> b!588954 m!567681))

(declare-fun m!567705 () Bool)

(assert (=> b!588954 m!567705))

(declare-fun m!567707 () Bool)

(assert (=> start!53988 m!567707))

(declare-fun m!567709 () Bool)

(assert (=> start!53988 m!567709))

(check-sat (not b!588957) (not b!588965) (not b!588955) (not b!588961) (not b!588966) (not start!53988) (not b!588962) (not b!588967) (not b!588954))
(check-sat)
