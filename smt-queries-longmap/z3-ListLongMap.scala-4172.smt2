; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56830 () Bool)

(assert start!56830)

(declare-fun b!629524 () Bool)

(declare-fun res!406922 () Bool)

(declare-fun e!360013 () Bool)

(assert (=> b!629524 (=> (not res!406922) (not e!360013))))

(declare-datatypes ((array!38020 0))(
  ( (array!38021 (arr!18247 (Array (_ BitVec 32) (_ BitVec 64))) (size!18611 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38020)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!629524 (= res!406922 (validKeyInArray!0 (select (arr!18247 a!2986) j!136)))))

(declare-fun b!629525 () Bool)

(declare-fun res!406925 () Bool)

(declare-fun e!360015 () Bool)

(assert (=> b!629525 (=> (not res!406925) (not e!360015))))

(declare-datatypes ((List!12288 0))(
  ( (Nil!12285) (Cons!12284 (h!13329 (_ BitVec 64)) (t!18516 List!12288)) )
))
(declare-fun arrayNoDuplicates!0 (array!38020 (_ BitVec 32) List!12288) Bool)

(assert (=> b!629525 (= res!406925 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12285))))

(declare-fun b!629526 () Bool)

(assert (=> b!629526 (= e!360013 e!360015)))

(declare-fun res!406920 () Bool)

(assert (=> b!629526 (=> (not res!406920) (not e!360015))))

(declare-datatypes ((SeekEntryResult!6687 0))(
  ( (MissingZero!6687 (index!29032 (_ BitVec 32))) (Found!6687 (index!29033 (_ BitVec 32))) (Intermediate!6687 (undefined!7499 Bool) (index!29034 (_ BitVec 32)) (x!57767 (_ BitVec 32))) (Undefined!6687) (MissingVacant!6687 (index!29035 (_ BitVec 32))) )
))
(declare-fun lt!290774 () SeekEntryResult!6687)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!629526 (= res!406920 (or (= lt!290774 (MissingZero!6687 i!1108)) (= lt!290774 (MissingVacant!6687 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38020 (_ BitVec 32)) SeekEntryResult!6687)

(assert (=> b!629526 (= lt!290774 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!629527 () Bool)

(declare-fun res!406924 () Bool)

(assert (=> b!629527 (=> (not res!406924) (not e!360015))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38020 (_ BitVec 32)) Bool)

(assert (=> b!629527 (= res!406924 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!629528 () Bool)

(assert (=> b!629528 (= e!360015 (not true))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!290775 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38020 (_ BitVec 32)) SeekEntryResult!6687)

(assert (=> b!629528 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!290775 vacantSpotIndex!68 (select (arr!18247 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!290775 vacantSpotIndex!68 (select (store (arr!18247 a!2986) i!1108 k0!1786) j!136) (array!38021 (store (arr!18247 a!2986) i!1108 k0!1786) (size!18611 a!2986)) mask!3053))))

(declare-datatypes ((Unit!21116 0))(
  ( (Unit!21117) )
))
(declare-fun lt!290776 () Unit!21116)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38020 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21116)

(assert (=> b!629528 (= lt!290776 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!290775 vacantSpotIndex!68 mask!3053))))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!629528 (= lt!290775 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!629529 () Bool)

(declare-fun res!406919 () Bool)

(assert (=> b!629529 (=> (not res!406919) (not e!360013))))

(assert (=> b!629529 (= res!406919 (validKeyInArray!0 k0!1786))))

(declare-fun b!629530 () Bool)

(declare-fun res!406928 () Bool)

(assert (=> b!629530 (=> (not res!406928) (not e!360015))))

(assert (=> b!629530 (= res!406928 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18247 a!2986) j!136) a!2986 mask!3053) (Found!6687 j!136)))))

(declare-fun res!406923 () Bool)

(assert (=> start!56830 (=> (not res!406923) (not e!360013))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56830 (= res!406923 (validMask!0 mask!3053))))

(assert (=> start!56830 e!360013))

(assert (=> start!56830 true))

(declare-fun array_inv!14043 (array!38020) Bool)

(assert (=> start!56830 (array_inv!14043 a!2986)))

(declare-fun b!629531 () Bool)

(declare-fun res!406921 () Bool)

(assert (=> b!629531 (=> (not res!406921) (not e!360013))))

(declare-fun arrayContainsKey!0 (array!38020 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!629531 (= res!406921 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!629532 () Bool)

(declare-fun res!406926 () Bool)

(assert (=> b!629532 (=> (not res!406926) (not e!360013))))

(assert (=> b!629532 (= res!406926 (and (= (size!18611 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18611 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18611 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!629533 () Bool)

(declare-fun res!406927 () Bool)

(assert (=> b!629533 (=> (not res!406927) (not e!360015))))

(assert (=> b!629533 (= res!406927 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18247 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18247 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!629534 () Bool)

(declare-fun res!406918 () Bool)

(assert (=> b!629534 (=> (not res!406918) (not e!360015))))

(assert (=> b!629534 (= res!406918 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18247 a!2986) index!984) (select (arr!18247 a!2986) j!136))) (not (= (select (arr!18247 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (= (and start!56830 res!406923) b!629532))

(assert (= (and b!629532 res!406926) b!629524))

(assert (= (and b!629524 res!406922) b!629529))

(assert (= (and b!629529 res!406919) b!629531))

(assert (= (and b!629531 res!406921) b!629526))

(assert (= (and b!629526 res!406920) b!629527))

(assert (= (and b!629527 res!406924) b!629525))

(assert (= (and b!629525 res!406925) b!629533))

(assert (= (and b!629533 res!406927) b!629530))

(assert (= (and b!629530 res!406928) b!629534))

(assert (= (and b!629534 res!406918) b!629528))

(declare-fun m!604541 () Bool)

(assert (=> b!629534 m!604541))

(declare-fun m!604543 () Bool)

(assert (=> b!629534 m!604543))

(declare-fun m!604545 () Bool)

(assert (=> b!629531 m!604545))

(assert (=> b!629530 m!604543))

(assert (=> b!629530 m!604543))

(declare-fun m!604547 () Bool)

(assert (=> b!629530 m!604547))

(declare-fun m!604549 () Bool)

(assert (=> b!629525 m!604549))

(declare-fun m!604551 () Bool)

(assert (=> b!629529 m!604551))

(declare-fun m!604553 () Bool)

(assert (=> b!629533 m!604553))

(declare-fun m!604555 () Bool)

(assert (=> b!629533 m!604555))

(declare-fun m!604557 () Bool)

(assert (=> b!629533 m!604557))

(declare-fun m!604559 () Bool)

(assert (=> b!629527 m!604559))

(assert (=> b!629524 m!604543))

(assert (=> b!629524 m!604543))

(declare-fun m!604561 () Bool)

(assert (=> b!629524 m!604561))

(declare-fun m!604563 () Bool)

(assert (=> b!629526 m!604563))

(declare-fun m!604565 () Bool)

(assert (=> start!56830 m!604565))

(declare-fun m!604567 () Bool)

(assert (=> start!56830 m!604567))

(declare-fun m!604569 () Bool)

(assert (=> b!629528 m!604569))

(declare-fun m!604571 () Bool)

(assert (=> b!629528 m!604571))

(assert (=> b!629528 m!604543))

(assert (=> b!629528 m!604555))

(assert (=> b!629528 m!604571))

(declare-fun m!604573 () Bool)

(assert (=> b!629528 m!604573))

(declare-fun m!604575 () Bool)

(assert (=> b!629528 m!604575))

(assert (=> b!629528 m!604543))

(declare-fun m!604577 () Bool)

(assert (=> b!629528 m!604577))

(check-sat (not b!629528) (not b!629525) (not b!629530) (not b!629529) (not b!629526) (not b!629527) (not b!629531) (not b!629524) (not start!56830))
