; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49340 () Bool)

(assert start!49340)

(declare-fun b!543618 () Bool)

(declare-fun res!338179 () Bool)

(declare-fun e!314360 () Bool)

(assert (=> b!543618 (=> (not res!338179) (not e!314360))))

(declare-datatypes ((array!34348 0))(
  ( (array!34349 (arr!16507 (Array (_ BitVec 32) (_ BitVec 64))) (size!16871 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34348)

(declare-datatypes ((List!10626 0))(
  ( (Nil!10623) (Cons!10622 (h!11577 (_ BitVec 64)) (t!16854 List!10626)) )
))
(declare-fun arrayNoDuplicates!0 (array!34348 (_ BitVec 32) List!10626) Bool)

(assert (=> b!543618 (= res!338179 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10623))))

(declare-fun b!543619 () Bool)

(declare-fun e!314361 () Bool)

(assert (=> b!543619 (= e!314361 e!314360)))

(declare-fun res!338175 () Bool)

(assert (=> b!543619 (=> (not res!338175) (not e!314360))))

(declare-datatypes ((SeekEntryResult!4965 0))(
  ( (MissingZero!4965 (index!22084 (_ BitVec 32))) (Found!4965 (index!22085 (_ BitVec 32))) (Intermediate!4965 (undefined!5777 Bool) (index!22086 (_ BitVec 32)) (x!50988 (_ BitVec 32))) (Undefined!4965) (MissingVacant!4965 (index!22087 (_ BitVec 32))) )
))
(declare-fun lt!248218 () SeekEntryResult!4965)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!543619 (= res!338175 (or (= lt!248218 (MissingZero!4965 i!1153)) (= lt!248218 (MissingVacant!4965 i!1153))))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34348 (_ BitVec 32)) SeekEntryResult!4965)

(assert (=> b!543619 (= lt!248218 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!543620 () Bool)

(declare-fun res!338178 () Bool)

(declare-fun e!314359 () Bool)

(assert (=> b!543620 (=> (not res!338178) (not e!314359))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(assert (=> b!543620 (= res!338178 (and (not (= (select (arr!16507 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16507 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16507 a!3154) index!1177) (select (arr!16507 a!3154) j!147)))))))

(declare-fun res!338169 () Bool)

(assert (=> start!49340 (=> (not res!338169) (not e!314361))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49340 (= res!338169 (validMask!0 mask!3216))))

(assert (=> start!49340 e!314361))

(assert (=> start!49340 true))

(declare-fun array_inv!12303 (array!34348) Bool)

(assert (=> start!49340 (array_inv!12303 a!3154)))

(declare-fun b!543621 () Bool)

(declare-fun res!338174 () Bool)

(assert (=> b!543621 (=> (not res!338174) (not e!314361))))

(declare-fun arrayContainsKey!0 (array!34348 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!543621 (= res!338174 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!543622 () Bool)

(declare-fun res!338171 () Bool)

(assert (=> b!543622 (=> (not res!338171) (not e!314359))))

(declare-fun lt!248217 () SeekEntryResult!4965)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34348 (_ BitVec 32)) SeekEntryResult!4965)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!543622 (= res!338171 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16507 a!3154) j!147) mask!3216) (select (arr!16507 a!3154) j!147) a!3154 mask!3216) lt!248217))))

(declare-fun b!543623 () Bool)

(declare-fun res!338177 () Bool)

(assert (=> b!543623 (=> (not res!338177) (not e!314360))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34348 (_ BitVec 32)) Bool)

(assert (=> b!543623 (= res!338177 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!543624 () Bool)

(assert (=> b!543624 (= e!314360 e!314359)))

(declare-fun res!338170 () Bool)

(assert (=> b!543624 (=> (not res!338170) (not e!314359))))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!543624 (= res!338170 (= lt!248217 (Intermediate!4965 false resIndex!32 resX!32)))))

(declare-fun x!1030 () (_ BitVec 32))

(assert (=> b!543624 (= lt!248217 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16507 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!543625 () Bool)

(assert (=> b!543625 (= e!314359 false)))

(declare-fun lt!248216 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!543625 (= lt!248216 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!543626 () Bool)

(declare-fun res!338180 () Bool)

(assert (=> b!543626 (=> (not res!338180) (not e!314360))))

(assert (=> b!543626 (= res!338180 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16871 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16871 a!3154)) (= (select (arr!16507 a!3154) resIndex!32) (select (arr!16507 a!3154) j!147))))))

(declare-fun b!543627 () Bool)

(declare-fun res!338176 () Bool)

(assert (=> b!543627 (=> (not res!338176) (not e!314361))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!543627 (= res!338176 (validKeyInArray!0 k0!1998))))

(declare-fun b!543628 () Bool)

(declare-fun res!338173 () Bool)

(assert (=> b!543628 (=> (not res!338173) (not e!314361))))

(assert (=> b!543628 (= res!338173 (validKeyInArray!0 (select (arr!16507 a!3154) j!147)))))

(declare-fun b!543629 () Bool)

(declare-fun res!338172 () Bool)

(assert (=> b!543629 (=> (not res!338172) (not e!314361))))

(assert (=> b!543629 (= res!338172 (and (= (size!16871 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16871 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16871 a!3154)) (not (= i!1153 j!147))))))

(assert (= (and start!49340 res!338169) b!543629))

(assert (= (and b!543629 res!338172) b!543628))

(assert (= (and b!543628 res!338173) b!543627))

(assert (= (and b!543627 res!338176) b!543621))

(assert (= (and b!543621 res!338174) b!543619))

(assert (= (and b!543619 res!338175) b!543623))

(assert (= (and b!543623 res!338177) b!543618))

(assert (= (and b!543618 res!338179) b!543626))

(assert (= (and b!543626 res!338180) b!543624))

(assert (= (and b!543624 res!338170) b!543622))

(assert (= (and b!543622 res!338171) b!543620))

(assert (= (and b!543620 res!338178) b!543625))

(declare-fun m!521679 () Bool)

(assert (=> b!543625 m!521679))

(declare-fun m!521681 () Bool)

(assert (=> b!543621 m!521681))

(declare-fun m!521683 () Bool)

(assert (=> b!543622 m!521683))

(assert (=> b!543622 m!521683))

(declare-fun m!521685 () Bool)

(assert (=> b!543622 m!521685))

(assert (=> b!543622 m!521685))

(assert (=> b!543622 m!521683))

(declare-fun m!521687 () Bool)

(assert (=> b!543622 m!521687))

(declare-fun m!521689 () Bool)

(assert (=> start!49340 m!521689))

(declare-fun m!521691 () Bool)

(assert (=> start!49340 m!521691))

(declare-fun m!521693 () Bool)

(assert (=> b!543620 m!521693))

(assert (=> b!543620 m!521683))

(declare-fun m!521695 () Bool)

(assert (=> b!543618 m!521695))

(assert (=> b!543628 m!521683))

(assert (=> b!543628 m!521683))

(declare-fun m!521697 () Bool)

(assert (=> b!543628 m!521697))

(declare-fun m!521699 () Bool)

(assert (=> b!543619 m!521699))

(assert (=> b!543624 m!521683))

(assert (=> b!543624 m!521683))

(declare-fun m!521701 () Bool)

(assert (=> b!543624 m!521701))

(declare-fun m!521703 () Bool)

(assert (=> b!543623 m!521703))

(declare-fun m!521705 () Bool)

(assert (=> b!543626 m!521705))

(assert (=> b!543626 m!521683))

(declare-fun m!521707 () Bool)

(assert (=> b!543627 m!521707))

(check-sat (not b!543618) (not b!543619) (not b!543624) (not b!543621) (not b!543625) (not b!543628) (not start!49340) (not b!543627) (not b!543622) (not b!543623))
(check-sat)
