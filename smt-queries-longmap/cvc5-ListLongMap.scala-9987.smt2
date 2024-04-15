; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117930 () Bool)

(assert start!117930)

(declare-fun b!1381605 () Bool)

(declare-fun res!923277 () Bool)

(declare-fun e!783178 () Bool)

(assert (=> b!1381605 (=> (not res!923277) (not e!783178))))

(declare-fun mask!3034 () (_ BitVec 32))

(declare-datatypes ((array!94273 0))(
  ( (array!94274 (arr!45519 (Array (_ BitVec 32) (_ BitVec 64))) (size!46071 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94273)

(declare-fun i!1094 () (_ BitVec 32))

(assert (=> b!1381605 (= res!923277 (and (= (size!46071 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46071 a!2971))))))

(declare-fun res!923276 () Bool)

(assert (=> start!117930 (=> (not res!923276) (not e!783178))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!117930 (= res!923276 (validMask!0 mask!3034))))

(assert (=> start!117930 e!783178))

(assert (=> start!117930 true))

(declare-fun array_inv!34752 (array!94273) Bool)

(assert (=> start!117930 (array_inv!34752 a!2971)))

(declare-fun b!1381607 () Bool)

(declare-fun res!923278 () Bool)

(assert (=> b!1381607 (=> (not res!923278) (not e!783178))))

(declare-datatypes ((List!32131 0))(
  ( (Nil!32128) (Cons!32127 (h!33336 (_ BitVec 64)) (t!46817 List!32131)) )
))
(declare-fun arrayNoDuplicates!0 (array!94273 (_ BitVec 32) List!32131) Bool)

(assert (=> b!1381607 (= res!923278 (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32128))))

(declare-fun b!1381606 () Bool)

(declare-fun res!923279 () Bool)

(assert (=> b!1381606 (=> (not res!923279) (not e!783178))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1381606 (= res!923279 (validKeyInArray!0 (select (arr!45519 a!2971) i!1094)))))

(declare-fun b!1381608 () Bool)

(assert (=> b!1381608 (= e!783178 false)))

(declare-fun lt!608075 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94273 (_ BitVec 32)) Bool)

(assert (=> b!1381608 (= lt!608075 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2971 mask!3034))))

(assert (= (and start!117930 res!923276) b!1381605))

(assert (= (and b!1381605 res!923277) b!1381606))

(assert (= (and b!1381606 res!923279) b!1381607))

(assert (= (and b!1381607 res!923278) b!1381608))

(declare-fun m!1266351 () Bool)

(assert (=> start!117930 m!1266351))

(declare-fun m!1266353 () Bool)

(assert (=> start!117930 m!1266353))

(declare-fun m!1266355 () Bool)

(assert (=> b!1381607 m!1266355))

(declare-fun m!1266357 () Bool)

(assert (=> b!1381606 m!1266357))

(assert (=> b!1381606 m!1266357))

(declare-fun m!1266359 () Bool)

(assert (=> b!1381606 m!1266359))

(declare-fun m!1266361 () Bool)

(assert (=> b!1381608 m!1266361))

(push 1)

(assert (not b!1381608))

(assert (not start!117930))

(assert (not b!1381607))

(assert (not b!1381606))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

