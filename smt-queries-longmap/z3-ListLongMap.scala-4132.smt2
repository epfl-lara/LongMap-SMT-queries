; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56388 () Bool)

(assert start!56388)

(declare-fun b!624969 () Bool)

(declare-fun e!358331 () Bool)

(assert (=> b!624969 (= e!358331 false)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6567 0))(
  ( (MissingZero!6567 (index!28552 (_ BitVec 32))) (Found!6567 (index!28553 (_ BitVec 32))) (Intermediate!6567 (undefined!7379 Bool) (index!28554 (_ BitVec 32)) (x!57309 (_ BitVec 32))) (Undefined!6567) (MissingVacant!6567 (index!28555 (_ BitVec 32))) )
))
(declare-fun lt!289731 () SeekEntryResult!6567)

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37768 0))(
  ( (array!37769 (arr!18127 (Array (_ BitVec 32) (_ BitVec 64))) (size!18491 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37768)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37768 (_ BitVec 32)) SeekEntryResult!6567)

(assert (=> b!624969 (= lt!289731 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18127 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!624970 () Bool)

(declare-fun res!402983 () Bool)

(declare-fun e!358332 () Bool)

(assert (=> b!624970 (=> (not res!402983) (not e!358332))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!624970 (= res!402983 (validKeyInArray!0 (select (arr!18127 a!2986) j!136)))))

(declare-fun b!624971 () Bool)

(declare-fun res!402976 () Bool)

(assert (=> b!624971 (=> (not res!402976) (not e!358332))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!624971 (= res!402976 (and (= (size!18491 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18491 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18491 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!624972 () Bool)

(declare-fun res!402981 () Bool)

(assert (=> b!624972 (=> (not res!402981) (not e!358331))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37768 (_ BitVec 32)) Bool)

(assert (=> b!624972 (= res!402981 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!624973 () Bool)

(declare-fun res!402979 () Bool)

(assert (=> b!624973 (=> (not res!402979) (not e!358332))))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!624973 (= res!402979 (validKeyInArray!0 k0!1786))))

(declare-fun res!402978 () Bool)

(assert (=> start!56388 (=> (not res!402978) (not e!358332))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56388 (= res!402978 (validMask!0 mask!3053))))

(assert (=> start!56388 e!358332))

(assert (=> start!56388 true))

(declare-fun array_inv!13923 (array!37768) Bool)

(assert (=> start!56388 (array_inv!13923 a!2986)))

(declare-fun b!624974 () Bool)

(declare-fun res!402977 () Bool)

(assert (=> b!624974 (=> (not res!402977) (not e!358331))))

(assert (=> b!624974 (= res!402977 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18127 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18127 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!624975 () Bool)

(declare-fun res!402982 () Bool)

(assert (=> b!624975 (=> (not res!402982) (not e!358332))))

(declare-fun arrayContainsKey!0 (array!37768 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!624975 (= res!402982 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!624976 () Bool)

(declare-fun res!402975 () Bool)

(assert (=> b!624976 (=> (not res!402975) (not e!358331))))

(declare-datatypes ((List!12168 0))(
  ( (Nil!12165) (Cons!12164 (h!13209 (_ BitVec 64)) (t!18396 List!12168)) )
))
(declare-fun arrayNoDuplicates!0 (array!37768 (_ BitVec 32) List!12168) Bool)

(assert (=> b!624976 (= res!402975 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12165))))

(declare-fun b!624977 () Bool)

(assert (=> b!624977 (= e!358332 e!358331)))

(declare-fun res!402980 () Bool)

(assert (=> b!624977 (=> (not res!402980) (not e!358331))))

(declare-fun lt!289732 () SeekEntryResult!6567)

(assert (=> b!624977 (= res!402980 (or (= lt!289732 (MissingZero!6567 i!1108)) (= lt!289732 (MissingVacant!6567 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37768 (_ BitVec 32)) SeekEntryResult!6567)

(assert (=> b!624977 (= lt!289732 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(assert (= (and start!56388 res!402978) b!624971))

(assert (= (and b!624971 res!402976) b!624970))

(assert (= (and b!624970 res!402983) b!624973))

(assert (= (and b!624973 res!402979) b!624975))

(assert (= (and b!624975 res!402982) b!624977))

(assert (= (and b!624977 res!402980) b!624972))

(assert (= (and b!624972 res!402981) b!624976))

(assert (= (and b!624976 res!402975) b!624974))

(assert (= (and b!624974 res!402977) b!624969))

(declare-fun m!600565 () Bool)

(assert (=> b!624974 m!600565))

(declare-fun m!600567 () Bool)

(assert (=> b!624974 m!600567))

(declare-fun m!600569 () Bool)

(assert (=> b!624974 m!600569))

(declare-fun m!600571 () Bool)

(assert (=> b!624975 m!600571))

(declare-fun m!600573 () Bool)

(assert (=> start!56388 m!600573))

(declare-fun m!600575 () Bool)

(assert (=> start!56388 m!600575))

(declare-fun m!600577 () Bool)

(assert (=> b!624977 m!600577))

(declare-fun m!600579 () Bool)

(assert (=> b!624973 m!600579))

(declare-fun m!600581 () Bool)

(assert (=> b!624972 m!600581))

(declare-fun m!600583 () Bool)

(assert (=> b!624969 m!600583))

(assert (=> b!624969 m!600583))

(declare-fun m!600585 () Bool)

(assert (=> b!624969 m!600585))

(assert (=> b!624970 m!600583))

(assert (=> b!624970 m!600583))

(declare-fun m!600587 () Bool)

(assert (=> b!624970 m!600587))

(declare-fun m!600589 () Bool)

(assert (=> b!624976 m!600589))

(check-sat (not start!56388) (not b!624970) (not b!624973) (not b!624977) (not b!624976) (not b!624969) (not b!624975) (not b!624972))
(check-sat)
