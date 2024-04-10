; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120764 () Bool)

(assert start!120764)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96071 0))(
  ( (array!96072 (arr!46383 (Array (_ BitVec 32) (_ BitVec 64))) (size!46933 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96071)

(declare-fun b!1405179 () Bool)

(declare-fun e!795444 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10694 0))(
  ( (MissingZero!10694 (index!45153 (_ BitVec 32))) (Found!10694 (index!45154 (_ BitVec 32))) (Intermediate!10694 (undefined!11506 Bool) (index!45155 (_ BitVec 32)) (x!126773 (_ BitVec 32))) (Undefined!10694) (MissingVacant!10694 (index!45156 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96071 (_ BitVec 32)) SeekEntryResult!10694)

(assert (=> b!1405179 (= e!795444 (= (seekEntryOrOpen!0 (select (arr!46383 a!2901) j!112) a!2901 mask!2840) (Found!10694 j!112)))))

(declare-fun b!1405180 () Bool)

(declare-fun res!943398 () Bool)

(declare-fun e!795445 () Bool)

(assert (=> b!1405180 (=> (not res!943398) (not e!795445))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1405180 (= res!943398 (validKeyInArray!0 (select (arr!46383 a!2901) i!1037)))))

(declare-fun b!1405181 () Bool)

(declare-fun res!943401 () Bool)

(assert (=> b!1405181 (=> (not res!943401) (not e!795445))))

(assert (=> b!1405181 (= res!943401 (validKeyInArray!0 (select (arr!46383 a!2901) j!112)))))

(declare-fun b!1405182 () Bool)

(assert (=> b!1405182 (= e!795445 (not true))))

(assert (=> b!1405182 e!795444))

(declare-fun res!943402 () Bool)

(assert (=> b!1405182 (=> (not res!943402) (not e!795444))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96071 (_ BitVec 32)) Bool)

(assert (=> b!1405182 (= res!943402 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47362 0))(
  ( (Unit!47363) )
))
(declare-fun lt!618954 () Unit!47362)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96071 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47362)

(assert (=> b!1405182 (= lt!618954 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!618953 () SeekEntryResult!10694)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96071 (_ BitVec 32)) SeekEntryResult!10694)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1405182 (= lt!618953 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46383 a!2901) j!112) mask!2840) (select (arr!46383 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1405183 () Bool)

(declare-fun res!943397 () Bool)

(assert (=> b!1405183 (=> (not res!943397) (not e!795445))))

(declare-datatypes ((List!32902 0))(
  ( (Nil!32899) (Cons!32898 (h!34152 (_ BitVec 64)) (t!47596 List!32902)) )
))
(declare-fun arrayNoDuplicates!0 (array!96071 (_ BitVec 32) List!32902) Bool)

(assert (=> b!1405183 (= res!943397 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32899))))

(declare-fun b!1405184 () Bool)

(declare-fun res!943396 () Bool)

(assert (=> b!1405184 (=> (not res!943396) (not e!795445))))

(assert (=> b!1405184 (= res!943396 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!943399 () Bool)

(assert (=> start!120764 (=> (not res!943399) (not e!795445))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120764 (= res!943399 (validMask!0 mask!2840))))

(assert (=> start!120764 e!795445))

(assert (=> start!120764 true))

(declare-fun array_inv!35411 (array!96071) Bool)

(assert (=> start!120764 (array_inv!35411 a!2901)))

(declare-fun b!1405185 () Bool)

(declare-fun res!943400 () Bool)

(assert (=> b!1405185 (=> (not res!943400) (not e!795445))))

(assert (=> b!1405185 (= res!943400 (and (= (size!46933 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46933 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46933 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!120764 res!943399) b!1405185))

(assert (= (and b!1405185 res!943400) b!1405180))

(assert (= (and b!1405180 res!943398) b!1405181))

(assert (= (and b!1405181 res!943401) b!1405184))

(assert (= (and b!1405184 res!943396) b!1405183))

(assert (= (and b!1405183 res!943397) b!1405182))

(assert (= (and b!1405182 res!943402) b!1405179))

(declare-fun m!1293899 () Bool)

(assert (=> b!1405183 m!1293899))

(declare-fun m!1293901 () Bool)

(assert (=> b!1405184 m!1293901))

(declare-fun m!1293903 () Bool)

(assert (=> b!1405179 m!1293903))

(assert (=> b!1405179 m!1293903))

(declare-fun m!1293905 () Bool)

(assert (=> b!1405179 m!1293905))

(declare-fun m!1293907 () Bool)

(assert (=> start!120764 m!1293907))

(declare-fun m!1293909 () Bool)

(assert (=> start!120764 m!1293909))

(assert (=> b!1405182 m!1293903))

(declare-fun m!1293911 () Bool)

(assert (=> b!1405182 m!1293911))

(assert (=> b!1405182 m!1293903))

(declare-fun m!1293913 () Bool)

(assert (=> b!1405182 m!1293913))

(assert (=> b!1405182 m!1293911))

(assert (=> b!1405182 m!1293903))

(declare-fun m!1293915 () Bool)

(assert (=> b!1405182 m!1293915))

(declare-fun m!1293917 () Bool)

(assert (=> b!1405182 m!1293917))

(assert (=> b!1405181 m!1293903))

(assert (=> b!1405181 m!1293903))

(declare-fun m!1293919 () Bool)

(assert (=> b!1405181 m!1293919))

(declare-fun m!1293921 () Bool)

(assert (=> b!1405180 m!1293921))

(assert (=> b!1405180 m!1293921))

(declare-fun m!1293923 () Bool)

(assert (=> b!1405180 m!1293923))

(check-sat (not b!1405180) (not b!1405182) (not b!1405183) (not start!120764) (not b!1405184) (not b!1405179) (not b!1405181))
