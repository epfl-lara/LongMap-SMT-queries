; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86400 () Bool)

(assert start!86400)

(declare-fun b!999900 () Bool)

(declare-fun e!563651 () Bool)

(assert (=> b!999900 (= e!563651 false)))

(declare-datatypes ((array!63148 0))(
  ( (array!63149 (arr!30399 (Array (_ BitVec 32) (_ BitVec 64))) (size!30903 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63148)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9356 0))(
  ( (MissingZero!9356 (index!39795 (_ BitVec 32))) (Found!9356 (index!39796 (_ BitVec 32))) (Intermediate!9356 (undefined!10168 Bool) (index!39797 (_ BitVec 32)) (x!87243 (_ BitVec 32))) (Undefined!9356) (MissingVacant!9356 (index!39798 (_ BitVec 32))) )
))
(declare-fun lt!441972 () SeekEntryResult!9356)

(declare-fun i!1194 () (_ BitVec 32))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63148 (_ BitVec 32)) SeekEntryResult!9356)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!999900 (= lt!441972 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!30399 a!3219) i!1194 k0!2224) j!170) mask!3464) (select (store (arr!30399 a!3219) i!1194 k0!2224) j!170) (array!63149 (store (arr!30399 a!3219) i!1194 k0!2224) (size!30903 a!3219)) mask!3464))))

(declare-fun b!999901 () Bool)

(declare-fun res!669510 () Bool)

(declare-fun e!563648 () Bool)

(assert (=> b!999901 (=> (not res!669510) (not e!563648))))

(assert (=> b!999901 (= res!669510 (and (= (size!30903 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30903 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30903 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!999902 () Bool)

(declare-fun e!563650 () Bool)

(assert (=> b!999902 (= e!563650 e!563651)))

(declare-fun res!669503 () Bool)

(assert (=> b!999902 (=> (not res!669503) (not e!563651))))

(declare-fun lt!441971 () SeekEntryResult!9356)

(assert (=> b!999902 (= res!669503 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30399 a!3219) j!170) mask!3464) (select (arr!30399 a!3219) j!170) a!3219 mask!3464) lt!441971))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!999902 (= lt!441971 (Intermediate!9356 false resIndex!38 resX!38))))

(declare-fun b!999903 () Bool)

(declare-fun res!669511 () Bool)

(assert (=> b!999903 (=> (not res!669511) (not e!563651))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun x!1245 () (_ BitVec 32))

(assert (=> b!999903 (= res!669511 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30399 a!3219) j!170) a!3219 mask!3464) lt!441971))))

(declare-fun b!999904 () Bool)

(declare-fun res!669512 () Bool)

(assert (=> b!999904 (=> (not res!669512) (not e!563650))))

(declare-datatypes ((List!21141 0))(
  ( (Nil!21138) (Cons!21137 (h!22314 (_ BitVec 64)) (t!30133 List!21141)) )
))
(declare-fun arrayNoDuplicates!0 (array!63148 (_ BitVec 32) List!21141) Bool)

(assert (=> b!999904 (= res!669512 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21138))))

(declare-fun b!999905 () Bool)

(declare-fun res!669508 () Bool)

(assert (=> b!999905 (=> (not res!669508) (not e!563650))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63148 (_ BitVec 32)) Bool)

(assert (=> b!999905 (= res!669508 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!999906 () Bool)

(declare-fun res!669507 () Bool)

(assert (=> b!999906 (=> (not res!669507) (not e!563648))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!999906 (= res!669507 (validKeyInArray!0 (select (arr!30399 a!3219) j!170)))))

(declare-fun b!999907 () Bool)

(assert (=> b!999907 (= e!563648 e!563650)))

(declare-fun res!669502 () Bool)

(assert (=> b!999907 (=> (not res!669502) (not e!563650))))

(declare-fun lt!441973 () SeekEntryResult!9356)

(assert (=> b!999907 (= res!669502 (or (= lt!441973 (MissingVacant!9356 i!1194)) (= lt!441973 (MissingZero!9356 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63148 (_ BitVec 32)) SeekEntryResult!9356)

(assert (=> b!999907 (= lt!441973 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!999908 () Bool)

(declare-fun res!669509 () Bool)

(assert (=> b!999908 (=> (not res!669509) (not e!563648))))

(declare-fun arrayContainsKey!0 (array!63148 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!999908 (= res!669509 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!999909 () Bool)

(declare-fun res!669506 () Bool)

(assert (=> b!999909 (=> (not res!669506) (not e!563650))))

(assert (=> b!999909 (= res!669506 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30903 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30903 a!3219))))))

(declare-fun res!669505 () Bool)

(assert (=> start!86400 (=> (not res!669505) (not e!563648))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86400 (= res!669505 (validMask!0 mask!3464))))

(assert (=> start!86400 e!563648))

(declare-fun array_inv!23542 (array!63148) Bool)

(assert (=> start!86400 (array_inv!23542 a!3219)))

(assert (=> start!86400 true))

(declare-fun b!999910 () Bool)

(declare-fun res!669504 () Bool)

(assert (=> b!999910 (=> (not res!669504) (not e!563648))))

(assert (=> b!999910 (= res!669504 (validKeyInArray!0 k0!2224))))

(assert (= (and start!86400 res!669505) b!999901))

(assert (= (and b!999901 res!669510) b!999906))

(assert (= (and b!999906 res!669507) b!999910))

(assert (= (and b!999910 res!669504) b!999908))

(assert (= (and b!999908 res!669509) b!999907))

(assert (= (and b!999907 res!669502) b!999905))

(assert (= (and b!999905 res!669508) b!999904))

(assert (= (and b!999904 res!669512) b!999909))

(assert (= (and b!999909 res!669506) b!999902))

(assert (= (and b!999902 res!669503) b!999903))

(assert (= (and b!999903 res!669511) b!999900))

(declare-fun m!925573 () Bool)

(assert (=> start!86400 m!925573))

(declare-fun m!925575 () Bool)

(assert (=> start!86400 m!925575))

(declare-fun m!925577 () Bool)

(assert (=> b!999908 m!925577))

(declare-fun m!925579 () Bool)

(assert (=> b!999900 m!925579))

(declare-fun m!925581 () Bool)

(assert (=> b!999900 m!925581))

(assert (=> b!999900 m!925581))

(declare-fun m!925583 () Bool)

(assert (=> b!999900 m!925583))

(assert (=> b!999900 m!925583))

(assert (=> b!999900 m!925581))

(declare-fun m!925585 () Bool)

(assert (=> b!999900 m!925585))

(declare-fun m!925587 () Bool)

(assert (=> b!999906 m!925587))

(assert (=> b!999906 m!925587))

(declare-fun m!925589 () Bool)

(assert (=> b!999906 m!925589))

(assert (=> b!999903 m!925587))

(assert (=> b!999903 m!925587))

(declare-fun m!925591 () Bool)

(assert (=> b!999903 m!925591))

(assert (=> b!999902 m!925587))

(assert (=> b!999902 m!925587))

(declare-fun m!925593 () Bool)

(assert (=> b!999902 m!925593))

(assert (=> b!999902 m!925593))

(assert (=> b!999902 m!925587))

(declare-fun m!925595 () Bool)

(assert (=> b!999902 m!925595))

(declare-fun m!925597 () Bool)

(assert (=> b!999905 m!925597))

(declare-fun m!925599 () Bool)

(assert (=> b!999907 m!925599))

(declare-fun m!925601 () Bool)

(assert (=> b!999910 m!925601))

(declare-fun m!925603 () Bool)

(assert (=> b!999904 m!925603))

(check-sat (not b!999902) (not b!999910) (not b!999905) (not b!999903) (not b!999900) (not b!999908) (not b!999904) (not start!86400) (not b!999906) (not b!999907))
(check-sat)
