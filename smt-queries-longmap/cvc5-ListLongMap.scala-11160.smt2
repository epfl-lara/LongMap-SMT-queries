; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130442 () Bool)

(assert start!130442)

(declare-fun b!1530924 () Bool)

(declare-fun res!1048276 () Bool)

(declare-fun e!853065 () Bool)

(assert (=> b!1530924 (=> (not res!1048276) (not e!853065))))

(declare-datatypes ((array!101678 0))(
  ( (array!101679 (arr!49061 (Array (_ BitVec 32) (_ BitVec 64))) (size!49611 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101678)

(declare-datatypes ((List!35544 0))(
  ( (Nil!35541) (Cons!35540 (h!36982 (_ BitVec 64)) (t!50238 List!35544)) )
))
(declare-fun arrayNoDuplicates!0 (array!101678 (_ BitVec 32) List!35544) Bool)

(assert (=> b!1530924 (= res!1048276 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35541))))

(declare-fun res!1048271 () Bool)

(assert (=> start!130442 (=> (not res!1048271) (not e!853065))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130442 (= res!1048271 (validMask!0 mask!2512))))

(assert (=> start!130442 e!853065))

(assert (=> start!130442 true))

(declare-fun array_inv!38089 (array!101678) Bool)

(assert (=> start!130442 (array_inv!38089 a!2804)))

(declare-fun b!1530925 () Bool)

(declare-fun res!1048269 () Bool)

(assert (=> b!1530925 (=> (not res!1048269) (not e!853065))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(assert (=> b!1530925 (= res!1048269 (and (= (size!49611 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49611 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49611 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1530926 () Bool)

(declare-fun res!1048266 () Bool)

(assert (=> b!1530926 (=> (not res!1048266) (not e!853065))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1530926 (= res!1048266 (validKeyInArray!0 (select (arr!49061 a!2804) i!961)))))

(declare-fun b!1530927 () Bool)

(declare-fun e!853063 () Bool)

(assert (=> b!1530927 (= e!853065 e!853063)))

(declare-fun res!1048272 () Bool)

(assert (=> b!1530927 (=> (not res!1048272) (not e!853063))))

(declare-datatypes ((SeekEntryResult!13226 0))(
  ( (MissingZero!13226 (index!55299 (_ BitVec 32))) (Found!13226 (index!55300 (_ BitVec 32))) (Intermediate!13226 (undefined!14038 Bool) (index!55301 (_ BitVec 32)) (x!136995 (_ BitVec 32))) (Undefined!13226) (MissingVacant!13226 (index!55302 (_ BitVec 32))) )
))
(declare-fun lt!663028 () SeekEntryResult!13226)

(declare-fun lt!663031 () SeekEntryResult!13226)

(assert (=> b!1530927 (= res!1048272 (= lt!663028 lt!663031))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1530927 (= lt!663031 (Intermediate!13226 false resIndex!21 resX!21))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101678 (_ BitVec 32)) SeekEntryResult!13226)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1530927 (= lt!663028 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49061 a!2804) j!70) mask!2512) (select (arr!49061 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1530928 () Bool)

(declare-fun res!1048270 () Bool)

(assert (=> b!1530928 (=> (not res!1048270) (not e!853063))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1530928 (= res!1048270 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49061 a!2804) j!70) a!2804 mask!2512) lt!663031))))

(declare-fun b!1530929 () Bool)

(declare-fun e!853062 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101678 (_ BitVec 32)) SeekEntryResult!13226)

(assert (=> b!1530929 (= e!853062 (= (seekEntry!0 (select (arr!49061 a!2804) j!70) a!2804 mask!2512) (Found!13226 j!70)))))

(declare-fun b!1530930 () Bool)

(declare-fun res!1048273 () Bool)

(assert (=> b!1530930 (=> (not res!1048273) (not e!853065))))

(assert (=> b!1530930 (= res!1048273 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49611 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49611 a!2804))))))

(declare-fun b!1530931 () Bool)

(declare-fun e!853066 () Bool)

(assert (=> b!1530931 (= e!853063 (not e!853066))))

(declare-fun res!1048265 () Bool)

(assert (=> b!1530931 (=> res!1048265 e!853066)))

(assert (=> b!1530931 (= res!1048265 (or (not (= (select (arr!49061 a!2804) j!70) (select (store (arr!49061 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(assert (=> b!1530931 e!853062))

(declare-fun res!1048274 () Bool)

(assert (=> b!1530931 (=> (not res!1048274) (not e!853062))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101678 (_ BitVec 32)) Bool)

(assert (=> b!1530931 (= res!1048274 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51236 0))(
  ( (Unit!51237) )
))
(declare-fun lt!663030 () Unit!51236)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101678 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51236)

(assert (=> b!1530931 (= lt!663030 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1530932 () Bool)

(declare-fun res!1048267 () Bool)

(assert (=> b!1530932 (=> (not res!1048267) (not e!853063))))

(assert (=> b!1530932 (= res!1048267 (= lt!663028 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!49061 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!49061 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101679 (store (arr!49061 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49611 a!2804)) mask!2512)))))

(declare-fun b!1530933 () Bool)

(declare-fun res!1048275 () Bool)

(assert (=> b!1530933 (=> (not res!1048275) (not e!853065))))

(assert (=> b!1530933 (= res!1048275 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1530934 () Bool)

(declare-fun res!1048268 () Bool)

(assert (=> b!1530934 (=> (not res!1048268) (not e!853065))))

(assert (=> b!1530934 (= res!1048268 (validKeyInArray!0 (select (arr!49061 a!2804) j!70)))))

(declare-fun b!1530935 () Bool)

(assert (=> b!1530935 (= e!853066 true)))

(declare-fun lt!663029 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1530935 (= lt!663029 (nextIndex!0 index!487 x!534 mask!2512))))

(assert (= (and start!130442 res!1048271) b!1530925))

(assert (= (and b!1530925 res!1048269) b!1530926))

(assert (= (and b!1530926 res!1048266) b!1530934))

(assert (= (and b!1530934 res!1048268) b!1530933))

(assert (= (and b!1530933 res!1048275) b!1530924))

(assert (= (and b!1530924 res!1048276) b!1530930))

(assert (= (and b!1530930 res!1048273) b!1530927))

(assert (= (and b!1530927 res!1048272) b!1530928))

(assert (= (and b!1530928 res!1048270) b!1530932))

(assert (= (and b!1530932 res!1048267) b!1530931))

(assert (= (and b!1530931 res!1048274) b!1530929))

(assert (= (and b!1530931 (not res!1048265)) b!1530935))

(declare-fun m!1413693 () Bool)

(assert (=> b!1530929 m!1413693))

(assert (=> b!1530929 m!1413693))

(declare-fun m!1413695 () Bool)

(assert (=> b!1530929 m!1413695))

(declare-fun m!1413697 () Bool)

(assert (=> start!130442 m!1413697))

(declare-fun m!1413699 () Bool)

(assert (=> start!130442 m!1413699))

(assert (=> b!1530934 m!1413693))

(assert (=> b!1530934 m!1413693))

(declare-fun m!1413701 () Bool)

(assert (=> b!1530934 m!1413701))

(declare-fun m!1413703 () Bool)

(assert (=> b!1530933 m!1413703))

(declare-fun m!1413705 () Bool)

(assert (=> b!1530926 m!1413705))

(assert (=> b!1530926 m!1413705))

(declare-fun m!1413707 () Bool)

(assert (=> b!1530926 m!1413707))

(assert (=> b!1530928 m!1413693))

(assert (=> b!1530928 m!1413693))

(declare-fun m!1413709 () Bool)

(assert (=> b!1530928 m!1413709))

(declare-fun m!1413711 () Bool)

(assert (=> b!1530935 m!1413711))

(declare-fun m!1413713 () Bool)

(assert (=> b!1530924 m!1413713))

(declare-fun m!1413715 () Bool)

(assert (=> b!1530932 m!1413715))

(declare-fun m!1413717 () Bool)

(assert (=> b!1530932 m!1413717))

(assert (=> b!1530932 m!1413717))

(declare-fun m!1413719 () Bool)

(assert (=> b!1530932 m!1413719))

(assert (=> b!1530932 m!1413719))

(assert (=> b!1530932 m!1413717))

(declare-fun m!1413721 () Bool)

(assert (=> b!1530932 m!1413721))

(assert (=> b!1530931 m!1413693))

(declare-fun m!1413723 () Bool)

(assert (=> b!1530931 m!1413723))

(assert (=> b!1530931 m!1413715))

(assert (=> b!1530931 m!1413717))

(declare-fun m!1413725 () Bool)

(assert (=> b!1530931 m!1413725))

(assert (=> b!1530927 m!1413693))

(assert (=> b!1530927 m!1413693))

(declare-fun m!1413727 () Bool)

(assert (=> b!1530927 m!1413727))

(assert (=> b!1530927 m!1413727))

(assert (=> b!1530927 m!1413693))

(declare-fun m!1413729 () Bool)

(assert (=> b!1530927 m!1413729))

(push 1)

