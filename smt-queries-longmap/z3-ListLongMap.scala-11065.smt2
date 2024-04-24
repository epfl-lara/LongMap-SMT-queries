; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129578 () Bool)

(assert start!129578)

(declare-fun e!847762 () Bool)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101197 0))(
  ( (array!101198 (arr!48829 (Array (_ BitVec 32) (_ BitVec 64))) (size!49380 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101197)

(declare-fun b!1519199 () Bool)

(declare-datatypes ((SeekEntryResult!12893 0))(
  ( (MissingZero!12893 (index!53967 (_ BitVec 32))) (Found!12893 (index!53968 (_ BitVec 32))) (Intermediate!12893 (undefined!13705 Bool) (index!53969 (_ BitVec 32)) (x!135862 (_ BitVec 32))) (Undefined!12893) (MissingVacant!12893 (index!53970 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!101197 (_ BitVec 32)) SeekEntryResult!12893)

(assert (=> b!1519199 (= e!847762 (= (seekEntry!0 (select (arr!48829 a!2804) j!70) a!2804 mask!2512) (Found!12893 j!70)))))

(declare-fun b!1519200 () Bool)

(declare-fun res!1037750 () Bool)

(declare-fun e!847759 () Bool)

(assert (=> b!1519200 (=> (not res!1037750) (not e!847759))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun lt!658448 () SeekEntryResult!12893)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101197 (_ BitVec 32)) SeekEntryResult!12893)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1519200 (= res!1037750 (= lt!658448 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48829 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48829 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101198 (store (arr!48829 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49380 a!2804)) mask!2512)))))

(declare-fun b!1519201 () Bool)

(declare-fun e!847764 () Bool)

(assert (=> b!1519201 (= e!847764 e!847759)))

(declare-fun res!1037742 () Bool)

(assert (=> b!1519201 (=> (not res!1037742) (not e!847759))))

(declare-fun lt!658450 () SeekEntryResult!12893)

(assert (=> b!1519201 (= res!1037742 (= lt!658448 lt!658450))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1519201 (= lt!658450 (Intermediate!12893 false resIndex!21 resX!21))))

(assert (=> b!1519201 (= lt!658448 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48829 a!2804) j!70) mask!2512) (select (arr!48829 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1519202 () Bool)

(declare-fun e!847761 () Bool)

(assert (=> b!1519202 (= e!847761 true)))

(declare-fun lt!658449 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun lt!658447 () SeekEntryResult!12893)

(assert (=> b!1519202 (= lt!658447 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!658449 (select (arr!48829 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1519203 () Bool)

(declare-fun res!1037743 () Bool)

(assert (=> b!1519203 (=> (not res!1037743) (not e!847764))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1519203 (= res!1037743 (validKeyInArray!0 (select (arr!48829 a!2804) j!70)))))

(declare-fun b!1519204 () Bool)

(declare-fun res!1037752 () Bool)

(assert (=> b!1519204 (=> (not res!1037752) (not e!847764))))

(assert (=> b!1519204 (= res!1037752 (and (= (size!49380 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49380 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49380 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1519205 () Bool)

(declare-fun res!1037746 () Bool)

(assert (=> b!1519205 (=> (not res!1037746) (not e!847759))))

(declare-fun index!487 () (_ BitVec 32))

(assert (=> b!1519205 (= res!1037746 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48829 a!2804) j!70) a!2804 mask!2512) lt!658450))))

(declare-fun b!1519206 () Bool)

(declare-fun e!847760 () Bool)

(assert (=> b!1519206 (= e!847759 (not e!847760))))

(declare-fun res!1037749 () Bool)

(assert (=> b!1519206 (=> res!1037749 e!847760)))

(assert (=> b!1519206 (= res!1037749 (or (not (= (select (arr!48829 a!2804) j!70) (select (store (arr!48829 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(assert (=> b!1519206 e!847762))

(declare-fun res!1037751 () Bool)

(assert (=> b!1519206 (=> (not res!1037751) (not e!847762))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101197 (_ BitVec 32)) Bool)

(assert (=> b!1519206 (= res!1037751 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50689 0))(
  ( (Unit!50690) )
))
(declare-fun lt!658446 () Unit!50689)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101197 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50689)

(assert (=> b!1519206 (= lt!658446 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1519198 () Bool)

(declare-fun res!1037741 () Bool)

(assert (=> b!1519198 (=> (not res!1037741) (not e!847764))))

(assert (=> b!1519198 (= res!1037741 (validKeyInArray!0 (select (arr!48829 a!2804) i!961)))))

(declare-fun res!1037745 () Bool)

(assert (=> start!129578 (=> (not res!1037745) (not e!847764))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129578 (= res!1037745 (validMask!0 mask!2512))))

(assert (=> start!129578 e!847764))

(assert (=> start!129578 true))

(declare-fun array_inv!38110 (array!101197) Bool)

(assert (=> start!129578 (array_inv!38110 a!2804)))

(declare-fun b!1519207 () Bool)

(declare-fun res!1037744 () Bool)

(assert (=> b!1519207 (=> (not res!1037744) (not e!847764))))

(assert (=> b!1519207 (= res!1037744 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1519208 () Bool)

(assert (=> b!1519208 (= e!847760 e!847761)))

(declare-fun res!1037747 () Bool)

(assert (=> b!1519208 (=> res!1037747 e!847761)))

(assert (=> b!1519208 (= res!1037747 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!658449 #b00000000000000000000000000000000) (bvsge lt!658449 (size!49380 a!2804))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1519208 (= lt!658449 (nextIndex!0 index!487 (bvadd #b00000000000000000000000000000001 x!534) mask!2512))))

(declare-fun b!1519209 () Bool)

(declare-fun res!1037748 () Bool)

(assert (=> b!1519209 (=> (not res!1037748) (not e!847764))))

(assert (=> b!1519209 (= res!1037748 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49380 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49380 a!2804))))))

(declare-fun b!1519210 () Bool)

(declare-fun res!1037753 () Bool)

(assert (=> b!1519210 (=> (not res!1037753) (not e!847764))))

(declare-datatypes ((List!35299 0))(
  ( (Nil!35296) (Cons!35295 (h!36725 (_ BitVec 64)) (t!49985 List!35299)) )
))
(declare-fun arrayNoDuplicates!0 (array!101197 (_ BitVec 32) List!35299) Bool)

(assert (=> b!1519210 (= res!1037753 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35296))))

(assert (= (and start!129578 res!1037745) b!1519204))

(assert (= (and b!1519204 res!1037752) b!1519198))

(assert (= (and b!1519198 res!1037741) b!1519203))

(assert (= (and b!1519203 res!1037743) b!1519207))

(assert (= (and b!1519207 res!1037744) b!1519210))

(assert (= (and b!1519210 res!1037753) b!1519209))

(assert (= (and b!1519209 res!1037748) b!1519201))

(assert (= (and b!1519201 res!1037742) b!1519205))

(assert (= (and b!1519205 res!1037746) b!1519200))

(assert (= (and b!1519200 res!1037750) b!1519206))

(assert (= (and b!1519206 res!1037751) b!1519199))

(assert (= (and b!1519206 (not res!1037749)) b!1519208))

(assert (= (and b!1519208 (not res!1037747)) b!1519202))

(declare-fun m!1402329 () Bool)

(assert (=> start!129578 m!1402329))

(declare-fun m!1402331 () Bool)

(assert (=> start!129578 m!1402331))

(declare-fun m!1402333 () Bool)

(assert (=> b!1519210 m!1402333))

(declare-fun m!1402335 () Bool)

(assert (=> b!1519201 m!1402335))

(assert (=> b!1519201 m!1402335))

(declare-fun m!1402337 () Bool)

(assert (=> b!1519201 m!1402337))

(assert (=> b!1519201 m!1402337))

(assert (=> b!1519201 m!1402335))

(declare-fun m!1402339 () Bool)

(assert (=> b!1519201 m!1402339))

(assert (=> b!1519205 m!1402335))

(assert (=> b!1519205 m!1402335))

(declare-fun m!1402341 () Bool)

(assert (=> b!1519205 m!1402341))

(declare-fun m!1402343 () Bool)

(assert (=> b!1519198 m!1402343))

(assert (=> b!1519198 m!1402343))

(declare-fun m!1402345 () Bool)

(assert (=> b!1519198 m!1402345))

(assert (=> b!1519202 m!1402335))

(assert (=> b!1519202 m!1402335))

(declare-fun m!1402347 () Bool)

(assert (=> b!1519202 m!1402347))

(assert (=> b!1519203 m!1402335))

(assert (=> b!1519203 m!1402335))

(declare-fun m!1402349 () Bool)

(assert (=> b!1519203 m!1402349))

(assert (=> b!1519199 m!1402335))

(assert (=> b!1519199 m!1402335))

(declare-fun m!1402351 () Bool)

(assert (=> b!1519199 m!1402351))

(declare-fun m!1402353 () Bool)

(assert (=> b!1519207 m!1402353))

(declare-fun m!1402355 () Bool)

(assert (=> b!1519200 m!1402355))

(declare-fun m!1402357 () Bool)

(assert (=> b!1519200 m!1402357))

(assert (=> b!1519200 m!1402357))

(declare-fun m!1402359 () Bool)

(assert (=> b!1519200 m!1402359))

(assert (=> b!1519200 m!1402359))

(assert (=> b!1519200 m!1402357))

(declare-fun m!1402361 () Bool)

(assert (=> b!1519200 m!1402361))

(assert (=> b!1519206 m!1402335))

(declare-fun m!1402363 () Bool)

(assert (=> b!1519206 m!1402363))

(assert (=> b!1519206 m!1402355))

(assert (=> b!1519206 m!1402357))

(declare-fun m!1402365 () Bool)

(assert (=> b!1519206 m!1402365))

(declare-fun m!1402367 () Bool)

(assert (=> b!1519208 m!1402367))

(check-sat (not b!1519199) (not b!1519210) (not b!1519202) (not b!1519198) (not start!129578) (not b!1519203) (not b!1519201) (not b!1519206) (not b!1519208) (not b!1519205) (not b!1519207) (not b!1519200))
(check-sat)
