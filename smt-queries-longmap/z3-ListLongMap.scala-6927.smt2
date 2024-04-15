; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!87114 () Bool)

(assert start!87114)

(declare-fun b!1009989 () Bool)

(declare-fun res!678456 () Bool)

(declare-fun e!568219 () Bool)

(assert (=> b!1009989 (=> (not res!678456) (not e!568219))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1009989 (= res!678456 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1009990 () Bool)

(declare-fun e!568217 () Bool)

(declare-fun e!568216 () Bool)

(assert (=> b!1009990 (= e!568217 e!568216)))

(declare-fun res!678459 () Bool)

(assert (=> b!1009990 (=> (not res!678459) (not e!568216))))

(declare-datatypes ((SeekEntryResult!9560 0))(
  ( (MissingZero!9560 (index!40611 (_ BitVec 32))) (Found!9560 (index!40612 (_ BitVec 32))) (Intermediate!9560 (undefined!10372 Bool) (index!40613 (_ BitVec 32)) (x!88033 (_ BitVec 32))) (Undefined!9560) (MissingVacant!9560 (index!40614 (_ BitVec 32))) )
))
(declare-fun lt!446249 () SeekEntryResult!9560)

(assert (=> b!1009990 (= res!678459 (or (= lt!446249 (MissingVacant!9560 i!1194)) (= lt!446249 (MissingZero!9560 i!1194))))))

(declare-datatypes ((array!63571 0))(
  ( (array!63572 (arr!30603 (Array (_ BitVec 32) (_ BitVec 64))) (size!31107 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63571)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63571 (_ BitVec 32)) SeekEntryResult!9560)

(assert (=> b!1009990 (= lt!446249 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1009991 () Bool)

(assert (=> b!1009991 (= e!568219 false)))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun lt!446250 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1009991 (= lt!446250 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun res!678452 () Bool)

(assert (=> start!87114 (=> (not res!678452) (not e!568217))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!87114 (= res!678452 (validMask!0 mask!3464))))

(assert (=> start!87114 e!568217))

(declare-fun array_inv!23746 (array!63571) Bool)

(assert (=> start!87114 (array_inv!23746 a!3219)))

(assert (=> start!87114 true))

(declare-fun b!1009992 () Bool)

(declare-fun res!678464 () Bool)

(assert (=> b!1009992 (=> (not res!678464) (not e!568217))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1009992 (= res!678464 (validKeyInArray!0 (select (arr!30603 a!3219) j!170)))))

(declare-fun b!1009993 () Bool)

(declare-fun e!568215 () Bool)

(assert (=> b!1009993 (= e!568215 e!568219)))

(declare-fun res!678462 () Bool)

(assert (=> b!1009993 (=> (not res!678462) (not e!568219))))

(declare-fun lt!446247 () array!63571)

(declare-fun lt!446245 () (_ BitVec 64))

(declare-fun lt!446246 () SeekEntryResult!9560)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63571 (_ BitVec 32)) SeekEntryResult!9560)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1009993 (= res!678462 (not (= lt!446246 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!446245 mask!3464) lt!446245 lt!446247 mask!3464))))))

(assert (=> b!1009993 (= lt!446245 (select (store (arr!30603 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1009993 (= lt!446247 (array!63572 (store (arr!30603 a!3219) i!1194 k0!2224) (size!31107 a!3219)))))

(declare-fun b!1009994 () Bool)

(declare-fun res!678455 () Bool)

(assert (=> b!1009994 (=> (not res!678455) (not e!568216))))

(declare-datatypes ((List!21345 0))(
  ( (Nil!21342) (Cons!21341 (h!22533 (_ BitVec 64)) (t!30337 List!21345)) )
))
(declare-fun arrayNoDuplicates!0 (array!63571 (_ BitVec 32) List!21345) Bool)

(assert (=> b!1009994 (= res!678455 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21342))))

(declare-fun b!1009995 () Bool)

(declare-fun e!568220 () Bool)

(assert (=> b!1009995 (= e!568216 e!568220)))

(declare-fun res!678461 () Bool)

(assert (=> b!1009995 (=> (not res!678461) (not e!568220))))

(declare-fun lt!446251 () SeekEntryResult!9560)

(assert (=> b!1009995 (= res!678461 (= lt!446246 lt!446251))))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1009995 (= lt!446251 (Intermediate!9560 false resIndex!38 resX!38))))

(assert (=> b!1009995 (= lt!446246 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30603 a!3219) j!170) mask!3464) (select (arr!30603 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1009996 () Bool)

(declare-fun res!678454 () Bool)

(assert (=> b!1009996 (=> (not res!678454) (not e!568217))))

(declare-fun arrayContainsKey!0 (array!63571 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1009996 (= res!678454 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1009997 () Bool)

(declare-fun res!678458 () Bool)

(assert (=> b!1009997 (=> (not res!678458) (not e!568217))))

(assert (=> b!1009997 (= res!678458 (and (= (size!31107 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31107 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31107 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1009998 () Bool)

(declare-fun res!678460 () Bool)

(assert (=> b!1009998 (=> (not res!678460) (not e!568219))))

(declare-fun lt!446248 () SeekEntryResult!9560)

(assert (=> b!1009998 (= res!678460 (not (= lt!446248 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!446245 lt!446247 mask!3464))))))

(declare-fun b!1009999 () Bool)

(assert (=> b!1009999 (= e!568220 e!568215)))

(declare-fun res!678463 () Bool)

(assert (=> b!1009999 (=> (not res!678463) (not e!568215))))

(assert (=> b!1009999 (= res!678463 (= lt!446248 lt!446251))))

(assert (=> b!1009999 (= lt!446248 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30603 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1010000 () Bool)

(declare-fun res!678451 () Bool)

(assert (=> b!1010000 (=> (not res!678451) (not e!568216))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63571 (_ BitVec 32)) Bool)

(assert (=> b!1010000 (= res!678451 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1010001 () Bool)

(declare-fun res!678457 () Bool)

(assert (=> b!1010001 (=> (not res!678457) (not e!568216))))

(assert (=> b!1010001 (= res!678457 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31107 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31107 a!3219))))))

(declare-fun b!1010002 () Bool)

(declare-fun res!678453 () Bool)

(assert (=> b!1010002 (=> (not res!678453) (not e!568217))))

(assert (=> b!1010002 (= res!678453 (validKeyInArray!0 k0!2224))))

(assert (= (and start!87114 res!678452) b!1009997))

(assert (= (and b!1009997 res!678458) b!1009992))

(assert (= (and b!1009992 res!678464) b!1010002))

(assert (= (and b!1010002 res!678453) b!1009996))

(assert (= (and b!1009996 res!678454) b!1009990))

(assert (= (and b!1009990 res!678459) b!1010000))

(assert (= (and b!1010000 res!678451) b!1009994))

(assert (= (and b!1009994 res!678455) b!1010001))

(assert (= (and b!1010001 res!678457) b!1009995))

(assert (= (and b!1009995 res!678461) b!1009999))

(assert (= (and b!1009999 res!678463) b!1009993))

(assert (= (and b!1009993 res!678462) b!1009998))

(assert (= (and b!1009998 res!678460) b!1009989))

(assert (= (and b!1009989 res!678456) b!1009991))

(declare-fun m!933853 () Bool)

(assert (=> b!1009995 m!933853))

(assert (=> b!1009995 m!933853))

(declare-fun m!933855 () Bool)

(assert (=> b!1009995 m!933855))

(assert (=> b!1009995 m!933855))

(assert (=> b!1009995 m!933853))

(declare-fun m!933857 () Bool)

(assert (=> b!1009995 m!933857))

(declare-fun m!933859 () Bool)

(assert (=> b!1010002 m!933859))

(declare-fun m!933861 () Bool)

(assert (=> b!1009996 m!933861))

(declare-fun m!933863 () Bool)

(assert (=> b!1009994 m!933863))

(declare-fun m!933865 () Bool)

(assert (=> b!1009990 m!933865))

(declare-fun m!933867 () Bool)

(assert (=> b!1009998 m!933867))

(assert (=> b!1009999 m!933853))

(assert (=> b!1009999 m!933853))

(declare-fun m!933869 () Bool)

(assert (=> b!1009999 m!933869))

(assert (=> b!1009992 m!933853))

(assert (=> b!1009992 m!933853))

(declare-fun m!933871 () Bool)

(assert (=> b!1009992 m!933871))

(declare-fun m!933873 () Bool)

(assert (=> b!1009993 m!933873))

(assert (=> b!1009993 m!933873))

(declare-fun m!933875 () Bool)

(assert (=> b!1009993 m!933875))

(declare-fun m!933877 () Bool)

(assert (=> b!1009993 m!933877))

(declare-fun m!933879 () Bool)

(assert (=> b!1009993 m!933879))

(declare-fun m!933881 () Bool)

(assert (=> start!87114 m!933881))

(declare-fun m!933883 () Bool)

(assert (=> start!87114 m!933883))

(declare-fun m!933885 () Bool)

(assert (=> b!1009991 m!933885))

(declare-fun m!933887 () Bool)

(assert (=> b!1010000 m!933887))

(check-sat (not b!1009991) (not b!1009992) (not b!1009996) (not b!1009998) (not b!1009993) (not b!1010002) (not b!1009999) (not b!1010000) (not b!1009995) (not b!1009994) (not start!87114) (not b!1009990))
(check-sat)
