; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!118032 () Bool)

(assert start!118032)

(declare-fun b!1382257 () Bool)

(declare-fun res!923849 () Bool)

(declare-fun e!783482 () Bool)

(assert (=> b!1382257 (=> (not res!923849) (not e!783482))))

(declare-datatypes ((array!94396 0))(
  ( (array!94397 (arr!45579 (Array (_ BitVec 32) (_ BitVec 64))) (size!46129 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94396)

(declare-fun i!1094 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1382257 (= res!923849 (validKeyInArray!0 (select (arr!45579 a!2971) i!1094)))))

(declare-fun b!1382258 () Bool)

(declare-fun res!923848 () Bool)

(assert (=> b!1382258 (=> (not res!923848) (not e!783482))))

(declare-datatypes ((List!32113 0))(
  ( (Nil!32110) (Cons!32109 (h!33318 (_ BitVec 64)) (t!46807 List!32113)) )
))
(declare-fun arrayNoDuplicates!0 (array!94396 (_ BitVec 32) List!32113) Bool)

(assert (=> b!1382258 (= res!923848 (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32110))))

(declare-fun b!1382259 () Bool)

(assert (=> b!1382259 (= e!783482 false)))

(declare-fun lt!608382 () Bool)

(declare-fun mask!3034 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94396 (_ BitVec 32)) Bool)

(assert (=> b!1382259 (= lt!608382 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2971 mask!3034))))

(declare-fun b!1382256 () Bool)

(declare-fun res!923851 () Bool)

(assert (=> b!1382256 (=> (not res!923851) (not e!783482))))

(assert (=> b!1382256 (= res!923851 (and (= (size!46129 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46129 a!2971))))))

(declare-fun res!923850 () Bool)

(assert (=> start!118032 (=> (not res!923850) (not e!783482))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118032 (= res!923850 (validMask!0 mask!3034))))

(assert (=> start!118032 e!783482))

(assert (=> start!118032 true))

(declare-fun array_inv!34607 (array!94396) Bool)

(assert (=> start!118032 (array_inv!34607 a!2971)))

(assert (= (and start!118032 res!923850) b!1382256))

(assert (= (and b!1382256 res!923851) b!1382257))

(assert (= (and b!1382257 res!923849) b!1382258))

(assert (= (and b!1382258 res!923848) b!1382259))

(declare-fun m!1267395 () Bool)

(assert (=> b!1382257 m!1267395))

(assert (=> b!1382257 m!1267395))

(declare-fun m!1267397 () Bool)

(assert (=> b!1382257 m!1267397))

(declare-fun m!1267399 () Bool)

(assert (=> b!1382258 m!1267399))

(declare-fun m!1267401 () Bool)

(assert (=> b!1382259 m!1267401))

(declare-fun m!1267403 () Bool)

(assert (=> start!118032 m!1267403))

(declare-fun m!1267405 () Bool)

(assert (=> start!118032 m!1267405))

(check-sat (not b!1382257) (not start!118032) (not b!1382258) (not b!1382259))
(check-sat)
