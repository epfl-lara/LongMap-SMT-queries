; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53948 () Bool)

(assert start!53948)

(declare-fun b!588955 () Bool)

(declare-fun res!376549 () Bool)

(declare-fun e!336281 () Bool)

(assert (=> b!588955 (=> (not res!376549) (not e!336281))))

(declare-datatypes ((array!36792 0))(
  ( (array!36793 (arr!17669 (Array (_ BitVec 32) (_ BitVec 64))) (size!18033 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36792)

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36792 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!588955 (= res!376549 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!588956 () Bool)

(declare-fun e!336277 () Bool)

(declare-datatypes ((SeekEntryResult!6109 0))(
  ( (MissingZero!6109 (index!26666 (_ BitVec 32))) (Found!6109 (index!26667 (_ BitVec 32))) (Intermediate!6109 (undefined!6921 Bool) (index!26668 (_ BitVec 32)) (x!55459 (_ BitVec 32))) (Undefined!6109) (MissingVacant!6109 (index!26669 (_ BitVec 32))) )
))
(declare-fun lt!267069 () SeekEntryResult!6109)

(declare-fun lt!267064 () SeekEntryResult!6109)

(assert (=> b!588956 (= e!336277 (= lt!267069 lt!267064))))

(declare-fun res!376548 () Bool)

(assert (=> start!53948 (=> (not res!376548) (not e!336281))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53948 (= res!376548 (validMask!0 mask!3053))))

(assert (=> start!53948 e!336281))

(assert (=> start!53948 true))

(declare-fun array_inv!13465 (array!36792) Bool)

(assert (=> start!53948 (array_inv!13465 a!2986)))

(declare-fun b!588957 () Bool)

(declare-fun res!376544 () Bool)

(assert (=> b!588957 (=> (not res!376544) (not e!336281))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!588957 (= res!376544 (validKeyInArray!0 (select (arr!17669 a!2986) j!136)))))

(declare-fun b!588958 () Bool)

(declare-fun res!376547 () Bool)

(declare-fun e!336279 () Bool)

(assert (=> b!588958 (=> (not res!376547) (not e!336279))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!588958 (= res!376547 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17669 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!588959 () Bool)

(assert (=> b!588959 (= e!336281 e!336279)))

(declare-fun res!376550 () Bool)

(assert (=> b!588959 (=> (not res!376550) (not e!336279))))

(declare-fun lt!267070 () SeekEntryResult!6109)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!588959 (= res!376550 (or (= lt!267070 (MissingZero!6109 i!1108)) (= lt!267070 (MissingVacant!6109 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36792 (_ BitVec 32)) SeekEntryResult!6109)

(assert (=> b!588959 (= lt!267070 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!588960 () Bool)

(declare-fun res!376539 () Bool)

(assert (=> b!588960 (=> (not res!376539) (not e!336279))))

(declare-datatypes ((List!11710 0))(
  ( (Nil!11707) (Cons!11706 (h!12751 (_ BitVec 64)) (t!17938 List!11710)) )
))
(declare-fun arrayNoDuplicates!0 (array!36792 (_ BitVec 32) List!11710) Bool)

(assert (=> b!588960 (= res!376539 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11707))))

(declare-fun b!588961 () Bool)

(declare-datatypes ((Unit!18354 0))(
  ( (Unit!18355) )
))
(declare-fun e!336276 () Unit!18354)

(declare-fun Unit!18356 () Unit!18354)

(assert (=> b!588961 (= e!336276 Unit!18356)))

(declare-fun b!588962 () Bool)

(declare-fun res!376543 () Bool)

(assert (=> b!588962 (=> (not res!376543) (not e!336281))))

(assert (=> b!588962 (= res!376543 (and (= (size!18033 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18033 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18033 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!588963 () Bool)

(declare-fun Unit!18357 () Unit!18354)

(assert (=> b!588963 (= e!336276 Unit!18357)))

(assert (=> b!588963 false))

(declare-fun b!588964 () Bool)

(declare-fun e!336280 () Bool)

(declare-fun e!336282 () Bool)

(assert (=> b!588964 (= e!336280 e!336282)))

(declare-fun res!376542 () Bool)

(assert (=> b!588964 (=> (not res!376542) (not e!336282))))

(assert (=> b!588964 (= res!376542 (and (= lt!267069 (Found!6109 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17669 a!2986) index!984) (select (arr!17669 a!2986) j!136))) (not (= (select (arr!17669 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36792 (_ BitVec 32)) SeekEntryResult!6109)

(assert (=> b!588964 (= lt!267069 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17669 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!588965 () Bool)

(declare-fun res!376541 () Bool)

(assert (=> b!588965 (=> (not res!376541) (not e!336281))))

(assert (=> b!588965 (= res!376541 (validKeyInArray!0 k!1786))))

(declare-fun b!588966 () Bool)

(assert (=> b!588966 (= e!336279 e!336280)))

(declare-fun res!376545 () Bool)

(assert (=> b!588966 (=> (not res!376545) (not e!336280))))

(assert (=> b!588966 (= res!376545 (= (select (store (arr!17669 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!267067 () array!36792)

(assert (=> b!588966 (= lt!267067 (array!36793 (store (arr!17669 a!2986) i!1108 k!1786) (size!18033 a!2986)))))

(declare-fun b!588967 () Bool)

(declare-fun res!376540 () Bool)

(assert (=> b!588967 (=> (not res!376540) (not e!336279))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36792 (_ BitVec 32)) Bool)

(assert (=> b!588967 (= res!376540 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!588968 () Bool)

(assert (=> b!588968 (= e!336282 (not true))))

(declare-fun lt!267066 () Unit!18354)

(assert (=> b!588968 (= lt!267066 e!336276)))

(declare-fun c!66575 () Bool)

(declare-fun lt!267065 () (_ BitVec 64))

(assert (=> b!588968 (= c!66575 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!267065 lt!267067 mask!3053) Undefined!6109))))

(assert (=> b!588968 e!336277))

(declare-fun res!376546 () Bool)

(assert (=> b!588968 (=> (not res!376546) (not e!336277))))

(declare-fun lt!267063 () (_ BitVec 32))

(assert (=> b!588968 (= res!376546 (= lt!267064 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!267063 vacantSpotIndex!68 lt!267065 lt!267067 mask!3053)))))

(assert (=> b!588968 (= lt!267064 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!267063 vacantSpotIndex!68 (select (arr!17669 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!588968 (= lt!267065 (select (store (arr!17669 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!267068 () Unit!18354)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36792 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18354)

(assert (=> b!588968 (= lt!267068 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!267063 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!588968 (= lt!267063 (nextIndex!0 index!984 x!910 mask!3053))))

(assert (= (and start!53948 res!376548) b!588962))

(assert (= (and b!588962 res!376543) b!588957))

(assert (= (and b!588957 res!376544) b!588965))

(assert (= (and b!588965 res!376541) b!588955))

(assert (= (and b!588955 res!376549) b!588959))

(assert (= (and b!588959 res!376550) b!588967))

(assert (= (and b!588967 res!376540) b!588960))

(assert (= (and b!588960 res!376539) b!588958))

(assert (= (and b!588958 res!376547) b!588966))

(assert (= (and b!588966 res!376545) b!588964))

(assert (= (and b!588964 res!376542) b!588968))

(assert (= (and b!588968 res!376546) b!588956))

(assert (= (and b!588968 c!66575) b!588963))

(assert (= (and b!588968 (not c!66575)) b!588961))

(declare-fun m!567507 () Bool)

(assert (=> b!588957 m!567507))

(assert (=> b!588957 m!567507))

(declare-fun m!567509 () Bool)

(assert (=> b!588957 m!567509))

(declare-fun m!567511 () Bool)

(assert (=> b!588958 m!567511))

(declare-fun m!567513 () Bool)

(assert (=> b!588964 m!567513))

(assert (=> b!588964 m!567507))

(assert (=> b!588964 m!567507))

(declare-fun m!567515 () Bool)

(assert (=> b!588964 m!567515))

(declare-fun m!567517 () Bool)

(assert (=> b!588965 m!567517))

(declare-fun m!567519 () Bool)

(assert (=> b!588960 m!567519))

(declare-fun m!567521 () Bool)

(assert (=> b!588966 m!567521))

(declare-fun m!567523 () Bool)

(assert (=> b!588966 m!567523))

(declare-fun m!567525 () Bool)

(assert (=> b!588959 m!567525))

(declare-fun m!567527 () Bool)

(assert (=> b!588968 m!567527))

(declare-fun m!567529 () Bool)

(assert (=> b!588968 m!567529))

(assert (=> b!588968 m!567521))

(declare-fun m!567531 () Bool)

(assert (=> b!588968 m!567531))

(declare-fun m!567533 () Bool)

(assert (=> b!588968 m!567533))

(declare-fun m!567535 () Bool)

(assert (=> b!588968 m!567535))

(assert (=> b!588968 m!567507))

(assert (=> b!588968 m!567507))

(declare-fun m!567537 () Bool)

(assert (=> b!588968 m!567537))

(declare-fun m!567539 () Bool)

(assert (=> b!588967 m!567539))

(declare-fun m!567541 () Bool)

(assert (=> b!588955 m!567541))

(declare-fun m!567543 () Bool)

(assert (=> start!53948 m!567543))

(declare-fun m!567545 () Bool)

(assert (=> start!53948 m!567545))

(push 1)

