; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48576 () Bool)

(assert start!48576)

(declare-fun b!533352 () Bool)

(declare-fun res!328560 () Bool)

(declare-fun e!310381 () Bool)

(assert (=> b!533352 (=> (not res!328560) (not e!310381))))

(declare-datatypes ((array!33788 0))(
  ( (array!33789 (arr!16233 (Array (_ BitVec 32) (_ BitVec 64))) (size!16597 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33788)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33788 (_ BitVec 32)) Bool)

(assert (=> b!533352 (= res!328560 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!533353 () Bool)

(declare-fun res!328559 () Bool)

(assert (=> b!533353 (=> (not res!328559) (not e!310381))))

(declare-datatypes ((List!10352 0))(
  ( (Nil!10349) (Cons!10348 (h!11291 (_ BitVec 64)) (t!16580 List!10352)) )
))
(declare-fun arrayNoDuplicates!0 (array!33788 (_ BitVec 32) List!10352) Bool)

(assert (=> b!533353 (= res!328559 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10349))))

(declare-fun b!533354 () Bool)

(declare-fun res!328561 () Bool)

(declare-fun e!310382 () Bool)

(assert (=> b!533354 (=> (not res!328561) (not e!310382))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!533354 (= res!328561 (validKeyInArray!0 k!1998))))

(declare-fun b!533355 () Bool)

(assert (=> b!533355 (= e!310381 false)))

(declare-fun index!1177 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4691 0))(
  ( (MissingZero!4691 (index!20988 (_ BitVec 32))) (Found!4691 (index!20989 (_ BitVec 32))) (Intermediate!4691 (undefined!5503 Bool) (index!20990 (_ BitVec 32)) (x!49962 (_ BitVec 32))) (Undefined!4691) (MissingVacant!4691 (index!20991 (_ BitVec 32))) )
))
(declare-fun lt!245430 () SeekEntryResult!4691)

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33788 (_ BitVec 32)) SeekEntryResult!4691)

(assert (=> b!533355 (= lt!245430 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16233 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!533356 () Bool)

(assert (=> b!533356 (= e!310382 e!310381)))

(declare-fun res!328558 () Bool)

(assert (=> b!533356 (=> (not res!328558) (not e!310381))))

(declare-fun lt!245431 () SeekEntryResult!4691)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!533356 (= res!328558 (or (= lt!245431 (MissingZero!4691 i!1153)) (= lt!245431 (MissingVacant!4691 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33788 (_ BitVec 32)) SeekEntryResult!4691)

(assert (=> b!533356 (= lt!245431 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun res!328562 () Bool)

(assert (=> start!48576 (=> (not res!328562) (not e!310382))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48576 (= res!328562 (validMask!0 mask!3216))))

(assert (=> start!48576 e!310382))

(assert (=> start!48576 true))

(declare-fun array_inv!12029 (array!33788) Bool)

(assert (=> start!48576 (array_inv!12029 a!3154)))

(declare-fun b!533357 () Bool)

(declare-fun res!328565 () Bool)

(assert (=> b!533357 (=> (not res!328565) (not e!310382))))

(assert (=> b!533357 (= res!328565 (and (= (size!16597 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16597 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16597 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!533358 () Bool)

(declare-fun res!328564 () Bool)

(assert (=> b!533358 (=> (not res!328564) (not e!310381))))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!533358 (= res!328564 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16597 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16597 a!3154)) (= (select (arr!16233 a!3154) resIndex!32) (select (arr!16233 a!3154) j!147))))))

(declare-fun b!533359 () Bool)

(declare-fun res!328557 () Bool)

(assert (=> b!533359 (=> (not res!328557) (not e!310382))))

(assert (=> b!533359 (= res!328557 (validKeyInArray!0 (select (arr!16233 a!3154) j!147)))))

(declare-fun b!533360 () Bool)

(declare-fun res!328563 () Bool)

(assert (=> b!533360 (=> (not res!328563) (not e!310382))))

(declare-fun arrayContainsKey!0 (array!33788 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!533360 (= res!328563 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(assert (= (and start!48576 res!328562) b!533357))

(assert (= (and b!533357 res!328565) b!533359))

(assert (= (and b!533359 res!328557) b!533354))

(assert (= (and b!533354 res!328561) b!533360))

(assert (= (and b!533360 res!328563) b!533356))

(assert (= (and b!533356 res!328558) b!533352))

(assert (= (and b!533352 res!328560) b!533353))

(assert (= (and b!533353 res!328559) b!533358))

(assert (= (and b!533358 res!328564) b!533355))

(declare-fun m!513249 () Bool)

(assert (=> b!533355 m!513249))

(assert (=> b!533355 m!513249))

(declare-fun m!513251 () Bool)

(assert (=> b!533355 m!513251))

(declare-fun m!513253 () Bool)

(assert (=> b!533360 m!513253))

(declare-fun m!513255 () Bool)

(assert (=> b!533358 m!513255))

(assert (=> b!533358 m!513249))

(declare-fun m!513257 () Bool)

(assert (=> b!533353 m!513257))

(declare-fun m!513259 () Bool)

(assert (=> b!533356 m!513259))

(declare-fun m!513261 () Bool)

(assert (=> b!533352 m!513261))

(declare-fun m!513263 () Bool)

(assert (=> b!533354 m!513263))

(declare-fun m!513265 () Bool)

(assert (=> start!48576 m!513265))

(declare-fun m!513267 () Bool)

(assert (=> start!48576 m!513267))

(assert (=> b!533359 m!513249))

(assert (=> b!533359 m!513249))

(declare-fun m!513269 () Bool)

(assert (=> b!533359 m!513269))

(push 1)

