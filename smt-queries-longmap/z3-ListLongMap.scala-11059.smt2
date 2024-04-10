; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129188 () Bool)

(assert start!129188)

(declare-fun res!1036324 () Bool)

(declare-fun e!846147 () Bool)

(assert (=> start!129188 (=> (not res!1036324) (not e!846147))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129188 (= res!1036324 (validMask!0 mask!2512))))

(assert (=> start!129188 e!846147))

(assert (=> start!129188 true))

(declare-datatypes ((array!101044 0))(
  ( (array!101045 (arr!48759 (Array (_ BitVec 32) (_ BitVec 64))) (size!49309 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101044)

(declare-fun array_inv!37787 (array!101044) Bool)

(assert (=> start!129188 (array_inv!37787 a!2804)))

(declare-fun b!1516421 () Bool)

(declare-fun res!1036331 () Bool)

(declare-fun e!846148 () Bool)

(assert (=> b!1516421 (=> (not res!1036331) (not e!846148))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12930 0))(
  ( (MissingZero!12930 (index!54115 (_ BitVec 32))) (Found!12930 (index!54116 (_ BitVec 32))) (Intermediate!12930 (undefined!13742 Bool) (index!54117 (_ BitVec 32)) (x!135808 (_ BitVec 32))) (Undefined!12930) (MissingVacant!12930 (index!54118 (_ BitVec 32))) )
))
(declare-fun lt!657395 () SeekEntryResult!12930)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101044 (_ BitVec 32)) SeekEntryResult!12930)

(assert (=> b!1516421 (= res!1036331 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48759 a!2804) j!70) a!2804 mask!2512) lt!657395))))

(declare-fun b!1516422 () Bool)

(declare-fun res!1036336 () Bool)

(assert (=> b!1516422 (=> (not res!1036336) (not e!846147))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1516422 (= res!1036336 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49309 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49309 a!2804))))))

(declare-fun b!1516423 () Bool)

(declare-fun e!846145 () Bool)

(assert (=> b!1516423 (= e!846145 true)))

(declare-fun lt!657396 () (_ BitVec 32))

(declare-fun lt!657394 () SeekEntryResult!12930)

(assert (=> b!1516423 (= lt!657394 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!657396 (select (arr!48759 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1516424 () Bool)

(declare-fun res!1036329 () Bool)

(assert (=> b!1516424 (=> (not res!1036329) (not e!846148))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun lt!657397 () SeekEntryResult!12930)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1516424 (= res!1036329 (= lt!657397 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48759 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48759 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101045 (store (arr!48759 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49309 a!2804)) mask!2512)))))

(declare-fun b!1516425 () Bool)

(declare-fun e!846146 () Bool)

(assert (=> b!1516425 (= e!846148 (not e!846146))))

(declare-fun res!1036327 () Bool)

(assert (=> b!1516425 (=> res!1036327 e!846146)))

(assert (=> b!1516425 (= res!1036327 (or (not (= (select (arr!48759 a!2804) j!70) (select (store (arr!48759 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(declare-fun e!846143 () Bool)

(assert (=> b!1516425 e!846143))

(declare-fun res!1036333 () Bool)

(assert (=> b!1516425 (=> (not res!1036333) (not e!846143))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101044 (_ BitVec 32)) Bool)

(assert (=> b!1516425 (= res!1036333 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50728 0))(
  ( (Unit!50729) )
))
(declare-fun lt!657393 () Unit!50728)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101044 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50728)

(assert (=> b!1516425 (= lt!657393 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1516426 () Bool)

(declare-fun res!1036330 () Bool)

(assert (=> b!1516426 (=> (not res!1036330) (not e!846147))))

(assert (=> b!1516426 (= res!1036330 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1516427 () Bool)

(declare-fun res!1036326 () Bool)

(assert (=> b!1516427 (=> (not res!1036326) (not e!846147))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1516427 (= res!1036326 (validKeyInArray!0 (select (arr!48759 a!2804) i!961)))))

(declare-fun b!1516428 () Bool)

(assert (=> b!1516428 (= e!846146 e!846145)))

(declare-fun res!1036334 () Bool)

(assert (=> b!1516428 (=> res!1036334 e!846145)))

(assert (=> b!1516428 (= res!1036334 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!657396 #b00000000000000000000000000000000) (bvsge lt!657396 (size!49309 a!2804))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1516428 (= lt!657396 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1516429 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101044 (_ BitVec 32)) SeekEntryResult!12930)

(assert (=> b!1516429 (= e!846143 (= (seekEntry!0 (select (arr!48759 a!2804) j!70) a!2804 mask!2512) (Found!12930 j!70)))))

(declare-fun b!1516430 () Bool)

(declare-fun res!1036332 () Bool)

(assert (=> b!1516430 (=> (not res!1036332) (not e!846147))))

(assert (=> b!1516430 (= res!1036332 (and (= (size!49309 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49309 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49309 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1516431 () Bool)

(declare-fun res!1036335 () Bool)

(assert (=> b!1516431 (=> (not res!1036335) (not e!846147))))

(assert (=> b!1516431 (= res!1036335 (validKeyInArray!0 (select (arr!48759 a!2804) j!70)))))

(declare-fun b!1516432 () Bool)

(declare-fun res!1036325 () Bool)

(assert (=> b!1516432 (=> (not res!1036325) (not e!846147))))

(declare-datatypes ((List!35242 0))(
  ( (Nil!35239) (Cons!35238 (h!36650 (_ BitVec 64)) (t!49936 List!35242)) )
))
(declare-fun arrayNoDuplicates!0 (array!101044 (_ BitVec 32) List!35242) Bool)

(assert (=> b!1516432 (= res!1036325 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35239))))

(declare-fun b!1516433 () Bool)

(assert (=> b!1516433 (= e!846147 e!846148)))

(declare-fun res!1036328 () Bool)

(assert (=> b!1516433 (=> (not res!1036328) (not e!846148))))

(assert (=> b!1516433 (= res!1036328 (= lt!657397 lt!657395))))

(assert (=> b!1516433 (= lt!657395 (Intermediate!12930 false resIndex!21 resX!21))))

(assert (=> b!1516433 (= lt!657397 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48759 a!2804) j!70) mask!2512) (select (arr!48759 a!2804) j!70) a!2804 mask!2512))))

(assert (= (and start!129188 res!1036324) b!1516430))

(assert (= (and b!1516430 res!1036332) b!1516427))

(assert (= (and b!1516427 res!1036326) b!1516431))

(assert (= (and b!1516431 res!1036335) b!1516426))

(assert (= (and b!1516426 res!1036330) b!1516432))

(assert (= (and b!1516432 res!1036325) b!1516422))

(assert (= (and b!1516422 res!1036336) b!1516433))

(assert (= (and b!1516433 res!1036328) b!1516421))

(assert (= (and b!1516421 res!1036331) b!1516424))

(assert (= (and b!1516424 res!1036329) b!1516425))

(assert (= (and b!1516425 res!1036333) b!1516429))

(assert (= (and b!1516425 (not res!1036327)) b!1516428))

(assert (= (and b!1516428 (not res!1036334)) b!1516423))

(declare-fun m!1399685 () Bool)

(assert (=> b!1516423 m!1399685))

(assert (=> b!1516423 m!1399685))

(declare-fun m!1399687 () Bool)

(assert (=> b!1516423 m!1399687))

(assert (=> b!1516433 m!1399685))

(assert (=> b!1516433 m!1399685))

(declare-fun m!1399689 () Bool)

(assert (=> b!1516433 m!1399689))

(assert (=> b!1516433 m!1399689))

(assert (=> b!1516433 m!1399685))

(declare-fun m!1399691 () Bool)

(assert (=> b!1516433 m!1399691))

(declare-fun m!1399693 () Bool)

(assert (=> start!129188 m!1399693))

(declare-fun m!1399695 () Bool)

(assert (=> start!129188 m!1399695))

(assert (=> b!1516431 m!1399685))

(assert (=> b!1516431 m!1399685))

(declare-fun m!1399697 () Bool)

(assert (=> b!1516431 m!1399697))

(declare-fun m!1399699 () Bool)

(assert (=> b!1516424 m!1399699))

(declare-fun m!1399701 () Bool)

(assert (=> b!1516424 m!1399701))

(assert (=> b!1516424 m!1399701))

(declare-fun m!1399703 () Bool)

(assert (=> b!1516424 m!1399703))

(assert (=> b!1516424 m!1399703))

(assert (=> b!1516424 m!1399701))

(declare-fun m!1399705 () Bool)

(assert (=> b!1516424 m!1399705))

(assert (=> b!1516429 m!1399685))

(assert (=> b!1516429 m!1399685))

(declare-fun m!1399707 () Bool)

(assert (=> b!1516429 m!1399707))

(assert (=> b!1516421 m!1399685))

(assert (=> b!1516421 m!1399685))

(declare-fun m!1399709 () Bool)

(assert (=> b!1516421 m!1399709))

(declare-fun m!1399711 () Bool)

(assert (=> b!1516428 m!1399711))

(declare-fun m!1399713 () Bool)

(assert (=> b!1516426 m!1399713))

(assert (=> b!1516425 m!1399685))

(declare-fun m!1399715 () Bool)

(assert (=> b!1516425 m!1399715))

(assert (=> b!1516425 m!1399699))

(assert (=> b!1516425 m!1399701))

(declare-fun m!1399717 () Bool)

(assert (=> b!1516425 m!1399717))

(declare-fun m!1399719 () Bool)

(assert (=> b!1516432 m!1399719))

(declare-fun m!1399721 () Bool)

(assert (=> b!1516427 m!1399721))

(assert (=> b!1516427 m!1399721))

(declare-fun m!1399723 () Bool)

(assert (=> b!1516427 m!1399723))

(check-sat (not b!1516426) (not b!1516427) (not b!1516431) (not b!1516423) (not b!1516432) (not b!1516424) (not b!1516433) (not start!129188) (not b!1516429) (not b!1516421) (not b!1516425) (not b!1516428))
(check-sat)
