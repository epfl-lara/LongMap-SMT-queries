; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5358 () Bool)

(assert start!5358)

(declare-fun b!38463 () Bool)

(declare-fun res!23236 () Bool)

(declare-fun e!24422 () Bool)

(assert (=> b!38463 (=> res!23236 e!24422)))

(declare-datatypes ((List!1035 0))(
  ( (Nil!1032) (Cons!1031 (h!1599 (_ BitVec 64)) (t!3867 List!1035)) )
))
(declare-fun contains!496 (List!1035 (_ BitVec 64)) Bool)

(assert (=> b!38463 (= res!23236 (contains!496 Nil!1032 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!38464 () Bool)

(assert (=> b!38464 (= e!24422 true)))

(declare-fun lt!14387 () Bool)

(declare-fun noDuplicate!31 (List!1035) Bool)

(assert (=> b!38464 (= lt!14387 (noDuplicate!31 Nil!1032))))

(declare-fun b!38462 () Bool)

(declare-fun res!23233 () Bool)

(assert (=> b!38462 (=> res!23233 e!24422)))

(assert (=> b!38462 (= res!23233 (contains!496 Nil!1032 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!38461 () Bool)

(declare-fun e!24423 () Bool)

(assert (=> b!38461 (= e!24423 (not e!24422))))

(declare-fun res!23234 () Bool)

(assert (=> b!38461 (=> res!23234 e!24422)))

(declare-fun mask!853 () (_ BitVec 32))

(assert (=> b!38461 (= res!23234 (or (bvsge (bvadd #b00000000000000000000000000000001 mask!853) #b01111111111111111111111111111111) (bvsgt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853))))))

(declare-datatypes ((array!2539 0))(
  ( (array!2540 (arr!1213 (Array (_ BitVec 32) (_ BitVec 64))) (size!1320 (_ BitVec 32))) )
))
(declare-fun lt!14389 () array!2539)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2539 (_ BitVec 32)) Bool)

(assert (=> b!38461 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!14389 mask!853)))

(declare-datatypes ((Unit!958 0))(
  ( (Unit!959) )
))
(declare-fun lt!14388 () Unit!958)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2539 (_ BitVec 32) (_ BitVec 32)) Unit!958)

(assert (=> b!38461 (= lt!14388 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!14389 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2539 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!38461 (= (arrayCountValidKeys!0 lt!14389 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!14390 () Unit!958)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2539 (_ BitVec 32) (_ BitVec 32)) Unit!958)

(assert (=> b!38461 (= lt!14390 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!14389 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!38461 (= lt!14389 (array!2540 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun res!23235 () Bool)

(assert (=> start!5358 (=> (not res!23235) (not e!24423))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!5358 (= res!23235 (validMask!0 mask!853))))

(assert (=> start!5358 e!24423))

(assert (=> start!5358 true))

(assert (= (and start!5358 res!23235) b!38461))

(assert (= (and b!38461 (not res!23234)) b!38462))

(assert (= (and b!38462 (not res!23233)) b!38463))

(assert (= (and b!38463 (not res!23236)) b!38464))

(declare-fun m!31141 () Bool)

(assert (=> b!38463 m!31141))

(declare-fun m!31143 () Bool)

(assert (=> b!38461 m!31143))

(declare-fun m!31145 () Bool)

(assert (=> b!38461 m!31145))

(declare-fun m!31147 () Bool)

(assert (=> b!38461 m!31147))

(declare-fun m!31149 () Bool)

(assert (=> b!38461 m!31149))

(declare-fun m!31151 () Bool)

(assert (=> b!38464 m!31151))

(declare-fun m!31153 () Bool)

(assert (=> b!38462 m!31153))

(declare-fun m!31155 () Bool)

(assert (=> start!5358 m!31155))

(push 1)

(assert (not b!38461))

(assert (not b!38462))

(assert (not b!38463))

(assert (not start!5358))

(assert (not b!38464))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

