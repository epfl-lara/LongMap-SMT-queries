; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117152 () Bool)

(assert start!117152)

(declare-fun res!921351 () Bool)

(declare-fun e!781088 () Bool)

(assert (=> start!117152 (=> (not res!921351) (not e!781088))))

(declare-fun i!1451 () (_ BitVec 32))

(declare-datatypes ((array!93769 0))(
  ( (array!93770 (arr!45285 (Array (_ BitVec 32) (_ BitVec 64))) (size!45835 (_ BitVec 32))) )
))
(declare-fun a!4094 () array!93769)

(assert (=> start!117152 (= res!921351 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45835 a!4094))))))

(assert (=> start!117152 e!781088))

(assert (=> start!117152 true))

(declare-fun array_inv!34313 (array!93769) Bool)

(assert (=> start!117152 (array_inv!34313 a!4094)))

(declare-fun b!1378817 () Bool)

(declare-fun res!921352 () Bool)

(assert (=> b!1378817 (=> (not res!921352) (not e!781088))))

(declare-fun from!3466 () (_ BitVec 32))

(assert (=> b!1378817 (= res!921352 (and (bvslt (size!45835 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45835 a!4094)) (bvsge i!1451 from!3466)))))

(declare-fun b!1378815 () Bool)

(declare-fun res!921350 () Bool)

(assert (=> b!1378815 (=> (not res!921350) (not e!781088))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1378815 (= res!921350 (validKeyInArray!0 (select (arr!45285 a!4094) i!1451)))))

(declare-fun b!1378818 () Bool)

(assert (=> b!1378818 (= e!781088 false)))

(declare-fun lt!606990 () (_ BitVec 32))

(declare-fun k0!2953 () (_ BitVec 64))

(declare-fun arrayCountValidKeys!0 (array!93769 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1378818 (= lt!606990 (arrayCountValidKeys!0 (array!93770 (store (arr!45285 a!4094) i!1451 k0!2953) (size!45835 a!4094)) from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun lt!606989 () (_ BitVec 32))

(assert (=> b!1378818 (= lt!606989 (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun b!1378816 () Bool)

(declare-fun res!921349 () Bool)

(assert (=> b!1378816 (=> (not res!921349) (not e!781088))))

(assert (=> b!1378816 (= res!921349 (not (validKeyInArray!0 k0!2953)))))

(assert (= (and start!117152 res!921351) b!1378815))

(assert (= (and b!1378815 res!921350) b!1378816))

(assert (= (and b!1378816 res!921349) b!1378817))

(assert (= (and b!1378817 res!921352) b!1378818))

(declare-fun m!1263635 () Bool)

(assert (=> start!117152 m!1263635))

(declare-fun m!1263637 () Bool)

(assert (=> b!1378815 m!1263637))

(assert (=> b!1378815 m!1263637))

(declare-fun m!1263639 () Bool)

(assert (=> b!1378815 m!1263639))

(declare-fun m!1263641 () Bool)

(assert (=> b!1378818 m!1263641))

(declare-fun m!1263643 () Bool)

(assert (=> b!1378818 m!1263643))

(declare-fun m!1263645 () Bool)

(assert (=> b!1378818 m!1263645))

(declare-fun m!1263647 () Bool)

(assert (=> b!1378816 m!1263647))

(check-sat (not b!1378816) (not b!1378815) (not start!117152) (not b!1378818))
