; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53530 () Bool)

(assert start!53530)

(declare-fun b!582705 () Bool)

(declare-fun e!334075 () Bool)

(declare-fun e!334077 () Bool)

(assert (=> b!582705 (= e!334075 e!334077)))

(declare-fun res!370527 () Bool)

(assert (=> b!582705 (=> (not res!370527) (not e!334077))))

(declare-datatypes ((SeekEntryResult!5930 0))(
  ( (MissingZero!5930 (index!25947 (_ BitVec 32))) (Found!5930 (index!25948 (_ BitVec 32))) (Intermediate!5930 (undefined!6742 Bool) (index!25949 (_ BitVec 32)) (x!54799 (_ BitVec 32))) (Undefined!5930) (MissingVacant!5930 (index!25950 (_ BitVec 32))) )
))
(declare-fun lt!265173 () SeekEntryResult!5930)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!582705 (= res!370527 (or (= lt!265173 (MissingZero!5930 i!1108)) (= lt!265173 (MissingVacant!5930 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-datatypes ((array!36431 0))(
  ( (array!36432 (arr!17490 (Array (_ BitVec 32) (_ BitVec 64))) (size!17854 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36431)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36431 (_ BitVec 32)) SeekEntryResult!5930)

(assert (=> b!582705 (= lt!265173 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!582706 () Bool)

(declare-fun res!370528 () Bool)

(assert (=> b!582706 (=> (not res!370528) (not e!334075))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!582706 (= res!370528 (validKeyInArray!0 (select (arr!17490 a!2986) j!136)))))

(declare-fun b!582707 () Bool)

(declare-fun res!370524 () Bool)

(assert (=> b!582707 (=> (not res!370524) (not e!334077))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36431 (_ BitVec 32)) Bool)

(assert (=> b!582707 (= res!370524 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun res!370521 () Bool)

(assert (=> start!53530 (=> (not res!370521) (not e!334075))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53530 (= res!370521 (validMask!0 mask!3053))))

(assert (=> start!53530 e!334075))

(assert (=> start!53530 true))

(declare-fun array_inv!13286 (array!36431) Bool)

(assert (=> start!53530 (array_inv!13286 a!2986)))

(declare-fun b!582708 () Bool)

(declare-fun res!370525 () Bool)

(assert (=> b!582708 (=> (not res!370525) (not e!334075))))

(declare-fun arrayContainsKey!0 (array!36431 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!582708 (= res!370525 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!582709 () Bool)

(assert (=> b!582709 (= e!334077 false)))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun lt!265174 () SeekEntryResult!5930)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36431 (_ BitVec 32)) SeekEntryResult!5930)

(assert (=> b!582709 (= lt!265174 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17490 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!582710 () Bool)

(declare-fun res!370523 () Bool)

(assert (=> b!582710 (=> (not res!370523) (not e!334077))))

(declare-datatypes ((List!11531 0))(
  ( (Nil!11528) (Cons!11527 (h!12572 (_ BitVec 64)) (t!17759 List!11531)) )
))
(declare-fun arrayNoDuplicates!0 (array!36431 (_ BitVec 32) List!11531) Bool)

(assert (=> b!582710 (= res!370523 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11528))))

(declare-fun b!582711 () Bool)

(declare-fun res!370526 () Bool)

(assert (=> b!582711 (=> (not res!370526) (not e!334075))))

(assert (=> b!582711 (= res!370526 (and (= (size!17854 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17854 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17854 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!582712 () Bool)

(declare-fun res!370522 () Bool)

(assert (=> b!582712 (=> (not res!370522) (not e!334075))))

(assert (=> b!582712 (= res!370522 (validKeyInArray!0 k!1786))))

(declare-fun b!582713 () Bool)

(declare-fun res!370529 () Bool)

(assert (=> b!582713 (=> (not res!370529) (not e!334077))))

(assert (=> b!582713 (= res!370529 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17490 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17490 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!53530 res!370521) b!582711))

(assert (= (and b!582711 res!370526) b!582706))

(assert (= (and b!582706 res!370528) b!582712))

(assert (= (and b!582712 res!370522) b!582708))

(assert (= (and b!582708 res!370525) b!582705))

(assert (= (and b!582705 res!370527) b!582707))

(assert (= (and b!582707 res!370524) b!582710))

(assert (= (and b!582710 res!370523) b!582713))

(assert (= (and b!582713 res!370529) b!582709))

(declare-fun m!561199 () Bool)

(assert (=> b!582710 m!561199))

(declare-fun m!561201 () Bool)

(assert (=> b!582712 m!561201))

(declare-fun m!561203 () Bool)

(assert (=> b!582713 m!561203))

(declare-fun m!561205 () Bool)

(assert (=> b!582713 m!561205))

(declare-fun m!561207 () Bool)

(assert (=> b!582713 m!561207))

(declare-fun m!561209 () Bool)

(assert (=> b!582708 m!561209))

(declare-fun m!561211 () Bool)

(assert (=> b!582705 m!561211))

(declare-fun m!561213 () Bool)

(assert (=> b!582709 m!561213))

(assert (=> b!582709 m!561213))

(declare-fun m!561215 () Bool)

(assert (=> b!582709 m!561215))

(declare-fun m!561217 () Bool)

(assert (=> start!53530 m!561217))

(declare-fun m!561219 () Bool)

(assert (=> start!53530 m!561219))

(declare-fun m!561221 () Bool)

(assert (=> b!582707 m!561221))

(assert (=> b!582706 m!561213))

(assert (=> b!582706 m!561213))

(declare-fun m!561223 () Bool)

(assert (=> b!582706 m!561223))

(push 1)

(assert (not b!582706))

(assert (not start!53530))

(assert (not b!582705))

(assert (not b!582708))

(assert (not b!582707))

(assert (not b!582709))

(assert (not b!582712))

(assert (not b!582710))

(check-sat)

