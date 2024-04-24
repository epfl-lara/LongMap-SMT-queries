; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120690 () Bool)

(assert start!120690)

(declare-fun b!1404290 () Bool)

(declare-fun e!795236 () Bool)

(assert (=> b!1404290 (= e!795236 true)))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96021 0))(
  ( (array!96022 (arr!46359 (Array (_ BitVec 32) (_ BitVec 64))) (size!46910 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96021)

(declare-fun i!1037 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10579 0))(
  ( (MissingZero!10579 (index!44693 (_ BitVec 32))) (Found!10579 (index!44694 (_ BitVec 32))) (Intermediate!10579 (undefined!11391 Bool) (index!44695 (_ BitVec 32)) (x!126457 (_ BitVec 32))) (Undefined!10579) (MissingVacant!10579 (index!44696 (_ BitVec 32))) )
))
(declare-fun lt!618690 () SeekEntryResult!10579)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96021 (_ BitVec 32)) SeekEntryResult!10579)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1404290 (= lt!618690 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46359 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46359 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96022 (store (arr!46359 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46910 a!2901)) mask!2840))))

(declare-fun b!1404291 () Bool)

(declare-fun res!942120 () Bool)

(declare-fun e!795237 () Bool)

(assert (=> b!1404291 (=> (not res!942120) (not e!795237))))

(assert (=> b!1404291 (= res!942120 (and (= (size!46910 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46910 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46910 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1404292 () Bool)

(declare-fun res!942117 () Bool)

(assert (=> b!1404292 (=> (not res!942117) (not e!795237))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1404292 (= res!942117 (validKeyInArray!0 (select (arr!46359 a!2901) i!1037)))))

(declare-fun b!1404293 () Bool)

(declare-fun res!942119 () Bool)

(assert (=> b!1404293 (=> (not res!942119) (not e!795237))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96021 (_ BitVec 32)) Bool)

(assert (=> b!1404293 (= res!942119 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1404294 () Bool)

(declare-fun res!942118 () Bool)

(assert (=> b!1404294 (=> (not res!942118) (not e!795237))))

(assert (=> b!1404294 (= res!942118 (validKeyInArray!0 (select (arr!46359 a!2901) j!112)))))

(declare-fun b!1404295 () Bool)

(declare-fun res!942121 () Bool)

(assert (=> b!1404295 (=> (not res!942121) (not e!795237))))

(declare-datatypes ((List!32865 0))(
  ( (Nil!32862) (Cons!32861 (h!34117 (_ BitVec 64)) (t!47551 List!32865)) )
))
(declare-fun arrayNoDuplicates!0 (array!96021 (_ BitVec 32) List!32865) Bool)

(assert (=> b!1404295 (= res!942121 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32862))))

(declare-fun res!942123 () Bool)

(assert (=> start!120690 (=> (not res!942123) (not e!795237))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120690 (= res!942123 (validMask!0 mask!2840))))

(assert (=> start!120690 e!795237))

(assert (=> start!120690 true))

(declare-fun array_inv!35640 (array!96021) Bool)

(assert (=> start!120690 (array_inv!35640 a!2901)))

(declare-fun b!1404296 () Bool)

(assert (=> b!1404296 (= e!795237 (not e!795236))))

(declare-fun res!942122 () Bool)

(assert (=> b!1404296 (=> res!942122 e!795236)))

(declare-fun lt!618691 () SeekEntryResult!10579)

(assert (=> b!1404296 (= res!942122 (or (not (is-Intermediate!10579 lt!618691)) (undefined!11391 lt!618691)))))

(declare-fun e!795238 () Bool)

(assert (=> b!1404296 e!795238))

(declare-fun res!942124 () Bool)

(assert (=> b!1404296 (=> (not res!942124) (not e!795238))))

(assert (=> b!1404296 (= res!942124 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47189 0))(
  ( (Unit!47190) )
))
(declare-fun lt!618692 () Unit!47189)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96021 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47189)

(assert (=> b!1404296 (= lt!618692 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1404296 (= lt!618691 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46359 a!2901) j!112) mask!2840) (select (arr!46359 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1404297 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96021 (_ BitVec 32)) SeekEntryResult!10579)

(assert (=> b!1404297 (= e!795238 (= (seekEntryOrOpen!0 (select (arr!46359 a!2901) j!112) a!2901 mask!2840) (Found!10579 j!112)))))

(assert (= (and start!120690 res!942123) b!1404291))

(assert (= (and b!1404291 res!942120) b!1404292))

(assert (= (and b!1404292 res!942117) b!1404294))

(assert (= (and b!1404294 res!942118) b!1404293))

(assert (= (and b!1404293 res!942119) b!1404295))

(assert (= (and b!1404295 res!942121) b!1404296))

(assert (= (and b!1404296 res!942124) b!1404297))

(assert (= (and b!1404296 (not res!942122)) b!1404290))

(declare-fun m!1293039 () Bool)

(assert (=> b!1404293 m!1293039))

(declare-fun m!1293041 () Bool)

(assert (=> b!1404297 m!1293041))

(assert (=> b!1404297 m!1293041))

(declare-fun m!1293043 () Bool)

(assert (=> b!1404297 m!1293043))

(declare-fun m!1293045 () Bool)

(assert (=> b!1404295 m!1293045))

(assert (=> b!1404296 m!1293041))

(declare-fun m!1293047 () Bool)

(assert (=> b!1404296 m!1293047))

(assert (=> b!1404296 m!1293041))

(declare-fun m!1293049 () Bool)

(assert (=> b!1404296 m!1293049))

(assert (=> b!1404296 m!1293047))

(assert (=> b!1404296 m!1293041))

(declare-fun m!1293051 () Bool)

(assert (=> b!1404296 m!1293051))

(declare-fun m!1293053 () Bool)

(assert (=> b!1404296 m!1293053))

(declare-fun m!1293055 () Bool)

(assert (=> b!1404290 m!1293055))

(declare-fun m!1293057 () Bool)

(assert (=> b!1404290 m!1293057))

(assert (=> b!1404290 m!1293057))

(declare-fun m!1293059 () Bool)

(assert (=> b!1404290 m!1293059))

(assert (=> b!1404290 m!1293059))

(assert (=> b!1404290 m!1293057))

(declare-fun m!1293061 () Bool)

(assert (=> b!1404290 m!1293061))

(declare-fun m!1293063 () Bool)

(assert (=> b!1404292 m!1293063))

(assert (=> b!1404292 m!1293063))

(declare-fun m!1293065 () Bool)

(assert (=> b!1404292 m!1293065))

(assert (=> b!1404294 m!1293041))

(assert (=> b!1404294 m!1293041))

(declare-fun m!1293067 () Bool)

(assert (=> b!1404294 m!1293067))

(declare-fun m!1293069 () Bool)

(assert (=> start!120690 m!1293069))

(declare-fun m!1293071 () Bool)

(assert (=> start!120690 m!1293071))

(push 1)

(assert (not b!1404296))

(assert (not b!1404290))

(assert (not b!1404292))

(assert (not b!1404295))

(assert (not b!1404293))

(assert (not b!1404294))

(assert (not start!120690))

(assert (not b!1404297))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

