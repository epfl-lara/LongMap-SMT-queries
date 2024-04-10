; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53584 () Bool)

(assert start!53584)

(declare-fun b!583443 () Bool)

(declare-fun res!371263 () Bool)

(declare-fun e!334319 () Bool)

(assert (=> b!583443 (=> (not res!371263) (not e!334319))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!36485 0))(
  ( (array!36486 (arr!17517 (Array (_ BitVec 32) (_ BitVec 64))) (size!17881 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36485)

(assert (=> b!583443 (= res!371263 (and (= (size!17881 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17881 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17881 a!2986)) (not (= i!1108 j!136))))))

(declare-fun res!371262 () Bool)

(assert (=> start!53584 (=> (not res!371262) (not e!334319))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53584 (= res!371262 (validMask!0 mask!3053))))

(assert (=> start!53584 e!334319))

(assert (=> start!53584 true))

(declare-fun array_inv!13313 (array!36485) Bool)

(assert (=> start!53584 (array_inv!13313 a!2986)))

(declare-fun b!583444 () Bool)

(declare-fun res!371264 () Bool)

(declare-fun e!334320 () Bool)

(assert (=> b!583444 (=> (not res!371264) (not e!334320))))

(declare-datatypes ((List!11558 0))(
  ( (Nil!11555) (Cons!11554 (h!12599 (_ BitVec 64)) (t!17786 List!11558)) )
))
(declare-fun arrayNoDuplicates!0 (array!36485 (_ BitVec 32) List!11558) Bool)

(assert (=> b!583444 (= res!371264 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11555))))

(declare-fun b!583445 () Bool)

(declare-fun res!371261 () Bool)

(assert (=> b!583445 (=> (not res!371261) (not e!334320))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!583445 (= res!371261 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17517 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17517 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!583446 () Bool)

(assert (=> b!583446 (= e!334320 false)))

(declare-datatypes ((SeekEntryResult!5957 0))(
  ( (MissingZero!5957 (index!26055 (_ BitVec 32))) (Found!5957 (index!26056 (_ BitVec 32))) (Intermediate!5957 (undefined!6769 Bool) (index!26057 (_ BitVec 32)) (x!54898 (_ BitVec 32))) (Undefined!5957) (MissingVacant!5957 (index!26058 (_ BitVec 32))) )
))
(declare-fun lt!265326 () SeekEntryResult!5957)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36485 (_ BitVec 32)) SeekEntryResult!5957)

(assert (=> b!583446 (= lt!265326 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17517 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!583447 () Bool)

(declare-fun res!371259 () Bool)

(assert (=> b!583447 (=> (not res!371259) (not e!334320))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36485 (_ BitVec 32)) Bool)

(assert (=> b!583447 (= res!371259 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!583448 () Bool)

(declare-fun res!371265 () Bool)

(assert (=> b!583448 (=> (not res!371265) (not e!334319))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!583448 (= res!371265 (validKeyInArray!0 k!1786))))

(declare-fun b!583449 () Bool)

(declare-fun res!371267 () Bool)

(assert (=> b!583449 (=> (not res!371267) (not e!334319))))

(declare-fun arrayContainsKey!0 (array!36485 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!583449 (= res!371267 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!583450 () Bool)

(assert (=> b!583450 (= e!334319 e!334320)))

(declare-fun res!371260 () Bool)

(assert (=> b!583450 (=> (not res!371260) (not e!334320))))

(declare-fun lt!265327 () SeekEntryResult!5957)

(assert (=> b!583450 (= res!371260 (or (= lt!265327 (MissingZero!5957 i!1108)) (= lt!265327 (MissingVacant!5957 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36485 (_ BitVec 32)) SeekEntryResult!5957)

(assert (=> b!583450 (= lt!265327 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!583451 () Bool)

(declare-fun res!371266 () Bool)

(assert (=> b!583451 (=> (not res!371266) (not e!334319))))

(assert (=> b!583451 (= res!371266 (validKeyInArray!0 (select (arr!17517 a!2986) j!136)))))

(assert (= (and start!53584 res!371262) b!583443))

(assert (= (and b!583443 res!371263) b!583451))

(assert (= (and b!583451 res!371266) b!583448))

(assert (= (and b!583448 res!371265) b!583449))

(assert (= (and b!583449 res!371267) b!583450))

(assert (= (and b!583450 res!371260) b!583447))

(assert (= (and b!583447 res!371259) b!583444))

(assert (= (and b!583444 res!371264) b!583445))

(assert (= (and b!583445 res!371261) b!583446))

(declare-fun m!561907 () Bool)

(assert (=> b!583448 m!561907))

(declare-fun m!561909 () Bool)

(assert (=> b!583447 m!561909))

(declare-fun m!561911 () Bool)

(assert (=> b!583444 m!561911))

(declare-fun m!561913 () Bool)

(assert (=> b!583449 m!561913))

(declare-fun m!561915 () Bool)

(assert (=> b!583451 m!561915))

(assert (=> b!583451 m!561915))

(declare-fun m!561917 () Bool)

(assert (=> b!583451 m!561917))

(declare-fun m!561919 () Bool)

(assert (=> start!53584 m!561919))

(declare-fun m!561921 () Bool)

(assert (=> start!53584 m!561921))

(declare-fun m!561923 () Bool)

(assert (=> b!583450 m!561923))

(assert (=> b!583446 m!561915))

(assert (=> b!583446 m!561915))

(declare-fun m!561925 () Bool)

(assert (=> b!583446 m!561925))

(declare-fun m!561927 () Bool)

(assert (=> b!583445 m!561927))

(declare-fun m!561929 () Bool)

(assert (=> b!583445 m!561929))

(declare-fun m!561931 () Bool)

(assert (=> b!583445 m!561931))

(push 1)

