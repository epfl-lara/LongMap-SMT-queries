; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86544 () Bool)

(assert start!86544)

(declare-fun b!1003005 () Bool)

(declare-fun res!672491 () Bool)

(declare-fun e!564985 () Bool)

(assert (=> b!1003005 (=> (not res!672491) (not e!564985))))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1003005 (= res!672491 (validKeyInArray!0 k!2224))))

(declare-fun b!1003006 () Bool)

(declare-fun res!672488 () Bool)

(assert (=> b!1003006 (=> (not res!672488) (not e!564985))))

(declare-datatypes ((array!63345 0))(
  ( (array!63346 (arr!30498 (Array (_ BitVec 32) (_ BitVec 64))) (size!31000 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63345)

(declare-fun j!170 () (_ BitVec 32))

(assert (=> b!1003006 (= res!672488 (validKeyInArray!0 (select (arr!30498 a!3219) j!170)))))

(declare-fun b!1003007 () Bool)

(declare-fun e!564980 () Bool)

(declare-fun e!564984 () Bool)

(assert (=> b!1003007 (= e!564980 e!564984)))

(declare-fun res!672494 () Bool)

(assert (=> b!1003007 (=> (not res!672494) (not e!564984))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun lt!443458 () (_ BitVec 64))

(declare-fun lt!443460 () array!63345)

(declare-datatypes ((SeekEntryResult!9430 0))(
  ( (MissingZero!9430 (index!40091 (_ BitVec 32))) (Found!9430 (index!40092 (_ BitVec 32))) (Intermediate!9430 (undefined!10242 Bool) (index!40093 (_ BitVec 32)) (x!87498 (_ BitVec 32))) (Undefined!9430) (MissingVacant!9430 (index!40094 (_ BitVec 32))) )
))
(declare-fun lt!443461 () SeekEntryResult!9430)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63345 (_ BitVec 32)) SeekEntryResult!9430)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1003007 (= res!672494 (not (= lt!443461 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!443458 mask!3464) lt!443458 lt!443460 mask!3464))))))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1003007 (= lt!443458 (select (store (arr!30498 a!3219) i!1194 k!2224) j!170))))

(assert (=> b!1003007 (= lt!443460 (array!63346 (store (arr!30498 a!3219) i!1194 k!2224) (size!31000 a!3219)))))

(declare-fun b!1003008 () Bool)

(declare-fun res!672485 () Bool)

(assert (=> b!1003008 (=> (not res!672485) (not e!564985))))

(assert (=> b!1003008 (= res!672485 (and (= (size!31000 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31000 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31000 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1003009 () Bool)

(declare-fun res!672493 () Bool)

(assert (=> b!1003009 (=> (not res!672493) (not e!564985))))

(declare-fun arrayContainsKey!0 (array!63345 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1003009 (= res!672493 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1003010 () Bool)

(declare-fun e!564981 () Bool)

(assert (=> b!1003010 (= e!564984 e!564981)))

(declare-fun res!672483 () Bool)

(assert (=> b!1003010 (=> (not res!672483) (not e!564981))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(declare-fun lt!443459 () (_ BitVec 32))

(assert (=> b!1003010 (= res!672483 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1245) resX!38) (bvsge (bvadd #b00000000000000000000000000000001 x!1245) #b00000000000000000000000000000000) (bvsge lt!443459 #b00000000000000000000000000000000) (bvslt lt!443459 (size!31000 a!3219))))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1003010 (= lt!443459 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun res!672495 () Bool)

(assert (=> start!86544 (=> (not res!672495) (not e!564985))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86544 (= res!672495 (validMask!0 mask!3464))))

(assert (=> start!86544 e!564985))

(declare-fun array_inv!23622 (array!63345) Bool)

(assert (=> start!86544 (array_inv!23622 a!3219)))

(assert (=> start!86544 true))

(declare-fun b!1003011 () Bool)

(assert (=> b!1003011 (= e!564981 false)))

(declare-fun lt!443464 () SeekEntryResult!9430)

(assert (=> b!1003011 (= lt!443464 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!443459 lt!443458 lt!443460 mask!3464))))

(declare-fun b!1003012 () Bool)

(declare-fun e!564982 () Bool)

(assert (=> b!1003012 (= e!564985 e!564982)))

(declare-fun res!672496 () Bool)

(assert (=> b!1003012 (=> (not res!672496) (not e!564982))))

(declare-fun lt!443465 () SeekEntryResult!9430)

(assert (=> b!1003012 (= res!672496 (or (= lt!443465 (MissingVacant!9430 i!1194)) (= lt!443465 (MissingZero!9430 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63345 (_ BitVec 32)) SeekEntryResult!9430)

(assert (=> b!1003012 (= lt!443465 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!1003013 () Bool)

(declare-fun e!564983 () Bool)

(assert (=> b!1003013 (= e!564983 e!564980)))

(declare-fun res!672498 () Bool)

(assert (=> b!1003013 (=> (not res!672498) (not e!564980))))

(declare-fun lt!443463 () SeekEntryResult!9430)

(declare-fun lt!443462 () SeekEntryResult!9430)

(assert (=> b!1003013 (= res!672498 (= lt!443463 lt!443462))))

(assert (=> b!1003013 (= lt!443463 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30498 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1003014 () Bool)

(declare-fun res!672486 () Bool)

(assert (=> b!1003014 (=> (not res!672486) (not e!564984))))

(assert (=> b!1003014 (= res!672486 (not (= lt!443463 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!443458 lt!443460 mask!3464))))))

(declare-fun b!1003015 () Bool)

(declare-fun res!672487 () Bool)

(assert (=> b!1003015 (=> (not res!672487) (not e!564984))))

(declare-fun resIndex!38 () (_ BitVec 32))

(assert (=> b!1003015 (= res!672487 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1003016 () Bool)

(declare-fun res!672484 () Bool)

(assert (=> b!1003016 (=> (not res!672484) (not e!564982))))

(declare-datatypes ((List!21174 0))(
  ( (Nil!21171) (Cons!21170 (h!22347 (_ BitVec 64)) (t!30175 List!21174)) )
))
(declare-fun arrayNoDuplicates!0 (array!63345 (_ BitVec 32) List!21174) Bool)

(assert (=> b!1003016 (= res!672484 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21171))))

(declare-fun b!1003017 () Bool)

(declare-fun res!672489 () Bool)

(assert (=> b!1003017 (=> (not res!672489) (not e!564982))))

(assert (=> b!1003017 (= res!672489 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31000 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31000 a!3219))))))

(declare-fun b!1003018 () Bool)

(declare-fun res!672490 () Bool)

(assert (=> b!1003018 (=> (not res!672490) (not e!564981))))

(assert (=> b!1003018 (= res!672490 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!443459 (select (arr!30498 a!3219) j!170) a!3219 mask!3464) lt!443462))))

(declare-fun b!1003019 () Bool)

(assert (=> b!1003019 (= e!564982 e!564983)))

(declare-fun res!672497 () Bool)

(assert (=> b!1003019 (=> (not res!672497) (not e!564983))))

(assert (=> b!1003019 (= res!672497 (= lt!443461 lt!443462))))

(assert (=> b!1003019 (= lt!443462 (Intermediate!9430 false resIndex!38 resX!38))))

(assert (=> b!1003019 (= lt!443461 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30498 a!3219) j!170) mask!3464) (select (arr!30498 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1003020 () Bool)

(declare-fun res!672492 () Bool)

(assert (=> b!1003020 (=> (not res!672492) (not e!564982))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63345 (_ BitVec 32)) Bool)

(assert (=> b!1003020 (= res!672492 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(assert (= (and start!86544 res!672495) b!1003008))

(assert (= (and b!1003008 res!672485) b!1003006))

(assert (= (and b!1003006 res!672488) b!1003005))

(assert (= (and b!1003005 res!672491) b!1003009))

(assert (= (and b!1003009 res!672493) b!1003012))

(assert (= (and b!1003012 res!672496) b!1003020))

(assert (= (and b!1003020 res!672492) b!1003016))

(assert (= (and b!1003016 res!672484) b!1003017))

(assert (= (and b!1003017 res!672489) b!1003019))

(assert (= (and b!1003019 res!672497) b!1003013))

(assert (= (and b!1003013 res!672498) b!1003007))

(assert (= (and b!1003007 res!672494) b!1003014))

(assert (= (and b!1003014 res!672486) b!1003015))

(assert (= (and b!1003015 res!672487) b!1003010))

(assert (= (and b!1003010 res!672483) b!1003018))

(assert (= (and b!1003018 res!672490) b!1003011))

(declare-fun m!928789 () Bool)

(assert (=> b!1003006 m!928789))

(assert (=> b!1003006 m!928789))

(declare-fun m!928791 () Bool)

(assert (=> b!1003006 m!928791))

(assert (=> b!1003019 m!928789))

(assert (=> b!1003019 m!928789))

(declare-fun m!928793 () Bool)

(assert (=> b!1003019 m!928793))

(assert (=> b!1003019 m!928793))

(assert (=> b!1003019 m!928789))

(declare-fun m!928795 () Bool)

(assert (=> b!1003019 m!928795))

(assert (=> b!1003018 m!928789))

(assert (=> b!1003018 m!928789))

(declare-fun m!928797 () Bool)

(assert (=> b!1003018 m!928797))

(declare-fun m!928799 () Bool)

(assert (=> start!86544 m!928799))

(declare-fun m!928801 () Bool)

(assert (=> start!86544 m!928801))

(declare-fun m!928803 () Bool)

(assert (=> b!1003005 m!928803))

(declare-fun m!928805 () Bool)

(assert (=> b!1003014 m!928805))

(declare-fun m!928807 () Bool)

(assert (=> b!1003007 m!928807))

(assert (=> b!1003007 m!928807))

(declare-fun m!928809 () Bool)

(assert (=> b!1003007 m!928809))

(declare-fun m!928811 () Bool)

(assert (=> b!1003007 m!928811))

(declare-fun m!928813 () Bool)

(assert (=> b!1003007 m!928813))

(declare-fun m!928815 () Bool)

(assert (=> b!1003016 m!928815))

(declare-fun m!928817 () Bool)

(assert (=> b!1003012 m!928817))

(declare-fun m!928819 () Bool)

(assert (=> b!1003020 m!928819))

(declare-fun m!928821 () Bool)

(assert (=> b!1003009 m!928821))

(declare-fun m!928823 () Bool)

(assert (=> b!1003011 m!928823))

(assert (=> b!1003013 m!928789))

(assert (=> b!1003013 m!928789))

(declare-fun m!928825 () Bool)

(assert (=> b!1003013 m!928825))

(declare-fun m!928827 () Bool)

(assert (=> b!1003010 m!928827))

(push 1)

