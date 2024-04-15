; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130218 () Bool)

(assert start!130218)

(declare-fun b!1529075 () Bool)

(declare-fun res!1046976 () Bool)

(declare-fun e!852111 () Bool)

(assert (=> b!1529075 (=> (not res!1046976) (not e!852111))))

(declare-datatypes ((array!101566 0))(
  ( (array!101567 (arr!49009 (Array (_ BitVec 32) (_ BitVec 64))) (size!49561 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101566)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101566 (_ BitVec 32)) Bool)

(assert (=> b!1529075 (= res!1046976 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1529076 () Bool)

(declare-fun res!1046967 () Bool)

(assert (=> b!1529076 (=> (not res!1046967) (not e!852111))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1529076 (= res!1046967 (validKeyInArray!0 (select (arr!49009 a!2804) i!961)))))

(declare-fun b!1529077 () Bool)

(declare-fun res!1046973 () Bool)

(assert (=> b!1529077 (=> (not res!1046973) (not e!852111))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(assert (=> b!1529077 (= res!1046973 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49561 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49561 a!2804))))))

(declare-fun b!1529078 () Bool)

(declare-fun e!852113 () Bool)

(declare-fun e!852112 () Bool)

(assert (=> b!1529078 (= e!852113 (not e!852112))))

(declare-fun res!1046968 () Bool)

(assert (=> b!1529078 (=> res!1046968 e!852112)))

(declare-fun j!70 () (_ BitVec 32))

(assert (=> b!1529078 (= res!1046968 (or (not (= (select (arr!49009 a!2804) j!70) (select (store (arr!49009 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(declare-fun e!852115 () Bool)

(assert (=> b!1529078 e!852115))

(declare-fun res!1046971 () Bool)

(assert (=> b!1529078 (=> (not res!1046971) (not e!852115))))

(assert (=> b!1529078 (= res!1046971 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51017 0))(
  ( (Unit!51018) )
))
(declare-fun lt!662133 () Unit!51017)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101566 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51017)

(assert (=> b!1529078 (= lt!662133 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1529079 () Bool)

(declare-fun res!1046977 () Bool)

(assert (=> b!1529079 (=> (not res!1046977) (not e!852113))))

(declare-datatypes ((SeekEntryResult!13197 0))(
  ( (MissingZero!13197 (index!55183 (_ BitVec 32))) (Found!13197 (index!55184 (_ BitVec 32))) (Intermediate!13197 (undefined!14009 Bool) (index!55185 (_ BitVec 32)) (x!136871 (_ BitVec 32))) (Undefined!13197) (MissingVacant!13197 (index!55186 (_ BitVec 32))) )
))
(declare-fun lt!662132 () SeekEntryResult!13197)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101566 (_ BitVec 32)) SeekEntryResult!13197)

(assert (=> b!1529079 (= res!1046977 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49009 a!2804) j!70) a!2804 mask!2512) lt!662132))))

(declare-fun b!1529080 () Bool)

(declare-fun res!1046970 () Bool)

(assert (=> b!1529080 (=> (not res!1046970) (not e!852111))))

(assert (=> b!1529080 (= res!1046970 (and (= (size!49561 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49561 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49561 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1529081 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101566 (_ BitVec 32)) SeekEntryResult!13197)

(assert (=> b!1529081 (= e!852115 (= (seekEntry!0 (select (arr!49009 a!2804) j!70) a!2804 mask!2512) (Found!13197 j!70)))))

(declare-fun b!1529082 () Bool)

(declare-fun res!1046975 () Bool)

(assert (=> b!1529082 (=> (not res!1046975) (not e!852111))))

(declare-datatypes ((List!35570 0))(
  ( (Nil!35567) (Cons!35566 (h!37003 (_ BitVec 64)) (t!50256 List!35570)) )
))
(declare-fun arrayNoDuplicates!0 (array!101566 (_ BitVec 32) List!35570) Bool)

(assert (=> b!1529082 (= res!1046975 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35567))))

(declare-fun b!1529083 () Bool)

(declare-fun res!1046966 () Bool)

(assert (=> b!1529083 (=> (not res!1046966) (not e!852113))))

(declare-fun lt!662130 () SeekEntryResult!13197)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1529083 (= res!1046966 (= lt!662130 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!49009 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!49009 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101567 (store (arr!49009 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49561 a!2804)) mask!2512)))))

(declare-fun b!1529084 () Bool)

(declare-fun res!1046969 () Bool)

(assert (=> b!1529084 (=> (not res!1046969) (not e!852111))))

(assert (=> b!1529084 (= res!1046969 (validKeyInArray!0 (select (arr!49009 a!2804) j!70)))))

(declare-fun b!1529085 () Bool)

(assert (=> b!1529085 (= e!852111 e!852113)))

(declare-fun res!1046972 () Bool)

(assert (=> b!1529085 (=> (not res!1046972) (not e!852113))))

(assert (=> b!1529085 (= res!1046972 (= lt!662130 lt!662132))))

(assert (=> b!1529085 (= lt!662132 (Intermediate!13197 false resIndex!21 resX!21))))

(assert (=> b!1529085 (= lt!662130 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49009 a!2804) j!70) mask!2512) (select (arr!49009 a!2804) j!70) a!2804 mask!2512))))

(declare-fun res!1046974 () Bool)

(assert (=> start!130218 (=> (not res!1046974) (not e!852111))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130218 (= res!1046974 (validMask!0 mask!2512))))

(assert (=> start!130218 e!852111))

(assert (=> start!130218 true))

(declare-fun array_inv!38242 (array!101566) Bool)

(assert (=> start!130218 (array_inv!38242 a!2804)))

(declare-fun b!1529086 () Bool)

(assert (=> b!1529086 (= e!852112 true)))

(declare-fun lt!662131 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1529086 (= lt!662131 (nextIndex!0 index!487 x!534 mask!2512))))

(assert (= (and start!130218 res!1046974) b!1529080))

(assert (= (and b!1529080 res!1046970) b!1529076))

(assert (= (and b!1529076 res!1046967) b!1529084))

(assert (= (and b!1529084 res!1046969) b!1529075))

(assert (= (and b!1529075 res!1046976) b!1529082))

(assert (= (and b!1529082 res!1046975) b!1529077))

(assert (= (and b!1529077 res!1046973) b!1529085))

(assert (= (and b!1529085 res!1046972) b!1529079))

(assert (= (and b!1529079 res!1046977) b!1529083))

(assert (= (and b!1529083 res!1046966) b!1529078))

(assert (= (and b!1529078 res!1046971) b!1529081))

(assert (= (and b!1529078 (not res!1046968)) b!1529086))

(declare-fun m!1411439 () Bool)

(assert (=> b!1529084 m!1411439))

(assert (=> b!1529084 m!1411439))

(declare-fun m!1411441 () Bool)

(assert (=> b!1529084 m!1411441))

(declare-fun m!1411443 () Bool)

(assert (=> b!1529086 m!1411443))

(assert (=> b!1529079 m!1411439))

(assert (=> b!1529079 m!1411439))

(declare-fun m!1411445 () Bool)

(assert (=> b!1529079 m!1411445))

(declare-fun m!1411447 () Bool)

(assert (=> b!1529076 m!1411447))

(assert (=> b!1529076 m!1411447))

(declare-fun m!1411449 () Bool)

(assert (=> b!1529076 m!1411449))

(declare-fun m!1411451 () Bool)

(assert (=> b!1529082 m!1411451))

(assert (=> b!1529078 m!1411439))

(declare-fun m!1411453 () Bool)

(assert (=> b!1529078 m!1411453))

(declare-fun m!1411455 () Bool)

(assert (=> b!1529078 m!1411455))

(declare-fun m!1411457 () Bool)

(assert (=> b!1529078 m!1411457))

(declare-fun m!1411459 () Bool)

(assert (=> b!1529078 m!1411459))

(assert (=> b!1529085 m!1411439))

(assert (=> b!1529085 m!1411439))

(declare-fun m!1411461 () Bool)

(assert (=> b!1529085 m!1411461))

(assert (=> b!1529085 m!1411461))

(assert (=> b!1529085 m!1411439))

(declare-fun m!1411463 () Bool)

(assert (=> b!1529085 m!1411463))

(declare-fun m!1411465 () Bool)

(assert (=> b!1529075 m!1411465))

(declare-fun m!1411467 () Bool)

(assert (=> start!130218 m!1411467))

(declare-fun m!1411469 () Bool)

(assert (=> start!130218 m!1411469))

(assert (=> b!1529083 m!1411455))

(assert (=> b!1529083 m!1411457))

(assert (=> b!1529083 m!1411457))

(declare-fun m!1411471 () Bool)

(assert (=> b!1529083 m!1411471))

(assert (=> b!1529083 m!1411471))

(assert (=> b!1529083 m!1411457))

(declare-fun m!1411473 () Bool)

(assert (=> b!1529083 m!1411473))

(assert (=> b!1529081 m!1411439))

(assert (=> b!1529081 m!1411439))

(declare-fun m!1411475 () Bool)

(assert (=> b!1529081 m!1411475))

(check-sat (not b!1529086) (not b!1529075) (not b!1529076) (not b!1529078) (not b!1529084) (not b!1529085) (not start!130218) (not b!1529083) (not b!1529079) (not b!1529081) (not b!1529082))
(check-sat)
