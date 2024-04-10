; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49280 () Bool)

(assert start!49280)

(declare-fun b!542538 () Bool)

(declare-fun res!337096 () Bool)

(declare-fun e!314000 () Bool)

(assert (=> b!542538 (=> (not res!337096) (not e!314000))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!542538 (= res!337096 (validKeyInArray!0 k0!1998))))

(declare-fun b!542539 () Bool)

(declare-fun res!337098 () Bool)

(declare-fun e!313998 () Bool)

(assert (=> b!542539 (=> (not res!337098) (not e!313998))))

(declare-datatypes ((array!34288 0))(
  ( (array!34289 (arr!16477 (Array (_ BitVec 32) (_ BitVec 64))) (size!16841 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34288)

(declare-datatypes ((List!10596 0))(
  ( (Nil!10593) (Cons!10592 (h!11547 (_ BitVec 64)) (t!16824 List!10596)) )
))
(declare-fun arrayNoDuplicates!0 (array!34288 (_ BitVec 32) List!10596) Bool)

(assert (=> b!542539 (= res!337098 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10593))))

(declare-fun res!337094 () Bool)

(assert (=> start!49280 (=> (not res!337094) (not e!314000))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49280 (= res!337094 (validMask!0 mask!3216))))

(assert (=> start!49280 e!314000))

(assert (=> start!49280 true))

(declare-fun array_inv!12273 (array!34288) Bool)

(assert (=> start!49280 (array_inv!12273 a!3154)))

(declare-fun b!542540 () Bool)

(assert (=> b!542540 (= e!314000 e!313998)))

(declare-fun res!337100 () Bool)

(assert (=> b!542540 (=> (not res!337100) (not e!313998))))

(declare-datatypes ((SeekEntryResult!4935 0))(
  ( (MissingZero!4935 (index!21964 (_ BitVec 32))) (Found!4935 (index!21965 (_ BitVec 32))) (Intermediate!4935 (undefined!5747 Bool) (index!21966 (_ BitVec 32)) (x!50878 (_ BitVec 32))) (Undefined!4935) (MissingVacant!4935 (index!21967 (_ BitVec 32))) )
))
(declare-fun lt!247946 () SeekEntryResult!4935)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!542540 (= res!337100 (or (= lt!247946 (MissingZero!4935 i!1153)) (= lt!247946 (MissingVacant!4935 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34288 (_ BitVec 32)) SeekEntryResult!4935)

(assert (=> b!542540 (= lt!247946 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!542541 () Bool)

(declare-fun e!314001 () Bool)

(assert (=> b!542541 (= e!313998 e!314001)))

(declare-fun res!337091 () Bool)

(assert (=> b!542541 (=> (not res!337091) (not e!314001))))

(declare-fun lt!247947 () SeekEntryResult!4935)

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!542541 (= res!337091 (= lt!247947 (Intermediate!4935 false resIndex!32 resX!32)))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34288 (_ BitVec 32)) SeekEntryResult!4935)

(assert (=> b!542541 (= lt!247947 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16477 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!542542 () Bool)

(declare-fun res!337095 () Bool)

(assert (=> b!542542 (=> (not res!337095) (not e!313998))))

(assert (=> b!542542 (= res!337095 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16841 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16841 a!3154)) (= (select (arr!16477 a!3154) resIndex!32) (select (arr!16477 a!3154) j!147))))))

(declare-fun b!542543 () Bool)

(declare-fun res!337090 () Bool)

(assert (=> b!542543 (=> (not res!337090) (not e!313998))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34288 (_ BitVec 32)) Bool)

(assert (=> b!542543 (= res!337090 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!542544 () Bool)

(declare-fun res!337093 () Bool)

(assert (=> b!542544 (=> (not res!337093) (not e!314001))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!542544 (= res!337093 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16477 a!3154) j!147) mask!3216) (select (arr!16477 a!3154) j!147) a!3154 mask!3216) lt!247947))))

(declare-fun b!542545 () Bool)

(declare-fun res!337097 () Bool)

(assert (=> b!542545 (=> (not res!337097) (not e!314000))))

(assert (=> b!542545 (= res!337097 (validKeyInArray!0 (select (arr!16477 a!3154) j!147)))))

(declare-fun b!542546 () Bool)

(declare-fun res!337089 () Bool)

(assert (=> b!542546 (=> (not res!337089) (not e!314000))))

(assert (=> b!542546 (= res!337089 (and (= (size!16841 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16841 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16841 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!542547 () Bool)

(assert (=> b!542547 (= e!314001 false)))

(declare-fun lt!247948 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!542547 (= lt!247948 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!542548 () Bool)

(declare-fun res!337099 () Bool)

(assert (=> b!542548 (=> (not res!337099) (not e!314000))))

(declare-fun arrayContainsKey!0 (array!34288 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!542548 (= res!337099 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!542549 () Bool)

(declare-fun res!337092 () Bool)

(assert (=> b!542549 (=> (not res!337092) (not e!314001))))

(assert (=> b!542549 (= res!337092 (and (not (= (select (arr!16477 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16477 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16477 a!3154) index!1177) (select (arr!16477 a!3154) j!147)))))))

(assert (= (and start!49280 res!337094) b!542546))

(assert (= (and b!542546 res!337089) b!542545))

(assert (= (and b!542545 res!337097) b!542538))

(assert (= (and b!542538 res!337096) b!542548))

(assert (= (and b!542548 res!337099) b!542540))

(assert (= (and b!542540 res!337100) b!542543))

(assert (= (and b!542543 res!337090) b!542539))

(assert (= (and b!542539 res!337098) b!542542))

(assert (= (and b!542542 res!337095) b!542541))

(assert (= (and b!542541 res!337091) b!542544))

(assert (= (and b!542544 res!337093) b!542549))

(assert (= (and b!542549 res!337092) b!542547))

(declare-fun m!520779 () Bool)

(assert (=> b!542543 m!520779))

(declare-fun m!520781 () Bool)

(assert (=> b!542542 m!520781))

(declare-fun m!520783 () Bool)

(assert (=> b!542542 m!520783))

(declare-fun m!520785 () Bool)

(assert (=> b!542539 m!520785))

(declare-fun m!520787 () Bool)

(assert (=> b!542549 m!520787))

(assert (=> b!542549 m!520783))

(declare-fun m!520789 () Bool)

(assert (=> b!542548 m!520789))

(declare-fun m!520791 () Bool)

(assert (=> start!49280 m!520791))

(declare-fun m!520793 () Bool)

(assert (=> start!49280 m!520793))

(assert (=> b!542545 m!520783))

(assert (=> b!542545 m!520783))

(declare-fun m!520795 () Bool)

(assert (=> b!542545 m!520795))

(declare-fun m!520797 () Bool)

(assert (=> b!542547 m!520797))

(declare-fun m!520799 () Bool)

(assert (=> b!542538 m!520799))

(declare-fun m!520801 () Bool)

(assert (=> b!542540 m!520801))

(assert (=> b!542544 m!520783))

(assert (=> b!542544 m!520783))

(declare-fun m!520803 () Bool)

(assert (=> b!542544 m!520803))

(assert (=> b!542544 m!520803))

(assert (=> b!542544 m!520783))

(declare-fun m!520805 () Bool)

(assert (=> b!542544 m!520805))

(assert (=> b!542541 m!520783))

(assert (=> b!542541 m!520783))

(declare-fun m!520807 () Bool)

(assert (=> b!542541 m!520807))

(check-sat (not b!542544) (not start!49280) (not b!542543) (not b!542547) (not b!542538) (not b!542541) (not b!542540) (not b!542548) (not b!542539) (not b!542545))
(check-sat)
