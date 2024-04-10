; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117904 () Bool)

(assert start!117904)

(declare-fun b!1381506 () Bool)

(declare-fun res!923134 () Bool)

(declare-fun e!783125 () Bool)

(assert (=> b!1381506 (=> (not res!923134) (not e!783125))))

(declare-fun mask!3034 () (_ BitVec 32))

(declare-datatypes ((array!94295 0))(
  ( (array!94296 (arr!45530 (Array (_ BitVec 32) (_ BitVec 64))) (size!46080 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94295)

(declare-fun i!1094 () (_ BitVec 32))

(assert (=> b!1381506 (= res!923134 (and (= (size!46080 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46080 a!2971))))))

(declare-fun b!1381508 () Bool)

(declare-fun res!923136 () Bool)

(assert (=> b!1381508 (=> (not res!923136) (not e!783125))))

(declare-datatypes ((List!32064 0))(
  ( (Nil!32061) (Cons!32060 (h!33269 (_ BitVec 64)) (t!46758 List!32064)) )
))
(declare-fun arrayNoDuplicates!0 (array!94295 (_ BitVec 32) List!32064) Bool)

(assert (=> b!1381508 (= res!923136 (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32061))))

(declare-fun b!1381507 () Bool)

(declare-fun res!923137 () Bool)

(assert (=> b!1381507 (=> (not res!923137) (not e!783125))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1381507 (= res!923137 (validKeyInArray!0 (select (arr!45530 a!2971) i!1094)))))

(declare-fun b!1381509 () Bool)

(assert (=> b!1381509 (= e!783125 (bvsgt #b00000000000000000000000000000000 (size!46080 a!2971)))))

(declare-fun res!923135 () Bool)

(assert (=> start!117904 (=> (not res!923135) (not e!783125))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!117904 (= res!923135 (validMask!0 mask!3034))))

(assert (=> start!117904 e!783125))

(assert (=> start!117904 true))

(declare-fun array_inv!34558 (array!94295) Bool)

(assert (=> start!117904 (array_inv!34558 a!2971)))

(assert (= (and start!117904 res!923135) b!1381506))

(assert (= (and b!1381506 res!923134) b!1381507))

(assert (= (and b!1381507 res!923137) b!1381508))

(assert (= (and b!1381508 res!923136) b!1381509))

(declare-fun m!1266693 () Bool)

(assert (=> b!1381508 m!1266693))

(declare-fun m!1266695 () Bool)

(assert (=> b!1381507 m!1266695))

(assert (=> b!1381507 m!1266695))

(declare-fun m!1266697 () Bool)

(assert (=> b!1381507 m!1266697))

(declare-fun m!1266699 () Bool)

(assert (=> start!117904 m!1266699))

(declare-fun m!1266701 () Bool)

(assert (=> start!117904 m!1266701))

(push 1)

