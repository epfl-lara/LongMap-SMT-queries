; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48712 () Bool)

(assert start!48712)

(declare-fun b!535491 () Bool)

(declare-fun res!330759 () Bool)

(declare-fun e!311039 () Bool)

(assert (=> b!535491 (=> (not res!330759) (not e!311039))))

(declare-datatypes ((array!33923 0))(
  ( (array!33924 (arr!16300 (Array (_ BitVec 32) (_ BitVec 64))) (size!16664 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33923)

(declare-fun j!147 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!535491 (= res!330759 (validKeyInArray!0 (select (arr!16300 a!3154) j!147)))))

(declare-fun b!535492 () Bool)

(declare-fun res!330756 () Bool)

(declare-fun e!311038 () Bool)

(assert (=> b!535492 (=> (not res!330756) (not e!311038))))

(declare-datatypes ((List!10326 0))(
  ( (Nil!10323) (Cons!10322 (h!11265 (_ BitVec 64)) (t!16546 List!10326)) )
))
(declare-fun arrayNoDuplicates!0 (array!33923 (_ BitVec 32) List!10326) Bool)

(assert (=> b!535492 (= res!330756 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10323))))

(declare-fun b!535493 () Bool)

(declare-fun res!330755 () Bool)

(assert (=> b!535493 (=> (not res!330755) (not e!311039))))

(declare-fun k0!1998 () (_ BitVec 64))

(assert (=> b!535493 (= res!330755 (validKeyInArray!0 k0!1998))))

(declare-fun b!535494 () Bool)

(declare-fun e!311040 () Bool)

(assert (=> b!535494 (= e!311038 e!311040)))

(declare-fun res!330760 () Bool)

(assert (=> b!535494 (=> (not res!330760) (not e!311040))))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4714 0))(
  ( (MissingZero!4714 (index!21080 (_ BitVec 32))) (Found!4714 (index!21081 (_ BitVec 32))) (Intermediate!4714 (undefined!5526 Bool) (index!21082 (_ BitVec 32)) (x!50174 (_ BitVec 32))) (Undefined!4714) (MissingVacant!4714 (index!21083 (_ BitVec 32))) )
))
(declare-fun lt!245856 () SeekEntryResult!4714)

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!535494 (= res!330760 (= lt!245856 (Intermediate!4714 false resIndex!32 resX!32)))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33923 (_ BitVec 32)) SeekEntryResult!4714)

(assert (=> b!535494 (= lt!245856 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16300 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!535495 () Bool)

(declare-fun res!330753 () Bool)

(assert (=> b!535495 (=> (not res!330753) (not e!311038))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33923 (_ BitVec 32)) Bool)

(assert (=> b!535495 (= res!330753 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!535496 () Bool)

(assert (=> b!535496 (= e!311040 (and (not (= (select (arr!16300 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16300 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16300 a!3154) index!1177) (select (arr!16300 a!3154) j!147))) (bvsge mask!3216 #b00000000000000000000000000000000) (bvsge index!1177 (bvadd #b00000000000000000000000000000001 mask!3216))))))

(declare-fun b!535497 () Bool)

(assert (=> b!535497 (= e!311039 e!311038)))

(declare-fun res!330758 () Bool)

(assert (=> b!535497 (=> (not res!330758) (not e!311038))))

(declare-fun lt!245857 () SeekEntryResult!4714)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!535497 (= res!330758 (or (= lt!245857 (MissingZero!4714 i!1153)) (= lt!245857 (MissingVacant!4714 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33923 (_ BitVec 32)) SeekEntryResult!4714)

(assert (=> b!535497 (= lt!245857 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!535499 () Bool)

(declare-fun res!330757 () Bool)

(assert (=> b!535499 (=> (not res!330757) (not e!311039))))

(assert (=> b!535499 (= res!330757 (and (= (size!16664 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16664 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16664 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!535500 () Bool)

(declare-fun res!330751 () Bool)

(assert (=> b!535500 (=> (not res!330751) (not e!311038))))

(assert (=> b!535500 (= res!330751 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16664 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16664 a!3154)) (= (select (arr!16300 a!3154) resIndex!32) (select (arr!16300 a!3154) j!147))))))

(declare-fun b!535501 () Bool)

(declare-fun res!330752 () Bool)

(assert (=> b!535501 (=> (not res!330752) (not e!311040))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!535501 (= res!330752 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16300 a!3154) j!147) mask!3216) (select (arr!16300 a!3154) j!147) a!3154 mask!3216) lt!245856))))

(declare-fun b!535498 () Bool)

(declare-fun res!330754 () Bool)

(assert (=> b!535498 (=> (not res!330754) (not e!311039))))

(declare-fun arrayContainsKey!0 (array!33923 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!535498 (= res!330754 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun res!330750 () Bool)

(assert (=> start!48712 (=> (not res!330750) (not e!311039))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48712 (= res!330750 (validMask!0 mask!3216))))

(assert (=> start!48712 e!311039))

(assert (=> start!48712 true))

(declare-fun array_inv!12159 (array!33923) Bool)

(assert (=> start!48712 (array_inv!12159 a!3154)))

(assert (= (and start!48712 res!330750) b!535499))

(assert (= (and b!535499 res!330757) b!535491))

(assert (= (and b!535491 res!330759) b!535493))

(assert (= (and b!535493 res!330755) b!535498))

(assert (= (and b!535498 res!330754) b!535497))

(assert (= (and b!535497 res!330758) b!535495))

(assert (= (and b!535495 res!330753) b!535492))

(assert (= (and b!535492 res!330756) b!535500))

(assert (= (and b!535500 res!330751) b!535494))

(assert (= (and b!535494 res!330760) b!535501))

(assert (= (and b!535501 res!330752) b!535496))

(declare-fun m!515305 () Bool)

(assert (=> b!535500 m!515305))

(declare-fun m!515307 () Bool)

(assert (=> b!535500 m!515307))

(declare-fun m!515309 () Bool)

(assert (=> start!48712 m!515309))

(declare-fun m!515311 () Bool)

(assert (=> start!48712 m!515311))

(assert (=> b!535494 m!515307))

(assert (=> b!535494 m!515307))

(declare-fun m!515313 () Bool)

(assert (=> b!535494 m!515313))

(declare-fun m!515315 () Bool)

(assert (=> b!535492 m!515315))

(assert (=> b!535501 m!515307))

(assert (=> b!535501 m!515307))

(declare-fun m!515317 () Bool)

(assert (=> b!535501 m!515317))

(assert (=> b!535501 m!515317))

(assert (=> b!535501 m!515307))

(declare-fun m!515319 () Bool)

(assert (=> b!535501 m!515319))

(declare-fun m!515321 () Bool)

(assert (=> b!535498 m!515321))

(assert (=> b!535491 m!515307))

(assert (=> b!535491 m!515307))

(declare-fun m!515323 () Bool)

(assert (=> b!535491 m!515323))

(declare-fun m!515325 () Bool)

(assert (=> b!535497 m!515325))

(declare-fun m!515327 () Bool)

(assert (=> b!535493 m!515327))

(declare-fun m!515329 () Bool)

(assert (=> b!535495 m!515329))

(declare-fun m!515331 () Bool)

(assert (=> b!535496 m!515331))

(assert (=> b!535496 m!515307))

(check-sat (not b!535494) (not b!535497) (not b!535501) (not b!535495) (not b!535491) (not start!48712) (not b!535498) (not b!535493) (not b!535492))
(check-sat)
