; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7068 () Bool)

(assert start!7068)

(declare-fun res!26643 () Bool)

(declare-fun e!28912 () Bool)

(assert (=> start!7068 (=> (not res!26643) (not e!28912))))

(declare-datatypes ((array!3051 0))(
  ( (array!3052 (arr!1466 (Array (_ BitVec 32) (_ BitVec 64))) (size!1688 (_ BitVec 32))) )
))
(declare-fun a!4401 () array!3051)

(declare-fun i!1488 () (_ BitVec 32))

(declare-fun k!2989 () (_ BitVec 64))

(assert (=> start!7068 (= res!26643 (and (bvslt (size!1688 a!4401) #b01111111111111111111111111111111) (bvsge i!1488 #b00000000000000000000000000000000) (bvslt i!1488 (size!1688 a!4401)) (= (select (arr!1466 a!4401) i!1488) k!2989)))))

(assert (=> start!7068 e!28912))

(declare-fun array_inv!878 (array!3051) Bool)

(assert (=> start!7068 (array_inv!878 a!4401)))

(assert (=> start!7068 true))

(declare-fun b!45444 () Bool)

(declare-fun arrayContainsKey!0 (array!3051 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!45444 (= e!28912 (not (arrayContainsKey!0 a!4401 k!2989 i!1488)))))

(assert (= (and start!7068 res!26643) b!45444))

(declare-fun m!40001 () Bool)

(assert (=> start!7068 m!40001))

(declare-fun m!40003 () Bool)

(assert (=> start!7068 m!40003))

(declare-fun m!40005 () Bool)

(assert (=> b!45444 m!40005))

(push 1)

(assert (not start!7068))

(assert (not b!45444))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

