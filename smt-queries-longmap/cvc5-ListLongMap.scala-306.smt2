; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5308 () Bool)

(assert start!5308)

(declare-fun res!23013 () Bool)

(declare-fun e!24319 () Bool)

(assert (=> start!5308 (=> (not res!23013) (not e!24319))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!5308 (= res!23013 (validMask!0 mask!853))))

(assert (=> start!5308 e!24319))

(assert (=> start!5308 true))

(declare-fun b!38263 () Bool)

(assert (=> b!38263 (= e!24319 (not true))))

(declare-datatypes ((array!2513 0))(
  ( (array!2514 (arr!1200 (Array (_ BitVec 32) (_ BitVec 64))) (size!1307 (_ BitVec 32))) )
))
(declare-fun lt!14128 () array!2513)

(declare-fun arrayCountValidKeys!0 (array!2513 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!38263 (= (arrayCountValidKeys!0 lt!14128 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!905 0))(
  ( (Unit!906) )
))
(declare-fun lt!14129 () Unit!905)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2513 (_ BitVec 32) (_ BitVec 32)) Unit!905)

(assert (=> b!38263 (= lt!14129 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!14128 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!38263 (= lt!14128 (array!2514 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (= (and start!5308 res!23013) b!38263))

(declare-fun m!30859 () Bool)

(assert (=> start!5308 m!30859))

(declare-fun m!30861 () Bool)

(assert (=> b!38263 m!30861))

(declare-fun m!30863 () Bool)

(assert (=> b!38263 m!30863))

(push 1)

(assert (not start!5308))

(assert (not b!38263))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

