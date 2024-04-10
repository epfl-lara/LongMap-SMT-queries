; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129166 () Bool)

(assert start!129166)

(declare-fun b!1516048 () Bool)

(declare-fun res!1035955 () Bool)

(declare-fun e!846002 () Bool)

(assert (=> b!1516048 (=> (not res!1035955) (not e!846002))))

(declare-datatypes ((array!101022 0))(
  ( (array!101023 (arr!48748 (Array (_ BitVec 32) (_ BitVec 64))) (size!49298 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101022)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101022 (_ BitVec 32)) Bool)

(assert (=> b!1516048 (= res!1035955 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1516049 () Bool)

(declare-fun res!1035951 () Bool)

(assert (=> b!1516049 (=> (not res!1035951) (not e!846002))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1516049 (= res!1035951 (validKeyInArray!0 (select (arr!48748 a!2804) i!961)))))

(declare-fun b!1516050 () Bool)

(declare-fun e!846003 () Bool)

(assert (=> b!1516050 (= e!846002 e!846003)))

(declare-fun res!1035956 () Bool)

(assert (=> b!1516050 (=> (not res!1035956) (not e!846003))))

(declare-datatypes ((SeekEntryResult!12919 0))(
  ( (MissingZero!12919 (index!54071 (_ BitVec 32))) (Found!12919 (index!54072 (_ BitVec 32))) (Intermediate!12919 (undefined!13731 Bool) (index!54073 (_ BitVec 32)) (x!135765 (_ BitVec 32))) (Undefined!12919) (MissingVacant!12919 (index!54074 (_ BitVec 32))) )
))
(declare-fun lt!657284 () SeekEntryResult!12919)

(declare-fun lt!657286 () SeekEntryResult!12919)

(assert (=> b!1516050 (= res!1035956 (= lt!657284 lt!657286))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1516050 (= lt!657286 (Intermediate!12919 false resIndex!21 resX!21))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101022 (_ BitVec 32)) SeekEntryResult!12919)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1516050 (= lt!657284 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48748 a!2804) j!70) mask!2512) (select (arr!48748 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1516051 () Bool)

(declare-fun res!1035957 () Bool)

(assert (=> b!1516051 (=> (not res!1035957) (not e!846003))))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(assert (=> b!1516051 (= res!1035957 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48748 a!2804) j!70) a!2804 mask!2512) lt!657286))))

(declare-fun b!1516052 () Bool)

(declare-fun res!1035952 () Bool)

(assert (=> b!1516052 (=> (not res!1035952) (not e!846002))))

(assert (=> b!1516052 (= res!1035952 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49298 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49298 a!2804))))))

(declare-fun b!1516053 () Bool)

(declare-fun res!1035959 () Bool)

(assert (=> b!1516053 (=> (not res!1035959) (not e!846002))))

(declare-datatypes ((List!35231 0))(
  ( (Nil!35228) (Cons!35227 (h!36639 (_ BitVec 64)) (t!49925 List!35231)) )
))
(declare-fun arrayNoDuplicates!0 (array!101022 (_ BitVec 32) List!35231) Bool)

(assert (=> b!1516053 (= res!1035959 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35228))))

(declare-fun res!1035960 () Bool)

(assert (=> start!129166 (=> (not res!1035960) (not e!846002))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129166 (= res!1035960 (validMask!0 mask!2512))))

(assert (=> start!129166 e!846002))

(assert (=> start!129166 true))

(declare-fun array_inv!37776 (array!101022) Bool)

(assert (=> start!129166 (array_inv!37776 a!2804)))

(declare-fun b!1516054 () Bool)

(declare-fun res!1035954 () Bool)

(assert (=> b!1516054 (=> (not res!1035954) (not e!846003))))

(assert (=> b!1516054 (= res!1035954 (= lt!657284 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48748 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48748 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101023 (store (arr!48748 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49298 a!2804)) mask!2512)))))

(declare-fun b!1516055 () Bool)

(declare-fun res!1035961 () Bool)

(assert (=> b!1516055 (=> (not res!1035961) (not e!846002))))

(assert (=> b!1516055 (= res!1035961 (and (= (size!49298 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49298 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49298 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1516056 () Bool)

(assert (=> b!1516056 (= e!846003 (not true))))

(declare-fun e!846004 () Bool)

(assert (=> b!1516056 e!846004))

(declare-fun res!1035958 () Bool)

(assert (=> b!1516056 (=> (not res!1035958) (not e!846004))))

(assert (=> b!1516056 (= res!1035958 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50706 0))(
  ( (Unit!50707) )
))
(declare-fun lt!657285 () Unit!50706)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101022 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50706)

(assert (=> b!1516056 (= lt!657285 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1516057 () Bool)

(declare-fun res!1035953 () Bool)

(assert (=> b!1516057 (=> (not res!1035953) (not e!846002))))

(assert (=> b!1516057 (= res!1035953 (validKeyInArray!0 (select (arr!48748 a!2804) j!70)))))

(declare-fun b!1516058 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101022 (_ BitVec 32)) SeekEntryResult!12919)

(assert (=> b!1516058 (= e!846004 (= (seekEntry!0 (select (arr!48748 a!2804) j!70) a!2804 mask!2512) (Found!12919 j!70)))))

(assert (= (and start!129166 res!1035960) b!1516055))

(assert (= (and b!1516055 res!1035961) b!1516049))

(assert (= (and b!1516049 res!1035951) b!1516057))

(assert (= (and b!1516057 res!1035953) b!1516048))

(assert (= (and b!1516048 res!1035955) b!1516053))

(assert (= (and b!1516053 res!1035959) b!1516052))

(assert (= (and b!1516052 res!1035952) b!1516050))

(assert (= (and b!1516050 res!1035956) b!1516051))

(assert (= (and b!1516051 res!1035957) b!1516054))

(assert (= (and b!1516054 res!1035954) b!1516056))

(assert (= (and b!1516056 res!1035958) b!1516058))

(declare-fun m!1399285 () Bool)

(assert (=> b!1516050 m!1399285))

(assert (=> b!1516050 m!1399285))

(declare-fun m!1399287 () Bool)

(assert (=> b!1516050 m!1399287))

(assert (=> b!1516050 m!1399287))

(assert (=> b!1516050 m!1399285))

(declare-fun m!1399289 () Bool)

(assert (=> b!1516050 m!1399289))

(declare-fun m!1399291 () Bool)

(assert (=> b!1516048 m!1399291))

(declare-fun m!1399293 () Bool)

(assert (=> b!1516054 m!1399293))

(declare-fun m!1399295 () Bool)

(assert (=> b!1516054 m!1399295))

(assert (=> b!1516054 m!1399295))

(declare-fun m!1399297 () Bool)

(assert (=> b!1516054 m!1399297))

(assert (=> b!1516054 m!1399297))

(assert (=> b!1516054 m!1399295))

(declare-fun m!1399299 () Bool)

(assert (=> b!1516054 m!1399299))

(declare-fun m!1399301 () Bool)

(assert (=> b!1516049 m!1399301))

(assert (=> b!1516049 m!1399301))

(declare-fun m!1399303 () Bool)

(assert (=> b!1516049 m!1399303))

(declare-fun m!1399305 () Bool)

(assert (=> b!1516053 m!1399305))

(assert (=> b!1516051 m!1399285))

(assert (=> b!1516051 m!1399285))

(declare-fun m!1399307 () Bool)

(assert (=> b!1516051 m!1399307))

(assert (=> b!1516058 m!1399285))

(assert (=> b!1516058 m!1399285))

(declare-fun m!1399309 () Bool)

(assert (=> b!1516058 m!1399309))

(assert (=> b!1516057 m!1399285))

(assert (=> b!1516057 m!1399285))

(declare-fun m!1399311 () Bool)

(assert (=> b!1516057 m!1399311))

(declare-fun m!1399313 () Bool)

(assert (=> b!1516056 m!1399313))

(declare-fun m!1399315 () Bool)

(assert (=> b!1516056 m!1399315))

(declare-fun m!1399317 () Bool)

(assert (=> start!129166 m!1399317))

(declare-fun m!1399319 () Bool)

(assert (=> start!129166 m!1399319))

(push 1)

(assert (not b!1516057))

