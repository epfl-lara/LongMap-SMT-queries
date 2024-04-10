; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86056 () Bool)

(assert start!86056)

(declare-fun b!996852 () Bool)

(declare-fun res!666970 () Bool)

(declare-fun e!562331 () Bool)

(assert (=> b!996852 (=> (not res!666970) (not e!562331))))

(declare-datatypes ((array!63061 0))(
  ( (array!63062 (arr!30362 (Array (_ BitVec 32) (_ BitVec 64))) (size!30864 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63061)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9294 0))(
  ( (MissingZero!9294 (index!39547 (_ BitVec 32))) (Found!9294 (index!39548 (_ BitVec 32))) (Intermediate!9294 (undefined!10106 Bool) (index!39549 (_ BitVec 32)) (x!86978 (_ BitVec 32))) (Undefined!9294) (MissingVacant!9294 (index!39550 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63061 (_ BitVec 32)) SeekEntryResult!9294)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!996852 (= res!666970 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30362 a!3219) j!170) mask!3464) (select (arr!30362 a!3219) j!170) a!3219 mask!3464) (Intermediate!9294 false resIndex!38 resX!38)))))

(declare-fun b!996853 () Bool)

(declare-fun res!666973 () Bool)

(declare-fun e!562333 () Bool)

(assert (=> b!996853 (=> (not res!666973) (not e!562333))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!996853 (= res!666973 (validKeyInArray!0 (select (arr!30362 a!3219) j!170)))))

(declare-fun b!996854 () Bool)

(declare-fun res!666966 () Bool)

(assert (=> b!996854 (=> (not res!666966) (not e!562333))))

(declare-fun k0!2224 () (_ BitVec 64))

(assert (=> b!996854 (= res!666966 (validKeyInArray!0 k0!2224))))

(declare-fun b!996855 () Bool)

(assert (=> b!996855 (= e!562333 e!562331)))

(declare-fun res!666974 () Bool)

(assert (=> b!996855 (=> (not res!666974) (not e!562331))))

(declare-fun lt!441299 () SeekEntryResult!9294)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!996855 (= res!666974 (or (= lt!441299 (MissingVacant!9294 i!1194)) (= lt!441299 (MissingZero!9294 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63061 (_ BitVec 32)) SeekEntryResult!9294)

(assert (=> b!996855 (= lt!441299 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!996856 () Bool)

(declare-fun res!666967 () Bool)

(assert (=> b!996856 (=> (not res!666967) (not e!562333))))

(declare-fun arrayContainsKey!0 (array!63061 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!996856 (= res!666967 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!996857 () Bool)

(declare-fun res!666975 () Bool)

(assert (=> b!996857 (=> (not res!666975) (not e!562331))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63061 (_ BitVec 32)) Bool)

(assert (=> b!996857 (= res!666975 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!996858 () Bool)

(declare-fun res!666972 () Bool)

(assert (=> b!996858 (=> (not res!666972) (not e!562331))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(assert (=> b!996858 (= res!666972 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30864 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30864 a!3219))))))

(declare-fun b!996859 () Bool)

(assert (=> b!996859 (= e!562331 (and (bvsge mask!3464 #b00000000000000000000000000000000) (bvslt index!1507 (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsgt x!1245 #b01111111111111111111111111111110)))))

(declare-fun res!666969 () Bool)

(assert (=> start!86056 (=> (not res!666969) (not e!562333))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86056 (= res!666969 (validMask!0 mask!3464))))

(assert (=> start!86056 e!562333))

(declare-fun array_inv!23486 (array!63061) Bool)

(assert (=> start!86056 (array_inv!23486 a!3219)))

(assert (=> start!86056 true))

(declare-fun b!996860 () Bool)

(declare-fun res!666968 () Bool)

(assert (=> b!996860 (=> (not res!666968) (not e!562331))))

(declare-datatypes ((List!21038 0))(
  ( (Nil!21035) (Cons!21034 (h!22199 (_ BitVec 64)) (t!30039 List!21038)) )
))
(declare-fun arrayNoDuplicates!0 (array!63061 (_ BitVec 32) List!21038) Bool)

(assert (=> b!996860 (= res!666968 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21035))))

(declare-fun b!996861 () Bool)

(declare-fun res!666971 () Bool)

(assert (=> b!996861 (=> (not res!666971) (not e!562333))))

(assert (=> b!996861 (= res!666971 (and (= (size!30864 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30864 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30864 a!3219)) (not (= i!1194 j!170))))))

(assert (= (and start!86056 res!666969) b!996861))

(assert (= (and b!996861 res!666971) b!996853))

(assert (= (and b!996853 res!666973) b!996854))

(assert (= (and b!996854 res!666966) b!996856))

(assert (= (and b!996856 res!666967) b!996855))

(assert (= (and b!996855 res!666974) b!996857))

(assert (= (and b!996857 res!666975) b!996860))

(assert (= (and b!996860 res!666968) b!996858))

(assert (= (and b!996858 res!666972) b!996852))

(assert (= (and b!996852 res!666970) b!996859))

(declare-fun m!923871 () Bool)

(assert (=> b!996856 m!923871))

(declare-fun m!923873 () Bool)

(assert (=> start!86056 m!923873))

(declare-fun m!923875 () Bool)

(assert (=> start!86056 m!923875))

(declare-fun m!923877 () Bool)

(assert (=> b!996857 m!923877))

(declare-fun m!923879 () Bool)

(assert (=> b!996860 m!923879))

(declare-fun m!923881 () Bool)

(assert (=> b!996855 m!923881))

(declare-fun m!923883 () Bool)

(assert (=> b!996854 m!923883))

(declare-fun m!923885 () Bool)

(assert (=> b!996853 m!923885))

(assert (=> b!996853 m!923885))

(declare-fun m!923887 () Bool)

(assert (=> b!996853 m!923887))

(assert (=> b!996852 m!923885))

(assert (=> b!996852 m!923885))

(declare-fun m!923889 () Bool)

(assert (=> b!996852 m!923889))

(assert (=> b!996852 m!923889))

(assert (=> b!996852 m!923885))

(declare-fun m!923891 () Bool)

(assert (=> b!996852 m!923891))

(check-sat (not b!996852) (not b!996856) (not b!996855) (not start!86056) (not b!996853) (not b!996854) (not b!996857) (not b!996860))
(check-sat)
