; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53452 () Bool)

(assert start!53452)

(declare-fun b!581634 () Bool)

(declare-fun res!369450 () Bool)

(declare-fun e!333726 () Bool)

(assert (=> b!581634 (=> (not res!369450) (not e!333726))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!581634 (= res!369450 (validKeyInArray!0 k!1786))))

(declare-fun b!581635 () Bool)

(declare-fun e!333724 () Bool)

(assert (=> b!581635 (= e!333726 e!333724)))

(declare-fun res!369453 () Bool)

(assert (=> b!581635 (=> (not res!369453) (not e!333724))))

(declare-datatypes ((SeekEntryResult!5891 0))(
  ( (MissingZero!5891 (index!25791 (_ BitVec 32))) (Found!5891 (index!25792 (_ BitVec 32))) (Intermediate!5891 (undefined!6703 Bool) (index!25793 (_ BitVec 32)) (x!54656 (_ BitVec 32))) (Undefined!5891) (MissingVacant!5891 (index!25794 (_ BitVec 32))) )
))
(declare-fun lt!264949 () SeekEntryResult!5891)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!581635 (= res!369453 (or (= lt!264949 (MissingZero!5891 i!1108)) (= lt!264949 (MissingVacant!5891 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-datatypes ((array!36353 0))(
  ( (array!36354 (arr!17451 (Array (_ BitVec 32) (_ BitVec 64))) (size!17815 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36353)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36353 (_ BitVec 32)) SeekEntryResult!5891)

(assert (=> b!581635 (= lt!264949 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun res!369458 () Bool)

(assert (=> start!53452 (=> (not res!369458) (not e!333726))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53452 (= res!369458 (validMask!0 mask!3053))))

(assert (=> start!53452 e!333726))

(assert (=> start!53452 true))

(declare-fun array_inv!13247 (array!36353) Bool)

(assert (=> start!53452 (array_inv!13247 a!2986)))

(declare-fun b!581636 () Bool)

(declare-fun res!369456 () Bool)

(assert (=> b!581636 (=> (not res!369456) (not e!333724))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36353 (_ BitVec 32)) Bool)

(assert (=> b!581636 (= res!369456 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!581637 () Bool)

(declare-fun res!369457 () Bool)

(assert (=> b!581637 (=> (not res!369457) (not e!333726))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!581637 (= res!369457 (and (= (size!17815 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17815 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17815 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!581638 () Bool)

(declare-fun res!369452 () Bool)

(assert (=> b!581638 (=> (not res!369452) (not e!333724))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!581638 (= res!369452 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17451 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17451 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!581639 () Bool)

(declare-fun res!369455 () Bool)

(assert (=> b!581639 (=> (not res!369455) (not e!333726))))

(declare-fun arrayContainsKey!0 (array!36353 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!581639 (= res!369455 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!581640 () Bool)

(assert (=> b!581640 (= e!333724 false)))

(declare-fun lt!264948 () SeekEntryResult!5891)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36353 (_ BitVec 32)) SeekEntryResult!5891)

(assert (=> b!581640 (= lt!264948 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17451 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!581641 () Bool)

(declare-fun res!369454 () Bool)

(assert (=> b!581641 (=> (not res!369454) (not e!333724))))

(declare-datatypes ((List!11492 0))(
  ( (Nil!11489) (Cons!11488 (h!12533 (_ BitVec 64)) (t!17720 List!11492)) )
))
(declare-fun arrayNoDuplicates!0 (array!36353 (_ BitVec 32) List!11492) Bool)

(assert (=> b!581641 (= res!369454 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11489))))

(declare-fun b!581642 () Bool)

(declare-fun res!369451 () Bool)

(assert (=> b!581642 (=> (not res!369451) (not e!333726))))

(assert (=> b!581642 (= res!369451 (validKeyInArray!0 (select (arr!17451 a!2986) j!136)))))

(assert (= (and start!53452 res!369458) b!581637))

(assert (= (and b!581637 res!369457) b!581642))

(assert (= (and b!581642 res!369451) b!581634))

(assert (= (and b!581634 res!369450) b!581639))

(assert (= (and b!581639 res!369455) b!581635))

(assert (= (and b!581635 res!369453) b!581636))

(assert (= (and b!581636 res!369456) b!581641))

(assert (= (and b!581641 res!369454) b!581638))

(assert (= (and b!581638 res!369452) b!581640))

(declare-fun m!560167 () Bool)

(assert (=> b!581640 m!560167))

(assert (=> b!581640 m!560167))

(declare-fun m!560169 () Bool)

(assert (=> b!581640 m!560169))

(declare-fun m!560171 () Bool)

(assert (=> start!53452 m!560171))

(declare-fun m!560173 () Bool)

(assert (=> start!53452 m!560173))

(assert (=> b!581642 m!560167))

(assert (=> b!581642 m!560167))

(declare-fun m!560175 () Bool)

(assert (=> b!581642 m!560175))

(declare-fun m!560177 () Bool)

(assert (=> b!581638 m!560177))

(declare-fun m!560179 () Bool)

(assert (=> b!581638 m!560179))

(declare-fun m!560181 () Bool)

(assert (=> b!581638 m!560181))

(declare-fun m!560183 () Bool)

(assert (=> b!581641 m!560183))

(declare-fun m!560185 () Bool)

(assert (=> b!581639 m!560185))

(declare-fun m!560187 () Bool)

(assert (=> b!581635 m!560187))

(declare-fun m!560189 () Bool)

(assert (=> b!581634 m!560189))

(declare-fun m!560191 () Bool)

(assert (=> b!581636 m!560191))

(push 1)

