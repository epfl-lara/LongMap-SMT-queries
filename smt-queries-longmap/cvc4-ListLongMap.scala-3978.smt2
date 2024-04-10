; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53942 () Bool)

(assert start!53942)

(declare-fun res!376433 () Bool)

(declare-fun e!336218 () Bool)

(assert (=> start!53942 (=> (not res!376433) (not e!336218))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53942 (= res!376433 (validMask!0 mask!3053))))

(assert (=> start!53942 e!336218))

(assert (=> start!53942 true))

(declare-datatypes ((array!36786 0))(
  ( (array!36787 (arr!17666 (Array (_ BitVec 32) (_ BitVec 64))) (size!18030 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36786)

(declare-fun array_inv!13462 (array!36786) Bool)

(assert (=> start!53942 (array_inv!13462 a!2986)))

(declare-fun b!588829 () Bool)

(declare-fun res!376442 () Bool)

(assert (=> b!588829 (=> (not res!376442) (not e!336218))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!588829 (= res!376442 (and (= (size!18030 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18030 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18030 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!588830 () Bool)

(declare-fun e!336219 () Bool)

(declare-fun e!336216 () Bool)

(assert (=> b!588830 (= e!336219 e!336216)))

(declare-fun res!376435 () Bool)

(assert (=> b!588830 (=> (not res!376435) (not e!336216))))

(declare-datatypes ((SeekEntryResult!6106 0))(
  ( (MissingZero!6106 (index!26654 (_ BitVec 32))) (Found!6106 (index!26655 (_ BitVec 32))) (Intermediate!6106 (undefined!6918 Bool) (index!26656 (_ BitVec 32)) (x!55448 (_ BitVec 32))) (Undefined!6106) (MissingVacant!6106 (index!26657 (_ BitVec 32))) )
))
(declare-fun lt!266995 () SeekEntryResult!6106)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!588830 (= res!376435 (and (= lt!266995 (Found!6106 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17666 a!2986) index!984) (select (arr!17666 a!2986) j!136))) (not (= (select (arr!17666 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36786 (_ BitVec 32)) SeekEntryResult!6106)

(assert (=> b!588830 (= lt!266995 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17666 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!588831 () Bool)

(declare-fun res!376439 () Bool)

(declare-fun e!336214 () Bool)

(assert (=> b!588831 (=> (not res!376439) (not e!336214))))

(assert (=> b!588831 (= res!376439 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17666 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!588832 () Bool)

(declare-datatypes ((Unit!18342 0))(
  ( (Unit!18343) )
))
(declare-fun e!336217 () Unit!18342)

(declare-fun Unit!18344 () Unit!18342)

(assert (=> b!588832 (= e!336217 Unit!18344)))

(assert (=> b!588832 false))

(declare-fun b!588833 () Bool)

(declare-fun res!376432 () Bool)

(assert (=> b!588833 (=> (not res!376432) (not e!336218))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!588833 (= res!376432 (validKeyInArray!0 k!1786))))

(declare-fun b!588834 () Bool)

(declare-fun e!336213 () Bool)

(declare-fun lt!266997 () SeekEntryResult!6106)

(assert (=> b!588834 (= e!336213 (= lt!266995 lt!266997))))

(declare-fun b!588835 () Bool)

(assert (=> b!588835 (= e!336218 e!336214)))

(declare-fun res!376438 () Bool)

(assert (=> b!588835 (=> (not res!376438) (not e!336214))))

(declare-fun lt!266992 () SeekEntryResult!6106)

(assert (=> b!588835 (= res!376438 (or (= lt!266992 (MissingZero!6106 i!1108)) (= lt!266992 (MissingVacant!6106 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36786 (_ BitVec 32)) SeekEntryResult!6106)

(assert (=> b!588835 (= lt!266992 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!588836 () Bool)

(declare-fun res!376441 () Bool)

(assert (=> b!588836 (=> (not res!376441) (not e!336214))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36786 (_ BitVec 32)) Bool)

(assert (=> b!588836 (= res!376441 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!588837 () Bool)

(declare-fun res!376436 () Bool)

(assert (=> b!588837 (=> (not res!376436) (not e!336214))))

(declare-datatypes ((List!11707 0))(
  ( (Nil!11704) (Cons!11703 (h!12748 (_ BitVec 64)) (t!17935 List!11707)) )
))
(declare-fun arrayNoDuplicates!0 (array!36786 (_ BitVec 32) List!11707) Bool)

(assert (=> b!588837 (= res!376436 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11704))))

(declare-fun b!588838 () Bool)

(declare-fun res!376434 () Bool)

(assert (=> b!588838 (=> (not res!376434) (not e!336218))))

(declare-fun arrayContainsKey!0 (array!36786 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!588838 (= res!376434 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!588839 () Bool)

(declare-fun res!376437 () Bool)

(assert (=> b!588839 (=> (not res!376437) (not e!336218))))

(assert (=> b!588839 (= res!376437 (validKeyInArray!0 (select (arr!17666 a!2986) j!136)))))

(declare-fun b!588840 () Bool)

(assert (=> b!588840 (= e!336214 e!336219)))

(declare-fun res!376440 () Bool)

(assert (=> b!588840 (=> (not res!376440) (not e!336219))))

(assert (=> b!588840 (= res!376440 (= (select (store (arr!17666 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!266998 () array!36786)

(assert (=> b!588840 (= lt!266998 (array!36787 (store (arr!17666 a!2986) i!1108 k!1786) (size!18030 a!2986)))))

(declare-fun b!588841 () Bool)

(declare-fun Unit!18345 () Unit!18342)

(assert (=> b!588841 (= e!336217 Unit!18345)))

(declare-fun b!588842 () Bool)

(assert (=> b!588842 (= e!336216 (not (bvsge mask!3053 #b00000000000000000000000000000000)))))

(declare-fun lt!266993 () Unit!18342)

(assert (=> b!588842 (= lt!266993 e!336217)))

(declare-fun c!66566 () Bool)

(declare-fun lt!266996 () (_ BitVec 64))

(assert (=> b!588842 (= c!66566 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!266996 lt!266998 mask!3053) Undefined!6106))))

(assert (=> b!588842 e!336213))

(declare-fun res!376431 () Bool)

(assert (=> b!588842 (=> (not res!376431) (not e!336213))))

(declare-fun lt!266991 () (_ BitVec 32))

(assert (=> b!588842 (= res!376431 (= lt!266997 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266991 vacantSpotIndex!68 lt!266996 lt!266998 mask!3053)))))

(assert (=> b!588842 (= lt!266997 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266991 vacantSpotIndex!68 (select (arr!17666 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!588842 (= lt!266996 (select (store (arr!17666 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!266994 () Unit!18342)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36786 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18342)

(assert (=> b!588842 (= lt!266994 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!266991 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!588842 (= lt!266991 (nextIndex!0 index!984 x!910 mask!3053))))

(assert (= (and start!53942 res!376433) b!588829))

(assert (= (and b!588829 res!376442) b!588839))

(assert (= (and b!588839 res!376437) b!588833))

(assert (= (and b!588833 res!376432) b!588838))

(assert (= (and b!588838 res!376434) b!588835))

(assert (= (and b!588835 res!376438) b!588836))

(assert (= (and b!588836 res!376441) b!588837))

(assert (= (and b!588837 res!376436) b!588831))

(assert (= (and b!588831 res!376439) b!588840))

(assert (= (and b!588840 res!376440) b!588830))

(assert (= (and b!588830 res!376435) b!588842))

(assert (= (and b!588842 res!376431) b!588834))

(assert (= (and b!588842 c!66566) b!588832))

(assert (= (and b!588842 (not c!66566)) b!588841))

(declare-fun m!567387 () Bool)

(assert (=> b!588837 m!567387))

(declare-fun m!567389 () Bool)

(assert (=> b!588835 m!567389))

(declare-fun m!567391 () Bool)

(assert (=> b!588830 m!567391))

(declare-fun m!567393 () Bool)

(assert (=> b!588830 m!567393))

(assert (=> b!588830 m!567393))

(declare-fun m!567395 () Bool)

(assert (=> b!588830 m!567395))

(declare-fun m!567397 () Bool)

(assert (=> b!588840 m!567397))

(declare-fun m!567399 () Bool)

(assert (=> b!588840 m!567399))

(declare-fun m!567401 () Bool)

(assert (=> b!588831 m!567401))

(declare-fun m!567403 () Bool)

(assert (=> b!588838 m!567403))

(assert (=> b!588839 m!567393))

(assert (=> b!588839 m!567393))

(declare-fun m!567405 () Bool)

(assert (=> b!588839 m!567405))

(declare-fun m!567407 () Bool)

(assert (=> start!53942 m!567407))

(declare-fun m!567409 () Bool)

(assert (=> start!53942 m!567409))

(declare-fun m!567411 () Bool)

(assert (=> b!588836 m!567411))

(declare-fun m!567413 () Bool)

(assert (=> b!588833 m!567413))

(declare-fun m!567415 () Bool)

(assert (=> b!588842 m!567415))

(assert (=> b!588842 m!567393))

(assert (=> b!588842 m!567397))

(declare-fun m!567417 () Bool)

(assert (=> b!588842 m!567417))

(declare-fun m!567419 () Bool)

(assert (=> b!588842 m!567419))

(assert (=> b!588842 m!567393))

(declare-fun m!567421 () Bool)

(assert (=> b!588842 m!567421))

(declare-fun m!567423 () Bool)

(assert (=> b!588842 m!567423))

(declare-fun m!567425 () Bool)

(assert (=> b!588842 m!567425))

(push 1)

