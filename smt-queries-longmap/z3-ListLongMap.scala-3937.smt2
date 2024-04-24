; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53682 () Bool)

(assert start!53682)

(declare-fun b!584495 () Bool)

(declare-fun res!372216 () Bool)

(declare-fun e!334729 () Bool)

(assert (=> b!584495 (=> (not res!372216) (not e!334729))))

(declare-datatypes ((array!36528 0))(
  ( (array!36529 (arr!17536 (Array (_ BitVec 32) (_ BitVec 64))) (size!17900 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36528)

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36528 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!584495 (= res!372216 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun res!372209 () Bool)

(assert (=> start!53682 (=> (not res!372209) (not e!334729))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53682 (= res!372209 (validMask!0 mask!3053))))

(assert (=> start!53682 e!334729))

(assert (=> start!53682 true))

(declare-fun array_inv!13395 (array!36528) Bool)

(assert (=> start!53682 (array_inv!13395 a!2986)))

(declare-fun b!584496 () Bool)

(declare-fun res!372207 () Bool)

(declare-fun e!334730 () Bool)

(assert (=> b!584496 (=> (not res!372207) (not e!334730))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5932 0))(
  ( (MissingZero!5932 (index!25955 (_ BitVec 32))) (Found!5932 (index!25956 (_ BitVec 32))) (Intermediate!5932 (undefined!6744 Bool) (index!25957 (_ BitVec 32)) (x!54940 (_ BitVec 32))) (Undefined!5932) (MissingVacant!5932 (index!25958 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36528 (_ BitVec 32)) SeekEntryResult!5932)

(assert (=> b!584496 (= res!372207 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17536 a!2986) j!136) a!2986 mask!3053) (Found!5932 j!136)))))

(declare-fun b!584497 () Bool)

(declare-fun res!372213 () Bool)

(assert (=> b!584497 (=> (not res!372213) (not e!334730))))

(assert (=> b!584497 (= res!372213 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17536 a!2986) index!984) (select (arr!17536 a!2986) j!136))) (not (= (select (arr!17536 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!584498 () Bool)

(declare-fun e!334728 () Bool)

(assert (=> b!584498 (= e!334730 e!334728)))

(declare-fun res!372208 () Bool)

(assert (=> b!584498 (=> (not res!372208) (not e!334728))))

(declare-fun lt!265637 () (_ BitVec 32))

(assert (=> b!584498 (= res!372208 (and (bvsge lt!265637 #b00000000000000000000000000000000) (bvslt lt!265637 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b00000000000000000000000000000000)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!584498 (= lt!265637 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!584499 () Bool)

(declare-fun res!372211 () Bool)

(assert (=> b!584499 (=> (not res!372211) (not e!334730))))

(declare-datatypes ((List!11484 0))(
  ( (Nil!11481) (Cons!11480 (h!12528 (_ BitVec 64)) (t!17704 List!11484)) )
))
(declare-fun arrayNoDuplicates!0 (array!36528 (_ BitVec 32) List!11484) Bool)

(assert (=> b!584499 (= res!372211 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11481))))

(declare-fun b!584500 () Bool)

(declare-fun res!372210 () Bool)

(assert (=> b!584500 (=> (not res!372210) (not e!334729))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!584500 (= res!372210 (validKeyInArray!0 k0!1786))))

(declare-fun b!584501 () Bool)

(declare-fun res!372217 () Bool)

(assert (=> b!584501 (=> (not res!372217) (not e!334729))))

(assert (=> b!584501 (= res!372217 (validKeyInArray!0 (select (arr!17536 a!2986) j!136)))))

(declare-fun b!584502 () Bool)

(declare-fun res!372206 () Bool)

(assert (=> b!584502 (=> (not res!372206) (not e!334730))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36528 (_ BitVec 32)) Bool)

(assert (=> b!584502 (= res!372206 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!584503 () Bool)

(assert (=> b!584503 (= e!334729 e!334730)))

(declare-fun res!372212 () Bool)

(assert (=> b!584503 (=> (not res!372212) (not e!334730))))

(declare-fun lt!265638 () SeekEntryResult!5932)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!584503 (= res!372212 (or (= lt!265638 (MissingZero!5932 i!1108)) (= lt!265638 (MissingVacant!5932 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36528 (_ BitVec 32)) SeekEntryResult!5932)

(assert (=> b!584503 (= lt!265638 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!584504 () Bool)

(assert (=> b!584504 (= e!334728 false)))

(declare-fun lt!265639 () SeekEntryResult!5932)

(assert (=> b!584504 (= lt!265639 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265637 vacantSpotIndex!68 (select (arr!17536 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!584505 () Bool)

(declare-fun res!372214 () Bool)

(assert (=> b!584505 (=> (not res!372214) (not e!334730))))

(assert (=> b!584505 (= res!372214 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17536 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17536 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!584506 () Bool)

(declare-fun res!372215 () Bool)

(assert (=> b!584506 (=> (not res!372215) (not e!334729))))

(assert (=> b!584506 (= res!372215 (and (= (size!17900 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17900 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17900 a!2986)) (not (= i!1108 j!136))))))

(assert (= (and start!53682 res!372209) b!584506))

(assert (= (and b!584506 res!372215) b!584501))

(assert (= (and b!584501 res!372217) b!584500))

(assert (= (and b!584500 res!372210) b!584495))

(assert (= (and b!584495 res!372216) b!584503))

(assert (= (and b!584503 res!372212) b!584502))

(assert (= (and b!584502 res!372206) b!584499))

(assert (= (and b!584499 res!372211) b!584505))

(assert (= (and b!584505 res!372214) b!584496))

(assert (= (and b!584496 res!372207) b!584497))

(assert (= (and b!584497 res!372213) b!584498))

(assert (= (and b!584498 res!372208) b!584504))

(declare-fun m!563015 () Bool)

(assert (=> b!584504 m!563015))

(assert (=> b!584504 m!563015))

(declare-fun m!563017 () Bool)

(assert (=> b!584504 m!563017))

(declare-fun m!563019 () Bool)

(assert (=> b!584500 m!563019))

(declare-fun m!563021 () Bool)

(assert (=> b!584503 m!563021))

(assert (=> b!584501 m!563015))

(assert (=> b!584501 m!563015))

(declare-fun m!563023 () Bool)

(assert (=> b!584501 m!563023))

(declare-fun m!563025 () Bool)

(assert (=> b!584505 m!563025))

(declare-fun m!563027 () Bool)

(assert (=> b!584505 m!563027))

(declare-fun m!563029 () Bool)

(assert (=> b!584505 m!563029))

(declare-fun m!563031 () Bool)

(assert (=> b!584497 m!563031))

(assert (=> b!584497 m!563015))

(declare-fun m!563033 () Bool)

(assert (=> b!584502 m!563033))

(declare-fun m!563035 () Bool)

(assert (=> b!584498 m!563035))

(declare-fun m!563037 () Bool)

(assert (=> start!53682 m!563037))

(declare-fun m!563039 () Bool)

(assert (=> start!53682 m!563039))

(assert (=> b!584496 m!563015))

(assert (=> b!584496 m!563015))

(declare-fun m!563041 () Bool)

(assert (=> b!584496 m!563041))

(declare-fun m!563043 () Bool)

(assert (=> b!584495 m!563043))

(declare-fun m!563045 () Bool)

(assert (=> b!584499 m!563045))

(check-sat (not b!584502) (not b!584504) (not start!53682) (not b!584498) (not b!584500) (not b!584503) (not b!584496) (not b!584499) (not b!584495) (not b!584501))
(check-sat)
