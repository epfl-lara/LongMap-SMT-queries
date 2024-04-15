; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128990 () Bool)

(assert start!128990)

(declare-fun b!1513191 () Bool)

(declare-fun res!1033311 () Bool)

(declare-fun e!844503 () Bool)

(assert (=> b!1513191 (=> (not res!1033311) (not e!844503))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!100846 0))(
  ( (array!100847 (arr!48661 (Array (_ BitVec 32) (_ BitVec 64))) (size!49213 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100846)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1513191 (= res!1033311 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49213 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49213 a!2804))))))

(declare-fun b!1513192 () Bool)

(declare-fun res!1033302 () Bool)

(declare-fun e!844502 () Bool)

(assert (=> b!1513192 (=> (not res!1033302) (not e!844502))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12855 0))(
  ( (MissingZero!12855 (index!53815 (_ BitVec 32))) (Found!12855 (index!53816 (_ BitVec 32))) (Intermediate!12855 (undefined!13667 Bool) (index!53817 (_ BitVec 32)) (x!135535 (_ BitVec 32))) (Undefined!12855) (MissingVacant!12855 (index!53818 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!100846 (_ BitVec 32)) SeekEntryResult!12855)

(assert (=> b!1513192 (= res!1033302 (= (seekEntry!0 (select (arr!48661 a!2804) j!70) a!2804 mask!2512) (Found!12855 j!70)))))

(declare-fun b!1513194 () Bool)

(declare-fun res!1033308 () Bool)

(assert (=> b!1513194 (=> (not res!1033308) (not e!844503))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1513194 (= res!1033308 (validKeyInArray!0 (select (arr!48661 a!2804) i!961)))))

(declare-fun b!1513195 () Bool)

(declare-fun res!1033305 () Bool)

(assert (=> b!1513195 (=> (not res!1033305) (not e!844503))))

(assert (=> b!1513195 (= res!1033305 (validKeyInArray!0 (select (arr!48661 a!2804) j!70)))))

(declare-fun b!1513196 () Bool)

(declare-fun res!1033307 () Bool)

(declare-fun e!844504 () Bool)

(assert (=> b!1513196 (=> (not res!1033307) (not e!844504))))

(declare-fun lt!655716 () SeekEntryResult!12855)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100846 (_ BitVec 32)) SeekEntryResult!12855)

(assert (=> b!1513196 (= res!1033307 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48661 a!2804) j!70) a!2804 mask!2512) lt!655716))))

(declare-fun b!1513197 () Bool)

(declare-fun e!844505 () Bool)

(assert (=> b!1513197 (= e!844504 e!844505)))

(declare-fun res!1033306 () Bool)

(assert (=> b!1513197 (=> (not res!1033306) (not e!844505))))

(declare-fun lt!655719 () array!100846)

(declare-fun lt!655718 () SeekEntryResult!12855)

(declare-fun lt!655717 () (_ BitVec 64))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1513197 (= res!1033306 (= lt!655718 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!655717 mask!2512) lt!655717 lt!655719 mask!2512)))))

(assert (=> b!1513197 (= lt!655717 (select (store (arr!48661 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1513197 (= lt!655719 (array!100847 (store (arr!48661 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49213 a!2804)))))

(declare-fun b!1513198 () Bool)

(declare-fun res!1033310 () Bool)

(assert (=> b!1513198 (=> (not res!1033310) (not e!844503))))

(declare-datatypes ((List!35222 0))(
  ( (Nil!35219) (Cons!35218 (h!36631 (_ BitVec 64)) (t!49908 List!35222)) )
))
(declare-fun arrayNoDuplicates!0 (array!100846 (_ BitVec 32) List!35222) Bool)

(assert (=> b!1513198 (= res!1033310 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35219))))

(declare-fun b!1513199 () Bool)

(assert (=> b!1513199 (= e!844505 (not true))))

(assert (=> b!1513199 e!844502))

(declare-fun res!1033304 () Bool)

(assert (=> b!1513199 (=> (not res!1033304) (not e!844502))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100846 (_ BitVec 32)) Bool)

(assert (=> b!1513199 (= res!1033304 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50417 0))(
  ( (Unit!50418) )
))
(declare-fun lt!655715 () Unit!50417)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100846 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50417)

(assert (=> b!1513199 (= lt!655715 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1513200 () Bool)

(assert (=> b!1513200 (= e!844503 e!844504)))

(declare-fun res!1033301 () Bool)

(assert (=> b!1513200 (=> (not res!1033301) (not e!844504))))

(assert (=> b!1513200 (= res!1033301 (= lt!655718 lt!655716))))

(assert (=> b!1513200 (= lt!655716 (Intermediate!12855 false resIndex!21 resX!21))))

(assert (=> b!1513200 (= lt!655718 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48661 a!2804) j!70) mask!2512) (select (arr!48661 a!2804) j!70) a!2804 mask!2512))))

(declare-fun res!1033300 () Bool)

(assert (=> start!128990 (=> (not res!1033300) (not e!844503))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128990 (= res!1033300 (validMask!0 mask!2512))))

(assert (=> start!128990 e!844503))

(assert (=> start!128990 true))

(declare-fun array_inv!37894 (array!100846) Bool)

(assert (=> start!128990 (array_inv!37894 a!2804)))

(declare-fun b!1513193 () Bool)

(declare-fun e!844501 () Bool)

(assert (=> b!1513193 (= e!844502 e!844501)))

(declare-fun res!1033309 () Bool)

(assert (=> b!1513193 (=> res!1033309 e!844501)))

(assert (=> b!1513193 (= res!1033309 (or (not (= (select (arr!48661 a!2804) j!70) lt!655717)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48661 a!2804) index!487) (select (arr!48661 a!2804) j!70)) (not (= (select (arr!48661 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1513201 () Bool)

(declare-fun e!844506 () Bool)

(assert (=> b!1513201 (= e!844501 e!844506)))

(declare-fun res!1033313 () Bool)

(assert (=> b!1513201 (=> (not res!1033313) (not e!844506))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100846 (_ BitVec 32)) SeekEntryResult!12855)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100846 (_ BitVec 32)) SeekEntryResult!12855)

(assert (=> b!1513201 (= res!1033313 (= (seekEntryOrOpen!0 (select (arr!48661 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48661 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1513202 () Bool)

(declare-fun res!1033312 () Bool)

(assert (=> b!1513202 (=> (not res!1033312) (not e!844503))))

(assert (=> b!1513202 (= res!1033312 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1513203 () Bool)

(declare-fun res!1033303 () Bool)

(assert (=> b!1513203 (=> (not res!1033303) (not e!844503))))

(assert (=> b!1513203 (= res!1033303 (and (= (size!49213 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49213 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49213 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1513204 () Bool)

(assert (=> b!1513204 (= e!844506 (= (seekEntryOrOpen!0 lt!655717 lt!655719 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!655717 lt!655719 mask!2512)))))

(assert (= (and start!128990 res!1033300) b!1513203))

(assert (= (and b!1513203 res!1033303) b!1513194))

(assert (= (and b!1513194 res!1033308) b!1513195))

(assert (= (and b!1513195 res!1033305) b!1513202))

(assert (= (and b!1513202 res!1033312) b!1513198))

(assert (= (and b!1513198 res!1033310) b!1513191))

(assert (= (and b!1513191 res!1033311) b!1513200))

(assert (= (and b!1513200 res!1033301) b!1513196))

(assert (= (and b!1513196 res!1033307) b!1513197))

(assert (= (and b!1513197 res!1033306) b!1513199))

(assert (= (and b!1513199 res!1033304) b!1513192))

(assert (= (and b!1513192 res!1033302) b!1513193))

(assert (= (and b!1513193 (not res!1033309)) b!1513201))

(assert (= (and b!1513201 res!1033313) b!1513204))

(declare-fun m!1395491 () Bool)

(assert (=> b!1513195 m!1395491))

(assert (=> b!1513195 m!1395491))

(declare-fun m!1395493 () Bool)

(assert (=> b!1513195 m!1395493))

(assert (=> b!1513201 m!1395491))

(assert (=> b!1513201 m!1395491))

(declare-fun m!1395495 () Bool)

(assert (=> b!1513201 m!1395495))

(assert (=> b!1513201 m!1395491))

(declare-fun m!1395497 () Bool)

(assert (=> b!1513201 m!1395497))

(assert (=> b!1513200 m!1395491))

(assert (=> b!1513200 m!1395491))

(declare-fun m!1395499 () Bool)

(assert (=> b!1513200 m!1395499))

(assert (=> b!1513200 m!1395499))

(assert (=> b!1513200 m!1395491))

(declare-fun m!1395501 () Bool)

(assert (=> b!1513200 m!1395501))

(declare-fun m!1395503 () Bool)

(assert (=> b!1513198 m!1395503))

(declare-fun m!1395505 () Bool)

(assert (=> b!1513204 m!1395505))

(declare-fun m!1395507 () Bool)

(assert (=> b!1513204 m!1395507))

(declare-fun m!1395509 () Bool)

(assert (=> b!1513199 m!1395509))

(declare-fun m!1395511 () Bool)

(assert (=> b!1513199 m!1395511))

(declare-fun m!1395513 () Bool)

(assert (=> start!128990 m!1395513))

(declare-fun m!1395515 () Bool)

(assert (=> start!128990 m!1395515))

(declare-fun m!1395517 () Bool)

(assert (=> b!1513202 m!1395517))

(declare-fun m!1395519 () Bool)

(assert (=> b!1513194 m!1395519))

(assert (=> b!1513194 m!1395519))

(declare-fun m!1395521 () Bool)

(assert (=> b!1513194 m!1395521))

(assert (=> b!1513193 m!1395491))

(declare-fun m!1395523 () Bool)

(assert (=> b!1513193 m!1395523))

(declare-fun m!1395525 () Bool)

(assert (=> b!1513197 m!1395525))

(assert (=> b!1513197 m!1395525))

(declare-fun m!1395527 () Bool)

(assert (=> b!1513197 m!1395527))

(declare-fun m!1395529 () Bool)

(assert (=> b!1513197 m!1395529))

(declare-fun m!1395531 () Bool)

(assert (=> b!1513197 m!1395531))

(assert (=> b!1513196 m!1395491))

(assert (=> b!1513196 m!1395491))

(declare-fun m!1395533 () Bool)

(assert (=> b!1513196 m!1395533))

(assert (=> b!1513192 m!1395491))

(assert (=> b!1513192 m!1395491))

(declare-fun m!1395535 () Bool)

(assert (=> b!1513192 m!1395535))

(check-sat (not b!1513204) (not b!1513199) (not b!1513192) (not b!1513197) (not b!1513195) (not b!1513198) (not b!1513202) (not start!128990) (not b!1513194) (not b!1513200) (not b!1513196) (not b!1513201))
(check-sat)
