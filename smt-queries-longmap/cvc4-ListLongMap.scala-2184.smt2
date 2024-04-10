; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36442 () Bool)

(assert start!36442)

(declare-fun b!364392 () Bool)

(declare-fun res!203557 () Bool)

(declare-fun e!223074 () Bool)

(assert (=> b!364392 (=> (not res!203557) (not e!223074))))

(declare-datatypes ((array!20722 0))(
  ( (array!20723 (arr!9840 (Array (_ BitVec 32) (_ BitVec 64))) (size!10192 (_ BitVec 32))) )
))
(declare-fun a!4289 () array!20722)

(declare-fun i!1472 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!364392 (= res!203557 (not (validKeyInArray!0 (select (arr!9840 a!4289) i!1472))))))

(declare-fun b!364393 () Bool)

(declare-fun res!203553 () Bool)

(assert (=> b!364393 (=> (not res!203553) (not e!223074))))

(declare-fun from!3650 () (_ BitVec 32))

(assert (=> b!364393 (= res!203553 (and (bvslt (size!10192 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10192 a!4289)) (bvsge i!1472 from!3650)))))

(declare-fun b!364394 () Bool)

(assert (=> b!364394 (= e!223074 (and (bvsgt from!3650 #b00000000000000000000000000000000) (or (bvslt (bvadd #b00000000000000000000000000000001 i!1472) (bvsub from!3650 #b00000000000000000000000000000001)) (bvslt from!3650 (bvsub from!3650 #b00000000000000000000000000000001)) (bvsgt from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))))

(declare-fun b!364396 () Bool)

(declare-fun res!203556 () Bool)

(assert (=> b!364396 (=> (not res!203556) (not e!223074))))

(declare-fun k!2974 () (_ BitVec 64))

(assert (=> b!364396 (= res!203556 (validKeyInArray!0 k!2974))))

(declare-fun b!364395 () Bool)

(declare-fun res!203555 () Bool)

(assert (=> b!364395 (=> (not res!203555) (not e!223074))))

(declare-fun arrayCountValidKeys!0 (array!20722 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!364395 (= res!203555 (= (arrayCountValidKeys!0 (array!20723 (store (arr!9840 a!4289) i!1472 k!2974) (size!10192 a!4289)) from!3650 (bvadd #b00000000000000000000000000000001 i!1472)) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))))

(declare-fun res!203554 () Bool)

(assert (=> start!36442 (=> (not res!203554) (not e!223074))))

(assert (=> start!36442 (= res!203554 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10192 a!4289))))))

(assert (=> start!36442 e!223074))

(assert (=> start!36442 true))

(declare-fun array_inv!7282 (array!20722) Bool)

(assert (=> start!36442 (array_inv!7282 a!4289)))

(assert (= (and start!36442 res!203554) b!364392))

(assert (= (and b!364392 res!203557) b!364396))

(assert (= (and b!364396 res!203556) b!364393))

(assert (= (and b!364393 res!203553) b!364395))

(assert (= (and b!364395 res!203555) b!364394))

(declare-fun m!361899 () Bool)

(assert (=> b!364392 m!361899))

(assert (=> b!364392 m!361899))

(declare-fun m!361901 () Bool)

(assert (=> b!364392 m!361901))

(declare-fun m!361903 () Bool)

(assert (=> b!364396 m!361903))

(declare-fun m!361905 () Bool)

(assert (=> b!364395 m!361905))

(declare-fun m!361907 () Bool)

(assert (=> b!364395 m!361907))

(declare-fun m!361909 () Bool)

(assert (=> b!364395 m!361909))

(declare-fun m!361911 () Bool)

(assert (=> start!36442 m!361911))

(push 1)

(assert (not b!364395))

(assert (not start!36442))

(assert (not b!364392))

(assert (not b!364396))

(check-sat)

(pop 1)

(push 1)

(check-sat)

