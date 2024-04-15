; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86466 () Bool)

(assert start!86466)

(declare-fun b!1001107 () Bool)

(declare-fun res!670719 () Bool)

(declare-fun e!564116 () Bool)

(assert (=> b!1001107 (=> (not res!670719) (not e!564116))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1001107 (= res!670719 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1001108 () Bool)

(declare-fun e!564114 () Bool)

(declare-fun e!564115 () Bool)

(assert (=> b!1001108 (= e!564114 e!564115)))

(declare-fun res!670709 () Bool)

(assert (=> b!1001108 (=> (not res!670709) (not e!564115))))

(declare-datatypes ((SeekEntryResult!9389 0))(
  ( (MissingZero!9389 (index!39927 (_ BitVec 32))) (Found!9389 (index!39928 (_ BitVec 32))) (Intermediate!9389 (undefined!10201 Bool) (index!39929 (_ BitVec 32)) (x!87364 (_ BitVec 32))) (Undefined!9389) (MissingVacant!9389 (index!39930 (_ BitVec 32))) )
))
(declare-fun lt!442388 () SeekEntryResult!9389)

(declare-fun lt!442393 () SeekEntryResult!9389)

(assert (=> b!1001108 (= res!670709 (= lt!442388 lt!442393))))

(declare-datatypes ((array!63214 0))(
  ( (array!63215 (arr!30432 (Array (_ BitVec 32) (_ BitVec 64))) (size!30936 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63214)

(declare-fun j!170 () (_ BitVec 32))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63214 (_ BitVec 32)) SeekEntryResult!9389)

(assert (=> b!1001108 (= lt!442388 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30432 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1001110 () Bool)

(declare-fun res!670715 () Bool)

(declare-fun e!564113 () Bool)

(assert (=> b!1001110 (=> (not res!670715) (not e!564113))))

(declare-datatypes ((List!21174 0))(
  ( (Nil!21171) (Cons!21170 (h!22347 (_ BitVec 64)) (t!30166 List!21174)) )
))
(declare-fun arrayNoDuplicates!0 (array!63214 (_ BitVec 32) List!21174) Bool)

(assert (=> b!1001110 (= res!670715 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21171))))

(declare-fun b!1001111 () Bool)

(declare-fun e!564119 () Bool)

(assert (=> b!1001111 (= e!564119 e!564113)))

(declare-fun res!670723 () Bool)

(assert (=> b!1001111 (=> (not res!670723) (not e!564113))))

(declare-fun lt!442392 () SeekEntryResult!9389)

(assert (=> b!1001111 (= res!670723 (or (= lt!442392 (MissingVacant!9389 i!1194)) (= lt!442392 (MissingZero!9389 i!1194))))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63214 (_ BitVec 32)) SeekEntryResult!9389)

(assert (=> b!1001111 (= lt!442392 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1001112 () Bool)

(assert (=> b!1001112 (= e!564115 e!564116)))

(declare-fun res!670722 () Bool)

(assert (=> b!1001112 (=> (not res!670722) (not e!564116))))

(declare-fun lt!442386 () array!63214)

(declare-fun lt!442390 () (_ BitVec 64))

(declare-fun lt!442387 () SeekEntryResult!9389)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1001112 (= res!670722 (not (= lt!442387 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!442390 mask!3464) lt!442390 lt!442386 mask!3464))))))

(assert (=> b!1001112 (= lt!442390 (select (store (arr!30432 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1001112 (= lt!442386 (array!63215 (store (arr!30432 a!3219) i!1194 k0!2224) (size!30936 a!3219)))))

(declare-fun b!1001113 () Bool)

(declare-fun e!564118 () Bool)

(assert (=> b!1001113 (= e!564116 e!564118)))

(declare-fun res!670710 () Bool)

(assert (=> b!1001113 (=> (not res!670710) (not e!564118))))

(declare-fun resX!38 () (_ BitVec 32))

(declare-fun lt!442391 () (_ BitVec 32))

(assert (=> b!1001113 (= res!670710 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1245) resX!38) (bvsge (bvadd #b00000000000000000000000000000001 x!1245) #b00000000000000000000000000000000) (bvsge lt!442391 #b00000000000000000000000000000000) (bvslt lt!442391 (size!30936 a!3219))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1001113 (= lt!442391 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun b!1001114 () Bool)

(declare-fun res!670714 () Bool)

(assert (=> b!1001114 (=> (not res!670714) (not e!564119))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1001114 (= res!670714 (validKeyInArray!0 k0!2224))))

(declare-fun res!670721 () Bool)

(assert (=> start!86466 (=> (not res!670721) (not e!564119))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86466 (= res!670721 (validMask!0 mask!3464))))

(assert (=> start!86466 e!564119))

(declare-fun array_inv!23575 (array!63214) Bool)

(assert (=> start!86466 (array_inv!23575 a!3219)))

(assert (=> start!86466 true))

(declare-fun b!1001109 () Bool)

(declare-fun res!670713 () Bool)

(assert (=> b!1001109 (=> (not res!670713) (not e!564116))))

(assert (=> b!1001109 (= res!670713 (not (= lt!442388 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!442390 lt!442386 mask!3464))))))

(declare-fun b!1001115 () Bool)

(declare-fun res!670716 () Bool)

(assert (=> b!1001115 (=> (not res!670716) (not e!564113))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63214 (_ BitVec 32)) Bool)

(assert (=> b!1001115 (= res!670716 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1001116 () Bool)

(declare-fun res!670712 () Bool)

(assert (=> b!1001116 (=> (not res!670712) (not e!564119))))

(declare-fun arrayContainsKey!0 (array!63214 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1001116 (= res!670712 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1001117 () Bool)

(declare-fun res!670717 () Bool)

(assert (=> b!1001117 (=> (not res!670717) (not e!564113))))

(assert (=> b!1001117 (= res!670717 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30936 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30936 a!3219))))))

(declare-fun b!1001118 () Bool)

(declare-fun res!670711 () Bool)

(assert (=> b!1001118 (=> (not res!670711) (not e!564118))))

(assert (=> b!1001118 (= res!670711 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!442391 (select (arr!30432 a!3219) j!170) a!3219 mask!3464) lt!442393))))

(declare-fun b!1001119 () Bool)

(declare-fun res!670718 () Bool)

(assert (=> b!1001119 (=> (not res!670718) (not e!564119))))

(assert (=> b!1001119 (= res!670718 (and (= (size!30936 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30936 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30936 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1001120 () Bool)

(declare-fun res!670724 () Bool)

(assert (=> b!1001120 (=> (not res!670724) (not e!564119))))

(assert (=> b!1001120 (= res!670724 (validKeyInArray!0 (select (arr!30432 a!3219) j!170)))))

(declare-fun b!1001121 () Bool)

(assert (=> b!1001121 (= e!564118 false)))

(declare-fun lt!442389 () SeekEntryResult!9389)

(assert (=> b!1001121 (= lt!442389 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!442391 lt!442390 lt!442386 mask!3464))))

(declare-fun b!1001122 () Bool)

(assert (=> b!1001122 (= e!564113 e!564114)))

(declare-fun res!670720 () Bool)

(assert (=> b!1001122 (=> (not res!670720) (not e!564114))))

(assert (=> b!1001122 (= res!670720 (= lt!442387 lt!442393))))

(assert (=> b!1001122 (= lt!442393 (Intermediate!9389 false resIndex!38 resX!38))))

(assert (=> b!1001122 (= lt!442387 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30432 a!3219) j!170) mask!3464) (select (arr!30432 a!3219) j!170) a!3219 mask!3464))))

(assert (= (and start!86466 res!670721) b!1001119))

(assert (= (and b!1001119 res!670718) b!1001120))

(assert (= (and b!1001120 res!670724) b!1001114))

(assert (= (and b!1001114 res!670714) b!1001116))

(assert (= (and b!1001116 res!670712) b!1001111))

(assert (= (and b!1001111 res!670723) b!1001115))

(assert (= (and b!1001115 res!670716) b!1001110))

(assert (= (and b!1001110 res!670715) b!1001117))

(assert (= (and b!1001117 res!670717) b!1001122))

(assert (= (and b!1001122 res!670720) b!1001108))

(assert (= (and b!1001108 res!670709) b!1001112))

(assert (= (and b!1001112 res!670722) b!1001109))

(assert (= (and b!1001109 res!670713) b!1001107))

(assert (= (and b!1001107 res!670719) b!1001113))

(assert (= (and b!1001113 res!670710) b!1001118))

(assert (= (and b!1001118 res!670711) b!1001121))

(declare-fun m!926659 () Bool)

(assert (=> b!1001113 m!926659))

(declare-fun m!926661 () Bool)

(assert (=> b!1001116 m!926661))

(declare-fun m!926663 () Bool)

(assert (=> b!1001108 m!926663))

(assert (=> b!1001108 m!926663))

(declare-fun m!926665 () Bool)

(assert (=> b!1001108 m!926665))

(assert (=> b!1001122 m!926663))

(assert (=> b!1001122 m!926663))

(declare-fun m!926667 () Bool)

(assert (=> b!1001122 m!926667))

(assert (=> b!1001122 m!926667))

(assert (=> b!1001122 m!926663))

(declare-fun m!926669 () Bool)

(assert (=> b!1001122 m!926669))

(declare-fun m!926671 () Bool)

(assert (=> b!1001121 m!926671))

(declare-fun m!926673 () Bool)

(assert (=> start!86466 m!926673))

(declare-fun m!926675 () Bool)

(assert (=> start!86466 m!926675))

(assert (=> b!1001118 m!926663))

(assert (=> b!1001118 m!926663))

(declare-fun m!926677 () Bool)

(assert (=> b!1001118 m!926677))

(declare-fun m!926679 () Bool)

(assert (=> b!1001109 m!926679))

(assert (=> b!1001120 m!926663))

(assert (=> b!1001120 m!926663))

(declare-fun m!926681 () Bool)

(assert (=> b!1001120 m!926681))

(declare-fun m!926683 () Bool)

(assert (=> b!1001112 m!926683))

(assert (=> b!1001112 m!926683))

(declare-fun m!926685 () Bool)

(assert (=> b!1001112 m!926685))

(declare-fun m!926687 () Bool)

(assert (=> b!1001112 m!926687))

(declare-fun m!926689 () Bool)

(assert (=> b!1001112 m!926689))

(declare-fun m!926691 () Bool)

(assert (=> b!1001115 m!926691))

(declare-fun m!926693 () Bool)

(assert (=> b!1001111 m!926693))

(declare-fun m!926695 () Bool)

(assert (=> b!1001110 m!926695))

(declare-fun m!926697 () Bool)

(assert (=> b!1001114 m!926697))

(check-sat (not b!1001111) (not b!1001109) (not b!1001112) (not b!1001121) (not b!1001122) (not b!1001116) (not b!1001113) (not start!86466) (not b!1001118) (not b!1001115) (not b!1001114) (not b!1001110) (not b!1001120) (not b!1001108))
(check-sat)
