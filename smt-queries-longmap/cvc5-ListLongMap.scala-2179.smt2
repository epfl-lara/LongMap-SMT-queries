; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36408 () Bool)

(assert start!36408)

(declare-fun b!364164 () Bool)

(declare-fun e!222973 () Bool)

(declare-fun from!3650 () (_ BitVec 32))

(declare-fun i!1472 () (_ BitVec 32))

(assert (=> b!364164 (= e!222973 (and (bvsle from!3650 #b00000000000000000000000000000000) (bvsgt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1472))))))

(declare-fun res!203327 () Bool)

(assert (=> start!36408 (=> (not res!203327) (not e!222973))))

(declare-datatypes ((array!20688 0))(
  ( (array!20689 (arr!9823 (Array (_ BitVec 32) (_ BitVec 64))) (size!10175 (_ BitVec 32))) )
))
(declare-fun a!4289 () array!20688)

(assert (=> start!36408 (= res!203327 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10175 a!4289))))))

(assert (=> start!36408 e!222973))

(assert (=> start!36408 true))

(declare-fun array_inv!7265 (array!20688) Bool)

(assert (=> start!36408 (array_inv!7265 a!4289)))

(declare-fun b!364165 () Bool)

(declare-fun res!203329 () Bool)

(assert (=> b!364165 (=> (not res!203329) (not e!222973))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!364165 (= res!203329 (not (validKeyInArray!0 (select (arr!9823 a!4289) i!1472))))))

(declare-fun b!364166 () Bool)

(declare-fun res!203325 () Bool)

(assert (=> b!364166 (=> (not res!203325) (not e!222973))))

(assert (=> b!364166 (= res!203325 (and (bvslt (size!10175 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10175 a!4289)) (bvsge i!1472 from!3650)))))

(declare-fun b!364167 () Bool)

(declare-fun res!203326 () Bool)

(assert (=> b!364167 (=> (not res!203326) (not e!222973))))

(declare-fun k!2974 () (_ BitVec 64))

(declare-fun arrayCountValidKeys!0 (array!20688 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!364167 (= res!203326 (= (arrayCountValidKeys!0 (array!20689 (store (arr!9823 a!4289) i!1472 k!2974) (size!10175 a!4289)) from!3650 (bvadd #b00000000000000000000000000000001 i!1472)) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))))

(declare-fun b!364168 () Bool)

(declare-fun res!203328 () Bool)

(assert (=> b!364168 (=> (not res!203328) (not e!222973))))

(assert (=> b!364168 (= res!203328 (validKeyInArray!0 k!2974))))

(assert (= (and start!36408 res!203327) b!364165))

(assert (= (and b!364165 res!203329) b!364168))

(assert (= (and b!364168 res!203328) b!364166))

(assert (= (and b!364166 res!203325) b!364167))

(assert (= (and b!364167 res!203326) b!364164))

(declare-fun m!361661 () Bool)

(assert (=> start!36408 m!361661))

(declare-fun m!361663 () Bool)

(assert (=> b!364165 m!361663))

(assert (=> b!364165 m!361663))

(declare-fun m!361665 () Bool)

(assert (=> b!364165 m!361665))

(declare-fun m!361667 () Bool)

(assert (=> b!364167 m!361667))

(declare-fun m!361669 () Bool)

(assert (=> b!364167 m!361669))

(declare-fun m!361671 () Bool)

(assert (=> b!364167 m!361671))

(declare-fun m!361673 () Bool)

(assert (=> b!364168 m!361673))

(push 1)

(assert (not b!364168))

(assert (not b!364167))

(assert (not b!364165))

(assert (not start!36408))

(check-sat)

(pop 1)

