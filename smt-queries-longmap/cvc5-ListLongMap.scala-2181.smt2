; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36420 () Bool)

(assert start!36420)

(declare-fun b!364245 () Bool)

(declare-fun res!203409 () Bool)

(declare-fun e!223008 () Bool)

(assert (=> b!364245 (=> (not res!203409) (not e!223008))))

(declare-fun from!3650 () (_ BitVec 32))

(declare-fun i!1472 () (_ BitVec 32))

(declare-datatypes ((array!20700 0))(
  ( (array!20701 (arr!9829 (Array (_ BitVec 32) (_ BitVec 64))) (size!10181 (_ BitVec 32))) )
))
(declare-fun a!4289 () array!20700)

(declare-fun k!2974 () (_ BitVec 64))

(declare-fun arrayCountValidKeys!0 (array!20700 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!364245 (= res!203409 (= (arrayCountValidKeys!0 (array!20701 (store (arr!9829 a!4289) i!1472 k!2974) (size!10181 a!4289)) from!3650 (bvadd #b00000000000000000000000000000001 i!1472)) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))))

(declare-fun b!364246 () Bool)

(assert (=> b!364246 (= e!223008 (and (bvsle from!3650 #b00000000000000000000000000000000) (bvsgt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1472))))))

(declare-fun b!364247 () Bool)

(declare-fun res!203408 () Bool)

(assert (=> b!364247 (=> (not res!203408) (not e!223008))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!364247 (= res!203408 (validKeyInArray!0 k!2974))))

(declare-fun b!364248 () Bool)

(declare-fun res!203410 () Bool)

(assert (=> b!364248 (=> (not res!203410) (not e!223008))))

(assert (=> b!364248 (= res!203410 (not (validKeyInArray!0 (select (arr!9829 a!4289) i!1472))))))

(declare-fun res!203406 () Bool)

(assert (=> start!36420 (=> (not res!203406) (not e!223008))))

(assert (=> start!36420 (= res!203406 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10181 a!4289))))))

(assert (=> start!36420 e!223008))

(assert (=> start!36420 true))

(declare-fun array_inv!7271 (array!20700) Bool)

(assert (=> start!36420 (array_inv!7271 a!4289)))

(declare-fun b!364249 () Bool)

(declare-fun res!203407 () Bool)

(assert (=> b!364249 (=> (not res!203407) (not e!223008))))

(assert (=> b!364249 (= res!203407 (and (bvslt (size!10181 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10181 a!4289)) (bvsge i!1472 from!3650)))))

(assert (= (and start!36420 res!203406) b!364248))

(assert (= (and b!364248 res!203410) b!364247))

(assert (= (and b!364247 res!203408) b!364249))

(assert (= (and b!364249 res!203407) b!364245))

(assert (= (and b!364245 res!203409) b!364246))

(declare-fun m!361745 () Bool)

(assert (=> b!364245 m!361745))

(declare-fun m!361747 () Bool)

(assert (=> b!364245 m!361747))

(declare-fun m!361749 () Bool)

(assert (=> b!364245 m!361749))

(declare-fun m!361751 () Bool)

(assert (=> b!364247 m!361751))

(declare-fun m!361753 () Bool)

(assert (=> b!364248 m!361753))

(assert (=> b!364248 m!361753))

(declare-fun m!361755 () Bool)

(assert (=> b!364248 m!361755))

(declare-fun m!361757 () Bool)

(assert (=> start!36420 m!361757))

(push 1)

(assert (not b!364248))

(assert (not b!364247))

(assert (not start!36420))

(assert (not b!364245))

(check-sat)

