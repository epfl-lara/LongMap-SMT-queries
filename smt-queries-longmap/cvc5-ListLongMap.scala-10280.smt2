; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120840 () Bool)

(assert start!120840)

(declare-fun b!1406024 () Bool)

(declare-fun e!795835 () Bool)

(declare-fun e!795833 () Bool)

(assert (=> b!1406024 (= e!795835 (not e!795833))))

(declare-fun res!944245 () Bool)

(assert (=> b!1406024 (=> res!944245 e!795833)))

(declare-datatypes ((SeekEntryResult!10732 0))(
  ( (MissingZero!10732 (index!45305 (_ BitVec 32))) (Found!10732 (index!45306 (_ BitVec 32))) (Intermediate!10732 (undefined!11544 Bool) (index!45307 (_ BitVec 32)) (x!126915 (_ BitVec 32))) (Undefined!10732) (MissingVacant!10732 (index!45308 (_ BitVec 32))) )
))
(declare-fun lt!619230 () SeekEntryResult!10732)

(assert (=> b!1406024 (= res!944245 (or (not (is-Intermediate!10732 lt!619230)) (undefined!11544 lt!619230)))))

(declare-fun e!795834 () Bool)

(assert (=> b!1406024 e!795834))

(declare-fun res!944246 () Bool)

(assert (=> b!1406024 (=> (not res!944246) (not e!795834))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96147 0))(
  ( (array!96148 (arr!46421 (Array (_ BitVec 32) (_ BitVec 64))) (size!46971 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96147)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96147 (_ BitVec 32)) Bool)

(assert (=> b!1406024 (= res!944246 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47438 0))(
  ( (Unit!47439) )
))
(declare-fun lt!619229 () Unit!47438)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96147 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47438)

(assert (=> b!1406024 (= lt!619229 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96147 (_ BitVec 32)) SeekEntryResult!10732)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1406024 (= lt!619230 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46421 a!2901) j!112) mask!2840) (select (arr!46421 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1406025 () Bool)

(declare-fun res!944243 () Bool)

(assert (=> b!1406025 (=> (not res!944243) (not e!795835))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1406025 (= res!944243 (validKeyInArray!0 (select (arr!46421 a!2901) i!1037)))))

(declare-fun b!1406026 () Bool)

(declare-fun res!944244 () Bool)

(assert (=> b!1406026 (=> (not res!944244) (not e!795835))))

(declare-datatypes ((List!32940 0))(
  ( (Nil!32937) (Cons!32936 (h!34190 (_ BitVec 64)) (t!47634 List!32940)) )
))
(declare-fun arrayNoDuplicates!0 (array!96147 (_ BitVec 32) List!32940) Bool)

(assert (=> b!1406026 (= res!944244 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32937))))

(declare-fun b!1406027 () Bool)

(declare-fun res!944248 () Bool)

(assert (=> b!1406027 (=> (not res!944248) (not e!795835))))

(assert (=> b!1406027 (= res!944248 (and (= (size!46971 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46971 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46971 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1406028 () Bool)

(assert (=> b!1406028 (= e!795833 true)))

(declare-fun lt!619228 () SeekEntryResult!10732)

(assert (=> b!1406028 (= lt!619228 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46421 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46421 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96148 (store (arr!46421 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46971 a!2901)) mask!2840))))

(declare-fun b!1406029 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96147 (_ BitVec 32)) SeekEntryResult!10732)

(assert (=> b!1406029 (= e!795834 (= (seekEntryOrOpen!0 (select (arr!46421 a!2901) j!112) a!2901 mask!2840) (Found!10732 j!112)))))

(declare-fun res!944242 () Bool)

(assert (=> start!120840 (=> (not res!944242) (not e!795835))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120840 (= res!944242 (validMask!0 mask!2840))))

(assert (=> start!120840 e!795835))

(assert (=> start!120840 true))

(declare-fun array_inv!35449 (array!96147) Bool)

(assert (=> start!120840 (array_inv!35449 a!2901)))

(declare-fun b!1406030 () Bool)

(declare-fun res!944241 () Bool)

(assert (=> b!1406030 (=> (not res!944241) (not e!795835))))

(assert (=> b!1406030 (= res!944241 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1406031 () Bool)

(declare-fun res!944247 () Bool)

(assert (=> b!1406031 (=> (not res!944247) (not e!795835))))

(assert (=> b!1406031 (= res!944247 (validKeyInArray!0 (select (arr!46421 a!2901) j!112)))))

(assert (= (and start!120840 res!944242) b!1406027))

(assert (= (and b!1406027 res!944248) b!1406025))

(assert (= (and b!1406025 res!944243) b!1406031))

(assert (= (and b!1406031 res!944247) b!1406030))

(assert (= (and b!1406030 res!944241) b!1406026))

(assert (= (and b!1406026 res!944244) b!1406024))

(assert (= (and b!1406024 res!944246) b!1406029))

(assert (= (and b!1406024 (not res!944245)) b!1406028))

(declare-fun m!1294995 () Bool)

(assert (=> b!1406028 m!1294995))

(declare-fun m!1294997 () Bool)

(assert (=> b!1406028 m!1294997))

(assert (=> b!1406028 m!1294997))

(declare-fun m!1294999 () Bool)

(assert (=> b!1406028 m!1294999))

(assert (=> b!1406028 m!1294999))

(assert (=> b!1406028 m!1294997))

(declare-fun m!1295001 () Bool)

(assert (=> b!1406028 m!1295001))

(declare-fun m!1295003 () Bool)

(assert (=> b!1406029 m!1295003))

(assert (=> b!1406029 m!1295003))

(declare-fun m!1295005 () Bool)

(assert (=> b!1406029 m!1295005))

(declare-fun m!1295007 () Bool)

(assert (=> b!1406025 m!1295007))

(assert (=> b!1406025 m!1295007))

(declare-fun m!1295009 () Bool)

(assert (=> b!1406025 m!1295009))

(assert (=> b!1406031 m!1295003))

(assert (=> b!1406031 m!1295003))

(declare-fun m!1295011 () Bool)

(assert (=> b!1406031 m!1295011))

(assert (=> b!1406024 m!1295003))

(declare-fun m!1295013 () Bool)

(assert (=> b!1406024 m!1295013))

(assert (=> b!1406024 m!1295003))

(declare-fun m!1295015 () Bool)

(assert (=> b!1406024 m!1295015))

(assert (=> b!1406024 m!1295013))

(assert (=> b!1406024 m!1295003))

(declare-fun m!1295017 () Bool)

(assert (=> b!1406024 m!1295017))

(declare-fun m!1295019 () Bool)

(assert (=> b!1406024 m!1295019))

(declare-fun m!1295021 () Bool)

(assert (=> start!120840 m!1295021))

(declare-fun m!1295023 () Bool)

(assert (=> start!120840 m!1295023))

(declare-fun m!1295025 () Bool)

(assert (=> b!1406030 m!1295025))

(declare-fun m!1295027 () Bool)

(assert (=> b!1406026 m!1295027))

(push 1)

(assert (not b!1406030))

(assert (not b!1406024))

(assert (not b!1406025))

(assert (not b!1406026))

(assert (not b!1406029))

(assert (not b!1406031))

(assert (not start!120840))

(assert (not b!1406028))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

