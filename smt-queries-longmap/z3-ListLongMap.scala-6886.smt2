; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86800 () Bool)

(assert start!86800)

(declare-fun b!1004876 () Bool)

(declare-fun res!673597 () Bool)

(declare-fun e!566058 () Bool)

(assert (=> b!1004876 (=> (not res!673597) (not e!566058))))

(declare-datatypes ((array!63420 0))(
  ( (array!63421 (arr!30529 (Array (_ BitVec 32) (_ BitVec 64))) (size!31032 (_ BitVec 32))) )
))
(declare-fun lt!444257 () array!63420)

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun lt!444255 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!9397 0))(
  ( (MissingZero!9397 (index!39959 (_ BitVec 32))) (Found!9397 (index!39960 (_ BitVec 32))) (Intermediate!9397 (undefined!10209 Bool) (index!39961 (_ BitVec 32)) (x!87525 (_ BitVec 32))) (Undefined!9397) (MissingVacant!9397 (index!39962 (_ BitVec 32))) )
))
(declare-fun lt!444256 () SeekEntryResult!9397)

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63420 (_ BitVec 32)) SeekEntryResult!9397)

(assert (=> b!1004876 (= res!673597 (not (= lt!444256 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!444255 lt!444257 mask!3464))))))

(declare-fun b!1004877 () Bool)

(declare-fun res!673601 () Bool)

(declare-fun e!566057 () Bool)

(assert (=> b!1004877 (=> (not res!673601) (not e!566057))))

(declare-fun a!3219 () array!63420)

(declare-fun j!170 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1004877 (= res!673601 (validKeyInArray!0 (select (arr!30529 a!3219) j!170)))))

(declare-fun b!1004878 () Bool)

(declare-fun res!673605 () Bool)

(declare-fun e!566056 () Bool)

(assert (=> b!1004878 (=> (not res!673605) (not e!566056))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1004878 (= res!673605 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31032 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31032 a!3219))))))

(declare-fun b!1004879 () Bool)

(declare-fun e!566061 () Bool)

(assert (=> b!1004879 (= e!566056 e!566061)))

(declare-fun res!673607 () Bool)

(assert (=> b!1004879 (=> (not res!673607) (not e!566061))))

(declare-fun lt!444250 () SeekEntryResult!9397)

(declare-fun lt!444252 () SeekEntryResult!9397)

(assert (=> b!1004879 (= res!673607 (= lt!444250 lt!444252))))

(assert (=> b!1004879 (= lt!444252 (Intermediate!9397 false resIndex!38 resX!38))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1004879 (= lt!444250 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30529 a!3219) j!170) mask!3464) (select (arr!30529 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1004880 () Bool)

(declare-fun res!673595 () Bool)

(declare-fun e!566059 () Bool)

(assert (=> b!1004880 (=> (not res!673595) (not e!566059))))

(declare-fun lt!444253 () (_ BitVec 32))

(assert (=> b!1004880 (= res!673595 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!444253 (select (arr!30529 a!3219) j!170) a!3219 mask!3464) lt!444252))))

(declare-fun b!1004881 () Bool)

(declare-fun res!673600 () Bool)

(assert (=> b!1004881 (=> (not res!673600) (not e!566056))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63420 (_ BitVec 32)) Bool)

(assert (=> b!1004881 (= res!673600 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1004882 () Bool)

(declare-fun res!673602 () Bool)

(assert (=> b!1004882 (=> (not res!673602) (not e!566056))))

(declare-datatypes ((List!21176 0))(
  ( (Nil!21173) (Cons!21172 (h!22358 (_ BitVec 64)) (t!30169 List!21176)) )
))
(declare-fun arrayNoDuplicates!0 (array!63420 (_ BitVec 32) List!21176) Bool)

(assert (=> b!1004882 (= res!673602 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21173))))

(declare-fun b!1004883 () Bool)

(declare-fun res!673604 () Bool)

(assert (=> b!1004883 (=> (not res!673604) (not e!566057))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!63420 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1004883 (= res!673604 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1004884 () Bool)

(declare-fun res!673596 () Bool)

(assert (=> b!1004884 (=> (not res!673596) (not e!566058))))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1004884 (= res!673596 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1004885 () Bool)

(declare-fun res!673593 () Bool)

(assert (=> b!1004885 (=> (not res!673593) (not e!566057))))

(assert (=> b!1004885 (= res!673593 (validKeyInArray!0 k0!2224))))

(declare-fun b!1004886 () Bool)

(assert (=> b!1004886 (= e!566058 e!566059)))

(declare-fun res!673592 () Bool)

(assert (=> b!1004886 (=> (not res!673592) (not e!566059))))

(assert (=> b!1004886 (= res!673592 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1245) resX!38) (bvsge (bvadd #b00000000000000000000000000000001 x!1245) #b00000000000000000000000000000000) (bvsge lt!444253 #b00000000000000000000000000000000) (bvslt lt!444253 (size!31032 a!3219))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1004886 (= lt!444253 (nextIndex!0 index!1507 (bvadd #b00000000000000000000000000000001 x!1245) mask!3464))))

(declare-fun b!1004887 () Bool)

(declare-fun e!566060 () Bool)

(assert (=> b!1004887 (= e!566061 e!566060)))

(declare-fun res!673606 () Bool)

(assert (=> b!1004887 (=> (not res!673606) (not e!566060))))

(assert (=> b!1004887 (= res!673606 (= lt!444256 lt!444252))))

(assert (=> b!1004887 (= lt!444256 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30529 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1004888 () Bool)

(assert (=> b!1004888 (= e!566059 false)))

(declare-fun lt!444251 () SeekEntryResult!9397)

(assert (=> b!1004888 (= lt!444251 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!444253 lt!444255 lt!444257 mask!3464))))

(declare-fun b!1004875 () Bool)

(assert (=> b!1004875 (= e!566057 e!566056)))

(declare-fun res!673599 () Bool)

(assert (=> b!1004875 (=> (not res!673599) (not e!566056))))

(declare-fun lt!444254 () SeekEntryResult!9397)

(assert (=> b!1004875 (= res!673599 (or (= lt!444254 (MissingVacant!9397 i!1194)) (= lt!444254 (MissingZero!9397 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63420 (_ BitVec 32)) SeekEntryResult!9397)

(assert (=> b!1004875 (= lt!444254 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun res!673598 () Bool)

(assert (=> start!86800 (=> (not res!673598) (not e!566057))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86800 (= res!673598 (validMask!0 mask!3464))))

(assert (=> start!86800 e!566057))

(declare-fun array_inv!23665 (array!63420) Bool)

(assert (=> start!86800 (array_inv!23665 a!3219)))

(assert (=> start!86800 true))

(declare-fun b!1004889 () Bool)

(assert (=> b!1004889 (= e!566060 e!566058)))

(declare-fun res!673603 () Bool)

(assert (=> b!1004889 (=> (not res!673603) (not e!566058))))

(assert (=> b!1004889 (= res!673603 (not (= lt!444250 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!444255 mask!3464) lt!444255 lt!444257 mask!3464))))))

(assert (=> b!1004889 (= lt!444255 (select (store (arr!30529 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1004889 (= lt!444257 (array!63421 (store (arr!30529 a!3219) i!1194 k0!2224) (size!31032 a!3219)))))

(declare-fun b!1004890 () Bool)

(declare-fun res!673594 () Bool)

(assert (=> b!1004890 (=> (not res!673594) (not e!566057))))

(assert (=> b!1004890 (= res!673594 (and (= (size!31032 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31032 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31032 a!3219)) (not (= i!1194 j!170))))))

(assert (= (and start!86800 res!673598) b!1004890))

(assert (= (and b!1004890 res!673594) b!1004877))

(assert (= (and b!1004877 res!673601) b!1004885))

(assert (= (and b!1004885 res!673593) b!1004883))

(assert (= (and b!1004883 res!673604) b!1004875))

(assert (= (and b!1004875 res!673599) b!1004881))

(assert (= (and b!1004881 res!673600) b!1004882))

(assert (= (and b!1004882 res!673602) b!1004878))

(assert (= (and b!1004878 res!673605) b!1004879))

(assert (= (and b!1004879 res!673607) b!1004887))

(assert (= (and b!1004887 res!673606) b!1004889))

(assert (= (and b!1004889 res!673603) b!1004876))

(assert (= (and b!1004876 res!673597) b!1004884))

(assert (= (and b!1004884 res!673596) b!1004886))

(assert (= (and b!1004886 res!673592) b!1004880))

(assert (= (and b!1004880 res!673595) b!1004888))

(declare-fun m!930833 () Bool)

(assert (=> b!1004879 m!930833))

(assert (=> b!1004879 m!930833))

(declare-fun m!930835 () Bool)

(assert (=> b!1004879 m!930835))

(assert (=> b!1004879 m!930835))

(assert (=> b!1004879 m!930833))

(declare-fun m!930837 () Bool)

(assert (=> b!1004879 m!930837))

(declare-fun m!930839 () Bool)

(assert (=> b!1004875 m!930839))

(assert (=> b!1004887 m!930833))

(assert (=> b!1004887 m!930833))

(declare-fun m!930841 () Bool)

(assert (=> b!1004887 m!930841))

(declare-fun m!930843 () Bool)

(assert (=> b!1004881 m!930843))

(declare-fun m!930845 () Bool)

(assert (=> b!1004888 m!930845))

(declare-fun m!930847 () Bool)

(assert (=> b!1004885 m!930847))

(declare-fun m!930849 () Bool)

(assert (=> b!1004883 m!930849))

(assert (=> b!1004880 m!930833))

(assert (=> b!1004880 m!930833))

(declare-fun m!930851 () Bool)

(assert (=> b!1004880 m!930851))

(declare-fun m!930853 () Bool)

(assert (=> b!1004886 m!930853))

(declare-fun m!930855 () Bool)

(assert (=> b!1004882 m!930855))

(declare-fun m!930857 () Bool)

(assert (=> start!86800 m!930857))

(declare-fun m!930859 () Bool)

(assert (=> start!86800 m!930859))

(declare-fun m!930861 () Bool)

(assert (=> b!1004889 m!930861))

(assert (=> b!1004889 m!930861))

(declare-fun m!930863 () Bool)

(assert (=> b!1004889 m!930863))

(declare-fun m!930865 () Bool)

(assert (=> b!1004889 m!930865))

(declare-fun m!930867 () Bool)

(assert (=> b!1004889 m!930867))

(assert (=> b!1004877 m!930833))

(assert (=> b!1004877 m!930833))

(declare-fun m!930869 () Bool)

(assert (=> b!1004877 m!930869))

(declare-fun m!930871 () Bool)

(assert (=> b!1004876 m!930871))

(check-sat (not b!1004880) (not b!1004889) (not b!1004879) (not b!1004887) (not b!1004888) (not b!1004877) (not b!1004875) (not b!1004886) (not b!1004885) (not start!86800) (not b!1004883) (not b!1004882) (not b!1004881) (not b!1004876))
(check-sat)
