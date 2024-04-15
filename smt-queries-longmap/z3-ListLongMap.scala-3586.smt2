; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49290 () Bool)

(assert start!49290)

(declare-fun b!542663 () Bool)

(declare-fun res!337356 () Bool)

(declare-fun e!313956 () Bool)

(assert (=> b!542663 (=> (not res!337356) (not e!313956))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4942 0))(
  ( (MissingZero!4942 (index!21992 (_ BitVec 32))) (Found!4942 (index!21993 (_ BitVec 32))) (Intermediate!4942 (undefined!5754 Bool) (index!21994 (_ BitVec 32)) (x!50912 (_ BitVec 32))) (Undefined!4942) (MissingVacant!4942 (index!21995 (_ BitVec 32))) )
))
(declare-fun lt!247813 () SeekEntryResult!4942)

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!34308 0))(
  ( (array!34309 (arr!16487 (Array (_ BitVec 32) (_ BitVec 64))) (size!16852 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34308)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34308 (_ BitVec 32)) SeekEntryResult!4942)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!542663 (= res!337356 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16487 a!3154) j!147) mask!3216) (select (arr!16487 a!3154) j!147) a!3154 mask!3216) lt!247813))))

(declare-fun b!542664 () Bool)

(declare-fun res!337361 () Bool)

(declare-fun e!313959 () Bool)

(assert (=> b!542664 (=> (not res!337361) (not e!313959))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!542664 (= res!337361 (and (= (size!16852 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16852 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16852 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!542665 () Bool)

(declare-fun res!337360 () Bool)

(declare-fun e!313958 () Bool)

(assert (=> b!542665 (=> (not res!337360) (not e!313958))))

(declare-datatypes ((List!10645 0))(
  ( (Nil!10642) (Cons!10641 (h!11596 (_ BitVec 64)) (t!16864 List!10645)) )
))
(declare-fun arrayNoDuplicates!0 (array!34308 (_ BitVec 32) List!10645) Bool)

(assert (=> b!542665 (= res!337360 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10642))))

(declare-fun b!542666 () Bool)

(assert (=> b!542666 (= e!313958 e!313956)))

(declare-fun res!337363 () Bool)

(assert (=> b!542666 (=> (not res!337363) (not e!313956))))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!542666 (= res!337363 (= lt!247813 (Intermediate!4942 false resIndex!32 resX!32)))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(assert (=> b!542666 (= lt!247813 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16487 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!542667 () Bool)

(declare-fun res!337364 () Bool)

(assert (=> b!542667 (=> (not res!337364) (not e!313958))))

(assert (=> b!542667 (= res!337364 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16852 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16852 a!3154)) (= (select (arr!16487 a!3154) resIndex!32) (select (arr!16487 a!3154) j!147))))))

(declare-fun res!337359 () Bool)

(assert (=> start!49290 (=> (not res!337359) (not e!313959))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49290 (= res!337359 (validMask!0 mask!3216))))

(assert (=> start!49290 e!313959))

(assert (=> start!49290 true))

(declare-fun array_inv!12370 (array!34308) Bool)

(assert (=> start!49290 (array_inv!12370 a!3154)))

(declare-fun b!542668 () Bool)

(declare-fun res!337366 () Bool)

(assert (=> b!542668 (=> (not res!337366) (not e!313959))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!542668 (= res!337366 (validKeyInArray!0 (select (arr!16487 a!3154) j!147)))))

(declare-fun b!542669 () Bool)

(assert (=> b!542669 (= e!313956 false)))

(declare-fun lt!247811 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!542669 (= lt!247811 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!542670 () Bool)

(declare-fun res!337362 () Bool)

(assert (=> b!542670 (=> (not res!337362) (not e!313959))))

(declare-fun k0!1998 () (_ BitVec 64))

(assert (=> b!542670 (= res!337362 (validKeyInArray!0 k0!1998))))

(declare-fun b!542671 () Bool)

(declare-fun res!337357 () Bool)

(assert (=> b!542671 (=> (not res!337357) (not e!313959))))

(declare-fun arrayContainsKey!0 (array!34308 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!542671 (= res!337357 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!542672 () Bool)

(declare-fun res!337365 () Bool)

(assert (=> b!542672 (=> (not res!337365) (not e!313956))))

(assert (=> b!542672 (= res!337365 (and (not (= (select (arr!16487 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16487 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16487 a!3154) index!1177) (select (arr!16487 a!3154) j!147)))))))

(declare-fun b!542673 () Bool)

(assert (=> b!542673 (= e!313959 e!313958)))

(declare-fun res!337367 () Bool)

(assert (=> b!542673 (=> (not res!337367) (not e!313958))))

(declare-fun lt!247812 () SeekEntryResult!4942)

(assert (=> b!542673 (= res!337367 (or (= lt!247812 (MissingZero!4942 i!1153)) (= lt!247812 (MissingVacant!4942 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34308 (_ BitVec 32)) SeekEntryResult!4942)

(assert (=> b!542673 (= lt!247812 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!542674 () Bool)

(declare-fun res!337358 () Bool)

(assert (=> b!542674 (=> (not res!337358) (not e!313958))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34308 (_ BitVec 32)) Bool)

(assert (=> b!542674 (= res!337358 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(assert (= (and start!49290 res!337359) b!542664))

(assert (= (and b!542664 res!337361) b!542668))

(assert (= (and b!542668 res!337366) b!542670))

(assert (= (and b!542670 res!337362) b!542671))

(assert (= (and b!542671 res!337357) b!542673))

(assert (= (and b!542673 res!337367) b!542674))

(assert (= (and b!542674 res!337358) b!542665))

(assert (= (and b!542665 res!337360) b!542667))

(assert (= (and b!542667 res!337364) b!542666))

(assert (= (and b!542666 res!337363) b!542663))

(assert (= (and b!542663 res!337356) b!542672))

(assert (= (and b!542672 res!337365) b!542669))

(declare-fun m!520357 () Bool)

(assert (=> start!49290 m!520357))

(declare-fun m!520359 () Bool)

(assert (=> start!49290 m!520359))

(declare-fun m!520361 () Bool)

(assert (=> b!542667 m!520361))

(declare-fun m!520363 () Bool)

(assert (=> b!542667 m!520363))

(declare-fun m!520365 () Bool)

(assert (=> b!542674 m!520365))

(assert (=> b!542663 m!520363))

(assert (=> b!542663 m!520363))

(declare-fun m!520367 () Bool)

(assert (=> b!542663 m!520367))

(assert (=> b!542663 m!520367))

(assert (=> b!542663 m!520363))

(declare-fun m!520369 () Bool)

(assert (=> b!542663 m!520369))

(declare-fun m!520371 () Bool)

(assert (=> b!542670 m!520371))

(assert (=> b!542668 m!520363))

(assert (=> b!542668 m!520363))

(declare-fun m!520373 () Bool)

(assert (=> b!542668 m!520373))

(declare-fun m!520375 () Bool)

(assert (=> b!542672 m!520375))

(assert (=> b!542672 m!520363))

(declare-fun m!520377 () Bool)

(assert (=> b!542673 m!520377))

(assert (=> b!542666 m!520363))

(assert (=> b!542666 m!520363))

(declare-fun m!520379 () Bool)

(assert (=> b!542666 m!520379))

(declare-fun m!520381 () Bool)

(assert (=> b!542669 m!520381))

(declare-fun m!520383 () Bool)

(assert (=> b!542671 m!520383))

(declare-fun m!520385 () Bool)

(assert (=> b!542665 m!520385))

(check-sat (not b!542666) (not b!542668) (not b!542674) (not b!542663) (not b!542670) (not b!542665) (not b!542671) (not b!542669) (not start!49290) (not b!542673))
(check-sat)
