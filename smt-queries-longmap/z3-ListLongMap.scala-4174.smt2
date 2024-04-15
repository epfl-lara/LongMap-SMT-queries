; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56886 () Bool)

(assert start!56886)

(declare-fun b!629661 () Bool)

(declare-fun res!407019 () Bool)

(declare-fun e!360062 () Bool)

(assert (=> b!629661 (=> (not res!407019) (not e!360062))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!629661 (= res!407019 (validKeyInArray!0 k0!1786))))

(declare-fun b!629662 () Bool)

(declare-fun e!360061 () Bool)

(declare-fun e!360059 () Bool)

(assert (=> b!629662 (= e!360061 e!360059)))

(declare-fun res!407020 () Bool)

(assert (=> b!629662 (=> (not res!407020) (not e!360059))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6688 0))(
  ( (MissingZero!6688 (index!29039 (_ BitVec 32))) (Found!6688 (index!29040 (_ BitVec 32))) (Intermediate!6688 (undefined!7500 Bool) (index!29041 (_ BitVec 32)) (x!57788 (_ BitVec 32))) (Undefined!6688) (MissingVacant!6688 (index!29042 (_ BitVec 32))) )
))
(declare-fun lt!290711 () SeekEntryResult!6688)

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!38031 0))(
  ( (array!38032 (arr!18251 (Array (_ BitVec 32) (_ BitVec 64))) (size!18616 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38031)

(assert (=> b!629662 (= res!407020 (and (= lt!290711 (Found!6688 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18251 a!2986) index!984) (select (arr!18251 a!2986) j!136))) (not (= (select (arr!18251 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38031 (_ BitVec 32)) SeekEntryResult!6688)

(assert (=> b!629662 (= lt!290711 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18251 a!2986) j!136) a!2986 mask!3053))))

(declare-fun res!407018 () Bool)

(assert (=> start!56886 (=> (not res!407018) (not e!360062))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56886 (= res!407018 (validMask!0 mask!3053))))

(assert (=> start!56886 e!360062))

(assert (=> start!56886 true))

(declare-fun array_inv!14134 (array!38031) Bool)

(assert (=> start!56886 (array_inv!14134 a!2986)))

(declare-fun b!629663 () Bool)

(declare-fun res!407023 () Bool)

(assert (=> b!629663 (=> (not res!407023) (not e!360062))))

(assert (=> b!629663 (= res!407023 (validKeyInArray!0 (select (arr!18251 a!2986) j!136)))))

(declare-fun b!629664 () Bool)

(declare-fun res!407024 () Bool)

(assert (=> b!629664 (=> (not res!407024) (not e!360061))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38031 (_ BitVec 32)) Bool)

(assert (=> b!629664 (= res!407024 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!629665 () Bool)

(declare-fun res!407022 () Bool)

(assert (=> b!629665 (=> (not res!407022) (not e!360062))))

(declare-fun arrayContainsKey!0 (array!38031 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!629665 (= res!407022 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!629666 () Bool)

(declare-fun res!407017 () Bool)

(assert (=> b!629666 (=> (not res!407017) (not e!360062))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!629666 (= res!407017 (and (= (size!18616 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18616 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18616 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!629667 () Bool)

(declare-fun res!407025 () Bool)

(assert (=> b!629667 (=> (not res!407025) (not e!360061))))

(declare-datatypes ((List!12331 0))(
  ( (Nil!12328) (Cons!12327 (h!13372 (_ BitVec 64)) (t!18550 List!12331)) )
))
(declare-fun arrayNoDuplicates!0 (array!38031 (_ BitVec 32) List!12331) Bool)

(assert (=> b!629667 (= res!407025 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12328))))

(declare-fun b!629668 () Bool)

(declare-fun e!360063 () Bool)

(declare-fun lt!290710 () SeekEntryResult!6688)

(assert (=> b!629668 (= e!360063 (= lt!290711 lt!290710))))

(declare-fun b!629669 () Bool)

(assert (=> b!629669 (= e!360062 e!360061)))

(declare-fun res!407021 () Bool)

(assert (=> b!629669 (=> (not res!407021) (not e!360061))))

(declare-fun lt!290712 () SeekEntryResult!6688)

(assert (=> b!629669 (= res!407021 (or (= lt!290712 (MissingZero!6688 i!1108)) (= lt!290712 (MissingVacant!6688 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38031 (_ BitVec 32)) SeekEntryResult!6688)

(assert (=> b!629669 (= lt!290712 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!629670 () Bool)

(assert (=> b!629670 (= e!360059 (not true))))

(assert (=> b!629670 e!360063))

(declare-fun res!407027 () Bool)

(assert (=> b!629670 (=> (not res!407027) (not e!360063))))

(declare-fun lt!290709 () (_ BitVec 32))

(assert (=> b!629670 (= res!407027 (= lt!290710 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!290709 vacantSpotIndex!68 (select (store (arr!18251 a!2986) i!1108 k0!1786) j!136) (array!38032 (store (arr!18251 a!2986) i!1108 k0!1786) (size!18616 a!2986)) mask!3053)))))

(assert (=> b!629670 (= lt!290710 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!290709 vacantSpotIndex!68 (select (arr!18251 a!2986) j!136) a!2986 mask!3053))))

(declare-datatypes ((Unit!21104 0))(
  ( (Unit!21105) )
))
(declare-fun lt!290713 () Unit!21104)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38031 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21104)

(assert (=> b!629670 (= lt!290713 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!290709 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!629670 (= lt!290709 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!629671 () Bool)

(declare-fun res!407026 () Bool)

(assert (=> b!629671 (=> (not res!407026) (not e!360061))))

(assert (=> b!629671 (= res!407026 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18251 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18251 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!56886 res!407018) b!629666))

(assert (= (and b!629666 res!407017) b!629663))

(assert (= (and b!629663 res!407023) b!629661))

(assert (= (and b!629661 res!407019) b!629665))

(assert (= (and b!629665 res!407022) b!629669))

(assert (= (and b!629669 res!407021) b!629664))

(assert (= (and b!629664 res!407024) b!629667))

(assert (= (and b!629667 res!407025) b!629671))

(assert (= (and b!629671 res!407026) b!629662))

(assert (= (and b!629662 res!407020) b!629670))

(assert (= (and b!629670 res!407027) b!629668))

(declare-fun m!604147 () Bool)

(assert (=> b!629663 m!604147))

(assert (=> b!629663 m!604147))

(declare-fun m!604149 () Bool)

(assert (=> b!629663 m!604149))

(declare-fun m!604151 () Bool)

(assert (=> b!629669 m!604151))

(declare-fun m!604153 () Bool)

(assert (=> b!629667 m!604153))

(declare-fun m!604155 () Bool)

(assert (=> b!629661 m!604155))

(declare-fun m!604157 () Bool)

(assert (=> start!56886 m!604157))

(declare-fun m!604159 () Bool)

(assert (=> start!56886 m!604159))

(declare-fun m!604161 () Bool)

(assert (=> b!629670 m!604161))

(declare-fun m!604163 () Bool)

(assert (=> b!629670 m!604163))

(declare-fun m!604165 () Bool)

(assert (=> b!629670 m!604165))

(assert (=> b!629670 m!604147))

(declare-fun m!604167 () Bool)

(assert (=> b!629670 m!604167))

(assert (=> b!629670 m!604147))

(declare-fun m!604169 () Bool)

(assert (=> b!629670 m!604169))

(assert (=> b!629670 m!604163))

(declare-fun m!604171 () Bool)

(assert (=> b!629670 m!604171))

(declare-fun m!604173 () Bool)

(assert (=> b!629671 m!604173))

(assert (=> b!629671 m!604169))

(declare-fun m!604175 () Bool)

(assert (=> b!629671 m!604175))

(declare-fun m!604177 () Bool)

(assert (=> b!629664 m!604177))

(declare-fun m!604179 () Bool)

(assert (=> b!629662 m!604179))

(assert (=> b!629662 m!604147))

(assert (=> b!629662 m!604147))

(declare-fun m!604181 () Bool)

(assert (=> b!629662 m!604181))

(declare-fun m!604183 () Bool)

(assert (=> b!629665 m!604183))

(check-sat (not start!56886) (not b!629669) (not b!629662) (not b!629670) (not b!629661) (not b!629667) (not b!629664) (not b!629663) (not b!629665))
(check-sat)
