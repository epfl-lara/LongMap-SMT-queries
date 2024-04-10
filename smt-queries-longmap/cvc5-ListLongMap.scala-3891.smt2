; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53356 () Bool)

(assert start!53356)

(declare-fun b!580320 () Bool)

(declare-fun res!368143 () Bool)

(declare-fun e!333294 () Bool)

(assert (=> b!580320 (=> (not res!368143) (not e!333294))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!36257 0))(
  ( (array!36258 (arr!17403 (Array (_ BitVec 32) (_ BitVec 64))) (size!17767 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36257)

(assert (=> b!580320 (= res!368143 (and (= (size!17767 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17767 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17767 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!580321 () Bool)

(declare-fun res!368144 () Bool)

(declare-fun e!333293 () Bool)

(assert (=> b!580321 (=> (not res!368144) (not e!333293))))

(declare-datatypes ((List!11444 0))(
  ( (Nil!11441) (Cons!11440 (h!12485 (_ BitVec 64)) (t!17672 List!11444)) )
))
(declare-fun arrayNoDuplicates!0 (array!36257 (_ BitVec 32) List!11444) Bool)

(assert (=> b!580321 (= res!368144 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11441))))

(declare-fun b!580322 () Bool)

(declare-fun res!368142 () Bool)

(assert (=> b!580322 (=> (not res!368142) (not e!333293))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!580322 (= res!368142 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17403 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17403 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!580323 () Bool)

(assert (=> b!580323 (= e!333294 e!333293)))

(declare-fun res!368136 () Bool)

(assert (=> b!580323 (=> (not res!368136) (not e!333293))))

(declare-datatypes ((SeekEntryResult!5843 0))(
  ( (MissingZero!5843 (index!25599 (_ BitVec 32))) (Found!5843 (index!25600 (_ BitVec 32))) (Intermediate!5843 (undefined!6655 Bool) (index!25601 (_ BitVec 32)) (x!54480 (_ BitVec 32))) (Undefined!5843) (MissingVacant!5843 (index!25602 (_ BitVec 32))) )
))
(declare-fun lt!264679 () SeekEntryResult!5843)

(assert (=> b!580323 (= res!368136 (or (= lt!264679 (MissingZero!5843 i!1108)) (= lt!264679 (MissingVacant!5843 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36257 (_ BitVec 32)) SeekEntryResult!5843)

(assert (=> b!580323 (= lt!264679 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!580324 () Bool)

(assert (=> b!580324 (= e!333293 false)))

(declare-fun lt!264678 () SeekEntryResult!5843)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36257 (_ BitVec 32)) SeekEntryResult!5843)

(assert (=> b!580324 (= lt!264678 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17403 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!580325 () Bool)

(declare-fun res!368138 () Bool)

(assert (=> b!580325 (=> (not res!368138) (not e!333294))))

(declare-fun arrayContainsKey!0 (array!36257 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!580325 (= res!368138 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!580327 () Bool)

(declare-fun res!368140 () Bool)

(assert (=> b!580327 (=> (not res!368140) (not e!333294))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!580327 (= res!368140 (validKeyInArray!0 (select (arr!17403 a!2986) j!136)))))

(declare-fun b!580328 () Bool)

(declare-fun res!368139 () Bool)

(assert (=> b!580328 (=> (not res!368139) (not e!333293))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36257 (_ BitVec 32)) Bool)

(assert (=> b!580328 (= res!368139 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun res!368137 () Bool)

(assert (=> start!53356 (=> (not res!368137) (not e!333294))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53356 (= res!368137 (validMask!0 mask!3053))))

(assert (=> start!53356 e!333294))

(assert (=> start!53356 true))

(declare-fun array_inv!13199 (array!36257) Bool)

(assert (=> start!53356 (array_inv!13199 a!2986)))

(declare-fun b!580326 () Bool)

(declare-fun res!368141 () Bool)

(assert (=> b!580326 (=> (not res!368141) (not e!333294))))

(assert (=> b!580326 (= res!368141 (validKeyInArray!0 k!1786))))

(assert (= (and start!53356 res!368137) b!580320))

(assert (= (and b!580320 res!368143) b!580327))

(assert (= (and b!580327 res!368140) b!580326))

(assert (= (and b!580326 res!368141) b!580325))

(assert (= (and b!580325 res!368138) b!580323))

(assert (= (and b!580323 res!368136) b!580328))

(assert (= (and b!580328 res!368139) b!580321))

(assert (= (and b!580321 res!368144) b!580322))

(assert (= (and b!580322 res!368142) b!580324))

(declare-fun m!558907 () Bool)

(assert (=> b!580322 m!558907))

(declare-fun m!558909 () Bool)

(assert (=> b!580322 m!558909))

(declare-fun m!558911 () Bool)

(assert (=> b!580322 m!558911))

(declare-fun m!558913 () Bool)

(assert (=> b!580323 m!558913))

(declare-fun m!558915 () Bool)

(assert (=> b!580324 m!558915))

(assert (=> b!580324 m!558915))

(declare-fun m!558917 () Bool)

(assert (=> b!580324 m!558917))

(declare-fun m!558919 () Bool)

(assert (=> start!53356 m!558919))

(declare-fun m!558921 () Bool)

(assert (=> start!53356 m!558921))

(declare-fun m!558923 () Bool)

(assert (=> b!580325 m!558923))

(assert (=> b!580327 m!558915))

(assert (=> b!580327 m!558915))

(declare-fun m!558925 () Bool)

(assert (=> b!580327 m!558925))

(declare-fun m!558927 () Bool)

(assert (=> b!580326 m!558927))

(declare-fun m!558929 () Bool)

(assert (=> b!580321 m!558929))

(declare-fun m!558931 () Bool)

(assert (=> b!580328 m!558931))

(push 1)

(assert (not b!580321))

(assert (not b!580323))

(assert (not b!580327))

(assert (not b!580326))

(assert (not start!53356))

(assert (not b!580324))

(assert (not b!580328))

(assert (not b!580325))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

