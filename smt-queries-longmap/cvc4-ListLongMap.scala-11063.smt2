; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129214 () Bool)

(assert start!129214)

(declare-fun b!1516928 () Bool)

(declare-fun res!1036841 () Bool)

(declare-fun e!846380 () Bool)

(assert (=> b!1516928 (=> (not res!1036841) (not e!846380))))

(declare-datatypes ((SeekEntryResult!12943 0))(
  ( (MissingZero!12943 (index!54167 (_ BitVec 32))) (Found!12943 (index!54168 (_ BitVec 32))) (Intermediate!12943 (undefined!13755 Bool) (index!54169 (_ BitVec 32)) (x!135853 (_ BitVec 32))) (Undefined!12943) (MissingVacant!12943 (index!54170 (_ BitVec 32))) )
))
(declare-fun lt!657589 () SeekEntryResult!12943)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!101070 0))(
  ( (array!101071 (arr!48772 (Array (_ BitVec 32) (_ BitVec 64))) (size!49322 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101070)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101070 (_ BitVec 32)) SeekEntryResult!12943)

(assert (=> b!1516928 (= res!1036841 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48772 a!2804) j!70) a!2804 mask!2512) lt!657589))))

(declare-fun b!1516929 () Bool)

(declare-fun e!846381 () Bool)

(assert (=> b!1516929 (= e!846381 e!846380)))

(declare-fun res!1036835 () Bool)

(assert (=> b!1516929 (=> (not res!1036835) (not e!846380))))

(declare-fun lt!657591 () SeekEntryResult!12943)

(assert (=> b!1516929 (= res!1036835 (= lt!657591 lt!657589))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1516929 (= lt!657589 (Intermediate!12943 false resIndex!21 resX!21))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1516929 (= lt!657591 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48772 a!2804) j!70) mask!2512) (select (arr!48772 a!2804) j!70) a!2804 mask!2512))))

(declare-fun res!1036836 () Bool)

(assert (=> start!129214 (=> (not res!1036836) (not e!846381))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129214 (= res!1036836 (validMask!0 mask!2512))))

(assert (=> start!129214 e!846381))

(assert (=> start!129214 true))

(declare-fun array_inv!37800 (array!101070) Bool)

(assert (=> start!129214 (array_inv!37800 a!2804)))

(declare-fun b!1516930 () Bool)

(declare-fun res!1036843 () Bool)

(assert (=> b!1516930 (=> (not res!1036843) (not e!846381))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1516930 (= res!1036843 (validKeyInArray!0 (select (arr!48772 a!2804) i!961)))))

(declare-fun b!1516931 () Bool)

(declare-fun e!846378 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101070 (_ BitVec 32)) SeekEntryResult!12943)

(assert (=> b!1516931 (= e!846378 (= (seekEntry!0 (select (arr!48772 a!2804) j!70) a!2804 mask!2512) (Found!12943 j!70)))))

(declare-fun b!1516932 () Bool)

(declare-fun res!1036838 () Bool)

(assert (=> b!1516932 (=> (not res!1036838) (not e!846381))))

(assert (=> b!1516932 (= res!1036838 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49322 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49322 a!2804))))))

(declare-fun b!1516933 () Bool)

(declare-fun res!1036839 () Bool)

(assert (=> b!1516933 (=> (not res!1036839) (not e!846380))))

(assert (=> b!1516933 (= res!1036839 (= lt!657591 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48772 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48772 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101071 (store (arr!48772 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49322 a!2804)) mask!2512)))))

(declare-fun b!1516934 () Bool)

(declare-fun e!846379 () Bool)

(declare-fun e!846377 () Bool)

(assert (=> b!1516934 (= e!846379 e!846377)))

(declare-fun res!1036832 () Bool)

(assert (=> b!1516934 (=> res!1036832 e!846377)))

(declare-fun lt!657592 () (_ BitVec 32))

(assert (=> b!1516934 (= res!1036832 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!657592 #b00000000000000000000000000000000) (bvsge lt!657592 (size!49322 a!2804))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1516934 (= lt!657592 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1516935 () Bool)

(declare-fun res!1036840 () Bool)

(assert (=> b!1516935 (=> (not res!1036840) (not e!846381))))

(declare-datatypes ((List!35255 0))(
  ( (Nil!35252) (Cons!35251 (h!36663 (_ BitVec 64)) (t!49949 List!35255)) )
))
(declare-fun arrayNoDuplicates!0 (array!101070 (_ BitVec 32) List!35255) Bool)

(assert (=> b!1516935 (= res!1036840 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35252))))

(declare-fun b!1516936 () Bool)

(declare-fun res!1036834 () Bool)

(assert (=> b!1516936 (=> (not res!1036834) (not e!846381))))

(assert (=> b!1516936 (= res!1036834 (validKeyInArray!0 (select (arr!48772 a!2804) j!70)))))

(declare-fun b!1516937 () Bool)

(declare-fun res!1036831 () Bool)

(assert (=> b!1516937 (=> (not res!1036831) (not e!846381))))

(assert (=> b!1516937 (= res!1036831 (and (= (size!49322 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49322 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49322 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1516938 () Bool)

(assert (=> b!1516938 (= e!846380 (not e!846379))))

(declare-fun res!1036833 () Bool)

(assert (=> b!1516938 (=> res!1036833 e!846379)))

(assert (=> b!1516938 (= res!1036833 (or (not (= (select (arr!48772 a!2804) j!70) (select (store (arr!48772 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(assert (=> b!1516938 e!846378))

(declare-fun res!1036842 () Bool)

(assert (=> b!1516938 (=> (not res!1036842) (not e!846378))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101070 (_ BitVec 32)) Bool)

(assert (=> b!1516938 (= res!1036842 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50754 0))(
  ( (Unit!50755) )
))
(declare-fun lt!657588 () Unit!50754)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101070 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50754)

(assert (=> b!1516938 (= lt!657588 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1516939 () Bool)

(declare-fun res!1036837 () Bool)

(assert (=> b!1516939 (=> (not res!1036837) (not e!846381))))

(assert (=> b!1516939 (= res!1036837 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1516940 () Bool)

(assert (=> b!1516940 (= e!846377 true)))

(declare-fun lt!657590 () SeekEntryResult!12943)

(assert (=> b!1516940 (= lt!657590 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!657592 (select (arr!48772 a!2804) j!70) a!2804 mask!2512))))

(assert (= (and start!129214 res!1036836) b!1516937))

(assert (= (and b!1516937 res!1036831) b!1516930))

(assert (= (and b!1516930 res!1036843) b!1516936))

(assert (= (and b!1516936 res!1036834) b!1516939))

(assert (= (and b!1516939 res!1036837) b!1516935))

(assert (= (and b!1516935 res!1036840) b!1516932))

(assert (= (and b!1516932 res!1036838) b!1516929))

(assert (= (and b!1516929 res!1036835) b!1516928))

(assert (= (and b!1516928 res!1036841) b!1516933))

(assert (= (and b!1516933 res!1036839) b!1516938))

(assert (= (and b!1516938 res!1036842) b!1516931))

(assert (= (and b!1516938 (not res!1036833)) b!1516934))

(assert (= (and b!1516934 (not res!1036832)) b!1516940))

(declare-fun m!1400205 () Bool)

(assert (=> b!1516936 m!1400205))

(assert (=> b!1516936 m!1400205))

(declare-fun m!1400207 () Bool)

(assert (=> b!1516936 m!1400207))

(declare-fun m!1400209 () Bool)

(assert (=> b!1516935 m!1400209))

(declare-fun m!1400211 () Bool)

(assert (=> b!1516934 m!1400211))

(assert (=> b!1516940 m!1400205))

(assert (=> b!1516940 m!1400205))

(declare-fun m!1400213 () Bool)

(assert (=> b!1516940 m!1400213))

(assert (=> b!1516938 m!1400205))

(declare-fun m!1400215 () Bool)

(assert (=> b!1516938 m!1400215))

(declare-fun m!1400217 () Bool)

(assert (=> b!1516938 m!1400217))

(declare-fun m!1400219 () Bool)

(assert (=> b!1516938 m!1400219))

(declare-fun m!1400221 () Bool)

(assert (=> b!1516938 m!1400221))

(declare-fun m!1400223 () Bool)

(assert (=> b!1516939 m!1400223))

(declare-fun m!1400225 () Bool)

(assert (=> b!1516930 m!1400225))

(assert (=> b!1516930 m!1400225))

(declare-fun m!1400227 () Bool)

(assert (=> b!1516930 m!1400227))

(declare-fun m!1400229 () Bool)

(assert (=> start!129214 m!1400229))

(declare-fun m!1400231 () Bool)

(assert (=> start!129214 m!1400231))

(assert (=> b!1516931 m!1400205))

(assert (=> b!1516931 m!1400205))

(declare-fun m!1400233 () Bool)

(assert (=> b!1516931 m!1400233))

(assert (=> b!1516933 m!1400217))

(assert (=> b!1516933 m!1400219))

(assert (=> b!1516933 m!1400219))

(declare-fun m!1400235 () Bool)

(assert (=> b!1516933 m!1400235))

(assert (=> b!1516933 m!1400235))

(assert (=> b!1516933 m!1400219))

(declare-fun m!1400237 () Bool)

(assert (=> b!1516933 m!1400237))

(assert (=> b!1516929 m!1400205))

(assert (=> b!1516929 m!1400205))

(declare-fun m!1400239 () Bool)

(assert (=> b!1516929 m!1400239))

(assert (=> b!1516929 m!1400239))

(assert (=> b!1516929 m!1400205))

(declare-fun m!1400241 () Bool)

(assert (=> b!1516929 m!1400241))

(assert (=> b!1516928 m!1400205))

(assert (=> b!1516928 m!1400205))

(declare-fun m!1400243 () Bool)

(assert (=> b!1516928 m!1400243))

(push 1)

(assert (not b!1516936))

(assert (not b!1516931))

(assert (not b!1516940))

(assert (not b!1516935))

(assert (not start!129214))

(assert (not b!1516939))

(assert (not b!1516928))

(assert (not b!1516929))

