; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86538 () Bool)

(assert start!86538)

(declare-fun b!1002861 () Bool)

(declare-fun res!672353 () Bool)

(declare-fun e!564916 () Bool)

(assert (=> b!1002861 (=> (not res!672353) (not e!564916))))

(declare-datatypes ((array!63339 0))(
  ( (array!63340 (arr!30495 (Array (_ BitVec 32) (_ BitVec 64))) (size!30997 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63339)

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1002861 (= res!672353 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30997 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30997 a!3219))))))

(declare-fun b!1002862 () Bool)

(declare-fun e!564918 () Bool)

(assert (=> b!1002862 (= e!564918 e!564916)))

(declare-fun res!672350 () Bool)

(assert (=> b!1002862 (=> (not res!672350) (not e!564916))))

(declare-datatypes ((SeekEntryResult!9427 0))(
  ( (MissingZero!9427 (index!40079 (_ BitVec 32))) (Found!9427 (index!40080 (_ BitVec 32))) (Intermediate!9427 (undefined!10239 Bool) (index!40081 (_ BitVec 32)) (x!87487 (_ BitVec 32))) (Undefined!9427) (MissingVacant!9427 (index!40082 (_ BitVec 32))) )
))
(declare-fun lt!443393 () SeekEntryResult!9427)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1002862 (= res!672350 (or (= lt!443393 (MissingVacant!9427 i!1194)) (= lt!443393 (MissingZero!9427 i!1194))))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63339 (_ BitVec 32)) SeekEntryResult!9427)

(assert (=> b!1002862 (= lt!443393 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!1002863 () Bool)

(declare-fun e!564920 () Bool)

(declare-fun e!564917 () Bool)

(assert (=> b!1002863 (= e!564920 e!564917)))

(declare-fun res!672347 () Bool)

(assert (=> b!1002863 (=> (not res!672347) (not e!564917))))

(declare-fun lt!443386 () SeekEntryResult!9427)

(declare-fun lt!443392 () (_ BitVec 64))

(declare-fun lt!443387 () array!63339)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63339 (_ BitVec 32)) SeekEntryResult!9427)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1002863 (= res!672347 (not (= lt!443386 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!443392 mask!3464) lt!443392 lt!443387 mask!3464))))))

(declare-fun j!170 () (_ BitVec 32))

(assert (=> b!1002863 (= lt!443392 (select (store (arr!30495 a!3219) i!1194 k!2224) j!170))))

(assert (=> b!1002863 (= lt!443387 (array!63340 (store (arr!30495 a!3219) i!1194 k!2224) (size!30997 a!3219)))))

(declare-fun b!1002864 () Bool)

(declare-fun res!672340 () Bool)

(assert (=> b!1002864 (=> (not res!672340) (not e!564916))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63339 (_ BitVec 32)) Bool)

(assert (=> b!1002864 (= res!672340 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1002865 () Bool)

(declare-fun res!672346 () Bool)

(assert (=> b!1002865 (=> (not res!672346) (not e!564918))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1002865 (= res!672346 (validKeyInArray!0 (select (arr!30495 a!3219) j!170)))))

(declare-fun b!1002866 () Bool)

(declare-fun res!672344 () Bool)

(assert (=> b!1002866 (=> (not res!672344) (not e!564916))))

(declare-datatypes ((List!21171 0))(
  ( (Nil!21168) (Cons!21167 (h!22344 (_ BitVec 64)) (t!30172 List!21171)) )
))
(declare-fun arrayNoDuplicates!0 (array!63339 (_ BitVec 32) List!21171) Bool)

(assert (=> b!1002866 (= res!672344 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21168))))

(declare-fun b!1002867 () Bool)

(declare-fun e!564919 () Bool)

(assert (=> b!1002867 (= e!564917 e!564919)))

(declare-fun res!672343 () Bool)

(assert (=> b!1002867 (=> (not res!672343) (not e!564919))))

(declare-fun lt!443389 () (_ BitVec 32))

(assert (=> b!1002867 (= res!672343 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1245) resX!38) (bvsge (bvadd #b00000000000000000000000000000001 x!1245) #b00000000000000000000000000000000) (bvsge lt!443389 #b00000000000000000000000000000000) (bvslt lt!443389 (size!30997 a!3219))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1002867 (= lt!443389 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun b!1002868 () Bool)

(declare-fun res!672339 () Bool)

(assert (=> b!1002868 (=> (not res!672339) (not e!564918))))

(assert (=> b!1002868 (= res!672339 (and (= (size!30997 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30997 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30997 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1002869 () Bool)

(declare-fun res!672348 () Bool)

(assert (=> b!1002869 (=> (not res!672348) (not e!564919))))

(declare-fun lt!443388 () SeekEntryResult!9427)

(assert (=> b!1002869 (= res!672348 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!443389 (select (arr!30495 a!3219) j!170) a!3219 mask!3464) lt!443388))))

(declare-fun res!672345 () Bool)

(assert (=> start!86538 (=> (not res!672345) (not e!564918))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86538 (= res!672345 (validMask!0 mask!3464))))

(assert (=> start!86538 e!564918))

(declare-fun array_inv!23619 (array!63339) Bool)

(assert (=> start!86538 (array_inv!23619 a!3219)))

(assert (=> start!86538 true))

(declare-fun b!1002870 () Bool)

(assert (=> b!1002870 (= e!564919 false)))

(declare-fun lt!443391 () SeekEntryResult!9427)

(assert (=> b!1002870 (= lt!443391 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!443389 lt!443392 lt!443387 mask!3464))))

(declare-fun b!1002871 () Bool)

(declare-fun res!672351 () Bool)

(assert (=> b!1002871 (=> (not res!672351) (not e!564918))))

(declare-fun arrayContainsKey!0 (array!63339 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1002871 (= res!672351 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1002872 () Bool)

(declare-fun e!564921 () Bool)

(assert (=> b!1002872 (= e!564916 e!564921)))

(declare-fun res!672352 () Bool)

(assert (=> b!1002872 (=> (not res!672352) (not e!564921))))

(assert (=> b!1002872 (= res!672352 (= lt!443386 lt!443388))))

(assert (=> b!1002872 (= lt!443388 (Intermediate!9427 false resIndex!38 resX!38))))

(assert (=> b!1002872 (= lt!443386 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30495 a!3219) j!170) mask!3464) (select (arr!30495 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1002873 () Bool)

(declare-fun res!672342 () Bool)

(assert (=> b!1002873 (=> (not res!672342) (not e!564917))))

(assert (=> b!1002873 (= res!672342 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1002874 () Bool)

(assert (=> b!1002874 (= e!564921 e!564920)))

(declare-fun res!672341 () Bool)

(assert (=> b!1002874 (=> (not res!672341) (not e!564920))))

(declare-fun lt!443390 () SeekEntryResult!9427)

(assert (=> b!1002874 (= res!672341 (= lt!443390 lt!443388))))

(assert (=> b!1002874 (= lt!443390 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30495 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1002875 () Bool)

(declare-fun res!672349 () Bool)

(assert (=> b!1002875 (=> (not res!672349) (not e!564918))))

(assert (=> b!1002875 (= res!672349 (validKeyInArray!0 k!2224))))

(declare-fun b!1002876 () Bool)

(declare-fun res!672354 () Bool)

(assert (=> b!1002876 (=> (not res!672354) (not e!564917))))

(assert (=> b!1002876 (= res!672354 (not (= lt!443390 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!443392 lt!443387 mask!3464))))))

(assert (= (and start!86538 res!672345) b!1002868))

(assert (= (and b!1002868 res!672339) b!1002865))

(assert (= (and b!1002865 res!672346) b!1002875))

(assert (= (and b!1002875 res!672349) b!1002871))

(assert (= (and b!1002871 res!672351) b!1002862))

(assert (= (and b!1002862 res!672350) b!1002864))

(assert (= (and b!1002864 res!672340) b!1002866))

(assert (= (and b!1002866 res!672344) b!1002861))

(assert (= (and b!1002861 res!672353) b!1002872))

(assert (= (and b!1002872 res!672352) b!1002874))

(assert (= (and b!1002874 res!672341) b!1002863))

(assert (= (and b!1002863 res!672347) b!1002876))

(assert (= (and b!1002876 res!672354) b!1002873))

(assert (= (and b!1002873 res!672342) b!1002867))

(assert (= (and b!1002867 res!672343) b!1002869))

(assert (= (and b!1002869 res!672348) b!1002870))

(declare-fun m!928669 () Bool)

(assert (=> b!1002870 m!928669))

(declare-fun m!928671 () Bool)

(assert (=> b!1002862 m!928671))

(declare-fun m!928673 () Bool)

(assert (=> b!1002869 m!928673))

(assert (=> b!1002869 m!928673))

(declare-fun m!928675 () Bool)

(assert (=> b!1002869 m!928675))

(declare-fun m!928677 () Bool)

(assert (=> b!1002863 m!928677))

(assert (=> b!1002863 m!928677))

(declare-fun m!928679 () Bool)

(assert (=> b!1002863 m!928679))

(declare-fun m!928681 () Bool)

(assert (=> b!1002863 m!928681))

(declare-fun m!928683 () Bool)

(assert (=> b!1002863 m!928683))

(assert (=> b!1002872 m!928673))

(assert (=> b!1002872 m!928673))

(declare-fun m!928685 () Bool)

(assert (=> b!1002872 m!928685))

(assert (=> b!1002872 m!928685))

(assert (=> b!1002872 m!928673))

(declare-fun m!928687 () Bool)

(assert (=> b!1002872 m!928687))

(declare-fun m!928689 () Bool)

(assert (=> b!1002871 m!928689))

(declare-fun m!928691 () Bool)

(assert (=> b!1002876 m!928691))

(declare-fun m!928693 () Bool)

(assert (=> b!1002867 m!928693))

(declare-fun m!928695 () Bool)

(assert (=> b!1002875 m!928695))

(assert (=> b!1002874 m!928673))

(assert (=> b!1002874 m!928673))

(declare-fun m!928697 () Bool)

(assert (=> b!1002874 m!928697))

(declare-fun m!928699 () Bool)

(assert (=> b!1002866 m!928699))

(assert (=> b!1002865 m!928673))

(assert (=> b!1002865 m!928673))

(declare-fun m!928701 () Bool)

(assert (=> b!1002865 m!928701))

(declare-fun m!928703 () Bool)

(assert (=> b!1002864 m!928703))

(declare-fun m!928705 () Bool)

(assert (=> start!86538 m!928705))

(declare-fun m!928707 () Bool)

(assert (=> start!86538 m!928707))

(push 1)

