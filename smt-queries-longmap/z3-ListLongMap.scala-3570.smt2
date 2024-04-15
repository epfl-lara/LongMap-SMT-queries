; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49086 () Bool)

(assert start!49086)

(declare-fun b!540535 () Bool)

(declare-fun e!313101 () Bool)

(assert (=> b!540535 (= e!313101 false)))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4894 0))(
  ( (MissingZero!4894 (index!21800 (_ BitVec 32))) (Found!4894 (index!21801 (_ BitVec 32))) (Intermediate!4894 (undefined!5706 Bool) (index!21802 (_ BitVec 32)) (x!50724 (_ BitVec 32))) (Undefined!4894) (MissingVacant!4894 (index!21803 (_ BitVec 32))) )
))
(declare-fun lt!247261 () SeekEntryResult!4894)

(declare-datatypes ((array!34206 0))(
  ( (array!34207 (arr!16439 (Array (_ BitVec 32) (_ BitVec 64))) (size!16804 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34206)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34206 (_ BitVec 32)) SeekEntryResult!4894)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!540535 (= lt!247261 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16439 a!3154) j!147) mask!3216) (select (arr!16439 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!540536 () Bool)

(declare-fun res!335573 () Bool)

(declare-fun e!313100 () Bool)

(assert (=> b!540536 (=> (not res!335573) (not e!313100))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!540536 (= res!335573 (validKeyInArray!0 k0!1998))))

(declare-fun b!540537 () Bool)

(declare-fun res!335567 () Bool)

(assert (=> b!540537 (=> (not res!335567) (not e!313101))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!540537 (= res!335567 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16804 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16804 a!3154)) (= (select (arr!16439 a!3154) resIndex!32) (select (arr!16439 a!3154) j!147))))))

(declare-fun b!540539 () Bool)

(declare-fun res!335565 () Bool)

(assert (=> b!540539 (=> (not res!335565) (not e!313101))))

(declare-datatypes ((List!10597 0))(
  ( (Nil!10594) (Cons!10593 (h!11542 (_ BitVec 64)) (t!16816 List!10597)) )
))
(declare-fun arrayNoDuplicates!0 (array!34206 (_ BitVec 32) List!10597) Bool)

(assert (=> b!540539 (= res!335565 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10594))))

(declare-fun b!540540 () Bool)

(declare-fun res!335570 () Bool)

(assert (=> b!540540 (=> (not res!335570) (not e!313101))))

(assert (=> b!540540 (= res!335570 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16439 a!3154) j!147) a!3154 mask!3216) (Intermediate!4894 false resIndex!32 resX!32)))))

(declare-fun b!540541 () Bool)

(declare-fun res!335566 () Bool)

(assert (=> b!540541 (=> (not res!335566) (not e!313100))))

(declare-fun arrayContainsKey!0 (array!34206 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!540541 (= res!335566 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!540542 () Bool)

(assert (=> b!540542 (= e!313100 e!313101)))

(declare-fun res!335564 () Bool)

(assert (=> b!540542 (=> (not res!335564) (not e!313101))))

(declare-fun lt!247260 () SeekEntryResult!4894)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!540542 (= res!335564 (or (= lt!247260 (MissingZero!4894 i!1153)) (= lt!247260 (MissingVacant!4894 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34206 (_ BitVec 32)) SeekEntryResult!4894)

(assert (=> b!540542 (= lt!247260 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!540538 () Bool)

(declare-fun res!335571 () Bool)

(assert (=> b!540538 (=> (not res!335571) (not e!313100))))

(assert (=> b!540538 (= res!335571 (and (= (size!16804 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16804 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16804 a!3154)) (not (= i!1153 j!147))))))

(declare-fun res!335572 () Bool)

(assert (=> start!49086 (=> (not res!335572) (not e!313100))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49086 (= res!335572 (validMask!0 mask!3216))))

(assert (=> start!49086 e!313100))

(assert (=> start!49086 true))

(declare-fun array_inv!12322 (array!34206) Bool)

(assert (=> start!49086 (array_inv!12322 a!3154)))

(declare-fun b!540543 () Bool)

(declare-fun res!335569 () Bool)

(assert (=> b!540543 (=> (not res!335569) (not e!313100))))

(assert (=> b!540543 (= res!335569 (validKeyInArray!0 (select (arr!16439 a!3154) j!147)))))

(declare-fun b!540544 () Bool)

(declare-fun res!335568 () Bool)

(assert (=> b!540544 (=> (not res!335568) (not e!313101))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34206 (_ BitVec 32)) Bool)

(assert (=> b!540544 (= res!335568 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(assert (= (and start!49086 res!335572) b!540538))

(assert (= (and b!540538 res!335571) b!540543))

(assert (= (and b!540543 res!335569) b!540536))

(assert (= (and b!540536 res!335573) b!540541))

(assert (= (and b!540541 res!335566) b!540542))

(assert (= (and b!540542 res!335564) b!540544))

(assert (= (and b!540544 res!335568) b!540539))

(assert (= (and b!540539 res!335565) b!540537))

(assert (= (and b!540537 res!335567) b!540540))

(assert (= (and b!540540 res!335570) b!540535))

(declare-fun m!518713 () Bool)

(assert (=> b!540539 m!518713))

(declare-fun m!518715 () Bool)

(assert (=> b!540535 m!518715))

(assert (=> b!540535 m!518715))

(declare-fun m!518717 () Bool)

(assert (=> b!540535 m!518717))

(assert (=> b!540535 m!518717))

(assert (=> b!540535 m!518715))

(declare-fun m!518719 () Bool)

(assert (=> b!540535 m!518719))

(assert (=> b!540540 m!518715))

(assert (=> b!540540 m!518715))

(declare-fun m!518721 () Bool)

(assert (=> b!540540 m!518721))

(assert (=> b!540543 m!518715))

(assert (=> b!540543 m!518715))

(declare-fun m!518723 () Bool)

(assert (=> b!540543 m!518723))

(declare-fun m!518725 () Bool)

(assert (=> b!540544 m!518725))

(declare-fun m!518727 () Bool)

(assert (=> b!540542 m!518727))

(declare-fun m!518729 () Bool)

(assert (=> b!540537 m!518729))

(assert (=> b!540537 m!518715))

(declare-fun m!518731 () Bool)

(assert (=> b!540541 m!518731))

(declare-fun m!518733 () Bool)

(assert (=> start!49086 m!518733))

(declare-fun m!518735 () Bool)

(assert (=> start!49086 m!518735))

(declare-fun m!518737 () Bool)

(assert (=> b!540536 m!518737))

(check-sat (not b!540540) (not b!540541) (not b!540542) (not b!540535) (not b!540539) (not b!540536) (not b!540544) (not start!49086) (not b!540543))
(check-sat)
