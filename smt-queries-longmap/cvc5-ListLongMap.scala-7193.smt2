; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92428 () Bool)

(assert start!92428)

(declare-fun res!697826 () Bool)

(declare-fun e!595305 () Bool)

(assert (=> start!92428 (=> (not res!697826) (not e!595305))))

(declare-fun i!1381 () (_ BitVec 32))

(declare-datatypes ((array!66071 0))(
  ( (array!66072 (arr!31770 (Array (_ BitVec 32) (_ BitVec 64))) (size!32307 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66071)

(assert (=> start!92428 (= res!697826 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32307 a!3488)) (bvslt (size!32307 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92428 e!595305))

(assert (=> start!92428 true))

(declare-fun array_inv!24552 (array!66071) Bool)

(assert (=> start!92428 (array_inv!24552 a!3488)))

(declare-fun b!1049469 () Bool)

(assert (=> b!1049469 (= e!595305 false)))

(declare-fun lt!463643 () Bool)

(declare-datatypes ((List!22052 0))(
  ( (Nil!22049) (Cons!22048 (h!23266 (_ BitVec 64)) (t!31351 List!22052)) )
))
(declare-fun arrayNoDuplicates!0 (array!66071 (_ BitVec 32) List!22052) Bool)

(assert (=> b!1049469 (= lt!463643 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22049))))

(assert (= (and start!92428 res!697826) b!1049469))

(declare-fun m!970855 () Bool)

(assert (=> start!92428 m!970855))

(declare-fun m!970857 () Bool)

(assert (=> b!1049469 m!970857))

(push 1)

(assert (not b!1049469))

(assert (not start!92428))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

