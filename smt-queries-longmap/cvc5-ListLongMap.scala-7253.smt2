; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92818 () Bool)

(assert start!92818)

(declare-fun res!702596 () Bool)

(declare-fun e!598752 () Bool)

(assert (=> start!92818 (=> (not res!702596) (not e!598752))))

(declare-fun i!1381 () (_ BitVec 32))

(declare-datatypes ((array!66434 0))(
  ( (array!66435 (arr!31950 (Array (_ BitVec 32) (_ BitVec 64))) (size!32487 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66434)

(assert (=> start!92818 (= res!702596 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32487 a!3488)) (bvslt (size!32487 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92818 e!598752))

(assert (=> start!92818 true))

(declare-fun array_inv!24732 (array!66434) Bool)

(assert (=> start!92818 (array_inv!24732 a!3488)))

(declare-fun b!1054275 () Bool)

(assert (=> b!1054275 (= e!598752 false)))

(declare-fun lt!465533 () Bool)

(declare-datatypes ((List!22232 0))(
  ( (Nil!22229) (Cons!22228 (h!23446 (_ BitVec 64)) (t!31531 List!22232)) )
))
(declare-fun arrayNoDuplicates!0 (array!66434 (_ BitVec 32) List!22232) Bool)

(assert (=> b!1054275 (= lt!465533 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22229))))

(assert (= (and start!92818 res!702596) b!1054275))

(declare-fun m!975025 () Bool)

(assert (=> start!92818 m!975025))

(declare-fun m!975027 () Bool)

(assert (=> b!1054275 m!975027))

(push 1)

(assert (not b!1054275))

(assert (not start!92818))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

