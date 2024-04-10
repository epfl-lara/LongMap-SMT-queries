; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86580 () Bool)

(assert start!86580)

(declare-fun b!1003869 () Bool)

(declare-fun e!565361 () Bool)

(declare-fun e!565363 () Bool)

(assert (=> b!1003869 (= e!565361 e!565363)))

(declare-fun res!673355 () Bool)

(assert (=> b!1003869 (=> (not res!673355) (not e!565363))))

(declare-datatypes ((SeekEntryResult!9448 0))(
  ( (MissingZero!9448 (index!40163 (_ BitVec 32))) (Found!9448 (index!40164 (_ BitVec 32))) (Intermediate!9448 (undefined!10260 Bool) (index!40165 (_ BitVec 32)) (x!87564 (_ BitVec 32))) (Undefined!9448) (MissingVacant!9448 (index!40166 (_ BitVec 32))) )
))
(declare-fun lt!443896 () SeekEntryResult!9448)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1003869 (= res!673355 (or (= lt!443896 (MissingVacant!9448 i!1194)) (= lt!443896 (MissingZero!9448 i!1194))))))

(declare-datatypes ((array!63381 0))(
  ( (array!63382 (arr!30516 (Array (_ BitVec 32) (_ BitVec 64))) (size!31018 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63381)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63381 (_ BitVec 32)) SeekEntryResult!9448)

(assert (=> b!1003869 (= lt!443896 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!1003870 () Bool)

(declare-fun e!565357 () Bool)

(declare-fun e!565360 () Bool)

(assert (=> b!1003870 (= e!565357 e!565360)))

(declare-fun res!673361 () Bool)

(assert (=> b!1003870 (=> (not res!673361) (not e!565360))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(declare-fun lt!443893 () (_ BitVec 32))

(assert (=> b!1003870 (= res!673361 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1245) resX!38) (bvsge (bvadd #b00000000000000000000000000000001 x!1245) #b00000000000000000000000000000000) (bvsge lt!443893 #b00000000000000000000000000000000) (bvslt lt!443893 (size!31018 a!3219))))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1003870 (= lt!443893 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun b!1003871 () Bool)

(declare-fun res!673353 () Bool)

(assert (=> b!1003871 (=> (not res!673353) (not e!565363))))

(declare-datatypes ((List!21192 0))(
  ( (Nil!21189) (Cons!21188 (h!22365 (_ BitVec 64)) (t!30193 List!21192)) )
))
(declare-fun arrayNoDuplicates!0 (array!63381 (_ BitVec 32) List!21192) Bool)

(assert (=> b!1003871 (= res!673353 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21189))))

(declare-fun b!1003873 () Bool)

(declare-fun e!565362 () Bool)

(assert (=> b!1003873 (= e!565363 e!565362)))

(declare-fun res!673351 () Bool)

(assert (=> b!1003873 (=> (not res!673351) (not e!565362))))

(declare-fun lt!443890 () SeekEntryResult!9448)

(declare-fun lt!443891 () SeekEntryResult!9448)

(assert (=> b!1003873 (= res!673351 (= lt!443890 lt!443891))))

(declare-fun resIndex!38 () (_ BitVec 32))

(assert (=> b!1003873 (= lt!443891 (Intermediate!9448 false resIndex!38 resX!38))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63381 (_ BitVec 32)) SeekEntryResult!9448)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1003873 (= lt!443890 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30516 a!3219) j!170) mask!3464) (select (arr!30516 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1003874 () Bool)

(declare-fun e!565359 () Bool)

(assert (=> b!1003874 (= e!565359 e!565357)))

(declare-fun res!673358 () Bool)

(assert (=> b!1003874 (=> (not res!673358) (not e!565357))))

(declare-fun lt!443894 () array!63381)

(declare-fun lt!443895 () (_ BitVec 64))

(assert (=> b!1003874 (= res!673358 (not (= lt!443890 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!443895 mask!3464) lt!443895 lt!443894 mask!3464))))))

(assert (=> b!1003874 (= lt!443895 (select (store (arr!30516 a!3219) i!1194 k!2224) j!170))))

(assert (=> b!1003874 (= lt!443894 (array!63382 (store (arr!30516 a!3219) i!1194 k!2224) (size!31018 a!3219)))))

(declare-fun b!1003875 () Bool)

(declare-fun res!673347 () Bool)

(assert (=> b!1003875 (=> (not res!673347) (not e!565363))))

(assert (=> b!1003875 (= res!673347 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31018 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31018 a!3219))))))

(declare-fun b!1003876 () Bool)

(declare-fun res!673360 () Bool)

(assert (=> b!1003876 (=> (not res!673360) (not e!565357))))

(assert (=> b!1003876 (= res!673360 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1003877 () Bool)

(declare-fun res!673359 () Bool)

(assert (=> b!1003877 (=> (not res!673359) (not e!565360))))

(assert (=> b!1003877 (= res!673359 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!443893 (select (arr!30516 a!3219) j!170) a!3219 mask!3464) lt!443891))))

(declare-fun b!1003878 () Bool)

(declare-fun res!673350 () Bool)

(assert (=> b!1003878 (=> (not res!673350) (not e!565361))))

(declare-fun arrayContainsKey!0 (array!63381 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1003878 (= res!673350 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1003879 () Bool)

(declare-fun res!673348 () Bool)

(assert (=> b!1003879 (=> (not res!673348) (not e!565357))))

(declare-fun lt!443897 () SeekEntryResult!9448)

(assert (=> b!1003879 (= res!673348 (not (= lt!443897 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!443895 lt!443894 mask!3464))))))

(declare-fun b!1003880 () Bool)

(assert (=> b!1003880 (= e!565362 e!565359)))

(declare-fun res!673356 () Bool)

(assert (=> b!1003880 (=> (not res!673356) (not e!565359))))

(assert (=> b!1003880 (= res!673356 (= lt!443897 lt!443891))))

(assert (=> b!1003880 (= lt!443897 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30516 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1003881 () Bool)

(declare-fun res!673349 () Bool)

(assert (=> b!1003881 (=> (not res!673349) (not e!565361))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1003881 (= res!673349 (validKeyInArray!0 k!2224))))

(declare-fun b!1003872 () Bool)

(assert (=> b!1003872 (= e!565360 false)))

(declare-fun lt!443892 () SeekEntryResult!9448)

(assert (=> b!1003872 (= lt!443892 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!443893 lt!443895 lt!443894 mask!3464))))

(declare-fun res!673354 () Bool)

(assert (=> start!86580 (=> (not res!673354) (not e!565361))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86580 (= res!673354 (validMask!0 mask!3464))))

(assert (=> start!86580 e!565361))

(declare-fun array_inv!23640 (array!63381) Bool)

(assert (=> start!86580 (array_inv!23640 a!3219)))

(assert (=> start!86580 true))

(declare-fun b!1003882 () Bool)

(declare-fun res!673362 () Bool)

(assert (=> b!1003882 (=> (not res!673362) (not e!565363))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63381 (_ BitVec 32)) Bool)

(assert (=> b!1003882 (= res!673362 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1003883 () Bool)

(declare-fun res!673352 () Bool)

(assert (=> b!1003883 (=> (not res!673352) (not e!565361))))

(assert (=> b!1003883 (= res!673352 (validKeyInArray!0 (select (arr!30516 a!3219) j!170)))))

(declare-fun b!1003884 () Bool)

(declare-fun res!673357 () Bool)

(assert (=> b!1003884 (=> (not res!673357) (not e!565361))))

(assert (=> b!1003884 (= res!673357 (and (= (size!31018 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31018 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31018 a!3219)) (not (= i!1194 j!170))))))

(assert (= (and start!86580 res!673354) b!1003884))

(assert (= (and b!1003884 res!673357) b!1003883))

(assert (= (and b!1003883 res!673352) b!1003881))

(assert (= (and b!1003881 res!673349) b!1003878))

(assert (= (and b!1003878 res!673350) b!1003869))

(assert (= (and b!1003869 res!673355) b!1003882))

(assert (= (and b!1003882 res!673362) b!1003871))

(assert (= (and b!1003871 res!673353) b!1003875))

(assert (= (and b!1003875 res!673347) b!1003873))

(assert (= (and b!1003873 res!673351) b!1003880))

(assert (= (and b!1003880 res!673356) b!1003874))

(assert (= (and b!1003874 res!673358) b!1003879))

(assert (= (and b!1003879 res!673348) b!1003876))

(assert (= (and b!1003876 res!673360) b!1003870))

(assert (= (and b!1003870 res!673361) b!1003877))

(assert (= (and b!1003877 res!673359) b!1003872))

(declare-fun m!929509 () Bool)

(assert (=> b!1003872 m!929509))

(declare-fun m!929511 () Bool)

(assert (=> b!1003874 m!929511))

(assert (=> b!1003874 m!929511))

(declare-fun m!929513 () Bool)

(assert (=> b!1003874 m!929513))

(declare-fun m!929515 () Bool)

(assert (=> b!1003874 m!929515))

(declare-fun m!929517 () Bool)

(assert (=> b!1003874 m!929517))

(declare-fun m!929519 () Bool)

(assert (=> b!1003877 m!929519))

(assert (=> b!1003877 m!929519))

(declare-fun m!929521 () Bool)

(assert (=> b!1003877 m!929521))

(assert (=> b!1003873 m!929519))

(assert (=> b!1003873 m!929519))

(declare-fun m!929523 () Bool)

(assert (=> b!1003873 m!929523))

(assert (=> b!1003873 m!929523))

(assert (=> b!1003873 m!929519))

(declare-fun m!929525 () Bool)

(assert (=> b!1003873 m!929525))

(declare-fun m!929527 () Bool)

(assert (=> b!1003871 m!929527))

(declare-fun m!929529 () Bool)

(assert (=> b!1003881 m!929529))

(assert (=> b!1003883 m!929519))

(assert (=> b!1003883 m!929519))

(declare-fun m!929531 () Bool)

(assert (=> b!1003883 m!929531))

(declare-fun m!929533 () Bool)

(assert (=> b!1003869 m!929533))

(declare-fun m!929535 () Bool)

(assert (=> b!1003878 m!929535))

(assert (=> b!1003880 m!929519))

(assert (=> b!1003880 m!929519))

(declare-fun m!929537 () Bool)

(assert (=> b!1003880 m!929537))

(declare-fun m!929539 () Bool)

(assert (=> b!1003879 m!929539))

(declare-fun m!929541 () Bool)

(assert (=> b!1003882 m!929541))

(declare-fun m!929543 () Bool)

(assert (=> b!1003870 m!929543))

(declare-fun m!929545 () Bool)

(assert (=> start!86580 m!929545))

(declare-fun m!929547 () Bool)

(assert (=> start!86580 m!929547))

(push 1)

(assert (not b!1003877))

(assert (not b!1003881))

