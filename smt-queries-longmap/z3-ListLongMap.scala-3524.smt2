; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48716 () Bool)

(assert start!48716)

(declare-fun b!535486 () Bool)

(declare-fun res!330700 () Bool)

(declare-fun e!311053 () Bool)

(assert (=> b!535486 (=> (not res!330700) (not e!311053))))

(declare-datatypes ((array!33928 0))(
  ( (array!33929 (arr!16303 (Array (_ BitVec 32) (_ BitVec 64))) (size!16667 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33928)

(declare-fun j!147 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!535486 (= res!330700 (validKeyInArray!0 (select (arr!16303 a!3154) j!147)))))

(declare-fun b!535487 () Bool)

(declare-fun res!330701 () Bool)

(declare-fun e!311054 () Bool)

(assert (=> b!535487 (=> (not res!330701) (not e!311054))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33928 (_ BitVec 32)) Bool)

(assert (=> b!535487 (= res!330701 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!535488 () Bool)

(declare-fun e!311055 () Bool)

(assert (=> b!535488 (= e!311054 e!311055)))

(declare-fun res!330694 () Bool)

(assert (=> b!535488 (=> (not res!330694) (not e!311055))))

(declare-datatypes ((SeekEntryResult!4761 0))(
  ( (MissingZero!4761 (index!21268 (_ BitVec 32))) (Found!4761 (index!21269 (_ BitVec 32))) (Intermediate!4761 (undefined!5573 Bool) (index!21270 (_ BitVec 32)) (x!50216 (_ BitVec 32))) (Undefined!4761) (MissingVacant!4761 (index!21271 (_ BitVec 32))) )
))
(declare-fun lt!245833 () SeekEntryResult!4761)

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!535488 (= res!330694 (= lt!245833 (Intermediate!4761 false resIndex!32 resX!32)))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33928 (_ BitVec 32)) SeekEntryResult!4761)

(assert (=> b!535488 (= lt!245833 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16303 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!535489 () Bool)

(assert (=> b!535489 (= e!311053 e!311054)))

(declare-fun res!330699 () Bool)

(assert (=> b!535489 (=> (not res!330699) (not e!311054))))

(declare-fun lt!245832 () SeekEntryResult!4761)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!535489 (= res!330699 (or (= lt!245832 (MissingZero!4761 i!1153)) (= lt!245832 (MissingVacant!4761 i!1153))))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33928 (_ BitVec 32)) SeekEntryResult!4761)

(assert (=> b!535489 (= lt!245832 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!535490 () Bool)

(declare-fun res!330695 () Bool)

(assert (=> b!535490 (=> (not res!330695) (not e!311054))))

(declare-datatypes ((List!10422 0))(
  ( (Nil!10419) (Cons!10418 (h!11361 (_ BitVec 64)) (t!16650 List!10422)) )
))
(declare-fun arrayNoDuplicates!0 (array!33928 (_ BitVec 32) List!10422) Bool)

(assert (=> b!535490 (= res!330695 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10419))))

(declare-fun b!535491 () Bool)

(assert (=> b!535491 (= e!311055 (and (not (= (select (arr!16303 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16303 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16303 a!3154) index!1177) (select (arr!16303 a!3154) j!147))) (bvslt mask!3216 #b00000000000000000000000000000000)))))

(declare-fun b!535492 () Bool)

(declare-fun res!330691 () Bool)

(assert (=> b!535492 (=> (not res!330691) (not e!311053))))

(assert (=> b!535492 (= res!330691 (and (= (size!16667 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16667 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16667 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!535493 () Bool)

(declare-fun res!330697 () Bool)

(assert (=> b!535493 (=> (not res!330697) (not e!311054))))

(assert (=> b!535493 (= res!330697 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16667 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16667 a!3154)) (= (select (arr!16303 a!3154) resIndex!32) (select (arr!16303 a!3154) j!147))))))

(declare-fun b!535494 () Bool)

(declare-fun res!330698 () Bool)

(assert (=> b!535494 (=> (not res!330698) (not e!311053))))

(declare-fun arrayContainsKey!0 (array!33928 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!535494 (= res!330698 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun res!330696 () Bool)

(assert (=> start!48716 (=> (not res!330696) (not e!311053))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48716 (= res!330696 (validMask!0 mask!3216))))

(assert (=> start!48716 e!311053))

(assert (=> start!48716 true))

(declare-fun array_inv!12099 (array!33928) Bool)

(assert (=> start!48716 (array_inv!12099 a!3154)))

(declare-fun b!535495 () Bool)

(declare-fun res!330693 () Bool)

(assert (=> b!535495 (=> (not res!330693) (not e!311055))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!535495 (= res!330693 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16303 a!3154) j!147) mask!3216) (select (arr!16303 a!3154) j!147) a!3154 mask!3216) lt!245833))))

(declare-fun b!535496 () Bool)

(declare-fun res!330692 () Bool)

(assert (=> b!535496 (=> (not res!330692) (not e!311053))))

(assert (=> b!535496 (= res!330692 (validKeyInArray!0 k0!1998))))

(assert (= (and start!48716 res!330696) b!535492))

(assert (= (and b!535492 res!330691) b!535486))

(assert (= (and b!535486 res!330700) b!535496))

(assert (= (and b!535496 res!330692) b!535494))

(assert (= (and b!535494 res!330698) b!535489))

(assert (= (and b!535489 res!330699) b!535487))

(assert (= (and b!535487 res!330701) b!535490))

(assert (= (and b!535490 res!330695) b!535493))

(assert (= (and b!535493 res!330697) b!535488))

(assert (= (and b!535488 res!330694) b!535495))

(assert (= (and b!535495 res!330693) b!535491))

(declare-fun m!515065 () Bool)

(assert (=> b!535493 m!515065))

(declare-fun m!515067 () Bool)

(assert (=> b!535493 m!515067))

(declare-fun m!515069 () Bool)

(assert (=> b!535489 m!515069))

(declare-fun m!515071 () Bool)

(assert (=> b!535496 m!515071))

(declare-fun m!515073 () Bool)

(assert (=> b!535494 m!515073))

(assert (=> b!535495 m!515067))

(assert (=> b!535495 m!515067))

(declare-fun m!515075 () Bool)

(assert (=> b!535495 m!515075))

(assert (=> b!535495 m!515075))

(assert (=> b!535495 m!515067))

(declare-fun m!515077 () Bool)

(assert (=> b!535495 m!515077))

(declare-fun m!515079 () Bool)

(assert (=> b!535487 m!515079))

(assert (=> b!535486 m!515067))

(assert (=> b!535486 m!515067))

(declare-fun m!515081 () Bool)

(assert (=> b!535486 m!515081))

(declare-fun m!515083 () Bool)

(assert (=> b!535491 m!515083))

(assert (=> b!535491 m!515067))

(declare-fun m!515085 () Bool)

(assert (=> start!48716 m!515085))

(declare-fun m!515087 () Bool)

(assert (=> start!48716 m!515087))

(declare-fun m!515089 () Bool)

(assert (=> b!535490 m!515089))

(assert (=> b!535488 m!515067))

(assert (=> b!535488 m!515067))

(declare-fun m!515091 () Bool)

(assert (=> b!535488 m!515091))

(check-sat (not b!535487) (not b!535494) (not b!535488) (not start!48716) (not b!535486) (not b!535490) (not b!535496) (not b!535495) (not b!535489))
(check-sat)
