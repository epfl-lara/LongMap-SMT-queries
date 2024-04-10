; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33292 () Bool)

(assert start!33292)

(declare-fun b!331046 () Bool)

(declare-fun res!182454 () Bool)

(declare-fun e!203130 () Bool)

(assert (=> b!331046 (=> (not res!182454) (not e!203130))))

(declare-datatypes ((array!16900 0))(
  ( (array!16901 (arr!7991 (Array (_ BitVec 32) (_ BitVec 64))) (size!8343 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16900)

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!16900 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!331046 (= res!182454 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!331047 () Bool)

(declare-fun res!182449 () Bool)

(declare-fun e!203131 () Bool)

(assert (=> b!331047 (=> (not res!182449) (not e!203131))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!331047 (= res!182449 (and (= (select (arr!7991 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8343 a!3305))))))

(declare-fun b!331048 () Bool)

(assert (=> b!331048 (= e!203130 e!203131)))

(declare-fun res!182451 () Bool)

(assert (=> b!331048 (=> (not res!182451) (not e!203131))))

(declare-datatypes ((SeekEntryResult!3122 0))(
  ( (MissingZero!3122 (index!14664 (_ BitVec 32))) (Found!3122 (index!14665 (_ BitVec 32))) (Intermediate!3122 (undefined!3934 Bool) (index!14666 (_ BitVec 32)) (x!32954 (_ BitVec 32))) (Undefined!3122) (MissingVacant!3122 (index!14667 (_ BitVec 32))) )
))
(declare-fun lt!158703 () SeekEntryResult!3122)

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16900 (_ BitVec 32)) SeekEntryResult!3122)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!331048 (= res!182451 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!158703))))

(assert (=> b!331048 (= lt!158703 (Intermediate!3122 false resIndex!58 resX!58))))

(declare-fun res!182455 () Bool)

(assert (=> start!33292 (=> (not res!182455) (not e!203130))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33292 (= res!182455 (validMask!0 mask!3777))))

(assert (=> start!33292 e!203130))

(declare-fun array_inv!5954 (array!16900) Bool)

(assert (=> start!33292 (array_inv!5954 a!3305)))

(assert (=> start!33292 true))

(declare-fun b!331049 () Bool)

(declare-fun res!182448 () Bool)

(assert (=> b!331049 (=> (not res!182448) (not e!203130))))

(assert (=> b!331049 (= res!182448 (and (= (size!8343 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8343 a!3305))))))

(declare-fun b!331050 () Bool)

(declare-fun res!182450 () Bool)

(assert (=> b!331050 (=> (not res!182450) (not e!203130))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!331050 (= res!182450 (validKeyInArray!0 k!2497))))

(declare-fun b!331051 () Bool)

(declare-fun res!182453 () Bool)

(assert (=> b!331051 (=> (not res!182453) (not e!203130))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16900 (_ BitVec 32)) Bool)

(assert (=> b!331051 (= res!182453 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!331052 () Bool)

(assert (=> b!331052 (= e!203131 false)))

(declare-datatypes ((Unit!10323 0))(
  ( (Unit!10324) )
))
(declare-fun lt!158702 () Unit!10323)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 (array!16900 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10323)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!331052 (= lt!158702 (lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 a!3305 i!1250 k!2497 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) resIndex!58 resX!58 mask!3777))))

(declare-fun b!331053 () Bool)

(declare-fun res!182456 () Bool)

(assert (=> b!331053 (=> (not res!182456) (not e!203131))))

(assert (=> b!331053 (= res!182456 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7991 a!3305) index!1840) k!2497)) (not (= x!1490 resX!58))))))

(declare-fun b!331054 () Bool)

(declare-fun res!182452 () Bool)

(assert (=> b!331054 (=> (not res!182452) (not e!203131))))

(assert (=> b!331054 (= res!182452 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!158703))))

(declare-fun b!331055 () Bool)

(declare-fun res!182457 () Bool)

(assert (=> b!331055 (=> (not res!182457) (not e!203130))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16900 (_ BitVec 32)) SeekEntryResult!3122)

(assert (=> b!331055 (= res!182457 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!3122 i!1250)))))

(assert (= (and start!33292 res!182455) b!331049))

(assert (= (and b!331049 res!182448) b!331050))

(assert (= (and b!331050 res!182450) b!331046))

(assert (= (and b!331046 res!182454) b!331055))

(assert (= (and b!331055 res!182457) b!331051))

(assert (= (and b!331051 res!182453) b!331048))

(assert (= (and b!331048 res!182451) b!331047))

(assert (= (and b!331047 res!182449) b!331054))

(assert (= (and b!331054 res!182452) b!331053))

(assert (= (and b!331053 res!182456) b!331052))

(declare-fun m!336053 () Bool)

(assert (=> b!331048 m!336053))

(assert (=> b!331048 m!336053))

(declare-fun m!336055 () Bool)

(assert (=> b!331048 m!336055))

(declare-fun m!336057 () Bool)

(assert (=> start!33292 m!336057))

(declare-fun m!336059 () Bool)

(assert (=> start!33292 m!336059))

(declare-fun m!336061 () Bool)

(assert (=> b!331052 m!336061))

(assert (=> b!331052 m!336061))

(declare-fun m!336063 () Bool)

(assert (=> b!331052 m!336063))

(declare-fun m!336065 () Bool)

(assert (=> b!331050 m!336065))

(declare-fun m!336067 () Bool)

(assert (=> b!331054 m!336067))

(declare-fun m!336069 () Bool)

(assert (=> b!331047 m!336069))

(declare-fun m!336071 () Bool)

(assert (=> b!331051 m!336071))

(declare-fun m!336073 () Bool)

(assert (=> b!331053 m!336073))

(declare-fun m!336075 () Bool)

(assert (=> b!331055 m!336075))

(declare-fun m!336077 () Bool)

(assert (=> b!331046 m!336077))

(push 1)

