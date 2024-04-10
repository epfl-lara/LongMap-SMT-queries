; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119134 () Bool)

(assert start!119134)

(declare-fun b!1389811 () Bool)

(declare-fun res!929973 () Bool)

(declare-fun e!787166 () Bool)

(assert (=> b!1389811 (=> (not res!929973) (not e!787166))))

(declare-datatypes ((array!95071 0))(
  ( (array!95072 (arr!45901 (Array (_ BitVec 32) (_ BitVec 64))) (size!46451 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95071)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1389811 (= res!929973 (validKeyInArray!0 (select (arr!45901 a!2901) i!1037)))))

(declare-fun res!929976 () Bool)

(assert (=> start!119134 (=> (not res!929976) (not e!787166))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119134 (= res!929976 (validMask!0 mask!2840))))

(assert (=> start!119134 e!787166))

(assert (=> start!119134 true))

(declare-fun array_inv!34929 (array!95071) Bool)

(assert (=> start!119134 (array_inv!34929 a!2901)))

(declare-fun b!1389812 () Bool)

(assert (=> b!1389812 (= e!787166 (not true))))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95071 (_ BitVec 32)) Bool)

(assert (=> b!1389812 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-datatypes ((Unit!46440 0))(
  ( (Unit!46441) )
))
(declare-fun lt!610638 () Unit!46440)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95071 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46440)

(assert (=> b!1389812 (= lt!610638 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-datatypes ((SeekEntryResult!10218 0))(
  ( (MissingZero!10218 (index!43243 (_ BitVec 32))) (Found!10218 (index!43244 (_ BitVec 32))) (Intermediate!10218 (undefined!11030 Bool) (index!43245 (_ BitVec 32)) (x!124928 (_ BitVec 32))) (Undefined!10218) (MissingVacant!10218 (index!43246 (_ BitVec 32))) )
))
(declare-fun lt!610637 () SeekEntryResult!10218)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95071 (_ BitVec 32)) SeekEntryResult!10218)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1389812 (= lt!610637 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45901 a!2901) j!112) mask!2840) (select (arr!45901 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1389813 () Bool)

(declare-fun res!929975 () Bool)

(assert (=> b!1389813 (=> (not res!929975) (not e!787166))))

(assert (=> b!1389813 (= res!929975 (and (= (size!46451 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46451 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46451 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1389814 () Bool)

(declare-fun res!929972 () Bool)

(assert (=> b!1389814 (=> (not res!929972) (not e!787166))))

(assert (=> b!1389814 (= res!929972 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1389815 () Bool)

(declare-fun res!929977 () Bool)

(assert (=> b!1389815 (=> (not res!929977) (not e!787166))))

(assert (=> b!1389815 (= res!929977 (validKeyInArray!0 (select (arr!45901 a!2901) j!112)))))

(declare-fun b!1389816 () Bool)

(declare-fun res!929974 () Bool)

(assert (=> b!1389816 (=> (not res!929974) (not e!787166))))

(declare-datatypes ((List!32420 0))(
  ( (Nil!32417) (Cons!32416 (h!33634 (_ BitVec 64)) (t!47114 List!32420)) )
))
(declare-fun arrayNoDuplicates!0 (array!95071 (_ BitVec 32) List!32420) Bool)

(assert (=> b!1389816 (= res!929974 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32417))))

(assert (= (and start!119134 res!929976) b!1389813))

(assert (= (and b!1389813 res!929975) b!1389811))

(assert (= (and b!1389811 res!929973) b!1389815))

(assert (= (and b!1389815 res!929977) b!1389814))

(assert (= (and b!1389814 res!929972) b!1389816))

(assert (= (and b!1389816 res!929974) b!1389812))

(declare-fun m!1275495 () Bool)

(assert (=> start!119134 m!1275495))

(declare-fun m!1275497 () Bool)

(assert (=> start!119134 m!1275497))

(declare-fun m!1275499 () Bool)

(assert (=> b!1389815 m!1275499))

(assert (=> b!1389815 m!1275499))

(declare-fun m!1275501 () Bool)

(assert (=> b!1389815 m!1275501))

(declare-fun m!1275503 () Bool)

(assert (=> b!1389811 m!1275503))

(assert (=> b!1389811 m!1275503))

(declare-fun m!1275505 () Bool)

(assert (=> b!1389811 m!1275505))

(assert (=> b!1389812 m!1275499))

(declare-fun m!1275507 () Bool)

(assert (=> b!1389812 m!1275507))

(assert (=> b!1389812 m!1275499))

(declare-fun m!1275509 () Bool)

(assert (=> b!1389812 m!1275509))

(assert (=> b!1389812 m!1275507))

(assert (=> b!1389812 m!1275499))

(declare-fun m!1275511 () Bool)

(assert (=> b!1389812 m!1275511))

(declare-fun m!1275513 () Bool)

(assert (=> b!1389812 m!1275513))

(declare-fun m!1275515 () Bool)

(assert (=> b!1389816 m!1275515))

(declare-fun m!1275517 () Bool)

(assert (=> b!1389814 m!1275517))

(push 1)

(assert (not b!1389814))

(assert (not b!1389811))

(assert (not b!1389812))

(assert (not start!119134))

(assert (not b!1389815))

(assert (not b!1389816))

(check-sat)

