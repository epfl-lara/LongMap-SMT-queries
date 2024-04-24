; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56496 () Bool)

(assert start!56496)

(declare-fun b!625970 () Bool)

(declare-fun res!403874 () Bool)

(declare-fun e!358720 () Bool)

(assert (=> b!625970 (=> (not res!403874) (not e!358720))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37821 0))(
  ( (array!37822 (arr!18151 (Array (_ BitVec 32) (_ BitVec 64))) (size!18515 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37821)

(assert (=> b!625970 (= res!403874 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18151 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18151 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!403879 () Bool)

(declare-fun e!358722 () Bool)

(assert (=> start!56496 (=> (not res!403879) (not e!358722))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56496 (= res!403879 (validMask!0 mask!3053))))

(assert (=> start!56496 e!358722))

(assert (=> start!56496 true))

(declare-fun array_inv!14010 (array!37821) Bool)

(assert (=> start!56496 (array_inv!14010 a!2986)))

(declare-fun b!625971 () Bool)

(declare-fun res!403871 () Bool)

(assert (=> b!625971 (=> (not res!403871) (not e!358722))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!625971 (= res!403871 (validKeyInArray!0 (select (arr!18151 a!2986) j!136)))))

(declare-fun b!625972 () Bool)

(assert (=> b!625972 (= e!358722 e!358720)))

(declare-fun res!403872 () Bool)

(assert (=> b!625972 (=> (not res!403872) (not e!358720))))

(declare-datatypes ((SeekEntryResult!6547 0))(
  ( (MissingZero!6547 (index!28472 (_ BitVec 32))) (Found!6547 (index!28473 (_ BitVec 32))) (Intermediate!6547 (undefined!7359 Bool) (index!28474 (_ BitVec 32)) (x!57372 (_ BitVec 32))) (Undefined!6547) (MissingVacant!6547 (index!28475 (_ BitVec 32))) )
))
(declare-fun lt!289998 () SeekEntryResult!6547)

(assert (=> b!625972 (= res!403872 (or (= lt!289998 (MissingZero!6547 i!1108)) (= lt!289998 (MissingVacant!6547 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37821 (_ BitVec 32)) SeekEntryResult!6547)

(assert (=> b!625972 (= lt!289998 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!625973 () Bool)

(declare-fun res!403875 () Bool)

(assert (=> b!625973 (=> (not res!403875) (not e!358722))))

(assert (=> b!625973 (= res!403875 (and (= (size!18515 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18515 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18515 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!625974 () Bool)

(declare-fun res!403877 () Bool)

(assert (=> b!625974 (=> (not res!403877) (not e!358720))))

(declare-datatypes ((List!12099 0))(
  ( (Nil!12096) (Cons!12095 (h!13143 (_ BitVec 64)) (t!18319 List!12099)) )
))
(declare-fun arrayNoDuplicates!0 (array!37821 (_ BitVec 32) List!12099) Bool)

(assert (=> b!625974 (= res!403877 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12096))))

(declare-fun b!625975 () Bool)

(declare-fun res!403873 () Bool)

(assert (=> b!625975 (=> (not res!403873) (not e!358722))))

(assert (=> b!625975 (= res!403873 (validKeyInArray!0 k0!1786))))

(declare-fun b!625976 () Bool)

(declare-fun res!403878 () Bool)

(assert (=> b!625976 (=> (not res!403878) (not e!358720))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37821 (_ BitVec 32)) Bool)

(assert (=> b!625976 (= res!403878 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!625977 () Bool)

(assert (=> b!625977 (= e!358720 false)))

(declare-fun lt!289999 () SeekEntryResult!6547)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37821 (_ BitVec 32)) SeekEntryResult!6547)

(assert (=> b!625977 (= lt!289999 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18151 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!625978 () Bool)

(declare-fun res!403876 () Bool)

(assert (=> b!625978 (=> (not res!403876) (not e!358722))))

(declare-fun arrayContainsKey!0 (array!37821 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!625978 (= res!403876 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(assert (= (and start!56496 res!403879) b!625973))

(assert (= (and b!625973 res!403875) b!625971))

(assert (= (and b!625971 res!403871) b!625975))

(assert (= (and b!625975 res!403873) b!625978))

(assert (= (and b!625978 res!403876) b!625972))

(assert (= (and b!625972 res!403872) b!625976))

(assert (= (and b!625976 res!403878) b!625974))

(assert (= (and b!625974 res!403877) b!625970))

(assert (= (and b!625970 res!403874) b!625977))

(declare-fun m!601801 () Bool)

(assert (=> b!625977 m!601801))

(assert (=> b!625977 m!601801))

(declare-fun m!601803 () Bool)

(assert (=> b!625977 m!601803))

(declare-fun m!601805 () Bool)

(assert (=> b!625974 m!601805))

(declare-fun m!601807 () Bool)

(assert (=> b!625975 m!601807))

(declare-fun m!601809 () Bool)

(assert (=> b!625978 m!601809))

(declare-fun m!601811 () Bool)

(assert (=> b!625970 m!601811))

(declare-fun m!601813 () Bool)

(assert (=> b!625970 m!601813))

(declare-fun m!601815 () Bool)

(assert (=> b!625970 m!601815))

(declare-fun m!601817 () Bool)

(assert (=> start!56496 m!601817))

(declare-fun m!601819 () Bool)

(assert (=> start!56496 m!601819))

(declare-fun m!601821 () Bool)

(assert (=> b!625972 m!601821))

(assert (=> b!625971 m!601801))

(assert (=> b!625971 m!601801))

(declare-fun m!601823 () Bool)

(assert (=> b!625971 m!601823))

(declare-fun m!601825 () Bool)

(assert (=> b!625976 m!601825))

(check-sat (not b!625977) (not start!56496) (not b!625978) (not b!625976) (not b!625975) (not b!625971) (not b!625972) (not b!625974))
(check-sat)
