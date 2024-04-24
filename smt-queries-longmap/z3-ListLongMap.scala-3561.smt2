; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48982 () Bool)

(assert start!48982)

(declare-fun b!539656 () Bool)

(declare-fun res!334762 () Bool)

(declare-fun e!312806 () Bool)

(assert (=> b!539656 (=> (not res!334762) (not e!312806))))

(declare-datatypes ((array!34142 0))(
  ( (array!34143 (arr!16408 (Array (_ BitVec 32) (_ BitVec 64))) (size!16772 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34142)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34142 (_ BitVec 32)) Bool)

(assert (=> b!539656 (= res!334762 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun res!334763 () Bool)

(declare-fun e!312805 () Bool)

(assert (=> start!48982 (=> (not res!334763) (not e!312805))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48982 (= res!334763 (validMask!0 mask!3216))))

(assert (=> start!48982 e!312805))

(assert (=> start!48982 true))

(declare-fun array_inv!12267 (array!34142) Bool)

(assert (=> start!48982 (array_inv!12267 a!3154)))

(declare-fun b!539657 () Bool)

(declare-fun res!334761 () Bool)

(assert (=> b!539657 (=> (not res!334761) (not e!312806))))

(declare-datatypes ((List!10434 0))(
  ( (Nil!10431) (Cons!10430 (h!11376 (_ BitVec 64)) (t!16654 List!10434)) )
))
(declare-fun arrayNoDuplicates!0 (array!34142 (_ BitVec 32) List!10434) Bool)

(assert (=> b!539657 (= res!334761 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10431))))

(declare-fun b!539658 () Bool)

(declare-fun res!334765 () Bool)

(assert (=> b!539658 (=> (not res!334765) (not e!312805))))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!539658 (= res!334765 (and (= (size!16772 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16772 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16772 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!539659 () Bool)

(declare-fun res!334756 () Bool)

(assert (=> b!539659 (=> (not res!334756) (not e!312806))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!539659 (= res!334756 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16772 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16772 a!3154)) (= (select (arr!16408 a!3154) resIndex!32) (select (arr!16408 a!3154) j!147))))))

(declare-fun b!539660 () Bool)

(declare-fun res!334759 () Bool)

(assert (=> b!539660 (=> (not res!334759) (not e!312805))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!539660 (= res!334759 (validKeyInArray!0 k0!1998))))

(declare-fun b!539661 () Bool)

(declare-fun res!334764 () Bool)

(assert (=> b!539661 (=> (not res!334764) (not e!312805))))

(assert (=> b!539661 (= res!334764 (validKeyInArray!0 (select (arr!16408 a!3154) j!147)))))

(declare-fun b!539662 () Bool)

(assert (=> b!539662 (= e!312805 e!312806)))

(declare-fun res!334757 () Bool)

(assert (=> b!539662 (=> (not res!334757) (not e!312806))))

(declare-datatypes ((SeekEntryResult!4822 0))(
  ( (MissingZero!4822 (index!21512 (_ BitVec 32))) (Found!4822 (index!21513 (_ BitVec 32))) (Intermediate!4822 (undefined!5634 Bool) (index!21514 (_ BitVec 32)) (x!50576 (_ BitVec 32))) (Undefined!4822) (MissingVacant!4822 (index!21515 (_ BitVec 32))) )
))
(declare-fun lt!247248 () SeekEntryResult!4822)

(assert (=> b!539662 (= res!334757 (or (= lt!247248 (MissingZero!4822 i!1153)) (= lt!247248 (MissingVacant!4822 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34142 (_ BitVec 32)) SeekEntryResult!4822)

(assert (=> b!539662 (= lt!247248 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!539663 () Bool)

(declare-fun res!334760 () Bool)

(assert (=> b!539663 (=> (not res!334760) (not e!312806))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34142 (_ BitVec 32)) SeekEntryResult!4822)

(assert (=> b!539663 (= res!334760 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16408 a!3154) j!147) a!3154 mask!3216) (Intermediate!4822 false resIndex!32 resX!32)))))

(declare-fun b!539664 () Bool)

(declare-fun res!334758 () Bool)

(assert (=> b!539664 (=> (not res!334758) (not e!312805))))

(declare-fun arrayContainsKey!0 (array!34142 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!539664 (= res!334758 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!539665 () Bool)

(assert (=> b!539665 (= e!312806 false)))

(declare-fun lt!247249 () SeekEntryResult!4822)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!539665 (= lt!247249 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16408 a!3154) j!147) mask!3216) (select (arr!16408 a!3154) j!147) a!3154 mask!3216))))

(assert (= (and start!48982 res!334763) b!539658))

(assert (= (and b!539658 res!334765) b!539661))

(assert (= (and b!539661 res!334764) b!539660))

(assert (= (and b!539660 res!334759) b!539664))

(assert (= (and b!539664 res!334758) b!539662))

(assert (= (and b!539662 res!334757) b!539656))

(assert (= (and b!539656 res!334762) b!539657))

(assert (= (and b!539657 res!334761) b!539659))

(assert (= (and b!539659 res!334756) b!539663))

(assert (= (and b!539663 res!334760) b!539665))

(declare-fun m!518797 () Bool)

(assert (=> b!539656 m!518797))

(declare-fun m!518799 () Bool)

(assert (=> b!539664 m!518799))

(declare-fun m!518801 () Bool)

(assert (=> b!539657 m!518801))

(declare-fun m!518803 () Bool)

(assert (=> b!539661 m!518803))

(assert (=> b!539661 m!518803))

(declare-fun m!518805 () Bool)

(assert (=> b!539661 m!518805))

(declare-fun m!518807 () Bool)

(assert (=> b!539660 m!518807))

(declare-fun m!518809 () Bool)

(assert (=> b!539662 m!518809))

(assert (=> b!539663 m!518803))

(assert (=> b!539663 m!518803))

(declare-fun m!518811 () Bool)

(assert (=> b!539663 m!518811))

(declare-fun m!518813 () Bool)

(assert (=> start!48982 m!518813))

(declare-fun m!518815 () Bool)

(assert (=> start!48982 m!518815))

(declare-fun m!518817 () Bool)

(assert (=> b!539659 m!518817))

(assert (=> b!539659 m!518803))

(assert (=> b!539665 m!518803))

(assert (=> b!539665 m!518803))

(declare-fun m!518819 () Bool)

(assert (=> b!539665 m!518819))

(assert (=> b!539665 m!518819))

(assert (=> b!539665 m!518803))

(declare-fun m!518821 () Bool)

(assert (=> b!539665 m!518821))

(check-sat (not b!539660) (not b!539663) (not b!539665) (not b!539656) (not b!539657) (not b!539661) (not start!48982) (not b!539664) (not b!539662))
(check-sat)
