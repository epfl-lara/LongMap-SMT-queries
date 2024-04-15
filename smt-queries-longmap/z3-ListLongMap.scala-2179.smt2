; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36394 () Bool)

(assert start!36394)

(declare-fun b!363893 () Bool)

(declare-fun res!203199 () Bool)

(declare-fun e!222798 () Bool)

(assert (=> b!363893 (=> (not res!203199) (not e!222798))))

(declare-datatypes ((array!20670 0))(
  ( (array!20671 (arr!9814 (Array (_ BitVec 32) (_ BitVec 64))) (size!10167 (_ BitVec 32))) )
))
(declare-fun a!4289 () array!20670)

(declare-fun i!1472 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!363893 (= res!203199 (not (validKeyInArray!0 (select (arr!9814 a!4289) i!1472))))))

(declare-fun b!363894 () Bool)

(declare-fun from!3650 () (_ BitVec 32))

(assert (=> b!363894 (= e!222798 (and (bvsle from!3650 #b00000000000000000000000000000000) (bvsgt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1472))))))

(declare-fun res!203196 () Bool)

(assert (=> start!36394 (=> (not res!203196) (not e!222798))))

(assert (=> start!36394 (= res!203196 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10167 a!4289))))))

(assert (=> start!36394 e!222798))

(assert (=> start!36394 true))

(declare-fun array_inv!7263 (array!20670) Bool)

(assert (=> start!36394 (array_inv!7263 a!4289)))

(declare-fun b!363895 () Bool)

(declare-fun res!203200 () Bool)

(assert (=> b!363895 (=> (not res!203200) (not e!222798))))

(declare-fun k0!2974 () (_ BitVec 64))

(assert (=> b!363895 (= res!203200 (validKeyInArray!0 k0!2974))))

(declare-fun b!363896 () Bool)

(declare-fun res!203197 () Bool)

(assert (=> b!363896 (=> (not res!203197) (not e!222798))))

(assert (=> b!363896 (= res!203197 (and (bvslt (size!10167 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10167 a!4289)) (bvsge i!1472 from!3650)))))

(declare-fun b!363897 () Bool)

(declare-fun res!203198 () Bool)

(assert (=> b!363897 (=> (not res!203198) (not e!222798))))

(declare-fun arrayCountValidKeys!0 (array!20670 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!363897 (= res!203198 (= (arrayCountValidKeys!0 (array!20671 (store (arr!9814 a!4289) i!1472 k0!2974) (size!10167 a!4289)) from!3650 (bvadd #b00000000000000000000000000000001 i!1472)) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))))

(assert (= (and start!36394 res!203196) b!363893))

(assert (= (and b!363893 res!203199) b!363895))

(assert (= (and b!363895 res!203200) b!363896))

(assert (= (and b!363896 res!203197) b!363897))

(assert (= (and b!363897 res!203198) b!363894))

(declare-fun m!360937 () Bool)

(assert (=> b!363893 m!360937))

(assert (=> b!363893 m!360937))

(declare-fun m!360939 () Bool)

(assert (=> b!363893 m!360939))

(declare-fun m!360941 () Bool)

(assert (=> start!36394 m!360941))

(declare-fun m!360943 () Bool)

(assert (=> b!363895 m!360943))

(declare-fun m!360945 () Bool)

(assert (=> b!363897 m!360945))

(declare-fun m!360947 () Bool)

(assert (=> b!363897 m!360947))

(declare-fun m!360949 () Bool)

(assert (=> b!363897 m!360949))

(check-sat (not b!363897) (not b!363893) (not start!36394) (not b!363895))
(check-sat)
