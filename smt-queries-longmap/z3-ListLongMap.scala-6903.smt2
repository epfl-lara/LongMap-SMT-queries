; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86772 () Bool)

(assert start!86772)

(declare-fun b!1005903 () Bool)

(declare-fun e!566252 () Bool)

(declare-fun e!566250 () Bool)

(assert (=> b!1005903 (= e!566252 e!566250)))

(declare-fun res!675115 () Bool)

(assert (=> b!1005903 (=> (not res!675115) (not e!566250))))

(declare-datatypes ((array!63418 0))(
  ( (array!63419 (arr!30531 (Array (_ BitVec 32) (_ BitVec 64))) (size!31035 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63418)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9488 0))(
  ( (MissingZero!9488 (index!40323 (_ BitVec 32))) (Found!9488 (index!40324 (_ BitVec 32))) (Intermediate!9488 (undefined!10300 Bool) (index!40325 (_ BitVec 32)) (x!87739 (_ BitVec 32))) (Undefined!9488) (MissingVacant!9488 (index!40326 (_ BitVec 32))) )
))
(declare-fun lt!444468 () SeekEntryResult!9488)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63418 (_ BitVec 32)) SeekEntryResult!9488)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1005903 (= res!675115 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30531 a!3219) j!170) mask!3464) (select (arr!30531 a!3219) j!170) a!3219 mask!3464) lt!444468))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1005903 (= lt!444468 (Intermediate!9488 false resIndex!38 resX!38))))

(declare-fun b!1005904 () Bool)

(declare-fun res!675124 () Bool)

(assert (=> b!1005904 (=> (not res!675124) (not e!566252))))

(declare-datatypes ((List!21273 0))(
  ( (Nil!21270) (Cons!21269 (h!22452 (_ BitVec 64)) (t!30265 List!21273)) )
))
(declare-fun arrayNoDuplicates!0 (array!63418 (_ BitVec 32) List!21273) Bool)

(assert (=> b!1005904 (= res!675124 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21270))))

(declare-fun b!1005905 () Bool)

(declare-fun res!675125 () Bool)

(declare-fun e!566251 () Bool)

(assert (=> b!1005905 (=> (not res!675125) (not e!566251))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!63418 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1005905 (= res!675125 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1005906 () Bool)

(declare-fun res!675116 () Bool)

(assert (=> b!1005906 (=> (not res!675116) (not e!566251))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1005906 (= res!675116 (validKeyInArray!0 k0!2224))))

(declare-fun b!1005907 () Bool)

(declare-fun res!675121 () Bool)

(assert (=> b!1005907 (=> (not res!675121) (not e!566252))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63418 (_ BitVec 32)) Bool)

(assert (=> b!1005907 (= res!675121 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun res!675123 () Bool)

(assert (=> start!86772 (=> (not res!675123) (not e!566251))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86772 (= res!675123 (validMask!0 mask!3464))))

(assert (=> start!86772 e!566251))

(declare-fun array_inv!23674 (array!63418) Bool)

(assert (=> start!86772 (array_inv!23674 a!3219)))

(assert (=> start!86772 true))

(declare-fun b!1005908 () Bool)

(declare-fun res!675122 () Bool)

(assert (=> b!1005908 (=> (not res!675122) (not e!566252))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(assert (=> b!1005908 (= res!675122 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31035 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31035 a!3219))))))

(declare-fun b!1005909 () Bool)

(declare-fun res!675118 () Bool)

(assert (=> b!1005909 (=> (not res!675118) (not e!566251))))

(assert (=> b!1005909 (= res!675118 (validKeyInArray!0 (select (arr!30531 a!3219) j!170)))))

(declare-fun b!1005910 () Bool)

(assert (=> b!1005910 (= e!566251 e!566252)))

(declare-fun res!675120 () Bool)

(assert (=> b!1005910 (=> (not res!675120) (not e!566252))))

(declare-fun lt!444469 () SeekEntryResult!9488)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1005910 (= res!675120 (or (= lt!444469 (MissingVacant!9488 i!1194)) (= lt!444469 (MissingZero!9488 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63418 (_ BitVec 32)) SeekEntryResult!9488)

(assert (=> b!1005910 (= lt!444469 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1005911 () Bool)

(declare-fun res!675117 () Bool)

(assert (=> b!1005911 (=> (not res!675117) (not e!566251))))

(assert (=> b!1005911 (= res!675117 (and (= (size!31035 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31035 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31035 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1005912 () Bool)

(declare-fun res!675119 () Bool)

(assert (=> b!1005912 (=> (not res!675119) (not e!566250))))

(assert (=> b!1005912 (= res!675119 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30531 a!3219) j!170) a!3219 mask!3464) lt!444468))))

(declare-fun b!1005913 () Bool)

(assert (=> b!1005913 (= e!566250 false)))

(declare-fun lt!444467 () (_ BitVec 32))

(assert (=> b!1005913 (= lt!444467 (toIndex!0 (select (store (arr!30531 a!3219) i!1194 k0!2224) j!170) mask!3464))))

(assert (= (and start!86772 res!675123) b!1005911))

(assert (= (and b!1005911 res!675117) b!1005909))

(assert (= (and b!1005909 res!675118) b!1005906))

(assert (= (and b!1005906 res!675116) b!1005905))

(assert (= (and b!1005905 res!675125) b!1005910))

(assert (= (and b!1005910 res!675120) b!1005907))

(assert (= (and b!1005907 res!675121) b!1005904))

(assert (= (and b!1005904 res!675124) b!1005908))

(assert (= (and b!1005908 res!675122) b!1005903))

(assert (= (and b!1005903 res!675115) b!1005912))

(assert (= (and b!1005912 res!675119) b!1005913))

(declare-fun m!930505 () Bool)

(assert (=> b!1005913 m!930505))

(declare-fun m!930507 () Bool)

(assert (=> b!1005913 m!930507))

(assert (=> b!1005913 m!930507))

(declare-fun m!930509 () Bool)

(assert (=> b!1005913 m!930509))

(declare-fun m!930511 () Bool)

(assert (=> b!1005912 m!930511))

(assert (=> b!1005912 m!930511))

(declare-fun m!930513 () Bool)

(assert (=> b!1005912 m!930513))

(assert (=> b!1005909 m!930511))

(assert (=> b!1005909 m!930511))

(declare-fun m!930515 () Bool)

(assert (=> b!1005909 m!930515))

(declare-fun m!930517 () Bool)

(assert (=> start!86772 m!930517))

(declare-fun m!930519 () Bool)

(assert (=> start!86772 m!930519))

(declare-fun m!930521 () Bool)

(assert (=> b!1005904 m!930521))

(declare-fun m!930523 () Bool)

(assert (=> b!1005906 m!930523))

(assert (=> b!1005903 m!930511))

(assert (=> b!1005903 m!930511))

(declare-fun m!930525 () Bool)

(assert (=> b!1005903 m!930525))

(assert (=> b!1005903 m!930525))

(assert (=> b!1005903 m!930511))

(declare-fun m!930527 () Bool)

(assert (=> b!1005903 m!930527))

(declare-fun m!930529 () Bool)

(assert (=> b!1005910 m!930529))

(declare-fun m!930531 () Bool)

(assert (=> b!1005907 m!930531))

(declare-fun m!930533 () Bool)

(assert (=> b!1005905 m!930533))

(check-sat (not b!1005905) (not start!86772) (not b!1005913) (not b!1005910) (not b!1005903) (not b!1005904) (not b!1005906) (not b!1005909) (not b!1005912) (not b!1005907))
(check-sat)
