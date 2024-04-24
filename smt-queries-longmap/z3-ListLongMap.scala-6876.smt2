; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86740 () Bool)

(assert start!86740)

(declare-fun b!1003435 () Bool)

(declare-fun e!565429 () Bool)

(declare-fun e!565425 () Bool)

(assert (=> b!1003435 (= e!565429 e!565425)))

(declare-fun res!672157 () Bool)

(assert (=> b!1003435 (=> (not res!672157) (not e!565425))))

(declare-datatypes ((SeekEntryResult!9367 0))(
  ( (MissingZero!9367 (index!39839 (_ BitVec 32))) (Found!9367 (index!39840 (_ BitVec 32))) (Intermediate!9367 (undefined!10179 Bool) (index!39841 (_ BitVec 32)) (x!87415 (_ BitVec 32))) (Undefined!9367) (MissingVacant!9367 (index!39842 (_ BitVec 32))) )
))
(declare-fun lt!443537 () SeekEntryResult!9367)

(declare-fun lt!443530 () SeekEntryResult!9367)

(assert (=> b!1003435 (= res!672157 (= lt!443537 lt!443530))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1003435 (= lt!443530 (Intermediate!9367 false resIndex!38 resX!38))))

(declare-datatypes ((array!63360 0))(
  ( (array!63361 (arr!30499 (Array (_ BitVec 32) (_ BitVec 64))) (size!31002 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63360)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63360 (_ BitVec 32)) SeekEntryResult!9367)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1003435 (= lt!443537 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30499 a!3219) j!170) mask!3464) (select (arr!30499 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1003436 () Bool)

(declare-fun res!672160 () Bool)

(declare-fun e!565431 () Bool)

(assert (=> b!1003436 (=> (not res!672160) (not e!565431))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1003436 (= res!672160 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1003437 () Bool)

(declare-fun res!672152 () Bool)

(assert (=> b!1003437 (=> (not res!672152) (not e!565429))))

(declare-fun x!1245 () (_ BitVec 32))

(assert (=> b!1003437 (= res!672152 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31002 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31002 a!3219))))))

(declare-fun b!1003438 () Bool)

(declare-fun e!565428 () Bool)

(assert (=> b!1003438 (= e!565431 e!565428)))

(declare-fun res!672154 () Bool)

(assert (=> b!1003438 (=> (not res!672154) (not e!565428))))

(declare-fun lt!443533 () (_ BitVec 32))

(assert (=> b!1003438 (= res!672154 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1245) resX!38) (bvsge (bvadd #b00000000000000000000000000000001 x!1245) #b00000000000000000000000000000000) (bvsge lt!443533 #b00000000000000000000000000000000) (bvslt lt!443533 (size!31002 a!3219))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1003438 (= lt!443533 (nextIndex!0 index!1507 (bvadd #b00000000000000000000000000000001 x!1245) mask!3464))))

(declare-fun b!1003439 () Bool)

(declare-fun e!565430 () Bool)

(assert (=> b!1003439 (= e!565425 e!565430)))

(declare-fun res!672153 () Bool)

(assert (=> b!1003439 (=> (not res!672153) (not e!565430))))

(declare-fun lt!443531 () SeekEntryResult!9367)

(assert (=> b!1003439 (= res!672153 (= lt!443531 lt!443530))))

(assert (=> b!1003439 (= lt!443531 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30499 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1003440 () Bool)

(declare-fun res!672158 () Bool)

(declare-fun e!565426 () Bool)

(assert (=> b!1003440 (=> (not res!672158) (not e!565426))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1003440 (= res!672158 (validKeyInArray!0 k0!2224))))

(declare-fun b!1003441 () Bool)

(declare-fun res!672164 () Bool)

(assert (=> b!1003441 (=> (not res!672164) (not e!565429))))

(declare-datatypes ((List!21146 0))(
  ( (Nil!21143) (Cons!21142 (h!22328 (_ BitVec 64)) (t!30139 List!21146)) )
))
(declare-fun arrayNoDuplicates!0 (array!63360 (_ BitVec 32) List!21146) Bool)

(assert (=> b!1003441 (= res!672164 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21143))))

(declare-fun b!1003442 () Bool)

(assert (=> b!1003442 (= e!565430 e!565431)))

(declare-fun res!672161 () Bool)

(assert (=> b!1003442 (=> (not res!672161) (not e!565431))))

(declare-fun lt!443536 () (_ BitVec 64))

(declare-fun lt!443535 () array!63360)

(assert (=> b!1003442 (= res!672161 (not (= lt!443537 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!443536 mask!3464) lt!443536 lt!443535 mask!3464))))))

(assert (=> b!1003442 (= lt!443536 (select (store (arr!30499 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1003442 (= lt!443535 (array!63361 (store (arr!30499 a!3219) i!1194 k0!2224) (size!31002 a!3219)))))

(declare-fun b!1003443 () Bool)

(assert (=> b!1003443 (= e!565428 false)))

(declare-fun lt!443532 () SeekEntryResult!9367)

(assert (=> b!1003443 (= lt!443532 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!443533 lt!443536 lt!443535 mask!3464))))

(declare-fun b!1003445 () Bool)

(declare-fun res!672155 () Bool)

(assert (=> b!1003445 (=> (not res!672155) (not e!565426))))

(assert (=> b!1003445 (= res!672155 (validKeyInArray!0 (select (arr!30499 a!3219) j!170)))))

(declare-fun b!1003446 () Bool)

(declare-fun res!672159 () Bool)

(assert (=> b!1003446 (=> (not res!672159) (not e!565426))))

(assert (=> b!1003446 (= res!672159 (and (= (size!31002 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31002 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31002 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1003447 () Bool)

(assert (=> b!1003447 (= e!565426 e!565429)))

(declare-fun res!672165 () Bool)

(assert (=> b!1003447 (=> (not res!672165) (not e!565429))))

(declare-fun lt!443534 () SeekEntryResult!9367)

(assert (=> b!1003447 (= res!672165 (or (= lt!443534 (MissingVacant!9367 i!1194)) (= lt!443534 (MissingZero!9367 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63360 (_ BitVec 32)) SeekEntryResult!9367)

(assert (=> b!1003447 (= lt!443534 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1003448 () Bool)

(declare-fun res!672167 () Bool)

(assert (=> b!1003448 (=> (not res!672167) (not e!565428))))

(assert (=> b!1003448 (= res!672167 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!443533 (select (arr!30499 a!3219) j!170) a!3219 mask!3464) lt!443530))))

(declare-fun b!1003449 () Bool)

(declare-fun res!672163 () Bool)

(assert (=> b!1003449 (=> (not res!672163) (not e!565429))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63360 (_ BitVec 32)) Bool)

(assert (=> b!1003449 (= res!672163 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1003450 () Bool)

(declare-fun res!672156 () Bool)

(assert (=> b!1003450 (=> (not res!672156) (not e!565431))))

(assert (=> b!1003450 (= res!672156 (not (= lt!443531 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!443536 lt!443535 mask!3464))))))

(declare-fun res!672162 () Bool)

(assert (=> start!86740 (=> (not res!672162) (not e!565426))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86740 (= res!672162 (validMask!0 mask!3464))))

(assert (=> start!86740 e!565426))

(declare-fun array_inv!23635 (array!63360) Bool)

(assert (=> start!86740 (array_inv!23635 a!3219)))

(assert (=> start!86740 true))

(declare-fun b!1003444 () Bool)

(declare-fun res!672166 () Bool)

(assert (=> b!1003444 (=> (not res!672166) (not e!565426))))

(declare-fun arrayContainsKey!0 (array!63360 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1003444 (= res!672166 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(assert (= (and start!86740 res!672162) b!1003446))

(assert (= (and b!1003446 res!672159) b!1003445))

(assert (= (and b!1003445 res!672155) b!1003440))

(assert (= (and b!1003440 res!672158) b!1003444))

(assert (= (and b!1003444 res!672166) b!1003447))

(assert (= (and b!1003447 res!672165) b!1003449))

(assert (= (and b!1003449 res!672163) b!1003441))

(assert (= (and b!1003441 res!672164) b!1003437))

(assert (= (and b!1003437 res!672152) b!1003435))

(assert (= (and b!1003435 res!672157) b!1003439))

(assert (= (and b!1003439 res!672153) b!1003442))

(assert (= (and b!1003442 res!672161) b!1003450))

(assert (= (and b!1003450 res!672156) b!1003436))

(assert (= (and b!1003436 res!672160) b!1003438))

(assert (= (and b!1003438 res!672154) b!1003448))

(assert (= (and b!1003448 res!672167) b!1003443))

(declare-fun m!929633 () Bool)

(assert (=> b!1003449 m!929633))

(declare-fun m!929635 () Bool)

(assert (=> b!1003447 m!929635))

(declare-fun m!929637 () Bool)

(assert (=> b!1003438 m!929637))

(declare-fun m!929639 () Bool)

(assert (=> b!1003445 m!929639))

(assert (=> b!1003445 m!929639))

(declare-fun m!929641 () Bool)

(assert (=> b!1003445 m!929641))

(declare-fun m!929643 () Bool)

(assert (=> b!1003443 m!929643))

(declare-fun m!929645 () Bool)

(assert (=> b!1003444 m!929645))

(declare-fun m!929647 () Bool)

(assert (=> b!1003450 m!929647))

(declare-fun m!929649 () Bool)

(assert (=> start!86740 m!929649))

(declare-fun m!929651 () Bool)

(assert (=> start!86740 m!929651))

(declare-fun m!929653 () Bool)

(assert (=> b!1003442 m!929653))

(assert (=> b!1003442 m!929653))

(declare-fun m!929655 () Bool)

(assert (=> b!1003442 m!929655))

(declare-fun m!929657 () Bool)

(assert (=> b!1003442 m!929657))

(declare-fun m!929659 () Bool)

(assert (=> b!1003442 m!929659))

(assert (=> b!1003448 m!929639))

(assert (=> b!1003448 m!929639))

(declare-fun m!929661 () Bool)

(assert (=> b!1003448 m!929661))

(declare-fun m!929663 () Bool)

(assert (=> b!1003440 m!929663))

(declare-fun m!929665 () Bool)

(assert (=> b!1003441 m!929665))

(assert (=> b!1003439 m!929639))

(assert (=> b!1003439 m!929639))

(declare-fun m!929667 () Bool)

(assert (=> b!1003439 m!929667))

(assert (=> b!1003435 m!929639))

(assert (=> b!1003435 m!929639))

(declare-fun m!929669 () Bool)

(assert (=> b!1003435 m!929669))

(assert (=> b!1003435 m!929669))

(assert (=> b!1003435 m!929639))

(declare-fun m!929671 () Bool)

(assert (=> b!1003435 m!929671))

(check-sat (not b!1003438) (not b!1003440) (not b!1003443) (not b!1003442) (not b!1003449) (not b!1003435) (not b!1003448) (not start!86740) (not b!1003439) (not b!1003441) (not b!1003445) (not b!1003444) (not b!1003450) (not b!1003447))
(check-sat)
