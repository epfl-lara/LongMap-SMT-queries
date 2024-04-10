; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48848 () Bool)

(assert start!48848)

(declare-fun b!538016 () Bool)

(declare-fun res!333225 () Bool)

(declare-fun e!312024 () Bool)

(assert (=> b!538016 (=> (not res!333225) (not e!312024))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!538016 (= res!333225 (validKeyInArray!0 k0!1998))))

(declare-fun b!538017 () Bool)

(declare-fun res!333221 () Bool)

(assert (=> b!538017 (=> (not res!333221) (not e!312024))))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!34060 0))(
  ( (array!34061 (arr!16369 (Array (_ BitVec 32) (_ BitVec 64))) (size!16733 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34060)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!538017 (= res!333221 (and (= (size!16733 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16733 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16733 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!538018 () Bool)

(declare-fun res!333231 () Bool)

(declare-fun e!312022 () Bool)

(assert (=> b!538018 (=> (not res!333231) (not e!312022))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34060 (_ BitVec 32)) Bool)

(assert (=> b!538018 (= res!333231 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!538019 () Bool)

(declare-fun e!312023 () Bool)

(assert (=> b!538019 (= e!312023 false)))

(declare-datatypes ((SeekEntryResult!4827 0))(
  ( (MissingZero!4827 (index!21532 (_ BitVec 32))) (Found!4827 (index!21533 (_ BitVec 32))) (Intermediate!4827 (undefined!5639 Bool) (index!21534 (_ BitVec 32)) (x!50458 (_ BitVec 32))) (Undefined!4827) (MissingVacant!4827 (index!21535 (_ BitVec 32))) )
))
(declare-fun lt!246583 () SeekEntryResult!4827)

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun lt!246580 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34060 (_ BitVec 32)) SeekEntryResult!4827)

(assert (=> b!538019 (= lt!246583 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!246580 (select (arr!16369 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!538020 () Bool)

(declare-fun res!333228 () Bool)

(declare-fun e!312020 () Bool)

(assert (=> b!538020 (=> (not res!333228) (not e!312020))))

(declare-fun lt!246582 () SeekEntryResult!4827)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!538020 (= res!333228 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16369 a!3154) j!147) mask!3216) (select (arr!16369 a!3154) j!147) a!3154 mask!3216) lt!246582))))

(declare-fun b!538021 () Bool)

(declare-fun res!333226 () Bool)

(assert (=> b!538021 (=> (not res!333226) (not e!312020))))

(declare-fun index!1177 () (_ BitVec 32))

(assert (=> b!538021 (= res!333226 (and (not (= (select (arr!16369 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16369 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16369 a!3154) index!1177) (select (arr!16369 a!3154) j!147)))))))

(declare-fun res!333233 () Bool)

(assert (=> start!48848 (=> (not res!333233) (not e!312024))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48848 (= res!333233 (validMask!0 mask!3216))))

(assert (=> start!48848 e!312024))

(assert (=> start!48848 true))

(declare-fun array_inv!12165 (array!34060) Bool)

(assert (=> start!48848 (array_inv!12165 a!3154)))

(declare-fun b!538022 () Bool)

(declare-fun res!333222 () Bool)

(assert (=> b!538022 (=> (not res!333222) (not e!312024))))

(assert (=> b!538022 (= res!333222 (validKeyInArray!0 (select (arr!16369 a!3154) j!147)))))

(declare-fun b!538023 () Bool)

(assert (=> b!538023 (= e!312020 e!312023)))

(declare-fun res!333223 () Bool)

(assert (=> b!538023 (=> (not res!333223) (not e!312023))))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!538023 (= res!333223 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!246580 #b00000000000000000000000000000000) (bvslt lt!246580 (size!16733 a!3154))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!538023 (= lt!246580 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!538024 () Bool)

(declare-fun res!333227 () Bool)

(assert (=> b!538024 (=> (not res!333227) (not e!312022))))

(declare-fun resIndex!32 () (_ BitVec 32))

(assert (=> b!538024 (= res!333227 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16733 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16733 a!3154)) (= (select (arr!16369 a!3154) resIndex!32) (select (arr!16369 a!3154) j!147))))))

(declare-fun b!538025 () Bool)

(assert (=> b!538025 (= e!312022 e!312020)))

(declare-fun res!333232 () Bool)

(assert (=> b!538025 (=> (not res!333232) (not e!312020))))

(assert (=> b!538025 (= res!333232 (= lt!246582 (Intermediate!4827 false resIndex!32 resX!32)))))

(assert (=> b!538025 (= lt!246582 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16369 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!538026 () Bool)

(assert (=> b!538026 (= e!312024 e!312022)))

(declare-fun res!333229 () Bool)

(assert (=> b!538026 (=> (not res!333229) (not e!312022))))

(declare-fun lt!246581 () SeekEntryResult!4827)

(assert (=> b!538026 (= res!333229 (or (= lt!246581 (MissingZero!4827 i!1153)) (= lt!246581 (MissingVacant!4827 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34060 (_ BitVec 32)) SeekEntryResult!4827)

(assert (=> b!538026 (= lt!246581 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!538027 () Bool)

(declare-fun res!333224 () Bool)

(assert (=> b!538027 (=> (not res!333224) (not e!312024))))

(declare-fun arrayContainsKey!0 (array!34060 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!538027 (= res!333224 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!538028 () Bool)

(declare-fun res!333230 () Bool)

(assert (=> b!538028 (=> (not res!333230) (not e!312022))))

(declare-datatypes ((List!10488 0))(
  ( (Nil!10485) (Cons!10484 (h!11427 (_ BitVec 64)) (t!16716 List!10488)) )
))
(declare-fun arrayNoDuplicates!0 (array!34060 (_ BitVec 32) List!10488) Bool)

(assert (=> b!538028 (= res!333230 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10485))))

(assert (= (and start!48848 res!333233) b!538017))

(assert (= (and b!538017 res!333221) b!538022))

(assert (= (and b!538022 res!333222) b!538016))

(assert (= (and b!538016 res!333225) b!538027))

(assert (= (and b!538027 res!333224) b!538026))

(assert (= (and b!538026 res!333229) b!538018))

(assert (= (and b!538018 res!333231) b!538028))

(assert (= (and b!538028 res!333230) b!538024))

(assert (= (and b!538024 res!333227) b!538025))

(assert (= (and b!538025 res!333232) b!538020))

(assert (= (and b!538020 res!333228) b!538021))

(assert (= (and b!538021 res!333226) b!538023))

(assert (= (and b!538023 res!333223) b!538019))

(declare-fun m!517145 () Bool)

(assert (=> b!538027 m!517145))

(declare-fun m!517147 () Bool)

(assert (=> b!538023 m!517147))

(declare-fun m!517149 () Bool)

(assert (=> b!538028 m!517149))

(declare-fun m!517151 () Bool)

(assert (=> b!538021 m!517151))

(declare-fun m!517153 () Bool)

(assert (=> b!538021 m!517153))

(assert (=> b!538022 m!517153))

(assert (=> b!538022 m!517153))

(declare-fun m!517155 () Bool)

(assert (=> b!538022 m!517155))

(declare-fun m!517157 () Bool)

(assert (=> start!48848 m!517157))

(declare-fun m!517159 () Bool)

(assert (=> start!48848 m!517159))

(declare-fun m!517161 () Bool)

(assert (=> b!538018 m!517161))

(assert (=> b!538019 m!517153))

(assert (=> b!538019 m!517153))

(declare-fun m!517163 () Bool)

(assert (=> b!538019 m!517163))

(declare-fun m!517165 () Bool)

(assert (=> b!538024 m!517165))

(assert (=> b!538024 m!517153))

(assert (=> b!538025 m!517153))

(assert (=> b!538025 m!517153))

(declare-fun m!517167 () Bool)

(assert (=> b!538025 m!517167))

(assert (=> b!538020 m!517153))

(assert (=> b!538020 m!517153))

(declare-fun m!517169 () Bool)

(assert (=> b!538020 m!517169))

(assert (=> b!538020 m!517169))

(assert (=> b!538020 m!517153))

(declare-fun m!517171 () Bool)

(assert (=> b!538020 m!517171))

(declare-fun m!517173 () Bool)

(assert (=> b!538016 m!517173))

(declare-fun m!517175 () Bool)

(assert (=> b!538026 m!517175))

(check-sat (not b!538022) (not start!48848) (not b!538026) (not b!538028) (not b!538027) (not b!538016) (not b!538020) (not b!538023) (not b!538025) (not b!538018) (not b!538019))
(check-sat)
