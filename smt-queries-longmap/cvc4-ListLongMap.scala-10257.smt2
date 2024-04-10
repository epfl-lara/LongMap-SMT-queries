; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120598 () Bool)

(assert start!120598)

(declare-fun res!942683 () Bool)

(declare-fun e!794951 () Bool)

(assert (=> start!120598 (=> (not res!942683) (not e!794951))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120598 (= res!942683 (validMask!0 mask!2840))))

(assert (=> start!120598 e!794951))

(assert (=> start!120598 true))

(declare-datatypes ((array!96007 0))(
  ( (array!96008 (arr!46354 (Array (_ BitVec 32) (_ BitVec 64))) (size!46904 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96007)

(declare-fun array_inv!35382 (array!96007) Bool)

(assert (=> start!120598 (array_inv!35382 a!2901)))

(declare-fun b!1404169 () Bool)

(declare-fun res!942682 () Bool)

(assert (=> b!1404169 (=> (not res!942682) (not e!794951))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1404169 (= res!942682 (and (= (size!46904 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46904 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46904 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1404170 () Bool)

(declare-fun res!942685 () Bool)

(assert (=> b!1404170 (=> (not res!942685) (not e!794951))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1404170 (= res!942685 (validKeyInArray!0 (select (arr!46354 a!2901) j!112)))))

(declare-fun b!1404171 () Bool)

(assert (=> b!1404171 (= e!794951 false)))

(declare-datatypes ((SeekEntryResult!10665 0))(
  ( (MissingZero!10665 (index!45037 (_ BitVec 32))) (Found!10665 (index!45038 (_ BitVec 32))) (Intermediate!10665 (undefined!11477 Bool) (index!45039 (_ BitVec 32)) (x!126652 (_ BitVec 32))) (Undefined!10665) (MissingVacant!10665 (index!45040 (_ BitVec 32))) )
))
(declare-fun lt!618600 () SeekEntryResult!10665)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96007 (_ BitVec 32)) SeekEntryResult!10665)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1404171 (= lt!618600 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46354 a!2901) j!112) mask!2840) (select (arr!46354 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1404172 () Bool)

(declare-fun res!942684 () Bool)

(assert (=> b!1404172 (=> (not res!942684) (not e!794951))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96007 (_ BitVec 32)) Bool)

(assert (=> b!1404172 (= res!942684 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1404173 () Bool)

(declare-fun res!942680 () Bool)

(assert (=> b!1404173 (=> (not res!942680) (not e!794951))))

(assert (=> b!1404173 (= res!942680 (validKeyInArray!0 (select (arr!46354 a!2901) i!1037)))))

(declare-fun b!1404174 () Bool)

(declare-fun res!942681 () Bool)

(assert (=> b!1404174 (=> (not res!942681) (not e!794951))))

(declare-datatypes ((List!32873 0))(
  ( (Nil!32870) (Cons!32869 (h!34117 (_ BitVec 64)) (t!47567 List!32873)) )
))
(declare-fun arrayNoDuplicates!0 (array!96007 (_ BitVec 32) List!32873) Bool)

(assert (=> b!1404174 (= res!942681 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32870))))

(assert (= (and start!120598 res!942683) b!1404169))

(assert (= (and b!1404169 res!942682) b!1404173))

(assert (= (and b!1404173 res!942680) b!1404170))

(assert (= (and b!1404170 res!942685) b!1404172))

(assert (= (and b!1404172 res!942684) b!1404174))

(assert (= (and b!1404174 res!942681) b!1404171))

(declare-fun m!1292977 () Bool)

(assert (=> start!120598 m!1292977))

(declare-fun m!1292979 () Bool)

(assert (=> start!120598 m!1292979))

(declare-fun m!1292981 () Bool)

(assert (=> b!1404170 m!1292981))

(assert (=> b!1404170 m!1292981))

(declare-fun m!1292983 () Bool)

(assert (=> b!1404170 m!1292983))

(declare-fun m!1292985 () Bool)

(assert (=> b!1404172 m!1292985))

(declare-fun m!1292987 () Bool)

(assert (=> b!1404174 m!1292987))

(assert (=> b!1404171 m!1292981))

(assert (=> b!1404171 m!1292981))

(declare-fun m!1292989 () Bool)

(assert (=> b!1404171 m!1292989))

(assert (=> b!1404171 m!1292989))

(assert (=> b!1404171 m!1292981))

(declare-fun m!1292991 () Bool)

(assert (=> b!1404171 m!1292991))

(declare-fun m!1292993 () Bool)

(assert (=> b!1404173 m!1292993))

(assert (=> b!1404173 m!1292993))

(declare-fun m!1292995 () Bool)

(assert (=> b!1404173 m!1292995))

(push 1)

(assert (not b!1404172))

(assert (not b!1404170))

(assert (not b!1404173))

(assert (not b!1404174))

(assert (not start!120598))

(assert (not b!1404171))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

