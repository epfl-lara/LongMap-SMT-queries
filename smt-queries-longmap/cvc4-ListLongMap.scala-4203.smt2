; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57438 () Bool)

(assert start!57438)

(declare-fun res!411350 () Bool)

(declare-fun e!363651 () Bool)

(assert (=> start!57438 (=> (not res!411350) (not e!363651))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57438 (= res!411350 (validMask!0 mask!3053))))

(assert (=> start!57438 e!363651))

(assert (=> start!57438 true))

(declare-datatypes ((array!38228 0))(
  ( (array!38229 (arr!18341 (Array (_ BitVec 32) (_ BitVec 64))) (size!18705 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38228)

(declare-fun array_inv!14137 (array!38228) Bool)

(assert (=> start!57438 (array_inv!14137 a!2986)))

(declare-fun b!635774 () Bool)

(declare-fun e!363660 () Bool)

(declare-fun e!363653 () Bool)

(assert (=> b!635774 (= e!363660 e!363653)))

(declare-fun res!411340 () Bool)

(assert (=> b!635774 (=> (not res!411340) (not e!363653))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!635774 (= res!411340 (= (select (store (arr!18341 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!293994 () array!38228)

(assert (=> b!635774 (= lt!293994 (array!38229 (store (arr!18341 a!2986) i!1108 k!1786) (size!18705 a!2986)))))

(declare-fun b!635775 () Bool)

(declare-fun res!411353 () Bool)

(assert (=> b!635775 (=> (not res!411353) (not e!363651))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!635775 (= res!411353 (validKeyInArray!0 k!1786))))

(declare-fun e!363656 () Bool)

(declare-fun b!635776 () Bool)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!38228 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!635776 (= e!363656 (arrayContainsKey!0 lt!293994 (select (arr!18341 a!2986) j!136) index!984))))

(declare-fun b!635777 () Bool)

(declare-fun e!363655 () Bool)

(declare-fun e!363652 () Bool)

(assert (=> b!635777 (= e!363655 (not e!363652))))

(declare-fun res!411347 () Bool)

(assert (=> b!635777 (=> res!411347 e!363652)))

(declare-datatypes ((SeekEntryResult!6781 0))(
  ( (MissingZero!6781 (index!29429 (_ BitVec 32))) (Found!6781 (index!29430 (_ BitVec 32))) (Intermediate!6781 (undefined!7593 Bool) (index!29431 (_ BitVec 32)) (x!58172 (_ BitVec 32))) (Undefined!6781) (MissingVacant!6781 (index!29432 (_ BitVec 32))) )
))
(declare-fun lt!293993 () SeekEntryResult!6781)

(assert (=> b!635777 (= res!411347 (not (= lt!293993 (Found!6781 index!984))))))

(declare-datatypes ((Unit!21458 0))(
  ( (Unit!21459) )
))
(declare-fun lt!293997 () Unit!21458)

(declare-fun e!363654 () Unit!21458)

(assert (=> b!635777 (= lt!293997 e!363654)))

(declare-fun c!72584 () Bool)

(assert (=> b!635777 (= c!72584 (= lt!293993 Undefined!6781))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!293999 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38228 (_ BitVec 32)) SeekEntryResult!6781)

(assert (=> b!635777 (= lt!293993 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!293999 lt!293994 mask!3053))))

(declare-fun e!363650 () Bool)

(assert (=> b!635777 e!363650))

(declare-fun res!411354 () Bool)

(assert (=> b!635777 (=> (not res!411354) (not e!363650))))

(declare-fun lt!294001 () (_ BitVec 32))

(declare-fun lt!293992 () SeekEntryResult!6781)

(assert (=> b!635777 (= res!411354 (= lt!293992 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!294001 vacantSpotIndex!68 lt!293999 lt!293994 mask!3053)))))

(assert (=> b!635777 (= lt!293992 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!294001 vacantSpotIndex!68 (select (arr!18341 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!635777 (= lt!293999 (select (store (arr!18341 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!293998 () Unit!21458)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38228 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21458)

(assert (=> b!635777 (= lt!293998 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!294001 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!635777 (= lt!294001 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!635778 () Bool)

(declare-fun e!363659 () Bool)

(assert (=> b!635778 (= e!363652 e!363659)))

(declare-fun res!411351 () Bool)

(assert (=> b!635778 (=> res!411351 e!363659)))

(declare-fun lt!293995 () (_ BitVec 64))

(assert (=> b!635778 (= res!411351 (or (not (= (select (arr!18341 a!2986) j!136) lt!293999)) (not (= (select (arr!18341 a!2986) j!136) lt!293995)) (bvsge j!136 index!984)))))

(declare-fun e!363657 () Bool)

(assert (=> b!635778 e!363657))

(declare-fun res!411343 () Bool)

(assert (=> b!635778 (=> (not res!411343) (not e!363657))))

(assert (=> b!635778 (= res!411343 (= lt!293995 (select (arr!18341 a!2986) j!136)))))

(assert (=> b!635778 (= lt!293995 (select (store (arr!18341 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!635779 () Bool)

(declare-fun res!411341 () Bool)

(assert (=> b!635779 (=> (not res!411341) (not e!363660))))

(declare-datatypes ((List!12382 0))(
  ( (Nil!12379) (Cons!12378 (h!13423 (_ BitVec 64)) (t!18610 List!12382)) )
))
(declare-fun arrayNoDuplicates!0 (array!38228 (_ BitVec 32) List!12382) Bool)

(assert (=> b!635779 (= res!411341 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12379))))

(declare-fun b!635780 () Bool)

(assert (=> b!635780 (= e!363653 e!363655)))

(declare-fun res!411344 () Bool)

(assert (=> b!635780 (=> (not res!411344) (not e!363655))))

(declare-fun lt!293991 () SeekEntryResult!6781)

(assert (=> b!635780 (= res!411344 (and (= lt!293991 (Found!6781 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18341 a!2986) index!984) (select (arr!18341 a!2986) j!136))) (not (= (select (arr!18341 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!635780 (= lt!293991 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18341 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!635781 () Bool)

(assert (=> b!635781 (= e!363651 e!363660)))

(declare-fun res!411342 () Bool)

(assert (=> b!635781 (=> (not res!411342) (not e!363660))))

(declare-fun lt!294000 () SeekEntryResult!6781)

(assert (=> b!635781 (= res!411342 (or (= lt!294000 (MissingZero!6781 i!1108)) (= lt!294000 (MissingVacant!6781 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38228 (_ BitVec 32)) SeekEntryResult!6781)

(assert (=> b!635781 (= lt!294000 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!635782 () Bool)

(declare-fun res!411356 () Bool)

(assert (=> b!635782 (=> (not res!411356) (not e!363651))))

(assert (=> b!635782 (= res!411356 (validKeyInArray!0 (select (arr!18341 a!2986) j!136)))))

(declare-fun b!635783 () Bool)

(assert (=> b!635783 (= e!363650 (= lt!293991 lt!293992))))

(declare-fun b!635784 () Bool)

(declare-fun e!363658 () Bool)

(assert (=> b!635784 (= e!363658 e!363656)))

(declare-fun res!411345 () Bool)

(assert (=> b!635784 (=> (not res!411345) (not e!363656))))

(assert (=> b!635784 (= res!411345 (arrayContainsKey!0 lt!293994 (select (arr!18341 a!2986) j!136) j!136))))

(declare-fun b!635785 () Bool)

(assert (=> b!635785 (= e!363657 e!363658)))

(declare-fun res!411349 () Bool)

(assert (=> b!635785 (=> res!411349 e!363658)))

(assert (=> b!635785 (= res!411349 (or (not (= (select (arr!18341 a!2986) j!136) lt!293999)) (not (= (select (arr!18341 a!2986) j!136) lt!293995)) (bvsge j!136 index!984)))))

(declare-fun b!635786 () Bool)

(declare-fun Unit!21460 () Unit!21458)

(assert (=> b!635786 (= e!363654 Unit!21460)))

(declare-fun b!635787 () Bool)

(declare-fun Unit!21461 () Unit!21458)

(assert (=> b!635787 (= e!363654 Unit!21461)))

(assert (=> b!635787 false))

(declare-fun b!635788 () Bool)

(declare-fun res!411348 () Bool)

(assert (=> b!635788 (=> (not res!411348) (not e!363651))))

(assert (=> b!635788 (= res!411348 (and (= (size!18705 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18705 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18705 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!635789 () Bool)

(declare-fun res!411352 () Bool)

(assert (=> b!635789 (=> (not res!411352) (not e!363660))))

(assert (=> b!635789 (= res!411352 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18341 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!635790 () Bool)

(declare-fun res!411346 () Bool)

(assert (=> b!635790 (=> (not res!411346) (not e!363651))))

(assert (=> b!635790 (= res!411346 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!635791 () Bool)

(assert (=> b!635791 (= e!363659 (or (bvsge (size!18705 a!2986) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!18705 a!2986))))))

(assert (=> b!635791 (arrayContainsKey!0 lt!293994 (select (arr!18341 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!293996 () Unit!21458)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38228 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21458)

(assert (=> b!635791 (= lt!293996 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!293994 (select (arr!18341 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!635792 () Bool)

(declare-fun res!411355 () Bool)

(assert (=> b!635792 (=> (not res!411355) (not e!363660))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38228 (_ BitVec 32)) Bool)

(assert (=> b!635792 (= res!411355 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(assert (= (and start!57438 res!411350) b!635788))

(assert (= (and b!635788 res!411348) b!635782))

(assert (= (and b!635782 res!411356) b!635775))

(assert (= (and b!635775 res!411353) b!635790))

(assert (= (and b!635790 res!411346) b!635781))

(assert (= (and b!635781 res!411342) b!635792))

(assert (= (and b!635792 res!411355) b!635779))

(assert (= (and b!635779 res!411341) b!635789))

(assert (= (and b!635789 res!411352) b!635774))

(assert (= (and b!635774 res!411340) b!635780))

(assert (= (and b!635780 res!411344) b!635777))

(assert (= (and b!635777 res!411354) b!635783))

(assert (= (and b!635777 c!72584) b!635787))

(assert (= (and b!635777 (not c!72584)) b!635786))

(assert (= (and b!635777 (not res!411347)) b!635778))

(assert (= (and b!635778 res!411343) b!635785))

(assert (= (and b!635785 (not res!411349)) b!635784))

(assert (= (and b!635784 res!411345) b!635776))

(assert (= (and b!635778 (not res!411351)) b!635791))

(declare-fun m!610089 () Bool)

(assert (=> b!635785 m!610089))

(declare-fun m!610091 () Bool)

(assert (=> b!635779 m!610091))

(declare-fun m!610093 () Bool)

(assert (=> b!635790 m!610093))

(declare-fun m!610095 () Bool)

(assert (=> b!635775 m!610095))

(assert (=> b!635778 m!610089))

(declare-fun m!610097 () Bool)

(assert (=> b!635778 m!610097))

(declare-fun m!610099 () Bool)

(assert (=> b!635778 m!610099))

(declare-fun m!610101 () Bool)

(assert (=> b!635781 m!610101))

(declare-fun m!610103 () Bool)

(assert (=> start!57438 m!610103))

(declare-fun m!610105 () Bool)

(assert (=> start!57438 m!610105))

(assert (=> b!635782 m!610089))

(assert (=> b!635782 m!610089))

(declare-fun m!610107 () Bool)

(assert (=> b!635782 m!610107))

(assert (=> b!635776 m!610089))

(assert (=> b!635776 m!610089))

(declare-fun m!610109 () Bool)

(assert (=> b!635776 m!610109))

(assert (=> b!635791 m!610089))

(assert (=> b!635791 m!610089))

(declare-fun m!610111 () Bool)

(assert (=> b!635791 m!610111))

(assert (=> b!635791 m!610089))

(declare-fun m!610113 () Bool)

(assert (=> b!635791 m!610113))

(declare-fun m!610115 () Bool)

(assert (=> b!635792 m!610115))

(assert (=> b!635784 m!610089))

(assert (=> b!635784 m!610089))

(declare-fun m!610117 () Bool)

(assert (=> b!635784 m!610117))

(declare-fun m!610119 () Bool)

(assert (=> b!635789 m!610119))

(assert (=> b!635774 m!610097))

(declare-fun m!610121 () Bool)

(assert (=> b!635774 m!610121))

(declare-fun m!610123 () Bool)

(assert (=> b!635777 m!610123))

(assert (=> b!635777 m!610089))

(declare-fun m!610125 () Bool)

(assert (=> b!635777 m!610125))

(assert (=> b!635777 m!610097))

(declare-fun m!610127 () Bool)

(assert (=> b!635777 m!610127))

(assert (=> b!635777 m!610089))

(declare-fun m!610129 () Bool)

(assert (=> b!635777 m!610129))

(declare-fun m!610131 () Bool)

(assert (=> b!635777 m!610131))

(declare-fun m!610133 () Bool)

(assert (=> b!635777 m!610133))

(declare-fun m!610135 () Bool)

(assert (=> b!635780 m!610135))

(assert (=> b!635780 m!610089))

(assert (=> b!635780 m!610089))

(declare-fun m!610137 () Bool)

(assert (=> b!635780 m!610137))

(push 1)

