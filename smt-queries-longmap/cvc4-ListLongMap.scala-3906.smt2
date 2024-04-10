; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53450 () Bool)

(assert start!53450)

(declare-fun b!581607 () Bool)

(declare-fun e!333717 () Bool)

(declare-fun e!333715 () Bool)

(assert (=> b!581607 (= e!333717 e!333715)))

(declare-fun res!369424 () Bool)

(assert (=> b!581607 (=> (not res!369424) (not e!333715))))

(declare-datatypes ((SeekEntryResult!5890 0))(
  ( (MissingZero!5890 (index!25787 (_ BitVec 32))) (Found!5890 (index!25788 (_ BitVec 32))) (Intermediate!5890 (undefined!6702 Bool) (index!25789 (_ BitVec 32)) (x!54647 (_ BitVec 32))) (Undefined!5890) (MissingVacant!5890 (index!25790 (_ BitVec 32))) )
))
(declare-fun lt!264942 () SeekEntryResult!5890)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!581607 (= res!369424 (or (= lt!264942 (MissingZero!5890 i!1108)) (= lt!264942 (MissingVacant!5890 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-datatypes ((array!36351 0))(
  ( (array!36352 (arr!17450 (Array (_ BitVec 32) (_ BitVec 64))) (size!17814 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36351)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36351 (_ BitVec 32)) SeekEntryResult!5890)

(assert (=> b!581607 (= lt!264942 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!581608 () Bool)

(declare-fun res!369423 () Bool)

(assert (=> b!581608 (=> (not res!369423) (not e!333715))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36351 (_ BitVec 32)) Bool)

(assert (=> b!581608 (= res!369423 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!581609 () Bool)

(declare-fun res!369428 () Bool)

(assert (=> b!581609 (=> (not res!369428) (not e!333715))))

(declare-datatypes ((List!11491 0))(
  ( (Nil!11488) (Cons!11487 (h!12532 (_ BitVec 64)) (t!17719 List!11491)) )
))
(declare-fun arrayNoDuplicates!0 (array!36351 (_ BitVec 32) List!11491) Bool)

(assert (=> b!581609 (= res!369428 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11488))))

(declare-fun b!581610 () Bool)

(assert (=> b!581610 (= e!333715 false)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!264943 () SeekEntryResult!5890)

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36351 (_ BitVec 32)) SeekEntryResult!5890)

(assert (=> b!581610 (= lt!264943 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17450 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!581611 () Bool)

(declare-fun res!369429 () Bool)

(assert (=> b!581611 (=> (not res!369429) (not e!333717))))

(assert (=> b!581611 (= res!369429 (and (= (size!17814 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17814 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17814 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!581612 () Bool)

(declare-fun res!369431 () Bool)

(assert (=> b!581612 (=> (not res!369431) (not e!333717))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!581612 (= res!369431 (validKeyInArray!0 (select (arr!17450 a!2986) j!136)))))

(declare-fun b!581614 () Bool)

(declare-fun res!369427 () Bool)

(assert (=> b!581614 (=> (not res!369427) (not e!333717))))

(assert (=> b!581614 (= res!369427 (validKeyInArray!0 k!1786))))

(declare-fun b!581615 () Bool)

(declare-fun res!369430 () Bool)

(assert (=> b!581615 (=> (not res!369430) (not e!333715))))

(assert (=> b!581615 (= res!369430 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17450 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17450 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!369425 () Bool)

(assert (=> start!53450 (=> (not res!369425) (not e!333717))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53450 (= res!369425 (validMask!0 mask!3053))))

(assert (=> start!53450 e!333717))

(assert (=> start!53450 true))

(declare-fun array_inv!13246 (array!36351) Bool)

(assert (=> start!53450 (array_inv!13246 a!2986)))

(declare-fun b!581613 () Bool)

(declare-fun res!369426 () Bool)

(assert (=> b!581613 (=> (not res!369426) (not e!333717))))

(declare-fun arrayContainsKey!0 (array!36351 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!581613 (= res!369426 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(assert (= (and start!53450 res!369425) b!581611))

(assert (= (and b!581611 res!369429) b!581612))

(assert (= (and b!581612 res!369431) b!581614))

(assert (= (and b!581614 res!369427) b!581613))

(assert (= (and b!581613 res!369426) b!581607))

(assert (= (and b!581607 res!369424) b!581608))

(assert (= (and b!581608 res!369423) b!581609))

(assert (= (and b!581609 res!369428) b!581615))

(assert (= (and b!581615 res!369430) b!581610))

(declare-fun m!560141 () Bool)

(assert (=> b!581612 m!560141))

(assert (=> b!581612 m!560141))

(declare-fun m!560143 () Bool)

(assert (=> b!581612 m!560143))

(declare-fun m!560145 () Bool)

(assert (=> b!581615 m!560145))

(declare-fun m!560147 () Bool)

(assert (=> b!581615 m!560147))

(declare-fun m!560149 () Bool)

(assert (=> b!581615 m!560149))

(declare-fun m!560151 () Bool)

(assert (=> b!581609 m!560151))

(declare-fun m!560153 () Bool)

(assert (=> start!53450 m!560153))

(declare-fun m!560155 () Bool)

(assert (=> start!53450 m!560155))

(declare-fun m!560157 () Bool)

(assert (=> b!581613 m!560157))

(assert (=> b!581610 m!560141))

(assert (=> b!581610 m!560141))

(declare-fun m!560159 () Bool)

(assert (=> b!581610 m!560159))

(declare-fun m!560161 () Bool)

(assert (=> b!581607 m!560161))

(declare-fun m!560163 () Bool)

(assert (=> b!581614 m!560163))

(declare-fun m!560165 () Bool)

(assert (=> b!581608 m!560165))

(push 1)

(assert (not start!53450))

(assert (not b!581609))

(assert (not b!581612))

(assert (not b!581610))

(assert (not b!581607))

(assert (not b!581608))

(assert (not b!581614))

(assert (not b!581613))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

