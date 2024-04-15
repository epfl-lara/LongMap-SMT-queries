; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5340 () Bool)

(assert start!5340)

(declare-fun b!38353 () Bool)

(declare-fun e!24368 () Bool)

(declare-fun e!24369 () Bool)

(assert (=> b!38353 (= e!24368 (not e!24369))))

(declare-fun res!23128 () Bool)

(assert (=> b!38353 (=> res!23128 e!24369)))

(declare-fun mask!853 () (_ BitVec 32))

(assert (=> b!38353 (= res!23128 (or (bvsge (bvadd #b00000000000000000000000000000001 mask!853) #b01111111111111111111111111111111) (bvsgt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853))))))

(declare-datatypes ((array!2521 0))(
  ( (array!2522 (arr!1204 (Array (_ BitVec 32) (_ BitVec 64))) (size!1311 (_ BitVec 32))) )
))
(declare-fun lt!14279 () array!2521)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2521 (_ BitVec 32)) Bool)

(assert (=> b!38353 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!14279 mask!853)))

(declare-datatypes ((Unit!940 0))(
  ( (Unit!941) )
))
(declare-fun lt!14281 () Unit!940)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2521 (_ BitVec 32) (_ BitVec 32)) Unit!940)

(assert (=> b!38353 (= lt!14281 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!14279 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2521 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!38353 (= (arrayCountValidKeys!0 lt!14279 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!14282 () Unit!940)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2521 (_ BitVec 32) (_ BitVec 32)) Unit!940)

(assert (=> b!38353 (= lt!14282 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!14279 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!38353 (= lt!14279 (array!2522 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun b!38355 () Bool)

(declare-fun res!23127 () Bool)

(assert (=> b!38355 (=> res!23127 e!24369)))

(declare-datatypes ((List!1026 0))(
  ( (Nil!1023) (Cons!1022 (h!1590 (_ BitVec 64)) (t!3858 List!1026)) )
))
(declare-fun contains!487 (List!1026 (_ BitVec 64)) Bool)

(assert (=> b!38355 (= res!23127 (contains!487 Nil!1023 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!38354 () Bool)

(declare-fun res!23125 () Bool)

(assert (=> b!38354 (=> res!23125 e!24369)))

(assert (=> b!38354 (= res!23125 (contains!487 Nil!1023 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!38356 () Bool)

(assert (=> b!38356 (= e!24369 true)))

(declare-fun lt!14280 () Bool)

(declare-fun noDuplicate!22 (List!1026) Bool)

(assert (=> b!38356 (= lt!14280 (noDuplicate!22 Nil!1023))))

(declare-fun res!23126 () Bool)

(assert (=> start!5340 (=> (not res!23126) (not e!24368))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!5340 (= res!23126 (validMask!0 mask!853))))

(assert (=> start!5340 e!24368))

(assert (=> start!5340 true))

(assert (= (and start!5340 res!23126) b!38353))

(assert (= (and b!38353 (not res!23128)) b!38354))

(assert (= (and b!38354 (not res!23125)) b!38355))

(assert (= (and b!38355 (not res!23127)) b!38356))

(declare-fun m!30997 () Bool)

(assert (=> b!38355 m!30997))

(declare-fun m!30999 () Bool)

(assert (=> b!38353 m!30999))

(declare-fun m!31001 () Bool)

(assert (=> b!38353 m!31001))

(declare-fun m!31003 () Bool)

(assert (=> b!38353 m!31003))

(declare-fun m!31005 () Bool)

(assert (=> b!38353 m!31005))

(declare-fun m!31007 () Bool)

(assert (=> b!38354 m!31007))

(declare-fun m!31009 () Bool)

(assert (=> b!38356 m!31009))

(declare-fun m!31011 () Bool)

(assert (=> start!5340 m!31011))

(push 1)

(assert (not b!38356))

(assert (not b!38355))

(assert (not b!38353))

(assert (not start!5340))

(assert (not b!38354))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

