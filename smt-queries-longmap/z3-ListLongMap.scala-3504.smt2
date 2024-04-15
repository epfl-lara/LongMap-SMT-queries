; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48582 () Bool)

(assert start!48582)

(declare-fun b!533342 () Bool)

(declare-fun res!328692 () Bool)

(declare-fun e!310288 () Bool)

(assert (=> b!533342 (=> (not res!328692) (not e!310288))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!533342 (= res!328692 (validKeyInArray!0 k0!1998))))

(declare-fun b!533343 () Bool)

(declare-fun res!328697 () Bool)

(assert (=> b!533343 (=> (not res!328697) (not e!310288))))

(declare-datatypes ((array!33804 0))(
  ( (array!33805 (arr!16241 (Array (_ BitVec 32) (_ BitVec 64))) (size!16606 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33804)

(declare-fun arrayContainsKey!0 (array!33804 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!533343 (= res!328697 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!533344 () Bool)

(declare-fun res!328693 () Bool)

(declare-fun e!310289 () Bool)

(assert (=> b!533344 (=> (not res!328693) (not e!310289))))

(declare-datatypes ((List!10399 0))(
  ( (Nil!10396) (Cons!10395 (h!11338 (_ BitVec 64)) (t!16618 List!10399)) )
))
(declare-fun arrayNoDuplicates!0 (array!33804 (_ BitVec 32) List!10399) Bool)

(assert (=> b!533344 (= res!328693 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10396))))

(declare-fun b!533345 () Bool)

(assert (=> b!533345 (= e!310288 e!310289)))

(declare-fun res!328696 () Bool)

(assert (=> b!533345 (=> (not res!328696) (not e!310289))))

(declare-datatypes ((SeekEntryResult!4696 0))(
  ( (MissingZero!4696 (index!21008 (_ BitVec 32))) (Found!4696 (index!21009 (_ BitVec 32))) (Intermediate!4696 (undefined!5508 Bool) (index!21010 (_ BitVec 32)) (x!49986 (_ BitVec 32))) (Undefined!4696) (MissingVacant!4696 (index!21011 (_ BitVec 32))) )
))
(declare-fun lt!245232 () SeekEntryResult!4696)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!533345 (= res!328696 (or (= lt!245232 (MissingZero!4696 i!1153)) (= lt!245232 (MissingVacant!4696 i!1153))))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33804 (_ BitVec 32)) SeekEntryResult!4696)

(assert (=> b!533345 (= lt!245232 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!533347 () Bool)

(declare-fun res!328695 () Bool)

(assert (=> b!533347 (=> (not res!328695) (not e!310288))))

(declare-fun j!147 () (_ BitVec 32))

(assert (=> b!533347 (= res!328695 (validKeyInArray!0 (select (arr!16241 a!3154) j!147)))))

(declare-fun b!533348 () Bool)

(declare-fun res!328690 () Bool)

(assert (=> b!533348 (=> (not res!328690) (not e!310288))))

(assert (=> b!533348 (= res!328690 (and (= (size!16606 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16606 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16606 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!533349 () Bool)

(assert (=> b!533349 (= e!310289 false)))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun lt!245233 () SeekEntryResult!4696)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33804 (_ BitVec 32)) SeekEntryResult!4696)

(assert (=> b!533349 (= lt!245233 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16241 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!533350 () Bool)

(declare-fun res!328694 () Bool)

(assert (=> b!533350 (=> (not res!328694) (not e!310289))))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!533350 (= res!328694 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16606 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16606 a!3154)) (= (select (arr!16241 a!3154) resIndex!32) (select (arr!16241 a!3154) j!147))))))

(declare-fun res!328689 () Bool)

(assert (=> start!48582 (=> (not res!328689) (not e!310288))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48582 (= res!328689 (validMask!0 mask!3216))))

(assert (=> start!48582 e!310288))

(assert (=> start!48582 true))

(declare-fun array_inv!12124 (array!33804) Bool)

(assert (=> start!48582 (array_inv!12124 a!3154)))

(declare-fun b!533346 () Bool)

(declare-fun res!328691 () Bool)

(assert (=> b!533346 (=> (not res!328691) (not e!310289))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33804 (_ BitVec 32)) Bool)

(assert (=> b!533346 (= res!328691 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(assert (= (and start!48582 res!328689) b!533348))

(assert (= (and b!533348 res!328690) b!533347))

(assert (= (and b!533347 res!328695) b!533342))

(assert (= (and b!533342 res!328692) b!533343))

(assert (= (and b!533343 res!328697) b!533345))

(assert (= (and b!533345 res!328696) b!533346))

(assert (= (and b!533346 res!328691) b!533344))

(assert (= (and b!533344 res!328693) b!533350))

(assert (= (and b!533350 res!328694) b!533349))

(declare-fun m!512695 () Bool)

(assert (=> b!533349 m!512695))

(assert (=> b!533349 m!512695))

(declare-fun m!512697 () Bool)

(assert (=> b!533349 m!512697))

(declare-fun m!512699 () Bool)

(assert (=> start!48582 m!512699))

(declare-fun m!512701 () Bool)

(assert (=> start!48582 m!512701))

(declare-fun m!512703 () Bool)

(assert (=> b!533342 m!512703))

(declare-fun m!512705 () Bool)

(assert (=> b!533344 m!512705))

(declare-fun m!512707 () Bool)

(assert (=> b!533350 m!512707))

(assert (=> b!533350 m!512695))

(assert (=> b!533347 m!512695))

(assert (=> b!533347 m!512695))

(declare-fun m!512709 () Bool)

(assert (=> b!533347 m!512709))

(declare-fun m!512711 () Bool)

(assert (=> b!533343 m!512711))

(declare-fun m!512713 () Bool)

(assert (=> b!533345 m!512713))

(declare-fun m!512715 () Bool)

(assert (=> b!533346 m!512715))

(check-sat (not b!533346) (not b!533342) (not b!533349) (not b!533345) (not b!533343) (not start!48582) (not b!533344) (not b!533347))
(check-sat)
