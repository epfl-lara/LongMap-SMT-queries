; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86526 () Bool)

(assert start!86526)

(declare-fun b!1002547 () Bool)

(declare-fun res!672159 () Bool)

(declare-fun e!564745 () Bool)

(assert (=> b!1002547 (=> (not res!672159) (not e!564745))))

(declare-datatypes ((array!63274 0))(
  ( (array!63275 (arr!30462 (Array (_ BitVec 32) (_ BitVec 64))) (size!30966 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63274)

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1002547 (= res!672159 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30966 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30966 a!3219))))))

(declare-fun b!1002548 () Bool)

(declare-fun e!564749 () Bool)

(assert (=> b!1002548 (= e!564745 e!564749)))

(declare-fun res!672162 () Bool)

(assert (=> b!1002548 (=> (not res!672162) (not e!564749))))

(declare-datatypes ((SeekEntryResult!9419 0))(
  ( (MissingZero!9419 (index!40047 (_ BitVec 32))) (Found!9419 (index!40048 (_ BitVec 32))) (Intermediate!9419 (undefined!10231 Bool) (index!40049 (_ BitVec 32)) (x!87474 (_ BitVec 32))) (Undefined!9419) (MissingVacant!9419 (index!40050 (_ BitVec 32))) )
))
(declare-fun lt!443107 () SeekEntryResult!9419)

(declare-fun lt!443108 () SeekEntryResult!9419)

(assert (=> b!1002548 (= res!672162 (= lt!443107 lt!443108))))

(assert (=> b!1002548 (= lt!443108 (Intermediate!9419 false resIndex!38 resX!38))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63274 (_ BitVec 32)) SeekEntryResult!9419)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1002548 (= lt!443107 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30462 a!3219) j!170) mask!3464) (select (arr!30462 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1002549 () Bool)

(declare-fun e!564747 () Bool)

(assert (=> b!1002549 (= e!564747 e!564745)))

(declare-fun res!672149 () Bool)

(assert (=> b!1002549 (=> (not res!672149) (not e!564745))))

(declare-fun lt!443106 () SeekEntryResult!9419)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1002549 (= res!672149 (or (= lt!443106 (MissingVacant!9419 i!1194)) (= lt!443106 (MissingZero!9419 i!1194))))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63274 (_ BitVec 32)) SeekEntryResult!9419)

(assert (=> b!1002549 (= lt!443106 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1002551 () Bool)

(declare-fun res!672164 () Bool)

(assert (=> b!1002551 (=> (not res!672164) (not e!564745))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63274 (_ BitVec 32)) Bool)

(assert (=> b!1002551 (= res!672164 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1002552 () Bool)

(declare-fun e!564746 () Bool)

(declare-fun e!564743 () Bool)

(assert (=> b!1002552 (= e!564746 e!564743)))

(declare-fun res!672152 () Bool)

(assert (=> b!1002552 (=> (not res!672152) (not e!564743))))

(declare-fun lt!443112 () (_ BitVec 32))

(assert (=> b!1002552 (= res!672152 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1245) resX!38) (bvsge (bvadd #b00000000000000000000000000000001 x!1245) #b00000000000000000000000000000000) (bvsge lt!443112 #b00000000000000000000000000000000) (bvslt lt!443112 (size!30966 a!3219))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1002552 (= lt!443112 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun b!1002553 () Bool)

(declare-fun res!672158 () Bool)

(assert (=> b!1002553 (=> (not res!672158) (not e!564746))))

(assert (=> b!1002553 (= res!672158 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1002554 () Bool)

(declare-fun res!672155 () Bool)

(assert (=> b!1002554 (=> (not res!672155) (not e!564745))))

(declare-datatypes ((List!21204 0))(
  ( (Nil!21201) (Cons!21200 (h!22377 (_ BitVec 64)) (t!30196 List!21204)) )
))
(declare-fun arrayNoDuplicates!0 (array!63274 (_ BitVec 32) List!21204) Bool)

(assert (=> b!1002554 (= res!672155 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21201))))

(declare-fun b!1002555 () Bool)

(declare-fun res!672153 () Bool)

(assert (=> b!1002555 (=> (not res!672153) (not e!564747))))

(declare-fun arrayContainsKey!0 (array!63274 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1002555 (= res!672153 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1002556 () Bool)

(declare-fun res!672163 () Bool)

(assert (=> b!1002556 (=> (not res!672163) (not e!564743))))

(assert (=> b!1002556 (= res!672163 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!443112 (select (arr!30462 a!3219) j!170) a!3219 mask!3464) lt!443108))))

(declare-fun b!1002557 () Bool)

(declare-fun res!672160 () Bool)

(assert (=> b!1002557 (=> (not res!672160) (not e!564747))))

(assert (=> b!1002557 (= res!672160 (and (= (size!30966 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30966 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30966 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1002558 () Bool)

(declare-fun e!564748 () Bool)

(assert (=> b!1002558 (= e!564749 e!564748)))

(declare-fun res!672151 () Bool)

(assert (=> b!1002558 (=> (not res!672151) (not e!564748))))

(declare-fun lt!443109 () SeekEntryResult!9419)

(assert (=> b!1002558 (= res!672151 (= lt!443109 lt!443108))))

(assert (=> b!1002558 (= lt!443109 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30462 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1002559 () Bool)

(declare-fun res!672154 () Bool)

(assert (=> b!1002559 (=> (not res!672154) (not e!564746))))

(declare-fun lt!443110 () (_ BitVec 64))

(declare-fun lt!443113 () array!63274)

(assert (=> b!1002559 (= res!672154 (not (= lt!443109 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!443110 lt!443113 mask!3464))))))

(declare-fun b!1002560 () Bool)

(assert (=> b!1002560 (= e!564748 e!564746)))

(declare-fun res!672157 () Bool)

(assert (=> b!1002560 (=> (not res!672157) (not e!564746))))

(assert (=> b!1002560 (= res!672157 (not (= lt!443107 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!443110 mask!3464) lt!443110 lt!443113 mask!3464))))))

(assert (=> b!1002560 (= lt!443110 (select (store (arr!30462 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1002560 (= lt!443113 (array!63275 (store (arr!30462 a!3219) i!1194 k0!2224) (size!30966 a!3219)))))

(declare-fun b!1002561 () Bool)

(assert (=> b!1002561 (= e!564743 false)))

(declare-fun lt!443111 () SeekEntryResult!9419)

(assert (=> b!1002561 (= lt!443111 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!443112 lt!443110 lt!443113 mask!3464))))

(declare-fun b!1002562 () Bool)

(declare-fun res!672161 () Bool)

(assert (=> b!1002562 (=> (not res!672161) (not e!564747))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1002562 (= res!672161 (validKeyInArray!0 (select (arr!30462 a!3219) j!170)))))

(declare-fun b!1002550 () Bool)

(declare-fun res!672156 () Bool)

(assert (=> b!1002550 (=> (not res!672156) (not e!564747))))

(assert (=> b!1002550 (= res!672156 (validKeyInArray!0 k0!2224))))

(declare-fun res!672150 () Bool)

(assert (=> start!86526 (=> (not res!672150) (not e!564747))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86526 (= res!672150 (validMask!0 mask!3464))))

(assert (=> start!86526 e!564747))

(declare-fun array_inv!23605 (array!63274) Bool)

(assert (=> start!86526 (array_inv!23605 a!3219)))

(assert (=> start!86526 true))

(assert (= (and start!86526 res!672150) b!1002557))

(assert (= (and b!1002557 res!672160) b!1002562))

(assert (= (and b!1002562 res!672161) b!1002550))

(assert (= (and b!1002550 res!672156) b!1002555))

(assert (= (and b!1002555 res!672153) b!1002549))

(assert (= (and b!1002549 res!672149) b!1002551))

(assert (= (and b!1002551 res!672164) b!1002554))

(assert (= (and b!1002554 res!672155) b!1002547))

(assert (= (and b!1002547 res!672159) b!1002548))

(assert (= (and b!1002548 res!672162) b!1002558))

(assert (= (and b!1002558 res!672151) b!1002560))

(assert (= (and b!1002560 res!672157) b!1002559))

(assert (= (and b!1002559 res!672154) b!1002553))

(assert (= (and b!1002553 res!672158) b!1002552))

(assert (= (and b!1002552 res!672152) b!1002556))

(assert (= (and b!1002556 res!672163) b!1002561))

(declare-fun m!927859 () Bool)

(assert (=> b!1002549 m!927859))

(declare-fun m!927861 () Bool)

(assert (=> b!1002548 m!927861))

(assert (=> b!1002548 m!927861))

(declare-fun m!927863 () Bool)

(assert (=> b!1002548 m!927863))

(assert (=> b!1002548 m!927863))

(assert (=> b!1002548 m!927861))

(declare-fun m!927865 () Bool)

(assert (=> b!1002548 m!927865))

(declare-fun m!927867 () Bool)

(assert (=> start!86526 m!927867))

(declare-fun m!927869 () Bool)

(assert (=> start!86526 m!927869))

(declare-fun m!927871 () Bool)

(assert (=> b!1002550 m!927871))

(declare-fun m!927873 () Bool)

(assert (=> b!1002561 m!927873))

(assert (=> b!1002558 m!927861))

(assert (=> b!1002558 m!927861))

(declare-fun m!927875 () Bool)

(assert (=> b!1002558 m!927875))

(declare-fun m!927877 () Bool)

(assert (=> b!1002551 m!927877))

(declare-fun m!927879 () Bool)

(assert (=> b!1002560 m!927879))

(assert (=> b!1002560 m!927879))

(declare-fun m!927881 () Bool)

(assert (=> b!1002560 m!927881))

(declare-fun m!927883 () Bool)

(assert (=> b!1002560 m!927883))

(declare-fun m!927885 () Bool)

(assert (=> b!1002560 m!927885))

(assert (=> b!1002562 m!927861))

(assert (=> b!1002562 m!927861))

(declare-fun m!927887 () Bool)

(assert (=> b!1002562 m!927887))

(declare-fun m!927889 () Bool)

(assert (=> b!1002552 m!927889))

(declare-fun m!927891 () Bool)

(assert (=> b!1002555 m!927891))

(declare-fun m!927893 () Bool)

(assert (=> b!1002554 m!927893))

(assert (=> b!1002556 m!927861))

(assert (=> b!1002556 m!927861))

(declare-fun m!927895 () Bool)

(assert (=> b!1002556 m!927895))

(declare-fun m!927897 () Bool)

(assert (=> b!1002559 m!927897))

(check-sat (not b!1002548) (not start!86526) (not b!1002552) (not b!1002551) (not b!1002561) (not b!1002555) (not b!1002549) (not b!1002550) (not b!1002560) (not b!1002562) (not b!1002558) (not b!1002559) (not b!1002554) (not b!1002556))
(check-sat)
