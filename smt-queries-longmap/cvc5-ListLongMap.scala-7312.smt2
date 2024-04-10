; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93474 () Bool)

(assert start!93474)

(declare-fun res!707279 () Bool)

(declare-fun e!602355 () Bool)

(assert (=> start!93474 (=> (not res!707279) (not e!602355))))

(declare-fun i!1381 () (_ BitVec 32))

(declare-datatypes ((array!66777 0))(
  ( (array!66778 (arr!32107 (Array (_ BitVec 32) (_ BitVec 64))) (size!32643 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66777)

(assert (=> start!93474 (= res!707279 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32643 a!3488)) (bvslt (size!32643 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93474 e!602355))

(assert (=> start!93474 true))

(declare-fun array_inv!24887 (array!66777) Bool)

(assert (=> start!93474 (array_inv!24887 a!3488)))

(declare-fun b!1058705 () Bool)

(assert (=> b!1058705 (= e!602355 false)))

(declare-fun lt!467034 () Bool)

(declare-datatypes ((List!22419 0))(
  ( (Nil!22416) (Cons!22415 (h!23624 (_ BitVec 64)) (t!31726 List!22419)) )
))
(declare-fun arrayNoDuplicates!0 (array!66777 (_ BitVec 32) List!22419) Bool)

(assert (=> b!1058705 (= lt!467034 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22416))))

(assert (= (and start!93474 res!707279) b!1058705))

(declare-fun m!978365 () Bool)

(assert (=> start!93474 m!978365))

(declare-fun m!978367 () Bool)

(assert (=> b!1058705 m!978367))

(push 1)

(assert (not start!93474))

(assert (not b!1058705))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

