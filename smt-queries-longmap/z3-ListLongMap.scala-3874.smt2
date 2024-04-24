; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53304 () Bool)

(assert start!53304)

(declare-fun res!366855 () Bool)

(declare-fun e!332963 () Bool)

(assert (=> start!53304 (=> (not res!366855) (not e!332963))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53304 (= res!366855 (validMask!0 mask!3053))))

(assert (=> start!53304 e!332963))

(assert (=> start!53304 true))

(declare-datatypes ((array!36150 0))(
  ( (array!36151 (arr!17347 (Array (_ BitVec 32) (_ BitVec 64))) (size!17711 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36150)

(declare-fun array_inv!13206 (array!36150) Bool)

(assert (=> start!53304 (array_inv!13206 a!2986)))

(declare-fun b!579143 () Bool)

(declare-fun e!332964 () Bool)

(assert (=> b!579143 (= e!332963 e!332964)))

(declare-fun res!366861 () Bool)

(assert (=> b!579143 (=> (not res!366861) (not e!332964))))

(declare-datatypes ((SeekEntryResult!5743 0))(
  ( (MissingZero!5743 (index!25199 (_ BitVec 32))) (Found!5743 (index!25200 (_ BitVec 32))) (Intermediate!5743 (undefined!6555 Bool) (index!25201 (_ BitVec 32)) (x!54247 (_ BitVec 32))) (Undefined!5743) (MissingVacant!5743 (index!25202 (_ BitVec 32))) )
))
(declare-fun lt!264484 () SeekEntryResult!5743)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!579143 (= res!366861 (or (= lt!264484 (MissingZero!5743 i!1108)) (= lt!264484 (MissingVacant!5743 i!1108))))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36150 (_ BitVec 32)) SeekEntryResult!5743)

(assert (=> b!579143 (= lt!264484 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!579144 () Bool)

(declare-fun res!366857 () Bool)

(assert (=> b!579144 (=> (not res!366857) (not e!332963))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!579144 (= res!366857 (validKeyInArray!0 k0!1786))))

(declare-fun b!579145 () Bool)

(declare-fun res!366856 () Bool)

(assert (=> b!579145 (=> (not res!366856) (not e!332964))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36150 (_ BitVec 32)) Bool)

(assert (=> b!579145 (= res!366856 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!579146 () Bool)

(declare-fun res!366859 () Bool)

(assert (=> b!579146 (=> (not res!366859) (not e!332963))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!579146 (= res!366859 (validKeyInArray!0 (select (arr!17347 a!2986) j!136)))))

(declare-fun b!579147 () Bool)

(declare-fun res!366862 () Bool)

(assert (=> b!579147 (=> (not res!366862) (not e!332964))))

(declare-datatypes ((List!11295 0))(
  ( (Nil!11292) (Cons!11291 (h!12339 (_ BitVec 64)) (t!17515 List!11295)) )
))
(declare-fun arrayNoDuplicates!0 (array!36150 (_ BitVec 32) List!11295) Bool)

(assert (=> b!579147 (= res!366862 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11292))))

(declare-fun b!579148 () Bool)

(declare-fun res!366858 () Bool)

(assert (=> b!579148 (=> (not res!366858) (not e!332964))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!579148 (= res!366858 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17347 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17347 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!579149 () Bool)

(declare-fun res!366854 () Bool)

(assert (=> b!579149 (=> (not res!366854) (not e!332963))))

(declare-fun arrayContainsKey!0 (array!36150 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!579149 (= res!366854 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!579150 () Bool)

(assert (=> b!579150 (= e!332964 false)))

(declare-fun lt!264483 () SeekEntryResult!5743)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36150 (_ BitVec 32)) SeekEntryResult!5743)

(assert (=> b!579150 (= lt!264483 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17347 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!579151 () Bool)

(declare-fun res!366860 () Bool)

(assert (=> b!579151 (=> (not res!366860) (not e!332963))))

(assert (=> b!579151 (= res!366860 (and (= (size!17711 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17711 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17711 a!2986)) (not (= i!1108 j!136))))))

(assert (= (and start!53304 res!366855) b!579151))

(assert (= (and b!579151 res!366860) b!579146))

(assert (= (and b!579146 res!366859) b!579144))

(assert (= (and b!579144 res!366857) b!579149))

(assert (= (and b!579149 res!366854) b!579143))

(assert (= (and b!579143 res!366861) b!579145))

(assert (= (and b!579145 res!366856) b!579147))

(assert (= (and b!579147 res!366862) b!579148))

(assert (= (and b!579148 res!366858) b!579150))

(declare-fun m!557933 () Bool)

(assert (=> b!579144 m!557933))

(declare-fun m!557935 () Bool)

(assert (=> start!53304 m!557935))

(declare-fun m!557937 () Bool)

(assert (=> start!53304 m!557937))

(declare-fun m!557939 () Bool)

(assert (=> b!579147 m!557939))

(declare-fun m!557941 () Bool)

(assert (=> b!579149 m!557941))

(declare-fun m!557943 () Bool)

(assert (=> b!579150 m!557943))

(assert (=> b!579150 m!557943))

(declare-fun m!557945 () Bool)

(assert (=> b!579150 m!557945))

(declare-fun m!557947 () Bool)

(assert (=> b!579145 m!557947))

(declare-fun m!557949 () Bool)

(assert (=> b!579148 m!557949))

(declare-fun m!557951 () Bool)

(assert (=> b!579148 m!557951))

(declare-fun m!557953 () Bool)

(assert (=> b!579148 m!557953))

(declare-fun m!557955 () Bool)

(assert (=> b!579143 m!557955))

(assert (=> b!579146 m!557943))

(assert (=> b!579146 m!557943))

(declare-fun m!557957 () Bool)

(assert (=> b!579146 m!557957))

(check-sat (not start!53304) (not b!579145) (not b!579149) (not b!579150) (not b!579147) (not b!579146) (not b!579143) (not b!579144))
(check-sat)
