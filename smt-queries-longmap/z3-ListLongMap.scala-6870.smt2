; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86704 () Bool)

(assert start!86704)

(declare-fun b!1002571 () Bool)

(declare-fun e!565052 () Bool)

(declare-fun e!565050 () Bool)

(assert (=> b!1002571 (= e!565052 e!565050)))

(declare-fun res!671301 () Bool)

(assert (=> b!1002571 (=> (not res!671301) (not e!565050))))

(declare-datatypes ((SeekEntryResult!9349 0))(
  ( (MissingZero!9349 (index!39767 (_ BitVec 32))) (Found!9349 (index!39768 (_ BitVec 32))) (Intermediate!9349 (undefined!10161 Bool) (index!39769 (_ BitVec 32)) (x!87349 (_ BitVec 32))) (Undefined!9349) (MissingVacant!9349 (index!39770 (_ BitVec 32))) )
))
(declare-fun lt!443104 () SeekEntryResult!9349)

(declare-fun lt!443098 () SeekEntryResult!9349)

(assert (=> b!1002571 (= res!671301 (= lt!443104 lt!443098))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1002571 (= lt!443098 (Intermediate!9349 false resIndex!38 resX!38))))

(declare-datatypes ((array!63324 0))(
  ( (array!63325 (arr!30481 (Array (_ BitVec 32) (_ BitVec 64))) (size!30984 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63324)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63324 (_ BitVec 32)) SeekEntryResult!9349)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1002571 (= lt!443104 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30481 a!3219) j!170) mask!3464) (select (arr!30481 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1002572 () Bool)

(declare-fun res!671292 () Bool)

(assert (=> b!1002572 (=> (not res!671292) (not e!565052))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(assert (=> b!1002572 (= res!671292 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30984 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30984 a!3219))))))

(declare-fun b!1002573 () Bool)

(declare-fun e!565053 () Bool)

(assert (=> b!1002573 (= e!565053 e!565052)))

(declare-fun res!671303 () Bool)

(assert (=> b!1002573 (=> (not res!671303) (not e!565052))))

(declare-fun lt!443102 () SeekEntryResult!9349)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1002573 (= res!671303 (or (= lt!443102 (MissingVacant!9349 i!1194)) (= lt!443102 (MissingZero!9349 i!1194))))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63324 (_ BitVec 32)) SeekEntryResult!9349)

(assert (=> b!1002573 (= lt!443102 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1002574 () Bool)

(declare-fun e!565049 () Bool)

(declare-fun e!565048 () Bool)

(assert (=> b!1002574 (= e!565049 e!565048)))

(declare-fun res!671294 () Bool)

(assert (=> b!1002574 (=> (not res!671294) (not e!565048))))

(declare-fun lt!443103 () (_ BitVec 32))

(assert (=> b!1002574 (= res!671294 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1245) resX!38) (bvsge (bvadd #b00000000000000000000000000000001 x!1245) #b00000000000000000000000000000000) (bvsge lt!443103 #b00000000000000000000000000000000) (bvslt lt!443103 (size!30984 a!3219))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1002574 (= lt!443103 (nextIndex!0 index!1507 (bvadd #b00000000000000000000000000000001 x!1245) mask!3464))))

(declare-fun b!1002575 () Bool)

(declare-fun res!671293 () Bool)

(assert (=> b!1002575 (=> (not res!671293) (not e!565048))))

(assert (=> b!1002575 (= res!671293 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!443103 (select (arr!30481 a!3219) j!170) a!3219 mask!3464) lt!443098))))

(declare-fun b!1002576 () Bool)

(declare-fun e!565051 () Bool)

(assert (=> b!1002576 (= e!565050 e!565051)))

(declare-fun res!671302 () Bool)

(assert (=> b!1002576 (=> (not res!671302) (not e!565051))))

(declare-fun lt!443105 () SeekEntryResult!9349)

(assert (=> b!1002576 (= res!671302 (= lt!443105 lt!443098))))

(assert (=> b!1002576 (= lt!443105 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30481 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1002577 () Bool)

(declare-fun res!671295 () Bool)

(assert (=> b!1002577 (=> (not res!671295) (not e!565049))))

(declare-fun lt!443101 () (_ BitVec 64))

(declare-fun lt!443100 () array!63324)

(assert (=> b!1002577 (= res!671295 (not (= lt!443105 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!443101 lt!443100 mask!3464))))))

(declare-fun b!1002578 () Bool)

(declare-fun res!671300 () Bool)

(assert (=> b!1002578 (=> (not res!671300) (not e!565053))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1002578 (= res!671300 (validKeyInArray!0 (select (arr!30481 a!3219) j!170)))))

(declare-fun b!1002579 () Bool)

(declare-fun res!671298 () Bool)

(assert (=> b!1002579 (=> (not res!671298) (not e!565052))))

(declare-datatypes ((List!21128 0))(
  ( (Nil!21125) (Cons!21124 (h!22310 (_ BitVec 64)) (t!30121 List!21128)) )
))
(declare-fun arrayNoDuplicates!0 (array!63324 (_ BitVec 32) List!21128) Bool)

(assert (=> b!1002579 (= res!671298 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21125))))

(declare-fun res!671297 () Bool)

(assert (=> start!86704 (=> (not res!671297) (not e!565053))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86704 (= res!671297 (validMask!0 mask!3464))))

(assert (=> start!86704 e!565053))

(declare-fun array_inv!23617 (array!63324) Bool)

(assert (=> start!86704 (array_inv!23617 a!3219)))

(assert (=> start!86704 true))

(declare-fun b!1002580 () Bool)

(assert (=> b!1002580 (= e!565051 e!565049)))

(declare-fun res!671289 () Bool)

(assert (=> b!1002580 (=> (not res!671289) (not e!565049))))

(assert (=> b!1002580 (= res!671289 (not (= lt!443104 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!443101 mask!3464) lt!443101 lt!443100 mask!3464))))))

(assert (=> b!1002580 (= lt!443101 (select (store (arr!30481 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1002580 (= lt!443100 (array!63325 (store (arr!30481 a!3219) i!1194 k0!2224) (size!30984 a!3219)))))

(declare-fun b!1002581 () Bool)

(declare-fun res!671291 () Bool)

(assert (=> b!1002581 (=> (not res!671291) (not e!565053))))

(assert (=> b!1002581 (= res!671291 (and (= (size!30984 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30984 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30984 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1002582 () Bool)

(declare-fun res!671290 () Bool)

(assert (=> b!1002582 (=> (not res!671290) (not e!565053))))

(declare-fun arrayContainsKey!0 (array!63324 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1002582 (= res!671290 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1002583 () Bool)

(declare-fun res!671296 () Bool)

(assert (=> b!1002583 (=> (not res!671296) (not e!565053))))

(assert (=> b!1002583 (= res!671296 (validKeyInArray!0 k0!2224))))

(declare-fun b!1002584 () Bool)

(declare-fun res!671299 () Bool)

(assert (=> b!1002584 (=> (not res!671299) (not e!565049))))

(assert (=> b!1002584 (= res!671299 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1002585 () Bool)

(assert (=> b!1002585 (= e!565048 false)))

(declare-fun lt!443099 () SeekEntryResult!9349)

(assert (=> b!1002585 (= lt!443099 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!443103 lt!443101 lt!443100 mask!3464))))

(declare-fun b!1002586 () Bool)

(declare-fun res!671288 () Bool)

(assert (=> b!1002586 (=> (not res!671288) (not e!565052))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63324 (_ BitVec 32)) Bool)

(assert (=> b!1002586 (= res!671288 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(assert (= (and start!86704 res!671297) b!1002581))

(assert (= (and b!1002581 res!671291) b!1002578))

(assert (= (and b!1002578 res!671300) b!1002583))

(assert (= (and b!1002583 res!671296) b!1002582))

(assert (= (and b!1002582 res!671290) b!1002573))

(assert (= (and b!1002573 res!671303) b!1002586))

(assert (= (and b!1002586 res!671288) b!1002579))

(assert (= (and b!1002579 res!671298) b!1002572))

(assert (= (and b!1002572 res!671292) b!1002571))

(assert (= (and b!1002571 res!671301) b!1002576))

(assert (= (and b!1002576 res!671302) b!1002580))

(assert (= (and b!1002580 res!671289) b!1002577))

(assert (= (and b!1002577 res!671295) b!1002584))

(assert (= (and b!1002584 res!671299) b!1002574))

(assert (= (and b!1002574 res!671294) b!1002575))

(assert (= (and b!1002575 res!671293) b!1002585))

(declare-fun m!928913 () Bool)

(assert (=> b!1002582 m!928913))

(declare-fun m!928915 () Bool)

(assert (=> b!1002571 m!928915))

(assert (=> b!1002571 m!928915))

(declare-fun m!928917 () Bool)

(assert (=> b!1002571 m!928917))

(assert (=> b!1002571 m!928917))

(assert (=> b!1002571 m!928915))

(declare-fun m!928919 () Bool)

(assert (=> b!1002571 m!928919))

(declare-fun m!928921 () Bool)

(assert (=> start!86704 m!928921))

(declare-fun m!928923 () Bool)

(assert (=> start!86704 m!928923))

(declare-fun m!928925 () Bool)

(assert (=> b!1002577 m!928925))

(assert (=> b!1002576 m!928915))

(assert (=> b!1002576 m!928915))

(declare-fun m!928927 () Bool)

(assert (=> b!1002576 m!928927))

(declare-fun m!928929 () Bool)

(assert (=> b!1002580 m!928929))

(assert (=> b!1002580 m!928929))

(declare-fun m!928931 () Bool)

(assert (=> b!1002580 m!928931))

(declare-fun m!928933 () Bool)

(assert (=> b!1002580 m!928933))

(declare-fun m!928935 () Bool)

(assert (=> b!1002580 m!928935))

(declare-fun m!928937 () Bool)

(assert (=> b!1002573 m!928937))

(declare-fun m!928939 () Bool)

(assert (=> b!1002586 m!928939))

(declare-fun m!928941 () Bool)

(assert (=> b!1002574 m!928941))

(declare-fun m!928943 () Bool)

(assert (=> b!1002583 m!928943))

(declare-fun m!928945 () Bool)

(assert (=> b!1002585 m!928945))

(assert (=> b!1002575 m!928915))

(assert (=> b!1002575 m!928915))

(declare-fun m!928947 () Bool)

(assert (=> b!1002575 m!928947))

(assert (=> b!1002578 m!928915))

(assert (=> b!1002578 m!928915))

(declare-fun m!928949 () Bool)

(assert (=> b!1002578 m!928949))

(declare-fun m!928951 () Bool)

(assert (=> b!1002579 m!928951))

(check-sat (not b!1002577) (not b!1002586) (not b!1002579) (not b!1002580) (not b!1002583) (not b!1002571) (not b!1002576) (not b!1002574) (not b!1002573) (not b!1002585) (not b!1002578) (not b!1002575) (not b!1002582) (not start!86704))
(check-sat)
