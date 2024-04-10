; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86590 () Bool)

(assert start!86590)

(declare-fun b!1004109 () Bool)

(declare-fun res!673591 () Bool)

(declare-fun e!565463 () Bool)

(assert (=> b!1004109 (=> (not res!673591) (not e!565463))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9453 0))(
  ( (MissingZero!9453 (index!40183 (_ BitVec 32))) (Found!9453 (index!40184 (_ BitVec 32))) (Intermediate!9453 (undefined!10265 Bool) (index!40185 (_ BitVec 32)) (x!87585 (_ BitVec 32))) (Undefined!9453) (MissingVacant!9453 (index!40186 (_ BitVec 32))) )
))
(declare-fun lt!444014 () SeekEntryResult!9453)

(declare-fun lt!444011 () (_ BitVec 64))

(declare-datatypes ((array!63391 0))(
  ( (array!63392 (arr!30521 (Array (_ BitVec 32) (_ BitVec 64))) (size!31023 (_ BitVec 32))) )
))
(declare-fun lt!444013 () array!63391)

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63391 (_ BitVec 32)) SeekEntryResult!9453)

(assert (=> b!1004109 (= res!673591 (not (= lt!444014 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!444011 lt!444013 mask!3464))))))

(declare-fun b!1004110 () Bool)

(declare-fun res!673602 () Bool)

(declare-fun e!565467 () Bool)

(assert (=> b!1004110 (=> (not res!673602) (not e!565467))))

(declare-fun a!3219 () array!63391)

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1004110 (= res!673602 (and (= (size!31023 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31023 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31023 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1004111 () Bool)

(declare-fun res!673600 () Bool)

(declare-fun e!565465 () Bool)

(assert (=> b!1004111 (=> (not res!673600) (not e!565465))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63391 (_ BitVec 32)) Bool)

(assert (=> b!1004111 (= res!673600 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1004112 () Bool)

(declare-fun e!565462 () Bool)

(declare-fun e!565464 () Bool)

(assert (=> b!1004112 (= e!565462 e!565464)))

(declare-fun res!673601 () Bool)

(assert (=> b!1004112 (=> (not res!673601) (not e!565464))))

(declare-fun lt!444016 () SeekEntryResult!9453)

(assert (=> b!1004112 (= res!673601 (= lt!444014 lt!444016))))

(assert (=> b!1004112 (= lt!444014 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30521 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1004113 () Bool)

(declare-fun res!673596 () Bool)

(declare-fun e!565468 () Bool)

(assert (=> b!1004113 (=> (not res!673596) (not e!565468))))

(declare-fun lt!444010 () (_ BitVec 32))

(assert (=> b!1004113 (= res!673596 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!444010 (select (arr!30521 a!3219) j!170) a!3219 mask!3464) lt!444016))))

(declare-fun b!1004114 () Bool)

(assert (=> b!1004114 (= e!565463 e!565468)))

(declare-fun res!673597 () Bool)

(assert (=> b!1004114 (=> (not res!673597) (not e!565468))))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1004114 (= res!673597 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1245) resX!38) (bvsge (bvadd #b00000000000000000000000000000001 x!1245) #b00000000000000000000000000000000) (bvsge lt!444010 #b00000000000000000000000000000000) (bvslt lt!444010 (size!31023 a!3219))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1004114 (= lt!444010 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun b!1004115 () Bool)

(declare-fun res!673589 () Bool)

(assert (=> b!1004115 (=> (not res!673589) (not e!565467))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1004115 (= res!673589 (validKeyInArray!0 k0!2224))))

(declare-fun b!1004116 () Bool)

(declare-fun res!673595 () Bool)

(assert (=> b!1004116 (=> (not res!673595) (not e!565465))))

(declare-fun resIndex!38 () (_ BitVec 32))

(assert (=> b!1004116 (= res!673595 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31023 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31023 a!3219))))))

(declare-fun b!1004117 () Bool)

(declare-fun res!673594 () Bool)

(assert (=> b!1004117 (=> (not res!673594) (not e!565463))))

(assert (=> b!1004117 (= res!673594 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1004118 () Bool)

(assert (=> b!1004118 (= e!565464 e!565463)))

(declare-fun res!673598 () Bool)

(assert (=> b!1004118 (=> (not res!673598) (not e!565463))))

(declare-fun lt!444012 () SeekEntryResult!9453)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1004118 (= res!673598 (not (= lt!444012 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!444011 mask!3464) lt!444011 lt!444013 mask!3464))))))

(assert (=> b!1004118 (= lt!444011 (select (store (arr!30521 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1004118 (= lt!444013 (array!63392 (store (arr!30521 a!3219) i!1194 k0!2224) (size!31023 a!3219)))))

(declare-fun b!1004119 () Bool)

(declare-fun res!673587 () Bool)

(assert (=> b!1004119 (=> (not res!673587) (not e!565465))))

(declare-datatypes ((List!21197 0))(
  ( (Nil!21194) (Cons!21193 (h!22370 (_ BitVec 64)) (t!30198 List!21197)) )
))
(declare-fun arrayNoDuplicates!0 (array!63391 (_ BitVec 32) List!21197) Bool)

(assert (=> b!1004119 (= res!673587 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21194))))

(declare-fun b!1004120 () Bool)

(declare-fun res!673590 () Bool)

(assert (=> b!1004120 (=> (not res!673590) (not e!565467))))

(assert (=> b!1004120 (= res!673590 (validKeyInArray!0 (select (arr!30521 a!3219) j!170)))))

(declare-fun b!1004121 () Bool)

(assert (=> b!1004121 (= e!565468 false)))

(declare-fun lt!444015 () SeekEntryResult!9453)

(assert (=> b!1004121 (= lt!444015 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!444010 lt!444011 lt!444013 mask!3464))))

(declare-fun b!1004122 () Bool)

(declare-fun res!673599 () Bool)

(assert (=> b!1004122 (=> (not res!673599) (not e!565467))))

(declare-fun arrayContainsKey!0 (array!63391 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1004122 (= res!673599 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun res!673593 () Bool)

(assert (=> start!86590 (=> (not res!673593) (not e!565467))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86590 (= res!673593 (validMask!0 mask!3464))))

(assert (=> start!86590 e!565467))

(declare-fun array_inv!23645 (array!63391) Bool)

(assert (=> start!86590 (array_inv!23645 a!3219)))

(assert (=> start!86590 true))

(declare-fun b!1004123 () Bool)

(assert (=> b!1004123 (= e!565465 e!565462)))

(declare-fun res!673592 () Bool)

(assert (=> b!1004123 (=> (not res!673592) (not e!565462))))

(assert (=> b!1004123 (= res!673592 (= lt!444012 lt!444016))))

(assert (=> b!1004123 (= lt!444016 (Intermediate!9453 false resIndex!38 resX!38))))

(assert (=> b!1004123 (= lt!444012 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30521 a!3219) j!170) mask!3464) (select (arr!30521 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1004124 () Bool)

(assert (=> b!1004124 (= e!565467 e!565465)))

(declare-fun res!673588 () Bool)

(assert (=> b!1004124 (=> (not res!673588) (not e!565465))))

(declare-fun lt!444017 () SeekEntryResult!9453)

(assert (=> b!1004124 (= res!673588 (or (= lt!444017 (MissingVacant!9453 i!1194)) (= lt!444017 (MissingZero!9453 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63391 (_ BitVec 32)) SeekEntryResult!9453)

(assert (=> b!1004124 (= lt!444017 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(assert (= (and start!86590 res!673593) b!1004110))

(assert (= (and b!1004110 res!673602) b!1004120))

(assert (= (and b!1004120 res!673590) b!1004115))

(assert (= (and b!1004115 res!673589) b!1004122))

(assert (= (and b!1004122 res!673599) b!1004124))

(assert (= (and b!1004124 res!673588) b!1004111))

(assert (= (and b!1004111 res!673600) b!1004119))

(assert (= (and b!1004119 res!673587) b!1004116))

(assert (= (and b!1004116 res!673595) b!1004123))

(assert (= (and b!1004123 res!673592) b!1004112))

(assert (= (and b!1004112 res!673601) b!1004118))

(assert (= (and b!1004118 res!673598) b!1004109))

(assert (= (and b!1004109 res!673591) b!1004117))

(assert (= (and b!1004117 res!673594) b!1004114))

(assert (= (and b!1004114 res!673597) b!1004113))

(assert (= (and b!1004113 res!673596) b!1004121))

(declare-fun m!929709 () Bool)

(assert (=> b!1004118 m!929709))

(assert (=> b!1004118 m!929709))

(declare-fun m!929711 () Bool)

(assert (=> b!1004118 m!929711))

(declare-fun m!929713 () Bool)

(assert (=> b!1004118 m!929713))

(declare-fun m!929715 () Bool)

(assert (=> b!1004118 m!929715))

(declare-fun m!929717 () Bool)

(assert (=> b!1004113 m!929717))

(assert (=> b!1004113 m!929717))

(declare-fun m!929719 () Bool)

(assert (=> b!1004113 m!929719))

(assert (=> b!1004120 m!929717))

(assert (=> b!1004120 m!929717))

(declare-fun m!929721 () Bool)

(assert (=> b!1004120 m!929721))

(declare-fun m!929723 () Bool)

(assert (=> b!1004119 m!929723))

(declare-fun m!929725 () Bool)

(assert (=> b!1004122 m!929725))

(assert (=> b!1004123 m!929717))

(assert (=> b!1004123 m!929717))

(declare-fun m!929727 () Bool)

(assert (=> b!1004123 m!929727))

(assert (=> b!1004123 m!929727))

(assert (=> b!1004123 m!929717))

(declare-fun m!929729 () Bool)

(assert (=> b!1004123 m!929729))

(declare-fun m!929731 () Bool)

(assert (=> b!1004114 m!929731))

(declare-fun m!929733 () Bool)

(assert (=> b!1004111 m!929733))

(declare-fun m!929735 () Bool)

(assert (=> start!86590 m!929735))

(declare-fun m!929737 () Bool)

(assert (=> start!86590 m!929737))

(declare-fun m!929739 () Bool)

(assert (=> b!1004121 m!929739))

(declare-fun m!929741 () Bool)

(assert (=> b!1004124 m!929741))

(declare-fun m!929743 () Bool)

(assert (=> b!1004109 m!929743))

(declare-fun m!929745 () Bool)

(assert (=> b!1004115 m!929745))

(assert (=> b!1004112 m!929717))

(assert (=> b!1004112 m!929717))

(declare-fun m!929747 () Bool)

(assert (=> b!1004112 m!929747))

(check-sat (not start!86590) (not b!1004109) (not b!1004122) (not b!1004118) (not b!1004121) (not b!1004114) (not b!1004112) (not b!1004119) (not b!1004123) (not b!1004115) (not b!1004124) (not b!1004120) (not b!1004113) (not b!1004111))
(check-sat)
