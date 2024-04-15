; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121176 () Bool)

(assert start!121176)

(declare-fun b!1408925 () Bool)

(declare-fun e!797339 () Bool)

(declare-fun e!797342 () Bool)

(assert (=> b!1408925 (= e!797339 (not e!797342))))

(declare-fun res!946703 () Bool)

(assert (=> b!1408925 (=> res!946703 e!797342)))

(declare-datatypes ((SeekEntryResult!10822 0))(
  ( (MissingZero!10822 (index!45665 (_ BitVec 32))) (Found!10822 (index!45666 (_ BitVec 32))) (Intermediate!10822 (undefined!11634 Bool) (index!45667 (_ BitVec 32)) (x!127252 (_ BitVec 32))) (Undefined!10822) (MissingVacant!10822 (index!45668 (_ BitVec 32))) )
))
(declare-fun lt!620370 () SeekEntryResult!10822)

(assert (=> b!1408925 (= res!946703 (or (not (is-Intermediate!10822 lt!620370)) (undefined!11634 lt!620370)))))

(declare-fun e!797341 () Bool)

(assert (=> b!1408925 e!797341))

(declare-fun res!946704 () Bool)

(assert (=> b!1408925 (=> (not res!946704) (not e!797341))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96283 0))(
  ( (array!96284 (arr!46485 (Array (_ BitVec 32) (_ BitVec 64))) (size!47037 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96283)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96283 (_ BitVec 32)) Bool)

(assert (=> b!1408925 (= res!946704 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47461 0))(
  ( (Unit!47462) )
))
(declare-fun lt!620372 () Unit!47461)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96283 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47461)

(assert (=> b!1408925 (= lt!620372 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96283 (_ BitVec 32)) SeekEntryResult!10822)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1408925 (= lt!620370 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46485 a!2901) j!112) mask!2840) (select (arr!46485 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1408926 () Bool)

(declare-fun res!946699 () Bool)

(assert (=> b!1408926 (=> (not res!946699) (not e!797339))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1408926 (= res!946699 (validKeyInArray!0 (select (arr!46485 a!2901) j!112)))))

(declare-fun b!1408927 () Bool)

(assert (=> b!1408927 (= e!797342 true)))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun lt!620371 () SeekEntryResult!10822)

(assert (=> b!1408927 (= lt!620371 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46485 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46485 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96284 (store (arr!46485 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47037 a!2901)) mask!2840))))

(declare-fun res!946705 () Bool)

(assert (=> start!121176 (=> (not res!946705) (not e!797339))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121176 (= res!946705 (validMask!0 mask!2840))))

(assert (=> start!121176 e!797339))

(assert (=> start!121176 true))

(declare-fun array_inv!35718 (array!96283) Bool)

(assert (=> start!121176 (array_inv!35718 a!2901)))

(declare-fun b!1408928 () Bool)

(declare-fun res!946702 () Bool)

(assert (=> b!1408928 (=> (not res!946702) (not e!797339))))

(assert (=> b!1408928 (= res!946702 (and (= (size!47037 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47037 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47037 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1408929 () Bool)

(declare-fun res!946698 () Bool)

(assert (=> b!1408929 (=> (not res!946698) (not e!797339))))

(declare-datatypes ((List!33082 0))(
  ( (Nil!33079) (Cons!33078 (h!34341 (_ BitVec 64)) (t!47768 List!33082)) )
))
(declare-fun arrayNoDuplicates!0 (array!96283 (_ BitVec 32) List!33082) Bool)

(assert (=> b!1408929 (= res!946698 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33079))))

(declare-fun b!1408930 () Bool)

(declare-fun res!946701 () Bool)

(assert (=> b!1408930 (=> (not res!946701) (not e!797339))))

(assert (=> b!1408930 (= res!946701 (validKeyInArray!0 (select (arr!46485 a!2901) i!1037)))))

(declare-fun b!1408931 () Bool)

(declare-fun res!946700 () Bool)

(assert (=> b!1408931 (=> (not res!946700) (not e!797339))))

(assert (=> b!1408931 (= res!946700 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1408932 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96283 (_ BitVec 32)) SeekEntryResult!10822)

(assert (=> b!1408932 (= e!797341 (= (seekEntryOrOpen!0 (select (arr!46485 a!2901) j!112) a!2901 mask!2840) (Found!10822 j!112)))))

(assert (= (and start!121176 res!946705) b!1408928))

(assert (= (and b!1408928 res!946702) b!1408930))

(assert (= (and b!1408930 res!946701) b!1408926))

(assert (= (and b!1408926 res!946699) b!1408931))

(assert (= (and b!1408931 res!946700) b!1408929))

(assert (= (and b!1408929 res!946698) b!1408925))

(assert (= (and b!1408925 res!946704) b!1408932))

(assert (= (and b!1408925 (not res!946703)) b!1408927))

(declare-fun m!1298007 () Bool)

(assert (=> b!1408931 m!1298007))

(declare-fun m!1298009 () Bool)

(assert (=> b!1408930 m!1298009))

(assert (=> b!1408930 m!1298009))

(declare-fun m!1298011 () Bool)

(assert (=> b!1408930 m!1298011))

(declare-fun m!1298013 () Bool)

(assert (=> b!1408925 m!1298013))

(declare-fun m!1298015 () Bool)

(assert (=> b!1408925 m!1298015))

(assert (=> b!1408925 m!1298013))

(declare-fun m!1298017 () Bool)

(assert (=> b!1408925 m!1298017))

(assert (=> b!1408925 m!1298015))

(assert (=> b!1408925 m!1298013))

(declare-fun m!1298019 () Bool)

(assert (=> b!1408925 m!1298019))

(declare-fun m!1298021 () Bool)

(assert (=> b!1408925 m!1298021))

(declare-fun m!1298023 () Bool)

(assert (=> b!1408927 m!1298023))

(declare-fun m!1298025 () Bool)

(assert (=> b!1408927 m!1298025))

(assert (=> b!1408927 m!1298025))

(declare-fun m!1298027 () Bool)

(assert (=> b!1408927 m!1298027))

(assert (=> b!1408927 m!1298027))

(assert (=> b!1408927 m!1298025))

(declare-fun m!1298029 () Bool)

(assert (=> b!1408927 m!1298029))

(declare-fun m!1298031 () Bool)

(assert (=> start!121176 m!1298031))

(declare-fun m!1298033 () Bool)

(assert (=> start!121176 m!1298033))

(declare-fun m!1298035 () Bool)

(assert (=> b!1408929 m!1298035))

(assert (=> b!1408926 m!1298013))

(assert (=> b!1408926 m!1298013))

(declare-fun m!1298037 () Bool)

(assert (=> b!1408926 m!1298037))

(assert (=> b!1408932 m!1298013))

(assert (=> b!1408932 m!1298013))

(declare-fun m!1298039 () Bool)

(assert (=> b!1408932 m!1298039))

(push 1)

(assert (not b!1408925))

(assert (not b!1408926))

(assert (not b!1408930))

(assert (not b!1408932))

(assert (not b!1408931))

(assert (not b!1408927))

(assert (not start!121176))

(assert (not b!1408929))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

