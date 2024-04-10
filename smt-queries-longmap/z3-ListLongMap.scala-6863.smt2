; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86434 () Bool)

(assert start!86434)

(declare-fun b!1000561 () Bool)

(declare-fun res!670042 () Bool)

(declare-fun e!563936 () Bool)

(assert (=> b!1000561 (=> (not res!670042) (not e!563936))))

(declare-datatypes ((array!63235 0))(
  ( (array!63236 (arr!30443 (Array (_ BitVec 32) (_ BitVec 64))) (size!30945 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63235)

(declare-fun j!170 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1000561 (= res!670042 (validKeyInArray!0 (select (arr!30443 a!3219) j!170)))))

(declare-fun b!1000562 () Bool)

(declare-fun res!670046 () Bool)

(declare-fun e!563938 () Bool)

(assert (=> b!1000562 (=> (not res!670046) (not e!563938))))

(declare-datatypes ((SeekEntryResult!9375 0))(
  ( (MissingZero!9375 (index!39871 (_ BitVec 32))) (Found!9375 (index!39872 (_ BitVec 32))) (Intermediate!9375 (undefined!10187 Bool) (index!39873 (_ BitVec 32)) (x!87299 (_ BitVec 32))) (Undefined!9375) (MissingVacant!9375 (index!39874 (_ BitVec 32))) )
))
(declare-fun lt!442322 () SeekEntryResult!9375)

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63235 (_ BitVec 32)) SeekEntryResult!9375)

(assert (=> b!1000562 (= res!670046 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30443 a!3219) j!170) a!3219 mask!3464) lt!442322))))

(declare-fun b!1000564 () Bool)

(declare-fun res!670050 () Bool)

(assert (=> b!1000564 (=> (not res!670050) (not e!563936))))

(declare-fun k0!2224 () (_ BitVec 64))

(assert (=> b!1000564 (= res!670050 (validKeyInArray!0 k0!2224))))

(declare-fun b!1000565 () Bool)

(declare-fun res!670043 () Bool)

(assert (=> b!1000565 (=> (not res!670043) (not e!563938))))

(declare-fun i!1194 () (_ BitVec 32))

(declare-fun lt!442321 () SeekEntryResult!9375)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1000565 (= res!670043 (not (= lt!442321 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!30443 a!3219) i!1194 k0!2224) j!170) mask!3464) (select (store (arr!30443 a!3219) i!1194 k0!2224) j!170) (array!63236 (store (arr!30443 a!3219) i!1194 k0!2224) (size!30945 a!3219)) mask!3464))))))

(declare-fun b!1000566 () Bool)

(assert (=> b!1000566 (= e!563938 (and (bvsge mask!3464 #b00000000000000000000000000000000) (bvsge index!1507 (bvadd #b00000000000000000000000000000001 mask!3464))))))

(declare-fun b!1000567 () Bool)

(declare-fun res!670045 () Bool)

(assert (=> b!1000567 (=> (not res!670045) (not e!563936))))

(declare-fun arrayContainsKey!0 (array!63235 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1000567 (= res!670045 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1000568 () Bool)

(declare-fun res!670039 () Bool)

(declare-fun e!563935 () Bool)

(assert (=> b!1000568 (=> (not res!670039) (not e!563935))))

(declare-datatypes ((List!21119 0))(
  ( (Nil!21116) (Cons!21115 (h!22292 (_ BitVec 64)) (t!30120 List!21119)) )
))
(declare-fun arrayNoDuplicates!0 (array!63235 (_ BitVec 32) List!21119) Bool)

(assert (=> b!1000568 (= res!670039 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21116))))

(declare-fun b!1000569 () Bool)

(assert (=> b!1000569 (= e!563936 e!563935)))

(declare-fun res!670041 () Bool)

(assert (=> b!1000569 (=> (not res!670041) (not e!563935))))

(declare-fun lt!442320 () SeekEntryResult!9375)

(assert (=> b!1000569 (= res!670041 (or (= lt!442320 (MissingVacant!9375 i!1194)) (= lt!442320 (MissingZero!9375 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63235 (_ BitVec 32)) SeekEntryResult!9375)

(assert (=> b!1000569 (= lt!442320 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1000570 () Bool)

(assert (=> b!1000570 (= e!563935 e!563938)))

(declare-fun res!670040 () Bool)

(assert (=> b!1000570 (=> (not res!670040) (not e!563938))))

(assert (=> b!1000570 (= res!670040 (= lt!442321 lt!442322))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1000570 (= lt!442322 (Intermediate!9375 false resIndex!38 resX!38))))

(assert (=> b!1000570 (= lt!442321 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30443 a!3219) j!170) mask!3464) (select (arr!30443 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1000571 () Bool)

(declare-fun res!670049 () Bool)

(assert (=> b!1000571 (=> (not res!670049) (not e!563936))))

(assert (=> b!1000571 (= res!670049 (and (= (size!30945 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30945 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30945 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1000572 () Bool)

(declare-fun res!670047 () Bool)

(assert (=> b!1000572 (=> (not res!670047) (not e!563935))))

(assert (=> b!1000572 (= res!670047 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30945 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30945 a!3219))))))

(declare-fun res!670048 () Bool)

(assert (=> start!86434 (=> (not res!670048) (not e!563936))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86434 (= res!670048 (validMask!0 mask!3464))))

(assert (=> start!86434 e!563936))

(declare-fun array_inv!23567 (array!63235) Bool)

(assert (=> start!86434 (array_inv!23567 a!3219)))

(assert (=> start!86434 true))

(declare-fun b!1000563 () Bool)

(declare-fun res!670044 () Bool)

(assert (=> b!1000563 (=> (not res!670044) (not e!563935))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63235 (_ BitVec 32)) Bool)

(assert (=> b!1000563 (= res!670044 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(assert (= (and start!86434 res!670048) b!1000571))

(assert (= (and b!1000571 res!670049) b!1000561))

(assert (= (and b!1000561 res!670042) b!1000564))

(assert (= (and b!1000564 res!670050) b!1000567))

(assert (= (and b!1000567 res!670045) b!1000569))

(assert (= (and b!1000569 res!670041) b!1000563))

(assert (= (and b!1000563 res!670044) b!1000568))

(assert (= (and b!1000568 res!670039) b!1000572))

(assert (= (and b!1000572 res!670047) b!1000570))

(assert (= (and b!1000570 res!670040) b!1000562))

(assert (= (and b!1000562 res!670046) b!1000565))

(assert (= (and b!1000565 res!670043) b!1000566))

(declare-fun m!926719 () Bool)

(assert (=> b!1000570 m!926719))

(assert (=> b!1000570 m!926719))

(declare-fun m!926721 () Bool)

(assert (=> b!1000570 m!926721))

(assert (=> b!1000570 m!926721))

(assert (=> b!1000570 m!926719))

(declare-fun m!926723 () Bool)

(assert (=> b!1000570 m!926723))

(assert (=> b!1000562 m!926719))

(assert (=> b!1000562 m!926719))

(declare-fun m!926725 () Bool)

(assert (=> b!1000562 m!926725))

(assert (=> b!1000561 m!926719))

(assert (=> b!1000561 m!926719))

(declare-fun m!926727 () Bool)

(assert (=> b!1000561 m!926727))

(declare-fun m!926729 () Bool)

(assert (=> b!1000563 m!926729))

(declare-fun m!926731 () Bool)

(assert (=> b!1000565 m!926731))

(declare-fun m!926733 () Bool)

(assert (=> b!1000565 m!926733))

(assert (=> b!1000565 m!926733))

(declare-fun m!926735 () Bool)

(assert (=> b!1000565 m!926735))

(assert (=> b!1000565 m!926735))

(assert (=> b!1000565 m!926733))

(declare-fun m!926737 () Bool)

(assert (=> b!1000565 m!926737))

(declare-fun m!926739 () Bool)

(assert (=> b!1000568 m!926739))

(declare-fun m!926741 () Bool)

(assert (=> b!1000567 m!926741))

(declare-fun m!926743 () Bool)

(assert (=> b!1000564 m!926743))

(declare-fun m!926745 () Bool)

(assert (=> start!86434 m!926745))

(declare-fun m!926747 () Bool)

(assert (=> start!86434 m!926747))

(declare-fun m!926749 () Bool)

(assert (=> b!1000569 m!926749))

(check-sat (not start!86434) (not b!1000561) (not b!1000562) (not b!1000570) (not b!1000569) (not b!1000567) (not b!1000564) (not b!1000563) (not b!1000565) (not b!1000568))
(check-sat)
