; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53248 () Bool)

(assert start!53248)

(declare-fun b!578862 () Bool)

(declare-fun res!366679 () Bool)

(declare-fun e!332808 () Bool)

(assert (=> b!578862 (=> (not res!366679) (not e!332808))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!36149 0))(
  ( (array!36150 (arr!17349 (Array (_ BitVec 32) (_ BitVec 64))) (size!17713 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36149)

(assert (=> b!578862 (= res!366679 (and (= (size!17713 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17713 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17713 a!2986)) (not (= i!1108 j!136))))))

(declare-fun res!366685 () Bool)

(assert (=> start!53248 (=> (not res!366685) (not e!332808))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53248 (= res!366685 (validMask!0 mask!3053))))

(assert (=> start!53248 e!332808))

(assert (=> start!53248 true))

(declare-fun array_inv!13145 (array!36149) Bool)

(assert (=> start!53248 (array_inv!13145 a!2986)))

(declare-fun b!578863 () Bool)

(declare-fun res!366681 () Bool)

(declare-fun e!332806 () Bool)

(assert (=> b!578863 (=> (not res!366681) (not e!332806))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!578863 (= res!366681 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17349 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17349 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!578864 () Bool)

(assert (=> b!578864 (= e!332806 false)))

(declare-datatypes ((SeekEntryResult!5789 0))(
  ( (MissingZero!5789 (index!25383 (_ BitVec 32))) (Found!5789 (index!25384 (_ BitVec 32))) (Intermediate!5789 (undefined!6601 Bool) (index!25385 (_ BitVec 32)) (x!54282 (_ BitVec 32))) (Undefined!5789) (MissingVacant!5789 (index!25386 (_ BitVec 32))) )
))
(declare-fun lt!264355 () SeekEntryResult!5789)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36149 (_ BitVec 32)) SeekEntryResult!5789)

(assert (=> b!578864 (= lt!264355 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17349 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!578865 () Bool)

(declare-fun res!366683 () Bool)

(assert (=> b!578865 (=> (not res!366683) (not e!332806))))

(declare-datatypes ((List!11390 0))(
  ( (Nil!11387) (Cons!11386 (h!12431 (_ BitVec 64)) (t!17618 List!11390)) )
))
(declare-fun arrayNoDuplicates!0 (array!36149 (_ BitVec 32) List!11390) Bool)

(assert (=> b!578865 (= res!366683 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11387))))

(declare-fun b!578866 () Bool)

(declare-fun res!366686 () Bool)

(assert (=> b!578866 (=> (not res!366686) (not e!332808))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!578866 (= res!366686 (validKeyInArray!0 (select (arr!17349 a!2986) j!136)))))

(declare-fun b!578867 () Bool)

(declare-fun res!366678 () Bool)

(assert (=> b!578867 (=> (not res!366678) (not e!332806))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36149 (_ BitVec 32)) Bool)

(assert (=> b!578867 (= res!366678 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!578868 () Bool)

(assert (=> b!578868 (= e!332808 e!332806)))

(declare-fun res!366680 () Bool)

(assert (=> b!578868 (=> (not res!366680) (not e!332806))))

(declare-fun lt!264354 () SeekEntryResult!5789)

(assert (=> b!578868 (= res!366680 (or (= lt!264354 (MissingZero!5789 i!1108)) (= lt!264354 (MissingVacant!5789 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36149 (_ BitVec 32)) SeekEntryResult!5789)

(assert (=> b!578868 (= lt!264354 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!578869 () Bool)

(declare-fun res!366684 () Bool)

(assert (=> b!578869 (=> (not res!366684) (not e!332808))))

(assert (=> b!578869 (= res!366684 (validKeyInArray!0 k!1786))))

(declare-fun b!578870 () Bool)

(declare-fun res!366682 () Bool)

(assert (=> b!578870 (=> (not res!366682) (not e!332808))))

(declare-fun arrayContainsKey!0 (array!36149 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!578870 (= res!366682 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(assert (= (and start!53248 res!366685) b!578862))

(assert (= (and b!578862 res!366679) b!578866))

(assert (= (and b!578866 res!366686) b!578869))

(assert (= (and b!578869 res!366684) b!578870))

(assert (= (and b!578870 res!366682) b!578868))

(assert (= (and b!578868 res!366680) b!578867))

(assert (= (and b!578867 res!366678) b!578865))

(assert (= (and b!578865 res!366683) b!578863))

(assert (= (and b!578863 res!366681) b!578864))

(declare-fun m!557503 () Bool)

(assert (=> b!578869 m!557503))

(declare-fun m!557505 () Bool)

(assert (=> b!578866 m!557505))

(assert (=> b!578866 m!557505))

(declare-fun m!557507 () Bool)

(assert (=> b!578866 m!557507))

(declare-fun m!557509 () Bool)

(assert (=> b!578870 m!557509))

(declare-fun m!557511 () Bool)

(assert (=> b!578867 m!557511))

(declare-fun m!557513 () Bool)

(assert (=> b!578863 m!557513))

(declare-fun m!557515 () Bool)

(assert (=> b!578863 m!557515))

(declare-fun m!557517 () Bool)

(assert (=> b!578863 m!557517))

(assert (=> b!578864 m!557505))

(assert (=> b!578864 m!557505))

(declare-fun m!557519 () Bool)

(assert (=> b!578864 m!557519))

(declare-fun m!557521 () Bool)

(assert (=> b!578865 m!557521))

(declare-fun m!557523 () Bool)

(assert (=> b!578868 m!557523))

(declare-fun m!557525 () Bool)

(assert (=> start!53248 m!557525))

(declare-fun m!557527 () Bool)

(assert (=> start!53248 m!557527))

(push 1)

(assert (not b!578869))

(assert (not b!578870))

(assert (not b!578865))

(assert (not start!53248))

(assert (not b!578866))

(assert (not b!578864))

(assert (not b!578867))

(assert (not b!578868))

(check-sat)

(pop 1)

