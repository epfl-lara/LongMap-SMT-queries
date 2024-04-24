; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49072 () Bool)

(assert start!49072)

(declare-fun b!540466 () Bool)

(declare-fun e!313146 () Bool)

(assert (=> b!540466 (= e!313146 false)))

(declare-datatypes ((SeekEntryResult!4840 0))(
  ( (MissingZero!4840 (index!21584 (_ BitVec 32))) (Found!4840 (index!21585 (_ BitVec 32))) (Intermediate!4840 (undefined!5652 Bool) (index!21586 (_ BitVec 32)) (x!50648 (_ BitVec 32))) (Undefined!4840) (MissingVacant!4840 (index!21587 (_ BitVec 32))) )
))
(declare-fun lt!247452 () SeekEntryResult!4840)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!34181 0))(
  ( (array!34182 (arr!16426 (Array (_ BitVec 32) (_ BitVec 64))) (size!16790 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34181)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34181 (_ BitVec 32)) SeekEntryResult!4840)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!540466 (= lt!247452 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16426 a!3154) j!147) mask!3216) (select (arr!16426 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!540467 () Bool)

(declare-fun e!313144 () Bool)

(assert (=> b!540467 (= e!313144 e!313146)))

(declare-fun res!335410 () Bool)

(assert (=> b!540467 (=> (not res!335410) (not e!313146))))

(declare-fun lt!247453 () SeekEntryResult!4840)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!540467 (= res!335410 (or (= lt!247453 (MissingZero!4840 i!1153)) (= lt!247453 (MissingVacant!4840 i!1153))))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34181 (_ BitVec 32)) SeekEntryResult!4840)

(assert (=> b!540467 (= lt!247453 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!540468 () Bool)

(declare-fun res!335415 () Bool)

(assert (=> b!540468 (=> (not res!335415) (not e!313146))))

(declare-datatypes ((List!10452 0))(
  ( (Nil!10449) (Cons!10448 (h!11397 (_ BitVec 64)) (t!16672 List!10452)) )
))
(declare-fun arrayNoDuplicates!0 (array!34181 (_ BitVec 32) List!10452) Bool)

(assert (=> b!540468 (= res!335415 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10449))))

(declare-fun b!540469 () Bool)

(declare-fun res!335409 () Bool)

(assert (=> b!540469 (=> (not res!335409) (not e!313146))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34181 (_ BitVec 32)) Bool)

(assert (=> b!540469 (= res!335409 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!540470 () Bool)

(declare-fun res!335416 () Bool)

(assert (=> b!540470 (=> (not res!335416) (not e!313144))))

(assert (=> b!540470 (= res!335416 (and (= (size!16790 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16790 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16790 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!540471 () Bool)

(declare-fun res!335413 () Bool)

(assert (=> b!540471 (=> (not res!335413) (not e!313144))))

(declare-fun arrayContainsKey!0 (array!34181 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!540471 (= res!335413 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!540472 () Bool)

(declare-fun res!335412 () Bool)

(assert (=> b!540472 (=> (not res!335412) (not e!313144))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!540472 (= res!335412 (validKeyInArray!0 (select (arr!16426 a!3154) j!147)))))

(declare-fun res!335407 () Bool)

(assert (=> start!49072 (=> (not res!335407) (not e!313144))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49072 (= res!335407 (validMask!0 mask!3216))))

(assert (=> start!49072 e!313144))

(assert (=> start!49072 true))

(declare-fun array_inv!12285 (array!34181) Bool)

(assert (=> start!49072 (array_inv!12285 a!3154)))

(declare-fun b!540473 () Bool)

(declare-fun res!335411 () Bool)

(assert (=> b!540473 (=> (not res!335411) (not e!313146))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!540473 (= res!335411 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16790 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16790 a!3154)) (= (select (arr!16426 a!3154) resIndex!32) (select (arr!16426 a!3154) j!147))))))

(declare-fun b!540474 () Bool)

(declare-fun res!335414 () Bool)

(assert (=> b!540474 (=> (not res!335414) (not e!313146))))

(assert (=> b!540474 (= res!335414 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16426 a!3154) j!147) a!3154 mask!3216) (Intermediate!4840 false resIndex!32 resX!32)))))

(declare-fun b!540475 () Bool)

(declare-fun res!335408 () Bool)

(assert (=> b!540475 (=> (not res!335408) (not e!313144))))

(assert (=> b!540475 (= res!335408 (validKeyInArray!0 k0!1998))))

(assert (= (and start!49072 res!335407) b!540470))

(assert (= (and b!540470 res!335416) b!540472))

(assert (= (and b!540472 res!335412) b!540475))

(assert (= (and b!540475 res!335408) b!540471))

(assert (= (and b!540471 res!335413) b!540467))

(assert (= (and b!540467 res!335410) b!540469))

(assert (= (and b!540469 res!335409) b!540468))

(assert (= (and b!540468 res!335415) b!540473))

(assert (= (and b!540473 res!335411) b!540474))

(assert (= (and b!540474 res!335414) b!540466))

(declare-fun m!519409 () Bool)

(assert (=> b!540468 m!519409))

(declare-fun m!519411 () Bool)

(assert (=> b!540472 m!519411))

(assert (=> b!540472 m!519411))

(declare-fun m!519413 () Bool)

(assert (=> b!540472 m!519413))

(declare-fun m!519415 () Bool)

(assert (=> b!540475 m!519415))

(declare-fun m!519417 () Bool)

(assert (=> b!540471 m!519417))

(declare-fun m!519419 () Bool)

(assert (=> b!540473 m!519419))

(assert (=> b!540473 m!519411))

(assert (=> b!540466 m!519411))

(assert (=> b!540466 m!519411))

(declare-fun m!519421 () Bool)

(assert (=> b!540466 m!519421))

(assert (=> b!540466 m!519421))

(assert (=> b!540466 m!519411))

(declare-fun m!519423 () Bool)

(assert (=> b!540466 m!519423))

(declare-fun m!519425 () Bool)

(assert (=> start!49072 m!519425))

(declare-fun m!519427 () Bool)

(assert (=> start!49072 m!519427))

(declare-fun m!519429 () Bool)

(assert (=> b!540467 m!519429))

(declare-fun m!519431 () Bool)

(assert (=> b!540469 m!519431))

(assert (=> b!540474 m!519411))

(assert (=> b!540474 m!519411))

(declare-fun m!519433 () Bool)

(assert (=> b!540474 m!519433))

(check-sat (not b!540474) (not start!49072) (not b!540466) (not b!540467) (not b!540468) (not b!540469) (not b!540475) (not b!540471) (not b!540472))
(check-sat)
