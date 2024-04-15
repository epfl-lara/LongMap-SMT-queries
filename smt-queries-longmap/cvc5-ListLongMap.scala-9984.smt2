; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117912 () Bool)

(assert start!117912)

(declare-fun b!1381497 () Bool)

(declare-fun res!923171 () Bool)

(declare-fun e!783124 () Bool)

(assert (=> b!1381497 (=> (not res!923171) (not e!783124))))

(declare-fun mask!3034 () (_ BitVec 32))

(declare-datatypes ((array!94255 0))(
  ( (array!94256 (arr!45510 (Array (_ BitVec 32) (_ BitVec 64))) (size!46062 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94255)

(declare-fun i!1094 () (_ BitVec 32))

(assert (=> b!1381497 (= res!923171 (and (= (size!46062 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46062 a!2971))))))

(declare-fun b!1381500 () Bool)

(assert (=> b!1381500 (= e!783124 false)))

(declare-fun lt!608048 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94255 (_ BitVec 32)) Bool)

(assert (=> b!1381500 (= lt!608048 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2971 mask!3034))))

(declare-fun b!1381499 () Bool)

(declare-fun res!923168 () Bool)

(assert (=> b!1381499 (=> (not res!923168) (not e!783124))))

(declare-datatypes ((List!32122 0))(
  ( (Nil!32119) (Cons!32118 (h!33327 (_ BitVec 64)) (t!46808 List!32122)) )
))
(declare-fun arrayNoDuplicates!0 (array!94255 (_ BitVec 32) List!32122) Bool)

(assert (=> b!1381499 (= res!923168 (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32119))))

(declare-fun b!1381498 () Bool)

(declare-fun res!923170 () Bool)

(assert (=> b!1381498 (=> (not res!923170) (not e!783124))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1381498 (= res!923170 (validKeyInArray!0 (select (arr!45510 a!2971) i!1094)))))

(declare-fun res!923169 () Bool)

(assert (=> start!117912 (=> (not res!923169) (not e!783124))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!117912 (= res!923169 (validMask!0 mask!3034))))

(assert (=> start!117912 e!783124))

(assert (=> start!117912 true))

(declare-fun array_inv!34743 (array!94255) Bool)

(assert (=> start!117912 (array_inv!34743 a!2971)))

(assert (= (and start!117912 res!923169) b!1381497))

(assert (= (and b!1381497 res!923171) b!1381498))

(assert (= (and b!1381498 res!923170) b!1381499))

(assert (= (and b!1381499 res!923168) b!1381500))

(declare-fun m!1266243 () Bool)

(assert (=> b!1381500 m!1266243))

(declare-fun m!1266245 () Bool)

(assert (=> b!1381499 m!1266245))

(declare-fun m!1266247 () Bool)

(assert (=> b!1381498 m!1266247))

(assert (=> b!1381498 m!1266247))

(declare-fun m!1266249 () Bool)

(assert (=> b!1381498 m!1266249))

(declare-fun m!1266251 () Bool)

(assert (=> start!117912 m!1266251))

(declare-fun m!1266253 () Bool)

(assert (=> start!117912 m!1266253))

(push 1)

(assert (not b!1381500))

(assert (not start!117912))

(assert (not b!1381499))

(assert (not b!1381498))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

