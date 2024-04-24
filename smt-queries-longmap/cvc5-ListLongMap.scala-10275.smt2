; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121002 () Bool)

(assert start!121002)

(declare-fun b!1406852 () Bool)

(declare-fun e!796418 () Bool)

(declare-fun e!796417 () Bool)

(assert (=> b!1406852 (= e!796418 (not e!796417))))

(declare-fun res!944388 () Bool)

(assert (=> b!1406852 (=> res!944388 e!796417)))

(declare-datatypes ((SeekEntryResult!10675 0))(
  ( (MissingZero!10675 (index!45077 (_ BitVec 32))) (Found!10675 (index!45078 (_ BitVec 32))) (Intermediate!10675 (undefined!11487 Bool) (index!45079 (_ BitVec 32)) (x!126837 (_ BitVec 32))) (Undefined!10675) (MissingVacant!10675 (index!45080 (_ BitVec 32))) )
))
(declare-fun lt!619511 () SeekEntryResult!10675)

(assert (=> b!1406852 (= res!944388 (or (not (is-Intermediate!10675 lt!619511)) (undefined!11487 lt!619511)))))

(declare-fun e!796416 () Bool)

(assert (=> b!1406852 e!796416))

(declare-fun res!944387 () Bool)

(assert (=> b!1406852 (=> (not res!944387) (not e!796416))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96231 0))(
  ( (array!96232 (arr!46461 (Array (_ BitVec 32) (_ BitVec 64))) (size!47012 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96231)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96231 (_ BitVec 32)) Bool)

(assert (=> b!1406852 (= res!944387 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47351 0))(
  ( (Unit!47352) )
))
(declare-fun lt!619510 () Unit!47351)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96231 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47351)

(assert (=> b!1406852 (= lt!619510 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96231 (_ BitVec 32)) SeekEntryResult!10675)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1406852 (= lt!619511 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46461 a!2901) j!112) mask!2840) (select (arr!46461 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1406853 () Bool)

(assert (=> b!1406853 (= e!796417 true)))

(declare-fun lt!619509 () (_ BitVec 32))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1406853 (= lt!619509 (toIndex!0 (select (store (arr!46461 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840))))

(declare-fun b!1406854 () Bool)

(declare-fun res!944390 () Bool)

(assert (=> b!1406854 (=> (not res!944390) (not e!796418))))

(assert (=> b!1406854 (= res!944390 (and (= (size!47012 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47012 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47012 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1406855 () Bool)

(declare-fun res!944386 () Bool)

(assert (=> b!1406855 (=> (not res!944386) (not e!796418))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1406855 (= res!944386 (validKeyInArray!0 (select (arr!46461 a!2901) i!1037)))))

(declare-fun res!944391 () Bool)

(assert (=> start!121002 (=> (not res!944391) (not e!796418))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121002 (= res!944391 (validMask!0 mask!2840))))

(assert (=> start!121002 e!796418))

(assert (=> start!121002 true))

(declare-fun array_inv!35742 (array!96231) Bool)

(assert (=> start!121002 (array_inv!35742 a!2901)))

(declare-fun b!1406856 () Bool)

(declare-fun res!944385 () Bool)

(assert (=> b!1406856 (=> (not res!944385) (not e!796418))))

(assert (=> b!1406856 (= res!944385 (validKeyInArray!0 (select (arr!46461 a!2901) j!112)))))

(declare-fun b!1406857 () Bool)

(declare-fun res!944392 () Bool)

(assert (=> b!1406857 (=> (not res!944392) (not e!796418))))

(declare-datatypes ((List!32967 0))(
  ( (Nil!32964) (Cons!32963 (h!34225 (_ BitVec 64)) (t!47653 List!32967)) )
))
(declare-fun arrayNoDuplicates!0 (array!96231 (_ BitVec 32) List!32967) Bool)

(assert (=> b!1406857 (= res!944392 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32964))))

(declare-fun b!1406858 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96231 (_ BitVec 32)) SeekEntryResult!10675)

(assert (=> b!1406858 (= e!796416 (= (seekEntryOrOpen!0 (select (arr!46461 a!2901) j!112) a!2901 mask!2840) (Found!10675 j!112)))))

(declare-fun b!1406859 () Bool)

(declare-fun res!944389 () Bool)

(assert (=> b!1406859 (=> (not res!944389) (not e!796418))))

(assert (=> b!1406859 (= res!944389 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(assert (= (and start!121002 res!944391) b!1406854))

(assert (= (and b!1406854 res!944390) b!1406855))

(assert (= (and b!1406855 res!944386) b!1406856))

(assert (= (and b!1406856 res!944385) b!1406859))

(assert (= (and b!1406859 res!944389) b!1406857))

(assert (= (and b!1406857 res!944392) b!1406852))

(assert (= (and b!1406852 res!944387) b!1406858))

(assert (= (and b!1406852 (not res!944388)) b!1406853))

(declare-fun m!1295933 () Bool)

(assert (=> b!1406852 m!1295933))

(declare-fun m!1295935 () Bool)

(assert (=> b!1406852 m!1295935))

(assert (=> b!1406852 m!1295933))

(declare-fun m!1295937 () Bool)

(assert (=> b!1406852 m!1295937))

(assert (=> b!1406852 m!1295935))

(assert (=> b!1406852 m!1295933))

(declare-fun m!1295939 () Bool)

(assert (=> b!1406852 m!1295939))

(declare-fun m!1295941 () Bool)

(assert (=> b!1406852 m!1295941))

(declare-fun m!1295943 () Bool)

(assert (=> start!121002 m!1295943))

(declare-fun m!1295945 () Bool)

(assert (=> start!121002 m!1295945))

(declare-fun m!1295947 () Bool)

(assert (=> b!1406853 m!1295947))

(declare-fun m!1295949 () Bool)

(assert (=> b!1406853 m!1295949))

(assert (=> b!1406853 m!1295949))

(declare-fun m!1295951 () Bool)

(assert (=> b!1406853 m!1295951))

(assert (=> b!1406858 m!1295933))

(assert (=> b!1406858 m!1295933))

(declare-fun m!1295953 () Bool)

(assert (=> b!1406858 m!1295953))

(declare-fun m!1295955 () Bool)

(assert (=> b!1406857 m!1295955))

(declare-fun m!1295957 () Bool)

(assert (=> b!1406859 m!1295957))

(declare-fun m!1295959 () Bool)

(assert (=> b!1406855 m!1295959))

(assert (=> b!1406855 m!1295959))

(declare-fun m!1295961 () Bool)

(assert (=> b!1406855 m!1295961))

(assert (=> b!1406856 m!1295933))

(assert (=> b!1406856 m!1295933))

(declare-fun m!1295963 () Bool)

(assert (=> b!1406856 m!1295963))

(push 1)

(assert (not start!121002))

(assert (not b!1406858))

(assert (not b!1406853))

(assert (not b!1406856))

(assert (not b!1406855))

(assert (not b!1406859))

(assert (not b!1406857))

(assert (not b!1406852))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

