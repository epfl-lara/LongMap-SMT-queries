; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5354 () Bool)

(assert start!5354)

(declare-fun b!38465 () Bool)

(declare-fun res!23214 () Bool)

(declare-fun e!24432 () Bool)

(assert (=> b!38465 (=> res!23214 e!24432)))

(declare-datatypes ((List!1039 0))(
  ( (Nil!1036) (Cons!1035 (h!1603 (_ BitVec 64)) (t!3872 List!1039)) )
))
(declare-fun contains!496 (List!1039 (_ BitVec 64)) Bool)

(assert (=> b!38465 (= res!23214 (contains!496 Nil!1036 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!38467 () Bool)

(assert (=> b!38467 (= e!24432 true)))

(declare-fun lt!14355 () Bool)

(declare-fun noDuplicate!30 (List!1039) Bool)

(assert (=> b!38467 (= lt!14355 (noDuplicate!30 Nil!1036))))

(declare-fun res!23217 () Bool)

(declare-fun e!24433 () Bool)

(assert (=> start!5354 (=> (not res!23217) (not e!24433))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!5354 (= res!23217 (validMask!0 mask!853))))

(assert (=> start!5354 e!24433))

(assert (=> start!5354 true))

(declare-fun b!38466 () Bool)

(declare-fun res!23216 () Bool)

(assert (=> b!38466 (=> res!23216 e!24432)))

(assert (=> b!38466 (= res!23216 (contains!496 Nil!1036 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!38464 () Bool)

(assert (=> b!38464 (= e!24433 (not e!24432))))

(declare-fun res!23215 () Bool)

(assert (=> b!38464 (=> res!23215 e!24432)))

(assert (=> b!38464 (= res!23215 (or (bvsge (bvadd #b00000000000000000000000000000001 mask!853) #b01111111111111111111111111111111) (bvsgt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853))))))

(declare-datatypes ((array!2559 0))(
  ( (array!2560 (arr!1223 (Array (_ BitVec 32) (_ BitVec 64))) (size!1330 (_ BitVec 32))) )
))
(declare-fun lt!14354 () array!2559)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2559 (_ BitVec 32)) Bool)

(assert (=> b!38464 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!14354 mask!853)))

(declare-datatypes ((Unit!951 0))(
  ( (Unit!952) )
))
(declare-fun lt!14357 () Unit!951)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2559 (_ BitVec 32) (_ BitVec 32)) Unit!951)

(assert (=> b!38464 (= lt!14357 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!14354 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2559 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!38464 (= (arrayCountValidKeys!0 lt!14354 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!14356 () Unit!951)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2559 (_ BitVec 32) (_ BitVec 32)) Unit!951)

(assert (=> b!38464 (= lt!14356 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!14354 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!38464 (= lt!14354 (array!2560 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (= (and start!5354 res!23217) b!38464))

(assert (= (and b!38464 (not res!23215)) b!38465))

(assert (= (and b!38465 (not res!23214)) b!38466))

(assert (= (and b!38466 (not res!23216)) b!38467))

(declare-fun m!31137 () Bool)

(assert (=> b!38465 m!31137))

(declare-fun m!31139 () Bool)

(assert (=> start!5354 m!31139))

(declare-fun m!31141 () Bool)

(assert (=> b!38464 m!31141))

(declare-fun m!31143 () Bool)

(assert (=> b!38464 m!31143))

(declare-fun m!31145 () Bool)

(assert (=> b!38464 m!31145))

(declare-fun m!31147 () Bool)

(assert (=> b!38464 m!31147))

(declare-fun m!31149 () Bool)

(assert (=> b!38466 m!31149))

(declare-fun m!31151 () Bool)

(assert (=> b!38467 m!31151))

(push 1)

(assert (not b!38466))

(assert (not b!38465))

(assert (not b!38464))

(assert (not b!38467))

(assert (not start!5354))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

