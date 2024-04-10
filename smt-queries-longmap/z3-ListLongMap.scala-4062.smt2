; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55602 () Bool)

(assert start!55602)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun e!349118 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37333 0))(
  ( (array!37334 (arr!17917 (Array (_ BitVec 32) (_ BitVec 64))) (size!18281 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37333)

(declare-fun lt!278670 () array!37333)

(declare-fun b!609564 () Bool)

(declare-fun arrayContainsKey!0 (array!37333 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!609564 (= e!349118 (arrayContainsKey!0 lt!278670 (select (arr!17917 a!2986) j!136) index!984))))

(declare-fun b!609565 () Bool)

(declare-fun e!349119 () Bool)

(declare-fun e!349122 () Bool)

(assert (=> b!609565 (= e!349119 e!349122)))

(declare-fun res!392075 () Bool)

(assert (=> b!609565 (=> (not res!392075) (not e!349122))))

(declare-datatypes ((SeekEntryResult!6357 0))(
  ( (MissingZero!6357 (index!27703 (_ BitVec 32))) (Found!6357 (index!27704 (_ BitVec 32))) (Intermediate!6357 (undefined!7169 Bool) (index!27705 (_ BitVec 32)) (x!56506 (_ BitVec 32))) (Undefined!6357) (MissingVacant!6357 (index!27706 (_ BitVec 32))) )
))
(declare-fun lt!278667 () SeekEntryResult!6357)

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!609565 (= res!392075 (and (= lt!278667 (Found!6357 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17917 a!2986) index!984) (select (arr!17917 a!2986) j!136))) (not (= (select (arr!17917 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37333 (_ BitVec 32)) SeekEntryResult!6357)

(assert (=> b!609565 (= lt!278667 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17917 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!609566 () Bool)

(declare-datatypes ((Unit!19522 0))(
  ( (Unit!19523) )
))
(declare-fun e!349123 () Unit!19522)

(declare-fun Unit!19524 () Unit!19522)

(assert (=> b!609566 (= e!349123 Unit!19524)))

(declare-fun lt!278664 () Unit!19522)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37333 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19522)

(assert (=> b!609566 (= lt!278664 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!278670 (select (arr!17917 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!609566 (arrayContainsKey!0 lt!278670 (select (arr!17917 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!278669 () Unit!19522)

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-datatypes ((List!11958 0))(
  ( (Nil!11955) (Cons!11954 (h!12999 (_ BitVec 64)) (t!18186 List!11958)) )
))
(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37333 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11958) Unit!19522)

(assert (=> b!609566 (= lt!278669 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11955))))

(declare-fun arrayNoDuplicates!0 (array!37333 (_ BitVec 32) List!11958) Bool)

(assert (=> b!609566 (arrayNoDuplicates!0 lt!278670 #b00000000000000000000000000000000 Nil!11955)))

(declare-fun lt!278661 () Unit!19522)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37333 (_ BitVec 32) (_ BitVec 32)) Unit!19522)

(assert (=> b!609566 (= lt!278661 (lemmaNoDuplicateFromThenFromBigger!0 lt!278670 #b00000000000000000000000000000000 j!136))))

(assert (=> b!609566 (arrayNoDuplicates!0 lt!278670 j!136 Nil!11955)))

(declare-fun lt!278675 () Unit!19522)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37333 (_ BitVec 64) (_ BitVec 32) List!11958) Unit!19522)

(assert (=> b!609566 (= lt!278675 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!278670 (select (arr!17917 a!2986) j!136) j!136 Nil!11955))))

(assert (=> b!609566 false))

(declare-fun b!609567 () Bool)

(declare-fun e!349114 () Bool)

(assert (=> b!609567 (= e!349114 true)))

(declare-fun lt!278671 () Bool)

(declare-fun contains!3034 (List!11958 (_ BitVec 64)) Bool)

(assert (=> b!609567 (= lt!278671 (contains!3034 Nil!11955 k0!1786))))

(declare-fun b!609568 () Bool)

(declare-fun e!349124 () Bool)

(assert (=> b!609568 (= e!349124 e!349119)))

(declare-fun res!392088 () Bool)

(assert (=> b!609568 (=> (not res!392088) (not e!349119))))

(assert (=> b!609568 (= res!392088 (= (select (store (arr!17917 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!609568 (= lt!278670 (array!37334 (store (arr!17917 a!2986) i!1108 k0!1786) (size!18281 a!2986)))))

(declare-fun b!609569 () Bool)

(declare-fun e!349113 () Bool)

(assert (=> b!609569 (= e!349113 e!349114)))

(declare-fun res!392083 () Bool)

(assert (=> b!609569 (=> res!392083 e!349114)))

(assert (=> b!609569 (= res!392083 (or (bvsge (size!18281 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18281 a!2986))))))

(assert (=> b!609569 (arrayContainsKey!0 lt!278670 (select (arr!17917 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!278677 () Unit!19522)

(assert (=> b!609569 (= lt!278677 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!278670 (select (arr!17917 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!349112 () Bool)

(assert (=> b!609569 e!349112))

(declare-fun res!392079 () Bool)

(assert (=> b!609569 (=> (not res!392079) (not e!349112))))

(assert (=> b!609569 (= res!392079 (arrayContainsKey!0 lt!278670 (select (arr!17917 a!2986) j!136) j!136))))

(declare-fun b!609570 () Bool)

(declare-fun e!349116 () Bool)

(declare-fun e!349121 () Bool)

(assert (=> b!609570 (= e!349116 e!349121)))

(declare-fun res!392084 () Bool)

(assert (=> b!609570 (=> res!392084 e!349121)))

(declare-fun lt!278665 () (_ BitVec 64))

(declare-fun lt!278674 () (_ BitVec 64))

(assert (=> b!609570 (= res!392084 (or (not (= (select (arr!17917 a!2986) j!136) lt!278665)) (not (= (select (arr!17917 a!2986) j!136) lt!278674))))))

(declare-fun e!349115 () Bool)

(assert (=> b!609570 e!349115))

(declare-fun res!392072 () Bool)

(assert (=> b!609570 (=> (not res!392072) (not e!349115))))

(assert (=> b!609570 (= res!392072 (= lt!278674 (select (arr!17917 a!2986) j!136)))))

(assert (=> b!609570 (= lt!278674 (select (store (arr!17917 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!609571 () Bool)

(declare-fun e!349110 () Bool)

(assert (=> b!609571 (= e!349110 e!349124)))

(declare-fun res!392074 () Bool)

(assert (=> b!609571 (=> (not res!392074) (not e!349124))))

(declare-fun lt!278668 () SeekEntryResult!6357)

(assert (=> b!609571 (= res!392074 (or (= lt!278668 (MissingZero!6357 i!1108)) (= lt!278668 (MissingVacant!6357 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37333 (_ BitVec 32)) SeekEntryResult!6357)

(assert (=> b!609571 (= lt!278668 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!609573 () Bool)

(declare-fun res!392073 () Bool)

(assert (=> b!609573 (=> (not res!392073) (not e!349110))))

(assert (=> b!609573 (= res!392073 (and (= (size!18281 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18281 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18281 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!609574 () Bool)

(declare-fun e!349117 () Unit!19522)

(declare-fun Unit!19525 () Unit!19522)

(assert (=> b!609574 (= e!349117 Unit!19525)))

(assert (=> b!609574 false))

(declare-fun b!609575 () Bool)

(assert (=> b!609575 (= e!349112 (arrayContainsKey!0 lt!278670 (select (arr!17917 a!2986) j!136) index!984))))

(declare-fun b!609576 () Bool)

(declare-fun res!392089 () Bool)

(assert (=> b!609576 (=> res!392089 e!349114)))

(assert (=> b!609576 (= res!392089 (contains!3034 Nil!11955 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!609577 () Bool)

(declare-fun Unit!19526 () Unit!19522)

(assert (=> b!609577 (= e!349123 Unit!19526)))

(declare-fun b!609578 () Bool)

(declare-fun e!349125 () Bool)

(declare-fun lt!278663 () SeekEntryResult!6357)

(assert (=> b!609578 (= e!349125 (= lt!278667 lt!278663))))

(declare-fun b!609579 () Bool)

(declare-fun e!349111 () Bool)

(assert (=> b!609579 (= e!349115 e!349111)))

(declare-fun res!392086 () Bool)

(assert (=> b!609579 (=> res!392086 e!349111)))

(assert (=> b!609579 (= res!392086 (or (not (= (select (arr!17917 a!2986) j!136) lt!278665)) (not (= (select (arr!17917 a!2986) j!136) lt!278674)) (bvsge j!136 index!984)))))

(declare-fun b!609580 () Bool)

(declare-fun res!392069 () Bool)

(assert (=> b!609580 (=> (not res!392069) (not e!349110))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!609580 (= res!392069 (validKeyInArray!0 k0!1786))))

(declare-fun b!609581 () Bool)

(declare-fun Unit!19527 () Unit!19522)

(assert (=> b!609581 (= e!349117 Unit!19527)))

(declare-fun b!609582 () Bool)

(declare-fun res!392071 () Bool)

(assert (=> b!609582 (=> (not res!392071) (not e!349124))))

(assert (=> b!609582 (= res!392071 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17917 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!609583 () Bool)

(assert (=> b!609583 (= e!349121 e!349113)))

(declare-fun res!392081 () Bool)

(assert (=> b!609583 (=> res!392081 e!349113)))

(assert (=> b!609583 (= res!392081 (bvsge index!984 j!136))))

(declare-fun lt!278662 () Unit!19522)

(assert (=> b!609583 (= lt!278662 e!349123)))

(declare-fun c!69115 () Bool)

(assert (=> b!609583 (= c!69115 (bvslt j!136 index!984))))

(declare-fun b!609584 () Bool)

(assert (=> b!609584 (= e!349111 e!349118)))

(declare-fun res!392085 () Bool)

(assert (=> b!609584 (=> (not res!392085) (not e!349118))))

(assert (=> b!609584 (= res!392085 (arrayContainsKey!0 lt!278670 (select (arr!17917 a!2986) j!136) j!136))))

(declare-fun b!609585 () Bool)

(declare-fun res!392070 () Bool)

(assert (=> b!609585 (=> (not res!392070) (not e!349110))))

(assert (=> b!609585 (= res!392070 (validKeyInArray!0 (select (arr!17917 a!2986) j!136)))))

(declare-fun b!609586 () Bool)

(declare-fun res!392087 () Bool)

(assert (=> b!609586 (=> res!392087 e!349114)))

(declare-fun noDuplicate!340 (List!11958) Bool)

(assert (=> b!609586 (= res!392087 (not (noDuplicate!340 Nil!11955)))))

(declare-fun b!609587 () Bool)

(declare-fun res!392076 () Bool)

(assert (=> b!609587 (=> (not res!392076) (not e!349124))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37333 (_ BitVec 32)) Bool)

(assert (=> b!609587 (= res!392076 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!609588 () Bool)

(assert (=> b!609588 (= e!349122 (not e!349116))))

(declare-fun res!392080 () Bool)

(assert (=> b!609588 (=> res!392080 e!349116)))

(declare-fun lt!278673 () SeekEntryResult!6357)

(assert (=> b!609588 (= res!392080 (not (= lt!278673 (Found!6357 index!984))))))

(declare-fun lt!278672 () Unit!19522)

(assert (=> b!609588 (= lt!278672 e!349117)))

(declare-fun c!69116 () Bool)

(assert (=> b!609588 (= c!69116 (= lt!278673 Undefined!6357))))

(assert (=> b!609588 (= lt!278673 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!278665 lt!278670 mask!3053))))

(assert (=> b!609588 e!349125))

(declare-fun res!392082 () Bool)

(assert (=> b!609588 (=> (not res!392082) (not e!349125))))

(declare-fun lt!278666 () (_ BitVec 32))

(assert (=> b!609588 (= res!392082 (= lt!278663 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!278666 vacantSpotIndex!68 lt!278665 lt!278670 mask!3053)))))

(assert (=> b!609588 (= lt!278663 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!278666 vacantSpotIndex!68 (select (arr!17917 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!609588 (= lt!278665 (select (store (arr!17917 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!278676 () Unit!19522)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37333 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19522)

(assert (=> b!609588 (= lt!278676 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!278666 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!609588 (= lt!278666 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!609589 () Bool)

(declare-fun res!392077 () Bool)

(assert (=> b!609589 (=> (not res!392077) (not e!349110))))

(assert (=> b!609589 (= res!392077 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!609590 () Bool)

(declare-fun res!392078 () Bool)

(assert (=> b!609590 (=> (not res!392078) (not e!349124))))

(assert (=> b!609590 (= res!392078 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11955))))

(declare-fun b!609572 () Bool)

(declare-fun res!392068 () Bool)

(assert (=> b!609572 (=> res!392068 e!349114)))

(assert (=> b!609572 (= res!392068 (contains!3034 Nil!11955 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!392090 () Bool)

(assert (=> start!55602 (=> (not res!392090) (not e!349110))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55602 (= res!392090 (validMask!0 mask!3053))))

(assert (=> start!55602 e!349110))

(assert (=> start!55602 true))

(declare-fun array_inv!13713 (array!37333) Bool)

(assert (=> start!55602 (array_inv!13713 a!2986)))

(assert (= (and start!55602 res!392090) b!609573))

(assert (= (and b!609573 res!392073) b!609585))

(assert (= (and b!609585 res!392070) b!609580))

(assert (= (and b!609580 res!392069) b!609589))

(assert (= (and b!609589 res!392077) b!609571))

(assert (= (and b!609571 res!392074) b!609587))

(assert (= (and b!609587 res!392076) b!609590))

(assert (= (and b!609590 res!392078) b!609582))

(assert (= (and b!609582 res!392071) b!609568))

(assert (= (and b!609568 res!392088) b!609565))

(assert (= (and b!609565 res!392075) b!609588))

(assert (= (and b!609588 res!392082) b!609578))

(assert (= (and b!609588 c!69116) b!609574))

(assert (= (and b!609588 (not c!69116)) b!609581))

(assert (= (and b!609588 (not res!392080)) b!609570))

(assert (= (and b!609570 res!392072) b!609579))

(assert (= (and b!609579 (not res!392086)) b!609584))

(assert (= (and b!609584 res!392085) b!609564))

(assert (= (and b!609570 (not res!392084)) b!609583))

(assert (= (and b!609583 c!69115) b!609566))

(assert (= (and b!609583 (not c!69115)) b!609577))

(assert (= (and b!609583 (not res!392081)) b!609569))

(assert (= (and b!609569 res!392079) b!609575))

(assert (= (and b!609569 (not res!392083)) b!609586))

(assert (= (and b!609586 (not res!392087)) b!609572))

(assert (= (and b!609572 (not res!392068)) b!609576))

(assert (= (and b!609576 (not res!392089)) b!609567))

(declare-fun m!586067 () Bool)

(assert (=> b!609565 m!586067))

(declare-fun m!586069 () Bool)

(assert (=> b!609565 m!586069))

(assert (=> b!609565 m!586069))

(declare-fun m!586071 () Bool)

(assert (=> b!609565 m!586071))

(declare-fun m!586073 () Bool)

(assert (=> b!609587 m!586073))

(declare-fun m!586075 () Bool)

(assert (=> b!609582 m!586075))

(assert (=> b!609575 m!586069))

(assert (=> b!609575 m!586069))

(declare-fun m!586077 () Bool)

(assert (=> b!609575 m!586077))

(assert (=> b!609570 m!586069))

(declare-fun m!586079 () Bool)

(assert (=> b!609570 m!586079))

(declare-fun m!586081 () Bool)

(assert (=> b!609570 m!586081))

(declare-fun m!586083 () Bool)

(assert (=> b!609590 m!586083))

(declare-fun m!586085 () Bool)

(assert (=> b!609571 m!586085))

(declare-fun m!586087 () Bool)

(assert (=> b!609586 m!586087))

(declare-fun m!586089 () Bool)

(assert (=> b!609580 m!586089))

(assert (=> b!609569 m!586069))

(assert (=> b!609569 m!586069))

(declare-fun m!586091 () Bool)

(assert (=> b!609569 m!586091))

(assert (=> b!609569 m!586069))

(declare-fun m!586093 () Bool)

(assert (=> b!609569 m!586093))

(assert (=> b!609569 m!586069))

(declare-fun m!586095 () Bool)

(assert (=> b!609569 m!586095))

(assert (=> b!609579 m!586069))

(declare-fun m!586097 () Bool)

(assert (=> b!609572 m!586097))

(assert (=> b!609584 m!586069))

(assert (=> b!609584 m!586069))

(assert (=> b!609584 m!586095))

(declare-fun m!586099 () Bool)

(assert (=> b!609566 m!586099))

(assert (=> b!609566 m!586069))

(assert (=> b!609566 m!586069))

(declare-fun m!586101 () Bool)

(assert (=> b!609566 m!586101))

(declare-fun m!586103 () Bool)

(assert (=> b!609566 m!586103))

(assert (=> b!609566 m!586069))

(declare-fun m!586105 () Bool)

(assert (=> b!609566 m!586105))

(declare-fun m!586107 () Bool)

(assert (=> b!609566 m!586107))

(declare-fun m!586109 () Bool)

(assert (=> b!609566 m!586109))

(assert (=> b!609566 m!586069))

(declare-fun m!586111 () Bool)

(assert (=> b!609566 m!586111))

(declare-fun m!586113 () Bool)

(assert (=> b!609588 m!586113))

(declare-fun m!586115 () Bool)

(assert (=> b!609588 m!586115))

(assert (=> b!609588 m!586069))

(declare-fun m!586117 () Bool)

(assert (=> b!609588 m!586117))

(assert (=> b!609588 m!586069))

(assert (=> b!609588 m!586079))

(declare-fun m!586119 () Bool)

(assert (=> b!609588 m!586119))

(declare-fun m!586121 () Bool)

(assert (=> b!609588 m!586121))

(declare-fun m!586123 () Bool)

(assert (=> b!609588 m!586123))

(assert (=> b!609585 m!586069))

(assert (=> b!609585 m!586069))

(declare-fun m!586125 () Bool)

(assert (=> b!609585 m!586125))

(declare-fun m!586127 () Bool)

(assert (=> b!609567 m!586127))

(declare-fun m!586129 () Bool)

(assert (=> start!55602 m!586129))

(declare-fun m!586131 () Bool)

(assert (=> start!55602 m!586131))

(assert (=> b!609564 m!586069))

(assert (=> b!609564 m!586069))

(assert (=> b!609564 m!586077))

(declare-fun m!586133 () Bool)

(assert (=> b!609576 m!586133))

(assert (=> b!609568 m!586079))

(declare-fun m!586135 () Bool)

(assert (=> b!609568 m!586135))

(declare-fun m!586137 () Bool)

(assert (=> b!609589 m!586137))

(check-sat (not b!609586) (not b!609575) (not b!609565) (not b!609572) (not start!55602) (not b!609576) (not b!609584) (not b!609585) (not b!609587) (not b!609589) (not b!609567) (not b!609571) (not b!609580) (not b!609566) (not b!609588) (not b!609590) (not b!609564) (not b!609569))
(check-sat)
