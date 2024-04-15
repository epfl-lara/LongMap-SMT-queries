; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48732 () Bool)

(assert start!48732)

(declare-fun b!535717 () Bool)

(declare-fun res!331068 () Bool)

(declare-fun e!311068 () Bool)

(assert (=> b!535717 (=> (not res!331068) (not e!311068))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!33954 0))(
  ( (array!33955 (arr!16316 (Array (_ BitVec 32) (_ BitVec 64))) (size!16681 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33954)

(assert (=> b!535717 (= res!331068 (and (not (= (select (arr!16316 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16316 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16316 a!3154) index!1177) (select (arr!16316 a!3154) j!147)))))))

(declare-fun res!331069 () Bool)

(declare-fun e!311067 () Bool)

(assert (=> start!48732 (=> (not res!331069) (not e!311067))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48732 (= res!331069 (validMask!0 mask!3216))))

(assert (=> start!48732 e!311067))

(assert (=> start!48732 true))

(declare-fun array_inv!12199 (array!33954) Bool)

(assert (=> start!48732 (array_inv!12199 a!3154)))

(declare-fun b!535718 () Bool)

(declare-fun e!311070 () Bool)

(assert (=> b!535718 (= e!311068 e!311070)))

(declare-fun res!331066 () Bool)

(assert (=> b!535718 (=> (not res!331066) (not e!311070))))

(declare-fun resX!32 () (_ BitVec 32))

(declare-fun lt!245725 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(assert (=> b!535718 (= res!331066 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!245725 #b00000000000000000000000000000000) (bvslt lt!245725 (size!16681 a!3154))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!535718 (= lt!245725 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!535719 () Bool)

(declare-fun res!331074 () Bool)

(declare-fun e!311066 () Bool)

(assert (=> b!535719 (=> (not res!331074) (not e!311066))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33954 (_ BitVec 32)) Bool)

(assert (=> b!535719 (= res!331074 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!535720 () Bool)

(declare-fun res!331065 () Bool)

(assert (=> b!535720 (=> (not res!331065) (not e!311066))))

(declare-datatypes ((List!10474 0))(
  ( (Nil!10471) (Cons!10470 (h!11413 (_ BitVec 64)) (t!16693 List!10474)) )
))
(declare-fun arrayNoDuplicates!0 (array!33954 (_ BitVec 32) List!10474) Bool)

(assert (=> b!535720 (= res!331065 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10471))))

(declare-fun b!535721 () Bool)

(declare-fun res!331073 () Bool)

(assert (=> b!535721 (=> (not res!331073) (not e!311067))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!535721 (= res!331073 (validKeyInArray!0 (select (arr!16316 a!3154) j!147)))))

(declare-fun b!535722 () Bool)

(assert (=> b!535722 (= e!311070 false)))

(declare-datatypes ((SeekEntryResult!4771 0))(
  ( (MissingZero!4771 (index!21308 (_ BitVec 32))) (Found!4771 (index!21309 (_ BitVec 32))) (Intermediate!4771 (undefined!5583 Bool) (index!21310 (_ BitVec 32)) (x!50261 (_ BitVec 32))) (Undefined!4771) (MissingVacant!4771 (index!21311 (_ BitVec 32))) )
))
(declare-fun lt!245722 () SeekEntryResult!4771)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33954 (_ BitVec 32)) SeekEntryResult!4771)

(assert (=> b!535722 (= lt!245722 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!245725 (select (arr!16316 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!535723 () Bool)

(declare-fun res!331075 () Bool)

(assert (=> b!535723 (=> (not res!331075) (not e!311068))))

(declare-fun lt!245723 () SeekEntryResult!4771)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!535723 (= res!331075 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16316 a!3154) j!147) mask!3216) (select (arr!16316 a!3154) j!147) a!3154 mask!3216) lt!245723))))

(declare-fun b!535724 () Bool)

(assert (=> b!535724 (= e!311067 e!311066)))

(declare-fun res!331064 () Bool)

(assert (=> b!535724 (=> (not res!331064) (not e!311066))))

(declare-fun lt!245724 () SeekEntryResult!4771)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!535724 (= res!331064 (or (= lt!245724 (MissingZero!4771 i!1153)) (= lt!245724 (MissingVacant!4771 i!1153))))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33954 (_ BitVec 32)) SeekEntryResult!4771)

(assert (=> b!535724 (= lt!245724 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!535725 () Bool)

(assert (=> b!535725 (= e!311066 e!311068)))

(declare-fun res!331070 () Bool)

(assert (=> b!535725 (=> (not res!331070) (not e!311068))))

(declare-fun resIndex!32 () (_ BitVec 32))

(assert (=> b!535725 (= res!331070 (= lt!245723 (Intermediate!4771 false resIndex!32 resX!32)))))

(assert (=> b!535725 (= lt!245723 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16316 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!535726 () Bool)

(declare-fun res!331071 () Bool)

(assert (=> b!535726 (=> (not res!331071) (not e!311067))))

(assert (=> b!535726 (= res!331071 (validKeyInArray!0 k0!1998))))

(declare-fun b!535727 () Bool)

(declare-fun res!331076 () Bool)

(assert (=> b!535727 (=> (not res!331076) (not e!311066))))

(assert (=> b!535727 (= res!331076 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16681 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16681 a!3154)) (= (select (arr!16316 a!3154) resIndex!32) (select (arr!16316 a!3154) j!147))))))

(declare-fun b!535728 () Bool)

(declare-fun res!331067 () Bool)

(assert (=> b!535728 (=> (not res!331067) (not e!311067))))

(assert (=> b!535728 (= res!331067 (and (= (size!16681 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16681 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16681 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!535729 () Bool)

(declare-fun res!331072 () Bool)

(assert (=> b!535729 (=> (not res!331072) (not e!311067))))

(declare-fun arrayContainsKey!0 (array!33954 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!535729 (= res!331072 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(assert (= (and start!48732 res!331069) b!535728))

(assert (= (and b!535728 res!331067) b!535721))

(assert (= (and b!535721 res!331073) b!535726))

(assert (= (and b!535726 res!331071) b!535729))

(assert (= (and b!535729 res!331072) b!535724))

(assert (= (and b!535724 res!331064) b!535719))

(assert (= (and b!535719 res!331074) b!535720))

(assert (= (and b!535720 res!331065) b!535727))

(assert (= (and b!535727 res!331076) b!535725))

(assert (= (and b!535725 res!331070) b!535723))

(assert (= (and b!535723 res!331075) b!535717))

(assert (= (and b!535717 res!331068) b!535718))

(assert (= (and b!535718 res!331066) b!535722))

(declare-fun m!514729 () Bool)

(assert (=> b!535719 m!514729))

(declare-fun m!514731 () Bool)

(assert (=> b!535729 m!514731))

(declare-fun m!514733 () Bool)

(assert (=> b!535724 m!514733))

(declare-fun m!514735 () Bool)

(assert (=> b!535726 m!514735))

(declare-fun m!514737 () Bool)

(assert (=> b!535717 m!514737))

(declare-fun m!514739 () Bool)

(assert (=> b!535717 m!514739))

(assert (=> b!535722 m!514739))

(assert (=> b!535722 m!514739))

(declare-fun m!514741 () Bool)

(assert (=> b!535722 m!514741))

(declare-fun m!514743 () Bool)

(assert (=> b!535720 m!514743))

(declare-fun m!514745 () Bool)

(assert (=> start!48732 m!514745))

(declare-fun m!514747 () Bool)

(assert (=> start!48732 m!514747))

(declare-fun m!514749 () Bool)

(assert (=> b!535718 m!514749))

(assert (=> b!535721 m!514739))

(assert (=> b!535721 m!514739))

(declare-fun m!514751 () Bool)

(assert (=> b!535721 m!514751))

(assert (=> b!535723 m!514739))

(assert (=> b!535723 m!514739))

(declare-fun m!514753 () Bool)

(assert (=> b!535723 m!514753))

(assert (=> b!535723 m!514753))

(assert (=> b!535723 m!514739))

(declare-fun m!514755 () Bool)

(assert (=> b!535723 m!514755))

(assert (=> b!535725 m!514739))

(assert (=> b!535725 m!514739))

(declare-fun m!514757 () Bool)

(assert (=> b!535725 m!514757))

(declare-fun m!514759 () Bool)

(assert (=> b!535727 m!514759))

(assert (=> b!535727 m!514739))

(check-sat (not b!535726) (not b!535720) (not b!535722) (not b!535725) (not b!535721) (not start!48732) (not b!535724) (not b!535719) (not b!535729) (not b!535718) (not b!535723))
(check-sat)
