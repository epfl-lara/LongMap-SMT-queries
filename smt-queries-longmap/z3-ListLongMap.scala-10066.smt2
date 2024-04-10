; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!118532 () Bool)

(assert start!118532)

(declare-fun b!1385808 () Bool)

(declare-fun res!927058 () Bool)

(declare-fun e!785162 () Bool)

(assert (=> b!1385808 (=> (not res!927058) (not e!785162))))

(declare-datatypes ((array!94808 0))(
  ( (array!94809 (arr!45780 (Array (_ BitVec 32) (_ BitVec 64))) (size!46330 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94808)

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun i!1065 () (_ BitVec 32))

(assert (=> b!1385808 (= res!927058 (and (= (size!46330 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46330 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46330 a!2938))))))

(declare-fun b!1385809 () Bool)

(declare-fun res!927060 () Bool)

(assert (=> b!1385809 (=> (not res!927060) (not e!785162))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1385809 (= res!927060 (validKeyInArray!0 (select (arr!45780 a!2938) i!1065)))))

(declare-fun b!1385810 () Bool)

(declare-fun res!927059 () Bool)

(assert (=> b!1385810 (=> (not res!927059) (not e!785162))))

(declare-datatypes ((List!32308 0))(
  ( (Nil!32305) (Cons!32304 (h!33513 (_ BitVec 64)) (t!47002 List!32308)) )
))
(declare-fun arrayNoDuplicates!0 (array!94808 (_ BitVec 32) List!32308) Bool)

(assert (=> b!1385810 (= res!927059 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32305))))

(declare-fun res!927061 () Bool)

(assert (=> start!118532 (=> (not res!927061) (not e!785162))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118532 (= res!927061 (validMask!0 mask!2987))))

(assert (=> start!118532 e!785162))

(assert (=> start!118532 true))

(declare-fun array_inv!34808 (array!94808) Bool)

(assert (=> start!118532 (array_inv!34808 a!2938)))

(declare-fun b!1385811 () Bool)

(assert (=> b!1385811 (= e!785162 false)))

(declare-fun lt!609321 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94808 (_ BitVec 32)) Bool)

(assert (=> b!1385811 (= lt!609321 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(assert (= (and start!118532 res!927061) b!1385808))

(assert (= (and b!1385808 res!927058) b!1385809))

(assert (= (and b!1385809 res!927060) b!1385810))

(assert (= (and b!1385810 res!927059) b!1385811))

(declare-fun m!1271085 () Bool)

(assert (=> b!1385809 m!1271085))

(assert (=> b!1385809 m!1271085))

(declare-fun m!1271087 () Bool)

(assert (=> b!1385809 m!1271087))

(declare-fun m!1271089 () Bool)

(assert (=> b!1385810 m!1271089))

(declare-fun m!1271091 () Bool)

(assert (=> start!118532 m!1271091))

(declare-fun m!1271093 () Bool)

(assert (=> start!118532 m!1271093))

(declare-fun m!1271095 () Bool)

(assert (=> b!1385811 m!1271095))

(check-sat (not b!1385809) (not start!118532) (not b!1385810) (not b!1385811))
