; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118128 () Bool)

(assert start!118128)

(declare-fun b!1382874 () Bool)

(declare-fun res!923713 () Bool)

(declare-fun e!784002 () Bool)

(assert (=> b!1382874 (=> (not res!923713) (not e!784002))))

(declare-fun mask!3034 () (_ BitVec 32))

(declare-datatypes ((array!94415 0))(
  ( (array!94416 (arr!45588 (Array (_ BitVec 32) (_ BitVec 64))) (size!46139 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94415)

(declare-fun i!1094 () (_ BitVec 32))

(assert (=> b!1382874 (= res!923713 (and (= (size!46139 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46139 a!2971))))))

(declare-fun b!1382875 () Bool)

(declare-fun res!923714 () Bool)

(assert (=> b!1382875 (=> (not res!923714) (not e!784002))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1382875 (= res!923714 (validKeyInArray!0 (select (arr!45588 a!2971) i!1094)))))

(declare-fun b!1382877 () Bool)

(assert (=> b!1382877 (= e!784002 false)))

(declare-fun lt!608712 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94415 (_ BitVec 32)) Bool)

(assert (=> b!1382877 (= lt!608712 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2971 mask!3034))))

(declare-fun b!1382876 () Bool)

(declare-fun res!923715 () Bool)

(assert (=> b!1382876 (=> (not res!923715) (not e!784002))))

(declare-datatypes ((List!32109 0))(
  ( (Nil!32106) (Cons!32105 (h!33323 (_ BitVec 64)) (t!46795 List!32109)) )
))
(declare-fun arrayNoDuplicates!0 (array!94415 (_ BitVec 32) List!32109) Bool)

(assert (=> b!1382876 (= res!923715 (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32106))))

(declare-fun res!923716 () Bool)

(assert (=> start!118128 (=> (not res!923716) (not e!784002))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118128 (= res!923716 (validMask!0 mask!3034))))

(assert (=> start!118128 e!784002))

(assert (=> start!118128 true))

(declare-fun array_inv!34869 (array!94415) Bool)

(assert (=> start!118128 (array_inv!34869 a!2971)))

(assert (= (and start!118128 res!923716) b!1382874))

(assert (= (and b!1382874 res!923713) b!1382875))

(assert (= (and b!1382875 res!923714) b!1382876))

(assert (= (and b!1382876 res!923715) b!1382877))

(declare-fun m!1268379 () Bool)

(assert (=> b!1382875 m!1268379))

(assert (=> b!1382875 m!1268379))

(declare-fun m!1268381 () Bool)

(assert (=> b!1382875 m!1268381))

(declare-fun m!1268383 () Bool)

(assert (=> b!1382877 m!1268383))

(declare-fun m!1268385 () Bool)

(assert (=> b!1382876 m!1268385))

(declare-fun m!1268387 () Bool)

(assert (=> start!118128 m!1268387))

(declare-fun m!1268389 () Bool)

(assert (=> start!118128 m!1268389))

(push 1)

(assert (not b!1382875))

(assert (not b!1382877))

(assert (not start!118128))

(assert (not b!1382876))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

