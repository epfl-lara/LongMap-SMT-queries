; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49330 () Bool)

(assert start!49330)

(declare-fun b!543438 () Bool)

(declare-fun res!337995 () Bool)

(declare-fun e!314299 () Bool)

(assert (=> b!543438 (=> (not res!337995) (not e!314299))))

(declare-datatypes ((array!34338 0))(
  ( (array!34339 (arr!16502 (Array (_ BitVec 32) (_ BitVec 64))) (size!16866 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34338)

(declare-fun j!147 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!543438 (= res!337995 (validKeyInArray!0 (select (arr!16502 a!3154) j!147)))))

(declare-fun b!543439 () Bool)

(declare-fun e!314301 () Bool)

(declare-fun e!314300 () Bool)

(assert (=> b!543439 (= e!314301 e!314300)))

(declare-fun res!337997 () Bool)

(assert (=> b!543439 (=> (not res!337997) (not e!314300))))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4960 0))(
  ( (MissingZero!4960 (index!22064 (_ BitVec 32))) (Found!4960 (index!22065 (_ BitVec 32))) (Intermediate!4960 (undefined!5772 Bool) (index!22066 (_ BitVec 32)) (x!50967 (_ BitVec 32))) (Undefined!4960) (MissingVacant!4960 (index!22067 (_ BitVec 32))) )
))
(declare-fun lt!248171 () SeekEntryResult!4960)

(assert (=> b!543439 (= res!337997 (= lt!248171 (Intermediate!4960 false resIndex!32 resX!32)))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34338 (_ BitVec 32)) SeekEntryResult!4960)

(assert (=> b!543439 (= lt!248171 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16502 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!543440 () Bool)

(declare-fun res!337992 () Bool)

(assert (=> b!543440 (=> (not res!337992) (not e!314299))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34338 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!543440 (= res!337992 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!543441 () Bool)

(declare-fun res!337990 () Bool)

(assert (=> b!543441 (=> (not res!337990) (not e!314299))))

(assert (=> b!543441 (= res!337990 (validKeyInArray!0 k!1998))))

(declare-fun b!543442 () Bool)

(declare-fun res!337993 () Bool)

(assert (=> b!543442 (=> (not res!337993) (not e!314301))))

(declare-datatypes ((List!10621 0))(
  ( (Nil!10618) (Cons!10617 (h!11572 (_ BitVec 64)) (t!16849 List!10621)) )
))
(declare-fun arrayNoDuplicates!0 (array!34338 (_ BitVec 32) List!10621) Bool)

(assert (=> b!543442 (= res!337993 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10618))))

(declare-fun b!543443 () Bool)

(declare-fun res!337996 () Bool)

(assert (=> b!543443 (=> (not res!337996) (not e!314301))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34338 (_ BitVec 32)) Bool)

(assert (=> b!543443 (= res!337996 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun res!337994 () Bool)

(assert (=> start!49330 (=> (not res!337994) (not e!314299))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49330 (= res!337994 (validMask!0 mask!3216))))

(assert (=> start!49330 e!314299))

(assert (=> start!49330 true))

(declare-fun array_inv!12298 (array!34338) Bool)

(assert (=> start!49330 (array_inv!12298 a!3154)))

(declare-fun b!543444 () Bool)

(assert (=> b!543444 (= e!314300 false)))

(declare-fun lt!248172 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!543444 (= lt!248172 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!543445 () Bool)

(assert (=> b!543445 (= e!314299 e!314301)))

(declare-fun res!337989 () Bool)

(assert (=> b!543445 (=> (not res!337989) (not e!314301))))

(declare-fun lt!248173 () SeekEntryResult!4960)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!543445 (= res!337989 (or (= lt!248173 (MissingZero!4960 i!1153)) (= lt!248173 (MissingVacant!4960 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34338 (_ BitVec 32)) SeekEntryResult!4960)

(assert (=> b!543445 (= lt!248173 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!543446 () Bool)

(declare-fun res!338000 () Bool)

(assert (=> b!543446 (=> (not res!338000) (not e!314299))))

(assert (=> b!543446 (= res!338000 (and (= (size!16866 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16866 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16866 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!543447 () Bool)

(declare-fun res!337998 () Bool)

(assert (=> b!543447 (=> (not res!337998) (not e!314300))))

(assert (=> b!543447 (= res!337998 (and (not (= (select (arr!16502 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16502 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16502 a!3154) index!1177) (select (arr!16502 a!3154) j!147)))))))

(declare-fun b!543448 () Bool)

(declare-fun res!337999 () Bool)

(assert (=> b!543448 (=> (not res!337999) (not e!314301))))

(assert (=> b!543448 (= res!337999 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16866 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16866 a!3154)) (= (select (arr!16502 a!3154) resIndex!32) (select (arr!16502 a!3154) j!147))))))

(declare-fun b!543449 () Bool)

(declare-fun res!337991 () Bool)

(assert (=> b!543449 (=> (not res!337991) (not e!314300))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!543449 (= res!337991 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16502 a!3154) j!147) mask!3216) (select (arr!16502 a!3154) j!147) a!3154 mask!3216) lt!248171))))

(assert (= (and start!49330 res!337994) b!543446))

(assert (= (and b!543446 res!338000) b!543438))

(assert (= (and b!543438 res!337995) b!543441))

(assert (= (and b!543441 res!337990) b!543440))

(assert (= (and b!543440 res!337992) b!543445))

(assert (= (and b!543445 res!337989) b!543443))

(assert (= (and b!543443 res!337996) b!543442))

(assert (= (and b!543442 res!337993) b!543448))

(assert (= (and b!543448 res!337999) b!543439))

(assert (= (and b!543439 res!337997) b!543449))

(assert (= (and b!543449 res!337991) b!543447))

(assert (= (and b!543447 res!337998) b!543444))

(declare-fun m!521529 () Bool)

(assert (=> b!543449 m!521529))

(assert (=> b!543449 m!521529))

(declare-fun m!521531 () Bool)

(assert (=> b!543449 m!521531))

(assert (=> b!543449 m!521531))

(assert (=> b!543449 m!521529))

(declare-fun m!521533 () Bool)

(assert (=> b!543449 m!521533))

(declare-fun m!521535 () Bool)

(assert (=> b!543448 m!521535))

(assert (=> b!543448 m!521529))

(declare-fun m!521537 () Bool)

(assert (=> b!543445 m!521537))

(declare-fun m!521539 () Bool)

(assert (=> b!543447 m!521539))

(assert (=> b!543447 m!521529))

(declare-fun m!521541 () Bool)

(assert (=> b!543442 m!521541))

(declare-fun m!521543 () Bool)

(assert (=> b!543443 m!521543))

(assert (=> b!543438 m!521529))

(assert (=> b!543438 m!521529))

(declare-fun m!521545 () Bool)

(assert (=> b!543438 m!521545))

(declare-fun m!521547 () Bool)

(assert (=> b!543441 m!521547))

(assert (=> b!543439 m!521529))

(assert (=> b!543439 m!521529))

(declare-fun m!521549 () Bool)

(assert (=> b!543439 m!521549))

(declare-fun m!521551 () Bool)

(assert (=> b!543444 m!521551))

(declare-fun m!521553 () Bool)

(assert (=> b!543440 m!521553))

(declare-fun m!521555 () Bool)

(assert (=> start!49330 m!521555))

(declare-fun m!521557 () Bool)

(assert (=> start!49330 m!521557))

(push 1)

(assert (not b!543444))

(assert (not b!543442))

(assert (not start!49330))

(assert (not b!543439))

