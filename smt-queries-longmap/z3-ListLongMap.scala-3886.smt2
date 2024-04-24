; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53376 () Bool)

(assert start!53376)

(declare-fun b!580115 () Bool)

(declare-fun e!333288 () Bool)

(assert (=> b!580115 (= e!333288 false)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5779 0))(
  ( (MissingZero!5779 (index!25343 (_ BitVec 32))) (Found!5779 (index!25344 (_ BitVec 32))) (Intermediate!5779 (undefined!6591 Bool) (index!25345 (_ BitVec 32)) (x!54379 (_ BitVec 32))) (Undefined!5779) (MissingVacant!5779 (index!25346 (_ BitVec 32))) )
))
(declare-fun lt!264699 () SeekEntryResult!5779)

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36222 0))(
  ( (array!36223 (arr!17383 (Array (_ BitVec 32) (_ BitVec 64))) (size!17747 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36222)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36222 (_ BitVec 32)) SeekEntryResult!5779)

(assert (=> b!580115 (= lt!264699 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17383 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!580116 () Bool)

(declare-fun res!367828 () Bool)

(declare-fun e!333286 () Bool)

(assert (=> b!580116 (=> (not res!367828) (not e!333286))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!580116 (= res!367828 (and (= (size!17747 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17747 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17747 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!580117 () Bool)

(declare-fun res!367831 () Bool)

(assert (=> b!580117 (=> (not res!367831) (not e!333288))))

(declare-datatypes ((List!11331 0))(
  ( (Nil!11328) (Cons!11327 (h!12375 (_ BitVec 64)) (t!17551 List!11331)) )
))
(declare-fun arrayNoDuplicates!0 (array!36222 (_ BitVec 32) List!11331) Bool)

(assert (=> b!580117 (= res!367831 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11328))))

(declare-fun b!580118 () Bool)

(declare-fun res!367826 () Bool)

(assert (=> b!580118 (=> (not res!367826) (not e!333288))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36222 (_ BitVec 32)) Bool)

(assert (=> b!580118 (= res!367826 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!580119 () Bool)

(declare-fun res!367834 () Bool)

(assert (=> b!580119 (=> (not res!367834) (not e!333286))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36222 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!580119 (= res!367834 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!580120 () Bool)

(declare-fun res!367832 () Bool)

(assert (=> b!580120 (=> (not res!367832) (not e!333288))))

(assert (=> b!580120 (= res!367832 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17383 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17383 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!580121 () Bool)

(declare-fun res!367829 () Bool)

(assert (=> b!580121 (=> (not res!367829) (not e!333286))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!580121 (= res!367829 (validKeyInArray!0 (select (arr!17383 a!2986) j!136)))))

(declare-fun b!580122 () Bool)

(declare-fun res!367830 () Bool)

(assert (=> b!580122 (=> (not res!367830) (not e!333286))))

(assert (=> b!580122 (= res!367830 (validKeyInArray!0 k0!1786))))

(declare-fun res!367833 () Bool)

(assert (=> start!53376 (=> (not res!367833) (not e!333286))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53376 (= res!367833 (validMask!0 mask!3053))))

(assert (=> start!53376 e!333286))

(assert (=> start!53376 true))

(declare-fun array_inv!13242 (array!36222) Bool)

(assert (=> start!53376 (array_inv!13242 a!2986)))

(declare-fun b!580123 () Bool)

(assert (=> b!580123 (= e!333286 e!333288)))

(declare-fun res!367827 () Bool)

(assert (=> b!580123 (=> (not res!367827) (not e!333288))))

(declare-fun lt!264700 () SeekEntryResult!5779)

(assert (=> b!580123 (= res!367827 (or (= lt!264700 (MissingZero!5779 i!1108)) (= lt!264700 (MissingVacant!5779 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36222 (_ BitVec 32)) SeekEntryResult!5779)

(assert (=> b!580123 (= lt!264700 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(assert (= (and start!53376 res!367833) b!580116))

(assert (= (and b!580116 res!367828) b!580121))

(assert (= (and b!580121 res!367829) b!580122))

(assert (= (and b!580122 res!367830) b!580119))

(assert (= (and b!580119 res!367834) b!580123))

(assert (= (and b!580123 res!367827) b!580118))

(assert (= (and b!580118 res!367826) b!580117))

(assert (= (and b!580117 res!367831) b!580120))

(assert (= (and b!580120 res!367832) b!580115))

(declare-fun m!558869 () Bool)

(assert (=> b!580120 m!558869))

(declare-fun m!558871 () Bool)

(assert (=> b!580120 m!558871))

(declare-fun m!558873 () Bool)

(assert (=> b!580120 m!558873))

(declare-fun m!558875 () Bool)

(assert (=> b!580118 m!558875))

(declare-fun m!558877 () Bool)

(assert (=> b!580123 m!558877))

(declare-fun m!558879 () Bool)

(assert (=> b!580115 m!558879))

(assert (=> b!580115 m!558879))

(declare-fun m!558881 () Bool)

(assert (=> b!580115 m!558881))

(declare-fun m!558883 () Bool)

(assert (=> start!53376 m!558883))

(declare-fun m!558885 () Bool)

(assert (=> start!53376 m!558885))

(declare-fun m!558887 () Bool)

(assert (=> b!580119 m!558887))

(assert (=> b!580121 m!558879))

(assert (=> b!580121 m!558879))

(declare-fun m!558889 () Bool)

(assert (=> b!580121 m!558889))

(declare-fun m!558891 () Bool)

(assert (=> b!580117 m!558891))

(declare-fun m!558893 () Bool)

(assert (=> b!580122 m!558893))

(check-sat (not start!53376) (not b!580119) (not b!580115) (not b!580122) (not b!580123) (not b!580118) (not b!580117) (not b!580121))
(check-sat)
