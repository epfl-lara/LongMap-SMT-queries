; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5352 () Bool)

(assert start!5352)

(declare-fun b!38427 () Bool)

(declare-fun res!23200 () Bool)

(declare-fun e!24405 () Bool)

(assert (=> b!38427 (=> res!23200 e!24405)))

(declare-datatypes ((List!1032 0))(
  ( (Nil!1029) (Cons!1028 (h!1596 (_ BitVec 64)) (t!3864 List!1032)) )
))
(declare-fun contains!493 (List!1032 (_ BitVec 64)) Bool)

(assert (=> b!38427 (= res!23200 (contains!493 Nil!1029 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!38426 () Bool)

(declare-fun res!23197 () Bool)

(assert (=> b!38426 (=> res!23197 e!24405)))

(assert (=> b!38426 (= res!23197 (contains!493 Nil!1029 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!38425 () Bool)

(declare-fun e!24404 () Bool)

(assert (=> b!38425 (= e!24404 (not e!24405))))

(declare-fun res!23198 () Bool)

(assert (=> b!38425 (=> res!23198 e!24405)))

(declare-fun mask!853 () (_ BitVec 32))

(assert (=> b!38425 (= res!23198 (or (bvsge (bvadd #b00000000000000000000000000000001 mask!853) #b01111111111111111111111111111111) (bvsgt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853))))))

(declare-datatypes ((array!2533 0))(
  ( (array!2534 (arr!1210 (Array (_ BitVec 32) (_ BitVec 64))) (size!1317 (_ BitVec 32))) )
))
(declare-fun lt!14353 () array!2533)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2533 (_ BitVec 32)) Bool)

(assert (=> b!38425 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!14353 mask!853)))

(declare-datatypes ((Unit!952 0))(
  ( (Unit!953) )
))
(declare-fun lt!14351 () Unit!952)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2533 (_ BitVec 32) (_ BitVec 32)) Unit!952)

(assert (=> b!38425 (= lt!14351 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!14353 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2533 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!38425 (= (arrayCountValidKeys!0 lt!14353 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!14354 () Unit!952)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2533 (_ BitVec 32) (_ BitVec 32)) Unit!952)

(assert (=> b!38425 (= lt!14354 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!14353 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!38425 (= lt!14353 (array!2534 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun res!23199 () Bool)

(assert (=> start!5352 (=> (not res!23199) (not e!24404))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!5352 (= res!23199 (validMask!0 mask!853))))

(assert (=> start!5352 e!24404))

(assert (=> start!5352 true))

(declare-fun b!38428 () Bool)

(assert (=> b!38428 (= e!24405 true)))

(declare-fun lt!14352 () Bool)

(declare-fun noDuplicate!28 (List!1032) Bool)

(assert (=> b!38428 (= lt!14352 (noDuplicate!28 Nil!1029))))

(assert (= (and start!5352 res!23199) b!38425))

(assert (= (and b!38425 (not res!23198)) b!38426))

(assert (= (and b!38426 (not res!23197)) b!38427))

(assert (= (and b!38427 (not res!23200)) b!38428))

(declare-fun m!31093 () Bool)

(assert (=> b!38428 m!31093))

(declare-fun m!31095 () Bool)

(assert (=> b!38427 m!31095))

(declare-fun m!31097 () Bool)

(assert (=> start!5352 m!31097))

(declare-fun m!31099 () Bool)

(assert (=> b!38425 m!31099))

(declare-fun m!31101 () Bool)

(assert (=> b!38425 m!31101))

(declare-fun m!31103 () Bool)

(assert (=> b!38425 m!31103))

(declare-fun m!31105 () Bool)

(assert (=> b!38425 m!31105))

(declare-fun m!31107 () Bool)

(assert (=> b!38426 m!31107))

(push 1)

(assert (not b!38428))

(assert (not b!38427))

(assert (not b!38426))

(assert (not start!5352))

(assert (not b!38425))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

