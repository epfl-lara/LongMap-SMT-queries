; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54948 () Bool)

(assert start!54948)

(declare-fun b!601120 () Bool)

(declare-fun res!385869 () Bool)

(declare-fun e!343712 () Bool)

(assert (=> b!601120 (=> (not res!385869) (not e!343712))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-datatypes ((array!37128 0))(
  ( (array!37129 (arr!17821 (Array (_ BitVec 32) (_ BitVec 64))) (size!18185 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37128)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!601120 (= res!385869 (and (= (size!18185 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18185 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18185 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!601121 () Bool)

(declare-fun res!385866 () Bool)

(assert (=> b!601121 (=> (not res!385866) (not e!343712))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!37128 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!601121 (= res!385866 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!601122 () Bool)

(declare-fun e!343705 () Bool)

(assert (=> b!601122 (= e!343705 true)))

(declare-fun lt!273541 () Bool)

(declare-datatypes ((List!11769 0))(
  ( (Nil!11766) (Cons!11765 (h!12813 (_ BitVec 64)) (t!17989 List!11769)) )
))
(declare-fun contains!2959 (List!11769 (_ BitVec 64)) Bool)

(assert (=> b!601122 (= lt!273541 (contains!2959 Nil!11766 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!601123 () Bool)

(declare-fun e!343710 () Bool)

(assert (=> b!601123 (= e!343712 e!343710)))

(declare-fun res!385875 () Bool)

(assert (=> b!601123 (=> (not res!385875) (not e!343710))))

(declare-datatypes ((SeekEntryResult!6217 0))(
  ( (MissingZero!6217 (index!27125 (_ BitVec 32))) (Found!6217 (index!27126 (_ BitVec 32))) (Intermediate!6217 (undefined!7029 Bool) (index!27127 (_ BitVec 32)) (x!56075 (_ BitVec 32))) (Undefined!6217) (MissingVacant!6217 (index!27128 (_ BitVec 32))) )
))
(declare-fun lt!273538 () SeekEntryResult!6217)

(assert (=> b!601123 (= res!385875 (or (= lt!273538 (MissingZero!6217 i!1108)) (= lt!273538 (MissingVacant!6217 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37128 (_ BitVec 32)) SeekEntryResult!6217)

(assert (=> b!601123 (= lt!273538 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!601124 () Bool)

(declare-fun e!343708 () Bool)

(declare-fun e!343704 () Bool)

(assert (=> b!601124 (= e!343708 e!343704)))

(declare-fun res!385874 () Bool)

(assert (=> b!601124 (=> (not res!385874) (not e!343704))))

(declare-fun lt!273536 () array!37128)

(assert (=> b!601124 (= res!385874 (arrayContainsKey!0 lt!273536 (select (arr!17821 a!2986) j!136) j!136))))

(declare-fun b!601125 () Bool)

(declare-fun res!385876 () Bool)

(assert (=> b!601125 (=> res!385876 e!343705)))

(declare-fun noDuplicate!304 (List!11769) Bool)

(assert (=> b!601125 (= res!385876 (not (noDuplicate!304 Nil!11766)))))

(declare-fun b!601127 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!601127 (= e!343704 (arrayContainsKey!0 lt!273536 (select (arr!17821 a!2986) j!136) index!984))))

(declare-fun b!601128 () Bool)

(declare-datatypes ((Unit!18961 0))(
  ( (Unit!18962) )
))
(declare-fun e!343703 () Unit!18961)

(declare-fun Unit!18963 () Unit!18961)

(assert (=> b!601128 (= e!343703 Unit!18963)))

(assert (=> b!601128 false))

(declare-fun b!601129 () Bool)

(declare-fun e!343706 () Bool)

(assert (=> b!601129 (= e!343710 e!343706)))

(declare-fun res!385858 () Bool)

(assert (=> b!601129 (=> (not res!385858) (not e!343706))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!601129 (= res!385858 (= (select (store (arr!17821 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!601129 (= lt!273536 (array!37129 (store (arr!17821 a!2986) i!1108 k0!1786) (size!18185 a!2986)))))

(declare-fun b!601130 () Bool)

(declare-fun res!385873 () Bool)

(assert (=> b!601130 (=> res!385873 e!343705)))

(assert (=> b!601130 (= res!385873 (contains!2959 Nil!11766 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!601131 () Bool)

(declare-fun res!385862 () Bool)

(assert (=> b!601131 (=> (not res!385862) (not e!343710))))

(declare-fun arrayNoDuplicates!0 (array!37128 (_ BitVec 32) List!11769) Bool)

(assert (=> b!601131 (= res!385862 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11766))))

(declare-fun b!601132 () Bool)

(declare-fun res!385865 () Bool)

(assert (=> b!601132 (=> (not res!385865) (not e!343710))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37128 (_ BitVec 32)) Bool)

(assert (=> b!601132 (= res!385865 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!601133 () Bool)

(declare-fun res!385857 () Bool)

(assert (=> b!601133 (=> (not res!385857) (not e!343712))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!601133 (= res!385857 (validKeyInArray!0 k0!1786))))

(declare-fun b!601134 () Bool)

(declare-fun e!343709 () Bool)

(declare-fun lt!273542 () SeekEntryResult!6217)

(declare-fun lt!273534 () SeekEntryResult!6217)

(assert (=> b!601134 (= e!343709 (= lt!273542 lt!273534))))

(declare-fun b!601135 () Bool)

(declare-fun Unit!18964 () Unit!18961)

(assert (=> b!601135 (= e!343703 Unit!18964)))

(declare-fun b!601136 () Bool)

(declare-fun res!385863 () Bool)

(assert (=> b!601136 (=> (not res!385863) (not e!343712))))

(assert (=> b!601136 (= res!385863 (validKeyInArray!0 (select (arr!17821 a!2986) j!136)))))

(declare-fun b!601137 () Bool)

(declare-fun e!343702 () Bool)

(assert (=> b!601137 (= e!343706 e!343702)))

(declare-fun res!385870 () Bool)

(assert (=> b!601137 (=> (not res!385870) (not e!343702))))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!601137 (= res!385870 (and (= lt!273542 (Found!6217 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17821 a!2986) index!984) (select (arr!17821 a!2986) j!136))) (not (= (select (arr!17821 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37128 (_ BitVec 32)) SeekEntryResult!6217)

(assert (=> b!601137 (= lt!273542 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17821 a!2986) j!136) a!2986 mask!3053))))

(declare-fun res!385867 () Bool)

(assert (=> start!54948 (=> (not res!385867) (not e!343712))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54948 (= res!385867 (validMask!0 mask!3053))))

(assert (=> start!54948 e!343712))

(assert (=> start!54948 true))

(declare-fun array_inv!13680 (array!37128) Bool)

(assert (=> start!54948 (array_inv!13680 a!2986)))

(declare-fun b!601126 () Bool)

(declare-fun res!385860 () Bool)

(assert (=> b!601126 (=> (not res!385860) (not e!343710))))

(assert (=> b!601126 (= res!385860 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17821 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!601138 () Bool)

(declare-fun e!343701 () Bool)

(assert (=> b!601138 (= e!343701 e!343705)))

(declare-fun res!385859 () Bool)

(assert (=> b!601138 (=> res!385859 e!343705)))

(assert (=> b!601138 (= res!385859 (or (bvsge (size!18185 a!2986) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 j!136) (size!18185 a!2986))))))

(assert (=> b!601138 (arrayNoDuplicates!0 lt!273536 j!136 Nil!11766)))

(declare-fun lt!273535 () Unit!18961)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37128 (_ BitVec 32) (_ BitVec 32)) Unit!18961)

(assert (=> b!601138 (= lt!273535 (lemmaNoDuplicateFromThenFromBigger!0 lt!273536 #b00000000000000000000000000000000 j!136))))

(assert (=> b!601138 (arrayNoDuplicates!0 lt!273536 #b00000000000000000000000000000000 Nil!11766)))

(declare-fun lt!273545 () Unit!18961)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37128 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11769) Unit!18961)

(assert (=> b!601138 (= lt!273545 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11766))))

(assert (=> b!601138 (arrayContainsKey!0 lt!273536 (select (arr!17821 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!273543 () Unit!18961)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37128 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18961)

(assert (=> b!601138 (= lt!273543 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!273536 (select (arr!17821 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!601139 () Bool)

(declare-fun e!343707 () Bool)

(assert (=> b!601139 (= e!343707 e!343701)))

(declare-fun res!385871 () Bool)

(assert (=> b!601139 (=> res!385871 e!343701)))

(declare-fun lt!273537 () (_ BitVec 64))

(declare-fun lt!273540 () (_ BitVec 64))

(assert (=> b!601139 (= res!385871 (or (not (= (select (arr!17821 a!2986) j!136) lt!273537)) (not (= (select (arr!17821 a!2986) j!136) lt!273540)) (bvsge j!136 index!984)))))

(declare-fun e!343713 () Bool)

(assert (=> b!601139 e!343713))

(declare-fun res!385868 () Bool)

(assert (=> b!601139 (=> (not res!385868) (not e!343713))))

(assert (=> b!601139 (= res!385868 (= lt!273540 (select (arr!17821 a!2986) j!136)))))

(assert (=> b!601139 (= lt!273540 (select (store (arr!17821 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!601140 () Bool)

(assert (=> b!601140 (= e!343713 e!343708)))

(declare-fun res!385864 () Bool)

(assert (=> b!601140 (=> res!385864 e!343708)))

(assert (=> b!601140 (= res!385864 (or (not (= (select (arr!17821 a!2986) j!136) lt!273537)) (not (= (select (arr!17821 a!2986) j!136) lt!273540)) (bvsge j!136 index!984)))))

(declare-fun b!601141 () Bool)

(assert (=> b!601141 (= e!343702 (not e!343707))))

(declare-fun res!385861 () Bool)

(assert (=> b!601141 (=> res!385861 e!343707)))

(declare-fun lt!273544 () SeekEntryResult!6217)

(assert (=> b!601141 (= res!385861 (not (= lt!273544 (Found!6217 index!984))))))

(declare-fun lt!273539 () Unit!18961)

(assert (=> b!601141 (= lt!273539 e!343703)))

(declare-fun c!68000 () Bool)

(assert (=> b!601141 (= c!68000 (= lt!273544 Undefined!6217))))

(assert (=> b!601141 (= lt!273544 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!273537 lt!273536 mask!3053))))

(assert (=> b!601141 e!343709))

(declare-fun res!385872 () Bool)

(assert (=> b!601141 (=> (not res!385872) (not e!343709))))

(declare-fun lt!273547 () (_ BitVec 32))

(assert (=> b!601141 (= res!385872 (= lt!273534 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!273547 vacantSpotIndex!68 lt!273537 lt!273536 mask!3053)))))

(assert (=> b!601141 (= lt!273534 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!273547 vacantSpotIndex!68 (select (arr!17821 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!601141 (= lt!273537 (select (store (arr!17821 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!273546 () Unit!18961)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37128 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18961)

(assert (=> b!601141 (= lt!273546 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!273547 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!601141 (= lt!273547 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(assert (= (and start!54948 res!385867) b!601120))

(assert (= (and b!601120 res!385869) b!601136))

(assert (= (and b!601136 res!385863) b!601133))

(assert (= (and b!601133 res!385857) b!601121))

(assert (= (and b!601121 res!385866) b!601123))

(assert (= (and b!601123 res!385875) b!601132))

(assert (= (and b!601132 res!385865) b!601131))

(assert (= (and b!601131 res!385862) b!601126))

(assert (= (and b!601126 res!385860) b!601129))

(assert (= (and b!601129 res!385858) b!601137))

(assert (= (and b!601137 res!385870) b!601141))

(assert (= (and b!601141 res!385872) b!601134))

(assert (= (and b!601141 c!68000) b!601128))

(assert (= (and b!601141 (not c!68000)) b!601135))

(assert (= (and b!601141 (not res!385861)) b!601139))

(assert (= (and b!601139 res!385868) b!601140))

(assert (= (and b!601140 (not res!385864)) b!601124))

(assert (= (and b!601124 res!385874) b!601127))

(assert (= (and b!601139 (not res!385871)) b!601138))

(assert (= (and b!601138 (not res!385859)) b!601125))

(assert (= (and b!601125 (not res!385876)) b!601130))

(assert (= (and b!601130 (not res!385873)) b!601122))

(declare-fun m!578549 () Bool)

(assert (=> b!601125 m!578549))

(declare-fun m!578551 () Bool)

(assert (=> b!601131 m!578551))

(declare-fun m!578553 () Bool)

(assert (=> b!601127 m!578553))

(assert (=> b!601127 m!578553))

(declare-fun m!578555 () Bool)

(assert (=> b!601127 m!578555))

(declare-fun m!578557 () Bool)

(assert (=> b!601137 m!578557))

(assert (=> b!601137 m!578553))

(assert (=> b!601137 m!578553))

(declare-fun m!578559 () Bool)

(assert (=> b!601137 m!578559))

(declare-fun m!578561 () Bool)

(assert (=> b!601129 m!578561))

(declare-fun m!578563 () Bool)

(assert (=> b!601129 m!578563))

(declare-fun m!578565 () Bool)

(assert (=> start!54948 m!578565))

(declare-fun m!578567 () Bool)

(assert (=> start!54948 m!578567))

(declare-fun m!578569 () Bool)

(assert (=> b!601121 m!578569))

(assert (=> b!601136 m!578553))

(assert (=> b!601136 m!578553))

(declare-fun m!578571 () Bool)

(assert (=> b!601136 m!578571))

(assert (=> b!601140 m!578553))

(declare-fun m!578573 () Bool)

(assert (=> b!601133 m!578573))

(declare-fun m!578575 () Bool)

(assert (=> b!601122 m!578575))

(assert (=> b!601138 m!578553))

(assert (=> b!601138 m!578553))

(declare-fun m!578577 () Bool)

(assert (=> b!601138 m!578577))

(declare-fun m!578579 () Bool)

(assert (=> b!601138 m!578579))

(assert (=> b!601138 m!578553))

(declare-fun m!578581 () Bool)

(assert (=> b!601138 m!578581))

(declare-fun m!578583 () Bool)

(assert (=> b!601138 m!578583))

(declare-fun m!578585 () Bool)

(assert (=> b!601138 m!578585))

(declare-fun m!578587 () Bool)

(assert (=> b!601138 m!578587))

(assert (=> b!601139 m!578553))

(assert (=> b!601139 m!578561))

(declare-fun m!578589 () Bool)

(assert (=> b!601139 m!578589))

(declare-fun m!578591 () Bool)

(assert (=> b!601123 m!578591))

(declare-fun m!578593 () Bool)

(assert (=> b!601126 m!578593))

(declare-fun m!578595 () Bool)

(assert (=> b!601132 m!578595))

(declare-fun m!578597 () Bool)

(assert (=> b!601130 m!578597))

(assert (=> b!601124 m!578553))

(assert (=> b!601124 m!578553))

(declare-fun m!578599 () Bool)

(assert (=> b!601124 m!578599))

(declare-fun m!578601 () Bool)

(assert (=> b!601141 m!578601))

(declare-fun m!578603 () Bool)

(assert (=> b!601141 m!578603))

(assert (=> b!601141 m!578553))

(assert (=> b!601141 m!578561))

(declare-fun m!578605 () Bool)

(assert (=> b!601141 m!578605))

(declare-fun m!578607 () Bool)

(assert (=> b!601141 m!578607))

(assert (=> b!601141 m!578553))

(declare-fun m!578609 () Bool)

(assert (=> b!601141 m!578609))

(declare-fun m!578611 () Bool)

(assert (=> b!601141 m!578611))

(check-sat (not b!601125) (not b!601133) (not start!54948) (not b!601141) (not b!601131) (not b!601121) (not b!601127) (not b!601136) (not b!601138) (not b!601137) (not b!601130) (not b!601132) (not b!601124) (not b!601123) (not b!601122))
(check-sat)
