; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48586 () Bool)

(assert start!48586)

(declare-fun b!533495 () Bool)

(declare-fun res!328704 () Bool)

(declare-fun e!310426 () Bool)

(assert (=> b!533495 (=> (not res!328704) (not e!310426))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!533495 (= res!328704 (validKeyInArray!0 k!1998))))

(declare-fun b!533496 () Bool)

(declare-fun e!310427 () Bool)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun index!1177 () (_ BitVec 32))

(assert (=> b!533496 (= e!310427 (and (bvsge mask!3216 #b00000000000000000000000000000000) (bvsge index!1177 (bvadd #b00000000000000000000000000000001 mask!3216))))))

(declare-fun b!533497 () Bool)

(declare-fun res!328701 () Bool)

(assert (=> b!533497 (=> (not res!328701) (not e!310427))))

(declare-datatypes ((array!33798 0))(
  ( (array!33799 (arr!16238 (Array (_ BitVec 32) (_ BitVec 64))) (size!16602 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33798)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33798 (_ BitVec 32)) Bool)

(assert (=> b!533497 (= res!328701 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!533498 () Bool)

(declare-fun res!328709 () Bool)

(assert (=> b!533498 (=> (not res!328709) (not e!310427))))

(declare-datatypes ((List!10357 0))(
  ( (Nil!10354) (Cons!10353 (h!11296 (_ BitVec 64)) (t!16585 List!10357)) )
))
(declare-fun arrayNoDuplicates!0 (array!33798 (_ BitVec 32) List!10357) Bool)

(assert (=> b!533498 (= res!328709 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10354))))

(declare-fun b!533499 () Bool)

(declare-fun res!328700 () Bool)

(assert (=> b!533499 (=> (not res!328700) (not e!310426))))

(declare-fun arrayContainsKey!0 (array!33798 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!533499 (= res!328700 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!533500 () Bool)

(assert (=> b!533500 (= e!310426 e!310427)))

(declare-fun res!328708 () Bool)

(assert (=> b!533500 (=> (not res!328708) (not e!310427))))

(declare-datatypes ((SeekEntryResult!4696 0))(
  ( (MissingZero!4696 (index!21008 (_ BitVec 32))) (Found!4696 (index!21009 (_ BitVec 32))) (Intermediate!4696 (undefined!5508 Bool) (index!21010 (_ BitVec 32)) (x!49975 (_ BitVec 32))) (Undefined!4696) (MissingVacant!4696 (index!21011 (_ BitVec 32))) )
))
(declare-fun lt!245452 () SeekEntryResult!4696)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!533500 (= res!328708 (or (= lt!245452 (MissingZero!4696 i!1153)) (= lt!245452 (MissingVacant!4696 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33798 (_ BitVec 32)) SeekEntryResult!4696)

(assert (=> b!533500 (= lt!245452 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!533501 () Bool)

(declare-fun res!328707 () Bool)

(assert (=> b!533501 (=> (not res!328707) (not e!310426))))

(declare-fun j!147 () (_ BitVec 32))

(assert (=> b!533501 (= res!328707 (and (= (size!16602 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16602 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16602 a!3154)) (not (= i!1153 j!147))))))

(declare-fun res!328702 () Bool)

(assert (=> start!48586 (=> (not res!328702) (not e!310426))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48586 (= res!328702 (validMask!0 mask!3216))))

(assert (=> start!48586 e!310426))

(assert (=> start!48586 true))

(declare-fun array_inv!12034 (array!33798) Bool)

(assert (=> start!48586 (array_inv!12034 a!3154)))

(declare-fun b!533502 () Bool)

(declare-fun res!328705 () Bool)

(assert (=> b!533502 (=> (not res!328705) (not e!310427))))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33798 (_ BitVec 32)) SeekEntryResult!4696)

(assert (=> b!533502 (= res!328705 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16238 a!3154) j!147) a!3154 mask!3216) (Intermediate!4696 false resIndex!32 resX!32)))))

(declare-fun b!533503 () Bool)

(declare-fun res!328703 () Bool)

(assert (=> b!533503 (=> (not res!328703) (not e!310426))))

(assert (=> b!533503 (= res!328703 (validKeyInArray!0 (select (arr!16238 a!3154) j!147)))))

(declare-fun b!533504 () Bool)

(declare-fun res!328706 () Bool)

(assert (=> b!533504 (=> (not res!328706) (not e!310427))))

(assert (=> b!533504 (= res!328706 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16602 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16602 a!3154)) (= (select (arr!16238 a!3154) resIndex!32) (select (arr!16238 a!3154) j!147))))))

(assert (= (and start!48586 res!328702) b!533501))

(assert (= (and b!533501 res!328707) b!533503))

(assert (= (and b!533503 res!328703) b!533495))

(assert (= (and b!533495 res!328704) b!533499))

(assert (= (and b!533499 res!328700) b!533500))

(assert (= (and b!533500 res!328708) b!533497))

(assert (= (and b!533497 res!328701) b!533498))

(assert (= (and b!533498 res!328709) b!533504))

(assert (= (and b!533504 res!328706) b!533502))

(assert (= (and b!533502 res!328705) b!533496))

(declare-fun m!513359 () Bool)

(assert (=> b!533495 m!513359))

(declare-fun m!513361 () Bool)

(assert (=> b!533503 m!513361))

(assert (=> b!533503 m!513361))

(declare-fun m!513363 () Bool)

(assert (=> b!533503 m!513363))

(declare-fun m!513365 () Bool)

(assert (=> b!533504 m!513365))

(assert (=> b!533504 m!513361))

(declare-fun m!513367 () Bool)

(assert (=> b!533497 m!513367))

(assert (=> b!533502 m!513361))

(assert (=> b!533502 m!513361))

(declare-fun m!513369 () Bool)

(assert (=> b!533502 m!513369))

(declare-fun m!513371 () Bool)

(assert (=> start!48586 m!513371))

(declare-fun m!513373 () Bool)

(assert (=> start!48586 m!513373))

(declare-fun m!513375 () Bool)

(assert (=> b!533500 m!513375))

(declare-fun m!513377 () Bool)

(assert (=> b!533498 m!513377))

(declare-fun m!513379 () Bool)

(assert (=> b!533499 m!513379))

(push 1)

(assert (not b!533500))

(assert (not b!533497))

(assert (not start!48586))

(assert (not b!533503))

(assert (not b!533499))

(assert (not b!533498))

(assert (not b!533495))

(assert (not b!533502))

(check-sat)

(pop 1)

(push 1)

(check-sat)

