; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36424 () Bool)

(assert start!36424)

(declare-fun b!364091 () Bool)

(declare-fun res!203398 () Bool)

(declare-fun e!222889 () Bool)

(assert (=> b!364091 (=> (not res!203398) (not e!222889))))

(declare-fun from!3650 () (_ BitVec 32))

(declare-fun i!1472 () (_ BitVec 32))

(declare-datatypes ((array!20700 0))(
  ( (array!20701 (arr!9829 (Array (_ BitVec 32) (_ BitVec 64))) (size!10182 (_ BitVec 32))) )
))
(declare-fun a!4289 () array!20700)

(declare-fun k0!2974 () (_ BitVec 64))

(declare-fun arrayCountValidKeys!0 (array!20700 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!364091 (= res!203398 (= (arrayCountValidKeys!0 (array!20701 (store (arr!9829 a!4289) i!1472 k0!2974) (size!10182 a!4289)) from!3650 (bvadd #b00000000000000000000000000000001 i!1472)) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))))

(declare-fun res!203397 () Bool)

(assert (=> start!36424 (=> (not res!203397) (not e!222889))))

(assert (=> start!36424 (= res!203397 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10182 a!4289))))))

(assert (=> start!36424 e!222889))

(assert (=> start!36424 true))

(declare-fun array_inv!7278 (array!20700) Bool)

(assert (=> start!36424 (array_inv!7278 a!4289)))

(declare-fun b!364092 () Bool)

(assert (=> b!364092 (= e!222889 (and (bvsgt from!3650 #b00000000000000000000000000000000) (or (bvslt (bvadd #b00000000000000000000000000000001 i!1472) (bvsub from!3650 #b00000000000000000000000000000001)) (bvslt from!3650 (bvsub from!3650 #b00000000000000000000000000000001)) (bvsgt from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))))

(declare-fun b!364093 () Bool)

(declare-fun res!203395 () Bool)

(assert (=> b!364093 (=> (not res!203395) (not e!222889))))

(assert (=> b!364093 (= res!203395 (and (bvslt (size!10182 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10182 a!4289)) (bvsge i!1472 from!3650)))))

(declare-fun b!364094 () Bool)

(declare-fun res!203396 () Bool)

(assert (=> b!364094 (=> (not res!203396) (not e!222889))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!364094 (= res!203396 (validKeyInArray!0 k0!2974))))

(declare-fun b!364095 () Bool)

(declare-fun res!203394 () Bool)

(assert (=> b!364095 (=> (not res!203394) (not e!222889))))

(assert (=> b!364095 (= res!203394 (not (validKeyInArray!0 (select (arr!9829 a!4289) i!1472))))))

(assert (= (and start!36424 res!203397) b!364095))

(assert (= (and b!364095 res!203394) b!364094))

(assert (= (and b!364094 res!203396) b!364093))

(assert (= (and b!364093 res!203395) b!364091))

(assert (= (and b!364091 res!203398) b!364092))

(declare-fun m!361147 () Bool)

(assert (=> b!364091 m!361147))

(declare-fun m!361149 () Bool)

(assert (=> b!364091 m!361149))

(declare-fun m!361151 () Bool)

(assert (=> b!364091 m!361151))

(declare-fun m!361153 () Bool)

(assert (=> start!36424 m!361153))

(declare-fun m!361155 () Bool)

(assert (=> b!364094 m!361155))

(declare-fun m!361157 () Bool)

(assert (=> b!364095 m!361157))

(assert (=> b!364095 m!361157))

(declare-fun m!361159 () Bool)

(assert (=> b!364095 m!361159))

(check-sat (not b!364095) (not start!36424) (not b!364091) (not b!364094))
(check-sat)
