; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128866 () Bool)

(assert start!128866)

(declare-fun b!1510270 () Bool)

(declare-fun res!1030179 () Bool)

(declare-fun e!843394 () Bool)

(assert (=> b!1510270 (=> (not res!1030179) (not e!843394))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!100722 0))(
  ( (array!100723 (arr!48598 (Array (_ BitVec 32) (_ BitVec 64))) (size!49148 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100722)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1510270 (= res!1030179 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49148 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49148 a!2804))))))

(declare-fun b!1510271 () Bool)

(declare-fun res!1030173 () Bool)

(assert (=> b!1510271 (=> (not res!1030173) (not e!843394))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1510271 (= res!1030173 (validKeyInArray!0 (select (arr!48598 a!2804) j!70)))))

(declare-fun b!1510272 () Bool)

(declare-fun res!1030175 () Bool)

(declare-fun e!843391 () Bool)

(assert (=> b!1510272 (=> (not res!1030175) (not e!843391))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12769 0))(
  ( (MissingZero!12769 (index!53471 (_ BitVec 32))) (Found!12769 (index!53472 (_ BitVec 32))) (Intermediate!12769 (undefined!13581 Bool) (index!53473 (_ BitVec 32)) (x!135215 (_ BitVec 32))) (Undefined!12769) (MissingVacant!12769 (index!53474 (_ BitVec 32))) )
))
(declare-fun lt!655126 () SeekEntryResult!12769)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100722 (_ BitVec 32)) SeekEntryResult!12769)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1510272 (= res!1030175 (= lt!655126 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48598 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48598 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100723 (store (arr!48598 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49148 a!2804)) mask!2512)))))

(declare-fun b!1510273 () Bool)

(declare-fun res!1030177 () Bool)

(assert (=> b!1510273 (=> (not res!1030177) (not e!843394))))

(declare-datatypes ((List!35081 0))(
  ( (Nil!35078) (Cons!35077 (h!36489 (_ BitVec 64)) (t!49775 List!35081)) )
))
(declare-fun arrayNoDuplicates!0 (array!100722 (_ BitVec 32) List!35081) Bool)

(assert (=> b!1510273 (= res!1030177 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35078))))

(declare-fun e!843392 () Bool)

(declare-fun b!1510274 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!100722 (_ BitVec 32)) SeekEntryResult!12769)

(assert (=> b!1510274 (= e!843392 (= (seekEntry!0 (select (arr!48598 a!2804) j!70) a!2804 mask!2512) (Found!12769 j!70)))))

(declare-fun b!1510275 () Bool)

(declare-fun res!1030176 () Bool)

(assert (=> b!1510275 (=> (not res!1030176) (not e!843391))))

(declare-fun lt!655124 () SeekEntryResult!12769)

(assert (=> b!1510275 (= res!1030176 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48598 a!2804) j!70) a!2804 mask!2512) lt!655124))))

(declare-fun b!1510276 () Bool)

(declare-fun res!1030183 () Bool)

(assert (=> b!1510276 (=> (not res!1030183) (not e!843394))))

(assert (=> b!1510276 (= res!1030183 (validKeyInArray!0 (select (arr!48598 a!2804) i!961)))))

(declare-fun b!1510277 () Bool)

(declare-fun res!1030180 () Bool)

(assert (=> b!1510277 (=> (not res!1030180) (not e!843394))))

(assert (=> b!1510277 (= res!1030180 (and (= (size!49148 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49148 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49148 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1510278 () Bool)

(assert (=> b!1510278 (= e!843394 e!843391)))

(declare-fun res!1030182 () Bool)

(assert (=> b!1510278 (=> (not res!1030182) (not e!843391))))

(assert (=> b!1510278 (= res!1030182 (= lt!655126 lt!655124))))

(assert (=> b!1510278 (= lt!655124 (Intermediate!12769 false resIndex!21 resX!21))))

(assert (=> b!1510278 (= lt!655126 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48598 a!2804) j!70) mask!2512) (select (arr!48598 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1510280 () Bool)

(declare-fun res!1030178 () Bool)

(assert (=> b!1510280 (=> (not res!1030178) (not e!843394))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100722 (_ BitVec 32)) Bool)

(assert (=> b!1510280 (= res!1030178 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun res!1030181 () Bool)

(assert (=> start!128866 (=> (not res!1030181) (not e!843394))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128866 (= res!1030181 (validMask!0 mask!2512))))

(assert (=> start!128866 e!843394))

(assert (=> start!128866 true))

(declare-fun array_inv!37626 (array!100722) Bool)

(assert (=> start!128866 (array_inv!37626 a!2804)))

(declare-fun b!1510279 () Bool)

(assert (=> b!1510279 (= e!843391 (not true))))

(assert (=> b!1510279 e!843392))

(declare-fun res!1030174 () Bool)

(assert (=> b!1510279 (=> (not res!1030174) (not e!843392))))

(assert (=> b!1510279 (= res!1030174 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50406 0))(
  ( (Unit!50407) )
))
(declare-fun lt!655125 () Unit!50406)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100722 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50406)

(assert (=> b!1510279 (= lt!655125 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(assert (= (and start!128866 res!1030181) b!1510277))

(assert (= (and b!1510277 res!1030180) b!1510276))

(assert (= (and b!1510276 res!1030183) b!1510271))

(assert (= (and b!1510271 res!1030173) b!1510280))

(assert (= (and b!1510280 res!1030178) b!1510273))

(assert (= (and b!1510273 res!1030177) b!1510270))

(assert (= (and b!1510270 res!1030179) b!1510278))

(assert (= (and b!1510278 res!1030182) b!1510275))

(assert (= (and b!1510275 res!1030176) b!1510272))

(assert (= (and b!1510272 res!1030175) b!1510279))

(assert (= (and b!1510279 res!1030174) b!1510274))

(declare-fun m!1392841 () Bool)

(assert (=> b!1510275 m!1392841))

(assert (=> b!1510275 m!1392841))

(declare-fun m!1392843 () Bool)

(assert (=> b!1510275 m!1392843))

(declare-fun m!1392845 () Bool)

(assert (=> b!1510280 m!1392845))

(declare-fun m!1392847 () Bool)

(assert (=> b!1510273 m!1392847))

(assert (=> b!1510274 m!1392841))

(assert (=> b!1510274 m!1392841))

(declare-fun m!1392849 () Bool)

(assert (=> b!1510274 m!1392849))

(declare-fun m!1392851 () Bool)

(assert (=> b!1510272 m!1392851))

(declare-fun m!1392853 () Bool)

(assert (=> b!1510272 m!1392853))

(assert (=> b!1510272 m!1392853))

(declare-fun m!1392855 () Bool)

(assert (=> b!1510272 m!1392855))

(assert (=> b!1510272 m!1392855))

(assert (=> b!1510272 m!1392853))

(declare-fun m!1392857 () Bool)

(assert (=> b!1510272 m!1392857))

(assert (=> b!1510271 m!1392841))

(assert (=> b!1510271 m!1392841))

(declare-fun m!1392859 () Bool)

(assert (=> b!1510271 m!1392859))

(declare-fun m!1392861 () Bool)

(assert (=> start!128866 m!1392861))

(declare-fun m!1392863 () Bool)

(assert (=> start!128866 m!1392863))

(declare-fun m!1392865 () Bool)

(assert (=> b!1510276 m!1392865))

(assert (=> b!1510276 m!1392865))

(declare-fun m!1392867 () Bool)

(assert (=> b!1510276 m!1392867))

(declare-fun m!1392869 () Bool)

(assert (=> b!1510279 m!1392869))

(declare-fun m!1392871 () Bool)

(assert (=> b!1510279 m!1392871))

(assert (=> b!1510278 m!1392841))

(assert (=> b!1510278 m!1392841))

(declare-fun m!1392873 () Bool)

(assert (=> b!1510278 m!1392873))

(assert (=> b!1510278 m!1392873))

(assert (=> b!1510278 m!1392841))

(declare-fun m!1392875 () Bool)

(assert (=> b!1510278 m!1392875))

(push 1)

(assert (not b!1510280))

(assert (not start!128866))

(assert (not b!1510276))

(assert (not b!1510275))

(assert (not b!1510279))

(assert (not b!1510272))

(assert (not b!1510271))

