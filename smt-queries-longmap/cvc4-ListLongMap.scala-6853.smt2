; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86376 () Bool)

(assert start!86376)

(declare-fun b!999562 () Bool)

(declare-fun res!669047 () Bool)

(declare-fun e!563587 () Bool)

(assert (=> b!999562 (=> (not res!669047) (not e!563587))))

(declare-datatypes ((array!63177 0))(
  ( (array!63178 (arr!30414 (Array (_ BitVec 32) (_ BitVec 64))) (size!30916 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63177)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63177 (_ BitVec 32)) Bool)

(assert (=> b!999562 (= res!669047 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!999563 () Bool)

(declare-fun res!669040 () Bool)

(assert (=> b!999563 (=> (not res!669040) (not e!563587))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!999563 (= res!669040 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30916 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30916 a!3219))))))

(declare-fun b!999564 () Bool)

(declare-fun e!563590 () Bool)

(assert (=> b!999564 (= e!563590 e!563587)))

(declare-fun res!669048 () Bool)

(assert (=> b!999564 (=> (not res!669048) (not e!563587))))

(declare-datatypes ((SeekEntryResult!9346 0))(
  ( (MissingZero!9346 (index!39755 (_ BitVec 32))) (Found!9346 (index!39756 (_ BitVec 32))) (Intermediate!9346 (undefined!10158 Bool) (index!39757 (_ BitVec 32)) (x!87190 (_ BitVec 32))) (Undefined!9346) (MissingVacant!9346 (index!39758 (_ BitVec 32))) )
))
(declare-fun lt!442059 () SeekEntryResult!9346)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!999564 (= res!669048 (or (= lt!442059 (MissingVacant!9346 i!1194)) (= lt!442059 (MissingZero!9346 i!1194))))))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63177 (_ BitVec 32)) SeekEntryResult!9346)

(assert (=> b!999564 (= lt!442059 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun res!669042 () Bool)

(assert (=> start!86376 (=> (not res!669042) (not e!563590))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86376 (= res!669042 (validMask!0 mask!3464))))

(assert (=> start!86376 e!563590))

(declare-fun array_inv!23538 (array!63177) Bool)

(assert (=> start!86376 (array_inv!23538 a!3219)))

(assert (=> start!86376 true))

(declare-fun b!999565 () Bool)

(declare-fun res!669050 () Bool)

(assert (=> b!999565 (=> (not res!669050) (not e!563590))))

(declare-fun j!170 () (_ BitVec 32))

(assert (=> b!999565 (= res!669050 (and (= (size!30916 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30916 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30916 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!999566 () Bool)

(declare-fun res!669043 () Bool)

(declare-fun e!563589 () Bool)

(assert (=> b!999566 (=> (not res!669043) (not e!563589))))

(declare-fun lt!442061 () SeekEntryResult!9346)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63177 (_ BitVec 32)) SeekEntryResult!9346)

(assert (=> b!999566 (= res!669043 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30414 a!3219) j!170) a!3219 mask!3464) lt!442061))))

(declare-fun b!999567 () Bool)

(declare-fun e!563588 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!999567 (= e!563588 (not (validKeyInArray!0 (select (store (arr!30414 a!3219) i!1194 k!2224) j!170))))))

(declare-fun b!999568 () Bool)

(declare-fun res!669049 () Bool)

(assert (=> b!999568 (=> (not res!669049) (not e!563587))))

(declare-datatypes ((List!21090 0))(
  ( (Nil!21087) (Cons!21086 (h!22263 (_ BitVec 64)) (t!30091 List!21090)) )
))
(declare-fun arrayNoDuplicates!0 (array!63177 (_ BitVec 32) List!21090) Bool)

(assert (=> b!999568 (= res!669049 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21087))))

(declare-fun b!999569 () Bool)

(assert (=> b!999569 (= e!563589 e!563588)))

(declare-fun res!669045 () Bool)

(assert (=> b!999569 (=> (not res!669045) (not e!563588))))

(declare-fun lt!442060 () (_ BitVec 32))

(assert (=> b!999569 (= res!669045 (and (bvsge mask!3464 #b00000000000000000000000000000000) (bvsge lt!442060 #b00000000000000000000000000000000) (bvslt lt!442060 (bvadd #b00000000000000000000000000000001 mask!3464))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!999569 (= lt!442060 (toIndex!0 (select (store (arr!30414 a!3219) i!1194 k!2224) j!170) mask!3464))))

(declare-fun b!999570 () Bool)

(assert (=> b!999570 (= e!563587 e!563589)))

(declare-fun res!669041 () Bool)

(assert (=> b!999570 (=> (not res!669041) (not e!563589))))

(assert (=> b!999570 (= res!669041 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30414 a!3219) j!170) mask!3464) (select (arr!30414 a!3219) j!170) a!3219 mask!3464) lt!442061))))

(assert (=> b!999570 (= lt!442061 (Intermediate!9346 false resIndex!38 resX!38))))

(declare-fun b!999571 () Bool)

(declare-fun res!669044 () Bool)

(assert (=> b!999571 (=> (not res!669044) (not e!563590))))

(assert (=> b!999571 (= res!669044 (validKeyInArray!0 (select (arr!30414 a!3219) j!170)))))

(declare-fun b!999572 () Bool)

(declare-fun res!669051 () Bool)

(assert (=> b!999572 (=> (not res!669051) (not e!563590))))

(declare-fun arrayContainsKey!0 (array!63177 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!999572 (= res!669051 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!999573 () Bool)

(declare-fun res!669046 () Bool)

(assert (=> b!999573 (=> (not res!669046) (not e!563590))))

(assert (=> b!999573 (= res!669046 (validKeyInArray!0 k!2224))))

(assert (= (and start!86376 res!669042) b!999565))

(assert (= (and b!999565 res!669050) b!999571))

(assert (= (and b!999571 res!669044) b!999573))

(assert (= (and b!999573 res!669046) b!999572))

(assert (= (and b!999572 res!669051) b!999564))

(assert (= (and b!999564 res!669048) b!999562))

(assert (= (and b!999562 res!669047) b!999568))

(assert (= (and b!999568 res!669049) b!999563))

(assert (= (and b!999563 res!669040) b!999570))

(assert (= (and b!999570 res!669041) b!999566))

(assert (= (and b!999566 res!669043) b!999569))

(assert (= (and b!999569 res!669045) b!999567))

(declare-fun m!925791 () Bool)

(assert (=> b!999564 m!925791))

(declare-fun m!925793 () Bool)

(assert (=> b!999562 m!925793))

(declare-fun m!925795 () Bool)

(assert (=> b!999568 m!925795))

(declare-fun m!925797 () Bool)

(assert (=> b!999567 m!925797))

(declare-fun m!925799 () Bool)

(assert (=> b!999567 m!925799))

(assert (=> b!999567 m!925799))

(declare-fun m!925801 () Bool)

(assert (=> b!999567 m!925801))

(declare-fun m!925803 () Bool)

(assert (=> b!999572 m!925803))

(declare-fun m!925805 () Bool)

(assert (=> b!999573 m!925805))

(declare-fun m!925807 () Bool)

(assert (=> start!86376 m!925807))

(declare-fun m!925809 () Bool)

(assert (=> start!86376 m!925809))

(declare-fun m!925811 () Bool)

(assert (=> b!999571 m!925811))

(assert (=> b!999571 m!925811))

(declare-fun m!925813 () Bool)

(assert (=> b!999571 m!925813))

(assert (=> b!999566 m!925811))

(assert (=> b!999566 m!925811))

(declare-fun m!925815 () Bool)

(assert (=> b!999566 m!925815))

(assert (=> b!999569 m!925797))

(assert (=> b!999569 m!925799))

(assert (=> b!999569 m!925799))

(declare-fun m!925817 () Bool)

(assert (=> b!999569 m!925817))

(assert (=> b!999570 m!925811))

(assert (=> b!999570 m!925811))

(declare-fun m!925819 () Bool)

(assert (=> b!999570 m!925819))

(assert (=> b!999570 m!925819))

(assert (=> b!999570 m!925811))

(declare-fun m!925821 () Bool)

(assert (=> b!999570 m!925821))

(push 1)

(assert (not b!999567))

(assert (not b!999572))

(assert (not b!999568))

(assert (not start!86376))

(assert (not b!999573))

(assert (not b!999566))

(assert (not b!999564))

