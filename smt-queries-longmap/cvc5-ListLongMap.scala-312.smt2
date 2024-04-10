; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5344 () Bool)

(assert start!5344)

(declare-fun b!38404 () Bool)

(declare-fun e!24402 () Bool)

(declare-fun e!24403 () Bool)

(assert (=> b!38404 (= e!24402 (not e!24403))))

(declare-fun res!23157 () Bool)

(assert (=> b!38404 (=> res!23157 e!24403)))

(declare-fun mask!853 () (_ BitVec 32))

(assert (=> b!38404 (= res!23157 (or (bvsge (bvadd #b00000000000000000000000000000001 mask!853) #b01111111111111111111111111111111) (bvsgt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853))))))

(declare-datatypes ((array!2549 0))(
  ( (array!2550 (arr!1218 (Array (_ BitVec 32) (_ BitVec 64))) (size!1325 (_ BitVec 32))) )
))
(declare-fun lt!14294 () array!2549)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2549 (_ BitVec 32)) Bool)

(assert (=> b!38404 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!14294 mask!853)))

(declare-datatypes ((Unit!941 0))(
  ( (Unit!942) )
))
(declare-fun lt!14295 () Unit!941)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2549 (_ BitVec 32) (_ BitVec 32)) Unit!941)

(assert (=> b!38404 (= lt!14295 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!14294 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2549 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!38404 (= (arrayCountValidKeys!0 lt!14294 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!14297 () Unit!941)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2549 (_ BitVec 32) (_ BitVec 32)) Unit!941)

(assert (=> b!38404 (= lt!14297 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!14294 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!38404 (= lt!14294 (array!2550 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun b!38405 () Bool)

(declare-fun res!23154 () Bool)

(assert (=> b!38405 (=> res!23154 e!24403)))

(declare-datatypes ((List!1034 0))(
  ( (Nil!1031) (Cons!1030 (h!1598 (_ BitVec 64)) (t!3867 List!1034)) )
))
(declare-fun contains!491 (List!1034 (_ BitVec 64)) Bool)

(assert (=> b!38405 (= res!23154 (contains!491 Nil!1031 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!23155 () Bool)

(assert (=> start!5344 (=> (not res!23155) (not e!24402))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!5344 (= res!23155 (validMask!0 mask!853))))

(assert (=> start!5344 e!24402))

(assert (=> start!5344 true))

(declare-fun b!38406 () Bool)

(declare-fun res!23156 () Bool)

(assert (=> b!38406 (=> res!23156 e!24403)))

(assert (=> b!38406 (= res!23156 (contains!491 Nil!1031 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!38407 () Bool)

(assert (=> b!38407 (= e!24403 true)))

(declare-fun lt!14296 () Bool)

(declare-fun noDuplicate!25 (List!1034) Bool)

(assert (=> b!38407 (= lt!14296 (noDuplicate!25 Nil!1031))))

(assert (= (and start!5344 res!23155) b!38404))

(assert (= (and b!38404 (not res!23157)) b!38405))

(assert (= (and b!38405 (not res!23154)) b!38406))

(assert (= (and b!38406 (not res!23156)) b!38407))

(declare-fun m!31057 () Bool)

(assert (=> b!38406 m!31057))

(declare-fun m!31059 () Bool)

(assert (=> b!38407 m!31059))

(declare-fun m!31061 () Bool)

(assert (=> b!38404 m!31061))

(declare-fun m!31063 () Bool)

(assert (=> b!38404 m!31063))

(declare-fun m!31065 () Bool)

(assert (=> b!38404 m!31065))

(declare-fun m!31067 () Bool)

(assert (=> b!38404 m!31067))

(declare-fun m!31069 () Bool)

(assert (=> b!38405 m!31069))

(declare-fun m!31071 () Bool)

(assert (=> start!5344 m!31071))

(push 1)

(assert (not start!5344))

(assert (not b!38407))

(assert (not b!38404))

(assert (not b!38405))

(assert (not b!38406))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

