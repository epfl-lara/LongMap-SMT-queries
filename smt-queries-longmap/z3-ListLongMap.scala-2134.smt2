; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36064 () Bool)

(assert start!36064)

(declare-fun res!201363 () Bool)

(declare-fun e!221648 () Bool)

(assert (=> start!36064 (=> (not res!201363) (not e!221648))))

(declare-fun i!1487 () (_ BitVec 32))

(declare-datatypes ((array!20391 0))(
  ( (array!20392 (arr!9679 (Array (_ BitVec 32) (_ BitVec 64))) (size!10032 (_ BitVec 32))) )
))
(declare-fun a!4392 () array!20391)

(assert (=> start!36064 (= res!201363 (and (bvsge i!1487 #b00000000000000000000000000000000) (bvslt i!1487 (size!10032 a!4392))))))

(assert (=> start!36064 e!221648))

(assert (=> start!36064 true))

(declare-fun array_inv!7128 (array!20391) Bool)

(assert (=> start!36064 (array_inv!7128 a!4392)))

(declare-fun b!361884 () Bool)

(declare-fun res!201364 () Bool)

(assert (=> b!361884 (=> (not res!201364) (not e!221648))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!361884 (= res!201364 (validKeyInArray!0 (select (arr!9679 a!4392) i!1487)))))

(declare-fun b!361885 () Bool)

(assert (=> b!361885 (= e!221648 (and (bvslt (size!10032 a!4392) #b01111111111111111111111111111111) (bvsgt i!1487 (bvadd #b00000000000000000000000000000001 i!1487))))))

(assert (= (and start!36064 res!201363) b!361884))

(assert (= (and b!361884 res!201364) b!361885))

(declare-fun m!357967 () Bool)

(assert (=> start!36064 m!357967))

(declare-fun m!357969 () Bool)

(assert (=> b!361884 m!357969))

(assert (=> b!361884 m!357969))

(declare-fun m!357971 () Bool)

(assert (=> b!361884 m!357971))

(check-sat (not start!36064) (not b!361884))
(check-sat)
