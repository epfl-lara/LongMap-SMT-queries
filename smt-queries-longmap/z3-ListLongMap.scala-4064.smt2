; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55596 () Bool)

(assert start!55596)

(declare-fun b!609654 () Bool)

(declare-fun res!392257 () Bool)

(declare-fun e!349166 () Bool)

(assert (=> b!609654 (=> (not res!392257) (not e!349166))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!609654 (= res!392257 (validKeyInArray!0 k0!1786))))

(declare-fun b!609655 () Bool)

(declare-fun e!349172 () Bool)

(declare-fun e!349167 () Bool)

(assert (=> b!609655 (= e!349172 e!349167)))

(declare-fun res!392246 () Bool)

(assert (=> b!609655 (=> (not res!392246) (not e!349167))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((array!37341 0))(
  ( (array!37342 (arr!17921 (Array (_ BitVec 32) (_ BitVec 64))) (size!18286 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37341)

(assert (=> b!609655 (= res!392246 (= (select (store (arr!17921 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!278691 () array!37341)

(assert (=> b!609655 (= lt!278691 (array!37342 (store (arr!17921 a!2986) i!1108 k0!1786) (size!18286 a!2986)))))

(declare-fun b!609656 () Bool)

(declare-datatypes ((Unit!19530 0))(
  ( (Unit!19531) )
))
(declare-fun e!349174 () Unit!19530)

(declare-fun Unit!19532 () Unit!19530)

(assert (=> b!609656 (= e!349174 Unit!19532)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!278697 () Unit!19530)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37341 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19530)

(assert (=> b!609656 (= lt!278697 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!278691 (select (arr!17921 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun arrayContainsKey!0 (array!37341 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!609656 (arrayContainsKey!0 lt!278691 (select (arr!17921 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!278692 () Unit!19530)

(declare-datatypes ((List!12001 0))(
  ( (Nil!11998) (Cons!11997 (h!13042 (_ BitVec 64)) (t!18220 List!12001)) )
))
(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37341 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12001) Unit!19530)

(assert (=> b!609656 (= lt!278692 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11998))))

(declare-fun arrayNoDuplicates!0 (array!37341 (_ BitVec 32) List!12001) Bool)

(assert (=> b!609656 (arrayNoDuplicates!0 lt!278691 #b00000000000000000000000000000000 Nil!11998)))

(declare-fun lt!278689 () Unit!19530)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37341 (_ BitVec 32) (_ BitVec 32)) Unit!19530)

(assert (=> b!609656 (= lt!278689 (lemmaNoDuplicateFromThenFromBigger!0 lt!278691 #b00000000000000000000000000000000 j!136))))

(assert (=> b!609656 (arrayNoDuplicates!0 lt!278691 j!136 Nil!11998)))

(declare-fun lt!278682 () Unit!19530)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37341 (_ BitVec 64) (_ BitVec 32) List!12001) Unit!19530)

(assert (=> b!609656 (= lt!278682 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!278691 (select (arr!17921 a!2986) j!136) j!136 Nil!11998))))

(assert (=> b!609656 false))

(declare-fun b!609657 () Bool)

(declare-fun e!349176 () Bool)

(assert (=> b!609657 (= e!349176 (or (bvsgt #b00000000000000000000000000000000 (size!18286 a!2986)) (bvslt (size!18286 a!2986) #b01111111111111111111111111111111)))))

(assert (=> b!609657 (arrayNoDuplicates!0 lt!278691 #b00000000000000000000000000000000 Nil!11998)))

(declare-fun lt!278695 () Unit!19530)

(assert (=> b!609657 (= lt!278695 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11998))))

(assert (=> b!609657 (arrayContainsKey!0 lt!278691 (select (arr!17921 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!278686 () Unit!19530)

(assert (=> b!609657 (= lt!278686 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!278691 (select (arr!17921 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!349168 () Bool)

(assert (=> b!609657 e!349168))

(declare-fun res!392240 () Bool)

(assert (=> b!609657 (=> (not res!392240) (not e!349168))))

(assert (=> b!609657 (= res!392240 (arrayContainsKey!0 lt!278691 (select (arr!17921 a!2986) j!136) j!136))))

(declare-fun b!609658 () Bool)

(declare-fun e!349169 () Bool)

(declare-datatypes ((SeekEntryResult!6358 0))(
  ( (MissingZero!6358 (index!27707 (_ BitVec 32))) (Found!6358 (index!27708 (_ BitVec 32))) (Intermediate!6358 (undefined!7170 Bool) (index!27709 (_ BitVec 32)) (x!56518 (_ BitVec 32))) (Undefined!6358) (MissingVacant!6358 (index!27710 (_ BitVec 32))) )
))
(declare-fun lt!278683 () SeekEntryResult!6358)

(declare-fun lt!278694 () SeekEntryResult!6358)

(assert (=> b!609658 (= e!349169 (= lt!278683 lt!278694))))

(declare-fun b!609659 () Bool)

(declare-fun e!349170 () Bool)

(assert (=> b!609659 (= e!349170 (arrayContainsKey!0 lt!278691 (select (arr!17921 a!2986) j!136) index!984))))

(declare-fun b!609660 () Bool)

(declare-fun Unit!19533 () Unit!19530)

(assert (=> b!609660 (= e!349174 Unit!19533)))

(declare-fun b!609661 () Bool)

(declare-fun e!349165 () Unit!19530)

(declare-fun Unit!19534 () Unit!19530)

(assert (=> b!609661 (= e!349165 Unit!19534)))

(declare-fun b!609662 () Bool)

(declare-fun e!349177 () Bool)

(assert (=> b!609662 (= e!349177 e!349170)))

(declare-fun res!392250 () Bool)

(assert (=> b!609662 (=> (not res!392250) (not e!349170))))

(assert (=> b!609662 (= res!392250 (arrayContainsKey!0 lt!278691 (select (arr!17921 a!2986) j!136) j!136))))

(declare-fun b!609664 () Bool)

(declare-fun res!392251 () Bool)

(assert (=> b!609664 (=> (not res!392251) (not e!349172))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!609664 (= res!392251 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17921 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!609665 () Bool)

(assert (=> b!609665 (= e!349166 e!349172)))

(declare-fun res!392256 () Bool)

(assert (=> b!609665 (=> (not res!392256) (not e!349172))))

(declare-fun lt!278685 () SeekEntryResult!6358)

(assert (=> b!609665 (= res!392256 (or (= lt!278685 (MissingZero!6358 i!1108)) (= lt!278685 (MissingVacant!6358 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37341 (_ BitVec 32)) SeekEntryResult!6358)

(assert (=> b!609665 (= lt!278685 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!609666 () Bool)

(declare-fun res!392245 () Bool)

(assert (=> b!609666 (=> (not res!392245) (not e!349172))))

(assert (=> b!609666 (= res!392245 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11998))))

(declare-fun b!609667 () Bool)

(assert (=> b!609667 (= e!349168 (arrayContainsKey!0 lt!278691 (select (arr!17921 a!2986) j!136) index!984))))

(declare-fun b!609668 () Bool)

(declare-fun res!392253 () Bool)

(assert (=> b!609668 (=> (not res!392253) (not e!349172))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37341 (_ BitVec 32)) Bool)

(assert (=> b!609668 (= res!392253 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!609669 () Bool)

(declare-fun e!349173 () Bool)

(assert (=> b!609669 (= e!349167 e!349173)))

(declare-fun res!392242 () Bool)

(assert (=> b!609669 (=> (not res!392242) (not e!349173))))

(assert (=> b!609669 (= res!392242 (and (= lt!278683 (Found!6358 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17921 a!2986) index!984) (select (arr!17921 a!2986) j!136))) (not (= (select (arr!17921 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37341 (_ BitVec 32)) SeekEntryResult!6358)

(assert (=> b!609669 (= lt!278683 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17921 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!609670 () Bool)

(declare-fun e!349171 () Bool)

(assert (=> b!609670 (= e!349171 e!349176)))

(declare-fun res!392244 () Bool)

(assert (=> b!609670 (=> res!392244 e!349176)))

(assert (=> b!609670 (= res!392244 (bvsge index!984 j!136))))

(declare-fun lt!278698 () Unit!19530)

(assert (=> b!609670 (= lt!278698 e!349174)))

(declare-fun c!69075 () Bool)

(assert (=> b!609670 (= c!69075 (bvslt j!136 index!984))))

(declare-fun res!392255 () Bool)

(assert (=> start!55596 (=> (not res!392255) (not e!349166))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55596 (= res!392255 (validMask!0 mask!3053))))

(assert (=> start!55596 e!349166))

(assert (=> start!55596 true))

(declare-fun array_inv!13804 (array!37341) Bool)

(assert (=> start!55596 (array_inv!13804 a!2986)))

(declare-fun b!609663 () Bool)

(declare-fun res!392252 () Bool)

(assert (=> b!609663 (=> (not res!392252) (not e!349166))))

(assert (=> b!609663 (= res!392252 (validKeyInArray!0 (select (arr!17921 a!2986) j!136)))))

(declare-fun b!609671 () Bool)

(declare-fun Unit!19535 () Unit!19530)

(assert (=> b!609671 (= e!349165 Unit!19535)))

(assert (=> b!609671 false))

(declare-fun b!609672 () Bool)

(declare-fun res!392254 () Bool)

(assert (=> b!609672 (=> (not res!392254) (not e!349166))))

(assert (=> b!609672 (= res!392254 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!609673 () Bool)

(declare-fun e!349178 () Bool)

(assert (=> b!609673 (= e!349178 e!349177)))

(declare-fun res!392247 () Bool)

(assert (=> b!609673 (=> res!392247 e!349177)))

(declare-fun lt!278696 () (_ BitVec 64))

(declare-fun lt!278688 () (_ BitVec 64))

(assert (=> b!609673 (= res!392247 (or (not (= (select (arr!17921 a!2986) j!136) lt!278688)) (not (= (select (arr!17921 a!2986) j!136) lt!278696)) (bvsge j!136 index!984)))))

(declare-fun b!609674 () Bool)

(declare-fun e!349175 () Bool)

(assert (=> b!609674 (= e!349173 (not e!349175))))

(declare-fun res!392243 () Bool)

(assert (=> b!609674 (=> res!392243 e!349175)))

(declare-fun lt!278690 () SeekEntryResult!6358)

(assert (=> b!609674 (= res!392243 (not (= lt!278690 (Found!6358 index!984))))))

(declare-fun lt!278687 () Unit!19530)

(assert (=> b!609674 (= lt!278687 e!349165)))

(declare-fun c!69074 () Bool)

(assert (=> b!609674 (= c!69074 (= lt!278690 Undefined!6358))))

(assert (=> b!609674 (= lt!278690 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!278688 lt!278691 mask!3053))))

(assert (=> b!609674 e!349169))

(declare-fun res!392241 () Bool)

(assert (=> b!609674 (=> (not res!392241) (not e!349169))))

(declare-fun lt!278684 () (_ BitVec 32))

(assert (=> b!609674 (= res!392241 (= lt!278694 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!278684 vacantSpotIndex!68 lt!278688 lt!278691 mask!3053)))))

(assert (=> b!609674 (= lt!278694 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!278684 vacantSpotIndex!68 (select (arr!17921 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!609674 (= lt!278688 (select (store (arr!17921 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!278693 () Unit!19530)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37341 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19530)

(assert (=> b!609674 (= lt!278693 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!278684 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!609674 (= lt!278684 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!609675 () Bool)

(assert (=> b!609675 (= e!349175 e!349171)))

(declare-fun res!392258 () Bool)

(assert (=> b!609675 (=> res!392258 e!349171)))

(assert (=> b!609675 (= res!392258 (or (not (= (select (arr!17921 a!2986) j!136) lt!278688)) (not (= (select (arr!17921 a!2986) j!136) lt!278696))))))

(assert (=> b!609675 e!349178))

(declare-fun res!392249 () Bool)

(assert (=> b!609675 (=> (not res!392249) (not e!349178))))

(assert (=> b!609675 (= res!392249 (= lt!278696 (select (arr!17921 a!2986) j!136)))))

(assert (=> b!609675 (= lt!278696 (select (store (arr!17921 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!609676 () Bool)

(declare-fun res!392248 () Bool)

(assert (=> b!609676 (=> (not res!392248) (not e!349166))))

(assert (=> b!609676 (= res!392248 (and (= (size!18286 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18286 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18286 a!2986)) (not (= i!1108 j!136))))))

(assert (= (and start!55596 res!392255) b!609676))

(assert (= (and b!609676 res!392248) b!609663))

(assert (= (and b!609663 res!392252) b!609654))

(assert (= (and b!609654 res!392257) b!609672))

(assert (= (and b!609672 res!392254) b!609665))

(assert (= (and b!609665 res!392256) b!609668))

(assert (= (and b!609668 res!392253) b!609666))

(assert (= (and b!609666 res!392245) b!609664))

(assert (= (and b!609664 res!392251) b!609655))

(assert (= (and b!609655 res!392246) b!609669))

(assert (= (and b!609669 res!392242) b!609674))

(assert (= (and b!609674 res!392241) b!609658))

(assert (= (and b!609674 c!69074) b!609671))

(assert (= (and b!609674 (not c!69074)) b!609661))

(assert (= (and b!609674 (not res!392243)) b!609675))

(assert (= (and b!609675 res!392249) b!609673))

(assert (= (and b!609673 (not res!392247)) b!609662))

(assert (= (and b!609662 res!392250) b!609659))

(assert (= (and b!609675 (not res!392258)) b!609670))

(assert (= (and b!609670 c!69075) b!609656))

(assert (= (and b!609670 (not c!69075)) b!609660))

(assert (= (and b!609670 (not res!392244)) b!609657))

(assert (= (and b!609657 res!392240) b!609667))

(declare-fun m!585631 () Bool)

(assert (=> start!55596 m!585631))

(declare-fun m!585633 () Bool)

(assert (=> start!55596 m!585633))

(declare-fun m!585635 () Bool)

(assert (=> b!609656 m!585635))

(declare-fun m!585637 () Bool)

(assert (=> b!609656 m!585637))

(assert (=> b!609656 m!585635))

(declare-fun m!585639 () Bool)

(assert (=> b!609656 m!585639))

(declare-fun m!585641 () Bool)

(assert (=> b!609656 m!585641))

(assert (=> b!609656 m!585635))

(declare-fun m!585643 () Bool)

(assert (=> b!609656 m!585643))

(assert (=> b!609656 m!585635))

(declare-fun m!585645 () Bool)

(assert (=> b!609656 m!585645))

(declare-fun m!585647 () Bool)

(assert (=> b!609656 m!585647))

(declare-fun m!585649 () Bool)

(assert (=> b!609656 m!585649))

(declare-fun m!585651 () Bool)

(assert (=> b!609669 m!585651))

(assert (=> b!609669 m!585635))

(assert (=> b!609669 m!585635))

(declare-fun m!585653 () Bool)

(assert (=> b!609669 m!585653))

(declare-fun m!585655 () Bool)

(assert (=> b!609674 m!585655))

(declare-fun m!585657 () Bool)

(assert (=> b!609674 m!585657))

(declare-fun m!585659 () Bool)

(assert (=> b!609674 m!585659))

(assert (=> b!609674 m!585635))

(declare-fun m!585661 () Bool)

(assert (=> b!609674 m!585661))

(declare-fun m!585663 () Bool)

(assert (=> b!609674 m!585663))

(declare-fun m!585665 () Bool)

(assert (=> b!609674 m!585665))

(declare-fun m!585667 () Bool)

(assert (=> b!609674 m!585667))

(assert (=> b!609674 m!585635))

(assert (=> b!609667 m!585635))

(assert (=> b!609667 m!585635))

(declare-fun m!585669 () Bool)

(assert (=> b!609667 m!585669))

(declare-fun m!585671 () Bool)

(assert (=> b!609654 m!585671))

(assert (=> b!609675 m!585635))

(assert (=> b!609675 m!585659))

(declare-fun m!585673 () Bool)

(assert (=> b!609675 m!585673))

(assert (=> b!609657 m!585635))

(declare-fun m!585675 () Bool)

(assert (=> b!609657 m!585675))

(assert (=> b!609657 m!585635))

(declare-fun m!585677 () Bool)

(assert (=> b!609657 m!585677))

(assert (=> b!609657 m!585647))

(assert (=> b!609657 m!585649))

(assert (=> b!609657 m!585635))

(assert (=> b!609657 m!585635))

(declare-fun m!585679 () Bool)

(assert (=> b!609657 m!585679))

(declare-fun m!585681 () Bool)

(assert (=> b!609672 m!585681))

(declare-fun m!585683 () Bool)

(assert (=> b!609668 m!585683))

(assert (=> b!609659 m!585635))

(assert (=> b!609659 m!585635))

(assert (=> b!609659 m!585669))

(assert (=> b!609673 m!585635))

(assert (=> b!609655 m!585659))

(declare-fun m!585685 () Bool)

(assert (=> b!609655 m!585685))

(assert (=> b!609662 m!585635))

(assert (=> b!609662 m!585635))

(assert (=> b!609662 m!585677))

(declare-fun m!585687 () Bool)

(assert (=> b!609665 m!585687))

(assert (=> b!609663 m!585635))

(assert (=> b!609663 m!585635))

(declare-fun m!585689 () Bool)

(assert (=> b!609663 m!585689))

(declare-fun m!585691 () Bool)

(assert (=> b!609664 m!585691))

(declare-fun m!585693 () Bool)

(assert (=> b!609666 m!585693))

(check-sat (not b!609669) (not b!609672) (not b!609665) (not b!609663) (not b!609657) (not b!609662) (not b!609659) (not b!609667) (not b!609656) (not start!55596) (not b!609654) (not b!609666) (not b!609674) (not b!609668))
(check-sat)
(get-model)

(declare-fun d!87881 () Bool)

(declare-fun res!392377 () Bool)

(declare-fun e!349274 () Bool)

(assert (=> d!87881 (=> res!392377 e!349274)))

(assert (=> d!87881 (= res!392377 (= (select (arr!17921 lt!278691) j!136) (select (arr!17921 a!2986) j!136)))))

(assert (=> d!87881 (= (arrayContainsKey!0 lt!278691 (select (arr!17921 a!2986) j!136) j!136) e!349274)))

(declare-fun b!609819 () Bool)

(declare-fun e!349275 () Bool)

(assert (=> b!609819 (= e!349274 e!349275)))

(declare-fun res!392378 () Bool)

(assert (=> b!609819 (=> (not res!392378) (not e!349275))))

(assert (=> b!609819 (= res!392378 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18286 lt!278691)))))

(declare-fun b!609820 () Bool)

(assert (=> b!609820 (= e!349275 (arrayContainsKey!0 lt!278691 (select (arr!17921 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!87881 (not res!392377)) b!609819))

(assert (= (and b!609819 res!392378) b!609820))

(declare-fun m!585823 () Bool)

(assert (=> d!87881 m!585823))

(assert (=> b!609820 m!585635))

(declare-fun m!585825 () Bool)

(assert (=> b!609820 m!585825))

(assert (=> b!609662 d!87881))

(declare-fun d!87883 () Bool)

(declare-fun res!392379 () Bool)

(declare-fun e!349276 () Bool)

(assert (=> d!87883 (=> res!392379 e!349276)))

(assert (=> d!87883 (= res!392379 (= (select (arr!17921 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!87883 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!349276)))

(declare-fun b!609821 () Bool)

(declare-fun e!349277 () Bool)

(assert (=> b!609821 (= e!349276 e!349277)))

(declare-fun res!392380 () Bool)

(assert (=> b!609821 (=> (not res!392380) (not e!349277))))

(assert (=> b!609821 (= res!392380 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18286 a!2986)))))

(declare-fun b!609822 () Bool)

(assert (=> b!609822 (= e!349277 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!87883 (not res!392379)) b!609821))

(assert (= (and b!609821 res!392380) b!609822))

(declare-fun m!585827 () Bool)

(assert (=> d!87883 m!585827))

(declare-fun m!585829 () Bool)

(assert (=> b!609822 m!585829))

(assert (=> b!609672 d!87883))

(declare-fun d!87885 () Bool)

(assert (=> d!87885 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!55596 d!87885))

(declare-fun d!87887 () Bool)

(assert (=> d!87887 (= (array_inv!13804 a!2986) (bvsge (size!18286 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!55596 d!87887))

(declare-fun d!87889 () Bool)

(declare-fun e!349280 () Bool)

(assert (=> d!87889 e!349280))

(declare-fun res!392383 () Bool)

(assert (=> d!87889 (=> (not res!392383) (not e!349280))))

(assert (=> d!87889 (= res!392383 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18286 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18286 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18286 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18286 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18286 a!2986))))))

(declare-fun lt!278803 () Unit!19530)

(declare-fun choose!9 (array!37341 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19530)

(assert (=> d!87889 (= lt!278803 (choose!9 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!278684 vacantSpotIndex!68 mask!3053))))

(assert (=> d!87889 (validMask!0 mask!3053)))

(assert (=> d!87889 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!278684 vacantSpotIndex!68 mask!3053) lt!278803)))

(declare-fun b!609825 () Bool)

(assert (=> b!609825 (= e!349280 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!278684 vacantSpotIndex!68 (select (arr!17921 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!278684 vacantSpotIndex!68 (select (store (arr!17921 a!2986) i!1108 k0!1786) j!136) (array!37342 (store (arr!17921 a!2986) i!1108 k0!1786) (size!18286 a!2986)) mask!3053)))))

(assert (= (and d!87889 res!392383) b!609825))

(declare-fun m!585831 () Bool)

(assert (=> d!87889 m!585831))

(assert (=> d!87889 m!585631))

(assert (=> b!609825 m!585657))

(assert (=> b!609825 m!585657))

(declare-fun m!585833 () Bool)

(assert (=> b!609825 m!585833))

(assert (=> b!609825 m!585635))

(assert (=> b!609825 m!585635))

(assert (=> b!609825 m!585661))

(assert (=> b!609825 m!585659))

(assert (=> b!609674 d!87889))

(declare-fun b!609858 () Bool)

(declare-fun e!349305 () SeekEntryResult!6358)

(declare-fun e!349306 () SeekEntryResult!6358)

(assert (=> b!609858 (= e!349305 e!349306)))

(declare-fun c!69097 () Bool)

(declare-fun lt!278809 () (_ BitVec 64))

(assert (=> b!609858 (= c!69097 (= lt!278809 lt!278688))))

(declare-fun b!609859 () Bool)

(assert (=> b!609859 (= e!349306 (Found!6358 index!984))))

(declare-fun e!349307 () SeekEntryResult!6358)

(declare-fun b!609861 () Bool)

(assert (=> b!609861 (= e!349307 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 lt!278688 lt!278691 mask!3053))))

(declare-fun d!87891 () Bool)

(declare-fun lt!278808 () SeekEntryResult!6358)

(get-info :version)

(assert (=> d!87891 (and (or ((_ is Undefined!6358) lt!278808) (not ((_ is Found!6358) lt!278808)) (and (bvsge (index!27708 lt!278808) #b00000000000000000000000000000000) (bvslt (index!27708 lt!278808) (size!18286 lt!278691)))) (or ((_ is Undefined!6358) lt!278808) ((_ is Found!6358) lt!278808) (not ((_ is MissingVacant!6358) lt!278808)) (not (= (index!27710 lt!278808) vacantSpotIndex!68)) (and (bvsge (index!27710 lt!278808) #b00000000000000000000000000000000) (bvslt (index!27710 lt!278808) (size!18286 lt!278691)))) (or ((_ is Undefined!6358) lt!278808) (ite ((_ is Found!6358) lt!278808) (= (select (arr!17921 lt!278691) (index!27708 lt!278808)) lt!278688) (and ((_ is MissingVacant!6358) lt!278808) (= (index!27710 lt!278808) vacantSpotIndex!68) (= (select (arr!17921 lt!278691) (index!27710 lt!278808)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!87891 (= lt!278808 e!349305)))

(declare-fun c!69098 () Bool)

(assert (=> d!87891 (= c!69098 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!87891 (= lt!278809 (select (arr!17921 lt!278691) index!984))))

(assert (=> d!87891 (validMask!0 mask!3053)))

(assert (=> d!87891 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!278688 lt!278691 mask!3053) lt!278808)))

(declare-fun b!609860 () Bool)

(declare-fun c!69096 () Bool)

(assert (=> b!609860 (= c!69096 (= lt!278809 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!609860 (= e!349306 e!349307)))

(declare-fun b!609862 () Bool)

(assert (=> b!609862 (= e!349307 (MissingVacant!6358 vacantSpotIndex!68))))

(declare-fun b!609863 () Bool)

(assert (=> b!609863 (= e!349305 Undefined!6358)))

(assert (= (and d!87891 c!69098) b!609863))

(assert (= (and d!87891 (not c!69098)) b!609858))

(assert (= (and b!609858 c!69097) b!609859))

(assert (= (and b!609858 (not c!69097)) b!609860))

(assert (= (and b!609860 c!69096) b!609862))

(assert (= (and b!609860 (not c!69096)) b!609861))

(assert (=> b!609861 m!585655))

(assert (=> b!609861 m!585655))

(declare-fun m!585849 () Bool)

(assert (=> b!609861 m!585849))

(declare-fun m!585853 () Bool)

(assert (=> d!87891 m!585853))

(declare-fun m!585857 () Bool)

(assert (=> d!87891 m!585857))

(declare-fun m!585859 () Bool)

(assert (=> d!87891 m!585859))

(assert (=> d!87891 m!585631))

(assert (=> b!609674 d!87891))

(declare-fun d!87909 () Bool)

(declare-fun lt!278812 () (_ BitVec 32))

(assert (=> d!87909 (and (bvsge lt!278812 #b00000000000000000000000000000000) (bvslt lt!278812 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!87909 (= lt!278812 (choose!52 index!984 x!910 mask!3053))))

(assert (=> d!87909 (validMask!0 mask!3053)))

(assert (=> d!87909 (= (nextIndex!0 index!984 x!910 mask!3053) lt!278812)))

(declare-fun bs!18580 () Bool)

(assert (= bs!18580 d!87909))

(declare-fun m!585873 () Bool)

(assert (=> bs!18580 m!585873))

(assert (=> bs!18580 m!585631))

(assert (=> b!609674 d!87909))

(declare-fun b!609876 () Bool)

(declare-fun e!349318 () SeekEntryResult!6358)

(declare-fun e!349319 () SeekEntryResult!6358)

(assert (=> b!609876 (= e!349318 e!349319)))

(declare-fun c!69102 () Bool)

(declare-fun lt!278816 () (_ BitVec 64))

(assert (=> b!609876 (= c!69102 (= lt!278816 (select (arr!17921 a!2986) j!136)))))

(declare-fun b!609877 () Bool)

(assert (=> b!609877 (= e!349319 (Found!6358 lt!278684))))

(declare-fun b!609879 () Bool)

(declare-fun e!349320 () SeekEntryResult!6358)

(assert (=> b!609879 (= e!349320 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!278684 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 (select (arr!17921 a!2986) j!136) a!2986 mask!3053))))

(declare-fun d!87915 () Bool)

(declare-fun lt!278815 () SeekEntryResult!6358)

(assert (=> d!87915 (and (or ((_ is Undefined!6358) lt!278815) (not ((_ is Found!6358) lt!278815)) (and (bvsge (index!27708 lt!278815) #b00000000000000000000000000000000) (bvslt (index!27708 lt!278815) (size!18286 a!2986)))) (or ((_ is Undefined!6358) lt!278815) ((_ is Found!6358) lt!278815) (not ((_ is MissingVacant!6358) lt!278815)) (not (= (index!27710 lt!278815) vacantSpotIndex!68)) (and (bvsge (index!27710 lt!278815) #b00000000000000000000000000000000) (bvslt (index!27710 lt!278815) (size!18286 a!2986)))) (or ((_ is Undefined!6358) lt!278815) (ite ((_ is Found!6358) lt!278815) (= (select (arr!17921 a!2986) (index!27708 lt!278815)) (select (arr!17921 a!2986) j!136)) (and ((_ is MissingVacant!6358) lt!278815) (= (index!27710 lt!278815) vacantSpotIndex!68) (= (select (arr!17921 a!2986) (index!27710 lt!278815)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!87915 (= lt!278815 e!349318)))

(declare-fun c!69103 () Bool)

(assert (=> d!87915 (= c!69103 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!87915 (= lt!278816 (select (arr!17921 a!2986) lt!278684))))

(assert (=> d!87915 (validMask!0 mask!3053)))

(assert (=> d!87915 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!278684 vacantSpotIndex!68 (select (arr!17921 a!2986) j!136) a!2986 mask!3053) lt!278815)))

(declare-fun b!609878 () Bool)

(declare-fun c!69101 () Bool)

(assert (=> b!609878 (= c!69101 (= lt!278816 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!609878 (= e!349319 e!349320)))

(declare-fun b!609880 () Bool)

(assert (=> b!609880 (= e!349320 (MissingVacant!6358 vacantSpotIndex!68))))

(declare-fun b!609881 () Bool)

(assert (=> b!609881 (= e!349318 Undefined!6358)))

(assert (= (and d!87915 c!69103) b!609881))

(assert (= (and d!87915 (not c!69103)) b!609876))

(assert (= (and b!609876 c!69102) b!609877))

(assert (= (and b!609876 (not c!69102)) b!609878))

(assert (= (and b!609878 c!69101) b!609880))

(assert (= (and b!609878 (not c!69101)) b!609879))

(declare-fun m!585877 () Bool)

(assert (=> b!609879 m!585877))

(assert (=> b!609879 m!585877))

(assert (=> b!609879 m!585635))

(declare-fun m!585879 () Bool)

(assert (=> b!609879 m!585879))

(declare-fun m!585881 () Bool)

(assert (=> d!87915 m!585881))

(declare-fun m!585883 () Bool)

(assert (=> d!87915 m!585883))

(declare-fun m!585885 () Bool)

(assert (=> d!87915 m!585885))

(assert (=> d!87915 m!585631))

(assert (=> b!609674 d!87915))

(declare-fun b!609882 () Bool)

(declare-fun e!349321 () SeekEntryResult!6358)

(declare-fun e!349322 () SeekEntryResult!6358)

(assert (=> b!609882 (= e!349321 e!349322)))

(declare-fun c!69105 () Bool)

(declare-fun lt!278819 () (_ BitVec 64))

(assert (=> b!609882 (= c!69105 (= lt!278819 lt!278688))))

(declare-fun b!609883 () Bool)

(assert (=> b!609883 (= e!349322 (Found!6358 lt!278684))))

(declare-fun b!609885 () Bool)

(declare-fun e!349323 () SeekEntryResult!6358)

(assert (=> b!609885 (= e!349323 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!278684 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 lt!278688 lt!278691 mask!3053))))

(declare-fun d!87919 () Bool)

(declare-fun lt!278818 () SeekEntryResult!6358)

(assert (=> d!87919 (and (or ((_ is Undefined!6358) lt!278818) (not ((_ is Found!6358) lt!278818)) (and (bvsge (index!27708 lt!278818) #b00000000000000000000000000000000) (bvslt (index!27708 lt!278818) (size!18286 lt!278691)))) (or ((_ is Undefined!6358) lt!278818) ((_ is Found!6358) lt!278818) (not ((_ is MissingVacant!6358) lt!278818)) (not (= (index!27710 lt!278818) vacantSpotIndex!68)) (and (bvsge (index!27710 lt!278818) #b00000000000000000000000000000000) (bvslt (index!27710 lt!278818) (size!18286 lt!278691)))) (or ((_ is Undefined!6358) lt!278818) (ite ((_ is Found!6358) lt!278818) (= (select (arr!17921 lt!278691) (index!27708 lt!278818)) lt!278688) (and ((_ is MissingVacant!6358) lt!278818) (= (index!27710 lt!278818) vacantSpotIndex!68) (= (select (arr!17921 lt!278691) (index!27710 lt!278818)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!87919 (= lt!278818 e!349321)))

(declare-fun c!69106 () Bool)

(assert (=> d!87919 (= c!69106 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!87919 (= lt!278819 (select (arr!17921 lt!278691) lt!278684))))

(assert (=> d!87919 (validMask!0 mask!3053)))

(assert (=> d!87919 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!278684 vacantSpotIndex!68 lt!278688 lt!278691 mask!3053) lt!278818)))

(declare-fun b!609884 () Bool)

(declare-fun c!69104 () Bool)

(assert (=> b!609884 (= c!69104 (= lt!278819 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!609884 (= e!349322 e!349323)))

(declare-fun b!609886 () Bool)

(assert (=> b!609886 (= e!349323 (MissingVacant!6358 vacantSpotIndex!68))))

(declare-fun b!609887 () Bool)

(assert (=> b!609887 (= e!349321 Undefined!6358)))

(assert (= (and d!87919 c!69106) b!609887))

(assert (= (and d!87919 (not c!69106)) b!609882))

(assert (= (and b!609882 c!69105) b!609883))

(assert (= (and b!609882 (not c!69105)) b!609884))

(assert (= (and b!609884 c!69104) b!609886))

(assert (= (and b!609884 (not c!69104)) b!609885))

(assert (=> b!609885 m!585877))

(assert (=> b!609885 m!585877))

(declare-fun m!585887 () Bool)

(assert (=> b!609885 m!585887))

(declare-fun m!585891 () Bool)

(assert (=> d!87919 m!585891))

(declare-fun m!585893 () Bool)

(assert (=> d!87919 m!585893))

(declare-fun m!585895 () Bool)

(assert (=> d!87919 m!585895))

(assert (=> d!87919 m!585631))

(assert (=> b!609674 d!87919))

(declare-fun d!87923 () Bool)

(assert (=> d!87923 (= (validKeyInArray!0 (select (arr!17921 a!2986) j!136)) (and (not (= (select (arr!17921 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!17921 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!609663 d!87923))

(declare-fun d!87925 () Bool)

(assert (=> d!87925 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!609654 d!87925))

(declare-fun b!609926 () Bool)

(declare-fun e!349354 () SeekEntryResult!6358)

(declare-fun lt!278849 () SeekEntryResult!6358)

(assert (=> b!609926 (= e!349354 (MissingZero!6358 (index!27709 lt!278849)))))

(declare-fun b!609927 () Bool)

(declare-fun c!69118 () Bool)

(declare-fun lt!278848 () (_ BitVec 64))

(assert (=> b!609927 (= c!69118 (= lt!278848 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!349352 () SeekEntryResult!6358)

(assert (=> b!609927 (= e!349352 e!349354)))

(declare-fun d!87927 () Bool)

(declare-fun lt!278850 () SeekEntryResult!6358)

(assert (=> d!87927 (and (or ((_ is Undefined!6358) lt!278850) (not ((_ is Found!6358) lt!278850)) (and (bvsge (index!27708 lt!278850) #b00000000000000000000000000000000) (bvslt (index!27708 lt!278850) (size!18286 a!2986)))) (or ((_ is Undefined!6358) lt!278850) ((_ is Found!6358) lt!278850) (not ((_ is MissingZero!6358) lt!278850)) (and (bvsge (index!27707 lt!278850) #b00000000000000000000000000000000) (bvslt (index!27707 lt!278850) (size!18286 a!2986)))) (or ((_ is Undefined!6358) lt!278850) ((_ is Found!6358) lt!278850) ((_ is MissingZero!6358) lt!278850) (not ((_ is MissingVacant!6358) lt!278850)) (and (bvsge (index!27710 lt!278850) #b00000000000000000000000000000000) (bvslt (index!27710 lt!278850) (size!18286 a!2986)))) (or ((_ is Undefined!6358) lt!278850) (ite ((_ is Found!6358) lt!278850) (= (select (arr!17921 a!2986) (index!27708 lt!278850)) k0!1786) (ite ((_ is MissingZero!6358) lt!278850) (= (select (arr!17921 a!2986) (index!27707 lt!278850)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!6358) lt!278850) (= (select (arr!17921 a!2986) (index!27710 lt!278850)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!349353 () SeekEntryResult!6358)

(assert (=> d!87927 (= lt!278850 e!349353)))

(declare-fun c!69119 () Bool)

(assert (=> d!87927 (= c!69119 (and ((_ is Intermediate!6358) lt!278849) (undefined!7170 lt!278849)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37341 (_ BitVec 32)) SeekEntryResult!6358)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!87927 (= lt!278849 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!87927 (validMask!0 mask!3053)))

(assert (=> d!87927 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!278850)))

(declare-fun b!609928 () Bool)

(assert (=> b!609928 (= e!349352 (Found!6358 (index!27709 lt!278849)))))

(declare-fun b!609929 () Bool)

(assert (=> b!609929 (= e!349354 (seekKeyOrZeroReturnVacant!0 (x!56518 lt!278849) (index!27709 lt!278849) (index!27709 lt!278849) k0!1786 a!2986 mask!3053))))

(declare-fun b!609930 () Bool)

(assert (=> b!609930 (= e!349353 e!349352)))

(assert (=> b!609930 (= lt!278848 (select (arr!17921 a!2986) (index!27709 lt!278849)))))

(declare-fun c!69117 () Bool)

(assert (=> b!609930 (= c!69117 (= lt!278848 k0!1786))))

(declare-fun b!609931 () Bool)

(assert (=> b!609931 (= e!349353 Undefined!6358)))

(assert (= (and d!87927 c!69119) b!609931))

(assert (= (and d!87927 (not c!69119)) b!609930))

(assert (= (and b!609930 c!69117) b!609928))

(assert (= (and b!609930 (not c!69117)) b!609927))

(assert (= (and b!609927 c!69118) b!609926))

(assert (= (and b!609927 (not c!69118)) b!609929))

(declare-fun m!585921 () Bool)

(assert (=> d!87927 m!585921))

(declare-fun m!585923 () Bool)

(assert (=> d!87927 m!585923))

(declare-fun m!585925 () Bool)

(assert (=> d!87927 m!585925))

(declare-fun m!585927 () Bool)

(assert (=> d!87927 m!585927))

(assert (=> d!87927 m!585925))

(declare-fun m!585929 () Bool)

(assert (=> d!87927 m!585929))

(assert (=> d!87927 m!585631))

(declare-fun m!585931 () Bool)

(assert (=> b!609929 m!585931))

(declare-fun m!585933 () Bool)

(assert (=> b!609930 m!585933))

(assert (=> b!609665 d!87927))

(declare-fun bm!33093 () Bool)

(declare-fun call!33096 () Bool)

(declare-fun c!69137 () Bool)

(assert (=> bm!33093 (= call!33096 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!69137 (Cons!11997 (select (arr!17921 a!2986) #b00000000000000000000000000000000) Nil!11998) Nil!11998)))))

(declare-fun b!609972 () Bool)

(declare-fun e!349381 () Bool)

(declare-fun e!349379 () Bool)

(assert (=> b!609972 (= e!349381 e!349379)))

(assert (=> b!609972 (= c!69137 (validKeyInArray!0 (select (arr!17921 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!609974 () Bool)

(declare-fun e!349380 () Bool)

(assert (=> b!609974 (= e!349380 e!349381)))

(declare-fun res!392434 () Bool)

(assert (=> b!609974 (=> (not res!392434) (not e!349381))))

(declare-fun e!349378 () Bool)

(assert (=> b!609974 (= res!392434 (not e!349378))))

(declare-fun res!392432 () Bool)

(assert (=> b!609974 (=> (not res!392432) (not e!349378))))

(assert (=> b!609974 (= res!392432 (validKeyInArray!0 (select (arr!17921 a!2986) #b00000000000000000000000000000000)))))

(declare-fun d!87943 () Bool)

(declare-fun res!392433 () Bool)

(assert (=> d!87943 (=> res!392433 e!349380)))

(assert (=> d!87943 (= res!392433 (bvsge #b00000000000000000000000000000000 (size!18286 a!2986)))))

(assert (=> d!87943 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11998) e!349380)))

(declare-fun b!609973 () Bool)

(declare-fun contains!3021 (List!12001 (_ BitVec 64)) Bool)

(assert (=> b!609973 (= e!349378 (contains!3021 Nil!11998 (select (arr!17921 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!609975 () Bool)

(assert (=> b!609975 (= e!349379 call!33096)))

(declare-fun b!609976 () Bool)

(assert (=> b!609976 (= e!349379 call!33096)))

(assert (= (and d!87943 (not res!392433)) b!609974))

(assert (= (and b!609974 res!392432) b!609973))

(assert (= (and b!609974 res!392434) b!609972))

(assert (= (and b!609972 c!69137) b!609975))

(assert (= (and b!609972 (not c!69137)) b!609976))

(assert (= (or b!609975 b!609976) bm!33093))

(assert (=> bm!33093 m!585827))

(declare-fun m!585941 () Bool)

(assert (=> bm!33093 m!585941))

(assert (=> b!609972 m!585827))

(assert (=> b!609972 m!585827))

(declare-fun m!585943 () Bool)

(assert (=> b!609972 m!585943))

(assert (=> b!609974 m!585827))

(assert (=> b!609974 m!585827))

(assert (=> b!609974 m!585943))

(assert (=> b!609973 m!585827))

(assert (=> b!609973 m!585827))

(declare-fun m!585945 () Bool)

(assert (=> b!609973 m!585945))

(assert (=> b!609666 d!87943))

(declare-fun d!87947 () Bool)

(assert (=> d!87947 (arrayContainsKey!0 lt!278691 (select (arr!17921 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!278862 () Unit!19530)

(declare-fun choose!114 (array!37341 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19530)

(assert (=> d!87947 (= lt!278862 (choose!114 lt!278691 (select (arr!17921 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> d!87947 (bvsge j!136 #b00000000000000000000000000000000)))

(assert (=> d!87947 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!278691 (select (arr!17921 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)) lt!278862)))

(declare-fun bs!18585 () Bool)

(assert (= bs!18585 d!87947))

(assert (=> bs!18585 m!585635))

(assert (=> bs!18585 m!585679))

(assert (=> bs!18585 m!585635))

(declare-fun m!585959 () Bool)

(assert (=> bs!18585 m!585959))

(assert (=> b!609657 d!87947))

(declare-fun bm!33094 () Bool)

(declare-fun call!33097 () Bool)

(declare-fun c!69141 () Bool)

(assert (=> bm!33094 (= call!33097 (arrayNoDuplicates!0 lt!278691 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!69141 (Cons!11997 (select (arr!17921 lt!278691) #b00000000000000000000000000000000) Nil!11998) Nil!11998)))))

(declare-fun b!609985 () Bool)

(declare-fun e!349390 () Bool)

(declare-fun e!349388 () Bool)

(assert (=> b!609985 (= e!349390 e!349388)))

(assert (=> b!609985 (= c!69141 (validKeyInArray!0 (select (arr!17921 lt!278691) #b00000000000000000000000000000000)))))

(declare-fun b!609987 () Bool)

(declare-fun e!349389 () Bool)

(assert (=> b!609987 (= e!349389 e!349390)))

(declare-fun res!392439 () Bool)

(assert (=> b!609987 (=> (not res!392439) (not e!349390))))

(declare-fun e!349387 () Bool)

(assert (=> b!609987 (= res!392439 (not e!349387))))

(declare-fun res!392437 () Bool)

(assert (=> b!609987 (=> (not res!392437) (not e!349387))))

(assert (=> b!609987 (= res!392437 (validKeyInArray!0 (select (arr!17921 lt!278691) #b00000000000000000000000000000000)))))

(declare-fun d!87955 () Bool)

(declare-fun res!392438 () Bool)

(assert (=> d!87955 (=> res!392438 e!349389)))

(assert (=> d!87955 (= res!392438 (bvsge #b00000000000000000000000000000000 (size!18286 lt!278691)))))

(assert (=> d!87955 (= (arrayNoDuplicates!0 lt!278691 #b00000000000000000000000000000000 Nil!11998) e!349389)))

(declare-fun b!609986 () Bool)

(assert (=> b!609986 (= e!349387 (contains!3021 Nil!11998 (select (arr!17921 lt!278691) #b00000000000000000000000000000000)))))

(declare-fun b!609988 () Bool)

(assert (=> b!609988 (= e!349388 call!33097)))

(declare-fun b!609989 () Bool)

(assert (=> b!609989 (= e!349388 call!33097)))

(assert (= (and d!87955 (not res!392438)) b!609987))

(assert (= (and b!609987 res!392437) b!609986))

(assert (= (and b!609987 res!392439) b!609985))

(assert (= (and b!609985 c!69141) b!609988))

(assert (= (and b!609985 (not c!69141)) b!609989))

(assert (= (or b!609988 b!609989) bm!33094))

(declare-fun m!585961 () Bool)

(assert (=> bm!33094 m!585961))

(declare-fun m!585963 () Bool)

(assert (=> bm!33094 m!585963))

(assert (=> b!609985 m!585961))

(assert (=> b!609985 m!585961))

(declare-fun m!585965 () Bool)

(assert (=> b!609985 m!585965))

(assert (=> b!609987 m!585961))

(assert (=> b!609987 m!585961))

(assert (=> b!609987 m!585965))

(assert (=> b!609986 m!585961))

(assert (=> b!609986 m!585961))

(declare-fun m!585967 () Bool)

(assert (=> b!609986 m!585967))

(assert (=> b!609657 d!87955))

(assert (=> b!609657 d!87881))

(declare-fun d!87957 () Bool)

(declare-fun e!349393 () Bool)

(assert (=> d!87957 e!349393))

(declare-fun res!392442 () Bool)

(assert (=> d!87957 (=> (not res!392442) (not e!349393))))

(assert (=> d!87957 (= res!392442 (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18286 a!2986))))))

(declare-fun lt!278865 () Unit!19530)

(declare-fun choose!41 (array!37341 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12001) Unit!19530)

(assert (=> d!87957 (= lt!278865 (choose!41 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11998))))

(assert (=> d!87957 (bvslt (size!18286 a!2986) #b01111111111111111111111111111111)))

(assert (=> d!87957 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11998) lt!278865)))

(declare-fun b!609992 () Bool)

(assert (=> b!609992 (= e!349393 (arrayNoDuplicates!0 (array!37342 (store (arr!17921 a!2986) i!1108 k0!1786) (size!18286 a!2986)) #b00000000000000000000000000000000 Nil!11998))))

(assert (= (and d!87957 res!392442) b!609992))

(declare-fun m!585969 () Bool)

(assert (=> d!87957 m!585969))

(assert (=> b!609992 m!585659))

(declare-fun m!585971 () Bool)

(assert (=> b!609992 m!585971))

(assert (=> b!609657 d!87957))

(declare-fun d!87963 () Bool)

(declare-fun res!392443 () Bool)

(declare-fun e!349394 () Bool)

(assert (=> d!87963 (=> res!392443 e!349394)))

(assert (=> d!87963 (= res!392443 (= (select (arr!17921 lt!278691) (bvadd #b00000000000000000000000000000001 index!984)) (select (arr!17921 a!2986) j!136)))))

(assert (=> d!87963 (= (arrayContainsKey!0 lt!278691 (select (arr!17921 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984)) e!349394)))

(declare-fun b!609993 () Bool)

(declare-fun e!349395 () Bool)

(assert (=> b!609993 (= e!349394 e!349395)))

(declare-fun res!392444 () Bool)

(assert (=> b!609993 (=> (not res!392444) (not e!349395))))

(assert (=> b!609993 (= res!392444 (bvslt (bvadd #b00000000000000000000000000000001 index!984 #b00000000000000000000000000000001) (size!18286 lt!278691)))))

(declare-fun b!609994 () Bool)

(assert (=> b!609994 (= e!349395 (arrayContainsKey!0 lt!278691 (select (arr!17921 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!87963 (not res!392443)) b!609993))

(assert (= (and b!609993 res!392444) b!609994))

(declare-fun m!585973 () Bool)

(assert (=> d!87963 m!585973))

(assert (=> b!609994 m!585635))

(declare-fun m!585975 () Bool)

(assert (=> b!609994 m!585975))

(assert (=> b!609657 d!87963))

(declare-fun d!87965 () Bool)

(assert (=> d!87965 (arrayContainsKey!0 lt!278691 (select (arr!17921 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!278866 () Unit!19530)

(assert (=> d!87965 (= lt!278866 (choose!114 lt!278691 (select (arr!17921 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> d!87965 (bvsge index!984 #b00000000000000000000000000000000)))

(assert (=> d!87965 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!278691 (select (arr!17921 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)) lt!278866)))

(declare-fun bs!18586 () Bool)

(assert (= bs!18586 d!87965))

(assert (=> bs!18586 m!585635))

(assert (=> bs!18586 m!585643))

(assert (=> bs!18586 m!585635))

(declare-fun m!585977 () Bool)

(assert (=> bs!18586 m!585977))

(assert (=> b!609656 d!87965))

(declare-fun d!87967 () Bool)

(assert (=> d!87967 (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18286 lt!278691)) (not (= (select (arr!17921 lt!278691) j!136) (select (arr!17921 a!2986) j!136))))))

(declare-fun lt!278869 () Unit!19530)

(declare-fun choose!21 (array!37341 (_ BitVec 64) (_ BitVec 32) List!12001) Unit!19530)

(assert (=> d!87967 (= lt!278869 (choose!21 lt!278691 (select (arr!17921 a!2986) j!136) j!136 Nil!11998))))

(assert (=> d!87967 (bvslt (size!18286 lt!278691) #b01111111111111111111111111111111)))

(assert (=> d!87967 (= (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!278691 (select (arr!17921 a!2986) j!136) j!136 Nil!11998) lt!278869)))

(declare-fun bs!18587 () Bool)

(assert (= bs!18587 d!87967))

(assert (=> bs!18587 m!585823))

(assert (=> bs!18587 m!585635))

(declare-fun m!585979 () Bool)

(assert (=> bs!18587 m!585979))

(assert (=> b!609656 d!87967))

(declare-fun c!69142 () Bool)

(declare-fun call!33098 () Bool)

(declare-fun bm!33095 () Bool)

(assert (=> bm!33095 (= call!33098 (arrayNoDuplicates!0 lt!278691 (bvadd j!136 #b00000000000000000000000000000001) (ite c!69142 (Cons!11997 (select (arr!17921 lt!278691) j!136) Nil!11998) Nil!11998)))))

(declare-fun b!609995 () Bool)

(declare-fun e!349399 () Bool)

(declare-fun e!349397 () Bool)

(assert (=> b!609995 (= e!349399 e!349397)))

(assert (=> b!609995 (= c!69142 (validKeyInArray!0 (select (arr!17921 lt!278691) j!136)))))

(declare-fun b!609997 () Bool)

(declare-fun e!349398 () Bool)

(assert (=> b!609997 (= e!349398 e!349399)))

(declare-fun res!392447 () Bool)

(assert (=> b!609997 (=> (not res!392447) (not e!349399))))

(declare-fun e!349396 () Bool)

(assert (=> b!609997 (= res!392447 (not e!349396))))

(declare-fun res!392445 () Bool)

(assert (=> b!609997 (=> (not res!392445) (not e!349396))))

(assert (=> b!609997 (= res!392445 (validKeyInArray!0 (select (arr!17921 lt!278691) j!136)))))

(declare-fun d!87969 () Bool)

(declare-fun res!392446 () Bool)

(assert (=> d!87969 (=> res!392446 e!349398)))

(assert (=> d!87969 (= res!392446 (bvsge j!136 (size!18286 lt!278691)))))

(assert (=> d!87969 (= (arrayNoDuplicates!0 lt!278691 j!136 Nil!11998) e!349398)))

(declare-fun b!609996 () Bool)

(assert (=> b!609996 (= e!349396 (contains!3021 Nil!11998 (select (arr!17921 lt!278691) j!136)))))

(declare-fun b!609998 () Bool)

(assert (=> b!609998 (= e!349397 call!33098)))

(declare-fun b!609999 () Bool)

(assert (=> b!609999 (= e!349397 call!33098)))

(assert (= (and d!87969 (not res!392446)) b!609997))

(assert (= (and b!609997 res!392445) b!609996))

(assert (= (and b!609997 res!392447) b!609995))

(assert (= (and b!609995 c!69142) b!609998))

(assert (= (and b!609995 (not c!69142)) b!609999))

(assert (= (or b!609998 b!609999) bm!33095))

(assert (=> bm!33095 m!585823))

(declare-fun m!585981 () Bool)

(assert (=> bm!33095 m!585981))

(assert (=> b!609995 m!585823))

(assert (=> b!609995 m!585823))

(declare-fun m!585983 () Bool)

(assert (=> b!609995 m!585983))

(assert (=> b!609997 m!585823))

(assert (=> b!609997 m!585823))

(assert (=> b!609997 m!585983))

(assert (=> b!609996 m!585823))

(assert (=> b!609996 m!585823))

(declare-fun m!585985 () Bool)

(assert (=> b!609996 m!585985))

(assert (=> b!609656 d!87969))

(declare-fun d!87971 () Bool)

(assert (=> d!87971 (arrayNoDuplicates!0 lt!278691 j!136 Nil!11998)))

(declare-fun lt!278878 () Unit!19530)

(declare-fun choose!39 (array!37341 (_ BitVec 32) (_ BitVec 32)) Unit!19530)

(assert (=> d!87971 (= lt!278878 (choose!39 lt!278691 #b00000000000000000000000000000000 j!136))))

(assert (=> d!87971 (bvslt (size!18286 lt!278691) #b01111111111111111111111111111111)))

(assert (=> d!87971 (= (lemmaNoDuplicateFromThenFromBigger!0 lt!278691 #b00000000000000000000000000000000 j!136) lt!278878)))

(declare-fun bs!18588 () Bool)

(assert (= bs!18588 d!87971))

(assert (=> bs!18588 m!585641))

(declare-fun m!585987 () Bool)

(assert (=> bs!18588 m!585987))

(assert (=> b!609656 d!87971))

(assert (=> b!609656 d!87955))

(declare-fun d!87973 () Bool)

(declare-fun res!392454 () Bool)

(declare-fun e!349409 () Bool)

(assert (=> d!87973 (=> res!392454 e!349409)))

(assert (=> d!87973 (= res!392454 (= (select (arr!17921 lt!278691) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!17921 a!2986) j!136)))))

(assert (=> d!87973 (= (arrayContainsKey!0 lt!278691 (select (arr!17921 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!349409)))

(declare-fun b!610012 () Bool)

(declare-fun e!349410 () Bool)

(assert (=> b!610012 (= e!349409 e!349410)))

(declare-fun res!392455 () Bool)

(assert (=> b!610012 (=> (not res!392455) (not e!349410))))

(assert (=> b!610012 (= res!392455 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18286 lt!278691)))))

(declare-fun b!610013 () Bool)

(assert (=> b!610013 (= e!349410 (arrayContainsKey!0 lt!278691 (select (arr!17921 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!87973 (not res!392454)) b!610012))

(assert (= (and b!610012 res!392455) b!610013))

(declare-fun m!585991 () Bool)

(assert (=> d!87973 m!585991))

(assert (=> b!610013 m!585635))

(declare-fun m!585997 () Bool)

(assert (=> b!610013 m!585997))

(assert (=> b!609656 d!87973))

(assert (=> b!609656 d!87957))

(declare-fun d!87975 () Bool)

(declare-fun res!392456 () Bool)

(declare-fun e!349411 () Bool)

(assert (=> d!87975 (=> res!392456 e!349411)))

(assert (=> d!87975 (= res!392456 (= (select (arr!17921 lt!278691) index!984) (select (arr!17921 a!2986) j!136)))))

(assert (=> d!87975 (= (arrayContainsKey!0 lt!278691 (select (arr!17921 a!2986) j!136) index!984) e!349411)))

(declare-fun b!610014 () Bool)

(declare-fun e!349412 () Bool)

(assert (=> b!610014 (= e!349411 e!349412)))

(declare-fun res!392457 () Bool)

(assert (=> b!610014 (=> (not res!392457) (not e!349412))))

(assert (=> b!610014 (= res!392457 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18286 lt!278691)))))

(declare-fun b!610015 () Bool)

(assert (=> b!610015 (= e!349412 (arrayContainsKey!0 lt!278691 (select (arr!17921 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!87975 (not res!392456)) b!610014))

(assert (= (and b!610014 res!392457) b!610015))

(assert (=> d!87975 m!585859))

(assert (=> b!610015 m!585635))

(declare-fun m!586005 () Bool)

(assert (=> b!610015 m!586005))

(assert (=> b!609667 d!87975))

(declare-fun b!610016 () Bool)

(declare-fun e!349413 () SeekEntryResult!6358)

(declare-fun e!349414 () SeekEntryResult!6358)

(assert (=> b!610016 (= e!349413 e!349414)))

(declare-fun c!69147 () Bool)

(declare-fun lt!278883 () (_ BitVec 64))

(assert (=> b!610016 (= c!69147 (= lt!278883 (select (arr!17921 a!2986) j!136)))))

(declare-fun b!610017 () Bool)

(assert (=> b!610017 (= e!349414 (Found!6358 index!984))))

(declare-fun b!610019 () Bool)

(declare-fun e!349415 () SeekEntryResult!6358)

(assert (=> b!610019 (= e!349415 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!17921 a!2986) j!136) a!2986 mask!3053))))

(declare-fun d!87979 () Bool)

(declare-fun lt!278882 () SeekEntryResult!6358)

(assert (=> d!87979 (and (or ((_ is Undefined!6358) lt!278882) (not ((_ is Found!6358) lt!278882)) (and (bvsge (index!27708 lt!278882) #b00000000000000000000000000000000) (bvslt (index!27708 lt!278882) (size!18286 a!2986)))) (or ((_ is Undefined!6358) lt!278882) ((_ is Found!6358) lt!278882) (not ((_ is MissingVacant!6358) lt!278882)) (not (= (index!27710 lt!278882) vacantSpotIndex!68)) (and (bvsge (index!27710 lt!278882) #b00000000000000000000000000000000) (bvslt (index!27710 lt!278882) (size!18286 a!2986)))) (or ((_ is Undefined!6358) lt!278882) (ite ((_ is Found!6358) lt!278882) (= (select (arr!17921 a!2986) (index!27708 lt!278882)) (select (arr!17921 a!2986) j!136)) (and ((_ is MissingVacant!6358) lt!278882) (= (index!27710 lt!278882) vacantSpotIndex!68) (= (select (arr!17921 a!2986) (index!27710 lt!278882)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!87979 (= lt!278882 e!349413)))

(declare-fun c!69148 () Bool)

(assert (=> d!87979 (= c!69148 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!87979 (= lt!278883 (select (arr!17921 a!2986) index!984))))

(assert (=> d!87979 (validMask!0 mask!3053)))

(assert (=> d!87979 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17921 a!2986) j!136) a!2986 mask!3053) lt!278882)))

(declare-fun b!610018 () Bool)

(declare-fun c!69146 () Bool)

(assert (=> b!610018 (= c!69146 (= lt!278883 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!610018 (= e!349414 e!349415)))

(declare-fun b!610020 () Bool)

(assert (=> b!610020 (= e!349415 (MissingVacant!6358 vacantSpotIndex!68))))

(declare-fun b!610021 () Bool)

(assert (=> b!610021 (= e!349413 Undefined!6358)))

(assert (= (and d!87979 c!69148) b!610021))

(assert (= (and d!87979 (not c!69148)) b!610016))

(assert (= (and b!610016 c!69147) b!610017))

(assert (= (and b!610016 (not c!69147)) b!610018))

(assert (= (and b!610018 c!69146) b!610020))

(assert (= (and b!610018 (not c!69146)) b!610019))

(assert (=> b!610019 m!585655))

(assert (=> b!610019 m!585655))

(assert (=> b!610019 m!585635))

(declare-fun m!586007 () Bool)

(assert (=> b!610019 m!586007))

(declare-fun m!586009 () Bool)

(assert (=> d!87979 m!586009))

(declare-fun m!586011 () Bool)

(assert (=> d!87979 m!586011))

(assert (=> d!87979 m!585651))

(assert (=> d!87979 m!585631))

(assert (=> b!609669 d!87979))

(declare-fun d!87981 () Bool)

(declare-fun res!392472 () Bool)

(declare-fun e!349448 () Bool)

(assert (=> d!87981 (=> res!392472 e!349448)))

(assert (=> d!87981 (= res!392472 (bvsge #b00000000000000000000000000000000 (size!18286 a!2986)))))

(assert (=> d!87981 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!349448)))

(declare-fun bm!33104 () Bool)

(declare-fun call!33107 () Bool)

(assert (=> bm!33104 (= call!33107 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!610069 () Bool)

(declare-fun e!349447 () Bool)

(assert (=> b!610069 (= e!349448 e!349447)))

(declare-fun c!69166 () Bool)

(assert (=> b!610069 (= c!69166 (validKeyInArray!0 (select (arr!17921 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!610070 () Bool)

(declare-fun e!349446 () Bool)

(assert (=> b!610070 (= e!349446 call!33107)))

(declare-fun b!610071 () Bool)

(assert (=> b!610071 (= e!349447 e!349446)))

(declare-fun lt!278904 () (_ BitVec 64))

(assert (=> b!610071 (= lt!278904 (select (arr!17921 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!278903 () Unit!19530)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!37341 (_ BitVec 64) (_ BitVec 32)) Unit!19530)

(assert (=> b!610071 (= lt!278903 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!278904 #b00000000000000000000000000000000))))

(assert (=> b!610071 (arrayContainsKey!0 a!2986 lt!278904 #b00000000000000000000000000000000)))

(declare-fun lt!278905 () Unit!19530)

(assert (=> b!610071 (= lt!278905 lt!278903)))

(declare-fun res!392471 () Bool)

(assert (=> b!610071 (= res!392471 (= (seekEntryOrOpen!0 (select (arr!17921 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6358 #b00000000000000000000000000000000)))))

(assert (=> b!610071 (=> (not res!392471) (not e!349446))))

(declare-fun b!610072 () Bool)

(assert (=> b!610072 (= e!349447 call!33107)))

(assert (= (and d!87981 (not res!392472)) b!610069))

(assert (= (and b!610069 c!69166) b!610071))

(assert (= (and b!610069 (not c!69166)) b!610072))

(assert (= (and b!610071 res!392471) b!610070))

(assert (= (or b!610070 b!610072) bm!33104))

(declare-fun m!586043 () Bool)

(assert (=> bm!33104 m!586043))

(assert (=> b!610069 m!585827))

(assert (=> b!610069 m!585827))

(assert (=> b!610069 m!585943))

(assert (=> b!610071 m!585827))

(declare-fun m!586045 () Bool)

(assert (=> b!610071 m!586045))

(declare-fun m!586047 () Bool)

(assert (=> b!610071 m!586047))

(assert (=> b!610071 m!585827))

(declare-fun m!586049 () Bool)

(assert (=> b!610071 m!586049))

(assert (=> b!609668 d!87981))

(assert (=> b!609659 d!87975))

(check-sat (not b!609861) (not d!87909) (not b!609825) (not b!609879) (not b!609995) (not b!610071) (not b!609996) (not b!609972) (not d!87927) (not b!610015) (not bm!33094) (not d!87889) (not d!87967) (not bm!33095) (not b!610069) (not b!609997) (not d!87965) (not b!609994) (not d!87947) (not bm!33093) (not b!609986) (not d!87915) (not b!609885) (not b!609929) (not b!609985) (not b!609987) (not b!609992) (not d!87979) (not d!87891) (not bm!33104) (not d!87971) (not d!87957) (not b!609974) (not b!609973) (not d!87919) (not b!609822) (not b!609820) (not b!610019) (not b!610013))
(check-sat)
