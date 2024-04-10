; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5356 () Bool)

(assert start!5356)

(declare-fun b!38478 () Bool)

(declare-fun res!23226 () Bool)

(declare-fun e!24439 () Bool)

(assert (=> b!38478 (=> res!23226 e!24439)))

(declare-datatypes ((List!1040 0))(
  ( (Nil!1037) (Cons!1036 (h!1604 (_ BitVec 64)) (t!3873 List!1040)) )
))
(declare-fun contains!497 (List!1040 (_ BitVec 64)) Bool)

(assert (=> b!38478 (= res!23226 (contains!497 Nil!1037 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!23229 () Bool)

(declare-fun e!24438 () Bool)

(assert (=> start!5356 (=> (not res!23229) (not e!24438))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!5356 (= res!23229 (validMask!0 mask!853))))

(assert (=> start!5356 e!24438))

(assert (=> start!5356 true))

(declare-fun b!38476 () Bool)

(assert (=> b!38476 (= e!24438 (not e!24439))))

(declare-fun res!23228 () Bool)

(assert (=> b!38476 (=> res!23228 e!24439)))

(assert (=> b!38476 (= res!23228 (or (bvsge (bvadd #b00000000000000000000000000000001 mask!853) #b01111111111111111111111111111111) (bvsgt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853))))))

(declare-datatypes ((array!2561 0))(
  ( (array!2562 (arr!1224 (Array (_ BitVec 32) (_ BitVec 64))) (size!1331 (_ BitVec 32))) )
))
(declare-fun lt!14368 () array!2561)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2561 (_ BitVec 32)) Bool)

(assert (=> b!38476 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!14368 mask!853)))

(declare-datatypes ((Unit!953 0))(
  ( (Unit!954) )
))
(declare-fun lt!14367 () Unit!953)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2561 (_ BitVec 32) (_ BitVec 32)) Unit!953)

(assert (=> b!38476 (= lt!14367 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!14368 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2561 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!38476 (= (arrayCountValidKeys!0 lt!14368 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!14366 () Unit!953)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2561 (_ BitVec 32) (_ BitVec 32)) Unit!953)

(assert (=> b!38476 (= lt!14366 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!14368 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!38476 (= lt!14368 (array!2562 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun b!38479 () Bool)

(assert (=> b!38479 (= e!24439 true)))

(declare-fun lt!14369 () Bool)

(declare-fun noDuplicate!31 (List!1040) Bool)

(assert (=> b!38479 (= lt!14369 (noDuplicate!31 Nil!1037))))

(declare-fun b!38477 () Bool)

(declare-fun res!23227 () Bool)

(assert (=> b!38477 (=> res!23227 e!24439)))

(assert (=> b!38477 (= res!23227 (contains!497 Nil!1037 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!5356 res!23229) b!38476))

(assert (= (and b!38476 (not res!23228)) b!38477))

(assert (= (and b!38477 (not res!23227)) b!38478))

(assert (= (and b!38478 (not res!23226)) b!38479))

(declare-fun m!31153 () Bool)

(assert (=> start!5356 m!31153))

(declare-fun m!31155 () Bool)

(assert (=> b!38478 m!31155))

(declare-fun m!31157 () Bool)

(assert (=> b!38476 m!31157))

(declare-fun m!31159 () Bool)

(assert (=> b!38476 m!31159))

(declare-fun m!31161 () Bool)

(assert (=> b!38476 m!31161))

(declare-fun m!31163 () Bool)

(assert (=> b!38476 m!31163))

(declare-fun m!31165 () Bool)

(assert (=> b!38479 m!31165))

(declare-fun m!31167 () Bool)

(assert (=> b!38477 m!31167))

(push 1)

(assert (not b!38478))

(assert (not start!5356))

(assert (not b!38479))

(assert (not b!38477))

(assert (not b!38476))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

