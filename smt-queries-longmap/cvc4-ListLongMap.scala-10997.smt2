; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128818 () Bool)

(assert start!128818)

(declare-fun b!1509488 () Bool)

(declare-fun res!1029395 () Bool)

(declare-fun e!843115 () Bool)

(assert (=> b!1509488 (=> (not res!1029395) (not e!843115))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!100674 0))(
  ( (array!100675 (arr!48574 (Array (_ BitVec 32) (_ BitVec 64))) (size!49124 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100674)

(declare-datatypes ((SeekEntryResult!12745 0))(
  ( (MissingZero!12745 (index!53375 (_ BitVec 32))) (Found!12745 (index!53376 (_ BitVec 32))) (Intermediate!12745 (undefined!13557 Bool) (index!53377 (_ BitVec 32)) (x!135127 (_ BitVec 32))) (Undefined!12745) (MissingVacant!12745 (index!53378 (_ BitVec 32))) )
))
(declare-fun lt!654908 () SeekEntryResult!12745)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100674 (_ BitVec 32)) SeekEntryResult!12745)

(assert (=> b!1509488 (= res!1029395 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48574 a!2804) j!70) a!2804 mask!2512) lt!654908))))

(declare-fun b!1509489 () Bool)

(declare-fun res!1029398 () Bool)

(declare-fun e!843114 () Bool)

(assert (=> b!1509489 (=> (not res!1029398) (not e!843114))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1509489 (= res!1029398 (and (= (size!49124 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49124 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49124 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1509490 () Bool)

(declare-fun res!1029392 () Bool)

(assert (=> b!1509490 (=> (not res!1029392) (not e!843114))))

(declare-datatypes ((List!35057 0))(
  ( (Nil!35054) (Cons!35053 (h!36465 (_ BitVec 64)) (t!49751 List!35057)) )
))
(declare-fun arrayNoDuplicates!0 (array!100674 (_ BitVec 32) List!35057) Bool)

(assert (=> b!1509490 (= res!1029392 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35054))))

(declare-fun b!1509491 () Bool)

(declare-fun res!1029393 () Bool)

(assert (=> b!1509491 (=> (not res!1029393) (not e!843114))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1509491 (= res!1029393 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49124 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49124 a!2804))))))

(declare-fun b!1509492 () Bool)

(assert (=> b!1509492 (= e!843114 e!843115)))

(declare-fun res!1029391 () Bool)

(assert (=> b!1509492 (=> (not res!1029391) (not e!843115))))

(declare-fun lt!654910 () SeekEntryResult!12745)

(assert (=> b!1509492 (= res!1029391 (= lt!654910 lt!654908))))

(assert (=> b!1509492 (= lt!654908 (Intermediate!12745 false resIndex!21 resX!21))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1509492 (= lt!654910 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48574 a!2804) j!70) mask!2512) (select (arr!48574 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1509493 () Bool)

(declare-fun res!1029399 () Bool)

(assert (=> b!1509493 (=> (not res!1029399) (not e!843114))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1509493 (= res!1029399 (validKeyInArray!0 (select (arr!48574 a!2804) i!961)))))

(declare-fun b!1509494 () Bool)

(assert (=> b!1509494 (= e!843115 (not true))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100674 (_ BitVec 32)) Bool)

(assert (=> b!1509494 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512)))

(declare-datatypes ((Unit!50358 0))(
  ( (Unit!50359) )
))
(declare-fun lt!654909 () Unit!50358)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100674 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50358)

(assert (=> b!1509494 (= lt!654909 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1509495 () Bool)

(declare-fun res!1029394 () Bool)

(assert (=> b!1509495 (=> (not res!1029394) (not e!843114))))

(assert (=> b!1509495 (= res!1029394 (validKeyInArray!0 (select (arr!48574 a!2804) j!70)))))

(declare-fun b!1509497 () Bool)

(declare-fun res!1029396 () Bool)

(assert (=> b!1509497 (=> (not res!1029396) (not e!843114))))

(assert (=> b!1509497 (= res!1029396 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun res!1029400 () Bool)

(assert (=> start!128818 (=> (not res!1029400) (not e!843114))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128818 (= res!1029400 (validMask!0 mask!2512))))

(assert (=> start!128818 e!843114))

(assert (=> start!128818 true))

(declare-fun array_inv!37602 (array!100674) Bool)

(assert (=> start!128818 (array_inv!37602 a!2804)))

(declare-fun b!1509496 () Bool)

(declare-fun res!1029397 () Bool)

(assert (=> b!1509496 (=> (not res!1029397) (not e!843115))))

(assert (=> b!1509496 (= res!1029397 (= lt!654910 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48574 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48574 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100675 (store (arr!48574 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49124 a!2804)) mask!2512)))))

(assert (= (and start!128818 res!1029400) b!1509489))

(assert (= (and b!1509489 res!1029398) b!1509493))

(assert (= (and b!1509493 res!1029399) b!1509495))

(assert (= (and b!1509495 res!1029394) b!1509497))

(assert (= (and b!1509497 res!1029396) b!1509490))

(assert (= (and b!1509490 res!1029392) b!1509491))

(assert (= (and b!1509491 res!1029393) b!1509492))

(assert (= (and b!1509492 res!1029391) b!1509488))

(assert (= (and b!1509488 res!1029395) b!1509496))

(assert (= (and b!1509496 res!1029397) b!1509494))

(declare-fun m!1391973 () Bool)

(assert (=> b!1509496 m!1391973))

(declare-fun m!1391975 () Bool)

(assert (=> b!1509496 m!1391975))

(assert (=> b!1509496 m!1391975))

(declare-fun m!1391977 () Bool)

(assert (=> b!1509496 m!1391977))

(assert (=> b!1509496 m!1391977))

(assert (=> b!1509496 m!1391975))

(declare-fun m!1391979 () Bool)

(assert (=> b!1509496 m!1391979))

(declare-fun m!1391981 () Bool)

(assert (=> b!1509493 m!1391981))

(assert (=> b!1509493 m!1391981))

(declare-fun m!1391983 () Bool)

(assert (=> b!1509493 m!1391983))

(declare-fun m!1391985 () Bool)

(assert (=> b!1509488 m!1391985))

(assert (=> b!1509488 m!1391985))

(declare-fun m!1391987 () Bool)

(assert (=> b!1509488 m!1391987))

(declare-fun m!1391989 () Bool)

(assert (=> b!1509494 m!1391989))

(declare-fun m!1391991 () Bool)

(assert (=> b!1509494 m!1391991))

(declare-fun m!1391993 () Bool)

(assert (=> start!128818 m!1391993))

(declare-fun m!1391995 () Bool)

(assert (=> start!128818 m!1391995))

(declare-fun m!1391997 () Bool)

(assert (=> b!1509490 m!1391997))

(assert (=> b!1509492 m!1391985))

(assert (=> b!1509492 m!1391985))

(declare-fun m!1391999 () Bool)

(assert (=> b!1509492 m!1391999))

(assert (=> b!1509492 m!1391999))

(assert (=> b!1509492 m!1391985))

(declare-fun m!1392001 () Bool)

(assert (=> b!1509492 m!1392001))

(declare-fun m!1392003 () Bool)

(assert (=> b!1509497 m!1392003))

(assert (=> b!1509495 m!1391985))

(assert (=> b!1509495 m!1391985))

(declare-fun m!1392005 () Bool)

(assert (=> b!1509495 m!1392005))

(push 1)

(assert (not b!1509495))

(assert (not b!1509497))

(assert (not b!1509492))

(assert (not b!1509493))

