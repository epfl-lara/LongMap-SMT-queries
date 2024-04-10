; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129342 () Bool)

(assert start!129342)

(declare-fun b!1519501 () Bool)

(declare-fun res!1039412 () Bool)

(declare-fun e!847609 () Bool)

(assert (=> b!1519501 (=> (not res!1039412) (not e!847609))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!101198 0))(
  ( (array!101199 (arr!48836 (Array (_ BitVec 32) (_ BitVec 64))) (size!49386 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101198)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1519501 (= res!1039412 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49386 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49386 a!2804))))))

(declare-fun res!1039405 () Bool)

(assert (=> start!129342 (=> (not res!1039405) (not e!847609))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129342 (= res!1039405 (validMask!0 mask!2512))))

(assert (=> start!129342 e!847609))

(assert (=> start!129342 true))

(declare-fun array_inv!37864 (array!101198) Bool)

(assert (=> start!129342 (array_inv!37864 a!2804)))

(declare-fun e!847606 () Bool)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun b!1519502 () Bool)

(declare-datatypes ((SeekEntryResult!13007 0))(
  ( (MissingZero!13007 (index!54423 (_ BitVec 32))) (Found!13007 (index!54424 (_ BitVec 32))) (Intermediate!13007 (undefined!13819 Bool) (index!54425 (_ BitVec 32)) (x!136093 (_ BitVec 32))) (Undefined!13007) (MissingVacant!13007 (index!54426 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!101198 (_ BitVec 32)) SeekEntryResult!13007)

(assert (=> b!1519502 (= e!847606 (= (seekEntry!0 (select (arr!48836 a!2804) j!70) a!2804 mask!2512) (Found!13007 j!70)))))

(declare-fun b!1519503 () Bool)

(declare-fun res!1039411 () Bool)

(declare-fun e!847607 () Bool)

(assert (=> b!1519503 (=> (not res!1039411) (not e!847607))))

(declare-fun lt!658690 () SeekEntryResult!13007)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101198 (_ BitVec 32)) SeekEntryResult!13007)

(assert (=> b!1519503 (= res!1039411 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48836 a!2804) j!70) a!2804 mask!2512) lt!658690))))

(declare-fun b!1519504 () Bool)

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1519504 (= e!847607 (not (= (select (arr!48836 a!2804) j!70) (select (store (arr!48836 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))))

(assert (=> b!1519504 e!847606))

(declare-fun res!1039404 () Bool)

(assert (=> b!1519504 (=> (not res!1039404) (not e!847606))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101198 (_ BitVec 32)) Bool)

(assert (=> b!1519504 (= res!1039404 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50882 0))(
  ( (Unit!50883) )
))
(declare-fun lt!658689 () Unit!50882)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101198 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50882)

(assert (=> b!1519504 (= lt!658689 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1519505 () Bool)

(declare-fun res!1039406 () Bool)

(assert (=> b!1519505 (=> (not res!1039406) (not e!847609))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1519505 (= res!1039406 (validKeyInArray!0 (select (arr!48836 a!2804) i!961)))))

(declare-fun b!1519506 () Bool)

(declare-fun res!1039409 () Bool)

(assert (=> b!1519506 (=> (not res!1039409) (not e!847607))))

(declare-fun lt!658688 () SeekEntryResult!13007)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1519506 (= res!1039409 (= lt!658688 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48836 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48836 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101199 (store (arr!48836 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49386 a!2804)) mask!2512)))))

(declare-fun b!1519507 () Bool)

(declare-fun res!1039414 () Bool)

(assert (=> b!1519507 (=> (not res!1039414) (not e!847609))))

(declare-datatypes ((List!35319 0))(
  ( (Nil!35316) (Cons!35315 (h!36727 (_ BitVec 64)) (t!50013 List!35319)) )
))
(declare-fun arrayNoDuplicates!0 (array!101198 (_ BitVec 32) List!35319) Bool)

(assert (=> b!1519507 (= res!1039414 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35316))))

(declare-fun b!1519508 () Bool)

(assert (=> b!1519508 (= e!847609 e!847607)))

(declare-fun res!1039408 () Bool)

(assert (=> b!1519508 (=> (not res!1039408) (not e!847607))))

(assert (=> b!1519508 (= res!1039408 (= lt!658688 lt!658690))))

(assert (=> b!1519508 (= lt!658690 (Intermediate!13007 false resIndex!21 resX!21))))

(assert (=> b!1519508 (= lt!658688 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48836 a!2804) j!70) mask!2512) (select (arr!48836 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1519509 () Bool)

(declare-fun res!1039410 () Bool)

(assert (=> b!1519509 (=> (not res!1039410) (not e!847609))))

(assert (=> b!1519509 (= res!1039410 (and (= (size!49386 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49386 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49386 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1519510 () Bool)

(declare-fun res!1039407 () Bool)

(assert (=> b!1519510 (=> (not res!1039407) (not e!847609))))

(assert (=> b!1519510 (= res!1039407 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1519511 () Bool)

(declare-fun res!1039413 () Bool)

(assert (=> b!1519511 (=> (not res!1039413) (not e!847609))))

(assert (=> b!1519511 (= res!1039413 (validKeyInArray!0 (select (arr!48836 a!2804) j!70)))))

(assert (= (and start!129342 res!1039405) b!1519509))

(assert (= (and b!1519509 res!1039410) b!1519505))

(assert (= (and b!1519505 res!1039406) b!1519511))

(assert (= (and b!1519511 res!1039413) b!1519510))

(assert (= (and b!1519510 res!1039407) b!1519507))

(assert (= (and b!1519507 res!1039414) b!1519501))

(assert (= (and b!1519501 res!1039412) b!1519508))

(assert (= (and b!1519508 res!1039408) b!1519503))

(assert (= (and b!1519503 res!1039411) b!1519506))

(assert (= (and b!1519506 res!1039409) b!1519504))

(assert (= (and b!1519504 res!1039404) b!1519502))

(declare-fun m!1402915 () Bool)

(assert (=> b!1519507 m!1402915))

(declare-fun m!1402917 () Bool)

(assert (=> b!1519511 m!1402917))

(assert (=> b!1519511 m!1402917))

(declare-fun m!1402919 () Bool)

(assert (=> b!1519511 m!1402919))

(assert (=> b!1519502 m!1402917))

(assert (=> b!1519502 m!1402917))

(declare-fun m!1402921 () Bool)

(assert (=> b!1519502 m!1402921))

(assert (=> b!1519504 m!1402917))

(declare-fun m!1402923 () Bool)

(assert (=> b!1519504 m!1402923))

(declare-fun m!1402925 () Bool)

(assert (=> b!1519504 m!1402925))

(declare-fun m!1402927 () Bool)

(assert (=> b!1519504 m!1402927))

(declare-fun m!1402929 () Bool)

(assert (=> b!1519504 m!1402929))

(declare-fun m!1402931 () Bool)

(assert (=> b!1519505 m!1402931))

(assert (=> b!1519505 m!1402931))

(declare-fun m!1402933 () Bool)

(assert (=> b!1519505 m!1402933))

(declare-fun m!1402935 () Bool)

(assert (=> start!129342 m!1402935))

(declare-fun m!1402937 () Bool)

(assert (=> start!129342 m!1402937))

(assert (=> b!1519508 m!1402917))

(assert (=> b!1519508 m!1402917))

(declare-fun m!1402939 () Bool)

(assert (=> b!1519508 m!1402939))

(assert (=> b!1519508 m!1402939))

(assert (=> b!1519508 m!1402917))

(declare-fun m!1402941 () Bool)

(assert (=> b!1519508 m!1402941))

(assert (=> b!1519506 m!1402925))

(assert (=> b!1519506 m!1402927))

(assert (=> b!1519506 m!1402927))

(declare-fun m!1402943 () Bool)

(assert (=> b!1519506 m!1402943))

(assert (=> b!1519506 m!1402943))

(assert (=> b!1519506 m!1402927))

(declare-fun m!1402945 () Bool)

(assert (=> b!1519506 m!1402945))

(declare-fun m!1402947 () Bool)

(assert (=> b!1519510 m!1402947))

(assert (=> b!1519503 m!1402917))

(assert (=> b!1519503 m!1402917))

(declare-fun m!1402949 () Bool)

(assert (=> b!1519503 m!1402949))

(push 1)

