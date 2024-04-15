; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86586 () Bool)

(assert start!86586)

(declare-fun b!1003987 () Bool)

(declare-fun e!565378 () Bool)

(assert (=> b!1003987 (= e!565378 false)))

(declare-datatypes ((SeekEntryResult!9449 0))(
  ( (MissingZero!9449 (index!40167 (_ BitVec 32))) (Found!9449 (index!40168 (_ BitVec 32))) (Intermediate!9449 (undefined!10261 Bool) (index!40169 (_ BitVec 32)) (x!87584 (_ BitVec 32))) (Undefined!9449) (MissingVacant!9449 (index!40170 (_ BitVec 32))) )
))
(declare-fun lt!443829 () SeekEntryResult!9449)

(declare-fun lt!443831 () (_ BitVec 32))

(declare-fun lt!443826 () (_ BitVec 64))

(declare-datatypes ((array!63334 0))(
  ( (array!63335 (arr!30492 (Array (_ BitVec 32) (_ BitVec 64))) (size!30996 (_ BitVec 32))) )
))
(declare-fun lt!443833 () array!63334)

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63334 (_ BitVec 32)) SeekEntryResult!9449)

(assert (=> b!1003987 (= lt!443829 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!443831 lt!443826 lt!443833 mask!3464))))

(declare-fun b!1003988 () Bool)

(declare-fun res!673603 () Bool)

(assert (=> b!1003988 (=> (not res!673603) (not e!565378))))

(declare-fun a!3219 () array!63334)

(declare-fun j!170 () (_ BitVec 32))

(declare-fun lt!443828 () SeekEntryResult!9449)

(assert (=> b!1003988 (= res!673603 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!443831 (select (arr!30492 a!3219) j!170) a!3219 mask!3464) lt!443828))))

(declare-fun b!1003989 () Bool)

(declare-fun res!673598 () Bool)

(declare-fun e!565379 () Bool)

(assert (=> b!1003989 (=> (not res!673598) (not e!565379))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!63334 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1003989 (= res!673598 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1003990 () Bool)

(declare-fun res!673596 () Bool)

(assert (=> b!1003990 (=> (not res!673596) (not e!565379))))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1003990 (= res!673596 (and (= (size!30996 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30996 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30996 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1003991 () Bool)

(declare-fun e!565377 () Bool)

(assert (=> b!1003991 (= e!565379 e!565377)))

(declare-fun res!673600 () Bool)

(assert (=> b!1003991 (=> (not res!673600) (not e!565377))))

(declare-fun lt!443830 () SeekEntryResult!9449)

(assert (=> b!1003991 (= res!673600 (or (= lt!443830 (MissingVacant!9449 i!1194)) (= lt!443830 (MissingZero!9449 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63334 (_ BitVec 32)) SeekEntryResult!9449)

(assert (=> b!1003991 (= lt!443830 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1003993 () Bool)

(declare-fun e!565374 () Bool)

(declare-fun e!565376 () Bool)

(assert (=> b!1003993 (= e!565374 e!565376)))

(declare-fun res!673594 () Bool)

(assert (=> b!1003993 (=> (not res!673594) (not e!565376))))

(declare-fun lt!443832 () SeekEntryResult!9449)

(assert (=> b!1003993 (= res!673594 (= lt!443832 lt!443828))))

(declare-fun index!1507 () (_ BitVec 32))

(assert (=> b!1003993 (= lt!443832 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30492 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1003994 () Bool)

(declare-fun res!673604 () Bool)

(assert (=> b!1003994 (=> (not res!673604) (not e!565377))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63334 (_ BitVec 32)) Bool)

(assert (=> b!1003994 (= res!673604 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1003995 () Bool)

(declare-fun res!673602 () Bool)

(assert (=> b!1003995 (=> (not res!673602) (not e!565379))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1003995 (= res!673602 (validKeyInArray!0 (select (arr!30492 a!3219) j!170)))))

(declare-fun b!1003996 () Bool)

(declare-fun res!673597 () Bool)

(assert (=> b!1003996 (=> (not res!673597) (not e!565379))))

(assert (=> b!1003996 (= res!673597 (validKeyInArray!0 k0!2224))))

(declare-fun b!1003997 () Bool)

(declare-fun e!565373 () Bool)

(assert (=> b!1003997 (= e!565376 e!565373)))

(declare-fun res!673593 () Bool)

(assert (=> b!1003997 (=> (not res!673593) (not e!565373))))

(declare-fun lt!443827 () SeekEntryResult!9449)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1003997 (= res!673593 (not (= lt!443827 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!443826 mask!3464) lt!443826 lt!443833 mask!3464))))))

(assert (=> b!1003997 (= lt!443826 (select (store (arr!30492 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1003997 (= lt!443833 (array!63335 (store (arr!30492 a!3219) i!1194 k0!2224) (size!30996 a!3219)))))

(declare-fun b!1003998 () Bool)

(declare-fun res!673599 () Bool)

(assert (=> b!1003998 (=> (not res!673599) (not e!565373))))

(assert (=> b!1003998 (= res!673599 (not (= lt!443832 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!443826 lt!443833 mask!3464))))))

(declare-fun b!1003999 () Bool)

(assert (=> b!1003999 (= e!565377 e!565374)))

(declare-fun res!673589 () Bool)

(assert (=> b!1003999 (=> (not res!673589) (not e!565374))))

(assert (=> b!1003999 (= res!673589 (= lt!443827 lt!443828))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1003999 (= lt!443828 (Intermediate!9449 false resIndex!38 resX!38))))

(assert (=> b!1003999 (= lt!443827 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30492 a!3219) j!170) mask!3464) (select (arr!30492 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1004000 () Bool)

(assert (=> b!1004000 (= e!565373 e!565378)))

(declare-fun res!673601 () Bool)

(assert (=> b!1004000 (=> (not res!673601) (not e!565378))))

(assert (=> b!1004000 (= res!673601 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1245) resX!38) (bvsge (bvadd #b00000000000000000000000000000001 x!1245) #b00000000000000000000000000000000) (bvsge lt!443831 #b00000000000000000000000000000000) (bvslt lt!443831 (size!30996 a!3219))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1004000 (= lt!443831 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun res!673592 () Bool)

(assert (=> start!86586 (=> (not res!673592) (not e!565379))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86586 (= res!673592 (validMask!0 mask!3464))))

(assert (=> start!86586 e!565379))

(declare-fun array_inv!23635 (array!63334) Bool)

(assert (=> start!86586 (array_inv!23635 a!3219)))

(assert (=> start!86586 true))

(declare-fun b!1003992 () Bool)

(declare-fun res!673591 () Bool)

(assert (=> b!1003992 (=> (not res!673591) (not e!565377))))

(declare-datatypes ((List!21234 0))(
  ( (Nil!21231) (Cons!21230 (h!22407 (_ BitVec 64)) (t!30226 List!21234)) )
))
(declare-fun arrayNoDuplicates!0 (array!63334 (_ BitVec 32) List!21234) Bool)

(assert (=> b!1003992 (= res!673591 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21231))))

(declare-fun b!1004001 () Bool)

(declare-fun res!673590 () Bool)

(assert (=> b!1004001 (=> (not res!673590) (not e!565377))))

(assert (=> b!1004001 (= res!673590 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30996 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30996 a!3219))))))

(declare-fun b!1004002 () Bool)

(declare-fun res!673595 () Bool)

(assert (=> b!1004002 (=> (not res!673595) (not e!565373))))

(assert (=> b!1004002 (= res!673595 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(assert (= (and start!86586 res!673592) b!1003990))

(assert (= (and b!1003990 res!673596) b!1003995))

(assert (= (and b!1003995 res!673602) b!1003996))

(assert (= (and b!1003996 res!673597) b!1003989))

(assert (= (and b!1003989 res!673598) b!1003991))

(assert (= (and b!1003991 res!673600) b!1003994))

(assert (= (and b!1003994 res!673604) b!1003992))

(assert (= (and b!1003992 res!673591) b!1004001))

(assert (= (and b!1004001 res!673590) b!1003999))

(assert (= (and b!1003999 res!673589) b!1003993))

(assert (= (and b!1003993 res!673594) b!1003997))

(assert (= (and b!1003997 res!673593) b!1003998))

(assert (= (and b!1003998 res!673599) b!1004002))

(assert (= (and b!1004002 res!673595) b!1004000))

(assert (= (and b!1004000 res!673601) b!1003988))

(assert (= (and b!1003988 res!673603) b!1003987))

(declare-fun m!929059 () Bool)

(assert (=> b!1003993 m!929059))

(assert (=> b!1003993 m!929059))

(declare-fun m!929061 () Bool)

(assert (=> b!1003993 m!929061))

(declare-fun m!929063 () Bool)

(assert (=> b!1004000 m!929063))

(declare-fun m!929065 () Bool)

(assert (=> b!1003994 m!929065))

(declare-fun m!929067 () Bool)

(assert (=> b!1003998 m!929067))

(declare-fun m!929069 () Bool)

(assert (=> b!1003996 m!929069))

(declare-fun m!929071 () Bool)

(assert (=> b!1003997 m!929071))

(assert (=> b!1003997 m!929071))

(declare-fun m!929073 () Bool)

(assert (=> b!1003997 m!929073))

(declare-fun m!929075 () Bool)

(assert (=> b!1003997 m!929075))

(declare-fun m!929077 () Bool)

(assert (=> b!1003997 m!929077))

(declare-fun m!929079 () Bool)

(assert (=> start!86586 m!929079))

(declare-fun m!929081 () Bool)

(assert (=> start!86586 m!929081))

(declare-fun m!929083 () Bool)

(assert (=> b!1003987 m!929083))

(declare-fun m!929085 () Bool)

(assert (=> b!1003989 m!929085))

(assert (=> b!1003999 m!929059))

(assert (=> b!1003999 m!929059))

(declare-fun m!929087 () Bool)

(assert (=> b!1003999 m!929087))

(assert (=> b!1003999 m!929087))

(assert (=> b!1003999 m!929059))

(declare-fun m!929089 () Bool)

(assert (=> b!1003999 m!929089))

(declare-fun m!929091 () Bool)

(assert (=> b!1003992 m!929091))

(assert (=> b!1003988 m!929059))

(assert (=> b!1003988 m!929059))

(declare-fun m!929093 () Bool)

(assert (=> b!1003988 m!929093))

(assert (=> b!1003995 m!929059))

(assert (=> b!1003995 m!929059))

(declare-fun m!929095 () Bool)

(assert (=> b!1003995 m!929095))

(declare-fun m!929097 () Bool)

(assert (=> b!1003991 m!929097))

(check-sat (not b!1003994) (not b!1003988) (not b!1003991) (not b!1003992) (not b!1003995) (not b!1003999) (not b!1003993) (not b!1003989) (not b!1003996) (not b!1003997) (not b!1004000) (not b!1003987) (not b!1003998) (not start!86586))
(check-sat)
