; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53936 () Bool)

(assert start!53936)

(declare-fun b!588704 () Bool)

(declare-datatypes ((Unit!18330 0))(
  ( (Unit!18331) )
))
(declare-fun e!336156 () Unit!18330)

(declare-fun Unit!18332 () Unit!18330)

(assert (=> b!588704 (= e!336156 Unit!18332)))

(declare-fun b!588705 () Bool)

(declare-fun res!376327 () Bool)

(declare-fun e!336151 () Bool)

(assert (=> b!588705 (=> (not res!376327) (not e!336151))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36780 0))(
  ( (array!36781 (arr!17663 (Array (_ BitVec 32) (_ BitVec 64))) (size!18027 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36780)

(assert (=> b!588705 (= res!376327 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17663 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!588706 () Bool)

(declare-fun e!336154 () Bool)

(assert (=> b!588706 (= e!336154 (not true))))

(declare-fun lt!266924 () Unit!18330)

(assert (=> b!588706 (= lt!266924 e!336156)))

(declare-fun lt!266922 () array!36780)

(declare-fun lt!266923 () (_ BitVec 64))

(declare-fun c!66557 () Bool)

(declare-datatypes ((SeekEntryResult!6103 0))(
  ( (MissingZero!6103 (index!26642 (_ BitVec 32))) (Found!6103 (index!26643 (_ BitVec 32))) (Intermediate!6103 (undefined!6915 Bool) (index!26644 (_ BitVec 32)) (x!55437 (_ BitVec 32))) (Undefined!6103) (MissingVacant!6103 (index!26645 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36780 (_ BitVec 32)) SeekEntryResult!6103)

(assert (=> b!588706 (= c!66557 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!266923 lt!266922 mask!3053) Undefined!6103))))

(declare-fun e!336152 () Bool)

(assert (=> b!588706 e!336152))

(declare-fun res!376324 () Bool)

(assert (=> b!588706 (=> (not res!376324) (not e!336152))))

(declare-fun lt!266926 () (_ BitVec 32))

(declare-fun lt!266921 () SeekEntryResult!6103)

(assert (=> b!588706 (= res!376324 (= lt!266921 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266926 vacantSpotIndex!68 lt!266923 lt!266922 mask!3053)))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!588706 (= lt!266921 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266926 vacantSpotIndex!68 (select (arr!17663 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!588706 (= lt!266923 (select (store (arr!17663 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!266920 () Unit!18330)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36780 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18330)

(assert (=> b!588706 (= lt!266920 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!266926 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!588706 (= lt!266926 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!588707 () Bool)

(declare-fun res!376334 () Bool)

(declare-fun e!336153 () Bool)

(assert (=> b!588707 (=> (not res!376334) (not e!336153))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!588707 (= res!376334 (validKeyInArray!0 (select (arr!17663 a!2986) j!136)))))

(declare-fun b!588708 () Bool)

(declare-fun lt!266925 () SeekEntryResult!6103)

(assert (=> b!588708 (= e!336152 (= lt!266925 lt!266921))))

(declare-fun b!588709 () Bool)

(declare-fun e!336155 () Bool)

(assert (=> b!588709 (= e!336151 e!336155)))

(declare-fun res!376328 () Bool)

(assert (=> b!588709 (=> (not res!376328) (not e!336155))))

(assert (=> b!588709 (= res!376328 (= (select (store (arr!17663 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!588709 (= lt!266922 (array!36781 (store (arr!17663 a!2986) i!1108 k!1786) (size!18027 a!2986)))))

(declare-fun b!588710 () Bool)

(declare-fun res!376323 () Bool)

(assert (=> b!588710 (=> (not res!376323) (not e!336153))))

(declare-fun arrayContainsKey!0 (array!36780 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!588710 (= res!376323 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!588711 () Bool)

(declare-fun res!376332 () Bool)

(assert (=> b!588711 (=> (not res!376332) (not e!336153))))

(assert (=> b!588711 (= res!376332 (and (= (size!18027 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18027 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18027 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!588712 () Bool)

(declare-fun Unit!18333 () Unit!18330)

(assert (=> b!588712 (= e!336156 Unit!18333)))

(assert (=> b!588712 false))

(declare-fun res!376330 () Bool)

(assert (=> start!53936 (=> (not res!376330) (not e!336153))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53936 (= res!376330 (validMask!0 mask!3053))))

(assert (=> start!53936 e!336153))

(assert (=> start!53936 true))

(declare-fun array_inv!13459 (array!36780) Bool)

(assert (=> start!53936 (array_inv!13459 a!2986)))

(declare-fun b!588703 () Bool)

(assert (=> b!588703 (= e!336153 e!336151)))

(declare-fun res!376333 () Bool)

(assert (=> b!588703 (=> (not res!376333) (not e!336151))))

(declare-fun lt!266919 () SeekEntryResult!6103)

(assert (=> b!588703 (= res!376333 (or (= lt!266919 (MissingZero!6103 i!1108)) (= lt!266919 (MissingVacant!6103 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36780 (_ BitVec 32)) SeekEntryResult!6103)

(assert (=> b!588703 (= lt!266919 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!588713 () Bool)

(declare-fun res!376326 () Bool)

(assert (=> b!588713 (=> (not res!376326) (not e!336151))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36780 (_ BitVec 32)) Bool)

(assert (=> b!588713 (= res!376326 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!588714 () Bool)

(declare-fun res!376325 () Bool)

(assert (=> b!588714 (=> (not res!376325) (not e!336153))))

(assert (=> b!588714 (= res!376325 (validKeyInArray!0 k!1786))))

(declare-fun b!588715 () Bool)

(declare-fun res!376331 () Bool)

(assert (=> b!588715 (=> (not res!376331) (not e!336151))))

(declare-datatypes ((List!11704 0))(
  ( (Nil!11701) (Cons!11700 (h!12745 (_ BitVec 64)) (t!17932 List!11704)) )
))
(declare-fun arrayNoDuplicates!0 (array!36780 (_ BitVec 32) List!11704) Bool)

(assert (=> b!588715 (= res!376331 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11701))))

(declare-fun b!588716 () Bool)

(assert (=> b!588716 (= e!336155 e!336154)))

(declare-fun res!376329 () Bool)

(assert (=> b!588716 (=> (not res!376329) (not e!336154))))

(assert (=> b!588716 (= res!376329 (and (= lt!266925 (Found!6103 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17663 a!2986) index!984) (select (arr!17663 a!2986) j!136))) (not (= (select (arr!17663 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!588716 (= lt!266925 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17663 a!2986) j!136) a!2986 mask!3053))))

(assert (= (and start!53936 res!376330) b!588711))

(assert (= (and b!588711 res!376332) b!588707))

(assert (= (and b!588707 res!376334) b!588714))

(assert (= (and b!588714 res!376325) b!588710))

(assert (= (and b!588710 res!376323) b!588703))

(assert (= (and b!588703 res!376333) b!588713))

(assert (= (and b!588713 res!376326) b!588715))

(assert (= (and b!588715 res!376331) b!588705))

(assert (= (and b!588705 res!376327) b!588709))

(assert (= (and b!588709 res!376328) b!588716))

(assert (= (and b!588716 res!376329) b!588706))

(assert (= (and b!588706 res!376324) b!588708))

(assert (= (and b!588706 c!66557) b!588712))

(assert (= (and b!588706 (not c!66557)) b!588704))

(declare-fun m!567267 () Bool)

(assert (=> b!588713 m!567267))

(declare-fun m!567269 () Bool)

(assert (=> b!588709 m!567269))

(declare-fun m!567271 () Bool)

(assert (=> b!588709 m!567271))

(declare-fun m!567273 () Bool)

(assert (=> b!588715 m!567273))

(declare-fun m!567275 () Bool)

(assert (=> b!588706 m!567275))

(declare-fun m!567277 () Bool)

(assert (=> b!588706 m!567277))

(declare-fun m!567279 () Bool)

(assert (=> b!588706 m!567279))

(assert (=> b!588706 m!567275))

(assert (=> b!588706 m!567269))

(declare-fun m!567281 () Bool)

(assert (=> b!588706 m!567281))

(declare-fun m!567283 () Bool)

(assert (=> b!588706 m!567283))

(declare-fun m!567285 () Bool)

(assert (=> b!588706 m!567285))

(declare-fun m!567287 () Bool)

(assert (=> b!588706 m!567287))

(declare-fun m!567289 () Bool)

(assert (=> b!588705 m!567289))

(declare-fun m!567291 () Bool)

(assert (=> start!53936 m!567291))

(declare-fun m!567293 () Bool)

(assert (=> start!53936 m!567293))

(declare-fun m!567295 () Bool)

(assert (=> b!588710 m!567295))

(assert (=> b!588707 m!567275))

(assert (=> b!588707 m!567275))

(declare-fun m!567297 () Bool)

(assert (=> b!588707 m!567297))

(declare-fun m!567299 () Bool)

(assert (=> b!588714 m!567299))

(declare-fun m!567301 () Bool)

(assert (=> b!588703 m!567301))

(declare-fun m!567303 () Bool)

(assert (=> b!588716 m!567303))

(assert (=> b!588716 m!567275))

(assert (=> b!588716 m!567275))

(declare-fun m!567305 () Bool)

(assert (=> b!588716 m!567305))

(push 1)

