; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86892 () Bool)

(assert start!86892)

(declare-fun b!1007457 () Bool)

(declare-fun res!676486 () Bool)

(declare-fun e!566959 () Bool)

(assert (=> b!1007457 (=> (not res!676486) (not e!566959))))

(declare-datatypes ((array!63487 0))(
  ( (array!63488 (arr!30564 (Array (_ BitVec 32) (_ BitVec 64))) (size!31068 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63487)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1007457 (= res!676486 (and (= (size!31068 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31068 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31068 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1007458 () Bool)

(declare-fun e!566958 () Bool)

(declare-fun e!566955 () Bool)

(assert (=> b!1007458 (= e!566958 e!566955)))

(declare-fun res!676475 () Bool)

(assert (=> b!1007458 (=> (not res!676475) (not e!566955))))

(declare-datatypes ((SeekEntryResult!9521 0))(
  ( (MissingZero!9521 (index!40455 (_ BitVec 32))) (Found!9521 (index!40456 (_ BitVec 32))) (Intermediate!9521 (undefined!10333 Bool) (index!40457 (_ BitVec 32)) (x!87866 (_ BitVec 32))) (Undefined!9521) (MissingVacant!9521 (index!40458 (_ BitVec 32))) )
))
(declare-fun lt!445086 () SeekEntryResult!9521)

(declare-fun lt!445090 () SeekEntryResult!9521)

(assert (=> b!1007458 (= res!676475 (= lt!445086 lt!445090))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1007458 (= lt!445090 (Intermediate!9521 false resIndex!38 resX!38))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63487 (_ BitVec 32)) SeekEntryResult!9521)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1007458 (= lt!445086 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30564 a!3219) j!170) mask!3464) (select (arr!30564 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1007459 () Bool)

(declare-fun res!676474 () Bool)

(assert (=> b!1007459 (=> (not res!676474) (not e!566959))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1007459 (= res!676474 (validKeyInArray!0 k0!2224))))

(declare-fun b!1007460 () Bool)

(assert (=> b!1007460 (= e!566959 e!566958)))

(declare-fun res!676477 () Bool)

(assert (=> b!1007460 (=> (not res!676477) (not e!566958))))

(declare-fun lt!445084 () SeekEntryResult!9521)

(assert (=> b!1007460 (= res!676477 (or (= lt!445084 (MissingVacant!9521 i!1194)) (= lt!445084 (MissingZero!9521 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63487 (_ BitVec 32)) SeekEntryResult!9521)

(assert (=> b!1007460 (= lt!445084 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1007461 () Bool)

(declare-fun res!676480 () Bool)

(assert (=> b!1007461 (=> (not res!676480) (not e!566958))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(assert (=> b!1007461 (= res!676480 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31068 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31068 a!3219))))))

(declare-fun b!1007462 () Bool)

(declare-fun e!566957 () Bool)

(assert (=> b!1007462 (= e!566955 e!566957)))

(declare-fun res!676476 () Bool)

(assert (=> b!1007462 (=> (not res!676476) (not e!566957))))

(declare-fun lt!445088 () SeekEntryResult!9521)

(assert (=> b!1007462 (= res!676476 (= lt!445088 lt!445090))))

(assert (=> b!1007462 (= lt!445088 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30564 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1007463 () Bool)

(declare-fun e!566960 () Bool)

(assert (=> b!1007463 (= e!566960 false)))

(declare-fun lt!445085 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1007463 (= lt!445085 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun b!1007464 () Bool)

(declare-fun res!676485 () Bool)

(assert (=> b!1007464 (=> (not res!676485) (not e!566960))))

(assert (=> b!1007464 (= res!676485 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1007465 () Bool)

(declare-fun res!676483 () Bool)

(assert (=> b!1007465 (=> (not res!676483) (not e!566960))))

(declare-fun lt!445087 () array!63487)

(declare-fun lt!445089 () (_ BitVec 64))

(assert (=> b!1007465 (= res!676483 (not (= lt!445088 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!445089 lt!445087 mask!3464))))))

(declare-fun b!1007466 () Bool)

(declare-fun res!676482 () Bool)

(assert (=> b!1007466 (=> (not res!676482) (not e!566959))))

(assert (=> b!1007466 (= res!676482 (validKeyInArray!0 (select (arr!30564 a!3219) j!170)))))

(declare-fun b!1007467 () Bool)

(declare-fun res!676484 () Bool)

(assert (=> b!1007467 (=> (not res!676484) (not e!566958))))

(declare-datatypes ((List!21306 0))(
  ( (Nil!21303) (Cons!21302 (h!22488 (_ BitVec 64)) (t!30298 List!21306)) )
))
(declare-fun arrayNoDuplicates!0 (array!63487 (_ BitVec 32) List!21306) Bool)

(assert (=> b!1007467 (= res!676484 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21303))))

(declare-fun b!1007468 () Bool)

(assert (=> b!1007468 (= e!566957 e!566960)))

(declare-fun res!676479 () Bool)

(assert (=> b!1007468 (=> (not res!676479) (not e!566960))))

(assert (=> b!1007468 (= res!676479 (not (= lt!445086 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!445089 mask!3464) lt!445089 lt!445087 mask!3464))))))

(assert (=> b!1007468 (= lt!445089 (select (store (arr!30564 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1007468 (= lt!445087 (array!63488 (store (arr!30564 a!3219) i!1194 k0!2224) (size!31068 a!3219)))))

(declare-fun b!1007469 () Bool)

(declare-fun res!676478 () Bool)

(assert (=> b!1007469 (=> (not res!676478) (not e!566958))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63487 (_ BitVec 32)) Bool)

(assert (=> b!1007469 (= res!676478 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun res!676487 () Bool)

(assert (=> start!86892 (=> (not res!676487) (not e!566959))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86892 (= res!676487 (validMask!0 mask!3464))))

(assert (=> start!86892 e!566959))

(declare-fun array_inv!23707 (array!63487) Bool)

(assert (=> start!86892 (array_inv!23707 a!3219)))

(assert (=> start!86892 true))

(declare-fun b!1007470 () Bool)

(declare-fun res!676481 () Bool)

(assert (=> b!1007470 (=> (not res!676481) (not e!566959))))

(declare-fun arrayContainsKey!0 (array!63487 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1007470 (= res!676481 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(assert (= (and start!86892 res!676487) b!1007457))

(assert (= (and b!1007457 res!676486) b!1007466))

(assert (= (and b!1007466 res!676482) b!1007459))

(assert (= (and b!1007459 res!676474) b!1007470))

(assert (= (and b!1007470 res!676481) b!1007460))

(assert (= (and b!1007460 res!676477) b!1007469))

(assert (= (and b!1007469 res!676478) b!1007467))

(assert (= (and b!1007467 res!676484) b!1007461))

(assert (= (and b!1007461 res!676480) b!1007458))

(assert (= (and b!1007458 res!676475) b!1007462))

(assert (= (and b!1007462 res!676476) b!1007468))

(assert (= (and b!1007468 res!676479) b!1007465))

(assert (= (and b!1007465 res!676483) b!1007464))

(assert (= (and b!1007464 res!676485) b!1007463))

(declare-fun m!931801 () Bool)

(assert (=> b!1007465 m!931801))

(declare-fun m!931803 () Bool)

(assert (=> b!1007460 m!931803))

(declare-fun m!931805 () Bool)

(assert (=> b!1007470 m!931805))

(declare-fun m!931807 () Bool)

(assert (=> start!86892 m!931807))

(declare-fun m!931809 () Bool)

(assert (=> start!86892 m!931809))

(declare-fun m!931811 () Bool)

(assert (=> b!1007458 m!931811))

(assert (=> b!1007458 m!931811))

(declare-fun m!931813 () Bool)

(assert (=> b!1007458 m!931813))

(assert (=> b!1007458 m!931813))

(assert (=> b!1007458 m!931811))

(declare-fun m!931815 () Bool)

(assert (=> b!1007458 m!931815))

(declare-fun m!931817 () Bool)

(assert (=> b!1007468 m!931817))

(assert (=> b!1007468 m!931817))

(declare-fun m!931819 () Bool)

(assert (=> b!1007468 m!931819))

(declare-fun m!931821 () Bool)

(assert (=> b!1007468 m!931821))

(declare-fun m!931823 () Bool)

(assert (=> b!1007468 m!931823))

(assert (=> b!1007462 m!931811))

(assert (=> b!1007462 m!931811))

(declare-fun m!931825 () Bool)

(assert (=> b!1007462 m!931825))

(assert (=> b!1007466 m!931811))

(assert (=> b!1007466 m!931811))

(declare-fun m!931827 () Bool)

(assert (=> b!1007466 m!931827))

(declare-fun m!931829 () Bool)

(assert (=> b!1007463 m!931829))

(declare-fun m!931831 () Bool)

(assert (=> b!1007469 m!931831))

(declare-fun m!931833 () Bool)

(assert (=> b!1007459 m!931833))

(declare-fun m!931835 () Bool)

(assert (=> b!1007467 m!931835))

(check-sat (not b!1007458) (not b!1007460) (not b!1007467) (not b!1007469) (not b!1007459) (not b!1007470) (not b!1007463) (not b!1007468) (not b!1007465) (not start!86892) (not b!1007466) (not b!1007462))
(check-sat)
