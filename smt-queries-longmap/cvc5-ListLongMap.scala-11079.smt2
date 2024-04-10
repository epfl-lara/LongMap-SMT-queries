; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129306 () Bool)

(assert start!129306)

(declare-fun b!1518742 () Bool)

(declare-fun res!1038651 () Bool)

(declare-fun e!847225 () Bool)

(assert (=> b!1518742 (=> (not res!1038651) (not e!847225))))

(declare-datatypes ((array!101162 0))(
  ( (array!101163 (arr!48818 (Array (_ BitVec 32) (_ BitVec 64))) (size!49368 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101162)

(declare-datatypes ((List!35301 0))(
  ( (Nil!35298) (Cons!35297 (h!36709 (_ BitVec 64)) (t!49995 List!35301)) )
))
(declare-fun arrayNoDuplicates!0 (array!101162 (_ BitVec 32) List!35301) Bool)

(assert (=> b!1518742 (= res!1038651 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35298))))

(declare-fun res!1038650 () Bool)

(assert (=> start!129306 (=> (not res!1038650) (not e!847225))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129306 (= res!1038650 (validMask!0 mask!2512))))

(assert (=> start!129306 e!847225))

(assert (=> start!129306 true))

(declare-fun array_inv!37846 (array!101162) Bool)

(assert (=> start!129306 (array_inv!37846 a!2804)))

(declare-fun b!1518743 () Bool)

(declare-fun e!847231 () Bool)

(declare-fun e!847228 () Bool)

(assert (=> b!1518743 (= e!847231 e!847228)))

(declare-fun res!1038645 () Bool)

(assert (=> b!1518743 (=> res!1038645 e!847228)))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun lt!658318 () (_ BitVec 32))

(assert (=> b!1518743 (= res!1038645 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!658318 #b00000000000000000000000000000000) (bvsge lt!658318 (size!49368 a!2804))))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1518743 (= lt!658318 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1518744 () Bool)

(assert (=> b!1518744 (= e!847228 true)))

(declare-fun lt!658322 () (_ BitVec 64))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun lt!658323 () array!101162)

(declare-datatypes ((SeekEntryResult!12989 0))(
  ( (MissingZero!12989 (index!54351 (_ BitVec 32))) (Found!12989 (index!54352 (_ BitVec 32))) (Intermediate!12989 (undefined!13801 Bool) (index!54353 (_ BitVec 32)) (x!136027 (_ BitVec 32))) (Undefined!12989) (MissingVacant!12989 (index!54354 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101162 (_ BitVec 32)) SeekEntryResult!12989)

(assert (=> b!1518744 (= (seekEntryOrOpen!0 (select (arr!48818 a!2804) j!70) a!2804 mask!2512) (seekEntryOrOpen!0 lt!658322 lt!658323 mask!2512))))

(declare-datatypes ((Unit!50846 0))(
  ( (Unit!50847) )
))
(declare-fun lt!658321 () Unit!50846)

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 (array!101162 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50846)

(assert (=> b!1518744 (= lt!658321 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 a!2804 i!961 j!70 (bvadd #b00000000000000000000000000000001 x!534) lt!658318 resX!21 resIndex!21 mask!2512))))

(declare-fun b!1518745 () Bool)

(declare-fun e!847227 () Bool)

(assert (=> b!1518745 (= e!847227 (not e!847231))))

(declare-fun res!1038647 () Bool)

(assert (=> b!1518745 (=> res!1038647 e!847231)))

(assert (=> b!1518745 (= res!1038647 (or (not (= (select (arr!48818 a!2804) j!70) lt!658322)) (= x!534 resX!21)))))

(declare-fun e!847230 () Bool)

(assert (=> b!1518745 e!847230))

(declare-fun res!1038648 () Bool)

(assert (=> b!1518745 (=> (not res!1038648) (not e!847230))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101162 (_ BitVec 32)) Bool)

(assert (=> b!1518745 (= res!1038648 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-fun lt!658324 () Unit!50846)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101162 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50846)

(assert (=> b!1518745 (= lt!658324 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1518746 () Bool)

(declare-fun res!1038652 () Bool)

(assert (=> b!1518746 (=> res!1038652 e!847228)))

(declare-fun lt!658320 () SeekEntryResult!12989)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101162 (_ BitVec 32)) SeekEntryResult!12989)

(assert (=> b!1518746 (= res!1038652 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!658318 (select (arr!48818 a!2804) j!70) a!2804 mask!2512) lt!658320)))))

(declare-fun b!1518747 () Bool)

(declare-fun e!847229 () Bool)

(assert (=> b!1518747 (= e!847229 e!847227)))

(declare-fun res!1038654 () Bool)

(assert (=> b!1518747 (=> (not res!1038654) (not e!847227))))

(declare-fun lt!658319 () SeekEntryResult!12989)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1518747 (= res!1038654 (= lt!658319 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!658322 mask!2512) lt!658322 lt!658323 mask!2512)))))

(assert (=> b!1518747 (= lt!658322 (select (store (arr!48818 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1518747 (= lt!658323 (array!101163 (store (arr!48818 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49368 a!2804)))))

(declare-fun b!1518748 () Bool)

(declare-fun res!1038655 () Bool)

(assert (=> b!1518748 (=> (not res!1038655) (not e!847225))))

(assert (=> b!1518748 (= res!1038655 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1518749 () Bool)

(assert (=> b!1518749 (= e!847225 e!847229)))

(declare-fun res!1038649 () Bool)

(assert (=> b!1518749 (=> (not res!1038649) (not e!847229))))

(assert (=> b!1518749 (= res!1038649 (= lt!658319 lt!658320))))

(assert (=> b!1518749 (= lt!658320 (Intermediate!12989 false resIndex!21 resX!21))))

(assert (=> b!1518749 (= lt!658319 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48818 a!2804) j!70) mask!2512) (select (arr!48818 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1518750 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101162 (_ BitVec 32)) SeekEntryResult!12989)

(assert (=> b!1518750 (= e!847230 (= (seekEntry!0 (select (arr!48818 a!2804) j!70) a!2804 mask!2512) (Found!12989 j!70)))))

(declare-fun b!1518751 () Bool)

(declare-fun res!1038653 () Bool)

(assert (=> b!1518751 (=> (not res!1038653) (not e!847225))))

(assert (=> b!1518751 (= res!1038653 (and (= (size!49368 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49368 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49368 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1518752 () Bool)

(declare-fun res!1038656 () Bool)

(assert (=> b!1518752 (=> (not res!1038656) (not e!847229))))

(assert (=> b!1518752 (= res!1038656 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48818 a!2804) j!70) a!2804 mask!2512) lt!658320))))

(declare-fun b!1518753 () Bool)

(declare-fun res!1038657 () Bool)

(assert (=> b!1518753 (=> (not res!1038657) (not e!847225))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1518753 (= res!1038657 (validKeyInArray!0 (select (arr!48818 a!2804) i!961)))))

(declare-fun b!1518754 () Bool)

(declare-fun res!1038658 () Bool)

(assert (=> b!1518754 (=> (not res!1038658) (not e!847225))))

(assert (=> b!1518754 (= res!1038658 (validKeyInArray!0 (select (arr!48818 a!2804) j!70)))))

(declare-fun b!1518755 () Bool)

(declare-fun res!1038646 () Bool)

(assert (=> b!1518755 (=> (not res!1038646) (not e!847225))))

(assert (=> b!1518755 (= res!1038646 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49368 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49368 a!2804))))))

(assert (= (and start!129306 res!1038650) b!1518751))

(assert (= (and b!1518751 res!1038653) b!1518753))

(assert (= (and b!1518753 res!1038657) b!1518754))

(assert (= (and b!1518754 res!1038658) b!1518748))

(assert (= (and b!1518748 res!1038655) b!1518742))

(assert (= (and b!1518742 res!1038651) b!1518755))

(assert (= (and b!1518755 res!1038646) b!1518749))

(assert (= (and b!1518749 res!1038649) b!1518752))

(assert (= (and b!1518752 res!1038656) b!1518747))

(assert (= (and b!1518747 res!1038654) b!1518745))

(assert (= (and b!1518745 res!1038648) b!1518750))

(assert (= (and b!1518745 (not res!1038647)) b!1518743))

(assert (= (and b!1518743 (not res!1038645)) b!1518746))

(assert (= (and b!1518746 (not res!1038652)) b!1518744))

(declare-fun m!1402081 () Bool)

(assert (=> b!1518745 m!1402081))

(declare-fun m!1402083 () Bool)

(assert (=> b!1518745 m!1402083))

(declare-fun m!1402085 () Bool)

(assert (=> b!1518745 m!1402085))

(assert (=> b!1518749 m!1402081))

(assert (=> b!1518749 m!1402081))

(declare-fun m!1402087 () Bool)

(assert (=> b!1518749 m!1402087))

(assert (=> b!1518749 m!1402087))

(assert (=> b!1518749 m!1402081))

(declare-fun m!1402089 () Bool)

(assert (=> b!1518749 m!1402089))

(assert (=> b!1518754 m!1402081))

(assert (=> b!1518754 m!1402081))

(declare-fun m!1402091 () Bool)

(assert (=> b!1518754 m!1402091))

(assert (=> b!1518746 m!1402081))

(assert (=> b!1518746 m!1402081))

(declare-fun m!1402093 () Bool)

(assert (=> b!1518746 m!1402093))

(assert (=> b!1518752 m!1402081))

(assert (=> b!1518752 m!1402081))

(declare-fun m!1402095 () Bool)

(assert (=> b!1518752 m!1402095))

(declare-fun m!1402097 () Bool)

(assert (=> b!1518742 m!1402097))

(declare-fun m!1402099 () Bool)

(assert (=> b!1518753 m!1402099))

(assert (=> b!1518753 m!1402099))

(declare-fun m!1402101 () Bool)

(assert (=> b!1518753 m!1402101))

(declare-fun m!1402103 () Bool)

(assert (=> b!1518743 m!1402103))

(declare-fun m!1402105 () Bool)

(assert (=> b!1518747 m!1402105))

(assert (=> b!1518747 m!1402105))

(declare-fun m!1402107 () Bool)

(assert (=> b!1518747 m!1402107))

(declare-fun m!1402109 () Bool)

(assert (=> b!1518747 m!1402109))

(declare-fun m!1402111 () Bool)

(assert (=> b!1518747 m!1402111))

(assert (=> b!1518750 m!1402081))

(assert (=> b!1518750 m!1402081))

(declare-fun m!1402113 () Bool)

(assert (=> b!1518750 m!1402113))

(declare-fun m!1402115 () Bool)

(assert (=> start!129306 m!1402115))

(declare-fun m!1402117 () Bool)

(assert (=> start!129306 m!1402117))

(declare-fun m!1402119 () Bool)

(assert (=> b!1518748 m!1402119))

(assert (=> b!1518744 m!1402081))

(assert (=> b!1518744 m!1402081))

(declare-fun m!1402121 () Bool)

(assert (=> b!1518744 m!1402121))

(declare-fun m!1402123 () Bool)

(assert (=> b!1518744 m!1402123))

(declare-fun m!1402125 () Bool)

(assert (=> b!1518744 m!1402125))

(push 1)

