; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!118104 () Bool)

(assert start!118104)

(declare-fun res!924322 () Bool)

(declare-fun e!783698 () Bool)

(assert (=> start!118104 (=> (not res!924322) (not e!783698))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118104 (= res!924322 (validMask!0 mask!2987))))

(assert (=> start!118104 e!783698))

(assert (=> start!118104 true))

(declare-datatypes ((array!94468 0))(
  ( (array!94469 (arr!45615 (Array (_ BitVec 32) (_ BitVec 64))) (size!46165 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94468)

(declare-fun array_inv!34643 (array!94468) Bool)

(assert (=> start!118104 (array_inv!34643 a!2938)))

(declare-fun b!1382728 () Bool)

(declare-fun res!924321 () Bool)

(assert (=> b!1382728 (=> (not res!924321) (not e!783698))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1382728 (= res!924321 (and (= (size!46165 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46165 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46165 a!2938))))))

(declare-fun b!1382729 () Bool)

(declare-fun res!924320 () Bool)

(assert (=> b!1382729 (=> (not res!924320) (not e!783698))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1382729 (= res!924320 (validKeyInArray!0 (select (arr!45615 a!2938) i!1065)))))

(declare-fun b!1382730 () Bool)

(assert (=> b!1382730 (= e!783698 (bvsgt #b00000000000000000000000000000000 (size!46165 a!2938)))))

(assert (= (and start!118104 res!924322) b!1382728))

(assert (= (and b!1382728 res!924321) b!1382729))

(assert (= (and b!1382729 res!924320) b!1382730))

(declare-fun m!1267859 () Bool)

(assert (=> start!118104 m!1267859))

(declare-fun m!1267861 () Bool)

(assert (=> start!118104 m!1267861))

(declare-fun m!1267863 () Bool)

(assert (=> b!1382729 m!1267863))

(assert (=> b!1382729 m!1267863))

(declare-fun m!1267865 () Bool)

(assert (=> b!1382729 m!1267865))

(check-sat (not b!1382729) (not start!118104))
(check-sat)
