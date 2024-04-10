; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118082 () Bool)

(assert start!118082)

(declare-fun b!1382565 () Bool)

(declare-fun res!924157 () Bool)

(declare-fun e!783632 () Bool)

(assert (=> b!1382565 (=> (not res!924157) (not e!783632))))

(declare-fun mask!3034 () (_ BitVec 32))

(declare-datatypes ((array!94446 0))(
  ( (array!94447 (arr!45604 (Array (_ BitVec 32) (_ BitVec 64))) (size!46154 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94446)

(declare-fun i!1094 () (_ BitVec 32))

(assert (=> b!1382565 (= res!924157 (and (= (size!46154 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46154 a!2971))))))

(declare-fun b!1382567 () Bool)

(declare-fun res!924160 () Bool)

(assert (=> b!1382567 (=> (not res!924160) (not e!783632))))

(declare-datatypes ((List!32138 0))(
  ( (Nil!32135) (Cons!32134 (h!33343 (_ BitVec 64)) (t!46832 List!32138)) )
))
(declare-fun arrayNoDuplicates!0 (array!94446 (_ BitVec 32) List!32138) Bool)

(assert (=> b!1382567 (= res!924160 (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32135))))

(declare-fun b!1382566 () Bool)

(declare-fun res!924159 () Bool)

(assert (=> b!1382566 (=> (not res!924159) (not e!783632))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1382566 (= res!924159 (validKeyInArray!0 (select (arr!45604 a!2971) i!1094)))))

(declare-fun b!1382568 () Bool)

(assert (=> b!1382568 (= e!783632 false)))

(declare-fun lt!608448 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94446 (_ BitVec 32)) Bool)

(assert (=> b!1382568 (= lt!608448 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2971 mask!3034))))

(declare-fun res!924158 () Bool)

(assert (=> start!118082 (=> (not res!924158) (not e!783632))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118082 (= res!924158 (validMask!0 mask!3034))))

(assert (=> start!118082 e!783632))

(assert (=> start!118082 true))

(declare-fun array_inv!34632 (array!94446) Bool)

(assert (=> start!118082 (array_inv!34632 a!2971)))

(assert (= (and start!118082 res!924158) b!1382565))

(assert (= (and b!1382565 res!924157) b!1382566))

(assert (= (and b!1382566 res!924159) b!1382567))

(assert (= (and b!1382567 res!924160) b!1382568))

(declare-fun m!1267695 () Bool)

(assert (=> b!1382567 m!1267695))

(declare-fun m!1267697 () Bool)

(assert (=> b!1382566 m!1267697))

(assert (=> b!1382566 m!1267697))

(declare-fun m!1267699 () Bool)

(assert (=> b!1382566 m!1267699))

(declare-fun m!1267701 () Bool)

(assert (=> b!1382568 m!1267701))

(declare-fun m!1267703 () Bool)

(assert (=> start!118082 m!1267703))

(declare-fun m!1267705 () Bool)

(assert (=> start!118082 m!1267705))

(push 1)

(assert (not b!1382568))

(assert (not start!118082))

(assert (not b!1382567))

(assert (not b!1382566))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

