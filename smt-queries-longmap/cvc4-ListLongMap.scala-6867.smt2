; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86460 () Bool)

(assert start!86460)

(declare-fun b!1001046 () Bool)

(declare-fun e!564116 () Bool)

(declare-fun e!564121 () Bool)

(assert (=> b!1001046 (= e!564116 e!564121)))

(declare-fun res!670531 () Bool)

(assert (=> b!1001046 (=> (not res!670531) (not e!564121))))

(declare-datatypes ((SeekEntryResult!9388 0))(
  ( (MissingZero!9388 (index!39923 (_ BitVec 32))) (Found!9388 (index!39924 (_ BitVec 32))) (Intermediate!9388 (undefined!10200 Bool) (index!39925 (_ BitVec 32)) (x!87344 (_ BitVec 32))) (Undefined!9388) (MissingVacant!9388 (index!39926 (_ BitVec 32))) )
))
(declare-fun lt!442493 () SeekEntryResult!9388)

(declare-fun lt!442489 () SeekEntryResult!9388)

(assert (=> b!1001046 (= res!670531 (= lt!442493 lt!442489))))

(declare-datatypes ((array!63261 0))(
  ( (array!63262 (arr!30456 (Array (_ BitVec 32) (_ BitVec 64))) (size!30958 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63261)

(declare-fun j!170 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63261 (_ BitVec 32)) SeekEntryResult!9388)

(assert (=> b!1001046 (= lt!442493 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30456 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1001047 () Bool)

(declare-fun res!670535 () Bool)

(declare-fun e!564119 () Bool)

(assert (=> b!1001047 (=> (not res!670535) (not e!564119))))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1001047 (= res!670535 (and (= (size!30958 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30958 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30958 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1001048 () Bool)

(declare-fun res!670530 () Bool)

(declare-fun e!564120 () Bool)

(assert (=> b!1001048 (=> (not res!670530) (not e!564120))))

(declare-datatypes ((List!21132 0))(
  ( (Nil!21129) (Cons!21128 (h!22305 (_ BitVec 64)) (t!30133 List!21132)) )
))
(declare-fun arrayNoDuplicates!0 (array!63261 (_ BitVec 32) List!21132) Bool)

(assert (=> b!1001048 (= res!670530 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21129))))

(declare-fun b!1001049 () Bool)

(declare-fun res!670532 () Bool)

(declare-fun e!564118 () Bool)

(assert (=> b!1001049 (=> (not res!670532) (not e!564118))))

(declare-fun lt!442492 () array!63261)

(declare-fun lt!442491 () (_ BitVec 64))

(assert (=> b!1001049 (= res!670532 (not (= lt!442493 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!442491 lt!442492 mask!3464))))))

(declare-fun b!1001050 () Bool)

(declare-fun res!670526 () Bool)

(assert (=> b!1001050 (=> (not res!670526) (not e!564120))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1001050 (= res!670526 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30958 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30958 a!3219))))))

(declare-fun b!1001051 () Bool)

(declare-fun res!670534 () Bool)

(assert (=> b!1001051 (=> (not res!670534) (not e!564120))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63261 (_ BitVec 32)) Bool)

(assert (=> b!1001051 (= res!670534 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1001052 () Bool)

(declare-fun res!670533 () Bool)

(assert (=> b!1001052 (=> (not res!670533) (not e!564119))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1001052 (= res!670533 (validKeyInArray!0 (select (arr!30456 a!3219) j!170)))))

(declare-fun b!1001053 () Bool)

(assert (=> b!1001053 (= e!564120 e!564116)))

(declare-fun res!670525 () Bool)

(assert (=> b!1001053 (=> (not res!670525) (not e!564116))))

(declare-fun lt!442488 () SeekEntryResult!9388)

(assert (=> b!1001053 (= res!670525 (= lt!442488 lt!442489))))

(assert (=> b!1001053 (= lt!442489 (Intermediate!9388 false resIndex!38 resX!38))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1001053 (= lt!442488 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30456 a!3219) j!170) mask!3464) (select (arr!30456 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1001054 () Bool)

(assert (=> b!1001054 (= e!564119 e!564120)))

(declare-fun res!670527 () Bool)

(assert (=> b!1001054 (=> (not res!670527) (not e!564120))))

(declare-fun lt!442490 () SeekEntryResult!9388)

(assert (=> b!1001054 (= res!670527 (or (= lt!442490 (MissingVacant!9388 i!1194)) (= lt!442490 (MissingZero!9388 i!1194))))))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63261 (_ BitVec 32)) SeekEntryResult!9388)

(assert (=> b!1001054 (= lt!442490 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!1001055 () Bool)

(declare-fun res!670528 () Bool)

(assert (=> b!1001055 (=> (not res!670528) (not e!564119))))

(assert (=> b!1001055 (= res!670528 (validKeyInArray!0 k!2224))))

(declare-fun b!1001057 () Bool)

(declare-fun res!670536 () Bool)

(assert (=> b!1001057 (=> (not res!670536) (not e!564119))))

(declare-fun arrayContainsKey!0 (array!63261 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1001057 (= res!670536 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1001058 () Bool)

(assert (=> b!1001058 (= e!564118 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194)) (bvslt mask!3464 #b00000000000000000000000000000000)))))

(declare-fun b!1001056 () Bool)

(assert (=> b!1001056 (= e!564121 e!564118)))

(declare-fun res!670524 () Bool)

(assert (=> b!1001056 (=> (not res!670524) (not e!564118))))

(assert (=> b!1001056 (= res!670524 (not (= lt!442488 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!442491 mask!3464) lt!442491 lt!442492 mask!3464))))))

(assert (=> b!1001056 (= lt!442491 (select (store (arr!30456 a!3219) i!1194 k!2224) j!170))))

(assert (=> b!1001056 (= lt!442492 (array!63262 (store (arr!30456 a!3219) i!1194 k!2224) (size!30958 a!3219)))))

(declare-fun res!670529 () Bool)

(assert (=> start!86460 (=> (not res!670529) (not e!564119))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86460 (= res!670529 (validMask!0 mask!3464))))

(assert (=> start!86460 e!564119))

(declare-fun array_inv!23580 (array!63261) Bool)

(assert (=> start!86460 (array_inv!23580 a!3219)))

(assert (=> start!86460 true))

(assert (= (and start!86460 res!670529) b!1001047))

(assert (= (and b!1001047 res!670535) b!1001052))

(assert (= (and b!1001052 res!670533) b!1001055))

(assert (= (and b!1001055 res!670528) b!1001057))

(assert (= (and b!1001057 res!670536) b!1001054))

(assert (= (and b!1001054 res!670527) b!1001051))

(assert (= (and b!1001051 res!670534) b!1001048))

(assert (= (and b!1001048 res!670530) b!1001050))

(assert (= (and b!1001050 res!670526) b!1001053))

(assert (= (and b!1001053 res!670525) b!1001046))

(assert (= (and b!1001046 res!670531) b!1001056))

(assert (= (and b!1001056 res!670524) b!1001049))

(assert (= (and b!1001049 res!670532) b!1001058))

(declare-fun m!927151 () Bool)

(assert (=> b!1001057 m!927151))

(declare-fun m!927153 () Bool)

(assert (=> start!86460 m!927153))

(declare-fun m!927155 () Bool)

(assert (=> start!86460 m!927155))

(declare-fun m!927157 () Bool)

(assert (=> b!1001048 m!927157))

(declare-fun m!927159 () Bool)

(assert (=> b!1001051 m!927159))

(declare-fun m!927161 () Bool)

(assert (=> b!1001054 m!927161))

(declare-fun m!927163 () Bool)

(assert (=> b!1001053 m!927163))

(assert (=> b!1001053 m!927163))

(declare-fun m!927165 () Bool)

(assert (=> b!1001053 m!927165))

(assert (=> b!1001053 m!927165))

(assert (=> b!1001053 m!927163))

(declare-fun m!927167 () Bool)

(assert (=> b!1001053 m!927167))

(declare-fun m!927169 () Bool)

(assert (=> b!1001056 m!927169))

(assert (=> b!1001056 m!927169))

(declare-fun m!927171 () Bool)

(assert (=> b!1001056 m!927171))

(declare-fun m!927173 () Bool)

(assert (=> b!1001056 m!927173))

(declare-fun m!927175 () Bool)

(assert (=> b!1001056 m!927175))

(declare-fun m!927177 () Bool)

(assert (=> b!1001055 m!927177))

(declare-fun m!927179 () Bool)

(assert (=> b!1001049 m!927179))

(assert (=> b!1001052 m!927163))

(assert (=> b!1001052 m!927163))

(declare-fun m!927181 () Bool)

(assert (=> b!1001052 m!927181))

(assert (=> b!1001046 m!927163))

(assert (=> b!1001046 m!927163))

(declare-fun m!927183 () Bool)

(assert (=> b!1001046 m!927183))

(push 1)

(assert (not b!1001055))

(assert (not b!1001057))

(assert (not b!1001048))

(assert (not b!1001051))

(assert (not start!86460))

(assert (not b!1001046))

(assert (not b!1001049))

(assert (not b!1001056))

(assert (not b!1001054))

(assert (not b!1001052))

(assert (not b!1001053))

(check-sat)

