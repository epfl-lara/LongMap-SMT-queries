; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53510 () Bool)

(assert start!53510)

(declare-fun b!582435 () Bool)

(declare-fun res!370252 () Bool)

(declare-fun e!333985 () Bool)

(assert (=> b!582435 (=> (not res!370252) (not e!333985))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!582435 (= res!370252 (validKeyInArray!0 k!1786))))

(declare-fun b!582436 () Bool)

(declare-fun res!370258 () Bool)

(assert (=> b!582436 (=> (not res!370258) (not e!333985))))

(declare-datatypes ((array!36411 0))(
  ( (array!36412 (arr!17480 (Array (_ BitVec 32) (_ BitVec 64))) (size!17844 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36411)

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!582436 (= res!370258 (validKeyInArray!0 (select (arr!17480 a!2986) j!136)))))

(declare-fun b!582437 () Bool)

(declare-fun res!370254 () Bool)

(assert (=> b!582437 (=> (not res!370254) (not e!333985))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!582437 (= res!370254 (and (= (size!17844 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17844 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17844 a!2986)) (not (= i!1108 j!136))))))

(declare-fun res!370255 () Bool)

(assert (=> start!53510 (=> (not res!370255) (not e!333985))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53510 (= res!370255 (validMask!0 mask!3053))))

(assert (=> start!53510 e!333985))

(assert (=> start!53510 true))

(declare-fun array_inv!13276 (array!36411) Bool)

(assert (=> start!53510 (array_inv!13276 a!2986)))

(declare-fun b!582438 () Bool)

(declare-fun res!370253 () Bool)

(declare-fun e!333987 () Bool)

(assert (=> b!582438 (=> (not res!370253) (not e!333987))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36411 (_ BitVec 32)) Bool)

(assert (=> b!582438 (= res!370253 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!582439 () Bool)

(assert (=> b!582439 (= e!333987 false)))

(declare-datatypes ((SeekEntryResult!5920 0))(
  ( (MissingZero!5920 (index!25907 (_ BitVec 32))) (Found!5920 (index!25908 (_ BitVec 32))) (Intermediate!5920 (undefined!6732 Bool) (index!25909 (_ BitVec 32)) (x!54757 (_ BitVec 32))) (Undefined!5920) (MissingVacant!5920 (index!25910 (_ BitVec 32))) )
))
(declare-fun lt!265114 () SeekEntryResult!5920)

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36411 (_ BitVec 32)) SeekEntryResult!5920)

(assert (=> b!582439 (= lt!265114 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17480 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!582440 () Bool)

(declare-fun res!370257 () Bool)

(assert (=> b!582440 (=> (not res!370257) (not e!333987))))

(declare-datatypes ((List!11521 0))(
  ( (Nil!11518) (Cons!11517 (h!12562 (_ BitVec 64)) (t!17749 List!11521)) )
))
(declare-fun arrayNoDuplicates!0 (array!36411 (_ BitVec 32) List!11521) Bool)

(assert (=> b!582440 (= res!370257 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11518))))

(declare-fun b!582441 () Bool)

(declare-fun res!370256 () Bool)

(assert (=> b!582441 (=> (not res!370256) (not e!333985))))

(declare-fun arrayContainsKey!0 (array!36411 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!582441 (= res!370256 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!582442 () Bool)

(assert (=> b!582442 (= e!333985 e!333987)))

(declare-fun res!370251 () Bool)

(assert (=> b!582442 (=> (not res!370251) (not e!333987))))

(declare-fun lt!265113 () SeekEntryResult!5920)

(assert (=> b!582442 (= res!370251 (or (= lt!265113 (MissingZero!5920 i!1108)) (= lt!265113 (MissingVacant!5920 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36411 (_ BitVec 32)) SeekEntryResult!5920)

(assert (=> b!582442 (= lt!265113 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!582443 () Bool)

(declare-fun res!370259 () Bool)

(assert (=> b!582443 (=> (not res!370259) (not e!333987))))

(assert (=> b!582443 (= res!370259 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17480 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17480 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!53510 res!370255) b!582437))

(assert (= (and b!582437 res!370254) b!582436))

(assert (= (and b!582436 res!370258) b!582435))

(assert (= (and b!582435 res!370252) b!582441))

(assert (= (and b!582441 res!370256) b!582442))

(assert (= (and b!582442 res!370251) b!582438))

(assert (= (and b!582438 res!370253) b!582440))

(assert (= (and b!582440 res!370257) b!582443))

(assert (= (and b!582443 res!370259) b!582439))

(declare-fun m!560939 () Bool)

(assert (=> b!582436 m!560939))

(assert (=> b!582436 m!560939))

(declare-fun m!560941 () Bool)

(assert (=> b!582436 m!560941))

(declare-fun m!560943 () Bool)

(assert (=> b!582440 m!560943))

(declare-fun m!560945 () Bool)

(assert (=> start!53510 m!560945))

(declare-fun m!560947 () Bool)

(assert (=> start!53510 m!560947))

(declare-fun m!560949 () Bool)

(assert (=> b!582441 m!560949))

(declare-fun m!560951 () Bool)

(assert (=> b!582438 m!560951))

(declare-fun m!560953 () Bool)

(assert (=> b!582442 m!560953))

(declare-fun m!560955 () Bool)

(assert (=> b!582435 m!560955))

(declare-fun m!560957 () Bool)

(assert (=> b!582443 m!560957))

(declare-fun m!560959 () Bool)

(assert (=> b!582443 m!560959))

(declare-fun m!560961 () Bool)

(assert (=> b!582443 m!560961))

(assert (=> b!582439 m!560939))

(assert (=> b!582439 m!560939))

(declare-fun m!560963 () Bool)

(assert (=> b!582439 m!560963))

(push 1)

(assert (not b!582442))

(assert (not b!582436))

(assert (not b!582435))

(assert (not b!582440))

(assert (not b!582438))

(assert (not b!582441))

(assert (not start!53510))

(assert (not b!582439))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

