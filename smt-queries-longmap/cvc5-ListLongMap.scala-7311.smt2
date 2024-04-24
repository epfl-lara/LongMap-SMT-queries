; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93706 () Bool)

(assert start!93706)

(declare-fun res!707786 () Bool)

(declare-fun e!603192 () Bool)

(assert (=> start!93706 (=> (not res!707786) (not e!603192))))

(declare-fun i!1381 () (_ BitVec 32))

(declare-datatypes ((array!66824 0))(
  ( (array!66825 (arr!32124 (Array (_ BitVec 32) (_ BitVec 64))) (size!32661 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66824)

(assert (=> start!93706 (= res!707786 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32661 a!3488)) (bvslt (size!32661 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93706 e!603192))

(assert (=> start!93706 true))

(declare-fun array_inv!24906 (array!66824) Bool)

(assert (=> start!93706 (array_inv!24906 a!3488)))

(declare-fun b!1060017 () Bool)

(assert (=> b!1060017 (= e!603192 false)))

(declare-fun lt!467546 () Bool)

(declare-datatypes ((List!22406 0))(
  ( (Nil!22403) (Cons!22402 (h!23620 (_ BitVec 64)) (t!31705 List!22406)) )
))
(declare-fun arrayNoDuplicates!0 (array!66824 (_ BitVec 32) List!22406) Bool)

(assert (=> b!1060017 (= lt!467546 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22403))))

(assert (= (and start!93706 res!707786) b!1060017))

(declare-fun m!980029 () Bool)

(assert (=> start!93706 m!980029))

(declare-fun m!980031 () Bool)

(assert (=> b!1060017 m!980031))

(push 1)

(assert (not b!1060017))

(assert (not start!93706))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

