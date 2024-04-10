; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!5334 () Bool)

(assert start!5334)

(declare-fun res!23095 () Bool)

(declare-fun e!24373 () Bool)

(assert (=> start!5334 (=> (not res!23095) (not e!24373))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!5334 (= res!23095 (validMask!0 mask!853))))

(assert (=> start!5334 e!24373))

(assert (=> start!5334 true))

(declare-fun b!38345 () Bool)

(declare-fun res!23094 () Bool)

(declare-fun e!24372 () Bool)

(assert (=> b!38345 (=> res!23094 e!24372)))

(declare-datatypes ((List!1029 0))(
  ( (Nil!1026) (Cons!1025 (h!1593 (_ BitVec 64)) (t!3862 List!1029)) )
))
(declare-fun contains!486 (List!1029 (_ BitVec 64)) Bool)

(assert (=> b!38345 (= res!23094 (contains!486 Nil!1026 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!38346 () Bool)

(declare-fun res!23097 () Bool)

(assert (=> b!38346 (=> res!23097 e!24372)))

(assert (=> b!38346 (= res!23097 (contains!486 Nil!1026 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!38347 () Bool)

(assert (=> b!38347 (= e!24372 true)))

(declare-fun lt!14237 () Bool)

(declare-fun noDuplicate!20 (List!1029) Bool)

(assert (=> b!38347 (= lt!14237 (noDuplicate!20 Nil!1026))))

(declare-fun b!38344 () Bool)

(assert (=> b!38344 (= e!24373 (not e!24372))))

(declare-fun res!23096 () Bool)

(assert (=> b!38344 (=> res!23096 e!24372)))

(assert (=> b!38344 (= res!23096 (or (bvsge (bvadd #b00000000000000000000000000000001 mask!853) #b01111111111111111111111111111111) (bvsgt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853))))))

(declare-datatypes ((array!2539 0))(
  ( (array!2540 (arr!1213 (Array (_ BitVec 32) (_ BitVec 64))) (size!1320 (_ BitVec 32))) )
))
(declare-fun lt!14236 () array!2539)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2539 (_ BitVec 32)) Bool)

(assert (=> b!38344 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!14236 mask!853)))

(declare-datatypes ((Unit!931 0))(
  ( (Unit!932) )
))
(declare-fun lt!14235 () Unit!931)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2539 (_ BitVec 32) (_ BitVec 32)) Unit!931)

(assert (=> b!38344 (= lt!14235 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!14236 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2539 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!38344 (= (arrayCountValidKeys!0 lt!14236 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!14234 () Unit!931)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2539 (_ BitVec 32) (_ BitVec 32)) Unit!931)

(assert (=> b!38344 (= lt!14234 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!14236 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!38344 (= lt!14236 (array!2540 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (= (and start!5334 res!23095) b!38344))

(assert (= (and b!38344 (not res!23096)) b!38345))

(assert (= (and b!38345 (not res!23094)) b!38346))

(assert (= (and b!38346 (not res!23097)) b!38347))

(declare-fun m!30977 () Bool)

(assert (=> b!38345 m!30977))

(declare-fun m!30979 () Bool)

(assert (=> b!38346 m!30979))

(declare-fun m!30981 () Bool)

(assert (=> b!38344 m!30981))

(declare-fun m!30983 () Bool)

(assert (=> b!38344 m!30983))

(declare-fun m!30985 () Bool)

(assert (=> b!38344 m!30985))

(declare-fun m!30987 () Bool)

(assert (=> b!38344 m!30987))

(declare-fun m!30989 () Bool)

(assert (=> b!38347 m!30989))

(declare-fun m!30991 () Bool)

(assert (=> start!5334 m!30991))

(check-sat (not b!38347) (not b!38344) (not start!5334) (not b!38345) (not b!38346))
(check-sat)
