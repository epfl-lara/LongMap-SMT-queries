; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118254 () Bool)

(assert start!118254)

(declare-fun b!1383260 () Bool)

(declare-fun res!924853 () Bool)

(declare-fun e!784012 () Bool)

(assert (=> b!1383260 (=> (not res!924853) (not e!784012))))

(declare-datatypes ((array!94557 0))(
  ( (array!94558 (arr!45656 (Array (_ BitVec 32) (_ BitVec 64))) (size!46206 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94557)

(declare-datatypes ((List!32184 0))(
  ( (Nil!32181) (Cons!32180 (h!33389 (_ BitVec 64)) (t!46878 List!32184)) )
))
(declare-fun arrayNoDuplicates!0 (array!94557 (_ BitVec 32) List!32184) Bool)

(assert (=> b!1383260 (= res!924853 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32181))))

(declare-fun res!924851 () Bool)

(assert (=> start!118254 (=> (not res!924851) (not e!784012))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118254 (= res!924851 (validMask!0 mask!2987))))

(assert (=> start!118254 e!784012))

(assert (=> start!118254 true))

(declare-fun array_inv!34684 (array!94557) Bool)

(assert (=> start!118254 (array_inv!34684 a!2938)))

(declare-fun b!1383259 () Bool)

(declare-fun res!924850 () Bool)

(assert (=> b!1383259 (=> (not res!924850) (not e!784012))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1383259 (= res!924850 (validKeyInArray!0 (select (arr!45656 a!2938) i!1065)))))

(declare-fun b!1383258 () Bool)

(declare-fun res!924852 () Bool)

(assert (=> b!1383258 (=> (not res!924852) (not e!784012))))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1383258 (= res!924852 (and (= (size!46206 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46206 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46206 a!2938))))))

(declare-fun b!1383261 () Bool)

(assert (=> b!1383261 (= e!784012 false)))

(declare-fun lt!608571 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94557 (_ BitVec 32)) Bool)

(assert (=> b!1383261 (= lt!608571 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(assert (= (and start!118254 res!924851) b!1383258))

(assert (= (and b!1383258 res!924852) b!1383259))

(assert (= (and b!1383259 res!924850) b!1383260))

(assert (= (and b!1383260 res!924853) b!1383261))

(declare-fun m!1268361 () Bool)

(assert (=> b!1383260 m!1268361))

(declare-fun m!1268363 () Bool)

(assert (=> start!118254 m!1268363))

(declare-fun m!1268365 () Bool)

(assert (=> start!118254 m!1268365))

(declare-fun m!1268367 () Bool)

(assert (=> b!1383259 m!1268367))

(assert (=> b!1383259 m!1268367))

(declare-fun m!1268369 () Bool)

(assert (=> b!1383259 m!1268369))

(declare-fun m!1268371 () Bool)

(assert (=> b!1383261 m!1268371))

(push 1)

(assert (not b!1383261))

(assert (not b!1383259))

(assert (not start!118254))

(assert (not b!1383260))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

