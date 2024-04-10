; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48478 () Bool)

(assert start!48478)

(declare-fun b!532469 () Bool)

(declare-fun e!310031 () Bool)

(declare-fun e!310030 () Bool)

(assert (=> b!532469 (= e!310031 e!310030)))

(declare-fun res!327816 () Bool)

(assert (=> b!532469 (=> (not res!327816) (not e!310030))))

(declare-datatypes ((SeekEntryResult!4669 0))(
  ( (MissingZero!4669 (index!20900 (_ BitVec 32))) (Found!4669 (index!20901 (_ BitVec 32))) (Intermediate!4669 (undefined!5481 Bool) (index!20902 (_ BitVec 32)) (x!49870 (_ BitVec 32))) (Undefined!4669) (MissingVacant!4669 (index!20903 (_ BitVec 32))) )
))
(declare-fun lt!245217 () SeekEntryResult!4669)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!532469 (= res!327816 (or (= lt!245217 (MissingZero!4669 i!1153)) (= lt!245217 (MissingVacant!4669 i!1153))))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun k!1998 () (_ BitVec 64))

(declare-datatypes ((array!33741 0))(
  ( (array!33742 (arr!16211 (Array (_ BitVec 32) (_ BitVec 64))) (size!16575 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33741)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33741 (_ BitVec 32)) SeekEntryResult!4669)

(assert (=> b!532469 (= lt!245217 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!532470 () Bool)

(declare-fun res!327823 () Bool)

(assert (=> b!532470 (=> (not res!327823) (not e!310030))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33741 (_ BitVec 32)) SeekEntryResult!4669)

(assert (=> b!532470 (= res!327823 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16211 a!3154) j!147) a!3154 mask!3216) (Intermediate!4669 false resIndex!32 resX!32)))))

(declare-fun res!327822 () Bool)

(assert (=> start!48478 (=> (not res!327822) (not e!310031))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48478 (= res!327822 (validMask!0 mask!3216))))

(assert (=> start!48478 e!310031))

(assert (=> start!48478 true))

(declare-fun array_inv!12007 (array!33741) Bool)

(assert (=> start!48478 (array_inv!12007 a!3154)))

(declare-fun b!532471 () Bool)

(declare-fun res!327824 () Bool)

(assert (=> b!532471 (=> (not res!327824) (not e!310031))))

(declare-fun arrayContainsKey!0 (array!33741 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!532471 (= res!327824 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!532472 () Bool)

(declare-fun res!327817 () Bool)

(assert (=> b!532472 (=> (not res!327817) (not e!310031))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!532472 (= res!327817 (validKeyInArray!0 k!1998))))

(declare-fun b!532473 () Bool)

(declare-fun res!327821 () Bool)

(assert (=> b!532473 (=> (not res!327821) (not e!310030))))

(assert (=> b!532473 (= res!327821 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16575 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16575 a!3154)) (= (select (arr!16211 a!3154) resIndex!32) (select (arr!16211 a!3154) j!147))))))

(declare-fun b!532474 () Bool)

(declare-fun res!327815 () Bool)

(assert (=> b!532474 (=> (not res!327815) (not e!310031))))

(assert (=> b!532474 (= res!327815 (validKeyInArray!0 (select (arr!16211 a!3154) j!147)))))

(declare-fun b!532475 () Bool)

(assert (=> b!532475 (= e!310030 false)))

(declare-fun lt!245218 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!532475 (= lt!245218 (toIndex!0 (select (arr!16211 a!3154) j!147) mask!3216))))

(declare-fun b!532476 () Bool)

(declare-fun res!327819 () Bool)

(assert (=> b!532476 (=> (not res!327819) (not e!310030))))

(declare-datatypes ((List!10330 0))(
  ( (Nil!10327) (Cons!10326 (h!11266 (_ BitVec 64)) (t!16558 List!10330)) )
))
(declare-fun arrayNoDuplicates!0 (array!33741 (_ BitVec 32) List!10330) Bool)

(assert (=> b!532476 (= res!327819 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10327))))

(declare-fun b!532477 () Bool)

(declare-fun res!327818 () Bool)

(assert (=> b!532477 (=> (not res!327818) (not e!310031))))

(assert (=> b!532477 (= res!327818 (and (= (size!16575 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16575 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16575 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!532478 () Bool)

(declare-fun res!327820 () Bool)

(assert (=> b!532478 (=> (not res!327820) (not e!310030))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33741 (_ BitVec 32)) Bool)

(assert (=> b!532478 (= res!327820 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(assert (= (and start!48478 res!327822) b!532477))

(assert (= (and b!532477 res!327818) b!532474))

(assert (= (and b!532474 res!327815) b!532472))

(assert (= (and b!532472 res!327817) b!532471))

(assert (= (and b!532471 res!327824) b!532469))

(assert (= (and b!532469 res!327816) b!532478))

(assert (= (and b!532478 res!327820) b!532476))

(assert (= (and b!532476 res!327819) b!532473))

(assert (= (and b!532473 res!327821) b!532470))

(assert (= (and b!532470 res!327823) b!532475))

(declare-fun m!512613 () Bool)

(assert (=> b!532475 m!512613))

(assert (=> b!532475 m!512613))

(declare-fun m!512615 () Bool)

(assert (=> b!532475 m!512615))

(declare-fun m!512617 () Bool)

(assert (=> b!532478 m!512617))

(declare-fun m!512619 () Bool)

(assert (=> b!532476 m!512619))

(declare-fun m!512621 () Bool)

(assert (=> b!532473 m!512621))

(assert (=> b!532473 m!512613))

(declare-fun m!512623 () Bool)

(assert (=> b!532471 m!512623))

(declare-fun m!512625 () Bool)

(assert (=> start!48478 m!512625))

(declare-fun m!512627 () Bool)

(assert (=> start!48478 m!512627))

(declare-fun m!512629 () Bool)

(assert (=> b!532472 m!512629))

(declare-fun m!512631 () Bool)

(assert (=> b!532469 m!512631))

(assert (=> b!532470 m!512613))

(assert (=> b!532470 m!512613))

(declare-fun m!512633 () Bool)

(assert (=> b!532470 m!512633))

(assert (=> b!532474 m!512613))

(assert (=> b!532474 m!512613))

(declare-fun m!512635 () Bool)

(assert (=> b!532474 m!512635))

(push 1)

(assert (not b!532469))

(assert (not b!532472))

(assert (not b!532476))

(assert (not b!532474))

(assert (not b!532470))

(assert (not b!532471))

(assert (not b!532475))

(assert (not start!48478))

(assert (not b!532478))

