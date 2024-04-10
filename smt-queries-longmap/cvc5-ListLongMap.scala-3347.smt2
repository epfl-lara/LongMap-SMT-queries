; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46074 () Bool)

(assert start!46074)

(declare-fun b!510297 () Bool)

(declare-fun e!298304 () Bool)

(declare-fun e!298303 () Bool)

(assert (=> b!510297 (= e!298304 e!298303)))

(declare-fun res!311150 () Bool)

(assert (=> b!510297 (=> (not res!311150) (not e!298303))))

(declare-datatypes ((SeekEntryResult!4238 0))(
  ( (MissingZero!4238 (index!19140 (_ BitVec 32))) (Found!4238 (index!19141 (_ BitVec 32))) (Intermediate!4238 (undefined!5050 Bool) (index!19142 (_ BitVec 32)) (x!48103 (_ BitVec 32))) (Undefined!4238) (MissingVacant!4238 (index!19143 (_ BitVec 32))) )
))
(declare-fun lt!233292 () SeekEntryResult!4238)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!510297 (= res!311150 (or (= lt!233292 (MissingZero!4238 i!1204)) (= lt!233292 (MissingVacant!4238 i!1204))))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!32785 0))(
  ( (array!32786 (arr!15771 (Array (_ BitVec 32) (_ BitVec 64))) (size!16135 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32785)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32785 (_ BitVec 32)) SeekEntryResult!4238)

(assert (=> b!510297 (= lt!233292 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!510299 () Bool)

(declare-fun res!311149 () Bool)

(assert (=> b!510299 (=> (not res!311149) (not e!298303))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32785 (_ BitVec 32)) Bool)

(assert (=> b!510299 (= res!311149 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!510300 () Bool)

(declare-fun res!311145 () Bool)

(assert (=> b!510300 (=> (not res!311145) (not e!298304))))

(declare-fun arrayContainsKey!0 (array!32785 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!510300 (= res!311145 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!510301 () Bool)

(declare-fun res!311142 () Bool)

(assert (=> b!510301 (=> (not res!311142) (not e!298304))))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!510301 (= res!311142 (and (= (size!16135 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16135 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16135 a!3235)) (not (= i!1204 j!176))))))

(declare-fun res!311147 () Bool)

(assert (=> start!46074 (=> (not res!311147) (not e!298304))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46074 (= res!311147 (validMask!0 mask!3524))))

(assert (=> start!46074 e!298304))

(assert (=> start!46074 true))

(declare-fun array_inv!11567 (array!32785) Bool)

(assert (=> start!46074 (array_inv!11567 a!3235)))

(declare-fun b!510298 () Bool)

(declare-fun e!298302 () Bool)

(assert (=> b!510298 (= e!298303 (not e!298302))))

(declare-fun res!311144 () Bool)

(assert (=> b!510298 (=> res!311144 e!298302)))

(declare-fun lt!233290 () (_ BitVec 64))

(declare-fun lt!233291 () array!32785)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32785 (_ BitVec 32)) SeekEntryResult!4238)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!510298 (= res!311144 (not (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15771 a!3235) j!176) mask!3524) (select (arr!15771 a!3235) j!176) a!3235 mask!3524) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!233290 mask!3524) lt!233290 lt!233291 mask!3524))))))

(assert (=> b!510298 (= lt!233290 (select (store (arr!15771 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!510298 (= lt!233291 (array!32786 (store (arr!15771 a!3235) i!1204 k!2280) (size!16135 a!3235)))))

(declare-fun lt!233288 () SeekEntryResult!4238)

(assert (=> b!510298 (= lt!233288 (Found!4238 j!176))))

(assert (=> b!510298 (= lt!233288 (seekEntryOrOpen!0 (select (arr!15771 a!3235) j!176) a!3235 mask!3524))))

(assert (=> b!510298 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!15734 0))(
  ( (Unit!15735) )
))
(declare-fun lt!233293 () Unit!15734)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32785 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15734)

(assert (=> b!510298 (= lt!233293 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!510302 () Bool)

(declare-fun res!311146 () Bool)

(assert (=> b!510302 (=> (not res!311146) (not e!298303))))

(declare-datatypes ((List!9929 0))(
  ( (Nil!9926) (Cons!9925 (h!10802 (_ BitVec 64)) (t!16157 List!9929)) )
))
(declare-fun arrayNoDuplicates!0 (array!32785 (_ BitVec 32) List!9929) Bool)

(assert (=> b!510302 (= res!311146 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9926))))

(declare-fun b!510303 () Bool)

(declare-fun res!311148 () Bool)

(assert (=> b!510303 (=> (not res!311148) (not e!298304))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!510303 (= res!311148 (validKeyInArray!0 k!2280))))

(declare-fun b!510304 () Bool)

(declare-fun res!311143 () Bool)

(assert (=> b!510304 (=> (not res!311143) (not e!298304))))

(assert (=> b!510304 (= res!311143 (validKeyInArray!0 (select (arr!15771 a!3235) j!176)))))

(declare-fun b!510305 () Bool)

(assert (=> b!510305 (= e!298302 true)))

(assert (=> b!510305 (= lt!233288 (seekEntryOrOpen!0 lt!233290 lt!233291 mask!3524))))

(declare-fun lt!233289 () Unit!15734)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 (array!32785 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!15734)

(assert (=> b!510305 (= lt!233289 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 a!3235 i!1204 k!2280 j!176 mask!3524))))

(assert (= (and start!46074 res!311147) b!510301))

(assert (= (and b!510301 res!311142) b!510304))

(assert (= (and b!510304 res!311143) b!510303))

(assert (= (and b!510303 res!311148) b!510300))

(assert (= (and b!510300 res!311145) b!510297))

(assert (= (and b!510297 res!311150) b!510299))

(assert (= (and b!510299 res!311149) b!510302))

(assert (= (and b!510302 res!311146) b!510298))

(assert (= (and b!510298 (not res!311144)) b!510305))

(declare-fun m!491493 () Bool)

(assert (=> start!46074 m!491493))

(declare-fun m!491495 () Bool)

(assert (=> start!46074 m!491495))

(declare-fun m!491497 () Bool)

(assert (=> b!510297 m!491497))

(declare-fun m!491499 () Bool)

(assert (=> b!510302 m!491499))

(declare-fun m!491501 () Bool)

(assert (=> b!510298 m!491501))

(declare-fun m!491503 () Bool)

(assert (=> b!510298 m!491503))

(declare-fun m!491505 () Bool)

(assert (=> b!510298 m!491505))

(declare-fun m!491507 () Bool)

(assert (=> b!510298 m!491507))

(declare-fun m!491509 () Bool)

(assert (=> b!510298 m!491509))

(declare-fun m!491511 () Bool)

(assert (=> b!510298 m!491511))

(declare-fun m!491513 () Bool)

(assert (=> b!510298 m!491513))

(assert (=> b!510298 m!491511))

(declare-fun m!491515 () Bool)

(assert (=> b!510298 m!491515))

(assert (=> b!510298 m!491511))

(declare-fun m!491517 () Bool)

(assert (=> b!510298 m!491517))

(assert (=> b!510298 m!491511))

(assert (=> b!510298 m!491509))

(assert (=> b!510298 m!491501))

(declare-fun m!491519 () Bool)

(assert (=> b!510298 m!491519))

(declare-fun m!491521 () Bool)

(assert (=> b!510303 m!491521))

(declare-fun m!491523 () Bool)

(assert (=> b!510300 m!491523))

(declare-fun m!491525 () Bool)

(assert (=> b!510299 m!491525))

(declare-fun m!491527 () Bool)

(assert (=> b!510305 m!491527))

(declare-fun m!491529 () Bool)

(assert (=> b!510305 m!491529))

(assert (=> b!510304 m!491511))

(assert (=> b!510304 m!491511))

(declare-fun m!491531 () Bool)

(assert (=> b!510304 m!491531))

(push 1)

