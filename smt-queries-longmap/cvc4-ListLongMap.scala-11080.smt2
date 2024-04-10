; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129316 () Bool)

(assert start!129316)

(declare-fun b!1518952 () Bool)

(declare-fun e!847334 () Bool)

(declare-fun e!847332 () Bool)

(assert (=> b!1518952 (= e!847334 e!847332)))

(declare-fun res!1038866 () Bool)

(assert (=> b!1518952 (=> res!1038866 e!847332)))

(declare-fun lt!658427 () (_ BitVec 32))

(declare-datatypes ((array!101172 0))(
  ( (array!101173 (arr!48823 (Array (_ BitVec 32) (_ BitVec 64))) (size!49373 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101172)

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1518952 (= res!1038866 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!658427 #b00000000000000000000000000000000) (bvsge lt!658427 (size!49373 a!2804))))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1518952 (= lt!658427 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1518953 () Bool)

(declare-fun res!1038855 () Bool)

(declare-fun e!847330 () Bool)

(assert (=> b!1518953 (=> (not res!1038855) (not e!847330))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1518953 (= res!1038855 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49373 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49373 a!2804))))))

(declare-fun b!1518954 () Bool)

(declare-fun res!1038859 () Bool)

(assert (=> b!1518954 (=> res!1038859 e!847332)))

(declare-fun j!70 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12994 0))(
  ( (MissingZero!12994 (index!54371 (_ BitVec 32))) (Found!12994 (index!54372 (_ BitVec 32))) (Intermediate!12994 (undefined!13806 Bool) (index!54373 (_ BitVec 32)) (x!136040 (_ BitVec 32))) (Undefined!12994) (MissingVacant!12994 (index!54374 (_ BitVec 32))) )
))
(declare-fun lt!658424 () SeekEntryResult!12994)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101172 (_ BitVec 32)) SeekEntryResult!12994)

(assert (=> b!1518954 (= res!1038859 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!658427 (select (arr!48823 a!2804) j!70) a!2804 mask!2512) lt!658424)))))

(declare-fun b!1518955 () Bool)

(declare-fun res!1038867 () Bool)

(assert (=> b!1518955 (=> (not res!1038867) (not e!847330))))

(declare-datatypes ((List!35306 0))(
  ( (Nil!35303) (Cons!35302 (h!36714 (_ BitVec 64)) (t!50000 List!35306)) )
))
(declare-fun arrayNoDuplicates!0 (array!101172 (_ BitVec 32) List!35306) Bool)

(assert (=> b!1518955 (= res!1038867 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35303))))

(declare-fun b!1518956 () Bool)

(declare-fun e!847336 () Bool)

(declare-fun e!847335 () Bool)

(assert (=> b!1518956 (= e!847336 e!847335)))

(declare-fun res!1038860 () Bool)

(assert (=> b!1518956 (=> (not res!1038860) (not e!847335))))

(declare-fun lt!658426 () SeekEntryResult!12994)

(declare-fun lt!658428 () (_ BitVec 64))

(declare-fun lt!658429 () array!101172)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1518956 (= res!1038860 (= lt!658426 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!658428 mask!2512) lt!658428 lt!658429 mask!2512)))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1518956 (= lt!658428 (select (store (arr!48823 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1518956 (= lt!658429 (array!101173 (store (arr!48823 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49373 a!2804)))))

(declare-fun b!1518957 () Bool)

(declare-fun e!847331 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101172 (_ BitVec 32)) SeekEntryResult!12994)

(assert (=> b!1518957 (= e!847331 (= (seekEntry!0 (select (arr!48823 a!2804) j!70) a!2804 mask!2512) (Found!12994 j!70)))))

(declare-fun b!1518958 () Bool)

(declare-fun res!1038863 () Bool)

(assert (=> b!1518958 (=> (not res!1038863) (not e!847330))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1518958 (= res!1038863 (validKeyInArray!0 (select (arr!48823 a!2804) i!961)))))

(declare-fun res!1038865 () Bool)

(assert (=> start!129316 (=> (not res!1038865) (not e!847330))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129316 (= res!1038865 (validMask!0 mask!2512))))

(assert (=> start!129316 e!847330))

(assert (=> start!129316 true))

(declare-fun array_inv!37851 (array!101172) Bool)

(assert (=> start!129316 (array_inv!37851 a!2804)))

(declare-fun b!1518959 () Bool)

(declare-fun res!1038864 () Bool)

(assert (=> b!1518959 (=> (not res!1038864) (not e!847330))))

(assert (=> b!1518959 (= res!1038864 (and (= (size!49373 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49373 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49373 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1518960 () Bool)

(assert (=> b!1518960 (= e!847330 e!847336)))

(declare-fun res!1038861 () Bool)

(assert (=> b!1518960 (=> (not res!1038861) (not e!847336))))

(assert (=> b!1518960 (= res!1038861 (= lt!658426 lt!658424))))

(assert (=> b!1518960 (= lt!658424 (Intermediate!12994 false resIndex!21 resX!21))))

(assert (=> b!1518960 (= lt!658426 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48823 a!2804) j!70) mask!2512) (select (arr!48823 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1518961 () Bool)

(declare-fun res!1038857 () Bool)

(assert (=> b!1518961 (=> (not res!1038857) (not e!847330))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101172 (_ BitVec 32)) Bool)

(assert (=> b!1518961 (= res!1038857 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1518962 () Bool)

(assert (=> b!1518962 (= e!847332 true)))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101172 (_ BitVec 32)) SeekEntryResult!12994)

(assert (=> b!1518962 (= (seekEntryOrOpen!0 (select (arr!48823 a!2804) j!70) a!2804 mask!2512) (seekEntryOrOpen!0 lt!658428 lt!658429 mask!2512))))

(declare-datatypes ((Unit!50856 0))(
  ( (Unit!50857) )
))
(declare-fun lt!658425 () Unit!50856)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 (array!101172 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50856)

(assert (=> b!1518962 (= lt!658425 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 a!2804 i!961 j!70 (bvadd #b00000000000000000000000000000001 x!534) lt!658427 resX!21 resIndex!21 mask!2512))))

(declare-fun b!1518963 () Bool)

(assert (=> b!1518963 (= e!847335 (not e!847334))))

(declare-fun res!1038868 () Bool)

(assert (=> b!1518963 (=> res!1038868 e!847334)))

(assert (=> b!1518963 (= res!1038868 (or (not (= (select (arr!48823 a!2804) j!70) lt!658428)) (= x!534 resX!21)))))

(assert (=> b!1518963 e!847331))

(declare-fun res!1038862 () Bool)

(assert (=> b!1518963 (=> (not res!1038862) (not e!847331))))

(assert (=> b!1518963 (= res!1038862 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-fun lt!658423 () Unit!50856)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101172 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50856)

(assert (=> b!1518963 (= lt!658423 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1518964 () Bool)

(declare-fun res!1038856 () Bool)

(assert (=> b!1518964 (=> (not res!1038856) (not e!847336))))

(assert (=> b!1518964 (= res!1038856 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48823 a!2804) j!70) a!2804 mask!2512) lt!658424))))

(declare-fun b!1518965 () Bool)

(declare-fun res!1038858 () Bool)

(assert (=> b!1518965 (=> (not res!1038858) (not e!847330))))

(assert (=> b!1518965 (= res!1038858 (validKeyInArray!0 (select (arr!48823 a!2804) j!70)))))

(assert (= (and start!129316 res!1038865) b!1518959))

(assert (= (and b!1518959 res!1038864) b!1518958))

(assert (= (and b!1518958 res!1038863) b!1518965))

(assert (= (and b!1518965 res!1038858) b!1518961))

(assert (= (and b!1518961 res!1038857) b!1518955))

(assert (= (and b!1518955 res!1038867) b!1518953))

(assert (= (and b!1518953 res!1038855) b!1518960))

(assert (= (and b!1518960 res!1038861) b!1518964))

(assert (= (and b!1518964 res!1038856) b!1518956))

(assert (= (and b!1518956 res!1038860) b!1518963))

(assert (= (and b!1518963 res!1038862) b!1518957))

(assert (= (and b!1518963 (not res!1038868)) b!1518952))

(assert (= (and b!1518952 (not res!1038866)) b!1518954))

(assert (= (and b!1518954 (not res!1038859)) b!1518962))

(declare-fun m!1402311 () Bool)

(assert (=> start!129316 m!1402311))

(declare-fun m!1402313 () Bool)

(assert (=> start!129316 m!1402313))

(declare-fun m!1402315 () Bool)

(assert (=> b!1518958 m!1402315))

(assert (=> b!1518958 m!1402315))

(declare-fun m!1402317 () Bool)

(assert (=> b!1518958 m!1402317))

(declare-fun m!1402319 () Bool)

(assert (=> b!1518962 m!1402319))

(assert (=> b!1518962 m!1402319))

(declare-fun m!1402321 () Bool)

(assert (=> b!1518962 m!1402321))

(declare-fun m!1402323 () Bool)

(assert (=> b!1518962 m!1402323))

(declare-fun m!1402325 () Bool)

(assert (=> b!1518962 m!1402325))

(declare-fun m!1402327 () Bool)

(assert (=> b!1518952 m!1402327))

(assert (=> b!1518957 m!1402319))

(assert (=> b!1518957 m!1402319))

(declare-fun m!1402329 () Bool)

(assert (=> b!1518957 m!1402329))

(assert (=> b!1518960 m!1402319))

(assert (=> b!1518960 m!1402319))

(declare-fun m!1402331 () Bool)

(assert (=> b!1518960 m!1402331))

(assert (=> b!1518960 m!1402331))

(assert (=> b!1518960 m!1402319))

(declare-fun m!1402333 () Bool)

(assert (=> b!1518960 m!1402333))

(declare-fun m!1402335 () Bool)

(assert (=> b!1518961 m!1402335))

(assert (=> b!1518964 m!1402319))

(assert (=> b!1518964 m!1402319))

(declare-fun m!1402337 () Bool)

(assert (=> b!1518964 m!1402337))

(declare-fun m!1402339 () Bool)

(assert (=> b!1518955 m!1402339))

(declare-fun m!1402341 () Bool)

(assert (=> b!1518956 m!1402341))

(assert (=> b!1518956 m!1402341))

(declare-fun m!1402343 () Bool)

(assert (=> b!1518956 m!1402343))

(declare-fun m!1402345 () Bool)

(assert (=> b!1518956 m!1402345))

(declare-fun m!1402347 () Bool)

(assert (=> b!1518956 m!1402347))

(assert (=> b!1518963 m!1402319))

(declare-fun m!1402349 () Bool)

(assert (=> b!1518963 m!1402349))

(declare-fun m!1402351 () Bool)

(assert (=> b!1518963 m!1402351))

(assert (=> b!1518954 m!1402319))

(assert (=> b!1518954 m!1402319))

(declare-fun m!1402353 () Bool)

(assert (=> b!1518954 m!1402353))

(assert (=> b!1518965 m!1402319))

(assert (=> b!1518965 m!1402319))

(declare-fun m!1402355 () Bool)

(assert (=> b!1518965 m!1402355))

(push 1)

