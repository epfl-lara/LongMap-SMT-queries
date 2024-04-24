; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120800 () Bool)

(assert start!120800)

(declare-fun b!1405435 () Bool)

(declare-fun res!943265 () Bool)

(declare-fun e!795731 () Bool)

(assert (=> b!1405435 (=> (not res!943265) (not e!795731))))

(declare-datatypes ((array!96131 0))(
  ( (array!96132 (arr!46414 (Array (_ BitVec 32) (_ BitVec 64))) (size!46965 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96131)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1405435 (= res!943265 (validKeyInArray!0 (select (arr!46414 a!2901) i!1037)))))

(declare-fun b!1405436 () Bool)

(declare-fun res!943262 () Bool)

(assert (=> b!1405436 (=> (not res!943262) (not e!795731))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1405436 (= res!943262 (validKeyInArray!0 (select (arr!46414 a!2901) j!112)))))

(declare-fun res!943264 () Bool)

(assert (=> start!120800 (=> (not res!943264) (not e!795731))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120800 (= res!943264 (validMask!0 mask!2840))))

(assert (=> start!120800 e!795731))

(assert (=> start!120800 true))

(declare-fun array_inv!35695 (array!96131) Bool)

(assert (=> start!120800 (array_inv!35695 a!2901)))

(declare-fun b!1405437 () Bool)

(assert (=> b!1405437 (= e!795731 (and (bvsle #b00000000000000000000000000000000 (size!46965 a!2901)) (bvsgt j!112 (size!46965 a!2901))))))

(declare-datatypes ((SeekEntryResult!10628 0))(
  ( (MissingZero!10628 (index!44889 (_ BitVec 32))) (Found!10628 (index!44890 (_ BitVec 32))) (Intermediate!10628 (undefined!11440 Bool) (index!44891 (_ BitVec 32)) (x!126658 (_ BitVec 32))) (Undefined!10628) (MissingVacant!10628 (index!44892 (_ BitVec 32))) )
))
(declare-fun lt!619019 () SeekEntryResult!10628)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96131 (_ BitVec 32)) SeekEntryResult!10628)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1405437 (= lt!619019 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46414 a!2901) j!112) mask!2840) (select (arr!46414 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1405438 () Bool)

(declare-fun res!943267 () Bool)

(assert (=> b!1405438 (=> (not res!943267) (not e!795731))))

(declare-datatypes ((List!32920 0))(
  ( (Nil!32917) (Cons!32916 (h!34172 (_ BitVec 64)) (t!47606 List!32920)) )
))
(declare-fun arrayNoDuplicates!0 (array!96131 (_ BitVec 32) List!32920) Bool)

(assert (=> b!1405438 (= res!943267 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32917))))

(declare-fun b!1405439 () Bool)

(declare-fun res!943266 () Bool)

(assert (=> b!1405439 (=> (not res!943266) (not e!795731))))

(assert (=> b!1405439 (= res!943266 (and (= (size!46965 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46965 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46965 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1405440 () Bool)

(declare-fun res!943263 () Bool)

(assert (=> b!1405440 (=> (not res!943263) (not e!795731))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96131 (_ BitVec 32)) Bool)

(assert (=> b!1405440 (= res!943263 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(assert (= (and start!120800 res!943264) b!1405439))

(assert (= (and b!1405439 res!943266) b!1405435))

(assert (= (and b!1405435 res!943265) b!1405436))

(assert (= (and b!1405436 res!943262) b!1405440))

(assert (= (and b!1405440 res!943263) b!1405438))

(assert (= (and b!1405438 res!943267) b!1405437))

(declare-fun m!1294489 () Bool)

(assert (=> b!1405436 m!1294489))

(assert (=> b!1405436 m!1294489))

(declare-fun m!1294491 () Bool)

(assert (=> b!1405436 m!1294491))

(declare-fun m!1294493 () Bool)

(assert (=> b!1405438 m!1294493))

(declare-fun m!1294495 () Bool)

(assert (=> start!120800 m!1294495))

(declare-fun m!1294497 () Bool)

(assert (=> start!120800 m!1294497))

(declare-fun m!1294499 () Bool)

(assert (=> b!1405440 m!1294499))

(assert (=> b!1405437 m!1294489))

(assert (=> b!1405437 m!1294489))

(declare-fun m!1294501 () Bool)

(assert (=> b!1405437 m!1294501))

(assert (=> b!1405437 m!1294501))

(assert (=> b!1405437 m!1294489))

(declare-fun m!1294503 () Bool)

(assert (=> b!1405437 m!1294503))

(declare-fun m!1294505 () Bool)

(assert (=> b!1405435 m!1294505))

(assert (=> b!1405435 m!1294505))

(declare-fun m!1294507 () Bool)

(assert (=> b!1405435 m!1294507))

(check-sat (not b!1405435) (not b!1405440) (not b!1405437) (not b!1405438) (not start!120800) (not b!1405436))
(check-sat)
