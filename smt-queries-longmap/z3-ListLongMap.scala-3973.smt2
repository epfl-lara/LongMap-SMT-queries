; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53958 () Bool)

(assert start!53958)

(declare-fun b!588417 () Bool)

(declare-fun res!375954 () Bool)

(declare-fun e!336047 () Bool)

(assert (=> b!588417 (=> (not res!375954) (not e!336047))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!36747 0))(
  ( (array!36748 (arr!17644 (Array (_ BitVec 32) (_ BitVec 64))) (size!18008 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36747)

(declare-fun mask!3053 () (_ BitVec 32))

(assert (=> b!588417 (= res!375954 (and (= (size!18008 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18008 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18008 a!2986)) (not (= i!1108 j!136))))))

(declare-fun res!375955 () Bool)

(assert (=> start!53958 (=> (not res!375955) (not e!336047))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53958 (= res!375955 (validMask!0 mask!3053))))

(assert (=> start!53958 e!336047))

(assert (=> start!53958 true))

(declare-fun array_inv!13503 (array!36747) Bool)

(assert (=> start!53958 (array_inv!13503 a!2986)))

(declare-fun b!588418 () Bool)

(declare-fun res!375949 () Bool)

(assert (=> b!588418 (=> (not res!375949) (not e!336047))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36747 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!588418 (= res!375949 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!588419 () Bool)

(declare-fun e!336045 () Bool)

(declare-datatypes ((SeekEntryResult!6040 0))(
  ( (MissingZero!6040 (index!26390 (_ BitVec 32))) (Found!6040 (index!26391 (_ BitVec 32))) (Intermediate!6040 (undefined!6852 Bool) (index!26392 (_ BitVec 32)) (x!55345 (_ BitVec 32))) (Undefined!6040) (MissingVacant!6040 (index!26393 (_ BitVec 32))) )
))
(declare-fun lt!266787 () SeekEntryResult!6040)

(declare-fun lt!266790 () SeekEntryResult!6040)

(assert (=> b!588419 (= e!336045 (= lt!266787 lt!266790))))

(declare-fun b!588420 () Bool)

(declare-fun e!336048 () Bool)

(declare-fun e!336046 () Bool)

(assert (=> b!588420 (= e!336048 e!336046)))

(declare-fun res!375957 () Bool)

(assert (=> b!588420 (=> (not res!375957) (not e!336046))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!588420 (= res!375957 (and (= lt!266787 (Found!6040 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17644 a!2986) index!984) (select (arr!17644 a!2986) j!136))) (not (= (select (arr!17644 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36747 (_ BitVec 32)) SeekEntryResult!6040)

(assert (=> b!588420 (= lt!266787 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17644 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!588421 () Bool)

(declare-fun res!375948 () Bool)

(assert (=> b!588421 (=> (not res!375948) (not e!336048))))

(assert (=> b!588421 (= res!375948 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17644 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17644 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!588422 () Bool)

(declare-fun res!375951 () Bool)

(assert (=> b!588422 (=> (not res!375951) (not e!336048))))

(declare-datatypes ((List!11592 0))(
  ( (Nil!11589) (Cons!11588 (h!12636 (_ BitVec 64)) (t!17812 List!11592)) )
))
(declare-fun arrayNoDuplicates!0 (array!36747 (_ BitVec 32) List!11592) Bool)

(assert (=> b!588422 (= res!375951 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11589))))

(declare-fun b!588423 () Bool)

(assert (=> b!588423 (= e!336047 e!336048)))

(declare-fun res!375952 () Bool)

(assert (=> b!588423 (=> (not res!375952) (not e!336048))))

(declare-fun lt!266791 () SeekEntryResult!6040)

(assert (=> b!588423 (= res!375952 (or (= lt!266791 (MissingZero!6040 i!1108)) (= lt!266791 (MissingVacant!6040 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36747 (_ BitVec 32)) SeekEntryResult!6040)

(assert (=> b!588423 (= lt!266791 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!588424 () Bool)

(declare-fun res!375956 () Bool)

(assert (=> b!588424 (=> (not res!375956) (not e!336047))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!588424 (= res!375956 (validKeyInArray!0 (select (arr!17644 a!2986) j!136)))))

(declare-fun b!588425 () Bool)

(assert (=> b!588425 (= e!336046 (not true))))

(assert (=> b!588425 e!336045))

(declare-fun res!375958 () Bool)

(assert (=> b!588425 (=> (not res!375958) (not e!336045))))

(declare-fun lt!266789 () (_ BitVec 32))

(assert (=> b!588425 (= res!375958 (= lt!266790 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266789 vacantSpotIndex!68 (select (store (arr!17644 a!2986) i!1108 k0!1786) j!136) (array!36748 (store (arr!17644 a!2986) i!1108 k0!1786) (size!18008 a!2986)) mask!3053)))))

(assert (=> b!588425 (= lt!266790 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266789 vacantSpotIndex!68 (select (arr!17644 a!2986) j!136) a!2986 mask!3053))))

(declare-datatypes ((Unit!18277 0))(
  ( (Unit!18278) )
))
(declare-fun lt!266788 () Unit!18277)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36747 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18277)

(assert (=> b!588425 (= lt!266788 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!266789 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!588425 (= lt!266789 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!588426 () Bool)

(declare-fun res!375950 () Bool)

(assert (=> b!588426 (=> (not res!375950) (not e!336047))))

(assert (=> b!588426 (= res!375950 (validKeyInArray!0 k0!1786))))

(declare-fun b!588427 () Bool)

(declare-fun res!375953 () Bool)

(assert (=> b!588427 (=> (not res!375953) (not e!336048))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36747 (_ BitVec 32)) Bool)

(assert (=> b!588427 (= res!375953 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(assert (= (and start!53958 res!375955) b!588417))

(assert (= (and b!588417 res!375954) b!588424))

(assert (= (and b!588424 res!375956) b!588426))

(assert (= (and b!588426 res!375950) b!588418))

(assert (= (and b!588418 res!375949) b!588423))

(assert (= (and b!588423 res!375952) b!588427))

(assert (= (and b!588427 res!375953) b!588422))

(assert (= (and b!588422 res!375951) b!588421))

(assert (= (and b!588421 res!375948) b!588420))

(assert (= (and b!588420 res!375957) b!588425))

(assert (= (and b!588425 res!375958) b!588419))

(declare-fun m!567089 () Bool)

(assert (=> b!588422 m!567089))

(declare-fun m!567091 () Bool)

(assert (=> b!588424 m!567091))

(assert (=> b!588424 m!567091))

(declare-fun m!567093 () Bool)

(assert (=> b!588424 m!567093))

(declare-fun m!567095 () Bool)

(assert (=> start!53958 m!567095))

(declare-fun m!567097 () Bool)

(assert (=> start!53958 m!567097))

(declare-fun m!567099 () Bool)

(assert (=> b!588426 m!567099))

(declare-fun m!567101 () Bool)

(assert (=> b!588423 m!567101))

(declare-fun m!567103 () Bool)

(assert (=> b!588418 m!567103))

(declare-fun m!567105 () Bool)

(assert (=> b!588420 m!567105))

(assert (=> b!588420 m!567091))

(assert (=> b!588420 m!567091))

(declare-fun m!567107 () Bool)

(assert (=> b!588420 m!567107))

(declare-fun m!567109 () Bool)

(assert (=> b!588427 m!567109))

(declare-fun m!567111 () Bool)

(assert (=> b!588425 m!567111))

(declare-fun m!567113 () Bool)

(assert (=> b!588425 m!567113))

(assert (=> b!588425 m!567091))

(declare-fun m!567115 () Bool)

(assert (=> b!588425 m!567115))

(assert (=> b!588425 m!567091))

(declare-fun m!567117 () Bool)

(assert (=> b!588425 m!567117))

(declare-fun m!567119 () Bool)

(assert (=> b!588425 m!567119))

(assert (=> b!588425 m!567119))

(declare-fun m!567121 () Bool)

(assert (=> b!588425 m!567121))

(declare-fun m!567123 () Bool)

(assert (=> b!588421 m!567123))

(assert (=> b!588421 m!567115))

(declare-fun m!567125 () Bool)

(assert (=> b!588421 m!567125))

(check-sat (not b!588426) (not start!53958) (not b!588422) (not b!588418) (not b!588424) (not b!588425) (not b!588427) (not b!588420) (not b!588423))
(check-sat)
