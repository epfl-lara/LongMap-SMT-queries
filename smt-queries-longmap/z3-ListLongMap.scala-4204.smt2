; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57498 () Bool)

(assert start!57498)

(declare-fun b!636057 () Bool)

(declare-fun e!363830 () Bool)

(declare-fun e!363835 () Bool)

(assert (=> b!636057 (= e!363830 e!363835)))

(declare-fun res!411511 () Bool)

(assert (=> b!636057 (=> (not res!411511) (not e!363835))))

(declare-datatypes ((SeekEntryResult!6733 0))(
  ( (MissingZero!6733 (index!29237 (_ BitVec 32))) (Found!6733 (index!29238 (_ BitVec 32))) (Intermediate!6733 (undefined!7545 Bool) (index!29239 (_ BitVec 32)) (x!58135 (_ BitVec 32))) (Undefined!6733) (MissingVacant!6733 (index!29240 (_ BitVec 32))) )
))
(declare-fun lt!294130 () SeekEntryResult!6733)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!636057 (= res!411511 (or (= lt!294130 (MissingZero!6733 i!1108)) (= lt!294130 (MissingVacant!6733 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-datatypes ((array!38226 0))(
  ( (array!38227 (arr!18337 (Array (_ BitVec 32) (_ BitVec 64))) (size!18701 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38226)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38226 (_ BitVec 32)) SeekEntryResult!6733)

(assert (=> b!636057 (= lt!294130 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!636058 () Bool)

(declare-datatypes ((Unit!21441 0))(
  ( (Unit!21442) )
))
(declare-fun e!363840 () Unit!21441)

(declare-fun Unit!21443 () Unit!21441)

(assert (=> b!636058 (= e!363840 Unit!21443)))

(declare-fun b!636059 () Bool)

(declare-fun Unit!21444 () Unit!21441)

(assert (=> b!636059 (= e!363840 Unit!21444)))

(assert (=> b!636059 false))

(declare-fun b!636060 () Bool)

(declare-fun res!411518 () Bool)

(assert (=> b!636060 (=> (not res!411518) (not e!363830))))

(declare-fun arrayContainsKey!0 (array!38226 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!636060 (= res!411518 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!636061 () Bool)

(declare-fun res!411510 () Bool)

(assert (=> b!636061 (=> (not res!411510) (not e!363830))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!636061 (= res!411510 (validKeyInArray!0 k0!1786))))

(declare-fun b!636062 () Bool)

(declare-fun res!411521 () Bool)

(assert (=> b!636062 (=> (not res!411521) (not e!363835))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!636062 (= res!411521 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18337 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!636063 () Bool)

(declare-fun e!363834 () Bool)

(declare-fun lt!294127 () SeekEntryResult!6733)

(declare-fun lt!294128 () SeekEntryResult!6733)

(assert (=> b!636063 (= e!363834 (= lt!294127 lt!294128))))

(declare-fun b!636064 () Bool)

(declare-fun e!363829 () Bool)

(declare-fun e!363831 () Bool)

(assert (=> b!636064 (= e!363829 e!363831)))

(declare-fun res!411520 () Bool)

(assert (=> b!636064 (=> res!411520 e!363831)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!294136 () (_ BitVec 64))

(declare-fun lt!294134 () (_ BitVec 64))

(assert (=> b!636064 (= res!411520 (or (not (= (select (arr!18337 a!2986) j!136) lt!294136)) (not (= (select (arr!18337 a!2986) j!136) lt!294134)) (bvsge j!136 index!984)))))

(declare-fun b!636065 () Bool)

(declare-fun res!411514 () Bool)

(assert (=> b!636065 (=> (not res!411514) (not e!363830))))

(assert (=> b!636065 (= res!411514 (and (= (size!18701 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18701 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18701 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!636066 () Bool)

(declare-fun res!411509 () Bool)

(assert (=> b!636066 (=> (not res!411509) (not e!363835))))

(declare-datatypes ((List!12285 0))(
  ( (Nil!12282) (Cons!12281 (h!13329 (_ BitVec 64)) (t!18505 List!12285)) )
))
(declare-fun arrayNoDuplicates!0 (array!38226 (_ BitVec 32) List!12285) Bool)

(assert (=> b!636066 (= res!411509 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12282))))

(declare-fun b!636067 () Bool)

(declare-fun res!411508 () Bool)

(assert (=> b!636067 (=> (not res!411508) (not e!363835))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38226 (_ BitVec 32)) Bool)

(assert (=> b!636067 (= res!411508 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun res!411517 () Bool)

(assert (=> start!57498 (=> (not res!411517) (not e!363830))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57498 (= res!411517 (validMask!0 mask!3053))))

(assert (=> start!57498 e!363830))

(assert (=> start!57498 true))

(declare-fun array_inv!14196 (array!38226) Bool)

(assert (=> start!57498 (array_inv!14196 a!2986)))

(declare-fun b!636068 () Bool)

(declare-fun e!363832 () Bool)

(declare-fun e!363837 () Bool)

(assert (=> b!636068 (= e!363832 e!363837)))

(declare-fun res!411519 () Bool)

(assert (=> b!636068 (=> (not res!411519) (not e!363837))))

(assert (=> b!636068 (= res!411519 (and (= lt!294127 (Found!6733 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18337 a!2986) index!984) (select (arr!18337 a!2986) j!136))) (not (= (select (arr!18337 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38226 (_ BitVec 32)) SeekEntryResult!6733)

(assert (=> b!636068 (= lt!294127 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18337 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!636069 () Bool)

(declare-fun e!363839 () Bool)

(assert (=> b!636069 (= e!363837 (not e!363839))))

(declare-fun res!411507 () Bool)

(assert (=> b!636069 (=> res!411507 e!363839)))

(declare-fun lt!294126 () SeekEntryResult!6733)

(assert (=> b!636069 (= res!411507 (not (= lt!294126 (Found!6733 index!984))))))

(declare-fun lt!294129 () Unit!21441)

(assert (=> b!636069 (= lt!294129 e!363840)))

(declare-fun c!72644 () Bool)

(assert (=> b!636069 (= c!72644 (= lt!294126 Undefined!6733))))

(declare-fun lt!294131 () array!38226)

(assert (=> b!636069 (= lt!294126 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!294136 lt!294131 mask!3053))))

(assert (=> b!636069 e!363834))

(declare-fun res!411512 () Bool)

(assert (=> b!636069 (=> (not res!411512) (not e!363834))))

(declare-fun lt!294132 () (_ BitVec 32))

(assert (=> b!636069 (= res!411512 (= lt!294128 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!294132 vacantSpotIndex!68 lt!294136 lt!294131 mask!3053)))))

(assert (=> b!636069 (= lt!294128 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!294132 vacantSpotIndex!68 (select (arr!18337 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!636069 (= lt!294136 (select (store (arr!18337 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!294133 () Unit!21441)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38226 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21441)

(assert (=> b!636069 (= lt!294133 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!294132 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!636069 (= lt!294132 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!636070 () Bool)

(declare-fun e!363838 () Bool)

(declare-fun noDuplicate!379 (List!12285) Bool)

(assert (=> b!636070 (= e!363838 (noDuplicate!379 Nil!12282))))

(declare-fun b!636071 () Bool)

(declare-fun res!411515 () Bool)

(assert (=> b!636071 (=> (not res!411515) (not e!363830))))

(assert (=> b!636071 (= res!411515 (validKeyInArray!0 (select (arr!18337 a!2986) j!136)))))

(declare-fun b!636072 () Bool)

(declare-fun e!363828 () Bool)

(assert (=> b!636072 (= e!363828 e!363838)))

(declare-fun res!411523 () Bool)

(assert (=> b!636072 (=> res!411523 e!363838)))

(assert (=> b!636072 (= res!411523 (or (bvsge (size!18701 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18701 a!2986))))))

(assert (=> b!636072 (arrayContainsKey!0 lt!294131 (select (arr!18337 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!294135 () Unit!21441)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38226 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21441)

(assert (=> b!636072 (= lt!294135 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!294131 (select (arr!18337 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!636073 () Bool)

(assert (=> b!636073 (= e!363839 e!363828)))

(declare-fun res!411513 () Bool)

(assert (=> b!636073 (=> res!411513 e!363828)))

(assert (=> b!636073 (= res!411513 (or (not (= (select (arr!18337 a!2986) j!136) lt!294136)) (not (= (select (arr!18337 a!2986) j!136) lt!294134)) (bvsge j!136 index!984)))))

(assert (=> b!636073 e!363829))

(declare-fun res!411506 () Bool)

(assert (=> b!636073 (=> (not res!411506) (not e!363829))))

(assert (=> b!636073 (= res!411506 (= lt!294134 (select (arr!18337 a!2986) j!136)))))

(assert (=> b!636073 (= lt!294134 (select (store (arr!18337 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!636074 () Bool)

(assert (=> b!636074 (= e!363835 e!363832)))

(declare-fun res!411516 () Bool)

(assert (=> b!636074 (=> (not res!411516) (not e!363832))))

(assert (=> b!636074 (= res!411516 (= (select (store (arr!18337 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!636074 (= lt!294131 (array!38227 (store (arr!18337 a!2986) i!1108 k0!1786) (size!18701 a!2986)))))

(declare-fun e!363833 () Bool)

(declare-fun b!636075 () Bool)

(assert (=> b!636075 (= e!363833 (arrayContainsKey!0 lt!294131 (select (arr!18337 a!2986) j!136) index!984))))

(declare-fun b!636076 () Bool)

(assert (=> b!636076 (= e!363831 e!363833)))

(declare-fun res!411522 () Bool)

(assert (=> b!636076 (=> (not res!411522) (not e!363833))))

(assert (=> b!636076 (= res!411522 (arrayContainsKey!0 lt!294131 (select (arr!18337 a!2986) j!136) j!136))))

(assert (= (and start!57498 res!411517) b!636065))

(assert (= (and b!636065 res!411514) b!636071))

(assert (= (and b!636071 res!411515) b!636061))

(assert (= (and b!636061 res!411510) b!636060))

(assert (= (and b!636060 res!411518) b!636057))

(assert (= (and b!636057 res!411511) b!636067))

(assert (= (and b!636067 res!411508) b!636066))

(assert (= (and b!636066 res!411509) b!636062))

(assert (= (and b!636062 res!411521) b!636074))

(assert (= (and b!636074 res!411516) b!636068))

(assert (= (and b!636068 res!411519) b!636069))

(assert (= (and b!636069 res!411512) b!636063))

(assert (= (and b!636069 c!72644) b!636059))

(assert (= (and b!636069 (not c!72644)) b!636058))

(assert (= (and b!636069 (not res!411507)) b!636073))

(assert (= (and b!636073 res!411506) b!636064))

(assert (= (and b!636064 (not res!411520)) b!636076))

(assert (= (and b!636076 res!411522) b!636075))

(assert (= (and b!636073 (not res!411513)) b!636072))

(assert (= (and b!636072 (not res!411523)) b!636070))

(declare-fun m!610711 () Bool)

(assert (=> b!636071 m!610711))

(assert (=> b!636071 m!610711))

(declare-fun m!610713 () Bool)

(assert (=> b!636071 m!610713))

(assert (=> b!636072 m!610711))

(assert (=> b!636072 m!610711))

(declare-fun m!610715 () Bool)

(assert (=> b!636072 m!610715))

(assert (=> b!636072 m!610711))

(declare-fun m!610717 () Bool)

(assert (=> b!636072 m!610717))

(declare-fun m!610719 () Bool)

(assert (=> b!636057 m!610719))

(declare-fun m!610721 () Bool)

(assert (=> b!636070 m!610721))

(declare-fun m!610723 () Bool)

(assert (=> b!636060 m!610723))

(declare-fun m!610725 () Bool)

(assert (=> b!636069 m!610725))

(declare-fun m!610727 () Bool)

(assert (=> b!636069 m!610727))

(declare-fun m!610729 () Bool)

(assert (=> b!636069 m!610729))

(assert (=> b!636069 m!610711))

(declare-fun m!610731 () Bool)

(assert (=> b!636069 m!610731))

(declare-fun m!610733 () Bool)

(assert (=> b!636069 m!610733))

(declare-fun m!610735 () Bool)

(assert (=> b!636069 m!610735))

(assert (=> b!636069 m!610711))

(declare-fun m!610737 () Bool)

(assert (=> b!636069 m!610737))

(assert (=> b!636073 m!610711))

(assert (=> b!636073 m!610731))

(declare-fun m!610739 () Bool)

(assert (=> b!636073 m!610739))

(assert (=> b!636075 m!610711))

(assert (=> b!636075 m!610711))

(declare-fun m!610741 () Bool)

(assert (=> b!636075 m!610741))

(declare-fun m!610743 () Bool)

(assert (=> b!636068 m!610743))

(assert (=> b!636068 m!610711))

(assert (=> b!636068 m!610711))

(declare-fun m!610745 () Bool)

(assert (=> b!636068 m!610745))

(assert (=> b!636076 m!610711))

(assert (=> b!636076 m!610711))

(declare-fun m!610747 () Bool)

(assert (=> b!636076 m!610747))

(assert (=> b!636064 m!610711))

(declare-fun m!610749 () Bool)

(assert (=> b!636062 m!610749))

(declare-fun m!610751 () Bool)

(assert (=> start!57498 m!610751))

(declare-fun m!610753 () Bool)

(assert (=> start!57498 m!610753))

(declare-fun m!610755 () Bool)

(assert (=> b!636061 m!610755))

(declare-fun m!610757 () Bool)

(assert (=> b!636066 m!610757))

(assert (=> b!636074 m!610731))

(declare-fun m!610759 () Bool)

(assert (=> b!636074 m!610759))

(declare-fun m!610761 () Bool)

(assert (=> b!636067 m!610761))

(check-sat (not b!636067) (not b!636057) (not b!636076) (not b!636061) (not b!636066) (not b!636075) (not b!636071) (not b!636072) (not b!636060) (not b!636068) (not b!636070) (not b!636069) (not start!57498))
(check-sat)
(get-model)

(declare-fun d!89945 () Bool)

(assert (=> d!89945 (= (validKeyInArray!0 (select (arr!18337 a!2986) j!136)) (and (not (= (select (arr!18337 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18337 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!636071 d!89945))

(declare-fun d!89947 () Bool)

(declare-fun res!411636 () Bool)

(declare-fun e!363923 () Bool)

(assert (=> d!89947 (=> res!411636 e!363923)))

(assert (=> d!89947 (= res!411636 (= (select (arr!18337 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!89947 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!363923)))

(declare-fun b!636201 () Bool)

(declare-fun e!363924 () Bool)

(assert (=> b!636201 (= e!363923 e!363924)))

(declare-fun res!411637 () Bool)

(assert (=> b!636201 (=> (not res!411637) (not e!363924))))

(assert (=> b!636201 (= res!411637 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18701 a!2986)))))

(declare-fun b!636202 () Bool)

(assert (=> b!636202 (= e!363924 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!89947 (not res!411636)) b!636201))

(assert (= (and b!636201 res!411637) b!636202))

(declare-fun m!610867 () Bool)

(assert (=> d!89947 m!610867))

(declare-fun m!610869 () Bool)

(assert (=> b!636202 m!610869))

(assert (=> b!636060 d!89947))

(declare-fun d!89949 () Bool)

(declare-fun res!411642 () Bool)

(declare-fun e!363929 () Bool)

(assert (=> d!89949 (=> res!411642 e!363929)))

(get-info :version)

(assert (=> d!89949 (= res!411642 ((_ is Nil!12282) Nil!12282))))

(assert (=> d!89949 (= (noDuplicate!379 Nil!12282) e!363929)))

(declare-fun b!636207 () Bool)

(declare-fun e!363930 () Bool)

(assert (=> b!636207 (= e!363929 e!363930)))

(declare-fun res!411643 () Bool)

(assert (=> b!636207 (=> (not res!411643) (not e!363930))))

(declare-fun contains!3077 (List!12285 (_ BitVec 64)) Bool)

(assert (=> b!636207 (= res!411643 (not (contains!3077 (t!18505 Nil!12282) (h!13329 Nil!12282))))))

(declare-fun b!636208 () Bool)

(assert (=> b!636208 (= e!363930 (noDuplicate!379 (t!18505 Nil!12282)))))

(assert (= (and d!89949 (not res!411642)) b!636207))

(assert (= (and b!636207 res!411643) b!636208))

(declare-fun m!610871 () Bool)

(assert (=> b!636207 m!610871))

(declare-fun m!610873 () Bool)

(assert (=> b!636208 m!610873))

(assert (=> b!636070 d!89949))

(declare-fun d!89951 () Bool)

(declare-fun e!363933 () Bool)

(assert (=> d!89951 e!363933))

(declare-fun res!411646 () Bool)

(assert (=> d!89951 (=> (not res!411646) (not e!363933))))

(assert (=> d!89951 (= res!411646 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18701 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18701 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18701 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18701 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18701 a!2986))))))

(declare-fun lt!294205 () Unit!21441)

(declare-fun choose!9 (array!38226 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21441)

(assert (=> d!89951 (= lt!294205 (choose!9 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!294132 vacantSpotIndex!68 mask!3053))))

(assert (=> d!89951 (validMask!0 mask!3053)))

(assert (=> d!89951 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!294132 vacantSpotIndex!68 mask!3053) lt!294205)))

(declare-fun b!636211 () Bool)

(assert (=> b!636211 (= e!363933 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!294132 vacantSpotIndex!68 (select (arr!18337 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!294132 vacantSpotIndex!68 (select (store (arr!18337 a!2986) i!1108 k0!1786) j!136) (array!38227 (store (arr!18337 a!2986) i!1108 k0!1786) (size!18701 a!2986)) mask!3053)))))

(assert (= (and d!89951 res!411646) b!636211))

(declare-fun m!610875 () Bool)

(assert (=> d!89951 m!610875))

(assert (=> d!89951 m!610751))

(assert (=> b!636211 m!610711))

(assert (=> b!636211 m!610731))

(assert (=> b!636211 m!610727))

(declare-fun m!610877 () Bool)

(assert (=> b!636211 m!610877))

(assert (=> b!636211 m!610711))

(assert (=> b!636211 m!610737))

(assert (=> b!636211 m!610727))

(assert (=> b!636069 d!89951))

(declare-fun b!636224 () Bool)

(declare-fun e!363942 () SeekEntryResult!6733)

(assert (=> b!636224 (= e!363942 Undefined!6733)))

(declare-fun e!363941 () SeekEntryResult!6733)

(declare-fun b!636225 () Bool)

(assert (=> b!636225 (= e!363941 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!294132 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 (select (arr!18337 a!2986) j!136) a!2986 mask!3053))))

(declare-fun lt!294210 () SeekEntryResult!6733)

(declare-fun d!89953 () Bool)

(assert (=> d!89953 (and (or ((_ is Undefined!6733) lt!294210) (not ((_ is Found!6733) lt!294210)) (and (bvsge (index!29238 lt!294210) #b00000000000000000000000000000000) (bvslt (index!29238 lt!294210) (size!18701 a!2986)))) (or ((_ is Undefined!6733) lt!294210) ((_ is Found!6733) lt!294210) (not ((_ is MissingVacant!6733) lt!294210)) (not (= (index!29240 lt!294210) vacantSpotIndex!68)) (and (bvsge (index!29240 lt!294210) #b00000000000000000000000000000000) (bvslt (index!29240 lt!294210) (size!18701 a!2986)))) (or ((_ is Undefined!6733) lt!294210) (ite ((_ is Found!6733) lt!294210) (= (select (arr!18337 a!2986) (index!29238 lt!294210)) (select (arr!18337 a!2986) j!136)) (and ((_ is MissingVacant!6733) lt!294210) (= (index!29240 lt!294210) vacantSpotIndex!68) (= (select (arr!18337 a!2986) (index!29240 lt!294210)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!89953 (= lt!294210 e!363942)))

(declare-fun c!72658 () Bool)

(assert (=> d!89953 (= c!72658 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(declare-fun lt!294211 () (_ BitVec 64))

(assert (=> d!89953 (= lt!294211 (select (arr!18337 a!2986) lt!294132))))

(assert (=> d!89953 (validMask!0 mask!3053)))

(assert (=> d!89953 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!294132 vacantSpotIndex!68 (select (arr!18337 a!2986) j!136) a!2986 mask!3053) lt!294210)))

(declare-fun b!636226 () Bool)

(assert (=> b!636226 (= e!363941 (MissingVacant!6733 vacantSpotIndex!68))))

(declare-fun b!636227 () Bool)

(declare-fun e!363940 () SeekEntryResult!6733)

(assert (=> b!636227 (= e!363942 e!363940)))

(declare-fun c!72657 () Bool)

(assert (=> b!636227 (= c!72657 (= lt!294211 (select (arr!18337 a!2986) j!136)))))

(declare-fun b!636228 () Bool)

(assert (=> b!636228 (= e!363940 (Found!6733 lt!294132))))

(declare-fun b!636229 () Bool)

(declare-fun c!72659 () Bool)

(assert (=> b!636229 (= c!72659 (= lt!294211 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!636229 (= e!363940 e!363941)))

(assert (= (and d!89953 c!72658) b!636224))

(assert (= (and d!89953 (not c!72658)) b!636227))

(assert (= (and b!636227 c!72657) b!636228))

(assert (= (and b!636227 (not c!72657)) b!636229))

(assert (= (and b!636229 c!72659) b!636226))

(assert (= (and b!636229 (not c!72659)) b!636225))

(declare-fun m!610879 () Bool)

(assert (=> b!636225 m!610879))

(assert (=> b!636225 m!610879))

(assert (=> b!636225 m!610711))

(declare-fun m!610881 () Bool)

(assert (=> b!636225 m!610881))

(declare-fun m!610883 () Bool)

(assert (=> d!89953 m!610883))

(declare-fun m!610885 () Bool)

(assert (=> d!89953 m!610885))

(declare-fun m!610887 () Bool)

(assert (=> d!89953 m!610887))

(assert (=> d!89953 m!610751))

(assert (=> b!636069 d!89953))

(declare-fun b!636230 () Bool)

(declare-fun e!363945 () SeekEntryResult!6733)

(assert (=> b!636230 (= e!363945 Undefined!6733)))

(declare-fun e!363944 () SeekEntryResult!6733)

(declare-fun b!636231 () Bool)

(assert (=> b!636231 (= e!363944 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!294132 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 lt!294136 lt!294131 mask!3053))))

(declare-fun lt!294212 () SeekEntryResult!6733)

(declare-fun d!89955 () Bool)

(assert (=> d!89955 (and (or ((_ is Undefined!6733) lt!294212) (not ((_ is Found!6733) lt!294212)) (and (bvsge (index!29238 lt!294212) #b00000000000000000000000000000000) (bvslt (index!29238 lt!294212) (size!18701 lt!294131)))) (or ((_ is Undefined!6733) lt!294212) ((_ is Found!6733) lt!294212) (not ((_ is MissingVacant!6733) lt!294212)) (not (= (index!29240 lt!294212) vacantSpotIndex!68)) (and (bvsge (index!29240 lt!294212) #b00000000000000000000000000000000) (bvslt (index!29240 lt!294212) (size!18701 lt!294131)))) (or ((_ is Undefined!6733) lt!294212) (ite ((_ is Found!6733) lt!294212) (= (select (arr!18337 lt!294131) (index!29238 lt!294212)) lt!294136) (and ((_ is MissingVacant!6733) lt!294212) (= (index!29240 lt!294212) vacantSpotIndex!68) (= (select (arr!18337 lt!294131) (index!29240 lt!294212)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!89955 (= lt!294212 e!363945)))

(declare-fun c!72661 () Bool)

(assert (=> d!89955 (= c!72661 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(declare-fun lt!294213 () (_ BitVec 64))

(assert (=> d!89955 (= lt!294213 (select (arr!18337 lt!294131) lt!294132))))

(assert (=> d!89955 (validMask!0 mask!3053)))

(assert (=> d!89955 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!294132 vacantSpotIndex!68 lt!294136 lt!294131 mask!3053) lt!294212)))

(declare-fun b!636232 () Bool)

(assert (=> b!636232 (= e!363944 (MissingVacant!6733 vacantSpotIndex!68))))

(declare-fun b!636233 () Bool)

(declare-fun e!363943 () SeekEntryResult!6733)

(assert (=> b!636233 (= e!363945 e!363943)))

(declare-fun c!72660 () Bool)

(assert (=> b!636233 (= c!72660 (= lt!294213 lt!294136))))

(declare-fun b!636234 () Bool)

(assert (=> b!636234 (= e!363943 (Found!6733 lt!294132))))

(declare-fun b!636235 () Bool)

(declare-fun c!72662 () Bool)

(assert (=> b!636235 (= c!72662 (= lt!294213 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!636235 (= e!363943 e!363944)))

(assert (= (and d!89955 c!72661) b!636230))

(assert (= (and d!89955 (not c!72661)) b!636233))

(assert (= (and b!636233 c!72660) b!636234))

(assert (= (and b!636233 (not c!72660)) b!636235))

(assert (= (and b!636235 c!72662) b!636232))

(assert (= (and b!636235 (not c!72662)) b!636231))

(assert (=> b!636231 m!610879))

(assert (=> b!636231 m!610879))

(declare-fun m!610889 () Bool)

(assert (=> b!636231 m!610889))

(declare-fun m!610891 () Bool)

(assert (=> d!89955 m!610891))

(declare-fun m!610893 () Bool)

(assert (=> d!89955 m!610893))

(declare-fun m!610895 () Bool)

(assert (=> d!89955 m!610895))

(assert (=> d!89955 m!610751))

(assert (=> b!636069 d!89955))

(declare-fun b!636236 () Bool)

(declare-fun e!363948 () SeekEntryResult!6733)

(assert (=> b!636236 (= e!363948 Undefined!6733)))

(declare-fun e!363947 () SeekEntryResult!6733)

(declare-fun b!636237 () Bool)

(assert (=> b!636237 (= e!363947 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 (bvadd x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 lt!294136 lt!294131 mask!3053))))

(declare-fun lt!294214 () SeekEntryResult!6733)

(declare-fun d!89957 () Bool)

(assert (=> d!89957 (and (or ((_ is Undefined!6733) lt!294214) (not ((_ is Found!6733) lt!294214)) (and (bvsge (index!29238 lt!294214) #b00000000000000000000000000000000) (bvslt (index!29238 lt!294214) (size!18701 lt!294131)))) (or ((_ is Undefined!6733) lt!294214) ((_ is Found!6733) lt!294214) (not ((_ is MissingVacant!6733) lt!294214)) (not (= (index!29240 lt!294214) vacantSpotIndex!68)) (and (bvsge (index!29240 lt!294214) #b00000000000000000000000000000000) (bvslt (index!29240 lt!294214) (size!18701 lt!294131)))) (or ((_ is Undefined!6733) lt!294214) (ite ((_ is Found!6733) lt!294214) (= (select (arr!18337 lt!294131) (index!29238 lt!294214)) lt!294136) (and ((_ is MissingVacant!6733) lt!294214) (= (index!29240 lt!294214) vacantSpotIndex!68) (= (select (arr!18337 lt!294131) (index!29240 lt!294214)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!89957 (= lt!294214 e!363948)))

(declare-fun c!72664 () Bool)

(assert (=> d!89957 (= c!72664 (bvsge x!910 #b01111111111111111111111111111110))))

(declare-fun lt!294215 () (_ BitVec 64))

(assert (=> d!89957 (= lt!294215 (select (arr!18337 lt!294131) index!984))))

(assert (=> d!89957 (validMask!0 mask!3053)))

(assert (=> d!89957 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!294136 lt!294131 mask!3053) lt!294214)))

(declare-fun b!636238 () Bool)

(assert (=> b!636238 (= e!363947 (MissingVacant!6733 vacantSpotIndex!68))))

(declare-fun b!636239 () Bool)

(declare-fun e!363946 () SeekEntryResult!6733)

(assert (=> b!636239 (= e!363948 e!363946)))

(declare-fun c!72663 () Bool)

(assert (=> b!636239 (= c!72663 (= lt!294215 lt!294136))))

(declare-fun b!636240 () Bool)

(assert (=> b!636240 (= e!363946 (Found!6733 index!984))))

(declare-fun b!636241 () Bool)

(declare-fun c!72665 () Bool)

(assert (=> b!636241 (= c!72665 (= lt!294215 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!636241 (= e!363946 e!363947)))

(assert (= (and d!89957 c!72664) b!636236))

(assert (= (and d!89957 (not c!72664)) b!636239))

(assert (= (and b!636239 c!72663) b!636240))

(assert (= (and b!636239 (not c!72663)) b!636241))

(assert (= (and b!636241 c!72665) b!636238))

(assert (= (and b!636241 (not c!72665)) b!636237))

(declare-fun m!610897 () Bool)

(assert (=> b!636237 m!610897))

(assert (=> b!636237 m!610897))

(declare-fun m!610899 () Bool)

(assert (=> b!636237 m!610899))

(declare-fun m!610901 () Bool)

(assert (=> d!89957 m!610901))

(declare-fun m!610903 () Bool)

(assert (=> d!89957 m!610903))

(declare-fun m!610905 () Bool)

(assert (=> d!89957 m!610905))

(assert (=> d!89957 m!610751))

(assert (=> b!636069 d!89957))

(declare-fun d!89959 () Bool)

(declare-fun lt!294218 () (_ BitVec 32))

(assert (=> d!89959 (and (bvsge lt!294218 #b00000000000000000000000000000000) (bvslt lt!294218 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!89959 (= lt!294218 (choose!52 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(assert (=> d!89959 (validMask!0 mask!3053)))

(assert (=> d!89959 (= (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) lt!294218)))

(declare-fun bs!19124 () Bool)

(assert (= bs!19124 d!89959))

(declare-fun m!610907 () Bool)

(assert (=> bs!19124 m!610907))

(assert (=> bs!19124 m!610751))

(assert (=> b!636069 d!89959))

(declare-fun d!89961 () Bool)

(assert (=> d!89961 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!57498 d!89961))

(declare-fun d!89967 () Bool)

(assert (=> d!89967 (= (array_inv!14196 a!2986) (bvsge (size!18701 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!57498 d!89967))

(declare-fun b!636248 () Bool)

(declare-fun e!363955 () SeekEntryResult!6733)

(assert (=> b!636248 (= e!363955 Undefined!6733)))

(declare-fun b!636249 () Bool)

(declare-fun e!363954 () SeekEntryResult!6733)

(assert (=> b!636249 (= e!363954 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 (bvadd x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 (select (arr!18337 a!2986) j!136) a!2986 mask!3053))))

(declare-fun d!89969 () Bool)

(declare-fun lt!294225 () SeekEntryResult!6733)

(assert (=> d!89969 (and (or ((_ is Undefined!6733) lt!294225) (not ((_ is Found!6733) lt!294225)) (and (bvsge (index!29238 lt!294225) #b00000000000000000000000000000000) (bvslt (index!29238 lt!294225) (size!18701 a!2986)))) (or ((_ is Undefined!6733) lt!294225) ((_ is Found!6733) lt!294225) (not ((_ is MissingVacant!6733) lt!294225)) (not (= (index!29240 lt!294225) vacantSpotIndex!68)) (and (bvsge (index!29240 lt!294225) #b00000000000000000000000000000000) (bvslt (index!29240 lt!294225) (size!18701 a!2986)))) (or ((_ is Undefined!6733) lt!294225) (ite ((_ is Found!6733) lt!294225) (= (select (arr!18337 a!2986) (index!29238 lt!294225)) (select (arr!18337 a!2986) j!136)) (and ((_ is MissingVacant!6733) lt!294225) (= (index!29240 lt!294225) vacantSpotIndex!68) (= (select (arr!18337 a!2986) (index!29240 lt!294225)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!89969 (= lt!294225 e!363955)))

(declare-fun c!72669 () Bool)

(assert (=> d!89969 (= c!72669 (bvsge x!910 #b01111111111111111111111111111110))))

(declare-fun lt!294226 () (_ BitVec 64))

(assert (=> d!89969 (= lt!294226 (select (arr!18337 a!2986) index!984))))

(assert (=> d!89969 (validMask!0 mask!3053)))

(assert (=> d!89969 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18337 a!2986) j!136) a!2986 mask!3053) lt!294225)))

(declare-fun b!636250 () Bool)

(assert (=> b!636250 (= e!363954 (MissingVacant!6733 vacantSpotIndex!68))))

(declare-fun b!636251 () Bool)

(declare-fun e!363953 () SeekEntryResult!6733)

(assert (=> b!636251 (= e!363955 e!363953)))

(declare-fun c!72668 () Bool)

(assert (=> b!636251 (= c!72668 (= lt!294226 (select (arr!18337 a!2986) j!136)))))

(declare-fun b!636252 () Bool)

(assert (=> b!636252 (= e!363953 (Found!6733 index!984))))

(declare-fun b!636253 () Bool)

(declare-fun c!72670 () Bool)

(assert (=> b!636253 (= c!72670 (= lt!294226 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!636253 (= e!363953 e!363954)))

(assert (= (and d!89969 c!72669) b!636248))

(assert (= (and d!89969 (not c!72669)) b!636251))

(assert (= (and b!636251 c!72668) b!636252))

(assert (= (and b!636251 (not c!72668)) b!636253))

(assert (= (and b!636253 c!72670) b!636250))

(assert (= (and b!636253 (not c!72670)) b!636249))

(assert (=> b!636249 m!610897))

(assert (=> b!636249 m!610897))

(assert (=> b!636249 m!610711))

(declare-fun m!610909 () Bool)

(assert (=> b!636249 m!610909))

(declare-fun m!610911 () Bool)

(assert (=> d!89969 m!610911))

(declare-fun m!610913 () Bool)

(assert (=> d!89969 m!610913))

(assert (=> d!89969 m!610743))

(assert (=> d!89969 m!610751))

(assert (=> b!636068 d!89969))

(declare-fun e!363989 () SeekEntryResult!6733)

(declare-fun b!636312 () Bool)

(declare-fun lt!294253 () SeekEntryResult!6733)

(assert (=> b!636312 (= e!363989 (seekKeyOrZeroReturnVacant!0 (x!58135 lt!294253) (index!29239 lt!294253) (index!29239 lt!294253) k0!1786 a!2986 mask!3053))))

(declare-fun b!636313 () Bool)

(declare-fun e!363990 () SeekEntryResult!6733)

(assert (=> b!636313 (= e!363990 Undefined!6733)))

(declare-fun b!636314 () Bool)

(declare-fun c!72696 () Bool)

(declare-fun lt!294251 () (_ BitVec 64))

(assert (=> b!636314 (= c!72696 (= lt!294251 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!363991 () SeekEntryResult!6733)

(assert (=> b!636314 (= e!363991 e!363989)))

(declare-fun b!636315 () Bool)

(assert (=> b!636315 (= e!363990 e!363991)))

(assert (=> b!636315 (= lt!294251 (select (arr!18337 a!2986) (index!29239 lt!294253)))))

(declare-fun c!72698 () Bool)

(assert (=> b!636315 (= c!72698 (= lt!294251 k0!1786))))

(declare-fun d!89971 () Bool)

(declare-fun lt!294252 () SeekEntryResult!6733)

(assert (=> d!89971 (and (or ((_ is Undefined!6733) lt!294252) (not ((_ is Found!6733) lt!294252)) (and (bvsge (index!29238 lt!294252) #b00000000000000000000000000000000) (bvslt (index!29238 lt!294252) (size!18701 a!2986)))) (or ((_ is Undefined!6733) lt!294252) ((_ is Found!6733) lt!294252) (not ((_ is MissingZero!6733) lt!294252)) (and (bvsge (index!29237 lt!294252) #b00000000000000000000000000000000) (bvslt (index!29237 lt!294252) (size!18701 a!2986)))) (or ((_ is Undefined!6733) lt!294252) ((_ is Found!6733) lt!294252) ((_ is MissingZero!6733) lt!294252) (not ((_ is MissingVacant!6733) lt!294252)) (and (bvsge (index!29240 lt!294252) #b00000000000000000000000000000000) (bvslt (index!29240 lt!294252) (size!18701 a!2986)))) (or ((_ is Undefined!6733) lt!294252) (ite ((_ is Found!6733) lt!294252) (= (select (arr!18337 a!2986) (index!29238 lt!294252)) k0!1786) (ite ((_ is MissingZero!6733) lt!294252) (= (select (arr!18337 a!2986) (index!29237 lt!294252)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!6733) lt!294252) (= (select (arr!18337 a!2986) (index!29240 lt!294252)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!89971 (= lt!294252 e!363990)))

(declare-fun c!72697 () Bool)

(assert (=> d!89971 (= c!72697 (and ((_ is Intermediate!6733) lt!294253) (undefined!7545 lt!294253)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38226 (_ BitVec 32)) SeekEntryResult!6733)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!89971 (= lt!294253 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!89971 (validMask!0 mask!3053)))

(assert (=> d!89971 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!294252)))

(declare-fun b!636316 () Bool)

(assert (=> b!636316 (= e!363989 (MissingZero!6733 (index!29239 lt!294253)))))

(declare-fun b!636317 () Bool)

(assert (=> b!636317 (= e!363991 (Found!6733 (index!29239 lt!294253)))))

(assert (= (and d!89971 c!72697) b!636313))

(assert (= (and d!89971 (not c!72697)) b!636315))

(assert (= (and b!636315 c!72698) b!636317))

(assert (= (and b!636315 (not c!72698)) b!636314))

(assert (= (and b!636314 c!72696) b!636316))

(assert (= (and b!636314 (not c!72696)) b!636312))

(declare-fun m!610949 () Bool)

(assert (=> b!636312 m!610949))

(declare-fun m!610951 () Bool)

(assert (=> b!636315 m!610951))

(declare-fun m!610953 () Bool)

(assert (=> d!89971 m!610953))

(assert (=> d!89971 m!610751))

(declare-fun m!610955 () Bool)

(assert (=> d!89971 m!610955))

(declare-fun m!610957 () Bool)

(assert (=> d!89971 m!610957))

(declare-fun m!610959 () Bool)

(assert (=> d!89971 m!610959))

(assert (=> d!89971 m!610957))

(declare-fun m!610961 () Bool)

(assert (=> d!89971 m!610961))

(assert (=> b!636057 d!89971))

(declare-fun bm!33426 () Bool)

(declare-fun call!33429 () Bool)

(assert (=> bm!33426 (= call!33429 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!636343 () Bool)

(declare-fun e!364013 () Bool)

(declare-fun e!364014 () Bool)

(assert (=> b!636343 (= e!364013 e!364014)))

(declare-fun lt!294260 () (_ BitVec 64))

(assert (=> b!636343 (= lt!294260 (select (arr!18337 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!294262 () Unit!21441)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38226 (_ BitVec 64) (_ BitVec 32)) Unit!21441)

(assert (=> b!636343 (= lt!294262 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!294260 #b00000000000000000000000000000000))))

(assert (=> b!636343 (arrayContainsKey!0 a!2986 lt!294260 #b00000000000000000000000000000000)))

(declare-fun lt!294261 () Unit!21441)

(assert (=> b!636343 (= lt!294261 lt!294262)))

(declare-fun res!411672 () Bool)

(assert (=> b!636343 (= res!411672 (= (seekEntryOrOpen!0 (select (arr!18337 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6733 #b00000000000000000000000000000000)))))

(assert (=> b!636343 (=> (not res!411672) (not e!364014))))

(declare-fun b!636344 () Bool)

(assert (=> b!636344 (= e!364014 call!33429)))

(declare-fun b!636345 () Bool)

(assert (=> b!636345 (= e!364013 call!33429)))

(declare-fun b!636346 () Bool)

(declare-fun e!364012 () Bool)

(assert (=> b!636346 (= e!364012 e!364013)))

(declare-fun c!72704 () Bool)

(assert (=> b!636346 (= c!72704 (validKeyInArray!0 (select (arr!18337 a!2986) #b00000000000000000000000000000000)))))

(declare-fun d!89979 () Bool)

(declare-fun res!411673 () Bool)

(assert (=> d!89979 (=> res!411673 e!364012)))

(assert (=> d!89979 (= res!411673 (bvsge #b00000000000000000000000000000000 (size!18701 a!2986)))))

(assert (=> d!89979 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!364012)))

(assert (= (and d!89979 (not res!411673)) b!636346))

(assert (= (and b!636346 c!72704) b!636343))

(assert (= (and b!636346 (not c!72704)) b!636345))

(assert (= (and b!636343 res!411672) b!636344))

(assert (= (or b!636344 b!636345) bm!33426))

(declare-fun m!610971 () Bool)

(assert (=> bm!33426 m!610971))

(assert (=> b!636343 m!610867))

(declare-fun m!610973 () Bool)

(assert (=> b!636343 m!610973))

(declare-fun m!610975 () Bool)

(assert (=> b!636343 m!610975))

(assert (=> b!636343 m!610867))

(declare-fun m!610977 () Bool)

(assert (=> b!636343 m!610977))

(assert (=> b!636346 m!610867))

(assert (=> b!636346 m!610867))

(declare-fun m!610979 () Bool)

(assert (=> b!636346 m!610979))

(assert (=> b!636067 d!89979))

(declare-fun bm!33429 () Bool)

(declare-fun call!33432 () Bool)

(declare-fun c!72713 () Bool)

(assert (=> bm!33429 (= call!33432 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!72713 (Cons!12281 (select (arr!18337 a!2986) #b00000000000000000000000000000000) Nil!12282) Nil!12282)))))

(declare-fun b!636369 () Bool)

(declare-fun e!364031 () Bool)

(declare-fun e!364030 () Bool)

(assert (=> b!636369 (= e!364031 e!364030)))

(assert (=> b!636369 (= c!72713 (validKeyInArray!0 (select (arr!18337 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!636370 () Bool)

(declare-fun e!364032 () Bool)

(assert (=> b!636370 (= e!364032 (contains!3077 Nil!12282 (select (arr!18337 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!636371 () Bool)

(assert (=> b!636371 (= e!364030 call!33432)))

(declare-fun d!89987 () Bool)

(declare-fun res!411680 () Bool)

(declare-fun e!364029 () Bool)

(assert (=> d!89987 (=> res!411680 e!364029)))

(assert (=> d!89987 (= res!411680 (bvsge #b00000000000000000000000000000000 (size!18701 a!2986)))))

(assert (=> d!89987 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12282) e!364029)))

(declare-fun b!636372 () Bool)

(assert (=> b!636372 (= e!364030 call!33432)))

(declare-fun b!636373 () Bool)

(assert (=> b!636373 (= e!364029 e!364031)))

(declare-fun res!411682 () Bool)

(assert (=> b!636373 (=> (not res!411682) (not e!364031))))

(assert (=> b!636373 (= res!411682 (not e!364032))))

(declare-fun res!411681 () Bool)

(assert (=> b!636373 (=> (not res!411681) (not e!364032))))

(assert (=> b!636373 (= res!411681 (validKeyInArray!0 (select (arr!18337 a!2986) #b00000000000000000000000000000000)))))

(assert (= (and d!89987 (not res!411680)) b!636373))

(assert (= (and b!636373 res!411681) b!636370))

(assert (= (and b!636373 res!411682) b!636369))

(assert (= (and b!636369 c!72713) b!636371))

(assert (= (and b!636369 (not c!72713)) b!636372))

(assert (= (or b!636371 b!636372) bm!33429))

(assert (=> bm!33429 m!610867))

(declare-fun m!610981 () Bool)

(assert (=> bm!33429 m!610981))

(assert (=> b!636369 m!610867))

(assert (=> b!636369 m!610867))

(assert (=> b!636369 m!610979))

(assert (=> b!636370 m!610867))

(assert (=> b!636370 m!610867))

(declare-fun m!610983 () Bool)

(assert (=> b!636370 m!610983))

(assert (=> b!636373 m!610867))

(assert (=> b!636373 m!610867))

(assert (=> b!636373 m!610979))

(assert (=> b!636066 d!89987))

(declare-fun d!89989 () Bool)

(declare-fun res!411683 () Bool)

(declare-fun e!364036 () Bool)

(assert (=> d!89989 (=> res!411683 e!364036)))

(assert (=> d!89989 (= res!411683 (= (select (arr!18337 lt!294131) j!136) (select (arr!18337 a!2986) j!136)))))

(assert (=> d!89989 (= (arrayContainsKey!0 lt!294131 (select (arr!18337 a!2986) j!136) j!136) e!364036)))

(declare-fun b!636380 () Bool)

(declare-fun e!364037 () Bool)

(assert (=> b!636380 (= e!364036 e!364037)))

(declare-fun res!411684 () Bool)

(assert (=> b!636380 (=> (not res!411684) (not e!364037))))

(assert (=> b!636380 (= res!411684 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18701 lt!294131)))))

(declare-fun b!636381 () Bool)

(assert (=> b!636381 (= e!364037 (arrayContainsKey!0 lt!294131 (select (arr!18337 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!89989 (not res!411683)) b!636380))

(assert (= (and b!636380 res!411684) b!636381))

(declare-fun m!610995 () Bool)

(assert (=> d!89989 m!610995))

(assert (=> b!636381 m!610711))

(declare-fun m!610997 () Bool)

(assert (=> b!636381 m!610997))

(assert (=> b!636076 d!89989))

(declare-fun d!89993 () Bool)

(declare-fun res!411685 () Bool)

(declare-fun e!364041 () Bool)

(assert (=> d!89993 (=> res!411685 e!364041)))

(assert (=> d!89993 (= res!411685 (= (select (arr!18337 lt!294131) index!984) (select (arr!18337 a!2986) j!136)))))

(assert (=> d!89993 (= (arrayContainsKey!0 lt!294131 (select (arr!18337 a!2986) j!136) index!984) e!364041)))

(declare-fun b!636388 () Bool)

(declare-fun e!364042 () Bool)

(assert (=> b!636388 (= e!364041 e!364042)))

(declare-fun res!411686 () Bool)

(assert (=> b!636388 (=> (not res!411686) (not e!364042))))

(assert (=> b!636388 (= res!411686 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18701 lt!294131)))))

(declare-fun b!636389 () Bool)

(assert (=> b!636389 (= e!364042 (arrayContainsKey!0 lt!294131 (select (arr!18337 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!89993 (not res!411685)) b!636388))

(assert (= (and b!636388 res!411686) b!636389))

(assert (=> d!89993 m!610905))

(assert (=> b!636389 m!610711))

(declare-fun m!611001 () Bool)

(assert (=> b!636389 m!611001))

(assert (=> b!636075 d!89993))

(declare-fun d!89995 () Bool)

(declare-fun res!411687 () Bool)

(declare-fun e!364043 () Bool)

(assert (=> d!89995 (=> res!411687 e!364043)))

(assert (=> d!89995 (= res!411687 (= (select (arr!18337 lt!294131) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!18337 a!2986) j!136)))))

(assert (=> d!89995 (= (arrayContainsKey!0 lt!294131 (select (arr!18337 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!364043)))

(declare-fun b!636390 () Bool)

(declare-fun e!364044 () Bool)

(assert (=> b!636390 (= e!364043 e!364044)))

(declare-fun res!411688 () Bool)

(assert (=> b!636390 (=> (not res!411688) (not e!364044))))

(assert (=> b!636390 (= res!411688 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18701 lt!294131)))))

(declare-fun b!636391 () Bool)

(assert (=> b!636391 (= e!364044 (arrayContainsKey!0 lt!294131 (select (arr!18337 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!89995 (not res!411687)) b!636390))

(assert (= (and b!636390 res!411688) b!636391))

(declare-fun m!611011 () Bool)

(assert (=> d!89995 m!611011))

(assert (=> b!636391 m!610711))

(declare-fun m!611013 () Bool)

(assert (=> b!636391 m!611013))

(assert (=> b!636072 d!89995))

(declare-fun d!89999 () Bool)

(assert (=> d!89999 (arrayContainsKey!0 lt!294131 (select (arr!18337 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!294277 () Unit!21441)

(declare-fun choose!114 (array!38226 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21441)

(assert (=> d!89999 (= lt!294277 (choose!114 lt!294131 (select (arr!18337 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> d!89999 (bvsge index!984 #b00000000000000000000000000000000)))

(assert (=> d!89999 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!294131 (select (arr!18337 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)) lt!294277)))

(declare-fun bs!19125 () Bool)

(assert (= bs!19125 d!89999))

(assert (=> bs!19125 m!610711))

(assert (=> bs!19125 m!610715))

(assert (=> bs!19125 m!610711))

(declare-fun m!611023 () Bool)

(assert (=> bs!19125 m!611023))

(assert (=> b!636072 d!89999))

(declare-fun d!90003 () Bool)

(assert (=> d!90003 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!636061 d!90003))

(check-sat (not b!636343) (not d!89999) (not d!89955) (not b!636202) (not b!636231) (not d!89957) (not b!636208) (not b!636369) (not d!89969) (not b!636381) (not bm!33426) (not bm!33429) (not b!636225) (not d!89953) (not b!636237) (not b!636370) (not b!636346) (not b!636249) (not b!636207) (not d!89971) (not b!636389) (not b!636373) (not b!636391) (not b!636312) (not d!89959) (not d!89951) (not b!636211))
(check-sat)
