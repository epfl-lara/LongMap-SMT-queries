; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86440 () Bool)

(assert start!86440)

(declare-fun b!1000670 () Bool)

(declare-fun e!563971 () Bool)

(declare-fun e!563974 () Bool)

(assert (=> b!1000670 (= e!563971 e!563974)))

(declare-fun res!670147 () Bool)

(assert (=> b!1000670 (=> (not res!670147) (not e!563974))))

(declare-datatypes ((SeekEntryResult!9378 0))(
  ( (MissingZero!9378 (index!39883 (_ BitVec 32))) (Found!9378 (index!39884 (_ BitVec 32))) (Intermediate!9378 (undefined!10190 Bool) (index!39885 (_ BitVec 32)) (x!87310 (_ BitVec 32))) (Undefined!9378) (MissingVacant!9378 (index!39886 (_ BitVec 32))) )
))
(declare-fun lt!442347 () SeekEntryResult!9378)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1000670 (= res!670147 (or (= lt!442347 (MissingVacant!9378 i!1194)) (= lt!442347 (MissingZero!9378 i!1194))))))

(declare-datatypes ((array!63241 0))(
  ( (array!63242 (arr!30446 (Array (_ BitVec 32) (_ BitVec 64))) (size!30948 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63241)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63241 (_ BitVec 32)) SeekEntryResult!9378)

(assert (=> b!1000670 (= lt!442347 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1000671 () Bool)

(declare-fun res!670148 () Bool)

(assert (=> b!1000671 (=> (not res!670148) (not e!563974))))

(declare-datatypes ((List!21122 0))(
  ( (Nil!21119) (Cons!21118 (h!22295 (_ BitVec 64)) (t!30123 List!21122)) )
))
(declare-fun arrayNoDuplicates!0 (array!63241 (_ BitVec 32) List!21122) Bool)

(assert (=> b!1000671 (= res!670148 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21119))))

(declare-fun b!1000672 () Bool)

(declare-fun res!670158 () Bool)

(assert (=> b!1000672 (=> (not res!670158) (not e!563974))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(assert (=> b!1000672 (= res!670158 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30948 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30948 a!3219))))))

(declare-fun e!563972 () Bool)

(declare-fun b!1000673 () Bool)

(assert (=> b!1000673 (= e!563972 (and (bvsge mask!3464 #b00000000000000000000000000000000) (bvslt index!1507 (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsgt x!1245 #b01111111111111111111111111111110)))))

(declare-fun b!1000674 () Bool)

(declare-fun res!670156 () Bool)

(assert (=> b!1000674 (=> (not res!670156) (not e!563971))))

(declare-fun j!170 () (_ BitVec 32))

(assert (=> b!1000674 (= res!670156 (and (= (size!30948 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30948 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30948 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1000675 () Bool)

(declare-fun res!670157 () Bool)

(assert (=> b!1000675 (=> (not res!670157) (not e!563972))))

(declare-fun lt!442349 () SeekEntryResult!9378)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63241 (_ BitVec 32)) SeekEntryResult!9378)

(assert (=> b!1000675 (= res!670157 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30446 a!3219) j!170) a!3219 mask!3464) lt!442349))))

(declare-fun b!1000676 () Bool)

(declare-fun res!670153 () Bool)

(assert (=> b!1000676 (=> (not res!670153) (not e!563971))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1000676 (= res!670153 (validKeyInArray!0 (select (arr!30446 a!3219) j!170)))))

(declare-fun b!1000677 () Bool)

(declare-fun res!670154 () Bool)

(assert (=> b!1000677 (=> (not res!670154) (not e!563971))))

(declare-fun arrayContainsKey!0 (array!63241 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1000677 (= res!670154 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1000678 () Bool)

(declare-fun res!670152 () Bool)

(assert (=> b!1000678 (=> (not res!670152) (not e!563971))))

(assert (=> b!1000678 (= res!670152 (validKeyInArray!0 k0!2224))))

(declare-fun b!1000669 () Bool)

(declare-fun res!670149 () Bool)

(assert (=> b!1000669 (=> (not res!670149) (not e!563974))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63241 (_ BitVec 32)) Bool)

(assert (=> b!1000669 (= res!670149 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun res!670150 () Bool)

(assert (=> start!86440 (=> (not res!670150) (not e!563971))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86440 (= res!670150 (validMask!0 mask!3464))))

(assert (=> start!86440 e!563971))

(declare-fun array_inv!23570 (array!63241) Bool)

(assert (=> start!86440 (array_inv!23570 a!3219)))

(assert (=> start!86440 true))

(declare-fun b!1000679 () Bool)

(declare-fun res!670155 () Bool)

(assert (=> b!1000679 (=> (not res!670155) (not e!563972))))

(declare-fun lt!442348 () SeekEntryResult!9378)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1000679 (= res!670155 (not (= lt!442348 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!30446 a!3219) i!1194 k0!2224) j!170) mask!3464) (select (store (arr!30446 a!3219) i!1194 k0!2224) j!170) (array!63242 (store (arr!30446 a!3219) i!1194 k0!2224) (size!30948 a!3219)) mask!3464))))))

(declare-fun b!1000680 () Bool)

(assert (=> b!1000680 (= e!563974 e!563972)))

(declare-fun res!670151 () Bool)

(assert (=> b!1000680 (=> (not res!670151) (not e!563972))))

(assert (=> b!1000680 (= res!670151 (= lt!442348 lt!442349))))

(assert (=> b!1000680 (= lt!442349 (Intermediate!9378 false resIndex!38 resX!38))))

(assert (=> b!1000680 (= lt!442348 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30446 a!3219) j!170) mask!3464) (select (arr!30446 a!3219) j!170) a!3219 mask!3464))))

(assert (= (and start!86440 res!670150) b!1000674))

(assert (= (and b!1000674 res!670156) b!1000676))

(assert (= (and b!1000676 res!670153) b!1000678))

(assert (= (and b!1000678 res!670152) b!1000677))

(assert (= (and b!1000677 res!670154) b!1000670))

(assert (= (and b!1000670 res!670147) b!1000669))

(assert (= (and b!1000669 res!670149) b!1000671))

(assert (= (and b!1000671 res!670148) b!1000672))

(assert (= (and b!1000672 res!670158) b!1000680))

(assert (= (and b!1000680 res!670151) b!1000675))

(assert (= (and b!1000675 res!670157) b!1000679))

(assert (= (and b!1000679 res!670155) b!1000673))

(declare-fun m!926815 () Bool)

(assert (=> start!86440 m!926815))

(declare-fun m!926817 () Bool)

(assert (=> start!86440 m!926817))

(declare-fun m!926819 () Bool)

(assert (=> b!1000679 m!926819))

(declare-fun m!926821 () Bool)

(assert (=> b!1000679 m!926821))

(assert (=> b!1000679 m!926821))

(declare-fun m!926823 () Bool)

(assert (=> b!1000679 m!926823))

(assert (=> b!1000679 m!926823))

(assert (=> b!1000679 m!926821))

(declare-fun m!926825 () Bool)

(assert (=> b!1000679 m!926825))

(declare-fun m!926827 () Bool)

(assert (=> b!1000675 m!926827))

(assert (=> b!1000675 m!926827))

(declare-fun m!926829 () Bool)

(assert (=> b!1000675 m!926829))

(declare-fun m!926831 () Bool)

(assert (=> b!1000671 m!926831))

(declare-fun m!926833 () Bool)

(assert (=> b!1000670 m!926833))

(assert (=> b!1000680 m!926827))

(assert (=> b!1000680 m!926827))

(declare-fun m!926835 () Bool)

(assert (=> b!1000680 m!926835))

(assert (=> b!1000680 m!926835))

(assert (=> b!1000680 m!926827))

(declare-fun m!926837 () Bool)

(assert (=> b!1000680 m!926837))

(declare-fun m!926839 () Bool)

(assert (=> b!1000669 m!926839))

(declare-fun m!926841 () Bool)

(assert (=> b!1000677 m!926841))

(declare-fun m!926843 () Bool)

(assert (=> b!1000678 m!926843))

(assert (=> b!1000676 m!926827))

(assert (=> b!1000676 m!926827))

(declare-fun m!926845 () Bool)

(assert (=> b!1000676 m!926845))

(check-sat (not b!1000678) (not b!1000680) (not b!1000676) (not b!1000675) (not start!86440) (not b!1000677) (not b!1000670) (not b!1000671) (not b!1000679) (not b!1000669))
(check-sat)
