; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57352 () Bool)

(assert start!57352)

(declare-fun b!634916 () Bool)

(declare-fun res!410750 () Bool)

(declare-fun e!363101 () Bool)

(assert (=> b!634916 (=> (not res!410750) (not e!363101))))

(declare-datatypes ((array!38205 0))(
  ( (array!38206 (arr!18331 (Array (_ BitVec 32) (_ BitVec 64))) (size!18695 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38205)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!634916 (= res!410750 (validKeyInArray!0 (select (arr!18331 a!2986) j!136)))))

(declare-fun b!634917 () Bool)

(declare-fun e!363111 () Bool)

(declare-datatypes ((SeekEntryResult!6771 0))(
  ( (MissingZero!6771 (index!29386 (_ BitVec 32))) (Found!6771 (index!29387 (_ BitVec 32))) (Intermediate!6771 (undefined!7583 Bool) (index!29388 (_ BitVec 32)) (x!58129 (_ BitVec 32))) (Undefined!6771) (MissingVacant!6771 (index!29389 (_ BitVec 32))) )
))
(declare-fun lt!293547 () SeekEntryResult!6771)

(declare-fun lt!293544 () SeekEntryResult!6771)

(assert (=> b!634917 (= e!363111 (= lt!293547 lt!293544))))

(declare-fun b!634918 () Bool)

(declare-fun res!410742 () Bool)

(assert (=> b!634918 (=> (not res!410742) (not e!363101))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!38205 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!634918 (= res!410742 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!634919 () Bool)

(declare-fun e!363109 () Bool)

(declare-fun e!363104 () Bool)

(assert (=> b!634919 (= e!363109 e!363104)))

(declare-fun res!410749 () Bool)

(assert (=> b!634919 (=> (not res!410749) (not e!363104))))

(declare-fun lt!293548 () array!38205)

(assert (=> b!634919 (= res!410749 (arrayContainsKey!0 lt!293548 (select (arr!18331 a!2986) j!136) j!136))))

(declare-fun b!634920 () Bool)

(declare-datatypes ((Unit!21418 0))(
  ( (Unit!21419) )
))
(declare-fun e!363106 () Unit!21418)

(declare-fun Unit!21420 () Unit!21418)

(assert (=> b!634920 (= e!363106 Unit!21420)))

(declare-fun res!410741 () Bool)

(assert (=> start!57352 (=> (not res!410741) (not e!363101))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57352 (= res!410741 (validMask!0 mask!3053))))

(assert (=> start!57352 e!363101))

(assert (=> start!57352 true))

(declare-fun array_inv!14127 (array!38205) Bool)

(assert (=> start!57352 (array_inv!14127 a!2986)))

(declare-fun b!634921 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!634921 (= e!363104 (arrayContainsKey!0 lt!293548 (select (arr!18331 a!2986) j!136) index!984))))

(declare-fun b!634922 () Bool)

(declare-fun Unit!21421 () Unit!21418)

(assert (=> b!634922 (= e!363106 Unit!21421)))

(assert (=> b!634922 false))

(declare-fun b!634923 () Bool)

(declare-fun res!410740 () Bool)

(assert (=> b!634923 (=> (not res!410740) (not e!363101))))

(assert (=> b!634923 (= res!410740 (validKeyInArray!0 k0!1786))))

(declare-fun b!634924 () Bool)

(declare-fun e!363108 () Bool)

(assert (=> b!634924 (= e!363108 true)))

(assert (=> b!634924 (arrayContainsKey!0 lt!293548 (select (arr!18331 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!293545 () Unit!21418)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38205 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21418)

(assert (=> b!634924 (= lt!293545 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!293548 (select (arr!18331 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!634925 () Bool)

(declare-fun res!410748 () Bool)

(declare-fun e!363107 () Bool)

(assert (=> b!634925 (=> (not res!410748) (not e!363107))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!634925 (= res!410748 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18331 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!634926 () Bool)

(declare-fun e!363105 () Bool)

(assert (=> b!634926 (= e!363105 e!363109)))

(declare-fun res!410755 () Bool)

(assert (=> b!634926 (=> res!410755 e!363109)))

(declare-fun lt!293550 () (_ BitVec 64))

(declare-fun lt!293549 () (_ BitVec 64))

(assert (=> b!634926 (= res!410755 (or (not (= (select (arr!18331 a!2986) j!136) lt!293550)) (not (= (select (arr!18331 a!2986) j!136) lt!293549)) (bvsge j!136 index!984)))))

(declare-fun b!634927 () Bool)

(declare-fun e!363100 () Bool)

(declare-fun e!363103 () Bool)

(assert (=> b!634927 (= e!363100 (not e!363103))))

(declare-fun res!410745 () Bool)

(assert (=> b!634927 (=> res!410745 e!363103)))

(declare-fun lt!293554 () SeekEntryResult!6771)

(assert (=> b!634927 (= res!410745 (not (= lt!293554 (Found!6771 index!984))))))

(declare-fun lt!293552 () Unit!21418)

(assert (=> b!634927 (= lt!293552 e!363106)))

(declare-fun c!72455 () Bool)

(assert (=> b!634927 (= c!72455 (= lt!293554 Undefined!6771))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38205 (_ BitVec 32)) SeekEntryResult!6771)

(assert (=> b!634927 (= lt!293554 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!293550 lt!293548 mask!3053))))

(assert (=> b!634927 e!363111))

(declare-fun res!410744 () Bool)

(assert (=> b!634927 (=> (not res!410744) (not e!363111))))

(declare-fun lt!293546 () (_ BitVec 32))

(assert (=> b!634927 (= res!410744 (= lt!293544 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!293546 vacantSpotIndex!68 lt!293550 lt!293548 mask!3053)))))

(assert (=> b!634927 (= lt!293544 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!293546 vacantSpotIndex!68 (select (arr!18331 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!634927 (= lt!293550 (select (store (arr!18331 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!293551 () Unit!21418)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38205 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21418)

(assert (=> b!634927 (= lt!293551 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!293546 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!634927 (= lt!293546 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!634928 () Bool)

(declare-fun res!410752 () Bool)

(assert (=> b!634928 (=> (not res!410752) (not e!363107))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38205 (_ BitVec 32)) Bool)

(assert (=> b!634928 (= res!410752 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!634929 () Bool)

(assert (=> b!634929 (= e!363101 e!363107)))

(declare-fun res!410751 () Bool)

(assert (=> b!634929 (=> (not res!410751) (not e!363107))))

(declare-fun lt!293553 () SeekEntryResult!6771)

(assert (=> b!634929 (= res!410751 (or (= lt!293553 (MissingZero!6771 i!1108)) (= lt!293553 (MissingVacant!6771 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38205 (_ BitVec 32)) SeekEntryResult!6771)

(assert (=> b!634929 (= lt!293553 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!634930 () Bool)

(declare-fun e!363110 () Bool)

(assert (=> b!634930 (= e!363110 e!363100)))

(declare-fun res!410743 () Bool)

(assert (=> b!634930 (=> (not res!410743) (not e!363100))))

(assert (=> b!634930 (= res!410743 (and (= lt!293547 (Found!6771 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18331 a!2986) index!984) (select (arr!18331 a!2986) j!136))) (not (= (select (arr!18331 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!634930 (= lt!293547 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18331 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!634931 () Bool)

(assert (=> b!634931 (= e!363107 e!363110)))

(declare-fun res!410753 () Bool)

(assert (=> b!634931 (=> (not res!410753) (not e!363110))))

(assert (=> b!634931 (= res!410753 (= (select (store (arr!18331 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!634931 (= lt!293548 (array!38206 (store (arr!18331 a!2986) i!1108 k0!1786) (size!18695 a!2986)))))

(declare-fun b!634932 () Bool)

(declare-fun res!410754 () Bool)

(assert (=> b!634932 (=> (not res!410754) (not e!363107))))

(declare-datatypes ((List!12372 0))(
  ( (Nil!12369) (Cons!12368 (h!13413 (_ BitVec 64)) (t!18600 List!12372)) )
))
(declare-fun arrayNoDuplicates!0 (array!38205 (_ BitVec 32) List!12372) Bool)

(assert (=> b!634932 (= res!410754 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12369))))

(declare-fun b!634933 () Bool)

(declare-fun res!410756 () Bool)

(assert (=> b!634933 (=> (not res!410756) (not e!363101))))

(assert (=> b!634933 (= res!410756 (and (= (size!18695 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18695 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18695 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!634934 () Bool)

(assert (=> b!634934 (= e!363103 e!363108)))

(declare-fun res!410747 () Bool)

(assert (=> b!634934 (=> res!410747 e!363108)))

(assert (=> b!634934 (= res!410747 (or (not (= (select (arr!18331 a!2986) j!136) lt!293550)) (not (= (select (arr!18331 a!2986) j!136) lt!293549)) (bvsge j!136 index!984)))))

(assert (=> b!634934 e!363105))

(declare-fun res!410746 () Bool)

(assert (=> b!634934 (=> (not res!410746) (not e!363105))))

(assert (=> b!634934 (= res!410746 (= lt!293549 (select (arr!18331 a!2986) j!136)))))

(assert (=> b!634934 (= lt!293549 (select (store (arr!18331 a!2986) i!1108 k0!1786) index!984))))

(assert (= (and start!57352 res!410741) b!634933))

(assert (= (and b!634933 res!410756) b!634916))

(assert (= (and b!634916 res!410750) b!634923))

(assert (= (and b!634923 res!410740) b!634918))

(assert (= (and b!634918 res!410742) b!634929))

(assert (= (and b!634929 res!410751) b!634928))

(assert (= (and b!634928 res!410752) b!634932))

(assert (= (and b!634932 res!410754) b!634925))

(assert (= (and b!634925 res!410748) b!634931))

(assert (= (and b!634931 res!410753) b!634930))

(assert (= (and b!634930 res!410743) b!634927))

(assert (= (and b!634927 res!410744) b!634917))

(assert (= (and b!634927 c!72455) b!634922))

(assert (= (and b!634927 (not c!72455)) b!634920))

(assert (= (and b!634927 (not res!410745)) b!634934))

(assert (= (and b!634934 res!410746) b!634926))

(assert (= (and b!634926 (not res!410755)) b!634919))

(assert (= (and b!634919 res!410749) b!634921))

(assert (= (and b!634934 (not res!410747)) b!634924))

(declare-fun m!609343 () Bool)

(assert (=> b!634916 m!609343))

(assert (=> b!634916 m!609343))

(declare-fun m!609345 () Bool)

(assert (=> b!634916 m!609345))

(declare-fun m!609347 () Bool)

(assert (=> b!634929 m!609347))

(declare-fun m!609349 () Bool)

(assert (=> b!634931 m!609349))

(declare-fun m!609351 () Bool)

(assert (=> b!634931 m!609351))

(declare-fun m!609353 () Bool)

(assert (=> b!634925 m!609353))

(declare-fun m!609355 () Bool)

(assert (=> b!634928 m!609355))

(declare-fun m!609357 () Bool)

(assert (=> b!634930 m!609357))

(assert (=> b!634930 m!609343))

(assert (=> b!634930 m!609343))

(declare-fun m!609359 () Bool)

(assert (=> b!634930 m!609359))

(assert (=> b!634934 m!609343))

(assert (=> b!634934 m!609349))

(declare-fun m!609361 () Bool)

(assert (=> b!634934 m!609361))

(assert (=> b!634921 m!609343))

(assert (=> b!634921 m!609343))

(declare-fun m!609363 () Bool)

(assert (=> b!634921 m!609363))

(assert (=> b!634924 m!609343))

(assert (=> b!634924 m!609343))

(declare-fun m!609365 () Bool)

(assert (=> b!634924 m!609365))

(assert (=> b!634924 m!609343))

(declare-fun m!609367 () Bool)

(assert (=> b!634924 m!609367))

(declare-fun m!609369 () Bool)

(assert (=> b!634927 m!609369))

(declare-fun m!609371 () Bool)

(assert (=> b!634927 m!609371))

(declare-fun m!609373 () Bool)

(assert (=> b!634927 m!609373))

(assert (=> b!634927 m!609343))

(declare-fun m!609375 () Bool)

(assert (=> b!634927 m!609375))

(assert (=> b!634927 m!609343))

(declare-fun m!609377 () Bool)

(assert (=> b!634927 m!609377))

(declare-fun m!609379 () Bool)

(assert (=> b!634927 m!609379))

(assert (=> b!634927 m!609349))

(declare-fun m!609381 () Bool)

(assert (=> b!634918 m!609381))

(declare-fun m!609383 () Bool)

(assert (=> b!634923 m!609383))

(assert (=> b!634919 m!609343))

(assert (=> b!634919 m!609343))

(declare-fun m!609385 () Bool)

(assert (=> b!634919 m!609385))

(assert (=> b!634926 m!609343))

(declare-fun m!609387 () Bool)

(assert (=> start!57352 m!609387))

(declare-fun m!609389 () Bool)

(assert (=> start!57352 m!609389))

(declare-fun m!609391 () Bool)

(assert (=> b!634932 m!609391))

(check-sat (not b!634916) (not b!634928) (not b!634927) (not b!634930) (not b!634921) (not start!57352) (not b!634924) (not b!634929) (not b!634918) (not b!634919) (not b!634923) (not b!634932))
(check-sat)
