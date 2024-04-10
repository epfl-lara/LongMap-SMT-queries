; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36540 () Bool)

(assert start!36540)

(declare-fun b!365072 () Bool)

(declare-fun e!223463 () Bool)

(declare-fun e!223465 () Bool)

(assert (=> b!365072 (= e!223463 e!223465)))

(declare-fun res!204140 () Bool)

(assert (=> b!365072 (=> (not res!204140) (not e!223465))))

(declare-fun from!3650 () (_ BitVec 32))

(declare-fun i!1472 () (_ BitVec 32))

(declare-datatypes ((array!20799 0))(
  ( (array!20800 (arr!9877 (Array (_ BitVec 32) (_ BitVec 64))) (size!10229 (_ BitVec 32))) )
))
(declare-fun a!4289 () array!20799)

(declare-fun lt!169141 () array!20799)

(declare-fun arrayCountValidKeys!0 (array!20799 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!365072 (= res!204140 (= (arrayCountValidKeys!0 lt!169141 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))))

(declare-fun k!2974 () (_ BitVec 64))

(assert (=> b!365072 (= lt!169141 (array!20800 (store (arr!9877 a!4289) i!1472 k!2974) (size!10229 a!4289)))))

(declare-fun b!365073 () Bool)

(declare-fun res!204139 () Bool)

(assert (=> b!365073 (=> (not res!204139) (not e!223465))))

(assert (=> b!365073 (= res!204139 (bvsle from!3650 #b00000000000000000000000000000000))))

(declare-fun b!365074 () Bool)

(declare-fun res!204138 () Bool)

(assert (=> b!365074 (=> (not res!204138) (not e!223463))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!365074 (= res!204138 (not (validKeyInArray!0 (select (arr!9877 a!4289) i!1472))))))

(declare-fun b!365075 () Bool)

(assert (=> b!365075 (= e!223465 (not (= (arrayCountValidKeys!0 lt!169141 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1472)) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 a!4289 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1472))))))))

(declare-fun res!204137 () Bool)

(assert (=> start!36540 (=> (not res!204137) (not e!223463))))

(assert (=> start!36540 (= res!204137 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10229 a!4289))))))

(assert (=> start!36540 e!223463))

(assert (=> start!36540 true))

(declare-fun array_inv!7319 (array!20799) Bool)

(assert (=> start!36540 (array_inv!7319 a!4289)))

(declare-fun b!365076 () Bool)

(declare-fun res!204142 () Bool)

(assert (=> b!365076 (=> (not res!204142) (not e!223463))))

(assert (=> b!365076 (= res!204142 (validKeyInArray!0 k!2974))))

(declare-fun b!365077 () Bool)

(declare-fun res!204141 () Bool)

(assert (=> b!365077 (=> (not res!204141) (not e!223463))))

(assert (=> b!365077 (= res!204141 (and (bvslt (size!10229 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10229 a!4289)) (bvsge i!1472 from!3650)))))

(assert (= (and start!36540 res!204137) b!365074))

(assert (= (and b!365074 res!204138) b!365076))

(assert (= (and b!365076 res!204142) b!365077))

(assert (= (and b!365077 res!204141) b!365072))

(assert (= (and b!365072 res!204140) b!365073))

(assert (= (and b!365073 res!204139) b!365075))

(declare-fun m!362909 () Bool)

(assert (=> b!365075 m!362909))

(declare-fun m!362911 () Bool)

(assert (=> b!365075 m!362911))

(declare-fun m!362913 () Bool)

(assert (=> start!36540 m!362913))

(declare-fun m!362915 () Bool)

(assert (=> b!365072 m!362915))

(declare-fun m!362917 () Bool)

(assert (=> b!365072 m!362917))

(declare-fun m!362919 () Bool)

(assert (=> b!365072 m!362919))

(declare-fun m!362921 () Bool)

(assert (=> b!365074 m!362921))

(assert (=> b!365074 m!362921))

(declare-fun m!362923 () Bool)

(assert (=> b!365074 m!362923))

(declare-fun m!362925 () Bool)

(assert (=> b!365076 m!362925))

(push 1)

(assert (not b!365075))

(assert (not b!365072))

(assert (not start!36540))

(assert (not b!365074))

(assert (not b!365076))

(check-sat)

(pop 1)

(push 1)

(check-sat)

