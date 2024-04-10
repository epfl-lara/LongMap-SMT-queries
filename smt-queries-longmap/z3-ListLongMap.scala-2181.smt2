; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36422 () Bool)

(assert start!36422)

(declare-fun b!364260 () Bool)

(declare-fun res!203422 () Bool)

(declare-fun e!223014 () Bool)

(assert (=> b!364260 (=> (not res!203422) (not e!223014))))

(declare-fun from!3650 () (_ BitVec 32))

(declare-fun i!1472 () (_ BitVec 32))

(declare-datatypes ((array!20702 0))(
  ( (array!20703 (arr!9830 (Array (_ BitVec 32) (_ BitVec 64))) (size!10182 (_ BitVec 32))) )
))
(declare-fun a!4289 () array!20702)

(assert (=> b!364260 (= res!203422 (and (bvslt (size!10182 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10182 a!4289)) (bvsge i!1472 from!3650)))))

(declare-fun res!203424 () Bool)

(assert (=> start!36422 (=> (not res!203424) (not e!223014))))

(assert (=> start!36422 (= res!203424 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10182 a!4289))))))

(assert (=> start!36422 e!223014))

(assert (=> start!36422 true))

(declare-fun array_inv!7272 (array!20702) Bool)

(assert (=> start!36422 (array_inv!7272 a!4289)))

(declare-fun b!364261 () Bool)

(assert (=> b!364261 (= e!223014 (and (bvsle from!3650 #b00000000000000000000000000000000) (bvsgt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1472))))))

(declare-fun b!364262 () Bool)

(declare-fun res!203423 () Bool)

(assert (=> b!364262 (=> (not res!203423) (not e!223014))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!364262 (= res!203423 (not (validKeyInArray!0 (select (arr!9830 a!4289) i!1472))))))

(declare-fun b!364263 () Bool)

(declare-fun res!203421 () Bool)

(assert (=> b!364263 (=> (not res!203421) (not e!223014))))

(declare-fun k0!2974 () (_ BitVec 64))

(declare-fun arrayCountValidKeys!0 (array!20702 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!364263 (= res!203421 (= (arrayCountValidKeys!0 (array!20703 (store (arr!9830 a!4289) i!1472 k0!2974) (size!10182 a!4289)) from!3650 (bvadd #b00000000000000000000000000000001 i!1472)) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))))

(declare-fun b!364264 () Bool)

(declare-fun res!203425 () Bool)

(assert (=> b!364264 (=> (not res!203425) (not e!223014))))

(assert (=> b!364264 (= res!203425 (validKeyInArray!0 k0!2974))))

(assert (= (and start!36422 res!203424) b!364262))

(assert (= (and b!364262 res!203423) b!364264))

(assert (= (and b!364264 res!203425) b!364260))

(assert (= (and b!364260 res!203422) b!364263))

(assert (= (and b!364263 res!203421) b!364261))

(declare-fun m!361759 () Bool)

(assert (=> start!36422 m!361759))

(declare-fun m!361761 () Bool)

(assert (=> b!364262 m!361761))

(assert (=> b!364262 m!361761))

(declare-fun m!361763 () Bool)

(assert (=> b!364262 m!361763))

(declare-fun m!361765 () Bool)

(assert (=> b!364263 m!361765))

(declare-fun m!361767 () Bool)

(assert (=> b!364263 m!361767))

(declare-fun m!361769 () Bool)

(assert (=> b!364263 m!361769))

(declare-fun m!361771 () Bool)

(assert (=> b!364264 m!361771))

(check-sat (not b!364264) (not b!364263) (not b!364262) (not start!36422))
(check-sat)
