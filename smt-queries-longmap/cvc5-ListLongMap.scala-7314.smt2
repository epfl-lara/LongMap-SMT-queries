; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93492 () Bool)

(assert start!93492)

(declare-fun res!707316 () Bool)

(declare-fun e!602398 () Bool)

(assert (=> start!93492 (=> (not res!707316) (not e!602398))))

(declare-fun from!2850 () (_ BitVec 32))

(declare-datatypes ((array!66791 0))(
  ( (array!66792 (arr!32113 (Array (_ BitVec 32) (_ BitVec 64))) (size!32649 (_ BitVec 32))) )
))
(declare-fun a!3475 () array!66791)

(assert (=> start!93492 (= res!707316 (and (bvsge from!2850 #b00000000000000000000000000000000) (bvslt from!2850 (size!32649 a!3475)) (bvslt (size!32649 a!3475) #b01111111111111111111111111111111)))))

(assert (=> start!93492 e!602398))

(assert (=> start!93492 true))

(declare-fun array_inv!24893 (array!66791) Bool)

(assert (=> start!93492 (array_inv!24893 a!3475)))

(declare-fun b!1058742 () Bool)

(declare-fun res!707317 () Bool)

(assert (=> b!1058742 (=> (not res!707317) (not e!602398))))

(declare-fun k!2741 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66791 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1058742 (= res!707317 (arrayContainsKey!0 a!3475 k!2741 from!2850))))

(declare-fun b!1058743 () Bool)

(declare-fun res!707318 () Bool)

(assert (=> b!1058743 (=> (not res!707318) (not e!602398))))

(assert (=> b!1058743 (= res!707318 (and (not (= (select (arr!32113 a!3475) from!2850) k!2741)) (bvsge (bvadd #b00000000000000000000000000000001 from!2850) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!2850) (size!32649 a!3475))))))

(declare-fun b!1058744 () Bool)

(assert (=> b!1058744 (= e!602398 (not (arrayContainsKey!0 a!3475 k!2741 (bvadd #b00000000000000000000000000000001 from!2850))))))

(assert (= (and start!93492 res!707316) b!1058742))

(assert (= (and b!1058742 res!707317) b!1058743))

(assert (= (and b!1058743 res!707318) b!1058744))

(declare-fun m!978397 () Bool)

(assert (=> start!93492 m!978397))

(declare-fun m!978399 () Bool)

(assert (=> b!1058742 m!978399))

(declare-fun m!978401 () Bool)

(assert (=> b!1058743 m!978401))

(declare-fun m!978403 () Bool)

(assert (=> b!1058744 m!978403))

(push 1)

(assert (not b!1058744))

(assert (not b!1058742))

(assert (not start!93492))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!128633 () Bool)

(declare-fun res!707349 () Bool)

(declare-fun e!602423 () Bool)

(assert (=> d!128633 (=> res!707349 e!602423)))

(assert (=> d!128633 (= res!707349 (= (select (arr!32113 a!3475) (bvadd #b00000000000000000000000000000001 from!2850)) k!2741))))

(assert (=> d!128633 (= (arrayContainsKey!0 a!3475 k!2741 (bvadd #b00000000000000000000000000000001 from!2850)) e!602423)))

(declare-fun b!1058775 () Bool)

(declare-fun e!602424 () Bool)

(assert (=> b!1058775 (= e!602423 e!602424)))

