; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!118026 () Bool)

(assert start!118026)

(declare-fun b!1382221 () Bool)

(declare-fun res!923813 () Bool)

(declare-fun e!783464 () Bool)

(assert (=> b!1382221 (=> (not res!923813) (not e!783464))))

(declare-datatypes ((array!94390 0))(
  ( (array!94391 (arr!45576 (Array (_ BitVec 32) (_ BitVec 64))) (size!46126 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94390)

(declare-fun i!1094 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1382221 (= res!923813 (validKeyInArray!0 (select (arr!45576 a!2971) i!1094)))))

(declare-fun b!1382223 () Bool)

(assert (=> b!1382223 (= e!783464 false)))

(declare-fun lt!608373 () Bool)

(declare-fun mask!3034 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94390 (_ BitVec 32)) Bool)

(assert (=> b!1382223 (= lt!608373 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2971 mask!3034))))

(declare-fun res!923812 () Bool)

(assert (=> start!118026 (=> (not res!923812) (not e!783464))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118026 (= res!923812 (validMask!0 mask!3034))))

(assert (=> start!118026 e!783464))

(assert (=> start!118026 true))

(declare-fun array_inv!34604 (array!94390) Bool)

(assert (=> start!118026 (array_inv!34604 a!2971)))

(declare-fun b!1382222 () Bool)

(declare-fun res!923814 () Bool)

(assert (=> b!1382222 (=> (not res!923814) (not e!783464))))

(declare-datatypes ((List!32110 0))(
  ( (Nil!32107) (Cons!32106 (h!33315 (_ BitVec 64)) (t!46804 List!32110)) )
))
(declare-fun arrayNoDuplicates!0 (array!94390 (_ BitVec 32) List!32110) Bool)

(assert (=> b!1382222 (= res!923814 (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32107))))

(declare-fun b!1382220 () Bool)

(declare-fun res!923815 () Bool)

(assert (=> b!1382220 (=> (not res!923815) (not e!783464))))

(assert (=> b!1382220 (= res!923815 (and (= (size!46126 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46126 a!2971))))))

(assert (= (and start!118026 res!923812) b!1382220))

(assert (= (and b!1382220 res!923815) b!1382221))

(assert (= (and b!1382221 res!923813) b!1382222))

(assert (= (and b!1382222 res!923814) b!1382223))

(declare-fun m!1267359 () Bool)

(assert (=> b!1382221 m!1267359))

(assert (=> b!1382221 m!1267359))

(declare-fun m!1267361 () Bool)

(assert (=> b!1382221 m!1267361))

(declare-fun m!1267363 () Bool)

(assert (=> b!1382223 m!1267363))

(declare-fun m!1267365 () Bool)

(assert (=> start!118026 m!1267365))

(declare-fun m!1267367 () Bool)

(assert (=> start!118026 m!1267367))

(declare-fun m!1267369 () Bool)

(assert (=> b!1382222 m!1267369))

(check-sat (not start!118026) (not b!1382222) (not b!1382223) (not b!1382221))
(check-sat)
