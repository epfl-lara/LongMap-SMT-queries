; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117912 () Bool)

(assert start!117912)

(declare-fun b!1381557 () Bool)

(declare-fun e!783149 () Bool)

(assert (=> b!1381557 (= e!783149 false)))

(declare-fun lt!608229 () Bool)

(declare-datatypes ((array!94303 0))(
  ( (array!94304 (arr!45534 (Array (_ BitVec 32) (_ BitVec 64))) (size!46084 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94303)

(declare-fun mask!3034 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94303 (_ BitVec 32)) Bool)

(assert (=> b!1381557 (= lt!608229 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2971 mask!3034))))

(declare-fun b!1381556 () Bool)

(declare-fun res!923183 () Bool)

(assert (=> b!1381556 (=> (not res!923183) (not e!783149))))

(declare-datatypes ((List!32068 0))(
  ( (Nil!32065) (Cons!32064 (h!33273 (_ BitVec 64)) (t!46762 List!32068)) )
))
(declare-fun arrayNoDuplicates!0 (array!94303 (_ BitVec 32) List!32068) Bool)

(assert (=> b!1381556 (= res!923183 (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32065))))

(declare-fun res!923184 () Bool)

(assert (=> start!117912 (=> (not res!923184) (not e!783149))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!117912 (= res!923184 (validMask!0 mask!3034))))

(assert (=> start!117912 e!783149))

(assert (=> start!117912 true))

(declare-fun array_inv!34562 (array!94303) Bool)

(assert (=> start!117912 (array_inv!34562 a!2971)))

(declare-fun b!1381555 () Bool)

(declare-fun res!923182 () Bool)

(assert (=> b!1381555 (=> (not res!923182) (not e!783149))))

(declare-fun i!1094 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1381555 (= res!923182 (validKeyInArray!0 (select (arr!45534 a!2971) i!1094)))))

(declare-fun b!1381554 () Bool)

(declare-fun res!923185 () Bool)

(assert (=> b!1381554 (=> (not res!923185) (not e!783149))))

(assert (=> b!1381554 (= res!923185 (and (= (size!46084 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46084 a!2971))))))

(assert (= (and start!117912 res!923184) b!1381554))

(assert (= (and b!1381554 res!923185) b!1381555))

(assert (= (and b!1381555 res!923182) b!1381556))

(assert (= (and b!1381556 res!923183) b!1381557))

(declare-fun m!1266735 () Bool)

(assert (=> b!1381557 m!1266735))

(declare-fun m!1266737 () Bool)

(assert (=> b!1381556 m!1266737))

(declare-fun m!1266739 () Bool)

(assert (=> start!117912 m!1266739))

(declare-fun m!1266741 () Bool)

(assert (=> start!117912 m!1266741))

(declare-fun m!1266743 () Bool)

(assert (=> b!1381555 m!1266743))

(assert (=> b!1381555 m!1266743))

(declare-fun m!1266745 () Bool)

(assert (=> b!1381555 m!1266745))

(check-sat (not b!1381555) (not b!1381557) (not start!117912) (not b!1381556))
