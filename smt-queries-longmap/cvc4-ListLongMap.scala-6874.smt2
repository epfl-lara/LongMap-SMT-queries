; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86502 () Bool)

(assert start!86502)

(declare-fun b!1001997 () Bool)

(declare-fun res!671479 () Bool)

(declare-fun e!564542 () Bool)

(assert (=> b!1001997 (=> (not res!671479) (not e!564542))))

(declare-datatypes ((array!63303 0))(
  ( (array!63304 (arr!30477 (Array (_ BitVec 32) (_ BitVec 64))) (size!30979 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63303)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63303 (_ BitVec 32)) Bool)

(assert (=> b!1001997 (= res!671479 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1001999 () Bool)

(declare-fun e!564541 () Bool)

(declare-fun e!564543 () Bool)

(assert (=> b!1001999 (= e!564541 e!564543)))

(declare-fun res!671480 () Bool)

(assert (=> b!1001999 (=> (not res!671480) (not e!564543))))

(declare-datatypes ((SeekEntryResult!9409 0))(
  ( (MissingZero!9409 (index!40007 (_ BitVec 32))) (Found!9409 (index!40008 (_ BitVec 32))) (Intermediate!9409 (undefined!10221 Bool) (index!40009 (_ BitVec 32)) (x!87421 (_ BitVec 32))) (Undefined!9409) (MissingVacant!9409 (index!40010 (_ BitVec 32))) )
))
(declare-fun lt!442957 () SeekEntryResult!9409)

(declare-fun lt!442961 () SeekEntryResult!9409)

(assert (=> b!1001999 (= res!671480 (= lt!442957 lt!442961))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63303 (_ BitVec 32)) SeekEntryResult!9409)

(assert (=> b!1001999 (= lt!442957 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30477 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1002000 () Bool)

(declare-fun res!671482 () Bool)

(declare-fun e!564538 () Bool)

(assert (=> b!1002000 (=> (not res!671482) (not e!564538))))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1002000 (= res!671482 (validKeyInArray!0 k!2224))))

(declare-fun b!1002001 () Bool)

(declare-fun res!671488 () Bool)

(assert (=> b!1002001 (=> (not res!671488) (not e!564542))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1002001 (= res!671488 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30979 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30979 a!3219))))))

(declare-fun b!1002002 () Bool)

(assert (=> b!1002002 (= e!564538 e!564542)))

(declare-fun res!671490 () Bool)

(assert (=> b!1002002 (=> (not res!671490) (not e!564542))))

(declare-fun lt!442959 () SeekEntryResult!9409)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1002002 (= res!671490 (or (= lt!442959 (MissingVacant!9409 i!1194)) (= lt!442959 (MissingZero!9409 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63303 (_ BitVec 32)) SeekEntryResult!9409)

(assert (=> b!1002002 (= lt!442959 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!1002003 () Bool)

(declare-fun res!671476 () Bool)

(assert (=> b!1002003 (=> (not res!671476) (not e!564538))))

(assert (=> b!1002003 (= res!671476 (validKeyInArray!0 (select (arr!30477 a!3219) j!170)))))

(declare-fun b!1002004 () Bool)

(declare-fun res!671485 () Bool)

(assert (=> b!1002004 (=> (not res!671485) (not e!564538))))

(assert (=> b!1002004 (= res!671485 (and (= (size!30979 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30979 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30979 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1002005 () Bool)

(declare-fun e!564539 () Bool)

(declare-fun e!564540 () Bool)

(assert (=> b!1002005 (= e!564539 e!564540)))

(declare-fun res!671489 () Bool)

(assert (=> b!1002005 (=> (not res!671489) (not e!564540))))

(declare-fun lt!442955 () (_ BitVec 32))

(assert (=> b!1002005 (= res!671489 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1245) resX!38) (bvsge (bvadd #b00000000000000000000000000000001 x!1245) #b00000000000000000000000000000000) (bvsge lt!442955 #b00000000000000000000000000000000) (bvslt lt!442955 (size!30979 a!3219))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1002005 (= lt!442955 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun b!1002006 () Bool)

(assert (=> b!1002006 (= e!564543 e!564539)))

(declare-fun res!671484 () Bool)

(assert (=> b!1002006 (=> (not res!671484) (not e!564539))))

(declare-fun lt!442958 () array!63303)

(declare-fun lt!442956 () (_ BitVec 64))

(declare-fun lt!442954 () SeekEntryResult!9409)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1002006 (= res!671484 (not (= lt!442954 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!442956 mask!3464) lt!442956 lt!442958 mask!3464))))))

(assert (=> b!1002006 (= lt!442956 (select (store (arr!30477 a!3219) i!1194 k!2224) j!170))))

(assert (=> b!1002006 (= lt!442958 (array!63304 (store (arr!30477 a!3219) i!1194 k!2224) (size!30979 a!3219)))))

(declare-fun b!1002007 () Bool)

(declare-fun res!671486 () Bool)

(assert (=> b!1002007 (=> (not res!671486) (not e!564542))))

(declare-datatypes ((List!21153 0))(
  ( (Nil!21150) (Cons!21149 (h!22326 (_ BitVec 64)) (t!30154 List!21153)) )
))
(declare-fun arrayNoDuplicates!0 (array!63303 (_ BitVec 32) List!21153) Bool)

(assert (=> b!1002007 (= res!671486 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21150))))

(declare-fun b!1002008 () Bool)

(declare-fun res!671487 () Bool)

(assert (=> b!1002008 (=> (not res!671487) (not e!564539))))

(assert (=> b!1002008 (= res!671487 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun res!671475 () Bool)

(assert (=> start!86502 (=> (not res!671475) (not e!564538))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86502 (= res!671475 (validMask!0 mask!3464))))

(assert (=> start!86502 e!564538))

(declare-fun array_inv!23601 (array!63303) Bool)

(assert (=> start!86502 (array_inv!23601 a!3219)))

(assert (=> start!86502 true))

(declare-fun b!1001998 () Bool)

(declare-fun res!671483 () Bool)

(assert (=> b!1001998 (=> (not res!671483) (not e!564539))))

(assert (=> b!1001998 (= res!671483 (not (= lt!442957 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!442956 lt!442958 mask!3464))))))

(declare-fun b!1002009 () Bool)

(declare-fun res!671481 () Bool)

(assert (=> b!1002009 (=> (not res!671481) (not e!564538))))

(declare-fun arrayContainsKey!0 (array!63303 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1002009 (= res!671481 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1002010 () Bool)

(assert (=> b!1002010 (= e!564540 false)))

(declare-fun lt!442960 () SeekEntryResult!9409)

(assert (=> b!1002010 (= lt!442960 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!442955 lt!442956 lt!442958 mask!3464))))

(declare-fun b!1002011 () Bool)

(assert (=> b!1002011 (= e!564542 e!564541)))

(declare-fun res!671478 () Bool)

(assert (=> b!1002011 (=> (not res!671478) (not e!564541))))

(assert (=> b!1002011 (= res!671478 (= lt!442954 lt!442961))))

(assert (=> b!1002011 (= lt!442961 (Intermediate!9409 false resIndex!38 resX!38))))

(assert (=> b!1002011 (= lt!442954 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30477 a!3219) j!170) mask!3464) (select (arr!30477 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1002012 () Bool)

(declare-fun res!671477 () Bool)

(assert (=> b!1002012 (=> (not res!671477) (not e!564540))))

(assert (=> b!1002012 (= res!671477 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!442955 (select (arr!30477 a!3219) j!170) a!3219 mask!3464) lt!442961))))

(assert (= (and start!86502 res!671475) b!1002004))

(assert (= (and b!1002004 res!671485) b!1002003))

(assert (= (and b!1002003 res!671476) b!1002000))

(assert (= (and b!1002000 res!671482) b!1002009))

(assert (= (and b!1002009 res!671481) b!1002002))

(assert (= (and b!1002002 res!671490) b!1001997))

(assert (= (and b!1001997 res!671479) b!1002007))

(assert (= (and b!1002007 res!671486) b!1002001))

(assert (= (and b!1002001 res!671488) b!1002011))

(assert (= (and b!1002011 res!671478) b!1001999))

(assert (= (and b!1001999 res!671480) b!1002006))

(assert (= (and b!1002006 res!671484) b!1001998))

(assert (= (and b!1001998 res!671483) b!1002008))

(assert (= (and b!1002008 res!671487) b!1002005))

(assert (= (and b!1002005 res!671489) b!1002012))

(assert (= (and b!1002012 res!671477) b!1002010))

(declare-fun m!927949 () Bool)

(assert (=> b!1002007 m!927949))

(declare-fun m!927951 () Bool)

(assert (=> b!1002012 m!927951))

(assert (=> b!1002012 m!927951))

(declare-fun m!927953 () Bool)

(assert (=> b!1002012 m!927953))

(declare-fun m!927955 () Bool)

(assert (=> b!1002009 m!927955))

(declare-fun m!927957 () Bool)

(assert (=> b!1001997 m!927957))

(declare-fun m!927959 () Bool)

(assert (=> b!1002005 m!927959))

(declare-fun m!927961 () Bool)

(assert (=> b!1002002 m!927961))

(declare-fun m!927963 () Bool)

(assert (=> b!1002006 m!927963))

(assert (=> b!1002006 m!927963))

(declare-fun m!927965 () Bool)

(assert (=> b!1002006 m!927965))

(declare-fun m!927967 () Bool)

(assert (=> b!1002006 m!927967))

(declare-fun m!927969 () Bool)

(assert (=> b!1002006 m!927969))

(declare-fun m!927971 () Bool)

(assert (=> b!1001998 m!927971))

(declare-fun m!927973 () Bool)

(assert (=> start!86502 m!927973))

(declare-fun m!927975 () Bool)

(assert (=> start!86502 m!927975))

(declare-fun m!927977 () Bool)

(assert (=> b!1002000 m!927977))

(assert (=> b!1001999 m!927951))

(assert (=> b!1001999 m!927951))

(declare-fun m!927979 () Bool)

(assert (=> b!1001999 m!927979))

(assert (=> b!1002011 m!927951))

(assert (=> b!1002011 m!927951))

(declare-fun m!927981 () Bool)

(assert (=> b!1002011 m!927981))

(assert (=> b!1002011 m!927981))

(assert (=> b!1002011 m!927951))

(declare-fun m!927983 () Bool)

(assert (=> b!1002011 m!927983))

(declare-fun m!927985 () Bool)

(assert (=> b!1002010 m!927985))

(assert (=> b!1002003 m!927951))

(assert (=> b!1002003 m!927951))

(declare-fun m!927987 () Bool)

(assert (=> b!1002003 m!927987))

(push 1)

(assert (not b!1002007))

