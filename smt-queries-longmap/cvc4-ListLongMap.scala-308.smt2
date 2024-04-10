; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5324 () Bool)

(assert start!5324)

(declare-fun res!23037 () Bool)

(declare-fun e!24343 () Bool)

(assert (=> start!5324 (=> (not res!23037) (not e!24343))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!5324 (= res!23037 (validMask!0 mask!853))))

(assert (=> start!5324 e!24343))

(assert (=> start!5324 true))

(declare-fun b!38287 () Bool)

(assert (=> b!38287 (= e!24343 (not true))))

(declare-datatypes ((array!2529 0))(
  ( (array!2530 (arr!1208 (Array (_ BitVec 32) (_ BitVec 64))) (size!1315 (_ BitVec 32))) )
))
(declare-fun lt!14176 () array!2529)

(declare-fun arrayCountValidKeys!0 (array!2529 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!38287 (= (arrayCountValidKeys!0 lt!14176 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!921 0))(
  ( (Unit!922) )
))
(declare-fun lt!14177 () Unit!921)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2529 (_ BitVec 32) (_ BitVec 32)) Unit!921)

(assert (=> b!38287 (= lt!14177 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!14176 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!38287 (= lt!14176 (array!2530 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (= (and start!5324 res!23037) b!38287))

(declare-fun m!30907 () Bool)

(assert (=> start!5324 m!30907))

(declare-fun m!30909 () Bool)

(assert (=> b!38287 m!30909))

(declare-fun m!30911 () Bool)

(assert (=> b!38287 m!30911))

(push 1)

(assert (not start!5324))

(assert (not b!38287))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

