; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36432 () Bool)

(assert start!36432)

(declare-fun res!203486 () Bool)

(declare-fun e!223044 () Bool)

(assert (=> start!36432 (=> (not res!203486) (not e!223044))))

(declare-fun i!1472 () (_ BitVec 32))

(declare-datatypes ((array!20712 0))(
  ( (array!20713 (arr!9835 (Array (_ BitVec 32) (_ BitVec 64))) (size!10187 (_ BitVec 32))) )
))
(declare-fun a!4289 () array!20712)

(assert (=> start!36432 (= res!203486 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10187 a!4289))))))

(assert (=> start!36432 e!223044))

(assert (=> start!36432 true))

(declare-fun array_inv!7277 (array!20712) Bool)

(assert (=> start!36432 (array_inv!7277 a!4289)))

(declare-fun b!364326 () Bool)

(declare-fun res!203487 () Bool)

(assert (=> b!364326 (=> (not res!203487) (not e!223044))))

(declare-fun from!3650 () (_ BitVec 32))

(assert (=> b!364326 (= res!203487 (and (bvslt (size!10187 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10187 a!4289)) (bvsge i!1472 from!3650)))))

(declare-fun b!364325 () Bool)

(declare-fun res!203485 () Bool)

(assert (=> b!364325 (=> (not res!203485) (not e!223044))))

(declare-fun k!2974 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!364325 (= res!203485 (validKeyInArray!0 k!2974))))

(declare-fun b!364327 () Bool)

(assert (=> b!364327 (= e!223044 false)))

(declare-fun lt!168469 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!20712 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!364327 (= lt!168469 (arrayCountValidKeys!0 (array!20713 (store (arr!9835 a!4289) i!1472 k!2974) (size!10187 a!4289)) from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun lt!168468 () (_ BitVec 32))

(assert (=> b!364327 (= lt!168468 (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun b!364324 () Bool)

(declare-fun res!203488 () Bool)

(assert (=> b!364324 (=> (not res!203488) (not e!223044))))

(assert (=> b!364324 (= res!203488 (not (validKeyInArray!0 (select (arr!9835 a!4289) i!1472))))))

(assert (= (and start!36432 res!203486) b!364324))

(assert (= (and b!364324 res!203488) b!364325))

(assert (= (and b!364325 res!203485) b!364326))

(assert (= (and b!364326 res!203487) b!364327))

(declare-fun m!361829 () Bool)

(assert (=> start!36432 m!361829))

(declare-fun m!361831 () Bool)

(assert (=> b!364325 m!361831))

(declare-fun m!361833 () Bool)

(assert (=> b!364327 m!361833))

(declare-fun m!361835 () Bool)

(assert (=> b!364327 m!361835))

(declare-fun m!361837 () Bool)

(assert (=> b!364327 m!361837))

(declare-fun m!361839 () Bool)

(assert (=> b!364324 m!361839))

(assert (=> b!364324 m!361839))

(declare-fun m!361841 () Bool)

(assert (=> b!364324 m!361841))

(push 1)

(assert (not start!36432))

(assert (not b!364327))

(assert (not b!364325))

(assert (not b!364324))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

