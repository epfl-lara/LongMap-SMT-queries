; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86910 () Bool)

(assert start!86910)

(declare-fun b!1007835 () Bool)

(declare-fun e!567120 () Bool)

(declare-fun e!567122 () Bool)

(assert (=> b!1007835 (= e!567120 e!567122)))

(declare-fun res!676857 () Bool)

(assert (=> b!1007835 (=> (not res!676857) (not e!567122))))

(declare-datatypes ((SeekEntryResult!9530 0))(
  ( (MissingZero!9530 (index!40491 (_ BitVec 32))) (Found!9530 (index!40492 (_ BitVec 32))) (Intermediate!9530 (undefined!10342 Bool) (index!40493 (_ BitVec 32)) (x!87899 (_ BitVec 32))) (Undefined!9530) (MissingVacant!9530 (index!40494 (_ BitVec 32))) )
))
(declare-fun lt!445276 () SeekEntryResult!9530)

(declare-fun lt!445275 () SeekEntryResult!9530)

(assert (=> b!1007835 (= res!676857 (= lt!445276 lt!445275))))

(declare-datatypes ((array!63505 0))(
  ( (array!63506 (arr!30573 (Array (_ BitVec 32) (_ BitVec 64))) (size!31077 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63505)

(declare-fun j!170 () (_ BitVec 32))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63505 (_ BitVec 32)) SeekEntryResult!9530)

(assert (=> b!1007835 (= lt!445276 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30573 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1007836 () Bool)

(declare-fun res!676858 () Bool)

(declare-fun e!567118 () Bool)

(assert (=> b!1007836 (=> (not res!676858) (not e!567118))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!63505 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1007836 (= res!676858 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1007837 () Bool)

(declare-fun res!676859 () Bool)

(declare-fun e!567121 () Bool)

(assert (=> b!1007837 (=> (not res!676859) (not e!567121))))

(declare-datatypes ((List!21315 0))(
  ( (Nil!21312) (Cons!21311 (h!22497 (_ BitVec 64)) (t!30307 List!21315)) )
))
(declare-fun arrayNoDuplicates!0 (array!63505 (_ BitVec 32) List!21315) Bool)

(assert (=> b!1007837 (= res!676859 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21312))))

(declare-fun b!1007838 () Bool)

(declare-fun e!567117 () Bool)

(assert (=> b!1007838 (= e!567122 e!567117)))

(declare-fun res!676862 () Bool)

(assert (=> b!1007838 (=> (not res!676862) (not e!567117))))

(declare-fun lt!445278 () (_ BitVec 64))

(declare-fun lt!445274 () SeekEntryResult!9530)

(declare-fun lt!445273 () array!63505)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1007838 (= res!676862 (not (= lt!445274 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!445278 mask!3464) lt!445278 lt!445273 mask!3464))))))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1007838 (= lt!445278 (select (store (arr!30573 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1007838 (= lt!445273 (array!63506 (store (arr!30573 a!3219) i!1194 k0!2224) (size!31077 a!3219)))))

(declare-fun b!1007839 () Bool)

(declare-fun res!676855 () Bool)

(assert (=> b!1007839 (=> (not res!676855) (not e!567118))))

(assert (=> b!1007839 (= res!676855 (and (= (size!31077 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31077 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31077 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1007840 () Bool)

(declare-fun res!676854 () Bool)

(assert (=> b!1007840 (=> (not res!676854) (not e!567117))))

(assert (=> b!1007840 (= res!676854 (not (= lt!445276 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!445278 lt!445273 mask!3464))))))

(declare-fun b!1007841 () Bool)

(declare-fun res!676863 () Bool)

(assert (=> b!1007841 (=> (not res!676863) (not e!567118))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1007841 (= res!676863 (validKeyInArray!0 (select (arr!30573 a!3219) j!170)))))

(declare-fun b!1007842 () Bool)

(assert (=> b!1007842 (= e!567118 e!567121)))

(declare-fun res!676861 () Bool)

(assert (=> b!1007842 (=> (not res!676861) (not e!567121))))

(declare-fun lt!445277 () SeekEntryResult!9530)

(assert (=> b!1007842 (= res!676861 (or (= lt!445277 (MissingVacant!9530 i!1194)) (= lt!445277 (MissingZero!9530 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63505 (_ BitVec 32)) SeekEntryResult!9530)

(assert (=> b!1007842 (= lt!445277 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun res!676860 () Bool)

(assert (=> start!86910 (=> (not res!676860) (not e!567118))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86910 (= res!676860 (validMask!0 mask!3464))))

(assert (=> start!86910 e!567118))

(declare-fun array_inv!23716 (array!63505) Bool)

(assert (=> start!86910 (array_inv!23716 a!3219)))

(assert (=> start!86910 true))

(declare-fun b!1007843 () Bool)

(declare-fun res!676856 () Bool)

(assert (=> b!1007843 (=> (not res!676856) (not e!567118))))

(assert (=> b!1007843 (= res!676856 (validKeyInArray!0 k0!2224))))

(declare-fun b!1007844 () Bool)

(assert (=> b!1007844 (= e!567117 false)))

(declare-fun lt!445279 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1007844 (= lt!445279 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun b!1007845 () Bool)

(declare-fun res!676852 () Bool)

(assert (=> b!1007845 (=> (not res!676852) (not e!567121))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63505 (_ BitVec 32)) Bool)

(assert (=> b!1007845 (= res!676852 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1007846 () Bool)

(declare-fun res!676853 () Bool)

(assert (=> b!1007846 (=> (not res!676853) (not e!567117))))

(declare-fun resIndex!38 () (_ BitVec 32))

(assert (=> b!1007846 (= res!676853 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1007847 () Bool)

(declare-fun res!676865 () Bool)

(assert (=> b!1007847 (=> (not res!676865) (not e!567121))))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1007847 (= res!676865 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31077 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31077 a!3219))))))

(declare-fun b!1007848 () Bool)

(assert (=> b!1007848 (= e!567121 e!567120)))

(declare-fun res!676864 () Bool)

(assert (=> b!1007848 (=> (not res!676864) (not e!567120))))

(assert (=> b!1007848 (= res!676864 (= lt!445274 lt!445275))))

(assert (=> b!1007848 (= lt!445275 (Intermediate!9530 false resIndex!38 resX!38))))

(assert (=> b!1007848 (= lt!445274 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30573 a!3219) j!170) mask!3464) (select (arr!30573 a!3219) j!170) a!3219 mask!3464))))

(assert (= (and start!86910 res!676860) b!1007839))

(assert (= (and b!1007839 res!676855) b!1007841))

(assert (= (and b!1007841 res!676863) b!1007843))

(assert (= (and b!1007843 res!676856) b!1007836))

(assert (= (and b!1007836 res!676858) b!1007842))

(assert (= (and b!1007842 res!676861) b!1007845))

(assert (= (and b!1007845 res!676852) b!1007837))

(assert (= (and b!1007837 res!676859) b!1007847))

(assert (= (and b!1007847 res!676865) b!1007848))

(assert (= (and b!1007848 res!676864) b!1007835))

(assert (= (and b!1007835 res!676857) b!1007838))

(assert (= (and b!1007838 res!676862) b!1007840))

(assert (= (and b!1007840 res!676854) b!1007846))

(assert (= (and b!1007846 res!676853) b!1007844))

(declare-fun m!932125 () Bool)

(assert (=> b!1007848 m!932125))

(assert (=> b!1007848 m!932125))

(declare-fun m!932127 () Bool)

(assert (=> b!1007848 m!932127))

(assert (=> b!1007848 m!932127))

(assert (=> b!1007848 m!932125))

(declare-fun m!932129 () Bool)

(assert (=> b!1007848 m!932129))

(declare-fun m!932131 () Bool)

(assert (=> start!86910 m!932131))

(declare-fun m!932133 () Bool)

(assert (=> start!86910 m!932133))

(declare-fun m!932135 () Bool)

(assert (=> b!1007836 m!932135))

(declare-fun m!932137 () Bool)

(assert (=> b!1007838 m!932137))

(assert (=> b!1007838 m!932137))

(declare-fun m!932139 () Bool)

(assert (=> b!1007838 m!932139))

(declare-fun m!932141 () Bool)

(assert (=> b!1007838 m!932141))

(declare-fun m!932143 () Bool)

(assert (=> b!1007838 m!932143))

(declare-fun m!932145 () Bool)

(assert (=> b!1007842 m!932145))

(declare-fun m!932147 () Bool)

(assert (=> b!1007843 m!932147))

(declare-fun m!932149 () Bool)

(assert (=> b!1007845 m!932149))

(declare-fun m!932151 () Bool)

(assert (=> b!1007840 m!932151))

(assert (=> b!1007835 m!932125))

(assert (=> b!1007835 m!932125))

(declare-fun m!932153 () Bool)

(assert (=> b!1007835 m!932153))

(declare-fun m!932155 () Bool)

(assert (=> b!1007837 m!932155))

(assert (=> b!1007841 m!932125))

(assert (=> b!1007841 m!932125))

(declare-fun m!932157 () Bool)

(assert (=> b!1007841 m!932157))

(declare-fun m!932159 () Bool)

(assert (=> b!1007844 m!932159))

(check-sat (not b!1007842) (not b!1007848) (not b!1007838) (not b!1007835) (not b!1007841) (not b!1007845) (not b!1007844) (not b!1007836) (not b!1007840) (not b!1007837) (not b!1007843) (not start!86910))
(check-sat)
