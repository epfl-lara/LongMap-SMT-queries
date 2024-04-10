; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56836 () Bool)

(assert start!56836)

(declare-fun b!629618 () Bool)

(declare-fun res!407021 () Bool)

(declare-fun e!360047 () Bool)

(assert (=> b!629618 (=> (not res!407021) (not e!360047))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!629618 (= res!407021 (validKeyInArray!0 k0!1786))))

(declare-fun res!407020 () Bool)

(assert (=> start!56836 (=> (not res!407020) (not e!360047))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56836 (= res!407020 (validMask!0 mask!3053))))

(assert (=> start!56836 e!360047))

(assert (=> start!56836 true))

(declare-datatypes ((array!38026 0))(
  ( (array!38027 (arr!18250 (Array (_ BitVec 32) (_ BitVec 64))) (size!18614 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38026)

(declare-fun array_inv!14046 (array!38026) Bool)

(assert (=> start!56836 (array_inv!14046 a!2986)))

(declare-fun b!629619 () Bool)

(declare-fun e!360048 () Bool)

(assert (=> b!629619 (= e!360047 e!360048)))

(declare-fun res!407014 () Bool)

(assert (=> b!629619 (=> (not res!407014) (not e!360048))))

(declare-datatypes ((SeekEntryResult!6690 0))(
  ( (MissingZero!6690 (index!29044 (_ BitVec 32))) (Found!6690 (index!29045 (_ BitVec 32))) (Intermediate!6690 (undefined!7502 Bool) (index!29046 (_ BitVec 32)) (x!57778 (_ BitVec 32))) (Undefined!6690) (MissingVacant!6690 (index!29047 (_ BitVec 32))) )
))
(declare-fun lt!290813 () SeekEntryResult!6690)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!629619 (= res!407014 (or (= lt!290813 (MissingZero!6690 i!1108)) (= lt!290813 (MissingVacant!6690 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38026 (_ BitVec 32)) SeekEntryResult!6690)

(assert (=> b!629619 (= lt!290813 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!629620 () Bool)

(declare-fun res!407019 () Bool)

(assert (=> b!629620 (=> (not res!407019) (not e!360047))))

(declare-fun arrayContainsKey!0 (array!38026 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!629620 (= res!407019 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!629621 () Bool)

(declare-fun res!407016 () Bool)

(assert (=> b!629621 (=> (not res!407016) (not e!360047))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!629621 (= res!407016 (and (= (size!18614 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18614 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18614 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!629622 () Bool)

(declare-fun e!360046 () Bool)

(declare-fun lt!290811 () SeekEntryResult!6690)

(declare-fun lt!290815 () SeekEntryResult!6690)

(assert (=> b!629622 (= e!360046 (not (= lt!290811 lt!290815)))))

(declare-fun lt!290812 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38026 (_ BitVec 32)) SeekEntryResult!6690)

(assert (=> b!629622 (= lt!290815 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!290812 vacantSpotIndex!68 (select (store (arr!18250 a!2986) i!1108 k0!1786) j!136) (array!38027 (store (arr!18250 a!2986) i!1108 k0!1786) (size!18614 a!2986)) mask!3053))))

(assert (=> b!629622 (= lt!290815 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!290812 vacantSpotIndex!68 (select (arr!18250 a!2986) j!136) a!2986 mask!3053))))

(declare-datatypes ((Unit!21122 0))(
  ( (Unit!21123) )
))
(declare-fun lt!290814 () Unit!21122)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38026 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21122)

(assert (=> b!629622 (= lt!290814 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!290812 vacantSpotIndex!68 mask!3053))))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!629622 (= lt!290812 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!629623 () Bool)

(declare-fun res!407012 () Bool)

(assert (=> b!629623 (=> (not res!407012) (not e!360048))))

(assert (=> b!629623 (= res!407012 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18250 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18250 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!629624 () Bool)

(declare-fun res!407017 () Bool)

(assert (=> b!629624 (=> (not res!407017) (not e!360048))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38026 (_ BitVec 32)) Bool)

(assert (=> b!629624 (= res!407017 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!629625 () Bool)

(declare-fun res!407015 () Bool)

(assert (=> b!629625 (=> (not res!407015) (not e!360048))))

(declare-datatypes ((List!12291 0))(
  ( (Nil!12288) (Cons!12287 (h!13332 (_ BitVec 64)) (t!18519 List!12291)) )
))
(declare-fun arrayNoDuplicates!0 (array!38026 (_ BitVec 32) List!12291) Bool)

(assert (=> b!629625 (= res!407015 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12288))))

(declare-fun b!629626 () Bool)

(assert (=> b!629626 (= e!360048 e!360046)))

(declare-fun res!407018 () Bool)

(assert (=> b!629626 (=> (not res!407018) (not e!360046))))

(assert (=> b!629626 (= res!407018 (and (= lt!290811 (Found!6690 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18250 a!2986) index!984) (select (arr!18250 a!2986) j!136))) (not (= (select (arr!18250 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!629626 (= lt!290811 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18250 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!629627 () Bool)

(declare-fun res!407013 () Bool)

(assert (=> b!629627 (=> (not res!407013) (not e!360047))))

(assert (=> b!629627 (= res!407013 (validKeyInArray!0 (select (arr!18250 a!2986) j!136)))))

(assert (= (and start!56836 res!407020) b!629621))

(assert (= (and b!629621 res!407016) b!629627))

(assert (= (and b!629627 res!407013) b!629618))

(assert (= (and b!629618 res!407021) b!629620))

(assert (= (and b!629620 res!407019) b!629619))

(assert (= (and b!629619 res!407014) b!629624))

(assert (= (and b!629624 res!407017) b!629625))

(assert (= (and b!629625 res!407015) b!629623))

(assert (= (and b!629623 res!407012) b!629626))

(assert (= (and b!629626 res!407018) b!629622))

(declare-fun m!604655 () Bool)

(assert (=> b!629626 m!604655))

(declare-fun m!604657 () Bool)

(assert (=> b!629626 m!604657))

(assert (=> b!629626 m!604657))

(declare-fun m!604659 () Bool)

(assert (=> b!629626 m!604659))

(declare-fun m!604661 () Bool)

(assert (=> start!56836 m!604661))

(declare-fun m!604663 () Bool)

(assert (=> start!56836 m!604663))

(declare-fun m!604665 () Bool)

(assert (=> b!629623 m!604665))

(declare-fun m!604667 () Bool)

(assert (=> b!629623 m!604667))

(declare-fun m!604669 () Bool)

(assert (=> b!629623 m!604669))

(declare-fun m!604671 () Bool)

(assert (=> b!629618 m!604671))

(declare-fun m!604673 () Bool)

(assert (=> b!629619 m!604673))

(assert (=> b!629627 m!604657))

(assert (=> b!629627 m!604657))

(declare-fun m!604675 () Bool)

(assert (=> b!629627 m!604675))

(declare-fun m!604677 () Bool)

(assert (=> b!629622 m!604677))

(declare-fun m!604679 () Bool)

(assert (=> b!629622 m!604679))

(assert (=> b!629622 m!604657))

(assert (=> b!629622 m!604667))

(declare-fun m!604681 () Bool)

(assert (=> b!629622 m!604681))

(declare-fun m!604683 () Bool)

(assert (=> b!629622 m!604683))

(assert (=> b!629622 m!604657))

(declare-fun m!604685 () Bool)

(assert (=> b!629622 m!604685))

(assert (=> b!629622 m!604681))

(declare-fun m!604687 () Bool)

(assert (=> b!629624 m!604687))

(declare-fun m!604689 () Bool)

(assert (=> b!629620 m!604689))

(declare-fun m!604691 () Bool)

(assert (=> b!629625 m!604691))

(check-sat (not b!629624) (not b!629627) (not b!629622) (not b!629625) (not b!629618) (not b!629620) (not b!629626) (not start!56836) (not b!629619))
(check-sat)
(get-model)

(declare-fun d!89131 () Bool)

(declare-fun lt!290838 () SeekEntryResult!6690)

(get-info :version)

(assert (=> d!89131 (and (or ((_ is Undefined!6690) lt!290838) (not ((_ is Found!6690) lt!290838)) (and (bvsge (index!29045 lt!290838) #b00000000000000000000000000000000) (bvslt (index!29045 lt!290838) (size!18614 a!2986)))) (or ((_ is Undefined!6690) lt!290838) ((_ is Found!6690) lt!290838) (not ((_ is MissingZero!6690) lt!290838)) (and (bvsge (index!29044 lt!290838) #b00000000000000000000000000000000) (bvslt (index!29044 lt!290838) (size!18614 a!2986)))) (or ((_ is Undefined!6690) lt!290838) ((_ is Found!6690) lt!290838) ((_ is MissingZero!6690) lt!290838) (not ((_ is MissingVacant!6690) lt!290838)) (and (bvsge (index!29047 lt!290838) #b00000000000000000000000000000000) (bvslt (index!29047 lt!290838) (size!18614 a!2986)))) (or ((_ is Undefined!6690) lt!290838) (ite ((_ is Found!6690) lt!290838) (= (select (arr!18250 a!2986) (index!29045 lt!290838)) k0!1786) (ite ((_ is MissingZero!6690) lt!290838) (= (select (arr!18250 a!2986) (index!29044 lt!290838)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!6690) lt!290838) (= (select (arr!18250 a!2986) (index!29047 lt!290838)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!360067 () SeekEntryResult!6690)

(assert (=> d!89131 (= lt!290838 e!360067)))

(declare-fun c!71676 () Bool)

(declare-fun lt!290839 () SeekEntryResult!6690)

(assert (=> d!89131 (= c!71676 (and ((_ is Intermediate!6690) lt!290839) (undefined!7502 lt!290839)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38026 (_ BitVec 32)) SeekEntryResult!6690)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!89131 (= lt!290839 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!89131 (validMask!0 mask!3053)))

(assert (=> d!89131 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!290838)))

(declare-fun e!360068 () SeekEntryResult!6690)

(declare-fun b!629670 () Bool)

(assert (=> b!629670 (= e!360068 (seekKeyOrZeroReturnVacant!0 (x!57778 lt!290839) (index!29046 lt!290839) (index!29046 lt!290839) k0!1786 a!2986 mask!3053))))

(declare-fun b!629671 () Bool)

(declare-fun c!71677 () Bool)

(declare-fun lt!290837 () (_ BitVec 64))

(assert (=> b!629671 (= c!71677 (= lt!290837 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!360069 () SeekEntryResult!6690)

(assert (=> b!629671 (= e!360069 e!360068)))

(declare-fun b!629672 () Bool)

(assert (=> b!629672 (= e!360067 Undefined!6690)))

(declare-fun b!629673 () Bool)

(assert (=> b!629673 (= e!360069 (Found!6690 (index!29046 lt!290839)))))

(declare-fun b!629674 () Bool)

(assert (=> b!629674 (= e!360067 e!360069)))

(assert (=> b!629674 (= lt!290837 (select (arr!18250 a!2986) (index!29046 lt!290839)))))

(declare-fun c!71678 () Bool)

(assert (=> b!629674 (= c!71678 (= lt!290837 k0!1786))))

(declare-fun b!629675 () Bool)

(assert (=> b!629675 (= e!360068 (MissingZero!6690 (index!29046 lt!290839)))))

(assert (= (and d!89131 c!71676) b!629672))

(assert (= (and d!89131 (not c!71676)) b!629674))

(assert (= (and b!629674 c!71678) b!629673))

(assert (= (and b!629674 (not c!71678)) b!629671))

(assert (= (and b!629671 c!71677) b!629675))

(assert (= (and b!629671 (not c!71677)) b!629670))

(declare-fun m!604731 () Bool)

(assert (=> d!89131 m!604731))

(declare-fun m!604733 () Bool)

(assert (=> d!89131 m!604733))

(declare-fun m!604735 () Bool)

(assert (=> d!89131 m!604735))

(assert (=> d!89131 m!604733))

(declare-fun m!604737 () Bool)

(assert (=> d!89131 m!604737))

(assert (=> d!89131 m!604661))

(declare-fun m!604739 () Bool)

(assert (=> d!89131 m!604739))

(declare-fun m!604741 () Bool)

(assert (=> b!629670 m!604741))

(declare-fun m!604743 () Bool)

(assert (=> b!629674 m!604743))

(assert (=> b!629619 d!89131))

(declare-fun b!629684 () Bool)

(declare-fun e!360078 () Bool)

(declare-fun e!360076 () Bool)

(assert (=> b!629684 (= e!360078 e!360076)))

(declare-fun lt!290847 () (_ BitVec 64))

(assert (=> b!629684 (= lt!290847 (select (arr!18250 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!290846 () Unit!21122)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38026 (_ BitVec 64) (_ BitVec 32)) Unit!21122)

(assert (=> b!629684 (= lt!290846 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!290847 #b00000000000000000000000000000000))))

(assert (=> b!629684 (arrayContainsKey!0 a!2986 lt!290847 #b00000000000000000000000000000000)))

(declare-fun lt!290848 () Unit!21122)

(assert (=> b!629684 (= lt!290848 lt!290846)))

(declare-fun res!407057 () Bool)

(assert (=> b!629684 (= res!407057 (= (seekEntryOrOpen!0 (select (arr!18250 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6690 #b00000000000000000000000000000000)))))

(assert (=> b!629684 (=> (not res!407057) (not e!360076))))

(declare-fun bm!33290 () Bool)

(declare-fun call!33293 () Bool)

(assert (=> bm!33290 (= call!33293 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!629685 () Bool)

(assert (=> b!629685 (= e!360076 call!33293)))

(declare-fun b!629686 () Bool)

(assert (=> b!629686 (= e!360078 call!33293)))

(declare-fun d!89133 () Bool)

(declare-fun res!407056 () Bool)

(declare-fun e!360077 () Bool)

(assert (=> d!89133 (=> res!407056 e!360077)))

(assert (=> d!89133 (= res!407056 (bvsge #b00000000000000000000000000000000 (size!18614 a!2986)))))

(assert (=> d!89133 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!360077)))

(declare-fun b!629687 () Bool)

(assert (=> b!629687 (= e!360077 e!360078)))

(declare-fun c!71681 () Bool)

(assert (=> b!629687 (= c!71681 (validKeyInArray!0 (select (arr!18250 a!2986) #b00000000000000000000000000000000)))))

(assert (= (and d!89133 (not res!407056)) b!629687))

(assert (= (and b!629687 c!71681) b!629684))

(assert (= (and b!629687 (not c!71681)) b!629686))

(assert (= (and b!629684 res!407057) b!629685))

(assert (= (or b!629685 b!629686) bm!33290))

(declare-fun m!604745 () Bool)

(assert (=> b!629684 m!604745))

(declare-fun m!604747 () Bool)

(assert (=> b!629684 m!604747))

(declare-fun m!604749 () Bool)

(assert (=> b!629684 m!604749))

(assert (=> b!629684 m!604745))

(declare-fun m!604751 () Bool)

(assert (=> b!629684 m!604751))

(declare-fun m!604753 () Bool)

(assert (=> bm!33290 m!604753))

(assert (=> b!629687 m!604745))

(assert (=> b!629687 m!604745))

(declare-fun m!604755 () Bool)

(assert (=> b!629687 m!604755))

(assert (=> b!629624 d!89133))

(declare-fun d!89137 () Bool)

(assert (=> d!89137 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!629618 d!89137))

(declare-fun d!89139 () Bool)

(assert (=> d!89139 (= (validKeyInArray!0 (select (arr!18250 a!2986) j!136)) (and (not (= (select (arr!18250 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18250 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!629627 d!89139))

(declare-fun lt!290862 () SeekEntryResult!6690)

(declare-fun d!89141 () Bool)

(assert (=> d!89141 (and (or ((_ is Undefined!6690) lt!290862) (not ((_ is Found!6690) lt!290862)) (and (bvsge (index!29045 lt!290862) #b00000000000000000000000000000000) (bvslt (index!29045 lt!290862) (size!18614 (array!38027 (store (arr!18250 a!2986) i!1108 k0!1786) (size!18614 a!2986)))))) (or ((_ is Undefined!6690) lt!290862) ((_ is Found!6690) lt!290862) (not ((_ is MissingVacant!6690) lt!290862)) (not (= (index!29047 lt!290862) vacantSpotIndex!68)) (and (bvsge (index!29047 lt!290862) #b00000000000000000000000000000000) (bvslt (index!29047 lt!290862) (size!18614 (array!38027 (store (arr!18250 a!2986) i!1108 k0!1786) (size!18614 a!2986)))))) (or ((_ is Undefined!6690) lt!290862) (ite ((_ is Found!6690) lt!290862) (= (select (arr!18250 (array!38027 (store (arr!18250 a!2986) i!1108 k0!1786) (size!18614 a!2986))) (index!29045 lt!290862)) (select (store (arr!18250 a!2986) i!1108 k0!1786) j!136)) (and ((_ is MissingVacant!6690) lt!290862) (= (index!29047 lt!290862) vacantSpotIndex!68) (= (select (arr!18250 (array!38027 (store (arr!18250 a!2986) i!1108 k0!1786) (size!18614 a!2986))) (index!29047 lt!290862)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!360104 () SeekEntryResult!6690)

(assert (=> d!89141 (= lt!290862 e!360104)))

(declare-fun c!71700 () Bool)

(assert (=> d!89141 (= c!71700 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(declare-fun lt!290861 () (_ BitVec 64))

(assert (=> d!89141 (= lt!290861 (select (arr!18250 (array!38027 (store (arr!18250 a!2986) i!1108 k0!1786) (size!18614 a!2986))) lt!290812))))

(assert (=> d!89141 (validMask!0 mask!3053)))

(assert (=> d!89141 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!290812 vacantSpotIndex!68 (select (store (arr!18250 a!2986) i!1108 k0!1786) j!136) (array!38027 (store (arr!18250 a!2986) i!1108 k0!1786) (size!18614 a!2986)) mask!3053) lt!290862)))

(declare-fun b!629730 () Bool)

(assert (=> b!629730 (= e!360104 Undefined!6690)))

(declare-fun b!629731 () Bool)

(declare-fun e!360105 () SeekEntryResult!6690)

(assert (=> b!629731 (= e!360105 (Found!6690 lt!290812))))

(declare-fun b!629732 () Bool)

(declare-fun e!360103 () SeekEntryResult!6690)

(assert (=> b!629732 (= e!360103 (MissingVacant!6690 vacantSpotIndex!68))))

(declare-fun b!629733 () Bool)

(assert (=> b!629733 (= e!360103 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!290812 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 (select (store (arr!18250 a!2986) i!1108 k0!1786) j!136) (array!38027 (store (arr!18250 a!2986) i!1108 k0!1786) (size!18614 a!2986)) mask!3053))))

(declare-fun b!629734 () Bool)

(assert (=> b!629734 (= e!360104 e!360105)))

(declare-fun c!71701 () Bool)

(assert (=> b!629734 (= c!71701 (= lt!290861 (select (store (arr!18250 a!2986) i!1108 k0!1786) j!136)))))

(declare-fun b!629735 () Bool)

(declare-fun c!71702 () Bool)

(assert (=> b!629735 (= c!71702 (= lt!290861 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!629735 (= e!360105 e!360103)))

(assert (= (and d!89141 c!71700) b!629730))

(assert (= (and d!89141 (not c!71700)) b!629734))

(assert (= (and b!629734 c!71701) b!629731))

(assert (= (and b!629734 (not c!71701)) b!629735))

(assert (= (and b!629735 c!71702) b!629732))

(assert (= (and b!629735 (not c!71702)) b!629733))

(declare-fun m!604779 () Bool)

(assert (=> d!89141 m!604779))

(declare-fun m!604781 () Bool)

(assert (=> d!89141 m!604781))

(declare-fun m!604783 () Bool)

(assert (=> d!89141 m!604783))

(assert (=> d!89141 m!604661))

(declare-fun m!604785 () Bool)

(assert (=> b!629733 m!604785))

(assert (=> b!629733 m!604785))

(assert (=> b!629733 m!604681))

(declare-fun m!604787 () Bool)

(assert (=> b!629733 m!604787))

(assert (=> b!629622 d!89141))

(declare-fun lt!290864 () SeekEntryResult!6690)

(declare-fun d!89151 () Bool)

(assert (=> d!89151 (and (or ((_ is Undefined!6690) lt!290864) (not ((_ is Found!6690) lt!290864)) (and (bvsge (index!29045 lt!290864) #b00000000000000000000000000000000) (bvslt (index!29045 lt!290864) (size!18614 a!2986)))) (or ((_ is Undefined!6690) lt!290864) ((_ is Found!6690) lt!290864) (not ((_ is MissingVacant!6690) lt!290864)) (not (= (index!29047 lt!290864) vacantSpotIndex!68)) (and (bvsge (index!29047 lt!290864) #b00000000000000000000000000000000) (bvslt (index!29047 lt!290864) (size!18614 a!2986)))) (or ((_ is Undefined!6690) lt!290864) (ite ((_ is Found!6690) lt!290864) (= (select (arr!18250 a!2986) (index!29045 lt!290864)) (select (arr!18250 a!2986) j!136)) (and ((_ is MissingVacant!6690) lt!290864) (= (index!29047 lt!290864) vacantSpotIndex!68) (= (select (arr!18250 a!2986) (index!29047 lt!290864)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!360107 () SeekEntryResult!6690)

(assert (=> d!89151 (= lt!290864 e!360107)))

(declare-fun c!71703 () Bool)

(assert (=> d!89151 (= c!71703 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(declare-fun lt!290863 () (_ BitVec 64))

(assert (=> d!89151 (= lt!290863 (select (arr!18250 a!2986) lt!290812))))

(assert (=> d!89151 (validMask!0 mask!3053)))

(assert (=> d!89151 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!290812 vacantSpotIndex!68 (select (arr!18250 a!2986) j!136) a!2986 mask!3053) lt!290864)))

(declare-fun b!629736 () Bool)

(assert (=> b!629736 (= e!360107 Undefined!6690)))

(declare-fun b!629737 () Bool)

(declare-fun e!360108 () SeekEntryResult!6690)

(assert (=> b!629737 (= e!360108 (Found!6690 lt!290812))))

(declare-fun b!629738 () Bool)

(declare-fun e!360106 () SeekEntryResult!6690)

(assert (=> b!629738 (= e!360106 (MissingVacant!6690 vacantSpotIndex!68))))

(declare-fun b!629739 () Bool)

(assert (=> b!629739 (= e!360106 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!290812 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 (select (arr!18250 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!629740 () Bool)

(assert (=> b!629740 (= e!360107 e!360108)))

(declare-fun c!71704 () Bool)

(assert (=> b!629740 (= c!71704 (= lt!290863 (select (arr!18250 a!2986) j!136)))))

(declare-fun b!629741 () Bool)

(declare-fun c!71705 () Bool)

(assert (=> b!629741 (= c!71705 (= lt!290863 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!629741 (= e!360108 e!360106)))

(assert (= (and d!89151 c!71703) b!629736))

(assert (= (and d!89151 (not c!71703)) b!629740))

(assert (= (and b!629740 c!71704) b!629737))

(assert (= (and b!629740 (not c!71704)) b!629741))

(assert (= (and b!629741 c!71705) b!629738))

(assert (= (and b!629741 (not c!71705)) b!629739))

(declare-fun m!604789 () Bool)

(assert (=> d!89151 m!604789))

(declare-fun m!604791 () Bool)

(assert (=> d!89151 m!604791))

(declare-fun m!604793 () Bool)

(assert (=> d!89151 m!604793))

(assert (=> d!89151 m!604661))

(assert (=> b!629739 m!604785))

(assert (=> b!629739 m!604785))

(assert (=> b!629739 m!604657))

(declare-fun m!604795 () Bool)

(assert (=> b!629739 m!604795))

(assert (=> b!629622 d!89151))

(declare-fun d!89153 () Bool)

(declare-fun e!360126 () Bool)

(assert (=> d!89153 e!360126))

(declare-fun res!407078 () Bool)

(assert (=> d!89153 (=> (not res!407078) (not e!360126))))

(assert (=> d!89153 (= res!407078 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18614 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18614 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18614 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18614 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18614 a!2986))))))

(declare-fun lt!290873 () Unit!21122)

(declare-fun choose!9 (array!38026 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21122)

(assert (=> d!89153 (= lt!290873 (choose!9 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!290812 vacantSpotIndex!68 mask!3053))))

(assert (=> d!89153 (validMask!0 mask!3053)))

(assert (=> d!89153 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!290812 vacantSpotIndex!68 mask!3053) lt!290873)))

(declare-fun b!629762 () Bool)

(assert (=> b!629762 (= e!360126 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!290812 vacantSpotIndex!68 (select (arr!18250 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!290812 vacantSpotIndex!68 (select (store (arr!18250 a!2986) i!1108 k0!1786) j!136) (array!38027 (store (arr!18250 a!2986) i!1108 k0!1786) (size!18614 a!2986)) mask!3053)))))

(assert (= (and d!89153 res!407078) b!629762))

(declare-fun m!604807 () Bool)

(assert (=> d!89153 m!604807))

(assert (=> d!89153 m!604661))

(assert (=> b!629762 m!604681))

(assert (=> b!629762 m!604683))

(assert (=> b!629762 m!604657))

(assert (=> b!629762 m!604667))

(assert (=> b!629762 m!604657))

(assert (=> b!629762 m!604685))

(assert (=> b!629762 m!604681))

(assert (=> b!629622 d!89153))

(declare-fun d!89165 () Bool)

(declare-fun lt!290876 () (_ BitVec 32))

(assert (=> d!89165 (and (bvsge lt!290876 #b00000000000000000000000000000000) (bvslt lt!290876 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!89165 (= lt!290876 (choose!52 index!984 x!910 mask!3053))))

(assert (=> d!89165 (validMask!0 mask!3053)))

(assert (=> d!89165 (= (nextIndex!0 index!984 x!910 mask!3053) lt!290876)))

(declare-fun bs!18989 () Bool)

(assert (= bs!18989 d!89165))

(declare-fun m!604809 () Bool)

(assert (=> bs!18989 m!604809))

(assert (=> bs!18989 m!604661))

(assert (=> b!629622 d!89165))

(declare-fun lt!290878 () SeekEntryResult!6690)

(declare-fun d!89167 () Bool)

(assert (=> d!89167 (and (or ((_ is Undefined!6690) lt!290878) (not ((_ is Found!6690) lt!290878)) (and (bvsge (index!29045 lt!290878) #b00000000000000000000000000000000) (bvslt (index!29045 lt!290878) (size!18614 a!2986)))) (or ((_ is Undefined!6690) lt!290878) ((_ is Found!6690) lt!290878) (not ((_ is MissingVacant!6690) lt!290878)) (not (= (index!29047 lt!290878) vacantSpotIndex!68)) (and (bvsge (index!29047 lt!290878) #b00000000000000000000000000000000) (bvslt (index!29047 lt!290878) (size!18614 a!2986)))) (or ((_ is Undefined!6690) lt!290878) (ite ((_ is Found!6690) lt!290878) (= (select (arr!18250 a!2986) (index!29045 lt!290878)) (select (arr!18250 a!2986) j!136)) (and ((_ is MissingVacant!6690) lt!290878) (= (index!29047 lt!290878) vacantSpotIndex!68) (= (select (arr!18250 a!2986) (index!29047 lt!290878)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!360128 () SeekEntryResult!6690)

(assert (=> d!89167 (= lt!290878 e!360128)))

(declare-fun c!71709 () Bool)

(assert (=> d!89167 (= c!71709 (bvsge x!910 #b01111111111111111111111111111110))))

(declare-fun lt!290877 () (_ BitVec 64))

(assert (=> d!89167 (= lt!290877 (select (arr!18250 a!2986) index!984))))

(assert (=> d!89167 (validMask!0 mask!3053)))

(assert (=> d!89167 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18250 a!2986) j!136) a!2986 mask!3053) lt!290878)))

(declare-fun b!629763 () Bool)

(assert (=> b!629763 (= e!360128 Undefined!6690)))

(declare-fun b!629764 () Bool)

(declare-fun e!360129 () SeekEntryResult!6690)

(assert (=> b!629764 (= e!360129 (Found!6690 index!984))))

(declare-fun b!629765 () Bool)

(declare-fun e!360127 () SeekEntryResult!6690)

(assert (=> b!629765 (= e!360127 (MissingVacant!6690 vacantSpotIndex!68))))

(declare-fun b!629766 () Bool)

(assert (=> b!629766 (= e!360127 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!18250 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!629767 () Bool)

(assert (=> b!629767 (= e!360128 e!360129)))

(declare-fun c!71710 () Bool)

(assert (=> b!629767 (= c!71710 (= lt!290877 (select (arr!18250 a!2986) j!136)))))

(declare-fun b!629768 () Bool)

(declare-fun c!71711 () Bool)

(assert (=> b!629768 (= c!71711 (= lt!290877 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!629768 (= e!360129 e!360127)))

(assert (= (and d!89167 c!71709) b!629763))

(assert (= (and d!89167 (not c!71709)) b!629767))

(assert (= (and b!629767 c!71710) b!629764))

(assert (= (and b!629767 (not c!71710)) b!629768))

(assert (= (and b!629768 c!71711) b!629765))

(assert (= (and b!629768 (not c!71711)) b!629766))

(declare-fun m!604811 () Bool)

(assert (=> d!89167 m!604811))

(declare-fun m!604813 () Bool)

(assert (=> d!89167 m!604813))

(assert (=> d!89167 m!604655))

(assert (=> d!89167 m!604661))

(assert (=> b!629766 m!604677))

(assert (=> b!629766 m!604677))

(assert (=> b!629766 m!604657))

(declare-fun m!604815 () Bool)

(assert (=> b!629766 m!604815))

(assert (=> b!629626 d!89167))

(declare-fun b!629807 () Bool)

(declare-fun e!360157 () Bool)

(declare-fun call!33301 () Bool)

(assert (=> b!629807 (= e!360157 call!33301)))

(declare-fun bm!33298 () Bool)

(declare-fun c!71725 () Bool)

(assert (=> bm!33298 (= call!33301 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!71725 (Cons!12287 (select (arr!18250 a!2986) #b00000000000000000000000000000000) Nil!12288) Nil!12288)))))

(declare-fun b!629808 () Bool)

(assert (=> b!629808 (= e!360157 call!33301)))

(declare-fun b!629809 () Bool)

(declare-fun e!360156 () Bool)

(assert (=> b!629809 (= e!360156 e!360157)))

(assert (=> b!629809 (= c!71725 (validKeyInArray!0 (select (arr!18250 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!629810 () Bool)

(declare-fun e!360158 () Bool)

(declare-fun contains!3083 (List!12291 (_ BitVec 64)) Bool)

(assert (=> b!629810 (= e!360158 (contains!3083 Nil!12288 (select (arr!18250 a!2986) #b00000000000000000000000000000000)))))

(declare-fun d!89171 () Bool)

(declare-fun res!407091 () Bool)

(declare-fun e!360155 () Bool)

(assert (=> d!89171 (=> res!407091 e!360155)))

(assert (=> d!89171 (= res!407091 (bvsge #b00000000000000000000000000000000 (size!18614 a!2986)))))

(assert (=> d!89171 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12288) e!360155)))

(declare-fun b!629811 () Bool)

(assert (=> b!629811 (= e!360155 e!360156)))

(declare-fun res!407093 () Bool)

(assert (=> b!629811 (=> (not res!407093) (not e!360156))))

(assert (=> b!629811 (= res!407093 (not e!360158))))

(declare-fun res!407092 () Bool)

(assert (=> b!629811 (=> (not res!407092) (not e!360158))))

(assert (=> b!629811 (= res!407092 (validKeyInArray!0 (select (arr!18250 a!2986) #b00000000000000000000000000000000)))))

(assert (= (and d!89171 (not res!407091)) b!629811))

(assert (= (and b!629811 res!407092) b!629810))

(assert (= (and b!629811 res!407093) b!629809))

(assert (= (and b!629809 c!71725) b!629807))

(assert (= (and b!629809 (not c!71725)) b!629808))

(assert (= (or b!629807 b!629808) bm!33298))

(assert (=> bm!33298 m!604745))

(declare-fun m!604823 () Bool)

(assert (=> bm!33298 m!604823))

(assert (=> b!629809 m!604745))

(assert (=> b!629809 m!604745))

(assert (=> b!629809 m!604755))

(assert (=> b!629810 m!604745))

(assert (=> b!629810 m!604745))

(declare-fun m!604825 () Bool)

(assert (=> b!629810 m!604825))

(assert (=> b!629811 m!604745))

(assert (=> b!629811 m!604745))

(assert (=> b!629811 m!604755))

(assert (=> b!629625 d!89171))

(declare-fun d!89177 () Bool)

(declare-fun res!407101 () Bool)

(declare-fun e!360170 () Bool)

(assert (=> d!89177 (=> res!407101 e!360170)))

(assert (=> d!89177 (= res!407101 (= (select (arr!18250 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!89177 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!360170)))

(declare-fun b!629827 () Bool)

(declare-fun e!360171 () Bool)

(assert (=> b!629827 (= e!360170 e!360171)))

(declare-fun res!407102 () Bool)

(assert (=> b!629827 (=> (not res!407102) (not e!360171))))

(assert (=> b!629827 (= res!407102 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18614 a!2986)))))

(declare-fun b!629828 () Bool)

(assert (=> b!629828 (= e!360171 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!89177 (not res!407101)) b!629827))

(assert (= (and b!629827 res!407102) b!629828))

(assert (=> d!89177 m!604745))

(declare-fun m!604841 () Bool)

(assert (=> b!629828 m!604841))

(assert (=> b!629620 d!89177))

(declare-fun d!89183 () Bool)

(assert (=> d!89183 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!56836 d!89183))

(declare-fun d!89191 () Bool)

(assert (=> d!89191 (= (array_inv!14046 a!2986) (bvsge (size!18614 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!56836 d!89191))

(check-sat (not b!629809) (not bm!33290) (not b!629762) (not bm!33298) (not b!629810) (not d!89131) (not b!629739) (not b!629811) (not b!629828) (not d!89165) (not b!629687) (not d!89141) (not d!89151) (not b!629733) (not d!89167) (not b!629684) (not b!629670) (not b!629766) (not d!89153))
(check-sat)
