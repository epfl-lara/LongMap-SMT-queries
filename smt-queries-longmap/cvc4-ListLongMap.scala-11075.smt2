; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129286 () Bool)

(assert start!129286)

(declare-fun b!1518332 () Bool)

(declare-fun res!1038242 () Bool)

(declare-fun e!847026 () Bool)

(assert (=> b!1518332 (=> (not res!1038242) (not e!847026))))

(declare-datatypes ((array!101142 0))(
  ( (array!101143 (arr!48808 (Array (_ BitVec 32) (_ BitVec 64))) (size!49358 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101142)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101142 (_ BitVec 32)) Bool)

(assert (=> b!1518332 (= res!1038242 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1518333 () Bool)

(declare-fun res!1038240 () Bool)

(assert (=> b!1518333 (=> (not res!1038240) (not e!847026))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1518333 (= res!1038240 (validKeyInArray!0 (select (arr!48808 a!2804) j!70)))))

(declare-fun b!1518334 () Bool)

(declare-fun res!1038239 () Bool)

(assert (=> b!1518334 (=> (not res!1038239) (not e!847026))))

(declare-datatypes ((List!35291 0))(
  ( (Nil!35288) (Cons!35287 (h!36699 (_ BitVec 64)) (t!49985 List!35291)) )
))
(declare-fun arrayNoDuplicates!0 (array!101142 (_ BitVec 32) List!35291) Bool)

(assert (=> b!1518334 (= res!1038239 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35288))))

(declare-fun b!1518335 () Bool)

(declare-fun e!847028 () Bool)

(declare-fun e!847025 () Bool)

(assert (=> b!1518335 (= e!847028 e!847025)))

(declare-fun res!1038238 () Bool)

(assert (=> b!1518335 (=> res!1038238 e!847025)))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun lt!658129 () (_ BitVec 32))

(assert (=> b!1518335 (= res!1038238 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!658129 #b00000000000000000000000000000000) (bvsge lt!658129 (size!49358 a!2804))))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1518335 (= lt!658129 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun res!1038245 () Bool)

(assert (=> start!129286 (=> (not res!1038245) (not e!847026))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129286 (= res!1038245 (validMask!0 mask!2512))))

(assert (=> start!129286 e!847026))

(assert (=> start!129286 true))

(declare-fun array_inv!37836 (array!101142) Bool)

(assert (=> start!129286 (array_inv!37836 a!2804)))

(declare-fun b!1518336 () Bool)

(declare-fun e!847029 () Bool)

(assert (=> b!1518336 (= e!847029 (not e!847028))))

(declare-fun res!1038241 () Bool)

(assert (=> b!1518336 (=> res!1038241 e!847028)))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1518336 (= res!1038241 (or (not (= (select (arr!48808 a!2804) j!70) (select (store (arr!48808 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(declare-fun e!847030 () Bool)

(assert (=> b!1518336 e!847030))

(declare-fun res!1038235 () Bool)

(assert (=> b!1518336 (=> (not res!1038235) (not e!847030))))

(assert (=> b!1518336 (= res!1038235 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50826 0))(
  ( (Unit!50827) )
))
(declare-fun lt!658128 () Unit!50826)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101142 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50826)

(assert (=> b!1518336 (= lt!658128 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1518337 () Bool)

(declare-fun res!1038243 () Bool)

(assert (=> b!1518337 (=> (not res!1038243) (not e!847029))))

(declare-datatypes ((SeekEntryResult!12979 0))(
  ( (MissingZero!12979 (index!54311 (_ BitVec 32))) (Found!12979 (index!54312 (_ BitVec 32))) (Intermediate!12979 (undefined!13791 Bool) (index!54313 (_ BitVec 32)) (x!135985 (_ BitVec 32))) (Undefined!12979) (MissingVacant!12979 (index!54314 (_ BitVec 32))) )
))
(declare-fun lt!658130 () SeekEntryResult!12979)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101142 (_ BitVec 32)) SeekEntryResult!12979)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1518337 (= res!1038243 (= lt!658130 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48808 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48808 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101143 (store (arr!48808 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49358 a!2804)) mask!2512)))))

(declare-fun b!1518338 () Bool)

(assert (=> b!1518338 (= e!847025 true)))

(declare-fun lt!658131 () SeekEntryResult!12979)

(assert (=> b!1518338 (= lt!658131 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!658129 (select (arr!48808 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1518339 () Bool)

(declare-fun res!1038236 () Bool)

(assert (=> b!1518339 (=> (not res!1038236) (not e!847026))))

(assert (=> b!1518339 (= res!1038236 (validKeyInArray!0 (select (arr!48808 a!2804) i!961)))))

(declare-fun b!1518340 () Bool)

(declare-fun res!1038246 () Bool)

(assert (=> b!1518340 (=> (not res!1038246) (not e!847026))))

(assert (=> b!1518340 (= res!1038246 (and (= (size!49358 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49358 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49358 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1518341 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101142 (_ BitVec 32)) SeekEntryResult!12979)

(assert (=> b!1518341 (= e!847030 (= (seekEntry!0 (select (arr!48808 a!2804) j!70) a!2804 mask!2512) (Found!12979 j!70)))))

(declare-fun b!1518342 () Bool)

(declare-fun res!1038244 () Bool)

(assert (=> b!1518342 (=> (not res!1038244) (not e!847029))))

(declare-fun lt!658132 () SeekEntryResult!12979)

(assert (=> b!1518342 (= res!1038244 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48808 a!2804) j!70) a!2804 mask!2512) lt!658132))))

(declare-fun b!1518343 () Bool)

(declare-fun res!1038247 () Bool)

(assert (=> b!1518343 (=> (not res!1038247) (not e!847026))))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1518343 (= res!1038247 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49358 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49358 a!2804))))))

(declare-fun b!1518344 () Bool)

(assert (=> b!1518344 (= e!847026 e!847029)))

(declare-fun res!1038237 () Bool)

(assert (=> b!1518344 (=> (not res!1038237) (not e!847029))))

(assert (=> b!1518344 (= res!1038237 (= lt!658130 lt!658132))))

(assert (=> b!1518344 (= lt!658132 (Intermediate!12979 false resIndex!21 resX!21))))

(assert (=> b!1518344 (= lt!658130 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48808 a!2804) j!70) mask!2512) (select (arr!48808 a!2804) j!70) a!2804 mask!2512))))

(assert (= (and start!129286 res!1038245) b!1518340))

(assert (= (and b!1518340 res!1038246) b!1518339))

(assert (= (and b!1518339 res!1038236) b!1518333))

(assert (= (and b!1518333 res!1038240) b!1518332))

(assert (= (and b!1518332 res!1038242) b!1518334))

(assert (= (and b!1518334 res!1038239) b!1518343))

(assert (= (and b!1518343 res!1038247) b!1518344))

(assert (= (and b!1518344 res!1038237) b!1518342))

(assert (= (and b!1518342 res!1038244) b!1518337))

(assert (= (and b!1518337 res!1038243) b!1518336))

(assert (= (and b!1518336 res!1038235) b!1518341))

(assert (= (and b!1518336 (not res!1038241)) b!1518335))

(assert (= (and b!1518335 (not res!1038238)) b!1518338))

(declare-fun m!1401645 () Bool)

(assert (=> b!1518336 m!1401645))

(declare-fun m!1401647 () Bool)

(assert (=> b!1518336 m!1401647))

(declare-fun m!1401649 () Bool)

(assert (=> b!1518336 m!1401649))

(declare-fun m!1401651 () Bool)

(assert (=> b!1518336 m!1401651))

(declare-fun m!1401653 () Bool)

(assert (=> b!1518336 m!1401653))

(assert (=> b!1518337 m!1401649))

(assert (=> b!1518337 m!1401651))

(assert (=> b!1518337 m!1401651))

(declare-fun m!1401655 () Bool)

(assert (=> b!1518337 m!1401655))

(assert (=> b!1518337 m!1401655))

(assert (=> b!1518337 m!1401651))

(declare-fun m!1401657 () Bool)

(assert (=> b!1518337 m!1401657))

(declare-fun m!1401659 () Bool)

(assert (=> b!1518334 m!1401659))

(assert (=> b!1518338 m!1401645))

(assert (=> b!1518338 m!1401645))

(declare-fun m!1401661 () Bool)

(assert (=> b!1518338 m!1401661))

(assert (=> b!1518344 m!1401645))

(assert (=> b!1518344 m!1401645))

(declare-fun m!1401663 () Bool)

(assert (=> b!1518344 m!1401663))

(assert (=> b!1518344 m!1401663))

(assert (=> b!1518344 m!1401645))

(declare-fun m!1401665 () Bool)

(assert (=> b!1518344 m!1401665))

(declare-fun m!1401667 () Bool)

(assert (=> b!1518339 m!1401667))

(assert (=> b!1518339 m!1401667))

(declare-fun m!1401669 () Bool)

(assert (=> b!1518339 m!1401669))

(assert (=> b!1518342 m!1401645))

(assert (=> b!1518342 m!1401645))

(declare-fun m!1401671 () Bool)

(assert (=> b!1518342 m!1401671))

(declare-fun m!1401673 () Bool)

(assert (=> b!1518335 m!1401673))

(declare-fun m!1401675 () Bool)

(assert (=> start!129286 m!1401675))

(declare-fun m!1401677 () Bool)

(assert (=> start!129286 m!1401677))

(declare-fun m!1401679 () Bool)

(assert (=> b!1518332 m!1401679))

(assert (=> b!1518341 m!1401645))

(assert (=> b!1518341 m!1401645))

(declare-fun m!1401681 () Bool)

(assert (=> b!1518341 m!1401681))

(assert (=> b!1518333 m!1401645))

(assert (=> b!1518333 m!1401645))

(declare-fun m!1401683 () Bool)

(assert (=> b!1518333 m!1401683))

(push 1)

