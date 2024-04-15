; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36528 () Bool)

(assert start!36528)

(declare-fun b!364820 () Bool)

(declare-fun res!204030 () Bool)

(declare-fun e!223300 () Bool)

(assert (=> b!364820 (=> (not res!204030) (not e!223300))))

(declare-fun from!3650 () (_ BitVec 32))

(assert (=> b!364820 (= res!204030 (bvsle from!3650 #b00000000000000000000000000000000))))

(declare-fun b!364821 () Bool)

(declare-fun res!204027 () Bool)

(declare-fun e!223299 () Bool)

(assert (=> b!364821 (=> (not res!204027) (not e!223299))))

(declare-datatypes ((array!20783 0))(
  ( (array!20784 (arr!9869 (Array (_ BitVec 32) (_ BitVec 64))) (size!10222 (_ BitVec 32))) )
))
(declare-fun a!4289 () array!20783)

(declare-fun i!1472 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!364821 (= res!204027 (not (validKeyInArray!0 (select (arr!9869 a!4289) i!1472))))))

(declare-fun lt!168910 () array!20783)

(declare-fun b!364822 () Bool)

(declare-fun arrayCountValidKeys!0 (array!20783 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!364822 (= e!223300 (not (= (arrayCountValidKeys!0 lt!168910 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1472)) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 a!4289 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1472))))))))

(declare-fun b!364823 () Bool)

(declare-fun res!204029 () Bool)

(assert (=> b!364823 (=> (not res!204029) (not e!223299))))

(assert (=> b!364823 (= res!204029 (and (bvslt (size!10222 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10222 a!4289)) (bvsge i!1472 from!3650)))))

(declare-fun b!364824 () Bool)

(declare-fun res!204028 () Bool)

(assert (=> b!364824 (=> (not res!204028) (not e!223299))))

(declare-fun k!2974 () (_ BitVec 64))

(assert (=> b!364824 (= res!204028 (validKeyInArray!0 k!2974))))

(declare-fun b!364819 () Bool)

(assert (=> b!364819 (= e!223299 e!223300)))

(declare-fun res!204026 () Bool)

(assert (=> b!364819 (=> (not res!204026) (not e!223300))))

(assert (=> b!364819 (= res!204026 (= (arrayCountValidKeys!0 lt!168910 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))))

(assert (=> b!364819 (= lt!168910 (array!20784 (store (arr!9869 a!4289) i!1472 k!2974) (size!10222 a!4289)))))

(declare-fun res!204031 () Bool)

(assert (=> start!36528 (=> (not res!204031) (not e!223299))))

(assert (=> start!36528 (= res!204031 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10222 a!4289))))))

(assert (=> start!36528 e!223299))

(assert (=> start!36528 true))

(declare-fun array_inv!7318 (array!20783) Bool)

(assert (=> start!36528 (array_inv!7318 a!4289)))

(assert (= (and start!36528 res!204031) b!364821))

(assert (= (and b!364821 res!204027) b!364824))

(assert (= (and b!364824 res!204028) b!364823))

(assert (= (and b!364823 res!204029) b!364819))

(assert (= (and b!364819 res!204026) b!364820))

(assert (= (and b!364820 res!204030) b!364822))

(declare-fun m!362203 () Bool)

(assert (=> b!364819 m!362203))

(declare-fun m!362205 () Bool)

(assert (=> b!364819 m!362205))

(declare-fun m!362207 () Bool)

(assert (=> b!364819 m!362207))

(declare-fun m!362209 () Bool)

(assert (=> b!364824 m!362209))

(declare-fun m!362211 () Bool)

(assert (=> b!364822 m!362211))

(declare-fun m!362213 () Bool)

(assert (=> b!364822 m!362213))

(declare-fun m!362215 () Bool)

(assert (=> b!364821 m!362215))

(assert (=> b!364821 m!362215))

(declare-fun m!362217 () Bool)

(assert (=> b!364821 m!362217))

(declare-fun m!362219 () Bool)

(assert (=> start!36528 m!362219))

(push 1)

(assert (not b!364824))

(assert (not b!364822))

(assert (not start!36528))

(assert (not b!364819))

(assert (not b!364821))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

