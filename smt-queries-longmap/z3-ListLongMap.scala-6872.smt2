; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86488 () Bool)

(assert start!86488)

(declare-fun b!1001661 () Bool)

(declare-fun e!564393 () Bool)

(declare-fun e!564391 () Bool)

(assert (=> b!1001661 (= e!564393 e!564391)))

(declare-fun res!671143 () Bool)

(assert (=> b!1001661 (=> (not res!671143) (not e!564391))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-datatypes ((array!63289 0))(
  ( (array!63290 (arr!30470 (Array (_ BitVec 32) (_ BitVec 64))) (size!30972 (_ BitVec 32))) )
))
(declare-fun lt!442789 () array!63289)

(declare-fun lt!442786 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!9402 0))(
  ( (MissingZero!9402 (index!39979 (_ BitVec 32))) (Found!9402 (index!39980 (_ BitVec 32))) (Intermediate!9402 (undefined!10214 Bool) (index!39981 (_ BitVec 32)) (x!87398 (_ BitVec 32))) (Undefined!9402) (MissingVacant!9402 (index!39982 (_ BitVec 32))) )
))
(declare-fun lt!442793 () SeekEntryResult!9402)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63289 (_ BitVec 32)) SeekEntryResult!9402)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1001661 (= res!671143 (not (= lt!442793 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!442786 mask!3464) lt!442786 lt!442789 mask!3464))))))

(declare-fun a!3219 () array!63289)

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(declare-fun k0!2224 () (_ BitVec 64))

(assert (=> b!1001661 (= lt!442786 (select (store (arr!30470 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1001661 (= lt!442789 (array!63290 (store (arr!30470 a!3219) i!1194 k0!2224) (size!30972 a!3219)))))

(declare-fun b!1001662 () Bool)

(declare-fun res!671152 () Bool)

(declare-fun e!564394 () Bool)

(assert (=> b!1001662 (=> (not res!671152) (not e!564394))))

(declare-fun lt!442788 () SeekEntryResult!9402)

(declare-fun lt!442791 () (_ BitVec 32))

(declare-fun x!1245 () (_ BitVec 32))

(assert (=> b!1001662 (= res!671152 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!442791 (select (arr!30470 a!3219) j!170) a!3219 mask!3464) lt!442788))))

(declare-fun b!1001663 () Bool)

(assert (=> b!1001663 (= e!564391 e!564394)))

(declare-fun res!671144 () Bool)

(assert (=> b!1001663 (=> (not res!671144) (not e!564394))))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1001663 (= res!671144 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1245) resX!38) (bvsge (bvadd #b00000000000000000000000000000001 x!1245) #b00000000000000000000000000000000) (bvsge lt!442791 #b00000000000000000000000000000000) (bvslt lt!442791 (size!30972 a!3219))))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1001663 (= lt!442791 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun b!1001664 () Bool)

(declare-fun e!564395 () Bool)

(declare-fun e!564392 () Bool)

(assert (=> b!1001664 (= e!564395 e!564392)))

(declare-fun res!671153 () Bool)

(assert (=> b!1001664 (=> (not res!671153) (not e!564392))))

(declare-fun lt!442787 () SeekEntryResult!9402)

(assert (=> b!1001664 (= res!671153 (or (= lt!442787 (MissingVacant!9402 i!1194)) (= lt!442787 (MissingZero!9402 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63289 (_ BitVec 32)) SeekEntryResult!9402)

(assert (=> b!1001664 (= lt!442787 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1001665 () Bool)

(assert (=> b!1001665 (= e!564394 false)))

(declare-fun lt!442790 () SeekEntryResult!9402)

(assert (=> b!1001665 (= lt!442790 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!442791 lt!442786 lt!442789 mask!3464))))

(declare-fun b!1001666 () Bool)

(declare-fun res!671146 () Bool)

(assert (=> b!1001666 (=> (not res!671146) (not e!564392))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63289 (_ BitVec 32)) Bool)

(assert (=> b!1001666 (= res!671146 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1001667 () Bool)

(declare-fun res!671150 () Bool)

(assert (=> b!1001667 (=> (not res!671150) (not e!564391))))

(declare-fun resIndex!38 () (_ BitVec 32))

(assert (=> b!1001667 (= res!671150 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1001668 () Bool)

(declare-fun res!671140 () Bool)

(assert (=> b!1001668 (=> (not res!671140) (not e!564395))))

(assert (=> b!1001668 (= res!671140 (and (= (size!30972 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30972 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30972 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1001669 () Bool)

(declare-fun res!671149 () Bool)

(assert (=> b!1001669 (=> (not res!671149) (not e!564395))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1001669 (= res!671149 (validKeyInArray!0 k0!2224))))

(declare-fun b!1001670 () Bool)

(declare-fun e!564397 () Bool)

(assert (=> b!1001670 (= e!564392 e!564397)))

(declare-fun res!671139 () Bool)

(assert (=> b!1001670 (=> (not res!671139) (not e!564397))))

(assert (=> b!1001670 (= res!671139 (= lt!442793 lt!442788))))

(assert (=> b!1001670 (= lt!442788 (Intermediate!9402 false resIndex!38 resX!38))))

(assert (=> b!1001670 (= lt!442793 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30470 a!3219) j!170) mask!3464) (select (arr!30470 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1001671 () Bool)

(declare-fun res!671154 () Bool)

(assert (=> b!1001671 (=> (not res!671154) (not e!564392))))

(declare-datatypes ((List!21146 0))(
  ( (Nil!21143) (Cons!21142 (h!22319 (_ BitVec 64)) (t!30147 List!21146)) )
))
(declare-fun arrayNoDuplicates!0 (array!63289 (_ BitVec 32) List!21146) Bool)

(assert (=> b!1001671 (= res!671154 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21143))))

(declare-fun res!671151 () Bool)

(assert (=> start!86488 (=> (not res!671151) (not e!564395))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86488 (= res!671151 (validMask!0 mask!3464))))

(assert (=> start!86488 e!564395))

(declare-fun array_inv!23594 (array!63289) Bool)

(assert (=> start!86488 (array_inv!23594 a!3219)))

(assert (=> start!86488 true))

(declare-fun b!1001672 () Bool)

(declare-fun res!671147 () Bool)

(assert (=> b!1001672 (=> (not res!671147) (not e!564395))))

(declare-fun arrayContainsKey!0 (array!63289 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1001672 (= res!671147 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1001673 () Bool)

(assert (=> b!1001673 (= e!564397 e!564393)))

(declare-fun res!671148 () Bool)

(assert (=> b!1001673 (=> (not res!671148) (not e!564393))))

(declare-fun lt!442792 () SeekEntryResult!9402)

(assert (=> b!1001673 (= res!671148 (= lt!442792 lt!442788))))

(assert (=> b!1001673 (= lt!442792 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30470 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1001674 () Bool)

(declare-fun res!671142 () Bool)

(assert (=> b!1001674 (=> (not res!671142) (not e!564391))))

(assert (=> b!1001674 (= res!671142 (not (= lt!442792 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!442786 lt!442789 mask!3464))))))

(declare-fun b!1001675 () Bool)

(declare-fun res!671141 () Bool)

(assert (=> b!1001675 (=> (not res!671141) (not e!564392))))

(assert (=> b!1001675 (= res!671141 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30972 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30972 a!3219))))))

(declare-fun b!1001676 () Bool)

(declare-fun res!671145 () Bool)

(assert (=> b!1001676 (=> (not res!671145) (not e!564395))))

(assert (=> b!1001676 (= res!671145 (validKeyInArray!0 (select (arr!30470 a!3219) j!170)))))

(assert (= (and start!86488 res!671151) b!1001668))

(assert (= (and b!1001668 res!671140) b!1001676))

(assert (= (and b!1001676 res!671145) b!1001669))

(assert (= (and b!1001669 res!671149) b!1001672))

(assert (= (and b!1001672 res!671147) b!1001664))

(assert (= (and b!1001664 res!671153) b!1001666))

(assert (= (and b!1001666 res!671146) b!1001671))

(assert (= (and b!1001671 res!671154) b!1001675))

(assert (= (and b!1001675 res!671141) b!1001670))

(assert (= (and b!1001670 res!671139) b!1001673))

(assert (= (and b!1001673 res!671148) b!1001661))

(assert (= (and b!1001661 res!671143) b!1001674))

(assert (= (and b!1001674 res!671142) b!1001667))

(assert (= (and b!1001667 res!671150) b!1001663))

(assert (= (and b!1001663 res!671144) b!1001662))

(assert (= (and b!1001662 res!671152) b!1001665))

(declare-fun m!927669 () Bool)

(assert (=> b!1001674 m!927669))

(declare-fun m!927671 () Bool)

(assert (=> b!1001676 m!927671))

(assert (=> b!1001676 m!927671))

(declare-fun m!927673 () Bool)

(assert (=> b!1001676 m!927673))

(declare-fun m!927675 () Bool)

(assert (=> b!1001665 m!927675))

(declare-fun m!927677 () Bool)

(assert (=> b!1001666 m!927677))

(declare-fun m!927679 () Bool)

(assert (=> b!1001671 m!927679))

(assert (=> b!1001662 m!927671))

(assert (=> b!1001662 m!927671))

(declare-fun m!927681 () Bool)

(assert (=> b!1001662 m!927681))

(declare-fun m!927683 () Bool)

(assert (=> b!1001669 m!927683))

(assert (=> b!1001670 m!927671))

(assert (=> b!1001670 m!927671))

(declare-fun m!927685 () Bool)

(assert (=> b!1001670 m!927685))

(assert (=> b!1001670 m!927685))

(assert (=> b!1001670 m!927671))

(declare-fun m!927687 () Bool)

(assert (=> b!1001670 m!927687))

(declare-fun m!927689 () Bool)

(assert (=> b!1001664 m!927689))

(assert (=> b!1001673 m!927671))

(assert (=> b!1001673 m!927671))

(declare-fun m!927691 () Bool)

(assert (=> b!1001673 m!927691))

(declare-fun m!927693 () Bool)

(assert (=> b!1001672 m!927693))

(declare-fun m!927695 () Bool)

(assert (=> b!1001663 m!927695))

(declare-fun m!927697 () Bool)

(assert (=> start!86488 m!927697))

(declare-fun m!927699 () Bool)

(assert (=> start!86488 m!927699))

(declare-fun m!927701 () Bool)

(assert (=> b!1001661 m!927701))

(assert (=> b!1001661 m!927701))

(declare-fun m!927703 () Bool)

(assert (=> b!1001661 m!927703))

(declare-fun m!927705 () Bool)

(assert (=> b!1001661 m!927705))

(declare-fun m!927707 () Bool)

(assert (=> b!1001661 m!927707))

(check-sat (not b!1001665) (not b!1001664) (not b!1001662) (not b!1001670) (not b!1001676) (not b!1001663) (not b!1001669) (not b!1001674) (not b!1001673) (not start!86488) (not b!1001672) (not b!1001671) (not b!1001661) (not b!1001666))
(check-sat)
