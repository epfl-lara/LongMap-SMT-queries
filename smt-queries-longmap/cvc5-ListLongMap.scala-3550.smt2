; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48870 () Bool)

(assert start!48870)

(declare-fun res!333651 () Bool)

(declare-fun e!312225 () Bool)

(assert (=> start!48870 (=> (not res!333651) (not e!312225))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48870 (= res!333651 (validMask!0 mask!3216))))

(assert (=> start!48870 e!312225))

(assert (=> start!48870 true))

(declare-datatypes ((array!34082 0))(
  ( (array!34083 (arr!16380 (Array (_ BitVec 32) (_ BitVec 64))) (size!16744 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34082)

(declare-fun array_inv!12176 (array!34082) Bool)

(assert (=> start!48870 (array_inv!12176 a!3154)))

(declare-fun b!538445 () Bool)

(declare-fun res!333657 () Bool)

(declare-fun e!312228 () Bool)

(assert (=> b!538445 (=> (not res!333657) (not e!312228))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34082 (_ BitVec 32)) Bool)

(assert (=> b!538445 (= res!333657 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!538446 () Bool)

(declare-fun e!312229 () Bool)

(assert (=> b!538446 (= e!312229 (not true))))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun lt!246775 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4838 0))(
  ( (MissingZero!4838 (index!21576 (_ BitVec 32))) (Found!4838 (index!21577 (_ BitVec 32))) (Intermediate!4838 (undefined!5650 Bool) (index!21578 (_ BitVec 32)) (x!50501 (_ BitVec 32))) (Undefined!4838) (MissingVacant!4838 (index!21579 (_ BitVec 32))) )
))
(declare-fun lt!246772 () SeekEntryResult!4838)

(declare-fun i!1153 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34082 (_ BitVec 32)) SeekEntryResult!4838)

(assert (=> b!538446 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!246775 (select (store (arr!16380 a!3154) i!1153 k!1998) j!147) (array!34083 (store (arr!16380 a!3154) i!1153 k!1998) (size!16744 a!3154)) mask!3216) lt!246772)))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(declare-datatypes ((Unit!16860 0))(
  ( (Unit!16861) )
))
(declare-fun lt!246776 () Unit!16860)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!34082 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16860)

(assert (=> b!538446 (= lt!246776 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3154 i!1153 k!1998 j!147 lt!246775 (bvadd #b00000000000000000000000000000001 x!1030) resIndex!32 resX!32 mask!3216))))

(declare-fun b!538447 () Bool)

(declare-fun e!312227 () Bool)

(declare-fun e!312226 () Bool)

(assert (=> b!538447 (= e!312227 e!312226)))

(declare-fun res!333650 () Bool)

(assert (=> b!538447 (=> (not res!333650) (not e!312226))))

(declare-fun lt!246777 () SeekEntryResult!4838)

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun lt!246778 () SeekEntryResult!4838)

(assert (=> b!538447 (= res!333650 (and (= lt!246777 lt!246778) (not (= (select (arr!16380 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16380 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16380 a!3154) index!1177) (select (arr!16380 a!3154) j!147)))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!538447 (= lt!246777 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16380 a!3154) j!147) mask!3216) (select (arr!16380 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!538448 () Bool)

(declare-fun e!312230 () Bool)

(assert (=> b!538448 (= e!312226 e!312230)))

(declare-fun res!333660 () Bool)

(assert (=> b!538448 (=> (not res!333660) (not e!312230))))

(assert (=> b!538448 (= res!333660 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!246775 #b00000000000000000000000000000000) (bvslt lt!246775 (size!16744 a!3154))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!538448 (= lt!246775 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!538449 () Bool)

(assert (=> b!538449 (= e!312228 e!312227)))

(declare-fun res!333655 () Bool)

(assert (=> b!538449 (=> (not res!333655) (not e!312227))))

(assert (=> b!538449 (= res!333655 (= lt!246778 lt!246772))))

(assert (=> b!538449 (= lt!246772 (Intermediate!4838 false resIndex!32 resX!32))))

(assert (=> b!538449 (= lt!246778 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16380 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!538450 () Bool)

(declare-fun res!333656 () Bool)

(assert (=> b!538450 (=> (not res!333656) (not e!312225))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!538450 (= res!333656 (validKeyInArray!0 (select (arr!16380 a!3154) j!147)))))

(declare-fun b!538451 () Bool)

(declare-fun res!333652 () Bool)

(assert (=> b!538451 (=> (not res!333652) (not e!312228))))

(assert (=> b!538451 (= res!333652 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16744 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16744 a!3154)) (= (select (arr!16380 a!3154) resIndex!32) (select (arr!16380 a!3154) j!147))))))

(declare-fun b!538452 () Bool)

(declare-fun res!333653 () Bool)

(assert (=> b!538452 (=> (not res!333653) (not e!312225))))

(declare-fun arrayContainsKey!0 (array!34082 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!538452 (= res!333653 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!538453 () Bool)

(declare-fun res!333661 () Bool)

(assert (=> b!538453 (=> (not res!333661) (not e!312225))))

(assert (=> b!538453 (= res!333661 (and (= (size!16744 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16744 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16744 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!538454 () Bool)

(assert (=> b!538454 (= e!312225 e!312228)))

(declare-fun res!333662 () Bool)

(assert (=> b!538454 (=> (not res!333662) (not e!312228))))

(declare-fun lt!246773 () SeekEntryResult!4838)

(assert (=> b!538454 (= res!333662 (or (= lt!246773 (MissingZero!4838 i!1153)) (= lt!246773 (MissingVacant!4838 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34082 (_ BitVec 32)) SeekEntryResult!4838)

(assert (=> b!538454 (= lt!246773 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!538455 () Bool)

(declare-fun res!333659 () Bool)

(assert (=> b!538455 (=> (not res!333659) (not e!312225))))

(assert (=> b!538455 (= res!333659 (validKeyInArray!0 k!1998))))

(declare-fun b!538456 () Bool)

(assert (=> b!538456 (= e!312230 e!312229)))

(declare-fun res!333654 () Bool)

(assert (=> b!538456 (=> (not res!333654) (not e!312229))))

(declare-fun lt!246774 () SeekEntryResult!4838)

(assert (=> b!538456 (= res!333654 (and (= lt!246774 lt!246772) (= lt!246777 lt!246774)))))

(assert (=> b!538456 (= lt!246774 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!246775 (select (arr!16380 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!538457 () Bool)

(declare-fun res!333658 () Bool)

(assert (=> b!538457 (=> (not res!333658) (not e!312228))))

(declare-datatypes ((List!10499 0))(
  ( (Nil!10496) (Cons!10495 (h!11438 (_ BitVec 64)) (t!16727 List!10499)) )
))
(declare-fun arrayNoDuplicates!0 (array!34082 (_ BitVec 32) List!10499) Bool)

(assert (=> b!538457 (= res!333658 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10496))))

(assert (= (and start!48870 res!333651) b!538453))

(assert (= (and b!538453 res!333661) b!538450))

(assert (= (and b!538450 res!333656) b!538455))

(assert (= (and b!538455 res!333659) b!538452))

(assert (= (and b!538452 res!333653) b!538454))

(assert (= (and b!538454 res!333662) b!538445))

(assert (= (and b!538445 res!333657) b!538457))

(assert (= (and b!538457 res!333658) b!538451))

(assert (= (and b!538451 res!333652) b!538449))

(assert (= (and b!538449 res!333655) b!538447))

(assert (= (and b!538447 res!333650) b!538448))

(assert (= (and b!538448 res!333660) b!538456))

(assert (= (and b!538456 res!333654) b!538446))

(declare-fun m!517545 () Bool)

(assert (=> b!538456 m!517545))

(assert (=> b!538456 m!517545))

(declare-fun m!517547 () Bool)

(assert (=> b!538456 m!517547))

(declare-fun m!517549 () Bool)

(assert (=> b!538446 m!517549))

(declare-fun m!517551 () Bool)

(assert (=> b!538446 m!517551))

(assert (=> b!538446 m!517551))

(declare-fun m!517553 () Bool)

(assert (=> b!538446 m!517553))

(declare-fun m!517555 () Bool)

(assert (=> b!538446 m!517555))

(declare-fun m!517557 () Bool)

(assert (=> b!538447 m!517557))

(assert (=> b!538447 m!517545))

(assert (=> b!538447 m!517545))

(declare-fun m!517559 () Bool)

(assert (=> b!538447 m!517559))

(assert (=> b!538447 m!517559))

(assert (=> b!538447 m!517545))

(declare-fun m!517561 () Bool)

(assert (=> b!538447 m!517561))

(declare-fun m!517563 () Bool)

(assert (=> b!538445 m!517563))

(assert (=> b!538450 m!517545))

(assert (=> b!538450 m!517545))

(declare-fun m!517565 () Bool)

(assert (=> b!538450 m!517565))

(declare-fun m!517567 () Bool)

(assert (=> b!538452 m!517567))

(declare-fun m!517569 () Bool)

(assert (=> b!538455 m!517569))

(declare-fun m!517571 () Bool)

(assert (=> b!538451 m!517571))

(assert (=> b!538451 m!517545))

(declare-fun m!517573 () Bool)

(assert (=> b!538448 m!517573))

(declare-fun m!517575 () Bool)

(assert (=> start!48870 m!517575))

(declare-fun m!517577 () Bool)

(assert (=> start!48870 m!517577))

(assert (=> b!538449 m!517545))

(assert (=> b!538449 m!517545))

(declare-fun m!517579 () Bool)

(assert (=> b!538449 m!517579))

(declare-fun m!517581 () Bool)

(assert (=> b!538457 m!517581))

(declare-fun m!517583 () Bool)

(assert (=> b!538454 m!517583))

(push 1)

