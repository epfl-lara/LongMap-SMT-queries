; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54558 () Bool)

(assert start!54558)

(declare-fun b!596620 () Bool)

(declare-fun res!382405 () Bool)

(declare-fun e!340873 () Bool)

(assert (=> b!596620 (=> res!382405 e!340873)))

(declare-datatypes ((List!11814 0))(
  ( (Nil!11811) (Cons!11810 (h!12855 (_ BitVec 64)) (t!18042 List!11814)) )
))
(declare-fun contains!2949 (List!11814 (_ BitVec 64)) Bool)

(assert (=> b!596620 (= res!382405 (contains!2949 Nil!11811 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!596621 () Bool)

(declare-fun e!340880 () Bool)

(declare-fun e!340878 () Bool)

(assert (=> b!596621 (= e!340880 e!340878)))

(declare-fun res!382402 () Bool)

(assert (=> b!596621 (=> (not res!382402) (not e!340878))))

(declare-datatypes ((array!37018 0))(
  ( (array!37019 (arr!17773 (Array (_ BitVec 32) (_ BitVec 64))) (size!18137 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37018)

(declare-fun lt!270993 () array!37018)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!37018 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!596621 (= res!382402 (arrayContainsKey!0 lt!270993 (select (arr!17773 a!2986) j!136) j!136))))

(declare-fun b!596622 () Bool)

(declare-fun e!340874 () Bool)

(declare-fun e!340875 () Bool)

(assert (=> b!596622 (= e!340874 (not e!340875))))

(declare-fun res!382400 () Bool)

(assert (=> b!596622 (=> res!382400 e!340875)))

(declare-datatypes ((SeekEntryResult!6213 0))(
  ( (MissingZero!6213 (index!27100 (_ BitVec 32))) (Found!6213 (index!27101 (_ BitVec 32))) (Intermediate!6213 (undefined!7025 Bool) (index!27102 (_ BitVec 32)) (x!55897 (_ BitVec 32))) (Undefined!6213) (MissingVacant!6213 (index!27103 (_ BitVec 32))) )
))
(declare-fun lt!270992 () SeekEntryResult!6213)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!596622 (= res!382400 (not (= lt!270992 (Found!6213 index!984))))))

(declare-datatypes ((Unit!18770 0))(
  ( (Unit!18771) )
))
(declare-fun lt!270988 () Unit!18770)

(declare-fun e!340872 () Unit!18770)

(assert (=> b!596622 (= lt!270988 e!340872)))

(declare-fun c!67481 () Bool)

(assert (=> b!596622 (= c!67481 (= lt!270992 Undefined!6213))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun lt!270997 () (_ BitVec 64))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37018 (_ BitVec 32)) SeekEntryResult!6213)

(assert (=> b!596622 (= lt!270992 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!270997 lt!270993 mask!3053))))

(declare-fun e!340869 () Bool)

(assert (=> b!596622 e!340869))

(declare-fun res!382412 () Bool)

(assert (=> b!596622 (=> (not res!382412) (not e!340869))))

(declare-fun lt!270996 () (_ BitVec 32))

(declare-fun lt!270994 () SeekEntryResult!6213)

(assert (=> b!596622 (= res!382412 (= lt!270994 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!270996 vacantSpotIndex!68 lt!270997 lt!270993 mask!3053)))))

(assert (=> b!596622 (= lt!270994 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!270996 vacantSpotIndex!68 (select (arr!17773 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!596622 (= lt!270997 (select (store (arr!17773 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!270990 () Unit!18770)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37018 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18770)

(assert (=> b!596622 (= lt!270990 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!270996 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!596622 (= lt!270996 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!596623 () Bool)

(declare-fun res!382408 () Bool)

(declare-fun e!340871 () Bool)

(assert (=> b!596623 (=> (not res!382408) (not e!340871))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37018 (_ BitVec 32)) Bool)

(assert (=> b!596623 (= res!382408 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!596624 () Bool)

(declare-fun res!382396 () Bool)

(assert (=> b!596624 (=> res!382396 e!340873)))

(declare-fun noDuplicate!268 (List!11814) Bool)

(assert (=> b!596624 (= res!382396 (not (noDuplicate!268 Nil!11811)))))

(declare-fun b!596625 () Bool)

(declare-fun e!340870 () Bool)

(assert (=> b!596625 (= e!340870 e!340871)))

(declare-fun res!382394 () Bool)

(assert (=> b!596625 (=> (not res!382394) (not e!340871))))

(declare-fun lt!270991 () SeekEntryResult!6213)

(assert (=> b!596625 (= res!382394 (or (= lt!270991 (MissingZero!6213 i!1108)) (= lt!270991 (MissingVacant!6213 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37018 (_ BitVec 32)) SeekEntryResult!6213)

(assert (=> b!596625 (= lt!270991 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!596626 () Bool)

(declare-fun res!382404 () Bool)

(assert (=> b!596626 (=> (not res!382404) (not e!340870))))

(assert (=> b!596626 (= res!382404 (and (= (size!18137 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18137 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18137 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!596627 () Bool)

(declare-fun res!382397 () Bool)

(assert (=> b!596627 (=> res!382397 e!340873)))

(assert (=> b!596627 (= res!382397 (contains!2949 Nil!11811 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!596628 () Bool)

(declare-fun res!382393 () Bool)

(assert (=> b!596628 (=> (not res!382393) (not e!340871))))

(declare-fun arrayNoDuplicates!0 (array!37018 (_ BitVec 32) List!11814) Bool)

(assert (=> b!596628 (= res!382393 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11811))))

(declare-fun res!382407 () Bool)

(assert (=> start!54558 (=> (not res!382407) (not e!340870))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54558 (= res!382407 (validMask!0 mask!3053))))

(assert (=> start!54558 e!340870))

(assert (=> start!54558 true))

(declare-fun array_inv!13569 (array!37018) Bool)

(assert (=> start!54558 (array_inv!13569 a!2986)))

(declare-fun b!596629 () Bool)

(declare-fun e!340881 () Bool)

(assert (=> b!596629 (= e!340881 e!340880)))

(declare-fun res!382403 () Bool)

(assert (=> b!596629 (=> res!382403 e!340880)))

(declare-fun lt!270987 () (_ BitVec 64))

(assert (=> b!596629 (= res!382403 (or (not (= (select (arr!17773 a!2986) j!136) lt!270997)) (not (= (select (arr!17773 a!2986) j!136) lt!270987)) (bvsge j!136 index!984)))))

(declare-fun b!596630 () Bool)

(declare-fun Unit!18772 () Unit!18770)

(assert (=> b!596630 (= e!340872 Unit!18772)))

(assert (=> b!596630 false))

(declare-fun b!596631 () Bool)

(declare-fun lt!270986 () SeekEntryResult!6213)

(assert (=> b!596631 (= e!340869 (= lt!270986 lt!270994))))

(declare-fun b!596632 () Bool)

(declare-fun e!340877 () Bool)

(assert (=> b!596632 (= e!340877 e!340873)))

(declare-fun res!382399 () Bool)

(assert (=> b!596632 (=> res!382399 e!340873)))

(assert (=> b!596632 (= res!382399 (or (bvsge (size!18137 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18137 a!2986))))))

(assert (=> b!596632 (arrayContainsKey!0 lt!270993 (select (arr!17773 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!270989 () Unit!18770)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37018 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18770)

(assert (=> b!596632 (= lt!270989 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!270993 (select (arr!17773 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!596633 () Bool)

(assert (=> b!596633 (= e!340875 e!340877)))

(declare-fun res!382410 () Bool)

(assert (=> b!596633 (=> res!382410 e!340877)))

(assert (=> b!596633 (= res!382410 (or (not (= (select (arr!17773 a!2986) j!136) lt!270997)) (not (= (select (arr!17773 a!2986) j!136) lt!270987)) (bvsge j!136 index!984)))))

(assert (=> b!596633 e!340881))

(declare-fun res!382411 () Bool)

(assert (=> b!596633 (=> (not res!382411) (not e!340881))))

(assert (=> b!596633 (= res!382411 (= lt!270987 (select (arr!17773 a!2986) j!136)))))

(assert (=> b!596633 (= lt!270987 (select (store (arr!17773 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!596634 () Bool)

(declare-fun res!382409 () Bool)

(assert (=> b!596634 (=> (not res!382409) (not e!340870))))

(assert (=> b!596634 (= res!382409 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!596635 () Bool)

(assert (=> b!596635 (= e!340873 true)))

(declare-fun lt!270995 () Bool)

(assert (=> b!596635 (= lt!270995 (contains!2949 Nil!11811 k0!1786))))

(declare-fun b!596636 () Bool)

(assert (=> b!596636 (= e!340878 (arrayContainsKey!0 lt!270993 (select (arr!17773 a!2986) j!136) index!984))))

(declare-fun b!596637 () Bool)

(declare-fun e!340876 () Bool)

(assert (=> b!596637 (= e!340876 e!340874)))

(declare-fun res!382401 () Bool)

(assert (=> b!596637 (=> (not res!382401) (not e!340874))))

(assert (=> b!596637 (= res!382401 (and (= lt!270986 (Found!6213 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17773 a!2986) index!984) (select (arr!17773 a!2986) j!136))) (not (= (select (arr!17773 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!596637 (= lt!270986 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17773 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!596638 () Bool)

(declare-fun res!382398 () Bool)

(assert (=> b!596638 (=> (not res!382398) (not e!340870))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!596638 (= res!382398 (validKeyInArray!0 k0!1786))))

(declare-fun b!596639 () Bool)

(declare-fun res!382395 () Bool)

(assert (=> b!596639 (=> (not res!382395) (not e!340870))))

(assert (=> b!596639 (= res!382395 (validKeyInArray!0 (select (arr!17773 a!2986) j!136)))))

(declare-fun b!596640 () Bool)

(declare-fun res!382406 () Bool)

(assert (=> b!596640 (=> (not res!382406) (not e!340871))))

(assert (=> b!596640 (= res!382406 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17773 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!596641 () Bool)

(assert (=> b!596641 (= e!340871 e!340876)))

(declare-fun res!382392 () Bool)

(assert (=> b!596641 (=> (not res!382392) (not e!340876))))

(assert (=> b!596641 (= res!382392 (= (select (store (arr!17773 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!596641 (= lt!270993 (array!37019 (store (arr!17773 a!2986) i!1108 k0!1786) (size!18137 a!2986)))))

(declare-fun b!596642 () Bool)

(declare-fun Unit!18773 () Unit!18770)

(assert (=> b!596642 (= e!340872 Unit!18773)))

(assert (= (and start!54558 res!382407) b!596626))

(assert (= (and b!596626 res!382404) b!596639))

(assert (= (and b!596639 res!382395) b!596638))

(assert (= (and b!596638 res!382398) b!596634))

(assert (= (and b!596634 res!382409) b!596625))

(assert (= (and b!596625 res!382394) b!596623))

(assert (= (and b!596623 res!382408) b!596628))

(assert (= (and b!596628 res!382393) b!596640))

(assert (= (and b!596640 res!382406) b!596641))

(assert (= (and b!596641 res!382392) b!596637))

(assert (= (and b!596637 res!382401) b!596622))

(assert (= (and b!596622 res!382412) b!596631))

(assert (= (and b!596622 c!67481) b!596630))

(assert (= (and b!596622 (not c!67481)) b!596642))

(assert (= (and b!596622 (not res!382400)) b!596633))

(assert (= (and b!596633 res!382411) b!596629))

(assert (= (and b!596629 (not res!382403)) b!596621))

(assert (= (and b!596621 res!382402) b!596636))

(assert (= (and b!596633 (not res!382410)) b!596632))

(assert (= (and b!596632 (not res!382399)) b!596624))

(assert (= (and b!596624 (not res!382396)) b!596627))

(assert (= (and b!596627 (not res!382397)) b!596620))

(assert (= (and b!596620 (not res!382405)) b!596635))

(declare-fun m!574083 () Bool)

(assert (=> b!596634 m!574083))

(declare-fun m!574085 () Bool)

(assert (=> b!596621 m!574085))

(assert (=> b!596621 m!574085))

(declare-fun m!574087 () Bool)

(assert (=> b!596621 m!574087))

(declare-fun m!574089 () Bool)

(assert (=> b!596624 m!574089))

(declare-fun m!574091 () Bool)

(assert (=> b!596641 m!574091))

(declare-fun m!574093 () Bool)

(assert (=> b!596641 m!574093))

(assert (=> b!596629 m!574085))

(declare-fun m!574095 () Bool)

(assert (=> b!596623 m!574095))

(declare-fun m!574097 () Bool)

(assert (=> b!596628 m!574097))

(declare-fun m!574099 () Bool)

(assert (=> b!596640 m!574099))

(assert (=> b!596639 m!574085))

(assert (=> b!596639 m!574085))

(declare-fun m!574101 () Bool)

(assert (=> b!596639 m!574101))

(declare-fun m!574103 () Bool)

(assert (=> b!596638 m!574103))

(declare-fun m!574105 () Bool)

(assert (=> b!596637 m!574105))

(assert (=> b!596637 m!574085))

(assert (=> b!596637 m!574085))

(declare-fun m!574107 () Bool)

(assert (=> b!596637 m!574107))

(assert (=> b!596632 m!574085))

(assert (=> b!596632 m!574085))

(declare-fun m!574109 () Bool)

(assert (=> b!596632 m!574109))

(assert (=> b!596632 m!574085))

(declare-fun m!574111 () Bool)

(assert (=> b!596632 m!574111))

(declare-fun m!574113 () Bool)

(assert (=> b!596625 m!574113))

(declare-fun m!574115 () Bool)

(assert (=> b!596620 m!574115))

(declare-fun m!574117 () Bool)

(assert (=> b!596635 m!574117))

(declare-fun m!574119 () Bool)

(assert (=> start!54558 m!574119))

(declare-fun m!574121 () Bool)

(assert (=> start!54558 m!574121))

(declare-fun m!574123 () Bool)

(assert (=> b!596627 m!574123))

(assert (=> b!596633 m!574085))

(assert (=> b!596633 m!574091))

(declare-fun m!574125 () Bool)

(assert (=> b!596633 m!574125))

(assert (=> b!596636 m!574085))

(assert (=> b!596636 m!574085))

(declare-fun m!574127 () Bool)

(assert (=> b!596636 m!574127))

(declare-fun m!574129 () Bool)

(assert (=> b!596622 m!574129))

(declare-fun m!574131 () Bool)

(assert (=> b!596622 m!574131))

(assert (=> b!596622 m!574085))

(assert (=> b!596622 m!574085))

(declare-fun m!574133 () Bool)

(assert (=> b!596622 m!574133))

(assert (=> b!596622 m!574091))

(declare-fun m!574135 () Bool)

(assert (=> b!596622 m!574135))

(declare-fun m!574137 () Bool)

(assert (=> b!596622 m!574137))

(declare-fun m!574139 () Bool)

(assert (=> b!596622 m!574139))

(check-sat (not b!596625) (not b!596634) (not b!596632) (not b!596637) (not b!596628) (not b!596636) (not b!596623) (not b!596620) (not b!596635) (not b!596639) (not b!596621) (not b!596624) (not b!596627) (not start!54558) (not b!596638) (not b!596622))
(check-sat)
