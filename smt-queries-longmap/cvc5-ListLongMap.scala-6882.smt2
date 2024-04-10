; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86546 () Bool)

(assert start!86546)

(declare-fun b!1003053 () Bool)

(declare-fun e!565005 () Bool)

(declare-fun e!565001 () Bool)

(assert (=> b!1003053 (= e!565005 e!565001)))

(declare-fun res!672537 () Bool)

(assert (=> b!1003053 (=> (not res!672537) (not e!565001))))

(declare-datatypes ((SeekEntryResult!9431 0))(
  ( (MissingZero!9431 (index!40095 (_ BitVec 32))) (Found!9431 (index!40096 (_ BitVec 32))) (Intermediate!9431 (undefined!10243 Bool) (index!40097 (_ BitVec 32)) (x!87507 (_ BitVec 32))) (Undefined!9431) (MissingVacant!9431 (index!40098 (_ BitVec 32))) )
))
(declare-fun lt!443484 () SeekEntryResult!9431)

(declare-fun lt!443487 () SeekEntryResult!9431)

(assert (=> b!1003053 (= res!672537 (= lt!443484 lt!443487))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1003053 (= lt!443487 (Intermediate!9431 false resIndex!38 resX!38))))

(declare-datatypes ((array!63347 0))(
  ( (array!63348 (arr!30499 (Array (_ BitVec 32) (_ BitVec 64))) (size!31001 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63347)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63347 (_ BitVec 32)) SeekEntryResult!9431)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1003053 (= lt!443484 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30499 a!3219) j!170) mask!3464) (select (arr!30499 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1003054 () Bool)

(declare-fun e!565002 () Bool)

(assert (=> b!1003054 (= e!565001 e!565002)))

(declare-fun res!672546 () Bool)

(assert (=> b!1003054 (=> (not res!672546) (not e!565002))))

(declare-fun lt!443488 () SeekEntryResult!9431)

(assert (=> b!1003054 (= res!672546 (= lt!443488 lt!443487))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun x!1245 () (_ BitVec 32))

(assert (=> b!1003054 (= lt!443488 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30499 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1003055 () Bool)

(declare-fun res!672543 () Bool)

(declare-fun e!565003 () Bool)

(assert (=> b!1003055 (=> (not res!672543) (not e!565003))))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1003055 (= res!672543 (validKeyInArray!0 k!2224))))

(declare-fun b!1003056 () Bool)

(declare-fun e!565006 () Bool)

(declare-fun e!565004 () Bool)

(assert (=> b!1003056 (= e!565006 e!565004)))

(declare-fun res!672536 () Bool)

(assert (=> b!1003056 (=> (not res!672536) (not e!565004))))

(declare-fun lt!443483 () (_ BitVec 32))

(assert (=> b!1003056 (= res!672536 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1245) resX!38) (bvsge (bvadd #b00000000000000000000000000000001 x!1245) #b00000000000000000000000000000000) (bvsge lt!443483 #b00000000000000000000000000000000) (bvslt lt!443483 (size!31001 a!3219))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1003056 (= lt!443483 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun b!1003057 () Bool)

(declare-fun res!672538 () Bool)

(assert (=> b!1003057 (=> (not res!672538) (not e!565004))))

(assert (=> b!1003057 (= res!672538 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!443483 (select (arr!30499 a!3219) j!170) a!3219 mask!3464) lt!443487))))

(declare-fun b!1003058 () Bool)

(declare-fun res!672540 () Bool)

(assert (=> b!1003058 (=> (not res!672540) (not e!565006))))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1003058 (= res!672540 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1003059 () Bool)

(declare-fun res!672532 () Bool)

(assert (=> b!1003059 (=> (not res!672532) (not e!565005))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63347 (_ BitVec 32)) Bool)

(assert (=> b!1003059 (= res!672532 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1003060 () Bool)

(assert (=> b!1003060 (= e!565003 e!565005)))

(declare-fun res!672539 () Bool)

(assert (=> b!1003060 (=> (not res!672539) (not e!565005))))

(declare-fun lt!443489 () SeekEntryResult!9431)

(assert (=> b!1003060 (= res!672539 (or (= lt!443489 (MissingVacant!9431 i!1194)) (= lt!443489 (MissingZero!9431 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63347 (_ BitVec 32)) SeekEntryResult!9431)

(assert (=> b!1003060 (= lt!443489 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!1003061 () Bool)

(declare-fun res!672535 () Bool)

(assert (=> b!1003061 (=> (not res!672535) (not e!565003))))

(assert (=> b!1003061 (= res!672535 (and (= (size!31001 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31001 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31001 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1003062 () Bool)

(declare-fun res!672545 () Bool)

(assert (=> b!1003062 (=> (not res!672545) (not e!565005))))

(assert (=> b!1003062 (= res!672545 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31001 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31001 a!3219))))))

(declare-fun b!1003063 () Bool)

(declare-fun res!672542 () Bool)

(assert (=> b!1003063 (=> (not res!672542) (not e!565006))))

(declare-fun lt!443486 () (_ BitVec 64))

(declare-fun lt!443485 () array!63347)

(assert (=> b!1003063 (= res!672542 (not (= lt!443488 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!443486 lt!443485 mask!3464))))))

(declare-fun b!1003064 () Bool)

(assert (=> b!1003064 (= e!565004 false)))

(declare-fun lt!443482 () SeekEntryResult!9431)

(assert (=> b!1003064 (= lt!443482 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!443483 lt!443486 lt!443485 mask!3464))))

(declare-fun b!1003065 () Bool)

(assert (=> b!1003065 (= e!565002 e!565006)))

(declare-fun res!672531 () Bool)

(assert (=> b!1003065 (=> (not res!672531) (not e!565006))))

(assert (=> b!1003065 (= res!672531 (not (= lt!443484 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!443486 mask!3464) lt!443486 lt!443485 mask!3464))))))

(assert (=> b!1003065 (= lt!443486 (select (store (arr!30499 a!3219) i!1194 k!2224) j!170))))

(assert (=> b!1003065 (= lt!443485 (array!63348 (store (arr!30499 a!3219) i!1194 k!2224) (size!31001 a!3219)))))

(declare-fun b!1003066 () Bool)

(declare-fun res!672544 () Bool)

(assert (=> b!1003066 (=> (not res!672544) (not e!565003))))

(declare-fun arrayContainsKey!0 (array!63347 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1003066 (= res!672544 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1003067 () Bool)

(declare-fun res!672541 () Bool)

(assert (=> b!1003067 (=> (not res!672541) (not e!565005))))

(declare-datatypes ((List!21175 0))(
  ( (Nil!21172) (Cons!21171 (h!22348 (_ BitVec 64)) (t!30176 List!21175)) )
))
(declare-fun arrayNoDuplicates!0 (array!63347 (_ BitVec 32) List!21175) Bool)

(assert (=> b!1003067 (= res!672541 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21172))))

(declare-fun res!672534 () Bool)

(assert (=> start!86546 (=> (not res!672534) (not e!565003))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86546 (= res!672534 (validMask!0 mask!3464))))

(assert (=> start!86546 e!565003))

(declare-fun array_inv!23623 (array!63347) Bool)

(assert (=> start!86546 (array_inv!23623 a!3219)))

(assert (=> start!86546 true))

(declare-fun b!1003068 () Bool)

(declare-fun res!672533 () Bool)

(assert (=> b!1003068 (=> (not res!672533) (not e!565003))))

(assert (=> b!1003068 (= res!672533 (validKeyInArray!0 (select (arr!30499 a!3219) j!170)))))

(assert (= (and start!86546 res!672534) b!1003061))

(assert (= (and b!1003061 res!672535) b!1003068))

(assert (= (and b!1003068 res!672533) b!1003055))

(assert (= (and b!1003055 res!672543) b!1003066))

(assert (= (and b!1003066 res!672544) b!1003060))

(assert (= (and b!1003060 res!672539) b!1003059))

(assert (= (and b!1003059 res!672532) b!1003067))

(assert (= (and b!1003067 res!672541) b!1003062))

(assert (= (and b!1003062 res!672545) b!1003053))

(assert (= (and b!1003053 res!672537) b!1003054))

(assert (= (and b!1003054 res!672546) b!1003065))

(assert (= (and b!1003065 res!672531) b!1003063))

(assert (= (and b!1003063 res!672542) b!1003058))

(assert (= (and b!1003058 res!672540) b!1003056))

(assert (= (and b!1003056 res!672536) b!1003057))

(assert (= (and b!1003057 res!672538) b!1003064))

(declare-fun m!928829 () Bool)

(assert (=> b!1003056 m!928829))

(declare-fun m!928831 () Bool)

(assert (=> b!1003059 m!928831))

(declare-fun m!928833 () Bool)

(assert (=> b!1003066 m!928833))

(declare-fun m!928835 () Bool)

(assert (=> b!1003054 m!928835))

(assert (=> b!1003054 m!928835))

(declare-fun m!928837 () Bool)

(assert (=> b!1003054 m!928837))

(assert (=> b!1003068 m!928835))

(assert (=> b!1003068 m!928835))

(declare-fun m!928839 () Bool)

(assert (=> b!1003068 m!928839))

(declare-fun m!928841 () Bool)

(assert (=> b!1003065 m!928841))

(assert (=> b!1003065 m!928841))

(declare-fun m!928843 () Bool)

(assert (=> b!1003065 m!928843))

(declare-fun m!928845 () Bool)

(assert (=> b!1003065 m!928845))

(declare-fun m!928847 () Bool)

(assert (=> b!1003065 m!928847))

(declare-fun m!928849 () Bool)

(assert (=> b!1003060 m!928849))

(declare-fun m!928851 () Bool)

(assert (=> b!1003055 m!928851))

(declare-fun m!928853 () Bool)

(assert (=> b!1003063 m!928853))

(assert (=> b!1003057 m!928835))

(assert (=> b!1003057 m!928835))

(declare-fun m!928855 () Bool)

(assert (=> b!1003057 m!928855))

(declare-fun m!928857 () Bool)

(assert (=> start!86546 m!928857))

(declare-fun m!928859 () Bool)

(assert (=> start!86546 m!928859))

(declare-fun m!928861 () Bool)

(assert (=> b!1003064 m!928861))

(assert (=> b!1003053 m!928835))

(assert (=> b!1003053 m!928835))

(declare-fun m!928863 () Bool)

(assert (=> b!1003053 m!928863))

(assert (=> b!1003053 m!928863))

(assert (=> b!1003053 m!928835))

(declare-fun m!928865 () Bool)

(assert (=> b!1003053 m!928865))

(declare-fun m!928867 () Bool)

(assert (=> b!1003067 m!928867))

(push 1)

