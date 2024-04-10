; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116936 () Bool)

(assert start!116936)

(declare-fun res!920379 () Bool)

(declare-fun e!780393 () Bool)

(assert (=> start!116936 (=> (not res!920379) (not e!780393))))

(declare-fun to!375 () (_ BitVec 32))

(declare-fun from!3579 () (_ BitVec 32))

(declare-datatypes ((array!93605 0))(
  ( (array!93606 (arr!45206 (Array (_ BitVec 32) (_ BitVec 64))) (size!45756 (_ BitVec 32))) )
))
(declare-fun a!4212 () array!93605)

(assert (=> start!116936 (= res!920379 (and (bvslt (size!45756 a!4212) #b01111111111111111111111111111111) (bvsge from!3579 #b00000000000000000000000000000000) (bvsge to!375 from!3579) (bvslt to!375 (size!45756 a!4212))))))

(assert (=> start!116936 e!780393))

(declare-fun array_inv!34234 (array!93605) Bool)

(assert (=> start!116936 (array_inv!34234 a!4212)))

(assert (=> start!116936 true))

(declare-fun b!1377657 () Bool)

(declare-fun res!920380 () Bool)

(assert (=> b!1377657 (=> (not res!920380) (not e!780393))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1377657 (= res!920380 (not (validKeyInArray!0 (select (arr!45206 a!4212) to!375))))))

(declare-fun b!1377658 () Bool)

(assert (=> b!1377658 (= e!780393 (or (bvslt (bvadd #b00000000000000000000000000000001 to!375) from!3579) (bvsgt to!375 (bvadd #b00000000000000000000000000000001 to!375))))))

(assert (= (and start!116936 res!920379) b!1377657))

(assert (= (and b!1377657 res!920380) b!1377658))

(declare-fun m!1262051 () Bool)

(assert (=> start!116936 m!1262051))

(declare-fun m!1262053 () Bool)

(assert (=> b!1377657 m!1262053))

(assert (=> b!1377657 m!1262053))

(declare-fun m!1262055 () Bool)

(assert (=> b!1377657 m!1262055))

(push 1)

(assert (not b!1377657))

(assert (not start!116936))

(check-sat)

(pop 1)

(push 1)

(check-sat)

