; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48878 () Bool)

(assert start!48878)

(declare-fun b!538601 () Bool)

(declare-fun res!333813 () Bool)

(declare-fun e!312313 () Bool)

(assert (=> b!538601 (=> (not res!333813) (not e!312313))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(declare-datatypes ((array!34090 0))(
  ( (array!34091 (arr!16384 (Array (_ BitVec 32) (_ BitVec 64))) (size!16748 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34090)

(assert (=> b!538601 (= res!333813 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16748 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16748 a!3154)) (= (select (arr!16384 a!3154) resIndex!32) (select (arr!16384 a!3154) j!147))))))

(declare-fun res!333808 () Bool)

(declare-fun e!312310 () Bool)

(assert (=> start!48878 (=> (not res!333808) (not e!312310))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48878 (= res!333808 (validMask!0 mask!3216))))

(assert (=> start!48878 e!312310))

(assert (=> start!48878 true))

(declare-fun array_inv!12180 (array!34090) Bool)

(assert (=> start!48878 (array_inv!12180 a!3154)))

(declare-fun b!538602 () Bool)

(declare-fun res!333811 () Bool)

(assert (=> b!538602 (=> (not res!333811) (not e!312310))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34090 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!538602 (= res!333811 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!538603 () Bool)

(declare-fun res!333810 () Bool)

(assert (=> b!538603 (=> (not res!333810) (not e!312313))))

(declare-datatypes ((List!10503 0))(
  ( (Nil!10500) (Cons!10499 (h!11442 (_ BitVec 64)) (t!16731 List!10503)) )
))
(declare-fun arrayNoDuplicates!0 (array!34090 (_ BitVec 32) List!10503) Bool)

(assert (=> b!538603 (= res!333810 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10500))))

(declare-fun b!538604 () Bool)

(declare-fun res!333807 () Bool)

(assert (=> b!538604 (=> (not res!333807) (not e!312310))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!538604 (= res!333807 (validKeyInArray!0 k0!1998))))

(declare-fun b!538605 () Bool)

(assert (=> b!538605 (= e!312310 e!312313)))

(declare-fun res!333816 () Bool)

(assert (=> b!538605 (=> (not res!333816) (not e!312313))))

(declare-datatypes ((SeekEntryResult!4842 0))(
  ( (MissingZero!4842 (index!21592 (_ BitVec 32))) (Found!4842 (index!21593 (_ BitVec 32))) (Intermediate!4842 (undefined!5654 Bool) (index!21594 (_ BitVec 32)) (x!50513 (_ BitVec 32))) (Undefined!4842) (MissingVacant!4842 (index!21595 (_ BitVec 32))) )
))
(declare-fun lt!246860 () SeekEntryResult!4842)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!538605 (= res!333816 (or (= lt!246860 (MissingZero!4842 i!1153)) (= lt!246860 (MissingVacant!4842 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34090 (_ BitVec 32)) SeekEntryResult!4842)

(assert (=> b!538605 (= lt!246860 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!538606 () Bool)

(declare-fun e!312312 () Bool)

(declare-fun e!312311 () Bool)

(assert (=> b!538606 (= e!312312 e!312311)))

(declare-fun res!333815 () Bool)

(assert (=> b!538606 (=> (not res!333815) (not e!312311))))

(declare-fun lt!246859 () (_ BitVec 32))

(assert (=> b!538606 (= res!333815 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!246859 #b00000000000000000000000000000000) (bvslt lt!246859 (size!16748 a!3154))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!538606 (= lt!246859 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!538607 () Bool)

(declare-fun e!312315 () Bool)

(assert (=> b!538607 (= e!312311 e!312315)))

(declare-fun res!333817 () Bool)

(assert (=> b!538607 (=> (not res!333817) (not e!312315))))

(declare-fun lt!246861 () SeekEntryResult!4842)

(declare-fun lt!246856 () SeekEntryResult!4842)

(declare-fun lt!246862 () SeekEntryResult!4842)

(assert (=> b!538607 (= res!333817 (and (= lt!246861 lt!246862) (= lt!246856 lt!246861)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34090 (_ BitVec 32)) SeekEntryResult!4842)

(assert (=> b!538607 (= lt!246861 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!246859 (select (arr!16384 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!538608 () Bool)

(assert (=> b!538608 (= e!312315 (not (or (bvslt mask!3216 #b00000000000000000000000000000000) (bvslt index!1177 (bvadd #b00000000000000000000000000000001 mask!3216)))))))

(assert (=> b!538608 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!246859 (select (store (arr!16384 a!3154) i!1153 k0!1998) j!147) (array!34091 (store (arr!16384 a!3154) i!1153 k0!1998) (size!16748 a!3154)) mask!3216) lt!246862)))

(declare-datatypes ((Unit!16868 0))(
  ( (Unit!16869) )
))
(declare-fun lt!246857 () Unit!16868)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!34090 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16868)

(assert (=> b!538608 (= lt!246857 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3154 i!1153 k0!1998 j!147 lt!246859 (bvadd #b00000000000000000000000000000001 x!1030) resIndex!32 resX!32 mask!3216))))

(declare-fun b!538609 () Bool)

(declare-fun e!312314 () Bool)

(assert (=> b!538609 (= e!312313 e!312314)))

(declare-fun res!333806 () Bool)

(assert (=> b!538609 (=> (not res!333806) (not e!312314))))

(declare-fun lt!246858 () SeekEntryResult!4842)

(assert (=> b!538609 (= res!333806 (= lt!246858 lt!246862))))

(assert (=> b!538609 (= lt!246862 (Intermediate!4842 false resIndex!32 resX!32))))

(assert (=> b!538609 (= lt!246858 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16384 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!538610 () Bool)

(declare-fun res!333818 () Bool)

(assert (=> b!538610 (=> (not res!333818) (not e!312310))))

(assert (=> b!538610 (= res!333818 (and (= (size!16748 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16748 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16748 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!538611 () Bool)

(declare-fun res!333809 () Bool)

(assert (=> b!538611 (=> (not res!333809) (not e!312310))))

(assert (=> b!538611 (= res!333809 (validKeyInArray!0 (select (arr!16384 a!3154) j!147)))))

(declare-fun b!538612 () Bool)

(assert (=> b!538612 (= e!312314 e!312312)))

(declare-fun res!333812 () Bool)

(assert (=> b!538612 (=> (not res!333812) (not e!312312))))

(assert (=> b!538612 (= res!333812 (and (= lt!246856 lt!246858) (not (= (select (arr!16384 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16384 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16384 a!3154) index!1177) (select (arr!16384 a!3154) j!147)))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!538612 (= lt!246856 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16384 a!3154) j!147) mask!3216) (select (arr!16384 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!538613 () Bool)

(declare-fun res!333814 () Bool)

(assert (=> b!538613 (=> (not res!333814) (not e!312313))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34090 (_ BitVec 32)) Bool)

(assert (=> b!538613 (= res!333814 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(assert (= (and start!48878 res!333808) b!538610))

(assert (= (and b!538610 res!333818) b!538611))

(assert (= (and b!538611 res!333809) b!538604))

(assert (= (and b!538604 res!333807) b!538602))

(assert (= (and b!538602 res!333811) b!538605))

(assert (= (and b!538605 res!333816) b!538613))

(assert (= (and b!538613 res!333814) b!538603))

(assert (= (and b!538603 res!333810) b!538601))

(assert (= (and b!538601 res!333813) b!538609))

(assert (= (and b!538609 res!333806) b!538612))

(assert (= (and b!538612 res!333812) b!538606))

(assert (= (and b!538606 res!333815) b!538607))

(assert (= (and b!538607 res!333817) b!538608))

(declare-fun m!517705 () Bool)

(assert (=> b!538602 m!517705))

(declare-fun m!517707 () Bool)

(assert (=> b!538612 m!517707))

(declare-fun m!517709 () Bool)

(assert (=> b!538612 m!517709))

(assert (=> b!538612 m!517709))

(declare-fun m!517711 () Bool)

(assert (=> b!538612 m!517711))

(assert (=> b!538612 m!517711))

(assert (=> b!538612 m!517709))

(declare-fun m!517713 () Bool)

(assert (=> b!538612 m!517713))

(assert (=> b!538607 m!517709))

(assert (=> b!538607 m!517709))

(declare-fun m!517715 () Bool)

(assert (=> b!538607 m!517715))

(declare-fun m!517717 () Bool)

(assert (=> b!538608 m!517717))

(declare-fun m!517719 () Bool)

(assert (=> b!538608 m!517719))

(assert (=> b!538608 m!517719))

(declare-fun m!517721 () Bool)

(assert (=> b!538608 m!517721))

(declare-fun m!517723 () Bool)

(assert (=> b!538608 m!517723))

(declare-fun m!517725 () Bool)

(assert (=> b!538601 m!517725))

(assert (=> b!538601 m!517709))

(declare-fun m!517727 () Bool)

(assert (=> start!48878 m!517727))

(declare-fun m!517729 () Bool)

(assert (=> start!48878 m!517729))

(assert (=> b!538609 m!517709))

(assert (=> b!538609 m!517709))

(declare-fun m!517731 () Bool)

(assert (=> b!538609 m!517731))

(declare-fun m!517733 () Bool)

(assert (=> b!538604 m!517733))

(declare-fun m!517735 () Bool)

(assert (=> b!538603 m!517735))

(declare-fun m!517737 () Bool)

(assert (=> b!538613 m!517737))

(assert (=> b!538611 m!517709))

(assert (=> b!538611 m!517709))

(declare-fun m!517739 () Bool)

(assert (=> b!538611 m!517739))

(declare-fun m!517741 () Bool)

(assert (=> b!538606 m!517741))

(declare-fun m!517743 () Bool)

(assert (=> b!538605 m!517743))

(check-sat (not b!538604) (not b!538611) (not b!538607) (not start!48878) (not b!538609) (not b!538613) (not b!538612) (not b!538606) (not b!538602) (not b!538608) (not b!538605) (not b!538603))
(check-sat)
