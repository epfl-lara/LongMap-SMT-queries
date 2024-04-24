; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93712 () Bool)

(assert start!93712)

(declare-fun res!707795 () Bool)

(declare-fun e!603210 () Bool)

(assert (=> start!93712 (=> (not res!707795) (not e!603210))))

(declare-fun i!1381 () (_ BitVec 32))

(declare-datatypes ((array!66830 0))(
  ( (array!66831 (arr!32127 (Array (_ BitVec 32) (_ BitVec 64))) (size!32664 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66830)

(assert (=> start!93712 (= res!707795 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32664 a!3488)) (bvslt (size!32664 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93712 e!603210))

(assert (=> start!93712 true))

(declare-fun array_inv!24909 (array!66830) Bool)

(assert (=> start!93712 (array_inv!24909 a!3488)))

(declare-fun b!1060026 () Bool)

(assert (=> b!1060026 (= e!603210 false)))

(declare-fun lt!467555 () Bool)

(declare-datatypes ((List!22409 0))(
  ( (Nil!22406) (Cons!22405 (h!23623 (_ BitVec 64)) (t!31708 List!22409)) )
))
(declare-fun arrayNoDuplicates!0 (array!66830 (_ BitVec 32) List!22409) Bool)

(assert (=> b!1060026 (= lt!467555 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22406))))

(assert (= (and start!93712 res!707795) b!1060026))

(declare-fun m!980041 () Bool)

(assert (=> start!93712 m!980041))

(declare-fun m!980043 () Bool)

(assert (=> b!1060026 m!980043))

(push 1)

(assert (not b!1060026))

(assert (not start!93712))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

