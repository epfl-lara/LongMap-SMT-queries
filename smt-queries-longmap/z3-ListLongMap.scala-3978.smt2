; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53940 () Bool)

(assert start!53940)

(declare-fun b!588787 () Bool)

(declare-datatypes ((Unit!18338 0))(
  ( (Unit!18339) )
))
(declare-fun e!336198 () Unit!18338)

(declare-fun Unit!18340 () Unit!18338)

(assert (=> b!588787 (= e!336198 Unit!18340)))

(declare-fun res!376400 () Bool)

(declare-fun e!336192 () Bool)

(assert (=> start!53940 (=> (not res!376400) (not e!336192))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53940 (= res!376400 (validMask!0 mask!3053))))

(assert (=> start!53940 e!336192))

(assert (=> start!53940 true))

(declare-datatypes ((array!36784 0))(
  ( (array!36785 (arr!17665 (Array (_ BitVec 32) (_ BitVec 64))) (size!18029 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36784)

(declare-fun array_inv!13461 (array!36784) Bool)

(assert (=> start!53940 (array_inv!13461 a!2986)))

(declare-fun b!588788 () Bool)

(declare-fun res!376399 () Bool)

(declare-fun e!336194 () Bool)

(assert (=> b!588788 (=> (not res!376399) (not e!336194))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!588788 (= res!376399 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17665 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!588789 () Bool)

(declare-fun res!376398 () Bool)

(assert (=> b!588789 (=> (not res!376398) (not e!336192))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!588789 (= res!376398 (and (= (size!18029 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18029 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18029 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!588790 () Bool)

(declare-fun e!336193 () Bool)

(assert (=> b!588790 (= e!336194 e!336193)))

(declare-fun res!376406 () Bool)

(assert (=> b!588790 (=> (not res!376406) (not e!336193))))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!588790 (= res!376406 (= (select (store (arr!17665 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!266971 () array!36784)

(assert (=> b!588790 (= lt!266971 (array!36785 (store (arr!17665 a!2986) i!1108 k0!1786) (size!18029 a!2986)))))

(declare-fun b!588791 () Bool)

(declare-fun e!336196 () Bool)

(assert (=> b!588791 (= e!336196 (not (bvsge mask!3053 #b00000000000000000000000000000000)))))

(declare-fun lt!266972 () Unit!18338)

(assert (=> b!588791 (= lt!266972 e!336198)))

(declare-fun c!66563 () Bool)

(declare-fun lt!266973 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!6105 0))(
  ( (MissingZero!6105 (index!26650 (_ BitVec 32))) (Found!6105 (index!26651 (_ BitVec 32))) (Intermediate!6105 (undefined!6917 Bool) (index!26652 (_ BitVec 32)) (x!55447 (_ BitVec 32))) (Undefined!6105) (MissingVacant!6105 (index!26653 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36784 (_ BitVec 32)) SeekEntryResult!6105)

(assert (=> b!588791 (= c!66563 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!266973 lt!266971 mask!3053) Undefined!6105))))

(declare-fun e!336195 () Bool)

(assert (=> b!588791 e!336195))

(declare-fun res!376402 () Bool)

(assert (=> b!588791 (=> (not res!376402) (not e!336195))))

(declare-fun lt!266967 () (_ BitVec 32))

(declare-fun lt!266974 () SeekEntryResult!6105)

(assert (=> b!588791 (= res!376402 (= lt!266974 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266967 vacantSpotIndex!68 lt!266973 lt!266971 mask!3053)))))

(assert (=> b!588791 (= lt!266974 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266967 vacantSpotIndex!68 (select (arr!17665 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!588791 (= lt!266973 (select (store (arr!17665 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!266968 () Unit!18338)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36784 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18338)

(assert (=> b!588791 (= lt!266968 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!266967 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!588791 (= lt!266967 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!588792 () Bool)

(declare-fun Unit!18341 () Unit!18338)

(assert (=> b!588792 (= e!336198 Unit!18341)))

(assert (=> b!588792 false))

(declare-fun b!588793 () Bool)

(declare-fun res!376405 () Bool)

(assert (=> b!588793 (=> (not res!376405) (not e!336194))))

(declare-datatypes ((List!11706 0))(
  ( (Nil!11703) (Cons!11702 (h!12747 (_ BitVec 64)) (t!17934 List!11706)) )
))
(declare-fun arrayNoDuplicates!0 (array!36784 (_ BitVec 32) List!11706) Bool)

(assert (=> b!588793 (= res!376405 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11703))))

(declare-fun b!588794 () Bool)

(declare-fun res!376395 () Bool)

(assert (=> b!588794 (=> (not res!376395) (not e!336192))))

(declare-fun arrayContainsKey!0 (array!36784 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!588794 (= res!376395 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!588795 () Bool)

(assert (=> b!588795 (= e!336192 e!336194)))

(declare-fun res!376396 () Bool)

(assert (=> b!588795 (=> (not res!376396) (not e!336194))))

(declare-fun lt!266969 () SeekEntryResult!6105)

(assert (=> b!588795 (= res!376396 (or (= lt!266969 (MissingZero!6105 i!1108)) (= lt!266969 (MissingVacant!6105 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36784 (_ BitVec 32)) SeekEntryResult!6105)

(assert (=> b!588795 (= lt!266969 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!588796 () Bool)

(declare-fun res!376397 () Bool)

(assert (=> b!588796 (=> (not res!376397) (not e!336192))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!588796 (= res!376397 (validKeyInArray!0 k0!1786))))

(declare-fun b!588797 () Bool)

(declare-fun res!376404 () Bool)

(assert (=> b!588797 (=> (not res!376404) (not e!336194))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36784 (_ BitVec 32)) Bool)

(assert (=> b!588797 (= res!376404 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!588798 () Bool)

(declare-fun lt!266970 () SeekEntryResult!6105)

(assert (=> b!588798 (= e!336195 (= lt!266970 lt!266974))))

(declare-fun b!588799 () Bool)

(declare-fun res!376401 () Bool)

(assert (=> b!588799 (=> (not res!376401) (not e!336192))))

(assert (=> b!588799 (= res!376401 (validKeyInArray!0 (select (arr!17665 a!2986) j!136)))))

(declare-fun b!588800 () Bool)

(assert (=> b!588800 (= e!336193 e!336196)))

(declare-fun res!376403 () Bool)

(assert (=> b!588800 (=> (not res!376403) (not e!336196))))

(assert (=> b!588800 (= res!376403 (and (= lt!266970 (Found!6105 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17665 a!2986) index!984) (select (arr!17665 a!2986) j!136))) (not (= (select (arr!17665 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!588800 (= lt!266970 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17665 a!2986) j!136) a!2986 mask!3053))))

(assert (= (and start!53940 res!376400) b!588789))

(assert (= (and b!588789 res!376398) b!588799))

(assert (= (and b!588799 res!376401) b!588796))

(assert (= (and b!588796 res!376397) b!588794))

(assert (= (and b!588794 res!376395) b!588795))

(assert (= (and b!588795 res!376396) b!588797))

(assert (= (and b!588797 res!376404) b!588793))

(assert (= (and b!588793 res!376405) b!588788))

(assert (= (and b!588788 res!376399) b!588790))

(assert (= (and b!588790 res!376406) b!588800))

(assert (= (and b!588800 res!376403) b!588791))

(assert (= (and b!588791 res!376402) b!588798))

(assert (= (and b!588791 c!66563) b!588792))

(assert (= (and b!588791 (not c!66563)) b!588787))

(declare-fun m!567347 () Bool)

(assert (=> b!588797 m!567347))

(declare-fun m!567349 () Bool)

(assert (=> start!53940 m!567349))

(declare-fun m!567351 () Bool)

(assert (=> start!53940 m!567351))

(declare-fun m!567353 () Bool)

(assert (=> b!588794 m!567353))

(declare-fun m!567355 () Bool)

(assert (=> b!588799 m!567355))

(assert (=> b!588799 m!567355))

(declare-fun m!567357 () Bool)

(assert (=> b!588799 m!567357))

(declare-fun m!567359 () Bool)

(assert (=> b!588788 m!567359))

(declare-fun m!567361 () Bool)

(assert (=> b!588790 m!567361))

(declare-fun m!567363 () Bool)

(assert (=> b!588790 m!567363))

(declare-fun m!567365 () Bool)

(assert (=> b!588791 m!567365))

(declare-fun m!567367 () Bool)

(assert (=> b!588791 m!567367))

(assert (=> b!588791 m!567355))

(assert (=> b!588791 m!567361))

(declare-fun m!567369 () Bool)

(assert (=> b!588791 m!567369))

(declare-fun m!567371 () Bool)

(assert (=> b!588791 m!567371))

(declare-fun m!567373 () Bool)

(assert (=> b!588791 m!567373))

(assert (=> b!588791 m!567355))

(declare-fun m!567375 () Bool)

(assert (=> b!588791 m!567375))

(declare-fun m!567377 () Bool)

(assert (=> b!588795 m!567377))

(declare-fun m!567379 () Bool)

(assert (=> b!588793 m!567379))

(declare-fun m!567381 () Bool)

(assert (=> b!588800 m!567381))

(assert (=> b!588800 m!567355))

(assert (=> b!588800 m!567355))

(declare-fun m!567383 () Bool)

(assert (=> b!588800 m!567383))

(declare-fun m!567385 () Bool)

(assert (=> b!588796 m!567385))

(check-sat (not b!588791) (not b!588793) (not start!53940) (not b!588795) (not b!588796) (not b!588794) (not b!588800) (not b!588799) (not b!588797))
(check-sat)
