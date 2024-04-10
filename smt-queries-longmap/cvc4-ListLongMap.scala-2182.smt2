; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36430 () Bool)

(assert start!36430)

(declare-fun b!364313 () Bool)

(declare-fun res!203474 () Bool)

(declare-fun e!223038 () Bool)

(assert (=> b!364313 (=> (not res!203474) (not e!223038))))

(declare-fun k!2974 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!364313 (= res!203474 (validKeyInArray!0 k!2974))))

(declare-fun b!364315 () Bool)

(assert (=> b!364315 (= e!223038 false)))

(declare-fun from!3650 () (_ BitVec 32))

(declare-fun i!1472 () (_ BitVec 32))

(declare-fun lt!168463 () (_ BitVec 32))

(declare-datatypes ((array!20710 0))(
  ( (array!20711 (arr!9834 (Array (_ BitVec 32) (_ BitVec 64))) (size!10186 (_ BitVec 32))) )
))
(declare-fun a!4289 () array!20710)

(declare-fun arrayCountValidKeys!0 (array!20710 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!364315 (= lt!168463 (arrayCountValidKeys!0 (array!20711 (store (arr!9834 a!4289) i!1472 k!2974) (size!10186 a!4289)) from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun lt!168462 () (_ BitVec 32))

(assert (=> b!364315 (= lt!168462 (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun res!203475 () Bool)

(assert (=> start!36430 (=> (not res!203475) (not e!223038))))

(assert (=> start!36430 (= res!203475 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10186 a!4289))))))

(assert (=> start!36430 e!223038))

(assert (=> start!36430 true))

(declare-fun array_inv!7276 (array!20710) Bool)

(assert (=> start!36430 (array_inv!7276 a!4289)))

(declare-fun b!364312 () Bool)

(declare-fun res!203476 () Bool)

(assert (=> b!364312 (=> (not res!203476) (not e!223038))))

(assert (=> b!364312 (= res!203476 (not (validKeyInArray!0 (select (arr!9834 a!4289) i!1472))))))

(declare-fun b!364314 () Bool)

(declare-fun res!203473 () Bool)

(assert (=> b!364314 (=> (not res!203473) (not e!223038))))

(assert (=> b!364314 (= res!203473 (and (bvslt (size!10186 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10186 a!4289)) (bvsge i!1472 from!3650)))))

(assert (= (and start!36430 res!203475) b!364312))

(assert (= (and b!364312 res!203476) b!364313))

(assert (= (and b!364313 res!203474) b!364314))

(assert (= (and b!364314 res!203473) b!364315))

(declare-fun m!361815 () Bool)

(assert (=> b!364313 m!361815))

(declare-fun m!361817 () Bool)

(assert (=> b!364315 m!361817))

(declare-fun m!361819 () Bool)

(assert (=> b!364315 m!361819))

(declare-fun m!361821 () Bool)

(assert (=> b!364315 m!361821))

(declare-fun m!361823 () Bool)

(assert (=> start!36430 m!361823))

(declare-fun m!361825 () Bool)

(assert (=> b!364312 m!361825))

(assert (=> b!364312 m!361825))

(declare-fun m!361827 () Bool)

(assert (=> b!364312 m!361827))

(push 1)

(assert (not b!364315))

(assert (not b!364313))

(assert (not b!364312))

(assert (not start!36430))

(check-sat)

