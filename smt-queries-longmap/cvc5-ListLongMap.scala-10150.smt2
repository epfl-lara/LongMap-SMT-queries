; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119664 () Bool)

(assert start!119664)

(declare-fun b!1393907 () Bool)

(declare-fun e!789252 () Bool)

(declare-fun e!789253 () Bool)

(assert (=> b!1393907 (= e!789252 (not e!789253))))

(declare-fun res!933315 () Bool)

(assert (=> b!1393907 (=> res!933315 e!789253)))

(declare-datatypes ((SeekEntryResult!10348 0))(
  ( (MissingZero!10348 (index!43763 (_ BitVec 32))) (Found!10348 (index!43764 (_ BitVec 32))) (Intermediate!10348 (undefined!11160 Bool) (index!43765 (_ BitVec 32)) (x!125440 (_ BitVec 32))) (Undefined!10348) (MissingVacant!10348 (index!43766 (_ BitVec 32))) )
))
(declare-fun lt!612168 () SeekEntryResult!10348)

(assert (=> b!1393907 (= res!933315 (or (not (is-Intermediate!10348 lt!612168)) (undefined!11160 lt!612168)))))

(declare-fun e!789251 () Bool)

(assert (=> b!1393907 e!789251))

(declare-fun res!933320 () Bool)

(assert (=> b!1393907 (=> (not res!933320) (not e!789251))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95346 0))(
  ( (array!95347 (arr!46031 (Array (_ BitVec 32) (_ BitVec 64))) (size!46581 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95346)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95346 (_ BitVec 32)) Bool)

(assert (=> b!1393907 (= res!933320 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46700 0))(
  ( (Unit!46701) )
))
(declare-fun lt!612167 () Unit!46700)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95346 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46700)

(assert (=> b!1393907 (= lt!612167 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95346 (_ BitVec 32)) SeekEntryResult!10348)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1393907 (= lt!612168 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46031 a!2901) j!112) mask!2840) (select (arr!46031 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1393908 () Bool)

(declare-fun res!933318 () Bool)

(assert (=> b!1393908 (=> (not res!933318) (not e!789252))))

(assert (=> b!1393908 (= res!933318 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1393909 () Bool)

(declare-fun res!933322 () Bool)

(assert (=> b!1393909 (=> (not res!933322) (not e!789252))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1393909 (= res!933322 (and (= (size!46581 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46581 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46581 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!933316 () Bool)

(assert (=> start!119664 (=> (not res!933316) (not e!789252))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119664 (= res!933316 (validMask!0 mask!2840))))

(assert (=> start!119664 e!789252))

(assert (=> start!119664 true))

(declare-fun array_inv!35059 (array!95346) Bool)

(assert (=> start!119664 (array_inv!35059 a!2901)))

(declare-fun b!1393910 () Bool)

(declare-fun res!933319 () Bool)

(assert (=> b!1393910 (=> (not res!933319) (not e!789252))))

(declare-datatypes ((List!32550 0))(
  ( (Nil!32547) (Cons!32546 (h!33779 (_ BitVec 64)) (t!47244 List!32550)) )
))
(declare-fun arrayNoDuplicates!0 (array!95346 (_ BitVec 32) List!32550) Bool)

(assert (=> b!1393910 (= res!933319 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32547))))

(declare-fun b!1393911 () Bool)

(assert (=> b!1393911 (= e!789253 true)))

(declare-fun lt!612166 () SeekEntryResult!10348)

(assert (=> b!1393911 (= lt!612166 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46031 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46031 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95347 (store (arr!46031 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46581 a!2901)) mask!2840))))

(declare-fun b!1393912 () Bool)

(declare-fun res!933317 () Bool)

(assert (=> b!1393912 (=> (not res!933317) (not e!789252))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1393912 (= res!933317 (validKeyInArray!0 (select (arr!46031 a!2901) j!112)))))

(declare-fun b!1393913 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95346 (_ BitVec 32)) SeekEntryResult!10348)

(assert (=> b!1393913 (= e!789251 (= (seekEntryOrOpen!0 (select (arr!46031 a!2901) j!112) a!2901 mask!2840) (Found!10348 j!112)))))

(declare-fun b!1393914 () Bool)

(declare-fun res!933321 () Bool)

(assert (=> b!1393914 (=> (not res!933321) (not e!789252))))

(assert (=> b!1393914 (= res!933321 (validKeyInArray!0 (select (arr!46031 a!2901) i!1037)))))

(assert (= (and start!119664 res!933316) b!1393909))

(assert (= (and b!1393909 res!933322) b!1393914))

(assert (= (and b!1393914 res!933321) b!1393912))

(assert (= (and b!1393912 res!933317) b!1393908))

(assert (= (and b!1393908 res!933318) b!1393910))

(assert (= (and b!1393910 res!933319) b!1393907))

(assert (= (and b!1393907 res!933320) b!1393913))

(assert (= (and b!1393907 (not res!933315)) b!1393911))

(declare-fun m!1280013 () Bool)

(assert (=> b!1393908 m!1280013))

(declare-fun m!1280015 () Bool)

(assert (=> b!1393912 m!1280015))

(assert (=> b!1393912 m!1280015))

(declare-fun m!1280017 () Bool)

(assert (=> b!1393912 m!1280017))

(declare-fun m!1280019 () Bool)

(assert (=> b!1393911 m!1280019))

(declare-fun m!1280021 () Bool)

(assert (=> b!1393911 m!1280021))

(assert (=> b!1393911 m!1280021))

(declare-fun m!1280023 () Bool)

(assert (=> b!1393911 m!1280023))

(assert (=> b!1393911 m!1280023))

(assert (=> b!1393911 m!1280021))

(declare-fun m!1280025 () Bool)

(assert (=> b!1393911 m!1280025))

(declare-fun m!1280027 () Bool)

(assert (=> b!1393914 m!1280027))

(assert (=> b!1393914 m!1280027))

(declare-fun m!1280029 () Bool)

(assert (=> b!1393914 m!1280029))

(assert (=> b!1393907 m!1280015))

(declare-fun m!1280031 () Bool)

(assert (=> b!1393907 m!1280031))

(assert (=> b!1393907 m!1280015))

(declare-fun m!1280033 () Bool)

(assert (=> b!1393907 m!1280033))

(assert (=> b!1393907 m!1280031))

(assert (=> b!1393907 m!1280015))

(declare-fun m!1280035 () Bool)

(assert (=> b!1393907 m!1280035))

(declare-fun m!1280037 () Bool)

(assert (=> b!1393907 m!1280037))

(declare-fun m!1280039 () Bool)

(assert (=> start!119664 m!1280039))

(declare-fun m!1280041 () Bool)

(assert (=> start!119664 m!1280041))

(assert (=> b!1393913 m!1280015))

(assert (=> b!1393913 m!1280015))

(declare-fun m!1280043 () Bool)

(assert (=> b!1393913 m!1280043))

(declare-fun m!1280045 () Bool)

(assert (=> b!1393910 m!1280045))

(push 1)

(assert (not b!1393910))

(assert (not b!1393914))

(assert (not b!1393907))

(assert (not b!1393911))

(assert (not b!1393913))

(assert (not b!1393912))

(assert (not start!119664))

(assert (not b!1393908))

(check-sat)

