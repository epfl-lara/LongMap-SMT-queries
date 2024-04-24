; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92416 () Bool)

(assert start!92416)

(declare-fun res!697790 () Bool)

(declare-fun e!595269 () Bool)

(assert (=> start!92416 (=> (not res!697790) (not e!595269))))

(declare-fun i!1381 () (_ BitVec 32))

(declare-datatypes ((array!66059 0))(
  ( (array!66060 (arr!31764 (Array (_ BitVec 32) (_ BitVec 64))) (size!32301 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66059)

(assert (=> start!92416 (= res!697790 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32301 a!3488)) (bvslt (size!32301 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92416 e!595269))

(assert (=> start!92416 true))

(declare-fun array_inv!24546 (array!66059) Bool)

(assert (=> start!92416 (array_inv!24546 a!3488)))

(declare-fun b!1049433 () Bool)

(assert (=> b!1049433 (= e!595269 false)))

(declare-fun lt!463634 () Bool)

(declare-datatypes ((List!22046 0))(
  ( (Nil!22043) (Cons!22042 (h!23260 (_ BitVec 64)) (t!31345 List!22046)) )
))
(declare-fun arrayNoDuplicates!0 (array!66059 (_ BitVec 32) List!22046) Bool)

(assert (=> b!1049433 (= lt!463634 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22043))))

(assert (= (and start!92416 res!697790) b!1049433))

(declare-fun m!970819 () Bool)

(assert (=> start!92416 m!970819))

(declare-fun m!970821 () Bool)

(assert (=> b!1049433 m!970821))

(push 1)

(assert (not b!1049433))

(assert (not start!92416))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

