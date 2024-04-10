; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!118050 () Bool)

(assert start!118050)

(declare-fun b!1382367 () Bool)

(declare-fun e!783535 () Bool)

(assert (=> b!1382367 (= e!783535 false)))

(declare-fun lt!608409 () Bool)

(declare-datatypes ((array!94414 0))(
  ( (array!94415 (arr!45588 (Array (_ BitVec 32) (_ BitVec 64))) (size!46138 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94414)

(declare-fun mask!3034 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94414 (_ BitVec 32)) Bool)

(assert (=> b!1382367 (= lt!608409 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2971 mask!3034))))

(declare-fun b!1382366 () Bool)

(declare-fun res!923958 () Bool)

(assert (=> b!1382366 (=> (not res!923958) (not e!783535))))

(declare-datatypes ((List!32122 0))(
  ( (Nil!32119) (Cons!32118 (h!33327 (_ BitVec 64)) (t!46816 List!32122)) )
))
(declare-fun arrayNoDuplicates!0 (array!94414 (_ BitVec 32) List!32122) Bool)

(assert (=> b!1382366 (= res!923958 (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32119))))

(declare-fun res!923956 () Bool)

(assert (=> start!118050 (=> (not res!923956) (not e!783535))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118050 (= res!923956 (validMask!0 mask!3034))))

(assert (=> start!118050 e!783535))

(assert (=> start!118050 true))

(declare-fun array_inv!34616 (array!94414) Bool)

(assert (=> start!118050 (array_inv!34616 a!2971)))

(declare-fun b!1382365 () Bool)

(declare-fun res!923957 () Bool)

(assert (=> b!1382365 (=> (not res!923957) (not e!783535))))

(declare-fun i!1094 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1382365 (= res!923957 (validKeyInArray!0 (select (arr!45588 a!2971) i!1094)))))

(declare-fun b!1382364 () Bool)

(declare-fun res!923959 () Bool)

(assert (=> b!1382364 (=> (not res!923959) (not e!783535))))

(assert (=> b!1382364 (= res!923959 (and (= (size!46138 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46138 a!2971))))))

(assert (= (and start!118050 res!923956) b!1382364))

(assert (= (and b!1382364 res!923959) b!1382365))

(assert (= (and b!1382365 res!923957) b!1382366))

(assert (= (and b!1382366 res!923958) b!1382367))

(declare-fun m!1267503 () Bool)

(assert (=> b!1382367 m!1267503))

(declare-fun m!1267505 () Bool)

(assert (=> b!1382366 m!1267505))

(declare-fun m!1267507 () Bool)

(assert (=> start!118050 m!1267507))

(declare-fun m!1267509 () Bool)

(assert (=> start!118050 m!1267509))

(declare-fun m!1267511 () Bool)

(assert (=> b!1382365 m!1267511))

(assert (=> b!1382365 m!1267511))

(declare-fun m!1267513 () Bool)

(assert (=> b!1382365 m!1267513))

(check-sat (not b!1382365) (not start!118050) (not b!1382366) (not b!1382367))
