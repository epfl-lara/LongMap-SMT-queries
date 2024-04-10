; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129332 () Bool)

(assert start!129332)

(declare-fun b!1519288 () Bool)

(declare-fun e!847503 () Bool)

(assert (=> b!1519288 (= e!847503 true)))

(declare-datatypes ((array!101188 0))(
  ( (array!101189 (arr!48831 (Array (_ BitVec 32) (_ BitVec 64))) (size!49381 (_ BitVec 32))) )
))
(declare-fun lt!658592 () array!101188)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun a!2804 () array!101188)

(declare-fun lt!658595 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!13002 0))(
  ( (MissingZero!13002 (index!54403 (_ BitVec 32))) (Found!13002 (index!54404 (_ BitVec 32))) (Intermediate!13002 (undefined!13814 Bool) (index!54405 (_ BitVec 32)) (x!136072 (_ BitVec 32))) (Undefined!13002) (MissingVacant!13002 (index!54406 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101188 (_ BitVec 32)) SeekEntryResult!13002)

(assert (=> b!1519288 (= (seekEntryOrOpen!0 (select (arr!48831 a!2804) j!70) a!2804 mask!2512) (seekEntryOrOpen!0 lt!658595 lt!658592 mask!2512))))

(declare-datatypes ((Unit!50872 0))(
  ( (Unit!50873) )
))
(declare-fun lt!658593 () Unit!50872)

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun lt!658597 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 (array!101188 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50872)

(assert (=> b!1519288 (= lt!658593 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 a!2804 i!961 j!70 (bvadd #b00000000000000000000000000000001 x!534) lt!658597 resX!21 resIndex!21 mask!2512))))

(declare-fun e!847501 () Bool)

(declare-fun b!1519289 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101188 (_ BitVec 32)) SeekEntryResult!13002)

(assert (=> b!1519289 (= e!847501 (= (seekEntry!0 (select (arr!48831 a!2804) j!70) a!2804 mask!2512) (Found!13002 j!70)))))

(declare-fun b!1519290 () Bool)

(declare-fun res!1039202 () Bool)

(declare-fun e!847499 () Bool)

(assert (=> b!1519290 (=> (not res!1039202) (not e!847499))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1519290 (= res!1039202 (validKeyInArray!0 (select (arr!48831 a!2804) i!961)))))

(declare-fun res!1039195 () Bool)

(assert (=> start!129332 (=> (not res!1039195) (not e!847499))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129332 (= res!1039195 (validMask!0 mask!2512))))

(assert (=> start!129332 e!847499))

(assert (=> start!129332 true))

(declare-fun array_inv!37859 (array!101188) Bool)

(assert (=> start!129332 (array_inv!37859 a!2804)))

(declare-fun b!1519291 () Bool)

(declare-fun res!1039199 () Bool)

(assert (=> b!1519291 (=> (not res!1039199) (not e!847499))))

(declare-datatypes ((List!35314 0))(
  ( (Nil!35311) (Cons!35310 (h!36722 (_ BitVec 64)) (t!50008 List!35314)) )
))
(declare-fun arrayNoDuplicates!0 (array!101188 (_ BitVec 32) List!35314) Bool)

(assert (=> b!1519291 (= res!1039199 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35311))))

(declare-fun b!1519292 () Bool)

(declare-fun res!1039196 () Bool)

(assert (=> b!1519292 (=> (not res!1039196) (not e!847499))))

(assert (=> b!1519292 (= res!1039196 (validKeyInArray!0 (select (arr!48831 a!2804) j!70)))))

(declare-fun b!1519293 () Bool)

(declare-fun res!1039204 () Bool)

(assert (=> b!1519293 (=> (not res!1039204) (not e!847499))))

(assert (=> b!1519293 (= res!1039204 (and (= (size!49381 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49381 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49381 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1519294 () Bool)

(declare-fun res!1039203 () Bool)

(assert (=> b!1519294 (=> (not res!1039203) (not e!847499))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101188 (_ BitVec 32)) Bool)

(assert (=> b!1519294 (= res!1039203 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1519295 () Bool)

(declare-fun res!1039200 () Bool)

(declare-fun e!847500 () Bool)

(assert (=> b!1519295 (=> (not res!1039200) (not e!847500))))

(declare-fun lt!658591 () SeekEntryResult!13002)

(declare-fun index!487 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101188 (_ BitVec 32)) SeekEntryResult!13002)

(assert (=> b!1519295 (= res!1039200 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48831 a!2804) j!70) a!2804 mask!2512) lt!658591))))

(declare-fun b!1519296 () Bool)

(declare-fun res!1039191 () Bool)

(assert (=> b!1519296 (=> (not res!1039191) (not e!847499))))

(assert (=> b!1519296 (= res!1039191 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49381 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49381 a!2804))))))

(declare-fun b!1519297 () Bool)

(declare-fun e!847504 () Bool)

(declare-fun e!847498 () Bool)

(assert (=> b!1519297 (= e!847504 (not e!847498))))

(declare-fun res!1039198 () Bool)

(assert (=> b!1519297 (=> res!1039198 e!847498)))

(assert (=> b!1519297 (= res!1039198 (or (not (= (select (arr!48831 a!2804) j!70) lt!658595)) (= x!534 resX!21)))))

(assert (=> b!1519297 e!847501))

(declare-fun res!1039192 () Bool)

(assert (=> b!1519297 (=> (not res!1039192) (not e!847501))))

(assert (=> b!1519297 (= res!1039192 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-fun lt!658594 () Unit!50872)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101188 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50872)

(assert (=> b!1519297 (= lt!658594 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1519298 () Bool)

(assert (=> b!1519298 (= e!847498 e!847503)))

(declare-fun res!1039197 () Bool)

(assert (=> b!1519298 (=> res!1039197 e!847503)))

(assert (=> b!1519298 (= res!1039197 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!658597 #b00000000000000000000000000000000) (bvsge lt!658597 (size!49381 a!2804))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1519298 (= lt!658597 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1519299 () Bool)

(declare-fun res!1039193 () Bool)

(assert (=> b!1519299 (=> res!1039193 e!847503)))

(assert (=> b!1519299 (= res!1039193 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!658597 (select (arr!48831 a!2804) j!70) a!2804 mask!2512) lt!658591)))))

(declare-fun b!1519300 () Bool)

(assert (=> b!1519300 (= e!847500 e!847504)))

(declare-fun res!1039201 () Bool)

(assert (=> b!1519300 (=> (not res!1039201) (not e!847504))))

(declare-fun lt!658596 () SeekEntryResult!13002)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1519300 (= res!1039201 (= lt!658596 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!658595 mask!2512) lt!658595 lt!658592 mask!2512)))))

(assert (=> b!1519300 (= lt!658595 (select (store (arr!48831 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1519300 (= lt!658592 (array!101189 (store (arr!48831 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49381 a!2804)))))

(declare-fun b!1519301 () Bool)

(assert (=> b!1519301 (= e!847499 e!847500)))

(declare-fun res!1039194 () Bool)

(assert (=> b!1519301 (=> (not res!1039194) (not e!847500))))

(assert (=> b!1519301 (= res!1039194 (= lt!658596 lt!658591))))

(assert (=> b!1519301 (= lt!658591 (Intermediate!13002 false resIndex!21 resX!21))))

(assert (=> b!1519301 (= lt!658596 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48831 a!2804) j!70) mask!2512) (select (arr!48831 a!2804) j!70) a!2804 mask!2512))))

(assert (= (and start!129332 res!1039195) b!1519293))

(assert (= (and b!1519293 res!1039204) b!1519290))

(assert (= (and b!1519290 res!1039202) b!1519292))

(assert (= (and b!1519292 res!1039196) b!1519294))

(assert (= (and b!1519294 res!1039203) b!1519291))

(assert (= (and b!1519291 res!1039199) b!1519296))

(assert (= (and b!1519296 res!1039191) b!1519301))

(assert (= (and b!1519301 res!1039194) b!1519295))

(assert (= (and b!1519295 res!1039200) b!1519300))

(assert (= (and b!1519300 res!1039201) b!1519297))

(assert (= (and b!1519297 res!1039192) b!1519289))

(assert (= (and b!1519297 (not res!1039198)) b!1519298))

(assert (= (and b!1519298 (not res!1039197)) b!1519299))

(assert (= (and b!1519299 (not res!1039193)) b!1519288))

(declare-fun m!1402679 () Bool)

(assert (=> b!1519292 m!1402679))

(assert (=> b!1519292 m!1402679))

(declare-fun m!1402681 () Bool)

(assert (=> b!1519292 m!1402681))

(declare-fun m!1402683 () Bool)

(assert (=> start!129332 m!1402683))

(declare-fun m!1402685 () Bool)

(assert (=> start!129332 m!1402685))

(declare-fun m!1402687 () Bool)

(assert (=> b!1519291 m!1402687))

(declare-fun m!1402689 () Bool)

(assert (=> b!1519300 m!1402689))

(assert (=> b!1519300 m!1402689))

(declare-fun m!1402691 () Bool)

(assert (=> b!1519300 m!1402691))

(declare-fun m!1402693 () Bool)

(assert (=> b!1519300 m!1402693))

(declare-fun m!1402695 () Bool)

(assert (=> b!1519300 m!1402695))

(declare-fun m!1402697 () Bool)

(assert (=> b!1519298 m!1402697))

(assert (=> b!1519299 m!1402679))

(assert (=> b!1519299 m!1402679))

(declare-fun m!1402699 () Bool)

(assert (=> b!1519299 m!1402699))

(assert (=> b!1519288 m!1402679))

(assert (=> b!1519288 m!1402679))

(declare-fun m!1402701 () Bool)

(assert (=> b!1519288 m!1402701))

(declare-fun m!1402703 () Bool)

(assert (=> b!1519288 m!1402703))

(declare-fun m!1402705 () Bool)

(assert (=> b!1519288 m!1402705))

(assert (=> b!1519301 m!1402679))

(assert (=> b!1519301 m!1402679))

(declare-fun m!1402707 () Bool)

(assert (=> b!1519301 m!1402707))

(assert (=> b!1519301 m!1402707))

(assert (=> b!1519301 m!1402679))

(declare-fun m!1402709 () Bool)

(assert (=> b!1519301 m!1402709))

(assert (=> b!1519289 m!1402679))

(assert (=> b!1519289 m!1402679))

(declare-fun m!1402711 () Bool)

(assert (=> b!1519289 m!1402711))

(assert (=> b!1519295 m!1402679))

(assert (=> b!1519295 m!1402679))

(declare-fun m!1402713 () Bool)

(assert (=> b!1519295 m!1402713))

(assert (=> b!1519297 m!1402679))

(declare-fun m!1402715 () Bool)

(assert (=> b!1519297 m!1402715))

(declare-fun m!1402717 () Bool)

(assert (=> b!1519297 m!1402717))

(declare-fun m!1402719 () Bool)

(assert (=> b!1519290 m!1402719))

(assert (=> b!1519290 m!1402719))

(declare-fun m!1402721 () Bool)

(assert (=> b!1519290 m!1402721))

(declare-fun m!1402723 () Bool)

(assert (=> b!1519294 m!1402723))

(check-sat (not b!1519300) (not b!1519301) (not b!1519298) (not b!1519299) (not b!1519292) (not b!1519290) (not b!1519288) (not b!1519295) (not b!1519289) (not b!1519294) (not b!1519291) (not start!129332) (not b!1519297))
(check-sat)
