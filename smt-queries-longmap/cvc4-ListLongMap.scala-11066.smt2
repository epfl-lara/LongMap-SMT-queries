; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129232 () Bool)

(assert start!129232)

(declare-fun b!1517279 () Bool)

(declare-fun res!1037190 () Bool)

(declare-fun e!846540 () Bool)

(assert (=> b!1517279 (=> (not res!1037190) (not e!846540))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101088 0))(
  ( (array!101089 (arr!48781 (Array (_ BitVec 32) (_ BitVec 64))) (size!49331 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101088)

(assert (=> b!1517279 (= res!1037190 (and (= (size!49331 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49331 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49331 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1517280 () Bool)

(declare-fun res!1037186 () Bool)

(assert (=> b!1517280 (=> (not res!1037186) (not e!846540))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1517280 (= res!1037186 (validKeyInArray!0 (select (arr!48781 a!2804) j!70)))))

(declare-fun b!1517281 () Bool)

(declare-fun res!1037192 () Bool)

(assert (=> b!1517281 (=> (not res!1037192) (not e!846540))))

(assert (=> b!1517281 (= res!1037192 (validKeyInArray!0 (select (arr!48781 a!2804) i!961)))))

(declare-fun e!846542 () Bool)

(declare-fun b!1517282 () Bool)

(declare-datatypes ((SeekEntryResult!12952 0))(
  ( (MissingZero!12952 (index!54203 (_ BitVec 32))) (Found!12952 (index!54204 (_ BitVec 32))) (Intermediate!12952 (undefined!13764 Bool) (index!54205 (_ BitVec 32)) (x!135886 (_ BitVec 32))) (Undefined!12952) (MissingVacant!12952 (index!54206 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!101088 (_ BitVec 32)) SeekEntryResult!12952)

(assert (=> b!1517282 (= e!846542 (= (seekEntry!0 (select (arr!48781 a!2804) j!70) a!2804 mask!2512) (Found!12952 j!70)))))

(declare-fun b!1517283 () Bool)

(declare-fun res!1037191 () Bool)

(declare-fun e!846541 () Bool)

(assert (=> b!1517283 (=> (not res!1037191) (not e!846541))))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun lt!657723 () SeekEntryResult!12952)

(declare-fun index!487 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101088 (_ BitVec 32)) SeekEntryResult!12952)

(assert (=> b!1517283 (= res!1037191 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48781 a!2804) j!70) a!2804 mask!2512) lt!657723))))

(declare-fun b!1517284 () Bool)

(declare-fun e!846539 () Bool)

(assert (=> b!1517284 (= e!846541 (not e!846539))))

(declare-fun res!1037189 () Bool)

(assert (=> b!1517284 (=> res!1037189 e!846539)))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1517284 (= res!1037189 (or (not (= (select (arr!48781 a!2804) j!70) (select (store (arr!48781 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(assert (=> b!1517284 e!846542))

(declare-fun res!1037194 () Bool)

(assert (=> b!1517284 (=> (not res!1037194) (not e!846542))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101088 (_ BitVec 32)) Bool)

(assert (=> b!1517284 (= res!1037194 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50772 0))(
  ( (Unit!50773) )
))
(declare-fun lt!657725 () Unit!50772)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101088 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50772)

(assert (=> b!1517284 (= lt!657725 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1517285 () Bool)

(declare-fun res!1037183 () Bool)

(assert (=> b!1517285 (=> (not res!1037183) (not e!846540))))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1517285 (= res!1037183 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49331 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49331 a!2804))))))

(declare-fun b!1517287 () Bool)

(assert (=> b!1517287 (= e!846540 e!846541)))

(declare-fun res!1037187 () Bool)

(assert (=> b!1517287 (=> (not res!1037187) (not e!846541))))

(declare-fun lt!657724 () SeekEntryResult!12952)

(assert (=> b!1517287 (= res!1037187 (= lt!657724 lt!657723))))

(assert (=> b!1517287 (= lt!657723 (Intermediate!12952 false resIndex!21 resX!21))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1517287 (= lt!657724 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48781 a!2804) j!70) mask!2512) (select (arr!48781 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1517288 () Bool)

(declare-fun res!1037184 () Bool)

(assert (=> b!1517288 (=> (not res!1037184) (not e!846540))))

(declare-datatypes ((List!35264 0))(
  ( (Nil!35261) (Cons!35260 (h!36672 (_ BitVec 64)) (t!49958 List!35264)) )
))
(declare-fun arrayNoDuplicates!0 (array!101088 (_ BitVec 32) List!35264) Bool)

(assert (=> b!1517288 (= res!1037184 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35261))))

(declare-fun b!1517289 () Bool)

(declare-fun res!1037193 () Bool)

(assert (=> b!1517289 (=> (not res!1037193) (not e!846540))))

(assert (=> b!1517289 (= res!1037193 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1517290 () Bool)

(declare-fun res!1037182 () Bool)

(assert (=> b!1517290 (=> (not res!1037182) (not e!846541))))

(assert (=> b!1517290 (= res!1037182 (= lt!657724 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48781 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48781 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101089 (store (arr!48781 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49331 a!2804)) mask!2512)))))

(declare-fun b!1517291 () Bool)

(declare-fun e!846543 () Bool)

(assert (=> b!1517291 (= e!846539 e!846543)))

(declare-fun res!1037188 () Bool)

(assert (=> b!1517291 (=> res!1037188 e!846543)))

(declare-fun lt!657726 () (_ BitVec 32))

(assert (=> b!1517291 (= res!1037188 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!657726 #b00000000000000000000000000000000) (bvsge lt!657726 (size!49331 a!2804))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1517291 (= lt!657726 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1517286 () Bool)

(assert (=> b!1517286 (= e!846543 true)))

(declare-fun lt!657727 () SeekEntryResult!12952)

(assert (=> b!1517286 (= lt!657727 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!657726 (select (arr!48781 a!2804) j!70) a!2804 mask!2512))))

(declare-fun res!1037185 () Bool)

(assert (=> start!129232 (=> (not res!1037185) (not e!846540))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129232 (= res!1037185 (validMask!0 mask!2512))))

(assert (=> start!129232 e!846540))

(assert (=> start!129232 true))

(declare-fun array_inv!37809 (array!101088) Bool)

(assert (=> start!129232 (array_inv!37809 a!2804)))

(assert (= (and start!129232 res!1037185) b!1517279))

(assert (= (and b!1517279 res!1037190) b!1517281))

(assert (= (and b!1517281 res!1037192) b!1517280))

(assert (= (and b!1517280 res!1037186) b!1517289))

(assert (= (and b!1517289 res!1037193) b!1517288))

(assert (= (and b!1517288 res!1037184) b!1517285))

(assert (= (and b!1517285 res!1037183) b!1517287))

(assert (= (and b!1517287 res!1037187) b!1517283))

(assert (= (and b!1517283 res!1037191) b!1517290))

(assert (= (and b!1517290 res!1037182) b!1517284))

(assert (= (and b!1517284 res!1037194) b!1517282))

(assert (= (and b!1517284 (not res!1037189)) b!1517291))

(assert (= (and b!1517291 (not res!1037188)) b!1517286))

(declare-fun m!1400565 () Bool)

(assert (=> b!1517282 m!1400565))

(assert (=> b!1517282 m!1400565))

(declare-fun m!1400567 () Bool)

(assert (=> b!1517282 m!1400567))

(declare-fun m!1400569 () Bool)

(assert (=> b!1517281 m!1400569))

(assert (=> b!1517281 m!1400569))

(declare-fun m!1400571 () Bool)

(assert (=> b!1517281 m!1400571))

(assert (=> b!1517283 m!1400565))

(assert (=> b!1517283 m!1400565))

(declare-fun m!1400573 () Bool)

(assert (=> b!1517283 m!1400573))

(declare-fun m!1400575 () Bool)

(assert (=> start!129232 m!1400575))

(declare-fun m!1400577 () Bool)

(assert (=> start!129232 m!1400577))

(assert (=> b!1517286 m!1400565))

(assert (=> b!1517286 m!1400565))

(declare-fun m!1400579 () Bool)

(assert (=> b!1517286 m!1400579))

(assert (=> b!1517284 m!1400565))

(declare-fun m!1400581 () Bool)

(assert (=> b!1517284 m!1400581))

(declare-fun m!1400583 () Bool)

(assert (=> b!1517284 m!1400583))

(declare-fun m!1400585 () Bool)

(assert (=> b!1517284 m!1400585))

(declare-fun m!1400587 () Bool)

(assert (=> b!1517284 m!1400587))

(assert (=> b!1517287 m!1400565))

(assert (=> b!1517287 m!1400565))

(declare-fun m!1400589 () Bool)

(assert (=> b!1517287 m!1400589))

(assert (=> b!1517287 m!1400589))

(assert (=> b!1517287 m!1400565))

(declare-fun m!1400591 () Bool)

(assert (=> b!1517287 m!1400591))

(assert (=> b!1517290 m!1400583))

(assert (=> b!1517290 m!1400585))

(assert (=> b!1517290 m!1400585))

(declare-fun m!1400593 () Bool)

(assert (=> b!1517290 m!1400593))

(assert (=> b!1517290 m!1400593))

(assert (=> b!1517290 m!1400585))

(declare-fun m!1400595 () Bool)

(assert (=> b!1517290 m!1400595))

(declare-fun m!1400597 () Bool)

(assert (=> b!1517288 m!1400597))

(declare-fun m!1400599 () Bool)

(assert (=> b!1517291 m!1400599))

(declare-fun m!1400601 () Bool)

(assert (=> b!1517289 m!1400601))

(assert (=> b!1517280 m!1400565))

(assert (=> b!1517280 m!1400565))

(declare-fun m!1400603 () Bool)

(assert (=> b!1517280 m!1400603))

(push 1)

