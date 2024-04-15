; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32504 () Bool)

(assert start!32504)

(declare-fun res!178430 () Bool)

(declare-fun e!200338 () Bool)

(assert (=> start!32504 (=> (not res!178430) (not e!200338))))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32504 (= res!178430 (validMask!0 mask!3777))))

(assert (=> start!32504 e!200338))

(declare-datatypes ((array!16647 0))(
  ( (array!16648 (arr!7881 (Array (_ BitVec 32) (_ BitVec 64))) (size!8234 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16647)

(declare-fun array_inv!5853 (array!16647) Bool)

(assert (=> start!32504 (array_inv!5853 a!3305)))

(assert (=> start!32504 true))

(declare-fun b!324948 () Bool)

(declare-fun e!200337 () Bool)

(assert (=> b!324948 (= e!200338 e!200337)))

(declare-fun res!178433 () Bool)

(assert (=> b!324948 (=> (not res!178433) (not e!200337))))

(declare-datatypes ((SeekEntryResult!3011 0))(
  ( (MissingZero!3011 (index!14220 (_ BitVec 32))) (Found!3011 (index!14221 (_ BitVec 32))) (Intermediate!3011 (undefined!3823 Bool) (index!14222 (_ BitVec 32)) (x!32474 (_ BitVec 32))) (Undefined!3011) (MissingVacant!3011 (index!14223 (_ BitVec 32))) )
))
(declare-fun lt!156725 () SeekEntryResult!3011)

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16647 (_ BitVec 32)) SeekEntryResult!3011)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!324948 (= res!178433 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!156725))))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!324948 (= lt!156725 (Intermediate!3011 false resIndex!58 resX!58))))

(declare-fun b!324949 () Bool)

(declare-fun res!178434 () Bool)

(assert (=> b!324949 (=> (not res!178434) (not e!200338))))

(declare-fun arrayContainsKey!0 (array!16647 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!324949 (= res!178434 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!324950 () Bool)

(declare-fun res!178426 () Bool)

(assert (=> b!324950 (=> (not res!178426) (not e!200338))))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!324950 (= res!178426 (and (= (size!8234 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8234 a!3305))))))

(declare-fun b!324951 () Bool)

(declare-fun res!178429 () Bool)

(assert (=> b!324951 (=> (not res!178429) (not e!200338))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!324951 (= res!178429 (validKeyInArray!0 k0!2497))))

(declare-fun b!324952 () Bool)

(declare-fun res!178427 () Bool)

(assert (=> b!324952 (=> (not res!178427) (not e!200338))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16647 (_ BitVec 32)) SeekEntryResult!3011)

(assert (=> b!324952 (= res!178427 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!3011 i!1250)))))

(declare-fun b!324953 () Bool)

(declare-fun res!178425 () Bool)

(assert (=> b!324953 (=> (not res!178425) (not e!200338))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16647 (_ BitVec 32)) Bool)

(assert (=> b!324953 (= res!178425 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!324954 () Bool)

(declare-fun res!178432 () Bool)

(assert (=> b!324954 (=> (not res!178432) (not e!200337))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(assert (=> b!324954 (= res!178432 (and (= (select (arr!7881 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8234 a!3305))))))

(declare-fun b!324955 () Bool)

(assert (=> b!324955 (= e!200337 false)))

(declare-fun lt!156724 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!324955 (= lt!156724 (nextIndex!0 index!1840 x!1490 mask!3777))))

(declare-fun b!324956 () Bool)

(declare-fun res!178431 () Bool)

(assert (=> b!324956 (=> (not res!178431) (not e!200337))))

(assert (=> b!324956 (= res!178431 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!156725))))

(declare-fun b!324957 () Bool)

(declare-fun res!178428 () Bool)

(assert (=> b!324957 (=> (not res!178428) (not e!200337))))

(assert (=> b!324957 (= res!178428 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7881 a!3305) index!1840) k0!2497)) (not (= x!1490 resX!58))))))

(assert (= (and start!32504 res!178430) b!324950))

(assert (= (and b!324950 res!178426) b!324951))

(assert (= (and b!324951 res!178429) b!324949))

(assert (= (and b!324949 res!178434) b!324952))

(assert (= (and b!324952 res!178427) b!324953))

(assert (= (and b!324953 res!178425) b!324948))

(assert (= (and b!324948 res!178433) b!324954))

(assert (= (and b!324954 res!178432) b!324956))

(assert (= (and b!324956 res!178431) b!324957))

(assert (= (and b!324957 res!178428) b!324955))

(declare-fun m!331381 () Bool)

(assert (=> b!324953 m!331381))

(declare-fun m!331383 () Bool)

(assert (=> b!324955 m!331383))

(declare-fun m!331385 () Bool)

(assert (=> b!324949 m!331385))

(declare-fun m!331387 () Bool)

(assert (=> b!324952 m!331387))

(declare-fun m!331389 () Bool)

(assert (=> b!324948 m!331389))

(assert (=> b!324948 m!331389))

(declare-fun m!331391 () Bool)

(assert (=> b!324948 m!331391))

(declare-fun m!331393 () Bool)

(assert (=> b!324951 m!331393))

(declare-fun m!331395 () Bool)

(assert (=> b!324957 m!331395))

(declare-fun m!331397 () Bool)

(assert (=> start!32504 m!331397))

(declare-fun m!331399 () Bool)

(assert (=> start!32504 m!331399))

(declare-fun m!331401 () Bool)

(assert (=> b!324956 m!331401))

(declare-fun m!331403 () Bool)

(assert (=> b!324954 m!331403))

(check-sat (not b!324949) (not b!324951) (not start!32504) (not b!324948) (not b!324955) (not b!324952) (not b!324953) (not b!324956))
(check-sat)
