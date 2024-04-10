; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57104 () Bool)

(assert start!57104)

(declare-fun b!632172 () Bool)

(declare-fun e!361432 () Bool)

(declare-fun e!361431 () Bool)

(assert (=> b!632172 (= e!361432 e!361431)))

(declare-fun res!408811 () Bool)

(assert (=> b!632172 (=> (not res!408811) (not e!361431))))

(declare-datatypes ((SeekEntryResult!6734 0))(
  ( (MissingZero!6734 (index!29229 (_ BitVec 32))) (Found!6734 (index!29230 (_ BitVec 32))) (Intermediate!6734 (undefined!7546 Bool) (index!29231 (_ BitVec 32)) (x!57969 (_ BitVec 32))) (Undefined!6734) (MissingVacant!6734 (index!29232 (_ BitVec 32))) )
))
(declare-fun lt!292138 () SeekEntryResult!6734)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!632172 (= res!408811 (or (= lt!292138 (MissingZero!6734 i!1108)) (= lt!292138 (MissingVacant!6734 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-datatypes ((array!38123 0))(
  ( (array!38124 (arr!18294 (Array (_ BitVec 32) (_ BitVec 64))) (size!18658 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38123)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38123 (_ BitVec 32)) SeekEntryResult!6734)

(assert (=> b!632172 (= lt!292138 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!632173 () Bool)

(declare-fun e!361427 () Bool)

(assert (=> b!632173 (= e!361427 true)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!632173 (= (select (store (arr!18294 a!2986) i!1108 k!1786) index!984) (select (arr!18294 a!2986) j!136))))

(declare-fun b!632174 () Bool)

(declare-fun res!408810 () Bool)

(assert (=> b!632174 (=> (not res!408810) (not e!361432))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!632174 (= res!408810 (validKeyInArray!0 (select (arr!18294 a!2986) j!136)))))

(declare-fun b!632175 () Bool)

(declare-fun res!408814 () Bool)

(assert (=> b!632175 (=> (not res!408814) (not e!361431))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38123 (_ BitVec 32)) Bool)

(assert (=> b!632175 (= res!408814 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!632176 () Bool)

(declare-fun e!361429 () Bool)

(assert (=> b!632176 (= e!361429 (not e!361427))))

(declare-fun res!408812 () Bool)

(assert (=> b!632176 (=> res!408812 e!361427)))

(declare-fun lt!292136 () SeekEntryResult!6734)

(assert (=> b!632176 (= res!408812 (not (= lt!292136 (Found!6734 index!984))))))

(declare-datatypes ((Unit!21270 0))(
  ( (Unit!21271) )
))
(declare-fun lt!292135 () Unit!21270)

(declare-fun e!361433 () Unit!21270)

(assert (=> b!632176 (= lt!292135 e!361433)))

(declare-fun c!72050 () Bool)

(assert (=> b!632176 (= c!72050 (= lt!292136 Undefined!6734))))

(declare-fun lt!292130 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!292133 () array!38123)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38123 (_ BitVec 32)) SeekEntryResult!6734)

(assert (=> b!632176 (= lt!292136 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!292130 lt!292133 mask!3053))))

(declare-fun e!361428 () Bool)

(assert (=> b!632176 e!361428))

(declare-fun res!408809 () Bool)

(assert (=> b!632176 (=> (not res!408809) (not e!361428))))

(declare-fun lt!292131 () (_ BitVec 32))

(declare-fun lt!292137 () SeekEntryResult!6734)

(assert (=> b!632176 (= res!408809 (= lt!292137 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!292131 vacantSpotIndex!68 lt!292130 lt!292133 mask!3053)))))

(assert (=> b!632176 (= lt!292137 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!292131 vacantSpotIndex!68 (select (arr!18294 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!632176 (= lt!292130 (select (store (arr!18294 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!292134 () Unit!21270)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38123 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21270)

(assert (=> b!632176 (= lt!292134 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!292131 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!632176 (= lt!292131 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!632177 () Bool)

(declare-fun res!408813 () Bool)

(assert (=> b!632177 (=> (not res!408813) (not e!361431))))

(assert (=> b!632177 (= res!408813 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18294 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!632178 () Bool)

(declare-fun Unit!21272 () Unit!21270)

(assert (=> b!632178 (= e!361433 Unit!21272)))

(assert (=> b!632178 false))

(declare-fun b!632179 () Bool)

(declare-fun res!408806 () Bool)

(assert (=> b!632179 (=> (not res!408806) (not e!361432))))

(assert (=> b!632179 (= res!408806 (validKeyInArray!0 k!1786))))

(declare-fun b!632180 () Bool)

(declare-fun res!408815 () Bool)

(assert (=> b!632180 (=> (not res!408815) (not e!361432))))

(assert (=> b!632180 (= res!408815 (and (= (size!18658 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18658 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18658 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!632181 () Bool)

(declare-fun Unit!21273 () Unit!21270)

(assert (=> b!632181 (= e!361433 Unit!21273)))

(declare-fun b!632182 () Bool)

(declare-fun res!408818 () Bool)

(assert (=> b!632182 (=> (not res!408818) (not e!361432))))

(declare-fun arrayContainsKey!0 (array!38123 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!632182 (= res!408818 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!632183 () Bool)

(declare-fun res!408808 () Bool)

(assert (=> b!632183 (=> (not res!408808) (not e!361431))))

(declare-datatypes ((List!12335 0))(
  ( (Nil!12332) (Cons!12331 (h!13376 (_ BitVec 64)) (t!18563 List!12335)) )
))
(declare-fun arrayNoDuplicates!0 (array!38123 (_ BitVec 32) List!12335) Bool)

(assert (=> b!632183 (= res!408808 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12332))))

(declare-fun b!632184 () Bool)

(declare-fun e!361430 () Bool)

(assert (=> b!632184 (= e!361431 e!361430)))

(declare-fun res!408816 () Bool)

(assert (=> b!632184 (=> (not res!408816) (not e!361430))))

(assert (=> b!632184 (= res!408816 (= (select (store (arr!18294 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!632184 (= lt!292133 (array!38124 (store (arr!18294 a!2986) i!1108 k!1786) (size!18658 a!2986)))))

(declare-fun b!632185 () Bool)

(declare-fun lt!292132 () SeekEntryResult!6734)

(assert (=> b!632185 (= e!361428 (= lt!292132 lt!292137))))

(declare-fun res!408807 () Bool)

(assert (=> start!57104 (=> (not res!408807) (not e!361432))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57104 (= res!408807 (validMask!0 mask!3053))))

(assert (=> start!57104 e!361432))

(assert (=> start!57104 true))

(declare-fun array_inv!14090 (array!38123) Bool)

(assert (=> start!57104 (array_inv!14090 a!2986)))

(declare-fun b!632186 () Bool)

(assert (=> b!632186 (= e!361430 e!361429)))

(declare-fun res!408817 () Bool)

(assert (=> b!632186 (=> (not res!408817) (not e!361429))))

(assert (=> b!632186 (= res!408817 (and (= lt!292132 (Found!6734 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18294 a!2986) index!984) (select (arr!18294 a!2986) j!136))) (not (= (select (arr!18294 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!632186 (= lt!292132 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18294 a!2986) j!136) a!2986 mask!3053))))

(assert (= (and start!57104 res!408807) b!632180))

(assert (= (and b!632180 res!408815) b!632174))

(assert (= (and b!632174 res!408810) b!632179))

(assert (= (and b!632179 res!408806) b!632182))

(assert (= (and b!632182 res!408818) b!632172))

(assert (= (and b!632172 res!408811) b!632175))

(assert (= (and b!632175 res!408814) b!632183))

(assert (= (and b!632183 res!408808) b!632177))

(assert (= (and b!632177 res!408813) b!632184))

(assert (= (and b!632184 res!408816) b!632186))

(assert (= (and b!632186 res!408817) b!632176))

(assert (= (and b!632176 res!408809) b!632185))

(assert (= (and b!632176 c!72050) b!632178))

(assert (= (and b!632176 (not c!72050)) b!632181))

(assert (= (and b!632176 (not res!408812)) b!632173))

(declare-fun m!607017 () Bool)

(assert (=> b!632173 m!607017))

(declare-fun m!607019 () Bool)

(assert (=> b!632173 m!607019))

(declare-fun m!607021 () Bool)

(assert (=> b!632173 m!607021))

(declare-fun m!607023 () Bool)

(assert (=> b!632182 m!607023))

(declare-fun m!607025 () Bool)

(assert (=> b!632186 m!607025))

(assert (=> b!632186 m!607021))

(assert (=> b!632186 m!607021))

(declare-fun m!607027 () Bool)

(assert (=> b!632186 m!607027))

(assert (=> b!632174 m!607021))

(assert (=> b!632174 m!607021))

(declare-fun m!607029 () Bool)

(assert (=> b!632174 m!607029))

(declare-fun m!607031 () Bool)

(assert (=> b!632176 m!607031))

(declare-fun m!607033 () Bool)

(assert (=> b!632176 m!607033))

(assert (=> b!632176 m!607021))

(assert (=> b!632176 m!607017))

(declare-fun m!607035 () Bool)

(assert (=> b!632176 m!607035))

(declare-fun m!607037 () Bool)

(assert (=> b!632176 m!607037))

(assert (=> b!632176 m!607021))

(declare-fun m!607039 () Bool)

(assert (=> b!632176 m!607039))

(declare-fun m!607041 () Bool)

(assert (=> b!632176 m!607041))

(declare-fun m!607043 () Bool)

(assert (=> start!57104 m!607043))

(declare-fun m!607045 () Bool)

(assert (=> start!57104 m!607045))

(declare-fun m!607047 () Bool)

(assert (=> b!632179 m!607047))

(assert (=> b!632184 m!607017))

(declare-fun m!607049 () Bool)

(assert (=> b!632184 m!607049))

(declare-fun m!607051 () Bool)

(assert (=> b!632175 m!607051))

(declare-fun m!607053 () Bool)

(assert (=> b!632172 m!607053))

(declare-fun m!607055 () Bool)

(assert (=> b!632177 m!607055))

(declare-fun m!607057 () Bool)

(assert (=> b!632183 m!607057))

(push 1)

