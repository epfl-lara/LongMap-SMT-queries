; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128930 () Bool)

(assert start!128930)

(declare-fun b!1511974 () Bool)

(declare-fun res!1032093 () Bool)

(declare-fun e!843947 () Bool)

(assert (=> b!1511974 (=> (not res!1032093) (not e!843947))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-datatypes ((array!100786 0))(
  ( (array!100787 (arr!48631 (Array (_ BitVec 32) (_ BitVec 64))) (size!49183 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100786)

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1511974 (= res!1032093 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49183 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49183 a!2804))))))

(declare-fun b!1511975 () Bool)

(declare-fun res!1032095 () Bool)

(declare-fun e!843949 () Bool)

(assert (=> b!1511975 (=> (not res!1032095) (not e!843949))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12825 0))(
  ( (MissingZero!12825 (index!53695 (_ BitVec 32))) (Found!12825 (index!53696 (_ BitVec 32))) (Intermediate!12825 (undefined!13637 Bool) (index!53697 (_ BitVec 32)) (x!135425 (_ BitVec 32))) (Undefined!12825) (MissingVacant!12825 (index!53698 (_ BitVec 32))) )
))
(declare-fun lt!655351 () SeekEntryResult!12825)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100786 (_ BitVec 32)) SeekEntryResult!12825)

(assert (=> b!1511975 (= res!1032095 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48631 a!2804) j!70) a!2804 mask!2512) lt!655351))))

(declare-fun b!1511976 () Bool)

(declare-fun res!1032087 () Bool)

(assert (=> b!1511976 (=> (not res!1032087) (not e!843947))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1511976 (= res!1032087 (validKeyInArray!0 (select (arr!48631 a!2804) j!70)))))

(declare-fun b!1511977 () Bool)

(declare-fun res!1032092 () Bool)

(declare-fun e!843948 () Bool)

(assert (=> b!1511977 (=> (not res!1032092) (not e!843948))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!100786 (_ BitVec 32)) SeekEntryResult!12825)

(assert (=> b!1511977 (= res!1032092 (= (seekEntry!0 (select (arr!48631 a!2804) j!70) a!2804 mask!2512) (Found!12825 j!70)))))

(declare-fun b!1511978 () Bool)

(declare-fun res!1032088 () Bool)

(assert (=> b!1511978 (=> (not res!1032088) (not e!843947))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100786 (_ BitVec 32)) Bool)

(assert (=> b!1511978 (= res!1032088 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1511979 () Bool)

(assert (=> b!1511979 (= e!843949 (not true))))

(assert (=> b!1511979 e!843948))

(declare-fun res!1032085 () Bool)

(assert (=> b!1511979 (=> (not res!1032085) (not e!843948))))

(assert (=> b!1511979 (= res!1032085 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50357 0))(
  ( (Unit!50358) )
))
(declare-fun lt!655352 () Unit!50357)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100786 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50357)

(assert (=> b!1511979 (= lt!655352 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1511981 () Bool)

(declare-fun e!843951 () Bool)

(assert (=> b!1511981 (= e!843948 e!843951)))

(declare-fun res!1032090 () Bool)

(assert (=> b!1511981 (=> res!1032090 e!843951)))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1511981 (= res!1032090 (or (not (= (select (arr!48631 a!2804) j!70) (select (store (arr!48631 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48631 a!2804) index!487) (select (arr!48631 a!2804) j!70)) (not (= (select (arr!48631 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1511982 () Bool)

(assert (=> b!1511982 (= e!843947 e!843949)))

(declare-fun res!1032089 () Bool)

(assert (=> b!1511982 (=> (not res!1032089) (not e!843949))))

(declare-fun lt!655353 () SeekEntryResult!12825)

(assert (=> b!1511982 (= res!1032089 (= lt!655353 lt!655351))))

(assert (=> b!1511982 (= lt!655351 (Intermediate!12825 false resIndex!21 resX!21))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1511982 (= lt!655353 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48631 a!2804) j!70) mask!2512) (select (arr!48631 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1511983 () Bool)

(declare-fun res!1032091 () Bool)

(assert (=> b!1511983 (=> (not res!1032091) (not e!843947))))

(assert (=> b!1511983 (= res!1032091 (validKeyInArray!0 (select (arr!48631 a!2804) i!961)))))

(declare-fun b!1511984 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100786 (_ BitVec 32)) SeekEntryResult!12825)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100786 (_ BitVec 32)) SeekEntryResult!12825)

(assert (=> b!1511984 (= e!843951 (= (seekEntryOrOpen!0 (select (arr!48631 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48631 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1511985 () Bool)

(declare-fun res!1032094 () Bool)

(assert (=> b!1511985 (=> (not res!1032094) (not e!843947))))

(declare-datatypes ((List!35192 0))(
  ( (Nil!35189) (Cons!35188 (h!36601 (_ BitVec 64)) (t!49878 List!35192)) )
))
(declare-fun arrayNoDuplicates!0 (array!100786 (_ BitVec 32) List!35192) Bool)

(assert (=> b!1511985 (= res!1032094 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35189))))

(declare-fun b!1511986 () Bool)

(declare-fun res!1032083 () Bool)

(assert (=> b!1511986 (=> (not res!1032083) (not e!843947))))

(assert (=> b!1511986 (= res!1032083 (and (= (size!49183 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49183 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49183 a!2804)) (not (= i!961 j!70))))))

(declare-fun res!1032086 () Bool)

(assert (=> start!128930 (=> (not res!1032086) (not e!843947))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128930 (= res!1032086 (validMask!0 mask!2512))))

(assert (=> start!128930 e!843947))

(assert (=> start!128930 true))

(declare-fun array_inv!37864 (array!100786) Bool)

(assert (=> start!128930 (array_inv!37864 a!2804)))

(declare-fun b!1511980 () Bool)

(declare-fun res!1032084 () Bool)

(assert (=> b!1511980 (=> (not res!1032084) (not e!843949))))

(assert (=> b!1511980 (= res!1032084 (= lt!655353 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48631 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48631 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100787 (store (arr!48631 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49183 a!2804)) mask!2512)))))

(assert (= (and start!128930 res!1032086) b!1511986))

(assert (= (and b!1511986 res!1032083) b!1511983))

(assert (= (and b!1511983 res!1032091) b!1511976))

(assert (= (and b!1511976 res!1032087) b!1511978))

(assert (= (and b!1511978 res!1032088) b!1511985))

(assert (= (and b!1511985 res!1032094) b!1511974))

(assert (= (and b!1511974 res!1032093) b!1511982))

(assert (= (and b!1511982 res!1032089) b!1511975))

(assert (= (and b!1511975 res!1032095) b!1511980))

(assert (= (and b!1511980 res!1032084) b!1511979))

(assert (= (and b!1511979 res!1032085) b!1511977))

(assert (= (and b!1511977 res!1032092) b!1511981))

(assert (= (and b!1511981 (not res!1032090)) b!1511984))

(declare-fun m!1394165 () Bool)

(assert (=> b!1511979 m!1394165))

(declare-fun m!1394167 () Bool)

(assert (=> b!1511979 m!1394167))

(declare-fun m!1394169 () Bool)

(assert (=> b!1511981 m!1394169))

(declare-fun m!1394171 () Bool)

(assert (=> b!1511981 m!1394171))

(declare-fun m!1394173 () Bool)

(assert (=> b!1511981 m!1394173))

(declare-fun m!1394175 () Bool)

(assert (=> b!1511981 m!1394175))

(declare-fun m!1394177 () Bool)

(assert (=> b!1511985 m!1394177))

(assert (=> b!1511984 m!1394169))

(assert (=> b!1511984 m!1394169))

(declare-fun m!1394179 () Bool)

(assert (=> b!1511984 m!1394179))

(assert (=> b!1511984 m!1394169))

(declare-fun m!1394181 () Bool)

(assert (=> b!1511984 m!1394181))

(assert (=> b!1511976 m!1394169))

(assert (=> b!1511976 m!1394169))

(declare-fun m!1394183 () Bool)

(assert (=> b!1511976 m!1394183))

(assert (=> b!1511980 m!1394171))

(assert (=> b!1511980 m!1394173))

(assert (=> b!1511980 m!1394173))

(declare-fun m!1394185 () Bool)

(assert (=> b!1511980 m!1394185))

(assert (=> b!1511980 m!1394185))

(assert (=> b!1511980 m!1394173))

(declare-fun m!1394187 () Bool)

(assert (=> b!1511980 m!1394187))

(declare-fun m!1394189 () Bool)

(assert (=> b!1511983 m!1394189))

(assert (=> b!1511983 m!1394189))

(declare-fun m!1394191 () Bool)

(assert (=> b!1511983 m!1394191))

(assert (=> b!1511977 m!1394169))

(assert (=> b!1511977 m!1394169))

(declare-fun m!1394193 () Bool)

(assert (=> b!1511977 m!1394193))

(declare-fun m!1394195 () Bool)

(assert (=> start!128930 m!1394195))

(declare-fun m!1394197 () Bool)

(assert (=> start!128930 m!1394197))

(declare-fun m!1394199 () Bool)

(assert (=> b!1511978 m!1394199))

(assert (=> b!1511975 m!1394169))

(assert (=> b!1511975 m!1394169))

(declare-fun m!1394201 () Bool)

(assert (=> b!1511975 m!1394201))

(assert (=> b!1511982 m!1394169))

(assert (=> b!1511982 m!1394169))

(declare-fun m!1394203 () Bool)

(assert (=> b!1511982 m!1394203))

(assert (=> b!1511982 m!1394203))

(assert (=> b!1511982 m!1394169))

(declare-fun m!1394205 () Bool)

(assert (=> b!1511982 m!1394205))

(check-sat (not b!1511980) (not start!128930) (not b!1511978) (not b!1511985) (not b!1511979) (not b!1511976) (not b!1511983) (not b!1511977) (not b!1511984) (not b!1511975) (not b!1511982))
(check-sat)
