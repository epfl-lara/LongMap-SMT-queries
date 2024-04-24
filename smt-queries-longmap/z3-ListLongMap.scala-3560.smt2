; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48976 () Bool)

(assert start!48976)

(declare-fun b!539559 () Bool)

(declare-fun e!312773 () Bool)

(declare-fun e!312774 () Bool)

(assert (=> b!539559 (= e!312773 e!312774)))

(declare-fun res!334663 () Bool)

(assert (=> b!539559 (=> (not res!334663) (not e!312774))))

(declare-datatypes ((SeekEntryResult!4819 0))(
  ( (MissingZero!4819 (index!21500 (_ BitVec 32))) (Found!4819 (index!21501 (_ BitVec 32))) (Intermediate!4819 (undefined!5631 Bool) (index!21502 (_ BitVec 32)) (x!50565 (_ BitVec 32))) (Undefined!4819) (MissingVacant!4819 (index!21503 (_ BitVec 32))) )
))
(declare-fun lt!247230 () SeekEntryResult!4819)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!539559 (= res!334663 (or (= lt!247230 (MissingZero!4819 i!1153)) (= lt!247230 (MissingVacant!4819 i!1153))))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-datatypes ((array!34136 0))(
  ( (array!34137 (arr!16405 (Array (_ BitVec 32) (_ BitVec 64))) (size!16769 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34136)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34136 (_ BitVec 32)) SeekEntryResult!4819)

(assert (=> b!539559 (= lt!247230 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!539560 () Bool)

(declare-fun res!334662 () Bool)

(assert (=> b!539560 (=> (not res!334662) (not e!312773))))

(declare-fun j!147 () (_ BitVec 32))

(assert (=> b!539560 (= res!334662 (and (= (size!16769 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16769 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16769 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!539561 () Bool)

(declare-fun res!334668 () Bool)

(assert (=> b!539561 (=> (not res!334668) (not e!312773))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!539561 (= res!334668 (validKeyInArray!0 k0!1998))))

(declare-fun b!539562 () Bool)

(declare-fun res!334669 () Bool)

(assert (=> b!539562 (=> (not res!334669) (not e!312774))))

(declare-datatypes ((List!10431 0))(
  ( (Nil!10428) (Cons!10427 (h!11373 (_ BitVec 64)) (t!16651 List!10431)) )
))
(declare-fun arrayNoDuplicates!0 (array!34136 (_ BitVec 32) List!10431) Bool)

(assert (=> b!539562 (= res!334669 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10428))))

(declare-fun b!539563 () Bool)

(declare-fun res!334659 () Bool)

(assert (=> b!539563 (=> (not res!334659) (not e!312774))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!539563 (= res!334659 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16769 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16769 a!3154)) (= (select (arr!16405 a!3154) resIndex!32) (select (arr!16405 a!3154) j!147))))))

(declare-fun b!539564 () Bool)

(declare-fun res!334666 () Bool)

(assert (=> b!539564 (=> (not res!334666) (not e!312773))))

(declare-fun arrayContainsKey!0 (array!34136 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!539564 (= res!334666 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!539565 () Bool)

(declare-fun res!334664 () Bool)

(declare-fun e!312772 () Bool)

(assert (=> b!539565 (=> (not res!334664) (not e!312772))))

(declare-fun lt!247231 () SeekEntryResult!4819)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34136 (_ BitVec 32)) SeekEntryResult!4819)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!539565 (= res!334664 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16405 a!3154) j!147) mask!3216) (select (arr!16405 a!3154) j!147) a!3154 mask!3216) lt!247231))))

(declare-fun b!539566 () Bool)

(assert (=> b!539566 (= e!312772 (bvslt (bvsub #b01111111111111111111111111111110 x!1030) #b00000000000000000000000000000000))))

(declare-fun b!539567 () Bool)

(declare-fun res!334660 () Bool)

(assert (=> b!539567 (=> (not res!334660) (not e!312773))))

(assert (=> b!539567 (= res!334660 (validKeyInArray!0 (select (arr!16405 a!3154) j!147)))))

(declare-fun res!334665 () Bool)

(assert (=> start!48976 (=> (not res!334665) (not e!312773))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48976 (= res!334665 (validMask!0 mask!3216))))

(assert (=> start!48976 e!312773))

(assert (=> start!48976 true))

(declare-fun array_inv!12264 (array!34136) Bool)

(assert (=> start!48976 (array_inv!12264 a!3154)))

(declare-fun b!539568 () Bool)

(assert (=> b!539568 (= e!312774 e!312772)))

(declare-fun res!334667 () Bool)

(assert (=> b!539568 (=> (not res!334667) (not e!312772))))

(assert (=> b!539568 (= res!334667 (= lt!247231 (Intermediate!4819 false resIndex!32 resX!32)))))

(assert (=> b!539568 (= lt!247231 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16405 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!539569 () Bool)

(declare-fun res!334661 () Bool)

(assert (=> b!539569 (=> (not res!334661) (not e!312774))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34136 (_ BitVec 32)) Bool)

(assert (=> b!539569 (= res!334661 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(assert (= (and start!48976 res!334665) b!539560))

(assert (= (and b!539560 res!334662) b!539567))

(assert (= (and b!539567 res!334660) b!539561))

(assert (= (and b!539561 res!334668) b!539564))

(assert (= (and b!539564 res!334666) b!539559))

(assert (= (and b!539559 res!334663) b!539569))

(assert (= (and b!539569 res!334661) b!539562))

(assert (= (and b!539562 res!334669) b!539563))

(assert (= (and b!539563 res!334659) b!539568))

(assert (= (and b!539568 res!334667) b!539565))

(assert (= (and b!539565 res!334664) b!539566))

(declare-fun m!518719 () Bool)

(assert (=> b!539559 m!518719))

(declare-fun m!518721 () Bool)

(assert (=> b!539563 m!518721))

(declare-fun m!518723 () Bool)

(assert (=> b!539563 m!518723))

(declare-fun m!518725 () Bool)

(assert (=> b!539561 m!518725))

(declare-fun m!518727 () Bool)

(assert (=> b!539569 m!518727))

(assert (=> b!539568 m!518723))

(assert (=> b!539568 m!518723))

(declare-fun m!518729 () Bool)

(assert (=> b!539568 m!518729))

(declare-fun m!518731 () Bool)

(assert (=> b!539562 m!518731))

(declare-fun m!518733 () Bool)

(assert (=> start!48976 m!518733))

(declare-fun m!518735 () Bool)

(assert (=> start!48976 m!518735))

(assert (=> b!539565 m!518723))

(assert (=> b!539565 m!518723))

(declare-fun m!518737 () Bool)

(assert (=> b!539565 m!518737))

(assert (=> b!539565 m!518737))

(assert (=> b!539565 m!518723))

(declare-fun m!518739 () Bool)

(assert (=> b!539565 m!518739))

(assert (=> b!539567 m!518723))

(assert (=> b!539567 m!518723))

(declare-fun m!518741 () Bool)

(assert (=> b!539567 m!518741))

(declare-fun m!518743 () Bool)

(assert (=> b!539564 m!518743))

(check-sat (not b!539569) (not b!539559) (not b!539561) (not b!539565) (not b!539568) (not b!539564) (not start!48976) (not b!539562) (not b!539567))
(check-sat)
