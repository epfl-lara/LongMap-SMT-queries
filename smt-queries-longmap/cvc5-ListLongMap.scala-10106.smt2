; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119130 () Bool)

(assert start!119130)

(declare-fun res!929940 () Bool)

(declare-fun e!787153 () Bool)

(assert (=> start!119130 (=> (not res!929940) (not e!787153))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119130 (= res!929940 (validMask!0 mask!2840))))

(assert (=> start!119130 e!787153))

(assert (=> start!119130 true))

(declare-datatypes ((array!95067 0))(
  ( (array!95068 (arr!45899 (Array (_ BitVec 32) (_ BitVec 64))) (size!46449 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95067)

(declare-fun array_inv!34927 (array!95067) Bool)

(assert (=> start!119130 (array_inv!34927 a!2901)))

(declare-fun b!1389775 () Bool)

(assert (=> b!1389775 (= e!787153 (not true))))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95067 (_ BitVec 32)) Bool)

(assert (=> b!1389775 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-datatypes ((Unit!46436 0))(
  ( (Unit!46437) )
))
(declare-fun lt!610626 () Unit!46436)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95067 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46436)

(assert (=> b!1389775 (= lt!610626 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-datatypes ((SeekEntryResult!10216 0))(
  ( (MissingZero!10216 (index!43235 (_ BitVec 32))) (Found!10216 (index!43236 (_ BitVec 32))) (Intermediate!10216 (undefined!11028 Bool) (index!43237 (_ BitVec 32)) (x!124926 (_ BitVec 32))) (Undefined!10216) (MissingVacant!10216 (index!43238 (_ BitVec 32))) )
))
(declare-fun lt!610625 () SeekEntryResult!10216)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95067 (_ BitVec 32)) SeekEntryResult!10216)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1389775 (= lt!610625 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45899 a!2901) j!112) mask!2840) (select (arr!45899 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1389776 () Bool)

(declare-fun res!929941 () Bool)

(assert (=> b!1389776 (=> (not res!929941) (not e!787153))))

(declare-datatypes ((List!32418 0))(
  ( (Nil!32415) (Cons!32414 (h!33632 (_ BitVec 64)) (t!47112 List!32418)) )
))
(declare-fun arrayNoDuplicates!0 (array!95067 (_ BitVec 32) List!32418) Bool)

(assert (=> b!1389776 (= res!929941 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32415))))

(declare-fun b!1389777 () Bool)

(declare-fun res!929936 () Bool)

(assert (=> b!1389777 (=> (not res!929936) (not e!787153))))

(assert (=> b!1389777 (= res!929936 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1389778 () Bool)

(declare-fun res!929939 () Bool)

(assert (=> b!1389778 (=> (not res!929939) (not e!787153))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1389778 (= res!929939 (validKeyInArray!0 (select (arr!45899 a!2901) i!1037)))))

(declare-fun b!1389779 () Bool)

(declare-fun res!929938 () Bool)

(assert (=> b!1389779 (=> (not res!929938) (not e!787153))))

(assert (=> b!1389779 (= res!929938 (and (= (size!46449 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46449 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46449 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1389780 () Bool)

(declare-fun res!929937 () Bool)

(assert (=> b!1389780 (=> (not res!929937) (not e!787153))))

(assert (=> b!1389780 (= res!929937 (validKeyInArray!0 (select (arr!45899 a!2901) j!112)))))

(assert (= (and start!119130 res!929940) b!1389779))

(assert (= (and b!1389779 res!929938) b!1389778))

(assert (= (and b!1389778 res!929939) b!1389780))

(assert (= (and b!1389780 res!929937) b!1389777))

(assert (= (and b!1389777 res!929936) b!1389776))

(assert (= (and b!1389776 res!929941) b!1389775))

(declare-fun m!1275447 () Bool)

(assert (=> b!1389776 m!1275447))

(declare-fun m!1275449 () Bool)

(assert (=> start!119130 m!1275449))

(declare-fun m!1275451 () Bool)

(assert (=> start!119130 m!1275451))

(declare-fun m!1275453 () Bool)

(assert (=> b!1389778 m!1275453))

(assert (=> b!1389778 m!1275453))

(declare-fun m!1275455 () Bool)

(assert (=> b!1389778 m!1275455))

(declare-fun m!1275457 () Bool)

(assert (=> b!1389780 m!1275457))

(assert (=> b!1389780 m!1275457))

(declare-fun m!1275459 () Bool)

(assert (=> b!1389780 m!1275459))

(assert (=> b!1389775 m!1275457))

(declare-fun m!1275461 () Bool)

(assert (=> b!1389775 m!1275461))

(assert (=> b!1389775 m!1275457))

(declare-fun m!1275463 () Bool)

(assert (=> b!1389775 m!1275463))

(assert (=> b!1389775 m!1275461))

(assert (=> b!1389775 m!1275457))

(declare-fun m!1275465 () Bool)

(assert (=> b!1389775 m!1275465))

(declare-fun m!1275467 () Bool)

(assert (=> b!1389775 m!1275467))

(declare-fun m!1275469 () Bool)

(assert (=> b!1389777 m!1275469))

(push 1)

(assert (not b!1389777))

(assert (not b!1389775))

(assert (not b!1389776))

(assert (not start!119130))

(assert (not b!1389778))

(assert (not b!1389780))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

