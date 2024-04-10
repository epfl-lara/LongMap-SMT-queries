; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!118038 () Bool)

(assert start!118038)

(declare-fun b!1382292 () Bool)

(declare-fun res!923886 () Bool)

(declare-fun e!783499 () Bool)

(assert (=> b!1382292 (=> (not res!923886) (not e!783499))))

(declare-fun mask!3034 () (_ BitVec 32))

(declare-datatypes ((array!94402 0))(
  ( (array!94403 (arr!45582 (Array (_ BitVec 32) (_ BitVec 64))) (size!46132 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94402)

(declare-fun i!1094 () (_ BitVec 32))

(assert (=> b!1382292 (= res!923886 (and (= (size!46132 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46132 a!2971))))))

(declare-fun b!1382294 () Bool)

(declare-fun res!923887 () Bool)

(assert (=> b!1382294 (=> (not res!923887) (not e!783499))))

(declare-datatypes ((List!32116 0))(
  ( (Nil!32113) (Cons!32112 (h!33321 (_ BitVec 64)) (t!46810 List!32116)) )
))
(declare-fun arrayNoDuplicates!0 (array!94402 (_ BitVec 32) List!32116) Bool)

(assert (=> b!1382294 (= res!923887 (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32113))))

(declare-fun res!923884 () Bool)

(assert (=> start!118038 (=> (not res!923884) (not e!783499))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118038 (= res!923884 (validMask!0 mask!3034))))

(assert (=> start!118038 e!783499))

(assert (=> start!118038 true))

(declare-fun array_inv!34610 (array!94402) Bool)

(assert (=> start!118038 (array_inv!34610 a!2971)))

(declare-fun b!1382293 () Bool)

(declare-fun res!923885 () Bool)

(assert (=> b!1382293 (=> (not res!923885) (not e!783499))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1382293 (= res!923885 (validKeyInArray!0 (select (arr!45582 a!2971) i!1094)))))

(declare-fun b!1382295 () Bool)

(assert (=> b!1382295 (= e!783499 false)))

(declare-fun lt!608391 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94402 (_ BitVec 32)) Bool)

(assert (=> b!1382295 (= lt!608391 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2971 mask!3034))))

(assert (= (and start!118038 res!923884) b!1382292))

(assert (= (and b!1382292 res!923886) b!1382293))

(assert (= (and b!1382293 res!923885) b!1382294))

(assert (= (and b!1382294 res!923887) b!1382295))

(declare-fun m!1267431 () Bool)

(assert (=> b!1382294 m!1267431))

(declare-fun m!1267433 () Bool)

(assert (=> start!118038 m!1267433))

(declare-fun m!1267435 () Bool)

(assert (=> start!118038 m!1267435))

(declare-fun m!1267437 () Bool)

(assert (=> b!1382293 m!1267437))

(assert (=> b!1382293 m!1267437))

(declare-fun m!1267439 () Bool)

(assert (=> b!1382293 m!1267439))

(declare-fun m!1267441 () Bool)

(assert (=> b!1382295 m!1267441))

(check-sat (not b!1382293) (not start!118038) (not b!1382294) (not b!1382295))
(check-sat)
