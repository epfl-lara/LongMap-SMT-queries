; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86510 () Bool)

(assert start!86510)

(declare-fun b!1002189 () Bool)

(declare-fun e!564626 () Bool)

(declare-fun e!564622 () Bool)

(assert (=> b!1002189 (= e!564626 e!564622)))

(declare-fun res!671673 () Bool)

(assert (=> b!1002189 (=> (not res!671673) (not e!564622))))

(declare-datatypes ((SeekEntryResult!9413 0))(
  ( (MissingZero!9413 (index!40023 (_ BitVec 32))) (Found!9413 (index!40024 (_ BitVec 32))) (Intermediate!9413 (undefined!10225 Bool) (index!40025 (_ BitVec 32)) (x!87441 (_ BitVec 32))) (Undefined!9413) (MissingVacant!9413 (index!40026 (_ BitVec 32))) )
))
(declare-fun lt!443054 () SeekEntryResult!9413)

(declare-fun lt!443052 () SeekEntryResult!9413)

(assert (=> b!1002189 (= res!671673 (= lt!443054 lt!443052))))

(declare-datatypes ((array!63311 0))(
  ( (array!63312 (arr!30481 (Array (_ BitVec 32) (_ BitVec 64))) (size!30983 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63311)

(declare-fun j!170 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63311 (_ BitVec 32)) SeekEntryResult!9413)

(assert (=> b!1002189 (= lt!443054 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30481 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1002190 () Bool)

(declare-fun res!671682 () Bool)

(declare-fun e!564627 () Bool)

(assert (=> b!1002190 (=> (not res!671682) (not e!564627))))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!63311 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1002190 (= res!671682 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1002191 () Bool)

(declare-fun res!671679 () Bool)

(assert (=> b!1002191 (=> (not res!671679) (not e!564627))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1002191 (= res!671679 (validKeyInArray!0 (select (arr!30481 a!3219) j!170)))))

(declare-fun b!1002192 () Bool)

(declare-fun e!564623 () Bool)

(assert (=> b!1002192 (= e!564623 false)))

(declare-fun lt!443051 () (_ BitVec 32))

(declare-fun lt!443055 () (_ BitVec 64))

(declare-fun lt!443053 () SeekEntryResult!9413)

(declare-fun lt!443056 () array!63311)

(assert (=> b!1002192 (= lt!443053 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!443051 lt!443055 lt!443056 mask!3464))))

(declare-fun b!1002193 () Bool)

(declare-fun res!671675 () Bool)

(assert (=> b!1002193 (=> (not res!671675) (not e!564627))))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1002193 (= res!671675 (and (= (size!30983 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30983 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30983 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1002194 () Bool)

(declare-fun res!671668 () Bool)

(declare-fun e!564624 () Bool)

(assert (=> b!1002194 (=> (not res!671668) (not e!564624))))

(declare-datatypes ((List!21157 0))(
  ( (Nil!21154) (Cons!21153 (h!22330 (_ BitVec 64)) (t!30158 List!21157)) )
))
(declare-fun arrayNoDuplicates!0 (array!63311 (_ BitVec 32) List!21157) Bool)

(assert (=> b!1002194 (= res!671668 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21154))))

(declare-fun b!1002195 () Bool)

(declare-fun res!671667 () Bool)

(declare-fun e!564628 () Bool)

(assert (=> b!1002195 (=> (not res!671667) (not e!564628))))

(assert (=> b!1002195 (= res!671667 (not (= lt!443054 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!443055 lt!443056 mask!3464))))))

(declare-fun b!1002196 () Bool)

(declare-fun res!671680 () Bool)

(assert (=> b!1002196 (=> (not res!671680) (not e!564628))))

(declare-fun resIndex!38 () (_ BitVec 32))

(assert (=> b!1002196 (= res!671680 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1002198 () Bool)

(declare-fun res!671671 () Bool)

(assert (=> b!1002198 (=> (not res!671671) (not e!564624))))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1002198 (= res!671671 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30983 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30983 a!3219))))))

(declare-fun b!1002199 () Bool)

(assert (=> b!1002199 (= e!564628 e!564623)))

(declare-fun res!671681 () Bool)

(assert (=> b!1002199 (=> (not res!671681) (not e!564623))))

(assert (=> b!1002199 (= res!671681 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1245) resX!38) (bvsge (bvadd #b00000000000000000000000000000001 x!1245) #b00000000000000000000000000000000) (bvsge lt!443051 #b00000000000000000000000000000000) (bvslt lt!443051 (size!30983 a!3219))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1002199 (= lt!443051 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun b!1002200 () Bool)

(assert (=> b!1002200 (= e!564622 e!564628)))

(declare-fun res!671674 () Bool)

(assert (=> b!1002200 (=> (not res!671674) (not e!564628))))

(declare-fun lt!443050 () SeekEntryResult!9413)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1002200 (= res!671674 (not (= lt!443050 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!443055 mask!3464) lt!443055 lt!443056 mask!3464))))))

(assert (=> b!1002200 (= lt!443055 (select (store (arr!30481 a!3219) i!1194 k!2224) j!170))))

(assert (=> b!1002200 (= lt!443056 (array!63312 (store (arr!30481 a!3219) i!1194 k!2224) (size!30983 a!3219)))))

(declare-fun b!1002201 () Bool)

(assert (=> b!1002201 (= e!564627 e!564624)))

(declare-fun res!671678 () Bool)

(assert (=> b!1002201 (=> (not res!671678) (not e!564624))))

(declare-fun lt!443057 () SeekEntryResult!9413)

(assert (=> b!1002201 (= res!671678 (or (= lt!443057 (MissingVacant!9413 i!1194)) (= lt!443057 (MissingZero!9413 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63311 (_ BitVec 32)) SeekEntryResult!9413)

(assert (=> b!1002201 (= lt!443057 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!1002202 () Bool)

(declare-fun res!671677 () Bool)

(assert (=> b!1002202 (=> (not res!671677) (not e!564624))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63311 (_ BitVec 32)) Bool)

(assert (=> b!1002202 (= res!671677 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun res!671669 () Bool)

(assert (=> start!86510 (=> (not res!671669) (not e!564627))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86510 (= res!671669 (validMask!0 mask!3464))))

(assert (=> start!86510 e!564627))

(declare-fun array_inv!23605 (array!63311) Bool)

(assert (=> start!86510 (array_inv!23605 a!3219)))

(assert (=> start!86510 true))

(declare-fun b!1002197 () Bool)

(assert (=> b!1002197 (= e!564624 e!564626)))

(declare-fun res!671670 () Bool)

(assert (=> b!1002197 (=> (not res!671670) (not e!564626))))

(assert (=> b!1002197 (= res!671670 (= lt!443050 lt!443052))))

(assert (=> b!1002197 (= lt!443052 (Intermediate!9413 false resIndex!38 resX!38))))

(assert (=> b!1002197 (= lt!443050 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30481 a!3219) j!170) mask!3464) (select (arr!30481 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1002203 () Bool)

(declare-fun res!671672 () Bool)

(assert (=> b!1002203 (=> (not res!671672) (not e!564627))))

(assert (=> b!1002203 (= res!671672 (validKeyInArray!0 k!2224))))

(declare-fun b!1002204 () Bool)

(declare-fun res!671676 () Bool)

(assert (=> b!1002204 (=> (not res!671676) (not e!564623))))

(assert (=> b!1002204 (= res!671676 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!443051 (select (arr!30481 a!3219) j!170) a!3219 mask!3464) lt!443052))))

(assert (= (and start!86510 res!671669) b!1002193))

(assert (= (and b!1002193 res!671675) b!1002191))

(assert (= (and b!1002191 res!671679) b!1002203))

(assert (= (and b!1002203 res!671672) b!1002190))

(assert (= (and b!1002190 res!671682) b!1002201))

(assert (= (and b!1002201 res!671678) b!1002202))

(assert (= (and b!1002202 res!671677) b!1002194))

(assert (= (and b!1002194 res!671668) b!1002198))

(assert (= (and b!1002198 res!671671) b!1002197))

(assert (= (and b!1002197 res!671670) b!1002189))

(assert (= (and b!1002189 res!671673) b!1002200))

(assert (= (and b!1002200 res!671674) b!1002195))

(assert (= (and b!1002195 res!671667) b!1002196))

(assert (= (and b!1002196 res!671680) b!1002199))

(assert (= (and b!1002199 res!671681) b!1002204))

(assert (= (and b!1002204 res!671676) b!1002192))

(declare-fun m!928109 () Bool)

(assert (=> b!1002199 m!928109))

(declare-fun m!928111 () Bool)

(assert (=> b!1002201 m!928111))

(declare-fun m!928113 () Bool)

(assert (=> b!1002191 m!928113))

(assert (=> b!1002191 m!928113))

(declare-fun m!928115 () Bool)

(assert (=> b!1002191 m!928115))

(assert (=> b!1002189 m!928113))

(assert (=> b!1002189 m!928113))

(declare-fun m!928117 () Bool)

(assert (=> b!1002189 m!928117))

(assert (=> b!1002204 m!928113))

(assert (=> b!1002204 m!928113))

(declare-fun m!928119 () Bool)

(assert (=> b!1002204 m!928119))

(declare-fun m!928121 () Bool)

(assert (=> b!1002194 m!928121))

(declare-fun m!928123 () Bool)

(assert (=> start!86510 m!928123))

(declare-fun m!928125 () Bool)

(assert (=> start!86510 m!928125))

(declare-fun m!928127 () Bool)

(assert (=> b!1002195 m!928127))

(declare-fun m!928129 () Bool)

(assert (=> b!1002192 m!928129))

(declare-fun m!928131 () Bool)

(assert (=> b!1002190 m!928131))

(declare-fun m!928133 () Bool)

(assert (=> b!1002200 m!928133))

(assert (=> b!1002200 m!928133))

(declare-fun m!928135 () Bool)

(assert (=> b!1002200 m!928135))

(declare-fun m!928137 () Bool)

(assert (=> b!1002200 m!928137))

(declare-fun m!928139 () Bool)

(assert (=> b!1002200 m!928139))

(declare-fun m!928141 () Bool)

(assert (=> b!1002203 m!928141))

(declare-fun m!928143 () Bool)

(assert (=> b!1002202 m!928143))

(assert (=> b!1002197 m!928113))

(assert (=> b!1002197 m!928113))

(declare-fun m!928145 () Bool)

(assert (=> b!1002197 m!928145))

(assert (=> b!1002197 m!928145))

(assert (=> b!1002197 m!928113))

(declare-fun m!928147 () Bool)

(assert (=> b!1002197 m!928147))

(push 1)

(assert (not b!1002201))

(assert (not b!1002190))

(assert (not b!1002203))

(assert (not b!1002191))

(assert (not b!1002199))

(assert (not b!1002200))

(assert (not start!86510))

(assert (not b!1002204))

