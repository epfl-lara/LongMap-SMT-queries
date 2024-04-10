; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86604 () Bool)

(assert start!86604)

(declare-fun b!1004445 () Bool)

(declare-fun e!565613 () Bool)

(declare-fun e!565609 () Bool)

(assert (=> b!1004445 (= e!565613 e!565609)))

(declare-fun res!673927 () Bool)

(assert (=> b!1004445 (=> (not res!673927) (not e!565609))))

(declare-datatypes ((SeekEntryResult!9460 0))(
  ( (MissingZero!9460 (index!40211 (_ BitVec 32))) (Found!9460 (index!40212 (_ BitVec 32))) (Intermediate!9460 (undefined!10272 Bool) (index!40213 (_ BitVec 32)) (x!87608 (_ BitVec 32))) (Undefined!9460) (MissingVacant!9460 (index!40214 (_ BitVec 32))) )
))
(declare-fun lt!444178 () SeekEntryResult!9460)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1004445 (= res!673927 (or (= lt!444178 (MissingVacant!9460 i!1194)) (= lt!444178 (MissingZero!9460 i!1194))))))

(declare-datatypes ((array!63405 0))(
  ( (array!63406 (arr!30528 (Array (_ BitVec 32) (_ BitVec 64))) (size!31030 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63405)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63405 (_ BitVec 32)) SeekEntryResult!9460)

(assert (=> b!1004445 (= lt!444178 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!1004446 () Bool)

(declare-fun res!673926 () Bool)

(assert (=> b!1004446 (=> (not res!673926) (not e!565609))))

(declare-datatypes ((List!21204 0))(
  ( (Nil!21201) (Cons!21200 (h!22377 (_ BitVec 64)) (t!30205 List!21204)) )
))
(declare-fun arrayNoDuplicates!0 (array!63405 (_ BitVec 32) List!21204) Bool)

(assert (=> b!1004446 (= res!673926 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21201))))

(declare-fun b!1004447 () Bool)

(declare-fun e!565615 () Bool)

(assert (=> b!1004447 (= e!565609 e!565615)))

(declare-fun res!673935 () Bool)

(assert (=> b!1004447 (=> (not res!673935) (not e!565615))))

(declare-fun lt!444184 () SeekEntryResult!9460)

(declare-fun lt!444185 () SeekEntryResult!9460)

(assert (=> b!1004447 (= res!673935 (= lt!444184 lt!444185))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1004447 (= lt!444185 (Intermediate!9460 false resIndex!38 resX!38))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63405 (_ BitVec 32)) SeekEntryResult!9460)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1004447 (= lt!444184 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30528 a!3219) j!170) mask!3464) (select (arr!30528 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1004448 () Bool)

(declare-fun res!673925 () Bool)

(assert (=> b!1004448 (=> (not res!673925) (not e!565609))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63405 (_ BitVec 32)) Bool)

(assert (=> b!1004448 (= res!673925 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1004449 () Bool)

(declare-fun res!673934 () Bool)

(assert (=> b!1004449 (=> (not res!673934) (not e!565609))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(assert (=> b!1004449 (= res!673934 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31030 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31030 a!3219))))))

(declare-fun b!1004450 () Bool)

(declare-fun e!565610 () Bool)

(declare-fun e!565614 () Bool)

(assert (=> b!1004450 (= e!565610 e!565614)))

(declare-fun res!673937 () Bool)

(assert (=> b!1004450 (=> (not res!673937) (not e!565614))))

(declare-fun lt!444180 () (_ BitVec 64))

(declare-fun lt!444182 () array!63405)

(assert (=> b!1004450 (= res!673937 (not (= lt!444184 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!444180 mask!3464) lt!444180 lt!444182 mask!3464))))))

(assert (=> b!1004450 (= lt!444180 (select (store (arr!30528 a!3219) i!1194 k!2224) j!170))))

(assert (=> b!1004450 (= lt!444182 (array!63406 (store (arr!30528 a!3219) i!1194 k!2224) (size!31030 a!3219)))))

(declare-fun res!673928 () Bool)

(assert (=> start!86604 (=> (not res!673928) (not e!565613))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86604 (= res!673928 (validMask!0 mask!3464))))

(assert (=> start!86604 e!565613))

(declare-fun array_inv!23652 (array!63405) Bool)

(assert (=> start!86604 (array_inv!23652 a!3219)))

(assert (=> start!86604 true))

(declare-fun b!1004451 () Bool)

(declare-fun e!565612 () Bool)

(assert (=> b!1004451 (= e!565614 e!565612)))

(declare-fun res!673933 () Bool)

(assert (=> b!1004451 (=> (not res!673933) (not e!565612))))

(declare-fun lt!444183 () (_ BitVec 32))

(assert (=> b!1004451 (= res!673933 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1245) resX!38) (bvsge (bvadd #b00000000000000000000000000000001 x!1245) #b00000000000000000000000000000000) (bvsge lt!444183 #b00000000000000000000000000000000) (bvslt lt!444183 (size!31030 a!3219))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1004451 (= lt!444183 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun b!1004452 () Bool)

(declare-fun res!673938 () Bool)

(assert (=> b!1004452 (=> (not res!673938) (not e!565613))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1004452 (= res!673938 (validKeyInArray!0 (select (arr!30528 a!3219) j!170)))))

(declare-fun b!1004453 () Bool)

(declare-fun res!673923 () Bool)

(assert (=> b!1004453 (=> (not res!673923) (not e!565613))))

(declare-fun arrayContainsKey!0 (array!63405 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1004453 (= res!673923 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1004454 () Bool)

(declare-fun res!673932 () Bool)

(assert (=> b!1004454 (=> (not res!673932) (not e!565614))))

(assert (=> b!1004454 (= res!673932 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1004455 () Bool)

(declare-fun res!673929 () Bool)

(assert (=> b!1004455 (=> (not res!673929) (not e!565612))))

(assert (=> b!1004455 (= res!673929 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!444183 (select (arr!30528 a!3219) j!170) a!3219 mask!3464) lt!444185))))

(declare-fun b!1004456 () Bool)

(assert (=> b!1004456 (= e!565615 e!565610)))

(declare-fun res!673931 () Bool)

(assert (=> b!1004456 (=> (not res!673931) (not e!565610))))

(declare-fun lt!444181 () SeekEntryResult!9460)

(assert (=> b!1004456 (= res!673931 (= lt!444181 lt!444185))))

(assert (=> b!1004456 (= lt!444181 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30528 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1004457 () Bool)

(declare-fun res!673930 () Bool)

(assert (=> b!1004457 (=> (not res!673930) (not e!565613))))

(assert (=> b!1004457 (= res!673930 (and (= (size!31030 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31030 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31030 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1004458 () Bool)

(assert (=> b!1004458 (= e!565612 false)))

(declare-fun lt!444179 () SeekEntryResult!9460)

(assert (=> b!1004458 (= lt!444179 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!444183 lt!444180 lt!444182 mask!3464))))

(declare-fun b!1004459 () Bool)

(declare-fun res!673924 () Bool)

(assert (=> b!1004459 (=> (not res!673924) (not e!565614))))

(assert (=> b!1004459 (= res!673924 (not (= lt!444181 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!444180 lt!444182 mask!3464))))))

(declare-fun b!1004460 () Bool)

(declare-fun res!673936 () Bool)

(assert (=> b!1004460 (=> (not res!673936) (not e!565613))))

(assert (=> b!1004460 (= res!673936 (validKeyInArray!0 k!2224))))

(assert (= (and start!86604 res!673928) b!1004457))

(assert (= (and b!1004457 res!673930) b!1004452))

(assert (= (and b!1004452 res!673938) b!1004460))

(assert (= (and b!1004460 res!673936) b!1004453))

(assert (= (and b!1004453 res!673923) b!1004445))

(assert (= (and b!1004445 res!673927) b!1004448))

(assert (= (and b!1004448 res!673925) b!1004446))

(assert (= (and b!1004446 res!673926) b!1004449))

(assert (= (and b!1004449 res!673934) b!1004447))

(assert (= (and b!1004447 res!673935) b!1004456))

(assert (= (and b!1004456 res!673931) b!1004450))

(assert (= (and b!1004450 res!673937) b!1004459))

(assert (= (and b!1004459 res!673924) b!1004454))

(assert (= (and b!1004454 res!673932) b!1004451))

(assert (= (and b!1004451 res!673933) b!1004455))

(assert (= (and b!1004455 res!673929) b!1004458))

(declare-fun m!929989 () Bool)

(assert (=> start!86604 m!929989))

(declare-fun m!929991 () Bool)

(assert (=> start!86604 m!929991))

(declare-fun m!929993 () Bool)

(assert (=> b!1004456 m!929993))

(assert (=> b!1004456 m!929993))

(declare-fun m!929995 () Bool)

(assert (=> b!1004456 m!929995))

(declare-fun m!929997 () Bool)

(assert (=> b!1004458 m!929997))

(declare-fun m!929999 () Bool)

(assert (=> b!1004451 m!929999))

(declare-fun m!930001 () Bool)

(assert (=> b!1004459 m!930001))

(declare-fun m!930003 () Bool)

(assert (=> b!1004448 m!930003))

(declare-fun m!930005 () Bool)

(assert (=> b!1004460 m!930005))

(declare-fun m!930007 () Bool)

(assert (=> b!1004450 m!930007))

(assert (=> b!1004450 m!930007))

(declare-fun m!930009 () Bool)

(assert (=> b!1004450 m!930009))

(declare-fun m!930011 () Bool)

(assert (=> b!1004450 m!930011))

(declare-fun m!930013 () Bool)

(assert (=> b!1004450 m!930013))

(assert (=> b!1004452 m!929993))

(assert (=> b!1004452 m!929993))

(declare-fun m!930015 () Bool)

(assert (=> b!1004452 m!930015))

(declare-fun m!930017 () Bool)

(assert (=> b!1004445 m!930017))

(declare-fun m!930019 () Bool)

(assert (=> b!1004446 m!930019))

(declare-fun m!930021 () Bool)

(assert (=> b!1004453 m!930021))

(assert (=> b!1004447 m!929993))

(assert (=> b!1004447 m!929993))

(declare-fun m!930023 () Bool)

(assert (=> b!1004447 m!930023))

(assert (=> b!1004447 m!930023))

(assert (=> b!1004447 m!929993))

(declare-fun m!930025 () Bool)

(assert (=> b!1004447 m!930025))

(assert (=> b!1004455 m!929993))

(assert (=> b!1004455 m!929993))

(declare-fun m!930027 () Bool)

(assert (=> b!1004455 m!930027))

(push 1)

(assert (not b!1004460))

