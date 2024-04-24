; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57396 () Bool)

(assert start!57396)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun b!634748 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!38187 0))(
  ( (array!38188 (arr!18319 (Array (_ BitVec 32) (_ BitVec 64))) (size!18683 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38187)

(declare-fun e!363006 () Bool)

(declare-fun lt!293430 () array!38187)

(declare-fun arrayContainsKey!0 (array!38187 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!634748 (= e!363006 (arrayContainsKey!0 lt!293430 (select (arr!18319 a!2986) j!136) index!984))))

(declare-fun b!634749 () Bool)

(declare-fun e!363005 () Bool)

(declare-fun e!362997 () Bool)

(assert (=> b!634749 (= e!363005 e!362997)))

(declare-fun res!410513 () Bool)

(assert (=> b!634749 (=> (not res!410513) (not e!362997))))

(declare-datatypes ((SeekEntryResult!6715 0))(
  ( (MissingZero!6715 (index!29162 (_ BitVec 32))) (Found!6715 (index!29163 (_ BitVec 32))) (Intermediate!6715 (undefined!7527 Bool) (index!29164 (_ BitVec 32)) (x!58060 (_ BitVec 32))) (Undefined!6715) (MissingVacant!6715 (index!29165 (_ BitVec 32))) )
))
(declare-fun lt!293431 () SeekEntryResult!6715)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!634749 (= res!410513 (or (= lt!293431 (MissingZero!6715 i!1108)) (= lt!293431 (MissingVacant!6715 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38187 (_ BitVec 32)) SeekEntryResult!6715)

(assert (=> b!634749 (= lt!293431 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!634750 () Bool)

(declare-fun e!362999 () Bool)

(assert (=> b!634750 (= e!362999 e!363006)))

(declare-fun res!410504 () Bool)

(assert (=> b!634750 (=> (not res!410504) (not e!363006))))

(assert (=> b!634750 (= res!410504 (arrayContainsKey!0 lt!293430 (select (arr!18319 a!2986) j!136) j!136))))

(declare-fun b!634751 () Bool)

(declare-fun res!410506 () Bool)

(assert (=> b!634751 (=> (not res!410506) (not e!363005))))

(assert (=> b!634751 (= res!410506 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!634752 () Bool)

(declare-datatypes ((Unit!21369 0))(
  ( (Unit!21370) )
))
(declare-fun e!362998 () Unit!21369)

(declare-fun Unit!21371 () Unit!21369)

(assert (=> b!634752 (= e!362998 Unit!21371)))

(declare-fun b!634753 () Bool)

(declare-fun e!363003 () Bool)

(declare-fun e!363004 () Bool)

(assert (=> b!634753 (= e!363003 (not e!363004))))

(declare-fun res!410514 () Bool)

(assert (=> b!634753 (=> res!410514 e!363004)))

(declare-fun lt!293425 () SeekEntryResult!6715)

(assert (=> b!634753 (= res!410514 (not (= lt!293425 (Found!6715 index!984))))))

(declare-fun lt!293427 () Unit!21369)

(assert (=> b!634753 (= lt!293427 e!362998)))

(declare-fun c!72491 () Bool)

(assert (=> b!634753 (= c!72491 (= lt!293425 Undefined!6715))))

(declare-fun lt!293426 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38187 (_ BitVec 32)) SeekEntryResult!6715)

(assert (=> b!634753 (= lt!293425 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!293426 lt!293430 mask!3053))))

(declare-fun e!363002 () Bool)

(assert (=> b!634753 e!363002))

(declare-fun res!410517 () Bool)

(assert (=> b!634753 (=> (not res!410517) (not e!363002))))

(declare-fun lt!293424 () (_ BitVec 32))

(declare-fun lt!293423 () SeekEntryResult!6715)

(assert (=> b!634753 (= res!410517 (= lt!293423 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!293424 vacantSpotIndex!68 lt!293426 lt!293430 mask!3053)))))

(assert (=> b!634753 (= lt!293423 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!293424 vacantSpotIndex!68 (select (arr!18319 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!634753 (= lt!293426 (select (store (arr!18319 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!293422 () Unit!21369)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38187 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21369)

(assert (=> b!634753 (= lt!293422 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!293424 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!634753 (= lt!293424 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!634754 () Bool)

(declare-fun Unit!21372 () Unit!21369)

(assert (=> b!634754 (= e!362998 Unit!21372)))

(assert (=> b!634754 false))

(declare-fun b!634756 () Bool)

(declare-fun e!363000 () Bool)

(assert (=> b!634756 (= e!362997 e!363000)))

(declare-fun res!410507 () Bool)

(assert (=> b!634756 (=> (not res!410507) (not e!363000))))

(assert (=> b!634756 (= res!410507 (= (select (store (arr!18319 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!634756 (= lt!293430 (array!38188 (store (arr!18319 a!2986) i!1108 k0!1786) (size!18683 a!2986)))))

(declare-fun b!634757 () Bool)

(declare-fun res!410510 () Bool)

(assert (=> b!634757 (=> (not res!410510) (not e!363005))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!634757 (= res!410510 (validKeyInArray!0 (select (arr!18319 a!2986) j!136)))))

(declare-fun b!634758 () Bool)

(declare-fun res!410503 () Bool)

(assert (=> b!634758 (=> (not res!410503) (not e!363005))))

(assert (=> b!634758 (= res!410503 (and (= (size!18683 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18683 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18683 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!634759 () Bool)

(declare-fun res!410505 () Bool)

(assert (=> b!634759 (=> (not res!410505) (not e!362997))))

(assert (=> b!634759 (= res!410505 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18319 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!634760 () Bool)

(declare-fun lt!293428 () SeekEntryResult!6715)

(assert (=> b!634760 (= e!363002 (= lt!293428 lt!293423))))

(declare-fun b!634761 () Bool)

(assert (=> b!634761 (= e!363000 e!363003)))

(declare-fun res!410509 () Bool)

(assert (=> b!634761 (=> (not res!410509) (not e!363003))))

(assert (=> b!634761 (= res!410509 (and (= lt!293428 (Found!6715 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18319 a!2986) index!984) (select (arr!18319 a!2986) j!136))) (not (= (select (arr!18319 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!634761 (= lt!293428 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18319 a!2986) j!136) a!2986 mask!3053))))

(declare-fun res!410515 () Bool)

(assert (=> start!57396 (=> (not res!410515) (not e!363005))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57396 (= res!410515 (validMask!0 mask!3053))))

(assert (=> start!57396 e!363005))

(assert (=> start!57396 true))

(declare-fun array_inv!14178 (array!38187) Bool)

(assert (=> start!57396 (array_inv!14178 a!2986)))

(declare-fun b!634755 () Bool)

(declare-fun res!410518 () Bool)

(assert (=> b!634755 (=> (not res!410518) (not e!362997))))

(declare-datatypes ((List!12267 0))(
  ( (Nil!12264) (Cons!12263 (h!13311 (_ BitVec 64)) (t!18487 List!12267)) )
))
(declare-fun arrayNoDuplicates!0 (array!38187 (_ BitVec 32) List!12267) Bool)

(assert (=> b!634755 (= res!410518 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12264))))

(declare-fun b!634762 () Bool)

(declare-fun res!410516 () Bool)

(assert (=> b!634762 (=> (not res!410516) (not e!363005))))

(assert (=> b!634762 (= res!410516 (validKeyInArray!0 k0!1786))))

(declare-fun b!634763 () Bool)

(declare-fun res!410508 () Bool)

(assert (=> b!634763 (=> (not res!410508) (not e!362997))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38187 (_ BitVec 32)) Bool)

(assert (=> b!634763 (= res!410508 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!634764 () Bool)

(declare-fun e!363001 () Bool)

(assert (=> b!634764 (= e!363001 e!362999)))

(declare-fun res!410512 () Bool)

(assert (=> b!634764 (=> res!410512 e!362999)))

(declare-fun lt!293429 () (_ BitVec 64))

(assert (=> b!634764 (= res!410512 (or (not (= (select (arr!18319 a!2986) j!136) lt!293426)) (not (= (select (arr!18319 a!2986) j!136) lt!293429)) (bvsge j!136 index!984)))))

(declare-fun b!634765 () Bool)

(assert (=> b!634765 (= e!363004 true)))

(assert (=> b!634765 e!363001))

(declare-fun res!410511 () Bool)

(assert (=> b!634765 (=> (not res!410511) (not e!363001))))

(assert (=> b!634765 (= res!410511 (= lt!293429 (select (arr!18319 a!2986) j!136)))))

(assert (=> b!634765 (= lt!293429 (select (store (arr!18319 a!2986) i!1108 k0!1786) index!984))))

(assert (= (and start!57396 res!410515) b!634758))

(assert (= (and b!634758 res!410503) b!634757))

(assert (= (and b!634757 res!410510) b!634762))

(assert (= (and b!634762 res!410516) b!634751))

(assert (= (and b!634751 res!410506) b!634749))

(assert (= (and b!634749 res!410513) b!634763))

(assert (= (and b!634763 res!410508) b!634755))

(assert (= (and b!634755 res!410518) b!634759))

(assert (= (and b!634759 res!410505) b!634756))

(assert (= (and b!634756 res!410507) b!634761))

(assert (= (and b!634761 res!410509) b!634753))

(assert (= (and b!634753 res!410517) b!634760))

(assert (= (and b!634753 c!72491) b!634754))

(assert (= (and b!634753 (not c!72491)) b!634752))

(assert (= (and b!634753 (not res!410514)) b!634765))

(assert (= (and b!634765 res!410511) b!634764))

(assert (= (and b!634764 (not res!410512)) b!634750))

(assert (= (and b!634750 res!410504) b!634748))

(declare-fun m!609571 () Bool)

(assert (=> b!634756 m!609571))

(declare-fun m!609573 () Bool)

(assert (=> b!634756 m!609573))

(declare-fun m!609575 () Bool)

(assert (=> b!634750 m!609575))

(assert (=> b!634750 m!609575))

(declare-fun m!609577 () Bool)

(assert (=> b!634750 m!609577))

(assert (=> b!634748 m!609575))

(assert (=> b!634748 m!609575))

(declare-fun m!609579 () Bool)

(assert (=> b!634748 m!609579))

(assert (=> b!634757 m!609575))

(assert (=> b!634757 m!609575))

(declare-fun m!609581 () Bool)

(assert (=> b!634757 m!609581))

(declare-fun m!609583 () Bool)

(assert (=> b!634762 m!609583))

(declare-fun m!609585 () Bool)

(assert (=> b!634751 m!609585))

(declare-fun m!609587 () Bool)

(assert (=> b!634761 m!609587))

(assert (=> b!634761 m!609575))

(assert (=> b!634761 m!609575))

(declare-fun m!609589 () Bool)

(assert (=> b!634761 m!609589))

(declare-fun m!609591 () Bool)

(assert (=> b!634755 m!609591))

(declare-fun m!609593 () Bool)

(assert (=> b!634753 m!609593))

(assert (=> b!634753 m!609575))

(declare-fun m!609595 () Bool)

(assert (=> b!634753 m!609595))

(assert (=> b!634753 m!609575))

(assert (=> b!634753 m!609571))

(declare-fun m!609597 () Bool)

(assert (=> b!634753 m!609597))

(declare-fun m!609599 () Bool)

(assert (=> b!634753 m!609599))

(declare-fun m!609601 () Bool)

(assert (=> b!634753 m!609601))

(declare-fun m!609603 () Bool)

(assert (=> b!634753 m!609603))

(declare-fun m!609605 () Bool)

(assert (=> b!634759 m!609605))

(assert (=> b!634765 m!609575))

(assert (=> b!634765 m!609571))

(declare-fun m!609607 () Bool)

(assert (=> b!634765 m!609607))

(declare-fun m!609609 () Bool)

(assert (=> b!634763 m!609609))

(declare-fun m!609611 () Bool)

(assert (=> b!634749 m!609611))

(assert (=> b!634764 m!609575))

(declare-fun m!609613 () Bool)

(assert (=> start!57396 m!609613))

(declare-fun m!609615 () Bool)

(assert (=> start!57396 m!609615))

(check-sat (not b!634762) (not b!634748) (not b!634757) (not b!634750) (not b!634761) (not b!634749) (not b!634751) (not start!57396) (not b!634763) (not b!634755) (not b!634753))
(check-sat)
