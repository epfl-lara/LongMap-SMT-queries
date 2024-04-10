; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36544 () Bool)

(assert start!36544)

(declare-datatypes ((array!20803 0))(
  ( (array!20804 (arr!9879 (Array (_ BitVec 32) (_ BitVec 64))) (size!10231 (_ BitVec 32))) )
))
(declare-fun lt!169147 () array!20803)

(declare-fun e!223481 () Bool)

(declare-fun b!365108 () Bool)

(declare-fun i!1472 () (_ BitVec 32))

(declare-fun a!4289 () array!20803)

(declare-fun arrayCountValidKeys!0 (array!20803 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!365108 (= e!223481 (not (= (arrayCountValidKeys!0 lt!169147 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1472)) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 a!4289 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1472))))))))

(declare-fun b!365109 () Bool)

(declare-fun e!223482 () Bool)

(assert (=> b!365109 (= e!223482 e!223481)))

(declare-fun res!204178 () Bool)

(assert (=> b!365109 (=> (not res!204178) (not e!223481))))

(declare-fun from!3650 () (_ BitVec 32))

(assert (=> b!365109 (= res!204178 (= (arrayCountValidKeys!0 lt!169147 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))))

(declare-fun k!2974 () (_ BitVec 64))

(assert (=> b!365109 (= lt!169147 (array!20804 (store (arr!9879 a!4289) i!1472 k!2974) (size!10231 a!4289)))))

(declare-fun b!365110 () Bool)

(declare-fun res!204177 () Bool)

(assert (=> b!365110 (=> (not res!204177) (not e!223481))))

(assert (=> b!365110 (= res!204177 (bvsle from!3650 #b00000000000000000000000000000000))))

(declare-fun res!204173 () Bool)

(assert (=> start!36544 (=> (not res!204173) (not e!223482))))

(assert (=> start!36544 (= res!204173 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10231 a!4289))))))

(assert (=> start!36544 e!223482))

(assert (=> start!36544 true))

(declare-fun array_inv!7321 (array!20803) Bool)

(assert (=> start!36544 (array_inv!7321 a!4289)))

(declare-fun b!365111 () Bool)

(declare-fun res!204175 () Bool)

(assert (=> b!365111 (=> (not res!204175) (not e!223482))))

(assert (=> b!365111 (= res!204175 (and (bvslt (size!10231 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10231 a!4289)) (bvsge i!1472 from!3650)))))

(declare-fun b!365112 () Bool)

(declare-fun res!204176 () Bool)

(assert (=> b!365112 (=> (not res!204176) (not e!223482))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!365112 (= res!204176 (validKeyInArray!0 k!2974))))

(declare-fun b!365113 () Bool)

(declare-fun res!204174 () Bool)

(assert (=> b!365113 (=> (not res!204174) (not e!223482))))

(assert (=> b!365113 (= res!204174 (not (validKeyInArray!0 (select (arr!9879 a!4289) i!1472))))))

(assert (= (and start!36544 res!204173) b!365113))

(assert (= (and b!365113 res!204174) b!365112))

(assert (= (and b!365112 res!204176) b!365111))

(assert (= (and b!365111 res!204175) b!365109))

(assert (= (and b!365109 res!204178) b!365110))

(assert (= (and b!365110 res!204177) b!365108))

(declare-fun m!362945 () Bool)

(assert (=> b!365112 m!362945))

(declare-fun m!362947 () Bool)

(assert (=> b!365108 m!362947))

(declare-fun m!362949 () Bool)

(assert (=> b!365108 m!362949))

(declare-fun m!362951 () Bool)

(assert (=> b!365113 m!362951))

(assert (=> b!365113 m!362951))

(declare-fun m!362953 () Bool)

(assert (=> b!365113 m!362953))

(declare-fun m!362955 () Bool)

(assert (=> start!36544 m!362955))

(declare-fun m!362957 () Bool)

(assert (=> b!365109 m!362957))

(declare-fun m!362959 () Bool)

(assert (=> b!365109 m!362959))

(declare-fun m!362961 () Bool)

(assert (=> b!365109 m!362961))

(push 1)

(assert (not b!365113))

(assert (not b!365108))

(assert (not start!36544))

(assert (not b!365112))

(assert (not b!365109))

(check-sat)

(pop 1)

(push 1)

(check-sat)

