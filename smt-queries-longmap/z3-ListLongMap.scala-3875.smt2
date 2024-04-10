; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53262 () Bool)

(assert start!53262)

(declare-fun b!579051 () Bool)

(declare-fun res!366870 () Bool)

(declare-fun e!332870 () Bool)

(assert (=> b!579051 (=> (not res!366870) (not e!332870))))

(declare-datatypes ((array!36163 0))(
  ( (array!36164 (arr!17356 (Array (_ BitVec 32) (_ BitVec 64))) (size!17720 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36163)

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36163 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!579051 (= res!366870 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun res!366869 () Bool)

(assert (=> start!53262 (=> (not res!366869) (not e!332870))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53262 (= res!366869 (validMask!0 mask!3053))))

(assert (=> start!53262 e!332870))

(assert (=> start!53262 true))

(declare-fun array_inv!13152 (array!36163) Bool)

(assert (=> start!53262 (array_inv!13152 a!2986)))

(declare-fun b!579052 () Bool)

(declare-fun res!366868 () Bool)

(assert (=> b!579052 (=> (not res!366868) (not e!332870))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!579052 (= res!366868 (and (= (size!17720 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17720 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17720 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!579053 () Bool)

(declare-fun e!332869 () Bool)

(assert (=> b!579053 (= e!332870 e!332869)))

(declare-fun res!366872 () Bool)

(assert (=> b!579053 (=> (not res!366872) (not e!332869))))

(declare-datatypes ((SeekEntryResult!5796 0))(
  ( (MissingZero!5796 (index!25411 (_ BitVec 32))) (Found!5796 (index!25412 (_ BitVec 32))) (Intermediate!5796 (undefined!6608 Bool) (index!25413 (_ BitVec 32)) (x!54305 (_ BitVec 32))) (Undefined!5796) (MissingVacant!5796 (index!25414 (_ BitVec 32))) )
))
(declare-fun lt!264396 () SeekEntryResult!5796)

(assert (=> b!579053 (= res!366872 (or (= lt!264396 (MissingZero!5796 i!1108)) (= lt!264396 (MissingVacant!5796 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36163 (_ BitVec 32)) SeekEntryResult!5796)

(assert (=> b!579053 (= lt!264396 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!579054 () Bool)

(declare-fun res!366871 () Bool)

(assert (=> b!579054 (=> (not res!366871) (not e!332869))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!579054 (= res!366871 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17356 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17356 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!579055 () Bool)

(declare-fun res!366873 () Bool)

(assert (=> b!579055 (=> (not res!366873) (not e!332870))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!579055 (= res!366873 (validKeyInArray!0 (select (arr!17356 a!2986) j!136)))))

(declare-fun b!579056 () Bool)

(assert (=> b!579056 (= e!332869 false)))

(declare-fun lt!264397 () SeekEntryResult!5796)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36163 (_ BitVec 32)) SeekEntryResult!5796)

(assert (=> b!579056 (= lt!264397 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17356 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!579057 () Bool)

(declare-fun res!366874 () Bool)

(assert (=> b!579057 (=> (not res!366874) (not e!332869))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36163 (_ BitVec 32)) Bool)

(assert (=> b!579057 (= res!366874 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!579058 () Bool)

(declare-fun res!366867 () Bool)

(assert (=> b!579058 (=> (not res!366867) (not e!332869))))

(declare-datatypes ((List!11397 0))(
  ( (Nil!11394) (Cons!11393 (h!12438 (_ BitVec 64)) (t!17625 List!11397)) )
))
(declare-fun arrayNoDuplicates!0 (array!36163 (_ BitVec 32) List!11397) Bool)

(assert (=> b!579058 (= res!366867 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11394))))

(declare-fun b!579059 () Bool)

(declare-fun res!366875 () Bool)

(assert (=> b!579059 (=> (not res!366875) (not e!332870))))

(assert (=> b!579059 (= res!366875 (validKeyInArray!0 k0!1786))))

(assert (= (and start!53262 res!366869) b!579052))

(assert (= (and b!579052 res!366868) b!579055))

(assert (= (and b!579055 res!366873) b!579059))

(assert (= (and b!579059 res!366875) b!579051))

(assert (= (and b!579051 res!366870) b!579053))

(assert (= (and b!579053 res!366872) b!579057))

(assert (= (and b!579057 res!366874) b!579058))

(assert (= (and b!579058 res!366867) b!579054))

(assert (= (and b!579054 res!366871) b!579056))

(declare-fun m!557685 () Bool)

(assert (=> b!579058 m!557685))

(declare-fun m!557687 () Bool)

(assert (=> b!579051 m!557687))

(declare-fun m!557689 () Bool)

(assert (=> b!579059 m!557689))

(declare-fun m!557691 () Bool)

(assert (=> b!579057 m!557691))

(declare-fun m!557693 () Bool)

(assert (=> b!579056 m!557693))

(assert (=> b!579056 m!557693))

(declare-fun m!557695 () Bool)

(assert (=> b!579056 m!557695))

(declare-fun m!557697 () Bool)

(assert (=> b!579053 m!557697))

(assert (=> b!579055 m!557693))

(assert (=> b!579055 m!557693))

(declare-fun m!557699 () Bool)

(assert (=> b!579055 m!557699))

(declare-fun m!557701 () Bool)

(assert (=> start!53262 m!557701))

(declare-fun m!557703 () Bool)

(assert (=> start!53262 m!557703))

(declare-fun m!557705 () Bool)

(assert (=> b!579054 m!557705))

(declare-fun m!557707 () Bool)

(assert (=> b!579054 m!557707))

(declare-fun m!557709 () Bool)

(assert (=> b!579054 m!557709))

(check-sat (not b!579058) (not b!579051) (not b!579059) (not b!579053) (not b!579055) (not start!53262) (not b!579056) (not b!579057))
