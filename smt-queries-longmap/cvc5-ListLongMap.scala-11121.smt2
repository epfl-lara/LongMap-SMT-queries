; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129956 () Bool)

(assert start!129956)

(declare-fun b!1524938 () Bool)

(declare-fun e!850072 () Bool)

(declare-fun e!850074 () Bool)

(assert (=> b!1524938 (= e!850072 e!850074)))

(declare-fun res!1043305 () Bool)

(assert (=> b!1524938 (=> res!1043305 e!850074)))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!101432 0))(
  ( (array!101433 (arr!48944 (Array (_ BitVec 32) (_ BitVec 64))) (size!49494 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101432)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1524938 (= res!1043305 (or (not (= (select (arr!48944 a!2804) j!70) (select (store (arr!48944 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48944 a!2804) index!487) (select (arr!48944 a!2804) j!70)) (not (= (select (arr!48944 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1524939 () Bool)

(declare-fun res!1043303 () Bool)

(declare-fun e!850071 () Bool)

(assert (=> b!1524939 (=> (not res!1043303) (not e!850071))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1524939 (= res!1043303 (validKeyInArray!0 (select (arr!48944 a!2804) j!70)))))

(declare-fun b!1524940 () Bool)

(declare-fun res!1043307 () Bool)

(assert (=> b!1524940 (=> (not res!1043307) (not e!850071))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101432 (_ BitVec 32)) Bool)

(assert (=> b!1524940 (= res!1043307 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1524941 () Bool)

(declare-fun res!1043300 () Bool)

(declare-fun e!850075 () Bool)

(assert (=> b!1524941 (=> (not res!1043300) (not e!850075))))

(declare-datatypes ((SeekEntryResult!13109 0))(
  ( (MissingZero!13109 (index!54831 (_ BitVec 32))) (Found!13109 (index!54832 (_ BitVec 32))) (Intermediate!13109 (undefined!13921 Bool) (index!54833 (_ BitVec 32)) (x!136530 (_ BitVec 32))) (Undefined!13109) (MissingVacant!13109 (index!54834 (_ BitVec 32))) )
))
(declare-fun lt!660523 () SeekEntryResult!13109)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101432 (_ BitVec 32)) SeekEntryResult!13109)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1524941 (= res!1043300 (= lt!660523 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48944 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48944 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101433 (store (arr!48944 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49494 a!2804)) mask!2512)))))

(declare-fun b!1524942 () Bool)

(declare-fun res!1043310 () Bool)

(assert (=> b!1524942 (=> (not res!1043310) (not e!850072))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!101432 (_ BitVec 32)) SeekEntryResult!13109)

(assert (=> b!1524942 (= res!1043310 (= (seekEntry!0 (select (arr!48944 a!2804) j!70) a!2804 mask!2512) (Found!13109 j!70)))))

(declare-fun b!1524943 () Bool)

(declare-fun res!1043306 () Bool)

(assert (=> b!1524943 (=> (not res!1043306) (not e!850071))))

(assert (=> b!1524943 (= res!1043306 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49494 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49494 a!2804))))))

(declare-fun b!1524944 () Bool)

(declare-fun res!1043309 () Bool)

(assert (=> b!1524944 (=> (not res!1043309) (not e!850075))))

(declare-fun lt!660521 () SeekEntryResult!13109)

(assert (=> b!1524944 (= res!1043309 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48944 a!2804) j!70) a!2804 mask!2512) lt!660521))))

(declare-fun b!1524945 () Bool)

(assert (=> b!1524945 (= e!850075 (not true))))

(assert (=> b!1524945 e!850072))

(declare-fun res!1043304 () Bool)

(assert (=> b!1524945 (=> (not res!1043304) (not e!850072))))

(assert (=> b!1524945 (= res!1043304 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51002 0))(
  ( (Unit!51003) )
))
(declare-fun lt!660522 () Unit!51002)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101432 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51002)

(assert (=> b!1524945 (= lt!660522 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1524946 () Bool)

(declare-fun res!1043299 () Bool)

(assert (=> b!1524946 (=> (not res!1043299) (not e!850071))))

(assert (=> b!1524946 (= res!1043299 (validKeyInArray!0 (select (arr!48944 a!2804) i!961)))))

(declare-fun res!1043308 () Bool)

(assert (=> start!129956 (=> (not res!1043308) (not e!850071))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129956 (= res!1043308 (validMask!0 mask!2512))))

(assert (=> start!129956 e!850071))

(assert (=> start!129956 true))

(declare-fun array_inv!37972 (array!101432) Bool)

(assert (=> start!129956 (array_inv!37972 a!2804)))

(declare-fun b!1524947 () Bool)

(declare-fun res!1043301 () Bool)

(assert (=> b!1524947 (=> (not res!1043301) (not e!850071))))

(assert (=> b!1524947 (= res!1043301 (and (= (size!49494 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49494 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49494 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1524948 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101432 (_ BitVec 32)) SeekEntryResult!13109)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101432 (_ BitVec 32)) SeekEntryResult!13109)

(assert (=> b!1524948 (= e!850074 (= (seekEntryOrOpen!0 (select (arr!48944 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48944 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1524949 () Bool)

(assert (=> b!1524949 (= e!850071 e!850075)))

(declare-fun res!1043302 () Bool)

(assert (=> b!1524949 (=> (not res!1043302) (not e!850075))))

(assert (=> b!1524949 (= res!1043302 (= lt!660523 lt!660521))))

(assert (=> b!1524949 (= lt!660521 (Intermediate!13109 false resIndex!21 resX!21))))

(assert (=> b!1524949 (= lt!660523 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48944 a!2804) j!70) mask!2512) (select (arr!48944 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1524950 () Bool)

(declare-fun res!1043311 () Bool)

(assert (=> b!1524950 (=> (not res!1043311) (not e!850071))))

(declare-datatypes ((List!35427 0))(
  ( (Nil!35424) (Cons!35423 (h!36853 (_ BitVec 64)) (t!50121 List!35427)) )
))
(declare-fun arrayNoDuplicates!0 (array!101432 (_ BitVec 32) List!35427) Bool)

(assert (=> b!1524950 (= res!1043311 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35424))))

(assert (= (and start!129956 res!1043308) b!1524947))

(assert (= (and b!1524947 res!1043301) b!1524946))

(assert (= (and b!1524946 res!1043299) b!1524939))

(assert (= (and b!1524939 res!1043303) b!1524940))

(assert (= (and b!1524940 res!1043307) b!1524950))

(assert (= (and b!1524950 res!1043311) b!1524943))

(assert (= (and b!1524943 res!1043306) b!1524949))

(assert (= (and b!1524949 res!1043302) b!1524944))

(assert (= (and b!1524944 res!1043309) b!1524941))

(assert (= (and b!1524941 res!1043300) b!1524945))

(assert (= (and b!1524945 res!1043304) b!1524942))

(assert (= (and b!1524942 res!1043310) b!1524938))

(assert (= (and b!1524938 (not res!1043305)) b!1524948))

(declare-fun m!1407813 () Bool)

(assert (=> b!1524944 m!1407813))

(assert (=> b!1524944 m!1407813))

(declare-fun m!1407815 () Bool)

(assert (=> b!1524944 m!1407815))

(declare-fun m!1407817 () Bool)

(assert (=> b!1524946 m!1407817))

(assert (=> b!1524946 m!1407817))

(declare-fun m!1407819 () Bool)

(assert (=> b!1524946 m!1407819))

(assert (=> b!1524948 m!1407813))

(assert (=> b!1524948 m!1407813))

(declare-fun m!1407821 () Bool)

(assert (=> b!1524948 m!1407821))

(assert (=> b!1524948 m!1407813))

(declare-fun m!1407823 () Bool)

(assert (=> b!1524948 m!1407823))

(assert (=> b!1524939 m!1407813))

(assert (=> b!1524939 m!1407813))

(declare-fun m!1407825 () Bool)

(assert (=> b!1524939 m!1407825))

(declare-fun m!1407827 () Bool)

(assert (=> b!1524941 m!1407827))

(declare-fun m!1407829 () Bool)

(assert (=> b!1524941 m!1407829))

(assert (=> b!1524941 m!1407829))

(declare-fun m!1407831 () Bool)

(assert (=> b!1524941 m!1407831))

(assert (=> b!1524941 m!1407831))

(assert (=> b!1524941 m!1407829))

(declare-fun m!1407833 () Bool)

(assert (=> b!1524941 m!1407833))

(assert (=> b!1524949 m!1407813))

(assert (=> b!1524949 m!1407813))

(declare-fun m!1407835 () Bool)

(assert (=> b!1524949 m!1407835))

(assert (=> b!1524949 m!1407835))

(assert (=> b!1524949 m!1407813))

(declare-fun m!1407837 () Bool)

(assert (=> b!1524949 m!1407837))

(declare-fun m!1407839 () Bool)

(assert (=> b!1524945 m!1407839))

(declare-fun m!1407841 () Bool)

(assert (=> b!1524945 m!1407841))

(declare-fun m!1407843 () Bool)

(assert (=> b!1524940 m!1407843))

(declare-fun m!1407845 () Bool)

(assert (=> start!129956 m!1407845))

(declare-fun m!1407847 () Bool)

(assert (=> start!129956 m!1407847))

(assert (=> b!1524942 m!1407813))

(assert (=> b!1524942 m!1407813))

(declare-fun m!1407849 () Bool)

(assert (=> b!1524942 m!1407849))

(declare-fun m!1407851 () Bool)

(assert (=> b!1524950 m!1407851))

(assert (=> b!1524938 m!1407813))

(assert (=> b!1524938 m!1407827))

(assert (=> b!1524938 m!1407829))

(declare-fun m!1407853 () Bool)

(assert (=> b!1524938 m!1407853))

(push 1)

