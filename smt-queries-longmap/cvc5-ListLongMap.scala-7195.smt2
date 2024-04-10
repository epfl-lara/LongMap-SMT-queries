; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92202 () Bool)

(assert start!92202)

(declare-fun res!697364 () Bool)

(declare-fun e!594486 () Bool)

(assert (=> start!92202 (=> (not res!697364) (not e!594486))))

(declare-fun i!1381 () (_ BitVec 32))

(declare-datatypes ((array!66030 0))(
  ( (array!66031 (arr!31756 (Array (_ BitVec 32) (_ BitVec 64))) (size!32292 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66030)

(assert (=> start!92202 (= res!697364 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32292 a!3488)) (bvslt (size!32292 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92202 e!594486))

(assert (=> start!92202 true))

(declare-fun array_inv!24536 (array!66030) Bool)

(assert (=> start!92202 (array_inv!24536 a!3488)))

(declare-fun b!1048202 () Bool)

(assert (=> b!1048202 (= e!594486 false)))

(declare-fun lt!463131 () Bool)

(declare-datatypes ((List!22068 0))(
  ( (Nil!22065) (Cons!22064 (h!23273 (_ BitVec 64)) (t!31375 List!22068)) )
))
(declare-fun arrayNoDuplicates!0 (array!66030 (_ BitVec 32) List!22068) Bool)

(assert (=> b!1048202 (= lt!463131 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22065))))

(assert (= (and start!92202 res!697364) b!1048202))

(declare-fun m!969227 () Bool)

(assert (=> start!92202 m!969227))

(declare-fun m!969229 () Bool)

(assert (=> b!1048202 m!969229))

(push 1)

(assert (not b!1048202))

(assert (not start!92202))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

