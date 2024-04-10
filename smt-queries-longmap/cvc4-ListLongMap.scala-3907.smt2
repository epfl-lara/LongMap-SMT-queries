; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53456 () Bool)

(assert start!53456)

(declare-fun b!581688 () Bool)

(declare-fun e!333743 () Bool)

(assert (=> b!581688 (= e!333743 false)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5893 0))(
  ( (MissingZero!5893 (index!25799 (_ BitVec 32))) (Found!5893 (index!25800 (_ BitVec 32))) (Intermediate!5893 (undefined!6705 Bool) (index!25801 (_ BitVec 32)) (x!54658 (_ BitVec 32))) (Undefined!5893) (MissingVacant!5893 (index!25802 (_ BitVec 32))) )
))
(declare-fun lt!264961 () SeekEntryResult!5893)

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36357 0))(
  ( (array!36358 (arr!17453 (Array (_ BitVec 32) (_ BitVec 64))) (size!17817 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36357)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36357 (_ BitVec 32)) SeekEntryResult!5893)

(assert (=> b!581688 (= lt!264961 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17453 a!2986) j!136) a!2986 mask!3053))))

(declare-fun res!369508 () Bool)

(declare-fun e!333742 () Bool)

(assert (=> start!53456 (=> (not res!369508) (not e!333742))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53456 (= res!369508 (validMask!0 mask!3053))))

(assert (=> start!53456 e!333742))

(assert (=> start!53456 true))

(declare-fun array_inv!13249 (array!36357) Bool)

(assert (=> start!53456 (array_inv!13249 a!2986)))

(declare-fun b!581689 () Bool)

(declare-fun res!369509 () Bool)

(assert (=> b!581689 (=> (not res!369509) (not e!333742))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36357 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!581689 (= res!369509 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!581690 () Bool)

(declare-fun res!369506 () Bool)

(assert (=> b!581690 (=> (not res!369506) (not e!333743))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!581690 (= res!369506 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17453 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17453 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!581691 () Bool)

(assert (=> b!581691 (= e!333742 e!333743)))

(declare-fun res!369510 () Bool)

(assert (=> b!581691 (=> (not res!369510) (not e!333743))))

(declare-fun lt!264960 () SeekEntryResult!5893)

(assert (=> b!581691 (= res!369510 (or (= lt!264960 (MissingZero!5893 i!1108)) (= lt!264960 (MissingVacant!5893 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36357 (_ BitVec 32)) SeekEntryResult!5893)

(assert (=> b!581691 (= lt!264960 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!581692 () Bool)

(declare-fun res!369504 () Bool)

(assert (=> b!581692 (=> (not res!369504) (not e!333743))))

(declare-datatypes ((List!11494 0))(
  ( (Nil!11491) (Cons!11490 (h!12535 (_ BitVec 64)) (t!17722 List!11494)) )
))
(declare-fun arrayNoDuplicates!0 (array!36357 (_ BitVec 32) List!11494) Bool)

(assert (=> b!581692 (= res!369504 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11491))))

(declare-fun b!581693 () Bool)

(declare-fun res!369511 () Bool)

(assert (=> b!581693 (=> (not res!369511) (not e!333742))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!581693 (= res!369511 (validKeyInArray!0 (select (arr!17453 a!2986) j!136)))))

(declare-fun b!581694 () Bool)

(declare-fun res!369512 () Bool)

(assert (=> b!581694 (=> (not res!369512) (not e!333742))))

(assert (=> b!581694 (= res!369512 (and (= (size!17817 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17817 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17817 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!581695 () Bool)

(declare-fun res!369507 () Bool)

(assert (=> b!581695 (=> (not res!369507) (not e!333743))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36357 (_ BitVec 32)) Bool)

(assert (=> b!581695 (= res!369507 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!581696 () Bool)

(declare-fun res!369505 () Bool)

(assert (=> b!581696 (=> (not res!369505) (not e!333742))))

(assert (=> b!581696 (= res!369505 (validKeyInArray!0 k!1786))))

(assert (= (and start!53456 res!369508) b!581694))

(assert (= (and b!581694 res!369512) b!581693))

(assert (= (and b!581693 res!369511) b!581696))

(assert (= (and b!581696 res!369505) b!581689))

(assert (= (and b!581689 res!369509) b!581691))

(assert (= (and b!581691 res!369510) b!581695))

(assert (= (and b!581695 res!369507) b!581692))

(assert (= (and b!581692 res!369504) b!581690))

(assert (= (and b!581690 res!369506) b!581688))

(declare-fun m!560219 () Bool)

(assert (=> b!581688 m!560219))

(assert (=> b!581688 m!560219))

(declare-fun m!560221 () Bool)

(assert (=> b!581688 m!560221))

(declare-fun m!560223 () Bool)

(assert (=> b!581689 m!560223))

(declare-fun m!560225 () Bool)

(assert (=> b!581690 m!560225))

(declare-fun m!560227 () Bool)

(assert (=> b!581690 m!560227))

(declare-fun m!560229 () Bool)

(assert (=> b!581690 m!560229))

(declare-fun m!560231 () Bool)

(assert (=> b!581696 m!560231))

(declare-fun m!560233 () Bool)

(assert (=> b!581692 m!560233))

(assert (=> b!581693 m!560219))

(assert (=> b!581693 m!560219))

(declare-fun m!560235 () Bool)

(assert (=> b!581693 m!560235))

(declare-fun m!560237 () Bool)

(assert (=> b!581695 m!560237))

(declare-fun m!560239 () Bool)

(assert (=> start!53456 m!560239))

(declare-fun m!560241 () Bool)

(assert (=> start!53456 m!560241))

(declare-fun m!560243 () Bool)

(assert (=> b!581691 m!560243))

(push 1)

(assert (not b!581689))

(assert (not start!53456))

(assert (not b!581692))

(assert (not b!581693))

