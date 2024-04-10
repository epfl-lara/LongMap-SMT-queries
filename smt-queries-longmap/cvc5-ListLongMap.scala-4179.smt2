; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56990 () Bool)

(assert start!56990)

(declare-fun b!630739 () Bool)

(declare-fun res!407736 () Bool)

(declare-fun e!360660 () Bool)

(assert (=> b!630739 (=> (not res!407736) (not e!360660))))

(declare-datatypes ((array!38066 0))(
  ( (array!38067 (arr!18267 (Array (_ BitVec 32) (_ BitVec 64))) (size!18631 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38066)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!630739 (= res!407736 (validKeyInArray!0 (select (arr!18267 a!2986) j!136)))))

(declare-fun res!407739 () Bool)

(assert (=> start!56990 (=> (not res!407739) (not e!360660))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56990 (= res!407739 (validMask!0 mask!3053))))

(assert (=> start!56990 e!360660))

(assert (=> start!56990 true))

(declare-fun array_inv!14063 (array!38066) Bool)

(assert (=> start!56990 (array_inv!14063 a!2986)))

(declare-fun b!630740 () Bool)

(declare-fun res!407744 () Bool)

(assert (=> b!630740 (=> (not res!407744) (not e!360660))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!38066 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!630740 (= res!407744 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!630741 () Bool)

(declare-fun e!360666 () Bool)

(declare-datatypes ((SeekEntryResult!6707 0))(
  ( (MissingZero!6707 (index!29118 (_ BitVec 32))) (Found!6707 (index!29119 (_ BitVec 32))) (Intermediate!6707 (undefined!7519 Bool) (index!29120 (_ BitVec 32)) (x!57861 (_ BitVec 32))) (Undefined!6707) (MissingVacant!6707 (index!29121 (_ BitVec 32))) )
))
(declare-fun lt!291331 () SeekEntryResult!6707)

(declare-fun lt!291329 () SeekEntryResult!6707)

(assert (=> b!630741 (= e!360666 (= lt!291331 lt!291329))))

(declare-fun b!630742 () Bool)

(declare-fun res!407742 () Bool)

(assert (=> b!630742 (=> (not res!407742) (not e!360660))))

(assert (=> b!630742 (= res!407742 (validKeyInArray!0 k!1786))))

(declare-fun b!630743 () Bool)

(declare-fun res!407741 () Bool)

(declare-fun e!360661 () Bool)

(assert (=> b!630743 (=> (not res!407741) (not e!360661))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!630743 (= res!407741 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18267 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!630744 () Bool)

(declare-fun e!360662 () Bool)

(assert (=> b!630744 (= e!360661 e!360662)))

(declare-fun res!407735 () Bool)

(assert (=> b!630744 (=> (not res!407735) (not e!360662))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!630744 (= res!407735 (= (select (store (arr!18267 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!291328 () array!38066)

(assert (=> b!630744 (= lt!291328 (array!38067 (store (arr!18267 a!2986) i!1108 k!1786) (size!18631 a!2986)))))

(declare-fun b!630745 () Bool)

(declare-fun res!407737 () Bool)

(assert (=> b!630745 (=> (not res!407737) (not e!360661))))

(declare-datatypes ((List!12308 0))(
  ( (Nil!12305) (Cons!12304 (h!13349 (_ BitVec 64)) (t!18536 List!12308)) )
))
(declare-fun arrayNoDuplicates!0 (array!38066 (_ BitVec 32) List!12308) Bool)

(assert (=> b!630745 (= res!407737 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12305))))

(declare-fun b!630746 () Bool)

(declare-fun e!360664 () Bool)

(assert (=> b!630746 (= e!360664 (not true))))

(declare-datatypes ((Unit!21162 0))(
  ( (Unit!21163) )
))
(declare-fun lt!291330 () Unit!21162)

(declare-fun e!360663 () Unit!21162)

(assert (=> b!630746 (= lt!291330 e!360663)))

(declare-fun c!71870 () Bool)

(declare-fun lt!291327 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38066 (_ BitVec 32)) SeekEntryResult!6707)

(assert (=> b!630746 (= c!71870 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!291327 lt!291328 mask!3053) Undefined!6707))))

(assert (=> b!630746 e!360666))

(declare-fun res!407743 () Bool)

(assert (=> b!630746 (=> (not res!407743) (not e!360666))))

(declare-fun lt!291332 () (_ BitVec 32))

(assert (=> b!630746 (= res!407743 (= lt!291329 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!291332 vacantSpotIndex!68 lt!291327 lt!291328 mask!3053)))))

(assert (=> b!630746 (= lt!291329 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!291332 vacantSpotIndex!68 (select (arr!18267 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!630746 (= lt!291327 (select (store (arr!18267 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!291334 () Unit!21162)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38066 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21162)

(assert (=> b!630746 (= lt!291334 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!291332 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!630746 (= lt!291332 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!630747 () Bool)

(declare-fun Unit!21164 () Unit!21162)

(assert (=> b!630747 (= e!360663 Unit!21164)))

(assert (=> b!630747 false))

(declare-fun b!630748 () Bool)

(assert (=> b!630748 (= e!360660 e!360661)))

(declare-fun res!407734 () Bool)

(assert (=> b!630748 (=> (not res!407734) (not e!360661))))

(declare-fun lt!291333 () SeekEntryResult!6707)

(assert (=> b!630748 (= res!407734 (or (= lt!291333 (MissingZero!6707 i!1108)) (= lt!291333 (MissingVacant!6707 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38066 (_ BitVec 32)) SeekEntryResult!6707)

(assert (=> b!630748 (= lt!291333 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!630749 () Bool)

(declare-fun res!407733 () Bool)

(assert (=> b!630749 (=> (not res!407733) (not e!360661))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38066 (_ BitVec 32)) Bool)

(assert (=> b!630749 (= res!407733 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!630750 () Bool)

(declare-fun res!407738 () Bool)

(assert (=> b!630750 (=> (not res!407738) (not e!360660))))

(assert (=> b!630750 (= res!407738 (and (= (size!18631 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18631 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18631 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!630751 () Bool)

(declare-fun Unit!21165 () Unit!21162)

(assert (=> b!630751 (= e!360663 Unit!21165)))

(declare-fun b!630752 () Bool)

(assert (=> b!630752 (= e!360662 e!360664)))

(declare-fun res!407740 () Bool)

(assert (=> b!630752 (=> (not res!407740) (not e!360664))))

(assert (=> b!630752 (= res!407740 (and (= lt!291331 (Found!6707 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18267 a!2986) index!984) (select (arr!18267 a!2986) j!136))) (not (= (select (arr!18267 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!630752 (= lt!291331 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18267 a!2986) j!136) a!2986 mask!3053))))

(assert (= (and start!56990 res!407739) b!630750))

(assert (= (and b!630750 res!407738) b!630739))

(assert (= (and b!630739 res!407736) b!630742))

(assert (= (and b!630742 res!407742) b!630740))

(assert (= (and b!630740 res!407744) b!630748))

(assert (= (and b!630748 res!407734) b!630749))

(assert (= (and b!630749 res!407733) b!630745))

(assert (= (and b!630745 res!407737) b!630743))

(assert (= (and b!630743 res!407741) b!630744))

(assert (= (and b!630744 res!407735) b!630752))

(assert (= (and b!630752 res!407740) b!630746))

(assert (= (and b!630746 res!407743) b!630741))

(assert (= (and b!630746 c!71870) b!630747))

(assert (= (and b!630746 (not c!71870)) b!630751))

(declare-fun m!605703 () Bool)

(assert (=> b!630743 m!605703))

(declare-fun m!605705 () Bool)

(assert (=> b!630739 m!605705))

(assert (=> b!630739 m!605705))

(declare-fun m!605707 () Bool)

(assert (=> b!630739 m!605707))

(declare-fun m!605709 () Bool)

(assert (=> b!630745 m!605709))

(declare-fun m!605711 () Bool)

(assert (=> start!56990 m!605711))

(declare-fun m!605713 () Bool)

(assert (=> start!56990 m!605713))

(declare-fun m!605715 () Bool)

(assert (=> b!630744 m!605715))

(declare-fun m!605717 () Bool)

(assert (=> b!630744 m!605717))

(declare-fun m!605719 () Bool)

(assert (=> b!630748 m!605719))

(declare-fun m!605721 () Bool)

(assert (=> b!630742 m!605721))

(declare-fun m!605723 () Bool)

(assert (=> b!630746 m!605723))

(declare-fun m!605725 () Bool)

(assert (=> b!630746 m!605725))

(assert (=> b!630746 m!605705))

(declare-fun m!605727 () Bool)

(assert (=> b!630746 m!605727))

(declare-fun m!605729 () Bool)

(assert (=> b!630746 m!605729))

(assert (=> b!630746 m!605705))

(declare-fun m!605731 () Bool)

(assert (=> b!630746 m!605731))

(assert (=> b!630746 m!605715))

(declare-fun m!605733 () Bool)

(assert (=> b!630746 m!605733))

(declare-fun m!605735 () Bool)

(assert (=> b!630740 m!605735))

(declare-fun m!605737 () Bool)

(assert (=> b!630749 m!605737))

(declare-fun m!605739 () Bool)

(assert (=> b!630752 m!605739))

(assert (=> b!630752 m!605705))

(assert (=> b!630752 m!605705))

(declare-fun m!605741 () Bool)

(assert (=> b!630752 m!605741))

(push 1)

