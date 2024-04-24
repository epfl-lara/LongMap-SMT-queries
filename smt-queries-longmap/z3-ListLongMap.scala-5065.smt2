; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69068 () Bool)

(assert start!69068)

(declare-fun e!445851 () Bool)

(declare-datatypes ((SeekEntryResult!8467 0))(
  ( (MissingZero!8467 (index!36236 (_ BitVec 32))) (Found!8467 (index!36237 (_ BitVec 32))) (Intermediate!8467 (undefined!9279 Bool) (index!36238 (_ BitVec 32)) (x!67239 (_ BitVec 32))) (Undefined!8467) (MissingVacant!8467 (index!36239 (_ BitVec 32))) )
))
(declare-fun lt!360074 () SeekEntryResult!8467)

(declare-fun lt!360075 () SeekEntryResult!8467)

(declare-fun b!804493 () Bool)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!804493 (= e!445851 (not (or (not (= lt!360074 lt!360075)) (bvslt mask!3266 #b00000000000000000000000000000000) (bvslt index!1236 (bvadd #b00000000000000000000000000000001 mask!3266)))))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-datatypes ((array!43690 0))(
  ( (array!43691 (arr!20920 (Array (_ BitVec 32) (_ BitVec 64))) (size!21340 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43690)

(declare-fun lt!360077 () (_ BitVec 64))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun lt!360080 () array!43690)

(declare-fun lt!360082 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43690 (_ BitVec 32)) SeekEntryResult!8467)

(assert (=> b!804493 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!360082 vacantAfter!23 lt!360077 lt!360080 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!360082 vacantBefore!23 (select (arr!20920 a!3170) j!153) a!3170 mask!3266))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-datatypes ((Unit!27559 0))(
  ( (Unit!27560) )
))
(declare-fun lt!360083 () Unit!27559)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!43690 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27559)

(assert (=> b!804493 (= lt!360083 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k0!2044 j!153 lt!360082 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!804493 (= lt!360082 (nextIndex!0 index!1236 (bvadd #b00000000000000000000000000000001 x!1077) mask!3266))))

(declare-fun b!804494 () Bool)

(declare-fun res!548465 () Bool)

(declare-fun e!445853 () Bool)

(assert (=> b!804494 (=> (not res!548465) (not e!445853))))

(declare-fun arrayContainsKey!0 (array!43690 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!804494 (= res!548465 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!804495 () Bool)

(declare-fun res!548472 () Bool)

(declare-fun e!445855 () Bool)

(assert (=> b!804495 (=> (not res!548472) (not e!445855))))

(assert (=> b!804495 (= res!548472 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21340 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20920 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21340 a!3170)) (= (select (arr!20920 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!804496 () Bool)

(declare-fun res!548469 () Bool)

(assert (=> b!804496 (=> (not res!548469) (not e!445855))))

(declare-datatypes ((List!14790 0))(
  ( (Nil!14787) (Cons!14786 (h!15921 (_ BitVec 64)) (t!21097 List!14790)) )
))
(declare-fun arrayNoDuplicates!0 (array!43690 (_ BitVec 32) List!14790) Bool)

(assert (=> b!804496 (= res!548469 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14787))))

(declare-fun b!804497 () Bool)

(declare-fun res!548475 () Bool)

(assert (=> b!804497 (=> (not res!548475) (not e!445853))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!804497 (= res!548475 (validKeyInArray!0 k0!2044))))

(declare-fun b!804499 () Bool)

(declare-fun e!445854 () Bool)

(declare-fun e!445852 () Bool)

(assert (=> b!804499 (= e!445854 e!445852)))

(declare-fun res!548471 () Bool)

(assert (=> b!804499 (=> (not res!548471) (not e!445852))))

(declare-fun lt!360076 () SeekEntryResult!8467)

(declare-fun lt!360079 () SeekEntryResult!8467)

(assert (=> b!804499 (= res!548471 (= lt!360076 lt!360079))))

(assert (=> b!804499 (= lt!360079 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20920 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43690 (_ BitVec 32)) SeekEntryResult!8467)

(assert (=> b!804499 (= lt!360076 (seekEntryOrOpen!0 (select (arr!20920 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!804500 () Bool)

(assert (=> b!804500 (= e!445852 e!445851)))

(declare-fun res!548468 () Bool)

(assert (=> b!804500 (=> (not res!548468) (not e!445851))))

(assert (=> b!804500 (= res!548468 (and (= lt!360079 lt!360075) (not (= (select (arr!20920 a!3170) index!1236) (select (arr!20920 a!3170) j!153)))))))

(assert (=> b!804500 (= lt!360075 (Found!8467 j!153))))

(declare-fun b!804501 () Bool)

(declare-fun res!548470 () Bool)

(assert (=> b!804501 (=> (not res!548470) (not e!445853))))

(assert (=> b!804501 (= res!548470 (and (= (size!21340 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21340 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21340 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!804502 () Bool)

(declare-fun res!548464 () Bool)

(assert (=> b!804502 (=> (not res!548464) (not e!445853))))

(assert (=> b!804502 (= res!548464 (validKeyInArray!0 (select (arr!20920 a!3170) j!153)))))

(declare-fun b!804503 () Bool)

(declare-fun res!548473 () Bool)

(assert (=> b!804503 (=> (not res!548473) (not e!445855))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43690 (_ BitVec 32)) Bool)

(assert (=> b!804503 (= res!548473 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!804504 () Bool)

(assert (=> b!804504 (= e!445855 e!445854)))

(declare-fun res!548467 () Bool)

(assert (=> b!804504 (=> (not res!548467) (not e!445854))))

(declare-fun lt!360078 () SeekEntryResult!8467)

(assert (=> b!804504 (= res!548467 (= lt!360078 lt!360074))))

(assert (=> b!804504 (= lt!360074 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!360077 lt!360080 mask!3266))))

(assert (=> b!804504 (= lt!360078 (seekEntryOrOpen!0 lt!360077 lt!360080 mask!3266))))

(assert (=> b!804504 (= lt!360077 (select (store (arr!20920 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!804504 (= lt!360080 (array!43691 (store (arr!20920 a!3170) i!1163 k0!2044) (size!21340 a!3170)))))

(declare-fun res!548474 () Bool)

(assert (=> start!69068 (=> (not res!548474) (not e!445853))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69068 (= res!548474 (validMask!0 mask!3266))))

(assert (=> start!69068 e!445853))

(assert (=> start!69068 true))

(declare-fun array_inv!16779 (array!43690) Bool)

(assert (=> start!69068 (array_inv!16779 a!3170)))

(declare-fun b!804498 () Bool)

(assert (=> b!804498 (= e!445853 e!445855)))

(declare-fun res!548466 () Bool)

(assert (=> b!804498 (=> (not res!548466) (not e!445855))))

(declare-fun lt!360081 () SeekEntryResult!8467)

(assert (=> b!804498 (= res!548466 (or (= lt!360081 (MissingZero!8467 i!1163)) (= lt!360081 (MissingVacant!8467 i!1163))))))

(assert (=> b!804498 (= lt!360081 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(assert (= (and start!69068 res!548474) b!804501))

(assert (= (and b!804501 res!548470) b!804502))

(assert (= (and b!804502 res!548464) b!804497))

(assert (= (and b!804497 res!548475) b!804494))

(assert (= (and b!804494 res!548465) b!804498))

(assert (= (and b!804498 res!548466) b!804503))

(assert (= (and b!804503 res!548473) b!804496))

(assert (= (and b!804496 res!548469) b!804495))

(assert (= (and b!804495 res!548472) b!804504))

(assert (= (and b!804504 res!548467) b!804499))

(assert (= (and b!804499 res!548471) b!804500))

(assert (= (and b!804500 res!548468) b!804493))

(declare-fun m!746635 () Bool)

(assert (=> b!804500 m!746635))

(declare-fun m!746637 () Bool)

(assert (=> b!804500 m!746637))

(declare-fun m!746639 () Bool)

(assert (=> b!804503 m!746639))

(declare-fun m!746641 () Bool)

(assert (=> b!804497 m!746641))

(assert (=> b!804499 m!746637))

(assert (=> b!804499 m!746637))

(declare-fun m!746643 () Bool)

(assert (=> b!804499 m!746643))

(assert (=> b!804499 m!746637))

(declare-fun m!746645 () Bool)

(assert (=> b!804499 m!746645))

(declare-fun m!746647 () Bool)

(assert (=> b!804498 m!746647))

(declare-fun m!746649 () Bool)

(assert (=> b!804494 m!746649))

(declare-fun m!746651 () Bool)

(assert (=> b!804504 m!746651))

(declare-fun m!746653 () Bool)

(assert (=> b!804504 m!746653))

(declare-fun m!746655 () Bool)

(assert (=> b!804504 m!746655))

(declare-fun m!746657 () Bool)

(assert (=> b!804504 m!746657))

(declare-fun m!746659 () Bool)

(assert (=> start!69068 m!746659))

(declare-fun m!746661 () Bool)

(assert (=> start!69068 m!746661))

(declare-fun m!746663 () Bool)

(assert (=> b!804495 m!746663))

(declare-fun m!746665 () Bool)

(assert (=> b!804495 m!746665))

(assert (=> b!804493 m!746637))

(assert (=> b!804493 m!746637))

(declare-fun m!746667 () Bool)

(assert (=> b!804493 m!746667))

(declare-fun m!746669 () Bool)

(assert (=> b!804493 m!746669))

(declare-fun m!746671 () Bool)

(assert (=> b!804493 m!746671))

(declare-fun m!746673 () Bool)

(assert (=> b!804493 m!746673))

(assert (=> b!804502 m!746637))

(assert (=> b!804502 m!746637))

(declare-fun m!746675 () Bool)

(assert (=> b!804502 m!746675))

(declare-fun m!746677 () Bool)

(assert (=> b!804496 m!746677))

(check-sat (not b!804499) (not start!69068) (not b!804502) (not b!804497) (not b!804496) (not b!804494) (not b!804503) (not b!804498) (not b!804504) (not b!804493))
(check-sat)
