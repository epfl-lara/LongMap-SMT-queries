; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128984 () Bool)

(assert start!128984)

(declare-fun b!1512353 () Bool)

(declare-fun res!1032264 () Bool)

(declare-fun e!844176 () Bool)

(assert (=> b!1512353 (=> (not res!1032264) (not e!844176))))

(declare-datatypes ((SeekEntryResult!12828 0))(
  ( (MissingZero!12828 (index!53707 (_ BitVec 32))) (Found!12828 (index!53708 (_ BitVec 32))) (Intermediate!12828 (undefined!13640 Bool) (index!53709 (_ BitVec 32)) (x!135434 (_ BitVec 32))) (Undefined!12828) (MissingVacant!12828 (index!53710 (_ BitVec 32))) )
))
(declare-fun lt!655657 () SeekEntryResult!12828)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!100840 0))(
  ( (array!100841 (arr!48657 (Array (_ BitVec 32) (_ BitVec 64))) (size!49207 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100840)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100840 (_ BitVec 32)) SeekEntryResult!12828)

(assert (=> b!1512353 (= res!1032264 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48657 a!2804) j!70) a!2804 mask!2512) lt!655657))))

(declare-fun b!1512354 () Bool)

(declare-fun res!1032256 () Bool)

(declare-fun e!844177 () Bool)

(assert (=> b!1512354 (=> (not res!1032256) (not e!844177))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1512354 (= res!1032256 (and (= (size!49207 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49207 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49207 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1512355 () Bool)

(assert (=> b!1512355 (= e!844176 (not true))))

(declare-fun e!844178 () Bool)

(assert (=> b!1512355 e!844178))

(declare-fun res!1032263 () Bool)

(assert (=> b!1512355 (=> (not res!1032263) (not e!844178))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100840 (_ BitVec 32)) Bool)

(assert (=> b!1512355 (= res!1032263 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50524 0))(
  ( (Unit!50525) )
))
(declare-fun lt!655655 () Unit!50524)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100840 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50524)

(assert (=> b!1512355 (= lt!655655 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1512356 () Bool)

(declare-fun res!1032268 () Bool)

(assert (=> b!1512356 (=> (not res!1032268) (not e!844177))))

(assert (=> b!1512356 (= res!1032268 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1512357 () Bool)

(assert (=> b!1512357 (= e!844177 e!844176)))

(declare-fun res!1032265 () Bool)

(assert (=> b!1512357 (=> (not res!1032265) (not e!844176))))

(declare-fun lt!655656 () SeekEntryResult!12828)

(assert (=> b!1512357 (= res!1032265 (= lt!655656 lt!655657))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1512357 (= lt!655657 (Intermediate!12828 false resIndex!21 resX!21))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1512357 (= lt!655656 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48657 a!2804) j!70) mask!2512) (select (arr!48657 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1512358 () Bool)

(declare-fun res!1032262 () Bool)

(assert (=> b!1512358 (=> (not res!1032262) (not e!844177))))

(assert (=> b!1512358 (= res!1032262 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49207 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49207 a!2804))))))

(declare-fun res!1032259 () Bool)

(assert (=> start!128984 (=> (not res!1032259) (not e!844177))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128984 (= res!1032259 (validMask!0 mask!2512))))

(assert (=> start!128984 e!844177))

(assert (=> start!128984 true))

(declare-fun array_inv!37685 (array!100840) Bool)

(assert (=> start!128984 (array_inv!37685 a!2804)))

(declare-fun e!844180 () Bool)

(declare-fun b!1512359 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100840 (_ BitVec 32)) SeekEntryResult!12828)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100840 (_ BitVec 32)) SeekEntryResult!12828)

(assert (=> b!1512359 (= e!844180 (= (seekEntryOrOpen!0 (select (arr!48657 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48657 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1512360 () Bool)

(assert (=> b!1512360 (= e!844178 e!844180)))

(declare-fun res!1032257 () Bool)

(assert (=> b!1512360 (=> res!1032257 e!844180)))

(assert (=> b!1512360 (= res!1032257 (or (not (= (select (arr!48657 a!2804) j!70) (select (store (arr!48657 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48657 a!2804) index!487) (select (arr!48657 a!2804) j!70)) (not (= (select (arr!48657 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1512361 () Bool)

(declare-fun res!1032266 () Bool)

(assert (=> b!1512361 (=> (not res!1032266) (not e!844177))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1512361 (= res!1032266 (validKeyInArray!0 (select (arr!48657 a!2804) i!961)))))

(declare-fun b!1512362 () Bool)

(declare-fun res!1032267 () Bool)

(assert (=> b!1512362 (=> (not res!1032267) (not e!844177))))

(declare-datatypes ((List!35140 0))(
  ( (Nil!35137) (Cons!35136 (h!36548 (_ BitVec 64)) (t!49834 List!35140)) )
))
(declare-fun arrayNoDuplicates!0 (array!100840 (_ BitVec 32) List!35140) Bool)

(assert (=> b!1512362 (= res!1032267 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35137))))

(declare-fun b!1512363 () Bool)

(declare-fun res!1032260 () Bool)

(assert (=> b!1512363 (=> (not res!1032260) (not e!844176))))

(assert (=> b!1512363 (= res!1032260 (= lt!655656 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48657 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48657 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100841 (store (arr!48657 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49207 a!2804)) mask!2512)))))

(declare-fun b!1512364 () Bool)

(declare-fun res!1032261 () Bool)

(assert (=> b!1512364 (=> (not res!1032261) (not e!844177))))

(assert (=> b!1512364 (= res!1032261 (validKeyInArray!0 (select (arr!48657 a!2804) j!70)))))

(declare-fun b!1512365 () Bool)

(declare-fun res!1032258 () Bool)

(assert (=> b!1512365 (=> (not res!1032258) (not e!844178))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!100840 (_ BitVec 32)) SeekEntryResult!12828)

(assert (=> b!1512365 (= res!1032258 (= (seekEntry!0 (select (arr!48657 a!2804) j!70) a!2804 mask!2512) (Found!12828 j!70)))))

(assert (= (and start!128984 res!1032259) b!1512354))

(assert (= (and b!1512354 res!1032256) b!1512361))

(assert (= (and b!1512361 res!1032266) b!1512364))

(assert (= (and b!1512364 res!1032261) b!1512356))

(assert (= (and b!1512356 res!1032268) b!1512362))

(assert (= (and b!1512362 res!1032267) b!1512358))

(assert (= (and b!1512358 res!1032262) b!1512357))

(assert (= (and b!1512357 res!1032265) b!1512353))

(assert (= (and b!1512353 res!1032264) b!1512363))

(assert (= (and b!1512363 res!1032260) b!1512355))

(assert (= (and b!1512355 res!1032263) b!1512365))

(assert (= (and b!1512365 res!1032258) b!1512360))

(assert (= (and b!1512360 (not res!1032257)) b!1512359))

(declare-fun m!1395115 () Bool)

(assert (=> b!1512361 m!1395115))

(assert (=> b!1512361 m!1395115))

(declare-fun m!1395117 () Bool)

(assert (=> b!1512361 m!1395117))

(declare-fun m!1395119 () Bool)

(assert (=> b!1512365 m!1395119))

(assert (=> b!1512365 m!1395119))

(declare-fun m!1395121 () Bool)

(assert (=> b!1512365 m!1395121))

(declare-fun m!1395123 () Bool)

(assert (=> b!1512355 m!1395123))

(declare-fun m!1395125 () Bool)

(assert (=> b!1512355 m!1395125))

(declare-fun m!1395127 () Bool)

(assert (=> b!1512363 m!1395127))

(declare-fun m!1395129 () Bool)

(assert (=> b!1512363 m!1395129))

(assert (=> b!1512363 m!1395129))

(declare-fun m!1395131 () Bool)

(assert (=> b!1512363 m!1395131))

(assert (=> b!1512363 m!1395131))

(assert (=> b!1512363 m!1395129))

(declare-fun m!1395133 () Bool)

(assert (=> b!1512363 m!1395133))

(assert (=> b!1512357 m!1395119))

(assert (=> b!1512357 m!1395119))

(declare-fun m!1395135 () Bool)

(assert (=> b!1512357 m!1395135))

(assert (=> b!1512357 m!1395135))

(assert (=> b!1512357 m!1395119))

(declare-fun m!1395137 () Bool)

(assert (=> b!1512357 m!1395137))

(declare-fun m!1395139 () Bool)

(assert (=> b!1512362 m!1395139))

(declare-fun m!1395141 () Bool)

(assert (=> start!128984 m!1395141))

(declare-fun m!1395143 () Bool)

(assert (=> start!128984 m!1395143))

(declare-fun m!1395145 () Bool)

(assert (=> b!1512356 m!1395145))

(assert (=> b!1512360 m!1395119))

(assert (=> b!1512360 m!1395127))

(assert (=> b!1512360 m!1395129))

(declare-fun m!1395147 () Bool)

(assert (=> b!1512360 m!1395147))

(assert (=> b!1512353 m!1395119))

(assert (=> b!1512353 m!1395119))

(declare-fun m!1395149 () Bool)

(assert (=> b!1512353 m!1395149))

(assert (=> b!1512359 m!1395119))

(assert (=> b!1512359 m!1395119))

(declare-fun m!1395151 () Bool)

(assert (=> b!1512359 m!1395151))

(assert (=> b!1512359 m!1395119))

(declare-fun m!1395153 () Bool)

(assert (=> b!1512359 m!1395153))

(assert (=> b!1512364 m!1395119))

(assert (=> b!1512364 m!1395119))

(declare-fun m!1395155 () Bool)

(assert (=> b!1512364 m!1395155))

(check-sat (not b!1512355) (not b!1512361) (not b!1512363) (not b!1512357) (not b!1512365) (not b!1512364) (not b!1512362) (not b!1512356) (not b!1512359) (not start!128984) (not b!1512353))
(check-sat)
