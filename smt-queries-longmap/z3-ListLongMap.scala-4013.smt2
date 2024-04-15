; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54534 () Bool)

(assert start!54534)

(declare-fun b!596073 () Bool)

(declare-fun e!340545 () Bool)

(assert (=> b!596073 (= e!340545 true)))

(declare-fun lt!270608 () Bool)

(declare-fun k0!1786 () (_ BitVec 64))

(declare-datatypes ((List!11848 0))(
  ( (Nil!11845) (Cons!11844 (h!12889 (_ BitVec 64)) (t!18067 List!11848)) )
))
(declare-fun contains!2932 (List!11848 (_ BitVec 64)) Bool)

(assert (=> b!596073 (= lt!270608 (contains!2932 Nil!11845 k0!1786))))

(declare-fun res!382029 () Bool)

(declare-fun e!340547 () Bool)

(assert (=> start!54534 (=> (not res!382029) (not e!340547))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54534 (= res!382029 (validMask!0 mask!3053))))

(assert (=> start!54534 e!340547))

(assert (=> start!54534 true))

(declare-datatypes ((array!37008 0))(
  ( (array!37009 (arr!17768 (Array (_ BitVec 32) (_ BitVec 64))) (size!18133 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37008)

(declare-fun array_inv!13651 (array!37008) Bool)

(assert (=> start!54534 (array_inv!13651 a!2986)))

(declare-fun b!596074 () Bool)

(declare-fun res!382028 () Bool)

(assert (=> b!596074 (=> (not res!382028) (not e!340547))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!596074 (= res!382028 (and (= (size!18133 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18133 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18133 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!596075 () Bool)

(declare-fun res!382024 () Bool)

(assert (=> b!596075 (=> (not res!382024) (not e!340547))))

(declare-fun arrayContainsKey!0 (array!37008 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!596075 (= res!382024 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun e!340544 () Bool)

(declare-fun lt!270609 () array!37008)

(declare-fun b!596076 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!596076 (= e!340544 (arrayContainsKey!0 lt!270609 (select (arr!17768 a!2986) j!136) index!984))))

(declare-fun b!596077 () Bool)

(declare-fun e!340551 () Bool)

(declare-fun e!340541 () Bool)

(assert (=> b!596077 (= e!340551 e!340541)))

(declare-fun res!382026 () Bool)

(assert (=> b!596077 (=> res!382026 e!340541)))

(declare-fun lt!270618 () (_ BitVec 64))

(declare-fun lt!270619 () (_ BitVec 64))

(assert (=> b!596077 (= res!382026 (or (not (= (select (arr!17768 a!2986) j!136) lt!270619)) (not (= (select (arr!17768 a!2986) j!136) lt!270618)) (bvsge j!136 index!984)))))

(declare-fun b!596078 () Bool)

(declare-fun res!382016 () Bool)

(declare-fun e!340550 () Bool)

(assert (=> b!596078 (=> (not res!382016) (not e!340550))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37008 (_ BitVec 32)) Bool)

(assert (=> b!596078 (= res!382016 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!596079 () Bool)

(declare-fun res!382031 () Bool)

(assert (=> b!596079 (=> res!382031 e!340545)))

(declare-fun noDuplicate!269 (List!11848) Bool)

(assert (=> b!596079 (= res!382031 (not (noDuplicate!269 Nil!11845)))))

(declare-fun b!596080 () Bool)

(declare-fun e!340540 () Bool)

(declare-fun e!340539 () Bool)

(assert (=> b!596080 (= e!340540 e!340539)))

(declare-fun res!382012 () Bool)

(assert (=> b!596080 (=> res!382012 e!340539)))

(assert (=> b!596080 (= res!382012 (or (not (= (select (arr!17768 a!2986) j!136) lt!270619)) (not (= (select (arr!17768 a!2986) j!136) lt!270618)) (bvsge j!136 index!984)))))

(assert (=> b!596080 e!340551))

(declare-fun res!382023 () Bool)

(assert (=> b!596080 (=> (not res!382023) (not e!340551))))

(assert (=> b!596080 (= res!382023 (= lt!270618 (select (arr!17768 a!2986) j!136)))))

(assert (=> b!596080 (= lt!270618 (select (store (arr!17768 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!596081 () Bool)

(declare-fun res!382030 () Bool)

(assert (=> b!596081 (=> (not res!382030) (not e!340547))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!596081 (= res!382030 (validKeyInArray!0 k0!1786))))

(declare-fun b!596082 () Bool)

(declare-datatypes ((Unit!18732 0))(
  ( (Unit!18733) )
))
(declare-fun e!340543 () Unit!18732)

(declare-fun Unit!18734 () Unit!18732)

(assert (=> b!596082 (= e!340543 Unit!18734)))

(assert (=> b!596082 false))

(declare-fun b!596083 () Bool)

(declare-fun res!382018 () Bool)

(assert (=> b!596083 (=> (not res!382018) (not e!340547))))

(assert (=> b!596083 (= res!382018 (validKeyInArray!0 (select (arr!17768 a!2986) j!136)))))

(declare-fun b!596084 () Bool)

(declare-fun res!382015 () Bool)

(assert (=> b!596084 (=> res!382015 e!340545)))

(assert (=> b!596084 (= res!382015 (contains!2932 Nil!11845 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!596085 () Bool)

(declare-fun res!382013 () Bool)

(assert (=> b!596085 (=> (not res!382013) (not e!340550))))

(declare-fun arrayNoDuplicates!0 (array!37008 (_ BitVec 32) List!11848) Bool)

(assert (=> b!596085 (= res!382013 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11845))))

(declare-fun b!596086 () Bool)

(declare-fun e!340549 () Bool)

(declare-datatypes ((SeekEntryResult!6205 0))(
  ( (MissingZero!6205 (index!27068 (_ BitVec 32))) (Found!6205 (index!27069 (_ BitVec 32))) (Intermediate!6205 (undefined!7017 Bool) (index!27070 (_ BitVec 32)) (x!55876 (_ BitVec 32))) (Undefined!6205) (MissingVacant!6205 (index!27071 (_ BitVec 32))) )
))
(declare-fun lt!270617 () SeekEntryResult!6205)

(declare-fun lt!270611 () SeekEntryResult!6205)

(assert (=> b!596086 (= e!340549 (= lt!270617 lt!270611))))

(declare-fun b!596087 () Bool)

(assert (=> b!596087 (= e!340539 e!340545)))

(declare-fun res!382017 () Bool)

(assert (=> b!596087 (=> res!382017 e!340545)))

(assert (=> b!596087 (= res!382017 (or (bvsge (size!18133 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18133 a!2986))))))

(assert (=> b!596087 (arrayContainsKey!0 lt!270609 (select (arr!17768 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!270610 () Unit!18732)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37008 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18732)

(assert (=> b!596087 (= lt!270610 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!270609 (select (arr!17768 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!596088 () Bool)

(declare-fun e!340548 () Bool)

(declare-fun e!340546 () Bool)

(assert (=> b!596088 (= e!340548 e!340546)))

(declare-fun res!382021 () Bool)

(assert (=> b!596088 (=> (not res!382021) (not e!340546))))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!596088 (= res!382021 (and (= lt!270617 (Found!6205 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17768 a!2986) index!984) (select (arr!17768 a!2986) j!136))) (not (= (select (arr!17768 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37008 (_ BitVec 32)) SeekEntryResult!6205)

(assert (=> b!596088 (= lt!270617 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17768 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!596089 () Bool)

(assert (=> b!596089 (= e!340547 e!340550)))

(declare-fun res!382020 () Bool)

(assert (=> b!596089 (=> (not res!382020) (not e!340550))))

(declare-fun lt!270614 () SeekEntryResult!6205)

(assert (=> b!596089 (= res!382020 (or (= lt!270614 (MissingZero!6205 i!1108)) (= lt!270614 (MissingVacant!6205 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37008 (_ BitVec 32)) SeekEntryResult!6205)

(assert (=> b!596089 (= lt!270614 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!596090 () Bool)

(declare-fun Unit!18735 () Unit!18732)

(assert (=> b!596090 (= e!340543 Unit!18735)))

(declare-fun b!596091 () Bool)

(declare-fun res!382019 () Bool)

(assert (=> b!596091 (=> res!382019 e!340545)))

(assert (=> b!596091 (= res!382019 (contains!2932 Nil!11845 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!596092 () Bool)

(assert (=> b!596092 (= e!340546 (not e!340540))))

(declare-fun res!382014 () Bool)

(assert (=> b!596092 (=> res!382014 e!340540)))

(declare-fun lt!270615 () SeekEntryResult!6205)

(assert (=> b!596092 (= res!382014 (not (= lt!270615 (Found!6205 index!984))))))

(declare-fun lt!270612 () Unit!18732)

(assert (=> b!596092 (= lt!270612 e!340543)))

(declare-fun c!67398 () Bool)

(assert (=> b!596092 (= c!67398 (= lt!270615 Undefined!6205))))

(assert (=> b!596092 (= lt!270615 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!270619 lt!270609 mask!3053))))

(assert (=> b!596092 e!340549))

(declare-fun res!382025 () Bool)

(assert (=> b!596092 (=> (not res!382025) (not e!340549))))

(declare-fun lt!270613 () (_ BitVec 32))

(assert (=> b!596092 (= res!382025 (= lt!270611 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!270613 vacantSpotIndex!68 lt!270619 lt!270609 mask!3053)))))

(assert (=> b!596092 (= lt!270611 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!270613 vacantSpotIndex!68 (select (arr!17768 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!596092 (= lt!270619 (select (store (arr!17768 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!270616 () Unit!18732)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37008 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18732)

(assert (=> b!596092 (= lt!270616 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!270613 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!596092 (= lt!270613 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!596093 () Bool)

(assert (=> b!596093 (= e!340541 e!340544)))

(declare-fun res!382022 () Bool)

(assert (=> b!596093 (=> (not res!382022) (not e!340544))))

(assert (=> b!596093 (= res!382022 (arrayContainsKey!0 lt!270609 (select (arr!17768 a!2986) j!136) j!136))))

(declare-fun b!596094 () Bool)

(declare-fun res!382027 () Bool)

(assert (=> b!596094 (=> (not res!382027) (not e!340550))))

(assert (=> b!596094 (= res!382027 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17768 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!596095 () Bool)

(assert (=> b!596095 (= e!340550 e!340548)))

(declare-fun res!382011 () Bool)

(assert (=> b!596095 (=> (not res!382011) (not e!340548))))

(assert (=> b!596095 (= res!382011 (= (select (store (arr!17768 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!596095 (= lt!270609 (array!37009 (store (arr!17768 a!2986) i!1108 k0!1786) (size!18133 a!2986)))))

(assert (= (and start!54534 res!382029) b!596074))

(assert (= (and b!596074 res!382028) b!596083))

(assert (= (and b!596083 res!382018) b!596081))

(assert (= (and b!596081 res!382030) b!596075))

(assert (= (and b!596075 res!382024) b!596089))

(assert (= (and b!596089 res!382020) b!596078))

(assert (= (and b!596078 res!382016) b!596085))

(assert (= (and b!596085 res!382013) b!596094))

(assert (= (and b!596094 res!382027) b!596095))

(assert (= (and b!596095 res!382011) b!596088))

(assert (= (and b!596088 res!382021) b!596092))

(assert (= (and b!596092 res!382025) b!596086))

(assert (= (and b!596092 c!67398) b!596082))

(assert (= (and b!596092 (not c!67398)) b!596090))

(assert (= (and b!596092 (not res!382014)) b!596080))

(assert (= (and b!596080 res!382023) b!596077))

(assert (= (and b!596077 (not res!382026)) b!596093))

(assert (= (and b!596093 res!382022) b!596076))

(assert (= (and b!596080 (not res!382012)) b!596087))

(assert (= (and b!596087 (not res!382017)) b!596079))

(assert (= (and b!596079 (not res!382031)) b!596084))

(assert (= (and b!596084 (not res!382015)) b!596091))

(assert (= (and b!596091 (not res!382019)) b!596073))

(declare-fun m!573079 () Bool)

(assert (=> b!596075 m!573079))

(declare-fun m!573081 () Bool)

(assert (=> b!596087 m!573081))

(assert (=> b!596087 m!573081))

(declare-fun m!573083 () Bool)

(assert (=> b!596087 m!573083))

(assert (=> b!596087 m!573081))

(declare-fun m!573085 () Bool)

(assert (=> b!596087 m!573085))

(declare-fun m!573087 () Bool)

(assert (=> b!596085 m!573087))

(declare-fun m!573089 () Bool)

(assert (=> b!596089 m!573089))

(declare-fun m!573091 () Bool)

(assert (=> b!596094 m!573091))

(declare-fun m!573093 () Bool)

(assert (=> b!596088 m!573093))

(assert (=> b!596088 m!573081))

(assert (=> b!596088 m!573081))

(declare-fun m!573095 () Bool)

(assert (=> b!596088 m!573095))

(declare-fun m!573097 () Bool)

(assert (=> b!596091 m!573097))

(assert (=> b!596093 m!573081))

(assert (=> b!596093 m!573081))

(declare-fun m!573099 () Bool)

(assert (=> b!596093 m!573099))

(assert (=> b!596077 m!573081))

(assert (=> b!596080 m!573081))

(declare-fun m!573101 () Bool)

(assert (=> b!596080 m!573101))

(declare-fun m!573103 () Bool)

(assert (=> b!596080 m!573103))

(declare-fun m!573105 () Bool)

(assert (=> b!596092 m!573105))

(declare-fun m!573107 () Bool)

(assert (=> b!596092 m!573107))

(assert (=> b!596092 m!573081))

(assert (=> b!596092 m!573081))

(declare-fun m!573109 () Bool)

(assert (=> b!596092 m!573109))

(declare-fun m!573111 () Bool)

(assert (=> b!596092 m!573111))

(declare-fun m!573113 () Bool)

(assert (=> b!596092 m!573113))

(declare-fun m!573115 () Bool)

(assert (=> b!596092 m!573115))

(assert (=> b!596092 m!573101))

(declare-fun m!573117 () Bool)

(assert (=> b!596079 m!573117))

(assert (=> b!596076 m!573081))

(assert (=> b!596076 m!573081))

(declare-fun m!573119 () Bool)

(assert (=> b!596076 m!573119))

(declare-fun m!573121 () Bool)

(assert (=> start!54534 m!573121))

(declare-fun m!573123 () Bool)

(assert (=> start!54534 m!573123))

(assert (=> b!596095 m!573101))

(declare-fun m!573125 () Bool)

(assert (=> b!596095 m!573125))

(declare-fun m!573127 () Bool)

(assert (=> b!596078 m!573127))

(declare-fun m!573129 () Bool)

(assert (=> b!596073 m!573129))

(declare-fun m!573131 () Bool)

(assert (=> b!596081 m!573131))

(declare-fun m!573133 () Bool)

(assert (=> b!596084 m!573133))

(assert (=> b!596083 m!573081))

(assert (=> b!596083 m!573081))

(declare-fun m!573135 () Bool)

(assert (=> b!596083 m!573135))

(check-sat (not b!596081) (not b!596078) (not b!596087) (not b!596075) (not b!596083) (not b!596084) (not start!54534) (not b!596091) (not b!596093) (not b!596079) (not b!596092) (not b!596076) (not b!596088) (not b!596085) (not b!596073) (not b!596089))
(check-sat)
