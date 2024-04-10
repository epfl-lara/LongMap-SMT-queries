; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54068 () Bool)

(assert start!54068)

(declare-fun b!590572 () Bool)

(declare-fun res!377785 () Bool)

(declare-fun e!337169 () Bool)

(assert (=> b!590572 (=> (not res!377785) (not e!337169))))

(declare-datatypes ((array!36855 0))(
  ( (array!36856 (arr!17699 (Array (_ BitVec 32) (_ BitVec 64))) (size!18063 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36855)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36855 (_ BitVec 32)) Bool)

(assert (=> b!590572 (= res!377785 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!590573 () Bool)

(declare-datatypes ((Unit!18474 0))(
  ( (Unit!18475) )
))
(declare-fun e!337168 () Unit!18474)

(declare-fun Unit!18476 () Unit!18474)

(assert (=> b!590573 (= e!337168 Unit!18476)))

(declare-fun res!377789 () Bool)

(declare-fun e!337172 () Bool)

(assert (=> start!54068 (=> (not res!377789) (not e!337172))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54068 (= res!377789 (validMask!0 mask!3053))))

(assert (=> start!54068 e!337172))

(assert (=> start!54068 true))

(declare-fun array_inv!13495 (array!36855) Bool)

(assert (=> start!54068 (array_inv!13495 a!2986)))

(declare-fun b!590574 () Bool)

(declare-fun res!377790 () Bool)

(assert (=> b!590574 (=> (not res!377790) (not e!337172))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!590574 (= res!377790 (and (= (size!18063 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18063 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18063 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!590575 () Bool)

(declare-fun res!377786 () Bool)

(assert (=> b!590575 (=> (not res!377786) (not e!337172))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!590575 (= res!377786 (validKeyInArray!0 (select (arr!17699 a!2986) j!136)))))

(declare-fun b!590576 () Bool)

(declare-fun res!377783 () Bool)

(assert (=> b!590576 (=> (not res!377783) (not e!337169))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!590576 (= res!377783 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17699 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!590577 () Bool)

(declare-fun e!337173 () Bool)

(declare-datatypes ((SeekEntryResult!6139 0))(
  ( (MissingZero!6139 (index!26789 (_ BitVec 32))) (Found!6139 (index!26790 (_ BitVec 32))) (Intermediate!6139 (undefined!6951 Bool) (index!26791 (_ BitVec 32)) (x!55578 (_ BitVec 32))) (Undefined!6139) (MissingVacant!6139 (index!26792 (_ BitVec 32))) )
))
(declare-fun lt!267943 () SeekEntryResult!6139)

(declare-fun lt!267935 () SeekEntryResult!6139)

(assert (=> b!590577 (= e!337173 (= lt!267943 lt!267935))))

(declare-fun b!590578 () Bool)

(declare-fun res!377784 () Bool)

(assert (=> b!590578 (=> (not res!377784) (not e!337169))))

(declare-datatypes ((List!11740 0))(
  ( (Nil!11737) (Cons!11736 (h!12781 (_ BitVec 64)) (t!17968 List!11740)) )
))
(declare-fun arrayNoDuplicates!0 (array!36855 (_ BitVec 32) List!11740) Bool)

(assert (=> b!590578 (= res!377784 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11737))))

(declare-fun b!590579 () Bool)

(declare-fun e!337165 () Bool)

(assert (=> b!590579 (= e!337169 e!337165)))

(declare-fun res!377788 () Bool)

(assert (=> b!590579 (=> (not res!377788) (not e!337165))))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!590579 (= res!377788 (= (select (store (arr!17699 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!267939 () array!36855)

(assert (=> b!590579 (= lt!267939 (array!36856 (store (arr!17699 a!2986) i!1108 k!1786) (size!18063 a!2986)))))

(declare-fun b!590580 () Bool)

(declare-fun res!377779 () Bool)

(assert (=> b!590580 (=> (not res!377779) (not e!337172))))

(assert (=> b!590580 (= res!377779 (validKeyInArray!0 k!1786))))

(declare-fun b!590581 () Bool)

(declare-fun e!337171 () Bool)

(assert (=> b!590581 (= e!337165 e!337171)))

(declare-fun res!377781 () Bool)

(assert (=> b!590581 (=> (not res!377781) (not e!337171))))

(assert (=> b!590581 (= res!377781 (and (= lt!267943 (Found!6139 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17699 a!2986) index!984) (select (arr!17699 a!2986) j!136))) (not (= (select (arr!17699 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36855 (_ BitVec 32)) SeekEntryResult!6139)

(assert (=> b!590581 (= lt!267943 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17699 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!590582 () Bool)

(declare-fun e!337167 () Bool)

(declare-fun e!337170 () Bool)

(assert (=> b!590582 (= e!337167 e!337170)))

(declare-fun res!377792 () Bool)

(assert (=> b!590582 (=> res!377792 e!337170)))

(declare-fun lt!267941 () (_ BitVec 64))

(assert (=> b!590582 (= res!377792 (or (not (= (select (arr!17699 a!2986) j!136) lt!267941)) (not (= (select (arr!17699 a!2986) j!136) (select (store (arr!17699 a!2986) i!1108 k!1786) index!984))) (bvsge j!136 index!984)))))

(declare-fun b!590583 () Bool)

(assert (=> b!590583 (= e!337172 e!337169)))

(declare-fun res!377782 () Bool)

(assert (=> b!590583 (=> (not res!377782) (not e!337169))))

(declare-fun lt!267942 () SeekEntryResult!6139)

(assert (=> b!590583 (= res!377782 (or (= lt!267942 (MissingZero!6139 i!1108)) (= lt!267942 (MissingVacant!6139 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36855 (_ BitVec 32)) SeekEntryResult!6139)

(assert (=> b!590583 (= lt!267942 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!590584 () Bool)

(declare-fun e!337166 () Bool)

(assert (=> b!590584 (= e!337166 (or (not (= (select (arr!17699 a!2986) j!136) lt!267941)) (not (= (select (arr!17699 a!2986) j!136) (select (store (arr!17699 a!2986) i!1108 k!1786) index!984))) (bvsge j!136 index!984) (bvslt index!984 (size!18063 a!2986))))))

(assert (=> b!590584 e!337167))

(declare-fun res!377780 () Bool)

(assert (=> b!590584 (=> (not res!377780) (not e!337167))))

(assert (=> b!590584 (= res!377780 (= (select (store (arr!17699 a!2986) i!1108 k!1786) index!984) (select (arr!17699 a!2986) j!136)))))

(declare-fun b!590585 () Bool)

(declare-fun arrayContainsKey!0 (array!36855 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!590585 (= e!337170 (arrayContainsKey!0 lt!267939 (select (arr!17699 a!2986) j!136) j!136))))

(declare-fun b!590586 () Bool)

(declare-fun res!377791 () Bool)

(assert (=> b!590586 (=> (not res!377791) (not e!337172))))

(assert (=> b!590586 (= res!377791 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!590587 () Bool)

(assert (=> b!590587 (= e!337171 (not e!337166))))

(declare-fun res!377787 () Bool)

(assert (=> b!590587 (=> res!377787 e!337166)))

(declare-fun lt!267937 () SeekEntryResult!6139)

(assert (=> b!590587 (= res!377787 (not (= lt!267937 (Found!6139 index!984))))))

(declare-fun lt!267938 () Unit!18474)

(assert (=> b!590587 (= lt!267938 e!337168)))

(declare-fun c!66764 () Bool)

(assert (=> b!590587 (= c!66764 (= lt!267937 Undefined!6139))))

(assert (=> b!590587 (= lt!267937 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!267941 lt!267939 mask!3053))))

(assert (=> b!590587 e!337173))

(declare-fun res!377778 () Bool)

(assert (=> b!590587 (=> (not res!377778) (not e!337173))))

(declare-fun lt!267940 () (_ BitVec 32))

(assert (=> b!590587 (= res!377778 (= lt!267935 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!267940 vacantSpotIndex!68 lt!267941 lt!267939 mask!3053)))))

(assert (=> b!590587 (= lt!267935 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!267940 vacantSpotIndex!68 (select (arr!17699 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!590587 (= lt!267941 (select (store (arr!17699 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!267936 () Unit!18474)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36855 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18474)

(assert (=> b!590587 (= lt!267936 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!267940 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!590587 (= lt!267940 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!590588 () Bool)

(declare-fun Unit!18477 () Unit!18474)

(assert (=> b!590588 (= e!337168 Unit!18477)))

(assert (=> b!590588 false))

(assert (= (and start!54068 res!377789) b!590574))

(assert (= (and b!590574 res!377790) b!590575))

(assert (= (and b!590575 res!377786) b!590580))

(assert (= (and b!590580 res!377779) b!590586))

(assert (= (and b!590586 res!377791) b!590583))

(assert (= (and b!590583 res!377782) b!590572))

(assert (= (and b!590572 res!377785) b!590578))

(assert (= (and b!590578 res!377784) b!590576))

(assert (= (and b!590576 res!377783) b!590579))

(assert (= (and b!590579 res!377788) b!590581))

(assert (= (and b!590581 res!377781) b!590587))

(assert (= (and b!590587 res!377778) b!590577))

(assert (= (and b!590587 c!66764) b!590588))

(assert (= (and b!590587 (not c!66764)) b!590573))

(assert (= (and b!590587 (not res!377787)) b!590584))

(assert (= (and b!590584 res!377780) b!590582))

(assert (= (and b!590582 (not res!377792)) b!590585))

(declare-fun m!568961 () Bool)

(assert (=> b!590582 m!568961))

(declare-fun m!568963 () Bool)

(assert (=> b!590582 m!568963))

(declare-fun m!568965 () Bool)

(assert (=> b!590582 m!568965))

(assert (=> b!590585 m!568961))

(assert (=> b!590585 m!568961))

(declare-fun m!568967 () Bool)

(assert (=> b!590585 m!568967))

(declare-fun m!568969 () Bool)

(assert (=> b!590572 m!568969))

(declare-fun m!568971 () Bool)

(assert (=> b!590576 m!568971))

(declare-fun m!568973 () Bool)

(assert (=> b!590583 m!568973))

(declare-fun m!568975 () Bool)

(assert (=> b!590581 m!568975))

(assert (=> b!590581 m!568961))

(assert (=> b!590581 m!568961))

(declare-fun m!568977 () Bool)

(assert (=> b!590581 m!568977))

(assert (=> b!590579 m!568963))

(declare-fun m!568979 () Bool)

(assert (=> b!590579 m!568979))

(declare-fun m!568981 () Bool)

(assert (=> b!590578 m!568981))

(declare-fun m!568983 () Bool)

(assert (=> start!54068 m!568983))

(declare-fun m!568985 () Bool)

(assert (=> start!54068 m!568985))

(assert (=> b!590584 m!568961))

(assert (=> b!590584 m!568963))

(assert (=> b!590584 m!568965))

(declare-fun m!568987 () Bool)

(assert (=> b!590587 m!568987))

(declare-fun m!568989 () Bool)

(assert (=> b!590587 m!568989))

(assert (=> b!590587 m!568961))

(assert (=> b!590587 m!568961))

(declare-fun m!568991 () Bool)

(assert (=> b!590587 m!568991))

(assert (=> b!590587 m!568963))

(declare-fun m!568993 () Bool)

(assert (=> b!590587 m!568993))

(declare-fun m!568995 () Bool)

(assert (=> b!590587 m!568995))

(declare-fun m!568997 () Bool)

(assert (=> b!590587 m!568997))

(assert (=> b!590575 m!568961))

(assert (=> b!590575 m!568961))

(declare-fun m!568999 () Bool)

(assert (=> b!590575 m!568999))

(declare-fun m!569001 () Bool)

(assert (=> b!590586 m!569001))

(declare-fun m!569003 () Bool)

(assert (=> b!590580 m!569003))

(push 1)

(assert (not b!590587))

(assert (not b!590572))

(assert (not b!590575))

(assert (not b!590585))

(assert (not b!590586))

(assert (not b!590581))

(assert (not b!590580))

(assert (not b!590583))

(assert (not b!590578))

(assert (not start!54068))

(check-sat)

(pop 1)

(push 1)

(check-sat)

