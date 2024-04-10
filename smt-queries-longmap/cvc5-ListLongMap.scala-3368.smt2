; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46260 () Bool)

(assert start!46260)

(declare-fun b!512390 () Bool)

(declare-fun res!313056 () Bool)

(declare-fun e!299244 () Bool)

(assert (=> b!512390 (=> (not res!313056) (not e!299244))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!512390 (= res!313056 (validKeyInArray!0 k!2280))))

(declare-fun b!512391 () Bool)

(declare-fun e!299245 () Bool)

(assert (=> b!512391 (= e!299244 e!299245)))

(declare-fun res!313059 () Bool)

(assert (=> b!512391 (=> (not res!313059) (not e!299245))))

(declare-datatypes ((SeekEntryResult!4301 0))(
  ( (MissingZero!4301 (index!19392 (_ BitVec 32))) (Found!4301 (index!19393 (_ BitVec 32))) (Intermediate!4301 (undefined!5113 Bool) (index!19394 (_ BitVec 32)) (x!48340 (_ BitVec 32))) (Undefined!4301) (MissingVacant!4301 (index!19395 (_ BitVec 32))) )
))
(declare-fun lt!234551 () SeekEntryResult!4301)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!512391 (= res!313059 (or (= lt!234551 (MissingZero!4301 i!1204)) (= lt!234551 (MissingVacant!4301 i!1204))))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!32914 0))(
  ( (array!32915 (arr!15834 (Array (_ BitVec 32) (_ BitVec 64))) (size!16198 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32914)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32914 (_ BitVec 32)) SeekEntryResult!4301)

(assert (=> b!512391 (= lt!234551 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!512392 () Bool)

(declare-fun res!313060 () Bool)

(assert (=> b!512392 (=> (not res!313060) (not e!299244))))

(declare-fun arrayContainsKey!0 (array!32914 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!512392 (= res!313060 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!512393 () Bool)

(declare-fun res!313052 () Bool)

(assert (=> b!512393 (=> (not res!313052) (not e!299244))))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!512393 (= res!313052 (and (= (size!16198 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16198 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16198 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!512394 () Bool)

(declare-fun res!313058 () Bool)

(assert (=> b!512394 (=> (not res!313058) (not e!299245))))

(declare-datatypes ((List!9992 0))(
  ( (Nil!9989) (Cons!9988 (h!10868 (_ BitVec 64)) (t!16220 List!9992)) )
))
(declare-fun arrayNoDuplicates!0 (array!32914 (_ BitVec 32) List!9992) Bool)

(assert (=> b!512394 (= res!313058 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9989))))

(declare-fun res!313055 () Bool)

(assert (=> start!46260 (=> (not res!313055) (not e!299244))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46260 (= res!313055 (validMask!0 mask!3524))))

(assert (=> start!46260 e!299244))

(assert (=> start!46260 true))

(declare-fun array_inv!11630 (array!32914) Bool)

(assert (=> start!46260 (array_inv!11630 a!3235)))

(declare-fun b!512395 () Bool)

(declare-fun res!313054 () Bool)

(assert (=> b!512395 (=> (not res!313054) (not e!299245))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32914 (_ BitVec 32)) Bool)

(assert (=> b!512395 (= res!313054 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!512396 () Bool)

(declare-fun res!313057 () Bool)

(declare-fun e!299246 () Bool)

(assert (=> b!512396 (=> res!313057 e!299246)))

(declare-fun lt!234553 () SeekEntryResult!4301)

(assert (=> b!512396 (= res!313057 (or (not (is-Intermediate!4301 lt!234553)) (not (undefined!5113 lt!234553))))))

(declare-fun b!512397 () Bool)

(declare-fun res!313061 () Bool)

(assert (=> b!512397 (=> (not res!313061) (not e!299244))))

(assert (=> b!512397 (= res!313061 (validKeyInArray!0 (select (arr!15834 a!3235) j!176)))))

(declare-fun b!512398 () Bool)

(assert (=> b!512398 (= e!299246 true)))

(declare-fun lt!234555 () SeekEntryResult!4301)

(assert (=> b!512398 (= lt!234555 Undefined!4301)))

(declare-fun b!512399 () Bool)

(assert (=> b!512399 (= e!299245 (not e!299246))))

(declare-fun res!313053 () Bool)

(assert (=> b!512399 (=> res!313053 e!299246)))

(declare-fun lt!234556 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32914 (_ BitVec 32)) SeekEntryResult!4301)

(assert (=> b!512399 (= res!313053 (= lt!234553 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234556 (select (store (arr!15834 a!3235) i!1204 k!2280) j!176) (array!32915 (store (arr!15834 a!3235) i!1204 k!2280) (size!16198 a!3235)) mask!3524)))))

(declare-fun lt!234552 () (_ BitVec 32))

(assert (=> b!512399 (= lt!234553 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234552 (select (arr!15834 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!512399 (= lt!234556 (toIndex!0 (select (store (arr!15834 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!512399 (= lt!234552 (toIndex!0 (select (arr!15834 a!3235) j!176) mask!3524))))

(assert (=> b!512399 (= lt!234555 (Found!4301 j!176))))

(assert (=> b!512399 (= lt!234555 (seekEntryOrOpen!0 (select (arr!15834 a!3235) j!176) a!3235 mask!3524))))

(assert (=> b!512399 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!15860 0))(
  ( (Unit!15861) )
))
(declare-fun lt!234554 () Unit!15860)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32914 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15860)

(assert (=> b!512399 (= lt!234554 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (= (and start!46260 res!313055) b!512393))

(assert (= (and b!512393 res!313052) b!512397))

(assert (= (and b!512397 res!313061) b!512390))

(assert (= (and b!512390 res!313056) b!512392))

(assert (= (and b!512392 res!313060) b!512391))

(assert (= (and b!512391 res!313059) b!512395))

(assert (= (and b!512395 res!313054) b!512394))

(assert (= (and b!512394 res!313058) b!512399))

(assert (= (and b!512399 (not res!313053)) b!512396))

(assert (= (and b!512396 (not res!313057)) b!512398))

(declare-fun m!494037 () Bool)

(assert (=> b!512397 m!494037))

(assert (=> b!512397 m!494037))

(declare-fun m!494039 () Bool)

(assert (=> b!512397 m!494039))

(declare-fun m!494041 () Bool)

(assert (=> b!512399 m!494041))

(declare-fun m!494043 () Bool)

(assert (=> b!512399 m!494043))

(declare-fun m!494045 () Bool)

(assert (=> b!512399 m!494045))

(assert (=> b!512399 m!494037))

(declare-fun m!494047 () Bool)

(assert (=> b!512399 m!494047))

(assert (=> b!512399 m!494037))

(declare-fun m!494049 () Bool)

(assert (=> b!512399 m!494049))

(assert (=> b!512399 m!494037))

(declare-fun m!494051 () Bool)

(assert (=> b!512399 m!494051))

(assert (=> b!512399 m!494037))

(declare-fun m!494053 () Bool)

(assert (=> b!512399 m!494053))

(assert (=> b!512399 m!494045))

(declare-fun m!494055 () Bool)

(assert (=> b!512399 m!494055))

(assert (=> b!512399 m!494045))

(declare-fun m!494057 () Bool)

(assert (=> b!512399 m!494057))

(declare-fun m!494059 () Bool)

(assert (=> b!512395 m!494059))

(declare-fun m!494061 () Bool)

(assert (=> b!512392 m!494061))

(declare-fun m!494063 () Bool)

(assert (=> b!512394 m!494063))

(declare-fun m!494065 () Bool)

(assert (=> b!512390 m!494065))

(declare-fun m!494067 () Bool)

(assert (=> b!512391 m!494067))

(declare-fun m!494069 () Bool)

(assert (=> start!46260 m!494069))

(declare-fun m!494071 () Bool)

(assert (=> start!46260 m!494071))

(push 1)

