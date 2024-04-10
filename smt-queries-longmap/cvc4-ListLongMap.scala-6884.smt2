; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86562 () Bool)

(assert start!86562)

(declare-fun b!1003438 () Bool)

(declare-fun e!565171 () Bool)

(declare-fun e!565170 () Bool)

(assert (=> b!1003438 (= e!565171 e!565170)))

(declare-fun res!672915 () Bool)

(assert (=> b!1003438 (=> (not res!672915) (not e!565170))))

(declare-datatypes ((SeekEntryResult!9439 0))(
  ( (MissingZero!9439 (index!40127 (_ BitVec 32))) (Found!9439 (index!40128 (_ BitVec 32))) (Intermediate!9439 (undefined!10251 Bool) (index!40129 (_ BitVec 32)) (x!87531 (_ BitVec 32))) (Undefined!9439) (MissingVacant!9439 (index!40130 (_ BitVec 32))) )
))
(declare-fun lt!443676 () SeekEntryResult!9439)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1003438 (= res!672915 (or (= lt!443676 (MissingVacant!9439 i!1194)) (= lt!443676 (MissingZero!9439 i!1194))))))

(declare-datatypes ((array!63363 0))(
  ( (array!63364 (arr!30507 (Array (_ BitVec 32) (_ BitVec 64))) (size!31009 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63363)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63363 (_ BitVec 32)) SeekEntryResult!9439)

(assert (=> b!1003438 (= lt!443676 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!1003439 () Bool)

(declare-fun e!565169 () Bool)

(assert (=> b!1003439 (= e!565170 e!565169)))

(declare-fun res!672923 () Bool)

(assert (=> b!1003439 (=> (not res!672923) (not e!565169))))

(declare-fun lt!443677 () SeekEntryResult!9439)

(declare-fun lt!443674 () SeekEntryResult!9439)

(assert (=> b!1003439 (= res!672923 (= lt!443677 lt!443674))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1003439 (= lt!443674 (Intermediate!9439 false resIndex!38 resX!38))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63363 (_ BitVec 32)) SeekEntryResult!9439)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1003439 (= lt!443677 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30507 a!3219) j!170) mask!3464) (select (arr!30507 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1003440 () Bool)

(declare-fun res!672925 () Bool)

(assert (=> b!1003440 (=> (not res!672925) (not e!565170))))

(declare-datatypes ((List!21183 0))(
  ( (Nil!21180) (Cons!21179 (h!22356 (_ BitVec 64)) (t!30184 List!21183)) )
))
(declare-fun arrayNoDuplicates!0 (array!63363 (_ BitVec 32) List!21183) Bool)

(assert (=> b!1003440 (= res!672925 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21180))))

(declare-fun b!1003441 () Bool)

(declare-fun res!672927 () Bool)

(declare-fun e!565168 () Bool)

(assert (=> b!1003441 (=> (not res!672927) (not e!565168))))

(declare-fun index!1507 () (_ BitVec 32))

(assert (=> b!1003441 (= res!672927 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1003442 () Bool)

(declare-fun res!672929 () Bool)

(assert (=> b!1003442 (=> (not res!672929) (not e!565168))))

(declare-fun lt!443680 () (_ BitVec 64))

(declare-fun lt!443675 () array!63363)

(declare-fun lt!443679 () SeekEntryResult!9439)

(declare-fun x!1245 () (_ BitVec 32))

(assert (=> b!1003442 (= res!672929 (not (= lt!443679 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!443680 lt!443675 mask!3464))))))

(declare-fun b!1003443 () Bool)

(declare-fun e!565172 () Bool)

(assert (=> b!1003443 (= e!565168 e!565172)))

(declare-fun res!672930 () Bool)

(assert (=> b!1003443 (=> (not res!672930) (not e!565172))))

(declare-fun lt!443681 () (_ BitVec 32))

(assert (=> b!1003443 (= res!672930 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1245) resX!38) (bvsge (bvadd #b00000000000000000000000000000001 x!1245) #b00000000000000000000000000000000) (bvsge lt!443681 #b00000000000000000000000000000000) (bvslt lt!443681 (size!31009 a!3219))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1003443 (= lt!443681 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun b!1003444 () Bool)

(declare-fun res!672926 () Bool)

(assert (=> b!1003444 (=> (not res!672926) (not e!565171))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1003444 (= res!672926 (validKeyInArray!0 (select (arr!30507 a!3219) j!170)))))

(declare-fun b!1003445 () Bool)

(declare-fun res!672920 () Bool)

(assert (=> b!1003445 (=> (not res!672920) (not e!565172))))

(assert (=> b!1003445 (= res!672920 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!443681 (select (arr!30507 a!3219) j!170) a!3219 mask!3464) lt!443674))))

(declare-fun b!1003446 () Bool)

(declare-fun res!672921 () Bool)

(assert (=> b!1003446 (=> (not res!672921) (not e!565170))))

(assert (=> b!1003446 (= res!672921 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31009 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31009 a!3219))))))

(declare-fun b!1003447 () Bool)

(declare-fun e!565173 () Bool)

(assert (=> b!1003447 (= e!565173 e!565168)))

(declare-fun res!672928 () Bool)

(assert (=> b!1003447 (=> (not res!672928) (not e!565168))))

(assert (=> b!1003447 (= res!672928 (not (= lt!443677 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!443680 mask!3464) lt!443680 lt!443675 mask!3464))))))

(assert (=> b!1003447 (= lt!443680 (select (store (arr!30507 a!3219) i!1194 k!2224) j!170))))

(assert (=> b!1003447 (= lt!443675 (array!63364 (store (arr!30507 a!3219) i!1194 k!2224) (size!31009 a!3219)))))

(declare-fun b!1003448 () Bool)

(declare-fun res!672922 () Bool)

(assert (=> b!1003448 (=> (not res!672922) (not e!565171))))

(assert (=> b!1003448 (= res!672922 (validKeyInArray!0 k!2224))))

(declare-fun res!672918 () Bool)

(assert (=> start!86562 (=> (not res!672918) (not e!565171))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86562 (= res!672918 (validMask!0 mask!3464))))

(assert (=> start!86562 e!565171))

(declare-fun array_inv!23631 (array!63363) Bool)

(assert (=> start!86562 (array_inv!23631 a!3219)))

(assert (=> start!86562 true))

(declare-fun b!1003437 () Bool)

(declare-fun res!672916 () Bool)

(assert (=> b!1003437 (=> (not res!672916) (not e!565170))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63363 (_ BitVec 32)) Bool)

(assert (=> b!1003437 (= res!672916 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1003449 () Bool)

(declare-fun res!672919 () Bool)

(assert (=> b!1003449 (=> (not res!672919) (not e!565171))))

(declare-fun arrayContainsKey!0 (array!63363 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1003449 (= res!672919 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1003450 () Bool)

(declare-fun res!672917 () Bool)

(assert (=> b!1003450 (=> (not res!672917) (not e!565171))))

(assert (=> b!1003450 (= res!672917 (and (= (size!31009 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31009 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31009 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1003451 () Bool)

(assert (=> b!1003451 (= e!565169 e!565173)))

(declare-fun res!672924 () Bool)

(assert (=> b!1003451 (=> (not res!672924) (not e!565173))))

(assert (=> b!1003451 (= res!672924 (= lt!443679 lt!443674))))

(assert (=> b!1003451 (= lt!443679 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30507 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1003452 () Bool)

(assert (=> b!1003452 (= e!565172 false)))

(declare-fun lt!443678 () SeekEntryResult!9439)

(assert (=> b!1003452 (= lt!443678 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!443681 lt!443680 lt!443675 mask!3464))))

(assert (= (and start!86562 res!672918) b!1003450))

(assert (= (and b!1003450 res!672917) b!1003444))

(assert (= (and b!1003444 res!672926) b!1003448))

(assert (= (and b!1003448 res!672922) b!1003449))

(assert (= (and b!1003449 res!672919) b!1003438))

(assert (= (and b!1003438 res!672915) b!1003437))

(assert (= (and b!1003437 res!672916) b!1003440))

(assert (= (and b!1003440 res!672925) b!1003446))

(assert (= (and b!1003446 res!672921) b!1003439))

(assert (= (and b!1003439 res!672923) b!1003451))

(assert (= (and b!1003451 res!672924) b!1003447))

(assert (= (and b!1003447 res!672928) b!1003442))

(assert (= (and b!1003442 res!672929) b!1003441))

(assert (= (and b!1003441 res!672927) b!1003443))

(assert (= (and b!1003443 res!672930) b!1003445))

(assert (= (and b!1003445 res!672920) b!1003452))

(declare-fun m!929149 () Bool)

(assert (=> b!1003437 m!929149))

(declare-fun m!929151 () Bool)

(assert (=> b!1003448 m!929151))

(declare-fun m!929153 () Bool)

(assert (=> start!86562 m!929153))

(declare-fun m!929155 () Bool)

(assert (=> start!86562 m!929155))

(declare-fun m!929157 () Bool)

(assert (=> b!1003451 m!929157))

(assert (=> b!1003451 m!929157))

(declare-fun m!929159 () Bool)

(assert (=> b!1003451 m!929159))

(declare-fun m!929161 () Bool)

(assert (=> b!1003442 m!929161))

(assert (=> b!1003445 m!929157))

(assert (=> b!1003445 m!929157))

(declare-fun m!929163 () Bool)

(assert (=> b!1003445 m!929163))

(declare-fun m!929165 () Bool)

(assert (=> b!1003449 m!929165))

(assert (=> b!1003439 m!929157))

(assert (=> b!1003439 m!929157))

(declare-fun m!929167 () Bool)

(assert (=> b!1003439 m!929167))

(assert (=> b!1003439 m!929167))

(assert (=> b!1003439 m!929157))

(declare-fun m!929169 () Bool)

(assert (=> b!1003439 m!929169))

(declare-fun m!929171 () Bool)

(assert (=> b!1003447 m!929171))

(assert (=> b!1003447 m!929171))

(declare-fun m!929173 () Bool)

(assert (=> b!1003447 m!929173))

(declare-fun m!929175 () Bool)

(assert (=> b!1003447 m!929175))

(declare-fun m!929177 () Bool)

(assert (=> b!1003447 m!929177))

(assert (=> b!1003444 m!929157))

(assert (=> b!1003444 m!929157))

(declare-fun m!929179 () Bool)

(assert (=> b!1003444 m!929179))

(declare-fun m!929181 () Bool)

(assert (=> b!1003443 m!929181))

(declare-fun m!929183 () Bool)

(assert (=> b!1003452 m!929183))

(declare-fun m!929185 () Bool)

(assert (=> b!1003440 m!929185))

(declare-fun m!929187 () Bool)

(assert (=> b!1003438 m!929187))

(push 1)

(assert (not b!1003445))

