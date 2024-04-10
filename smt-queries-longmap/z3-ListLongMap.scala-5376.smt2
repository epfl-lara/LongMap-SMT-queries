; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71856 () Bool)

(assert start!71856)

(declare-fun b!835094 () Bool)

(declare-fun e!465911 () Bool)

(assert (=> b!835094 (= e!465911 false)))

(declare-datatypes ((array!46766 0))(
  ( (array!46767 (arr!22417 (Array (_ BitVec 32) (_ BitVec 64))) (size!22838 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46766)

(declare-fun lt!379654 () (_ BitVec 32))

(declare-fun i!1466 () (_ BitVec 32))

(declare-fun to!390 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!46766 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!835094 (= lt!379654 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun lt!379653 () (_ BitVec 32))

(declare-fun k0!2968 () (_ BitVec 64))

(assert (=> b!835094 (= lt!379653 (arrayCountValidKeys!0 (array!46767 (store (arr!22417 a!4227) i!1466 k0!2968) (size!22838 a!4227)) (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun b!835091 () Bool)

(declare-fun res!567963 () Bool)

(assert (=> b!835091 (=> (not res!567963) (not e!465911))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!835091 (= res!567963 (not (validKeyInArray!0 (select (arr!22417 a!4227) i!1466))))))

(declare-fun res!567962 () Bool)

(assert (=> start!71856 (=> (not res!567962) (not e!465911))))

(assert (=> start!71856 (= res!567962 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22838 a!4227))))))

(assert (=> start!71856 e!465911))

(assert (=> start!71856 true))

(declare-fun array_inv!17864 (array!46766) Bool)

(assert (=> start!71856 (array_inv!17864 a!4227)))

(declare-fun b!835092 () Bool)

(declare-fun res!567965 () Bool)

(assert (=> b!835092 (=> (not res!567965) (not e!465911))))

(assert (=> b!835092 (= res!567965 (validKeyInArray!0 k0!2968))))

(declare-fun b!835093 () Bool)

(declare-fun res!567964 () Bool)

(assert (=> b!835093 (=> (not res!567964) (not e!465911))))

(assert (=> b!835093 (= res!567964 (and (bvslt (size!22838 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22838 a!4227)) (bvsgt to!390 i!1466)))))

(assert (= (and start!71856 res!567962) b!835091))

(assert (= (and b!835091 res!567963) b!835092))

(assert (= (and b!835092 res!567965) b!835093))

(assert (= (and b!835093 res!567964) b!835094))

(declare-fun m!780257 () Bool)

(assert (=> b!835094 m!780257))

(declare-fun m!780259 () Bool)

(assert (=> b!835094 m!780259))

(declare-fun m!780261 () Bool)

(assert (=> b!835094 m!780261))

(declare-fun m!780263 () Bool)

(assert (=> b!835091 m!780263))

(assert (=> b!835091 m!780263))

(declare-fun m!780265 () Bool)

(assert (=> b!835091 m!780265))

(declare-fun m!780267 () Bool)

(assert (=> start!71856 m!780267))

(declare-fun m!780269 () Bool)

(assert (=> b!835092 m!780269))

(check-sat (not b!835092) (not start!71856) (not b!835091) (not b!835094))
