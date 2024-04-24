; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36524 () Bool)

(assert start!36524)

(declare-fun b!365008 () Bool)

(declare-fun res!204120 () Bool)

(declare-fun e!223424 () Bool)

(assert (=> b!365008 (=> (not res!204120) (not e!223424))))

(declare-fun k!2974 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!365008 (= res!204120 (validKeyInArray!0 k!2974))))

(declare-fun res!204118 () Bool)

(assert (=> start!36524 (=> (not res!204118) (not e!223424))))

(declare-fun i!1472 () (_ BitVec 32))

(declare-datatypes ((array!20778 0))(
  ( (array!20779 (arr!9866 (Array (_ BitVec 32) (_ BitVec 64))) (size!10218 (_ BitVec 32))) )
))
(declare-fun a!4289 () array!20778)

(assert (=> start!36524 (= res!204118 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10218 a!4289))))))

(assert (=> start!36524 e!223424))

(assert (=> start!36524 true))

(declare-fun array_inv!7338 (array!20778) Bool)

(assert (=> start!36524 (array_inv!7338 a!4289)))

(declare-fun b!365009 () Bool)

(declare-fun res!204121 () Bool)

(assert (=> b!365009 (=> (not res!204121) (not e!223424))))

(declare-fun from!3650 () (_ BitVec 32))

(assert (=> b!365009 (= res!204121 (and (bvslt (size!10218 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10218 a!4289)) (bvsge i!1472 from!3650)))))

(declare-fun b!365010 () Bool)

(assert (=> b!365010 (= e!223424 false)))

(declare-fun lt!169157 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!20778 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!365010 (= lt!169157 (arrayCountValidKeys!0 (array!20779 (store (arr!9866 a!4289) i!1472 k!2974) (size!10218 a!4289)) from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun lt!169156 () (_ BitVec 32))

(assert (=> b!365010 (= lt!169156 (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun b!365007 () Bool)

(declare-fun res!204119 () Bool)

(assert (=> b!365007 (=> (not res!204119) (not e!223424))))

(assert (=> b!365007 (= res!204119 (not (validKeyInArray!0 (select (arr!9866 a!4289) i!1472))))))

(assert (= (and start!36524 res!204118) b!365007))

(assert (= (and b!365007 res!204119) b!365008))

(assert (= (and b!365008 res!204120) b!365009))

(assert (= (and b!365009 res!204121) b!365010))

(declare-fun m!363125 () Bool)

(assert (=> b!365008 m!363125))

(declare-fun m!363127 () Bool)

(assert (=> start!36524 m!363127))

(declare-fun m!363129 () Bool)

(assert (=> b!365010 m!363129))

(declare-fun m!363131 () Bool)

(assert (=> b!365010 m!363131))

(declare-fun m!363133 () Bool)

(assert (=> b!365010 m!363133))

(declare-fun m!363135 () Bool)

(assert (=> b!365007 m!363135))

(assert (=> b!365007 m!363135))

(declare-fun m!363137 () Bool)

(assert (=> b!365007 m!363137))

(push 1)

(assert (not b!365007))

(assert (not start!36524))

(assert (not b!365008))

(assert (not b!365010))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

