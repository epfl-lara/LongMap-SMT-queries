; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!118496 () Bool)

(assert start!118496)

(declare-fun b!1385566 () Bool)

(declare-fun res!926818 () Bool)

(declare-fun e!785053 () Bool)

(assert (=> b!1385566 (=> (not res!926818) (not e!785053))))

(declare-datatypes ((array!94772 0))(
  ( (array!94773 (arr!45762 (Array (_ BitVec 32) (_ BitVec 64))) (size!46312 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94772)

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1385566 (= res!926818 (validKeyInArray!0 (select (arr!45762 a!2938) i!1065)))))

(declare-fun b!1385565 () Bool)

(declare-fun res!926816 () Bool)

(assert (=> b!1385565 (=> (not res!926816) (not e!785053))))

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun mask!2987 () (_ BitVec 32))

(assert (=> b!1385565 (= res!926816 (and (= (size!46312 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46312 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46312 a!2938))))))

(declare-fun res!926817 () Bool)

(assert (=> start!118496 (=> (not res!926817) (not e!785053))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118496 (= res!926817 (validMask!0 mask!2987))))

(assert (=> start!118496 e!785053))

(assert (=> start!118496 true))

(declare-fun array_inv!34790 (array!94772) Bool)

(assert (=> start!118496 (array_inv!34790 a!2938)))

(declare-fun b!1385567 () Bool)

(declare-fun res!926815 () Bool)

(assert (=> b!1385567 (=> (not res!926815) (not e!785053))))

(declare-datatypes ((List!32290 0))(
  ( (Nil!32287) (Cons!32286 (h!33495 (_ BitVec 64)) (t!46984 List!32290)) )
))
(declare-fun arrayNoDuplicates!0 (array!94772 (_ BitVec 32) List!32290) Bool)

(assert (=> b!1385567 (= res!926815 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32287))))

(declare-fun b!1385568 () Bool)

(assert (=> b!1385568 (= e!785053 false)))

(declare-fun lt!609276 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94772 (_ BitVec 32)) Bool)

(assert (=> b!1385568 (= lt!609276 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(assert (= (and start!118496 res!926817) b!1385565))

(assert (= (and b!1385565 res!926816) b!1385566))

(assert (= (and b!1385566 res!926818) b!1385567))

(assert (= (and b!1385567 res!926815) b!1385568))

(declare-fun m!1270857 () Bool)

(assert (=> b!1385566 m!1270857))

(assert (=> b!1385566 m!1270857))

(declare-fun m!1270859 () Bool)

(assert (=> b!1385566 m!1270859))

(declare-fun m!1270861 () Bool)

(assert (=> start!118496 m!1270861))

(declare-fun m!1270863 () Bool)

(assert (=> start!118496 m!1270863))

(declare-fun m!1270865 () Bool)

(assert (=> b!1385567 m!1270865))

(declare-fun m!1270867 () Bool)

(assert (=> b!1385568 m!1270867))

(check-sat (not b!1385568) (not b!1385567) (not start!118496) (not b!1385566))
