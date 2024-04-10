; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129310 () Bool)

(assert start!129310)

(declare-fun b!1518827 () Bool)

(declare-fun e!847272 () Bool)

(declare-fun e!847271 () Bool)

(assert (=> b!1518827 (= e!847272 e!847271)))

(declare-fun res!1038735 () Bool)

(assert (=> b!1518827 (=> (not res!1038735) (not e!847271))))

(declare-fun lt!658366 () (_ BitVec 64))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101166 0))(
  ( (array!101167 (arr!48820 (Array (_ BitVec 32) (_ BitVec 64))) (size!49370 (_ BitVec 32))) )
))
(declare-fun lt!658360 () array!101166)

(declare-datatypes ((SeekEntryResult!12991 0))(
  ( (MissingZero!12991 (index!54359 (_ BitVec 32))) (Found!12991 (index!54360 (_ BitVec 32))) (Intermediate!12991 (undefined!13803 Bool) (index!54361 (_ BitVec 32)) (x!136029 (_ BitVec 32))) (Undefined!12991) (MissingVacant!12991 (index!54362 (_ BitVec 32))) )
))
(declare-fun lt!658365 () SeekEntryResult!12991)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101166 (_ BitVec 32)) SeekEntryResult!12991)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1518827 (= res!1038735 (= lt!658365 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!658366 mask!2512) lt!658366 lt!658360 mask!2512)))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun a!2804 () array!101166)

(assert (=> b!1518827 (= lt!658366 (select (store (arr!48820 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1518827 (= lt!658360 (array!101167 (store (arr!48820 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49370 a!2804)))))

(declare-fun b!1518828 () Bool)

(declare-fun res!1038729 () Bool)

(declare-fun e!847268 () Bool)

(assert (=> b!1518828 (=> (not res!1038729) (not e!847268))))

(declare-datatypes ((List!35303 0))(
  ( (Nil!35300) (Cons!35299 (h!36711 (_ BitVec 64)) (t!49997 List!35303)) )
))
(declare-fun arrayNoDuplicates!0 (array!101166 (_ BitVec 32) List!35303) Bool)

(assert (=> b!1518828 (= res!1038729 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35300))))

(declare-fun b!1518829 () Bool)

(declare-fun res!1038737 () Bool)

(assert (=> b!1518829 (=> (not res!1038737) (not e!847268))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1518829 (= res!1038737 (validKeyInArray!0 (select (arr!48820 a!2804) i!961)))))

(declare-fun e!847273 () Bool)

(declare-fun b!1518830 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101166 (_ BitVec 32)) SeekEntryResult!12991)

(assert (=> b!1518830 (= e!847273 (= (seekEntry!0 (select (arr!48820 a!2804) j!70) a!2804 mask!2512) (Found!12991 j!70)))))

(declare-fun b!1518831 () Bool)

(declare-fun res!1038731 () Bool)

(assert (=> b!1518831 (=> (not res!1038731) (not e!847268))))

(assert (=> b!1518831 (= res!1038731 (and (= (size!49370 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49370 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49370 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1518832 () Bool)

(declare-fun e!847269 () Bool)

(assert (=> b!1518832 (= e!847271 (not e!847269))))

(declare-fun res!1038734 () Bool)

(assert (=> b!1518832 (=> res!1038734 e!847269)))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1518832 (= res!1038734 (or (not (= (select (arr!48820 a!2804) j!70) lt!658366)) (= x!534 resX!21)))))

(assert (=> b!1518832 e!847273))

(declare-fun res!1038730 () Bool)

(assert (=> b!1518832 (=> (not res!1038730) (not e!847273))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101166 (_ BitVec 32)) Bool)

(assert (=> b!1518832 (= res!1038730 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50850 0))(
  ( (Unit!50851) )
))
(declare-fun lt!658363 () Unit!50850)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101166 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50850)

(assert (=> b!1518832 (= lt!658363 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1518833 () Bool)

(declare-fun e!847267 () Bool)

(assert (=> b!1518833 (= e!847267 true)))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101166 (_ BitVec 32)) SeekEntryResult!12991)

(assert (=> b!1518833 (= (seekEntryOrOpen!0 (select (arr!48820 a!2804) j!70) a!2804 mask!2512) (seekEntryOrOpen!0 lt!658366 lt!658360 mask!2512))))

(declare-fun lt!658362 () Unit!50850)

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun lt!658364 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 (array!101166 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50850)

(assert (=> b!1518833 (= lt!658362 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 a!2804 i!961 j!70 (bvadd #b00000000000000000000000000000001 x!534) lt!658364 resX!21 resIndex!21 mask!2512))))

(declare-fun b!1518834 () Bool)

(declare-fun res!1038741 () Bool)

(assert (=> b!1518834 (=> res!1038741 e!847267)))

(declare-fun lt!658361 () SeekEntryResult!12991)

(assert (=> b!1518834 (= res!1038741 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!658364 (select (arr!48820 a!2804) j!70) a!2804 mask!2512) lt!658361)))))

(declare-fun b!1518835 () Bool)

(declare-fun res!1038742 () Bool)

(assert (=> b!1518835 (=> (not res!1038742) (not e!847268))))

(assert (=> b!1518835 (= res!1038742 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1518836 () Bool)

(assert (=> b!1518836 (= e!847268 e!847272)))

(declare-fun res!1038740 () Bool)

(assert (=> b!1518836 (=> (not res!1038740) (not e!847272))))

(assert (=> b!1518836 (= res!1038740 (= lt!658365 lt!658361))))

(assert (=> b!1518836 (= lt!658361 (Intermediate!12991 false resIndex!21 resX!21))))

(assert (=> b!1518836 (= lt!658365 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48820 a!2804) j!70) mask!2512) (select (arr!48820 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1518837 () Bool)

(assert (=> b!1518837 (= e!847269 e!847267)))

(declare-fun res!1038736 () Bool)

(assert (=> b!1518837 (=> res!1038736 e!847267)))

(assert (=> b!1518837 (= res!1038736 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!658364 #b00000000000000000000000000000000) (bvsge lt!658364 (size!49370 a!2804))))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1518837 (= lt!658364 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1518838 () Bool)

(declare-fun res!1038738 () Bool)

(assert (=> b!1518838 (=> (not res!1038738) (not e!847272))))

(assert (=> b!1518838 (= res!1038738 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48820 a!2804) j!70) a!2804 mask!2512) lt!658361))))

(declare-fun b!1518839 () Bool)

(declare-fun res!1038733 () Bool)

(assert (=> b!1518839 (=> (not res!1038733) (not e!847268))))

(assert (=> b!1518839 (= res!1038733 (validKeyInArray!0 (select (arr!48820 a!2804) j!70)))))

(declare-fun res!1038739 () Bool)

(assert (=> start!129310 (=> (not res!1038739) (not e!847268))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129310 (= res!1038739 (validMask!0 mask!2512))))

(assert (=> start!129310 e!847268))

(assert (=> start!129310 true))

(declare-fun array_inv!37848 (array!101166) Bool)

(assert (=> start!129310 (array_inv!37848 a!2804)))

(declare-fun b!1518826 () Bool)

(declare-fun res!1038732 () Bool)

(assert (=> b!1518826 (=> (not res!1038732) (not e!847268))))

(assert (=> b!1518826 (= res!1038732 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49370 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49370 a!2804))))))

(assert (= (and start!129310 res!1038739) b!1518831))

(assert (= (and b!1518831 res!1038731) b!1518829))

(assert (= (and b!1518829 res!1038737) b!1518839))

(assert (= (and b!1518839 res!1038733) b!1518835))

(assert (= (and b!1518835 res!1038742) b!1518828))

(assert (= (and b!1518828 res!1038729) b!1518826))

(assert (= (and b!1518826 res!1038732) b!1518836))

(assert (= (and b!1518836 res!1038740) b!1518838))

(assert (= (and b!1518838 res!1038738) b!1518827))

(assert (= (and b!1518827 res!1038735) b!1518832))

(assert (= (and b!1518832 res!1038730) b!1518830))

(assert (= (and b!1518832 (not res!1038734)) b!1518837))

(assert (= (and b!1518837 (not res!1038736)) b!1518834))

(assert (= (and b!1518834 (not res!1038741)) b!1518833))

(declare-fun m!1402173 () Bool)

(assert (=> b!1518835 m!1402173))

(declare-fun m!1402175 () Bool)

(assert (=> b!1518834 m!1402175))

(assert (=> b!1518834 m!1402175))

(declare-fun m!1402177 () Bool)

(assert (=> b!1518834 m!1402177))

(assert (=> b!1518830 m!1402175))

(assert (=> b!1518830 m!1402175))

(declare-fun m!1402179 () Bool)

(assert (=> b!1518830 m!1402179))

(declare-fun m!1402181 () Bool)

(assert (=> start!129310 m!1402181))

(declare-fun m!1402183 () Bool)

(assert (=> start!129310 m!1402183))

(assert (=> b!1518836 m!1402175))

(assert (=> b!1518836 m!1402175))

(declare-fun m!1402185 () Bool)

(assert (=> b!1518836 m!1402185))

(assert (=> b!1518836 m!1402185))

(assert (=> b!1518836 m!1402175))

(declare-fun m!1402187 () Bool)

(assert (=> b!1518836 m!1402187))

(assert (=> b!1518839 m!1402175))

(assert (=> b!1518839 m!1402175))

(declare-fun m!1402189 () Bool)

(assert (=> b!1518839 m!1402189))

(assert (=> b!1518833 m!1402175))

(assert (=> b!1518833 m!1402175))

(declare-fun m!1402191 () Bool)

(assert (=> b!1518833 m!1402191))

(declare-fun m!1402193 () Bool)

(assert (=> b!1518833 m!1402193))

(declare-fun m!1402195 () Bool)

(assert (=> b!1518833 m!1402195))

(declare-fun m!1402197 () Bool)

(assert (=> b!1518837 m!1402197))

(declare-fun m!1402199 () Bool)

(assert (=> b!1518827 m!1402199))

(assert (=> b!1518827 m!1402199))

(declare-fun m!1402201 () Bool)

(assert (=> b!1518827 m!1402201))

(declare-fun m!1402203 () Bool)

(assert (=> b!1518827 m!1402203))

(declare-fun m!1402205 () Bool)

(assert (=> b!1518827 m!1402205))

(assert (=> b!1518838 m!1402175))

(assert (=> b!1518838 m!1402175))

(declare-fun m!1402207 () Bool)

(assert (=> b!1518838 m!1402207))

(declare-fun m!1402209 () Bool)

(assert (=> b!1518828 m!1402209))

(assert (=> b!1518832 m!1402175))

(declare-fun m!1402211 () Bool)

(assert (=> b!1518832 m!1402211))

(declare-fun m!1402213 () Bool)

(assert (=> b!1518832 m!1402213))

(declare-fun m!1402215 () Bool)

(assert (=> b!1518829 m!1402215))

(assert (=> b!1518829 m!1402215))

(declare-fun m!1402217 () Bool)

(assert (=> b!1518829 m!1402217))

(push 1)

