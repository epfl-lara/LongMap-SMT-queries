; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!118526 () Bool)

(assert start!118526)

(declare-fun b!1385772 () Bool)

(declare-fun res!927023 () Bool)

(declare-fun e!785144 () Bool)

(assert (=> b!1385772 (=> (not res!927023) (not e!785144))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-datatypes ((array!94802 0))(
  ( (array!94803 (arr!45777 (Array (_ BitVec 32) (_ BitVec 64))) (size!46327 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94802)

(assert (=> b!1385772 (= res!927023 (and (= (size!46327 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46327 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46327 a!2938))))))

(declare-fun b!1385775 () Bool)

(assert (=> b!1385775 (= e!785144 false)))

(declare-fun lt!609312 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94802 (_ BitVec 32)) Bool)

(assert (=> b!1385775 (= lt!609312 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1385774 () Bool)

(declare-fun res!927024 () Bool)

(assert (=> b!1385774 (=> (not res!927024) (not e!785144))))

(declare-datatypes ((List!32305 0))(
  ( (Nil!32302) (Cons!32301 (h!33510 (_ BitVec 64)) (t!46999 List!32305)) )
))
(declare-fun arrayNoDuplicates!0 (array!94802 (_ BitVec 32) List!32305) Bool)

(assert (=> b!1385774 (= res!927024 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32302))))

(declare-fun res!927025 () Bool)

(assert (=> start!118526 (=> (not res!927025) (not e!785144))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118526 (= res!927025 (validMask!0 mask!2987))))

(assert (=> start!118526 e!785144))

(assert (=> start!118526 true))

(declare-fun array_inv!34805 (array!94802) Bool)

(assert (=> start!118526 (array_inv!34805 a!2938)))

(declare-fun b!1385773 () Bool)

(declare-fun res!927022 () Bool)

(assert (=> b!1385773 (=> (not res!927022) (not e!785144))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1385773 (= res!927022 (validKeyInArray!0 (select (arr!45777 a!2938) i!1065)))))

(assert (= (and start!118526 res!927025) b!1385772))

(assert (= (and b!1385772 res!927023) b!1385773))

(assert (= (and b!1385773 res!927022) b!1385774))

(assert (= (and b!1385774 res!927024) b!1385775))

(declare-fun m!1271049 () Bool)

(assert (=> b!1385775 m!1271049))

(declare-fun m!1271051 () Bool)

(assert (=> b!1385774 m!1271051))

(declare-fun m!1271053 () Bool)

(assert (=> start!118526 m!1271053))

(declare-fun m!1271055 () Bool)

(assert (=> start!118526 m!1271055))

(declare-fun m!1271057 () Bool)

(assert (=> b!1385773 m!1271057))

(assert (=> b!1385773 m!1271057))

(declare-fun m!1271059 () Bool)

(assert (=> b!1385773 m!1271059))

(check-sat (not start!118526) (not b!1385774) (not b!1385775) (not b!1385773))
