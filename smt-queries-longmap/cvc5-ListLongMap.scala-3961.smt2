; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53776 () Bool)

(assert start!53776)

(declare-fun b!586768 () Bool)

(declare-fun res!374588 () Bool)

(declare-fun e!335353 () Bool)

(assert (=> b!586768 (=> (not res!374588) (not e!335353))))

(declare-datatypes ((array!36677 0))(
  ( (array!36678 (arr!17613 (Array (_ BitVec 32) (_ BitVec 64))) (size!17977 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36677)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!586768 (= res!374588 (validKeyInArray!0 (select (arr!17613 a!2986) j!136)))))

(declare-fun b!586769 () Bool)

(declare-fun res!374591 () Bool)

(declare-fun e!335355 () Bool)

(assert (=> b!586769 (=> (not res!374591) (not e!335355))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6053 0))(
  ( (MissingZero!6053 (index!26439 (_ BitVec 32))) (Found!6053 (index!26440 (_ BitVec 32))) (Intermediate!6053 (undefined!6865 Bool) (index!26441 (_ BitVec 32)) (x!55250 (_ BitVec 32))) (Undefined!6053) (MissingVacant!6053 (index!26442 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36677 (_ BitVec 32)) SeekEntryResult!6053)

(assert (=> b!586769 (= res!374591 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17613 a!2986) j!136) a!2986 mask!3053) (Found!6053 j!136)))))

(declare-fun b!586770 () Bool)

(declare-fun res!374594 () Bool)

(assert (=> b!586770 (=> (not res!374594) (not e!335353))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36677 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!586770 (= res!374594 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!586771 () Bool)

(declare-fun res!374586 () Bool)

(assert (=> b!586771 (=> (not res!374586) (not e!335355))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36677 (_ BitVec 32)) Bool)

(assert (=> b!586771 (= res!374586 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!586773 () Bool)

(assert (=> b!586773 (= e!335355 (not true))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun lt!266183 () (_ BitVec 32))

(assert (=> b!586773 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266183 vacantSpotIndex!68 (select (arr!17613 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266183 vacantSpotIndex!68 (select (store (arr!17613 a!2986) i!1108 k!1786) j!136) (array!36678 (store (arr!17613 a!2986) i!1108 k!1786) (size!17977 a!2986)) mask!3053))))

(declare-datatypes ((Unit!18226 0))(
  ( (Unit!18227) )
))
(declare-fun lt!266184 () Unit!18226)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36677 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18226)

(assert (=> b!586773 (= lt!266184 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!266183 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!586773 (= lt!266183 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!586774 () Bool)

(declare-fun res!374587 () Bool)

(assert (=> b!586774 (=> (not res!374587) (not e!335353))))

(assert (=> b!586774 (= res!374587 (and (= (size!17977 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17977 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17977 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!586775 () Bool)

(declare-fun res!374589 () Bool)

(assert (=> b!586775 (=> (not res!374589) (not e!335353))))

(assert (=> b!586775 (= res!374589 (validKeyInArray!0 k!1786))))

(declare-fun b!586776 () Bool)

(declare-fun res!374590 () Bool)

(assert (=> b!586776 (=> (not res!374590) (not e!335355))))

(assert (=> b!586776 (= res!374590 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17613 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17613 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!586777 () Bool)

(declare-fun res!374584 () Bool)

(assert (=> b!586777 (=> (not res!374584) (not e!335355))))

(assert (=> b!586777 (= res!374584 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17613 a!2986) index!984) (select (arr!17613 a!2986) j!136))) (not (= (select (arr!17613 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!586778 () Bool)

(assert (=> b!586778 (= e!335353 e!335355)))

(declare-fun res!374593 () Bool)

(assert (=> b!586778 (=> (not res!374593) (not e!335355))))

(declare-fun lt!266185 () SeekEntryResult!6053)

(assert (=> b!586778 (= res!374593 (or (= lt!266185 (MissingZero!6053 i!1108)) (= lt!266185 (MissingVacant!6053 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36677 (_ BitVec 32)) SeekEntryResult!6053)

(assert (=> b!586778 (= lt!266185 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!586772 () Bool)

(declare-fun res!374585 () Bool)

(assert (=> b!586772 (=> (not res!374585) (not e!335355))))

(declare-datatypes ((List!11654 0))(
  ( (Nil!11651) (Cons!11650 (h!12695 (_ BitVec 64)) (t!17882 List!11654)) )
))
(declare-fun arrayNoDuplicates!0 (array!36677 (_ BitVec 32) List!11654) Bool)

(assert (=> b!586772 (= res!374585 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11651))))

(declare-fun res!374592 () Bool)

(assert (=> start!53776 (=> (not res!374592) (not e!335353))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53776 (= res!374592 (validMask!0 mask!3053))))

(assert (=> start!53776 e!335353))

(assert (=> start!53776 true))

(declare-fun array_inv!13409 (array!36677) Bool)

(assert (=> start!53776 (array_inv!13409 a!2986)))

(assert (= (and start!53776 res!374592) b!586774))

(assert (= (and b!586774 res!374587) b!586768))

(assert (= (and b!586768 res!374588) b!586775))

(assert (= (and b!586775 res!374589) b!586770))

(assert (= (and b!586770 res!374594) b!586778))

(assert (= (and b!586778 res!374593) b!586771))

(assert (= (and b!586771 res!374586) b!586772))

(assert (= (and b!586772 res!374585) b!586776))

(assert (= (and b!586776 res!374590) b!586769))

(assert (= (and b!586769 res!374591) b!586777))

(assert (= (and b!586777 res!374584) b!586773))

(declare-fun m!565177 () Bool)

(assert (=> b!586768 m!565177))

(assert (=> b!586768 m!565177))

(declare-fun m!565179 () Bool)

(assert (=> b!586768 m!565179))

(declare-fun m!565181 () Bool)

(assert (=> b!586770 m!565181))

(declare-fun m!565183 () Bool)

(assert (=> b!586773 m!565183))

(declare-fun m!565185 () Bool)

(assert (=> b!586773 m!565185))

(assert (=> b!586773 m!565177))

(declare-fun m!565187 () Bool)

(assert (=> b!586773 m!565187))

(declare-fun m!565189 () Bool)

(assert (=> b!586773 m!565189))

(assert (=> b!586773 m!565185))

(declare-fun m!565191 () Bool)

(assert (=> b!586773 m!565191))

(assert (=> b!586773 m!565177))

(declare-fun m!565193 () Bool)

(assert (=> b!586773 m!565193))

(declare-fun m!565195 () Bool)

(assert (=> b!586778 m!565195))

(declare-fun m!565197 () Bool)

(assert (=> b!586777 m!565197))

(assert (=> b!586777 m!565177))

(declare-fun m!565199 () Bool)

(assert (=> b!586771 m!565199))

(declare-fun m!565201 () Bool)

(assert (=> start!53776 m!565201))

(declare-fun m!565203 () Bool)

(assert (=> start!53776 m!565203))

(declare-fun m!565205 () Bool)

(assert (=> b!586775 m!565205))

(declare-fun m!565207 () Bool)

(assert (=> b!586772 m!565207))

(declare-fun m!565209 () Bool)

(assert (=> b!586776 m!565209))

(assert (=> b!586776 m!565187))

(declare-fun m!565211 () Bool)

(assert (=> b!586776 m!565211))

(assert (=> b!586769 m!565177))

(assert (=> b!586769 m!565177))

(declare-fun m!565213 () Bool)

(assert (=> b!586769 m!565213))

(push 1)

