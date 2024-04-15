; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36196 () Bool)

(assert start!36196)

(declare-fun res!202105 () Bool)

(declare-fun e!222096 () Bool)

(assert (=> start!36196 (=> (not res!202105) (not e!222096))))

(declare-fun i!1478 () (_ BitVec 32))

(declare-datatypes ((array!20508 0))(
  ( (array!20509 (arr!9736 (Array (_ BitVec 32) (_ BitVec 64))) (size!10089 (_ BitVec 32))) )
))
(declare-fun a!4337 () array!20508)

(assert (=> start!36196 (= res!202105 (and (bvsge i!1478 #b00000000000000000000000000000000) (bvslt i!1478 (size!10089 a!4337))))))

(assert (=> start!36196 e!222096))

(assert (=> start!36196 true))

(declare-fun array_inv!7185 (array!20508) Bool)

(assert (=> start!36196 (array_inv!7185 a!4337)))

(declare-fun b!362672 () Bool)

(declare-fun res!202104 () Bool)

(assert (=> b!362672 (=> (not res!202104) (not e!222096))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!362672 (= res!202104 (not (validKeyInArray!0 (select (arr!9736 a!4337) i!1478))))))

(declare-fun b!362673 () Bool)

(declare-fun res!202103 () Bool)

(assert (=> b!362673 (=> (not res!202103) (not e!222096))))

(declare-fun k0!2980 () (_ BitVec 64))

(assert (=> b!362673 (= res!202103 (validKeyInArray!0 k0!2980))))

(declare-fun b!362674 () Bool)

(assert (=> b!362674 (= e!222096 (and (bvslt (size!10089 a!4337) #b01111111111111111111111111111111) (bvsgt i!1478 (size!10089 a!4337))))))

(assert (= (and start!36196 res!202105) b!362672))

(assert (= (and b!362672 res!202104) b!362673))

(assert (= (and b!362673 res!202103) b!362674))

(declare-fun m!359089 () Bool)

(assert (=> start!36196 m!359089))

(declare-fun m!359091 () Bool)

(assert (=> b!362672 m!359091))

(assert (=> b!362672 m!359091))

(declare-fun m!359093 () Bool)

(assert (=> b!362672 m!359093))

(declare-fun m!359095 () Bool)

(assert (=> b!362673 m!359095))

(check-sat (not b!362673) (not start!36196) (not b!362672))
(check-sat)
