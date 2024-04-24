; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54000 () Bool)

(assert start!54000)

(declare-fun res!376680 () Bool)

(declare-fun e!336426 () Bool)

(assert (=> start!54000 (=> (not res!376680) (not e!336426))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54000 (= res!376680 (validMask!0 mask!3053))))

(assert (=> start!54000 e!336426))

(assert (=> start!54000 true))

(declare-datatypes ((array!36789 0))(
  ( (array!36790 (arr!17665 (Array (_ BitVec 32) (_ BitVec 64))) (size!18029 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36789)

(declare-fun array_inv!13524 (array!36789) Bool)

(assert (=> start!54000 (array_inv!13524 a!2986)))

(declare-fun b!589206 () Bool)

(declare-fun e!336432 () Bool)

(assert (=> b!589206 (= e!336426 e!336432)))

(declare-fun res!376690 () Bool)

(assert (=> b!589206 (=> (not res!376690) (not e!336432))))

(declare-datatypes ((SeekEntryResult!6061 0))(
  ( (MissingZero!6061 (index!26474 (_ BitVec 32))) (Found!6061 (index!26475 (_ BitVec 32))) (Intermediate!6061 (undefined!6873 Bool) (index!26476 (_ BitVec 32)) (x!55422 (_ BitVec 32))) (Undefined!6061) (MissingVacant!6061 (index!26477 (_ BitVec 32))) )
))
(declare-fun lt!267195 () SeekEntryResult!6061)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!589206 (= res!376690 (or (= lt!267195 (MissingZero!6061 i!1108)) (= lt!267195 (MissingVacant!6061 i!1108))))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36789 (_ BitVec 32)) SeekEntryResult!6061)

(assert (=> b!589206 (= lt!267195 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!589207 () Bool)

(declare-fun e!336428 () Bool)

(assert (=> b!589207 (= e!336432 e!336428)))

(declare-fun res!376679 () Bool)

(assert (=> b!589207 (=> (not res!376679) (not e!336428))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!589207 (= res!376679 (= (select (store (arr!17665 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!267189 () array!36789)

(assert (=> b!589207 (= lt!267189 (array!36790 (store (arr!17665 a!2986) i!1108 k0!1786) (size!18029 a!2986)))))

(declare-fun b!589208 () Bool)

(declare-datatypes ((Unit!18337 0))(
  ( (Unit!18338) )
))
(declare-fun e!336431 () Unit!18337)

(declare-fun Unit!18339 () Unit!18337)

(assert (=> b!589208 (= e!336431 Unit!18339)))

(assert (=> b!589208 false))

(declare-fun b!589209 () Bool)

(declare-fun res!376685 () Bool)

(assert (=> b!589209 (=> (not res!376685) (not e!336432))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36789 (_ BitVec 32)) Bool)

(assert (=> b!589209 (= res!376685 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!589210 () Bool)

(declare-fun res!376681 () Bool)

(assert (=> b!589210 (=> (not res!376681) (not e!336432))))

(declare-datatypes ((List!11613 0))(
  ( (Nil!11610) (Cons!11609 (h!12657 (_ BitVec 64)) (t!17833 List!11613)) )
))
(declare-fun arrayNoDuplicates!0 (array!36789 (_ BitVec 32) List!11613) Bool)

(assert (=> b!589210 (= res!376681 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11610))))

(declare-fun b!589211 () Bool)

(declare-fun res!376684 () Bool)

(assert (=> b!589211 (=> (not res!376684) (not e!336426))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!589211 (= res!376684 (and (= (size!18029 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18029 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18029 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!589212 () Bool)

(declare-fun res!376686 () Bool)

(assert (=> b!589212 (=> (not res!376686) (not e!336426))))

(declare-fun arrayContainsKey!0 (array!36789 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!589212 (= res!376686 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!589213 () Bool)

(declare-fun res!376682 () Bool)

(assert (=> b!589213 (=> (not res!376682) (not e!336426))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!589213 (= res!376682 (validKeyInArray!0 (select (arr!17665 a!2986) j!136)))))

(declare-fun b!589214 () Bool)

(declare-fun res!376683 () Bool)

(assert (=> b!589214 (=> (not res!376683) (not e!336426))))

(assert (=> b!589214 (= res!376683 (validKeyInArray!0 k0!1786))))

(declare-fun b!589215 () Bool)

(declare-fun e!336430 () Bool)

(assert (=> b!589215 (= e!336430 (not true))))

(declare-fun lt!267193 () Unit!18337)

(assert (=> b!589215 (= lt!267193 e!336431)))

(declare-fun c!66632 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun lt!267196 () (_ BitVec 64))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36789 (_ BitVec 32)) SeekEntryResult!6061)

(assert (=> b!589215 (= c!66632 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!267196 lt!267189 mask!3053) Undefined!6061))))

(declare-fun e!336427 () Bool)

(assert (=> b!589215 e!336427))

(declare-fun res!376687 () Bool)

(assert (=> b!589215 (=> (not res!376687) (not e!336427))))

(declare-fun lt!267194 () (_ BitVec 32))

(declare-fun lt!267191 () SeekEntryResult!6061)

(assert (=> b!589215 (= res!376687 (= lt!267191 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!267194 vacantSpotIndex!68 lt!267196 lt!267189 mask!3053)))))

(assert (=> b!589215 (= lt!267191 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!267194 vacantSpotIndex!68 (select (arr!17665 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!589215 (= lt!267196 (select (store (arr!17665 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!267190 () Unit!18337)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36789 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18337)

(assert (=> b!589215 (= lt!267190 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!267194 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!589215 (= lt!267194 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!589216 () Bool)

(declare-fun Unit!18340 () Unit!18337)

(assert (=> b!589216 (= e!336431 Unit!18340)))

(declare-fun b!589217 () Bool)

(declare-fun lt!267192 () SeekEntryResult!6061)

(assert (=> b!589217 (= e!336427 (= lt!267192 lt!267191))))

(declare-fun b!589218 () Bool)

(assert (=> b!589218 (= e!336428 e!336430)))

(declare-fun res!376689 () Bool)

(assert (=> b!589218 (=> (not res!376689) (not e!336430))))

(assert (=> b!589218 (= res!376689 (and (= lt!267192 (Found!6061 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17665 a!2986) index!984) (select (arr!17665 a!2986) j!136))) (not (= (select (arr!17665 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!589218 (= lt!267192 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17665 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!589219 () Bool)

(declare-fun res!376688 () Bool)

(assert (=> b!589219 (=> (not res!376688) (not e!336432))))

(assert (=> b!589219 (= res!376688 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17665 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!54000 res!376680) b!589211))

(assert (= (and b!589211 res!376684) b!589213))

(assert (= (and b!589213 res!376682) b!589214))

(assert (= (and b!589214 res!376683) b!589212))

(assert (= (and b!589212 res!376686) b!589206))

(assert (= (and b!589206 res!376690) b!589209))

(assert (= (and b!589209 res!376685) b!589210))

(assert (= (and b!589210 res!376681) b!589219))

(assert (= (and b!589219 res!376688) b!589207))

(assert (= (and b!589207 res!376679) b!589218))

(assert (= (and b!589218 res!376689) b!589215))

(assert (= (and b!589215 res!376687) b!589217))

(assert (= (and b!589215 c!66632) b!589208))

(assert (= (and b!589215 (not c!66632)) b!589216))

(declare-fun m!567911 () Bool)

(assert (=> b!589214 m!567911))

(declare-fun m!567913 () Bool)

(assert (=> b!589218 m!567913))

(declare-fun m!567915 () Bool)

(assert (=> b!589218 m!567915))

(assert (=> b!589218 m!567915))

(declare-fun m!567917 () Bool)

(assert (=> b!589218 m!567917))

(declare-fun m!567919 () Bool)

(assert (=> b!589215 m!567919))

(declare-fun m!567921 () Bool)

(assert (=> b!589215 m!567921))

(assert (=> b!589215 m!567915))

(declare-fun m!567923 () Bool)

(assert (=> b!589215 m!567923))

(assert (=> b!589215 m!567915))

(declare-fun m!567925 () Bool)

(assert (=> b!589215 m!567925))

(declare-fun m!567927 () Bool)

(assert (=> b!589215 m!567927))

(declare-fun m!567929 () Bool)

(assert (=> b!589215 m!567929))

(declare-fun m!567931 () Bool)

(assert (=> b!589215 m!567931))

(declare-fun m!567933 () Bool)

(assert (=> b!589209 m!567933))

(declare-fun m!567935 () Bool)

(assert (=> b!589212 m!567935))

(declare-fun m!567937 () Bool)

(assert (=> b!589219 m!567937))

(declare-fun m!567939 () Bool)

(assert (=> b!589210 m!567939))

(declare-fun m!567941 () Bool)

(assert (=> b!589206 m!567941))

(assert (=> b!589213 m!567915))

(assert (=> b!589213 m!567915))

(declare-fun m!567943 () Bool)

(assert (=> b!589213 m!567943))

(declare-fun m!567945 () Bool)

(assert (=> start!54000 m!567945))

(declare-fun m!567947 () Bool)

(assert (=> start!54000 m!567947))

(assert (=> b!589207 m!567931))

(declare-fun m!567949 () Bool)

(assert (=> b!589207 m!567949))

(check-sat (not b!589209) (not b!589215) (not start!54000) (not b!589212) (not b!589214) (not b!589218) (not b!589206) (not b!589210) (not b!589213))
(check-sat)
