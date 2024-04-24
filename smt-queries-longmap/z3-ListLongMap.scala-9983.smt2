; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!118118 () Bool)

(assert start!118118)

(declare-fun res!923656 () Bool)

(declare-fun e!783973 () Bool)

(assert (=> start!118118 (=> (not res!923656) (not e!783973))))

(declare-fun mask!3034 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118118 (= res!923656 (validMask!0 mask!3034))))

(assert (=> start!118118 e!783973))

(assert (=> start!118118 true))

(declare-datatypes ((array!94405 0))(
  ( (array!94406 (arr!45583 (Array (_ BitVec 32) (_ BitVec 64))) (size!46134 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94405)

(declare-fun array_inv!34864 (array!94405) Bool)

(assert (=> start!118118 (array_inv!34864 a!2971)))

(declare-fun b!1382817 () Bool)

(assert (=> b!1382817 (= e!783973 (bvsgt #b00000000000000000000000000000000 (size!46134 a!2971)))))

(declare-fun b!1382814 () Bool)

(declare-fun res!923655 () Bool)

(assert (=> b!1382814 (=> (not res!923655) (not e!783973))))

(declare-fun i!1094 () (_ BitVec 32))

(assert (=> b!1382814 (= res!923655 (and (= (size!46134 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46134 a!2971))))))

(declare-fun b!1382816 () Bool)

(declare-fun res!923653 () Bool)

(assert (=> b!1382816 (=> (not res!923653) (not e!783973))))

(declare-datatypes ((List!32104 0))(
  ( (Nil!32101) (Cons!32100 (h!33318 (_ BitVec 64)) (t!46790 List!32104)) )
))
(declare-fun arrayNoDuplicates!0 (array!94405 (_ BitVec 32) List!32104) Bool)

(assert (=> b!1382816 (= res!923653 (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32101))))

(declare-fun b!1382815 () Bool)

(declare-fun res!923654 () Bool)

(assert (=> b!1382815 (=> (not res!923654) (not e!783973))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1382815 (= res!923654 (validKeyInArray!0 (select (arr!45583 a!2971) i!1094)))))

(assert (= (and start!118118 res!923656) b!1382814))

(assert (= (and b!1382814 res!923655) b!1382815))

(assert (= (and b!1382815 res!923654) b!1382816))

(assert (= (and b!1382816 res!923653) b!1382817))

(declare-fun m!1268325 () Bool)

(assert (=> start!118118 m!1268325))

(declare-fun m!1268327 () Bool)

(assert (=> start!118118 m!1268327))

(declare-fun m!1268329 () Bool)

(assert (=> b!1382816 m!1268329))

(declare-fun m!1268331 () Bool)

(assert (=> b!1382815 m!1268331))

(assert (=> b!1382815 m!1268331))

(declare-fun m!1268333 () Bool)

(assert (=> b!1382815 m!1268333))

(check-sat (not start!118118) (not b!1382815) (not b!1382816))
(check-sat)
