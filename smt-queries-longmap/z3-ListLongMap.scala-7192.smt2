; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92418 () Bool)

(assert start!92418)

(declare-fun res!697798 () Bool)

(declare-fun e!595276 () Bool)

(assert (=> start!92418 (=> (not res!697798) (not e!595276))))

(declare-fun i!1381 () (_ BitVec 32))

(declare-datatypes ((array!66061 0))(
  ( (array!66062 (arr!31765 (Array (_ BitVec 32) (_ BitVec 64))) (size!32302 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66061)

(assert (=> start!92418 (= res!697798 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32302 a!3488)) (bvslt (size!32302 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92418 e!595276))

(assert (=> start!92418 true))

(declare-fun array_inv!24547 (array!66061) Bool)

(assert (=> start!92418 (array_inv!24547 a!3488)))

(declare-fun b!1049440 () Bool)

(declare-fun res!697797 () Bool)

(assert (=> b!1049440 (=> (not res!697797) (not e!595276))))

(declare-datatypes ((List!22047 0))(
  ( (Nil!22044) (Cons!22043 (h!23261 (_ BitVec 64)) (t!31346 List!22047)) )
))
(declare-fun arrayNoDuplicates!0 (array!66061 (_ BitVec 32) List!22047) Bool)

(assert (=> b!1049440 (= res!697797 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22044))))

(declare-fun b!1049441 () Bool)

(declare-fun res!697799 () Bool)

(assert (=> b!1049441 (=> (not res!697799) (not e!595276))))

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1049441 (= res!697799 (validKeyInArray!0 k0!2747))))

(declare-fun b!1049442 () Bool)

(assert (=> b!1049442 (= e!595276 (and (= (select (arr!31765 a!3488) i!1381) k0!2747) (bvsge #b00000000000000000000000000000000 (size!32302 a!3488))))))

(assert (= (and start!92418 res!697798) b!1049440))

(assert (= (and b!1049440 res!697797) b!1049441))

(assert (= (and b!1049441 res!697799) b!1049442))

(declare-fun m!970823 () Bool)

(assert (=> start!92418 m!970823))

(declare-fun m!970825 () Bool)

(assert (=> b!1049440 m!970825))

(declare-fun m!970827 () Bool)

(assert (=> b!1049441 m!970827))

(declare-fun m!970829 () Bool)

(assert (=> b!1049442 m!970829))

(check-sat (not start!92418) (not b!1049440) (not b!1049441))
(check-sat)
