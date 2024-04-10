; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53686 () Bool)

(assert start!53686)

(declare-fun b!585258 () Bool)

(declare-fun res!373078 () Bool)

(declare-fun e!334923 () Bool)

(assert (=> b!585258 (=> (not res!373078) (not e!334923))))

(declare-datatypes ((array!36587 0))(
  ( (array!36588 (arr!17568 (Array (_ BitVec 32) (_ BitVec 64))) (size!17932 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36587)

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36587 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!585258 (= res!373078 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!585259 () Bool)

(declare-fun res!373081 () Bool)

(assert (=> b!585259 (=> (not res!373081) (not e!334923))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!585259 (= res!373081 (validKeyInArray!0 (select (arr!17568 a!2986) j!136)))))

(declare-fun b!585260 () Bool)

(declare-fun e!334924 () Bool)

(assert (=> b!585260 (= e!334924 false)))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun lt!265779 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6008 0))(
  ( (MissingZero!6008 (index!26259 (_ BitVec 32))) (Found!6008 (index!26260 (_ BitVec 32))) (Intermediate!6008 (undefined!6820 Bool) (index!26261 (_ BitVec 32)) (x!55085 (_ BitVec 32))) (Undefined!6008) (MissingVacant!6008 (index!26262 (_ BitVec 32))) )
))
(declare-fun lt!265780 () SeekEntryResult!6008)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36587 (_ BitVec 32)) SeekEntryResult!6008)

(assert (=> b!585260 (= lt!265780 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265779 vacantSpotIndex!68 (select (arr!17568 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!585261 () Bool)

(declare-fun res!373074 () Bool)

(declare-fun e!334925 () Bool)

(assert (=> b!585261 (=> (not res!373074) (not e!334925))))

(declare-datatypes ((List!11609 0))(
  ( (Nil!11606) (Cons!11605 (h!12650 (_ BitVec 64)) (t!17837 List!11609)) )
))
(declare-fun arrayNoDuplicates!0 (array!36587 (_ BitVec 32) List!11609) Bool)

(assert (=> b!585261 (= res!373074 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11606))))

(declare-fun b!585262 () Bool)

(declare-fun res!373079 () Bool)

(assert (=> b!585262 (=> (not res!373079) (not e!334923))))

(assert (=> b!585262 (= res!373079 (validKeyInArray!0 k!1786))))

(declare-fun b!585263 () Bool)

(declare-fun res!373085 () Bool)

(assert (=> b!585263 (=> (not res!373085) (not e!334925))))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!585263 (= res!373085 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17568 a!2986) index!984) (select (arr!17568 a!2986) j!136))) (not (= (select (arr!17568 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun res!373075 () Bool)

(assert (=> start!53686 (=> (not res!373075) (not e!334923))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53686 (= res!373075 (validMask!0 mask!3053))))

(assert (=> start!53686 e!334923))

(assert (=> start!53686 true))

(declare-fun array_inv!13364 (array!36587) Bool)

(assert (=> start!53686 (array_inv!13364 a!2986)))

(declare-fun b!585264 () Bool)

(declare-fun res!373082 () Bool)

(assert (=> b!585264 (=> (not res!373082) (not e!334925))))

(assert (=> b!585264 (= res!373082 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17568 a!2986) j!136) a!2986 mask!3053) (Found!6008 j!136)))))

(declare-fun b!585265 () Bool)

(assert (=> b!585265 (= e!334923 e!334925)))

(declare-fun res!373076 () Bool)

(assert (=> b!585265 (=> (not res!373076) (not e!334925))))

(declare-fun lt!265778 () SeekEntryResult!6008)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!585265 (= res!373076 (or (= lt!265778 (MissingZero!6008 i!1108)) (= lt!265778 (MissingVacant!6008 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36587 (_ BitVec 32)) SeekEntryResult!6008)

(assert (=> b!585265 (= lt!265778 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!585266 () Bool)

(declare-fun res!373080 () Bool)

(assert (=> b!585266 (=> (not res!373080) (not e!334925))))

(assert (=> b!585266 (= res!373080 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17568 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17568 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!585267 () Bool)

(assert (=> b!585267 (= e!334925 e!334924)))

(declare-fun res!373083 () Bool)

(assert (=> b!585267 (=> (not res!373083) (not e!334924))))

(assert (=> b!585267 (= res!373083 (and (bvsge lt!265779 #b00000000000000000000000000000000) (bvslt lt!265779 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b00000000000000000000000000000000)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!585267 (= lt!265779 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!585268 () Bool)

(declare-fun res!373077 () Bool)

(assert (=> b!585268 (=> (not res!373077) (not e!334925))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36587 (_ BitVec 32)) Bool)

(assert (=> b!585268 (= res!373077 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!585269 () Bool)

(declare-fun res!373084 () Bool)

(assert (=> b!585269 (=> (not res!373084) (not e!334923))))

(assert (=> b!585269 (= res!373084 (and (= (size!17932 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17932 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17932 a!2986)) (not (= i!1108 j!136))))))

(assert (= (and start!53686 res!373075) b!585269))

(assert (= (and b!585269 res!373084) b!585259))

(assert (= (and b!585259 res!373081) b!585262))

(assert (= (and b!585262 res!373079) b!585258))

(assert (= (and b!585258 res!373078) b!585265))

(assert (= (and b!585265 res!373076) b!585268))

(assert (= (and b!585268 res!373077) b!585261))

(assert (= (and b!585261 res!373074) b!585266))

(assert (= (and b!585266 res!373080) b!585264))

(assert (= (and b!585264 res!373082) b!585263))

(assert (= (and b!585263 res!373085) b!585267))

(assert (= (and b!585267 res!373083) b!585260))

(declare-fun m!563521 () Bool)

(assert (=> b!585260 m!563521))

(assert (=> b!585260 m!563521))

(declare-fun m!563523 () Bool)

(assert (=> b!585260 m!563523))

(declare-fun m!563525 () Bool)

(assert (=> b!585261 m!563525))

(declare-fun m!563527 () Bool)

(assert (=> start!53686 m!563527))

(declare-fun m!563529 () Bool)

(assert (=> start!53686 m!563529))

(declare-fun m!563531 () Bool)

(assert (=> b!585263 m!563531))

(assert (=> b!585263 m!563521))

(declare-fun m!563533 () Bool)

(assert (=> b!585265 m!563533))

(declare-fun m!563535 () Bool)

(assert (=> b!585258 m!563535))

(declare-fun m!563537 () Bool)

(assert (=> b!585262 m!563537))

(declare-fun m!563539 () Bool)

(assert (=> b!585267 m!563539))

(declare-fun m!563541 () Bool)

(assert (=> b!585266 m!563541))

(declare-fun m!563543 () Bool)

(assert (=> b!585266 m!563543))

(declare-fun m!563545 () Bool)

(assert (=> b!585266 m!563545))

(declare-fun m!563547 () Bool)

(assert (=> b!585268 m!563547))

(assert (=> b!585264 m!563521))

(assert (=> b!585264 m!563521))

(declare-fun m!563549 () Bool)

(assert (=> b!585264 m!563549))

(assert (=> b!585259 m!563521))

(assert (=> b!585259 m!563521))

(declare-fun m!563551 () Bool)

(assert (=> b!585259 m!563551))

(push 1)

