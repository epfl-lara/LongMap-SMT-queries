; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48580 () Bool)

(assert start!48580)

(declare-fun b!533406 () Bool)

(declare-fun e!310400 () Bool)

(assert (=> b!533406 (= e!310400 false)))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4693 0))(
  ( (MissingZero!4693 (index!20996 (_ BitVec 32))) (Found!4693 (index!20997 (_ BitVec 32))) (Intermediate!4693 (undefined!5505 Bool) (index!20998 (_ BitVec 32)) (x!49964 (_ BitVec 32))) (Undefined!4693) (MissingVacant!4693 (index!20999 (_ BitVec 32))) )
))
(declare-fun lt!245442 () SeekEntryResult!4693)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!33792 0))(
  ( (array!33793 (arr!16235 (Array (_ BitVec 32) (_ BitVec 64))) (size!16599 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33792)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33792 (_ BitVec 32)) SeekEntryResult!4693)

(assert (=> b!533406 (= lt!245442 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16235 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!533407 () Bool)

(declare-fun res!328617 () Bool)

(declare-fun e!310399 () Bool)

(assert (=> b!533407 (=> (not res!328617) (not e!310399))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!533407 (= res!328617 (and (= (size!16599 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16599 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16599 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!533408 () Bool)

(declare-fun res!328615 () Bool)

(assert (=> b!533408 (=> (not res!328615) (not e!310399))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!533408 (= res!328615 (validKeyInArray!0 (select (arr!16235 a!3154) j!147)))))

(declare-fun res!328619 () Bool)

(assert (=> start!48580 (=> (not res!328619) (not e!310399))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48580 (= res!328619 (validMask!0 mask!3216))))

(assert (=> start!48580 e!310399))

(assert (=> start!48580 true))

(declare-fun array_inv!12031 (array!33792) Bool)

(assert (=> start!48580 (array_inv!12031 a!3154)))

(declare-fun b!533409 () Bool)

(declare-fun res!328611 () Bool)

(assert (=> b!533409 (=> (not res!328611) (not e!310400))))

(declare-datatypes ((List!10354 0))(
  ( (Nil!10351) (Cons!10350 (h!11293 (_ BitVec 64)) (t!16582 List!10354)) )
))
(declare-fun arrayNoDuplicates!0 (array!33792 (_ BitVec 32) List!10354) Bool)

(assert (=> b!533409 (= res!328611 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10351))))

(declare-fun b!533410 () Bool)

(declare-fun res!328616 () Bool)

(assert (=> b!533410 (=> (not res!328616) (not e!310400))))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!533410 (= res!328616 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16599 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16599 a!3154)) (= (select (arr!16235 a!3154) resIndex!32) (select (arr!16235 a!3154) j!147))))))

(declare-fun b!533411 () Bool)

(declare-fun res!328613 () Bool)

(assert (=> b!533411 (=> (not res!328613) (not e!310399))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33792 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!533411 (= res!328613 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!533412 () Bool)

(declare-fun res!328618 () Bool)

(assert (=> b!533412 (=> (not res!328618) (not e!310399))))

(assert (=> b!533412 (= res!328618 (validKeyInArray!0 k!1998))))

(declare-fun b!533413 () Bool)

(declare-fun res!328614 () Bool)

(assert (=> b!533413 (=> (not res!328614) (not e!310400))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33792 (_ BitVec 32)) Bool)

(assert (=> b!533413 (= res!328614 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!533414 () Bool)

(assert (=> b!533414 (= e!310399 e!310400)))

(declare-fun res!328612 () Bool)

(assert (=> b!533414 (=> (not res!328612) (not e!310400))))

(declare-fun lt!245443 () SeekEntryResult!4693)

(assert (=> b!533414 (= res!328612 (or (= lt!245443 (MissingZero!4693 i!1153)) (= lt!245443 (MissingVacant!4693 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33792 (_ BitVec 32)) SeekEntryResult!4693)

(assert (=> b!533414 (= lt!245443 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(assert (= (and start!48580 res!328619) b!533407))

(assert (= (and b!533407 res!328617) b!533408))

(assert (= (and b!533408 res!328615) b!533412))

(assert (= (and b!533412 res!328618) b!533411))

(assert (= (and b!533411 res!328613) b!533414))

(assert (= (and b!533414 res!328612) b!533413))

(assert (= (and b!533413 res!328614) b!533409))

(assert (= (and b!533409 res!328611) b!533410))

(assert (= (and b!533410 res!328616) b!533406))

(declare-fun m!513293 () Bool)

(assert (=> b!533406 m!513293))

(assert (=> b!533406 m!513293))

(declare-fun m!513295 () Bool)

(assert (=> b!533406 m!513295))

(declare-fun m!513297 () Bool)

(assert (=> b!533411 m!513297))

(declare-fun m!513299 () Bool)

(assert (=> b!533414 m!513299))

(declare-fun m!513301 () Bool)

(assert (=> b!533410 m!513301))

(assert (=> b!533410 m!513293))

(declare-fun m!513303 () Bool)

(assert (=> b!533412 m!513303))

(assert (=> b!533408 m!513293))

(assert (=> b!533408 m!513293))

(declare-fun m!513305 () Bool)

(assert (=> b!533408 m!513305))

(declare-fun m!513307 () Bool)

(assert (=> start!48580 m!513307))

(declare-fun m!513309 () Bool)

(assert (=> start!48580 m!513309))

(declare-fun m!513311 () Bool)

(assert (=> b!533409 m!513311))

(declare-fun m!513313 () Bool)

(assert (=> b!533413 m!513313))

(push 1)

(assert (not start!48580))

(assert (not b!533414))

(assert (not b!533409))

(assert (not b!533411))

(assert (not b!533412))

(assert (not b!533408))

(assert (not b!533406))

(assert (not b!533413))

(check-sat)

