; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53548 () Bool)

(assert start!53548)

(declare-fun b!582948 () Bool)

(declare-fun res!370766 () Bool)

(declare-fun e!334156 () Bool)

(assert (=> b!582948 (=> (not res!370766) (not e!334156))))

(declare-datatypes ((array!36449 0))(
  ( (array!36450 (arr!17499 (Array (_ BitVec 32) (_ BitVec 64))) (size!17863 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36449)

(declare-datatypes ((List!11540 0))(
  ( (Nil!11537) (Cons!11536 (h!12581 (_ BitVec 64)) (t!17768 List!11540)) )
))
(declare-fun arrayNoDuplicates!0 (array!36449 (_ BitVec 32) List!11540) Bool)

(assert (=> b!582948 (= res!370766 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11537))))

(declare-fun b!582949 () Bool)

(declare-fun res!370772 () Bool)

(declare-fun e!334157 () Bool)

(assert (=> b!582949 (=> (not res!370772) (not e!334157))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!582949 (= res!370772 (validKeyInArray!0 k!1786))))

(declare-fun b!582950 () Bool)

(declare-fun res!370771 () Bool)

(assert (=> b!582950 (=> (not res!370771) (not e!334157))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!582950 (= res!370771 (validKeyInArray!0 (select (arr!17499 a!2986) j!136)))))

(declare-fun b!582951 () Bool)

(declare-fun res!370769 () Bool)

(assert (=> b!582951 (=> (not res!370769) (not e!334156))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36449 (_ BitVec 32)) Bool)

(assert (=> b!582951 (= res!370769 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!582952 () Bool)

(declare-fun res!370764 () Bool)

(assert (=> b!582952 (=> (not res!370764) (not e!334157))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!582952 (= res!370764 (and (= (size!17863 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17863 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17863 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!582953 () Bool)

(declare-fun res!370768 () Bool)

(assert (=> b!582953 (=> (not res!370768) (not e!334156))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!582953 (= res!370768 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17499 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17499 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!582954 () Bool)

(assert (=> b!582954 (= e!334156 false)))

(declare-datatypes ((SeekEntryResult!5939 0))(
  ( (MissingZero!5939 (index!25983 (_ BitVec 32))) (Found!5939 (index!25984 (_ BitVec 32))) (Intermediate!5939 (undefined!6751 Bool) (index!25985 (_ BitVec 32)) (x!54832 (_ BitVec 32))) (Undefined!5939) (MissingVacant!5939 (index!25986 (_ BitVec 32))) )
))
(declare-fun lt!265228 () SeekEntryResult!5939)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36449 (_ BitVec 32)) SeekEntryResult!5939)

(assert (=> b!582954 (= lt!265228 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17499 a!2986) j!136) a!2986 mask!3053))))

(declare-fun res!370765 () Bool)

(assert (=> start!53548 (=> (not res!370765) (not e!334157))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53548 (= res!370765 (validMask!0 mask!3053))))

(assert (=> start!53548 e!334157))

(assert (=> start!53548 true))

(declare-fun array_inv!13295 (array!36449) Bool)

(assert (=> start!53548 (array_inv!13295 a!2986)))

(declare-fun b!582955 () Bool)

(assert (=> b!582955 (= e!334157 e!334156)))

(declare-fun res!370770 () Bool)

(assert (=> b!582955 (=> (not res!370770) (not e!334156))))

(declare-fun lt!265227 () SeekEntryResult!5939)

(assert (=> b!582955 (= res!370770 (or (= lt!265227 (MissingZero!5939 i!1108)) (= lt!265227 (MissingVacant!5939 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36449 (_ BitVec 32)) SeekEntryResult!5939)

(assert (=> b!582955 (= lt!265227 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!582956 () Bool)

(declare-fun res!370767 () Bool)

(assert (=> b!582956 (=> (not res!370767) (not e!334157))))

(declare-fun arrayContainsKey!0 (array!36449 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!582956 (= res!370767 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(assert (= (and start!53548 res!370765) b!582952))

(assert (= (and b!582952 res!370764) b!582950))

(assert (= (and b!582950 res!370771) b!582949))

(assert (= (and b!582949 res!370772) b!582956))

(assert (= (and b!582956 res!370767) b!582955))

(assert (= (and b!582955 res!370770) b!582951))

(assert (= (and b!582951 res!370769) b!582948))

(assert (= (and b!582948 res!370766) b!582953))

(assert (= (and b!582953 res!370768) b!582954))

(declare-fun m!561433 () Bool)

(assert (=> b!582955 m!561433))

(declare-fun m!561435 () Bool)

(assert (=> b!582951 m!561435))

(declare-fun m!561437 () Bool)

(assert (=> b!582956 m!561437))

(declare-fun m!561439 () Bool)

(assert (=> start!53548 m!561439))

(declare-fun m!561441 () Bool)

(assert (=> start!53548 m!561441))

(declare-fun m!561443 () Bool)

(assert (=> b!582950 m!561443))

(assert (=> b!582950 m!561443))

(declare-fun m!561445 () Bool)

(assert (=> b!582950 m!561445))

(declare-fun m!561447 () Bool)

(assert (=> b!582953 m!561447))

(declare-fun m!561449 () Bool)

(assert (=> b!582953 m!561449))

(declare-fun m!561451 () Bool)

(assert (=> b!582953 m!561451))

(declare-fun m!561453 () Bool)

(assert (=> b!582948 m!561453))

(declare-fun m!561455 () Bool)

(assert (=> b!582949 m!561455))

(assert (=> b!582954 m!561443))

(assert (=> b!582954 m!561443))

(declare-fun m!561457 () Bool)

(assert (=> b!582954 m!561457))

(push 1)

(assert (not b!582956))

(assert (not b!582955))

(assert (not start!53548))

(assert (not b!582954))

(assert (not b!582951))

(assert (not b!582949))

(assert (not b!582950))

(assert (not b!582948))

(check-sat)

