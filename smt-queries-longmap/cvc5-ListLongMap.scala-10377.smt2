; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122184 () Bool)

(assert start!122184)

(declare-fun b!1417446 () Bool)

(declare-fun res!953176 () Bool)

(declare-fun e!802212 () Bool)

(assert (=> b!1417446 (=> (not res!953176) (not e!802212))))

(declare-datatypes ((array!96768 0))(
  ( (array!96769 (arr!46712 (Array (_ BitVec 32) (_ BitVec 64))) (size!47262 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96768)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1417446 (= res!953176 (validKeyInArray!0 (select (arr!46712 a!2901) j!112)))))

(declare-fun b!1417447 () Bool)

(declare-fun res!953179 () Bool)

(assert (=> b!1417447 (=> (not res!953179) (not e!802212))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1417447 (= res!953179 (and (= (size!47262 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47262 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47262 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!953180 () Bool)

(assert (=> start!122184 (=> (not res!953180) (not e!802212))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122184 (= res!953180 (validMask!0 mask!2840))))

(assert (=> start!122184 e!802212))

(assert (=> start!122184 true))

(declare-fun array_inv!35740 (array!96768) Bool)

(assert (=> start!122184 (array_inv!35740 a!2901)))

(declare-fun b!1417448 () Bool)

(declare-fun e!802213 () Bool)

(declare-datatypes ((SeekEntryResult!11023 0))(
  ( (MissingZero!11023 (index!46484 (_ BitVec 32))) (Found!11023 (index!46485 (_ BitVec 32))) (Intermediate!11023 (undefined!11835 Bool) (index!46486 (_ BitVec 32)) (x!128090 (_ BitVec 32))) (Undefined!11023) (MissingVacant!11023 (index!46487 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96768 (_ BitVec 32)) SeekEntryResult!11023)

(assert (=> b!1417448 (= e!802213 (= (seekEntryOrOpen!0 (select (arr!46712 a!2901) j!112) a!2901 mask!2840) (Found!11023 j!112)))))

(declare-fun b!1417449 () Bool)

(declare-fun res!953178 () Bool)

(assert (=> b!1417449 (=> (not res!953178) (not e!802212))))

(assert (=> b!1417449 (= res!953178 (validKeyInArray!0 (select (arr!46712 a!2901) i!1037)))))

(declare-fun b!1417450 () Bool)

(declare-fun res!953177 () Bool)

(assert (=> b!1417450 (=> (not res!953177) (not e!802212))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96768 (_ BitVec 32)) Bool)

(assert (=> b!1417450 (= res!953177 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1417451 () Bool)

(declare-fun res!953182 () Bool)

(assert (=> b!1417451 (=> (not res!953182) (not e!802212))))

(declare-datatypes ((List!33231 0))(
  ( (Nil!33228) (Cons!33227 (h!34520 (_ BitVec 64)) (t!47925 List!33231)) )
))
(declare-fun arrayNoDuplicates!0 (array!96768 (_ BitVec 32) List!33231) Bool)

(assert (=> b!1417451 (= res!953182 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33228))))

(declare-fun b!1417452 () Bool)

(assert (=> b!1417452 (= e!802212 (not true))))

(assert (=> b!1417452 e!802213))

(declare-fun res!953181 () Bool)

(assert (=> b!1417452 (=> (not res!953181) (not e!802213))))

(assert (=> b!1417452 (= res!953181 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!48020 0))(
  ( (Unit!48021) )
))
(declare-fun lt!625374 () Unit!48020)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96768 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48020)

(assert (=> b!1417452 (= lt!625374 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!625373 () SeekEntryResult!11023)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96768 (_ BitVec 32)) SeekEntryResult!11023)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1417452 (= lt!625373 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46712 a!2901) j!112) mask!2840) (select (arr!46712 a!2901) j!112) a!2901 mask!2840))))

(assert (= (and start!122184 res!953180) b!1417447))

(assert (= (and b!1417447 res!953179) b!1417449))

(assert (= (and b!1417449 res!953178) b!1417446))

(assert (= (and b!1417446 res!953176) b!1417450))

(assert (= (and b!1417450 res!953177) b!1417451))

(assert (= (and b!1417451 res!953182) b!1417452))

(assert (= (and b!1417452 res!953181) b!1417448))

(declare-fun m!1308165 () Bool)

(assert (=> b!1417449 m!1308165))

(assert (=> b!1417449 m!1308165))

(declare-fun m!1308167 () Bool)

(assert (=> b!1417449 m!1308167))

(declare-fun m!1308169 () Bool)

(assert (=> b!1417452 m!1308169))

(declare-fun m!1308171 () Bool)

(assert (=> b!1417452 m!1308171))

(assert (=> b!1417452 m!1308169))

(declare-fun m!1308173 () Bool)

(assert (=> b!1417452 m!1308173))

(assert (=> b!1417452 m!1308171))

(assert (=> b!1417452 m!1308169))

(declare-fun m!1308175 () Bool)

(assert (=> b!1417452 m!1308175))

(declare-fun m!1308177 () Bool)

(assert (=> b!1417452 m!1308177))

(assert (=> b!1417446 m!1308169))

(assert (=> b!1417446 m!1308169))

(declare-fun m!1308179 () Bool)

(assert (=> b!1417446 m!1308179))

(declare-fun m!1308181 () Bool)

(assert (=> b!1417450 m!1308181))

(declare-fun m!1308183 () Bool)

(assert (=> b!1417451 m!1308183))

(assert (=> b!1417448 m!1308169))

(assert (=> b!1417448 m!1308169))

(declare-fun m!1308185 () Bool)

(assert (=> b!1417448 m!1308185))

(declare-fun m!1308187 () Bool)

(assert (=> start!122184 m!1308187))

(declare-fun m!1308189 () Bool)

(assert (=> start!122184 m!1308189))

(push 1)

(assert (not b!1417446))

(assert (not b!1417452))

(assert (not start!122184))

(assert (not b!1417448))

(assert (not b!1417450))

(assert (not b!1417449))

(assert (not b!1417451))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

