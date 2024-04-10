; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129338 () Bool)

(assert start!129338)

(declare-fun b!1519419 () Bool)

(declare-fun e!847566 () Bool)

(declare-fun e!847571 () Bool)

(assert (=> b!1519419 (= e!847566 e!847571)))

(declare-fun res!1039328 () Bool)

(assert (=> b!1519419 (=> res!1039328 e!847571)))

(declare-datatypes ((array!101194 0))(
  ( (array!101195 (arr!48834 (Array (_ BitVec 32) (_ BitVec 64))) (size!49384 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101194)

(declare-fun lt!658654 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1519419 (= res!1039328 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!658654 #b00000000000000000000000000000000) (bvsge lt!658654 (size!49384 a!2804))))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1519419 (= lt!658654 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1519420 () Bool)

(declare-fun res!1039334 () Bool)

(assert (=> b!1519420 (=> res!1039334 e!847571)))

(declare-datatypes ((SeekEntryResult!13005 0))(
  ( (MissingZero!13005 (index!54415 (_ BitVec 32))) (Found!13005 (index!54416 (_ BitVec 32))) (Intermediate!13005 (undefined!13817 Bool) (index!54417 (_ BitVec 32)) (x!136083 (_ BitVec 32))) (Undefined!13005) (MissingVacant!13005 (index!54418 (_ BitVec 32))) )
))
(declare-fun lt!658655 () SeekEntryResult!13005)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101194 (_ BitVec 32)) SeekEntryResult!13005)

(assert (=> b!1519420 (= res!1039334 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!658654 (select (arr!48834 a!2804) j!70) a!2804 mask!2512) lt!658655)))))

(declare-fun e!847573 () Bool)

(declare-fun b!1519421 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101194 (_ BitVec 32)) SeekEntryResult!13005)

(assert (=> b!1519421 (= e!847573 (= (seekEntry!0 (select (arr!48834 a!2804) j!70) a!2804 mask!2512) (Found!13005 j!70)))))

(declare-fun res!1039326 () Bool)

(declare-fun e!847567 () Bool)

(assert (=> start!129338 (=> (not res!1039326) (not e!847567))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129338 (= res!1039326 (validMask!0 mask!2512))))

(assert (=> start!129338 e!847567))

(assert (=> start!129338 true))

(declare-fun array_inv!37862 (array!101194) Bool)

(assert (=> start!129338 (array_inv!37862 a!2804)))

(declare-fun b!1519422 () Bool)

(declare-fun e!847569 () Bool)

(assert (=> b!1519422 (= e!847567 e!847569)))

(declare-fun res!1039335 () Bool)

(assert (=> b!1519422 (=> (not res!1039335) (not e!847569))))

(declare-fun lt!658658 () SeekEntryResult!13005)

(assert (=> b!1519422 (= res!1039335 (= lt!658658 lt!658655))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1519422 (= lt!658655 (Intermediate!13005 false resIndex!21 resX!21))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1519422 (= lt!658658 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48834 a!2804) j!70) mask!2512) (select (arr!48834 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1519423 () Bool)

(declare-fun res!1039336 () Bool)

(assert (=> b!1519423 (=> (not res!1039336) (not e!847567))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1519423 (= res!1039336 (validKeyInArray!0 (select (arr!48834 a!2804) i!961)))))

(declare-fun b!1519424 () Bool)

(declare-fun res!1039322 () Bool)

(assert (=> b!1519424 (=> (not res!1039322) (not e!847567))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101194 (_ BitVec 32)) Bool)

(assert (=> b!1519424 (= res!1039322 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1519425 () Bool)

(declare-fun res!1039333 () Bool)

(assert (=> b!1519425 (=> (not res!1039333) (not e!847567))))

(assert (=> b!1519425 (= res!1039333 (and (= (size!49384 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49384 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49384 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1519426 () Bool)

(declare-fun res!1039329 () Bool)

(assert (=> b!1519426 (=> (not res!1039329) (not e!847569))))

(assert (=> b!1519426 (= res!1039329 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48834 a!2804) j!70) a!2804 mask!2512) lt!658655))))

(declare-fun b!1519427 () Bool)

(declare-fun e!847570 () Bool)

(assert (=> b!1519427 (= e!847570 (not e!847566))))

(declare-fun res!1039330 () Bool)

(assert (=> b!1519427 (=> res!1039330 e!847566)))

(declare-fun lt!658660 () (_ BitVec 64))

(assert (=> b!1519427 (= res!1039330 (or (not (= (select (arr!48834 a!2804) j!70) lt!658660)) (= x!534 resX!21)))))

(assert (=> b!1519427 e!847573))

(declare-fun res!1039325 () Bool)

(assert (=> b!1519427 (=> (not res!1039325) (not e!847573))))

(assert (=> b!1519427 (= res!1039325 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50878 0))(
  ( (Unit!50879) )
))
(declare-fun lt!658657 () Unit!50878)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101194 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50878)

(assert (=> b!1519427 (= lt!658657 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1519428 () Bool)

(declare-fun e!847568 () Bool)

(assert (=> b!1519428 (= e!847571 e!847568)))

(declare-fun res!1039331 () Bool)

(assert (=> b!1519428 (=> res!1039331 e!847568)))

(assert (=> b!1519428 (= res!1039331 (bvslt mask!2512 #b00000000000000000000000000000000))))

(declare-fun lt!658656 () array!101194)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101194 (_ BitVec 32)) SeekEntryResult!13005)

(assert (=> b!1519428 (= (seekEntryOrOpen!0 (select (arr!48834 a!2804) j!70) a!2804 mask!2512) (seekEntryOrOpen!0 lt!658660 lt!658656 mask!2512))))

(declare-fun lt!658659 () Unit!50878)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 (array!101194 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50878)

(assert (=> b!1519428 (= lt!658659 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 a!2804 i!961 j!70 (bvadd #b00000000000000000000000000000001 x!534) lt!658654 resX!21 resIndex!21 mask!2512))))

(declare-fun b!1519429 () Bool)

(declare-fun res!1039327 () Bool)

(assert (=> b!1519429 (=> (not res!1039327) (not e!847567))))

(assert (=> b!1519429 (= res!1039327 (validKeyInArray!0 (select (arr!48834 a!2804) j!70)))))

(declare-fun b!1519430 () Bool)

(declare-fun res!1039323 () Bool)

(assert (=> b!1519430 (=> (not res!1039323) (not e!847567))))

(declare-datatypes ((List!35317 0))(
  ( (Nil!35314) (Cons!35313 (h!36725 (_ BitVec 64)) (t!50011 List!35317)) )
))
(declare-fun arrayNoDuplicates!0 (array!101194 (_ BitVec 32) List!35317) Bool)

(assert (=> b!1519430 (= res!1039323 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35314))))

(declare-fun b!1519431 () Bool)

(assert (=> b!1519431 (= e!847568 (validKeyInArray!0 lt!658660))))

(declare-fun b!1519432 () Bool)

(declare-fun res!1039332 () Bool)

(assert (=> b!1519432 (=> (not res!1039332) (not e!847567))))

(assert (=> b!1519432 (= res!1039332 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49384 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49384 a!2804))))))

(declare-fun b!1519433 () Bool)

(assert (=> b!1519433 (= e!847569 e!847570)))

(declare-fun res!1039324 () Bool)

(assert (=> b!1519433 (=> (not res!1039324) (not e!847570))))

(assert (=> b!1519433 (= res!1039324 (= lt!658658 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!658660 mask!2512) lt!658660 lt!658656 mask!2512)))))

(assert (=> b!1519433 (= lt!658660 (select (store (arr!48834 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1519433 (= lt!658656 (array!101195 (store (arr!48834 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49384 a!2804)))))

(assert (= (and start!129338 res!1039326) b!1519425))

(assert (= (and b!1519425 res!1039333) b!1519423))

(assert (= (and b!1519423 res!1039336) b!1519429))

(assert (= (and b!1519429 res!1039327) b!1519424))

(assert (= (and b!1519424 res!1039322) b!1519430))

(assert (= (and b!1519430 res!1039323) b!1519432))

(assert (= (and b!1519432 res!1039332) b!1519422))

(assert (= (and b!1519422 res!1039335) b!1519426))

(assert (= (and b!1519426 res!1039329) b!1519433))

(assert (= (and b!1519433 res!1039324) b!1519427))

(assert (= (and b!1519427 res!1039325) b!1519421))

(assert (= (and b!1519427 (not res!1039330)) b!1519419))

(assert (= (and b!1519419 (not res!1039328)) b!1519420))

(assert (= (and b!1519420 (not res!1039334)) b!1519428))

(assert (= (and b!1519428 (not res!1039331)) b!1519431))

(declare-fun m!1402819 () Bool)

(assert (=> b!1519426 m!1402819))

(assert (=> b!1519426 m!1402819))

(declare-fun m!1402821 () Bool)

(assert (=> b!1519426 m!1402821))

(declare-fun m!1402823 () Bool)

(assert (=> b!1519431 m!1402823))

(assert (=> b!1519427 m!1402819))

(declare-fun m!1402825 () Bool)

(assert (=> b!1519427 m!1402825))

(declare-fun m!1402827 () Bool)

(assert (=> b!1519427 m!1402827))

(declare-fun m!1402829 () Bool)

(assert (=> b!1519433 m!1402829))

(assert (=> b!1519433 m!1402829))

(declare-fun m!1402831 () Bool)

(assert (=> b!1519433 m!1402831))

(declare-fun m!1402833 () Bool)

(assert (=> b!1519433 m!1402833))

(declare-fun m!1402835 () Bool)

(assert (=> b!1519433 m!1402835))

(declare-fun m!1402837 () Bool)

(assert (=> b!1519424 m!1402837))

(assert (=> b!1519420 m!1402819))

(assert (=> b!1519420 m!1402819))

(declare-fun m!1402839 () Bool)

(assert (=> b!1519420 m!1402839))

(assert (=> b!1519421 m!1402819))

(assert (=> b!1519421 m!1402819))

(declare-fun m!1402841 () Bool)

(assert (=> b!1519421 m!1402841))

(declare-fun m!1402843 () Bool)

(assert (=> b!1519419 m!1402843))

(assert (=> b!1519428 m!1402819))

(assert (=> b!1519428 m!1402819))

(declare-fun m!1402845 () Bool)

(assert (=> b!1519428 m!1402845))

(declare-fun m!1402847 () Bool)

(assert (=> b!1519428 m!1402847))

(declare-fun m!1402849 () Bool)

(assert (=> b!1519428 m!1402849))

(assert (=> b!1519422 m!1402819))

(assert (=> b!1519422 m!1402819))

(declare-fun m!1402851 () Bool)

(assert (=> b!1519422 m!1402851))

(assert (=> b!1519422 m!1402851))

(assert (=> b!1519422 m!1402819))

(declare-fun m!1402853 () Bool)

(assert (=> b!1519422 m!1402853))

(declare-fun m!1402855 () Bool)

(assert (=> start!129338 m!1402855))

(declare-fun m!1402857 () Bool)

(assert (=> start!129338 m!1402857))

(assert (=> b!1519429 m!1402819))

(assert (=> b!1519429 m!1402819))

(declare-fun m!1402859 () Bool)

(assert (=> b!1519429 m!1402859))

(declare-fun m!1402861 () Bool)

(assert (=> b!1519423 m!1402861))

(assert (=> b!1519423 m!1402861))

(declare-fun m!1402863 () Bool)

(assert (=> b!1519423 m!1402863))

(declare-fun m!1402865 () Bool)

(assert (=> b!1519430 m!1402865))

(check-sat (not b!1519419) (not b!1519428) (not b!1519420) (not b!1519433) (not b!1519422) (not b!1519431) (not b!1519423) (not b!1519427) (not b!1519421) (not b!1519426) (not start!129338) (not b!1519424) (not b!1519430) (not b!1519429))
(check-sat)
