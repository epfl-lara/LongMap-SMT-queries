; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129036 () Bool)

(assert start!129036)

(declare-fun b!1513405 () Bool)

(declare-fun res!1033321 () Bool)

(declare-fun e!844652 () Bool)

(assert (=> b!1513405 (=> (not res!1033321) (not e!844652))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!100892 0))(
  ( (array!100893 (arr!48683 (Array (_ BitVec 32) (_ BitVec 64))) (size!49233 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100892)

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12854 0))(
  ( (MissingZero!12854 (index!53811 (_ BitVec 32))) (Found!12854 (index!53812 (_ BitVec 32))) (Intermediate!12854 (undefined!13666 Bool) (index!53813 (_ BitVec 32)) (x!135532 (_ BitVec 32))) (Undefined!12854) (MissingVacant!12854 (index!53814 (_ BitVec 32))) )
))
(declare-fun lt!655967 () SeekEntryResult!12854)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100892 (_ BitVec 32)) SeekEntryResult!12854)

(assert (=> b!1513405 (= res!1033321 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48683 a!2804) j!70) a!2804 mask!2512) lt!655967))))

(declare-fun b!1513406 () Bool)

(declare-fun e!844655 () Bool)

(assert (=> b!1513406 (= e!844652 e!844655)))

(declare-fun res!1033309 () Bool)

(assert (=> b!1513406 (=> (not res!1033309) (not e!844655))))

(declare-fun lt!655965 () (_ BitVec 64))

(declare-fun lt!655969 () array!100892)

(declare-fun lt!655966 () SeekEntryResult!12854)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1513406 (= res!1033309 (= lt!655966 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!655965 mask!2512) lt!655965 lt!655969 mask!2512)))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1513406 (= lt!655965 (select (store (arr!48683 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1513406 (= lt!655969 (array!100893 (store (arr!48683 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49233 a!2804)))))

(declare-fun b!1513407 () Bool)

(declare-fun res!1033311 () Bool)

(declare-fun e!844654 () Bool)

(assert (=> b!1513407 (=> (not res!1033311) (not e!844654))))

(declare-datatypes ((List!35166 0))(
  ( (Nil!35163) (Cons!35162 (h!36574 (_ BitVec 64)) (t!49860 List!35166)) )
))
(declare-fun arrayNoDuplicates!0 (array!100892 (_ BitVec 32) List!35166) Bool)

(assert (=> b!1513407 (= res!1033311 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35163))))

(declare-fun b!1513408 () Bool)

(declare-fun e!844657 () Bool)

(declare-fun e!844653 () Bool)

(assert (=> b!1513408 (= e!844657 e!844653)))

(declare-fun res!1033318 () Bool)

(assert (=> b!1513408 (=> (not res!1033318) (not e!844653))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100892 (_ BitVec 32)) SeekEntryResult!12854)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100892 (_ BitVec 32)) SeekEntryResult!12854)

(assert (=> b!1513408 (= res!1033318 (= (seekEntryOrOpen!0 (select (arr!48683 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48683 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1513409 () Bool)

(assert (=> b!1513409 (= e!844654 e!844652)))

(declare-fun res!1033320 () Bool)

(assert (=> b!1513409 (=> (not res!1033320) (not e!844652))))

(assert (=> b!1513409 (= res!1033320 (= lt!655966 lt!655967))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1513409 (= lt!655967 (Intermediate!12854 false resIndex!21 resX!21))))

(assert (=> b!1513409 (= lt!655966 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48683 a!2804) j!70) mask!2512) (select (arr!48683 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1513410 () Bool)

(assert (=> b!1513410 (= e!844653 (= (seekEntryOrOpen!0 lt!655965 lt!655969 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!655965 lt!655969 mask!2512)))))

(declare-fun b!1513411 () Bool)

(declare-fun res!1033319 () Bool)

(assert (=> b!1513411 (=> (not res!1033319) (not e!844654))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100892 (_ BitVec 32)) Bool)

(assert (=> b!1513411 (= res!1033319 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1513412 () Bool)

(declare-fun e!844651 () Bool)

(assert (=> b!1513412 (= e!844651 e!844657)))

(declare-fun res!1033317 () Bool)

(assert (=> b!1513412 (=> res!1033317 e!844657)))

(assert (=> b!1513412 (= res!1033317 (or (not (= (select (arr!48683 a!2804) j!70) lt!655965)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48683 a!2804) index!487) (select (arr!48683 a!2804) j!70)) (not (= (select (arr!48683 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!1033312 () Bool)

(assert (=> start!129036 (=> (not res!1033312) (not e!844654))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129036 (= res!1033312 (validMask!0 mask!2512))))

(assert (=> start!129036 e!844654))

(assert (=> start!129036 true))

(declare-fun array_inv!37711 (array!100892) Bool)

(assert (=> start!129036 (array_inv!37711 a!2804)))

(declare-fun b!1513413 () Bool)

(declare-fun res!1033314 () Bool)

(assert (=> b!1513413 (=> (not res!1033314) (not e!844654))))

(assert (=> b!1513413 (= res!1033314 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49233 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49233 a!2804))))))

(declare-fun b!1513414 () Bool)

(declare-fun res!1033308 () Bool)

(assert (=> b!1513414 (=> (not res!1033308) (not e!844654))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1513414 (= res!1033308 (validKeyInArray!0 (select (arr!48683 a!2804) i!961)))))

(declare-fun b!1513415 () Bool)

(declare-fun res!1033316 () Bool)

(assert (=> b!1513415 (=> (not res!1033316) (not e!844654))))

(assert (=> b!1513415 (= res!1033316 (and (= (size!49233 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49233 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49233 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1513416 () Bool)

(declare-fun res!1033310 () Bool)

(assert (=> b!1513416 (=> (not res!1033310) (not e!844651))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!100892 (_ BitVec 32)) SeekEntryResult!12854)

(assert (=> b!1513416 (= res!1033310 (= (seekEntry!0 (select (arr!48683 a!2804) j!70) a!2804 mask!2512) (Found!12854 j!70)))))

(declare-fun b!1513417 () Bool)

(assert (=> b!1513417 (= e!844655 (not true))))

(assert (=> b!1513417 e!844651))

(declare-fun res!1033313 () Bool)

(assert (=> b!1513417 (=> (not res!1033313) (not e!844651))))

(assert (=> b!1513417 (= res!1033313 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50576 0))(
  ( (Unit!50577) )
))
(declare-fun lt!655968 () Unit!50576)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100892 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50576)

(assert (=> b!1513417 (= lt!655968 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1513418 () Bool)

(declare-fun res!1033315 () Bool)

(assert (=> b!1513418 (=> (not res!1033315) (not e!844654))))

(assert (=> b!1513418 (= res!1033315 (validKeyInArray!0 (select (arr!48683 a!2804) j!70)))))

(assert (= (and start!129036 res!1033312) b!1513415))

(assert (= (and b!1513415 res!1033316) b!1513414))

(assert (= (and b!1513414 res!1033308) b!1513418))

(assert (= (and b!1513418 res!1033315) b!1513411))

(assert (= (and b!1513411 res!1033319) b!1513407))

(assert (= (and b!1513407 res!1033311) b!1513413))

(assert (= (and b!1513413 res!1033314) b!1513409))

(assert (= (and b!1513409 res!1033320) b!1513405))

(assert (= (and b!1513405 res!1033321) b!1513406))

(assert (= (and b!1513406 res!1033309) b!1513417))

(assert (= (and b!1513417 res!1033313) b!1513416))

(assert (= (and b!1513416 res!1033310) b!1513412))

(assert (= (and b!1513412 (not res!1033317)) b!1513408))

(assert (= (and b!1513408 res!1033318) b!1513410))

(declare-fun m!1396261 () Bool)

(assert (=> b!1513408 m!1396261))

(assert (=> b!1513408 m!1396261))

(declare-fun m!1396263 () Bool)

(assert (=> b!1513408 m!1396263))

(assert (=> b!1513408 m!1396261))

(declare-fun m!1396265 () Bool)

(assert (=> b!1513408 m!1396265))

(declare-fun m!1396267 () Bool)

(assert (=> b!1513411 m!1396267))

(assert (=> b!1513416 m!1396261))

(assert (=> b!1513416 m!1396261))

(declare-fun m!1396269 () Bool)

(assert (=> b!1513416 m!1396269))

(declare-fun m!1396271 () Bool)

(assert (=> b!1513407 m!1396271))

(declare-fun m!1396273 () Bool)

(assert (=> start!129036 m!1396273))

(declare-fun m!1396275 () Bool)

(assert (=> start!129036 m!1396275))

(declare-fun m!1396277 () Bool)

(assert (=> b!1513410 m!1396277))

(declare-fun m!1396279 () Bool)

(assert (=> b!1513410 m!1396279))

(assert (=> b!1513412 m!1396261))

(declare-fun m!1396281 () Bool)

(assert (=> b!1513412 m!1396281))

(assert (=> b!1513418 m!1396261))

(assert (=> b!1513418 m!1396261))

(declare-fun m!1396283 () Bool)

(assert (=> b!1513418 m!1396283))

(assert (=> b!1513409 m!1396261))

(assert (=> b!1513409 m!1396261))

(declare-fun m!1396285 () Bool)

(assert (=> b!1513409 m!1396285))

(assert (=> b!1513409 m!1396285))

(assert (=> b!1513409 m!1396261))

(declare-fun m!1396287 () Bool)

(assert (=> b!1513409 m!1396287))

(declare-fun m!1396289 () Bool)

(assert (=> b!1513406 m!1396289))

(assert (=> b!1513406 m!1396289))

(declare-fun m!1396291 () Bool)

(assert (=> b!1513406 m!1396291))

(declare-fun m!1396293 () Bool)

(assert (=> b!1513406 m!1396293))

(declare-fun m!1396295 () Bool)

(assert (=> b!1513406 m!1396295))

(declare-fun m!1396297 () Bool)

(assert (=> b!1513417 m!1396297))

(declare-fun m!1396299 () Bool)

(assert (=> b!1513417 m!1396299))

(declare-fun m!1396301 () Bool)

(assert (=> b!1513414 m!1396301))

(assert (=> b!1513414 m!1396301))

(declare-fun m!1396303 () Bool)

(assert (=> b!1513414 m!1396303))

(assert (=> b!1513405 m!1396261))

(assert (=> b!1513405 m!1396261))

(declare-fun m!1396305 () Bool)

(assert (=> b!1513405 m!1396305))

(push 1)

