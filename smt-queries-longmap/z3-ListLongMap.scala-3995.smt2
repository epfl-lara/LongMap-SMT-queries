; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54210 () Bool)

(assert start!54210)

(declare-fun b!591911 () Bool)

(declare-fun e!337991 () Bool)

(declare-fun e!337997 () Bool)

(assert (=> b!591911 (= e!337991 (not e!337997))))

(declare-fun res!378725 () Bool)

(assert (=> b!591911 (=> res!378725 e!337997)))

(declare-datatypes ((SeekEntryResult!6106 0))(
  ( (MissingZero!6106 (index!26660 (_ BitVec 32))) (Found!6106 (index!26661 (_ BitVec 32))) (Intermediate!6106 (undefined!6918 Bool) (index!26662 (_ BitVec 32)) (x!55605 (_ BitVec 32))) (Undefined!6106) (MissingVacant!6106 (index!26663 (_ BitVec 32))) )
))
(declare-fun lt!268616 () SeekEntryResult!6106)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!591911 (= res!378725 (not (= lt!268616 (Found!6106 index!984))))))

(declare-datatypes ((Unit!18517 0))(
  ( (Unit!18518) )
))
(declare-fun lt!268619 () Unit!18517)

(declare-fun e!337990 () Unit!18517)

(assert (=> b!591911 (= lt!268619 e!337990)))

(declare-fun c!66965 () Bool)

(assert (=> b!591911 (= c!66965 (= lt!268616 Undefined!6106))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!268617 () (_ BitVec 64))

(declare-datatypes ((array!36885 0))(
  ( (array!36886 (arr!17710 (Array (_ BitVec 32) (_ BitVec 64))) (size!18074 (_ BitVec 32))) )
))
(declare-fun lt!268615 () array!36885)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36885 (_ BitVec 32)) SeekEntryResult!6106)

(assert (=> b!591911 (= lt!268616 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!268617 lt!268615 mask!3053))))

(declare-fun e!337998 () Bool)

(assert (=> b!591911 e!337998))

(declare-fun res!378732 () Bool)

(assert (=> b!591911 (=> (not res!378732) (not e!337998))))

(declare-fun lt!268618 () SeekEntryResult!6106)

(declare-fun lt!268620 () (_ BitVec 32))

(assert (=> b!591911 (= res!378732 (= lt!268618 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!268620 vacantSpotIndex!68 lt!268617 lt!268615 mask!3053)))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun a!2986 () array!36885)

(assert (=> b!591911 (= lt!268618 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!268620 vacantSpotIndex!68 (select (arr!17710 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!591911 (= lt!268617 (select (store (arr!17710 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!268621 () Unit!18517)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36885 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18517)

(assert (=> b!591911 (= lt!268621 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!268620 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!591911 (= lt!268620 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!591912 () Bool)

(declare-fun res!378733 () Bool)

(declare-fun e!337995 () Bool)

(assert (=> b!591912 (=> (not res!378733) (not e!337995))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!591912 (= res!378733 (validKeyInArray!0 k0!1786))))

(declare-fun b!591913 () Bool)

(declare-fun res!378722 () Bool)

(declare-fun e!337989 () Bool)

(assert (=> b!591913 (=> (not res!378722) (not e!337989))))

(assert (=> b!591913 (= res!378722 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17710 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!591914 () Bool)

(declare-fun Unit!18519 () Unit!18517)

(assert (=> b!591914 (= e!337990 Unit!18519)))

(declare-fun b!591915 () Bool)

(declare-fun res!378721 () Bool)

(assert (=> b!591915 (=> (not res!378721) (not e!337995))))

(declare-fun arrayContainsKey!0 (array!36885 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!591915 (= res!378721 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!591916 () Bool)

(declare-fun Unit!18520 () Unit!18517)

(assert (=> b!591916 (= e!337990 Unit!18520)))

(assert (=> b!591916 false))

(declare-fun b!591918 () Bool)

(declare-fun res!378729 () Bool)

(assert (=> b!591918 (=> (not res!378729) (not e!337995))))

(assert (=> b!591918 (= res!378729 (and (= (size!18074 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18074 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18074 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!591919 () Bool)

(assert (=> b!591919 (= e!337995 e!337989)))

(declare-fun res!378724 () Bool)

(assert (=> b!591919 (=> (not res!378724) (not e!337989))))

(declare-fun lt!268622 () SeekEntryResult!6106)

(assert (=> b!591919 (= res!378724 (or (= lt!268622 (MissingZero!6106 i!1108)) (= lt!268622 (MissingVacant!6106 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36885 (_ BitVec 32)) SeekEntryResult!6106)

(assert (=> b!591919 (= lt!268622 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!591920 () Bool)

(declare-fun res!378723 () Bool)

(assert (=> b!591920 (=> (not res!378723) (not e!337995))))

(assert (=> b!591920 (= res!378723 (validKeyInArray!0 (select (arr!17710 a!2986) j!136)))))

(declare-fun b!591921 () Bool)

(declare-fun e!337994 () Bool)

(assert (=> b!591921 (= e!337989 e!337994)))

(declare-fun res!378730 () Bool)

(assert (=> b!591921 (=> (not res!378730) (not e!337994))))

(assert (=> b!591921 (= res!378730 (= (select (store (arr!17710 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!591921 (= lt!268615 (array!36886 (store (arr!17710 a!2986) i!1108 k0!1786) (size!18074 a!2986)))))

(declare-fun b!591922 () Bool)

(declare-fun res!378728 () Bool)

(assert (=> b!591922 (=> (not res!378728) (not e!337989))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36885 (_ BitVec 32)) Bool)

(assert (=> b!591922 (= res!378728 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun e!337988 () Bool)

(declare-fun b!591923 () Bool)

(assert (=> b!591923 (= e!337988 (arrayContainsKey!0 lt!268615 (select (arr!17710 a!2986) j!136) index!984))))

(declare-fun b!591924 () Bool)

(declare-fun res!378726 () Bool)

(assert (=> b!591924 (=> (not res!378726) (not e!337989))))

(declare-datatypes ((List!11658 0))(
  ( (Nil!11655) (Cons!11654 (h!12702 (_ BitVec 64)) (t!17878 List!11658)) )
))
(declare-fun arrayNoDuplicates!0 (array!36885 (_ BitVec 32) List!11658) Bool)

(assert (=> b!591924 (= res!378726 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11655))))

(declare-fun b!591925 () Bool)

(declare-fun e!337996 () Bool)

(assert (=> b!591925 (= e!337996 e!337988)))

(declare-fun res!378731 () Bool)

(assert (=> b!591925 (=> (not res!378731) (not e!337988))))

(assert (=> b!591925 (= res!378731 (arrayContainsKey!0 lt!268615 (select (arr!17710 a!2986) j!136) j!136))))

(declare-fun b!591926 () Bool)

(assert (=> b!591926 (= e!337997 true)))

(declare-fun e!337993 () Bool)

(assert (=> b!591926 e!337993))

(declare-fun res!378727 () Bool)

(assert (=> b!591926 (=> (not res!378727) (not e!337993))))

(declare-fun lt!268624 () (_ BitVec 64))

(assert (=> b!591926 (= res!378727 (= lt!268624 (select (arr!17710 a!2986) j!136)))))

(assert (=> b!591926 (= lt!268624 (select (store (arr!17710 a!2986) i!1108 k0!1786) index!984))))

(declare-fun res!378719 () Bool)

(assert (=> start!54210 (=> (not res!378719) (not e!337995))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54210 (= res!378719 (validMask!0 mask!3053))))

(assert (=> start!54210 e!337995))

(assert (=> start!54210 true))

(declare-fun array_inv!13569 (array!36885) Bool)

(assert (=> start!54210 (array_inv!13569 a!2986)))

(declare-fun b!591917 () Bool)

(assert (=> b!591917 (= e!337994 e!337991)))

(declare-fun res!378718 () Bool)

(assert (=> b!591917 (=> (not res!378718) (not e!337991))))

(declare-fun lt!268623 () SeekEntryResult!6106)

(assert (=> b!591917 (= res!378718 (and (= lt!268623 (Found!6106 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17710 a!2986) index!984) (select (arr!17710 a!2986) j!136))) (not (= (select (arr!17710 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!591917 (= lt!268623 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17710 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!591927 () Bool)

(assert (=> b!591927 (= e!337998 (= lt!268623 lt!268618))))

(declare-fun b!591928 () Bool)

(assert (=> b!591928 (= e!337993 e!337996)))

(declare-fun res!378720 () Bool)

(assert (=> b!591928 (=> res!378720 e!337996)))

(assert (=> b!591928 (= res!378720 (or (not (= (select (arr!17710 a!2986) j!136) lt!268617)) (not (= (select (arr!17710 a!2986) j!136) lt!268624)) (bvsge j!136 index!984)))))

(assert (= (and start!54210 res!378719) b!591918))

(assert (= (and b!591918 res!378729) b!591920))

(assert (= (and b!591920 res!378723) b!591912))

(assert (= (and b!591912 res!378733) b!591915))

(assert (= (and b!591915 res!378721) b!591919))

(assert (= (and b!591919 res!378724) b!591922))

(assert (= (and b!591922 res!378728) b!591924))

(assert (= (and b!591924 res!378726) b!591913))

(assert (= (and b!591913 res!378722) b!591921))

(assert (= (and b!591921 res!378730) b!591917))

(assert (= (and b!591917 res!378718) b!591911))

(assert (= (and b!591911 res!378732) b!591927))

(assert (= (and b!591911 c!66965) b!591916))

(assert (= (and b!591911 (not c!66965)) b!591914))

(assert (= (and b!591911 (not res!378725)) b!591926))

(assert (= (and b!591926 res!378727) b!591928))

(assert (= (and b!591928 (not res!378720)) b!591925))

(assert (= (and b!591925 res!378731) b!591923))

(declare-fun m!570287 () Bool)

(assert (=> b!591922 m!570287))

(declare-fun m!570289 () Bool)

(assert (=> b!591923 m!570289))

(assert (=> b!591923 m!570289))

(declare-fun m!570291 () Bool)

(assert (=> b!591923 m!570291))

(assert (=> b!591920 m!570289))

(assert (=> b!591920 m!570289))

(declare-fun m!570293 () Bool)

(assert (=> b!591920 m!570293))

(declare-fun m!570295 () Bool)

(assert (=> b!591919 m!570295))

(declare-fun m!570297 () Bool)

(assert (=> b!591915 m!570297))

(assert (=> b!591926 m!570289))

(declare-fun m!570299 () Bool)

(assert (=> b!591926 m!570299))

(declare-fun m!570301 () Bool)

(assert (=> b!591926 m!570301))

(declare-fun m!570303 () Bool)

(assert (=> b!591912 m!570303))

(assert (=> b!591921 m!570299))

(declare-fun m!570305 () Bool)

(assert (=> b!591921 m!570305))

(declare-fun m!570307 () Bool)

(assert (=> b!591911 m!570307))

(declare-fun m!570309 () Bool)

(assert (=> b!591911 m!570309))

(declare-fun m!570311 () Bool)

(assert (=> b!591911 m!570311))

(assert (=> b!591911 m!570289))

(assert (=> b!591911 m!570299))

(assert (=> b!591911 m!570289))

(declare-fun m!570313 () Bool)

(assert (=> b!591911 m!570313))

(declare-fun m!570315 () Bool)

(assert (=> b!591911 m!570315))

(declare-fun m!570317 () Bool)

(assert (=> b!591911 m!570317))

(declare-fun m!570319 () Bool)

(assert (=> b!591913 m!570319))

(declare-fun m!570321 () Bool)

(assert (=> b!591924 m!570321))

(declare-fun m!570323 () Bool)

(assert (=> b!591917 m!570323))

(assert (=> b!591917 m!570289))

(assert (=> b!591917 m!570289))

(declare-fun m!570325 () Bool)

(assert (=> b!591917 m!570325))

(assert (=> b!591928 m!570289))

(declare-fun m!570327 () Bool)

(assert (=> start!54210 m!570327))

(declare-fun m!570329 () Bool)

(assert (=> start!54210 m!570329))

(assert (=> b!591925 m!570289))

(assert (=> b!591925 m!570289))

(declare-fun m!570331 () Bool)

(assert (=> b!591925 m!570331))

(check-sat (not b!591920) (not b!591923) (not b!591917) (not b!591925) (not b!591915) (not b!591912) (not b!591911) (not b!591919) (not b!591922) (not b!591924) (not start!54210))
(check-sat)
