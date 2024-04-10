; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86568 () Bool)

(assert start!86568)

(declare-fun b!1003581 () Bool)

(declare-fun res!673061 () Bool)

(declare-fun e!565236 () Bool)

(assert (=> b!1003581 (=> (not res!673061) (not e!565236))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1003581 (= res!673061 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1003582 () Bool)

(declare-fun res!673060 () Bool)

(declare-fun e!565235 () Bool)

(assert (=> b!1003582 (=> (not res!673060) (not e!565235))))

(declare-datatypes ((array!63369 0))(
  ( (array!63370 (arr!30510 (Array (_ BitVec 32) (_ BitVec 64))) (size!31012 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63369)

(declare-fun j!170 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9442 0))(
  ( (MissingZero!9442 (index!40139 (_ BitVec 32))) (Found!9442 (index!40140 (_ BitVec 32))) (Intermediate!9442 (undefined!10254 Bool) (index!40141 (_ BitVec 32)) (x!87542 (_ BitVec 32))) (Undefined!9442) (MissingVacant!9442 (index!40142 (_ BitVec 32))) )
))
(declare-fun lt!443752 () SeekEntryResult!9442)

(declare-fun lt!443746 () (_ BitVec 32))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63369 (_ BitVec 32)) SeekEntryResult!9442)

(assert (=> b!1003582 (= res!673060 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!443746 (select (arr!30510 a!3219) j!170) a!3219 mask!3464) lt!443752))))

(declare-fun b!1003583 () Bool)

(declare-fun res!673070 () Bool)

(declare-fun e!565232 () Bool)

(assert (=> b!1003583 (=> (not res!673070) (not e!565232))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63369 (_ BitVec 32)) Bool)

(assert (=> b!1003583 (= res!673070 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1003584 () Bool)

(declare-fun res!673065 () Bool)

(declare-fun e!565233 () Bool)

(assert (=> b!1003584 (=> (not res!673065) (not e!565233))))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!63369 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1003584 (= res!673065 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1003585 () Bool)

(declare-fun res!673059 () Bool)

(assert (=> b!1003585 (=> (not res!673059) (not e!565233))))

(assert (=> b!1003585 (= res!673059 (and (= (size!31012 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31012 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31012 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1003586 () Bool)

(declare-fun res!673067 () Bool)

(assert (=> b!1003586 (=> (not res!673067) (not e!565233))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1003586 (= res!673067 (validKeyInArray!0 (select (arr!30510 a!3219) j!170)))))

(declare-fun b!1003587 () Bool)

(assert (=> b!1003587 (= e!565235 false)))

(declare-fun lt!443753 () SeekEntryResult!9442)

(declare-fun lt!443750 () array!63369)

(declare-fun lt!443747 () (_ BitVec 64))

(assert (=> b!1003587 (= lt!443753 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!443746 lt!443747 lt!443750 mask!3464))))

(declare-fun b!1003588 () Bool)

(declare-fun res!673071 () Bool)

(assert (=> b!1003588 (=> (not res!673071) (not e!565236))))

(declare-fun lt!443748 () SeekEntryResult!9442)

(assert (=> b!1003588 (= res!673071 (not (= lt!443748 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!443747 lt!443750 mask!3464))))))

(declare-fun res!673069 () Bool)

(assert (=> start!86568 (=> (not res!673069) (not e!565233))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86568 (= res!673069 (validMask!0 mask!3464))))

(assert (=> start!86568 e!565233))

(declare-fun array_inv!23634 (array!63369) Bool)

(assert (=> start!86568 (array_inv!23634 a!3219)))

(assert (=> start!86568 true))

(declare-fun b!1003589 () Bool)

(declare-fun e!565237 () Bool)

(assert (=> b!1003589 (= e!565237 e!565236)))

(declare-fun res!673064 () Bool)

(assert (=> b!1003589 (=> (not res!673064) (not e!565236))))

(declare-fun lt!443749 () SeekEntryResult!9442)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1003589 (= res!673064 (not (= lt!443749 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!443747 mask!3464) lt!443747 lt!443750 mask!3464))))))

(assert (=> b!1003589 (= lt!443747 (select (store (arr!30510 a!3219) i!1194 k!2224) j!170))))

(assert (=> b!1003589 (= lt!443750 (array!63370 (store (arr!30510 a!3219) i!1194 k!2224) (size!31012 a!3219)))))

(declare-fun b!1003590 () Bool)

(declare-fun res!673063 () Bool)

(assert (=> b!1003590 (=> (not res!673063) (not e!565232))))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1003590 (= res!673063 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31012 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31012 a!3219))))))

(declare-fun b!1003591 () Bool)

(declare-fun res!673068 () Bool)

(assert (=> b!1003591 (=> (not res!673068) (not e!565233))))

(assert (=> b!1003591 (= res!673068 (validKeyInArray!0 k!2224))))

(declare-fun b!1003592 () Bool)

(declare-fun e!565231 () Bool)

(assert (=> b!1003592 (= e!565231 e!565237)))

(declare-fun res!673073 () Bool)

(assert (=> b!1003592 (=> (not res!673073) (not e!565237))))

(assert (=> b!1003592 (= res!673073 (= lt!443748 lt!443752))))

(assert (=> b!1003592 (= lt!443748 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30510 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1003593 () Bool)

(declare-fun res!673072 () Bool)

(assert (=> b!1003593 (=> (not res!673072) (not e!565232))))

(declare-datatypes ((List!21186 0))(
  ( (Nil!21183) (Cons!21182 (h!22359 (_ BitVec 64)) (t!30187 List!21186)) )
))
(declare-fun arrayNoDuplicates!0 (array!63369 (_ BitVec 32) List!21186) Bool)

(assert (=> b!1003593 (= res!673072 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21183))))

(declare-fun b!1003594 () Bool)

(assert (=> b!1003594 (= e!565233 e!565232)))

(declare-fun res!673062 () Bool)

(assert (=> b!1003594 (=> (not res!673062) (not e!565232))))

(declare-fun lt!443751 () SeekEntryResult!9442)

(assert (=> b!1003594 (= res!673062 (or (= lt!443751 (MissingVacant!9442 i!1194)) (= lt!443751 (MissingZero!9442 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63369 (_ BitVec 32)) SeekEntryResult!9442)

(assert (=> b!1003594 (= lt!443751 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!1003595 () Bool)

(assert (=> b!1003595 (= e!565232 e!565231)))

(declare-fun res!673066 () Bool)

(assert (=> b!1003595 (=> (not res!673066) (not e!565231))))

(assert (=> b!1003595 (= res!673066 (= lt!443749 lt!443752))))

(assert (=> b!1003595 (= lt!443752 (Intermediate!9442 false resIndex!38 resX!38))))

(assert (=> b!1003595 (= lt!443749 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30510 a!3219) j!170) mask!3464) (select (arr!30510 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1003596 () Bool)

(assert (=> b!1003596 (= e!565236 e!565235)))

(declare-fun res!673074 () Bool)

(assert (=> b!1003596 (=> (not res!673074) (not e!565235))))

(assert (=> b!1003596 (= res!673074 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1245) resX!38) (bvsge (bvadd #b00000000000000000000000000000001 x!1245) #b00000000000000000000000000000000) (bvsge lt!443746 #b00000000000000000000000000000000) (bvslt lt!443746 (size!31012 a!3219))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1003596 (= lt!443746 (nextIndex!0 index!1507 x!1245 mask!3464))))

(assert (= (and start!86568 res!673069) b!1003585))

(assert (= (and b!1003585 res!673059) b!1003586))

(assert (= (and b!1003586 res!673067) b!1003591))

(assert (= (and b!1003591 res!673068) b!1003584))

(assert (= (and b!1003584 res!673065) b!1003594))

(assert (= (and b!1003594 res!673062) b!1003583))

(assert (= (and b!1003583 res!673070) b!1003593))

(assert (= (and b!1003593 res!673072) b!1003590))

(assert (= (and b!1003590 res!673063) b!1003595))

(assert (= (and b!1003595 res!673066) b!1003592))

(assert (= (and b!1003592 res!673073) b!1003589))

(assert (= (and b!1003589 res!673064) b!1003588))

(assert (= (and b!1003588 res!673071) b!1003581))

(assert (= (and b!1003581 res!673061) b!1003596))

(assert (= (and b!1003596 res!673074) b!1003582))

(assert (= (and b!1003582 res!673060) b!1003587))

(declare-fun m!929269 () Bool)

(assert (=> b!1003587 m!929269))

(declare-fun m!929271 () Bool)

(assert (=> b!1003589 m!929271))

(assert (=> b!1003589 m!929271))

(declare-fun m!929273 () Bool)

(assert (=> b!1003589 m!929273))

(declare-fun m!929275 () Bool)

(assert (=> b!1003589 m!929275))

(declare-fun m!929277 () Bool)

(assert (=> b!1003589 m!929277))

(declare-fun m!929279 () Bool)

(assert (=> b!1003588 m!929279))

(declare-fun m!929281 () Bool)

(assert (=> b!1003582 m!929281))

(assert (=> b!1003582 m!929281))

(declare-fun m!929283 () Bool)

(assert (=> b!1003582 m!929283))

(declare-fun m!929285 () Bool)

(assert (=> b!1003583 m!929285))

(assert (=> b!1003592 m!929281))

(assert (=> b!1003592 m!929281))

(declare-fun m!929287 () Bool)

(assert (=> b!1003592 m!929287))

(assert (=> b!1003586 m!929281))

(assert (=> b!1003586 m!929281))

(declare-fun m!929289 () Bool)

(assert (=> b!1003586 m!929289))

(declare-fun m!929291 () Bool)

(assert (=> b!1003591 m!929291))

(declare-fun m!929293 () Bool)

(assert (=> b!1003593 m!929293))

(declare-fun m!929295 () Bool)

(assert (=> b!1003594 m!929295))

(declare-fun m!929297 () Bool)

(assert (=> start!86568 m!929297))

(declare-fun m!929299 () Bool)

(assert (=> start!86568 m!929299))

(declare-fun m!929301 () Bool)

(assert (=> b!1003584 m!929301))

(assert (=> b!1003595 m!929281))

(assert (=> b!1003595 m!929281))

(declare-fun m!929303 () Bool)

(assert (=> b!1003595 m!929303))

(assert (=> b!1003595 m!929303))

(assert (=> b!1003595 m!929281))

(declare-fun m!929305 () Bool)

(assert (=> b!1003595 m!929305))

(declare-fun m!929307 () Bool)

(assert (=> b!1003596 m!929307))

(push 1)

(assert (not b!1003593))

