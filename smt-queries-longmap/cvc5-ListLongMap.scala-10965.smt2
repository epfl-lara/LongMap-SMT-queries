; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128724 () Bool)

(assert start!128724)

(declare-fun b!1508047 () Bool)

(declare-fun res!1027232 () Bool)

(declare-fun e!842940 () Bool)

(assert (=> b!1508047 (=> (not res!1027232) (not e!842940))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!100583 0))(
  ( (array!100584 (arr!48531 (Array (_ BitVec 32) (_ BitVec 64))) (size!49082 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100583)

(assert (=> b!1508047 (= res!1027232 (and (= (size!49082 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49082 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49082 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1508048 () Bool)

(declare-fun res!1027227 () Bool)

(assert (=> b!1508048 (=> (not res!1027227) (not e!842940))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1508048 (= res!1027227 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49082 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49082 a!2804))))))

(declare-fun b!1508049 () Bool)

(declare-fun res!1027230 () Bool)

(assert (=> b!1508049 (=> (not res!1027230) (not e!842940))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1508049 (= res!1027230 (validKeyInArray!0 (select (arr!48531 a!2804) i!961)))))

(declare-fun b!1508050 () Bool)

(declare-fun res!1027228 () Bool)

(assert (=> b!1508050 (=> (not res!1027228) (not e!842940))))

(assert (=> b!1508050 (= res!1027228 (validKeyInArray!0 (select (arr!48531 a!2804) j!70)))))

(declare-fun b!1508051 () Bool)

(declare-fun res!1027226 () Bool)

(assert (=> b!1508051 (=> (not res!1027226) (not e!842940))))

(declare-datatypes ((List!35001 0))(
  ( (Nil!34998) (Cons!34997 (h!36409 (_ BitVec 64)) (t!49687 List!35001)) )
))
(declare-fun arrayNoDuplicates!0 (array!100583 (_ BitVec 32) List!35001) Bool)

(assert (=> b!1508051 (= res!1027226 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!34998))))

(declare-fun res!1027229 () Bool)

(assert (=> start!128724 (=> (not res!1027229) (not e!842940))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128724 (= res!1027229 (validMask!0 mask!2512))))

(assert (=> start!128724 e!842940))

(assert (=> start!128724 true))

(declare-fun array_inv!37812 (array!100583) Bool)

(assert (=> start!128724 (array_inv!37812 a!2804)))

(declare-fun b!1508052 () Bool)

(assert (=> b!1508052 (= e!842940 false)))

(declare-fun lt!654832 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1508052 (= lt!654832 (toIndex!0 (select (arr!48531 a!2804) j!70) mask!2512))))

(declare-fun b!1508053 () Bool)

(declare-fun res!1027231 () Bool)

(assert (=> b!1508053 (=> (not res!1027231) (not e!842940))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100583 (_ BitVec 32)) Bool)

(assert (=> b!1508053 (= res!1027231 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(assert (= (and start!128724 res!1027229) b!1508047))

(assert (= (and b!1508047 res!1027232) b!1508049))

(assert (= (and b!1508049 res!1027230) b!1508050))

(assert (= (and b!1508050 res!1027228) b!1508053))

(assert (= (and b!1508053 res!1027231) b!1508051))

(assert (= (and b!1508051 res!1027226) b!1508048))

(assert (= (and b!1508048 res!1027227) b!1508052))

(declare-fun m!1391007 () Bool)

(assert (=> b!1508053 m!1391007))

(declare-fun m!1391009 () Bool)

(assert (=> start!128724 m!1391009))

(declare-fun m!1391011 () Bool)

(assert (=> start!128724 m!1391011))

(declare-fun m!1391013 () Bool)

(assert (=> b!1508049 m!1391013))

(assert (=> b!1508049 m!1391013))

(declare-fun m!1391015 () Bool)

(assert (=> b!1508049 m!1391015))

(declare-fun m!1391017 () Bool)

(assert (=> b!1508052 m!1391017))

(assert (=> b!1508052 m!1391017))

(declare-fun m!1391019 () Bool)

(assert (=> b!1508052 m!1391019))

(declare-fun m!1391021 () Bool)

(assert (=> b!1508051 m!1391021))

(assert (=> b!1508050 m!1391017))

(assert (=> b!1508050 m!1391017))

(declare-fun m!1391023 () Bool)

(assert (=> b!1508050 m!1391023))

(push 1)

(assert (not b!1508049))

(assert (not start!128724))

(assert (not b!1508053))

(assert (not b!1508052))

(assert (not b!1508051))

(assert (not b!1508050))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

