; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68826 () Bool)

(assert start!68826)

(declare-fun b!802408 () Bool)

(declare-fun res!547074 () Bool)

(declare-fun e!444664 () Bool)

(assert (=> b!802408 (=> (not res!547074) (not e!444664))))

(declare-datatypes ((array!43633 0))(
  ( (array!43634 (arr!20897 (Array (_ BitVec 32) (_ BitVec 64))) (size!21318 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43633)

(declare-datatypes ((List!14899 0))(
  ( (Nil!14896) (Cons!14895 (h!16024 (_ BitVec 64)) (t!21205 List!14899)) )
))
(declare-fun arrayNoDuplicates!0 (array!43633 (_ BitVec 32) List!14899) Bool)

(assert (=> b!802408 (= res!547074 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14896))))

(declare-fun b!802409 () Bool)

(declare-fun res!547067 () Bool)

(assert (=> b!802409 (=> (not res!547067) (not e!444664))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43633 (_ BitVec 32)) Bool)

(assert (=> b!802409 (= res!547067 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!802410 () Bool)

(declare-fun res!547071 () Bool)

(declare-fun e!444667 () Bool)

(assert (=> b!802410 (=> (not res!547071) (not e!444667))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!802410 (= res!547071 (validKeyInArray!0 k0!2044))))

(declare-fun b!802411 () Bool)

(assert (=> b!802411 (= e!444667 e!444664)))

(declare-fun res!547068 () Bool)

(assert (=> b!802411 (=> (not res!547068) (not e!444664))))

(declare-datatypes ((SeekEntryResult!8485 0))(
  ( (MissingZero!8485 (index!36308 (_ BitVec 32))) (Found!8485 (index!36309 (_ BitVec 32))) (Intermediate!8485 (undefined!9297 Bool) (index!36310 (_ BitVec 32)) (x!67166 (_ BitVec 32))) (Undefined!8485) (MissingVacant!8485 (index!36311 (_ BitVec 32))) )
))
(declare-fun lt!358772 () SeekEntryResult!8485)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!802411 (= res!547068 (or (= lt!358772 (MissingZero!8485 i!1163)) (= lt!358772 (MissingVacant!8485 i!1163))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43633 (_ BitVec 32)) SeekEntryResult!8485)

(assert (=> b!802411 (= lt!358772 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!802412 () Bool)

(declare-fun res!547073 () Bool)

(assert (=> b!802412 (=> (not res!547073) (not e!444667))))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!802412 (= res!547073 (and (= (size!21318 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21318 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21318 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!802413 () Bool)

(declare-fun e!444663 () Bool)

(declare-fun e!444665 () Bool)

(assert (=> b!802413 (= e!444663 e!444665)))

(declare-fun res!547069 () Bool)

(assert (=> b!802413 (=> (not res!547069) (not e!444665))))

(declare-fun lt!358771 () SeekEntryResult!8485)

(declare-fun lt!358770 () SeekEntryResult!8485)

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!802413 (= res!547069 (and (= lt!358770 lt!358771) (= lt!358771 (Found!8485 j!153)) (not (= (select (arr!20897 a!3170) index!1236) (select (arr!20897 a!3170) j!153)))))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43633 (_ BitVec 32)) SeekEntryResult!8485)

(assert (=> b!802413 (= lt!358771 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20897 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!802413 (= lt!358770 (seekEntryOrOpen!0 (select (arr!20897 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!802414 () Bool)

(declare-fun res!547070 () Bool)

(assert (=> b!802414 (=> (not res!547070) (not e!444667))))

(declare-fun arrayContainsKey!0 (array!43633 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!802414 (= res!547070 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!802415 () Bool)

(declare-fun res!547077 () Bool)

(assert (=> b!802415 (=> (not res!547077) (not e!444664))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(assert (=> b!802415 (= res!547077 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21318 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20897 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21318 a!3170)) (= (select (arr!20897 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!802416 () Bool)

(declare-fun res!547075 () Bool)

(assert (=> b!802416 (=> (not res!547075) (not e!444667))))

(assert (=> b!802416 (= res!547075 (validKeyInArray!0 (select (arr!20897 a!3170) j!153)))))

(declare-fun res!547076 () Bool)

(assert (=> start!68826 (=> (not res!547076) (not e!444667))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68826 (= res!547076 (validMask!0 mask!3266))))

(assert (=> start!68826 e!444667))

(assert (=> start!68826 true))

(declare-fun array_inv!16780 (array!43633) Bool)

(assert (=> start!68826 (array_inv!16780 a!3170)))

(declare-fun b!802417 () Bool)

(assert (=> b!802417 (= e!444664 e!444663)))

(declare-fun res!547072 () Bool)

(assert (=> b!802417 (=> (not res!547072) (not e!444663))))

(declare-fun lt!358769 () (_ BitVec 64))

(declare-fun lt!358775 () array!43633)

(assert (=> b!802417 (= res!547072 (= (seekEntryOrOpen!0 lt!358769 lt!358775 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!358769 lt!358775 mask!3266)))))

(assert (=> b!802417 (= lt!358769 (select (store (arr!20897 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!802417 (= lt!358775 (array!43634 (store (arr!20897 a!3170) i!1163 k0!2044) (size!21318 a!3170)))))

(declare-fun b!802418 () Bool)

(assert (=> b!802418 (= e!444665 (not true))))

(declare-fun lt!358774 () (_ BitVec 32))

(assert (=> b!802418 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!358774 vacantAfter!23 lt!358769 lt!358775 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!358774 vacantBefore!23 (select (arr!20897 a!3170) j!153) a!3170 mask!3266))))

(declare-datatypes ((Unit!27484 0))(
  ( (Unit!27485) )
))
(declare-fun lt!358773 () Unit!27484)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!43633 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27484)

(assert (=> b!802418 (= lt!358773 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k0!2044 j!153 lt!358774 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!802418 (= lt!358774 (nextIndex!0 index!1236 x!1077 mask!3266))))

(assert (= (and start!68826 res!547076) b!802412))

(assert (= (and b!802412 res!547073) b!802416))

(assert (= (and b!802416 res!547075) b!802410))

(assert (= (and b!802410 res!547071) b!802414))

(assert (= (and b!802414 res!547070) b!802411))

(assert (= (and b!802411 res!547068) b!802409))

(assert (= (and b!802409 res!547067) b!802408))

(assert (= (and b!802408 res!547074) b!802415))

(assert (= (and b!802415 res!547077) b!802417))

(assert (= (and b!802417 res!547072) b!802413))

(assert (= (and b!802413 res!547069) b!802418))

(declare-fun m!743431 () Bool)

(assert (=> b!802418 m!743431))

(declare-fun m!743433 () Bool)

(assert (=> b!802418 m!743433))

(assert (=> b!802418 m!743431))

(declare-fun m!743435 () Bool)

(assert (=> b!802418 m!743435))

(declare-fun m!743437 () Bool)

(assert (=> b!802418 m!743437))

(declare-fun m!743439 () Bool)

(assert (=> b!802418 m!743439))

(assert (=> b!802416 m!743431))

(assert (=> b!802416 m!743431))

(declare-fun m!743441 () Bool)

(assert (=> b!802416 m!743441))

(declare-fun m!743443 () Bool)

(assert (=> b!802413 m!743443))

(assert (=> b!802413 m!743431))

(assert (=> b!802413 m!743431))

(declare-fun m!743445 () Bool)

(assert (=> b!802413 m!743445))

(assert (=> b!802413 m!743431))

(declare-fun m!743447 () Bool)

(assert (=> b!802413 m!743447))

(declare-fun m!743449 () Bool)

(assert (=> b!802411 m!743449))

(declare-fun m!743451 () Bool)

(assert (=> b!802409 m!743451))

(declare-fun m!743453 () Bool)

(assert (=> b!802415 m!743453))

(declare-fun m!743455 () Bool)

(assert (=> b!802415 m!743455))

(declare-fun m!743457 () Bool)

(assert (=> b!802408 m!743457))

(declare-fun m!743459 () Bool)

(assert (=> b!802414 m!743459))

(declare-fun m!743461 () Bool)

(assert (=> b!802410 m!743461))

(declare-fun m!743463 () Bool)

(assert (=> start!68826 m!743463))

(declare-fun m!743465 () Bool)

(assert (=> start!68826 m!743465))

(declare-fun m!743467 () Bool)

(assert (=> b!802417 m!743467))

(declare-fun m!743469 () Bool)

(assert (=> b!802417 m!743469))

(declare-fun m!743471 () Bool)

(assert (=> b!802417 m!743471))

(declare-fun m!743473 () Bool)

(assert (=> b!802417 m!743473))

(check-sat (not b!802418) (not b!802414) (not b!802417) (not b!802416) (not start!68826) (not b!802413) (not b!802411) (not b!802408) (not b!802409) (not b!802410))
(check-sat)
