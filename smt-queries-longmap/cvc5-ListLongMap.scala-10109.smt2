; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119148 () Bool)

(assert start!119148)

(declare-fun b!1389892 () Bool)

(declare-fun res!930106 () Bool)

(declare-fun e!787180 () Bool)

(assert (=> b!1389892 (=> (not res!930106) (not e!787180))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95038 0))(
  ( (array!95039 (arr!45885 (Array (_ BitVec 32) (_ BitVec 64))) (size!46437 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95038)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1389892 (= res!930106 (and (= (size!46437 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46437 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46437 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1389893 () Bool)

(declare-fun res!930105 () Bool)

(assert (=> b!1389893 (=> (not res!930105) (not e!787180))))

(declare-datatypes ((List!32482 0))(
  ( (Nil!32479) (Cons!32478 (h!33696 (_ BitVec 64)) (t!47168 List!32482)) )
))
(declare-fun arrayNoDuplicates!0 (array!95038 (_ BitVec 32) List!32482) Bool)

(assert (=> b!1389893 (= res!930105 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32479))))

(declare-fun b!1389894 () Bool)

(assert (=> b!1389894 (= e!787180 (not true))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95038 (_ BitVec 32)) Bool)

(assert (=> b!1389894 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-datatypes ((Unit!46303 0))(
  ( (Unit!46304) )
))
(declare-fun lt!610502 () Unit!46303)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95038 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46303)

(assert (=> b!1389894 (= lt!610502 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-datatypes ((SeekEntryResult!10228 0))(
  ( (MissingZero!10228 (index!43283 (_ BitVec 32))) (Found!10228 (index!43284 (_ BitVec 32))) (Intermediate!10228 (undefined!11040 Bool) (index!43285 (_ BitVec 32)) (x!124959 (_ BitVec 32))) (Undefined!10228) (MissingVacant!10228 (index!43286 (_ BitVec 32))) )
))
(declare-fun lt!610501 () SeekEntryResult!10228)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95038 (_ BitVec 32)) SeekEntryResult!10228)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1389894 (= lt!610501 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45885 a!2901) j!112) mask!2840) (select (arr!45885 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1389895 () Bool)

(declare-fun res!930104 () Bool)

(assert (=> b!1389895 (=> (not res!930104) (not e!787180))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1389895 (= res!930104 (validKeyInArray!0 (select (arr!45885 a!2901) j!112)))))

(declare-fun b!1389896 () Bool)

(declare-fun res!930107 () Bool)

(assert (=> b!1389896 (=> (not res!930107) (not e!787180))))

(assert (=> b!1389896 (= res!930107 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!930109 () Bool)

(assert (=> start!119148 (=> (not res!930109) (not e!787180))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119148 (= res!930109 (validMask!0 mask!2840))))

(assert (=> start!119148 e!787180))

(assert (=> start!119148 true))

(declare-fun array_inv!35118 (array!95038) Bool)

(assert (=> start!119148 (array_inv!35118 a!2901)))

(declare-fun b!1389897 () Bool)

(declare-fun res!930108 () Bool)

(assert (=> b!1389897 (=> (not res!930108) (not e!787180))))

(assert (=> b!1389897 (= res!930108 (validKeyInArray!0 (select (arr!45885 a!2901) i!1037)))))

(assert (= (and start!119148 res!930109) b!1389892))

(assert (= (and b!1389892 res!930106) b!1389897))

(assert (= (and b!1389897 res!930108) b!1389895))

(assert (= (and b!1389895 res!930104) b!1389896))

(assert (= (and b!1389896 res!930107) b!1389893))

(assert (= (and b!1389893 res!930105) b!1389894))

(declare-fun m!1275175 () Bool)

(assert (=> start!119148 m!1275175))

(declare-fun m!1275177 () Bool)

(assert (=> start!119148 m!1275177))

(declare-fun m!1275179 () Bool)

(assert (=> b!1389897 m!1275179))

(assert (=> b!1389897 m!1275179))

(declare-fun m!1275181 () Bool)

(assert (=> b!1389897 m!1275181))

(declare-fun m!1275183 () Bool)

(assert (=> b!1389895 m!1275183))

(assert (=> b!1389895 m!1275183))

(declare-fun m!1275185 () Bool)

(assert (=> b!1389895 m!1275185))

(assert (=> b!1389894 m!1275183))

(declare-fun m!1275187 () Bool)

(assert (=> b!1389894 m!1275187))

(assert (=> b!1389894 m!1275183))

(declare-fun m!1275189 () Bool)

(assert (=> b!1389894 m!1275189))

(assert (=> b!1389894 m!1275187))

(assert (=> b!1389894 m!1275183))

(declare-fun m!1275191 () Bool)

(assert (=> b!1389894 m!1275191))

(declare-fun m!1275193 () Bool)

(assert (=> b!1389894 m!1275193))

(declare-fun m!1275195 () Bool)

(assert (=> b!1389893 m!1275195))

(declare-fun m!1275197 () Bool)

(assert (=> b!1389896 m!1275197))

(push 1)

(assert (not b!1389896))

(assert (not b!1389894))

(assert (not start!119148))

(assert (not b!1389893))

(assert (not b!1389895))

(assert (not b!1389897))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

