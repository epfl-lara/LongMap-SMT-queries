; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54546 () Bool)

(assert start!54546)

(declare-fun b!596206 () Bool)

(declare-fun res!382030 () Bool)

(declare-fun e!340641 () Bool)

(assert (=> b!596206 (=> res!382030 e!340641)))

(declare-datatypes ((List!11808 0))(
  ( (Nil!11805) (Cons!11804 (h!12849 (_ BitVec 64)) (t!18036 List!11808)) )
))
(declare-fun contains!2943 (List!11808 (_ BitVec 64)) Bool)

(assert (=> b!596206 (= res!382030 (contains!2943 Nil!11805 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!596208 () Bool)

(declare-fun e!340635 () Bool)

(declare-fun e!340636 () Bool)

(assert (=> b!596208 (= e!340635 e!340636)))

(declare-fun res!382026 () Bool)

(assert (=> b!596208 (=> (not res!382026) (not e!340636))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37006 0))(
  ( (array!37007 (arr!17767 (Array (_ BitVec 32) (_ BitVec 64))) (size!18131 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37006)

(declare-datatypes ((SeekEntryResult!6207 0))(
  ( (MissingZero!6207 (index!27076 (_ BitVec 32))) (Found!6207 (index!27077 (_ BitVec 32))) (Intermediate!6207 (undefined!7019 Bool) (index!27078 (_ BitVec 32)) (x!55875 (_ BitVec 32))) (Undefined!6207) (MissingVacant!6207 (index!27079 (_ BitVec 32))) )
))
(declare-fun lt!270775 () SeekEntryResult!6207)

(assert (=> b!596208 (= res!382026 (and (= lt!270775 (Found!6207 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17767 a!2986) index!984) (select (arr!17767 a!2986) j!136))) (not (= (select (arr!17767 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37006 (_ BitVec 32)) SeekEntryResult!6207)

(assert (=> b!596208 (= lt!270775 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17767 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!596209 () Bool)

(declare-fun res!382022 () Bool)

(declare-fun e!340647 () Bool)

(assert (=> b!596209 (=> (not res!382022) (not e!340647))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!596209 (= res!382022 (validKeyInArray!0 k0!1786))))

(declare-fun b!596210 () Bool)

(declare-fun res!382021 () Bool)

(declare-fun e!340637 () Bool)

(assert (=> b!596210 (=> (not res!382021) (not e!340637))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37006 (_ BitVec 32)) Bool)

(assert (=> b!596210 (= res!382021 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!596211 () Bool)

(declare-fun res!382023 () Bool)

(assert (=> b!596211 (=> (not res!382023) (not e!340647))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!596211 (= res!382023 (and (= (size!18131 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18131 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18131 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!596212 () Bool)

(declare-fun res!382024 () Bool)

(assert (=> b!596212 (=> (not res!382024) (not e!340637))))

(assert (=> b!596212 (= res!382024 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17767 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!596213 () Bool)

(declare-fun e!340646 () Bool)

(declare-fun e!340639 () Bool)

(assert (=> b!596213 (= e!340646 e!340639)))

(declare-fun res!382028 () Bool)

(assert (=> b!596213 (=> (not res!382028) (not e!340639))))

(declare-fun lt!270780 () array!37006)

(declare-fun arrayContainsKey!0 (array!37006 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!596213 (= res!382028 (arrayContainsKey!0 lt!270780 (select (arr!17767 a!2986) j!136) j!136))))

(declare-fun b!596214 () Bool)

(declare-fun res!382019 () Bool)

(assert (=> b!596214 (=> (not res!382019) (not e!340637))))

(declare-fun arrayNoDuplicates!0 (array!37006 (_ BitVec 32) List!11808) Bool)

(assert (=> b!596214 (= res!382019 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11805))))

(declare-fun b!596215 () Bool)

(declare-fun e!340640 () Bool)

(declare-fun e!340645 () Bool)

(assert (=> b!596215 (= e!340640 e!340645)))

(declare-fun res!382027 () Bool)

(assert (=> b!596215 (=> res!382027 e!340645)))

(declare-fun lt!270772 () (_ BitVec 64))

(declare-fun lt!270776 () (_ BitVec 64))

(assert (=> b!596215 (= res!382027 (or (not (= (select (arr!17767 a!2986) j!136) lt!270776)) (not (= (select (arr!17767 a!2986) j!136) lt!270772)) (bvsge j!136 index!984)))))

(declare-fun e!340644 () Bool)

(assert (=> b!596215 e!340644))

(declare-fun res!382018 () Bool)

(assert (=> b!596215 (=> (not res!382018) (not e!340644))))

(assert (=> b!596215 (= res!382018 (= lt!270772 (select (arr!17767 a!2986) j!136)))))

(assert (=> b!596215 (= lt!270772 (select (store (arr!17767 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!596216 () Bool)

(assert (=> b!596216 (= e!340636 (not e!340640))))

(declare-fun res!382016 () Bool)

(assert (=> b!596216 (=> res!382016 e!340640)))

(declare-fun lt!270781 () SeekEntryResult!6207)

(assert (=> b!596216 (= res!382016 (not (= lt!270781 (Found!6207 index!984))))))

(declare-datatypes ((Unit!18746 0))(
  ( (Unit!18747) )
))
(declare-fun lt!270771 () Unit!18746)

(declare-fun e!340643 () Unit!18746)

(assert (=> b!596216 (= lt!270771 e!340643)))

(declare-fun c!67463 () Bool)

(assert (=> b!596216 (= c!67463 (= lt!270781 Undefined!6207))))

(assert (=> b!596216 (= lt!270781 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!270776 lt!270780 mask!3053))))

(declare-fun e!340638 () Bool)

(assert (=> b!596216 e!340638))

(declare-fun res!382015 () Bool)

(assert (=> b!596216 (=> (not res!382015) (not e!340638))))

(declare-fun lt!270770 () (_ BitVec 32))

(declare-fun lt!270779 () SeekEntryResult!6207)

(assert (=> b!596216 (= res!382015 (= lt!270779 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!270770 vacantSpotIndex!68 lt!270776 lt!270780 mask!3053)))))

(assert (=> b!596216 (= lt!270779 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!270770 vacantSpotIndex!68 (select (arr!17767 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!596216 (= lt!270776 (select (store (arr!17767 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!270777 () Unit!18746)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37006 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18746)

(assert (=> b!596216 (= lt!270777 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!270770 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!596216 (= lt!270770 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun res!382031 () Bool)

(assert (=> start!54546 (=> (not res!382031) (not e!340647))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54546 (= res!382031 (validMask!0 mask!3053))))

(assert (=> start!54546 e!340647))

(assert (=> start!54546 true))

(declare-fun array_inv!13563 (array!37006) Bool)

(assert (=> start!54546 (array_inv!13563 a!2986)))

(declare-fun b!596207 () Bool)

(assert (=> b!596207 (= e!340638 (= lt!270775 lt!270779))))

(declare-fun b!596217 () Bool)

(assert (=> b!596217 (= e!340645 e!340641)))

(declare-fun res!382020 () Bool)

(assert (=> b!596217 (=> res!382020 e!340641)))

(assert (=> b!596217 (= res!382020 (or (bvsge (size!18131 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18131 a!2986))))))

(assert (=> b!596217 (arrayContainsKey!0 lt!270780 (select (arr!17767 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!270773 () Unit!18746)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37006 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18746)

(assert (=> b!596217 (= lt!270773 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!270780 (select (arr!17767 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!596218 () Bool)

(assert (=> b!596218 (= e!340647 e!340637)))

(declare-fun res!382034 () Bool)

(assert (=> b!596218 (=> (not res!382034) (not e!340637))))

(declare-fun lt!270774 () SeekEntryResult!6207)

(assert (=> b!596218 (= res!382034 (or (= lt!270774 (MissingZero!6207 i!1108)) (= lt!270774 (MissingVacant!6207 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37006 (_ BitVec 32)) SeekEntryResult!6207)

(assert (=> b!596218 (= lt!270774 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!596219 () Bool)

(declare-fun Unit!18748 () Unit!18746)

(assert (=> b!596219 (= e!340643 Unit!18748)))

(assert (=> b!596219 false))

(declare-fun b!596220 () Bool)

(declare-fun Unit!18749 () Unit!18746)

(assert (=> b!596220 (= e!340643 Unit!18749)))

(declare-fun b!596221 () Bool)

(declare-fun res!382033 () Bool)

(assert (=> b!596221 (=> (not res!382033) (not e!340647))))

(assert (=> b!596221 (= res!382033 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!596222 () Bool)

(declare-fun res!382032 () Bool)

(assert (=> b!596222 (=> res!382032 e!340641)))

(assert (=> b!596222 (= res!382032 (contains!2943 Nil!11805 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!596223 () Bool)

(assert (=> b!596223 (= e!340639 (arrayContainsKey!0 lt!270780 (select (arr!17767 a!2986) j!136) index!984))))

(declare-fun b!596224 () Bool)

(assert (=> b!596224 (= e!340641 true)))

(declare-fun lt!270778 () Bool)

(assert (=> b!596224 (= lt!270778 (contains!2943 Nil!11805 k0!1786))))

(declare-fun b!596225 () Bool)

(assert (=> b!596225 (= e!340637 e!340635)))

(declare-fun res!382017 () Bool)

(assert (=> b!596225 (=> (not res!382017) (not e!340635))))

(assert (=> b!596225 (= res!382017 (= (select (store (arr!17767 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!596225 (= lt!270780 (array!37007 (store (arr!17767 a!2986) i!1108 k0!1786) (size!18131 a!2986)))))

(declare-fun b!596226 () Bool)

(assert (=> b!596226 (= e!340644 e!340646)))

(declare-fun res!382029 () Bool)

(assert (=> b!596226 (=> res!382029 e!340646)))

(assert (=> b!596226 (= res!382029 (or (not (= (select (arr!17767 a!2986) j!136) lt!270776)) (not (= (select (arr!17767 a!2986) j!136) lt!270772)) (bvsge j!136 index!984)))))

(declare-fun b!596227 () Bool)

(declare-fun res!382025 () Bool)

(assert (=> b!596227 (=> (not res!382025) (not e!340647))))

(assert (=> b!596227 (= res!382025 (validKeyInArray!0 (select (arr!17767 a!2986) j!136)))))

(declare-fun b!596228 () Bool)

(declare-fun res!382014 () Bool)

(assert (=> b!596228 (=> res!382014 e!340641)))

(declare-fun noDuplicate!262 (List!11808) Bool)

(assert (=> b!596228 (= res!382014 (not (noDuplicate!262 Nil!11805)))))

(assert (= (and start!54546 res!382031) b!596211))

(assert (= (and b!596211 res!382023) b!596227))

(assert (= (and b!596227 res!382025) b!596209))

(assert (= (and b!596209 res!382022) b!596221))

(assert (= (and b!596221 res!382033) b!596218))

(assert (= (and b!596218 res!382034) b!596210))

(assert (= (and b!596210 res!382021) b!596214))

(assert (= (and b!596214 res!382019) b!596212))

(assert (= (and b!596212 res!382024) b!596225))

(assert (= (and b!596225 res!382017) b!596208))

(assert (= (and b!596208 res!382026) b!596216))

(assert (= (and b!596216 res!382015) b!596207))

(assert (= (and b!596216 c!67463) b!596219))

(assert (= (and b!596216 (not c!67463)) b!596220))

(assert (= (and b!596216 (not res!382016)) b!596215))

(assert (= (and b!596215 res!382018) b!596226))

(assert (= (and b!596226 (not res!382029)) b!596213))

(assert (= (and b!596213 res!382028) b!596223))

(assert (= (and b!596215 (not res!382027)) b!596217))

(assert (= (and b!596217 (not res!382020)) b!596228))

(assert (= (and b!596228 (not res!382014)) b!596222))

(assert (= (and b!596222 (not res!382032)) b!596206))

(assert (= (and b!596206 (not res!382030)) b!596224))

(declare-fun m!573735 () Bool)

(assert (=> b!596210 m!573735))

(declare-fun m!573737 () Bool)

(assert (=> b!596217 m!573737))

(assert (=> b!596217 m!573737))

(declare-fun m!573739 () Bool)

(assert (=> b!596217 m!573739))

(assert (=> b!596217 m!573737))

(declare-fun m!573741 () Bool)

(assert (=> b!596217 m!573741))

(declare-fun m!573743 () Bool)

(assert (=> b!596216 m!573743))

(declare-fun m!573745 () Bool)

(assert (=> b!596216 m!573745))

(assert (=> b!596216 m!573737))

(declare-fun m!573747 () Bool)

(assert (=> b!596216 m!573747))

(assert (=> b!596216 m!573737))

(declare-fun m!573749 () Bool)

(assert (=> b!596216 m!573749))

(declare-fun m!573751 () Bool)

(assert (=> b!596216 m!573751))

(declare-fun m!573753 () Bool)

(assert (=> b!596216 m!573753))

(declare-fun m!573755 () Bool)

(assert (=> b!596216 m!573755))

(assert (=> b!596225 m!573747))

(declare-fun m!573757 () Bool)

(assert (=> b!596225 m!573757))

(declare-fun m!573759 () Bool)

(assert (=> b!596208 m!573759))

(assert (=> b!596208 m!573737))

(assert (=> b!596208 m!573737))

(declare-fun m!573761 () Bool)

(assert (=> b!596208 m!573761))

(declare-fun m!573763 () Bool)

(assert (=> b!596209 m!573763))

(assert (=> b!596213 m!573737))

(assert (=> b!596213 m!573737))

(declare-fun m!573765 () Bool)

(assert (=> b!596213 m!573765))

(declare-fun m!573767 () Bool)

(assert (=> b!596221 m!573767))

(assert (=> b!596215 m!573737))

(assert (=> b!596215 m!573747))

(declare-fun m!573769 () Bool)

(assert (=> b!596215 m!573769))

(assert (=> b!596227 m!573737))

(assert (=> b!596227 m!573737))

(declare-fun m!573771 () Bool)

(assert (=> b!596227 m!573771))

(assert (=> b!596226 m!573737))

(assert (=> b!596223 m!573737))

(assert (=> b!596223 m!573737))

(declare-fun m!573773 () Bool)

(assert (=> b!596223 m!573773))

(declare-fun m!573775 () Bool)

(assert (=> b!596224 m!573775))

(declare-fun m!573777 () Bool)

(assert (=> b!596228 m!573777))

(declare-fun m!573779 () Bool)

(assert (=> b!596222 m!573779))

(declare-fun m!573781 () Bool)

(assert (=> b!596214 m!573781))

(declare-fun m!573783 () Bool)

(assert (=> b!596218 m!573783))

(declare-fun m!573785 () Bool)

(assert (=> b!596212 m!573785))

(declare-fun m!573787 () Bool)

(assert (=> b!596206 m!573787))

(declare-fun m!573789 () Bool)

(assert (=> start!54546 m!573789))

(declare-fun m!573791 () Bool)

(assert (=> start!54546 m!573791))

(check-sat (not b!596206) (not b!596227) (not b!596210) (not b!596218) (not b!596221) (not b!596216) (not b!596223) (not start!54546) (not b!596224) (not b!596213) (not b!596214) (not b!596208) (not b!596228) (not b!596222) (not b!596209) (not b!596217))
(check-sat)
