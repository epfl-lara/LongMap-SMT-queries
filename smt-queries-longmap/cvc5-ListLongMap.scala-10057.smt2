; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118476 () Bool)

(assert start!118476)

(declare-fun b!1385401 () Bool)

(declare-fun res!926696 () Bool)

(declare-fun e!784975 () Bool)

(assert (=> b!1385401 (=> (not res!926696) (not e!784975))))

(declare-datatypes ((array!94705 0))(
  ( (array!94706 (arr!45729 (Array (_ BitVec 32) (_ BitVec 64))) (size!46281 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94705)

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1385401 (= res!926696 (validKeyInArray!0 (select (arr!45729 a!2938) i!1065)))))

(declare-fun b!1385403 () Bool)

(assert (=> b!1385403 (= e!784975 false)))

(declare-fun lt!609068 () Bool)

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94705 (_ BitVec 32)) Bool)

(assert (=> b!1385403 (= lt!609068 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1385400 () Bool)

(declare-fun res!926694 () Bool)

(assert (=> b!1385400 (=> (not res!926694) (not e!784975))))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1385400 (= res!926694 (and (= (size!46281 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46281 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46281 a!2938))))))

(declare-fun b!1385402 () Bool)

(declare-fun res!926693 () Bool)

(assert (=> b!1385402 (=> (not res!926693) (not e!784975))))

(declare-datatypes ((List!32335 0))(
  ( (Nil!32332) (Cons!32331 (h!33540 (_ BitVec 64)) (t!47021 List!32335)) )
))
(declare-fun arrayNoDuplicates!0 (array!94705 (_ BitVec 32) List!32335) Bool)

(assert (=> b!1385402 (= res!926693 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32332))))

(declare-fun res!926695 () Bool)

(assert (=> start!118476 (=> (not res!926695) (not e!784975))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118476 (= res!926695 (validMask!0 mask!2987))))

(assert (=> start!118476 e!784975))

(assert (=> start!118476 true))

(declare-fun array_inv!34962 (array!94705) Bool)

(assert (=> start!118476 (array_inv!34962 a!2938)))

(assert (= (and start!118476 res!926695) b!1385400))

(assert (= (and b!1385400 res!926694) b!1385401))

(assert (= (and b!1385401 res!926696) b!1385402))

(assert (= (and b!1385402 res!926693) b!1385403))

(declare-fun m!1270257 () Bool)

(assert (=> b!1385401 m!1270257))

(assert (=> b!1385401 m!1270257))

(declare-fun m!1270259 () Bool)

(assert (=> b!1385401 m!1270259))

(declare-fun m!1270261 () Bool)

(assert (=> b!1385403 m!1270261))

(declare-fun m!1270263 () Bool)

(assert (=> b!1385402 m!1270263))

(declare-fun m!1270265 () Bool)

(assert (=> start!118476 m!1270265))

(declare-fun m!1270267 () Bool)

(assert (=> start!118476 m!1270267))

(push 1)

(assert (not start!118476))

(assert (not b!1385402))

(assert (not b!1385401))

(assert (not b!1385403))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

