; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36310 () Bool)

(assert start!36310)

(declare-fun res!202688 () Bool)

(declare-fun e!222554 () Bool)

(assert (=> start!36310 (=> (not res!202688) (not e!222554))))

(declare-fun i!1472 () (_ BitVec 32))

(declare-datatypes ((array!20585 0))(
  ( (array!20586 (arr!9771 (Array (_ BitVec 32) (_ BitVec 64))) (size!10123 (_ BitVec 32))) )
))
(declare-fun a!4289 () array!20585)

(assert (=> start!36310 (= res!202688 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10123 a!4289))))))

(assert (=> start!36310 e!222554))

(assert (=> start!36310 true))

(declare-fun array_inv!7243 (array!20585) Bool)

(assert (=> start!36310 (array_inv!7243 a!4289)))

(declare-fun b!363481 () Bool)

(declare-fun res!202689 () Bool)

(assert (=> b!363481 (=> (not res!202689) (not e!222554))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!363481 (= res!202689 (not (validKeyInArray!0 (select (arr!9771 a!4289) i!1472))))))

(declare-fun b!363482 () Bool)

(declare-fun res!202690 () Bool)

(assert (=> b!363482 (=> (not res!202690) (not e!222554))))

(declare-fun k0!2974 () (_ BitVec 64))

(assert (=> b!363482 (= res!202690 (validKeyInArray!0 k0!2974))))

(declare-fun b!363483 () Bool)

(declare-fun from!3650 () (_ BitVec 32))

(assert (=> b!363483 (= e!222554 (and (bvslt (size!10123 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10123 a!4289)) (bvsge i!1472 from!3650) (bvsgt from!3650 (bvadd #b00000000000000000000000000000001 i!1472))))))

(assert (= (and start!36310 res!202688) b!363481))

(assert (= (and b!363481 res!202689) b!363482))

(assert (= (and b!363482 res!202690) b!363483))

(declare-fun m!360889 () Bool)

(assert (=> start!36310 m!360889))

(declare-fun m!360891 () Bool)

(assert (=> b!363481 m!360891))

(assert (=> b!363481 m!360891))

(declare-fun m!360893 () Bool)

(assert (=> b!363481 m!360893))

(declare-fun m!360895 () Bool)

(assert (=> b!363482 m!360895))

(check-sat (not b!363482) (not b!363481) (not start!36310))
(check-sat)
