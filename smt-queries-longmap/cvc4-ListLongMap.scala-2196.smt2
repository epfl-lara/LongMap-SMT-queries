; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36538 () Bool)

(assert start!36538)

(declare-fun b!365058 () Bool)

(declare-fun res!204121 () Bool)

(declare-fun e!223456 () Bool)

(assert (=> b!365058 (=> (not res!204121) (not e!223456))))

(declare-fun from!3650 () (_ BitVec 32))

(declare-fun i!1472 () (_ BitVec 32))

(declare-datatypes ((array!20797 0))(
  ( (array!20798 (arr!9876 (Array (_ BitVec 32) (_ BitVec 64))) (size!10228 (_ BitVec 32))) )
))
(declare-fun a!4289 () array!20797)

(assert (=> b!365058 (= res!204121 (and (bvslt (size!10228 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10228 a!4289)) (bvsge i!1472 from!3650)))))

(declare-fun res!204124 () Bool)

(assert (=> start!36538 (=> (not res!204124) (not e!223456))))

(assert (=> start!36538 (= res!204124 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10228 a!4289))))))

(assert (=> start!36538 e!223456))

(assert (=> start!36538 true))

(declare-fun array_inv!7318 (array!20797) Bool)

(assert (=> start!36538 (array_inv!7318 a!4289)))

(declare-fun b!365059 () Bool)

(assert (=> b!365059 (= e!223456 false)))

(declare-fun k!2974 () (_ BitVec 64))

(declare-fun lt!169137 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!20797 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!365059 (= lt!169137 (arrayCountValidKeys!0 (array!20798 (store (arr!9876 a!4289) i!1472 k!2974) (size!10228 a!4289)) from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun lt!169138 () (_ BitVec 32))

(assert (=> b!365059 (= lt!169138 (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun b!365057 () Bool)

(declare-fun res!204122 () Bool)

(assert (=> b!365057 (=> (not res!204122) (not e!223456))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!365057 (= res!204122 (validKeyInArray!0 k!2974))))

(declare-fun b!365056 () Bool)

(declare-fun res!204123 () Bool)

(assert (=> b!365056 (=> (not res!204123) (not e!223456))))

(assert (=> b!365056 (= res!204123 (not (validKeyInArray!0 (select (arr!9876 a!4289) i!1472))))))

(assert (= (and start!36538 res!204124) b!365056))

(assert (= (and b!365056 res!204123) b!365057))

(assert (= (and b!365057 res!204122) b!365058))

(assert (= (and b!365058 res!204121) b!365059))

(declare-fun m!362895 () Bool)

(assert (=> start!36538 m!362895))

(declare-fun m!362897 () Bool)

(assert (=> b!365059 m!362897))

(declare-fun m!362899 () Bool)

(assert (=> b!365059 m!362899))

(declare-fun m!362901 () Bool)

(assert (=> b!365059 m!362901))

(declare-fun m!362903 () Bool)

(assert (=> b!365057 m!362903))

(declare-fun m!362905 () Bool)

(assert (=> b!365056 m!362905))

(assert (=> b!365056 m!362905))

(declare-fun m!362907 () Bool)

(assert (=> b!365056 m!362907))

(push 1)

(assert (not b!365056))

(assert (not b!365057))

(assert (not b!365059))

(assert (not start!36538))

(check-sat)

