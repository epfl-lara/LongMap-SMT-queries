; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130128 () Bool)

(assert start!130128)

(declare-fun b!1525078 () Bool)

(declare-fun res!1042499 () Bool)

(declare-fun e!850521 () Bool)

(assert (=> b!1525078 (=> (not res!1042499) (not e!850521))))

(declare-datatypes ((array!101461 0))(
  ( (array!101462 (arr!48955 (Array (_ BitVec 32) (_ BitVec 64))) (size!49506 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101461)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1525078 (= res!1042499 (validKeyInArray!0 (select (arr!48955 a!2804) j!70)))))

(declare-fun b!1525079 () Bool)

(declare-fun res!1042502 () Bool)

(declare-fun e!850519 () Bool)

(assert (=> b!1525079 (=> (not res!1042502) (not e!850519))))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13013 0))(
  ( (MissingZero!13013 (index!54447 (_ BitVec 32))) (Found!13013 (index!54448 (_ BitVec 32))) (Intermediate!13013 (undefined!13825 Bool) (index!54449 (_ BitVec 32)) (x!136354 (_ BitVec 32))) (Undefined!13013) (MissingVacant!13013 (index!54450 (_ BitVec 32))) )
))
(declare-fun lt!660649 () SeekEntryResult!13013)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101461 (_ BitVec 32)) SeekEntryResult!13013)

(assert (=> b!1525079 (= res!1042502 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48955 a!2804) j!70) a!2804 mask!2512) lt!660649))))

(declare-fun b!1525080 () Bool)

(declare-fun res!1042509 () Bool)

(assert (=> b!1525080 (=> (not res!1042509) (not e!850521))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1525080 (= res!1042509 (validKeyInArray!0 (select (arr!48955 a!2804) i!961)))))

(declare-fun b!1525081 () Bool)

(declare-fun e!850520 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101461 (_ BitVec 32)) SeekEntryResult!13013)

(assert (=> b!1525081 (= e!850520 (= (seekEntry!0 (select (arr!48955 a!2804) j!70) a!2804 mask!2512) (Found!13013 j!70)))))

(declare-fun b!1525082 () Bool)

(assert (=> b!1525082 (= e!850519 (not true))))

(assert (=> b!1525082 e!850520))

(declare-fun res!1042500 () Bool)

(assert (=> b!1525082 (=> (not res!1042500) (not e!850520))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101461 (_ BitVec 32)) Bool)

(assert (=> b!1525082 (= res!1042500 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50845 0))(
  ( (Unit!50846) )
))
(declare-fun lt!660651 () Unit!50845)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101461 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50845)

(assert (=> b!1525082 (= lt!660651 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1525083 () Bool)

(declare-fun res!1042501 () Bool)

(assert (=> b!1525083 (=> (not res!1042501) (not e!850521))))

(assert (=> b!1525083 (= res!1042501 (and (= (size!49506 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49506 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49506 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1525084 () Bool)

(declare-fun res!1042506 () Bool)

(assert (=> b!1525084 (=> (not res!1042506) (not e!850521))))

(assert (=> b!1525084 (= res!1042506 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun res!1042503 () Bool)

(assert (=> start!130128 (=> (not res!1042503) (not e!850521))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130128 (= res!1042503 (validMask!0 mask!2512))))

(assert (=> start!130128 e!850521))

(assert (=> start!130128 true))

(declare-fun array_inv!38236 (array!101461) Bool)

(assert (=> start!130128 (array_inv!38236 a!2804)))

(declare-fun b!1525085 () Bool)

(declare-fun res!1042504 () Bool)

(assert (=> b!1525085 (=> (not res!1042504) (not e!850521))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1525085 (= res!1042504 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49506 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49506 a!2804))))))

(declare-fun b!1525086 () Bool)

(assert (=> b!1525086 (= e!850521 e!850519)))

(declare-fun res!1042507 () Bool)

(assert (=> b!1525086 (=> (not res!1042507) (not e!850519))))

(declare-fun lt!660650 () SeekEntryResult!13013)

(assert (=> b!1525086 (= res!1042507 (= lt!660650 lt!660649))))

(assert (=> b!1525086 (= lt!660649 (Intermediate!13013 false resIndex!21 resX!21))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1525086 (= lt!660650 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48955 a!2804) j!70) mask!2512) (select (arr!48955 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1525087 () Bool)

(declare-fun res!1042505 () Bool)

(assert (=> b!1525087 (=> (not res!1042505) (not e!850519))))

(assert (=> b!1525087 (= res!1042505 (= lt!660650 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48955 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48955 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101462 (store (arr!48955 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49506 a!2804)) mask!2512)))))

(declare-fun b!1525088 () Bool)

(declare-fun res!1042508 () Bool)

(assert (=> b!1525088 (=> (not res!1042508) (not e!850521))))

(declare-datatypes ((List!35425 0))(
  ( (Nil!35422) (Cons!35421 (h!36863 (_ BitVec 64)) (t!50111 List!35425)) )
))
(declare-fun arrayNoDuplicates!0 (array!101461 (_ BitVec 32) List!35425) Bool)

(assert (=> b!1525088 (= res!1042508 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35422))))

(assert (= (and start!130128 res!1042503) b!1525083))

(assert (= (and b!1525083 res!1042501) b!1525080))

(assert (= (and b!1525080 res!1042509) b!1525078))

(assert (= (and b!1525078 res!1042499) b!1525084))

(assert (= (and b!1525084 res!1042506) b!1525088))

(assert (= (and b!1525088 res!1042508) b!1525085))

(assert (= (and b!1525085 res!1042504) b!1525086))

(assert (= (and b!1525086 res!1042507) b!1525079))

(assert (= (and b!1525079 res!1042502) b!1525087))

(assert (= (and b!1525087 res!1042505) b!1525082))

(assert (= (and b!1525082 res!1042500) b!1525081))

(declare-fun m!1407985 () Bool)

(assert (=> b!1525088 m!1407985))

(declare-fun m!1407987 () Bool)

(assert (=> b!1525084 m!1407987))

(declare-fun m!1407989 () Bool)

(assert (=> b!1525081 m!1407989))

(assert (=> b!1525081 m!1407989))

(declare-fun m!1407991 () Bool)

(assert (=> b!1525081 m!1407991))

(assert (=> b!1525078 m!1407989))

(assert (=> b!1525078 m!1407989))

(declare-fun m!1407993 () Bool)

(assert (=> b!1525078 m!1407993))

(assert (=> b!1525086 m!1407989))

(assert (=> b!1525086 m!1407989))

(declare-fun m!1407995 () Bool)

(assert (=> b!1525086 m!1407995))

(assert (=> b!1525086 m!1407995))

(assert (=> b!1525086 m!1407989))

(declare-fun m!1407997 () Bool)

(assert (=> b!1525086 m!1407997))

(assert (=> b!1525079 m!1407989))

(assert (=> b!1525079 m!1407989))

(declare-fun m!1407999 () Bool)

(assert (=> b!1525079 m!1407999))

(declare-fun m!1408001 () Bool)

(assert (=> b!1525082 m!1408001))

(declare-fun m!1408003 () Bool)

(assert (=> b!1525082 m!1408003))

(declare-fun m!1408005 () Bool)

(assert (=> b!1525080 m!1408005))

(assert (=> b!1525080 m!1408005))

(declare-fun m!1408007 () Bool)

(assert (=> b!1525080 m!1408007))

(declare-fun m!1408009 () Bool)

(assert (=> start!130128 m!1408009))

(declare-fun m!1408011 () Bool)

(assert (=> start!130128 m!1408011))

(declare-fun m!1408013 () Bool)

(assert (=> b!1525087 m!1408013))

(declare-fun m!1408015 () Bool)

(assert (=> b!1525087 m!1408015))

(assert (=> b!1525087 m!1408015))

(declare-fun m!1408017 () Bool)

(assert (=> b!1525087 m!1408017))

(assert (=> b!1525087 m!1408017))

(assert (=> b!1525087 m!1408015))

(declare-fun m!1408019 () Bool)

(assert (=> b!1525087 m!1408019))

(check-sat (not b!1525084) (not b!1525086) (not b!1525079) (not start!130128) (not b!1525081) (not b!1525087) (not b!1525078) (not b!1525082) (not b!1525088) (not b!1525080))
(check-sat)
