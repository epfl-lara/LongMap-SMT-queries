; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53336 () Bool)

(assert start!53336)

(declare-fun b!580050 () Bool)

(declare-fun res!367866 () Bool)

(declare-fun e!333204 () Bool)

(assert (=> b!580050 (=> (not res!367866) (not e!333204))))

(declare-datatypes ((array!36237 0))(
  ( (array!36238 (arr!17393 (Array (_ BitVec 32) (_ BitVec 64))) (size!17757 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36237)

(declare-datatypes ((List!11434 0))(
  ( (Nil!11431) (Cons!11430 (h!12475 (_ BitVec 64)) (t!17662 List!11434)) )
))
(declare-fun arrayNoDuplicates!0 (array!36237 (_ BitVec 32) List!11434) Bool)

(assert (=> b!580050 (= res!367866 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11431))))

(declare-fun b!580051 () Bool)

(declare-fun res!367874 () Bool)

(declare-fun e!333203 () Bool)

(assert (=> b!580051 (=> (not res!367874) (not e!333203))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!580051 (= res!367874 (and (= (size!17757 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17757 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17757 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!580052 () Bool)

(declare-fun res!367870 () Bool)

(assert (=> b!580052 (=> (not res!367870) (not e!333204))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36237 (_ BitVec 32)) Bool)

(assert (=> b!580052 (= res!367870 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!580053 () Bool)

(declare-fun res!367871 () Bool)

(assert (=> b!580053 (=> (not res!367871) (not e!333203))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36237 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!580053 (= res!367871 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!580054 () Bool)

(declare-fun res!367868 () Bool)

(assert (=> b!580054 (=> (not res!367868) (not e!333203))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!580054 (= res!367868 (validKeyInArray!0 (select (arr!17393 a!2986) j!136)))))

(declare-fun res!367869 () Bool)

(assert (=> start!53336 (=> (not res!367869) (not e!333203))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53336 (= res!367869 (validMask!0 mask!3053))))

(assert (=> start!53336 e!333203))

(assert (=> start!53336 true))

(declare-fun array_inv!13189 (array!36237) Bool)

(assert (=> start!53336 (array_inv!13189 a!2986)))

(declare-fun b!580055 () Bool)

(assert (=> b!580055 (= e!333204 false)))

(declare-datatypes ((SeekEntryResult!5833 0))(
  ( (MissingZero!5833 (index!25559 (_ BitVec 32))) (Found!5833 (index!25560 (_ BitVec 32))) (Intermediate!5833 (undefined!6645 Bool) (index!25561 (_ BitVec 32)) (x!54438 (_ BitVec 32))) (Undefined!5833) (MissingVacant!5833 (index!25562 (_ BitVec 32))) )
))
(declare-fun lt!264619 () SeekEntryResult!5833)

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36237 (_ BitVec 32)) SeekEntryResult!5833)

(assert (=> b!580055 (= lt!264619 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17393 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!580056 () Bool)

(assert (=> b!580056 (= e!333203 e!333204)))

(declare-fun res!367873 () Bool)

(assert (=> b!580056 (=> (not res!367873) (not e!333204))))

(declare-fun lt!264618 () SeekEntryResult!5833)

(assert (=> b!580056 (= res!367873 (or (= lt!264618 (MissingZero!5833 i!1108)) (= lt!264618 (MissingVacant!5833 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36237 (_ BitVec 32)) SeekEntryResult!5833)

(assert (=> b!580056 (= lt!264618 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!580057 () Bool)

(declare-fun res!367872 () Bool)

(assert (=> b!580057 (=> (not res!367872) (not e!333204))))

(assert (=> b!580057 (= res!367872 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17393 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17393 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!580058 () Bool)

(declare-fun res!367867 () Bool)

(assert (=> b!580058 (=> (not res!367867) (not e!333203))))

(assert (=> b!580058 (= res!367867 (validKeyInArray!0 k!1786))))

(assert (= (and start!53336 res!367869) b!580051))

(assert (= (and b!580051 res!367874) b!580054))

(assert (= (and b!580054 res!367868) b!580058))

(assert (= (and b!580058 res!367867) b!580053))

(assert (= (and b!580053 res!367871) b!580056))

(assert (= (and b!580056 res!367873) b!580052))

(assert (= (and b!580052 res!367870) b!580050))

(assert (= (and b!580050 res!367866) b!580057))

(assert (= (and b!580057 res!367872) b!580055))

(declare-fun m!558647 () Bool)

(assert (=> b!580050 m!558647))

(declare-fun m!558649 () Bool)

(assert (=> b!580056 m!558649))

(declare-fun m!558651 () Bool)

(assert (=> b!580057 m!558651))

(declare-fun m!558653 () Bool)

(assert (=> b!580057 m!558653))

(declare-fun m!558655 () Bool)

(assert (=> b!580057 m!558655))

(declare-fun m!558657 () Bool)

(assert (=> start!53336 m!558657))

(declare-fun m!558659 () Bool)

(assert (=> start!53336 m!558659))

(declare-fun m!558661 () Bool)

(assert (=> b!580058 m!558661))

(declare-fun m!558663 () Bool)

(assert (=> b!580054 m!558663))

(assert (=> b!580054 m!558663))

(declare-fun m!558665 () Bool)

(assert (=> b!580054 m!558665))

(assert (=> b!580055 m!558663))

(assert (=> b!580055 m!558663))

(declare-fun m!558667 () Bool)

(assert (=> b!580055 m!558667))

(declare-fun m!558669 () Bool)

(assert (=> b!580053 m!558669))

(declare-fun m!558671 () Bool)

(assert (=> b!580052 m!558671))

(push 1)

