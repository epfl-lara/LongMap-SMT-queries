; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!118214 () Bool)

(assert start!118214)

(declare-fun b!1383021 () Bool)

(declare-fun e!783892 () Bool)

(declare-datatypes ((array!94517 0))(
  ( (array!94518 (arr!45636 (Array (_ BitVec 32) (_ BitVec 64))) (size!46186 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94517)

(assert (=> b!1383021 (= e!783892 (bvsgt #b00000000000000000000000000000000 (size!46186 a!2938)))))

(declare-fun res!924611 () Bool)

(assert (=> start!118214 (=> (not res!924611) (not e!783892))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118214 (= res!924611 (validMask!0 mask!2987))))

(assert (=> start!118214 e!783892))

(assert (=> start!118214 true))

(declare-fun array_inv!34664 (array!94517) Bool)

(assert (=> start!118214 (array_inv!34664 a!2938)))

(declare-fun b!1383020 () Bool)

(declare-fun res!924612 () Bool)

(assert (=> b!1383020 (=> (not res!924612) (not e!783892))))

(declare-datatypes ((List!32164 0))(
  ( (Nil!32161) (Cons!32160 (h!33369 (_ BitVec 64)) (t!46858 List!32164)) )
))
(declare-fun arrayNoDuplicates!0 (array!94517 (_ BitVec 32) List!32164) Bool)

(assert (=> b!1383020 (= res!924612 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32161))))

(declare-fun b!1383018 () Bool)

(declare-fun res!924610 () Bool)

(assert (=> b!1383018 (=> (not res!924610) (not e!783892))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1383018 (= res!924610 (and (= (size!46186 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46186 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46186 a!2938))))))

(declare-fun b!1383019 () Bool)

(declare-fun res!924613 () Bool)

(assert (=> b!1383019 (=> (not res!924613) (not e!783892))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1383019 (= res!924613 (validKeyInArray!0 (select (arr!45636 a!2938) i!1065)))))

(assert (= (and start!118214 res!924611) b!1383018))

(assert (= (and b!1383018 res!924610) b!1383019))

(assert (= (and b!1383019 res!924613) b!1383020))

(assert (= (and b!1383020 res!924612) b!1383021))

(declare-fun m!1268125 () Bool)

(assert (=> start!118214 m!1268125))

(declare-fun m!1268127 () Bool)

(assert (=> start!118214 m!1268127))

(declare-fun m!1268129 () Bool)

(assert (=> b!1383020 m!1268129))

(declare-fun m!1268131 () Bool)

(assert (=> b!1383019 m!1268131))

(assert (=> b!1383019 m!1268131))

(declare-fun m!1268133 () Bool)

(assert (=> b!1383019 m!1268133))

(check-sat (not b!1383020) (not start!118214) (not b!1383019))
(check-sat)
