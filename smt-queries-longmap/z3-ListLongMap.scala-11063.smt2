; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129566 () Bool)

(assert start!129566)

(declare-fun b!1518964 () Bool)

(declare-fun e!847653 () Bool)

(declare-fun e!847654 () Bool)

(assert (=> b!1518964 (= e!847653 (not e!847654))))

(declare-fun res!1037507 () Bool)

(assert (=> b!1518964 (=> res!1037507 e!847654)))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-datatypes ((array!101185 0))(
  ( (array!101186 (arr!48823 (Array (_ BitVec 32) (_ BitVec 64))) (size!49374 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101185)

(assert (=> b!1518964 (= res!1037507 (or (not (= (select (arr!48823 a!2804) j!70) (select (store (arr!48823 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(declare-fun e!847652 () Bool)

(assert (=> b!1518964 e!847652))

(declare-fun res!1037515 () Bool)

(assert (=> b!1518964 (=> (not res!1037515) (not e!847652))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101185 (_ BitVec 32)) Bool)

(assert (=> b!1518964 (= res!1037515 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50677 0))(
  ( (Unit!50678) )
))
(declare-fun lt!658358 () Unit!50677)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101185 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50677)

(assert (=> b!1518964 (= lt!658358 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1518965 () Bool)

(declare-datatypes ((SeekEntryResult!12887 0))(
  ( (MissingZero!12887 (index!53943 (_ BitVec 32))) (Found!12887 (index!53944 (_ BitVec 32))) (Intermediate!12887 (undefined!13699 Bool) (index!53945 (_ BitVec 32)) (x!135840 (_ BitVec 32))) (Undefined!12887) (MissingVacant!12887 (index!53946 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!101185 (_ BitVec 32)) SeekEntryResult!12887)

(assert (=> b!1518965 (= e!847652 (= (seekEntry!0 (select (arr!48823 a!2804) j!70) a!2804 mask!2512) (Found!12887 j!70)))))

(declare-fun b!1518966 () Bool)

(declare-fun e!847651 () Bool)

(assert (=> b!1518966 (= e!847651 e!847653)))

(declare-fun res!1037519 () Bool)

(assert (=> b!1518966 (=> (not res!1037519) (not e!847653))))

(declare-fun lt!658359 () SeekEntryResult!12887)

(declare-fun lt!658357 () SeekEntryResult!12887)

(assert (=> b!1518966 (= res!1037519 (= lt!658359 lt!658357))))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1518966 (= lt!658357 (Intermediate!12887 false resIndex!21 resX!21))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101185 (_ BitVec 32)) SeekEntryResult!12887)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1518966 (= lt!658359 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48823 a!2804) j!70) mask!2512) (select (arr!48823 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1518967 () Bool)

(declare-fun res!1037511 () Bool)

(assert (=> b!1518967 (=> (not res!1037511) (not e!847651))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1518967 (= res!1037511 (validKeyInArray!0 (select (arr!48823 a!2804) i!961)))))

(declare-fun b!1518968 () Bool)

(declare-fun res!1037518 () Bool)

(assert (=> b!1518968 (=> (not res!1037518) (not e!847653))))

(assert (=> b!1518968 (= res!1037518 (= lt!658359 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48823 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48823 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101186 (store (arr!48823 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49374 a!2804)) mask!2512)))))

(declare-fun b!1518970 () Bool)

(declare-fun res!1037514 () Bool)

(assert (=> b!1518970 (=> (not res!1037514) (not e!847651))))

(assert (=> b!1518970 (= res!1037514 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1518971 () Bool)

(declare-fun res!1037508 () Bool)

(assert (=> b!1518971 (=> (not res!1037508) (not e!847653))))

(declare-fun index!487 () (_ BitVec 32))

(assert (=> b!1518971 (= res!1037508 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48823 a!2804) j!70) a!2804 mask!2512) lt!658357))))

(declare-fun b!1518972 () Bool)

(declare-fun res!1037517 () Bool)

(assert (=> b!1518972 (=> (not res!1037517) (not e!847651))))

(declare-datatypes ((List!35293 0))(
  ( (Nil!35290) (Cons!35289 (h!36719 (_ BitVec 64)) (t!49979 List!35293)) )
))
(declare-fun arrayNoDuplicates!0 (array!101185 (_ BitVec 32) List!35293) Bool)

(assert (=> b!1518972 (= res!1037517 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35290))))

(declare-fun b!1518973 () Bool)

(declare-fun e!847656 () Bool)

(assert (=> b!1518973 (= e!847654 e!847656)))

(declare-fun res!1037509 () Bool)

(assert (=> b!1518973 (=> res!1037509 e!847656)))

(declare-fun lt!658360 () (_ BitVec 32))

(assert (=> b!1518973 (= res!1037509 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!658360 #b00000000000000000000000000000000) (bvsge lt!658360 (size!49374 a!2804))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1518973 (= lt!658360 (nextIndex!0 index!487 (bvadd #b00000000000000000000000000000001 x!534) mask!2512))))

(declare-fun b!1518974 () Bool)

(assert (=> b!1518974 (= e!847656 true)))

(declare-fun lt!658356 () SeekEntryResult!12887)

(assert (=> b!1518974 (= lt!658356 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!658360 (select (arr!48823 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1518975 () Bool)

(declare-fun res!1037513 () Bool)

(assert (=> b!1518975 (=> (not res!1037513) (not e!847651))))

(assert (=> b!1518975 (= res!1037513 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49374 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49374 a!2804))))))

(declare-fun b!1518976 () Bool)

(declare-fun res!1037510 () Bool)

(assert (=> b!1518976 (=> (not res!1037510) (not e!847651))))

(assert (=> b!1518976 (= res!1037510 (validKeyInArray!0 (select (arr!48823 a!2804) j!70)))))

(declare-fun b!1518969 () Bool)

(declare-fun res!1037512 () Bool)

(assert (=> b!1518969 (=> (not res!1037512) (not e!847651))))

(assert (=> b!1518969 (= res!1037512 (and (= (size!49374 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49374 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49374 a!2804)) (not (= i!961 j!70))))))

(declare-fun res!1037516 () Bool)

(assert (=> start!129566 (=> (not res!1037516) (not e!847651))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129566 (= res!1037516 (validMask!0 mask!2512))))

(assert (=> start!129566 e!847651))

(assert (=> start!129566 true))

(declare-fun array_inv!38104 (array!101185) Bool)

(assert (=> start!129566 (array_inv!38104 a!2804)))

(assert (= (and start!129566 res!1037516) b!1518969))

(assert (= (and b!1518969 res!1037512) b!1518967))

(assert (= (and b!1518967 res!1037511) b!1518976))

(assert (= (and b!1518976 res!1037510) b!1518970))

(assert (= (and b!1518970 res!1037514) b!1518972))

(assert (= (and b!1518972 res!1037517) b!1518975))

(assert (= (and b!1518975 res!1037513) b!1518966))

(assert (= (and b!1518966 res!1037519) b!1518971))

(assert (= (and b!1518971 res!1037508) b!1518968))

(assert (= (and b!1518968 res!1037518) b!1518964))

(assert (= (and b!1518964 res!1037515) b!1518965))

(assert (= (and b!1518964 (not res!1037507)) b!1518973))

(assert (= (and b!1518973 (not res!1037509)) b!1518974))

(declare-fun m!1402089 () Bool)

(assert (=> b!1518971 m!1402089))

(assert (=> b!1518971 m!1402089))

(declare-fun m!1402091 () Bool)

(assert (=> b!1518971 m!1402091))

(assert (=> b!1518976 m!1402089))

(assert (=> b!1518976 m!1402089))

(declare-fun m!1402093 () Bool)

(assert (=> b!1518976 m!1402093))

(declare-fun m!1402095 () Bool)

(assert (=> b!1518967 m!1402095))

(assert (=> b!1518967 m!1402095))

(declare-fun m!1402097 () Bool)

(assert (=> b!1518967 m!1402097))

(declare-fun m!1402099 () Bool)

(assert (=> b!1518970 m!1402099))

(declare-fun m!1402101 () Bool)

(assert (=> b!1518968 m!1402101))

(declare-fun m!1402103 () Bool)

(assert (=> b!1518968 m!1402103))

(assert (=> b!1518968 m!1402103))

(declare-fun m!1402105 () Bool)

(assert (=> b!1518968 m!1402105))

(assert (=> b!1518968 m!1402105))

(assert (=> b!1518968 m!1402103))

(declare-fun m!1402107 () Bool)

(assert (=> b!1518968 m!1402107))

(declare-fun m!1402109 () Bool)

(assert (=> b!1518973 m!1402109))

(declare-fun m!1402111 () Bool)

(assert (=> start!129566 m!1402111))

(declare-fun m!1402113 () Bool)

(assert (=> start!129566 m!1402113))

(assert (=> b!1518966 m!1402089))

(assert (=> b!1518966 m!1402089))

(declare-fun m!1402115 () Bool)

(assert (=> b!1518966 m!1402115))

(assert (=> b!1518966 m!1402115))

(assert (=> b!1518966 m!1402089))

(declare-fun m!1402117 () Bool)

(assert (=> b!1518966 m!1402117))

(assert (=> b!1518965 m!1402089))

(assert (=> b!1518965 m!1402089))

(declare-fun m!1402119 () Bool)

(assert (=> b!1518965 m!1402119))

(assert (=> b!1518974 m!1402089))

(assert (=> b!1518974 m!1402089))

(declare-fun m!1402121 () Bool)

(assert (=> b!1518974 m!1402121))

(declare-fun m!1402123 () Bool)

(assert (=> b!1518972 m!1402123))

(assert (=> b!1518964 m!1402089))

(declare-fun m!1402125 () Bool)

(assert (=> b!1518964 m!1402125))

(assert (=> b!1518964 m!1402101))

(assert (=> b!1518964 m!1402103))

(declare-fun m!1402127 () Bool)

(assert (=> b!1518964 m!1402127))

(check-sat (not b!1518964) (not start!129566) (not b!1518973) (not b!1518971) (not b!1518970) (not b!1518976) (not b!1518966) (not b!1518965) (not b!1518967) (not b!1518968) (not b!1518972) (not b!1518974))
(check-sat)
