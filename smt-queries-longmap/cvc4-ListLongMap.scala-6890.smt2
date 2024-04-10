; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86598 () Bool)

(assert start!86598)

(declare-fun b!1004301 () Bool)

(declare-fun res!673781 () Bool)

(declare-fun e!565549 () Bool)

(assert (=> b!1004301 (=> (not res!673781) (not e!565549))))

(declare-datatypes ((array!63399 0))(
  ( (array!63400 (arr!30525 (Array (_ BitVec 32) (_ BitVec 64))) (size!31027 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63399)

(declare-fun j!170 () (_ BitVec 32))

(declare-fun lt!444113 () (_ BitVec 32))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9457 0))(
  ( (MissingZero!9457 (index!40199 (_ BitVec 32))) (Found!9457 (index!40200 (_ BitVec 32))) (Intermediate!9457 (undefined!10269 Bool) (index!40201 (_ BitVec 32)) (x!87597 (_ BitVec 32))) (Undefined!9457) (MissingVacant!9457 (index!40202 (_ BitVec 32))) )
))
(declare-fun lt!444107 () SeekEntryResult!9457)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63399 (_ BitVec 32)) SeekEntryResult!9457)

(assert (=> b!1004301 (= res!673781 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!444113 (select (arr!30525 a!3219) j!170) a!3219 mask!3464) lt!444107))))

(declare-fun b!1004302 () Bool)

(declare-fun e!565551 () Bool)

(declare-fun e!565548 () Bool)

(assert (=> b!1004302 (= e!565551 e!565548)))

(declare-fun res!673786 () Bool)

(assert (=> b!1004302 (=> (not res!673786) (not e!565548))))

(declare-fun lt!444106 () SeekEntryResult!9457)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1004302 (= res!673786 (or (= lt!444106 (MissingVacant!9457 i!1194)) (= lt!444106 (MissingZero!9457 i!1194))))))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63399 (_ BitVec 32)) SeekEntryResult!9457)

(assert (=> b!1004302 (= lt!444106 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun res!673788 () Bool)

(assert (=> start!86598 (=> (not res!673788) (not e!565551))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86598 (= res!673788 (validMask!0 mask!3464))))

(assert (=> start!86598 e!565551))

(declare-fun array_inv!23649 (array!63399) Bool)

(assert (=> start!86598 (array_inv!23649 a!3219)))

(assert (=> start!86598 true))

(declare-fun b!1004303 () Bool)

(declare-fun res!673789 () Bool)

(assert (=> b!1004303 (=> (not res!673789) (not e!565551))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1004303 (= res!673789 (validKeyInArray!0 (select (arr!30525 a!3219) j!170)))))

(declare-fun b!1004304 () Bool)

(declare-fun res!673794 () Bool)

(assert (=> b!1004304 (=> (not res!673794) (not e!565548))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1004304 (= res!673794 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31027 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31027 a!3219))))))

(declare-fun b!1004305 () Bool)

(declare-fun e!565552 () Bool)

(declare-fun e!565546 () Bool)

(assert (=> b!1004305 (= e!565552 e!565546)))

(declare-fun res!673783 () Bool)

(assert (=> b!1004305 (=> (not res!673783) (not e!565546))))

(declare-fun lt!444111 () SeekEntryResult!9457)

(declare-fun lt!444108 () (_ BitVec 64))

(declare-fun lt!444112 () array!63399)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1004305 (= res!673783 (not (= lt!444111 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!444108 mask!3464) lt!444108 lt!444112 mask!3464))))))

(assert (=> b!1004305 (= lt!444108 (select (store (arr!30525 a!3219) i!1194 k!2224) j!170))))

(assert (=> b!1004305 (= lt!444112 (array!63400 (store (arr!30525 a!3219) i!1194 k!2224) (size!31027 a!3219)))))

(declare-fun b!1004306 () Bool)

(declare-fun res!673790 () Bool)

(assert (=> b!1004306 (=> (not res!673790) (not e!565546))))

(assert (=> b!1004306 (= res!673790 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1004307 () Bool)

(declare-fun res!673785 () Bool)

(assert (=> b!1004307 (=> (not res!673785) (not e!565548))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63399 (_ BitVec 32)) Bool)

(assert (=> b!1004307 (= res!673785 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1004308 () Bool)

(assert (=> b!1004308 (= e!565549 false)))

(declare-fun lt!444110 () SeekEntryResult!9457)

(assert (=> b!1004308 (= lt!444110 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!444113 lt!444108 lt!444112 mask!3464))))

(declare-fun b!1004309 () Bool)

(declare-fun res!673782 () Bool)

(assert (=> b!1004309 (=> (not res!673782) (not e!565551))))

(declare-fun arrayContainsKey!0 (array!63399 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1004309 (= res!673782 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1004310 () Bool)

(declare-fun res!673792 () Bool)

(assert (=> b!1004310 (=> (not res!673792) (not e!565548))))

(declare-datatypes ((List!21201 0))(
  ( (Nil!21198) (Cons!21197 (h!22374 (_ BitVec 64)) (t!30202 List!21201)) )
))
(declare-fun arrayNoDuplicates!0 (array!63399 (_ BitVec 32) List!21201) Bool)

(assert (=> b!1004310 (= res!673792 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21198))))

(declare-fun b!1004311 () Bool)

(declare-fun res!673787 () Bool)

(assert (=> b!1004311 (=> (not res!673787) (not e!565546))))

(declare-fun lt!444109 () SeekEntryResult!9457)

(assert (=> b!1004311 (= res!673787 (not (= lt!444109 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!444108 lt!444112 mask!3464))))))

(declare-fun b!1004312 () Bool)

(assert (=> b!1004312 (= e!565546 e!565549)))

(declare-fun res!673791 () Bool)

(assert (=> b!1004312 (=> (not res!673791) (not e!565549))))

(assert (=> b!1004312 (= res!673791 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1245) resX!38) (bvsge (bvadd #b00000000000000000000000000000001 x!1245) #b00000000000000000000000000000000) (bvsge lt!444113 #b00000000000000000000000000000000) (bvslt lt!444113 (size!31027 a!3219))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1004312 (= lt!444113 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun b!1004313 () Bool)

(declare-fun res!673793 () Bool)

(assert (=> b!1004313 (=> (not res!673793) (not e!565551))))

(assert (=> b!1004313 (= res!673793 (validKeyInArray!0 k!2224))))

(declare-fun b!1004314 () Bool)

(declare-fun e!565547 () Bool)

(assert (=> b!1004314 (= e!565547 e!565552)))

(declare-fun res!673780 () Bool)

(assert (=> b!1004314 (=> (not res!673780) (not e!565552))))

(assert (=> b!1004314 (= res!673780 (= lt!444109 lt!444107))))

(assert (=> b!1004314 (= lt!444109 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30525 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1004315 () Bool)

(declare-fun res!673784 () Bool)

(assert (=> b!1004315 (=> (not res!673784) (not e!565551))))

(assert (=> b!1004315 (= res!673784 (and (= (size!31027 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31027 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31027 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1004316 () Bool)

(assert (=> b!1004316 (= e!565548 e!565547)))

(declare-fun res!673779 () Bool)

(assert (=> b!1004316 (=> (not res!673779) (not e!565547))))

(assert (=> b!1004316 (= res!673779 (= lt!444111 lt!444107))))

(assert (=> b!1004316 (= lt!444107 (Intermediate!9457 false resIndex!38 resX!38))))

(assert (=> b!1004316 (= lt!444111 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30525 a!3219) j!170) mask!3464) (select (arr!30525 a!3219) j!170) a!3219 mask!3464))))

(assert (= (and start!86598 res!673788) b!1004315))

(assert (= (and b!1004315 res!673784) b!1004303))

(assert (= (and b!1004303 res!673789) b!1004313))

(assert (= (and b!1004313 res!673793) b!1004309))

(assert (= (and b!1004309 res!673782) b!1004302))

(assert (= (and b!1004302 res!673786) b!1004307))

(assert (= (and b!1004307 res!673785) b!1004310))

(assert (= (and b!1004310 res!673792) b!1004304))

(assert (= (and b!1004304 res!673794) b!1004316))

(assert (= (and b!1004316 res!673779) b!1004314))

(assert (= (and b!1004314 res!673780) b!1004305))

(assert (= (and b!1004305 res!673783) b!1004311))

(assert (= (and b!1004311 res!673787) b!1004306))

(assert (= (and b!1004306 res!673790) b!1004312))

(assert (= (and b!1004312 res!673791) b!1004301))

(assert (= (and b!1004301 res!673781) b!1004308))

(declare-fun m!929869 () Bool)

(assert (=> start!86598 m!929869))

(declare-fun m!929871 () Bool)

(assert (=> start!86598 m!929871))

(declare-fun m!929873 () Bool)

(assert (=> b!1004309 m!929873))

(declare-fun m!929875 () Bool)

(assert (=> b!1004302 m!929875))

(declare-fun m!929877 () Bool)

(assert (=> b!1004305 m!929877))

(assert (=> b!1004305 m!929877))

(declare-fun m!929879 () Bool)

(assert (=> b!1004305 m!929879))

(declare-fun m!929881 () Bool)

(assert (=> b!1004305 m!929881))

(declare-fun m!929883 () Bool)

(assert (=> b!1004305 m!929883))

(declare-fun m!929885 () Bool)

(assert (=> b!1004310 m!929885))

(declare-fun m!929887 () Bool)

(assert (=> b!1004303 m!929887))

(assert (=> b!1004303 m!929887))

(declare-fun m!929889 () Bool)

(assert (=> b!1004303 m!929889))

(declare-fun m!929891 () Bool)

(assert (=> b!1004312 m!929891))

(declare-fun m!929893 () Bool)

(assert (=> b!1004307 m!929893))

(declare-fun m!929895 () Bool)

(assert (=> b!1004311 m!929895))

(declare-fun m!929897 () Bool)

(assert (=> b!1004308 m!929897))

(assert (=> b!1004316 m!929887))

(assert (=> b!1004316 m!929887))

(declare-fun m!929899 () Bool)

(assert (=> b!1004316 m!929899))

(assert (=> b!1004316 m!929899))

(assert (=> b!1004316 m!929887))

(declare-fun m!929901 () Bool)

(assert (=> b!1004316 m!929901))

(assert (=> b!1004301 m!929887))

(assert (=> b!1004301 m!929887))

(declare-fun m!929903 () Bool)

(assert (=> b!1004301 m!929903))

(declare-fun m!929905 () Bool)

(assert (=> b!1004313 m!929905))

(assert (=> b!1004314 m!929887))

(assert (=> b!1004314 m!929887))

(declare-fun m!929907 () Bool)

(assert (=> b!1004314 m!929907))

(push 1)

