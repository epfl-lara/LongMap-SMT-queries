; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57822 () Bool)

(assert start!57822)

(declare-fun res!414227 () Bool)

(declare-fun e!366137 () Bool)

(assert (=> start!57822 (=> (not res!414227) (not e!366137))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57822 (= res!414227 (validMask!0 mask!3053))))

(assert (=> start!57822 e!366137))

(assert (=> start!57822 true))

(declare-datatypes ((array!38324 0))(
  ( (array!38325 (arr!18383 (Array (_ BitVec 32) (_ BitVec 64))) (size!18747 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38324)

(declare-fun array_inv!14179 (array!38324) Bool)

(assert (=> start!57822 (array_inv!14179 a!2986)))

(declare-fun b!639704 () Bool)

(declare-fun e!366130 () Bool)

(declare-fun e!366134 () Bool)

(assert (=> b!639704 (= e!366130 e!366134)))

(declare-fun res!414222 () Bool)

(assert (=> b!639704 (=> res!414222 e!366134)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!295980 () (_ BitVec 64))

(declare-fun lt!295979 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!639704 (= res!414222 (or (not (= (select (arr!18383 a!2986) j!136) lt!295979)) (not (= (select (arr!18383 a!2986) j!136) lt!295980)) (bvsge j!136 index!984)))))

(declare-fun b!639705 () Bool)

(declare-fun res!414235 () Bool)

(declare-fun e!366127 () Bool)

(assert (=> b!639705 (=> (not res!414235) (not e!366127))))

(declare-datatypes ((List!12424 0))(
  ( (Nil!12421) (Cons!12420 (h!13465 (_ BitVec 64)) (t!18652 List!12424)) )
))
(declare-fun arrayNoDuplicates!0 (array!38324 (_ BitVec 32) List!12424) Bool)

(assert (=> b!639705 (= res!414235 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12421))))

(declare-fun b!639706 () Bool)

(declare-fun res!414228 () Bool)

(assert (=> b!639706 (=> (not res!414228) (not e!366137))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!38324 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!639706 (= res!414228 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!639707 () Bool)

(declare-fun e!366129 () Bool)

(assert (=> b!639707 (= e!366134 e!366129)))

(declare-fun res!414221 () Bool)

(assert (=> b!639707 (=> (not res!414221) (not e!366129))))

(declare-fun lt!295983 () array!38324)

(assert (=> b!639707 (= res!414221 (arrayContainsKey!0 lt!295983 (select (arr!18383 a!2986) j!136) j!136))))

(declare-fun b!639708 () Bool)

(declare-fun e!366136 () Bool)

(assert (=> b!639708 (= e!366136 true)))

(assert (=> b!639708 (arrayNoDuplicates!0 lt!295983 #b00000000000000000000000000000000 Nil!12421)))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((Unit!21626 0))(
  ( (Unit!21627) )
))
(declare-fun lt!295981 () Unit!21626)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38324 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12424) Unit!21626)

(assert (=> b!639708 (= lt!295981 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12421))))

(assert (=> b!639708 (arrayContainsKey!0 lt!295983 (select (arr!18383 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!295987 () Unit!21626)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38324 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21626)

(assert (=> b!639708 (= lt!295987 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!295983 (select (arr!18383 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!639709 () Bool)

(declare-fun res!414231 () Bool)

(assert (=> b!639709 (=> (not res!414231) (not e!366127))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38324 (_ BitVec 32)) Bool)

(assert (=> b!639709 (= res!414231 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!639710 () Bool)

(declare-fun e!366131 () Bool)

(declare-fun e!366128 () Bool)

(assert (=> b!639710 (= e!366131 e!366128)))

(declare-fun res!414230 () Bool)

(assert (=> b!639710 (=> (not res!414230) (not e!366128))))

(declare-datatypes ((SeekEntryResult!6823 0))(
  ( (MissingZero!6823 (index!29609 (_ BitVec 32))) (Found!6823 (index!29610 (_ BitVec 32))) (Intermediate!6823 (undefined!7635 Bool) (index!29611 (_ BitVec 32)) (x!58362 (_ BitVec 32))) (Undefined!6823) (MissingVacant!6823 (index!29612 (_ BitVec 32))) )
))
(declare-fun lt!295990 () SeekEntryResult!6823)

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!639710 (= res!414230 (and (= lt!295990 (Found!6823 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18383 a!2986) index!984) (select (arr!18383 a!2986) j!136))) (not (= (select (arr!18383 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38324 (_ BitVec 32)) SeekEntryResult!6823)

(assert (=> b!639710 (= lt!295990 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18383 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!639711 () Bool)

(declare-fun e!366135 () Unit!21626)

(declare-fun Unit!21628 () Unit!21626)

(assert (=> b!639711 (= e!366135 Unit!21628)))

(declare-fun b!639712 () Bool)

(declare-fun res!414232 () Bool)

(assert (=> b!639712 (=> (not res!414232) (not e!366137))))

(assert (=> b!639712 (= res!414232 (and (= (size!18747 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18747 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18747 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!639713 () Bool)

(assert (=> b!639713 (= e!366137 e!366127)))

(declare-fun res!414234 () Bool)

(assert (=> b!639713 (=> (not res!414234) (not e!366127))))

(declare-fun lt!295984 () SeekEntryResult!6823)

(assert (=> b!639713 (= res!414234 (or (= lt!295984 (MissingZero!6823 i!1108)) (= lt!295984 (MissingVacant!6823 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38324 (_ BitVec 32)) SeekEntryResult!6823)

(assert (=> b!639713 (= lt!295984 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!639714 () Bool)

(declare-fun e!366138 () Bool)

(declare-fun lt!295982 () SeekEntryResult!6823)

(assert (=> b!639714 (= e!366138 (= lt!295990 lt!295982))))

(declare-fun b!639715 () Bool)

(declare-fun res!414220 () Bool)

(assert (=> b!639715 (=> (not res!414220) (not e!366127))))

(assert (=> b!639715 (= res!414220 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18383 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!639716 () Bool)

(declare-fun res!414224 () Bool)

(assert (=> b!639716 (=> (not res!414224) (not e!366137))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!639716 (= res!414224 (validKeyInArray!0 (select (arr!18383 a!2986) j!136)))))

(declare-fun b!639717 () Bool)

(assert (=> b!639717 (= e!366127 e!366131)))

(declare-fun res!414229 () Bool)

(assert (=> b!639717 (=> (not res!414229) (not e!366131))))

(assert (=> b!639717 (= res!414229 (= (select (store (arr!18383 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!639717 (= lt!295983 (array!38325 (store (arr!18383 a!2986) i!1108 k!1786) (size!18747 a!2986)))))

(declare-fun b!639718 () Bool)

(declare-fun res!414233 () Bool)

(assert (=> b!639718 (=> (not res!414233) (not e!366137))))

(assert (=> b!639718 (= res!414233 (validKeyInArray!0 k!1786))))

(declare-fun b!639719 () Bool)

(declare-fun e!366133 () Bool)

(assert (=> b!639719 (= e!366128 (not e!366133))))

(declare-fun res!414225 () Bool)

(assert (=> b!639719 (=> res!414225 e!366133)))

(declare-fun lt!295988 () SeekEntryResult!6823)

(assert (=> b!639719 (= res!414225 (not (= lt!295988 (Found!6823 index!984))))))

(declare-fun lt!295989 () Unit!21626)

(assert (=> b!639719 (= lt!295989 e!366135)))

(declare-fun c!73109 () Bool)

(assert (=> b!639719 (= c!73109 (= lt!295988 Undefined!6823))))

(assert (=> b!639719 (= lt!295988 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!295979 lt!295983 mask!3053))))

(assert (=> b!639719 e!366138))

(declare-fun res!414226 () Bool)

(assert (=> b!639719 (=> (not res!414226) (not e!366138))))

(declare-fun lt!295985 () (_ BitVec 32))

(assert (=> b!639719 (= res!414226 (= lt!295982 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!295985 vacantSpotIndex!68 lt!295979 lt!295983 mask!3053)))))

(assert (=> b!639719 (= lt!295982 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!295985 vacantSpotIndex!68 (select (arr!18383 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!639719 (= lt!295979 (select (store (arr!18383 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!295986 () Unit!21626)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38324 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21626)

(assert (=> b!639719 (= lt!295986 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!295985 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!639719 (= lt!295985 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!639720 () Bool)

(declare-fun Unit!21629 () Unit!21626)

(assert (=> b!639720 (= e!366135 Unit!21629)))

(assert (=> b!639720 false))

(declare-fun b!639721 () Bool)

(assert (=> b!639721 (= e!366129 (arrayContainsKey!0 lt!295983 (select (arr!18383 a!2986) j!136) index!984))))

(declare-fun b!639722 () Bool)

(assert (=> b!639722 (= e!366133 e!366136)))

(declare-fun res!414223 () Bool)

(assert (=> b!639722 (=> res!414223 e!366136)))

(assert (=> b!639722 (= res!414223 (or (not (= (select (arr!18383 a!2986) j!136) lt!295979)) (not (= (select (arr!18383 a!2986) j!136) lt!295980)) (bvsge j!136 index!984)))))

(assert (=> b!639722 e!366130))

(declare-fun res!414236 () Bool)

(assert (=> b!639722 (=> (not res!414236) (not e!366130))))

(assert (=> b!639722 (= res!414236 (= lt!295980 (select (arr!18383 a!2986) j!136)))))

(assert (=> b!639722 (= lt!295980 (select (store (arr!18383 a!2986) i!1108 k!1786) index!984))))

(assert (= (and start!57822 res!414227) b!639712))

(assert (= (and b!639712 res!414232) b!639716))

(assert (= (and b!639716 res!414224) b!639718))

(assert (= (and b!639718 res!414233) b!639706))

(assert (= (and b!639706 res!414228) b!639713))

(assert (= (and b!639713 res!414234) b!639709))

(assert (= (and b!639709 res!414231) b!639705))

(assert (= (and b!639705 res!414235) b!639715))

(assert (= (and b!639715 res!414220) b!639717))

(assert (= (and b!639717 res!414229) b!639710))

(assert (= (and b!639710 res!414230) b!639719))

(assert (= (and b!639719 res!414226) b!639714))

(assert (= (and b!639719 c!73109) b!639720))

(assert (= (and b!639719 (not c!73109)) b!639711))

(assert (= (and b!639719 (not res!414225)) b!639722))

(assert (= (and b!639722 res!414236) b!639704))

(assert (= (and b!639704 (not res!414222)) b!639707))

(assert (= (and b!639707 res!414221) b!639721))

(assert (= (and b!639722 (not res!414223)) b!639708))

(declare-fun m!613553 () Bool)

(assert (=> b!639718 m!613553))

(declare-fun m!613555 () Bool)

(assert (=> b!639708 m!613555))

(declare-fun m!613557 () Bool)

(assert (=> b!639708 m!613557))

(assert (=> b!639708 m!613555))

(declare-fun m!613559 () Bool)

(assert (=> b!639708 m!613559))

(assert (=> b!639708 m!613555))

(declare-fun m!613561 () Bool)

(assert (=> b!639708 m!613561))

(declare-fun m!613563 () Bool)

(assert (=> b!639708 m!613563))

(declare-fun m!613565 () Bool)

(assert (=> b!639705 m!613565))

(declare-fun m!613567 () Bool)

(assert (=> b!639719 m!613567))

(declare-fun m!613569 () Bool)

(assert (=> b!639719 m!613569))

(declare-fun m!613571 () Bool)

(assert (=> b!639719 m!613571))

(assert (=> b!639719 m!613555))

(declare-fun m!613573 () Bool)

(assert (=> b!639719 m!613573))

(declare-fun m!613575 () Bool)

(assert (=> b!639719 m!613575))

(assert (=> b!639719 m!613555))

(declare-fun m!613577 () Bool)

(assert (=> b!639719 m!613577))

(declare-fun m!613579 () Bool)

(assert (=> b!639719 m!613579))

(assert (=> b!639722 m!613555))

(assert (=> b!639722 m!613573))

(declare-fun m!613581 () Bool)

(assert (=> b!639722 m!613581))

(declare-fun m!613583 () Bool)

(assert (=> b!639706 m!613583))

(assert (=> b!639704 m!613555))

(assert (=> b!639721 m!613555))

(assert (=> b!639721 m!613555))

(declare-fun m!613585 () Bool)

(assert (=> b!639721 m!613585))

(declare-fun m!613587 () Bool)

(assert (=> b!639715 m!613587))

(assert (=> b!639716 m!613555))

(assert (=> b!639716 m!613555))

(declare-fun m!613589 () Bool)

(assert (=> b!639716 m!613589))

(declare-fun m!613591 () Bool)

(assert (=> b!639710 m!613591))

(assert (=> b!639710 m!613555))

(assert (=> b!639710 m!613555))

(declare-fun m!613593 () Bool)

(assert (=> b!639710 m!613593))

(declare-fun m!613595 () Bool)

(assert (=> b!639713 m!613595))

(declare-fun m!613597 () Bool)

(assert (=> b!639709 m!613597))

(assert (=> b!639707 m!613555))

(assert (=> b!639707 m!613555))

(declare-fun m!613599 () Bool)

(assert (=> b!639707 m!613599))

(assert (=> b!639717 m!613573))

(declare-fun m!613601 () Bool)

(assert (=> b!639717 m!613601))

(declare-fun m!613603 () Bool)

(assert (=> start!57822 m!613603))

(declare-fun m!613605 () Bool)

(assert (=> start!57822 m!613605))

(push 1)

