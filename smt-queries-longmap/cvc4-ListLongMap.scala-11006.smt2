; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128872 () Bool)

(assert start!128872)

(declare-fun b!1510377 () Bool)

(declare-fun res!1030288 () Bool)

(declare-fun e!843435 () Bool)

(assert (=> b!1510377 (=> (not res!1030288) (not e!843435))))

(declare-datatypes ((array!100728 0))(
  ( (array!100729 (arr!48601 (Array (_ BitVec 32) (_ BitVec 64))) (size!49151 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100728)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100728 (_ BitVec 32)) Bool)

(assert (=> b!1510377 (= res!1030288 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1510378 () Bool)

(declare-fun e!843438 () Bool)

(assert (=> b!1510378 (= e!843435 e!843438)))

(declare-fun res!1030284 () Bool)

(assert (=> b!1510378 (=> (not res!1030284) (not e!843438))))

(declare-datatypes ((SeekEntryResult!12772 0))(
  ( (MissingZero!12772 (index!53483 (_ BitVec 32))) (Found!12772 (index!53484 (_ BitVec 32))) (Intermediate!12772 (undefined!13584 Bool) (index!53485 (_ BitVec 32)) (x!135226 (_ BitVec 32))) (Undefined!12772) (MissingVacant!12772 (index!53486 (_ BitVec 32))) )
))
(declare-fun lt!655152 () SeekEntryResult!12772)

(declare-fun lt!655153 () SeekEntryResult!12772)

(assert (=> b!1510378 (= res!1030284 (= lt!655152 lt!655153))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1510378 (= lt!655153 (Intermediate!12772 false resIndex!21 resX!21))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100728 (_ BitVec 32)) SeekEntryResult!12772)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1510378 (= lt!655152 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48601 a!2804) j!70) mask!2512) (select (arr!48601 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1510379 () Bool)

(declare-fun res!1030290 () Bool)

(assert (=> b!1510379 (=> (not res!1030290) (not e!843438))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1510379 (= res!1030290 (= lt!655152 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48601 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48601 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100729 (store (arr!48601 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49151 a!2804)) mask!2512)))))

(declare-fun b!1510380 () Bool)

(declare-fun res!1030291 () Bool)

(assert (=> b!1510380 (=> (not res!1030291) (not e!843435))))

(assert (=> b!1510380 (= res!1030291 (and (= (size!49151 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49151 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49151 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1510381 () Bool)

(declare-fun res!1030287 () Bool)

(assert (=> b!1510381 (=> (not res!1030287) (not e!843435))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1510381 (= res!1030287 (validKeyInArray!0 (select (arr!48601 a!2804) i!961)))))

(declare-fun e!843436 () Bool)

(declare-fun b!1510382 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!100728 (_ BitVec 32)) SeekEntryResult!12772)

(assert (=> b!1510382 (= e!843436 (= (seekEntry!0 (select (arr!48601 a!2804) j!70) a!2804 mask!2512) (Found!12772 j!70)))))

(declare-fun res!1030289 () Bool)

(assert (=> start!128872 (=> (not res!1030289) (not e!843435))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128872 (= res!1030289 (validMask!0 mask!2512))))

(assert (=> start!128872 e!843435))

(assert (=> start!128872 true))

(declare-fun array_inv!37629 (array!100728) Bool)

(assert (=> start!128872 (array_inv!37629 a!2804)))

(declare-fun e!843437 () Bool)

(declare-fun b!1510383 () Bool)

(assert (=> b!1510383 (= e!843437 (validKeyInArray!0 (select (store (arr!48601 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70)))))

(declare-fun b!1510384 () Bool)

(declare-fun res!1030283 () Bool)

(assert (=> b!1510384 (=> (not res!1030283) (not e!843435))))

(assert (=> b!1510384 (= res!1030283 (validKeyInArray!0 (select (arr!48601 a!2804) j!70)))))

(declare-fun b!1510385 () Bool)

(declare-fun res!1030280 () Bool)

(assert (=> b!1510385 (=> (not res!1030280) (not e!843435))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1510385 (= res!1030280 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49151 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49151 a!2804))))))

(declare-fun b!1510386 () Bool)

(declare-fun res!1030286 () Bool)

(assert (=> b!1510386 (=> (not res!1030286) (not e!843435))))

(declare-datatypes ((List!35084 0))(
  ( (Nil!35081) (Cons!35080 (h!36492 (_ BitVec 64)) (t!49778 List!35084)) )
))
(declare-fun arrayNoDuplicates!0 (array!100728 (_ BitVec 32) List!35084) Bool)

(assert (=> b!1510386 (= res!1030286 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35081))))

(declare-fun b!1510387 () Bool)

(declare-fun res!1030285 () Bool)

(assert (=> b!1510387 (=> (not res!1030285) (not e!843438))))

(assert (=> b!1510387 (= res!1030285 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48601 a!2804) j!70) a!2804 mask!2512) lt!655153))))

(declare-fun b!1510388 () Bool)

(assert (=> b!1510388 (= e!843438 (not e!843437))))

(declare-fun res!1030281 () Bool)

(assert (=> b!1510388 (=> res!1030281 e!843437)))

(assert (=> b!1510388 (= res!1030281 (or (not (= (select (arr!48601 a!2804) j!70) (select (store (arr!48601 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (not (= (select (arr!48601 a!2804) index!487) (select (arr!48601 a!2804) j!70))) (not (= j!70 index!487)) (bvslt mask!2512 #b00000000000000000000000000000000)))))

(assert (=> b!1510388 e!843436))

(declare-fun res!1030282 () Bool)

(assert (=> b!1510388 (=> (not res!1030282) (not e!843436))))

(assert (=> b!1510388 (= res!1030282 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50412 0))(
  ( (Unit!50413) )
))
(declare-fun lt!655151 () Unit!50412)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100728 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50412)

(assert (=> b!1510388 (= lt!655151 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(assert (= (and start!128872 res!1030289) b!1510380))

(assert (= (and b!1510380 res!1030291) b!1510381))

(assert (= (and b!1510381 res!1030287) b!1510384))

(assert (= (and b!1510384 res!1030283) b!1510377))

(assert (= (and b!1510377 res!1030288) b!1510386))

(assert (= (and b!1510386 res!1030286) b!1510385))

(assert (= (and b!1510385 res!1030280) b!1510378))

(assert (= (and b!1510378 res!1030284) b!1510387))

(assert (= (and b!1510387 res!1030285) b!1510379))

(assert (= (and b!1510379 res!1030290) b!1510388))

(assert (= (and b!1510388 res!1030282) b!1510382))

(assert (= (and b!1510388 (not res!1030281)) b!1510383))

(declare-fun m!1392957 () Bool)

(assert (=> start!128872 m!1392957))

(declare-fun m!1392959 () Bool)

(assert (=> start!128872 m!1392959))

(declare-fun m!1392961 () Bool)

(assert (=> b!1510382 m!1392961))

(assert (=> b!1510382 m!1392961))

(declare-fun m!1392963 () Bool)

(assert (=> b!1510382 m!1392963))

(assert (=> b!1510387 m!1392961))

(assert (=> b!1510387 m!1392961))

(declare-fun m!1392965 () Bool)

(assert (=> b!1510387 m!1392965))

(declare-fun m!1392967 () Bool)

(assert (=> b!1510386 m!1392967))

(declare-fun m!1392969 () Bool)

(assert (=> b!1510379 m!1392969))

(declare-fun m!1392971 () Bool)

(assert (=> b!1510379 m!1392971))

(assert (=> b!1510379 m!1392971))

(declare-fun m!1392973 () Bool)

(assert (=> b!1510379 m!1392973))

(assert (=> b!1510379 m!1392973))

(assert (=> b!1510379 m!1392971))

(declare-fun m!1392975 () Bool)

(assert (=> b!1510379 m!1392975))

(assert (=> b!1510388 m!1392961))

(declare-fun m!1392977 () Bool)

(assert (=> b!1510388 m!1392977))

(assert (=> b!1510388 m!1392969))

(declare-fun m!1392979 () Bool)

(assert (=> b!1510388 m!1392979))

(assert (=> b!1510388 m!1392971))

(declare-fun m!1392981 () Bool)

(assert (=> b!1510388 m!1392981))

(assert (=> b!1510378 m!1392961))

(assert (=> b!1510378 m!1392961))

(declare-fun m!1392983 () Bool)

(assert (=> b!1510378 m!1392983))

(assert (=> b!1510378 m!1392983))

(assert (=> b!1510378 m!1392961))

(declare-fun m!1392985 () Bool)

(assert (=> b!1510378 m!1392985))

(assert (=> b!1510383 m!1392969))

(assert (=> b!1510383 m!1392971))

(assert (=> b!1510383 m!1392971))

(declare-fun m!1392987 () Bool)

(assert (=> b!1510383 m!1392987))

(declare-fun m!1392989 () Bool)

(assert (=> b!1510377 m!1392989))

(assert (=> b!1510384 m!1392961))

(assert (=> b!1510384 m!1392961))

(declare-fun m!1392991 () Bool)

(assert (=> b!1510384 m!1392991))

(declare-fun m!1392993 () Bool)

(assert (=> b!1510381 m!1392993))

(assert (=> b!1510381 m!1392993))

(declare-fun m!1392995 () Bool)

(assert (=> b!1510381 m!1392995))

(push 1)

