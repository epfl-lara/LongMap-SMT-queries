; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120608 () Bool)

(assert start!120608)

(declare-fun b!1404214 () Bool)

(declare-fun res!942779 () Bool)

(declare-fun e!794954 () Bool)

(assert (=> b!1404214 (=> (not res!942779) (not e!794954))))

(declare-datatypes ((array!95970 0))(
  ( (array!95971 (arr!46336 (Array (_ BitVec 32) (_ BitVec 64))) (size!46888 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95970)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1404214 (= res!942779 (validKeyInArray!0 (select (arr!46336 a!2901) i!1037)))))

(declare-fun b!1404215 () Bool)

(declare-fun res!942777 () Bool)

(assert (=> b!1404215 (=> (not res!942777) (not e!794954))))

(declare-datatypes ((List!32933 0))(
  ( (Nil!32930) (Cons!32929 (h!34177 (_ BitVec 64)) (t!47619 List!32933)) )
))
(declare-fun arrayNoDuplicates!0 (array!95970 (_ BitVec 32) List!32933) Bool)

(assert (=> b!1404215 (= res!942777 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32930))))

(declare-fun b!1404216 () Bool)

(declare-fun res!942781 () Bool)

(assert (=> b!1404216 (=> (not res!942781) (not e!794954))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95970 (_ BitVec 32)) Bool)

(assert (=> b!1404216 (= res!942781 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!942776 () Bool)

(assert (=> start!120608 (=> (not res!942776) (not e!794954))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120608 (= res!942776 (validMask!0 mask!2840))))

(assert (=> start!120608 e!794954))

(assert (=> start!120608 true))

(declare-fun array_inv!35569 (array!95970) Bool)

(assert (=> start!120608 (array_inv!35569 a!2901)))

(declare-fun b!1404217 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1404217 (= e!794954 (and (bvsle #b00000000000000000000000000000000 (size!46888 a!2901)) (bvsgt j!112 (size!46888 a!2901))))))

(declare-datatypes ((SeekEntryResult!10673 0))(
  ( (MissingZero!10673 (index!45069 (_ BitVec 32))) (Found!10673 (index!45070 (_ BitVec 32))) (Intermediate!10673 (undefined!11485 Bool) (index!45071 (_ BitVec 32)) (x!126681 (_ BitVec 32))) (Undefined!10673) (MissingVacant!10673 (index!45072 (_ BitVec 32))) )
))
(declare-fun lt!618431 () SeekEntryResult!10673)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95970 (_ BitVec 32)) SeekEntryResult!10673)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1404217 (= lt!618431 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46336 a!2901) j!112) mask!2840) (select (arr!46336 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1404218 () Bool)

(declare-fun res!942780 () Bool)

(assert (=> b!1404218 (=> (not res!942780) (not e!794954))))

(assert (=> b!1404218 (= res!942780 (validKeyInArray!0 (select (arr!46336 a!2901) j!112)))))

(declare-fun b!1404219 () Bool)

(declare-fun res!942778 () Bool)

(assert (=> b!1404219 (=> (not res!942778) (not e!794954))))

(assert (=> b!1404219 (= res!942778 (and (= (size!46888 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46888 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46888 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!120608 res!942776) b!1404219))

(assert (= (and b!1404219 res!942778) b!1404214))

(assert (= (and b!1404214 res!942779) b!1404218))

(assert (= (and b!1404218 res!942780) b!1404216))

(assert (= (and b!1404216 res!942781) b!1404215))

(assert (= (and b!1404215 res!942777) b!1404217))

(declare-fun m!1292581 () Bool)

(assert (=> b!1404216 m!1292581))

(declare-fun m!1292583 () Bool)

(assert (=> b!1404214 m!1292583))

(assert (=> b!1404214 m!1292583))

(declare-fun m!1292585 () Bool)

(assert (=> b!1404214 m!1292585))

(declare-fun m!1292587 () Bool)

(assert (=> b!1404218 m!1292587))

(assert (=> b!1404218 m!1292587))

(declare-fun m!1292589 () Bool)

(assert (=> b!1404218 m!1292589))

(assert (=> b!1404217 m!1292587))

(assert (=> b!1404217 m!1292587))

(declare-fun m!1292591 () Bool)

(assert (=> b!1404217 m!1292591))

(assert (=> b!1404217 m!1292591))

(assert (=> b!1404217 m!1292587))

(declare-fun m!1292593 () Bool)

(assert (=> b!1404217 m!1292593))

(declare-fun m!1292595 () Bool)

(assert (=> b!1404215 m!1292595))

(declare-fun m!1292597 () Bool)

(assert (=> start!120608 m!1292597))

(declare-fun m!1292599 () Bool)

(assert (=> start!120608 m!1292599))

(check-sat (not b!1404216) (not b!1404217) (not b!1404218) (not b!1404214) (not start!120608) (not b!1404215))
(check-sat)
