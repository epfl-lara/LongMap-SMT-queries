; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48924 () Bool)

(assert start!48924)

(declare-fun b!539185 () Bool)

(declare-fun res!334541 () Bool)

(declare-fun e!312504 () Bool)

(assert (=> b!539185 (=> (not res!334541) (not e!312504))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-datatypes ((array!34146 0))(
  ( (array!34147 (arr!16412 (Array (_ BitVec 32) (_ BitVec 64))) (size!16777 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34146)

(declare-fun resX!32 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(assert (=> b!539185 (= res!334541 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16777 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16777 a!3154)) (= (select (arr!16412 a!3154) resIndex!32) (select (arr!16412 a!3154) j!147))))))

(declare-fun b!539186 () Bool)

(declare-fun res!334535 () Bool)

(declare-fun e!312503 () Bool)

(assert (=> b!539186 (=> (not res!334535) (not e!312503))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!539186 (= res!334535 (and (= (size!16777 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16777 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16777 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!539187 () Bool)

(declare-fun res!334536 () Bool)

(assert (=> b!539187 (=> (not res!334536) (not e!312503))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34146 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!539187 (= res!334536 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!539188 () Bool)

(declare-fun res!334539 () Bool)

(assert (=> b!539188 (=> (not res!334539) (not e!312504))))

(declare-datatypes ((List!10570 0))(
  ( (Nil!10567) (Cons!10566 (h!11509 (_ BitVec 64)) (t!16789 List!10570)) )
))
(declare-fun arrayNoDuplicates!0 (array!34146 (_ BitVec 32) List!10570) Bool)

(assert (=> b!539188 (= res!334539 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10567))))

(declare-fun b!539189 () Bool)

(assert (=> b!539189 (= e!312503 e!312504)))

(declare-fun res!334532 () Bool)

(assert (=> b!539189 (=> (not res!334532) (not e!312504))))

(declare-datatypes ((SeekEntryResult!4867 0))(
  ( (MissingZero!4867 (index!21692 (_ BitVec 32))) (Found!4867 (index!21693 (_ BitVec 32))) (Intermediate!4867 (undefined!5679 Bool) (index!21694 (_ BitVec 32)) (x!50613 (_ BitVec 32))) (Undefined!4867) (MissingVacant!4867 (index!21695 (_ BitVec 32))) )
))
(declare-fun lt!246906 () SeekEntryResult!4867)

(assert (=> b!539189 (= res!334532 (or (= lt!246906 (MissingZero!4867 i!1153)) (= lt!246906 (MissingVacant!4867 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34146 (_ BitVec 32)) SeekEntryResult!4867)

(assert (=> b!539189 (= lt!246906 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!539190 () Bool)

(declare-fun res!334538 () Bool)

(assert (=> b!539190 (=> (not res!334538) (not e!312503))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!539190 (= res!334538 (validKeyInArray!0 k0!1998))))

(declare-fun b!539191 () Bool)

(declare-fun res!334540 () Bool)

(assert (=> b!539191 (=> (not res!334540) (not e!312504))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34146 (_ BitVec 32)) Bool)

(assert (=> b!539191 (= res!334540 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun res!334533 () Bool)

(assert (=> start!48924 (=> (not res!334533) (not e!312503))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48924 (= res!334533 (validMask!0 mask!3216))))

(assert (=> start!48924 e!312503))

(assert (=> start!48924 true))

(declare-fun array_inv!12295 (array!34146) Bool)

(assert (=> start!48924 (array_inv!12295 a!3154)))

(declare-fun b!539192 () Bool)

(declare-fun res!334534 () Bool)

(assert (=> b!539192 (=> (not res!334534) (not e!312504))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34146 (_ BitVec 32)) SeekEntryResult!4867)

(assert (=> b!539192 (= res!334534 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16412 a!3154) j!147) a!3154 mask!3216) (Intermediate!4867 false resIndex!32 resX!32)))))

(declare-fun b!539193 () Bool)

(declare-fun res!334537 () Bool)

(assert (=> b!539193 (=> (not res!334537) (not e!312503))))

(assert (=> b!539193 (= res!334537 (validKeyInArray!0 (select (arr!16412 a!3154) j!147)))))

(declare-fun b!539194 () Bool)

(assert (=> b!539194 (= e!312504 false)))

(declare-fun lt!246907 () SeekEntryResult!4867)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!539194 (= lt!246907 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16412 a!3154) j!147) mask!3216) (select (arr!16412 a!3154) j!147) a!3154 mask!3216))))

(assert (= (and start!48924 res!334533) b!539186))

(assert (= (and b!539186 res!334535) b!539193))

(assert (= (and b!539193 res!334537) b!539190))

(assert (= (and b!539190 res!334538) b!539187))

(assert (= (and b!539187 res!334536) b!539189))

(assert (= (and b!539189 res!334532) b!539191))

(assert (= (and b!539191 res!334540) b!539188))

(assert (= (and b!539188 res!334539) b!539185))

(assert (= (and b!539185 res!334541) b!539192))

(assert (= (and b!539192 res!334534) b!539194))

(declare-fun m!517723 () Bool)

(assert (=> b!539191 m!517723))

(declare-fun m!517725 () Bool)

(assert (=> b!539187 m!517725))

(declare-fun m!517727 () Bool)

(assert (=> b!539188 m!517727))

(declare-fun m!517729 () Bool)

(assert (=> b!539190 m!517729))

(declare-fun m!517731 () Bool)

(assert (=> start!48924 m!517731))

(declare-fun m!517733 () Bool)

(assert (=> start!48924 m!517733))

(declare-fun m!517735 () Bool)

(assert (=> b!539185 m!517735))

(declare-fun m!517737 () Bool)

(assert (=> b!539185 m!517737))

(assert (=> b!539194 m!517737))

(assert (=> b!539194 m!517737))

(declare-fun m!517739 () Bool)

(assert (=> b!539194 m!517739))

(assert (=> b!539194 m!517739))

(assert (=> b!539194 m!517737))

(declare-fun m!517741 () Bool)

(assert (=> b!539194 m!517741))

(assert (=> b!539193 m!517737))

(assert (=> b!539193 m!517737))

(declare-fun m!517743 () Bool)

(assert (=> b!539193 m!517743))

(declare-fun m!517745 () Bool)

(assert (=> b!539189 m!517745))

(assert (=> b!539192 m!517737))

(assert (=> b!539192 m!517737))

(declare-fun m!517747 () Bool)

(assert (=> b!539192 m!517747))

(check-sat (not b!539188) (not start!48924) (not b!539193) (not b!539190) (not b!539187) (not b!539192) (not b!539191) (not b!539189) (not b!539194))
(check-sat)
