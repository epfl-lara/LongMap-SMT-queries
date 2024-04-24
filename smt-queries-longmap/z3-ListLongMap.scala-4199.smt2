; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57402 () Bool)

(assert start!57402)

(declare-fun b!634912 () Bool)

(declare-fun res!410653 () Bool)

(declare-fun e!363106 () Bool)

(assert (=> b!634912 (=> (not res!410653) (not e!363106))))

(declare-datatypes ((array!38193 0))(
  ( (array!38194 (arr!18322 (Array (_ BitVec 32) (_ BitVec 64))) (size!18686 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38193)

(declare-datatypes ((List!12270 0))(
  ( (Nil!12267) (Cons!12266 (h!13314 (_ BitVec 64)) (t!18490 List!12270)) )
))
(declare-fun arrayNoDuplicates!0 (array!38193 (_ BitVec 32) List!12270) Bool)

(assert (=> b!634912 (= res!410653 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12267))))

(declare-fun b!634913 () Bool)

(declare-fun e!363100 () Bool)

(assert (=> b!634913 (= e!363106 e!363100)))

(declare-fun res!410663 () Bool)

(assert (=> b!634913 (=> (not res!410663) (not e!363100))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!634913 (= res!410663 (= (select (store (arr!18322 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!293520 () array!38193)

(assert (=> b!634913 (= lt!293520 (array!38194 (store (arr!18322 a!2986) i!1108 k0!1786) (size!18686 a!2986)))))

(declare-fun b!634914 () Bool)

(declare-fun res!410659 () Bool)

(declare-fun e!363104 () Bool)

(assert (=> b!634914 (=> (not res!410659) (not e!363104))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!634914 (= res!410659 (validKeyInArray!0 (select (arr!18322 a!2986) j!136)))))

(declare-fun b!634915 () Bool)

(declare-datatypes ((Unit!21381 0))(
  ( (Unit!21382) )
))
(declare-fun e!363101 () Unit!21381)

(declare-fun Unit!21383 () Unit!21381)

(assert (=> b!634915 (= e!363101 Unit!21383)))

(declare-fun b!634916 () Bool)

(declare-fun res!410661 () Bool)

(assert (=> b!634916 (=> (not res!410661) (not e!363106))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38193 (_ BitVec 32)) Bool)

(assert (=> b!634916 (= res!410661 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!634917 () Bool)

(declare-fun res!410651 () Bool)

(assert (=> b!634917 (=> (not res!410651) (not e!363104))))

(assert (=> b!634917 (= res!410651 (and (= (size!18686 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18686 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18686 a!2986)) (not (= i!1108 j!136))))))

(declare-fun res!410656 () Bool)

(assert (=> start!57402 (=> (not res!410656) (not e!363104))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57402 (= res!410656 (validMask!0 mask!3053))))

(assert (=> start!57402 e!363104))

(assert (=> start!57402 true))

(declare-fun array_inv!14181 (array!38193) Bool)

(assert (=> start!57402 (array_inv!14181 a!2986)))

(declare-fun b!634918 () Bool)

(declare-fun e!363108 () Bool)

(assert (=> b!634918 (= e!363100 e!363108)))

(declare-fun res!410652 () Bool)

(assert (=> b!634918 (=> (not res!410652) (not e!363108))))

(declare-datatypes ((SeekEntryResult!6718 0))(
  ( (MissingZero!6718 (index!29174 (_ BitVec 32))) (Found!6718 (index!29175 (_ BitVec 32))) (Intermediate!6718 (undefined!7530 Bool) (index!29176 (_ BitVec 32)) (x!58071 (_ BitVec 32))) (Undefined!6718) (MissingVacant!6718 (index!29177 (_ BitVec 32))) )
))
(declare-fun lt!293523 () SeekEntryResult!6718)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!634918 (= res!410652 (and (= lt!293523 (Found!6718 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18322 a!2986) index!984) (select (arr!18322 a!2986) j!136))) (not (= (select (arr!18322 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38193 (_ BitVec 32)) SeekEntryResult!6718)

(assert (=> b!634918 (= lt!293523 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18322 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!634919 () Bool)

(declare-fun e!363107 () Bool)

(assert (=> b!634919 (= e!363108 (not e!363107))))

(declare-fun res!410658 () Bool)

(assert (=> b!634919 (=> res!410658 e!363107)))

(declare-fun lt!293515 () SeekEntryResult!6718)

(assert (=> b!634919 (= res!410658 (not (= lt!293515 (Found!6718 index!984))))))

(declare-fun lt!293519 () Unit!21381)

(assert (=> b!634919 (= lt!293519 e!363101)))

(declare-fun c!72500 () Bool)

(assert (=> b!634919 (= c!72500 (= lt!293515 Undefined!6718))))

(declare-fun lt!293524 () (_ BitVec 64))

(assert (=> b!634919 (= lt!293515 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!293524 lt!293520 mask!3053))))

(declare-fun e!363097 () Bool)

(assert (=> b!634919 e!363097))

(declare-fun res!410657 () Bool)

(assert (=> b!634919 (=> (not res!410657) (not e!363097))))

(declare-fun lt!293516 () SeekEntryResult!6718)

(declare-fun lt!293521 () (_ BitVec 32))

(assert (=> b!634919 (= res!410657 (= lt!293516 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!293521 vacantSpotIndex!68 lt!293524 lt!293520 mask!3053)))))

(assert (=> b!634919 (= lt!293516 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!293521 vacantSpotIndex!68 (select (arr!18322 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!634919 (= lt!293524 (select (store (arr!18322 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!293517 () Unit!21381)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38193 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21381)

(assert (=> b!634919 (= lt!293517 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!293521 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!634919 (= lt!293521 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!634920 () Bool)

(declare-fun res!410664 () Bool)

(assert (=> b!634920 (=> (not res!410664) (not e!363104))))

(assert (=> b!634920 (= res!410664 (validKeyInArray!0 k0!1786))))

(declare-fun b!634921 () Bool)

(assert (=> b!634921 (= e!363097 (= lt!293523 lt!293516))))

(declare-fun b!634922 () Bool)

(declare-fun e!363105 () Bool)

(declare-fun arrayContainsKey!0 (array!38193 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!634922 (= e!363105 (arrayContainsKey!0 lt!293520 (select (arr!18322 a!2986) j!136) index!984))))

(declare-fun b!634923 () Bool)

(declare-fun e!363102 () Bool)

(assert (=> b!634923 (= e!363102 e!363105)))

(declare-fun res!410655 () Bool)

(assert (=> b!634923 (=> (not res!410655) (not e!363105))))

(assert (=> b!634923 (= res!410655 (arrayContainsKey!0 lt!293520 (select (arr!18322 a!2986) j!136) j!136))))

(declare-fun b!634924 () Bool)

(declare-fun Unit!21384 () Unit!21381)

(assert (=> b!634924 (= e!363101 Unit!21384)))

(assert (=> b!634924 false))

(declare-fun b!634925 () Bool)

(declare-fun e!363103 () Bool)

(assert (=> b!634925 (= e!363103 e!363102)))

(declare-fun res!410654 () Bool)

(assert (=> b!634925 (=> res!410654 e!363102)))

(declare-fun lt!293514 () (_ BitVec 64))

(assert (=> b!634925 (= res!410654 (or (not (= (select (arr!18322 a!2986) j!136) lt!293524)) (not (= (select (arr!18322 a!2986) j!136) lt!293514)) (bvsge j!136 index!984)))))

(declare-fun b!634926 () Bool)

(declare-fun res!410662 () Bool)

(assert (=> b!634926 (=> (not res!410662) (not e!363106))))

(assert (=> b!634926 (= res!410662 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18322 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!634927 () Bool)

(assert (=> b!634927 (= e!363104 e!363106)))

(declare-fun res!410665 () Bool)

(assert (=> b!634927 (=> (not res!410665) (not e!363106))))

(declare-fun lt!293522 () SeekEntryResult!6718)

(assert (=> b!634927 (= res!410665 (or (= lt!293522 (MissingZero!6718 i!1108)) (= lt!293522 (MissingVacant!6718 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38193 (_ BitVec 32)) SeekEntryResult!6718)

(assert (=> b!634927 (= lt!293522 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!634928 () Bool)

(declare-fun e!363099 () Bool)

(assert (=> b!634928 (= e!363107 e!363099)))

(declare-fun res!410660 () Bool)

(assert (=> b!634928 (=> res!410660 e!363099)))

(assert (=> b!634928 (= res!410660 (or (not (= (select (arr!18322 a!2986) j!136) lt!293524)) (not (= (select (arr!18322 a!2986) j!136) lt!293514)) (bvsge j!136 index!984)))))

(assert (=> b!634928 e!363103))

(declare-fun res!410649 () Bool)

(assert (=> b!634928 (=> (not res!410649) (not e!363103))))

(assert (=> b!634928 (= res!410649 (= lt!293514 (select (arr!18322 a!2986) j!136)))))

(assert (=> b!634928 (= lt!293514 (select (store (arr!18322 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!634929 () Bool)

(assert (=> b!634929 (= e!363099 true)))

(assert (=> b!634929 (arrayContainsKey!0 lt!293520 (select (arr!18322 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!293518 () Unit!21381)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38193 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21381)

(assert (=> b!634929 (= lt!293518 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!293520 (select (arr!18322 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!634930 () Bool)

(declare-fun res!410650 () Bool)

(assert (=> b!634930 (=> (not res!410650) (not e!363104))))

(assert (=> b!634930 (= res!410650 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(assert (= (and start!57402 res!410656) b!634917))

(assert (= (and b!634917 res!410651) b!634914))

(assert (= (and b!634914 res!410659) b!634920))

(assert (= (and b!634920 res!410664) b!634930))

(assert (= (and b!634930 res!410650) b!634927))

(assert (= (and b!634927 res!410665) b!634916))

(assert (= (and b!634916 res!410661) b!634912))

(assert (= (and b!634912 res!410653) b!634926))

(assert (= (and b!634926 res!410662) b!634913))

(assert (= (and b!634913 res!410663) b!634918))

(assert (= (and b!634918 res!410652) b!634919))

(assert (= (and b!634919 res!410657) b!634921))

(assert (= (and b!634919 c!72500) b!634924))

(assert (= (and b!634919 (not c!72500)) b!634915))

(assert (= (and b!634919 (not res!410658)) b!634928))

(assert (= (and b!634928 res!410649) b!634925))

(assert (= (and b!634925 (not res!410654)) b!634923))

(assert (= (and b!634923 res!410655) b!634922))

(assert (= (and b!634928 (not res!410660)) b!634929))

(declare-fun m!609709 () Bool)

(assert (=> b!634916 m!609709))

(declare-fun m!609711 () Bool)

(assert (=> b!634920 m!609711))

(declare-fun m!609713 () Bool)

(assert (=> b!634928 m!609713))

(declare-fun m!609715 () Bool)

(assert (=> b!634928 m!609715))

(declare-fun m!609717 () Bool)

(assert (=> b!634928 m!609717))

(declare-fun m!609719 () Bool)

(assert (=> b!634912 m!609719))

(assert (=> b!634929 m!609713))

(assert (=> b!634929 m!609713))

(declare-fun m!609721 () Bool)

(assert (=> b!634929 m!609721))

(assert (=> b!634929 m!609713))

(declare-fun m!609723 () Bool)

(assert (=> b!634929 m!609723))

(declare-fun m!609725 () Bool)

(assert (=> start!57402 m!609725))

(declare-fun m!609727 () Bool)

(assert (=> start!57402 m!609727))

(declare-fun m!609729 () Bool)

(assert (=> b!634918 m!609729))

(assert (=> b!634918 m!609713))

(assert (=> b!634918 m!609713))

(declare-fun m!609731 () Bool)

(assert (=> b!634918 m!609731))

(declare-fun m!609733 () Bool)

(assert (=> b!634927 m!609733))

(declare-fun m!609735 () Bool)

(assert (=> b!634919 m!609735))

(declare-fun m!609737 () Bool)

(assert (=> b!634919 m!609737))

(declare-fun m!609739 () Bool)

(assert (=> b!634919 m!609739))

(assert (=> b!634919 m!609713))

(assert (=> b!634919 m!609715))

(declare-fun m!609741 () Bool)

(assert (=> b!634919 m!609741))

(declare-fun m!609743 () Bool)

(assert (=> b!634919 m!609743))

(assert (=> b!634919 m!609713))

(declare-fun m!609745 () Bool)

(assert (=> b!634919 m!609745))

(declare-fun m!609747 () Bool)

(assert (=> b!634926 m!609747))

(assert (=> b!634923 m!609713))

(assert (=> b!634923 m!609713))

(declare-fun m!609749 () Bool)

(assert (=> b!634923 m!609749))

(assert (=> b!634925 m!609713))

(assert (=> b!634914 m!609713))

(assert (=> b!634914 m!609713))

(declare-fun m!609751 () Bool)

(assert (=> b!634914 m!609751))

(assert (=> b!634913 m!609715))

(declare-fun m!609753 () Bool)

(assert (=> b!634913 m!609753))

(declare-fun m!609755 () Bool)

(assert (=> b!634930 m!609755))

(assert (=> b!634922 m!609713))

(assert (=> b!634922 m!609713))

(declare-fun m!609757 () Bool)

(assert (=> b!634922 m!609757))

(check-sat (not b!634919) (not b!634922) (not b!634912) (not b!634916) (not b!634920) (not b!634918) (not b!634914) (not b!634929) (not b!634930) (not b!634927) (not b!634923) (not start!57402))
(check-sat)
