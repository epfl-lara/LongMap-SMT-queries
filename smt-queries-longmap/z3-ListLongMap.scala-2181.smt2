; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36406 () Bool)

(assert start!36406)

(declare-fun res!203281 () Bool)

(declare-fun e!222835 () Bool)

(assert (=> start!36406 (=> (not res!203281) (not e!222835))))

(declare-fun i!1472 () (_ BitVec 32))

(declare-datatypes ((array!20682 0))(
  ( (array!20683 (arr!9820 (Array (_ BitVec 32) (_ BitVec 64))) (size!10173 (_ BitVec 32))) )
))
(declare-fun a!4289 () array!20682)

(assert (=> start!36406 (= res!203281 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10173 a!4289))))))

(assert (=> start!36406 e!222835))

(assert (=> start!36406 true))

(declare-fun array_inv!7269 (array!20682) Bool)

(assert (=> start!36406 (array_inv!7269 a!4289)))

(declare-fun b!363974 () Bool)

(declare-fun res!203278 () Bool)

(assert (=> b!363974 (=> (not res!203278) (not e!222835))))

(declare-fun from!3650 () (_ BitVec 32))

(declare-fun k0!2974 () (_ BitVec 64))

(declare-fun arrayCountValidKeys!0 (array!20682 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!363974 (= res!203278 (= (arrayCountValidKeys!0 (array!20683 (store (arr!9820 a!4289) i!1472 k0!2974) (size!10173 a!4289)) from!3650 (bvadd #b00000000000000000000000000000001 i!1472)) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))))

(declare-fun b!363975 () Bool)

(declare-fun res!203277 () Bool)

(assert (=> b!363975 (=> (not res!203277) (not e!222835))))

(assert (=> b!363975 (= res!203277 (and (bvslt (size!10173 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10173 a!4289)) (bvsge i!1472 from!3650)))))

(declare-fun b!363976 () Bool)

(declare-fun res!203279 () Bool)

(assert (=> b!363976 (=> (not res!203279) (not e!222835))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!363976 (= res!203279 (not (validKeyInArray!0 (select (arr!9820 a!4289) i!1472))))))

(declare-fun b!363977 () Bool)

(declare-fun res!203280 () Bool)

(assert (=> b!363977 (=> (not res!203280) (not e!222835))))

(assert (=> b!363977 (= res!203280 (validKeyInArray!0 k0!2974))))

(declare-fun b!363978 () Bool)

(assert (=> b!363978 (= e!222835 (and (bvsle from!3650 #b00000000000000000000000000000000) (bvsgt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1472))))))

(assert (= (and start!36406 res!203281) b!363976))

(assert (= (and b!363976 res!203279) b!363977))

(assert (= (and b!363977 res!203280) b!363975))

(assert (= (and b!363975 res!203277) b!363974))

(assert (= (and b!363974 res!203278) b!363978))

(declare-fun m!361021 () Bool)

(assert (=> start!36406 m!361021))

(declare-fun m!361023 () Bool)

(assert (=> b!363974 m!361023))

(declare-fun m!361025 () Bool)

(assert (=> b!363974 m!361025))

(declare-fun m!361027 () Bool)

(assert (=> b!363974 m!361027))

(declare-fun m!361029 () Bool)

(assert (=> b!363976 m!361029))

(assert (=> b!363976 m!361029))

(declare-fun m!361031 () Bool)

(assert (=> b!363976 m!361031))

(declare-fun m!361033 () Bool)

(assert (=> b!363977 m!361033))

(check-sat (not b!363976) (not b!363977) (not start!36406) (not b!363974))
(check-sat)
