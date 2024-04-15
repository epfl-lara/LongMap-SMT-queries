; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49254 () Bool)

(assert start!49254)

(declare-fun b!542015 () Bool)

(declare-fun e!313740 () Bool)

(declare-fun e!313743 () Bool)

(assert (=> b!542015 (= e!313740 e!313743)))

(declare-fun res!336710 () Bool)

(assert (=> b!542015 (=> (not res!336710) (not e!313743))))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4924 0))(
  ( (MissingZero!4924 (index!21920 (_ BitVec 32))) (Found!4924 (index!21921 (_ BitVec 32))) (Intermediate!4924 (undefined!5736 Bool) (index!21922 (_ BitVec 32)) (x!50846 (_ BitVec 32))) (Undefined!4924) (MissingVacant!4924 (index!21923 (_ BitVec 32))) )
))
(declare-fun lt!247649 () SeekEntryResult!4924)

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!542015 (= res!336710 (= lt!247649 (Intermediate!4924 false resIndex!32 resX!32)))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!34272 0))(
  ( (array!34273 (arr!16469 (Array (_ BitVec 32) (_ BitVec 64))) (size!16834 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34272)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34272 (_ BitVec 32)) SeekEntryResult!4924)

(assert (=> b!542015 (= lt!247649 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16469 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!542016 () Bool)

(declare-fun res!336711 () Bool)

(assert (=> b!542016 (=> (not res!336711) (not e!313740))))

(declare-datatypes ((List!10627 0))(
  ( (Nil!10624) (Cons!10623 (h!11578 (_ BitVec 64)) (t!16846 List!10627)) )
))
(declare-fun arrayNoDuplicates!0 (array!34272 (_ BitVec 32) List!10627) Bool)

(assert (=> b!542016 (= res!336711 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10624))))

(declare-fun b!542017 () Bool)

(declare-fun res!336715 () Bool)

(assert (=> b!542017 (=> (not res!336715) (not e!313740))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34272 (_ BitVec 32)) Bool)

(assert (=> b!542017 (= res!336715 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!542018 () Bool)

(assert (=> b!542018 (= e!313743 false)))

(declare-fun lt!247651 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!542018 (= lt!247651 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun res!336712 () Bool)

(declare-fun e!313742 () Bool)

(assert (=> start!49254 (=> (not res!336712) (not e!313742))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49254 (= res!336712 (validMask!0 mask!3216))))

(assert (=> start!49254 e!313742))

(assert (=> start!49254 true))

(declare-fun array_inv!12352 (array!34272) Bool)

(assert (=> start!49254 (array_inv!12352 a!3154)))

(declare-fun b!542019 () Bool)

(declare-fun res!336708 () Bool)

(assert (=> b!542019 (=> (not res!336708) (not e!313742))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!542019 (= res!336708 (validKeyInArray!0 (select (arr!16469 a!3154) j!147)))))

(declare-fun b!542020 () Bool)

(declare-fun res!336709 () Bool)

(assert (=> b!542020 (=> (not res!336709) (not e!313742))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34272 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!542020 (= res!336709 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!542021 () Bool)

(declare-fun res!336716 () Bool)

(assert (=> b!542021 (=> (not res!336716) (not e!313742))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!542021 (= res!336716 (and (= (size!16834 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16834 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16834 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!542022 () Bool)

(declare-fun res!336719 () Bool)

(assert (=> b!542022 (=> (not res!336719) (not e!313742))))

(assert (=> b!542022 (= res!336719 (validKeyInArray!0 k0!1998))))

(declare-fun b!542023 () Bool)

(declare-fun res!336718 () Bool)

(assert (=> b!542023 (=> (not res!336718) (not e!313743))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!542023 (= res!336718 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16469 a!3154) j!147) mask!3216) (select (arr!16469 a!3154) j!147) a!3154 mask!3216) lt!247649))))

(declare-fun b!542024 () Bool)

(assert (=> b!542024 (= e!313742 e!313740)))

(declare-fun res!336714 () Bool)

(assert (=> b!542024 (=> (not res!336714) (not e!313740))))

(declare-fun lt!247650 () SeekEntryResult!4924)

(assert (=> b!542024 (= res!336714 (or (= lt!247650 (MissingZero!4924 i!1153)) (= lt!247650 (MissingVacant!4924 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34272 (_ BitVec 32)) SeekEntryResult!4924)

(assert (=> b!542024 (= lt!247650 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!542025 () Bool)

(declare-fun res!336713 () Bool)

(assert (=> b!542025 (=> (not res!336713) (not e!313743))))

(assert (=> b!542025 (= res!336713 (and (not (= (select (arr!16469 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16469 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16469 a!3154) index!1177) (select (arr!16469 a!3154) j!147)))))))

(declare-fun b!542026 () Bool)

(declare-fun res!336717 () Bool)

(assert (=> b!542026 (=> (not res!336717) (not e!313740))))

(assert (=> b!542026 (= res!336717 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16834 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16834 a!3154)) (= (select (arr!16469 a!3154) resIndex!32) (select (arr!16469 a!3154) j!147))))))

(assert (= (and start!49254 res!336712) b!542021))

(assert (= (and b!542021 res!336716) b!542019))

(assert (= (and b!542019 res!336708) b!542022))

(assert (= (and b!542022 res!336719) b!542020))

(assert (= (and b!542020 res!336709) b!542024))

(assert (= (and b!542024 res!336714) b!542017))

(assert (= (and b!542017 res!336715) b!542016))

(assert (= (and b!542016 res!336711) b!542026))

(assert (= (and b!542026 res!336717) b!542015))

(assert (= (and b!542015 res!336710) b!542023))

(assert (= (and b!542023 res!336718) b!542025))

(assert (= (and b!542025 res!336713) b!542018))

(declare-fun m!519817 () Bool)

(assert (=> b!542025 m!519817))

(declare-fun m!519819 () Bool)

(assert (=> b!542025 m!519819))

(assert (=> b!542019 m!519819))

(assert (=> b!542019 m!519819))

(declare-fun m!519821 () Bool)

(assert (=> b!542019 m!519821))

(assert (=> b!542023 m!519819))

(assert (=> b!542023 m!519819))

(declare-fun m!519823 () Bool)

(assert (=> b!542023 m!519823))

(assert (=> b!542023 m!519823))

(assert (=> b!542023 m!519819))

(declare-fun m!519825 () Bool)

(assert (=> b!542023 m!519825))

(declare-fun m!519827 () Bool)

(assert (=> b!542026 m!519827))

(assert (=> b!542026 m!519819))

(declare-fun m!519829 () Bool)

(assert (=> b!542022 m!519829))

(declare-fun m!519831 () Bool)

(assert (=> start!49254 m!519831))

(declare-fun m!519833 () Bool)

(assert (=> start!49254 m!519833))

(assert (=> b!542015 m!519819))

(assert (=> b!542015 m!519819))

(declare-fun m!519835 () Bool)

(assert (=> b!542015 m!519835))

(declare-fun m!519837 () Bool)

(assert (=> b!542018 m!519837))

(declare-fun m!519839 () Bool)

(assert (=> b!542024 m!519839))

(declare-fun m!519841 () Bool)

(assert (=> b!542020 m!519841))

(declare-fun m!519843 () Bool)

(assert (=> b!542017 m!519843))

(declare-fun m!519845 () Bool)

(assert (=> b!542016 m!519845))

(check-sat (not b!542016) (not b!542018) (not b!542020) (not b!542022) (not b!542019) (not b!542024) (not start!49254) (not b!542017) (not b!542015) (not b!542023))
(check-sat)
