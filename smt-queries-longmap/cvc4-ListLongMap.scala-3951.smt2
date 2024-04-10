; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53720 () Bool)

(assert start!53720)

(declare-fun b!585844 () Bool)

(declare-fun res!373664 () Bool)

(declare-fun e!335101 () Bool)

(assert (=> b!585844 (=> (not res!373664) (not e!335101))))

(declare-datatypes ((array!36621 0))(
  ( (array!36622 (arr!17585 (Array (_ BitVec 32) (_ BitVec 64))) (size!17949 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36621)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36621 (_ BitVec 32)) Bool)

(assert (=> b!585844 (= res!373664 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!585845 () Bool)

(declare-fun res!373665 () Bool)

(assert (=> b!585845 (=> (not res!373665) (not e!335101))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!585845 (= res!373665 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17585 a!2986) index!984) (select (arr!17585 a!2986) j!136))) (not (= (select (arr!17585 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun res!373666 () Bool)

(declare-fun e!335102 () Bool)

(assert (=> start!53720 (=> (not res!373666) (not e!335102))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53720 (= res!373666 (validMask!0 mask!3053))))

(assert (=> start!53720 e!335102))

(assert (=> start!53720 true))

(declare-fun array_inv!13381 (array!36621) Bool)

(assert (=> start!53720 (array_inv!13381 a!2986)))

(declare-fun b!585846 () Bool)

(declare-fun res!373662 () Bool)

(assert (=> b!585846 (=> (not res!373662) (not e!335101))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!585846 (= res!373662 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17585 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17585 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!585847 () Bool)

(declare-fun res!373663 () Bool)

(assert (=> b!585847 (=> (not res!373663) (not e!335101))))

(declare-datatypes ((List!11626 0))(
  ( (Nil!11623) (Cons!11622 (h!12667 (_ BitVec 64)) (t!17854 List!11626)) )
))
(declare-fun arrayNoDuplicates!0 (array!36621 (_ BitVec 32) List!11626) Bool)

(assert (=> b!585847 (= res!373663 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11623))))

(declare-fun b!585848 () Bool)

(declare-fun res!373668 () Bool)

(assert (=> b!585848 (=> (not res!373668) (not e!335102))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!585848 (= res!373668 (validKeyInArray!0 (select (arr!17585 a!2986) j!136)))))

(declare-fun b!585849 () Bool)

(declare-fun res!373669 () Bool)

(assert (=> b!585849 (=> (not res!373669) (not e!335101))))

(declare-datatypes ((SeekEntryResult!6025 0))(
  ( (MissingZero!6025 (index!26327 (_ BitVec 32))) (Found!6025 (index!26328 (_ BitVec 32))) (Intermediate!6025 (undefined!6837 Bool) (index!26329 (_ BitVec 32)) (x!55142 (_ BitVec 32))) (Undefined!6025) (MissingVacant!6025 (index!26330 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36621 (_ BitVec 32)) SeekEntryResult!6025)

(assert (=> b!585849 (= res!373669 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17585 a!2986) j!136) a!2986 mask!3053) (Found!6025 j!136)))))

(declare-fun b!585850 () Bool)

(declare-fun res!373661 () Bool)

(assert (=> b!585850 (=> (not res!373661) (not e!335102))))

(declare-fun arrayContainsKey!0 (array!36621 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!585850 (= res!373661 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!585851 () Bool)

(declare-fun res!373670 () Bool)

(assert (=> b!585851 (=> (not res!373670) (not e!335102))))

(assert (=> b!585851 (= res!373670 (validKeyInArray!0 k!1786))))

(declare-fun b!585852 () Bool)

(declare-fun res!373667 () Bool)

(assert (=> b!585852 (=> (not res!373667) (not e!335102))))

(assert (=> b!585852 (= res!373667 (and (= (size!17949 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17949 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17949 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!585853 () Bool)

(assert (=> b!585853 (= e!335102 e!335101)))

(declare-fun res!373660 () Bool)

(assert (=> b!585853 (=> (not res!373660) (not e!335101))))

(declare-fun lt!265931 () SeekEntryResult!6025)

(assert (=> b!585853 (= res!373660 (or (= lt!265931 (MissingZero!6025 i!1108)) (= lt!265931 (MissingVacant!6025 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36621 (_ BitVec 32)) SeekEntryResult!6025)

(assert (=> b!585853 (= lt!265931 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!585854 () Bool)

(assert (=> b!585854 (= e!335101 (not true))))

(declare-fun lt!265932 () (_ BitVec 32))

(assert (=> b!585854 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265932 vacantSpotIndex!68 (select (arr!17585 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265932 vacantSpotIndex!68 (select (store (arr!17585 a!2986) i!1108 k!1786) j!136) (array!36622 (store (arr!17585 a!2986) i!1108 k!1786) (size!17949 a!2986)) mask!3053))))

(declare-datatypes ((Unit!18170 0))(
  ( (Unit!18171) )
))
(declare-fun lt!265933 () Unit!18170)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36621 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18170)

(assert (=> b!585854 (= lt!265933 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!265932 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!585854 (= lt!265932 (nextIndex!0 index!984 x!910 mask!3053))))

(assert (= (and start!53720 res!373666) b!585852))

(assert (= (and b!585852 res!373667) b!585848))

(assert (= (and b!585848 res!373668) b!585851))

(assert (= (and b!585851 res!373670) b!585850))

(assert (= (and b!585850 res!373661) b!585853))

(assert (= (and b!585853 res!373660) b!585844))

(assert (= (and b!585844 res!373664) b!585847))

(assert (= (and b!585847 res!373663) b!585846))

(assert (= (and b!585846 res!373662) b!585849))

(assert (= (and b!585849 res!373669) b!585845))

(assert (= (and b!585845 res!373665) b!585854))

(declare-fun m!564113 () Bool)

(assert (=> b!585853 m!564113))

(declare-fun m!564115 () Bool)

(assert (=> b!585845 m!564115))

(declare-fun m!564117 () Bool)

(assert (=> b!585845 m!564117))

(assert (=> b!585849 m!564117))

(assert (=> b!585849 m!564117))

(declare-fun m!564119 () Bool)

(assert (=> b!585849 m!564119))

(declare-fun m!564121 () Bool)

(assert (=> start!53720 m!564121))

(declare-fun m!564123 () Bool)

(assert (=> start!53720 m!564123))

(declare-fun m!564125 () Bool)

(assert (=> b!585846 m!564125))

(declare-fun m!564127 () Bool)

(assert (=> b!585846 m!564127))

(declare-fun m!564129 () Bool)

(assert (=> b!585846 m!564129))

(declare-fun m!564131 () Bool)

(assert (=> b!585854 m!564131))

(declare-fun m!564133 () Bool)

(assert (=> b!585854 m!564133))

(assert (=> b!585854 m!564117))

(assert (=> b!585854 m!564127))

(declare-fun m!564135 () Bool)

(assert (=> b!585854 m!564135))

(assert (=> b!585854 m!564133))

(declare-fun m!564137 () Bool)

(assert (=> b!585854 m!564137))

(assert (=> b!585854 m!564117))

(declare-fun m!564139 () Bool)

(assert (=> b!585854 m!564139))

(assert (=> b!585848 m!564117))

(assert (=> b!585848 m!564117))

(declare-fun m!564141 () Bool)

(assert (=> b!585848 m!564141))

(declare-fun m!564143 () Bool)

(assert (=> b!585850 m!564143))

(declare-fun m!564145 () Bool)

(assert (=> b!585847 m!564145))

(declare-fun m!564147 () Bool)

(assert (=> b!585844 m!564147))

(declare-fun m!564149 () Bool)

(assert (=> b!585851 m!564149))

(push 1)

