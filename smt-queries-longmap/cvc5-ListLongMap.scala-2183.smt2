; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36422 () Bool)

(assert start!36422)

(declare-fun b!364302 () Bool)

(declare-fun e!223025 () Bool)

(assert (=> b!364302 (= e!223025 false)))

(declare-fun from!3650 () (_ BitVec 32))

(declare-fun lt!168499 () (_ BitVec 32))

(declare-fun i!1472 () (_ BitVec 32))

(declare-datatypes ((array!20697 0))(
  ( (array!20698 (arr!9827 (Array (_ BitVec 32) (_ BitVec 64))) (size!10179 (_ BitVec 32))) )
))
(declare-fun a!4289 () array!20697)

(declare-fun k!2974 () (_ BitVec 64))

(declare-fun arrayCountValidKeys!0 (array!20697 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!364302 (= lt!168499 (arrayCountValidKeys!0 (array!20698 (store (arr!9827 a!4289) i!1472 k!2974) (size!10179 a!4289)) from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun lt!168500 () (_ BitVec 32))

(assert (=> b!364302 (= lt!168500 (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun b!364299 () Bool)

(declare-fun res!203507 () Bool)

(assert (=> b!364299 (=> (not res!203507) (not e!223025))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!364299 (= res!203507 (not (validKeyInArray!0 (select (arr!9827 a!4289) i!1472))))))

(declare-fun b!364300 () Bool)

(declare-fun res!203508 () Bool)

(assert (=> b!364300 (=> (not res!203508) (not e!223025))))

(assert (=> b!364300 (= res!203508 (validKeyInArray!0 k!2974))))

(declare-fun res!203509 () Bool)

(assert (=> start!36422 (=> (not res!203509) (not e!223025))))

(assert (=> start!36422 (= res!203509 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10179 a!4289))))))

(assert (=> start!36422 e!223025))

(assert (=> start!36422 true))

(declare-fun array_inv!7299 (array!20697) Bool)

(assert (=> start!36422 (array_inv!7299 a!4289)))

(declare-fun b!364301 () Bool)

(declare-fun res!203506 () Bool)

(assert (=> b!364301 (=> (not res!203506) (not e!223025))))

(assert (=> b!364301 (= res!203506 (and (bvslt (size!10179 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10179 a!4289)) (bvsge i!1472 from!3650)))))

(assert (= (and start!36422 res!203509) b!364299))

(assert (= (and b!364299 res!203507) b!364300))

(assert (= (and b!364300 res!203508) b!364301))

(assert (= (and b!364301 res!203506) b!364302))

(declare-fun m!362087 () Bool)

(assert (=> b!364302 m!362087))

(declare-fun m!362089 () Bool)

(assert (=> b!364302 m!362089))

(declare-fun m!362091 () Bool)

(assert (=> b!364302 m!362091))

(declare-fun m!362093 () Bool)

(assert (=> b!364299 m!362093))

(assert (=> b!364299 m!362093))

(declare-fun m!362095 () Bool)

(assert (=> b!364299 m!362095))

(declare-fun m!362097 () Bool)

(assert (=> b!364300 m!362097))

(declare-fun m!362099 () Bool)

(assert (=> start!36422 m!362099))

(push 1)

(assert (not b!364300))

(assert (not b!364299))

(assert (not start!36422))

(assert (not b!364302))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

