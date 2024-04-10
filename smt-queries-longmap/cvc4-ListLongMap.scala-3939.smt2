; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53648 () Bool)

(assert start!53648)

(declare-fun b!584574 () Bool)

(declare-fun res!372399 () Bool)

(declare-fun e!334696 () Bool)

(assert (=> b!584574 (=> (not res!372399) (not e!334696))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36549 0))(
  ( (array!36550 (arr!17549 (Array (_ BitVec 32) (_ BitVec 64))) (size!17913 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36549)

(assert (=> b!584574 (= res!372399 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17549 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17549 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!372398 () Bool)

(declare-fun e!334697 () Bool)

(assert (=> start!53648 (=> (not res!372398) (not e!334697))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53648 (= res!372398 (validMask!0 mask!3053))))

(assert (=> start!53648 e!334697))

(assert (=> start!53648 true))

(declare-fun array_inv!13345 (array!36549) Bool)

(assert (=> start!53648 (array_inv!13345 a!2986)))

(declare-fun b!584575 () Bool)

(assert (=> b!584575 (= e!334697 e!334696)))

(declare-fun res!372395 () Bool)

(assert (=> b!584575 (=> (not res!372395) (not e!334696))))

(declare-datatypes ((SeekEntryResult!5989 0))(
  ( (MissingZero!5989 (index!26183 (_ BitVec 32))) (Found!5989 (index!26184 (_ BitVec 32))) (Intermediate!5989 (undefined!6801 Bool) (index!26185 (_ BitVec 32)) (x!55010 (_ BitVec 32))) (Undefined!5989) (MissingVacant!5989 (index!26186 (_ BitVec 32))) )
))
(declare-fun lt!265609 () SeekEntryResult!5989)

(assert (=> b!584575 (= res!372395 (or (= lt!265609 (MissingZero!5989 i!1108)) (= lt!265609 (MissingVacant!5989 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36549 (_ BitVec 32)) SeekEntryResult!5989)

(assert (=> b!584575 (= lt!265609 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!584576 () Bool)

(declare-fun res!372401 () Bool)

(assert (=> b!584576 (=> (not res!372401) (not e!334696))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36549 (_ BitVec 32)) Bool)

(assert (=> b!584576 (= res!372401 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!584577 () Bool)

(declare-fun e!334695 () Bool)

(assert (=> b!584577 (= e!334696 e!334695)))

(declare-fun res!372400 () Bool)

(assert (=> b!584577 (=> (not res!372400) (not e!334695))))

(declare-fun lt!265608 () (_ BitVec 32))

(assert (=> b!584577 (= res!372400 (and (bvsge lt!265608 #b00000000000000000000000000000000) (bvslt lt!265608 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b00000000000000000000000000000000)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!584577 (= lt!265608 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!584578 () Bool)

(declare-fun res!372393 () Bool)

(assert (=> b!584578 (=> (not res!372393) (not e!334697))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!584578 (= res!372393 (and (= (size!17913 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17913 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17913 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!584579 () Bool)

(declare-fun res!372392 () Bool)

(assert (=> b!584579 (=> (not res!372392) (not e!334696))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36549 (_ BitVec 32)) SeekEntryResult!5989)

(assert (=> b!584579 (= res!372392 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17549 a!2986) j!136) a!2986 mask!3053) (Found!5989 j!136)))))

(declare-fun b!584580 () Bool)

(assert (=> b!584580 (= e!334695 false)))

(declare-fun lt!265607 () SeekEntryResult!5989)

(assert (=> b!584580 (= lt!265607 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265608 vacantSpotIndex!68 (select (arr!17549 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!584581 () Bool)

(declare-fun res!372391 () Bool)

(assert (=> b!584581 (=> (not res!372391) (not e!334697))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!584581 (= res!372391 (validKeyInArray!0 k!1786))))

(declare-fun b!584582 () Bool)

(declare-fun res!372394 () Bool)

(assert (=> b!584582 (=> (not res!372394) (not e!334696))))

(assert (=> b!584582 (= res!372394 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17549 a!2986) index!984) (select (arr!17549 a!2986) j!136))) (not (= (select (arr!17549 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!584583 () Bool)

(declare-fun res!372397 () Bool)

(assert (=> b!584583 (=> (not res!372397) (not e!334696))))

(declare-datatypes ((List!11590 0))(
  ( (Nil!11587) (Cons!11586 (h!12631 (_ BitVec 64)) (t!17818 List!11590)) )
))
(declare-fun arrayNoDuplicates!0 (array!36549 (_ BitVec 32) List!11590) Bool)

(assert (=> b!584583 (= res!372397 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11587))))

(declare-fun b!584584 () Bool)

(declare-fun res!372396 () Bool)

(assert (=> b!584584 (=> (not res!372396) (not e!334697))))

(assert (=> b!584584 (= res!372396 (validKeyInArray!0 (select (arr!17549 a!2986) j!136)))))

(declare-fun b!584585 () Bool)

(declare-fun res!372390 () Bool)

(assert (=> b!584585 (=> (not res!372390) (not e!334697))))

(declare-fun arrayContainsKey!0 (array!36549 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!584585 (= res!372390 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(assert (= (and start!53648 res!372398) b!584578))

(assert (= (and b!584578 res!372393) b!584584))

(assert (= (and b!584584 res!372396) b!584581))

(assert (= (and b!584581 res!372391) b!584585))

(assert (= (and b!584585 res!372390) b!584575))

(assert (= (and b!584575 res!372395) b!584576))

(assert (= (and b!584576 res!372401) b!584583))

(assert (= (and b!584583 res!372397) b!584574))

(assert (= (and b!584574 res!372399) b!584579))

(assert (= (and b!584579 res!372392) b!584582))

(assert (= (and b!584582 res!372394) b!584577))

(assert (= (and b!584577 res!372400) b!584580))

(declare-fun m!562913 () Bool)

(assert (=> b!584576 m!562913))

(declare-fun m!562915 () Bool)

(assert (=> b!584579 m!562915))

(assert (=> b!584579 m!562915))

(declare-fun m!562917 () Bool)

(assert (=> b!584579 m!562917))

(declare-fun m!562919 () Bool)

(assert (=> b!584585 m!562919))

(assert (=> b!584584 m!562915))

(assert (=> b!584584 m!562915))

(declare-fun m!562921 () Bool)

(assert (=> b!584584 m!562921))

(declare-fun m!562923 () Bool)

(assert (=> start!53648 m!562923))

(declare-fun m!562925 () Bool)

(assert (=> start!53648 m!562925))

(declare-fun m!562927 () Bool)

(assert (=> b!584577 m!562927))

(declare-fun m!562929 () Bool)

(assert (=> b!584575 m!562929))

(declare-fun m!562931 () Bool)

(assert (=> b!584582 m!562931))

(assert (=> b!584582 m!562915))

(assert (=> b!584580 m!562915))

(assert (=> b!584580 m!562915))

(declare-fun m!562933 () Bool)

(assert (=> b!584580 m!562933))

(declare-fun m!562935 () Bool)

(assert (=> b!584581 m!562935))

(declare-fun m!562937 () Bool)

(assert (=> b!584574 m!562937))

(declare-fun m!562939 () Bool)

(assert (=> b!584574 m!562939))

(declare-fun m!562941 () Bool)

(assert (=> b!584574 m!562941))

(declare-fun m!562943 () Bool)

(assert (=> b!584583 m!562943))

(push 1)

(assert (not b!584577))

(assert (not b!584575))

(assert (not b!584579))

