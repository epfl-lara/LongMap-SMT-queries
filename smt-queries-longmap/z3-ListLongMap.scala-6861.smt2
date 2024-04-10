; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86422 () Bool)

(assert start!86422)

(declare-fun b!1000354 () Bool)

(declare-fun res!669833 () Bool)

(declare-fun e!563865 () Bool)

(assert (=> b!1000354 (=> (not res!669833) (not e!563865))))

(declare-datatypes ((array!63223 0))(
  ( (array!63224 (arr!30437 (Array (_ BitVec 32) (_ BitVec 64))) (size!30939 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63223)

(declare-fun j!170 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9369 0))(
  ( (MissingZero!9369 (index!39847 (_ BitVec 32))) (Found!9369 (index!39848 (_ BitVec 32))) (Intermediate!9369 (undefined!10181 Bool) (index!39849 (_ BitVec 32)) (x!87277 (_ BitVec 32))) (Undefined!9369) (MissingVacant!9369 (index!39850 (_ BitVec 32))) )
))
(declare-fun lt!442266 () SeekEntryResult!9369)

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63223 (_ BitVec 32)) SeekEntryResult!9369)

(assert (=> b!1000354 (= res!669833 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30437 a!3219) j!170) a!3219 mask!3464) lt!442266))))

(declare-fun b!1000355 () Bool)

(declare-fun res!669834 () Bool)

(declare-fun e!563863 () Bool)

(assert (=> b!1000355 (=> (not res!669834) (not e!563863))))

(declare-datatypes ((List!21113 0))(
  ( (Nil!21110) (Cons!21109 (h!22286 (_ BitVec 64)) (t!30114 List!21113)) )
))
(declare-fun arrayNoDuplicates!0 (array!63223 (_ BitVec 32) List!21113) Bool)

(assert (=> b!1000355 (= res!669834 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21110))))

(declare-fun b!1000356 () Bool)

(declare-fun res!669840 () Bool)

(declare-fun e!563864 () Bool)

(assert (=> b!1000356 (=> (not res!669840) (not e!563864))))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1000356 (= res!669840 (and (= (size!30939 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30939 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30939 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1000357 () Bool)

(assert (=> b!1000357 (= e!563864 e!563863)))

(declare-fun res!669839 () Bool)

(assert (=> b!1000357 (=> (not res!669839) (not e!563863))))

(declare-fun lt!442268 () SeekEntryResult!9369)

(assert (=> b!1000357 (= res!669839 (or (= lt!442268 (MissingVacant!9369 i!1194)) (= lt!442268 (MissingZero!9369 i!1194))))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63223 (_ BitVec 32)) SeekEntryResult!9369)

(assert (=> b!1000357 (= lt!442268 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1000358 () Bool)

(declare-fun res!669835 () Bool)

(assert (=> b!1000358 (=> (not res!669835) (not e!563864))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1000358 (= res!669835 (validKeyInArray!0 (select (arr!30437 a!3219) j!170)))))

(declare-fun b!1000359 () Bool)

(assert (=> b!1000359 (= e!563863 e!563865)))

(declare-fun res!669841 () Bool)

(assert (=> b!1000359 (=> (not res!669841) (not e!563865))))

(declare-fun lt!442267 () SeekEntryResult!9369)

(assert (=> b!1000359 (= res!669841 (= lt!442267 lt!442266))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1000359 (= lt!442266 (Intermediate!9369 false resIndex!38 resX!38))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1000359 (= lt!442267 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30437 a!3219) j!170) mask!3464) (select (arr!30437 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1000360 () Bool)

(declare-fun res!669837 () Bool)

(assert (=> b!1000360 (=> (not res!669837) (not e!563864))))

(declare-fun arrayContainsKey!0 (array!63223 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1000360 (= res!669837 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1000361 () Bool)

(assert (=> b!1000361 (= e!563865 (bvslt mask!3464 #b00000000000000000000000000000000))))

(declare-fun b!1000362 () Bool)

(declare-fun res!669838 () Bool)

(assert (=> b!1000362 (=> (not res!669838) (not e!563865))))

(assert (=> b!1000362 (= res!669838 (not (= lt!442267 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!30437 a!3219) i!1194 k0!2224) j!170) mask!3464) (select (store (arr!30437 a!3219) i!1194 k0!2224) j!170) (array!63224 (store (arr!30437 a!3219) i!1194 k0!2224) (size!30939 a!3219)) mask!3464))))))

(declare-fun b!1000363 () Bool)

(declare-fun res!669836 () Bool)

(assert (=> b!1000363 (=> (not res!669836) (not e!563863))))

(assert (=> b!1000363 (= res!669836 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30939 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30939 a!3219))))))

(declare-fun res!669842 () Bool)

(assert (=> start!86422 (=> (not res!669842) (not e!563864))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86422 (= res!669842 (validMask!0 mask!3464))))

(assert (=> start!86422 e!563864))

(declare-fun array_inv!23561 (array!63223) Bool)

(assert (=> start!86422 (array_inv!23561 a!3219)))

(assert (=> start!86422 true))

(declare-fun b!1000364 () Bool)

(declare-fun res!669832 () Bool)

(assert (=> b!1000364 (=> (not res!669832) (not e!563864))))

(assert (=> b!1000364 (= res!669832 (validKeyInArray!0 k0!2224))))

(declare-fun b!1000365 () Bool)

(declare-fun res!669843 () Bool)

(assert (=> b!1000365 (=> (not res!669843) (not e!563863))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63223 (_ BitVec 32)) Bool)

(assert (=> b!1000365 (= res!669843 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(assert (= (and start!86422 res!669842) b!1000356))

(assert (= (and b!1000356 res!669840) b!1000358))

(assert (= (and b!1000358 res!669835) b!1000364))

(assert (= (and b!1000364 res!669832) b!1000360))

(assert (= (and b!1000360 res!669837) b!1000357))

(assert (= (and b!1000357 res!669839) b!1000365))

(assert (= (and b!1000365 res!669843) b!1000355))

(assert (= (and b!1000355 res!669834) b!1000363))

(assert (= (and b!1000363 res!669836) b!1000359))

(assert (= (and b!1000359 res!669841) b!1000354))

(assert (= (and b!1000354 res!669833) b!1000362))

(assert (= (and b!1000362 res!669838) b!1000361))

(declare-fun m!926527 () Bool)

(assert (=> b!1000357 m!926527))

(declare-fun m!926529 () Bool)

(assert (=> b!1000360 m!926529))

(declare-fun m!926531 () Bool)

(assert (=> b!1000355 m!926531))

(declare-fun m!926533 () Bool)

(assert (=> b!1000362 m!926533))

(declare-fun m!926535 () Bool)

(assert (=> b!1000362 m!926535))

(assert (=> b!1000362 m!926535))

(declare-fun m!926537 () Bool)

(assert (=> b!1000362 m!926537))

(assert (=> b!1000362 m!926537))

(assert (=> b!1000362 m!926535))

(declare-fun m!926539 () Bool)

(assert (=> b!1000362 m!926539))

(declare-fun m!926541 () Bool)

(assert (=> b!1000358 m!926541))

(assert (=> b!1000358 m!926541))

(declare-fun m!926543 () Bool)

(assert (=> b!1000358 m!926543))

(declare-fun m!926545 () Bool)

(assert (=> b!1000365 m!926545))

(assert (=> b!1000354 m!926541))

(assert (=> b!1000354 m!926541))

(declare-fun m!926547 () Bool)

(assert (=> b!1000354 m!926547))

(declare-fun m!926549 () Bool)

(assert (=> start!86422 m!926549))

(declare-fun m!926551 () Bool)

(assert (=> start!86422 m!926551))

(declare-fun m!926553 () Bool)

(assert (=> b!1000364 m!926553))

(assert (=> b!1000359 m!926541))

(assert (=> b!1000359 m!926541))

(declare-fun m!926555 () Bool)

(assert (=> b!1000359 m!926555))

(assert (=> b!1000359 m!926555))

(assert (=> b!1000359 m!926541))

(declare-fun m!926557 () Bool)

(assert (=> b!1000359 m!926557))

(check-sat (not b!1000355) (not start!86422) (not b!1000357) (not b!1000364) (not b!1000359) (not b!1000362) (not b!1000365) (not b!1000360) (not b!1000354) (not b!1000358))
(check-sat)
