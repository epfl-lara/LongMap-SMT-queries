; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5318 () Bool)

(assert start!5318)

(declare-fun res!23028 () Bool)

(declare-fun e!24334 () Bool)

(assert (=> start!5318 (=> (not res!23028) (not e!24334))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!5318 (= res!23028 (validMask!0 mask!853))))

(assert (=> start!5318 e!24334))

(assert (=> start!5318 true))

(declare-fun b!38278 () Bool)

(assert (=> b!38278 (= e!24334 (not true))))

(declare-datatypes ((array!2523 0))(
  ( (array!2524 (arr!1205 (Array (_ BitVec 32) (_ BitVec 64))) (size!1312 (_ BitVec 32))) )
))
(declare-fun lt!14158 () array!2523)

(declare-fun arrayCountValidKeys!0 (array!2523 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!38278 (= (arrayCountValidKeys!0 lt!14158 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!915 0))(
  ( (Unit!916) )
))
(declare-fun lt!14159 () Unit!915)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2523 (_ BitVec 32) (_ BitVec 32)) Unit!915)

(assert (=> b!38278 (= lt!14159 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!14158 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!38278 (= lt!14158 (array!2524 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (= (and start!5318 res!23028) b!38278))

(declare-fun m!30889 () Bool)

(assert (=> start!5318 m!30889))

(declare-fun m!30891 () Bool)

(assert (=> b!38278 m!30891))

(declare-fun m!30893 () Bool)

(assert (=> b!38278 m!30893))

(push 1)

(assert (not start!5318))

(assert (not b!38278))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

