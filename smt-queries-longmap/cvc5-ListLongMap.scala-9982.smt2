; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117900 () Bool)

(assert start!117900)

(declare-fun res!923097 () Bool)

(declare-fun e!783088 () Bool)

(assert (=> start!117900 (=> (not res!923097) (not e!783088))))

(declare-fun mask!3034 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!117900 (= res!923097 (validMask!0 mask!3034))))

(assert (=> start!117900 e!783088))

(assert (=> start!117900 true))

(declare-datatypes ((array!94243 0))(
  ( (array!94244 (arr!45504 (Array (_ BitVec 32) (_ BitVec 64))) (size!46056 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94243)

(declare-fun array_inv!34737 (array!94243) Bool)

(assert (=> start!117900 (array_inv!34737 a!2971)))

(declare-fun b!1381426 () Bool)

(declare-fun res!923098 () Bool)

(assert (=> b!1381426 (=> (not res!923098) (not e!783088))))

(declare-fun i!1094 () (_ BitVec 32))

(assert (=> b!1381426 (= res!923098 (and (= (size!46056 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46056 a!2971))))))

(declare-fun b!1381427 () Bool)

(declare-fun res!923099 () Bool)

(assert (=> b!1381427 (=> (not res!923099) (not e!783088))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1381427 (= res!923099 (validKeyInArray!0 (select (arr!45504 a!2971) i!1094)))))

(declare-fun b!1381428 () Bool)

(assert (=> b!1381428 (= e!783088 false)))

(declare-fun lt!608039 () Bool)

(declare-datatypes ((List!32116 0))(
  ( (Nil!32113) (Cons!32112 (h!33321 (_ BitVec 64)) (t!46802 List!32116)) )
))
(declare-fun arrayNoDuplicates!0 (array!94243 (_ BitVec 32) List!32116) Bool)

(assert (=> b!1381428 (= lt!608039 (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32113))))

(assert (= (and start!117900 res!923097) b!1381426))

(assert (= (and b!1381426 res!923098) b!1381427))

(assert (= (and b!1381427 res!923099) b!1381428))

(declare-fun m!1266179 () Bool)

(assert (=> start!117900 m!1266179))

(declare-fun m!1266181 () Bool)

(assert (=> start!117900 m!1266181))

(declare-fun m!1266183 () Bool)

(assert (=> b!1381427 m!1266183))

(assert (=> b!1381427 m!1266183))

(declare-fun m!1266185 () Bool)

(assert (=> b!1381427 m!1266185))

(declare-fun m!1266187 () Bool)

(assert (=> b!1381428 m!1266187))

(push 1)

(assert (not b!1381428))

(assert (not start!117900))

(assert (not b!1381427))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

