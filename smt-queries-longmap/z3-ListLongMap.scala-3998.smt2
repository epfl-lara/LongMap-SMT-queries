; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54228 () Bool)

(assert start!54228)

(declare-fun b!592408 () Bool)

(declare-fun e!338307 () Bool)

(declare-fun e!338304 () Bool)

(assert (=> b!592408 (= e!338307 (not e!338304))))

(declare-fun res!379169 () Bool)

(assert (=> b!592408 (=> res!379169 e!338304)))

(declare-datatypes ((SeekEntryResult!6115 0))(
  ( (MissingZero!6115 (index!26696 (_ BitVec 32))) (Found!6115 (index!26697 (_ BitVec 32))) (Intermediate!6115 (undefined!6927 Bool) (index!26698 (_ BitVec 32)) (x!55638 (_ BitVec 32))) (Undefined!6115) (MissingVacant!6115 (index!26699 (_ BitVec 32))) )
))
(declare-fun lt!268900 () SeekEntryResult!6115)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!592408 (= res!379169 (not (= lt!268900 (Found!6115 index!984))))))

(declare-datatypes ((Unit!18553 0))(
  ( (Unit!18554) )
))
(declare-fun lt!268903 () Unit!18553)

(declare-fun e!338296 () Unit!18553)

(assert (=> b!592408 (= lt!268903 e!338296)))

(declare-fun c!66992 () Bool)

(assert (=> b!592408 (= c!66992 (= lt!268900 Undefined!6115))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!268902 () (_ BitVec 64))

(declare-datatypes ((array!36903 0))(
  ( (array!36904 (arr!17719 (Array (_ BitVec 32) (_ BitVec 64))) (size!18083 (_ BitVec 32))) )
))
(declare-fun lt!268896 () array!36903)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36903 (_ BitVec 32)) SeekEntryResult!6115)

(assert (=> b!592408 (= lt!268900 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!268902 lt!268896 mask!3053))))

(declare-fun e!338297 () Bool)

(assert (=> b!592408 e!338297))

(declare-fun res!379176 () Bool)

(assert (=> b!592408 (=> (not res!379176) (not e!338297))))

(declare-fun lt!268906 () SeekEntryResult!6115)

(declare-fun lt!268898 () (_ BitVec 32))

(assert (=> b!592408 (= res!379176 (= lt!268906 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!268898 vacantSpotIndex!68 lt!268902 lt!268896 mask!3053)))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun a!2986 () array!36903)

(assert (=> b!592408 (= lt!268906 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!268898 vacantSpotIndex!68 (select (arr!17719 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!592408 (= lt!268902 (select (store (arr!17719 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!268904 () Unit!18553)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36903 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18553)

(assert (=> b!592408 (= lt!268904 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!268898 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!592408 (= lt!268898 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!592410 () Bool)

(declare-fun res!379173 () Bool)

(declare-fun e!338302 () Bool)

(assert (=> b!592410 (=> (not res!379173) (not e!338302))))

(declare-datatypes ((List!11667 0))(
  ( (Nil!11664) (Cons!11663 (h!12711 (_ BitVec 64)) (t!17887 List!11667)) )
))
(declare-fun arrayNoDuplicates!0 (array!36903 (_ BitVec 32) List!11667) Bool)

(assert (=> b!592410 (= res!379173 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11664))))

(declare-fun b!592411 () Bool)

(declare-fun e!338300 () Bool)

(declare-fun e!338301 () Bool)

(assert (=> b!592411 (= e!338300 e!338301)))

(declare-fun res!379168 () Bool)

(assert (=> b!592411 (=> res!379168 e!338301)))

(declare-fun lt!268899 () (_ BitVec 64))

(assert (=> b!592411 (= res!379168 (or (not (= (select (arr!17719 a!2986) j!136) lt!268902)) (not (= (select (arr!17719 a!2986) j!136) lt!268899)) (bvsge j!136 index!984)))))

(declare-fun b!592412 () Bool)

(declare-fun res!379162 () Bool)

(declare-fun e!338306 () Bool)

(assert (=> b!592412 (=> (not res!379162) (not e!338306))))

(declare-fun arrayContainsKey!0 (array!36903 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!592412 (= res!379162 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun e!338298 () Bool)

(declare-fun b!592413 () Bool)

(assert (=> b!592413 (= e!338298 (arrayContainsKey!0 lt!268896 (select (arr!17719 a!2986) j!136) index!984))))

(declare-fun b!592409 () Bool)

(assert (=> b!592409 (= e!338301 e!338298)))

(declare-fun res!379161 () Bool)

(assert (=> b!592409 (=> (not res!379161) (not e!338298))))

(assert (=> b!592409 (= res!379161 (arrayContainsKey!0 lt!268896 (select (arr!17719 a!2986) j!136) j!136))))

(declare-fun res!379163 () Bool)

(assert (=> start!54228 (=> (not res!379163) (not e!338306))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54228 (= res!379163 (validMask!0 mask!3053))))

(assert (=> start!54228 e!338306))

(assert (=> start!54228 true))

(declare-fun array_inv!13578 (array!36903) Bool)

(assert (=> start!54228 (array_inv!13578 a!2986)))

(declare-fun b!592414 () Bool)

(declare-fun e!338299 () Bool)

(assert (=> b!592414 (= e!338302 e!338299)))

(declare-fun res!379170 () Bool)

(assert (=> b!592414 (=> (not res!379170) (not e!338299))))

(assert (=> b!592414 (= res!379170 (= (select (store (arr!17719 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!592414 (= lt!268896 (array!36904 (store (arr!17719 a!2986) i!1108 k0!1786) (size!18083 a!2986)))))

(declare-fun b!592415 () Bool)

(declare-fun lt!268897 () SeekEntryResult!6115)

(assert (=> b!592415 (= e!338297 (= lt!268897 lt!268906))))

(declare-fun b!592416 () Bool)

(declare-fun e!338305 () Bool)

(assert (=> b!592416 (= e!338304 e!338305)))

(declare-fun res!379174 () Bool)

(assert (=> b!592416 (=> res!379174 e!338305)))

(assert (=> b!592416 (= res!379174 (or (not (= (select (arr!17719 a!2986) j!136) lt!268902)) (not (= (select (arr!17719 a!2986) j!136) lt!268899)) (bvsge j!136 index!984)))))

(assert (=> b!592416 e!338300))

(declare-fun res!379175 () Bool)

(assert (=> b!592416 (=> (not res!379175) (not e!338300))))

(assert (=> b!592416 (= res!379175 (= lt!268899 (select (arr!17719 a!2986) j!136)))))

(assert (=> b!592416 (= lt!268899 (select (store (arr!17719 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!592417 () Bool)

(assert (=> b!592417 (= e!338305 (or (bvslt (bvadd #b00000000000000000000000000000001 j!136) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 j!136) (size!18083 a!2986))))))

(assert (=> b!592417 (arrayContainsKey!0 lt!268896 (select (arr!17719 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!268905 () Unit!18553)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!36903 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18553)

(assert (=> b!592417 (= lt!268905 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!268896 (select (arr!17719 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!592418 () Bool)

(declare-fun res!379166 () Bool)

(assert (=> b!592418 (=> (not res!379166) (not e!338306))))

(assert (=> b!592418 (= res!379166 (and (= (size!18083 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18083 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18083 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!592419 () Bool)

(assert (=> b!592419 (= e!338299 e!338307)))

(declare-fun res!379171 () Bool)

(assert (=> b!592419 (=> (not res!379171) (not e!338307))))

(assert (=> b!592419 (= res!379171 (and (= lt!268897 (Found!6115 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17719 a!2986) index!984) (select (arr!17719 a!2986) j!136))) (not (= (select (arr!17719 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!592419 (= lt!268897 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17719 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!592420 () Bool)

(declare-fun res!379167 () Bool)

(assert (=> b!592420 (=> (not res!379167) (not e!338302))))

(assert (=> b!592420 (= res!379167 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17719 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!592421 () Bool)

(declare-fun res!379172 () Bool)

(assert (=> b!592421 (=> (not res!379172) (not e!338306))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!592421 (= res!379172 (validKeyInArray!0 (select (arr!17719 a!2986) j!136)))))

(declare-fun b!592422 () Bool)

(declare-fun Unit!18555 () Unit!18553)

(assert (=> b!592422 (= e!338296 Unit!18555)))

(assert (=> b!592422 false))

(declare-fun b!592423 () Bool)

(declare-fun res!379177 () Bool)

(assert (=> b!592423 (=> (not res!379177) (not e!338306))))

(assert (=> b!592423 (= res!379177 (validKeyInArray!0 k0!1786))))

(declare-fun b!592424 () Bool)

(assert (=> b!592424 (= e!338306 e!338302)))

(declare-fun res!379164 () Bool)

(assert (=> b!592424 (=> (not res!379164) (not e!338302))))

(declare-fun lt!268901 () SeekEntryResult!6115)

(assert (=> b!592424 (= res!379164 (or (= lt!268901 (MissingZero!6115 i!1108)) (= lt!268901 (MissingVacant!6115 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36903 (_ BitVec 32)) SeekEntryResult!6115)

(assert (=> b!592424 (= lt!268901 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!592425 () Bool)

(declare-fun res!379165 () Bool)

(assert (=> b!592425 (=> (not res!379165) (not e!338302))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36903 (_ BitVec 32)) Bool)

(assert (=> b!592425 (= res!379165 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!592426 () Bool)

(declare-fun Unit!18556 () Unit!18553)

(assert (=> b!592426 (= e!338296 Unit!18556)))

(assert (= (and start!54228 res!379163) b!592418))

(assert (= (and b!592418 res!379166) b!592421))

(assert (= (and b!592421 res!379172) b!592423))

(assert (= (and b!592423 res!379177) b!592412))

(assert (= (and b!592412 res!379162) b!592424))

(assert (= (and b!592424 res!379164) b!592425))

(assert (= (and b!592425 res!379165) b!592410))

(assert (= (and b!592410 res!379173) b!592420))

(assert (= (and b!592420 res!379167) b!592414))

(assert (= (and b!592414 res!379170) b!592419))

(assert (= (and b!592419 res!379171) b!592408))

(assert (= (and b!592408 res!379176) b!592415))

(assert (= (and b!592408 c!66992) b!592422))

(assert (= (and b!592408 (not c!66992)) b!592426))

(assert (= (and b!592408 (not res!379169)) b!592416))

(assert (= (and b!592416 res!379175) b!592411))

(assert (= (and b!592411 (not res!379168)) b!592409))

(assert (= (and b!592409 res!379161) b!592413))

(assert (= (and b!592416 (not res!379174)) b!592417))

(declare-fun m!570713 () Bool)

(assert (=> b!592412 m!570713))

(declare-fun m!570715 () Bool)

(assert (=> b!592425 m!570715))

(declare-fun m!570717 () Bool)

(assert (=> b!592410 m!570717))

(declare-fun m!570719 () Bool)

(assert (=> b!592416 m!570719))

(declare-fun m!570721 () Bool)

(assert (=> b!592416 m!570721))

(declare-fun m!570723 () Bool)

(assert (=> b!592416 m!570723))

(declare-fun m!570725 () Bool)

(assert (=> b!592423 m!570725))

(assert (=> b!592409 m!570719))

(assert (=> b!592409 m!570719))

(declare-fun m!570727 () Bool)

(assert (=> b!592409 m!570727))

(assert (=> b!592414 m!570721))

(declare-fun m!570729 () Bool)

(assert (=> b!592414 m!570729))

(declare-fun m!570731 () Bool)

(assert (=> b!592420 m!570731))

(assert (=> b!592421 m!570719))

(assert (=> b!592421 m!570719))

(declare-fun m!570733 () Bool)

(assert (=> b!592421 m!570733))

(assert (=> b!592417 m!570719))

(assert (=> b!592417 m!570719))

(declare-fun m!570735 () Bool)

(assert (=> b!592417 m!570735))

(assert (=> b!592417 m!570719))

(declare-fun m!570737 () Bool)

(assert (=> b!592417 m!570737))

(declare-fun m!570739 () Bool)

(assert (=> b!592408 m!570739))

(declare-fun m!570741 () Bool)

(assert (=> b!592408 m!570741))

(assert (=> b!592408 m!570719))

(assert (=> b!592408 m!570721))

(declare-fun m!570743 () Bool)

(assert (=> b!592408 m!570743))

(declare-fun m!570745 () Bool)

(assert (=> b!592408 m!570745))

(declare-fun m!570747 () Bool)

(assert (=> b!592408 m!570747))

(assert (=> b!592408 m!570719))

(declare-fun m!570749 () Bool)

(assert (=> b!592408 m!570749))

(declare-fun m!570751 () Bool)

(assert (=> b!592419 m!570751))

(assert (=> b!592419 m!570719))

(assert (=> b!592419 m!570719))

(declare-fun m!570753 () Bool)

(assert (=> b!592419 m!570753))

(declare-fun m!570755 () Bool)

(assert (=> start!54228 m!570755))

(declare-fun m!570757 () Bool)

(assert (=> start!54228 m!570757))

(assert (=> b!592413 m!570719))

(assert (=> b!592413 m!570719))

(declare-fun m!570759 () Bool)

(assert (=> b!592413 m!570759))

(assert (=> b!592411 m!570719))

(declare-fun m!570761 () Bool)

(assert (=> b!592424 m!570761))

(check-sat (not b!592421) (not b!592417) (not b!592413) (not b!592425) (not b!592424) (not b!592409) (not b!592412) (not b!592410) (not b!592408) (not b!592419) (not b!592423) (not start!54228))
(check-sat)
