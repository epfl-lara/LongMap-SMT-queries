; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49564 () Bool)

(assert start!49564)

(declare-fun b!545162 () Bool)

(declare-fun res!339163 () Bool)

(declare-fun e!315159 () Bool)

(assert (=> b!545162 (=> (not res!339163) (not e!315159))))

(declare-datatypes ((array!34382 0))(
  ( (array!34383 (arr!16519 (Array (_ BitVec 32) (_ BitVec 64))) (size!16883 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34382)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34382 (_ BitVec 32)) Bool)

(assert (=> b!545162 (= res!339163 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!545163 () Bool)

(declare-fun res!339165 () Bool)

(declare-fun e!315162 () Bool)

(assert (=> b!545163 (=> (not res!339165) (not e!315162))))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4933 0))(
  ( (MissingZero!4933 (index!21956 (_ BitVec 32))) (Found!4933 (index!21957 (_ BitVec 32))) (Intermediate!4933 (undefined!5745 Bool) (index!21958 (_ BitVec 32)) (x!51031 (_ BitVec 32))) (Undefined!4933) (MissingVacant!4933 (index!21959 (_ BitVec 32))) )
))
(declare-fun lt!248772 () SeekEntryResult!4933)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34382 (_ BitVec 32)) SeekEntryResult!4933)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!545163 (= res!339165 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16519 a!3154) j!147) mask!3216) (select (arr!16519 a!3154) j!147) a!3154 mask!3216) lt!248772))))

(declare-fun b!545164 () Bool)

(declare-fun res!339171 () Bool)

(declare-fun e!315161 () Bool)

(assert (=> b!545164 (=> (not res!339171) (not e!315161))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!545164 (= res!339171 (validKeyInArray!0 k0!1998))))

(declare-fun b!545165 () Bool)

(assert (=> b!545165 (= e!315159 e!315162)))

(declare-fun res!339172 () Bool)

(assert (=> b!545165 (=> (not res!339172) (not e!315162))))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!545165 (= res!339172 (= lt!248772 (Intermediate!4933 false resIndex!32 resX!32)))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(assert (=> b!545165 (= lt!248772 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16519 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!545166 () Bool)

(declare-fun res!339170 () Bool)

(assert (=> b!545166 (=> (not res!339170) (not e!315159))))

(assert (=> b!545166 (= res!339170 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16883 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16883 a!3154)) (= (select (arr!16519 a!3154) resIndex!32) (select (arr!16519 a!3154) j!147))))))

(declare-fun b!545167 () Bool)

(declare-fun res!339167 () Bool)

(assert (=> b!545167 (=> (not res!339167) (not e!315162))))

(assert (=> b!545167 (= res!339167 (and (not (= (select (arr!16519 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16519 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16519 a!3154) index!1177) (select (arr!16519 a!3154) j!147)))))))

(declare-fun b!545168 () Bool)

(assert (=> b!545168 (= e!315162 false)))

(declare-fun lt!248773 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!545168 (= lt!248773 (nextIndex!0 index!1177 (bvadd #b00000000000000000000000000000001 x!1030) mask!3216))))

(declare-fun res!339169 () Bool)

(assert (=> start!49564 (=> (not res!339169) (not e!315161))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49564 (= res!339169 (validMask!0 mask!3216))))

(assert (=> start!49564 e!315161))

(assert (=> start!49564 true))

(declare-fun array_inv!12378 (array!34382) Bool)

(assert (=> start!49564 (array_inv!12378 a!3154)))

(declare-fun b!545169 () Bool)

(declare-fun res!339162 () Bool)

(assert (=> b!545169 (=> (not res!339162) (not e!315159))))

(declare-datatypes ((List!10545 0))(
  ( (Nil!10542) (Cons!10541 (h!11505 (_ BitVec 64)) (t!16765 List!10545)) )
))
(declare-fun arrayNoDuplicates!0 (array!34382 (_ BitVec 32) List!10545) Bool)

(assert (=> b!545169 (= res!339162 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10542))))

(declare-fun b!545170 () Bool)

(declare-fun res!339168 () Bool)

(assert (=> b!545170 (=> (not res!339168) (not e!315161))))

(assert (=> b!545170 (= res!339168 (validKeyInArray!0 (select (arr!16519 a!3154) j!147)))))

(declare-fun b!545171 () Bool)

(declare-fun res!339161 () Bool)

(assert (=> b!545171 (=> (not res!339161) (not e!315161))))

(declare-fun arrayContainsKey!0 (array!34382 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!545171 (= res!339161 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!545172 () Bool)

(assert (=> b!545172 (= e!315161 e!315159)))

(declare-fun res!339164 () Bool)

(assert (=> b!545172 (=> (not res!339164) (not e!315159))))

(declare-fun lt!248771 () SeekEntryResult!4933)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!545172 (= res!339164 (or (= lt!248771 (MissingZero!4933 i!1153)) (= lt!248771 (MissingVacant!4933 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34382 (_ BitVec 32)) SeekEntryResult!4933)

(assert (=> b!545172 (= lt!248771 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!545173 () Bool)

(declare-fun res!339166 () Bool)

(assert (=> b!545173 (=> (not res!339166) (not e!315161))))

(assert (=> b!545173 (= res!339166 (and (= (size!16883 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16883 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16883 a!3154)) (not (= i!1153 j!147))))))

(assert (= (and start!49564 res!339169) b!545173))

(assert (= (and b!545173 res!339166) b!545170))

(assert (= (and b!545170 res!339168) b!545164))

(assert (= (and b!545164 res!339171) b!545171))

(assert (= (and b!545171 res!339161) b!545172))

(assert (= (and b!545172 res!339164) b!545162))

(assert (= (and b!545162 res!339163) b!545169))

(assert (= (and b!545169 res!339162) b!545166))

(assert (= (and b!545166 res!339170) b!545165))

(assert (= (and b!545165 res!339172) b!545163))

(assert (= (and b!545163 res!339165) b!545167))

(assert (= (and b!545167 res!339167) b!545168))

(declare-fun m!523033 () Bool)

(assert (=> b!545172 m!523033))

(declare-fun m!523035 () Bool)

(assert (=> b!545168 m!523035))

(declare-fun m!523037 () Bool)

(assert (=> b!545169 m!523037))

(declare-fun m!523039 () Bool)

(assert (=> b!545165 m!523039))

(assert (=> b!545165 m!523039))

(declare-fun m!523041 () Bool)

(assert (=> b!545165 m!523041))

(declare-fun m!523043 () Bool)

(assert (=> b!545166 m!523043))

(assert (=> b!545166 m!523039))

(assert (=> b!545170 m!523039))

(assert (=> b!545170 m!523039))

(declare-fun m!523045 () Bool)

(assert (=> b!545170 m!523045))

(declare-fun m!523047 () Bool)

(assert (=> b!545167 m!523047))

(assert (=> b!545167 m!523039))

(declare-fun m!523049 () Bool)

(assert (=> start!49564 m!523049))

(declare-fun m!523051 () Bool)

(assert (=> start!49564 m!523051))

(assert (=> b!545163 m!523039))

(assert (=> b!545163 m!523039))

(declare-fun m!523053 () Bool)

(assert (=> b!545163 m!523053))

(assert (=> b!545163 m!523053))

(assert (=> b!545163 m!523039))

(declare-fun m!523055 () Bool)

(assert (=> b!545163 m!523055))

(declare-fun m!523057 () Bool)

(assert (=> b!545171 m!523057))

(declare-fun m!523059 () Bool)

(assert (=> b!545164 m!523059))

(declare-fun m!523061 () Bool)

(assert (=> b!545162 m!523061))

(check-sat (not b!545171) (not b!545170) (not b!545164) (not b!545172) (not b!545165) (not b!545163) (not b!545162) (not b!545168) (not b!545169) (not start!49564))
(check-sat)
