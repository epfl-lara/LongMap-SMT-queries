; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130554 () Bool)

(assert start!130554)

(declare-fun b!1532293 () Bool)

(declare-fun res!1049442 () Bool)

(declare-fun e!853760 () Bool)

(assert (=> b!1532293 (=> (not res!1049442) (not e!853760))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101733 0))(
  ( (array!101734 (arr!49087 (Array (_ BitVec 32) (_ BitVec 64))) (size!49637 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101733)

(assert (=> b!1532293 (= res!1049442 (and (= (size!49637 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49637 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49637 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1532294 () Bool)

(declare-fun e!853756 () Bool)

(declare-fun e!853757 () Bool)

(assert (=> b!1532294 (= e!853756 e!853757)))

(declare-fun res!1049443 () Bool)

(assert (=> b!1532294 (=> res!1049443 e!853757)))

(declare-fun lt!663634 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1532294 (= res!1049443 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!663634 #b00000000000000000000000000000000) (bvsge lt!663634 (size!49637 a!2804))))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1532294 (= lt!663634 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1532295 () Bool)

(declare-fun res!1049446 () Bool)

(assert (=> b!1532295 (=> (not res!1049446) (not e!853760))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1532295 (= res!1049446 (validKeyInArray!0 (select (arr!49087 a!2804) j!70)))))

(declare-fun b!1532296 () Bool)

(declare-fun res!1049436 () Bool)

(assert (=> b!1532296 (=> (not res!1049436) (not e!853760))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101733 (_ BitVec 32)) Bool)

(assert (=> b!1532296 (= res!1049436 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1532297 () Bool)

(declare-fun e!853761 () Bool)

(assert (=> b!1532297 (= e!853761 (not e!853756))))

(declare-fun res!1049441 () Bool)

(assert (=> b!1532297 (=> res!1049441 e!853756)))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun lt!663637 () (_ BitVec 64))

(assert (=> b!1532297 (= res!1049441 (or (not (= (select (arr!49087 a!2804) j!70) lt!663637)) (= x!534 resX!21)))))

(declare-fun e!853762 () Bool)

(assert (=> b!1532297 e!853762))

(declare-fun res!1049438 () Bool)

(assert (=> b!1532297 (=> (not res!1049438) (not e!853762))))

(assert (=> b!1532297 (= res!1049438 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51288 0))(
  ( (Unit!51289) )
))
(declare-fun lt!663635 () Unit!51288)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101733 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51288)

(assert (=> b!1532297 (= lt!663635 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1532298 () Bool)

(declare-fun e!853758 () Bool)

(assert (=> b!1532298 (= e!853758 e!853761)))

(declare-fun res!1049437 () Bool)

(assert (=> b!1532298 (=> (not res!1049437) (not e!853761))))

(declare-fun lt!663631 () array!101733)

(declare-datatypes ((SeekEntryResult!13252 0))(
  ( (MissingZero!13252 (index!55403 (_ BitVec 32))) (Found!13252 (index!55404 (_ BitVec 32))) (Intermediate!13252 (undefined!14064 Bool) (index!55405 (_ BitVec 32)) (x!137094 (_ BitVec 32))) (Undefined!13252) (MissingVacant!13252 (index!55406 (_ BitVec 32))) )
))
(declare-fun lt!663636 () SeekEntryResult!13252)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101733 (_ BitVec 32)) SeekEntryResult!13252)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1532298 (= res!1049437 (= lt!663636 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!663637 mask!2512) lt!663637 lt!663631 mask!2512)))))

(assert (=> b!1532298 (= lt!663637 (select (store (arr!49087 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1532298 (= lt!663631 (array!101734 (store (arr!49087 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49637 a!2804)))))

(declare-fun b!1532299 () Bool)

(declare-fun res!1049435 () Bool)

(assert (=> b!1532299 (=> (not res!1049435) (not e!853760))))

(assert (=> b!1532299 (= res!1049435 (validKeyInArray!0 (select (arr!49087 a!2804) i!961)))))

(declare-fun b!1532300 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101733 (_ BitVec 32)) SeekEntryResult!13252)

(assert (=> b!1532300 (= e!853762 (= (seekEntry!0 (select (arr!49087 a!2804) j!70) a!2804 mask!2512) (Found!13252 j!70)))))

(declare-fun res!1049433 () Bool)

(assert (=> start!130554 (=> (not res!1049433) (not e!853760))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130554 (= res!1049433 (validMask!0 mask!2512))))

(assert (=> start!130554 e!853760))

(assert (=> start!130554 true))

(declare-fun array_inv!38115 (array!101733) Bool)

(assert (=> start!130554 (array_inv!38115 a!2804)))

(declare-fun b!1532301 () Bool)

(assert (=> b!1532301 (= e!853757 true)))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101733 (_ BitVec 32)) SeekEntryResult!13252)

(assert (=> b!1532301 (= (seekEntryOrOpen!0 (select (arr!49087 a!2804) j!70) a!2804 mask!2512) (seekEntryOrOpen!0 lt!663637 lt!663631 mask!2512))))

(declare-fun lt!663633 () Unit!51288)

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 (array!101733 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51288)

(assert (=> b!1532301 (= lt!663633 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 a!2804 i!961 j!70 (bvadd #b00000000000000000000000000000001 x!534) lt!663634 resX!21 resIndex!21 mask!2512))))

(declare-fun b!1532302 () Bool)

(declare-fun res!1049445 () Bool)

(assert (=> b!1532302 (=> (not res!1049445) (not e!853760))))

(assert (=> b!1532302 (= res!1049445 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49637 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49637 a!2804))))))

(declare-fun b!1532303 () Bool)

(declare-fun res!1049444 () Bool)

(assert (=> b!1532303 (=> res!1049444 e!853757)))

(declare-fun lt!663632 () SeekEntryResult!13252)

(assert (=> b!1532303 (= res!1049444 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!663634 (select (arr!49087 a!2804) j!70) a!2804 mask!2512) lt!663632)))))

(declare-fun b!1532304 () Bool)

(declare-fun res!1049439 () Bool)

(assert (=> b!1532304 (=> (not res!1049439) (not e!853758))))

(assert (=> b!1532304 (= res!1049439 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49087 a!2804) j!70) a!2804 mask!2512) lt!663632))))

(declare-fun b!1532305 () Bool)

(assert (=> b!1532305 (= e!853760 e!853758)))

(declare-fun res!1049440 () Bool)

(assert (=> b!1532305 (=> (not res!1049440) (not e!853758))))

(assert (=> b!1532305 (= res!1049440 (= lt!663636 lt!663632))))

(assert (=> b!1532305 (= lt!663632 (Intermediate!13252 false resIndex!21 resX!21))))

(assert (=> b!1532305 (= lt!663636 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49087 a!2804) j!70) mask!2512) (select (arr!49087 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1532306 () Bool)

(declare-fun res!1049434 () Bool)

(assert (=> b!1532306 (=> (not res!1049434) (not e!853760))))

(declare-datatypes ((List!35570 0))(
  ( (Nil!35567) (Cons!35566 (h!37011 (_ BitVec 64)) (t!50264 List!35570)) )
))
(declare-fun arrayNoDuplicates!0 (array!101733 (_ BitVec 32) List!35570) Bool)

(assert (=> b!1532306 (= res!1049434 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35567))))

(assert (= (and start!130554 res!1049433) b!1532293))

(assert (= (and b!1532293 res!1049442) b!1532299))

(assert (= (and b!1532299 res!1049435) b!1532295))

(assert (= (and b!1532295 res!1049446) b!1532296))

(assert (= (and b!1532296 res!1049436) b!1532306))

(assert (= (and b!1532306 res!1049434) b!1532302))

(assert (= (and b!1532302 res!1049445) b!1532305))

(assert (= (and b!1532305 res!1049440) b!1532304))

(assert (= (and b!1532304 res!1049439) b!1532298))

(assert (= (and b!1532298 res!1049437) b!1532297))

(assert (= (and b!1532297 res!1049438) b!1532300))

(assert (= (and b!1532297 (not res!1049441)) b!1532294))

(assert (= (and b!1532294 (not res!1049443)) b!1532303))

(assert (= (and b!1532303 (not res!1049444)) b!1532301))

(declare-fun m!1415003 () Bool)

(assert (=> start!130554 m!1415003))

(declare-fun m!1415005 () Bool)

(assert (=> start!130554 m!1415005))

(declare-fun m!1415007 () Bool)

(assert (=> b!1532297 m!1415007))

(declare-fun m!1415009 () Bool)

(assert (=> b!1532297 m!1415009))

(declare-fun m!1415011 () Bool)

(assert (=> b!1532297 m!1415011))

(assert (=> b!1532303 m!1415007))

(assert (=> b!1532303 m!1415007))

(declare-fun m!1415013 () Bool)

(assert (=> b!1532303 m!1415013))

(assert (=> b!1532301 m!1415007))

(assert (=> b!1532301 m!1415007))

(declare-fun m!1415015 () Bool)

(assert (=> b!1532301 m!1415015))

(declare-fun m!1415017 () Bool)

(assert (=> b!1532301 m!1415017))

(declare-fun m!1415019 () Bool)

(assert (=> b!1532301 m!1415019))

(assert (=> b!1532295 m!1415007))

(assert (=> b!1532295 m!1415007))

(declare-fun m!1415021 () Bool)

(assert (=> b!1532295 m!1415021))

(assert (=> b!1532304 m!1415007))

(assert (=> b!1532304 m!1415007))

(declare-fun m!1415023 () Bool)

(assert (=> b!1532304 m!1415023))

(assert (=> b!1532300 m!1415007))

(assert (=> b!1532300 m!1415007))

(declare-fun m!1415025 () Bool)

(assert (=> b!1532300 m!1415025))

(declare-fun m!1415027 () Bool)

(assert (=> b!1532298 m!1415027))

(assert (=> b!1532298 m!1415027))

(declare-fun m!1415029 () Bool)

(assert (=> b!1532298 m!1415029))

(declare-fun m!1415031 () Bool)

(assert (=> b!1532298 m!1415031))

(declare-fun m!1415033 () Bool)

(assert (=> b!1532298 m!1415033))

(declare-fun m!1415035 () Bool)

(assert (=> b!1532296 m!1415035))

(assert (=> b!1532305 m!1415007))

(assert (=> b!1532305 m!1415007))

(declare-fun m!1415037 () Bool)

(assert (=> b!1532305 m!1415037))

(assert (=> b!1532305 m!1415037))

(assert (=> b!1532305 m!1415007))

(declare-fun m!1415039 () Bool)

(assert (=> b!1532305 m!1415039))

(declare-fun m!1415041 () Bool)

(assert (=> b!1532306 m!1415041))

(declare-fun m!1415043 () Bool)

(assert (=> b!1532299 m!1415043))

(assert (=> b!1532299 m!1415043))

(declare-fun m!1415045 () Bool)

(assert (=> b!1532299 m!1415045))

(declare-fun m!1415047 () Bool)

(assert (=> b!1532294 m!1415047))

(push 1)

