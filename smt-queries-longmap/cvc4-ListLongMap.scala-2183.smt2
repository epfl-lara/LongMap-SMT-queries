; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36436 () Bool)

(assert start!36436)

(declare-fun res!203510 () Bool)

(declare-fun e!223057 () Bool)

(assert (=> start!36436 (=> (not res!203510) (not e!223057))))

(declare-fun i!1472 () (_ BitVec 32))

(declare-datatypes ((array!20716 0))(
  ( (array!20717 (arr!9837 (Array (_ BitVec 32) (_ BitVec 64))) (size!10189 (_ BitVec 32))) )
))
(declare-fun a!4289 () array!20716)

(assert (=> start!36436 (= res!203510 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10189 a!4289))))))

(assert (=> start!36436 e!223057))

(assert (=> start!36436 true))

(declare-fun array_inv!7279 (array!20716) Bool)

(assert (=> start!36436 (array_inv!7279 a!4289)))

(declare-fun b!364348 () Bool)

(declare-fun res!203512 () Bool)

(assert (=> b!364348 (=> (not res!203512) (not e!223057))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!364348 (= res!203512 (not (validKeyInArray!0 (select (arr!9837 a!4289) i!1472))))))

(declare-fun b!364349 () Bool)

(declare-fun res!203511 () Bool)

(assert (=> b!364349 (=> (not res!203511) (not e!223057))))

(declare-fun k!2974 () (_ BitVec 64))

(assert (=> b!364349 (= res!203511 (validKeyInArray!0 k!2974))))

(declare-fun b!364350 () Bool)

(declare-fun res!203509 () Bool)

(assert (=> b!364350 (=> (not res!203509) (not e!223057))))

(declare-fun from!3650 () (_ BitVec 32))

(assert (=> b!364350 (= res!203509 (and (bvslt (size!10189 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10189 a!4289)) (bvsge i!1472 from!3650)))))

(declare-fun b!364351 () Bool)

(assert (=> b!364351 (= e!223057 false)))

(declare-fun lt!168480 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!20716 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!364351 (= lt!168480 (arrayCountValidKeys!0 (array!20717 (store (arr!9837 a!4289) i!1472 k!2974) (size!10189 a!4289)) from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun lt!168481 () (_ BitVec 32))

(assert (=> b!364351 (= lt!168481 (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (= (and start!36436 res!203510) b!364348))

(assert (= (and b!364348 res!203512) b!364349))

(assert (= (and b!364349 res!203511) b!364350))

(assert (= (and b!364350 res!203509) b!364351))

(declare-fun m!361857 () Bool)

(assert (=> start!36436 m!361857))

(declare-fun m!361859 () Bool)

(assert (=> b!364348 m!361859))

(assert (=> b!364348 m!361859))

(declare-fun m!361861 () Bool)

(assert (=> b!364348 m!361861))

(declare-fun m!361863 () Bool)

(assert (=> b!364349 m!361863))

(declare-fun m!361865 () Bool)

(assert (=> b!364351 m!361865))

(declare-fun m!361867 () Bool)

(assert (=> b!364351 m!361867))

(declare-fun m!361869 () Bool)

(assert (=> b!364351 m!361869))

(push 1)

(assert (not b!364349))

(assert (not b!364348))

(assert (not start!36436))

(assert (not b!364351))

(check-sat)

(pop 1)

(push 1)

