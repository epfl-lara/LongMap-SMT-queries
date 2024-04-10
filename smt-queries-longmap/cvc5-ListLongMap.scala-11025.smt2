; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128982 () Bool)

(assert start!128982)

(declare-fun b!1512314 () Bool)

(declare-fun res!1032221 () Bool)

(declare-fun e!844162 () Bool)

(assert (=> b!1512314 (=> (not res!1032221) (not e!844162))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!100838 0))(
  ( (array!100839 (arr!48656 (Array (_ BitVec 32) (_ BitVec 64))) (size!49206 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100838)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1512314 (= res!1032221 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49206 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49206 a!2804))))))

(declare-fun b!1512315 () Bool)

(declare-fun res!1032223 () Bool)

(assert (=> b!1512315 (=> (not res!1032223) (not e!844162))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1512315 (= res!1032223 (validKeyInArray!0 (select (arr!48656 a!2804) j!70)))))

(declare-fun res!1032218 () Bool)

(assert (=> start!128982 (=> (not res!1032218) (not e!844162))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128982 (= res!1032218 (validMask!0 mask!2512))))

(assert (=> start!128982 e!844162))

(assert (=> start!128982 true))

(declare-fun array_inv!37684 (array!100838) Bool)

(assert (=> start!128982 (array_inv!37684 a!2804)))

(declare-fun b!1512316 () Bool)

(declare-fun res!1032222 () Bool)

(assert (=> b!1512316 (=> (not res!1032222) (not e!844162))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100838 (_ BitVec 32)) Bool)

(assert (=> b!1512316 (= res!1032222 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1512317 () Bool)

(declare-fun res!1032229 () Bool)

(assert (=> b!1512317 (=> (not res!1032229) (not e!844162))))

(declare-datatypes ((List!35139 0))(
  ( (Nil!35136) (Cons!35135 (h!36547 (_ BitVec 64)) (t!49833 List!35139)) )
))
(declare-fun arrayNoDuplicates!0 (array!100838 (_ BitVec 32) List!35139) Bool)

(assert (=> b!1512317 (= res!1032229 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35136))))

(declare-fun b!1512318 () Bool)

(declare-fun res!1032220 () Bool)

(declare-fun e!844164 () Bool)

(assert (=> b!1512318 (=> (not res!1032220) (not e!844164))))

(declare-datatypes ((SeekEntryResult!12827 0))(
  ( (MissingZero!12827 (index!53703 (_ BitVec 32))) (Found!12827 (index!53704 (_ BitVec 32))) (Intermediate!12827 (undefined!13639 Bool) (index!53705 (_ BitVec 32)) (x!135433 (_ BitVec 32))) (Undefined!12827) (MissingVacant!12827 (index!53706 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!100838 (_ BitVec 32)) SeekEntryResult!12827)

(assert (=> b!1512318 (= res!1032220 (= (seekEntry!0 (select (arr!48656 a!2804) j!70) a!2804 mask!2512) (Found!12827 j!70)))))

(declare-fun b!1512319 () Bool)

(declare-fun res!1032227 () Bool)

(declare-fun e!844165 () Bool)

(assert (=> b!1512319 (=> (not res!1032227) (not e!844165))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun lt!655647 () SeekEntryResult!12827)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100838 (_ BitVec 32)) SeekEntryResult!12827)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1512319 (= res!1032227 (= lt!655647 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48656 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48656 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100839 (store (arr!48656 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49206 a!2804)) mask!2512)))))

(declare-fun b!1512320 () Bool)

(assert (=> b!1512320 (= e!844165 (not true))))

(assert (=> b!1512320 e!844164))

(declare-fun res!1032217 () Bool)

(assert (=> b!1512320 (=> (not res!1032217) (not e!844164))))

(assert (=> b!1512320 (= res!1032217 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50522 0))(
  ( (Unit!50523) )
))
(declare-fun lt!655646 () Unit!50522)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100838 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50522)

(assert (=> b!1512320 (= lt!655646 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1512321 () Bool)

(declare-fun res!1032228 () Bool)

(assert (=> b!1512321 (=> (not res!1032228) (not e!844162))))

(assert (=> b!1512321 (= res!1032228 (validKeyInArray!0 (select (arr!48656 a!2804) i!961)))))

(declare-fun b!1512322 () Bool)

(assert (=> b!1512322 (= e!844162 e!844165)))

(declare-fun res!1032225 () Bool)

(assert (=> b!1512322 (=> (not res!1032225) (not e!844165))))

(declare-fun lt!655648 () SeekEntryResult!12827)

(assert (=> b!1512322 (= res!1032225 (= lt!655647 lt!655648))))

(assert (=> b!1512322 (= lt!655648 (Intermediate!12827 false resIndex!21 resX!21))))

(assert (=> b!1512322 (= lt!655647 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48656 a!2804) j!70) mask!2512) (select (arr!48656 a!2804) j!70) a!2804 mask!2512))))

(declare-fun e!844163 () Bool)

(declare-fun b!1512323 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100838 (_ BitVec 32)) SeekEntryResult!12827)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100838 (_ BitVec 32)) SeekEntryResult!12827)

(assert (=> b!1512323 (= e!844163 (= (seekEntryOrOpen!0 (select (arr!48656 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48656 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1512324 () Bool)

(assert (=> b!1512324 (= e!844164 e!844163)))

(declare-fun res!1032226 () Bool)

(assert (=> b!1512324 (=> res!1032226 e!844163)))

(assert (=> b!1512324 (= res!1032226 (or (not (= (select (arr!48656 a!2804) j!70) (select (store (arr!48656 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48656 a!2804) index!487) (select (arr!48656 a!2804) j!70)) (not (= (select (arr!48656 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1512325 () Bool)

(declare-fun res!1032224 () Bool)

(assert (=> b!1512325 (=> (not res!1032224) (not e!844165))))

(assert (=> b!1512325 (= res!1032224 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48656 a!2804) j!70) a!2804 mask!2512) lt!655648))))

(declare-fun b!1512326 () Bool)

(declare-fun res!1032219 () Bool)

(assert (=> b!1512326 (=> (not res!1032219) (not e!844162))))

(assert (=> b!1512326 (= res!1032219 (and (= (size!49206 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49206 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49206 a!2804)) (not (= i!961 j!70))))))

(assert (= (and start!128982 res!1032218) b!1512326))

(assert (= (and b!1512326 res!1032219) b!1512321))

(assert (= (and b!1512321 res!1032228) b!1512315))

(assert (= (and b!1512315 res!1032223) b!1512316))

(assert (= (and b!1512316 res!1032222) b!1512317))

(assert (= (and b!1512317 res!1032229) b!1512314))

(assert (= (and b!1512314 res!1032221) b!1512322))

(assert (= (and b!1512322 res!1032225) b!1512325))

(assert (= (and b!1512325 res!1032224) b!1512319))

(assert (= (and b!1512319 res!1032227) b!1512320))

(assert (= (and b!1512320 res!1032217) b!1512318))

(assert (= (and b!1512318 res!1032220) b!1512324))

(assert (= (and b!1512324 (not res!1032226)) b!1512323))

(declare-fun m!1395073 () Bool)

(assert (=> start!128982 m!1395073))

(declare-fun m!1395075 () Bool)

(assert (=> start!128982 m!1395075))

(declare-fun m!1395077 () Bool)

(assert (=> b!1512315 m!1395077))

(assert (=> b!1512315 m!1395077))

(declare-fun m!1395079 () Bool)

(assert (=> b!1512315 m!1395079))

(assert (=> b!1512324 m!1395077))

(declare-fun m!1395081 () Bool)

(assert (=> b!1512324 m!1395081))

(declare-fun m!1395083 () Bool)

(assert (=> b!1512324 m!1395083))

(declare-fun m!1395085 () Bool)

(assert (=> b!1512324 m!1395085))

(declare-fun m!1395087 () Bool)

(assert (=> b!1512321 m!1395087))

(assert (=> b!1512321 m!1395087))

(declare-fun m!1395089 () Bool)

(assert (=> b!1512321 m!1395089))

(assert (=> b!1512318 m!1395077))

(assert (=> b!1512318 m!1395077))

(declare-fun m!1395091 () Bool)

(assert (=> b!1512318 m!1395091))

(assert (=> b!1512323 m!1395077))

(assert (=> b!1512323 m!1395077))

(declare-fun m!1395093 () Bool)

(assert (=> b!1512323 m!1395093))

(assert (=> b!1512323 m!1395077))

(declare-fun m!1395095 () Bool)

(assert (=> b!1512323 m!1395095))

(declare-fun m!1395097 () Bool)

(assert (=> b!1512317 m!1395097))

(assert (=> b!1512325 m!1395077))

(assert (=> b!1512325 m!1395077))

(declare-fun m!1395099 () Bool)

(assert (=> b!1512325 m!1395099))

(assert (=> b!1512322 m!1395077))

(assert (=> b!1512322 m!1395077))

(declare-fun m!1395101 () Bool)

(assert (=> b!1512322 m!1395101))

(assert (=> b!1512322 m!1395101))

(assert (=> b!1512322 m!1395077))

(declare-fun m!1395103 () Bool)

(assert (=> b!1512322 m!1395103))

(declare-fun m!1395105 () Bool)

(assert (=> b!1512320 m!1395105))

(declare-fun m!1395107 () Bool)

(assert (=> b!1512320 m!1395107))

(declare-fun m!1395109 () Bool)

(assert (=> b!1512316 m!1395109))

(assert (=> b!1512319 m!1395081))

(assert (=> b!1512319 m!1395083))

(assert (=> b!1512319 m!1395083))

(declare-fun m!1395111 () Bool)

(assert (=> b!1512319 m!1395111))

(assert (=> b!1512319 m!1395111))

(assert (=> b!1512319 m!1395083))

(declare-fun m!1395113 () Bool)

(assert (=> b!1512319 m!1395113))

(push 1)

