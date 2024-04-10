; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134178 () Bool)

(assert start!134178)

(declare-fun res!1071365 () Bool)

(declare-fun e!873887 () Bool)

(assert (=> start!134178 (=> (not res!1071365) (not e!873887))))

(declare-fun from!2856 () (_ BitVec 32))

(declare-datatypes ((array!104710 0))(
  ( (array!104711 (arr!50538 (Array (_ BitVec 32) (_ BitVec 64))) (size!51088 (_ BitVec 32))) )
))
(declare-fun a!3481 () array!104710)

(assert (=> start!134178 (= res!1071365 (and (bvsge from!2856 #b00000000000000000000000000000000) (bvsle from!2856 (size!51088 a!3481)) (bvslt (size!51088 a!3481) #b01111111111111111111111111111111)))))

(assert (=> start!134178 e!873887))

(assert (=> start!134178 true))

(declare-fun array_inv!39265 (array!104710) Bool)

(assert (=> start!134178 (array_inv!39265 a!3481)))

(declare-fun b!1567674 () Bool)

(declare-fun res!1071361 () Bool)

(assert (=> b!1567674 (=> (not res!1071361) (not e!873887))))

(assert (=> b!1567674 (= res!1071361 (bvslt from!2856 (size!51088 a!3481)))))

(declare-fun b!1567675 () Bool)

(declare-fun res!1071364 () Bool)

(assert (=> b!1567675 (=> (not res!1071364) (not e!873887))))

(declare-datatypes ((List!36670 0))(
  ( (Nil!36667) (Cons!36666 (h!38113 (_ BitVec 64)) (t!51578 List!36670)) )
))
(declare-fun acc!619 () List!36670)

(declare-fun noDuplicate!2644 (List!36670) Bool)

(assert (=> b!1567675 (= res!1071364 (noDuplicate!2644 acc!619))))

(declare-fun b!1567676 () Bool)

(declare-fun e!873888 () Bool)

(assert (=> b!1567676 (= e!873887 e!873888)))

(declare-fun res!1071360 () Bool)

(assert (=> b!1567676 (=> (not res!1071360) (not e!873888))))

(declare-fun e!873889 () Bool)

(assert (=> b!1567676 (= res!1071360 e!873889)))

(declare-fun res!1071362 () Bool)

(assert (=> b!1567676 (=> res!1071362 e!873889)))

(declare-fun lt!673030 () Bool)

(assert (=> b!1567676 (= res!1071362 lt!673030)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1567676 (= lt!673030 (not (validKeyInArray!0 (select (arr!50538 a!3481) from!2856))))))

(declare-fun b!1567677 () Bool)

(declare-fun contains!10372 (List!36670 (_ BitVec 64)) Bool)

(assert (=> b!1567677 (= e!873889 (not (contains!10372 acc!619 (select (arr!50538 a!3481) from!2856))))))

(declare-fun b!1567678 () Bool)

(declare-fun res!1071366 () Bool)

(assert (=> b!1567678 (=> (not res!1071366) (not e!873887))))

(assert (=> b!1567678 (= res!1071366 (not (contains!10372 acc!619 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1567679 () Bool)

(declare-fun res!1071363 () Bool)

(assert (=> b!1567679 (=> (not res!1071363) (not e!873887))))

(assert (=> b!1567679 (= res!1071363 (not (contains!10372 acc!619 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1567680 () Bool)

(assert (=> b!1567680 (= e!873888 (and (not lt!673030) (bvslt (bvadd #b00000000000000000000000000000001 from!2856) #b00000000000000000000000000000000)))))

(assert (= (and start!134178 res!1071365) b!1567675))

(assert (= (and b!1567675 res!1071364) b!1567678))

(assert (= (and b!1567678 res!1071366) b!1567679))

(assert (= (and b!1567679 res!1071363) b!1567674))

(assert (= (and b!1567674 res!1071361) b!1567676))

(assert (= (and b!1567676 (not res!1071362)) b!1567677))

(assert (= (and b!1567676 res!1071360) b!1567680))

(declare-fun m!1442465 () Bool)

(assert (=> b!1567676 m!1442465))

(assert (=> b!1567676 m!1442465))

(declare-fun m!1442467 () Bool)

(assert (=> b!1567676 m!1442467))

(declare-fun m!1442469 () Bool)

(assert (=> b!1567679 m!1442469))

(declare-fun m!1442471 () Bool)

(assert (=> start!134178 m!1442471))

(assert (=> b!1567677 m!1442465))

(assert (=> b!1567677 m!1442465))

(declare-fun m!1442473 () Bool)

(assert (=> b!1567677 m!1442473))

(declare-fun m!1442475 () Bool)

(assert (=> b!1567678 m!1442475))

(declare-fun m!1442477 () Bool)

(assert (=> b!1567675 m!1442477))

(push 1)

(assert (not b!1567678))

(assert (not b!1567677))

(assert (not start!134178))

(assert (not b!1567675))

(assert (not b!1567679))

(assert (not b!1567676))

(check-sat)

