; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129238 () Bool)

(assert start!129238)

(declare-fun b!1517396 () Bool)

(declare-fun res!1037309 () Bool)

(declare-fun e!846595 () Bool)

(assert (=> b!1517396 (=> (not res!1037309) (not e!846595))))

(declare-datatypes ((array!101094 0))(
  ( (array!101095 (arr!48784 (Array (_ BitVec 32) (_ BitVec 64))) (size!49334 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101094)

(declare-datatypes ((List!35267 0))(
  ( (Nil!35264) (Cons!35263 (h!36675 (_ BitVec 64)) (t!49961 List!35267)) )
))
(declare-fun arrayNoDuplicates!0 (array!101094 (_ BitVec 32) List!35267) Bool)

(assert (=> b!1517396 (= res!1037309 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35264))))

(declare-fun b!1517397 () Bool)

(declare-fun res!1037304 () Bool)

(assert (=> b!1517397 (=> (not res!1037304) (not e!846595))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(assert (=> b!1517397 (= res!1037304 (and (= (size!49334 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49334 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49334 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1517398 () Bool)

(declare-fun e!846597 () Bool)

(declare-fun e!846594 () Bool)

(assert (=> b!1517398 (= e!846597 e!846594)))

(declare-fun res!1037311 () Bool)

(assert (=> b!1517398 (=> res!1037311 e!846594)))

(declare-fun lt!657769 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1517398 (= res!1037311 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!657769 #b00000000000000000000000000000000) (bvsge lt!657769 (size!49334 a!2804))))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1517398 (= lt!657769 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1517399 () Bool)

(assert (=> b!1517399 (= e!846594 true)))

(declare-datatypes ((SeekEntryResult!12955 0))(
  ( (MissingZero!12955 (index!54215 (_ BitVec 32))) (Found!12955 (index!54216 (_ BitVec 32))) (Intermediate!12955 (undefined!13767 Bool) (index!54217 (_ BitVec 32)) (x!135897 (_ BitVec 32))) (Undefined!12955) (MissingVacant!12955 (index!54218 (_ BitVec 32))) )
))
(declare-fun lt!657770 () SeekEntryResult!12955)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101094 (_ BitVec 32)) SeekEntryResult!12955)

(assert (=> b!1517399 (= lt!657770 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!657769 (select (arr!48784 a!2804) j!70) a!2804 mask!2512))))

(declare-fun res!1037306 () Bool)

(assert (=> start!129238 (=> (not res!1037306) (not e!846595))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129238 (= res!1037306 (validMask!0 mask!2512))))

(assert (=> start!129238 e!846595))

(assert (=> start!129238 true))

(declare-fun array_inv!37812 (array!101094) Bool)

(assert (=> start!129238 (array_inv!37812 a!2804)))

(declare-fun b!1517400 () Bool)

(declare-fun res!1037310 () Bool)

(declare-fun e!846598 () Bool)

(assert (=> b!1517400 (=> (not res!1037310) (not e!846598))))

(declare-fun lt!657768 () SeekEntryResult!12955)

(assert (=> b!1517400 (= res!1037310 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48784 a!2804) j!70) a!2804 mask!2512) lt!657768))))

(declare-fun b!1517401 () Bool)

(assert (=> b!1517401 (= e!846595 e!846598)))

(declare-fun res!1037299 () Bool)

(assert (=> b!1517401 (=> (not res!1037299) (not e!846598))))

(declare-fun lt!657771 () SeekEntryResult!12955)

(assert (=> b!1517401 (= res!1037299 (= lt!657771 lt!657768))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1517401 (= lt!657768 (Intermediate!12955 false resIndex!21 resX!21))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1517401 (= lt!657771 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48784 a!2804) j!70) mask!2512) (select (arr!48784 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1517402 () Bool)

(declare-fun e!846596 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101094 (_ BitVec 32)) SeekEntryResult!12955)

(assert (=> b!1517402 (= e!846596 (= (seekEntry!0 (select (arr!48784 a!2804) j!70) a!2804 mask!2512) (Found!12955 j!70)))))

(declare-fun b!1517403 () Bool)

(declare-fun res!1037301 () Bool)

(assert (=> b!1517403 (=> (not res!1037301) (not e!846595))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1517403 (= res!1037301 (validKeyInArray!0 (select (arr!48784 a!2804) i!961)))))

(declare-fun b!1517404 () Bool)

(declare-fun res!1037302 () Bool)

(assert (=> b!1517404 (=> (not res!1037302) (not e!846595))))

(assert (=> b!1517404 (= res!1037302 (validKeyInArray!0 (select (arr!48784 a!2804) j!70)))))

(declare-fun b!1517405 () Bool)

(declare-fun res!1037305 () Bool)

(assert (=> b!1517405 (=> (not res!1037305) (not e!846595))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101094 (_ BitVec 32)) Bool)

(assert (=> b!1517405 (= res!1037305 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1517406 () Bool)

(assert (=> b!1517406 (= e!846598 (not e!846597))))

(declare-fun res!1037300 () Bool)

(assert (=> b!1517406 (=> res!1037300 e!846597)))

(assert (=> b!1517406 (= res!1037300 (or (not (= (select (arr!48784 a!2804) j!70) (select (store (arr!48784 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(assert (=> b!1517406 e!846596))

(declare-fun res!1037307 () Bool)

(assert (=> b!1517406 (=> (not res!1037307) (not e!846596))))

(assert (=> b!1517406 (= res!1037307 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50778 0))(
  ( (Unit!50779) )
))
(declare-fun lt!657772 () Unit!50778)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101094 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50778)

(assert (=> b!1517406 (= lt!657772 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1517407 () Bool)

(declare-fun res!1037303 () Bool)

(assert (=> b!1517407 (=> (not res!1037303) (not e!846598))))

(assert (=> b!1517407 (= res!1037303 (= lt!657771 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48784 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48784 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101095 (store (arr!48784 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49334 a!2804)) mask!2512)))))

(declare-fun b!1517408 () Bool)

(declare-fun res!1037308 () Bool)

(assert (=> b!1517408 (=> (not res!1037308) (not e!846595))))

(assert (=> b!1517408 (= res!1037308 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49334 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49334 a!2804))))))

(assert (= (and start!129238 res!1037306) b!1517397))

(assert (= (and b!1517397 res!1037304) b!1517403))

(assert (= (and b!1517403 res!1037301) b!1517404))

(assert (= (and b!1517404 res!1037302) b!1517405))

(assert (= (and b!1517405 res!1037305) b!1517396))

(assert (= (and b!1517396 res!1037309) b!1517408))

(assert (= (and b!1517408 res!1037308) b!1517401))

(assert (= (and b!1517401 res!1037299) b!1517400))

(assert (= (and b!1517400 res!1037310) b!1517407))

(assert (= (and b!1517407 res!1037303) b!1517406))

(assert (= (and b!1517406 res!1037307) b!1517402))

(assert (= (and b!1517406 (not res!1037300)) b!1517398))

(assert (= (and b!1517398 (not res!1037311)) b!1517399))

(declare-fun m!1400685 () Bool)

(assert (=> b!1517404 m!1400685))

(assert (=> b!1517404 m!1400685))

(declare-fun m!1400687 () Bool)

(assert (=> b!1517404 m!1400687))

(declare-fun m!1400689 () Bool)

(assert (=> b!1517396 m!1400689))

(declare-fun m!1400691 () Bool)

(assert (=> b!1517403 m!1400691))

(assert (=> b!1517403 m!1400691))

(declare-fun m!1400693 () Bool)

(assert (=> b!1517403 m!1400693))

(declare-fun m!1400695 () Bool)

(assert (=> b!1517405 m!1400695))

(assert (=> b!1517400 m!1400685))

(assert (=> b!1517400 m!1400685))

(declare-fun m!1400697 () Bool)

(assert (=> b!1517400 m!1400697))

(assert (=> b!1517401 m!1400685))

(assert (=> b!1517401 m!1400685))

(declare-fun m!1400699 () Bool)

(assert (=> b!1517401 m!1400699))

(assert (=> b!1517401 m!1400699))

(assert (=> b!1517401 m!1400685))

(declare-fun m!1400701 () Bool)

(assert (=> b!1517401 m!1400701))

(declare-fun m!1400703 () Bool)

(assert (=> b!1517407 m!1400703))

(declare-fun m!1400705 () Bool)

(assert (=> b!1517407 m!1400705))

(assert (=> b!1517407 m!1400705))

(declare-fun m!1400707 () Bool)

(assert (=> b!1517407 m!1400707))

(assert (=> b!1517407 m!1400707))

(assert (=> b!1517407 m!1400705))

(declare-fun m!1400709 () Bool)

(assert (=> b!1517407 m!1400709))

(declare-fun m!1400711 () Bool)

(assert (=> b!1517398 m!1400711))

(declare-fun m!1400713 () Bool)

(assert (=> start!129238 m!1400713))

(declare-fun m!1400715 () Bool)

(assert (=> start!129238 m!1400715))

(assert (=> b!1517399 m!1400685))

(assert (=> b!1517399 m!1400685))

(declare-fun m!1400717 () Bool)

(assert (=> b!1517399 m!1400717))

(assert (=> b!1517402 m!1400685))

(assert (=> b!1517402 m!1400685))

(declare-fun m!1400719 () Bool)

(assert (=> b!1517402 m!1400719))

(assert (=> b!1517406 m!1400685))

(declare-fun m!1400721 () Bool)

(assert (=> b!1517406 m!1400721))

(assert (=> b!1517406 m!1400703))

(assert (=> b!1517406 m!1400705))

(declare-fun m!1400723 () Bool)

(assert (=> b!1517406 m!1400723))

(push 1)

(assert (not b!1517406))

(assert (not b!1517401))

(assert (not start!129238))

