; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119358 () Bool)

(assert start!119358)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95217 0))(
  ( (array!95218 (arr!45972 (Array (_ BitVec 32) (_ BitVec 64))) (size!46523 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95217)

(declare-fun e!788038 () Bool)

(declare-fun b!1391302 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10192 0))(
  ( (MissingZero!10192 (index!43139 (_ BitVec 32))) (Found!10192 (index!43140 (_ BitVec 32))) (Intermediate!10192 (undefined!11004 Bool) (index!43141 (_ BitVec 32)) (x!124969 (_ BitVec 32))) (Undefined!10192) (MissingVacant!10192 (index!43142 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95217 (_ BitVec 32)) SeekEntryResult!10192)

(assert (=> b!1391302 (= e!788038 (= (seekEntryOrOpen!0 (select (arr!45972 a!2901) j!112) a!2901 mask!2840) (Found!10192 j!112)))))

(declare-fun b!1391303 () Bool)

(declare-fun res!930781 () Bool)

(declare-fun e!788037 () Bool)

(assert (=> b!1391303 (=> (not res!930781) (not e!788037))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1391303 (= res!930781 (validKeyInArray!0 (select (arr!45972 a!2901) i!1037)))))

(declare-fun b!1391304 () Bool)

(declare-fun res!930783 () Bool)

(assert (=> b!1391304 (=> (not res!930783) (not e!788037))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95217 (_ BitVec 32)) Bool)

(assert (=> b!1391304 (= res!930783 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1391305 () Bool)

(declare-fun res!930784 () Bool)

(assert (=> b!1391305 (=> (not res!930784) (not e!788037))))

(declare-datatypes ((List!32478 0))(
  ( (Nil!32475) (Cons!32474 (h!33700 (_ BitVec 64)) (t!47164 List!32478)) )
))
(declare-fun arrayNoDuplicates!0 (array!95217 (_ BitVec 32) List!32478) Bool)

(assert (=> b!1391305 (= res!930784 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32475))))

(declare-fun b!1391301 () Bool)

(declare-fun res!930780 () Bool)

(assert (=> b!1391301 (=> (not res!930780) (not e!788037))))

(assert (=> b!1391301 (= res!930780 (validKeyInArray!0 (select (arr!45972 a!2901) j!112)))))

(declare-fun res!930778 () Bool)

(assert (=> start!119358 (=> (not res!930778) (not e!788037))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119358 (= res!930778 (validMask!0 mask!2840))))

(assert (=> start!119358 e!788037))

(assert (=> start!119358 true))

(declare-fun array_inv!35253 (array!95217) Bool)

(assert (=> start!119358 (array_inv!35253 a!2901)))

(declare-fun b!1391306 () Bool)

(declare-fun res!930782 () Bool)

(assert (=> b!1391306 (=> (not res!930782) (not e!788037))))

(assert (=> b!1391306 (= res!930782 (and (= (size!46523 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46523 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46523 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1391307 () Bool)

(assert (=> b!1391307 (= e!788037 (not true))))

(assert (=> b!1391307 e!788038))

(declare-fun res!930779 () Bool)

(assert (=> b!1391307 (=> (not res!930779) (not e!788038))))

(assert (=> b!1391307 (= res!930779 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46415 0))(
  ( (Unit!46416) )
))
(declare-fun lt!611143 () Unit!46415)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95217 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46415)

(assert (=> b!1391307 (= lt!611143 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!611144 () SeekEntryResult!10192)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95217 (_ BitVec 32)) SeekEntryResult!10192)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1391307 (= lt!611144 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45972 a!2901) j!112) mask!2840) (select (arr!45972 a!2901) j!112) a!2901 mask!2840))))

(assert (= (and start!119358 res!930778) b!1391306))

(assert (= (and b!1391306 res!930782) b!1391303))

(assert (= (and b!1391303 res!930781) b!1391301))

(assert (= (and b!1391301 res!930780) b!1391304))

(assert (= (and b!1391304 res!930783) b!1391305))

(assert (= (and b!1391305 res!930784) b!1391307))

(assert (= (and b!1391307 res!930779) b!1391302))

(declare-fun m!1277315 () Bool)

(assert (=> b!1391301 m!1277315))

(assert (=> b!1391301 m!1277315))

(declare-fun m!1277317 () Bool)

(assert (=> b!1391301 m!1277317))

(declare-fun m!1277319 () Bool)

(assert (=> b!1391305 m!1277319))

(declare-fun m!1277321 () Bool)

(assert (=> start!119358 m!1277321))

(declare-fun m!1277323 () Bool)

(assert (=> start!119358 m!1277323))

(declare-fun m!1277325 () Bool)

(assert (=> b!1391303 m!1277325))

(assert (=> b!1391303 m!1277325))

(declare-fun m!1277327 () Bool)

(assert (=> b!1391303 m!1277327))

(declare-fun m!1277329 () Bool)

(assert (=> b!1391304 m!1277329))

(assert (=> b!1391307 m!1277315))

(declare-fun m!1277331 () Bool)

(assert (=> b!1391307 m!1277331))

(assert (=> b!1391307 m!1277315))

(declare-fun m!1277333 () Bool)

(assert (=> b!1391307 m!1277333))

(assert (=> b!1391307 m!1277331))

(assert (=> b!1391307 m!1277315))

(declare-fun m!1277335 () Bool)

(assert (=> b!1391307 m!1277335))

(declare-fun m!1277337 () Bool)

(assert (=> b!1391307 m!1277337))

(assert (=> b!1391302 m!1277315))

(assert (=> b!1391302 m!1277315))

(declare-fun m!1277339 () Bool)

(assert (=> b!1391302 m!1277339))

(push 1)

(assert (not start!119358))

(assert (not b!1391301))

(assert (not b!1391303))

(assert (not b!1391305))

(assert (not b!1391302))

(assert (not b!1391307))

(assert (not b!1391304))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

