; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5348 () Bool)

(assert start!5348)

(declare-fun b!38431 () Bool)

(declare-fun e!24414 () Bool)

(assert (=> b!38431 (= e!24414 true)))

(declare-fun lt!14318 () Bool)

(declare-datatypes ((List!1036 0))(
  ( (Nil!1033) (Cons!1032 (h!1600 (_ BitVec 64)) (t!3869 List!1036)) )
))
(declare-fun noDuplicate!27 (List!1036) Bool)

(assert (=> b!38431 (= lt!14318 (noDuplicate!27 Nil!1033))))

(declare-fun b!38429 () Bool)

(declare-fun res!23178 () Bool)

(assert (=> b!38429 (=> res!23178 e!24414)))

(declare-fun contains!493 (List!1036 (_ BitVec 64)) Bool)

(assert (=> b!38429 (= res!23178 (contains!493 Nil!1033 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!38428 () Bool)

(declare-fun e!24415 () Bool)

(assert (=> b!38428 (= e!24415 (not e!24414))))

(declare-fun res!23179 () Bool)

(assert (=> b!38428 (=> res!23179 e!24414)))

(declare-fun mask!853 () (_ BitVec 32))

(assert (=> b!38428 (= res!23179 (or (bvsge (bvadd #b00000000000000000000000000000001 mask!853) #b01111111111111111111111111111111) (bvsgt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853))))))

(declare-datatypes ((array!2553 0))(
  ( (array!2554 (arr!1220 (Array (_ BitVec 32) (_ BitVec 64))) (size!1327 (_ BitVec 32))) )
))
(declare-fun lt!14319 () array!2553)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2553 (_ BitVec 32)) Bool)

(assert (=> b!38428 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!14319 mask!853)))

(declare-datatypes ((Unit!945 0))(
  ( (Unit!946) )
))
(declare-fun lt!14320 () Unit!945)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2553 (_ BitVec 32) (_ BitVec 32)) Unit!945)

(assert (=> b!38428 (= lt!14320 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!14319 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2553 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!38428 (= (arrayCountValidKeys!0 lt!14319 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!14321 () Unit!945)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2553 (_ BitVec 32) (_ BitVec 32)) Unit!945)

(assert (=> b!38428 (= lt!14321 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!14319 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!38428 (= lt!14319 (array!2554 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun b!38430 () Bool)

(declare-fun res!23180 () Bool)

(assert (=> b!38430 (=> res!23180 e!24414)))

(assert (=> b!38430 (= res!23180 (contains!493 Nil!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!23181 () Bool)

(assert (=> start!5348 (=> (not res!23181) (not e!24415))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!5348 (= res!23181 (validMask!0 mask!853))))

(assert (=> start!5348 e!24415))

(assert (=> start!5348 true))

(assert (= (and start!5348 res!23181) b!38428))

(assert (= (and b!38428 (not res!23179)) b!38429))

(assert (= (and b!38429 (not res!23178)) b!38430))

(assert (= (and b!38430 (not res!23180)) b!38431))

(declare-fun m!31089 () Bool)

(assert (=> b!38428 m!31089))

(declare-fun m!31091 () Bool)

(assert (=> b!38428 m!31091))

(declare-fun m!31093 () Bool)

(assert (=> b!38428 m!31093))

(declare-fun m!31095 () Bool)

(assert (=> b!38428 m!31095))

(declare-fun m!31097 () Bool)

(assert (=> start!5348 m!31097))

(declare-fun m!31099 () Bool)

(assert (=> b!38429 m!31099))

(declare-fun m!31101 () Bool)

(assert (=> b!38430 m!31101))

(declare-fun m!31103 () Bool)

(assert (=> b!38431 m!31103))

(push 1)

(assert (not b!38431))

(assert (not b!38429))

(assert (not start!5348))

(assert (not b!38428))

(assert (not b!38430))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

