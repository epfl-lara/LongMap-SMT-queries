; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!118100 () Bool)

(assert start!118100)

(declare-fun res!924286 () Bool)

(declare-fun e!783660 () Bool)

(assert (=> start!118100 (=> (not res!924286) (not e!783660))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118100 (= res!924286 (validMask!0 mask!2987))))

(assert (=> start!118100 e!783660))

(assert (=> start!118100 true))

(declare-datatypes ((array!94416 0))(
  ( (array!94417 (arr!45589 (Array (_ BitVec 32) (_ BitVec 64))) (size!46141 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94416)

(declare-fun array_inv!34822 (array!94416) Bool)

(assert (=> start!118100 (array_inv!34822 a!2938)))

(declare-fun b!1382650 () Bool)

(declare-fun res!924285 () Bool)

(assert (=> b!1382650 (=> (not res!924285) (not e!783660))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1382650 (= res!924285 (and (= (size!46141 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46141 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46141 a!2938))))))

(declare-fun b!1382651 () Bool)

(declare-fun res!924287 () Bool)

(assert (=> b!1382651 (=> (not res!924287) (not e!783660))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1382651 (= res!924287 (validKeyInArray!0 (select (arr!45589 a!2938) i!1065)))))

(declare-fun b!1382652 () Bool)

(assert (=> b!1382652 (= e!783660 (bvsgt #b00000000000000000000000000000000 (size!46141 a!2938)))))

(assert (= (and start!118100 res!924286) b!1382650))

(assert (= (and b!1382650 res!924285) b!1382651))

(assert (= (and b!1382651 res!924287) b!1382652))

(declare-fun m!1267347 () Bool)

(assert (=> start!118100 m!1267347))

(declare-fun m!1267349 () Bool)

(assert (=> start!118100 m!1267349))

(declare-fun m!1267351 () Bool)

(assert (=> b!1382651 m!1267351))

(assert (=> b!1382651 m!1267351))

(declare-fun m!1267353 () Bool)

(assert (=> b!1382651 m!1267353))

(check-sat (not b!1382651) (not start!118100))
(check-sat)
