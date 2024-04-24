; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36424 () Bool)

(assert start!36424)

(declare-fun b!364313 () Bool)

(declare-fun e!223031 () Bool)

(declare-fun from!3650 () (_ BitVec 32))

(declare-fun i!1472 () (_ BitVec 32))

(assert (=> b!364313 (= e!223031 (and (bvsgt from!3650 #b00000000000000000000000000000000) (or (bvslt (bvadd #b00000000000000000000000000000001 i!1472) (bvsub from!3650 #b00000000000000000000000000000001)) (bvslt from!3650 (bvsub from!3650 #b00000000000000000000000000000001)) (bvsgt from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))))

(declare-fun res!203520 () Bool)

(assert (=> start!36424 (=> (not res!203520) (not e!223031))))

(declare-datatypes ((array!20699 0))(
  ( (array!20700 (arr!9828 (Array (_ BitVec 32) (_ BitVec 64))) (size!10180 (_ BitVec 32))) )
))
(declare-fun a!4289 () array!20699)

(assert (=> start!36424 (= res!203520 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10180 a!4289))))))

(assert (=> start!36424 e!223031))

(assert (=> start!36424 true))

(declare-fun array_inv!7300 (array!20699) Bool)

(assert (=> start!36424 (array_inv!7300 a!4289)))

(declare-fun b!364314 () Bool)

(declare-fun res!203524 () Bool)

(assert (=> b!364314 (=> (not res!203524) (not e!223031))))

(assert (=> b!364314 (= res!203524 (and (bvslt (size!10180 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10180 a!4289)) (bvsge i!1472 from!3650)))))

(declare-fun b!364315 () Bool)

(declare-fun res!203521 () Bool)

(assert (=> b!364315 (=> (not res!203521) (not e!223031))))

(declare-fun k0!2974 () (_ BitVec 64))

(declare-fun arrayCountValidKeys!0 (array!20699 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!364315 (= res!203521 (= (arrayCountValidKeys!0 (array!20700 (store (arr!9828 a!4289) i!1472 k0!2974) (size!10180 a!4289)) from!3650 (bvadd #b00000000000000000000000000000001 i!1472)) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))))

(declare-fun b!364316 () Bool)

(declare-fun res!203523 () Bool)

(assert (=> b!364316 (=> (not res!203523) (not e!223031))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!364316 (= res!203523 (not (validKeyInArray!0 (select (arr!9828 a!4289) i!1472))))))

(declare-fun b!364317 () Bool)

(declare-fun res!203522 () Bool)

(assert (=> b!364317 (=> (not res!203522) (not e!223031))))

(assert (=> b!364317 (= res!203522 (validKeyInArray!0 k0!2974))))

(assert (= (and start!36424 res!203520) b!364316))

(assert (= (and b!364316 res!203523) b!364317))

(assert (= (and b!364317 res!203522) b!364314))

(assert (= (and b!364314 res!203524) b!364315))

(assert (= (and b!364315 res!203521) b!364313))

(declare-fun m!362101 () Bool)

(assert (=> start!36424 m!362101))

(declare-fun m!362103 () Bool)

(assert (=> b!364315 m!362103))

(declare-fun m!362105 () Bool)

(assert (=> b!364315 m!362105))

(declare-fun m!362107 () Bool)

(assert (=> b!364315 m!362107))

(declare-fun m!362109 () Bool)

(assert (=> b!364316 m!362109))

(assert (=> b!364316 m!362109))

(declare-fun m!362111 () Bool)

(assert (=> b!364316 m!362111))

(declare-fun m!362113 () Bool)

(assert (=> b!364317 m!362113))

(check-sat (not b!364317) (not b!364316) (not b!364315) (not start!36424))
(check-sat)
