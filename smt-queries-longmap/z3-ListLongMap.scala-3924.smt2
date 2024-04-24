; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53604 () Bool)

(assert start!53604)

(declare-fun b!583229 () Bool)

(declare-fun res!370947 () Bool)

(declare-fun e!334312 () Bool)

(assert (=> b!583229 (=> (not res!370947) (not e!334312))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36450 0))(
  ( (array!36451 (arr!17497 (Array (_ BitVec 32) (_ BitVec 64))) (size!17861 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36450)

(assert (=> b!583229 (= res!370947 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17497 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17497 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!583230 () Bool)

(declare-fun res!370944 () Bool)

(assert (=> b!583230 (=> (not res!370944) (not e!334312))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36450 (_ BitVec 32)) Bool)

(assert (=> b!583230 (= res!370944 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!583231 () Bool)

(declare-fun res!370942 () Bool)

(declare-fun e!334314 () Bool)

(assert (=> b!583231 (=> (not res!370942) (not e!334314))))

(declare-fun arrayContainsKey!0 (array!36450 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!583231 (= res!370942 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!583232 () Bool)

(declare-fun res!370945 () Bool)

(assert (=> b!583232 (=> (not res!370945) (not e!334314))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!583232 (= res!370945 (validKeyInArray!0 k0!1786))))

(declare-fun b!583233 () Bool)

(assert (=> b!583233 (= e!334312 false)))

(declare-datatypes ((SeekEntryResult!5893 0))(
  ( (MissingZero!5893 (index!25799 (_ BitVec 32))) (Found!5893 (index!25800 (_ BitVec 32))) (Intermediate!5893 (undefined!6705 Bool) (index!25801 (_ BitVec 32)) (x!54797 (_ BitVec 32))) (Undefined!5893) (MissingVacant!5893 (index!25802 (_ BitVec 32))) )
))
(declare-fun lt!265357 () SeekEntryResult!5893)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36450 (_ BitVec 32)) SeekEntryResult!5893)

(assert (=> b!583233 (= lt!265357 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17497 a!2986) j!136) a!2986 mask!3053))))

(declare-fun res!370943 () Bool)

(assert (=> start!53604 (=> (not res!370943) (not e!334314))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53604 (= res!370943 (validMask!0 mask!3053))))

(assert (=> start!53604 e!334314))

(assert (=> start!53604 true))

(declare-fun array_inv!13356 (array!36450) Bool)

(assert (=> start!53604 (array_inv!13356 a!2986)))

(declare-fun b!583234 () Bool)

(declare-fun res!370940 () Bool)

(assert (=> b!583234 (=> (not res!370940) (not e!334314))))

(assert (=> b!583234 (= res!370940 (and (= (size!17861 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17861 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17861 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!583235 () Bool)

(declare-fun res!370948 () Bool)

(assert (=> b!583235 (=> (not res!370948) (not e!334312))))

(declare-datatypes ((List!11445 0))(
  ( (Nil!11442) (Cons!11441 (h!12489 (_ BitVec 64)) (t!17665 List!11445)) )
))
(declare-fun arrayNoDuplicates!0 (array!36450 (_ BitVec 32) List!11445) Bool)

(assert (=> b!583235 (= res!370948 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11442))))

(declare-fun b!583236 () Bool)

(declare-fun res!370946 () Bool)

(assert (=> b!583236 (=> (not res!370946) (not e!334314))))

(assert (=> b!583236 (= res!370946 (validKeyInArray!0 (select (arr!17497 a!2986) j!136)))))

(declare-fun b!583237 () Bool)

(assert (=> b!583237 (= e!334314 e!334312)))

(declare-fun res!370941 () Bool)

(assert (=> b!583237 (=> (not res!370941) (not e!334312))))

(declare-fun lt!265356 () SeekEntryResult!5893)

(assert (=> b!583237 (= res!370941 (or (= lt!265356 (MissingZero!5893 i!1108)) (= lt!265356 (MissingVacant!5893 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36450 (_ BitVec 32)) SeekEntryResult!5893)

(assert (=> b!583237 (= lt!265356 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(assert (= (and start!53604 res!370943) b!583234))

(assert (= (and b!583234 res!370940) b!583236))

(assert (= (and b!583236 res!370946) b!583232))

(assert (= (and b!583232 res!370945) b!583231))

(assert (= (and b!583231 res!370942) b!583237))

(assert (= (and b!583237 res!370941) b!583230))

(assert (= (and b!583230 res!370944) b!583235))

(assert (= (and b!583235 res!370948) b!583229))

(assert (= (and b!583229 res!370947) b!583233))

(declare-fun m!561863 () Bool)

(assert (=> b!583233 m!561863))

(assert (=> b!583233 m!561863))

(declare-fun m!561865 () Bool)

(assert (=> b!583233 m!561865))

(declare-fun m!561867 () Bool)

(assert (=> b!583229 m!561867))

(declare-fun m!561869 () Bool)

(assert (=> b!583229 m!561869))

(declare-fun m!561871 () Bool)

(assert (=> b!583229 m!561871))

(declare-fun m!561873 () Bool)

(assert (=> b!583232 m!561873))

(declare-fun m!561875 () Bool)

(assert (=> b!583230 m!561875))

(declare-fun m!561877 () Bool)

(assert (=> b!583231 m!561877))

(declare-fun m!561879 () Bool)

(assert (=> b!583237 m!561879))

(declare-fun m!561881 () Bool)

(assert (=> b!583235 m!561881))

(assert (=> b!583236 m!561863))

(assert (=> b!583236 m!561863))

(declare-fun m!561883 () Bool)

(assert (=> b!583236 m!561883))

(declare-fun m!561885 () Bool)

(assert (=> start!53604 m!561885))

(declare-fun m!561887 () Bool)

(assert (=> start!53604 m!561887))

(check-sat (not b!583230) (not b!583235) (not b!583237) (not b!583233) (not b!583231) (not b!583236) (not b!583232) (not start!53604))
(check-sat)
