; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51612 () Bool)

(assert start!51612)

(declare-fun b!564459 () Bool)

(declare-fun res!355508 () Bool)

(declare-fun e!325178 () Bool)

(assert (=> b!564459 (=> (not res!355508) (not e!325178))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!564459 (= res!355508 (validKeyInArray!0 k0!1914))))

(declare-fun b!564460 () Bool)

(declare-fun res!355509 () Bool)

(assert (=> b!564460 (=> (not res!355509) (not e!325178))))

(declare-datatypes ((array!35424 0))(
  ( (array!35425 (arr!17011 (Array (_ BitVec 32) (_ BitVec 64))) (size!17375 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35424)

(declare-fun arrayContainsKey!0 (array!35424 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!564460 (= res!355509 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!564461 () Bool)

(declare-fun e!325177 () Bool)

(assert (=> b!564461 (= e!325178 e!325177)))

(declare-fun res!355506 () Bool)

(assert (=> b!564461 (=> (not res!355506) (not e!325177))))

(declare-datatypes ((SeekEntryResult!5416 0))(
  ( (MissingZero!5416 (index!23891 (_ BitVec 32))) (Found!5416 (index!23892 (_ BitVec 32))) (Intermediate!5416 (undefined!6228 Bool) (index!23893 (_ BitVec 32)) (x!52922 (_ BitVec 32))) (Undefined!5416) (MissingVacant!5416 (index!23894 (_ BitVec 32))) )
))
(declare-fun lt!257595 () SeekEntryResult!5416)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!564461 (= res!355506 (or (= lt!257595 (MissingZero!5416 i!1132)) (= lt!257595 (MissingVacant!5416 i!1132))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35424 (_ BitVec 32)) SeekEntryResult!5416)

(assert (=> b!564461 (= lt!257595 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!564462 () Bool)

(declare-fun res!355511 () Bool)

(assert (=> b!564462 (=> (not res!355511) (not e!325177))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35424 (_ BitVec 32)) Bool)

(assert (=> b!564462 (= res!355511 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!564463 () Bool)

(assert (=> b!564463 (= e!325177 false)))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun lt!257596 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!564463 (= lt!257596 (toIndex!0 (select (arr!17011 a!3118) j!142) mask!3119))))

(declare-fun b!564464 () Bool)

(declare-fun res!355510 () Bool)

(assert (=> b!564464 (=> (not res!355510) (not e!325178))))

(assert (=> b!564464 (= res!355510 (and (= (size!17375 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17375 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17375 a!3118)) (not (= i!1132 j!142))))))

(declare-fun res!355512 () Bool)

(assert (=> start!51612 (=> (not res!355512) (not e!325178))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51612 (= res!355512 (validMask!0 mask!3119))))

(assert (=> start!51612 e!325178))

(assert (=> start!51612 true))

(declare-fun array_inv!12870 (array!35424) Bool)

(assert (=> start!51612 (array_inv!12870 a!3118)))

(declare-fun b!564465 () Bool)

(declare-fun res!355513 () Bool)

(assert (=> b!564465 (=> (not res!355513) (not e!325177))))

(declare-datatypes ((List!10998 0))(
  ( (Nil!10995) (Cons!10994 (h!12000 (_ BitVec 64)) (t!17218 List!10998)) )
))
(declare-fun arrayNoDuplicates!0 (array!35424 (_ BitVec 32) List!10998) Bool)

(assert (=> b!564465 (= res!355513 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10995))))

(declare-fun b!564466 () Bool)

(declare-fun res!355507 () Bool)

(assert (=> b!564466 (=> (not res!355507) (not e!325178))))

(assert (=> b!564466 (= res!355507 (validKeyInArray!0 (select (arr!17011 a!3118) j!142)))))

(assert (= (and start!51612 res!355512) b!564464))

(assert (= (and b!564464 res!355510) b!564466))

(assert (= (and b!564466 res!355507) b!564459))

(assert (= (and b!564459 res!355508) b!564460))

(assert (= (and b!564460 res!355509) b!564461))

(assert (= (and b!564461 res!355506) b!564462))

(assert (= (and b!564462 res!355511) b!564465))

(assert (= (and b!564465 res!355513) b!564463))

(declare-fun m!543041 () Bool)

(assert (=> b!564466 m!543041))

(assert (=> b!564466 m!543041))

(declare-fun m!543043 () Bool)

(assert (=> b!564466 m!543043))

(declare-fun m!543045 () Bool)

(assert (=> b!564465 m!543045))

(declare-fun m!543047 () Bool)

(assert (=> b!564461 m!543047))

(assert (=> b!564463 m!543041))

(assert (=> b!564463 m!543041))

(declare-fun m!543049 () Bool)

(assert (=> b!564463 m!543049))

(declare-fun m!543051 () Bool)

(assert (=> b!564459 m!543051))

(declare-fun m!543053 () Bool)

(assert (=> b!564462 m!543053))

(declare-fun m!543055 () Bool)

(assert (=> start!51612 m!543055))

(declare-fun m!543057 () Bool)

(assert (=> start!51612 m!543057))

(declare-fun m!543059 () Bool)

(assert (=> b!564460 m!543059))

(check-sat (not b!564459) (not b!564465) (not b!564463) (not start!51612) (not b!564461) (not b!564466) (not b!564460) (not b!564462))
(check-sat)
