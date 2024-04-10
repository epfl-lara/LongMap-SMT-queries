; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86582 () Bool)

(assert start!86582)

(declare-fun b!1003917 () Bool)

(declare-fun res!673403 () Bool)

(declare-fun e!565384 () Bool)

(assert (=> b!1003917 (=> (not res!673403) (not e!565384))))

(declare-fun lt!443914 () (_ BitVec 64))

(declare-fun index!1507 () (_ BitVec 32))

(declare-datatypes ((array!63383 0))(
  ( (array!63384 (arr!30517 (Array (_ BitVec 32) (_ BitVec 64))) (size!31019 (_ BitVec 32))) )
))
(declare-fun lt!443917 () array!63383)

(declare-datatypes ((SeekEntryResult!9449 0))(
  ( (MissingZero!9449 (index!40167 (_ BitVec 32))) (Found!9449 (index!40168 (_ BitVec 32))) (Intermediate!9449 (undefined!10261 Bool) (index!40169 (_ BitVec 32)) (x!87573 (_ BitVec 32))) (Undefined!9449) (MissingVacant!9449 (index!40170 (_ BitVec 32))) )
))
(declare-fun lt!443918 () SeekEntryResult!9449)

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63383 (_ BitVec 32)) SeekEntryResult!9449)

(assert (=> b!1003917 (= res!673403 (not (= lt!443918 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!443914 lt!443917 mask!3464))))))

(declare-fun b!1003918 () Bool)

(declare-fun e!565383 () Bool)

(declare-fun e!565380 () Bool)

(assert (=> b!1003918 (= e!565383 e!565380)))

(declare-fun res!673395 () Bool)

(assert (=> b!1003918 (=> (not res!673395) (not e!565380))))

(declare-fun lt!443915 () SeekEntryResult!9449)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1003918 (= res!673395 (or (= lt!443915 (MissingVacant!9449 i!1194)) (= lt!443915 (MissingZero!9449 i!1194))))))

(declare-fun a!3219 () array!63383)

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63383 (_ BitVec 32)) SeekEntryResult!9449)

(assert (=> b!1003918 (= lt!443915 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!1003919 () Bool)

(declare-fun e!565379 () Bool)

(assert (=> b!1003919 (= e!565384 e!565379)))

(declare-fun res!673396 () Bool)

(assert (=> b!1003919 (=> (not res!673396) (not e!565379))))

(declare-fun resX!38 () (_ BitVec 32))

(declare-fun lt!443916 () (_ BitVec 32))

(assert (=> b!1003919 (= res!673396 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1245) resX!38) (bvsge (bvadd #b00000000000000000000000000000001 x!1245) #b00000000000000000000000000000000) (bvsge lt!443916 #b00000000000000000000000000000000) (bvslt lt!443916 (size!31019 a!3219))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1003919 (= lt!443916 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun b!1003920 () Bool)

(declare-fun res!673399 () Bool)

(assert (=> b!1003920 (=> (not res!673399) (not e!565379))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun lt!443921 () SeekEntryResult!9449)

(assert (=> b!1003920 (= res!673399 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!443916 (select (arr!30517 a!3219) j!170) a!3219 mask!3464) lt!443921))))

(declare-fun b!1003921 () Bool)

(declare-fun e!565382 () Bool)

(declare-fun e!565378 () Bool)

(assert (=> b!1003921 (= e!565382 e!565378)))

(declare-fun res!673401 () Bool)

(assert (=> b!1003921 (=> (not res!673401) (not e!565378))))

(assert (=> b!1003921 (= res!673401 (= lt!443918 lt!443921))))

(assert (=> b!1003921 (= lt!443918 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30517 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1003922 () Bool)

(declare-fun res!673408 () Bool)

(assert (=> b!1003922 (=> (not res!673408) (not e!565380))))

(declare-datatypes ((List!21193 0))(
  ( (Nil!21190) (Cons!21189 (h!22366 (_ BitVec 64)) (t!30194 List!21193)) )
))
(declare-fun arrayNoDuplicates!0 (array!63383 (_ BitVec 32) List!21193) Bool)

(assert (=> b!1003922 (= res!673408 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21190))))

(declare-fun b!1003923 () Bool)

(declare-fun res!673397 () Bool)

(assert (=> b!1003923 (=> (not res!673397) (not e!565383))))

(declare-fun arrayContainsKey!0 (array!63383 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1003923 (= res!673397 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1003924 () Bool)

(declare-fun res!673404 () Bool)

(assert (=> b!1003924 (=> (not res!673404) (not e!565383))))

(assert (=> b!1003924 (= res!673404 (and (= (size!31019 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31019 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31019 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1003925 () Bool)

(declare-fun res!673410 () Bool)

(assert (=> b!1003925 (=> (not res!673410) (not e!565384))))

(declare-fun resIndex!38 () (_ BitVec 32))

(assert (=> b!1003925 (= res!673410 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1003926 () Bool)

(assert (=> b!1003926 (= e!565378 e!565384)))

(declare-fun res!673398 () Bool)

(assert (=> b!1003926 (=> (not res!673398) (not e!565384))))

(declare-fun lt!443920 () SeekEntryResult!9449)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1003926 (= res!673398 (not (= lt!443920 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!443914 mask!3464) lt!443914 lt!443917 mask!3464))))))

(assert (=> b!1003926 (= lt!443914 (select (store (arr!30517 a!3219) i!1194 k!2224) j!170))))

(assert (=> b!1003926 (= lt!443917 (array!63384 (store (arr!30517 a!3219) i!1194 k!2224) (size!31019 a!3219)))))

(declare-fun b!1003927 () Bool)

(declare-fun res!673400 () Bool)

(assert (=> b!1003927 (=> (not res!673400) (not e!565380))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63383 (_ BitVec 32)) Bool)

(assert (=> b!1003927 (= res!673400 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1003928 () Bool)

(assert (=> b!1003928 (= e!565380 e!565382)))

(declare-fun res!673405 () Bool)

(assert (=> b!1003928 (=> (not res!673405) (not e!565382))))

(assert (=> b!1003928 (= res!673405 (= lt!443920 lt!443921))))

(assert (=> b!1003928 (= lt!443921 (Intermediate!9449 false resIndex!38 resX!38))))

(assert (=> b!1003928 (= lt!443920 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30517 a!3219) j!170) mask!3464) (select (arr!30517 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1003929 () Bool)

(declare-fun res!673406 () Bool)

(assert (=> b!1003929 (=> (not res!673406) (not e!565383))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1003929 (= res!673406 (validKeyInArray!0 (select (arr!30517 a!3219) j!170)))))

(declare-fun b!1003930 () Bool)

(declare-fun res!673407 () Bool)

(assert (=> b!1003930 (=> (not res!673407) (not e!565383))))

(assert (=> b!1003930 (= res!673407 (validKeyInArray!0 k!2224))))

(declare-fun b!1003931 () Bool)

(declare-fun res!673402 () Bool)

(assert (=> b!1003931 (=> (not res!673402) (not e!565380))))

(assert (=> b!1003931 (= res!673402 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31019 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31019 a!3219))))))

(declare-fun res!673409 () Bool)

(assert (=> start!86582 (=> (not res!673409) (not e!565383))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86582 (= res!673409 (validMask!0 mask!3464))))

(assert (=> start!86582 e!565383))

(declare-fun array_inv!23641 (array!63383) Bool)

(assert (=> start!86582 (array_inv!23641 a!3219)))

(assert (=> start!86582 true))

(declare-fun b!1003932 () Bool)

(assert (=> b!1003932 (= e!565379 false)))

(declare-fun lt!443919 () SeekEntryResult!9449)

(assert (=> b!1003932 (= lt!443919 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!443916 lt!443914 lt!443917 mask!3464))))

(assert (= (and start!86582 res!673409) b!1003924))

(assert (= (and b!1003924 res!673404) b!1003929))

(assert (= (and b!1003929 res!673406) b!1003930))

(assert (= (and b!1003930 res!673407) b!1003923))

(assert (= (and b!1003923 res!673397) b!1003918))

(assert (= (and b!1003918 res!673395) b!1003927))

(assert (= (and b!1003927 res!673400) b!1003922))

(assert (= (and b!1003922 res!673408) b!1003931))

(assert (= (and b!1003931 res!673402) b!1003928))

(assert (= (and b!1003928 res!673405) b!1003921))

(assert (= (and b!1003921 res!673401) b!1003926))

(assert (= (and b!1003926 res!673398) b!1003917))

(assert (= (and b!1003917 res!673403) b!1003925))

(assert (= (and b!1003925 res!673410) b!1003919))

(assert (= (and b!1003919 res!673396) b!1003920))

(assert (= (and b!1003920 res!673399) b!1003932))

(declare-fun m!929549 () Bool)

(assert (=> b!1003923 m!929549))

(declare-fun m!929551 () Bool)

(assert (=> b!1003927 m!929551))

(declare-fun m!929553 () Bool)

(assert (=> b!1003918 m!929553))

(declare-fun m!929555 () Bool)

(assert (=> b!1003929 m!929555))

(assert (=> b!1003929 m!929555))

(declare-fun m!929557 () Bool)

(assert (=> b!1003929 m!929557))

(assert (=> b!1003928 m!929555))

(assert (=> b!1003928 m!929555))

(declare-fun m!929559 () Bool)

(assert (=> b!1003928 m!929559))

(assert (=> b!1003928 m!929559))

(assert (=> b!1003928 m!929555))

(declare-fun m!929561 () Bool)

(assert (=> b!1003928 m!929561))

(declare-fun m!929563 () Bool)

(assert (=> b!1003926 m!929563))

(assert (=> b!1003926 m!929563))

(declare-fun m!929565 () Bool)

(assert (=> b!1003926 m!929565))

(declare-fun m!929567 () Bool)

(assert (=> b!1003926 m!929567))

(declare-fun m!929569 () Bool)

(assert (=> b!1003926 m!929569))

(declare-fun m!929571 () Bool)

(assert (=> b!1003919 m!929571))

(declare-fun m!929573 () Bool)

(assert (=> b!1003922 m!929573))

(declare-fun m!929575 () Bool)

(assert (=> b!1003917 m!929575))

(declare-fun m!929577 () Bool)

(assert (=> b!1003930 m!929577))

(declare-fun m!929579 () Bool)

(assert (=> b!1003932 m!929579))

(assert (=> b!1003920 m!929555))

(assert (=> b!1003920 m!929555))

(declare-fun m!929581 () Bool)

(assert (=> b!1003920 m!929581))

(declare-fun m!929583 () Bool)

(assert (=> start!86582 m!929583))

(declare-fun m!929585 () Bool)

(assert (=> start!86582 m!929585))

(assert (=> b!1003921 m!929555))

(assert (=> b!1003921 m!929555))

(declare-fun m!929587 () Bool)

(assert (=> b!1003921 m!929587))

(push 1)

