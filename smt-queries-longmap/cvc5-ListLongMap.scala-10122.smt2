; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119280 () Bool)

(assert start!119280)

(declare-fun b!1390938 () Bool)

(declare-fun res!931009 () Bool)

(declare-fun e!787675 () Bool)

(assert (=> b!1390938 (=> (not res!931009) (not e!787675))))

(declare-datatypes ((array!95119 0))(
  ( (array!95120 (arr!45924 (Array (_ BitVec 32) (_ BitVec 64))) (size!46476 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95119)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1390938 (= res!931009 (validKeyInArray!0 (select (arr!45924 a!2901) i!1037)))))

(declare-fun b!1390939 () Bool)

(assert (=> b!1390939 (= e!787675 (not true))))

(declare-fun e!787676 () Bool)

(assert (=> b!1390939 e!787676))

(declare-fun res!931003 () Bool)

(assert (=> b!1390939 (=> (not res!931003) (not e!787676))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95119 (_ BitVec 32)) Bool)

(assert (=> b!1390939 (= res!931003 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46381 0))(
  ( (Unit!46382) )
))
(declare-fun lt!610843 () Unit!46381)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95119 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46381)

(assert (=> b!1390939 (= lt!610843 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-datatypes ((SeekEntryResult!10267 0))(
  ( (MissingZero!10267 (index!43439 (_ BitVec 32))) (Found!10267 (index!43440 (_ BitVec 32))) (Intermediate!10267 (undefined!11079 Bool) (index!43441 (_ BitVec 32)) (x!125108 (_ BitVec 32))) (Undefined!10267) (MissingVacant!10267 (index!43442 (_ BitVec 32))) )
))
(declare-fun lt!610844 () SeekEntryResult!10267)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95119 (_ BitVec 32)) SeekEntryResult!10267)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1390939 (= lt!610844 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45924 a!2901) j!112) mask!2840) (select (arr!45924 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1390940 () Bool)

(declare-fun res!931007 () Bool)

(assert (=> b!1390940 (=> (not res!931007) (not e!787675))))

(assert (=> b!1390940 (= res!931007 (validKeyInArray!0 (select (arr!45924 a!2901) j!112)))))

(declare-fun b!1390941 () Bool)

(declare-fun res!931008 () Bool)

(assert (=> b!1390941 (=> (not res!931008) (not e!787675))))

(assert (=> b!1390941 (= res!931008 (and (= (size!46476 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46476 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46476 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!931006 () Bool)

(assert (=> start!119280 (=> (not res!931006) (not e!787675))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119280 (= res!931006 (validMask!0 mask!2840))))

(assert (=> start!119280 e!787675))

(assert (=> start!119280 true))

(declare-fun array_inv!35157 (array!95119) Bool)

(assert (=> start!119280 (array_inv!35157 a!2901)))

(declare-fun b!1390942 () Bool)

(declare-fun res!931005 () Bool)

(assert (=> b!1390942 (=> (not res!931005) (not e!787675))))

(declare-datatypes ((List!32521 0))(
  ( (Nil!32518) (Cons!32517 (h!33738 (_ BitVec 64)) (t!47207 List!32521)) )
))
(declare-fun arrayNoDuplicates!0 (array!95119 (_ BitVec 32) List!32521) Bool)

(assert (=> b!1390942 (= res!931005 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32518))))

(declare-fun b!1390943 () Bool)

(declare-fun res!931004 () Bool)

(assert (=> b!1390943 (=> (not res!931004) (not e!787675))))

(assert (=> b!1390943 (= res!931004 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1390944 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95119 (_ BitVec 32)) SeekEntryResult!10267)

(assert (=> b!1390944 (= e!787676 (= (seekEntryOrOpen!0 (select (arr!45924 a!2901) j!112) a!2901 mask!2840) (Found!10267 j!112)))))

(assert (= (and start!119280 res!931006) b!1390941))

(assert (= (and b!1390941 res!931008) b!1390938))

(assert (= (and b!1390938 res!931009) b!1390940))

(assert (= (and b!1390940 res!931007) b!1390943))

(assert (= (and b!1390943 res!931004) b!1390942))

(assert (= (and b!1390942 res!931005) b!1390939))

(assert (= (and b!1390939 res!931003) b!1390944))

(declare-fun m!1276313 () Bool)

(assert (=> b!1390940 m!1276313))

(assert (=> b!1390940 m!1276313))

(declare-fun m!1276315 () Bool)

(assert (=> b!1390940 m!1276315))

(declare-fun m!1276317 () Bool)

(assert (=> b!1390943 m!1276317))

(declare-fun m!1276319 () Bool)

(assert (=> b!1390942 m!1276319))

(declare-fun m!1276321 () Bool)

(assert (=> b!1390938 m!1276321))

(assert (=> b!1390938 m!1276321))

(declare-fun m!1276323 () Bool)

(assert (=> b!1390938 m!1276323))

(declare-fun m!1276325 () Bool)

(assert (=> start!119280 m!1276325))

(declare-fun m!1276327 () Bool)

(assert (=> start!119280 m!1276327))

(assert (=> b!1390944 m!1276313))

(assert (=> b!1390944 m!1276313))

(declare-fun m!1276329 () Bool)

(assert (=> b!1390944 m!1276329))

(assert (=> b!1390939 m!1276313))

(declare-fun m!1276331 () Bool)

(assert (=> b!1390939 m!1276331))

(assert (=> b!1390939 m!1276313))

(declare-fun m!1276333 () Bool)

(assert (=> b!1390939 m!1276333))

(assert (=> b!1390939 m!1276331))

(assert (=> b!1390939 m!1276313))

(declare-fun m!1276335 () Bool)

(assert (=> b!1390939 m!1276335))

(declare-fun m!1276337 () Bool)

(assert (=> b!1390939 m!1276337))

(push 1)

(assert (not start!119280))

(assert (not b!1390943))

(assert (not b!1390940))

(assert (not b!1390938))

(assert (not b!1390942))

(assert (not b!1390944))

(assert (not b!1390939))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

