; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!55564 () Bool)

(assert start!55564)

(declare-fun b!608025 () Bool)

(declare-fun res!390769 () Bool)

(declare-fun e!348208 () Bool)

(assert (=> b!608025 (=> (not res!390769) (not e!348208))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!608025 (= res!390769 (validKeyInArray!0 k!1786))))

(declare-fun b!608026 () Bool)

(declare-datatypes ((Unit!19408 0))(
  ( (Unit!19409) )
))
(declare-fun e!348212 () Unit!19408)

(declare-fun Unit!19410 () Unit!19408)

(assert (=> b!608026 (= e!348212 Unit!19410)))

(declare-fun b!608027 () Bool)

(declare-fun e!348210 () Unit!19408)

(declare-fun Unit!19411 () Unit!19408)

(assert (=> b!608027 (= e!348210 Unit!19411)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!277703 () Unit!19408)

(declare-datatypes ((array!37295 0))(
  ( (array!37296 (arr!17898 (Array (_ BitVec 32) (_ BitVec 64))) (size!18262 (_ BitVec 32))) )
))
(declare-fun lt!277697 () array!37295)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun a!2986 () array!37295)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37295 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19408)

(assert (=> b!608027 (= lt!277703 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!277697 (select (arr!17898 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun arrayContainsKey!0 (array!37295 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!608027 (arrayContainsKey!0 lt!277697 (select (arr!17898 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun lt!277692 () Unit!19408)

(declare-datatypes ((List!11939 0))(
  ( (Nil!11936) (Cons!11935 (h!12980 (_ BitVec 64)) (t!18167 List!11939)) )
))
(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37295 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11939) Unit!19408)

(assert (=> b!608027 (= lt!277692 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11936))))

(declare-fun arrayNoDuplicates!0 (array!37295 (_ BitVec 32) List!11939) Bool)

(assert (=> b!608027 (arrayNoDuplicates!0 lt!277697 #b00000000000000000000000000000000 Nil!11936)))

(declare-fun lt!277698 () Unit!19408)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37295 (_ BitVec 32) (_ BitVec 32)) Unit!19408)

(assert (=> b!608027 (= lt!277698 (lemmaNoDuplicateFromThenFromBigger!0 lt!277697 #b00000000000000000000000000000000 j!136))))

(assert (=> b!608027 (arrayNoDuplicates!0 lt!277697 j!136 Nil!11936)))

(declare-fun lt!277705 () Unit!19408)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37295 (_ BitVec 64) (_ BitVec 32) List!11939) Unit!19408)

(assert (=> b!608027 (= lt!277705 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!277697 (select (arr!17898 a!2986) j!136) j!136 Nil!11936))))

(assert (=> b!608027 false))

(declare-fun b!608028 () Bool)

(declare-fun res!390773 () Bool)

(declare-fun e!348203 () Bool)

(assert (=> b!608028 (=> (not res!390773) (not e!348203))))

(assert (=> b!608028 (= res!390773 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11936))))

(declare-fun b!608029 () Bool)

(declare-fun res!390772 () Bool)

(declare-fun e!348205 () Bool)

(assert (=> b!608029 (=> res!390772 e!348205)))

(declare-fun noDuplicate!321 (List!11939) Bool)

(assert (=> b!608029 (= res!390772 (not (noDuplicate!321 Nil!11936)))))

(declare-fun b!608030 () Bool)

(declare-fun Unit!19412 () Unit!19408)

(assert (=> b!608030 (= e!348210 Unit!19412)))

(declare-fun b!608031 () Bool)

(declare-fun res!390764 () Bool)

(assert (=> b!608031 (=> (not res!390764) (not e!348208))))

(assert (=> b!608031 (= res!390764 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!608032 () Bool)

(declare-fun res!390779 () Bool)

(assert (=> b!608032 (=> (not res!390779) (not e!348203))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37295 (_ BitVec 32)) Bool)

(assert (=> b!608032 (= res!390779 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!608033 () Bool)

(assert (=> b!608033 (= e!348205 true)))

(declare-fun lt!277700 () Bool)

(declare-fun contains!3015 (List!11939 (_ BitVec 64)) Bool)

(assert (=> b!608033 (= lt!277700 (contains!3015 Nil!11936 k!1786))))

(declare-fun b!608034 () Bool)

(declare-fun e!348211 () Bool)

(declare-fun e!348204 () Bool)

(assert (=> b!608034 (= e!348211 (not e!348204))))

(declare-fun res!390774 () Bool)

(assert (=> b!608034 (=> res!390774 e!348204)))

(declare-datatypes ((SeekEntryResult!6338 0))(
  ( (MissingZero!6338 (index!27627 (_ BitVec 32))) (Found!6338 (index!27628 (_ BitVec 32))) (Intermediate!6338 (undefined!7150 Bool) (index!27629 (_ BitVec 32)) (x!56439 (_ BitVec 32))) (Undefined!6338) (MissingVacant!6338 (index!27630 (_ BitVec 32))) )
))
(declare-fun lt!277702 () SeekEntryResult!6338)

(assert (=> b!608034 (= res!390774 (not (= lt!277702 (Found!6338 index!984))))))

(declare-fun lt!277707 () Unit!19408)

(assert (=> b!608034 (= lt!277707 e!348212)))

(declare-fun c!69001 () Bool)

(assert (=> b!608034 (= c!69001 (= lt!277702 Undefined!6338))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun lt!277704 () (_ BitVec 64))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37295 (_ BitVec 32)) SeekEntryResult!6338)

(assert (=> b!608034 (= lt!277702 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!277704 lt!277697 mask!3053))))

(declare-fun e!348207 () Bool)

(assert (=> b!608034 e!348207))

(declare-fun res!390777 () Bool)

(assert (=> b!608034 (=> (not res!390777) (not e!348207))))

(declare-fun lt!277693 () (_ BitVec 32))

(declare-fun lt!277696 () SeekEntryResult!6338)

(assert (=> b!608034 (= res!390777 (= lt!277696 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!277693 vacantSpotIndex!68 lt!277704 lt!277697 mask!3053)))))

(assert (=> b!608034 (= lt!277696 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!277693 vacantSpotIndex!68 (select (arr!17898 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!608034 (= lt!277704 (select (store (arr!17898 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!277694 () Unit!19408)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37295 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19408)

(assert (=> b!608034 (= lt!277694 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!277693 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!608034 (= lt!277693 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!608035 () Bool)

(declare-fun Unit!19413 () Unit!19408)

(assert (=> b!608035 (= e!348212 Unit!19413)))

(assert (=> b!608035 false))

(declare-fun b!608036 () Bool)

(declare-fun res!390768 () Bool)

(assert (=> b!608036 (=> res!390768 e!348205)))

(assert (=> b!608036 (= res!390768 (contains!3015 Nil!11936 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!608037 () Bool)

(declare-fun e!348206 () Bool)

(assert (=> b!608037 (= e!348206 e!348205)))

(declare-fun res!390759 () Bool)

(assert (=> b!608037 (=> res!390759 e!348205)))

(assert (=> b!608037 (= res!390759 (or (bvsge (size!18262 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18262 a!2986))))))

(assert (=> b!608037 (arrayContainsKey!0 lt!277697 (select (arr!17898 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!277699 () Unit!19408)

(assert (=> b!608037 (= lt!277699 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!277697 (select (arr!17898 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!348213 () Bool)

(assert (=> b!608037 e!348213))

(declare-fun res!390762 () Bool)

(assert (=> b!608037 (=> (not res!390762) (not e!348213))))

(assert (=> b!608037 (= res!390762 (arrayContainsKey!0 lt!277697 (select (arr!17898 a!2986) j!136) j!136))))

(declare-fun b!608038 () Bool)

(declare-fun e!348201 () Bool)

(assert (=> b!608038 (= e!348201 e!348206)))

(declare-fun res!390778 () Bool)

(assert (=> b!608038 (=> res!390778 e!348206)))

(assert (=> b!608038 (= res!390778 (bvsge index!984 j!136))))

(declare-fun lt!277708 () Unit!19408)

(assert (=> b!608038 (= lt!277708 e!348210)))

(declare-fun c!69002 () Bool)

(assert (=> b!608038 (= c!69002 (bvslt j!136 index!984))))

(declare-fun b!608039 () Bool)

(declare-fun e!348202 () Bool)

(assert (=> b!608039 (= e!348202 (arrayContainsKey!0 lt!277697 (select (arr!17898 a!2986) j!136) index!984))))

(declare-fun b!608040 () Bool)

(declare-fun lt!277695 () SeekEntryResult!6338)

(assert (=> b!608040 (= e!348207 (= lt!277695 lt!277696))))

(declare-fun b!608041 () Bool)

(declare-fun e!348198 () Bool)

(assert (=> b!608041 (= e!348198 e!348202)))

(declare-fun res!390758 () Bool)

(assert (=> b!608041 (=> (not res!390758) (not e!348202))))

(assert (=> b!608041 (= res!390758 (arrayContainsKey!0 lt!277697 (select (arr!17898 a!2986) j!136) j!136))))

(declare-fun b!608042 () Bool)

(assert (=> b!608042 (= e!348204 e!348201)))

(declare-fun res!390776 () Bool)

(assert (=> b!608042 (=> res!390776 e!348201)))

(declare-fun lt!277701 () (_ BitVec 64))

(assert (=> b!608042 (= res!390776 (or (not (= (select (arr!17898 a!2986) j!136) lt!277704)) (not (= (select (arr!17898 a!2986) j!136) lt!277701))))))

(declare-fun e!348209 () Bool)

(assert (=> b!608042 e!348209))

(declare-fun res!390766 () Bool)

(assert (=> b!608042 (=> (not res!390766) (not e!348209))))

(assert (=> b!608042 (= res!390766 (= lt!277701 (select (arr!17898 a!2986) j!136)))))

(assert (=> b!608042 (= lt!277701 (select (store (arr!17898 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!608043 () Bool)

(declare-fun e!348199 () Bool)

(assert (=> b!608043 (= e!348199 e!348211)))

(declare-fun res!390757 () Bool)

(assert (=> b!608043 (=> (not res!390757) (not e!348211))))

(assert (=> b!608043 (= res!390757 (and (= lt!277695 (Found!6338 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17898 a!2986) index!984) (select (arr!17898 a!2986) j!136))) (not (= (select (arr!17898 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!608043 (= lt!277695 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17898 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!608044 () Bool)

(assert (=> b!608044 (= e!348208 e!348203)))

(declare-fun res!390761 () Bool)

(assert (=> b!608044 (=> (not res!390761) (not e!348203))))

(declare-fun lt!277706 () SeekEntryResult!6338)

(assert (=> b!608044 (= res!390761 (or (= lt!277706 (MissingZero!6338 i!1108)) (= lt!277706 (MissingVacant!6338 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37295 (_ BitVec 32)) SeekEntryResult!6338)

(assert (=> b!608044 (= lt!277706 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!608045 () Bool)

(assert (=> b!608045 (= e!348213 (arrayContainsKey!0 lt!277697 (select (arr!17898 a!2986) j!136) index!984))))

(declare-fun b!608046 () Bool)

(declare-fun res!390771 () Bool)

(assert (=> b!608046 (=> (not res!390771) (not e!348203))))

(assert (=> b!608046 (= res!390771 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17898 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!608047 () Bool)

(declare-fun res!390765 () Bool)

(assert (=> b!608047 (=> (not res!390765) (not e!348208))))

(assert (=> b!608047 (= res!390765 (and (= (size!18262 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18262 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18262 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!608048 () Bool)

(declare-fun res!390760 () Bool)

(assert (=> b!608048 (=> res!390760 e!348205)))

(assert (=> b!608048 (= res!390760 (contains!3015 Nil!11936 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!608049 () Bool)

(assert (=> b!608049 (= e!348209 e!348198)))

(declare-fun res!390763 () Bool)

(assert (=> b!608049 (=> res!390763 e!348198)))

(assert (=> b!608049 (= res!390763 (or (not (= (select (arr!17898 a!2986) j!136) lt!277704)) (not (= (select (arr!17898 a!2986) j!136) lt!277701)) (bvsge j!136 index!984)))))

(declare-fun res!390770 () Bool)

(assert (=> start!55564 (=> (not res!390770) (not e!348208))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55564 (= res!390770 (validMask!0 mask!3053))))

(assert (=> start!55564 e!348208))

(assert (=> start!55564 true))

(declare-fun array_inv!13694 (array!37295) Bool)

(assert (=> start!55564 (array_inv!13694 a!2986)))

(declare-fun b!608050 () Bool)

(assert (=> b!608050 (= e!348203 e!348199)))

(declare-fun res!390767 () Bool)

(assert (=> b!608050 (=> (not res!390767) (not e!348199))))

(assert (=> b!608050 (= res!390767 (= (select (store (arr!17898 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!608050 (= lt!277697 (array!37296 (store (arr!17898 a!2986) i!1108 k!1786) (size!18262 a!2986)))))

(declare-fun b!608051 () Bool)

(declare-fun res!390775 () Bool)

(assert (=> b!608051 (=> (not res!390775) (not e!348208))))

(assert (=> b!608051 (= res!390775 (validKeyInArray!0 (select (arr!17898 a!2986) j!136)))))

(assert (= (and start!55564 res!390770) b!608047))

(assert (= (and b!608047 res!390765) b!608051))

(assert (= (and b!608051 res!390775) b!608025))

(assert (= (and b!608025 res!390769) b!608031))

(assert (= (and b!608031 res!390764) b!608044))

(assert (= (and b!608044 res!390761) b!608032))

(assert (= (and b!608032 res!390779) b!608028))

(assert (= (and b!608028 res!390773) b!608046))

(assert (= (and b!608046 res!390771) b!608050))

(assert (= (and b!608050 res!390767) b!608043))

(assert (= (and b!608043 res!390757) b!608034))

(assert (= (and b!608034 res!390777) b!608040))

(assert (= (and b!608034 c!69001) b!608035))

(assert (= (and b!608034 (not c!69001)) b!608026))

(assert (= (and b!608034 (not res!390774)) b!608042))

(assert (= (and b!608042 res!390766) b!608049))

(assert (= (and b!608049 (not res!390763)) b!608041))

(assert (= (and b!608041 res!390758) b!608039))

(assert (= (and b!608042 (not res!390776)) b!608038))

(assert (= (and b!608038 c!69002) b!608027))

(assert (= (and b!608038 (not c!69002)) b!608030))

(assert (= (and b!608038 (not res!390778)) b!608037))

(assert (= (and b!608037 res!390762) b!608045))

(assert (= (and b!608037 (not res!390759)) b!608029))

(assert (= (and b!608029 (not res!390772)) b!608036))

(assert (= (and b!608036 (not res!390768)) b!608048))

(assert (= (and b!608048 (not res!390760)) b!608033))

(declare-fun m!584699 () Bool)

(assert (=> b!608034 m!584699))

(declare-fun m!584701 () Bool)

(assert (=> b!608034 m!584701))

(declare-fun m!584703 () Bool)

(assert (=> b!608034 m!584703))

(declare-fun m!584705 () Bool)

(assert (=> b!608034 m!584705))

(declare-fun m!584707 () Bool)

(assert (=> b!608034 m!584707))

(declare-fun m!584709 () Bool)

(assert (=> b!608034 m!584709))

(declare-fun m!584711 () Bool)

(assert (=> b!608034 m!584711))

(assert (=> b!608034 m!584703))

(declare-fun m!584713 () Bool)

(assert (=> b!608034 m!584713))

(assert (=> b!608049 m!584703))

(declare-fun m!584715 () Bool)

(assert (=> b!608032 m!584715))

(declare-fun m!584717 () Bool)

(assert (=> b!608036 m!584717))

(assert (=> b!608027 m!584703))

(declare-fun m!584719 () Bool)

(assert (=> b!608027 m!584719))

(assert (=> b!608027 m!584703))

(declare-fun m!584721 () Bool)

(assert (=> b!608027 m!584721))

(assert (=> b!608027 m!584703))

(declare-fun m!584723 () Bool)

(assert (=> b!608027 m!584723))

(assert (=> b!608027 m!584703))

(declare-fun m!584725 () Bool)

(assert (=> b!608027 m!584725))

(declare-fun m!584727 () Bool)

(assert (=> b!608027 m!584727))

(declare-fun m!584729 () Bool)

(assert (=> b!608027 m!584729))

(declare-fun m!584731 () Bool)

(assert (=> b!608027 m!584731))

(assert (=> b!608050 m!584711))

(declare-fun m!584733 () Bool)

(assert (=> b!608050 m!584733))

(assert (=> b!608041 m!584703))

(assert (=> b!608041 m!584703))

(declare-fun m!584735 () Bool)

(assert (=> b!608041 m!584735))

(assert (=> b!608042 m!584703))

(assert (=> b!608042 m!584711))

(declare-fun m!584737 () Bool)

(assert (=> b!608042 m!584737))

(declare-fun m!584739 () Bool)

(assert (=> b!608043 m!584739))

(assert (=> b!608043 m!584703))

(assert (=> b!608043 m!584703))

(declare-fun m!584741 () Bool)

(assert (=> b!608043 m!584741))

(declare-fun m!584743 () Bool)

(assert (=> b!608029 m!584743))

(declare-fun m!584745 () Bool)

(assert (=> b!608031 m!584745))

(declare-fun m!584747 () Bool)

(assert (=> b!608046 m!584747))

(declare-fun m!584749 () Bool)

(assert (=> b!608048 m!584749))

(declare-fun m!584751 () Bool)

(assert (=> b!608028 m!584751))

(declare-fun m!584753 () Bool)

(assert (=> start!55564 m!584753))

(declare-fun m!584755 () Bool)

(assert (=> start!55564 m!584755))

(assert (=> b!608051 m!584703))

(assert (=> b!608051 m!584703))

(declare-fun m!584757 () Bool)

(assert (=> b!608051 m!584757))

(assert (=> b!608037 m!584703))

(assert (=> b!608037 m!584703))

(declare-fun m!584759 () Bool)

(assert (=> b!608037 m!584759))

(assert (=> b!608037 m!584703))

(declare-fun m!584761 () Bool)

(assert (=> b!608037 m!584761))

(assert (=> b!608037 m!584703))

(assert (=> b!608037 m!584735))

(declare-fun m!584763 () Bool)

(assert (=> b!608025 m!584763))

(assert (=> b!608045 m!584703))

(assert (=> b!608045 m!584703))

(declare-fun m!584765 () Bool)

(assert (=> b!608045 m!584765))

(declare-fun m!584767 () Bool)

(assert (=> b!608044 m!584767))

(declare-fun m!584769 () Bool)

(assert (=> b!608033 m!584769))

(assert (=> b!608039 m!584703))

(assert (=> b!608039 m!584703))

(assert (=> b!608039 m!584765))

(push 1)

