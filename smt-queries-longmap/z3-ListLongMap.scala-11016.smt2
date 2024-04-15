; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128876 () Bool)

(assert start!128876)

(declare-fun e!843560 () Bool)

(declare-fun b!1510962 () Bool)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!100732 0))(
  ( (array!100733 (arr!48604 (Array (_ BitVec 32) (_ BitVec 64))) (size!49156 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100732)

(declare-datatypes ((SeekEntryResult!12798 0))(
  ( (MissingZero!12798 (index!53587 (_ BitVec 32))) (Found!12798 (index!53588 (_ BitVec 32))) (Intermediate!12798 (undefined!13610 Bool) (index!53589 (_ BitVec 32)) (x!135326 (_ BitVec 32))) (Undefined!12798) (MissingVacant!12798 (index!53590 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!100732 (_ BitVec 32)) SeekEntryResult!12798)

(assert (=> b!1510962 (= e!843560 (= (seekEntry!0 (select (arr!48604 a!2804) j!70) a!2804 mask!2512) (Found!12798 j!70)))))

(declare-fun b!1510963 () Bool)

(declare-fun e!843558 () Bool)

(declare-fun e!843561 () Bool)

(assert (=> b!1510963 (= e!843558 e!843561)))

(declare-fun res!1031078 () Bool)

(assert (=> b!1510963 (=> (not res!1031078) (not e!843561))))

(declare-fun lt!655108 () SeekEntryResult!12798)

(declare-fun lt!655110 () SeekEntryResult!12798)

(assert (=> b!1510963 (= res!1031078 (= lt!655108 lt!655110))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1510963 (= lt!655110 (Intermediate!12798 false resIndex!21 resX!21))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100732 (_ BitVec 32)) SeekEntryResult!12798)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1510963 (= lt!655108 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48604 a!2804) j!70) mask!2512) (select (arr!48604 a!2804) j!70) a!2804 mask!2512))))

(declare-fun res!1031080 () Bool)

(assert (=> start!128876 (=> (not res!1031080) (not e!843558))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128876 (= res!1031080 (validMask!0 mask!2512))))

(assert (=> start!128876 e!843558))

(assert (=> start!128876 true))

(declare-fun array_inv!37837 (array!100732) Bool)

(assert (=> start!128876 (array_inv!37837 a!2804)))

(declare-fun b!1510964 () Bool)

(declare-fun res!1031074 () Bool)

(assert (=> b!1510964 (=> (not res!1031074) (not e!843558))))

(declare-datatypes ((List!35165 0))(
  ( (Nil!35162) (Cons!35161 (h!36574 (_ BitVec 64)) (t!49851 List!35165)) )
))
(declare-fun arrayNoDuplicates!0 (array!100732 (_ BitVec 32) List!35165) Bool)

(assert (=> b!1510964 (= res!1031074 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35162))))

(declare-fun b!1510965 () Bool)

(declare-fun res!1031077 () Bool)

(assert (=> b!1510965 (=> (not res!1031077) (not e!843558))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1510965 (= res!1031077 (validKeyInArray!0 (select (arr!48604 a!2804) i!961)))))

(declare-fun b!1510966 () Bool)

(declare-fun res!1031072 () Bool)

(assert (=> b!1510966 (=> (not res!1031072) (not e!843558))))

(assert (=> b!1510966 (= res!1031072 (validKeyInArray!0 (select (arr!48604 a!2804) j!70)))))

(declare-fun b!1510967 () Bool)

(declare-fun res!1031075 () Bool)

(assert (=> b!1510967 (=> (not res!1031075) (not e!843558))))

(assert (=> b!1510967 (= res!1031075 (and (= (size!49156 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49156 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49156 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1510968 () Bool)

(declare-fun res!1031073 () Bool)

(assert (=> b!1510968 (=> (not res!1031073) (not e!843561))))

(assert (=> b!1510968 (= res!1031073 (= lt!655108 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48604 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48604 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100733 (store (arr!48604 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49156 a!2804)) mask!2512)))))

(declare-fun b!1510969 () Bool)

(declare-fun res!1031071 () Bool)

(assert (=> b!1510969 (=> (not res!1031071) (not e!843561))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1510969 (= res!1031071 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48604 a!2804) j!70) a!2804 mask!2512) lt!655110))))

(declare-fun b!1510970 () Bool)

(declare-fun res!1031076 () Bool)

(assert (=> b!1510970 (=> (not res!1031076) (not e!843558))))

(assert (=> b!1510970 (= res!1031076 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49156 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49156 a!2804))))))

(declare-fun b!1510971 () Bool)

(assert (=> b!1510971 (= e!843561 (not true))))

(assert (=> b!1510971 e!843560))

(declare-fun res!1031081 () Bool)

(assert (=> b!1510971 (=> (not res!1031081) (not e!843560))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100732 (_ BitVec 32)) Bool)

(assert (=> b!1510971 (= res!1031081 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50303 0))(
  ( (Unit!50304) )
))
(declare-fun lt!655109 () Unit!50303)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100732 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50303)

(assert (=> b!1510971 (= lt!655109 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1510972 () Bool)

(declare-fun res!1031079 () Bool)

(assert (=> b!1510972 (=> (not res!1031079) (not e!843558))))

(assert (=> b!1510972 (= res!1031079 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(assert (= (and start!128876 res!1031080) b!1510967))

(assert (= (and b!1510967 res!1031075) b!1510965))

(assert (= (and b!1510965 res!1031077) b!1510966))

(assert (= (and b!1510966 res!1031072) b!1510972))

(assert (= (and b!1510972 res!1031079) b!1510964))

(assert (= (and b!1510964 res!1031074) b!1510970))

(assert (= (and b!1510970 res!1031076) b!1510963))

(assert (= (and b!1510963 res!1031078) b!1510969))

(assert (= (and b!1510969 res!1031071) b!1510968))

(assert (= (and b!1510968 res!1031073) b!1510971))

(assert (= (and b!1510971 res!1031081) b!1510962))

(declare-fun m!1393079 () Bool)

(assert (=> b!1510964 m!1393079))

(declare-fun m!1393081 () Bool)

(assert (=> b!1510972 m!1393081))

(declare-fun m!1393083 () Bool)

(assert (=> b!1510962 m!1393083))

(assert (=> b!1510962 m!1393083))

(declare-fun m!1393085 () Bool)

(assert (=> b!1510962 m!1393085))

(assert (=> b!1510966 m!1393083))

(assert (=> b!1510966 m!1393083))

(declare-fun m!1393087 () Bool)

(assert (=> b!1510966 m!1393087))

(declare-fun m!1393089 () Bool)

(assert (=> b!1510971 m!1393089))

(declare-fun m!1393091 () Bool)

(assert (=> b!1510971 m!1393091))

(assert (=> b!1510969 m!1393083))

(assert (=> b!1510969 m!1393083))

(declare-fun m!1393093 () Bool)

(assert (=> b!1510969 m!1393093))

(declare-fun m!1393095 () Bool)

(assert (=> b!1510968 m!1393095))

(declare-fun m!1393097 () Bool)

(assert (=> b!1510968 m!1393097))

(assert (=> b!1510968 m!1393097))

(declare-fun m!1393099 () Bool)

(assert (=> b!1510968 m!1393099))

(assert (=> b!1510968 m!1393099))

(assert (=> b!1510968 m!1393097))

(declare-fun m!1393101 () Bool)

(assert (=> b!1510968 m!1393101))

(declare-fun m!1393103 () Bool)

(assert (=> b!1510965 m!1393103))

(assert (=> b!1510965 m!1393103))

(declare-fun m!1393105 () Bool)

(assert (=> b!1510965 m!1393105))

(declare-fun m!1393107 () Bool)

(assert (=> start!128876 m!1393107))

(declare-fun m!1393109 () Bool)

(assert (=> start!128876 m!1393109))

(assert (=> b!1510963 m!1393083))

(assert (=> b!1510963 m!1393083))

(declare-fun m!1393111 () Bool)

(assert (=> b!1510963 m!1393111))

(assert (=> b!1510963 m!1393111))

(assert (=> b!1510963 m!1393083))

(declare-fun m!1393113 () Bool)

(assert (=> b!1510963 m!1393113))

(check-sat (not b!1510971) (not b!1510963) (not start!128876) (not b!1510968) (not b!1510965) (not b!1510972) (not b!1510969) (not b!1510964) (not b!1510962) (not b!1510966))
(check-sat)
