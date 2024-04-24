; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92440 () Bool)

(assert start!92440)

(declare-fun res!697880 () Bool)

(declare-fun e!595341 () Bool)

(assert (=> start!92440 (=> (not res!697880) (not e!595341))))

(declare-fun i!1381 () (_ BitVec 32))

(declare-datatypes ((array!66083 0))(
  ( (array!66084 (arr!31776 (Array (_ BitVec 32) (_ BitVec 64))) (size!32313 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66083)

(assert (=> start!92440 (= res!697880 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32313 a!3488)) (bvslt (size!32313 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92440 e!595341))

(assert (=> start!92440 true))

(declare-fun array_inv!24558 (array!66083) Bool)

(assert (=> start!92440 (array_inv!24558 a!3488)))

(declare-fun b!1049523 () Bool)

(assert (=> b!1049523 (= e!595341 false)))

(declare-fun lt!463652 () Bool)

(declare-datatypes ((List!22058 0))(
  ( (Nil!22055) (Cons!22054 (h!23272 (_ BitVec 64)) (t!31357 List!22058)) )
))
(declare-fun arrayNoDuplicates!0 (array!66083 (_ BitVec 32) List!22058) Bool)

(assert (=> b!1049523 (= lt!463652 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22055))))

(assert (= (and start!92440 res!697880) b!1049523))

(declare-fun m!970903 () Bool)

(assert (=> start!92440 m!970903))

(declare-fun m!970905 () Bool)

(assert (=> b!1049523 m!970905))

(push 1)

(assert (not start!92440))

(assert (not b!1049523))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

