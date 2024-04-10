; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48578 () Bool)

(assert start!48578)

(declare-fun res!328590 () Bool)

(declare-fun e!310390 () Bool)

(assert (=> start!48578 (=> (not res!328590) (not e!310390))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48578 (= res!328590 (validMask!0 mask!3216))))

(assert (=> start!48578 e!310390))

(assert (=> start!48578 true))

(declare-datatypes ((array!33790 0))(
  ( (array!33791 (arr!16234 (Array (_ BitVec 32) (_ BitVec 64))) (size!16598 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33790)

(declare-fun array_inv!12030 (array!33790) Bool)

(assert (=> start!48578 (array_inv!12030 a!3154)))

(declare-fun b!533379 () Bool)

(declare-fun res!328591 () Bool)

(assert (=> b!533379 (=> (not res!328591) (not e!310390))))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!533379 (= res!328591 (and (= (size!16598 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16598 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16598 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!533380 () Bool)

(declare-fun e!310392 () Bool)

(assert (=> b!533380 (= e!310392 false)))

(declare-fun index!1177 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4692 0))(
  ( (MissingZero!4692 (index!20992 (_ BitVec 32))) (Found!4692 (index!20993 (_ BitVec 32))) (Intermediate!4692 (undefined!5504 Bool) (index!20994 (_ BitVec 32)) (x!49963 (_ BitVec 32))) (Undefined!4692) (MissingVacant!4692 (index!20995 (_ BitVec 32))) )
))
(declare-fun lt!245436 () SeekEntryResult!4692)

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33790 (_ BitVec 32)) SeekEntryResult!4692)

(assert (=> b!533380 (= lt!245436 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16234 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!533381 () Bool)

(assert (=> b!533381 (= e!310390 e!310392)))

(declare-fun res!328592 () Bool)

(assert (=> b!533381 (=> (not res!328592) (not e!310392))))

(declare-fun lt!245437 () SeekEntryResult!4692)

(assert (=> b!533381 (= res!328592 (or (= lt!245437 (MissingZero!4692 i!1153)) (= lt!245437 (MissingVacant!4692 i!1153))))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33790 (_ BitVec 32)) SeekEntryResult!4692)

(assert (=> b!533381 (= lt!245437 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!533382 () Bool)

(declare-fun res!328588 () Bool)

(assert (=> b!533382 (=> (not res!328588) (not e!310390))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!533382 (= res!328588 (validKeyInArray!0 k0!1998))))

(declare-fun b!533383 () Bool)

(declare-fun res!328587 () Bool)

(assert (=> b!533383 (=> (not res!328587) (not e!310392))))

(declare-datatypes ((List!10353 0))(
  ( (Nil!10350) (Cons!10349 (h!11292 (_ BitVec 64)) (t!16581 List!10353)) )
))
(declare-fun arrayNoDuplicates!0 (array!33790 (_ BitVec 32) List!10353) Bool)

(assert (=> b!533383 (= res!328587 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10350))))

(declare-fun b!533384 () Bool)

(declare-fun res!328585 () Bool)

(assert (=> b!533384 (=> (not res!328585) (not e!310392))))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!533384 (= res!328585 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16598 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16598 a!3154)) (= (select (arr!16234 a!3154) resIndex!32) (select (arr!16234 a!3154) j!147))))))

(declare-fun b!533385 () Bool)

(declare-fun res!328586 () Bool)

(assert (=> b!533385 (=> (not res!328586) (not e!310392))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33790 (_ BitVec 32)) Bool)

(assert (=> b!533385 (= res!328586 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!533386 () Bool)

(declare-fun res!328584 () Bool)

(assert (=> b!533386 (=> (not res!328584) (not e!310390))))

(assert (=> b!533386 (= res!328584 (validKeyInArray!0 (select (arr!16234 a!3154) j!147)))))

(declare-fun b!533387 () Bool)

(declare-fun res!328589 () Bool)

(assert (=> b!533387 (=> (not res!328589) (not e!310390))))

(declare-fun arrayContainsKey!0 (array!33790 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!533387 (= res!328589 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(assert (= (and start!48578 res!328590) b!533379))

(assert (= (and b!533379 res!328591) b!533386))

(assert (= (and b!533386 res!328584) b!533382))

(assert (= (and b!533382 res!328588) b!533387))

(assert (= (and b!533387 res!328589) b!533381))

(assert (= (and b!533381 res!328592) b!533385))

(assert (= (and b!533385 res!328586) b!533383))

(assert (= (and b!533383 res!328587) b!533384))

(assert (= (and b!533384 res!328585) b!533380))

(declare-fun m!513271 () Bool)

(assert (=> b!533380 m!513271))

(assert (=> b!533380 m!513271))

(declare-fun m!513273 () Bool)

(assert (=> b!533380 m!513273))

(declare-fun m!513275 () Bool)

(assert (=> b!533381 m!513275))

(assert (=> b!533386 m!513271))

(assert (=> b!533386 m!513271))

(declare-fun m!513277 () Bool)

(assert (=> b!533386 m!513277))

(declare-fun m!513279 () Bool)

(assert (=> b!533383 m!513279))

(declare-fun m!513281 () Bool)

(assert (=> b!533387 m!513281))

(declare-fun m!513283 () Bool)

(assert (=> start!48578 m!513283))

(declare-fun m!513285 () Bool)

(assert (=> start!48578 m!513285))

(declare-fun m!513287 () Bool)

(assert (=> b!533384 m!513287))

(assert (=> b!533384 m!513271))

(declare-fun m!513289 () Bool)

(assert (=> b!533385 m!513289))

(declare-fun m!513291 () Bool)

(assert (=> b!533382 m!513291))

(check-sat (not b!533386) (not b!533383) (not start!48578) (not b!533382) (not b!533381) (not b!533380) (not b!533385) (not b!533387))
(check-sat)
