; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53354 () Bool)

(assert start!53354)

(declare-fun b!580293 () Bool)

(declare-fun e!333284 () Bool)

(assert (=> b!580293 (= e!333284 false)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5842 0))(
  ( (MissingZero!5842 (index!25595 (_ BitVec 32))) (Found!5842 (index!25596 (_ BitVec 32))) (Intermediate!5842 (undefined!6654 Bool) (index!25597 (_ BitVec 32)) (x!54471 (_ BitVec 32))) (Undefined!5842) (MissingVacant!5842 (index!25598 (_ BitVec 32))) )
))
(declare-fun lt!264672 () SeekEntryResult!5842)

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36255 0))(
  ( (array!36256 (arr!17402 (Array (_ BitVec 32) (_ BitVec 64))) (size!17766 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36255)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36255 (_ BitVec 32)) SeekEntryResult!5842)

(assert (=> b!580293 (= lt!264672 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17402 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!580294 () Bool)

(declare-fun res!368114 () Bool)

(assert (=> b!580294 (=> (not res!368114) (not e!333284))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!580294 (= res!368114 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17402 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17402 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!580295 () Bool)

(declare-fun res!368110 () Bool)

(declare-fun e!333283 () Bool)

(assert (=> b!580295 (=> (not res!368110) (not e!333283))))

(assert (=> b!580295 (= res!368110 (and (= (size!17766 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17766 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17766 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!580297 () Bool)

(declare-fun res!368115 () Bool)

(assert (=> b!580297 (=> (not res!368115) (not e!333283))))

(declare-fun arrayContainsKey!0 (array!36255 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!580297 (= res!368115 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!580298 () Bool)

(declare-fun res!368117 () Bool)

(assert (=> b!580298 (=> (not res!368117) (not e!333284))))

(declare-datatypes ((List!11443 0))(
  ( (Nil!11440) (Cons!11439 (h!12484 (_ BitVec 64)) (t!17671 List!11443)) )
))
(declare-fun arrayNoDuplicates!0 (array!36255 (_ BitVec 32) List!11443) Bool)

(assert (=> b!580298 (= res!368117 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11440))))

(declare-fun b!580299 () Bool)

(declare-fun res!368109 () Bool)

(assert (=> b!580299 (=> (not res!368109) (not e!333283))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!580299 (= res!368109 (validKeyInArray!0 k!1786))))

(declare-fun b!580296 () Bool)

(assert (=> b!580296 (= e!333283 e!333284)))

(declare-fun res!368113 () Bool)

(assert (=> b!580296 (=> (not res!368113) (not e!333284))))

(declare-fun lt!264673 () SeekEntryResult!5842)

(assert (=> b!580296 (= res!368113 (or (= lt!264673 (MissingZero!5842 i!1108)) (= lt!264673 (MissingVacant!5842 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36255 (_ BitVec 32)) SeekEntryResult!5842)

(assert (=> b!580296 (= lt!264673 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun res!368116 () Bool)

(assert (=> start!53354 (=> (not res!368116) (not e!333283))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53354 (= res!368116 (validMask!0 mask!3053))))

(assert (=> start!53354 e!333283))

(assert (=> start!53354 true))

(declare-fun array_inv!13198 (array!36255) Bool)

(assert (=> start!53354 (array_inv!13198 a!2986)))

(declare-fun b!580300 () Bool)

(declare-fun res!368111 () Bool)

(assert (=> b!580300 (=> (not res!368111) (not e!333283))))

(assert (=> b!580300 (= res!368111 (validKeyInArray!0 (select (arr!17402 a!2986) j!136)))))

(declare-fun b!580301 () Bool)

(declare-fun res!368112 () Bool)

(assert (=> b!580301 (=> (not res!368112) (not e!333284))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36255 (_ BitVec 32)) Bool)

(assert (=> b!580301 (= res!368112 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(assert (= (and start!53354 res!368116) b!580295))

(assert (= (and b!580295 res!368110) b!580300))

(assert (= (and b!580300 res!368111) b!580299))

(assert (= (and b!580299 res!368109) b!580297))

(assert (= (and b!580297 res!368115) b!580296))

(assert (= (and b!580296 res!368113) b!580301))

(assert (= (and b!580301 res!368112) b!580298))

(assert (= (and b!580298 res!368117) b!580294))

(assert (= (and b!580294 res!368114) b!580293))

(declare-fun m!558881 () Bool)

(assert (=> b!580299 m!558881))

(declare-fun m!558883 () Bool)

(assert (=> b!580294 m!558883))

(declare-fun m!558885 () Bool)

(assert (=> b!580294 m!558885))

(declare-fun m!558887 () Bool)

(assert (=> b!580294 m!558887))

(declare-fun m!558889 () Bool)

(assert (=> b!580300 m!558889))

(assert (=> b!580300 m!558889))

(declare-fun m!558891 () Bool)

(assert (=> b!580300 m!558891))

(declare-fun m!558893 () Bool)

(assert (=> b!580298 m!558893))

(declare-fun m!558895 () Bool)

(assert (=> b!580297 m!558895))

(declare-fun m!558897 () Bool)

(assert (=> start!53354 m!558897))

(declare-fun m!558899 () Bool)

(assert (=> start!53354 m!558899))

(declare-fun m!558901 () Bool)

(assert (=> b!580301 m!558901))

(assert (=> b!580293 m!558889))

(assert (=> b!580293 m!558889))

(declare-fun m!558903 () Bool)

(assert (=> b!580293 m!558903))

(declare-fun m!558905 () Bool)

(assert (=> b!580296 m!558905))

(push 1)

