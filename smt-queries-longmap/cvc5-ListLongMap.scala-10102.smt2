; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119106 () Bool)

(assert start!119106)

(declare-fun b!1389514 () Bool)

(declare-fun res!929727 () Bool)

(declare-fun e!787055 () Bool)

(assert (=> b!1389514 (=> (not res!929727) (not e!787055))))

(declare-datatypes ((array!94996 0))(
  ( (array!94997 (arr!45864 (Array (_ BitVec 32) (_ BitVec 64))) (size!46416 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!94996)

(declare-datatypes ((List!32461 0))(
  ( (Nil!32458) (Cons!32457 (h!33675 (_ BitVec 64)) (t!47147 List!32461)) )
))
(declare-fun arrayNoDuplicates!0 (array!94996 (_ BitVec 32) List!32461) Bool)

(assert (=> b!1389514 (= res!929727 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32458))))

(declare-fun b!1389516 () Bool)

(declare-fun res!929726 () Bool)

(assert (=> b!1389516 (=> (not res!929726) (not e!787055))))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1389516 (= res!929726 (validKeyInArray!0 (select (arr!45864 a!2901) j!112)))))

(declare-fun b!1389517 () Bool)

(declare-fun res!929728 () Bool)

(assert (=> b!1389517 (=> (not res!929728) (not e!787055))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1389517 (= res!929728 (validKeyInArray!0 (select (arr!45864 a!2901) i!1037)))))

(declare-fun b!1389518 () Bool)

(declare-fun res!929730 () Bool)

(assert (=> b!1389518 (=> (not res!929730) (not e!787055))))

(declare-fun mask!2840 () (_ BitVec 32))

(assert (=> b!1389518 (= res!929730 (and (= (size!46416 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46416 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46416 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1389519 () Bool)

(declare-fun res!929731 () Bool)

(assert (=> b!1389519 (=> (not res!929731) (not e!787055))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94996 (_ BitVec 32)) Bool)

(assert (=> b!1389519 (= res!929731 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1389515 () Bool)

(assert (=> b!1389515 (= e!787055 false)))

(declare-datatypes ((SeekEntryResult!10207 0))(
  ( (MissingZero!10207 (index!43199 (_ BitVec 32))) (Found!10207 (index!43200 (_ BitVec 32))) (Intermediate!10207 (undefined!11019 Bool) (index!43201 (_ BitVec 32)) (x!124882 (_ BitVec 32))) (Undefined!10207) (MissingVacant!10207 (index!43202 (_ BitVec 32))) )
))
(declare-fun lt!610403 () SeekEntryResult!10207)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!94996 (_ BitVec 32)) SeekEntryResult!10207)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1389515 (= lt!610403 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45864 a!2901) j!112) mask!2840) (select (arr!45864 a!2901) j!112) a!2901 mask!2840))))

(declare-fun res!929729 () Bool)

(assert (=> start!119106 (=> (not res!929729) (not e!787055))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119106 (= res!929729 (validMask!0 mask!2840))))

(assert (=> start!119106 e!787055))

(assert (=> start!119106 true))

(declare-fun array_inv!35097 (array!94996) Bool)

(assert (=> start!119106 (array_inv!35097 a!2901)))

(assert (= (and start!119106 res!929729) b!1389518))

(assert (= (and b!1389518 res!929730) b!1389517))

(assert (= (and b!1389517 res!929728) b!1389516))

(assert (= (and b!1389516 res!929726) b!1389519))

(assert (= (and b!1389519 res!929731) b!1389514))

(assert (= (and b!1389514 res!929727) b!1389515))

(declare-fun m!1274711 () Bool)

(assert (=> start!119106 m!1274711))

(declare-fun m!1274713 () Bool)

(assert (=> start!119106 m!1274713))

(declare-fun m!1274715 () Bool)

(assert (=> b!1389515 m!1274715))

(assert (=> b!1389515 m!1274715))

(declare-fun m!1274717 () Bool)

(assert (=> b!1389515 m!1274717))

(assert (=> b!1389515 m!1274717))

(assert (=> b!1389515 m!1274715))

(declare-fun m!1274719 () Bool)

(assert (=> b!1389515 m!1274719))

(declare-fun m!1274721 () Bool)

(assert (=> b!1389517 m!1274721))

(assert (=> b!1389517 m!1274721))

(declare-fun m!1274723 () Bool)

(assert (=> b!1389517 m!1274723))

(declare-fun m!1274725 () Bool)

(assert (=> b!1389514 m!1274725))

(declare-fun m!1274727 () Bool)

(assert (=> b!1389519 m!1274727))

(assert (=> b!1389516 m!1274715))

(assert (=> b!1389516 m!1274715))

(declare-fun m!1274729 () Bool)

(assert (=> b!1389516 m!1274729))

(push 1)

(assert (not b!1389514))

(assert (not b!1389517))

(assert (not b!1389515))

(assert (not b!1389519))

(assert (not start!119106))

(assert (not b!1389516))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

