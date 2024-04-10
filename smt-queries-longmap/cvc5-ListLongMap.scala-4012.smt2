; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54544 () Bool)

(assert start!54544)

(declare-fun b!596137 () Bool)

(declare-fun e!340606 () Bool)

(declare-fun e!340600 () Bool)

(assert (=> b!596137 (= e!340606 e!340600)))

(declare-fun res!381966 () Bool)

(assert (=> b!596137 (=> (not res!381966) (not e!340600))))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((array!37004 0))(
  ( (array!37005 (arr!17766 (Array (_ BitVec 32) (_ BitVec 64))) (size!18130 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37004)

(declare-fun lt!270742 () array!37004)

(declare-fun arrayContainsKey!0 (array!37004 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!596137 (= res!381966 (arrayContainsKey!0 lt!270742 (select (arr!17766 a!2986) j!136) j!136))))

(declare-fun b!596138 () Bool)

(declare-fun res!381956 () Bool)

(declare-fun e!340604 () Bool)

(assert (=> b!596138 (=> (not res!381956) (not e!340604))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!596138 (= res!381956 (validKeyInArray!0 (select (arr!17766 a!2986) j!136)))))

(declare-fun b!596139 () Bool)

(declare-fun e!340605 () Bool)

(assert (=> b!596139 (= e!340605 true)))

(declare-fun lt!270745 () Bool)

(declare-fun k!1786 () (_ BitVec 64))

(declare-datatypes ((List!11807 0))(
  ( (Nil!11804) (Cons!11803 (h!12848 (_ BitVec 64)) (t!18035 List!11807)) )
))
(declare-fun contains!2942 (List!11807 (_ BitVec 64)) Bool)

(assert (=> b!596139 (= lt!270745 (contains!2942 Nil!11804 k!1786))))

(declare-fun b!596140 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!596140 (= e!340600 (arrayContainsKey!0 lt!270742 (select (arr!17766 a!2986) j!136) index!984))))

(declare-fun b!596141 () Bool)

(declare-fun res!381955 () Bool)

(assert (=> b!596141 (=> res!381955 e!340605)))

(assert (=> b!596141 (= res!381955 (contains!2942 Nil!11804 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!596142 () Bool)

(declare-fun res!381971 () Bool)

(assert (=> b!596142 (=> (not res!381971) (not e!340604))))

(assert (=> b!596142 (= res!381971 (validKeyInArray!0 k!1786))))

(declare-fun b!596143 () Bool)

(declare-fun res!381959 () Bool)

(assert (=> b!596143 (=> res!381959 e!340605)))

(assert (=> b!596143 (= res!381959 (contains!2942 Nil!11804 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!596144 () Bool)

(declare-fun e!340603 () Bool)

(assert (=> b!596144 (= e!340604 e!340603)))

(declare-fun res!381968 () Bool)

(assert (=> b!596144 (=> (not res!381968) (not e!340603))))

(declare-datatypes ((SeekEntryResult!6206 0))(
  ( (MissingZero!6206 (index!27072 (_ BitVec 32))) (Found!6206 (index!27073 (_ BitVec 32))) (Intermediate!6206 (undefined!7018 Bool) (index!27074 (_ BitVec 32)) (x!55874 (_ BitVec 32))) (Undefined!6206) (MissingVacant!6206 (index!27075 (_ BitVec 32))) )
))
(declare-fun lt!270738 () SeekEntryResult!6206)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!596144 (= res!381968 (or (= lt!270738 (MissingZero!6206 i!1108)) (= lt!270738 (MissingVacant!6206 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37004 (_ BitVec 32)) SeekEntryResult!6206)

(assert (=> b!596144 (= lt!270738 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!596145 () Bool)

(declare-datatypes ((Unit!18742 0))(
  ( (Unit!18743) )
))
(declare-fun e!340599 () Unit!18742)

(declare-fun Unit!18744 () Unit!18742)

(assert (=> b!596145 (= e!340599 Unit!18744)))

(declare-fun b!596146 () Bool)

(declare-fun res!381961 () Bool)

(assert (=> b!596146 (=> (not res!381961) (not e!340604))))

(assert (=> b!596146 (= res!381961 (and (= (size!18130 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18130 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18130 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!596147 () Bool)

(declare-fun e!340602 () Bool)

(assert (=> b!596147 (= e!340602 e!340606)))

(declare-fun res!381963 () Bool)

(assert (=> b!596147 (=> res!381963 e!340606)))

(declare-fun lt!270735 () (_ BitVec 64))

(declare-fun lt!270740 () (_ BitVec 64))

(assert (=> b!596147 (= res!381963 (or (not (= (select (arr!17766 a!2986) j!136) lt!270735)) (not (= (select (arr!17766 a!2986) j!136) lt!270740)) (bvsge j!136 index!984)))))

(declare-fun res!381964 () Bool)

(assert (=> start!54544 (=> (not res!381964) (not e!340604))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54544 (= res!381964 (validMask!0 mask!3053))))

(assert (=> start!54544 e!340604))

(assert (=> start!54544 true))

(declare-fun array_inv!13562 (array!37004) Bool)

(assert (=> start!54544 (array_inv!13562 a!2986)))

(declare-fun b!596148 () Bool)

(declare-fun e!340607 () Bool)

(declare-fun e!340597 () Bool)

(assert (=> b!596148 (= e!340607 e!340597)))

(declare-fun res!381962 () Bool)

(assert (=> b!596148 (=> (not res!381962) (not e!340597))))

(declare-fun lt!270734 () SeekEntryResult!6206)

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!596148 (= res!381962 (and (= lt!270734 (Found!6206 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17766 a!2986) index!984) (select (arr!17766 a!2986) j!136))) (not (= (select (arr!17766 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37004 (_ BitVec 32)) SeekEntryResult!6206)

(assert (=> b!596148 (= lt!270734 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17766 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!596149 () Bool)

(declare-fun Unit!18745 () Unit!18742)

(assert (=> b!596149 (= e!340599 Unit!18745)))

(assert (=> b!596149 false))

(declare-fun b!596150 () Bool)

(declare-fun res!381969 () Bool)

(assert (=> b!596150 (=> (not res!381969) (not e!340603))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37004 (_ BitVec 32)) Bool)

(assert (=> b!596150 (= res!381969 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!596151 () Bool)

(declare-fun e!340608 () Bool)

(declare-fun lt!270739 () SeekEntryResult!6206)

(assert (=> b!596151 (= e!340608 (= lt!270734 lt!270739))))

(declare-fun b!596152 () Bool)

(declare-fun res!381954 () Bool)

(assert (=> b!596152 (=> (not res!381954) (not e!340603))))

(declare-fun arrayNoDuplicates!0 (array!37004 (_ BitVec 32) List!11807) Bool)

(assert (=> b!596152 (= res!381954 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11804))))

(declare-fun b!596153 () Bool)

(declare-fun e!340598 () Bool)

(assert (=> b!596153 (= e!340598 e!340605)))

(declare-fun res!381967 () Bool)

(assert (=> b!596153 (=> res!381967 e!340605)))

(assert (=> b!596153 (= res!381967 (or (bvsge (size!18130 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18130 a!2986))))))

(assert (=> b!596153 (arrayContainsKey!0 lt!270742 (select (arr!17766 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!270737 () Unit!18742)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37004 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18742)

(assert (=> b!596153 (= lt!270737 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!270742 (select (arr!17766 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!596154 () Bool)

(declare-fun e!340596 () Bool)

(assert (=> b!596154 (= e!340596 e!340598)))

(declare-fun res!381951 () Bool)

(assert (=> b!596154 (=> res!381951 e!340598)))

(assert (=> b!596154 (= res!381951 (or (not (= (select (arr!17766 a!2986) j!136) lt!270735)) (not (= (select (arr!17766 a!2986) j!136) lt!270740)) (bvsge j!136 index!984)))))

(assert (=> b!596154 e!340602))

(declare-fun res!381957 () Bool)

(assert (=> b!596154 (=> (not res!381957) (not e!340602))))

(assert (=> b!596154 (= res!381957 (= lt!270740 (select (arr!17766 a!2986) j!136)))))

(assert (=> b!596154 (= lt!270740 (select (store (arr!17766 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!596155 () Bool)

(assert (=> b!596155 (= e!340597 (not e!340596))))

(declare-fun res!381958 () Bool)

(assert (=> b!596155 (=> res!381958 e!340596)))

(declare-fun lt!270744 () SeekEntryResult!6206)

(assert (=> b!596155 (= res!381958 (not (= lt!270744 (Found!6206 index!984))))))

(declare-fun lt!270736 () Unit!18742)

(assert (=> b!596155 (= lt!270736 e!340599)))

(declare-fun c!67460 () Bool)

(assert (=> b!596155 (= c!67460 (= lt!270744 Undefined!6206))))

(assert (=> b!596155 (= lt!270744 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!270735 lt!270742 mask!3053))))

(assert (=> b!596155 e!340608))

(declare-fun res!381953 () Bool)

(assert (=> b!596155 (=> (not res!381953) (not e!340608))))

(declare-fun lt!270741 () (_ BitVec 32))

(assert (=> b!596155 (= res!381953 (= lt!270739 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!270741 vacantSpotIndex!68 lt!270735 lt!270742 mask!3053)))))

(assert (=> b!596155 (= lt!270739 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!270741 vacantSpotIndex!68 (select (arr!17766 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!596155 (= lt!270735 (select (store (arr!17766 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!270743 () Unit!18742)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37004 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18742)

(assert (=> b!596155 (= lt!270743 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!270741 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!596155 (= lt!270741 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!596156 () Bool)

(assert (=> b!596156 (= e!340603 e!340607)))

(declare-fun res!381960 () Bool)

(assert (=> b!596156 (=> (not res!381960) (not e!340607))))

(assert (=> b!596156 (= res!381960 (= (select (store (arr!17766 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!596156 (= lt!270742 (array!37005 (store (arr!17766 a!2986) i!1108 k!1786) (size!18130 a!2986)))))

(declare-fun b!596157 () Bool)

(declare-fun res!381965 () Bool)

(assert (=> b!596157 (=> (not res!381965) (not e!340604))))

(assert (=> b!596157 (= res!381965 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!596158 () Bool)

(declare-fun res!381970 () Bool)

(assert (=> b!596158 (=> (not res!381970) (not e!340603))))

(assert (=> b!596158 (= res!381970 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17766 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!596159 () Bool)

(declare-fun res!381952 () Bool)

(assert (=> b!596159 (=> res!381952 e!340605)))

(declare-fun noDuplicate!261 (List!11807) Bool)

(assert (=> b!596159 (= res!381952 (not (noDuplicate!261 Nil!11804)))))

(assert (= (and start!54544 res!381964) b!596146))

(assert (= (and b!596146 res!381961) b!596138))

(assert (= (and b!596138 res!381956) b!596142))

(assert (= (and b!596142 res!381971) b!596157))

(assert (= (and b!596157 res!381965) b!596144))

(assert (= (and b!596144 res!381968) b!596150))

(assert (= (and b!596150 res!381969) b!596152))

(assert (= (and b!596152 res!381954) b!596158))

(assert (= (and b!596158 res!381970) b!596156))

(assert (= (and b!596156 res!381960) b!596148))

(assert (= (and b!596148 res!381962) b!596155))

(assert (= (and b!596155 res!381953) b!596151))

(assert (= (and b!596155 c!67460) b!596149))

(assert (= (and b!596155 (not c!67460)) b!596145))

(assert (= (and b!596155 (not res!381958)) b!596154))

(assert (= (and b!596154 res!381957) b!596147))

(assert (= (and b!596147 (not res!381963)) b!596137))

(assert (= (and b!596137 res!381966) b!596140))

(assert (= (and b!596154 (not res!381951)) b!596153))

(assert (= (and b!596153 (not res!381967)) b!596159))

(assert (= (and b!596159 (not res!381952)) b!596141))

(assert (= (and b!596141 (not res!381955)) b!596143))

(assert (= (and b!596143 (not res!381959)) b!596139))

(declare-fun m!573677 () Bool)

(assert (=> b!596154 m!573677))

(declare-fun m!573679 () Bool)

(assert (=> b!596154 m!573679))

(declare-fun m!573681 () Bool)

(assert (=> b!596154 m!573681))

(assert (=> b!596147 m!573677))

(assert (=> b!596140 m!573677))

(assert (=> b!596140 m!573677))

(declare-fun m!573683 () Bool)

(assert (=> b!596140 m!573683))

(assert (=> b!596153 m!573677))

(assert (=> b!596153 m!573677))

(declare-fun m!573685 () Bool)

(assert (=> b!596153 m!573685))

(assert (=> b!596153 m!573677))

(declare-fun m!573687 () Bool)

(assert (=> b!596153 m!573687))

(declare-fun m!573689 () Bool)

(assert (=> start!54544 m!573689))

(declare-fun m!573691 () Bool)

(assert (=> start!54544 m!573691))

(assert (=> b!596138 m!573677))

(assert (=> b!596138 m!573677))

(declare-fun m!573693 () Bool)

(assert (=> b!596138 m!573693))

(declare-fun m!573695 () Bool)

(assert (=> b!596148 m!573695))

(assert (=> b!596148 m!573677))

(assert (=> b!596148 m!573677))

(declare-fun m!573697 () Bool)

(assert (=> b!596148 m!573697))

(declare-fun m!573699 () Bool)

(assert (=> b!596139 m!573699))

(declare-fun m!573701 () Bool)

(assert (=> b!596150 m!573701))

(declare-fun m!573703 () Bool)

(assert (=> b!596155 m!573703))

(declare-fun m!573705 () Bool)

(assert (=> b!596155 m!573705))

(assert (=> b!596155 m!573679))

(declare-fun m!573707 () Bool)

(assert (=> b!596155 m!573707))

(assert (=> b!596155 m!573677))

(declare-fun m!573709 () Bool)

(assert (=> b!596155 m!573709))

(declare-fun m!573711 () Bool)

(assert (=> b!596155 m!573711))

(declare-fun m!573713 () Bool)

(assert (=> b!596155 m!573713))

(assert (=> b!596155 m!573677))

(declare-fun m!573715 () Bool)

(assert (=> b!596159 m!573715))

(declare-fun m!573717 () Bool)

(assert (=> b!596158 m!573717))

(declare-fun m!573719 () Bool)

(assert (=> b!596144 m!573719))

(assert (=> b!596137 m!573677))

(assert (=> b!596137 m!573677))

(declare-fun m!573721 () Bool)

(assert (=> b!596137 m!573721))

(declare-fun m!573723 () Bool)

(assert (=> b!596157 m!573723))

(declare-fun m!573725 () Bool)

(assert (=> b!596142 m!573725))

(declare-fun m!573727 () Bool)

(assert (=> b!596141 m!573727))

(assert (=> b!596156 m!573679))

(declare-fun m!573729 () Bool)

(assert (=> b!596156 m!573729))

(declare-fun m!573731 () Bool)

(assert (=> b!596143 m!573731))

(declare-fun m!573733 () Bool)

(assert (=> b!596152 m!573733))

(push 1)

