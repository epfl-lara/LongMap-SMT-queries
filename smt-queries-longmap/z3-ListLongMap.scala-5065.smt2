; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68902 () Bool)

(assert start!68902)

(declare-fun b!803641 () Bool)

(declare-fun e!445297 () Bool)

(declare-fun e!445300 () Bool)

(assert (=> b!803641 (= e!445297 e!445300)))

(declare-fun res!548164 () Bool)

(assert (=> b!803641 (=> (not res!548164) (not e!445300))))

(declare-datatypes ((SeekEntryResult!8517 0))(
  ( (MissingZero!8517 (index!36436 (_ BitVec 32))) (Found!8517 (index!36437 (_ BitVec 32))) (Intermediate!8517 (undefined!9329 Bool) (index!36438 (_ BitVec 32)) (x!67275 (_ BitVec 32))) (Undefined!8517) (MissingVacant!8517 (index!36439 (_ BitVec 32))) )
))
(declare-fun lt!359750 () SeekEntryResult!8517)

(declare-fun lt!359747 () SeekEntryResult!8517)

(assert (=> b!803641 (= res!548164 (= lt!359750 lt!359747))))

(declare-datatypes ((array!43692 0))(
  ( (array!43693 (arr!20926 (Array (_ BitVec 32) (_ BitVec 64))) (size!21347 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43692)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43692 (_ BitVec 32)) SeekEntryResult!8517)

(assert (=> b!803641 (= lt!359747 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20926 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43692 (_ BitVec 32)) SeekEntryResult!8517)

(assert (=> b!803641 (= lt!359750 (seekEntryOrOpen!0 (select (arr!20926 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!803642 () Bool)

(declare-fun e!445296 () Bool)

(declare-fun e!445301 () Bool)

(assert (=> b!803642 (= e!445296 e!445301)))

(declare-fun res!548169 () Bool)

(assert (=> b!803642 (=> (not res!548169) (not e!445301))))

(declare-fun lt!359749 () SeekEntryResult!8517)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!803642 (= res!548169 (or (= lt!359749 (MissingZero!8517 i!1163)) (= lt!359749 (MissingVacant!8517 i!1163))))))

(declare-fun k0!2044 () (_ BitVec 64))

(assert (=> b!803642 (= lt!359749 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun res!548160 () Bool)

(assert (=> start!68902 (=> (not res!548160) (not e!445296))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68902 (= res!548160 (validMask!0 mask!3266))))

(assert (=> start!68902 e!445296))

(assert (=> start!68902 true))

(declare-fun array_inv!16722 (array!43692) Bool)

(assert (=> start!68902 (array_inv!16722 a!3170)))

(declare-fun b!803643 () Bool)

(declare-fun res!548171 () Bool)

(assert (=> b!803643 (=> (not res!548171) (not e!445296))))

(declare-fun arrayContainsKey!0 (array!43692 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!803643 (= res!548171 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!803644 () Bool)

(declare-fun res!548165 () Bool)

(assert (=> b!803644 (=> (not res!548165) (not e!445301))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(assert (=> b!803644 (= res!548165 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21347 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20926 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21347 a!3170)) (= (select (arr!20926 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!803645 () Bool)

(declare-fun lt!359751 () SeekEntryResult!8517)

(declare-fun lt!359753 () SeekEntryResult!8517)

(declare-fun e!445298 () Bool)

(assert (=> b!803645 (= e!445298 (not (or (not (= lt!359751 lt!359753)) (bvslt mask!3266 #b00000000000000000000000000000000) (bvslt index!1236 (bvadd #b00000000000000000000000000000001 mask!3266)))))))

(declare-fun lt!359754 () (_ BitVec 64))

(declare-fun lt!359748 () array!43692)

(declare-fun lt!359752 () (_ BitVec 32))

(assert (=> b!803645 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!359752 vacantAfter!23 lt!359754 lt!359748 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!359752 vacantBefore!23 (select (arr!20926 a!3170) j!153) a!3170 mask!3266))))

(declare-datatypes ((Unit!27574 0))(
  ( (Unit!27575) )
))
(declare-fun lt!359755 () Unit!27574)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!43692 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27574)

(assert (=> b!803645 (= lt!359755 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k0!2044 j!153 lt!359752 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!803645 (= lt!359752 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!803646 () Bool)

(declare-fun res!548162 () Bool)

(assert (=> b!803646 (=> (not res!548162) (not e!445301))))

(declare-datatypes ((List!14889 0))(
  ( (Nil!14886) (Cons!14885 (h!16014 (_ BitVec 64)) (t!21204 List!14889)) )
))
(declare-fun arrayNoDuplicates!0 (array!43692 (_ BitVec 32) List!14889) Bool)

(assert (=> b!803646 (= res!548162 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14886))))

(declare-fun b!803647 () Bool)

(declare-fun res!548163 () Bool)

(assert (=> b!803647 (=> (not res!548163) (not e!445296))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!803647 (= res!548163 (validKeyInArray!0 k0!2044))))

(declare-fun b!803648 () Bool)

(assert (=> b!803648 (= e!445301 e!445297)))

(declare-fun res!548168 () Bool)

(assert (=> b!803648 (=> (not res!548168) (not e!445297))))

(declare-fun lt!359756 () SeekEntryResult!8517)

(assert (=> b!803648 (= res!548168 (= lt!359756 lt!359751))))

(assert (=> b!803648 (= lt!359751 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!359754 lt!359748 mask!3266))))

(assert (=> b!803648 (= lt!359756 (seekEntryOrOpen!0 lt!359754 lt!359748 mask!3266))))

(assert (=> b!803648 (= lt!359754 (select (store (arr!20926 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!803648 (= lt!359748 (array!43693 (store (arr!20926 a!3170) i!1163 k0!2044) (size!21347 a!3170)))))

(declare-fun b!803649 () Bool)

(declare-fun res!548166 () Bool)

(assert (=> b!803649 (=> (not res!548166) (not e!445296))))

(assert (=> b!803649 (= res!548166 (validKeyInArray!0 (select (arr!20926 a!3170) j!153)))))

(declare-fun b!803650 () Bool)

(assert (=> b!803650 (= e!445300 e!445298)))

(declare-fun res!548167 () Bool)

(assert (=> b!803650 (=> (not res!548167) (not e!445298))))

(assert (=> b!803650 (= res!548167 (and (= lt!359747 lt!359753) (not (= (select (arr!20926 a!3170) index!1236) (select (arr!20926 a!3170) j!153)))))))

(assert (=> b!803650 (= lt!359753 (Found!8517 j!153))))

(declare-fun b!803651 () Bool)

(declare-fun res!548161 () Bool)

(assert (=> b!803651 (=> (not res!548161) (not e!445301))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43692 (_ BitVec 32)) Bool)

(assert (=> b!803651 (= res!548161 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!803652 () Bool)

(declare-fun res!548170 () Bool)

(assert (=> b!803652 (=> (not res!548170) (not e!445296))))

(assert (=> b!803652 (= res!548170 (and (= (size!21347 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21347 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21347 a!3170)) (not (= i!1163 j!153))))))

(assert (= (and start!68902 res!548160) b!803652))

(assert (= (and b!803652 res!548170) b!803649))

(assert (= (and b!803649 res!548166) b!803647))

(assert (= (and b!803647 res!548163) b!803643))

(assert (= (and b!803643 res!548171) b!803642))

(assert (= (and b!803642 res!548169) b!803651))

(assert (= (and b!803651 res!548161) b!803646))

(assert (= (and b!803646 res!548162) b!803644))

(assert (= (and b!803644 res!548165) b!803648))

(assert (= (and b!803648 res!548168) b!803641))

(assert (= (and b!803641 res!548164) b!803650))

(assert (= (and b!803650 res!548167) b!803645))

(declare-fun m!745423 () Bool)

(assert (=> b!803645 m!745423))

(declare-fun m!745425 () Bool)

(assert (=> b!803645 m!745425))

(declare-fun m!745427 () Bool)

(assert (=> b!803645 m!745427))

(assert (=> b!803645 m!745425))

(declare-fun m!745429 () Bool)

(assert (=> b!803645 m!745429))

(declare-fun m!745431 () Bool)

(assert (=> b!803645 m!745431))

(declare-fun m!745433 () Bool)

(assert (=> b!803650 m!745433))

(assert (=> b!803650 m!745425))

(declare-fun m!745435 () Bool)

(assert (=> start!68902 m!745435))

(declare-fun m!745437 () Bool)

(assert (=> start!68902 m!745437))

(declare-fun m!745439 () Bool)

(assert (=> b!803648 m!745439))

(declare-fun m!745441 () Bool)

(assert (=> b!803648 m!745441))

(declare-fun m!745443 () Bool)

(assert (=> b!803648 m!745443))

(declare-fun m!745445 () Bool)

(assert (=> b!803648 m!745445))

(declare-fun m!745447 () Bool)

(assert (=> b!803646 m!745447))

(declare-fun m!745449 () Bool)

(assert (=> b!803644 m!745449))

(declare-fun m!745451 () Bool)

(assert (=> b!803644 m!745451))

(declare-fun m!745453 () Bool)

(assert (=> b!803647 m!745453))

(assert (=> b!803641 m!745425))

(assert (=> b!803641 m!745425))

(declare-fun m!745455 () Bool)

(assert (=> b!803641 m!745455))

(assert (=> b!803641 m!745425))

(declare-fun m!745457 () Bool)

(assert (=> b!803641 m!745457))

(assert (=> b!803649 m!745425))

(assert (=> b!803649 m!745425))

(declare-fun m!745459 () Bool)

(assert (=> b!803649 m!745459))

(declare-fun m!745461 () Bool)

(assert (=> b!803651 m!745461))

(declare-fun m!745463 () Bool)

(assert (=> b!803643 m!745463))

(declare-fun m!745465 () Bool)

(assert (=> b!803642 m!745465))

(check-sat (not b!803645) (not b!803642) (not b!803651) (not b!803649) (not b!803648) (not start!68902) (not b!803647) (not b!803646) (not b!803643) (not b!803641))
(check-sat)
