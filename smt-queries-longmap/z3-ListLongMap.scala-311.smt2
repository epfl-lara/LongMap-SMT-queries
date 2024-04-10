; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!5340 () Bool)

(assert start!5340)

(declare-fun b!38380 () Bool)

(declare-fun e!24391 () Bool)

(declare-fun e!24390 () Bool)

(assert (=> b!38380 (= e!24391 (not e!24390))))

(declare-fun res!23130 () Bool)

(assert (=> b!38380 (=> res!23130 e!24390)))

(declare-fun mask!853 () (_ BitVec 32))

(assert (=> b!38380 (= res!23130 (or (bvsge (bvadd #b00000000000000000000000000000001 mask!853) #b01111111111111111111111111111111) (bvsgt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853))))))

(declare-datatypes ((array!2545 0))(
  ( (array!2546 (arr!1216 (Array (_ BitVec 32) (_ BitVec 64))) (size!1323 (_ BitVec 32))) )
))
(declare-fun lt!14272 () array!2545)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2545 (_ BitVec 32)) Bool)

(assert (=> b!38380 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!14272 mask!853)))

(declare-datatypes ((Unit!937 0))(
  ( (Unit!938) )
))
(declare-fun lt!14273 () Unit!937)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2545 (_ BitVec 32) (_ BitVec 32)) Unit!937)

(assert (=> b!38380 (= lt!14273 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!14272 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2545 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!38380 (= (arrayCountValidKeys!0 lt!14272 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!14271 () Unit!937)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2545 (_ BitVec 32) (_ BitVec 32)) Unit!937)

(assert (=> b!38380 (= lt!14271 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!14272 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!38380 (= lt!14272 (array!2546 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun b!38382 () Bool)

(declare-fun res!23133 () Bool)

(assert (=> b!38382 (=> res!23133 e!24390)))

(declare-datatypes ((List!1032 0))(
  ( (Nil!1029) (Cons!1028 (h!1596 (_ BitVec 64)) (t!3865 List!1032)) )
))
(declare-fun contains!489 (List!1032 (_ BitVec 64)) Bool)

(assert (=> b!38382 (= res!23133 (contains!489 Nil!1029 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!23132 () Bool)

(assert (=> start!5340 (=> (not res!23132) (not e!24391))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!5340 (= res!23132 (validMask!0 mask!853))))

(assert (=> start!5340 e!24391))

(assert (=> start!5340 true))

(declare-fun b!38381 () Bool)

(declare-fun res!23131 () Bool)

(assert (=> b!38381 (=> res!23131 e!24390)))

(assert (=> b!38381 (= res!23131 (contains!489 Nil!1029 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!38383 () Bool)

(assert (=> b!38383 (= e!24390 true)))

(declare-fun lt!14270 () Bool)

(declare-fun noDuplicate!23 (List!1032) Bool)

(assert (=> b!38383 (= lt!14270 (noDuplicate!23 Nil!1029))))

(assert (= (and start!5340 res!23132) b!38380))

(assert (= (and b!38380 (not res!23130)) b!38381))

(assert (= (and b!38381 (not res!23131)) b!38382))

(assert (= (and b!38382 (not res!23133)) b!38383))

(declare-fun m!31025 () Bool)

(assert (=> start!5340 m!31025))

(declare-fun m!31027 () Bool)

(assert (=> b!38383 m!31027))

(declare-fun m!31029 () Bool)

(assert (=> b!38382 m!31029))

(declare-fun m!31031 () Bool)

(assert (=> b!38380 m!31031))

(declare-fun m!31033 () Bool)

(assert (=> b!38380 m!31033))

(declare-fun m!31035 () Bool)

(assert (=> b!38380 m!31035))

(declare-fun m!31037 () Bool)

(assert (=> b!38380 m!31037))

(declare-fun m!31039 () Bool)

(assert (=> b!38381 m!31039))

(check-sat (not b!38380) (not b!38381) (not b!38382) (not b!38383) (not start!5340))
(check-sat)
