; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117918 () Bool)

(assert start!117918)

(declare-fun b!1381593 () Bool)

(declare-fun e!783166 () Bool)

(assert (=> b!1381593 (= e!783166 false)))

(declare-fun lt!608238 () Bool)

(declare-datatypes ((array!94309 0))(
  ( (array!94310 (arr!45537 (Array (_ BitVec 32) (_ BitVec 64))) (size!46087 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94309)

(declare-fun mask!3034 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94309 (_ BitVec 32)) Bool)

(assert (=> b!1381593 (= lt!608238 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2971 mask!3034))))

(declare-fun b!1381592 () Bool)

(declare-fun res!923221 () Bool)

(assert (=> b!1381592 (=> (not res!923221) (not e!783166))))

(declare-datatypes ((List!32071 0))(
  ( (Nil!32068) (Cons!32067 (h!33276 (_ BitVec 64)) (t!46765 List!32071)) )
))
(declare-fun arrayNoDuplicates!0 (array!94309 (_ BitVec 32) List!32071) Bool)

(assert (=> b!1381592 (= res!923221 (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32068))))

(declare-fun b!1381590 () Bool)

(declare-fun res!923218 () Bool)

(assert (=> b!1381590 (=> (not res!923218) (not e!783166))))

(declare-fun i!1094 () (_ BitVec 32))

(assert (=> b!1381590 (= res!923218 (and (= (size!46087 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46087 a!2971))))))

(declare-fun res!923219 () Bool)

(assert (=> start!117918 (=> (not res!923219) (not e!783166))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!117918 (= res!923219 (validMask!0 mask!3034))))

(assert (=> start!117918 e!783166))

(assert (=> start!117918 true))

(declare-fun array_inv!34565 (array!94309) Bool)

(assert (=> start!117918 (array_inv!34565 a!2971)))

(declare-fun b!1381591 () Bool)

(declare-fun res!923220 () Bool)

(assert (=> b!1381591 (=> (not res!923220) (not e!783166))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1381591 (= res!923220 (validKeyInArray!0 (select (arr!45537 a!2971) i!1094)))))

(assert (= (and start!117918 res!923219) b!1381590))

(assert (= (and b!1381590 res!923218) b!1381591))

(assert (= (and b!1381591 res!923220) b!1381592))

(assert (= (and b!1381592 res!923221) b!1381593))

(declare-fun m!1266771 () Bool)

(assert (=> b!1381593 m!1266771))

(declare-fun m!1266773 () Bool)

(assert (=> b!1381592 m!1266773))

(declare-fun m!1266775 () Bool)

(assert (=> start!117918 m!1266775))

(declare-fun m!1266777 () Bool)

(assert (=> start!117918 m!1266777))

(declare-fun m!1266779 () Bool)

(assert (=> b!1381591 m!1266779))

(assert (=> b!1381591 m!1266779))

(declare-fun m!1266781 () Bool)

(assert (=> b!1381591 m!1266781))

(check-sat (not start!117918) (not b!1381592) (not b!1381593) (not b!1381591))
(check-sat)
