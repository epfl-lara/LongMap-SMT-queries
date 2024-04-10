; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36412 () Bool)

(assert start!36412)

(declare-fun b!364194 () Bool)

(declare-fun res!203356 () Bool)

(declare-fun e!222984 () Bool)

(assert (=> b!364194 (=> (not res!203356) (not e!222984))))

(declare-fun from!3650 () (_ BitVec 32))

(declare-fun i!1472 () (_ BitVec 32))

(declare-datatypes ((array!20692 0))(
  ( (array!20693 (arr!9825 (Array (_ BitVec 32) (_ BitVec 64))) (size!10177 (_ BitVec 32))) )
))
(declare-fun a!4289 () array!20692)

(assert (=> b!364194 (= res!203356 (and (bvslt (size!10177 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10177 a!4289)) (bvsge i!1472 from!3650)))))

(declare-fun b!364195 () Bool)

(declare-fun res!203358 () Bool)

(assert (=> b!364195 (=> (not res!203358) (not e!222984))))

(declare-fun k!2974 () (_ BitVec 64))

(declare-fun arrayCountValidKeys!0 (array!20692 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!364195 (= res!203358 (= (arrayCountValidKeys!0 (array!20693 (store (arr!9825 a!4289) i!1472 k!2974) (size!10177 a!4289)) from!3650 (bvadd #b00000000000000000000000000000001 i!1472)) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))))

(declare-fun b!364196 () Bool)

(assert (=> b!364196 (= e!222984 (and (bvsle from!3650 #b00000000000000000000000000000000) (bvsgt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1472))))))

(declare-fun b!364197 () Bool)

(declare-fun res!203355 () Bool)

(assert (=> b!364197 (=> (not res!203355) (not e!222984))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!364197 (= res!203355 (not (validKeyInArray!0 (select (arr!9825 a!4289) i!1472))))))

(declare-fun res!203357 () Bool)

(assert (=> start!36412 (=> (not res!203357) (not e!222984))))

(assert (=> start!36412 (= res!203357 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10177 a!4289))))))

(assert (=> start!36412 e!222984))

(assert (=> start!36412 true))

(declare-fun array_inv!7267 (array!20692) Bool)

(assert (=> start!36412 (array_inv!7267 a!4289)))

(declare-fun b!364198 () Bool)

(declare-fun res!203359 () Bool)

(assert (=> b!364198 (=> (not res!203359) (not e!222984))))

(assert (=> b!364198 (= res!203359 (validKeyInArray!0 k!2974))))

(assert (= (and start!36412 res!203357) b!364197))

(assert (= (and b!364197 res!203355) b!364198))

(assert (= (and b!364198 res!203359) b!364194))

(assert (= (and b!364194 res!203356) b!364195))

(assert (= (and b!364195 res!203358) b!364196))

(declare-fun m!361689 () Bool)

(assert (=> b!364195 m!361689))

(declare-fun m!361691 () Bool)

(assert (=> b!364195 m!361691))

(declare-fun m!361693 () Bool)

(assert (=> b!364195 m!361693))

(declare-fun m!361695 () Bool)

(assert (=> b!364197 m!361695))

(assert (=> b!364197 m!361695))

(declare-fun m!361697 () Bool)

(assert (=> b!364197 m!361697))

(declare-fun m!361699 () Bool)

(assert (=> start!36412 m!361699))

(declare-fun m!361701 () Bool)

(assert (=> b!364198 m!361701))

(push 1)

(assert (not b!364195))

(assert (not start!36412))

(assert (not b!364198))

(assert (not b!364197))

(check-sat)

