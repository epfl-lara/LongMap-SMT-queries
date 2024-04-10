; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93472 () Bool)

(assert start!93472)

(declare-fun res!707276 () Bool)

(declare-fun e!602349 () Bool)

(assert (=> start!93472 (=> (not res!707276) (not e!602349))))

(declare-fun i!1381 () (_ BitVec 32))

(declare-datatypes ((array!66775 0))(
  ( (array!66776 (arr!32106 (Array (_ BitVec 32) (_ BitVec 64))) (size!32642 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66775)

(assert (=> start!93472 (= res!707276 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32642 a!3488)) (bvslt (size!32642 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93472 e!602349))

(assert (=> start!93472 true))

(declare-fun array_inv!24886 (array!66775) Bool)

(assert (=> start!93472 (array_inv!24886 a!3488)))

(declare-fun b!1058702 () Bool)

(assert (=> b!1058702 (= e!602349 false)))

(declare-fun lt!467031 () Bool)

(declare-datatypes ((List!22418 0))(
  ( (Nil!22415) (Cons!22414 (h!23623 (_ BitVec 64)) (t!31725 List!22418)) )
))
(declare-fun arrayNoDuplicates!0 (array!66775 (_ BitVec 32) List!22418) Bool)

(assert (=> b!1058702 (= lt!467031 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22415))))

(assert (= (and start!93472 res!707276) b!1058702))

(declare-fun m!978361 () Bool)

(assert (=> start!93472 m!978361))

(declare-fun m!978363 () Bool)

(assert (=> b!1058702 m!978363))

(push 1)

(assert (not start!93472))

(assert (not b!1058702))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

