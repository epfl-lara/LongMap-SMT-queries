; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5338 () Bool)

(assert start!5338)

(declare-fun b!38369 () Bool)

(declare-fun res!23120 () Bool)

(declare-fun e!24385 () Bool)

(assert (=> b!38369 (=> res!23120 e!24385)))

(declare-datatypes ((List!1031 0))(
  ( (Nil!1028) (Cons!1027 (h!1595 (_ BitVec 64)) (t!3864 List!1031)) )
))
(declare-fun contains!488 (List!1031 (_ BitVec 64)) Bool)

(assert (=> b!38369 (= res!23120 (contains!488 Nil!1028 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!38370 () Bool)

(declare-fun res!23118 () Bool)

(assert (=> b!38370 (=> res!23118 e!24385)))

(assert (=> b!38370 (= res!23118 (contains!488 Nil!1028 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!38371 () Bool)

(assert (=> b!38371 (= e!24385 true)))

(declare-fun lt!14261 () Bool)

(declare-fun noDuplicate!22 (List!1031) Bool)

(assert (=> b!38371 (= lt!14261 (noDuplicate!22 Nil!1028))))

(declare-fun res!23119 () Bool)

(declare-fun e!24384 () Bool)

(assert (=> start!5338 (=> (not res!23119) (not e!24384))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!5338 (= res!23119 (validMask!0 mask!853))))

(assert (=> start!5338 e!24384))

(assert (=> start!5338 true))

(declare-fun b!38368 () Bool)

(assert (=> b!38368 (= e!24384 (not e!24385))))

(declare-fun res!23121 () Bool)

(assert (=> b!38368 (=> res!23121 e!24385)))

(assert (=> b!38368 (= res!23121 (or (bvsge (bvadd #b00000000000000000000000000000001 mask!853) #b01111111111111111111111111111111) (bvsgt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853))))))

(declare-datatypes ((array!2543 0))(
  ( (array!2544 (arr!1215 (Array (_ BitVec 32) (_ BitVec 64))) (size!1322 (_ BitVec 32))) )
))
(declare-fun lt!14260 () array!2543)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2543 (_ BitVec 32)) Bool)

(assert (=> b!38368 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!14260 mask!853)))

(declare-datatypes ((Unit!935 0))(
  ( (Unit!936) )
))
(declare-fun lt!14259 () Unit!935)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2543 (_ BitVec 32) (_ BitVec 32)) Unit!935)

(assert (=> b!38368 (= lt!14259 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!14260 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2543 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!38368 (= (arrayCountValidKeys!0 lt!14260 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!14258 () Unit!935)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2543 (_ BitVec 32) (_ BitVec 32)) Unit!935)

(assert (=> b!38368 (= lt!14258 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!14260 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!38368 (= lt!14260 (array!2544 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (= (and start!5338 res!23119) b!38368))

(assert (= (and b!38368 (not res!23121)) b!38369))

(assert (= (and b!38369 (not res!23120)) b!38370))

(assert (= (and b!38370 (not res!23118)) b!38371))

(declare-fun m!31009 () Bool)

(assert (=> b!38368 m!31009))

(declare-fun m!31011 () Bool)

(assert (=> b!38368 m!31011))

(declare-fun m!31013 () Bool)

(assert (=> b!38368 m!31013))

(declare-fun m!31015 () Bool)

(assert (=> b!38368 m!31015))

(declare-fun m!31017 () Bool)

(assert (=> b!38369 m!31017))

(declare-fun m!31019 () Bool)

(assert (=> b!38371 m!31019))

(declare-fun m!31021 () Bool)

(assert (=> start!5338 m!31021))

(declare-fun m!31023 () Bool)

(assert (=> b!38370 m!31023))

(push 1)

(assert (not b!38370))

(assert (not b!38369))

(assert (not b!38371))

(assert (not b!38368))

(assert (not start!5338))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

