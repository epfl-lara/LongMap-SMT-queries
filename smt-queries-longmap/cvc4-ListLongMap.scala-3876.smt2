; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53270 () Bool)

(assert start!53270)

(declare-fun b!579159 () Bool)

(declare-fun res!366983 () Bool)

(declare-fun e!332907 () Bool)

(assert (=> b!579159 (=> (not res!366983) (not e!332907))))

(declare-datatypes ((array!36171 0))(
  ( (array!36172 (arr!17360 (Array (_ BitVec 32) (_ BitVec 64))) (size!17724 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36171)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!579159 (= res!366983 (validKeyInArray!0 (select (arr!17360 a!2986) j!136)))))

(declare-fun b!579160 () Bool)

(declare-fun res!366982 () Bool)

(declare-fun e!332906 () Bool)

(assert (=> b!579160 (=> (not res!366982) (not e!332906))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36171 (_ BitVec 32)) Bool)

(assert (=> b!579160 (= res!366982 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!579161 () Bool)

(declare-fun res!366977 () Bool)

(assert (=> b!579161 (=> (not res!366977) (not e!332907))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36171 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!579161 (= res!366977 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!579162 () Bool)

(assert (=> b!579162 (= e!332906 false)))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5800 0))(
  ( (MissingZero!5800 (index!25427 (_ BitVec 32))) (Found!5800 (index!25428 (_ BitVec 32))) (Intermediate!5800 (undefined!6612 Bool) (index!25429 (_ BitVec 32)) (x!54317 (_ BitVec 32))) (Undefined!5800) (MissingVacant!5800 (index!25430 (_ BitVec 32))) )
))
(declare-fun lt!264421 () SeekEntryResult!5800)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36171 (_ BitVec 32)) SeekEntryResult!5800)

(assert (=> b!579162 (= lt!264421 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17360 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!579163 () Bool)

(assert (=> b!579163 (= e!332907 e!332906)))

(declare-fun res!366979 () Bool)

(assert (=> b!579163 (=> (not res!366979) (not e!332906))))

(declare-fun lt!264420 () SeekEntryResult!5800)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!579163 (= res!366979 (or (= lt!264420 (MissingZero!5800 i!1108)) (= lt!264420 (MissingVacant!5800 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36171 (_ BitVec 32)) SeekEntryResult!5800)

(assert (=> b!579163 (= lt!264420 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!579164 () Bool)

(declare-fun res!366978 () Bool)

(assert (=> b!579164 (=> (not res!366978) (not e!332906))))

(declare-datatypes ((List!11401 0))(
  ( (Nil!11398) (Cons!11397 (h!12442 (_ BitVec 64)) (t!17629 List!11401)) )
))
(declare-fun arrayNoDuplicates!0 (array!36171 (_ BitVec 32) List!11401) Bool)

(assert (=> b!579164 (= res!366978 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11398))))

(declare-fun b!579165 () Bool)

(declare-fun res!366976 () Bool)

(assert (=> b!579165 (=> (not res!366976) (not e!332907))))

(assert (=> b!579165 (= res!366976 (validKeyInArray!0 k!1786))))

(declare-fun res!366980 () Bool)

(assert (=> start!53270 (=> (not res!366980) (not e!332907))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53270 (= res!366980 (validMask!0 mask!3053))))

(assert (=> start!53270 e!332907))

(assert (=> start!53270 true))

(declare-fun array_inv!13156 (array!36171) Bool)

(assert (=> start!53270 (array_inv!13156 a!2986)))

(declare-fun b!579166 () Bool)

(declare-fun res!366975 () Bool)

(assert (=> b!579166 (=> (not res!366975) (not e!332906))))

(assert (=> b!579166 (= res!366975 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17360 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17360 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!579167 () Bool)

(declare-fun res!366981 () Bool)

(assert (=> b!579167 (=> (not res!366981) (not e!332907))))

(assert (=> b!579167 (= res!366981 (and (= (size!17724 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17724 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17724 a!2986)) (not (= i!1108 j!136))))))

(assert (= (and start!53270 res!366980) b!579167))

(assert (= (and b!579167 res!366981) b!579159))

(assert (= (and b!579159 res!366983) b!579165))

(assert (= (and b!579165 res!366976) b!579161))

(assert (= (and b!579161 res!366977) b!579163))

(assert (= (and b!579163 res!366979) b!579160))

(assert (= (and b!579160 res!366982) b!579164))

(assert (= (and b!579164 res!366978) b!579166))

(assert (= (and b!579166 res!366975) b!579162))

(declare-fun m!557789 () Bool)

(assert (=> b!579165 m!557789))

(declare-fun m!557791 () Bool)

(assert (=> b!579164 m!557791))

(declare-fun m!557793 () Bool)

(assert (=> b!579161 m!557793))

(declare-fun m!557795 () Bool)

(assert (=> b!579163 m!557795))

(declare-fun m!557797 () Bool)

(assert (=> b!579159 m!557797))

(assert (=> b!579159 m!557797))

(declare-fun m!557799 () Bool)

(assert (=> b!579159 m!557799))

(declare-fun m!557801 () Bool)

(assert (=> b!579166 m!557801))

(declare-fun m!557803 () Bool)

(assert (=> b!579166 m!557803))

(declare-fun m!557805 () Bool)

(assert (=> b!579166 m!557805))

(assert (=> b!579162 m!557797))

(assert (=> b!579162 m!557797))

(declare-fun m!557807 () Bool)

(assert (=> b!579162 m!557807))

(declare-fun m!557809 () Bool)

(assert (=> start!53270 m!557809))

(declare-fun m!557811 () Bool)

(assert (=> start!53270 m!557811))

(declare-fun m!557813 () Bool)

(assert (=> b!579160 m!557813))

(push 1)

(assert (not b!579162))

(assert (not b!579161))

(assert (not b!579165))

(assert (not b!579163))

(assert (not b!579159))

(assert (not b!579160))

(assert (not start!53270))

(assert (not b!579164))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

